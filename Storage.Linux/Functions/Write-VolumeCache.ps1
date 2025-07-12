Function Write-VolumeCache {

[CmdletBinding(DefaultParameterSetName='ByDriveLetter', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${ObjectId},

    [Parameter(ParameterSetName='ByPaths', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByLabel', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FriendlyName')]
    [ValidateNotNull()]
    [string[]]
    ${FileSystemLabel},

    [Parameter(ParameterSetName='ByDriveLetter', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [char[]]
    ${DriveLetter},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Volume')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${PassThru})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Write-VolumeCache', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Write-VolumeCache
.ForwardHelpCategory Function

#>


}

