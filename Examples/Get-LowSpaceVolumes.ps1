<#
.Synopsis
    Low-space volume report — finds volumes below a free-space threshold.
.Description
    Retrieves all mounted volumes and reports those whose free space percentage
    falls below a configurable threshold (default: 15 %).
    Guards against volumes where Size is 0 (e.g. tmpfs pseudo-filesystems).
    Works identically on Windows (via Storage module) and Linux (via Storage.Linux).
.Parameter ThresholdPercent
    The free-space percentage below which a volume is flagged. Default: 15.
.Example
    .\Get-LowSpaceVolumes.ps1
.Example
    .\Get-LowSpaceVolumes.ps1 -ThresholdPercent 20
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Requires: Storage.Linux (Linux) or Storage (Windows)
#>

#Requires -Modules Storage.Linux

param(
    [double]$ThresholdPercent = 15
)

Get-Volume |
    Where-Object { $_.Size -gt 0 } |
    Select-Object -Property `
        @{ Name = 'Path';          Expression = { if ($_.DriveLetter) { "$($_.DriveLetter):" } else { $_.Path } } },
        FileSystemLabel,
        FileSystem,
        @{ Name = 'SizeGB';        Expression = { [math]::Round($_.Size / 1GB, 2) } },
        @{ Name = 'FreeGB';        Expression = { [math]::Round($_.SizeRemaining / 1GB, 2) } },
        @{ Name = 'FreePercent';   Expression = { [math]::Round(($_.SizeRemaining / $_.Size) * 100, 1) } } |
    Where-Object { $_.FreePercent -lt $ThresholdPercent } |
    Sort-Object FreePercent |
    Format-Table -AutoSize
