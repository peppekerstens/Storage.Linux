# Storage.Linux

PowerShell 7.x module for Linux providing cmdlet parity with the Windows `Storage` module.

Part of the **Linux PowerShell Cmdlet Parity** project — inspired by Evgenij Smirnov's [2025 European PowerShell Summit session](https://www.youtube.com/watch?v=RlzinWYIjBY) and the blog series at [peppekerstens.github.io](https://peppekerstens.github.io/linux-command-wrapping-part-1/).

---

## What it does

On **Linux**, wraps native CLI tools (`lsblk`, `df`) to provide PowerShell cmdlets matching the Windows `Storage` module API as closely as possible.

On **Windows**, every exported function delegates transparently to the built-in `Storage` cmdlet — no behavioral change.

---

## Requirements

- PowerShell 7.2+
- Linux with `util-linux` installed (`lsblk` — available by default on Ubuntu/Debian)

---

## Installation

```powershell
# Clone or copy module to a PSModulePath location, then:
Import-Module Storage.Linux
```

---

## Usage

```powershell
# List all disks
Get-Disk

# Get a specific disk by number
Get-Disk -Number 0

# List all partitions
Get-Partition

# List all volumes with size info
Get-Volume

# List physical disks with media type
Get-PhysicalDisk
```

---

## Cmdlet Status

Legend:
- ✅ **Implemented** — full Linux implementation wrapping native CLI tools
- ⚠️ **Stub** — exported; emits `Write-Warning` on Linux, delegates to `Storage\<cmdlet>` on Windows
- ➖ **Not exported** — present in module scope as stub but not in `FunctionsToExport`; not intended for direct use
- 🔷 **Alias** — Windows alias only; not reproduced in this module (N/A on Linux)
- ❌ **N/A** — not applicable on Linux (Windows-only concept)

