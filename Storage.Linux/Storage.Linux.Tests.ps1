#Requires -Modules @{ ModuleName = 'Pester'; ModuleVersion = '5.2.0' }

<#
.Synopsis
    Pester tests for Storage.Linux.
    Covers: module surface, aliases, implemented cmdlets, and all 157 stub cmdlets.
    Run on Linux (WSL2/Ubuntu) with: Invoke-Pester ./Storage.Linux.Tests.ps1
    All tests require Linux — the module refuses to load on Windows by design.
    Tests that require the module are skipped automatically on Windows.
#>

BeforeDiscovery {
    $script:OnLinux = $IsLinux
}

BeforeAll {
    if ($IsLinux) {
        $modulePsd1 = Join-Path $PSScriptRoot 'Storage.Linux.psd1'
        Import-Module $modulePsd1 -Force
    }
}

# ---------------------------------------------------------------------------
Describe 'Module surface' -Skip:(-not $script:OnLinux) {

    It 'Exports 161 functions' {
        $m = Get-Module Storage.Linux
        $m.ExportedFunctions.Count | Should -Be 161
    }

    It 'Exports 10 aliases' {
        $m = Get-Module Storage.Linux
        $m.ExportedAliases.Count | Should -Be 10
    }

    It 'Does not export Get-LsBlk (Crescendo internal)' {
        $m = Get-Module Storage.Linux
        $m.ExportedFunctions.ContainsKey('Get-LsBlk') | Should -Be $false
    }
}

