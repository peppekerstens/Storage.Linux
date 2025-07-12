Function Get-StorageDiagnosticInfo {

[CmdletBinding()]
param(
    [Parameter(ParameterSetName='ByStorageSubSystem', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#ROOT/Microsoft/Windows/Storage/MSFT_StorageSubSystem')]
    [ciminstance]
    ${InputObject},

    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName', Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageSubSystemFriendlyName},

    [Parameter(ParameterSetName='ByStorageSubSystemName', Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageSubSystemName},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId', Mandatory=$true)]
    [Alias('StorageSubSystemId')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${StorageSubSystemUniqueId},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStorageSubSystemName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName', Mandatory=$true)]
    [Parameter(ParameterSetName='ByStorageSubSystem', Mandatory=$true)]
    [Alias('Path')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${DestinationPath},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId')]
    [Parameter(ParameterSetName='ByStorageSubSystemName')]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [uint]
    ${TimeSpan},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId')]
    [Parameter(ParameterSetName='ByStorageSubSystemName')]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [string]
    ${ActivityId},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId')]
    [Parameter(ParameterSetName='ByStorageSubSystemName')]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [switch]
    ${ExcludeOperationalLog},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId')]
    [Parameter(ParameterSetName='ByStorageSubSystemName')]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [switch]
    ${ExcludeDiagnosticLog},

    [Parameter(ParameterSetName='ByStorageSubSystemUniqueId')]
    [Parameter(ParameterSetName='ByStorageSubSystemName')]
    [Parameter(ParameterSetName='ByStorageSubSystemFriendlyName')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [switch]
    ${IncludeLiveDump},

    [CimSession]
    ${CimSession},

    [int]
    ${ThrottleLimit},

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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-StorageDiagnosticInfo', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-StorageDiagnosticInfo
.ForwardHelpCategory Function

#>


}

