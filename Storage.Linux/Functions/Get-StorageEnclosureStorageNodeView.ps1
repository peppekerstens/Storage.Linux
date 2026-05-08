function Get-StorageEnclosureStorageNodeView {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Get-StorageEnclosureStorageNodeView on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-storageenclosurestoragenodeview
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Get-StorageEnclosureStorageNodeView is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Get-StorageEnclosureStorageNodeView @PSBoundParameters
}