| Cmdlet | Status | Linux tool / Notes |
|---|:---:|---|
| **Get-Disk** | ✅ | `lsblk --json`; returns Number, FriendlyName, SerialNumber, Size, BusType, MediaType, PartitionStyle, LogicalSectorSize, PhysicalSectorSize |
| **Get-PhysicalDisk** | ✅ | `lsblk --json`; returns FriendlyName, SerialNumber, MediaType (HDD/SSD via `rota` flag), BusType, IsRemovable, OperationalStatus |
| **Get-Partition** | ✅ | `lsblk --json` children; returns DiskNumber, PartitionNumber, FileSystem, MountPoint, UniqueId, Path |
| **Get-Volume** | ✅ | `lsblk --json` + `df --block-size=1`; returns Path, FileSystem, FileSystemLabel, Size, SizeRemaining, UniqueId |
| **Get-LsBlk** | ✅ | Crescendo-generated wrapper for raw `lsblk --json` output |
| **Clear-Disk** | ⚠️ | Stub |
| **Format-Volume** | ⚠️ | Stub |
| **Get-DiskImage** | ⚠️ | Stub |
| **Get-FileShare** | ⚠️ | Stub |
| **Get-StoragePool** | ⚠️ | Stub |
| **Get-StorageSubSystem** | ⚠️ | Stub |
| **Get-VirtualDisk** | ⚠️ | Stub |
| **Initialize-Disk** | ⚠️ | Stub |
| **Mount-DiskImage** | ⚠️ | Stub |
| **New-Partition** | ⚠️ | Stub |
| **New-Volume** | ⚠️ | Stub |
| **Optimize-Volume** | ⚠️ | Stub |
| **Remove-Partition** | ⚠️ | Stub |
| **Repair-Volume** | ⚠️ | Stub |
| **Resize-Partition** | ⚠️ | Stub |
| **Set-Disk** | ⚠️ | Stub |
| **Set-Partition** | ⚠️ | Stub |
| **Set-Volume** | ⚠️ | Stub |
| Add-InitiatorIdToMaskingSet | ➖ | Stub (iSCSI/SAN — unlikely to be needed on Linux) |
| Add-PartitionAccessPath | ➖ | Stub |
| Add-PhysicalDisk | ➖ | Stub |
| Add-StorageFaultDomain | ➖ | Stub |
| Add-TargetPortToMaskingSet | ➖ | Stub |
| Add-VirtualDiskToMaskingSet | ➖ | Stub |
| Block-FileShareAccess | ➖ | Stub |
| Clear-FileStorageTier | ➖ | Stub |
| Clear-StorageDiagnosticInfo | ➖ | Stub |
| Connect-VirtualDisk | ➖ | Stub |
| Convert-PhysicalDisk | ➖ | Stub |
| Debug-FileShare | ➖ | Stub |
| Debug-StorageSubSystem | ➖ | Stub |
| Debug-Volume | ➖ | Stub |
| Disable-PhysicalDiskIdentification | ➖ | Stub |
| Disable-StorageDataCollection | ➖ | Stub |
| Disable-StorageEnclosureIdentification | ➖ | Stub |
| Disable-StorageEnclosurePower | ➖ | Stub |
| Disable-StorageHighAvailability | ➖ | Stub |
| Disable-StorageMaintenanceMode | ➖ | Stub |
| Disconnect-VirtualDisk | ➖ | Stub |
| Dismount-DiskImage | ➖ | Stub |
| Enable-PhysicalDiskIdentification | ➖ | Stub |
| Enable-StorageDataCollection | ➖ | Stub |
| Enable-StorageEnclosureIdentification | ➖ | Stub |
| Enable-StorageEnclosurePower | ➖ | Stub |
| Enable-StorageHighAvailability | ➖ | Stub |
| Enable-StorageMaintenanceMode | ➖ | Stub |
| Get-DedupProperties | ➖ | Stub |
| Get-DiskStorageNodeView | ➖ | Stub |
| Get-FileIntegrity | ➖ | Stub |
| Get-FileShareAccessControlEntry | ➖ | Stub |
| Get-FileStorageTier | ➖ | Stub |
| Get-InitiatorId | ➖ | Stub |
| Get-InitiatorPort | ➖ | Stub |
| Get-MaskingSet | ➖ | Stub |
| Get-OffloadDataTransferSetting | ➖ | Stub |
| Get-PartitionSupportedSize | ➖ | Stub |
| Get-PhysicalDiskStorageNodeView | ➖ | Stub |
| Get-PhysicalExtent | ➖ | Stub |
| Get-PhysicalExtentAssociation | ➖ | Stub |
| Get-ResiliencySetting | ➖ | Stub |
| Get-StorageAdvancedProperty | ➖ | Stub |
| Get-StorageChassis | ➖ | Stub |
| Get-StorageDataCollection | ➖ | Stub |
| Get-StorageDiagnosticInfo | ➖ | Stub |
| Get-StorageEnclosure | ➖ | Stub |
| Get-StorageEnclosureStorageNodeView | ➖ | Stub |
| Get-StorageEnclosureVendorData | ➖ | Stub |
| Get-StorageExtendedStatus | ➖ | Stub |
| Get-StorageFaultDomain | ➖ | Stub |
| Get-StorageFileServer | ➖ | Stub |
| Get-StorageFirmwareInformation | ➖ | Stub |
| Get-StorageHealthAction | ➖ | Stub |
| Get-StorageHealthReport | ➖ | Stub |
| Get-StorageHealthSetting | ➖ | Stub |
| Get-StorageHistory | ➖ | Stub |
| Get-StorageJob | ➖ | Stub |
| Get-StorageNode | ➖ | Stub |
| Get-StorageProvider | ➖ | Stub |
| Get-StorageRack | ➖ | Stub |
| Get-StorageReliabilityCounter | ➖ | Stub |
| Get-StorageScaleUnit | ➖ | Stub |
| Get-StorageSetting | ➖ | Stub |
| Get-StorageSite | ➖ | Stub |
| Get-StorageTier | ➖ | Stub |
| Get-StorageTierSupportedSize | ➖ | Stub |
| Get-SupportedClusterSizes | ➖ | Stub |
| Get-SupportedFileSystems | ➖ | Stub |
| Get-TargetPort | ➖ | Stub |
| Get-TargetPortal | ➖ | Stub |
| Get-VirtualDiskSupportedSize | ➖ | Stub |
| Get-VolumeCorruptionCount | ➖ | Stub |
| Get-VolumeScrubPolicy | ➖ | Stub |
| Grant-FileShareAccess | ➖ | Stub |
| Hide-VirtualDisk | ➖ | Stub |
| New-FileShare | ➖ | Stub |
| New-MaskingSet | ➖ | Stub |
| New-StorageFileServer | ➖ | Stub |
| New-StoragePool | ➖ | Stub |
| New-StorageSubsystemVirtualDisk | ➖ | Stub |
| New-StorageTier | ➖ | Stub |
| New-VirtualDisk | ➖ | Stub |
| New-VirtualDiskClone | ➖ | Stub |
| New-VirtualDiskSnapshot | ➖ | Stub |
| Optimize-StoragePool | ➖ | Stub |
| Register-StorageSubsystem | ➖ | Stub |
| Remove-FileShare | ➖ | Stub |
| Remove-InitiatorId | ➖ | Stub |
| Remove-InitiatorIdFromMaskingSet | ➖ | Stub |
| Remove-MaskingSet | ➖ | Stub |
| Remove-PartitionAccessPath | ➖ | Stub |
| Remove-PhysicalDisk | ➖ | Stub |
| Remove-StorageFaultDomain | ➖ | Stub |
| Remove-StorageFileServer | ➖ | Stub |
| Remove-StorageHealthIntent | ➖ | Stub |
| Remove-StorageHealthSetting | ➖ | Stub |
| Remove-StoragePool | ➖ | Stub |
| Remove-StorageTier | ➖ | Stub |
| Remove-TargetPortFromMaskingSet | ➖ | Stub |
| Remove-VirtualDisk | ➖ | Stub |
| Remove-VirtualDiskFromMaskingSet | ➖ | Stub |
| Rename-MaskingSet | ➖ | Stub |
| Repair-FileIntegrity | ➖ | Stub |
| Repair-VirtualDisk | ➖ | Stub |
| Reset-PhysicalDisk | ➖ | Stub |
| Reset-StorageReliabilityCounter | ➖ | Stub |
| Resize-StorageTier | ➖ | Stub |
| Resize-VirtualDisk | ➖ | Stub |
| Revoke-FileShareAccess | ➖ | Stub |
| Save-StorageDataCollection | ➖ | Stub |
| Set-FileIntegrity | ➖ | Stub |
| Set-FileShare | ➖ | Stub |
| Set-FileStorageTier | ➖ | Stub |
| Set-InitiatorPort | ➖ | Stub |
| Set-PhysicalDisk | ➖ | Stub |
| Set-ResiliencySetting | ➖ | Stub |
| Set-StorageFileServer | ➖ | Stub |
| Set-StorageHealthSetting | ➖ | Stub |
| Set-StoragePool | ➖ | Stub |
| Set-StorageProvider | ➖ | Stub |
| Set-StorageSetting | ➖ | Stub |
| Set-StorageSubSystem | ➖ | Stub |
| Set-StorageTier | ➖ | Stub |
| Set-VirtualDisk | ➖ | Stub |
| Set-VolumeScrubPolicy | ➖ | Stub |
| Show-StorageHistory | ➖ | Stub |
| Show-VirtualDisk | ➖ | Stub |
| Start-StorageDiagnosticLog | ➖ | Stub |
| Stop-StorageDiagnosticLog | ➖ | Stub |
| Stop-StorageJob | ➖ | Stub |
| Unblock-FileShareAccess | ➖ | Stub |
| Unregister-StorageSubsystem | ➖ | Stub |
| Update-Disk | ➖ | Stub |
| Update-HostStorageCache | ➖ | Stub |
| Update-StorageFirmware | ➖ | Stub |
| Update-StoragePool | ➖ | Stub |
| Update-StorageProviderCache | ➖ | Stub |
| Write-VolumeCache | ➖ | Stub |
| Disable-PhysicalDiskIndication | 🔷 | Windows alias only |
| Disable-StorageDiagnosticLog | 🔷 | Windows alias only |
| Enable-PhysicalDiskIndication | 🔷 | Windows alias only |
| Enable-StorageDiagnosticLog | 🔷 | Windows alias only |
| Flush-Volume | 🔷 | Windows alias only |
| Get-DiskSNV | 🔷 | Windows alias only |
| Get-PhysicalDiskSNV | 🔷 | Windows alias only |
| Get-StorageEnclosureSNV | 🔷 | Windows alias only |
| Initialize-Volume | 🔷 | Windows alias only |
| Write-FileSystemCache | 🔷 | Windows alias only |

---

## Implementation notes

- `lsblk --json` column names use hyphens (e.g. `log-sec`, `phy-sec`) — accessed as `$d.'log-sec'` in PowerShell.
- `df --output=target,size,used,avail,fstype --block-size=1` gives byte-level accuracy for `Size` and `SizeRemaining`.
- Media type (HDD vs SSD) is inferred from `lsblk`'s `rota` field (1 = rotational = HDD, 0 = SSD).
- All stub functions emit `Write-Warning` on Linux and delegate to `Storage\<cmdlet>` on Windows via `@PSBoundParameters`.

---

## Module version history

| Version | Notes |
|---|---|
| 0.2.0 | `Get-Disk`, `Get-PhysicalDisk`, `Get-Partition`, `Get-Volume`: full Linux implementations via `lsblk`/`df`. Module manifest (`.psd1`) and root module (`.psm1`) added. Pester tests added. All 148 remaining cmdlets have Linux-warning stubs. |
| 0.1.0 | Initial scaffolding with Crescendo `lsblk` config and proxy function stubs. |

---

## License

GPL-3.0 — see [LICENSE](LICENSE).
