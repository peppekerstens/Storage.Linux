# Private helper: Get-LsBlkData
# Wraps lsblk --json with a caller-specified column set and optional --bytes flag.
# Returns the parsed blockdevices array. Not exported.
#
# This replaces the Crescendo-generated Get-LsBlk wrapper, which had incomplete
# parameter wiring. The hand-written version is simpler, testable, and correct.
#
# Usage:
#   Get-LsBlkData -Output 'NAME,SIZE,TYPE' -Bytes
#   Get-LsBlkData -Output 'NAME,FSTYPE,MOUNTPOINT'

function Get-LsBlkData {
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSObject[]])]
    param(
        [Parameter(Mandatory)]
        [string] $Output,

        [Parameter()]
        [switch] $Bytes,

        [Parameter()]
        [switch] $AllDevices
    )
    process {
        if (-not (Get-Command lsblk -ErrorAction SilentlyContinue)) {
            $ex = [System.InvalidOperationException]::new(
                "The 'lsblk' command was not found. Install util-linux: sudo apt-get install util-linux")
            $er = [System.Management.Automation.ErrorRecord]::new(
                $ex, 'Storage.Linux.LsBlkNotFound',
                [System.Management.Automation.ErrorCategory]::NotInstalled, $null)
            $PSCmdlet.ThrowTerminatingError($er)
        }

        $lsblkArgs = @('--json', '--output', $Output)
        if ($Bytes)      { $lsblkArgs += '--bytes' }
        if ($AllDevices) { $lsblkArgs += '--all' }

        $raw = & lsblk @lsblkArgs 2>&1
        if ($LASTEXITCODE -ne 0) {
            $ex = [System.InvalidOperationException]::new("lsblk failed: $raw")
            $er = [System.Management.Automation.ErrorRecord]::new(
                $ex, 'Storage.Linux.LsBlkFailed',
                [System.Management.Automation.ErrorCategory]::InvalidOperation, $null)
            $PSCmdlet.ThrowTerminatingError($er)
        }

        ($raw | ConvertFrom-Json).blockdevices
    }
}
