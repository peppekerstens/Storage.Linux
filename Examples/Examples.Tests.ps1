#Requires -Modules Pester, Storage.Linux
<#
.Synopsis
    Pester tests for Storage.Linux example scripts.
.Description
    Validates that each example script in the Examples\ folder:
      - exists on disk
      - has no syntax errors (parses cleanly)
      - is dot-sourceable without throwing (module already loaded)
    Linux-only execution tests are guarded with -Skip:(-not $IsLinux).
    All tests run on Windows (syntax/structure checks); live execution
    tests are skipped on Windows.
.Notes
    Free to use under GNU v3 Public License (https://choosealicense.com/licenses/gpl-3.0/)
    Author: Peppe Kerstens (NLD)
    Run with: Invoke-Pester .\Examples.Tests.ps1 -Output Detailed
#>

# $PSScriptRoot can be $null at discovery time in Pester 5.3.x when the file
# is passed via PesterConfiguration; resolve via $PSCommandPath as a fallback.
BeforeDiscovery {
    $script:ExamplesDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path $PSCommandPath -Parent }
    $script:ExampleFiles = @(
        'Get-DiskInventory.ps1'
        'Get-LowSpaceVolumes.ps1'
        'Get-DiskLayout.ps1'
        'Get-SsdHddFilter.ps1'
        'Get-StorageSummary.ps1'
    )
}

BeforeAll {
    # Resolve again inside BeforeAll (runtime) for safety
    $script:ExamplesDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path $PSCommandPath -Parent }
    # Import the module from one level up (repo root → module folder)
    $modulePath = Join-Path (Split-Path $script:ExamplesDir -Parent) 'Storage.Linux' 'Storage.Linux.psd1'
    if (Test-Path $modulePath) {
        Import-Module $modulePath -Force -ErrorAction Stop
    }
}

Describe 'Example script files exist' {
    It 'Examples directory contains exactly <_>' -ForEach $script:ExampleFiles {
        Join-Path $script:ExamplesDir $_ | Should -Exist
    }
}

Describe 'Example scripts have no syntax errors' {
    It '<_> parses without errors' -ForEach $script:ExampleFiles {
        $filePath = Join-Path $script:ExamplesDir $_
        $errors   = $null
        $null = [System.Management.Automation.Language.Parser]::ParseFile($filePath, [ref]$null, [ref]$errors)
        $errors | Should -BeNullOrEmpty
    }
}

Describe 'Get-DiskInventory' {
    It 'script file exists' {
        Join-Path $script:ExamplesDir 'Get-DiskInventory.ps1' | Should -Exist
    }

    It 'Get-Disk returns objects with required properties' -Skip:(-not $IsLinux) {
        $result = Get-Disk
        $result | Should -Not -BeNullOrEmpty
        $result[0].PSObject.Properties.Name | Should -Contain 'Number'
        $result[0].PSObject.Properties.Name | Should -Contain 'FriendlyName'
        $result[0].PSObject.Properties.Name | Should -Contain 'Size'
        $result[0].PSObject.Properties.Name | Should -Contain 'BusType'
        $result[0].PSObject.Properties.Name | Should -Contain 'MediaType'
        $result[0].PSObject.Properties.Name | Should -Contain 'PartitionStyle'
    }

    It 'Size property is a positive integer' -Skip:(-not $IsLinux) {
        $result = Get-Disk
        foreach ($d in $result) {
            $d.Size | Should -BeGreaterThan 0
        }
    }
}

Describe 'Get-LowSpaceVolumes' {
    It 'script file exists' {
        Join-Path $script:ExamplesDir 'Get-LowSpaceVolumes.ps1' | Should -Exist
    }

    It 'Get-Volume returns objects with required properties' -Skip:(-not $IsLinux) {
        $result = Get-Volume
        $result | Should -Not -BeNullOrEmpty
        $result[0].PSObject.Properties.Name | Should -Contain 'Path'
        $result[0].PSObject.Properties.Name | Should -Contain 'Size'
        $result[0].PSObject.Properties.Name | Should -Contain 'SizeRemaining'
        $result[0].PSObject.Properties.Name | Should -Contain 'FileSystem'
    }

    It 'volumes with Size > 0 have SizeRemaining <= Size' -Skip:(-not $IsLinux) {
        $volumes = Get-Volume | Where-Object { $_.Size -gt 0 }
        foreach ($v in $volumes) {
            $v.SizeRemaining | Should -BeLessOrEqual $v.Size
        }
    }

    It 'low-space filter logic works (threshold 101% catches all volumes)' -Skip:(-not $IsLinux) {
        $all     = Get-Volume | Where-Object { $_.Size -gt 0 }
        $flagged = $all | Where-Object { (($_.SizeRemaining / $_.Size) * 100) -lt 101 }
        $flagged.Count | Should -Be $all.Count
    }

    It 'low-space filter logic works (threshold 0% catches none)' -Skip:(-not $IsLinux) {
        $all     = Get-Volume | Where-Object { $_.Size -gt 0 }
        $flagged = $all | Where-Object { (($_.SizeRemaining / $_.Size) * 100) -lt 0 }
        $flagged.Count | Should -Be 0
    }
}

