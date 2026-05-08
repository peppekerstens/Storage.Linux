#Requires -Version 7.2

# Storage.Linux.psm1
# Root module for Storage.Linux.
# Dot-sources all function files and loads the Crescendo sub-module (private).

$functionPath = Join-Path $PSScriptRoot 'Functions'
$functionFiles = Get-ChildItem -Path $functionPath -Filter '*.ps1' -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -notlike '*.Tests.ps1' }
foreach ($file in $functionFiles) {
    . $file.FullName
}

# Load the Crescendo-generated lsblk module as a private helper (not exported)
$crescendoPath = Join-Path $PSScriptRoot 'Crescendo' 'lsblk.psm1'
if (Test-Path $crescendoPath) {
    Import-Module $crescendoPath -Force -ErrorAction SilentlyContinue
}

# Windows Storage module aliases — define so they can be exported via AliasesToExport
Set-Alias -Name 'Disable-PhysicalDiskIndication'  -Value 'Disable-PhysicalDiskIdentification'
Set-Alias -Name 'Disable-StorageDiagnosticLog'    -Value 'Stop-StorageDiagnosticLog'
Set-Alias -Name 'Enable-PhysicalDiskIndication'   -Value 'Enable-PhysicalDiskIdentification'
Set-Alias -Name 'Enable-StorageDiagnosticLog'     -Value 'Start-StorageDiagnosticLog'
Set-Alias -Name 'Flush-Volume'                    -Value 'Write-VolumeCache'
Set-Alias -Name 'Get-DiskSNV'                     -Value 'Get-DiskStorageNodeView'
Set-Alias -Name 'Get-PhysicalDiskSNV'             -Value 'Get-PhysicalDiskStorageNodeView'
Set-Alias -Name 'Get-StorageEnclosureSNV'         -Value 'Get-StorageEnclosureStorageNodeView'
Set-Alias -Name 'Initialize-Volume'               -Value 'Format-Volume'
Set-Alias -Name 'Write-FileSystemCache'           -Value 'Write-VolumeCache'
