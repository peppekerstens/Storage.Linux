function Get-Disk {
    <#
    .Synopsis
        Gets one or more disks visible to the operating system.
    .Description
        Cross-platform implementation of Get-Disk.
        On Windows, delegates to the built-in Storage\Get-Disk cmdlet.
        On Linux, wraps lsblk to return disk-type block devices with properties
        matching the Windows MSFT_Disk object shape as closely as possible.
    .Parameter Number
        The disk number(s) to retrieve (0-based index of disks returned by lsblk).
    .Parameter FriendlyName
        Filter by model/friendly name (wildcard supported).
    .Parameter SerialNumber
        Filter by serial number (wildcard supported).
    .Notes
        Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
        Author: Peppe Kerstens (NLD)
        Version: 1.0.0
        Date: 2025-07-17
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-disk
    #>
    [CmdletBinding(DefaultParameterSetName='ByNumber')]
    param(
        [Parameter(ParameterSetName='ByNumber', Position=0, ValueFromPipelineByPropertyName=$true)]
        [Alias('DeviceId')]
        [uint[]]$Number,

        [Parameter(ParameterSetName='ByName')]
        [string[]]$FriendlyName,

        [Parameter(ParameterSetName='ByName')]
        [string[]]$SerialNumber
    )

    if (-not $IsLinux) {
        # Delegate to Windows built-in
        $params = @{}
        if ($PSBoundParameters.ContainsKey('Number'))       { $params['Number']       = $Number }
        if ($PSBoundParameters.ContainsKey('FriendlyName')) { $params['FriendlyName'] = $FriendlyName }
        if ($PSBoundParameters.ContainsKey('SerialNumber')) { $params['SerialNumber'] = $SerialNumber }
        Storage\Get-Disk @params
        return
    }

    if (-not (Get-Command lsblk -ErrorAction SilentlyContinue)) {
        throw "Get-Disk: 'lsblk' not found. Install util-linux: sudo apt-get install util-linux"
    }

    $json = lsblk --json --output NAME,SIZE,TYPE,MOUNTPOINT,MODEL,SERIAL,ROTA,RM,STATE,TRAN,VENDOR,PTTYPE,LOG-SEC,PHY-SEC 2>$null
    if (-not $json) { return }

    $disks = ($json | ConvertFrom-Json).blockdevices | Where-Object { $_.type -eq 'disk' }

    $index = 0
    $results = foreach ($d in $disks) {
        [PSCustomObject]@{
            Number          = [uint32]$index
            FriendlyName    = if ($d.model) { $d.model.Trim() } else { $d.name }
            SerialNumber    = if ($d.serial) { $d.serial.Trim() } else { '' }
            Size            = $d.size
            BusType         = if ($d.tran)  { $d.tran.ToUpper() } else { 'Unknown' }
            MediaType       = if ($d.rota -eq '1' -or $d.rota -eq $true) { 'HDD' } else { 'SSD' }
            IsRemovable     = ($d.rm -eq '1' -or $d.rm -eq $true)
            OperationalStatus = if ($d.state) { $d.state } else { 'OK' }
            PartitionStyle  = if ($d.pttype) { $d.pttype.ToUpper() } else { 'Unknown' }
            LogicalSectorSize  = if ($d.'log-sec') { [uint32]$d.'log-sec' } else { 512 }
            PhysicalSectorSize = if ($d.'phy-sec') { [uint32]$d.'phy-sec' } else { 512 }
            Path            = "/dev/$($d.name)"
            UniqueId        = if ($d.serial) { $d.serial.Trim() } else { $d.name }
        }
        $index++
    }

    # Apply filters
    if ($PSCmdlet.ParameterSetName -eq 'ByNumber' -and $PSBoundParameters.ContainsKey('Number')) {
        $results = $results | Where-Object { $_.Number -in $Number }
    }
    if ($PSCmdlet.ParameterSetName -eq 'ByName') {
        if ($PSBoundParameters.ContainsKey('FriendlyName')) {
            $results = $results | Where-Object { $fn = $_.FriendlyName; $FriendlyName | Where-Object { $fn -like $_ } }
        }
        if ($PSBoundParameters.ContainsKey('SerialNumber')) {
            $results = $results | Where-Object { $sn = $_.SerialNumber; $SerialNumber | Where-Object { $sn -like $_ } }
        }
    }

    $results
}
