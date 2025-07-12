Function Set-FileShare {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${Description},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${EncryptData},

    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-FileShare', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-FileShare
.ForwardHelpCategory Function

#>


}

