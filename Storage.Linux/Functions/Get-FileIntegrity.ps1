Function Get-FileIntegrity {

[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Get0', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [string]
    ${FileName},

    [Parameter(ParameterSetName='Get0')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Get0')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='Get0')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-FileIntegrity', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-FileIntegrity
.ForwardHelpCategory Function

#>


}

