Function Set-FileIntegrity {

[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='Set1', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [string]
    ${FileName},

    [Parameter(ParameterSetName='Set1', Position=1)]
    [bool]
    ${Enable},

    [Parameter(ParameterSetName='Set1')]
    [bool]
    ${Enforce},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-FileIntegrity', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-FileIntegrity
.ForwardHelpCategory Function

#>


}

