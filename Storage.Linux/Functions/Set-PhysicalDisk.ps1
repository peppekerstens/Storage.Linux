Function Set-PhysicalDisk {

[CmdletBinding(DefaultParameterSetName='ByUniqueId', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByObject', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [string]
    ${NewFriendlyName},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [string]
    ${Description},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetPhysicalDisk.Usage]
    ${Usage},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.SetPhysicalDisk.MediaType]
    ${MediaType},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [string]
    ${StorageEnclosureId},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [string]
    ${StorageScaleUnitId},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [bool]
    ${IsHidden},

    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [string]
    ${UniqueId},

    [Parameter(ParameterSetName='ByFriendlyName', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByFriendlyName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ByObject')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-PhysicalDisk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-PhysicalDisk
.ForwardHelpCategory Function

#>


}

