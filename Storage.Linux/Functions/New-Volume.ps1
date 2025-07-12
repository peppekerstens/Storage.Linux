Function New-Volume {

[CmdletBinding(DefaultParameterSetName='ByStoragePool')]
param(
    [Parameter(ParameterSetName='ByStoragePool', Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='ByStoragePoolFriendlyName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StoragePoolFriendlyName},

    [Parameter(ParameterSetName='ByStoragePoolName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StoragePoolName},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StoragePoolUniqueId},

    [Parameter(ParameterSetName='ByDisk', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_Disk')]
    [ciminstance]
    ${Disk},

    [Parameter(ParameterSetName='ByDiskNumber', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [uint]
    ${DiskNumber},

    [Parameter(ParameterSetName='ByDiskPath', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DiskPath},

    [Parameter(ParameterSetName='ByDiskUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DiskUniqueId},

    [Parameter(ParameterSetName='ByDiskUniqueId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByDiskPath', Mandatory=$true)]
    [Parameter(ParameterSetName='ByDiskNumber', Mandatory=$true)]
    [Parameter(ParameterSetName='ByDisk', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePool', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [New-Volume.FileSystemType]
    ${FileSystem},

    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${AccessPath},

    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [char]
    ${DriveLetter},

    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [uint]
    ${AllocationUnitSize},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${Size},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${ResiliencySettingName},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [New-Volume.ProvisioningType]
    ${ProvisioningType},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [New-Volume.MediaType]
    ${MediaType},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Alias('FaultDomainRedundancy')]
    [ValidateNotNullOrEmpty()]
    [ushort]
    ${PhysicalDiskRedundancy},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ushort]
    ${NumberOfDataCopies},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ushort]
    ${NumberOfColumns},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ushort]
    ${NumberOfGroups},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ushort]
    ${MinimumLogicalDataCopies},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageFaultDomain')]
    [ciminstance[]]
    ${StorageFaultDomainsToUse},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${StorageFaultDomainsToUseFriendlyNames},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageTier')]
    [ciminstance[]]
    ${StorageTiers},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${StorageTierFriendlyNames},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ulong[]]
    ${StorageTierSizes},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${WriteCacheSize},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${WriteCacheReserveSize},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${ReadCacheSize},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [ValidateNotNullOrEmpty()]
    [bool]
    ${TrackValidData},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [switch]
    ${UseMaximumSize},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('New-Volume', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName New-Volume
.ForwardHelpCategory Function

#>


}