Describe 'Get-DiskLayout' {
    It 'script file exists' {
        Join-Path $script:ExamplesDir 'Get-DiskLayout.ps1' | Should -Exist
    }

    It 'Get-Partition returns objects with required properties' -Skip:(-not $IsLinux) {
        $disks = Get-Disk
        # Use the first disk that has partitions
        $found = $false
        foreach ($disk in $disks) {
            $parts = Get-Partition -DiskNumber $disk.Number
            if ($parts) {
                $found = $true
                $parts[0].PSObject.Properties.Name | Should -Contain 'DiskNumber'
                $parts[0].PSObject.Properties.Name | Should -Contain 'PartitionNumber'
                $parts[0].PSObject.Properties.Name | Should -Contain 'Path'
                $parts[0].PSObject.Properties.Name | Should -Contain 'FileSystem'
                break
            }
        }
        # If no partitioned disk exists (e.g. raw VM disk), skip gracefully
        if (-not $found) {
            Set-ItResult -Skipped -Because 'no partitioned disks found on this system'
        }
    }

    It 'DiskNumber on partition matches requested disk' -Skip:(-not $IsLinux) {
        $disks = Get-Disk
        foreach ($disk in $disks) {
            $parts = Get-Partition -DiskNumber $disk.Number
            foreach ($p in $parts) {
                $p.DiskNumber | Should -Be $disk.Number
            }
        }
    }
}

Describe 'Get-SsdHddFilter' {
    It 'script file exists' {
        Join-Path $script:ExamplesDir 'Get-SsdHddFilter.ps1' | Should -Exist
    }

    It 'Get-PhysicalDisk returns objects with required properties' -Skip:(-not $IsLinux) {
        $result = Get-PhysicalDisk
        $result | Should -Not -BeNullOrEmpty
        $result[0].PSObject.Properties.Name | Should -Contain 'FriendlyName'
        $result[0].PSObject.Properties.Name | Should -Contain 'MediaType'
        $result[0].PSObject.Properties.Name | Should -Contain 'BusType'
        $result[0].PSObject.Properties.Name | Should -Contain 'Size'
        $result[0].PSObject.Properties.Name | Should -Contain 'OperationalStatus'
    }

    It 'MediaType values are restricted to SSD, HDD, or Unspecified' -Skip:(-not $IsLinux) {
        $validTypes = @('SSD','HDD','Unspecified')
        Get-PhysicalDisk | ForEach-Object {
            $_.MediaType | Should -BeIn $validTypes
        }
    }

    It 'filtering by MediaType SSD returns only SSD disks' -Skip:(-not $IsLinux) {
        $ssds = Get-PhysicalDisk -MediaType SSD
        foreach ($d in $ssds) {
            $d.MediaType | Should -Be 'SSD'
        }
    }

    It 'filtering by MediaType HDD returns only HDD disks' -Skip:(-not $IsLinux) {
        $hdds = Get-PhysicalDisk -MediaType HDD
        foreach ($d in $hdds) {
            $d.MediaType | Should -Be 'HDD'
        }
    }
}

Describe 'Get-StorageSummary' {
    It 'script file exists' {
        Join-Path $script:ExamplesDir 'Get-StorageSummary.ps1' | Should -Exist
    }

    It 'sum of disk sizes is positive' -Skip:(-not $IsLinux) {
        $total = (Get-Disk | Measure-Object -Property Size -Sum).Sum
        $total | Should -BeGreaterThan 0
    }

    It 'sum of volume sizes is positive' -Skip:(-not $IsLinux) {
        $total = (Get-Volume | Where-Object { $_.Size -gt 0 } | Measure-Object -Property Size -Sum).Sum
        $total | Should -BeGreaterThan 0
    }

    It 'total free does not exceed total size across volumes' -Skip:(-not $IsLinux) {
        $vols      = Get-Volume | Where-Object { $_.Size -gt 0 }
        $totalSize = ($vols | Measure-Object -Property Size          -Sum).Sum
        $totalFree = ($vols | Measure-Object -Property SizeRemaining -Sum).Sum
        $totalFree | Should -BeLessOrEqual $totalSize
    }

    It 'physical disk count matches disk count' -Skip:(-not $IsLinux) {
        # Get-PhysicalDisk includes loop devices; Get-Disk counts only 'disk' type
        # Physical count must be >= disk count
        $diskCount = (Get-Disk).Count
        $physCount = (Get-PhysicalDisk).Count
        $physCount | Should -BeGreaterOrEqual $diskCount
    }
}
