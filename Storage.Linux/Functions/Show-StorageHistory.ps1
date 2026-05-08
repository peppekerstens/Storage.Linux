function Show-StorageHistory {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Show-StorageHistory on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/show-storagehistory
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Show-StorageHistory is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Show-StorageHistory @PSBoundParameters
}
