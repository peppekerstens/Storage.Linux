function Repair-Volume {
    <#
    .SYNOPSIS
        Checks and repairs a volume (filesystem). On Linux, uses 'fsck'.
    .DESCRIPTION
        Runs 'fsck' on the specified device. The filesystem should be unmounted
        before running fsck; running on a mounted filesystem may corrupt data.
        Requires sudo privileges.
    .PARAMETER DriveLetter
        Not supported on Linux. Emits a warning.
    .PARAMETER Path
        The device path to check (e.g. /dev/sdb1).
    .PARAMETER Scan
        When specified, performs a scan without fixing (fsck -n).
    .PARAMETER SpotFix
        When specified, fixes errors automatically (fsck -y). Default behaviour.
    .PARAMETER OfflineScanAndFix
        Ignored on Linux (no equivalent). Emits a warning.
    .LINK
        https://learn.microsoft.com/powershell/module/storage/repair-volume
    #>
    [CmdletBinding(SupportsShouldProcess = $true, DefaultParameterSetName = 'Path')]
    [OutputType([PSCustomObject])]
    param(
        [Parameter(ParameterSetName = 'DriveLetter')]
        [char]$DriveLetter,

        [Parameter(Mandatory = $true, Position = 0, ParameterSetName = 'Path')]
        [string]$Path,

        [Parameter()]
        [switch]$Scan,

        [Parameter()]
        [switch]$SpotFix,

        [Parameter()]
        [switch]$OfflineScanAndFix
    )
    process {
        if ($IsLinux) {
            if ($DriveLetter) {
                Write-Warning 'Repair-Volume: -DriveLetter is not supported on Linux.'
                return
            }
            if ($OfflineScanAndFix) {
                Write-Warning 'Repair-Volume: -OfflineScanAndFix is not supported on Linux. Running standard fsck.'
            }

            $fsckArgs = if ($Scan) { @('-n', $Path) } else { @('-y', $Path) }

            if ($PSCmdlet.ShouldProcess($Path, 'Run fsck')) {
                $output = & sudo fsck @fsckArgs 2>&1
                $exitCode = $LASTEXITCODE
                # fsck exit codes: 0=no errors, 1=errors corrected, 2=reboot needed, 4=uncorrected errors
                $healthStatus = switch ($exitCode) {
                    0 { 'Healthy' }
                    1 { 'Fixed' }
                    2 { 'RebootRequired' }
                    default { 'Failed' }
                }
                [PSCustomObject]@{
                    Path         = $Path
                    HealthStatus = $healthStatus
                    ExitCode     = $exitCode
                    Output       = $output -join "`n"
                }
            }
        } else {
            Storage\Repair-Volume @PSBoundParameters
        }
    }
}
