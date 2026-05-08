function Show-VirtualDisk {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Show-VirtualDisk on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/show-virtualdisk
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Show-VirtualDisk is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Show-VirtualDisk @PSBoundParameters
}
