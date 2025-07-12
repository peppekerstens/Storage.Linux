Function Add-PhysicalDisk {

[CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByStoragePool', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByVirtualDiskName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByVirtualDisk', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStoragePool', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_PhysicalDisk')]
    [ciminstance[]]
    ${PhysicalDisks},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.AddPhysicalDisk.Usage]
    ${Usage},

    [Parameter(ParameterSetName='ByStoragePoolFriendlyName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${StoragePoolFriendlyName},

    [Parameter(ParameterSetName='ByStoragePoolName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${StoragePoolName},

    [Parameter(ParameterSetName='ByStoragePoolUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${StoragePoolUniqueId},

    [Parameter(ParameterSetName='ByVirtualDisk', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${VirtualDiskFriendlyName},

    [Parameter(ParameterSetName='ByVirtualDiskName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${VirtualDiskName},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${VirtualDiskUniqueId},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId')]
    [Parameter(ParameterSetName='ByVirtualDiskName')]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId')]
    [Parameter(ParameterSetName='ByVirtualDiskName')]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId')]
    [Parameter(ParameterSetName='ByVirtualDiskName')]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStoragePoolUniqueId')]
    [Parameter(ParameterSetName='ByStoragePoolName')]
    [Parameter(ParameterSetName='ByStoragePoolFriendlyName')]
    [Parameter(ParameterSetName='ByStoragePool')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-PhysicalDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-PhysicalDisk
.ForwardHelpCategory Function

#>


}

