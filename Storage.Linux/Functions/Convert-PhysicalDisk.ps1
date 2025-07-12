Function Convert-PhysicalDisk {

[CmdletBinding(DefaultParameterSetName='ByFriendlyName')]
param(
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipeline=$true)]
    [Alias('Id')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByInputObject', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByInputObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Convert-PhysicalDisk.Format]
    ${Format},

    [Parameter(ParameterSetName='ByInputObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StoragePoolFriendlyName},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [Convert-PhysicalDisk.PoolVersion]
    ${StoragePoolVersion},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${StoragePoolMetadataLength},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${StoragePoolMinimumAllocationSize},

    [Parameter(ParameterSetName='ByInputObject', Mandatory=$true)]
    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${VirtualDiskFriendlyName},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [Convert-PhysicalDisk.ProvisioningType]
    ${VirtualDiskProvisioningType},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [ulong]
    ${VirtualDiskAllocationUnitSize},

    [Parameter(ParameterSetName='ByInputObject')]
    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [Convert-PhysicalDisk.ResiliencyType]
    ${VirtualDiskResiliencySettingName},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Convert-PhysicalDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Convert-PhysicalDisk
.ForwardHelpCategory Function

#>


}

