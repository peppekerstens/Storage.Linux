Function Enable-StorageMaintenanceMode {

[CmdletBinding()]
param(
    [Parameter(ParameterSetName='InputObject', Mandatory=$true, ValueFromPipeline=$true)]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageFaultDomain')]
    [ciminstance]
    ${InputObject},

    [switch]
    ${IgnoreDetachedVirtualDisks},

    [System.Nullable[bool]]
    ${ValidateVirtualDisksHealthy},

    [string]
    ${Model},

    [string]
    ${Manufacturer},

    [CimSession]
    ${CimSession},

    [System.Nullable[bool]]
    ${ValidateMaintenanceMode},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Enable-StorageMaintenanceMode', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Enable-StorageMaintenanceMode
.ForwardHelpCategory Function

#>


}

