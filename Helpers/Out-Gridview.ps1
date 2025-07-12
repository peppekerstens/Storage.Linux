function Out-Gridview{
    <#
    .Synopsis
        Proxy function for Out-Gridview to include parameter -ViewDefault.
    .Description
        Adds the parameter -ViewDefault to support Out-ConsoleGridView without impacting existing scripts or current $PSStyle standards.
        When loaded and called
        - with parameter -ViewDefault, this will set a hidden file within the profile of current user named .out-gridview.settings
        - if the file exists, it will check the preferred setting and set a global variable OutGridviewSettings
        - if the global variable exists, it will use that variable ofr loading settings

        This will require a sinlge anomality call of Out-Gridview once in a user session but does not impact existing code.
        The code will automatically detect PS version, ignoring everything when it is run on PS versions lesser than 7

        The default can be changed either by calling parameter -ViewDefault again or by 

    .Notes
        This help text replaces original help witch denotes usability of help drastically, needs improvement
        For now, inquire https://learn.microsoft.com/powershell/module/microsoft.powershell.utility/out-gridview for information on standard parameters
        
        Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)

        Author: Peppe Kerstens (NLD)
        Version: 1.0.0
        Date: 6-6-2023
        
    .LINK
        https://devblogs.microsoft.com/scripting/proxy-functions-spice-up-your-powershell-core-cmdlets/
    #>
    [CmdletBinding(DefaultParameterSetName='PassThru', HelpUri='https://go.microsoft.com/fwlink/?LinkID=113364')]
    param(
        [Parameter(ValueFromPipeline=$true)]
        [psobject]
        ${InputObject},

        [ValidateNotNullOrEmpty()]
        [string]
        ${Title},

        [Parameter(ParameterSetName='Wait')]
        [switch]
        ${Wait},

        [Parameter(ParameterSetName='OutputMode')]
        [Microsoft.PowerShell.Commands.OutputModeOption]
        ${OutputMode},

        [Parameter(ParameterSetName='PassThru')]
        [switch]
        ${PassThru},

        [ValidateSet("Console","Gui")]
        [string]
        ${ViewDefault}
    )

    begin
    {
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Out-GridView', [System.Management.Automation.CommandTypes]::Cmdlet)

        #check which PS version this is run on
        if ($PSVersionTable.PSVersion.Major -ge 7){
            Try{
                $null = Get-Variable -Name 'OutGridviewSettings' -ErrorAction stop 
            }Catch{
                Try{
                    $OutGridviewSettings = [PSCustomObject](Get-Content -Path "$($env:USERPROFILE)\.out-gridview.settings" | ConvertFrom-Json)
                }Catch{
                    #none found, set everything up for first time use
                    $OutGridviewSettings = [PSCustomObject]@{
                        ViewDefault = 'Gui'
                    }
                    $OutGridviewSettings | ConvertTo-Json | Set-Content -Path "$($env:USERPROFILE)\.out-gridview.settings" -Force
                }
                Set-Variable -Name 'OutGridviewSettings' -Value $OutGridviewSettings -Scope Global -Force
            }

            if ($PSBoundParameters['ViewDefault']){
                $OutGridviewSettings = [PSCustomObject]@{
                    ViewDefault = $ViewDefault
                }
                $OutGridviewSettings | ConvertTo-Json | Set-Content -Path "$($env:USERPROFILE)\.out-gridview.settings" -Force
                Set-Variable -Name 'OutGridviewSettings' -Value $OutGridviewSettings -Scope Global -Force
            }

            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Out-GridView', [System.Management.Automation.CommandTypes]::Cmdlet)
            if ($OutGridviewSettings.ViewDefault -eq 'Console'){
                $consoleguitools = Get-Module microsoft.powershell.consoleguitools -listavailable
                if (!($consoleguitools)){
                    try{
                        install-module microsoft.powershell.consoleguitools -Repository PSGallery -Force
                        $consoleguitools = import-module microsoft.powershell.consoleguitools -PassThru
                    }catch{
                        Write-Warning -Message "Out-Gridview proxy function was not able to load consoleguitools, reverting to default display"
                    }
                }
                if ($consoleguitools){
                    $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('microsoft.powershell.consoleguitools\Out-ConsoleGridView', [System.Management.Automation.CommandTypes]::Cmdlet)
                }
            }
        }

        $null = $PSBoundParameters.Remove['ViewDefault']

        try {    
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
            {
                $PSBoundParameters['OutBuffer'] = 1
            }
            #$wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Out-GridView', [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
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
    <#

    .ForwardHelpTargetName Microsoft.PowerShell.Utility\Out-GridView
    .ForwardHelpCategory Cmdlet

    #>
}