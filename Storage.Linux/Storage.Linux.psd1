#
# Module manifest for module 'Storage.Linux'
#

@{
    RootModule        = 'Storage.Linux.psm1'
    ModuleVersion     = '0.2.0'
    GUID              = 'b2c3d4e5-f6a7-8901-bcde-f12345678901'
    Author            = 'Peppe Kerstens'
    CompanyName       = ''
    Copyright         = '(c) Peppe Kerstens. GPL-3.0 license.'
    Description       = 'PowerShell module for Linux providing cmdlet parity with the Windows Storage module. Wraps lsblk, df and sfdisk to implement Get-Disk, Get-PhysicalDisk, Get-Partition and Get-Volume. Remaining cmdlets emit a not-implemented warning.'
    PowerShellVersion = '7.2'
    RequiredModules   = @()

    FunctionsToExport = @(
        # Implemented
        'Get-Disk',
        'Get-PhysicalDisk',
        'Get-Partition',
        'Get-Volume',
        # Crescendo
        'Get-LsBlk',
        # Stubs (not-implemented)
        'Clear-Disk',
        'Format-Volume',
        'Get-DiskImage',
        'Get-FileShare',
        'Get-StoragePool',
        'Get-StorageSubSystem',
        'Get-VirtualDisk',
        'Initialize-Disk',
        'Mount-DiskImage',
        'New-Partition',
        'New-Volume',
        'Optimize-Volume',
        'Remove-Partition',
        'Repair-Volume',
        'Resize-Partition',
        'Set-Disk',
        'Set-Partition',
        'Set-Volume'
    )

    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    PrivateData = @{
        PSData = @{
            Tags         = @('Linux', 'Storage', 'Disk', 'Partition', 'Volume', 'CrossPlatform', 'lsblk')
            LicenseUri   = 'https://github.com/peppekerstens/Storage.Linux/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/peppekerstens/Storage.Linux'
            ReleaseNotes = @'
0.2.0 - Get-Disk, Get-PhysicalDisk, Get-Partition, Get-Volume: full Linux implementations via lsblk/df. Module manifest and root module added.
0.1.0 - Initial scaffolding with proxy function stubs and Crescendo lsblk config.
'@
        }
    }
}
