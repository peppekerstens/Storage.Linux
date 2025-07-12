Function Get-DiskImage {

[CmdletBinding(DefaultParameterSetName='ByImagePath', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByVolume', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Volume')]
    [ciminstance]
    ${Volume},

    [Parameter(ParameterSetName='ByImagePath', Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]
    ${ImagePath},

    [Parameter(ParameterSetName='ByDevicePath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]
    ${DevicePath},

    [Parameter(ParameterSetName='ByDevicePath', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByImagePath', ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='ByVolume', ValueFromPipelineByPropertyName=$true)]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.DiskImage.StorageType]
    ${StorageType},

    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
    [Parameter(ParameterSetName='ByVolume')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByDevicePath')]
    [Parameter(ParameterSetName='ByImagePath')]
    [Parameter(ParameterSetName='ByVolume')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-DiskImage', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-DiskImage
.ForwardHelpCategory Function

#>


}

