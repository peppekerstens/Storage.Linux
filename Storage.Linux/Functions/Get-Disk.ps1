Function Get-Disk {

[CmdletBinding(DefaultParameterSetName='ByNumber', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByName')]
    [ValidateNotNull()]
    [string[]]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByName')]
    [ValidateNotNull()]
    [string[]]
    ${SerialNumber},

    [Parameter(ParameterSetName='ByPath', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByNumber', Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('DeviceId')]
    [ValidateNotNull()]
    [uint[]]
    ${Number},

    [Parameter(ParameterSetName='ByPartition', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Partition')]
    [ciminstance]
    ${Partition},

    [Parameter(ParameterSetName='ByVirtualDisk', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_VirtualDisk')]
    [ciminstance]
    ${VirtualDisk},

    [Parameter(ParameterSetName='ByiSCSISession', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_iSCSISession')]
    [ciminstance]
    ${iSCSISession},

    [Parameter(ParameterSetName='ByiSCSIConnection', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_iSCSIConnection')]
    [ciminstance]
    ${iSCSIConnection},

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

    [Parameter(ParameterSetName='ByStorageJob', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageJob')]
    [ciminstance]
    ${StorageJob},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-Disk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-Disk
.ForwardHelpCategory Function

#>


}

