Function Set-StorageSubSystem {

[CmdletBinding(DefaultParameterSetName='ByUniqueIdDescription', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectSetAttributes', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectDescription', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${Description},

    [Parameter(ParameterSetName='ByUniqueIdSetAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueIdDescription', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyNameDescription', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByNameSetAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNameDescription', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [bool]
    ${AutomaticClusteringEnabled},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [Alias('VirtualDiskRepairPriority')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetStorageSubsystem.RepairPriority]
    ${VirtualDiskRepairQueueDepth},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.FaultDomainType]
    ${FaultDomainAwarenessDefault},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [Parameter(ParameterSetName='ByNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [Parameter(ParameterSetName='ByNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByObjectDescription')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByNameSetAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameSetAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdSetAttributes')]
    [Parameter(ParameterSetName='ByObjectSetAttributes')]
    [Parameter(ParameterSetName='ByNameDescription')]
    [Parameter(ParameterSetName='ByFriendlyNameDescription')]
    [Parameter(ParameterSetName='ByUniqueIdDescription')]
    [Parameter(ParameterSetName='ByObjectDescription')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-StorageSubSystem', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-StorageSubSystem
.ForwardHelpCategory Function

#>


}

