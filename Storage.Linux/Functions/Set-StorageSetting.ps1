Function Set-StorageSetting {

[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Set1')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.StorageSetting.NewDiskPolicy]
    ${NewDiskPolicy},

    [Parameter(ParameterSetName='Set1')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.StorageSetting.ScrubPolicy]
    ${ScrubPolicy},

    [Parameter(ParameterSetName='Set1')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Set1')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='Set1')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-StorageSetting', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-StorageSetting
.ForwardHelpCategory Function

#>


}

