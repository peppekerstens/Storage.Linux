<#
.Synopsis
    Disk layout — shows each disk and its partitions in a hierarchical report.
.Description
    Iterates over all disks, then retrieves the partitions for each disk,
    producing a structured report of disk → partition relationships including
    filesystem type, mount point, and size.
    Works identically on Windows (via Storage module) and Linux (via Storage.Linux).
.Example
    .\Get-DiskLayout.ps1
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Requires: Storage.Linux (Linux) or Storage (Windows)
#>

#Requires -Modules Storage.Linux

Get-Disk | ForEach-Object {
    $disk = $_
    Write-Host ""
    Write-Host "Disk $($disk.Number): $($disk.FriendlyName)  [$($disk.BusType) / $($disk.MediaType) / $([math]::Round($disk.Size / 1GB, 2)) GB]" -ForegroundColor Cyan

    $partitions = Get-Partition -DiskNumber $disk.Number
    if (-not $partitions) {
        Write-Host "  (no partitions)" -ForegroundColor DarkGray
        return
    }

    $partitions | Select-Object -Property `
        PartitionNumber,
        @{ Name = 'Path';       Expression = { $_.Path } },
        @{ Name = 'MountPoint'; Expression = { $_.MountPoint } },
        FileSystem,
        @{ Name = 'SizeGB';    Expression = { [math]::Round([double]($_.Size -replace '[^0-9.]') / 1GB, 2) } },
        Type |
        Format-Table -AutoSize
}
