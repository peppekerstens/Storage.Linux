Function Update-StorageFirmware {

[CmdletBinding(DefaultParameterSetName='ByPhysicalDiskFriendlyName')]
param(
    [Parameter(ParameterSetName='ByPhysicalDiskUniqueId', Mandatory=$true, ValueFromPipeline=$true)]
    [Alias('PhysicalDiskUniqueId','Id')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByPhysicalDiskFriendlyName', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [Alias('PhysicalDiskFriendlyName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [Alias('PhysicalDisk')]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_PhysicalDisk')]
    [ciminstance]
    ${InputObject},

    [Parameter(ParameterSetName='ByStorageEnclosureUniqueId', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageEnclosureUniqueId},

    [Parameter(ParameterSetName='ByStorageEnclosureFriendlyName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageEnclosureFriendlyName},

    [Parameter(ParameterSetName='ByStorageEnclosure', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageEnclosure')]
    [ciminstance]
    ${StorageEnclosure},

    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageEnclosureFriendlyName')]
    [Parameter(ParameterSetName='ByStorageEnclosureUniqueId')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByPhysicalDiskFriendlyName')]
    [Parameter(ParameterSetName='ByPhysicalDiskUniqueId')]
    [string]
    ${ImagePath},

    [Parameter(ParameterSetName='ByStorageEnclosure')]
    [Parameter(ParameterSetName='ByStorageEnclosureFriendlyName')]
    [Parameter(ParameterSetName='ByStorageEnclosureUniqueId')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Parameter(ParameterSetName='ByPhysicalDiskFriendlyName')]
    [Parameter(ParameterSetName='ByPhysicalDiskUniqueId')]
    [ushort]
    ${SlotNumber},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-StorageFirmware', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Update-StorageFirmware
.ForwardHelpCategory Function

#>


}

