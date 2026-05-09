function Resize-Partition {
    <#
    .SYNOPSIS
        Resizes a partition. On Linux, uses 'sfdisk' and 'resize2fs'/'xfs_growfs'.
    .DESCRIPTION
        Resizes a partition's on-disk entry using sfdisk, then optionally grows the
        filesystem (ext4 via resize2fs, xfs via xfs_growfs).
        Requires sudo privileges. Shrinking is only supported for ext4.
        WARNING: Always back up data before resizing.
    .PARAMETER DiskNumber
        The disk number.
    .PARAMETER PartitionNumber
        The partition number to resize.
    .PARAMETER Size
        New size in bytes. If omitted or -UseMaximumSize, grows to fill available space.
    .PARAMETER UseMaximumSize
        Resize partition to use all available space on the disk.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/resize-partition
    #>
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [int]$DiskNumber,

        [Parameter(Mandatory = $true, Position = 1)]
        [int]$PartitionNumber,

        [Parameter()]
        [uint64]$Size,

        [Parameter()]
        [switch]$UseMaximumSize
    )
    process {
        if ($IsLinux) {
            $lsblkRaw = & lsblk -J -o NAME,TYPE 2>&1
            $disks = ($lsblkRaw | ConvertFrom-Json).blockdevices | Where-Object { $_.type -eq 'disk' }
            $disk  = $disks | Select-Object -Index $DiskNumber
            if (-not $disk) {
                Write-Error "Resize-Partition: disk number $DiskNumber not found."
                return
            }
            $devicePath = "/dev/$($disk.name)"
            $partPath   = "/dev/$($disk.name)$PartitionNumber"

            if ($PSCmdlet.ShouldProcess($partPath, 'Resize partition')) {
                $partNumStr = $PartitionNumber.ToString()
                if ($UseMaximumSize -or -not $Size) {
                    # Grow to fill remaining space
                    $sfdiskIn = $partNumStr + ': ,'
                    $result = $sfdiskIn | & sudo sfdisk --no-reread -N $PartitionNumber $devicePath 2>&1
                } else {
                    $sizeK = [math]::Floor($Size / 1024)
                    $sizeSpec = $sizeK.ToString() + 'K'
                    $sfdiskIn = $partNumStr + ': ,' + $sizeSpec
                    $result = $sfdiskIn | & sudo sfdisk --no-reread -N $PartitionNumber $devicePath 2>&1
                }
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Resize-Partition: sfdisk failed: $result"
                    return
                }
                # Attempt to grow the filesystem
                $fsType = & lsblk -no FSTYPE $partPath 2>/dev/null
                switch ($fsType.Trim()) {
                    'ext4'  { & sudo resize2fs $partPath 2>&1 | Out-Null }
                    'xfs'   { & sudo xfs_growfs $partPath 2>&1 | Out-Null }
                    default { Write-Warning "Resize-Partition: filesystem '$fsType' resize not automated. Run appropriate resize tool manually." }
                }
            }
        } else {
            Storage\Resize-Partition @PSBoundParameters
        }
    }
}
