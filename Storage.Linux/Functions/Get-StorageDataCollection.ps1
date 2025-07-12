Function Get-StorageDataCollection {

[CmdletBinding()]
param(
    [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
    [ciminstance]
    ${PhysicalDisk},

    [Parameter(ParameterSetName='ByDeviceGuid', Mandatory=$true)]
    [Alias('DeviceId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DeviceGuid},

    [Parameter(ParameterSetName='ByDeviceNumber', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DeviceNumber},

    [Parameter(ParameterSetName='ByDeviceNumber', Mandatory=$true)]
    [Parameter(ParameterSetName='ByDeviceGuid', Mandatory=$true)]
    [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [Get-StorageDataCollection.StorageDataCollectionType]
    ${StorageDataCollectionType},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [ValidateNotNullOrEmpty()]
    [uint]
    ${Count},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [ValidateNotNullOrEmpty()]
    [switch]
    ${Oldest})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageDataCollection', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageDataCollection
.ForwardHelpCategory Function

#>


}

