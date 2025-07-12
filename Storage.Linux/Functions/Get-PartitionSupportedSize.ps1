Function Get-PartitionSupportedSize {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${DiskId},

    [Parameter(ParameterSetName='ById', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [ulong[]]
    ${Offset},

    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [uint[]]
    ${DiskNumber},

    [Parameter(ParameterSetName='ByNumber', Position=1)]
    [Alias('Number')]
    [ValidateNotNull()]
    [uint[]]
    ${PartitionNumber},

    [Parameter(ParameterSetName='ByDriveLetter', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [char[]]
    ${DriveLetter},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Partition')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ById')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ById')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ById')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-PartitionSupportedSize', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-PartitionSupportedSize
.ForwardHelpCategory Function

#>


}

