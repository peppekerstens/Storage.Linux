Function Debug-StorageSubSystem {

[CmdletBinding(DefaultParameterSetName='ByFriendlyName')]
param(
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [string[]]
    ${StorageSubSystemFriendlyName},

    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]
    ${StorageSubSystemUniqueId},

    [Parameter(ParameterSetName='ByName', Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]
    ${StorageSubSystemName},

    [Parameter(ParameterSetName='InputObject', Mandatory=$true, ValueFromPipeline=$true)]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageSubSystem')]
    [ciminstance]
    ${InputObject},

    [CimSession]
    ${CimSession},

    [int]
    ${ThrottleLimit},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Debug-StorageSubSystem', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Debug-StorageSubSystem
.ForwardHelpCategory Function

#>


}

