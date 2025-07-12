Function Dismount-DiskImage {

[CmdletBinding(DefaultParameterSetName='ByImagePath', SupportsShouldProcess=$true, ConfirmImpact='Medium', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByImagePath', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]
    ${ImagePath},

    [Parameter(ParameterSetName='ByDevicePath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]
    ${DevicePath},

    [Parameter(ParameterSetName='ByDevicePath', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByImagePath', ValueFromPipelineByPropertyName=$true)]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.DiskImage.StorageType]
    ${StorageType},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_DiskImage')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Dismount-DiskImage', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Dismount-DiskImage
.ForwardHelpCategory Function

#>


}

