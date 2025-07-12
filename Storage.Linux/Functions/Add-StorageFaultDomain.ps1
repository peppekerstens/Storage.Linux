Function Add-StorageFaultDomain {

[CmdletBinding()]
param(
    [Parameter(ParameterSetName='ByVirtualDisk', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualDiskFriendlyName},

    [Parameter(ParameterSetName='ByVirtualDiskName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualDiskName},

    [Parameter(ParameterSetName='ByVirtualDiskUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualDiskUniqueId},

    [Parameter(ParameterSetName='ByStorageTier', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageTier')]
    [ciminstance]
    ${StorageTier},

    [Parameter(ParameterSetName='ByStorageTierFriendlyName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageTierFriendlyName},

    [Parameter(ParameterSetName='ByStorageTierUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageTierUniqueId},

    [Parameter(ParameterSetName='ByStorageTierUniqueId')]
    [Parameter(ParameterSetName='ByStorageTierFriendlyName')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByVirtualDiskUniqueId')]
    [Parameter(ParameterSetName='ByVirtualDiskName')]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageFaultDomain')]
    [ciminstance[]]
    ${StorageFaultDomains},

    [Parameter(ParameterSetName='ByStorageTierUniqueId')]
    [Parameter(ParameterSetName='ByStorageTierFriendlyName')]
    [Parameter(ParameterSetName='ByStorageTier')]
    [Parameter(ParameterSetName='ByVirtualDiskUniqueId')]
    [Parameter(ParameterSetName='ByVirtualDiskName')]
    [Parameter(ParameterSetName='ByVirtualDiskFriendlyName')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [ValidateNotNullOrEmpty()]
    [string[]]
    ${StorageFaultDomainFriendlyNames},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-StorageFaultDomain', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-StorageFaultDomain
.ForwardHelpCategory Function

#>


}

