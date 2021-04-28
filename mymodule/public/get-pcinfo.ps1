<#
.SYNOPSIS
    Get-mvComputerInfo
.DESCRIPTION
    Will output Version and Arch from WMI win32_operatingsystem
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>


Function get-mvComputerInfo{
$osinfo = get-ciminstance -class win32_operatingsystem

[PSCustomObject]@{
    Version = $osinfo.Version
    OSArchitecture = $osinfo.OSArchitecture
                }
}

get-mvComputerInfo
