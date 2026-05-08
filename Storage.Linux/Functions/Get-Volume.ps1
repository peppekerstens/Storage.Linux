function Get-Volume {
    <#
    .Synopsis
        Gets the specified volume object, or all Volume objects if no filter is provided.
    .Description
        Cross-platform implementation of Get-Volume.
        On Windows, delegates to the built-in Storage\Get-Volume cmdlet.
        On Linux, combines lsblk (filesystem/UUID info) and df (size/usage) to return
        mounted filesystem volumes with properties matching the Windows MSFT_Volume shape.
    .Parameter DriveLetter
        Not applicable on Linux; accepted for cross-platform script compatibility.
    .Parameter FileSystemLabel
        Filter by filesystem label (wildcard supported).
    .Parameter Path
        Filter by mount point path (wildcard supported).
    .Notes
        Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
        Author: Peppe Kerstens (NLD)
        Version: 1.0.0
        Date: 2025-07-17
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-volume
    #>
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(ParameterSetName='ByDriveLetter', Position=0)]
        [char[]]$DriveLetter,

        [Parameter(ParameterSetName='ByLabel')]
        [string[]]$FileSystemLabel,

        [Parameter(ParameterSetName='ByPath')]
        [string[]]$Path
    )

    if (-not $IsLinux) {
        $params = @{}
        if ($PSBoundParameters.ContainsKey('DriveLetter'))    { $params['DriveLetter']    = $DriveLetter }
        if ($PSBoundParameters.ContainsKey('FileSystemLabel')) { $params['FileSystemLabel'] = $FileSystemLabel }
        if ($PSBoundParameters.ContainsKey('Path'))           { $params['Path']           = $Path }
        Storage\Get-Volume @params
        return
    }

    if (-not (Get-Command lsblk -ErrorAction SilentlyContinue)) {
        throw "Get-Volume: 'lsblk' not found. Install util-linux: sudo apt-get install util-linux"
    }
    if (-not (Get-Command df -ErrorAction SilentlyContinue)) {
        throw "Get-Volume: 'df' not found."
    }

    # Get filesystem info from lsblk (--bytes ensures SIZE is always a numeric integer)
    $json = lsblk --json --bytes --output NAME,FSTYPE,LABEL,UUID,MOUNTPOINT,SIZE,TYPE 2>$null
    if (-not $json) { return }

    # Flatten all devices (including children/partitions)
    function Expand-LsBlkDevices($devices) {
        foreach ($d in $devices) {
            $d
            if ($d.children) { Expand-LsBlkDevices $d.children }
        }
    }
    $allDevices = Expand-LsBlkDevices (($json | ConvertFrom-Json).blockdevices)

    # Get df output for size/usage (bytes)
    $dfLines = df --block-size=1 --output=target,size,used,avail,fstype 2>$null | Select-Object -Skip 1

    # Build a lookup: mountpoint -> df data
    $dfMap = @{}
    foreach ($line in $dfLines) {
        $cols = $line -split '\s+' | Where-Object { $_ -ne '' }
        if ($cols.Count -ge 5) {
            $dfMap[$cols[0]] = @{
                SizeBytes  = [uint64]$cols[1]
                UsedBytes  = [uint64]$cols[2]
                FreeBytes  = [uint64]$cols[3]
                FileSystem = $cols[4]
            }
        }
    }

    $results = foreach ($d in $allDevices) {
        # Only include devices with a real mountpoint and a filesystem (skip [SWAP] etc.)
        if (-not $d.mountpoint -or -not $d.fstype) { continue }
        if ($d.mountpoint -notmatch '^/') { continue }

        $df = $dfMap[$d.mountpoint]
        [PSCustomObject]@{
            DriveLetter       = $null   # not applicable on Linux
            FileSystemLabel   = if ($d.label) { $d.label } else { '' }
            FileSystem        = if ($d.fstype) { $d.fstype } else { if ($df) { $df.FileSystem } else { '' } }
            Path              = $d.mountpoint
            UniqueId          = if ($d.uuid) { $d.uuid } else { $d.name }
            Size              = if ($df) { $df.SizeBytes  } else { try { [uint64]$d.size } catch { 0 } }
            SizeRemaining     = if ($df) { $df.FreeBytes  } else { 0 }
            AllocationUnitSize = 4096   # default; not exposed by lsblk/df
            HealthStatus      = 'Healthy'
            DriveType         = 'Fixed'
            ObjectId          = $d.name
        }
    }

    # Apply filters
    if ($PSCmdlet.ParameterSetName -eq 'ByLabel' -and $PSBoundParameters.ContainsKey('FileSystemLabel')) {
        $results = $results | Where-Object { $lbl = $_.FileSystemLabel; $FileSystemLabel | Where-Object { $lbl -like $_ } }
    }
    if ($PSCmdlet.ParameterSetName -eq 'ByPath' -and $PSBoundParameters.ContainsKey('Path')) {
        $results = $results | Where-Object { $p = $_.Path; $Path | Where-Object { $p -like $_ } }
    }

    $results
}
