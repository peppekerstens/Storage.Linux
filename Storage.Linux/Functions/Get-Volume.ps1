Function Get-Volume {

[CmdletBinding(DefaultParameterSetName='ByDriveLetter', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ById', ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${ObjectId},

    [Parameter(ParameterSetName='ByUniqueId', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${UniqueId},

    [Parameter(ParameterSetName='ByPaths', ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByLabel', ValueFromPipelineByPropertyName=$true)]
    [Alias('FriendlyName')]
    [ValidateNotNull()]
    [string[]]
    ${FileSystemLabel},

    [Parameter(ParameterSetName='ByDriveLetter', Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [char[]]
    ${DriveLetter},

    [Parameter(ParameterSetName='ByPartition', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Partition')]
    [ciminstance]
    ${Partition},

    [Parameter(ParameterSetName='ByDiskImage', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_DiskImage')]
    [ciminstance]
    ${DiskImage},

    [Parameter(ParameterSetName='ByStorageSubSystem', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageSubSystem')]
    [ciminstance]
    ${StorageSubSystem},

    [Parameter(ParameterSetName='ByStoragePool', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StoragePool')]
    [ciminstance]
    ${StoragePool},

    [Parameter(ParameterSetName='ByStorageNode', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageNode')]
    [ciminstance]
    ${StorageNode},

    [Parameter(ParameterSetName='ByStorageFileServer', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_FileServer')]
    [ciminstance]
    ${StorageFileServer},

    [Parameter(ParameterSetName='ByFileShare', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_FileShare')]
    [ciminstance]
    ${FileShare},

    [Parameter(ParameterSetName='ByStorageJob', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_StorageJob')]
    [ciminstance]
    ${StorageJob},

    [Parameter(ParameterSetName='ByFilePath', ValueFromPipelineByPropertyName=$true)]
    [Alias('FullName')]
    [ValidateNotNullOrEmpty()]
    [string]
    ${FilePath},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByFileShare')]
    [Parameter(ParameterSetName='ByStorageFileServer')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByDiskImage')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ById')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByFileShare')]
    [Parameter(ParameterSetName='ByStorageFileServer')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByDiskImage')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ByUniqueId')]
    [Parameter(ParameterSetName='ById')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='ByFilePath')]
    [Parameter(ParameterSetName='ByStorageJob')]
    [Parameter(ParameterSetName='ByFileShare')]
    [Parameter(ParameterSetName='ByStorageFileServer')]
    [Parameter(ParameterSetName='ByStorageNode')]
    [Parameter(ParameterSetName='ByStoragePool')]
    [Parameter(ParameterSetName='ByStorageSubSystem')]
    [Parameter(ParameterSetName='ByDiskImage')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ByUniqueId')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-Volume', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-Volume
.ForwardHelpCategory Function

#>


}

