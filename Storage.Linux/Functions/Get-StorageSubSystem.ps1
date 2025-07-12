Function Get-StorageSubSystem {

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

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.StorageSubSystem.HealthStatus[]]
    ${HealthStatus},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [string[]]
    ${Manufacturer},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNull()]
    [string[]]
    ${Model},

    [Parameter(ParameterSetName='ByStorageProvider', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageProvider')]
    [ciminstance]
    ${StorageProvider},

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

    [Parameter(ParameterSetName='ByVirtualDisk', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByMaskingSet', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_MaskingSet')]
    [ciminstance]
    ${MaskingSet},

    [Parameter(ParameterSetName='ByTargetPort', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_TargetPort')]
    [ciminstance]
    ${TargetPort},

    [Parameter(ParameterSetName='ByTargetPortal', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_TargetPortal')]
    [ciminstance]
    ${TargetPortal},

    [Parameter(ParameterSetName='ByInitiatorId', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_InitiatorId')]
    [ciminstance]
    ${InitiatorId},

    [Parameter(ParameterSetName='ByOffloadDataTransferSetting', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_OffloadDataTransferSetting')]
    [ciminstance]
    ${OffloadDataTransferSetting},

    [Parameter(ParameterSetName='ByDisk', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance]
    ${Disk},

    [Parameter(ParameterSetName='ByPartition', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Partition')]
    [ciminstance]
    ${Partition},

    [Parameter(ParameterSetName='ByVolume', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Volume')]
    [ciminstance]
    ${Volume},

    [Parameter(ParameterSetName='ByFileServer', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_FileServer')]
    [ciminstance]
    ${FileServer},

    [Parameter(ParameterSetName='ByStorageFaultDomain', ValueFromPipeline=$true)]
    [Alias('PhysicalDisk','StorageEnclosure','StorageScaleUnit','StorageChassis','StorageRack','StorageSite')]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageFaultDomain')]
    [ciminstance]
    ${StorageFaultDomain},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByFileServer')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByOffloadDataTransferSetting')]
    [Parameter(ParameterSetName='ByInitiatorId')]
    [Parameter(ParameterSetName='ByTargetPortal')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByMaskingSet')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageProvider')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageSubSystem', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageSubSystem
.ForwardHelpCategory Function

#>


}

