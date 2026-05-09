function Dismount-DiskImage {
    <#
    .SYNOPSIS
        Dismounts (detaches) a disk image loop device. On Linux, uses 'losetup -d'.
    .PARAMETER ImagePath
        The path to the image file to detach.
    .PARAMETER DevicePath
        The loop device path to detach (e.g. /dev/loop0). Alternative to -ImagePath.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/dismount-diskimage
    #>
    [CmdletBinding(SupportsShouldProcess = $true, DefaultParameterSetName = 'ImagePath')]
    param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true, ParameterSetName = 'ImagePath')]
        [string]$ImagePath,

        [Parameter(Mandatory = $true, ParameterSetName = 'DevicePath')]
        [string]$DevicePath
    )
    process {
        if ($IsLinux) {
            if ($PSCmdlet.ParameterSetName -eq 'ImagePath') {
                if ($WhatIfPreference) {
                    # Skip losetup lookup under -WhatIf; use ImagePath as stand-in target
                    $null = $PSCmdlet.ShouldProcess($ImagePath, 'Detach loop device')
                    return
                }
                # Find the loop device for this image
                $raw = & losetup -j $ImagePath --json 2>&1
                if ($LASTEXITCODE -ne 0 -or -not $raw) {
                    Write-Error "Dismount-DiskImage: '$ImagePath' is not attached as a loop device."
                    return
                }
                $devs = ($raw | ConvertFrom-Json).loopdevices
                if (-not $devs) {
                    Write-Error "Dismount-DiskImage: '$ImagePath' is not attached as a loop device."
                    return
                }
                $DevicePath = $devs[0].name
            }

            if ($PSCmdlet.ShouldProcess($DevicePath, 'Detach loop device')) {
                $result = & sudo losetup -d $DevicePath 2>&1
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "Dismount-DiskImage: losetup -d failed: $result"
                }
            }
        } else {
            Storage\Dismount-DiskImage @PSBoundParameters
        }
    }
}