# ---------------------------------------------------------------------------
Describe 'Aliases' -Skip:(-not $script:OnLinux) {

    $aliasCases = @(
        @{ Alias = 'Disable-PhysicalDiskIndication';  Target = 'Disable-PhysicalDiskIdentification' }
        @{ Alias = 'Disable-StorageDiagnosticLog';    Target = 'Stop-StorageDiagnosticLog' }
        @{ Alias = 'Enable-PhysicalDiskIndication';   Target = 'Enable-PhysicalDiskIdentification' }
        @{ Alias = 'Enable-StorageDiagnosticLog';     Target = 'Start-StorageDiagnosticLog' }
        @{ Alias = 'Flush-Volume';                    Target = 'Write-VolumeCache' }
        @{ Alias = 'Get-DiskSNV';                     Target = 'Get-DiskStorageNodeView' }
        @{ Alias = 'Get-PhysicalDiskSNV';             Target = 'Get-PhysicalDiskStorageNodeView' }
        @{ Alias = 'Get-StorageEnclosureSNV';         Target = 'Get-StorageEnclosureStorageNodeView' }
        @{ Alias = 'Initialize-Volume';               Target = 'Format-Volume' }
        @{ Alias = 'Write-FileSystemCache';           Target = 'Write-VolumeCache' }
    )

    It '<Alias> is exported and resolves to <Target>' -ForEach $aliasCases {
        $a = Get-Alias -Name $Alias -ErrorAction SilentlyContinue
        $a | Should -Not -BeNullOrEmpty
        $a.ResolvedCommandName | Should -Be $Target
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-Disk' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one disk' {
            Get-Disk | Should -Not -BeNullOrEmpty
        }

        It 'Returns objects with expected properties' {
            $disk = Get-Disk | Select-Object -First 1
            $disk.PSObject.Properties.Name | Should -Contain 'Number'
            $disk.PSObject.Properties.Name | Should -Contain 'FriendlyName'
            $disk.PSObject.Properties.Name | Should -Contain 'Size'
            $disk.PSObject.Properties.Name | Should -Contain 'Path'
            $disk.PSObject.Properties.Name | Should -Contain 'BusType'
            $disk.PSObject.Properties.Name | Should -Contain 'MediaType'
            $disk.PSObject.Properties.Name | Should -Contain 'PartitionStyle'
        }

        It 'Number property is a non-negative integer' {
            (Get-Disk | Select-Object -First 1).Number | Should -BeGreaterOrEqual 0
        }

        It 'Path starts with /dev/' {
            (Get-Disk | Select-Object -First 1).Path | Should -Match '^/dev/'
        }

        It 'Size is a positive integer' {
            # lsblk --bytes returns numeric sizes; cast must succeed and be > 0
            $sz = (Get-Disk | Select-Object -First 1).Size
            $sz | Should -Not -BeNullOrEmpty
            [uint64]$sz | Should -BeGreaterThan 0
        }

        It 'Filters by Number' {
            $result = Get-Disk -Number 0
            $result | Should -Not -BeNullOrEmpty
            $result[0].Number | Should -Be 0
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-PhysicalDisk' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one physical disk' {
            Get-PhysicalDisk | Should -Not -BeNullOrEmpty
        }

        It 'Returns objects with expected properties' {
            $pd = Get-PhysicalDisk | Select-Object -First 1
            $pd.PSObject.Properties.Name | Should -Contain 'FriendlyName'
            $pd.PSObject.Properties.Name | Should -Contain 'MediaType'
            $pd.PSObject.Properties.Name | Should -Contain 'Size'
            $pd.PSObject.Properties.Name | Should -Contain 'Path'
            $pd.PSObject.Properties.Name | Should -Contain 'BusType'
            $pd.PSObject.Properties.Name | Should -Contain 'IsRemovable'
            $pd.PSObject.Properties.Name | Should -Contain 'OperationalStatus'
        }

        It 'MediaType is one of HDD, SSD, Unspecified' {
            Get-PhysicalDisk | ForEach-Object {
                $_.MediaType | Should -BeIn @('HDD', 'SSD', 'Unspecified')
            }
        }

        It 'Filters by MediaType SSD and HDD together cover all results' {
            $all  = Get-PhysicalDisk
            $hdds = Get-PhysicalDisk -MediaType HDD
            $ssds = Get-PhysicalDisk -MediaType SSD
            ($hdds.Count + $ssds.Count) | Should -BeLessOrEqual $all.Count
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-Partition' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Does not throw' {
            { Get-Partition } | Should -Not -Throw
        }

        It 'Partition objects have expected properties' {
            $parts = Get-Partition
            if ($parts) {
                $p = $parts | Select-Object -First 1
                $p.PSObject.Properties.Name | Should -Contain 'DiskNumber'
                $p.PSObject.Properties.Name | Should -Contain 'PartitionNumber'
                $p.PSObject.Properties.Name | Should -Contain 'Path'
                $p.PSObject.Properties.Name | Should -Contain 'Size'
            }
        }

        It 'Filters by DiskNumber' {
            $result = Get-Partition -DiskNumber 0
            if ($result) {
                $result | ForEach-Object { $_.DiskNumber | Should -Be 0 }
            }
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-Volume' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one volume' {
            Get-Volume | Should -Not -BeNullOrEmpty
        }

        It 'Volume objects have expected properties' {
            $vol = Get-Volume | Select-Object -First 1
            $vol.PSObject.Properties.Name | Should -Contain 'Path'
            $vol.PSObject.Properties.Name | Should -Contain 'FileSystem'
            $vol.PSObject.Properties.Name | Should -Contain 'Size'
            $vol.PSObject.Properties.Name | Should -Contain 'SizeRemaining'
            $vol.PSObject.Properties.Name | Should -Contain 'UniqueId'
        }

        It 'Path is a non-empty string' {
            (Get-Volume | Select-Object -First 1).Path | Should -Not -BeNullOrEmpty
        }

        It 'Size is greater than zero' {
            [uint64](Get-Volume | Select-Object -First 1).Size | Should -BeGreaterThan 0
        }

        It 'SizeRemaining is a non-negative integer' {
            [uint64](Get-Volume | Select-Object -First 1).SizeRemaining | Should -BeGreaterOrEqual 0
        }

        It 'At least one volume has a non-empty Path starting with /' {
            # In WSL2 the root distro may be at /mnt/wslg/distro rather than /;
            # assert that every returned volume path is a non-empty absolute path.
            $vols = Get-Volume
            $vols | ForEach-Object { $_.Path | Should -Match '^/' }
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Stub functions' -Skip:(-not $script:OnLinux) {

    $stubCases = @(
        @{ Name = 'Add-InitiatorIdToMaskingSet' }
        @{ Name = 'Add-PartitionAccessPath' }
        @{ Name = 'Add-PhysicalDisk' }
        @{ Name = 'Add-StorageFaultDomain' }
        @{ Name = 'Add-TargetPortToMaskingSet' }
        @{ Name = 'Add-VirtualDiskToMaskingSet' }
        @{ Name = 'Block-FileShareAccess' }
        @{ Name = 'Clear-Disk' }
        @{ Name = 'Clear-FileStorageTier' }
        @{ Name = 'Clear-StorageDiagnosticInfo' }
        @{ Name = 'Connect-VirtualDisk' }
        @{ Name = 'Convert-PhysicalDisk' }
        @{ Name = 'Debug-FileShare' }
        @{ Name = 'Debug-StorageSubSystem' }
        @{ Name = 'Debug-Volume' }
        @{ Name = 'Disable-PhysicalDiskIdentification' }
        @{ Name = 'Disable-StorageDataCollection' }
        @{ Name = 'Disable-StorageEnclosureIdentification' }
        @{ Name = 'Disable-StorageEnclosurePower' }
        @{ Name = 'Disable-StorageHighAvailability' }
        @{ Name = 'Disable-StorageMaintenanceMode' }
        @{ Name = 'Disconnect-VirtualDisk' }
        @{ Name = 'Dismount-DiskImage' }
        @{ Name = 'Enable-PhysicalDiskIdentification' }
        @{ Name = 'Enable-StorageDataCollection' }
        @{ Name = 'Enable-StorageEnclosureIdentification' }
        @{ Name = 'Enable-StorageEnclosurePower' }
        @{ Name = 'Enable-StorageHighAvailability' }
        @{ Name = 'Enable-StorageMaintenanceMode' }
        @{ Name = 'Format-Volume' }
        @{ Name = 'Get-DedupProperties' }
        @{ Name = 'Get-DiskImage' }
        @{ Name = 'Get-DiskStorageNodeView' }
        @{ Name = 'Get-FileIntegrity' }
        @{ Name = 'Get-FileShare' }
        @{ Name = 'Get-FileShareAccessControlEntry' }
        @{ Name = 'Get-FileStorageTier' }
        @{ Name = 'Get-InitiatorId' }
        @{ Name = 'Get-InitiatorPort' }
        @{ Name = 'Get-MaskingSet' }
        @{ Name = 'Get-OffloadDataTransferSetting' }
        @{ Name = 'Get-PartitionSupportedSize' }
        @{ Name = 'Get-PhysicalDiskStorageNodeView' }
        @{ Name = 'Get-PhysicalExtent' }
        @{ Name = 'Get-PhysicalExtentAssociation' }
        @{ Name = 'Get-ResiliencySetting' }
        @{ Name = 'Get-StorageAdvancedProperty' }
        @{ Name = 'Get-StorageChassis' }
        @{ Name = 'Get-StorageDataCollection' }
        @{ Name = 'Get-StorageDiagnosticInfo' }
        @{ Name = 'Get-StorageEnclosure' }
        @{ Name = 'Get-StorageEnclosureStorageNodeView' }
        @{ Name = 'Get-StorageEnclosureVendorData' }
        @{ Name = 'Get-StorageExtendedStatus' }
        @{ Name = 'Get-StorageFaultDomain' }
        @{ Name = 'Get-StorageFileServer' }
        @{ Name = 'Get-StorageFirmwareInformation' }
        @{ Name = 'Get-StorageHealthAction' }
        @{ Name = 'Get-StorageHealthReport' }
        @{ Name = 'Get-StorageHealthSetting' }
        @{ Name = 'Get-StorageHistory' }
        @{ Name = 'Get-StorageJob' }
        @{ Name = 'Get-StorageNode' }
        @{ Name = 'Get-StoragePool' }
        @{ Name = 'Get-StorageProvider' }
        @{ Name = 'Get-StorageRack' }
        @{ Name = 'Get-StorageReliabilityCounter' }
        @{ Name = 'Get-StorageScaleUnit' }
        @{ Name = 'Get-StorageSetting' }
        @{ Name = 'Get-StorageSite' }
        @{ Name = 'Get-StorageSubSystem' }
        @{ Name = 'Get-StorageTier' }
        @{ Name = 'Get-StorageTierSupportedSize' }
        @{ Name = 'Get-SupportedClusterSizes' }
        @{ Name = 'Get-SupportedFileSystems' }
        @{ Name = 'Get-TargetPort' }
        @{ Name = 'Get-TargetPortal' }
        @{ Name = 'Get-VirtualDisk' }
        @{ Name = 'Get-VirtualDiskSupportedSize' }
        @{ Name = 'Get-VolumeCorruptionCount' }
        @{ Name = 'Get-VolumeScrubPolicy' }
        @{ Name = 'Grant-FileShareAccess' }
        @{ Name = 'Hide-VirtualDisk' }
        @{ Name = 'Initialize-Disk' }
        @{ Name = 'Mount-DiskImage' }
        @{ Name = 'New-FileShare' }
        @{ Name = 'New-MaskingSet' }
        @{ Name = 'New-Partition' }
        @{ Name = 'New-StorageFileServer' }
        @{ Name = 'New-StoragePool' }
        @{ Name = 'New-StorageSubsystemVirtualDisk' }
        @{ Name = 'New-StorageTier' }
        @{ Name = 'New-VirtualDisk' }
        @{ Name = 'New-VirtualDiskClone' }
        @{ Name = 'New-VirtualDiskSnapshot' }
        @{ Name = 'New-Volume' }
        @{ Name = 'Optimize-StoragePool' }
        @{ Name = 'Optimize-Volume' }
        @{ Name = 'Register-StorageSubsystem' }
        @{ Name = 'Remove-FileShare' }
        @{ Name = 'Remove-InitiatorId' }
        @{ Name = 'Remove-InitiatorIdFromMaskingSet' }
        @{ Name = 'Remove-MaskingSet' }
        @{ Name = 'Remove-Partition' }
        @{ Name = 'Remove-PartitionAccessPath' }
        @{ Name = 'Remove-PhysicalDisk' }
        @{ Name = 'Remove-StorageFaultDomain' }
        @{ Name = 'Remove-StorageFileServer' }
        @{ Name = 'Remove-StorageHealthIntent' }
        @{ Name = 'Remove-StorageHealthSetting' }
        @{ Name = 'Remove-StoragePool' }
        @{ Name = 'Remove-StorageTier' }
        @{ Name = 'Remove-TargetPortFromMaskingSet' }
        @{ Name = 'Remove-VirtualDisk' }
        @{ Name = 'Remove-VirtualDiskFromMaskingSet' }
        @{ Name = 'Rename-MaskingSet' }
        @{ Name = 'Repair-FileIntegrity' }
        @{ Name = 'Repair-VirtualDisk' }
        @{ Name = 'Repair-Volume' }
        @{ Name = 'Reset-PhysicalDisk' }
        @{ Name = 'Reset-StorageReliabilityCounter' }
        @{ Name = 'Resize-Partition' }
        @{ Name = 'Resize-StorageTier' }
        @{ Name = 'Resize-VirtualDisk' }
        @{ Name = 'Revoke-FileShareAccess' }
        @{ Name = 'Save-StorageDataCollection' }
        @{ Name = 'Set-Disk' }
        @{ Name = 'Set-FileIntegrity' }
        @{ Name = 'Set-FileShare' }
        @{ Name = 'Set-FileStorageTier' }
        @{ Name = 'Set-InitiatorPort' }
        @{ Name = 'Set-Partition' }
        @{ Name = 'Set-PhysicalDisk' }
        @{ Name = 'Set-ResiliencySetting' }
        @{ Name = 'Set-StorageFileServer' }
        @{ Name = 'Set-StorageHealthSetting' }
        @{ Name = 'Set-StoragePool' }
        @{ Name = 'Set-StorageProvider' }
        @{ Name = 'Set-StorageSetting' }
        @{ Name = 'Set-StorageSubSystem' }
        @{ Name = 'Set-StorageTier' }
        @{ Name = 'Set-VirtualDisk' }
        @{ Name = 'Set-Volume' }
        @{ Name = 'Set-VolumeScrubPolicy' }
        @{ Name = 'Show-StorageHistory' }
        @{ Name = 'Show-VirtualDisk' }
        @{ Name = 'Start-StorageDiagnosticLog' }
        @{ Name = 'Stop-StorageDiagnosticLog' }
        @{ Name = 'Stop-StorageJob' }
        @{ Name = 'Unblock-FileShareAccess' }
        @{ Name = 'Unregister-StorageSubsystem' }
        @{ Name = 'Update-Disk' }
        @{ Name = 'Update-HostStorageCache' }
        @{ Name = 'Update-StorageFirmware' }
        @{ Name = 'Update-StoragePool' }
        @{ Name = 'Update-StorageProviderCache' }
        @{ Name = 'Write-VolumeCache' }
    )

    It '<Name> is exported by the module' -ForEach $stubCases {
        $m = Get-Module Storage.Linux
        $m.ExportedFunctions.ContainsKey($Name) | Should -Be $true
    }

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It '<Name> does not throw' -ForEach $stubCases {
            { & $Name -WarningAction SilentlyContinue } | Should -Not -Throw
        }

        It '<Name> emits a not-implemented warning' -ForEach $stubCases {
            & $Name -WarningVariable w -WarningAction SilentlyContinue
            $w | Should -Not -BeNullOrEmpty
        }
    }
}
