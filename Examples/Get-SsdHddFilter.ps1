<#
.Synopsis
    SSD / HDD filter — lists physical disks filtered by media type.
.Description
    Retrieves all physical disks and groups them by media type (SSD, HDD, Unspecified),
    then displays each group's disks with size information.
    Useful for quickly auditing the mix of storage devices in a system.
    Works identically on Windows (via Storage module) and Linux (via Storage.Linux).
.Parameter MediaType
    Restrict output to a specific media type: SSD, HDD, or Unspecified.
    When omitted all disks are shown grouped by type.
.Example
    .\Get-SsdHddFilter.ps1
.Example
    .\Get-SsdHddFilter.ps1 -MediaType SSD
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Requires: Storage.Linux (Linux) or Storage (Windows)
#>

#Requires -Modules Storage.Linux

param(
    [ValidateSet('SSD','HDD','Unspecified')]
    [string]$MediaType
)

$params = @{}
if ($MediaType) { $params['MediaType'] = $MediaType }

Get-PhysicalDisk @params |
    Sort-Object MediaType, FriendlyName |
    Select-Object -Property `
        DeviceId,
        FriendlyName,
        SerialNumber,
        MediaType,
        BusType,
        @{ Name = 'SizeGB'; Expression = { [math]::Round([double]$_.Size / 1GB, 2) } },
        OperationalStatus |
    Format-Table -AutoSize
