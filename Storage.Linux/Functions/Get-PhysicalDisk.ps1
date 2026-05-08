function Get-PhysicalDisk {
    <#
    .Synopsis
        Gets a list of all PhysicalDisk objects visible to any available Storage Management Provider.
    .Description
        Cross-platform implementation of Get-PhysicalDisk.
        On Windows, delegates to the built-in Storage\Get-PhysicalDisk cmdlet.
        On Linux, wraps lsblk to return all disk-type and loop-type block devices
        with properties matching the Windows MSFT_PhysicalDisk object shape.
    .Parameter FriendlyName
        Filter by model/friendly name (wildcard supported).
    .Parameter SerialNumber
        Filter by serial number (wildcard supported).
    .Parameter MediaType
        Filter by media type: HDD, SSD, or Unspecified.
    .Notes
        Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
        Author: Peppe Kerstens (NLD)
        Version: 1.0.0
        Date: 2025-07-17
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-physicaldisk
    #>
    [CmdletBinding(DefaultParameterSetName='Default')]
    param(
        [Parameter(ParameterSetName='ByName', Position=0)]
        [string[]]$FriendlyName,

        [Parameter(ParameterSetName='BySerial')]
        [string[]]$SerialNumber,

        [Parameter()]
        [ValidateSet('HDD','SSD','Unspecified')]
        [string]$MediaType
    )

    if (-not $IsLinux) {
        $params = @{}
        if ($PSBoundParameters.ContainsKey('FriendlyName')) { $params['FriendlyName'] = $FriendlyName }
        if ($PSBoundParameters.ContainsKey('SerialNumber')) { $params['SerialNumber'] = $SerialNumber }
        if ($PSBoundParameters.ContainsKey('MediaType'))    { $params['MediaType']    = $MediaType }
        Storage\Get-PhysicalDisk @params
        return
    }

    if (-not (Get-Command lsblk -ErrorAction SilentlyContinue)) {
        throw "Get-PhysicalDisk: 'lsblk' not found. Install util-linux: sudo apt-get install util-linux"
    }

    $json = lsblk --json --output NAME,SIZE,TYPE,MODEL,SERIAL,ROTA,RM,STATE,TRAN,VENDOR,LOG-SEC,PHY-SEC 2>$null
    if (-not $json) { return }

    $devices = ($json | ConvertFrom-Json).blockdevices | Where-Object { $_.type -in 'disk','loop' }

    $index = 0
    $results = foreach ($d in $devices) {
        $media = if ($d.type -eq 'loop') {
            'Unspecified'
        } elseif ($d.rota -eq '1' -or $d.rota -eq $true) {
            'HDD'
        } else {
            'SSD'
        }

        [PSCustomObject]@{
            FriendlyName       = if ($d.model)  { $d.model.Trim()  } else { $d.name }
            SerialNumber       = if ($d.serial) { $d.serial.Trim() } else { '' }
            MediaType          = $media
            BusType            = if ($d.tran)  { $d.tran.ToUpper() } else { 'Unknown' }
            Size               = $d.size
            IsRemovable        = ($d.rm -eq '1' -or $d.rm -eq $true)
            OperationalStatus  = if ($d.state) { $d.state } else { 'OK' }
            DeviceId           = [uint32]$index
            UniqueId           = if ($d.serial) { $d.serial.Trim() } else { $d.name }
            Path               = "/dev/$($d.name)"
            LogicalSectorSize  = if ($d.'log-sec') { [uint32]$d.'log-sec' } else { 512 }
            PhysicalSectorSize = if ($d.'phy-sec') { [uint32]$d.'phy-sec' } else { 512 }
        }
        $index++
    }

    # Apply filters
    if ($PSBoundParameters.ContainsKey('FriendlyName')) {
        $results = $results | Where-Object { $fn = $_.FriendlyName; $FriendlyName | Where-Object { $fn -like $_ } }
    }
    if ($PSBoundParameters.ContainsKey('SerialNumber')) {
        $results = $results | Where-Object { $sn = $_.SerialNumber; $SerialNumber | Where-Object { $sn -like $_ } }
    }
    if ($PSBoundParameters.ContainsKey('MediaType')) {
        $results = $results | Where-Object { $_.MediaType -eq $MediaType }
    }

    $results
}
