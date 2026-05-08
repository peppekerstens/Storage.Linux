function Get-Partition {
    <#
    .Synopsis
        Returns a list of all partition objects visible on all disks, or optionally a filtered list.
    .Description
        Cross-platform implementation of Get-Partition.
        On Windows, delegates to the built-in Storage\Get-Partition cmdlet.
        On Linux, wraps lsblk to return partition-type block devices with properties
        matching the Windows MSFT_Partition object shape as closely as possible.
    .Parameter DiskNumber
        Returns partitions on the specified disk number(s).
    .Parameter DriveLetter
        Filter by drive letter (not applicable on Linux; accepted for compatibility).
    .Notes
        Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
        Author: Peppe Kerstens (NLD)
        Version: 1.0.0
        Date: 2025-07-17
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-partition
    #>
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(ParameterSetName='ByDiskNumber', Position=0, ValueFromPipelineByPropertyName=$true)]
        [uint32[]]$DiskNumber,

        [Parameter(ParameterSetName='ByDriveLetter')]
        [char[]]$DriveLetter
    )

    if (-not $IsLinux) {
        $params = @{}
        if ($PSBoundParameters.ContainsKey('DiskNumber'))  { $params['DiskNumber']  = $DiskNumber }
        if ($PSBoundParameters.ContainsKey('DriveLetter')) { $params['DriveLetter'] = $DriveLetter }
        Storage\Get-Partition @params
        return
    }

    if (-not (Get-Command lsblk -ErrorAction SilentlyContinue)) {
        throw "Get-Partition: 'lsblk' not found. Install util-linux: sudo apt-get install util-linux"
    }

    $json = lsblk --json --output NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,UUID,PARTUUID,PARTTYPE,LABEL,RM,RO 2>$null
    if (-not $json) { return }

    $allDevices = ($json | ConvertFrom-Json).blockdevices

    # Build a flat list of all partitions with their parent disk number
    $diskIndex = 0
    $results = foreach ($disk in $allDevices) {
        if ($disk.type -ne 'disk') { $diskIndex++; continue }

        if ($disk.children) {
            $partIndex = 0
            foreach ($part in $disk.children) {
                if ($part.type -notin 'part','lvm','md','crypt') { $partIndex++; continue }

                [PSCustomObject]@{
                    DiskNumber       = [uint32]$diskIndex
                    PartitionNumber  = [uint32]$partIndex
                    DriveLetter      = $null   # not applicable on Linux
                    IsReadOnly       = ($part.ro -eq '1' -or $part.ro -eq $true)
                    IsRemovable      = ($part.rm -eq '1' -or $part.rm -eq $true)
                    Size             = $part.size
                    Type             = if ($part.parttype) { $part.parttype } else { $part.type }
                    FileSystem       = if ($part.fstype)   { $part.fstype }   else { '' }
                    MountPoint       = if ($part.mountpoint) { $part.mountpoint } else { '' }
                    UniqueId         = if ($part.partuuid) { $part.partuuid } elseif ($part.uuid) { $part.uuid } else { $part.name }
                    Guid             = if ($part.partuuid) { $part.partuuid } else { '' }
                    Label            = if ($part.label)    { $part.label }    else { '' }
                    Path             = "/dev/$($part.name)"
                }
                $partIndex++
            }
        }
        $diskIndex++
    }

    # Apply filters
    if ($PSCmdlet.ParameterSetName -eq 'ByDiskNumber' -and $PSBoundParameters.ContainsKey('DiskNumber')) {
        $results = $results | Where-Object { $_.DiskNumber -in $DiskNumber }
    }

    $results
}
