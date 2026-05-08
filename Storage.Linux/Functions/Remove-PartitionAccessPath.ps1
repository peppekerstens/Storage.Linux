function Remove-PartitionAccessPath {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\Remove-PartitionAccessPath on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/remove-partitionaccesspath
    #>
    [CmdletBinding()]
    param()

    if ($IsLinux) {
        Write-Warning "Remove-PartitionAccessPath is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\Remove-PartitionAccessPath @PSBoundParameters
}
