Function Clear-Disk {

[CmdletBinding(DefaultParameterSetName='ByNumber', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ByUniqueId', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByName', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${FriendlyName},

    [Parameter(ParameterSetName='ByPath', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByNumber', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [uint[]]
    ${Number},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Disk')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${RemoveData},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${RemoveOEM},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${Sanitize},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
    [Parameter(ParameterSetName='ByName')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [switch]
    ${AsJob},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByNumber')]
    [Parameter(ParameterSetName='ByPath')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Clear-Disk', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Clear-Disk
.ForwardHelpCategory Function

#>


}

