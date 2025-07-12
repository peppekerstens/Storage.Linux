Function Set-Volume {

[CmdletBinding(DefaultParameterSetName='ByDriveLetterSetLabel', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectSetDedup', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectSetLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByDriveLetterSetLabel')]
    [Parameter(ParameterSetName='ByLabelSetLabel')]
    [Parameter(ParameterSetName='ByPathSetLabel')]
    [Parameter(ParameterSetName='ByUniqueIdSetLabel')]
    [Parameter(ParameterSetName='ByObjectSetLabel')]
    [Alias('NewFriendlyName')]
    [string]
    ${NewFileSystemLabel},

    [Parameter(ParameterSetName='ByUniqueIdSetDedup', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByUniqueIdSetLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByPathSetDedup', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByPathSetLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${Path},

    [Parameter(ParameterSetName='ByLabelSetDedup', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByLabelSetLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [Alias('FriendlyName')]
    [string]
    ${FileSystemLabel},

    [Parameter(ParameterSetName='ByDriveLetterSetDedup', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByDriveLetterSetLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [char]
    ${DriveLetter},

    [Parameter(ParameterSetName='ByDriveLetterSetDedup')]
    [Parameter(ParameterSetName='ByLabelSetDedup')]
    [Parameter(ParameterSetName='ByPathSetDedup')]
    [Parameter(ParameterSetName='ByUniqueIdSetDedup')]
    [Parameter(ParameterSetName='ByObjectSetDedup')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetVolume.DedupMode]
    ${DedupMode},

    [Parameter(ParameterSetName='ByDriveLetterSetDedup')]
    [Parameter(ParameterSetName='ByLabelSetDedup')]
    [Parameter(ParameterSetName='ByPathSetDedup')]
    [Parameter(ParameterSetName='ByUniqueIdSetDedup')]
    [Parameter(ParameterSetName='ByObjectSetDedup')]
    [Parameter(ParameterSetName='ByDriveLetterSetLabel')]
    [Parameter(ParameterSetName='ByLabelSetLabel')]
    [Parameter(ParameterSetName='ByPathSetLabel')]
    [Parameter(ParameterSetName='ByUniqueIdSetLabel')]
    [Parameter(ParameterSetName='ByObjectSetLabel')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByDriveLetterSetDedup')]
    [Parameter(ParameterSetName='ByLabelSetDedup')]
    [Parameter(ParameterSetName='ByPathSetDedup')]
    [Parameter(ParameterSetName='ByUniqueIdSetDedup')]
    [Parameter(ParameterSetName='ByObjectSetDedup')]
    [Parameter(ParameterSetName='ByDriveLetterSetLabel')]
    [Parameter(ParameterSetName='ByLabelSetLabel')]
    [Parameter(ParameterSetName='ByPathSetLabel')]
    [Parameter(ParameterSetName='ByUniqueIdSetLabel')]
    [Parameter(ParameterSetName='ByObjectSetLabel')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByDriveLetterSetDedup')]
    [Parameter(ParameterSetName='ByLabelSetDedup')]
    [Parameter(ParameterSetName='ByPathSetDedup')]
    [Parameter(ParameterSetName='ByUniqueIdSetDedup')]
    [Parameter(ParameterSetName='ByObjectSetDedup')]
    [Parameter(ParameterSetName='ByDriveLetterSetLabel')]
    [Parameter(ParameterSetName='ByLabelSetLabel')]
    [Parameter(ParameterSetName='ByPathSetLabel')]
    [Parameter(ParameterSetName='ByUniqueIdSetLabel')]
    [Parameter(ParameterSetName='ByObjectSetLabel')]
    [switch]
    ${AsJob})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-Volume', [System.Management.Automation.CommandTypes]::Function)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }

        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}

clean
{
    if ($null -ne $steppablePipeline) {
        $steppablePipeline.Clean()
    }
}
<#

.ForwardHelpTargetName Set-Volume
.ForwardHelpCategory Function

#>


}

