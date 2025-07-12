Function Set-VirtualDisk {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectProperties', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectAttributes', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${NewFriendlyName},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetVirtualDisk.Usage]
    ${Usage},

    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [string]
    ${OtherUsageDescription},

    [Parameter(ParameterSetName='ByUniqueIdProperties', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyNameProperties', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByNameProperties', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNameAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Name},

    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsManualAttach},

    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [string]
    ${StorageNodeName},

    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetVirtualDisk.Access]
    ${Access},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.ProvisioningType]
    ${ProvisioningType},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Set.FaultDomainType]
    ${FaultDomainAwareness},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Alias('FaultDomainRedundancy')]
    [ushort]
    ${PhysicalDiskRedundancy},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [ushort]
    ${NumberOfDataCopies},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [ulong]
    ${MaxIops},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [ulong]
    ${MaxIoBandwidth},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByNameProperties')]
    [Parameter(ParameterSetName='ByFriendlyNameProperties')]
    [Parameter(ParameterSetName='ByUniqueIdProperties')]
    [Parameter(ParameterSetName='ByObjectProperties')]
    [Parameter(ParameterSetName='ByNameAttributes')]
    [Parameter(ParameterSetName='ByFriendlyNameAttributes')]
    [Parameter(ParameterSetName='ByUniqueIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VirtualDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-VirtualDisk
.ForwardHelpCategory Function

#>


}

