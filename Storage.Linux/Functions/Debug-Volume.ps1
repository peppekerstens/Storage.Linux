Function Debug-Volume {

[CmdletBinding(DefaultParameterSetName='ByDriveLetter')]
param(
    [Parameter(ParameterSetName='ByDriveLetter', Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [char[]]
    ${DriveLetter},

    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]
    ${ObjectId},

    [Parameter(ParameterSetName='ByPaths', Mandatory=$true, ValueFromPipeline=$true)]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByLabel', Mandatory=$true, ValueFromPipeline=$true)]
    [Alias('FriendlyName')]
    [string[]]
    ${FileSystemLabel},

    [Parameter(ParameterSetName='InputObject', Mandatory=$true, ValueFromPipeline=$true)]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_Volume')]
    [ciminstance]
    ${InputObject},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Debug-Volume', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Debug-Volume
.ForwardHelpCategory Function

#>


}

