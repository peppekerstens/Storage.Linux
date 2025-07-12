Function Set-StorageTier {

[CmdletBinding(DefaultParameterSetName='ByUniqueIdNewFriendlyName', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectDescription', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectAttributes', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectNewFriendlyName', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByFriendlyNameNewFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueIdNewFriendlyName')]
    [Parameter(ParameterSetName='ByObjectNewFriendlyName')]
    [string]
    ${NewFriendlyName},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.ProvisioningType]
    ${ProvisioningType},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ulong]
    ${AllocationUnitSize},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStorageTier.MediaType]
    ${MediaType},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.FaultDomainType]
    ${FaultDomainAwareness},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.FaultDomainType]
    ${ColumnIsolation},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${ResiliencySettingName},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.StorageTierUsage]
    ${Usage},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Alias('FaultDomainRedundancy')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ushort]
    ${PhysicalDiskRedundancy},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ushort]
    ${NumberOfDataCopies},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ushort]
    ${NumberOfGroups},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ushort]
    ${NumberOfColumns},

    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ulong]
    ${Interleave},

    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [string]
    ${Description},

    [Parameter(ParameterSetName='ByUniqueIdDescription', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueIdNewFriendlyName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyNameDescription', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyNameNewFriendlyName', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameNewFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdNewFriendlyName')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByObjectNewFriendlyName')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameNewFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdNewFriendlyName')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByObjectNewFriendlyName')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameNewFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdNewFriendlyName')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByObjectNewFriendlyName')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-StorageTier', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-StorageTier
.ForwardHelpCategory Function

#>


}

