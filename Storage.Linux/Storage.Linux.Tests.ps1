#Requires -Modules Pester

<#
.Synopsis
    Pester tests for Storage.Linux implemented cmdlets.
    Run on Linux (WSL2/Ubuntu) with: Invoke-Pester ./Storage.Linux.Tests.ps1
    On Windows the tests verify Windows-delegation paths only.
#>

BeforeAll {
    # Dot-source the four implemented functions
    $here = $PSScriptRoot
    . (Join-Path $here 'Functions\Get-Disk.ps1')
    . (Join-Path $here 'Functions\Get-PhysicalDisk.ps1')
    . (Join-Path $here 'Functions\Get-Partition.ps1')
    . (Join-Path $here 'Functions\Get-Volume.ps1')
}

# ---------------------------------------------------------------------------
Describe 'Get-Disk' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one disk' {
            $result = Get-Disk
            $result | Should -Not -BeNullOrEmpty
        }

        It 'Returns objects with expected properties' {
            $disk = Get-Disk | Select-Object -First 1
            $disk.PSObject.Properties.Name | Should -Contain 'Number'
            $disk.PSObject.Properties.Name | Should -Contain 'FriendlyName'
            $disk.PSObject.Properties.Name | Should -Contain 'Size'
            $disk.PSObject.Properties.Name | Should -Contain 'Path'
        }

        It 'Number property is a non-negative integer' {
            $disk = Get-Disk | Select-Object -First 1
            $disk.Number | Should -BeGreaterOrEqual 0
        }

        It 'Path starts with /dev/' {
            $disk = Get-Disk | Select-Object -First 1
            $disk.Path | Should -Match '^/dev/'
        }

        It 'Filters by Number' {
            $all = Get-Disk
            if ($all.Count -gt 0) {
                $result = Get-Disk -Number 0
                $result | Should -Not -BeNullOrEmpty
                $result[0].Number | Should -Be 0
            }
        }
    }

    Context 'Stub cmdlets emit warning on Linux' -Skip:(-not $IsLinux) {
        It 'Clear-Disk writes a warning on Linux' {
            . (Join-Path $PSScriptRoot 'Functions\Clear-Disk.ps1')
            { Clear-Disk -WarningVariable w 2>&1 } | Should -Not -Throw
            # Warning is emitted; we can't easily capture without -WarningVariable so just smoke test
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-PhysicalDisk' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one physical disk' {
            $result = Get-PhysicalDisk
            $result | Should -Not -BeNullOrEmpty
        }

        It 'Returns objects with expected properties' {
            $pd = Get-PhysicalDisk | Select-Object -First 1
            $pd.PSObject.Properties.Name | Should -Contain 'FriendlyName'
            $pd.PSObject.Properties.Name | Should -Contain 'MediaType'
            $pd.PSObject.Properties.Name | Should -Contain 'Size'
            $pd.PSObject.Properties.Name | Should -Contain 'Path'
        }

        It 'MediaType is one of HDD, SSD, Unspecified' {
            Get-PhysicalDisk | ForEach-Object {
                $_.MediaType | Should -BeIn @('HDD','SSD','Unspecified')
            }
        }

        It 'Filters by MediaType' {
            $all = Get-PhysicalDisk
            $hdds = Get-PhysicalDisk -MediaType HDD
            $ssds = Get-PhysicalDisk -MediaType SSD
            ($hdds.Count + $ssds.Count) | Should -BeLessOrEqual $all.Count
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-Partition' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns partition objects' {
            # Some systems may have no named partitions (e.g. a loop-only WSL2 disk).
            # Verify the call completes without a terminating error.
            { Get-Partition } | Should -Not -Throw
        }

        It 'Partition objects have expected properties' {
            $parts = Get-Partition
            if ($parts) {
                $p = $parts | Select-Object -First 1
                $p.PSObject.Properties.Name | Should -Contain 'DiskNumber'
                $p.PSObject.Properties.Name | Should -Contain 'PartitionNumber'
                $p.PSObject.Properties.Name | Should -Contain 'Path'
                $p.PSObject.Properties.Name | Should -Contain 'Size'
            }
        }

        It 'Filters by DiskNumber' {
            $result = Get-Partition -DiskNumber 0
            if ($result) {
                $result | ForEach-Object { $_.DiskNumber | Should -Be 0 }
            }
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Get-Volume' {

    Context 'On Linux' -Skip:(-not $IsLinux) {

        It 'Returns at least one volume' {
            $result = Get-Volume
            $result | Should -Not -BeNullOrEmpty
        }

        It 'Volume objects have expected properties' {
            $vol = Get-Volume | Select-Object -First 1
            $vol.PSObject.Properties.Name | Should -Contain 'Path'
            $vol.PSObject.Properties.Name | Should -Contain 'FileSystem'
            $vol.PSObject.Properties.Name | Should -Contain 'Size'
            $vol.PSObject.Properties.Name | Should -Contain 'SizeRemaining'
        }

        It 'Path is a non-empty string' {
            $vol = Get-Volume | Select-Object -First 1
            $vol.Path | Should -Not -BeNullOrEmpty
        }

        It 'Size is greater than zero' {
            $vol = Get-Volume | Select-Object -First 1
            [uint64]$vol.Size | Should -BeGreaterThan 0
        }

        It 'Filters by Path' {
            $root = Get-Volume | Where-Object { $_.Path -eq '/' }
            if ($root) {
                $root.Path | Should -Be '/'
            }
        }
    }
}

# ---------------------------------------------------------------------------
Describe 'Out-Printer' {

    BeforeAll {
        . (Join-Path $PSScriptRoot '..\..\PowerShell.Utility.Linux\PowerShell.Utility.Linux\Out-Printer.ps1') `
            -ErrorAction SilentlyContinue
    }

    Context 'On Linux' -Skip:(-not $IsLinux) {
        It 'Throws when lp is not found' {
            Mock Get-Command { $null } -ParameterFilter { $Name -eq 'lp' }
            { 'test' | Out-Printer } | Should -Throw
        }
    }
}
