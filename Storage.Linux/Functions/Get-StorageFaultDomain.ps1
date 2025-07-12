Function Get-StorageFaultDomain {

[CmdletBinding(DefaultParameterSetName='EnumerateFaultDomains')]
param(
    [Parameter(ParameterSetName='ByStorageSubsystem', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageSubsystem')]
    [ciminstance]
    ${StorageSubsystem},

    [Parameter(ParameterSetName='ByStorageFaultDomain', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageFaultDomain')]
    [ciminstance]
    ${StorageFaultDomain},

    [Parameter(ParameterSetName='ByVirtualDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='EnumerateFaultDomains')]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='EnumerateFaultDomains')]
    [string]
    ${SerialNumber},

    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='EnumerateFaultDomains')]
    [Get-StorageFaultDomain.StorageFaultDomainType]
    ${Type},

    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByStorageFaultDomain')]
    [Parameter(ParameterSetName='ByStorageSubsystem')]
    [Parameter(ParameterSetName='EnumerateFaultDomains')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${PhysicalLocation},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageFaultDomain', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageFaultDomain
.ForwardHelpCategory Function

#>


}

