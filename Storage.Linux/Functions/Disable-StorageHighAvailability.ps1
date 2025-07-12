Function Disable-StorageHighAvailability {

[CmdletBinding(DefaultParameterSetName='ByDiskNumber', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByDiskUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('DiskId')]
    [ValidateNotNull()]
    [string[]]
    ${DiskUniqueId},

    [Parameter(ParameterSetName='ByDiskName', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${DiskFriendlyName},

    [Parameter(ParameterSetName='ByDiskPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${DiskPath},

    [Parameter(ParameterSetName='ByDiskNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [uint[]]
    ${DiskNumber},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskName')]
    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskName')]
    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskName')]
    [Parameter(ParameterSetName='ByDiskUniqueId')]
    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByDiskNumber')]
    [Parameter(ParameterSetName='ByDiskPath')]
    [Parameter(ParameterSetName='ByDiskName')]
    [Parameter(ParameterSetName='ByDiskUniqueId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Disable-StorageHighAvailability', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Disable-StorageHighAvailability
.ForwardHelpCategory Function

#>


}

