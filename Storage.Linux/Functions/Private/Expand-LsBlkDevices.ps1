# Private helper: Expand-LsBlkDevices
# Recursively flattens lsblk blockdevices tree (including children/partitions).
# Not exported.

function Expand-LsBlkDevices {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [object[]] $Devices
    )
    process {
        foreach ($d in $Devices) {
            $d
            if ($d.children) {
                Expand-LsBlkDevices -Devices $d.children
            }
        }
    }
}
