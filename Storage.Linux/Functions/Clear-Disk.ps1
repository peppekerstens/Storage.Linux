function Clear-Disk {
    <#
    .SYNOPSIS
        Clears a disk by wiping filesystem signatures. On Linux, uses 'wipefs -a'.
    .DESCRIPTION
        Removes all filesystem signatures from the disk using wipefs.
        Requires sudo privileges.

        WARNING: This is a destructive operation. All data on the disk will be lost.
    .PARAMETER Number
        The disk number (maps to /dev/sdX or /dev/nvmeXnY based on lsblk output).
    .PARAMETER Path
        The device path (e.g. /dev/sdb). Alternative to -Number.
    .PARAMETER RemoveData
        When specified with -ZeroOutEntireDisk, zeroes the entire disk with dd.
        Without this switch, only signatures are removed.
    .PARAMETER ZeroOutEntireDisk
        When specified, zeroes the entire disk with dd (requires -RemoveData).
    .LINK
        https://learn.microsoft.com/powershell/module/storage/clear-disk
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High', DefaultParameterSetName = 'Number')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Number')]
        [int]$Number,

        [Parameter(Mandatory = $true, ParameterSetName = 'Path')]
        [string]$Path,

        [Parameter()]
        [switch]$RemoveData,

        [Parameter()]
        [switch]$ZeroOutEntireDisk
    )
    process {
        if ($IsLinux) {
            # Resolve device path
            $devicePath = if ($PSCmdlet.ParameterSetName -eq 'Path') {
                $Path
            } else {
                $lsblkRaw = & lsblk -J -o NAME,TYPE 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Clear-Disk: lsblk failed: $lsblkRaw"
                    return
                }
                $disks = ($lsblkRaw | ConvertFrom-Json).blockdevices | Where-Object { $_.type -eq 'disk' }
                $disk  = $disks | Select-Object -Index $Number
                if (-not $disk) {
                    Write-Error "Clear-Disk: disk number $Number not found."
                    return
                }
                "/dev/$($disk.name)"
            }

            if ($PSCmdlet.ShouldProcess($devicePath, 'Clear disk (wipefs)')) {
                $result = & sudo wipefs -a $devicePath 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Clear-Disk: wipefs failed: $result"
                    return
                }
                if ($ZeroOutEntireDisk -and $RemoveData) {
                    Write-Warning "Clear-Disk: Zeroing $devicePath with dd — this may take a long time."
                    & sudo dd if=/dev/zero of=$devicePath bs=4M status=progress 2>&1
                }
            }
        } else {
            Storage\Clear-Disk @PSBoundParameters
        }
    }
}
