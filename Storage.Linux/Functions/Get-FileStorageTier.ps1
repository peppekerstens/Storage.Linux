Function Get-FileStorageTier {

[CmdletBinding(DefaultParameterSetName='ByVolumeDriveLetter', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByVolumeDriveLetter', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [char]
    ${VolumeDriveLetter},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.FileStorageTier.PinnedState]
    ${PinnedState},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.FileStorageTier.StorageTierClass]
    ${PinnedStorageTierClass},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.FileStorageTier.StorageTierClass]
    ${AllocatedStorageTierClass},

    [Parameter(ParameterSetName='ByVolumePath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${VolumePath},

    [Parameter(ParameterSetName='ByVolume', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance]
    ${Volume},

    [Parameter(ParameterSetName='ByFilePath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FilePath},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Parameter(ParameterSetName='ByVolumePath')]
    [Parameter(ParameterSetName='ByVolumeDriveLetter')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-FileStorageTier', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-FileStorageTier
.ForwardHelpCategory Function

#>


}

