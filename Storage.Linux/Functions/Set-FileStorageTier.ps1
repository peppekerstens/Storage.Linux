Function Set-FileStorageTier {

[CmdletBinding(DefaultParameterSetName='ByDesiredStorageTierFriendlyName', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByDesiredStorageTierClass', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByDesiredStorageTier', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByDesiredStorageTierFriendlyName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByDesiredStorageTierUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FilePath},

    [Parameter(ParameterSetName='ByDesiredStorageTierUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${DesiredStorageTierUniqueId},

    [Parameter(ParameterSetName='ByDesiredStorageTierFriendlyName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${DesiredStorageTierFriendlyName},

    [Parameter(ParameterSetName='ByDesiredStorageTier', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ciminstance]
    ${DesiredStorageTier},

    [Parameter(ParameterSetName='ByDesiredStorageTierClass', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.FileStorageTier.StorageTierClass]
    ${DesiredStorageTierClass},

    [Parameter(ParameterSetName='ByDesiredStorageTierClass')]
    [Parameter(ParameterSetName='ByDesiredStorageTier')]
    [Parameter(ParameterSetName='ByDesiredStorageTierFriendlyName')]
    [Parameter(ParameterSetName='ByDesiredStorageTierUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByDesiredStorageTierClass')]
    [Parameter(ParameterSetName='ByDesiredStorageTier')]
    [Parameter(ParameterSetName='ByDesiredStorageTierFriendlyName')]
    [Parameter(ParameterSetName='ByDesiredStorageTierUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByDesiredStorageTierClass')]
    [Parameter(ParameterSetName='ByDesiredStorageTier')]
    [Parameter(ParameterSetName='ByDesiredStorageTierFriendlyName')]
    [Parameter(ParameterSetName='ByDesiredStorageTierUniqueId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-FileStorageTier', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-FileStorageTier
.ForwardHelpCategory Function

#>


}

