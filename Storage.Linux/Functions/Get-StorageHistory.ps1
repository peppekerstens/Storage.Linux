Function Get-StorageHistory {

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

    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [pscredential]
    [System.Management.Automation.CredentialAttribute()]
    ${Credential},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${LogFile},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [uint]
    ${NumberOfHours},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [switch]
    ${Disaggregate},

    [Parameter(ParameterSetName='ByDeviceNumber')]
    [Parameter(ParameterSetName='ByDeviceGuid')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [switch]
    ${Errors})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageHistory', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageHistory
.ForwardHelpCategory Function

#>


}

