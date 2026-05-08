function Revoke-FileShareAccess {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Revoke-FileShareAccess on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/revoke-fileshareaccess
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Revoke-FileShareAccess is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Revoke-FileShareAccess @PSBoundParameters
}
