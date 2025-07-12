Function Get-StorageReliabilityCounter {

[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByPhysicalDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_PhysicalDisk')]
    [ciminstance]
    ${PhysicalDisk},

    [Parameter(ParameterSetName='ByDisk', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance]
    ${Disk},

    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByDisk')]
    [Parameter(ParameterSetName='ByPhysicalDisk')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageReliabilityCounter', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageReliabilityCounter
.ForwardHelpCategory Function

#>


}

