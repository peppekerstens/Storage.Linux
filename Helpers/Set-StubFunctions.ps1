<#
.Synopsis
    Rewrites Storage.Linux proxy-function stubs so they:
    - On Linux: emit a Write-Warning that the cmdlet is not yet implemented.
    - On Windows: delegate to the original Storage module cmdlet.
    Skips files that already have a real implementation (Get-Disk, Get-Partition, Get-Volume, Get-PhysicalDisk).
#>

$functionsPath = "$PSScriptRoot\..\Storage.Linux\Functions"
$skip = @('Get-Disk.ps1','Get-Partition.ps1','Get-Volume.ps1','Get-PhysicalDisk.ps1')

$files = Get-ChildItem -Path $functionsPath -Filter '*.ps1' |
         Where-Object { $_.Name -notin $skip -and $_.Extension -eq '.ps1' }

foreach ($file in $files) {
    # Extract the function name from the file name
    $funcName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    # Use simple param() for stubs — complex param blocks from proxy functions are fragile
    $paramBlock = 'param()'

    $newContent = @"
function $funcName {
    <#
    .Synopsis
        Not yet implemented on Linux. Delegates to Storage\$funcName on Windows.
    .Notes
        This is a compatibility stub. On Linux a Write-Warning is emitted.
        Contributions welcome: https://github.com/peppekerstens/Storage.Linux
    .Link
        https://learn.microsoft.com/powershell/module/storage/$($funcName.ToLower())
    #>
    [CmdletBinding()]
    $paramBlock

    if (`$IsLinux) {
        Write-Warning "$funcName is not yet implemented in Storage.Linux. Contributions welcome: https://github.com/peppekerstens/Storage.Linux"
        return
    }

    # Windows: delegate to built-in Storage module
    Storage\$funcName @PSBoundParameters
}
"@

    Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
    Write-Host "UPDATED: $($file.Name)"
}

Write-Host "`nDone."
