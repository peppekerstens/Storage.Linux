function New-Partition {
    <#
    .SYNOPSIS
        Creates a new partition on a disk. On Linux, uses 'sfdisk'.
    .DESCRIPTION
        Appends a new partition to the disk using sfdisk's append mode.
        Requires sudo privileges.

        WARNING: This operation modifies the partition table.
    .PARAMETER DiskNumber
        The disk number as returned by Get-Disk.
    .PARAMETER DiskPath
        The device path (e.g. /dev/sdb). Alternative to -DiskNumber.
    .PARAMETER Size
        Size of the new partition in bytes. If omitted, uses all available space.
    .PARAMETER IsActive
        Not supported on Linux. Emits a warning.
    .PARAMETER DriveLetter
        Not supported on Linux. Emits a warning.
    .PARAMETER AssignDriveLetter
        Not supported on Linux. Emits a warning.
    .PARAMETER UseMaximumSize
        When specified, creates a partition using all remaining space.
    .PARAMETER PartitionStyle
        Not supported on Linux - partition style is determined by the disk label type.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/new-partition
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High', DefaultParameterSetName = 'DiskNumber')]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'DiskNumber')]
        [int]$DiskNumber,

        [Parameter(Mandatory = $true, ParameterSetName = 'DiskPath')]
        [string]$DiskPath,

        [Parameter()]
        [uint64]$Size,

        [Parameter()]
        [switch]$UseMaximumSize,

        [Parameter()]
        [switch]$IsActive,

        [Parameter()]
        [char]$DriveLetter,

        [Parameter()]
        [switch]$AssignDriveLetter,

        [Parameter()]
        [ValidateSet('GPT', 'MBR')]
        [string]$PartitionStyle
    )
    process {
        if ($IsLinux) {
            foreach ($unsupportedParam in @('IsActive', 'DriveLetter', 'AssignDriveLetter', 'PartitionStyle')) {
                if ($PSBoundParameters.ContainsKey($unsupportedParam)) {
                    Write-Warning "New-Partition: -$unsupportedParam is not supported on Linux."
                }
            }

            $devicePath = if ($PSCmdlet.ParameterSetName -eq 'DiskPath') {
                $DiskPath
            } else {
                $lsblkRaw = & lsblk -J -o NAME,TYPE 2>&1
                $disks = ($lsblkRaw | ConvertFrom-Json).blockdevices | Where-Object { $_.type -eq 'disk' }
                $disk  = $disks | Select-Object -Index $DiskNumber
                if (-not $disk) {
                    Write-Error "New-Partition: disk number $DiskNumber not found."
                    return
                }
                "/dev/$($disk.name)"
            }

            $sizeSpec = if ($UseMaximumSize -or -not $Size) { '' } else { ",size=$([math]::Floor($Size / 1024))K" }
            $sfdiskInput = ",,Linux$sizeSpec"

            if ($PSCmdlet.ShouldProcess($devicePath, 'Create new partition')) {
                $result = $sfdiskInput | & sudo sfdisk --append $devicePath 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "New-Partition: sfdisk failed: $result"
                    return
                }
                # Return a minimal partition object
                $partRaw = & lsblk -J -o NAME,SIZE,TYPE $devicePath 2>&1
                $parts = ($partRaw | ConvertFrom-Json).blockdevices[0].children
                $newPart = $parts | Select-Object -Last 1
                [PSCustomObject]@{
                    DiskNumber      = $DiskNumber
                    PartitionNumber = if ($parts) { $parts.Count } else { 1 }
                    DevicePath      = "/dev/$($newPart.name)"
                    Size            = $newPart.size
                    Type            = 'Basic'
                }
            }
        } else {
            Storage\New-Partition @PSBoundParameters
        }
    }
}
