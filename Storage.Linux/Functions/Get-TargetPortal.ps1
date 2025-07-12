Function Get-TargetPortal {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByIPv4Address', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string[]]
    ${IPv4Address},

    [Parameter(ParameterSetName='ByIPv6Address', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string[]]
    ${IPv6Address},

    [Parameter(ParameterSetName='ByTargetPort', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_TargetPort')]
    [ciminstance]
    ${TargetPort},

    [Parameter(ParameterSetName='BySubsystem', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageSubSystem')]
    [ciminstance]
    ${StorageSubsystem},

    [Parameter(ParameterSetName='BySubsystem')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByIPv6Address')]
    [Parameter(ParameterSetName='ByIPv4Address')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='BySubsystem')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByIPv6Address')]
    [Parameter(ParameterSetName='ByIPv4Address')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='BySubsystem')]
    [Parameter(ParameterSetName='ByTargetPort')]
    [Parameter(ParameterSetName='ByIPv6Address')]
    [Parameter(ParameterSetName='ByIPv4Address')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-TargetPortal', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-TargetPortal
.ForwardHelpCategory Function

#>


}

