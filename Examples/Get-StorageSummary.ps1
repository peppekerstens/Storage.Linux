<#
.Synopsis
    Storage summary report — combined capacity and usage across all cmdlets.
.Description
    Produces a single-page summary report that combines data from Get-Disk,
    Get-PhysicalDisk, and Get-Volume to give an at-a-glance picture of the
    system's storage: total raw capacity, number of disks by type, and
    per-volume usage with free-space percentage.
    Works identically on Windows (via Storage module) and Linux (via Storage.Linux).
.Example
    .\Get-StorageSummary.ps1
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Requires: Storage.Linux (Linux) or Storage (Windows)
#>

#Requires -Modules Storage.Linux

# --- Disk summary ---
$disks = Get-Disk
$physDisks = Get-PhysicalDisk

$totalRawGB = [math]::Round(($disks | Measure-Object -Property Size -Sum).Sum / 1GB, 2)
$ssdCount   = ($physDisks | Where-Object MediaType -eq 'SSD').Count
$hddCount   = ($physDisks | Where-Object MediaType -eq 'HDD').Count
$otherCount = ($physDisks | Where-Object MediaType -eq 'Unspecified').Count

Write-Host ""
Write-Host "=== Storage Summary ===" -ForegroundColor Cyan
Write-Host "  Total disks      : $($disks.Count)"
Write-Host "  SSD              : $ssdCount"
Write-Host "  HDD              : $hddCount"
Write-Host "  Other/Loop       : $otherCount"
Write-Host "  Total raw cap.   : $totalRawGB GB"

# --- Volume usage ---
$volumes = Get-Volume | Where-Object { $_.Size -gt 0 }
$totalVolGB  = [math]::Round(($volumes | Measure-Object -Property Size          -Sum).Sum / 1GB, 2)
$totalFreeGB = [math]::Round(($volumes | Measure-Object -Property SizeRemaining -Sum).Sum / 1GB, 2)
$totalUsedGB = [math]::Round($totalVolGB - $totalFreeGB, 2)

Write-Host ""
Write-Host "=== Volume Usage ===" -ForegroundColor Cyan
Write-Host "  Volumes          : $($volumes.Count)"
Write-Host "  Total size       : $totalVolGB GB"
Write-Host "  Used             : $totalUsedGB GB"
Write-Host "  Free             : $totalFreeGB GB"
Write-Host ""

$volumes |
    Select-Object -Property `
        @{ Name = 'Path';        Expression = { if ($_.DriveLetter) { "$($_.DriveLetter):" } else { $_.Path } } },
        FileSystemLabel,
        FileSystem,
        @{ Name = 'SizeGB';      Expression = { [math]::Round($_.Size / 1GB, 2) } },
        @{ Name = 'UsedGB';      Expression = { [math]::Round(($_.Size - $_.SizeRemaining) / 1GB, 2) } },
        @{ Name = 'FreeGB';      Expression = { [math]::Round($_.SizeRemaining / 1GB, 2) } },
        @{ Name = 'Free%';       Expression = { [math]::Round(($_.SizeRemaining / $_.Size) * 100, 1) } },
        HealthStatus |
    Sort-Object 'Free%' |
    Format-Table -AutoSize
