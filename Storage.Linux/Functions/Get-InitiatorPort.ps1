Function Get-InitiatorPort {

[CmdletBinding(DefaultParameterSetName='ByNodeAddress', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectId', ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${ObjectId},

    [Parameter(ParameterSetName='ByNodeAddress', Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${NodeAddress},

    [Parameter(ParameterSetName='ByInstanceName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${InstanceName},

    [Parameter(ParameterSetName='ByInstanceName', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNodeAddress', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.InitiatorPort.ConnectionType[]]
    ${ConnectionType},

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

    [Parameter(ParameterSetName='ByiSCSITarget', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_iSCSITarget')]
    [ciminstance]
    ${iSCSITarget},

    [Parameter(ParameterSetName='ByiSCSITarget')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByInstanceName')]
    [Parameter(ParameterSetName='ByNodeAddress')]
    [Parameter(ParameterSetName='ByObjectId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByiSCSITarget')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByInstanceName')]
    [Parameter(ParameterSetName='ByNodeAddress')]
    [Parameter(ParameterSetName='ByObjectId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByiSCSITarget')]
    [Parameter(ParameterSetName='ByiSCSIConnection')]
    [Parameter(ParameterSetName='ByiSCSISession')]
    [Parameter(ParameterSetName='ByVirtualDisk')]
    [Parameter(ParameterSetName='ByInstanceName')]
    [Parameter(ParameterSetName='ByNodeAddress')]
    [Parameter(ParameterSetName='ByObjectId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-InitiatorPort', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-InitiatorPort
.ForwardHelpCategory Function

#>


}

