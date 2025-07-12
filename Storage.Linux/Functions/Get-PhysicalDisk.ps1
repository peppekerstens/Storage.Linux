Function Get-PhysicalDisk {

[CmdletBinding(DefaultParameterSetName='ByUniqueId')]
param(
    [Parameter(ParameterSetName='ByUniqueId', ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByObjectId', ValueFromPipeline=$true)]
    [Alias('PhysicalDiskObjectId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ObjectId},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DeviceNumber},

    [Parameter(ParameterSetName='ByName', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByName', Position=1, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${SerialNumber},

    [Parameter(ParameterSetName='ByInputObject', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
    [ciminstance]
    ${InputObject},

    [Parameter(ParameterSetName='ByStorageSubsystem', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageSubsystem')]
    [ciminstance]
    ${StorageSubsystem},

    [Parameter(ParameterSetName='ByStorageEnclosure', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageEnclosure')]
    [ciminstance]
    ${StorageEnclosure},

    [Parameter(ParameterSetName='ByStorageScaleUnit', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageScaleUnit')]
    [ciminstance]
    ${StorageScaleUnit},

    [Parameter(ParameterSetName='ByStorageChassis', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageChassis')]
    [ciminstance]
    ${StorageChassis},

    [Parameter(ParameterSetName='ByStorageRack', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageRack')]
    [ciminstance]
    ${StorageRack},

    [Parameter(ParameterSetName='ByStorageSite', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageSite')]
    [ciminstance]
    ${StorageSite},

    [Parameter(ParameterSetName='ByStorageNode', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageNode')]
    [ciminstance]
    ${StorageNode},

    [Parameter(ParameterSetName='ByStoragePool', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='ByVirtualDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [ulong]
    ${VirtualRangeMin},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [ulong]
    ${VirtualRangeMax},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [bool]
    ${HasAllocations},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [bool]
    ${SelectedForUse},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [switch]
    ${NoRedundancy},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [switch]
    ${HasMetadata},

    [Parameter(ParameterSetName='ByStorageNode')]
    [switch]
    ${PhysicallyConnected},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Get-PhysicalDisk.PhysicalDiskUsage]
    ${Usage},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Description},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Manufacturer},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${Model},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [bool]
    ${CanPool},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSite')]
    [Parameter(ParameterSetName='ByStorageRack')]
    [Parameter(ParameterSetName='ByStorageChassis')]
    [Parameter(ParameterSetName='ByStorageScaleUnit')]
    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Get-PhysicalDisk.PhysicalDiskHealthStatus]
    ${HealthStatus},

    [CimSession]
    ${CimSession})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-PhysicalDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-PhysicalDisk
.ForwardHelpCategory Function

#>


}

