Function Set-StoragePool {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectAttributes', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectDefaults', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${NewFriendlyName},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${ClearOnDeallocate},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${IsPowerProtected},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStoragePool.RepairPolicy]
    ${RepairPolicy},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStoragePool.RetireMissingPhysicalDisks]
    ${RetireMissingPhysicalDisks},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('NewUsage')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStoragePool.Usage]
    ${Usage},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('NewOtherUsageDescription')]
    [string]
    ${OtherUsageDescription},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [ushort[]]
    ${ThinProvisioningAlertThresholds},

    [Parameter(ParameterSetName='ByUniqueIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueIdDefaults', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByNameAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNameDefaults', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyNameDefaults', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStoragePool.ProvisioningType]
    ${ProvisioningTypeDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStoragePool.MediaType]
    ${MediaTypeDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [string]
    ${ResiliencySettingNameDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [bool]
    ${EnclosureAwareDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.FaultDomainType]
    ${FaultDomainAwarenessDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [ulong]
    ${WriteCacheSizeDefault},

    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [bool]
    ${AutoWriteCacheSize},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsReadOnly},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameDefaults')]
    [Parameter(ParameterSetName='ByNameDefaults')]
    [Parameter(ParameterSetName='ByUniqueIdDefaults')]
    [Parameter(ParameterSetName='ByObjectDefaults')]
    [Parameter(ParameterSetName='ByFriendlyName')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-StoragePool', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-StoragePool
.ForwardHelpCategory Function

#>


}

