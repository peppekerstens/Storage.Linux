Function Show-StorageHistory {

[CmdletBinding()]
param(
    [Parameter(ParameterSetName='ByObjects', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [System.Collections.ArrayList]
    ${Objects},

    [Parameter(ParameterSetName='ByObjects')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Title},

    [Parameter(ParameterSetName='ByObjects')]
    [switch]
    ${DisplayAvgLatency},

    [Parameter(ParameterSetName='ByObjects')]
    [switch]
    ${DisplayMaxLatency})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Show-StorageHistory', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Show-StorageHistory
.ForwardHelpCategory Function

#>


}

