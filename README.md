# Storage.Linux

PowerShell module for Linux. Aiming for cmdlet parity with the original Storage module

This is work in progress. More information can be found [here](https://peppekerstens.github.io/linux-command-wrapping-part-1/)

## Context and reference

Some metadata for context and reference:

```powershell
$PSversionTable

Name                           Value
----                           -----
PSVersion                      7.5.1
PSEdition                      Core
GitCommitId                    7.5.1
OS                             Microsoft Windows 10.0.26100
Platform                       Win32NT
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0

get-module storage -ListAvailable

    Directory: C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules

ModuleType Version    PreRelease Name                                PSEdition ExportedCommands
---------- -------    ---------- ----                                --------- ----------------
Manifest   2.0.0.0               Storage                             Core,Desk {Add-InitiatorIdToMaskingSet, Add-Parti…

```

### Populating the module

```PowerShell
cd .\storage.linux\functions
get-command -Module storage | where commandtype -eq Function | select name | foreach {new-item -itemtype file -name "$($_.name).ps1"}
```

## Status

|CommandType|Name|Priority|
|:--|:--|:--|
|Alias|Disable-PhysicalDiskIndication|None
|Alias|Disable-StorageDiagnosticLog|
|Alias|Enable-PhysicalDiskIndication|
|Alias|Enable-StorageDiagnosticLog|
|Alias|Flush-Volume|
|Alias|Get-DiskSNV|
|Alias|Get-PhysicalDiskSNV|
|Alias|Get-StorageEnclosureSNV|
|Alias|Initialize-Volume|
|Alias|Write-FileSystemCache|
|Function|Add-InitiatorIdToMaskingSet|
|Function|Add-PartitionAccessPath|
|Function|Add-PhysicalDisk|
|Function|Add-StorageFaultDomain|
|Function|Add-TargetPortToMaskingSet|
|Function|Add-VirtualDiskToMaskingSet|
|Function|Block-FileShareAccess|
|Function|Clear-Disk|
|Function|Clear-FileStorageTier|
|Function|Clear-StorageDiagnosticInfo|
|Function|Connect-VirtualDisk|
|Function|Convert-PhysicalDisk|
|Function|Debug-FileShare|
|Function|Debug-StorageSubSystem|
|Function|Debug-Volume|
|Function|Disable-PhysicalDiskIdentification|
|Function|Disable-StorageDataCollection|
|Function|Disable-StorageEnclosureIdentification|
|Function|Disable-StorageEnclosurePower|
|Function|Disable-StorageHighAvailability|
|Function|Disable-StorageMaintenanceMode|
|Function|Disconnect-VirtualDisk|
|Function|Dismount-DiskImage|
|Function|Enable-PhysicalDiskIdentification|
|Function|Enable-StorageDataCollection|
|Function|Enable-StorageEnclosureIdentification|
|Function|Enable-StorageEnclosurePower|
|Function|Enable-StorageHighAvailability|
|Function|Enable-StorageMaintenanceMode|
|Function|Format-Volume|
|Function|Get-DedupProperties|
|Function|Get-Disk|
|Function|Get-DiskImage|
|Function|Get-DiskStorageNodeView|
|Function|Get-FileIntegrity|
|Function|Get-FileShare|
|Function|Get-FileShareAccessControlEntry|
|Function|Get-FileStorageTier|
|Function|Get-InitiatorId|
|Function|Get-InitiatorPort|
|Function|Get-MaskingSet|
|Function|Get-OffloadDataTransferSetting|
|Function|Get-Partition|
|Function|Get-PartitionSupportedSize|
|Function|Get-PhysicalDisk|
|Function|Get-PhysicalDiskStorageNodeView|
|Function|Get-PhysicalExtent|
|Function|Get-PhysicalExtentAssociation|
|Function|Get-ResiliencySetting|
|Function|Get-StorageAdvancedProperty|
|Function|Get-StorageChassis|
|Function|Get-StorageDataCollection|
|Function|Get-StorageDiagnosticInfo|
|Function|Get-StorageEnclosure|
|Function|Get-StorageEnclosureStorageNodeView|
|Function|Get-StorageEnclosureVendorData|
|Function|Get-StorageExtendedStatus|
|Function|Get-StorageFaultDomain|
|Function|Get-StorageFileServer|
|Function|Get-StorageFirmwareInformation|
|Function|Get-StorageHealthAction|
|Function|Get-StorageHealthReport|
|Function|Get-StorageHealthSetting|
|Function|Get-StorageHistory|
|Function|Get-StorageJob|
|Function|Get-StorageNode|
|Function|Get-StoragePool|
|Function|Get-StorageProvider|
|Function|Get-StorageRack|
|Function|Get-StorageReliabilityCounter|
|Function|Get-StorageScaleUnit|
|Function|Get-StorageSetting|
|Function|Get-StorageSite|
|Function|Get-StorageSubSystem|
|Function|Get-StorageTier|
|Function|Get-StorageTierSupportedSize|
|Function|Get-SupportedClusterSizes|
|Function|Get-SupportedFileSystems|
|Function|Get-TargetPort|
|Function|Get-TargetPortal|
|Function|Get-VirtualDisk|
|Function|Get-VirtualDiskSupportedSize|
|Function|Get-Volume|
|Function|Get-VolumeCorruptionCount|
|Function|Get-VolumeScrubPolicy|
|Function|Grant-FileShareAccess|
|Function|Hide-VirtualDisk|
|Function|Initialize-Disk|
|Function|Mount-DiskImage|
|Function|New-FileShare|
|Function|New-MaskingSet|
|Function|New-Partition|
|Function|New-StorageFileServer|
|Function|New-StoragePool|
|Function|New-StorageSubsystemVirtualDisk|
|Function|New-StorageTier|
|Function|New-VirtualDisk|
|Function|New-VirtualDiskClone|
|Function|New-VirtualDiskSnapshot|
|Function|New-Volume|
|Function|Optimize-StoragePool|
|Function|Optimize-Volume|
|Function|Register-StorageSubsystem|
|Function|Remove-FileShare|
|Function|Remove-InitiatorId|
|Function|Remove-InitiatorIdFromMaskingSet|
|Function|Remove-MaskingSet|
|Function|Remove-Partition|
|Function|Remove-PartitionAccessPath|
|Function|Remove-PhysicalDisk|
|Function|Remove-StorageFaultDomain|
|Function|Remove-StorageFileServer|
|Function|Remove-StorageHealthIntent|
|Function|Remove-StorageHealthSetting|
|Function|Remove-StoragePool|
|Function|Remove-StorageTier|
|Function|Remove-TargetPortFromMaskingSet|
|Function|Remove-VirtualDisk|
|Function|Remove-VirtualDiskFromMaskingSet|
|Function|Rename-MaskingSet|
|Function|Repair-FileIntegrity|
|Function|Repair-VirtualDisk|
|Function|Repair-Volume|
|Function|Reset-PhysicalDisk|
|Function|Reset-StorageReliabilityCounter|
|Function|Resize-Partition|
|Function|Resize-StorageTier|
|Function|Resize-VirtualDisk|
|Function|Revoke-FileShareAccess|
|Function|Save-StorageDataCollection|
|Function|Set-Disk|
|Function|Set-FileIntegrity|
|Function|Set-FileShare|
|Function|Set-FileStorageTier|
|Function|Set-InitiatorPort|
|Function|Set-Partition|
|Function|Set-PhysicalDisk|
|Function|Set-ResiliencySetting|
|Function|Set-StorageFileServer|
|Function|Set-StorageHealthSetting|
|Function|Set-StoragePool|
|Function|Set-StorageProvider|
|Function|Set-StorageSetting|
|Function|Set-StorageSubSystem|
|Function|Set-StorageTier|
|Function|Set-VirtualDisk|
|Function|Set-Volume|
|Function|Set-VolumeScrubPolicy|
|Function|Show-StorageHistory|
|Function|Show-VirtualDisk|
|Function|Start-StorageDiagnosticLog|
|Function|Stop-StorageDiagnosticLog|
|Function|Stop-StorageJob|
|Function|Unblock-FileShareAccess|
|Function|Unregister-StorageSubsystem|
|Function|Update-Disk|
|Function|Update-HostStorageCache|
|Function|Update-StorageFirmware|
|Function|Update-StoragePool|
|Function|Update-StorageProviderCache|
|Function|Write-VolumeCache|