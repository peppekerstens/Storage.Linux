Function Set-ResiliencySetting {

[CmdletBinding(DefaultParameterSetName='ByName', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByName', Mandatory=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='ByName', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_ResiliencySetting')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ushort]
    ${NumberOfDataCopiesDefault},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ushort]
    ${PhysicalDiskRedundancyDefault},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ushort]
    ${NumberOfColumnsDefault},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${AutoNumberOfColumns},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ulong]
    ${InterleaveDefault},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ushort]
    ${NumberOfGroupsDefault},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${PassThru})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-ResiliencySetting', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-ResiliencySetting
.ForwardHelpCategory Function

#>


}

