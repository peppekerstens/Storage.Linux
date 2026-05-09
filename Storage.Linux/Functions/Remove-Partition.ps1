function Remove-Partition {
    <#
    .SYNOPSIS
        Removes a partition from a disk. On Linux, uses 'sfdisk --delete'.
    .DESCRIPTION
        Requires sudo privileges.
        WARNING: All data on the partition will be lost.
    .PARAMETER DiskNumber
        The disk number.
    .PARAMETER PartitionNumber
        The partition number to remove.
    .PARAMETER DiskPath
        The device path (e.g. /dev/sdb). Used with -PartitionNumber.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/remove-partition
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High', DefaultParameterSetName = 'DiskNumber')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'DiskNumber')]
        [int]$DiskNumber,

        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'DiskPath')]
        [string]$DiskPath,

        [Parameter(Mandatory = $true, Position = 1)]
        [int]$PartitionNumber
    )
    process {
        if ($IsLinux) {
            $devicePath = if ($PSCmdlet.ParameterSetName -eq 'DiskPath') {
                $DiskPath
            } else {
                $lsblkRaw = & lsblk -J -o NAME,TYPE 2>&1
                $disks = ($lsblkRaw | ConvertFrom-Json).blockdevices | Where-Object { $_.type -eq 'disk' }
                $disk  = $disks | Select-Object -Index $DiskNumber
                if (-not $disk) {
                    Write-Error "Remove-Partition: disk number $DiskNumber not found."
                    return
                }
                "/dev/$($disk.name)"
            }

            if ($PSCmdlet.ShouldProcess("$devicePath partition $PartitionNumber", 'Delete partition')) {
                $result = & sudo sfdisk --delete $devicePath $PartitionNumber 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Remove-Partition: sfdisk --delete failed: $result"
                }
            }
        } else {
            Storage\Remove-Partition @PSBoundParameters
        }
    }
}
