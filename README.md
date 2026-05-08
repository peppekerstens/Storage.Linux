# Storage.Linux

PowerShell 7.x module providing cmdlet parity with the Windows `Storage` module on Linux. Wraps native CLI tools (`lsblk`, `df`) to deliver a familiar PowerShell experience for disk, partition and volume management.

**This module is Linux-only.** It will refuse to load on Windows with a clear error message. On Windows, use the built-in `Storage` module (`Import-Module Storage`) instead.

Part of the **Linux PowerShell Cmdlet Parity** project — inspired by Evgenij Smirnov's [2025 European PowerShell Summit session](https://www.youtube.com/watch?v=RlzinWYIjBY) and documented in the blog series at [peppekerstens.github.io](https://peppekerstens.github.io/linux-command-wrapping-part-1/).

---

## What it does

Wraps `lsblk` and `df` to provide PowerShell cmdlets matching the Windows `Storage` module API as closely as possible. All 161 cmdlets and 10 aliases that the Windows module exports are present — 4 are fully implemented, the remaining 157 are stubs that emit a warning.

Attempting to load the module on Windows raises an error:
```
Storage.Linux cannot be loaded on Windows. On Windows, use the built-in
'Storage' module: Import-Module Storage
```

An `Examples\` folder ships with the module containing five ready-to-run scripts that demonstrate common real-world usage patterns.

---

## Requirements

- **Linux only** — the module will not load on Windows (by design)
- PowerShell 7.2+
- `util-linux` (`lsblk`) and `coreutils` (`df`) — both available by default on Ubuntu 24.04
- Pester 5.2+ (for running tests)

---

## Installation

```powershell
# Clone or copy the module folder to a PSModulePath location, then:
Import-Module Storage.Linux
```

---

## Usage

```powershell
# List all disks
Get-Disk

# Get a specific disk by number
Get-Disk -Number 0

# List all partitions on disk 0
Get-Partition -DiskNumber 0

# List all volumes with size information
Get-Volume

# List physical disks with media type (HDD/SSD)
Get-PhysicalDisk

# Filter SSDs only
Get-PhysicalDisk -MediaType SSD

