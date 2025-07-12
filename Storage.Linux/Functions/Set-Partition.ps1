Function Set-Partition {

[CmdletBinding(DefaultParameterSetName='ByNumberAttributes', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObjectAccessPath', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, ValueFromPipeline=$true)]
    [Parameter(ParameterSetName='ByObjectAttributes', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsReadOnly},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${NoDefaultDriveLetter},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsActive},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsHidden},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsShadowCopy},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [bool]
    ${IsDAX},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [ushort]
    ${MbrType},

    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [string]
    ${GptType},

    [Parameter(ParameterSetName='ByIdAccessPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${DiskId},

    [Parameter(ParameterSetName='ByIdAccessPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByIdAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ulong]
    ${Offset},

    [Parameter(ParameterSetName='ByDriveLetterAccessPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByDriveLetter', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByDriveLetterAttributes', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [char]
    ${DriveLetter},

    [Parameter(ParameterSetName='ByNumberAccessPath', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByNumberAttributes', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [uint]
    ${DiskNumber},

    [Parameter(ParameterSetName='ByNumberAccessPath', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='ByNumberAttributes', Mandatory=$true, Position=1)]
    [Alias('Number')]
    [uint]
    ${PartitionNumber},

    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${IsOffline},

    [Parameter(ParameterSetName='ByNumberAccessPath')]
    [Parameter(ParameterSetName='ByDriveLetterAccessPath')]
    [Parameter(ParameterSetName='ByIdAccessPath')]
    [Parameter(ParameterSetName='ByObjectAccessPath')]
    [char]
    ${NewDriveLetter},

    [Parameter(ParameterSetName='ByNumberAccessPath')]
    [Parameter(ParameterSetName='ByDriveLetterAccessPath')]
    [Parameter(ParameterSetName='ByIdAccessPath')]
    [Parameter(ParameterSetName='ByObjectAccessPath')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByNumberAccessPath')]
    [Parameter(ParameterSetName='ByDriveLetterAccessPath')]
    [Parameter(ParameterSetName='ByIdAccessPath')]
    [Parameter(ParameterSetName='ByObjectAccessPath')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByNumberAccessPath')]
    [Parameter(ParameterSetName='ByDriveLetterAccessPath')]
    [Parameter(ParameterSetName='ByIdAccessPath')]
    [Parameter(ParameterSetName='ByObjectAccessPath')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ById')]
    [Parameter(ParameterSetName='ByObject')]
    [Parameter(ParameterSetName='ByNumberAttributes')]
    [Parameter(ParameterSetName='ByDriveLetterAttributes')]
    [Parameter(ParameterSetName='ByIdAttributes')]
    [Parameter(ParameterSetName='ByObjectAttributes')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-Partition', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-Partition
.ForwardHelpCategory Function

#>


}

