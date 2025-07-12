Function Get-VirtualDisk {

[CmdletBinding(DefaultParameterSetName='ByFriendlyName', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyName', Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Name},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.VirtualDisk.Usage[]]
    ${Usage},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [string[]]
    ${OtherUsageDescription},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [bool[]]
    ${IsSnapshot},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.VirtualDisk.HealthStatus[]]
    ${HealthStatus},

    [Parameter(ParameterSetName='ByStorageSubSystem', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageSubSystem')]
    [ciminstance]
    ${StorageSubSystem},

    [Parameter(ParameterSetName='ByStorageNode', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageNode')]
    [ciminstance]
    ${StorageNode},

    [Parameter(ParameterSetName='ByStoragePool', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='ByPhysicalDisk', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_PhysicalDisk')]
    [ciminstance]
    ${PhysicalDisk},

    [Parameter(ParameterSetName='ByStorageEnclosure', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageEnclosure')]
    [ciminstance]
    ${StorageEnclosure},

    [Parameter(ParameterSetName='ByStorageScaleUnit', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageScaleUnit')]
    [ciminstance]
    ${StorageScaleUnit},

    [Parameter(ParameterSetName='ByStorageChassis', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageChassis')]
    [ciminstance]
    ${StorageChassis},

    [Parameter(ParameterSetName='ByStorageRack', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageRack')]
    [ciminstance]
    ${StorageRack},

    [Parameter(ParameterSetName='ByStorageTier', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageTier')]
    [ciminstance]
    ${StorageTier},

    [Parameter(ParameterSetName='ByDisk', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance]
    ${Disk},

    [Parameter(ParameterSetName='ByInitiatorPort', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_InitiatorPort')]
    [ciminstance]
    ${InitiatorPort},

    [Parameter(ParameterSetName='ByMaskingSet', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_MaskingSet')]
    [ciminstance]
    ${MaskingSet},

    [Parameter(ParameterSetName='ByInitiatorId', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_InitiatorId')]
    [ciminstance]
    ${InitiatorId},

    [Parameter(ParameterSetName='ByTargetPort', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_TargetPort')]
    [ciminstance]
    ${TargetPort},

    [Parameter(ParameterSetName='BySourceVirtualDisk', ValueFromPipeline=$true)]
    [Alias('VirtualDisk')]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_VirtualDisk')]
    [ciminstance]
    ${SourceVirtualDisk},

    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_VirtualDisk')]
    [ciminstance]
    ${TargetVirtualDisk},

    [Parameter(ParameterSetName='ByStorageJob', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageJob')]
    [ciminstance]
    ${StorageJob},

    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [ulong]
    ${PhysicalRangeMin},

    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [ulong]
    ${PhysicalRangeMax},

    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [switch]
    ${NoRedundancy},

    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [switch]
    ${AssociatedObjects},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByTargetVirtualDisk')]
    [Parameter(ParameterSetName='BySourceVirtualDisk')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByInitiatorPort')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VirtualDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VirtualDisk
.ForwardHelpCategory Function

#>


}