# Find volumes with less than 15 % free space
Get-Volume | Where-Object { $_.Size -gt 0 -and ($_.SizeRemaining / $_.Size) -lt 0.15 }
```

See the [`Examples\`](Examples/) folder for ready-to-run scripts covering common real-world patterns.

---

## Examples

| Script | Description |
|---|---|
| [`Get-DiskInventory.ps1`](Examples/Get-DiskInventory.ps1) | Formatted disk listing with sizes in GB |
| [`Get-LowSpaceVolumes.ps1`](Examples/Get-LowSpaceVolumes.ps1) | Volumes below a configurable free-space threshold |
| [`Get-DiskLayout.ps1`](Examples/Get-DiskLayout.ps1) | Hierarchical disk → partition report |
| [`Get-SsdHddFilter.ps1`](Examples/Get-SsdHddFilter.ps1) | Physical disks grouped/filtered by media type |
| [`Get-StorageSummary.ps1`](Examples/Get-StorageSummary.ps1) | Combined capacity and usage report across all cmdlets |

---

## Cmdlet Status

Legend: ✅ Implemented &nbsp;|&nbsp; ⚠️ Stub &nbsp;|&nbsp; 🔗 Alias

| Cmdlet | Status | Linux tool / Notes |
|---|:---:|---|
| `Get-Disk` | ✅ | `lsblk --json --bytes`; Number, FriendlyName, SerialNumber, Size, BusType, MediaType, PartitionStyle, LogicalSectorSize, PhysicalSectorSize |
| `Get-PhysicalDisk` | ✅ | `lsblk --json --bytes`; FriendlyName, SerialNumber, MediaType (HDD/SSD via `rota`), BusType, IsRemovable, OperationalStatus |
| `Get-Partition` | ✅ | `lsblk --json` children; DiskNumber, PartitionNumber, FileSystem, MountPoint, UniqueId, Path |
| `Get-Volume` | ✅ | `lsblk --json --bytes` + `df --block-size=1`; Path, FileSystem, FileSystemLabel, Size, SizeRemaining, UniqueId |
| `Add-InitiatorIdToMaskingSet` | ⚠️ | Stub |
| `Add-PartitionAccessPath` | ⚠️ | Stub |
| `Add-PhysicalDisk` | ⚠️ | Stub |
| `Add-StorageFaultDomain` | ⚠️ | Stub |
| `Add-TargetPortToMaskingSet` | ⚠️ | Stub |
| `Add-VirtualDiskToMaskingSet` | ⚠️ | Stub |
| `Block-FileShareAccess` | ⚠️ | Stub |
| `Clear-Disk` | ⚠️ | Stub |
| `Clear-FileStorageTier` | ⚠️ | Stub |
| `Clear-StorageDiagnosticInfo` | ⚠️ | Stub |
| `Connect-VirtualDisk` | ⚠️ | Stub |
| `Convert-PhysicalDisk` | ⚠️ | Stub |
| `Debug-FileShare` | ⚠️ | Stub |
| `Debug-StorageSubSystem` | ⚠️ | Stub |
| `Debug-Volume` | ⚠️ | Stub |
| `Disable-PhysicalDiskIdentification` | ⚠️ | Stub |
| `Disable-StorageDataCollection` | ⚠️ | Stub |
| `Disable-StorageEnclosureIdentification` | ⚠️ | Stub |
| `Disable-StorageEnclosurePower` | ⚠️ | Stub |
| `Disable-StorageHighAvailability` | ⚠️ | Stub |
| `Disable-StorageMaintenanceMode` | ⚠️ | Stub |
| `Disconnect-VirtualDisk` | ⚠️ | Stub |
| `Dismount-DiskImage` | ⚠️ | Stub |
| `Enable-PhysicalDiskIdentification` | ⚠️ | Stub |
| `Enable-StorageDataCollection` | ⚠️ | Stub |
| `Enable-StorageEnclosureIdentification` | ⚠️ | Stub |
| `Enable-StorageEnclosurePower` | ⚠️ | Stub |
| `Enable-StorageHighAvailability` | ⚠️ | Stub |
| `Enable-StorageMaintenanceMode` | ⚠️ | Stub |
| `Format-Volume` | ⚠️ | Stub |
| `Get-DedupProperties` | ⚠️ | Stub |
| `Get-DiskImage` | ⚠️ | Stub |
| `Get-DiskStorageNodeView` | ⚠️ | Stub |
| `Get-FileIntegrity` | ⚠️ | Stub |
| `Get-FileShare` | ⚠️ | Stub |
| `Get-FileShareAccessControlEntry` | ⚠️ | Stub |
| `Get-FileStorageTier` | ⚠️ | Stub |
| `Get-InitiatorId` | ⚠️ | Stub |
| `Get-InitiatorPort` | ⚠️ | Stub |
| `Get-MaskingSet` | ⚠️ | Stub |
| `Get-OffloadDataTransferSetting` | ⚠️ | Stub |
| `Get-PartitionSupportedSize` | ⚠️ | Stub |
| `Get-PhysicalDiskStorageNodeView` | ⚠️ | Stub |
| `Get-PhysicalExtent` | ⚠️ | Stub |
| `Get-PhysicalExtentAssociation` | ⚠️ | Stub |
| `Get-ResiliencySetting` | ⚠️ | Stub |
| `Get-StorageAdvancedProperty` | ⚠️ | Stub |
| `Get-StorageChassis` | ⚠️ | Stub |
| `Get-StorageDataCollection` | ⚠️ | Stub |
| `Get-StorageDiagnosticInfo` | ⚠️ | Stub |
| `Get-StorageEnclosure` | ⚠️ | Stub |
| `Get-StorageEnclosureStorageNodeView` | ⚠️ | Stub |
| `Get-StorageEnclosureVendorData` | ⚠️ | Stub |
| `Get-StorageExtendedStatus` | ⚠️ | Stub |
| `Get-StorageFaultDomain` | ⚠️ | Stub |
| `Get-StorageFileServer` | ⚠️ | Stub |
| `Get-StorageFirmwareInformation` | ⚠️ | Stub |
| `Get-StorageHealthAction` | ⚠️ | Stub |
| `Get-StorageHealthReport` | ⚠️ | Stub |
| `Get-StorageHealthSetting` | ⚠️ | Stub |
| `Get-StorageHistory` | ⚠️ | Stub |
| `Get-StorageJob` | ⚠️ | Stub |
| `Get-StorageNode` | ⚠️ | Stub |
| `Get-StoragePool` | ⚠️ | Stub |
| `Get-StorageProvider` | ⚠️ | Stub |
| `Get-StorageRack` | ⚠️ | Stub |
| `Get-StorageReliabilityCounter` | ⚠️ | Stub |
| `Get-StorageScaleUnit` | ⚠️ | Stub |
| `Get-StorageSetting` | ⚠️ | Stub |
| `Get-StorageSite` | ⚠️ | Stub |
| `Get-StorageSubSystem` | ⚠️ | Stub |
| `Get-StorageTier` | ⚠️ | Stub |
| `Get-StorageTierSupportedSize` | ⚠️ | Stub |
| `Get-SupportedClusterSizes` | ⚠️ | Stub |
| `Get-SupportedFileSystems` | ⚠️ | Stub |
| `Get-TargetPort` | ⚠️ | Stub |
| `Get-TargetPortal` | ⚠️ | Stub |
| `Get-VirtualDisk` | ⚠️ | Stub |
| `Get-VirtualDiskSupportedSize` | ⚠️ | Stub |
| `Get-VolumeCorruptionCount` | ⚠️ | Stub |
| `Get-VolumeScrubPolicy` | ⚠️ | Stub |
| `Grant-FileShareAccess` | ⚠️ | Stub |
| `Hide-VirtualDisk` | ⚠️ | Stub |
| `Initialize-Disk` | ⚠️ | Stub |
| `Mount-DiskImage` | ⚠️ | Stub |
| `New-FileShare` | ⚠️ | Stub |
| `New-MaskingSet` | ⚠️ | Stub |
| `New-Partition` | ⚠️ | Stub |
| `New-StorageFileServer` | ⚠️ | Stub |
| `New-StoragePool` | ⚠️ | Stub |
| `New-StorageSubsystemVirtualDisk` | ⚠️ | Stub |
| `New-StorageTier` | ⚠️ | Stub |
| `New-VirtualDisk` | ⚠️ | Stub |
| `New-VirtualDiskClone` | ⚠️ | Stub |
| `New-VirtualDiskSnapshot` | ⚠️ | Stub |
| `New-Volume` | ⚠️ | Stub |
| `Optimize-StoragePool` | ⚠️ | Stub |
| `Optimize-Volume` | ⚠️ | Stub |
| `Register-StorageSubsystem` | ⚠️ | Stub |
| `Remove-FileShare` | ⚠️ | Stub |
| `Remove-InitiatorId` | ⚠️ | Stub |
| `Remove-InitiatorIdFromMaskingSet` | ⚠️ | Stub |
| `Remove-MaskingSet` | ⚠️ | Stub |
| `Remove-Partition` | ⚠️ | Stub |
| `Remove-PartitionAccessPath` | ⚠️ | Stub |
| `Remove-PhysicalDisk` | ⚠️ | Stub |
| `Remove-StorageFaultDomain` | ⚠️ | Stub |
| `Remove-StorageFileServer` | ⚠️ | Stub |
| `Remove-StorageHealthIntent` | ⚠️ | Stub |
| `Remove-StorageHealthSetting` | ⚠️ | Stub |
| `Remove-StoragePool` | ⚠️ | Stub |
| `Remove-StorageTier` | ⚠️ | Stub |
| `Remove-TargetPortFromMaskingSet` | ⚠️ | Stub |
| `Remove-VirtualDisk` | ⚠️ | Stub |
| `Remove-VirtualDiskFromMaskingSet` | ⚠️ | Stub |
| `Rename-MaskingSet` | ⚠️ | Stub |
| `Repair-FileIntegrity` | ⚠️ | Stub |
| `Repair-VirtualDisk` | ⚠️ | Stub |
| `Repair-Volume` | ⚠️ | Stub |
| `Reset-PhysicalDisk` | ⚠️ | Stub |
| `Reset-StorageReliabilityCounter` | ⚠️ | Stub |
| `Resize-Partition` | ⚠️ | Stub |
| `Resize-StorageTier` | ⚠️ | Stub |
| `Resize-VirtualDisk` | ⚠️ | Stub |
| `Revoke-FileShareAccess` | ⚠️ | Stub |
| `Save-StorageDataCollection` | ⚠️ | Stub |
| `Set-Disk` | ⚠️ | Stub |
| `Set-FileIntegrity` | ⚠️ | Stub |
| `Set-FileShare` | ⚠️ | Stub |
| `Set-FileStorageTier` | ⚠️ | Stub |
| `Set-InitiatorPort` | ⚠️ | Stub |
| `Set-Partition` | ⚠️ | Stub |
| `Set-PhysicalDisk` | ⚠️ | Stub |
| `Set-ResiliencySetting` | ⚠️ | Stub |
| `Set-StorageFileServer` | ⚠️ | Stub |
| `Set-StorageHealthSetting` | ⚠️ | Stub |
| `Set-StoragePool` | ⚠️ | Stub |
| `Set-StorageProvider` | ⚠️ | Stub |
| `Set-StorageSetting` | ⚠️ | Stub |
| `Set-StorageSubSystem` | ⚠️ | Stub |
| `Set-StorageTier` | ⚠️ | Stub |
| `Set-VirtualDisk` | ⚠️ | Stub |
| `Set-Volume` | ⚠️ | Stub |
| `Set-VolumeScrubPolicy` | ⚠️ | Stub |
| `Show-StorageHistory` | ⚠️ | Stub |
| `Show-VirtualDisk` | ⚠️ | Stub |
| `Start-StorageDiagnosticLog` | ⚠️ | Stub |
| `Stop-StorageDiagnosticLog` | ⚠️ | Stub |
| `Stop-StorageJob` | ⚠️ | Stub |
| `Unblock-FileShareAccess` | ⚠️ | Stub |
| `Unregister-StorageSubsystem` | ⚠️ | Stub |
| `Update-Disk` | ⚠️ | Stub |
| `Update-HostStorageCache` | ⚠️ | Stub |
| `Update-StorageFirmware` | ⚠️ | Stub |
| `Update-StoragePool` | ⚠️ | Stub |
| `Update-StorageProviderCache` | ⚠️ | Stub |
| `Write-VolumeCache` | ⚠️ | Stub |
| `Disable-PhysicalDiskIndication` | 🔗 | Alias → `Disable-PhysicalDiskIdentification` |
| `Disable-StorageDiagnosticLog` | 🔗 | Alias → `Stop-StorageDiagnosticLog` |
| `Enable-PhysicalDiskIndication` | 🔗 | Alias → `Enable-PhysicalDiskIdentification` |
| `Enable-StorageDiagnosticLog` | 🔗 | Alias → `Start-StorageDiagnosticLog` |
| `Flush-Volume` | 🔗 | Alias → `Write-VolumeCache` |
| `Get-DiskSNV` | 🔗 | Alias → `Get-DiskStorageNodeView` |
| `Get-PhysicalDiskSNV` | 🔗 | Alias → `Get-PhysicalDiskStorageNodeView` |
| `Get-StorageEnclosureSNV` | 🔗 | Alias → `Get-StorageEnclosureStorageNodeView` |
| `Initialize-Volume` | 🔗 | Alias → `Format-Volume` |
| `Write-FileSystemCache` | 🔗 | Alias → `Write-VolumeCache` |

---

## Implementation notes

- **Linux-only module** — `Storage.Linux.psm1` throws a descriptive error on Windows at load time; on Windows use `Import-Module Storage` instead.
- `lsblk --bytes` is required — without it, `SIZE` is returned as a human-readable string (e.g. `"388.6M"`) instead of a numeric `[uint64]`.
- `lsblk` lists swap devices with `MOUNTPOINT = [SWAP]`. `Get-Volume` filters these out with `-notmatch '^/'` so only real filesystem mountpoints are returned.
- In WSL2 Ubuntu 24.04, the root distro filesystem mounts at `/mnt/wslg/distro`, not `/`. Tests must not hardcode `/` as an expected mountpoint.
- `lsblk` column names use hyphens (e.g. `log-sec`, `phy-sec`) — accessed as `$d.'log-sec'` in PowerShell.
- `Get-LsBlk` (Crescendo-generated raw `lsblk` wrapper) is an internal helper loaded as a nested module — it is **not** part of the public surface.
- `Storage.Linux.Tests.ps1`: requires Pester 5.2+; 503 tests, all skipped on Windows (module cannot load), all run on Linux. Uses `-ForEach` (never raw `foreach`) for Pester 5 variable scoping correctness.
- `Examples.Tests.ps1`: requires Pester 5.2+; uses `BeforeDiscovery` for `$PSScriptRoot` reliability across Pester 5.3.x (Windows) and 5.7.x (WSL2); 31 tests — 15 pass on Windows (file existence + syntax), 16 are Linux-only and skipped on Windows.

---

## Version history

| Version | Notes |
|---|---|
| 0.5.0 | Module is now Linux-only: `Storage.Linux.psm1` throws a descriptive error on Windows at load time. Both test files require Pester 5.2+. `Storage.Linux.Tests.ps1` skips all 503 tests on Windows (module cannot load). `Examples.Tests.ps1` no longer requires `Storage.Linux` via `#Requires`. |
| 0.4.0 | Added `Examples\` folder with 5 real-world scripts and `Examples.Tests.ps1` (31 Pester tests). README updated. |
| 0.3.0 | `FunctionsToExport` corrected to all 161 Windows Storage functions. All 10 aliases defined with `Set-Alias`. `Get-Disk` fixed: `lsblk --bytes` so `Size` is `[uint64]`. `Get-Volume` fixed: `[SWAP]` excluded. Pester tests expanded to 503. |
| 0.2.0 | `Get-Disk`, `Get-PhysicalDisk`, `Get-Partition`, `Get-Volume` fully implemented. Module manifest and root module added. All remaining cmdlets stubbed. |
| 0.1.0 | Initial scaffolding with Crescendo `lsblk` config and proxy function stubs. |

---

## License

GPL-3.0 — see [LICENSE](LICENSE).
