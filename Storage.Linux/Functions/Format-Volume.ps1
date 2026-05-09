function Format-Volume {
    <#
    .SYNOPSIS
        Formats a volume (partition) with a specified file system. On Linux, uses mkfs.
    .DESCRIPTION
        Runs the appropriate mkfs variant for the requested file system type.
        Requires sudo privileges.

        WARNING: This operation destroys all data on the target partition.
    .PARAMETER DriveLetter
        Not supported on Linux. Emits a warning if specified.
    .PARAMETER Path
        The device path to format (e.g. /dev/sdb1).
    .PARAMETER FileSystem
        The file system to create: NTFS, ReFS, exFAT, FAT32, FAT, ext4, xfs, btrfs.
        Defaults to ext4 on Linux.
    .PARAMETER NewFileSystemLabel
        Volume label to assign.
    .PARAMETER AllocationUnitSize
        Block size in bytes. Passed to mkfs if supported.
    .PARAMETER Full
        Not supported on Linux. Emits a warning.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/format-volume
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High', DefaultParameterSetName = 'Path')]
    param(
        [Parameter(ParameterSetName = 'DriveLetter')]
        [char]$DriveLetter,

        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'Path')]
        [string]$Path,

        [Parameter()]
        [ValidateSet('NTFS', 'ReFS', 'exFAT', 'FAT32', 'FAT', 'ext4', 'xfs', 'btrfs')]
        [string]$FileSystem = 'ext4',

        [Parameter()]
        [string]$NewFileSystemLabel,

        [Parameter()]
        [int]$AllocationUnitSize,

        [Parameter()]
        [switch]$Full
    )
    process {
        if ($IsLinux) {
            if ($DriveLetter) {
                Write-Warning 'Format-Volume: -DriveLetter is not supported on Linux.'
                return
            }
            if ($Full) {
                Write-Warning 'Format-Volume: -Full is not supported on Linux.'
            }

            $unsupported = @('NTFS', 'ReFS')
            if ($FileSystem -in $unsupported) {
                Write-Warning "Format-Volume: $FileSystem is not natively supported on Linux. Install ntfs-3g for NTFS."
            }

            # Build mkfs command
            $mkfsCmd = switch ($FileSystem) {
                'ext4'  { 'mkfs.ext4' }
                'xfs'   { 'mkfs.xfs' }
                'btrfs' { 'mkfs.btrfs' }
                'FAT32' { 'mkfs.fat -F 32' }
                'FAT'   { 'mkfs.fat' }
                'exFAT' { 'mkfs.exfat' }
                'NTFS'  { 'mkfs.ntfs' }
                default { 'mkfs.ext4' }
            }

            if ($PSCmdlet.ShouldProcess($Path, "Format with $FileSystem ($mkfsCmd)")) {
                $mkfsArgs = @()
                if ($NewFileSystemLabel) { $mkfsArgs += @('-L', $NewFileSystemLabel) }
                if ($AllocationUnitSize -and $FileSystem -in @('ext4', 'xfs')) {
                    $mkfsArgs += @('-b', $AllocationUnitSize)
                }
                $cmdParts = $mkfsCmd -split ' '
                $result = & sudo @cmdParts @mkfsArgs $Path 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Format-Volume: mkfs failed: $result"
                }
            }
        } else {
            Storage\Format-Volume @PSBoundParameters
        }
    }
}
