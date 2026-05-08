<#
.Synopsis
    Disk inventory — lists all disks with formatted sizes.
.Description
    Retrieves all disks visible to the OS and displays a formatted inventory
    showing number, friendly name, bus type, media type, partition style,
    and total capacity in GB.
    Works identically on Windows (via Storage module) and Linux (via Storage.Linux).
.Example
    .\Get-DiskInventory.ps1
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Requires: Storage.Linux (Linux) or Storage (Windows)
#>

#Requires -Modules Storage.Linux

Get-Disk | Select-Object -Property `
    Number,
    FriendlyName,
    BusType,
    MediaType,
    PartitionStyle,
    OperationalStatus,
    @{ Name = 'SizeGB'; Expression = { [math]::Round($_.Size / 1GB, 2) } } |
    Format-Table -AutoSize
