Function Format-Volume {

[CmdletBinding(DefaultParameterSetName='ByDriveLetter', SupportsShouldProcess=$true, ConfirmImpact='High', PositionalBinding=$false)]
param(
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [ValidateNotNull()]
    [string[]]
    ${ObjectId},

    [Parameter(ParameterSetName='ByPaths', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [string[]]
    ${Path},

    [Parameter(ParameterSetName='ByLabel', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('FriendlyName')]
    [ValidateNotNull()]
    [string[]]
    ${FileSystemLabel},

    [Parameter(ParameterSetName='ByDriveLetter', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [ValidateNotNull()]
    [char[]]
    ${DriveLetter},

    [Parameter(ParameterSetName='ByPartition', ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Partition')]
    [ciminstance]
    ${Partition},

    [Parameter(ParameterSetName='InputObject (cdxml)', Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [PSTypeName('Microsoft.Management.Infrastructure.CimInstance#MSFT_Volume')]
    [ciminstance[]]
    ${InputObject},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [ValidateSet('FAT','FAT32','exFAT','NTFS','ReFS')]
    [ValidateNotNullOrEmpty()]
    [ValidateNotNull()]
    [string]
    ${FileSystem},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Alias('NewFriendlyName')]
    [string]
    ${NewFileSystemLabel},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Alias('ClusterSize')]
    [uint]
    ${AllocationUnitSize},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${Full},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${Force},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${Compress},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [bool]
    ${ShortFileNameSupport},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [bool]
    ${SetIntegrityStreams},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${UseLargeFRS},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${DisableHeatGathering},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [bool]
    ${IsDAX},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${NoTrim},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${SHA256Checksums},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [switch]
    ${DevDrive},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
    [Parameter(ParameterSetName='ById')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='InputObject (cdxml)')]
    [Parameter(ParameterSetName='ByPartition')]
    [Parameter(ParameterSetName='ByDriveLetter')]
    [Parameter(ParameterSetName='ByLabel')]
    [Parameter(ParameterSetName='ByPaths')]
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

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Format-Volume', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Format-Volume
.ForwardHelpCategory Function

#>


}

