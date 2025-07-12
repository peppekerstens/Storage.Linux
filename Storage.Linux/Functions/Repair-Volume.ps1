Function Repair-Volume {

[CmdletBinding(DefaultParameterSetName='ByDriveLetter', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
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
    [switch]
    ${OfflineScanAndFix},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${Scan},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${SpotFix},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Volume.DetectLeakMode]
    ${DetectLeaks},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [string]
    ${ScratchFile},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [uint]
    ${Threads},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${Triage},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [ulong[]]
    ${DirectoryIds},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.Volume.SalvageMode]
    ${Salvage},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [string]
    ${ScratchDir},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [string]
    ${TargetFile},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [string]
    ${TargetDir},

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
    ${AsJob})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Repair-Volume', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Repair-Volume
.ForwardHelpCategory Function

#>


}

