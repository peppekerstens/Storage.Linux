Function Set-StorageFileServer {

[CmdletBinding(DefaultParameterSetName='ByName', SupportsShouldProcess=$true, ConfirmImpact='Low', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByName')]
    [ValidateNotNull()]
    [string[]]
    ${FriendlyName},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_FileServer')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true)]
    [Parameter(ParameterSetName='ByName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true)]
    [ValidateNotNull()]
    [string]
    ${NewFriendlyName},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-StorageFileServer', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-StorageFileServer
.ForwardHelpCategory Function

#>


}

