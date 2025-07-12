Function New-Partition {

[CmdletBinding(DefaultParameterSetName='ByNumber', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${DiskId},

    [Parameter(ParameterSetName='ByPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${DiskPath},

    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [uint[]]
    ${DiskNumber},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ulong]
    ${Size},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [switch]
    ${UseMaximumSize},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ulong]
    ${Offset},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [uint]
    ${Alignment},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('NewDriveLetter')]
    [char]
    ${DriveLetter},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${AssignDriveLetter},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Disk.CreatePartition.MbrType]
    ${MbrType},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${GptType},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${IsHidden},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${IsActive},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('New-Partition', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName New-Partition
.ForwardHelpCategory Function

#>


}

