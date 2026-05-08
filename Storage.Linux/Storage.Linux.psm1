#Requires -Version 7.2

# Storage.Linux.psm1
# Root module for Storage.Linux.
# Dot-sources all function files and loads the Crescendo sub-modules.

$functionPath = Join-Path $PSScriptRoot 'Functions'
$functionFiles = Get-ChildItem -Path $functionPath -Filter '*.ps1' -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -notlike '*.Tests.ps1' }
foreach ($file in $functionFiles) {
    . $file.FullName
}

# Load the Crescendo-generated lsblk module if present
$crescendoPath = Join-Path $PSScriptRoot 'Crescendo' 'lsblk.psm1'
if (Test-Path $crescendoPath) {
    Import-Module $crescendoPath -Force -ErrorAction SilentlyContinue
}
