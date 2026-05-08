function Get-InitiatorPort {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Get-InitiatorPort on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/get-initiatorport
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Get-InitiatorPort is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Get-InitiatorPort @PSBoundParameters
}
