Function Set-Disk {

[CmdletBinding(DefaultParameterSetName='ByNumberAttributes', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectAttributes', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectConvertStyle', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByNumberConvertStyle')]
    [Parameter(ParameterSetName='ByPathConvertStyle')]
    [Parameter(ParameterSetName='ByIdConvertStyle')]
    [Parameter(ParameterSetName='ByObjectConvertStyle')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetDisk.PartitionStyle]
    ${PartitionStyle},

    [Parameter(ParameterSetName='ByIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdConvertStyle', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByPathAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByPathConvertStyle', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Path},

    [Parameter(ParameterSetName='ByNumberAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNumberConvertStyle', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [uint]
    ${Number},

    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${IsOffline},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsReadOnly},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [uint]
    ${Signature},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [string]
    ${Guid},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberConvertStyle')]
    [Parameter(ParameterSetName='ByPathConvertStyle')]
    [Parameter(ParameterSetName='ByIdConvertStyle')]
    [Parameter(ParameterSetName='ByObjectConvertStyle')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberConvertStyle')]
    [Parameter(ParameterSetName='ByPathConvertStyle')]
    [Parameter(ParameterSetName='ByIdConvertStyle')]
    [Parameter(ParameterSetName='ByObjectConvertStyle')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByPathAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberConvertStyle')]
    [Parameter(ParameterSetName='ByPathConvertStyle')]
    [Parameter(ParameterSetName='ByIdConvertStyle')]
    [Parameter(ParameterSetName='ByObjectConvertStyle')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-Disk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-Disk
.ForwardHelpCategory Function

#>


}

