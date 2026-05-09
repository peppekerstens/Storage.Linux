#Requires -Version 7.2

# Storage.Linux.psm1
# Root module for Storage.Linux.
# Dot-sources all function files and loads the Crescendo sub-module (private).

# Linux-only guard — this module wraps Linux CLI tools and must not be loaded
# on Windows. On Windows, use the built-in Storage module instead:
#   Import-Module Storage
if (-not $IsLinux) {
    throw (
        "Storage.Linux cannot be loaded on Windows. " +
        "On Windows, use the built-in 'Storage' module: Import-Module Storage`n" +
        "Storage.Linux is a Linux-only peer module that wraps lsblk and df."
    )
}

# Load private helpers first (not exported)
$privatePath = Join-Path $PSScriptRoot 'Functions' 'Private'
if (Test-Path $privatePath) {
    $privateFiles = Get-ChildItem -Path $privatePath -Filter '*.ps1' -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -notlike '*.Tests.ps1' }
    foreach ($file in $privateFiles) {
        . $file.FullName
    }
}

$functionPath = Join-Path $PSScriptRoot 'Functions'
$functionFiles = Get-ChildItem -Path $functionPath -Filter '*.ps1' -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -notlike '*.Tests.ps1' }
foreach ($file in $functionFiles) {
    . $file.FullName
}

# Load the Crescendo-generated lsblk module as a private helper (not exported)
# Note: Get-LsBlkData (Functions/Private/Get-LsBlkData.ps1) supersedes the
# Crescendo-generated Get-LsBlk, which had incomplete parameter wiring.
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
