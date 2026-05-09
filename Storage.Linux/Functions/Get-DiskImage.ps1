function Get-DiskImage {
    <#
    .SYNOPSIS
        Gets disk image (loop device) information. On Linux, wraps 'losetup -l --json'.
    .PARAMETER ImagePath
        Filter by image file path.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/get-diskimage
    #>
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [string[]]$ImagePath
    )
    process {
        if ($IsLinux) {
            $raw = & losetup -l --json 2>&1
            if ($LASTEXITCODE -ne 0) {
                Write-Error "losetup failed: $raw"
                return
            }
            $data = ($raw | ConvertFrom-Json).loopdevices
            if (-not $data) { $data = @() }
            $results = @(foreach ($dev in $data) {
                [PSCustomObject]@{
                    ImagePath     = $dev.'back-file'
                    DevicePath    = $dev.name
                    Size          = $dev.'sizelimit'
                    BlockSize     = 512
                    LogicalSectorSize = 512
                    PhysicalSectorSize = 512
                    Attached      = $true
                }
            })
            if ($ImagePath) {
                $results = $results | Where-Object { $_.ImagePath -in $ImagePath }
            }
            $results
        } else {
            Storage\Get-DiskImage @PSBoundParameters
        }
    }
}
