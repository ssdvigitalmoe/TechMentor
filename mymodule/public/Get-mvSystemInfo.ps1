Function get-mvComputerInfo{
    $osinfo = get-ciminstance -class win32_operatingsystem
    $cs=get-ciminstance -class Win32_ComputerSystem
    $csb =get-ciminstance -class Win32_BIOS
    $ld=get-ciminstance -class Win32_LogicalDisk
    
    [PSCustomObject]@{
        Name = $env:COMPUTERNAME
        Domain = (whoami).split("\") |select-object -Index 0
        OS = ($osinfo.name).split("|")|select-object -index 0
        Model = $cs.Model
        MachineSN = $csb.SerialNumber
        Version = $osinfo.Version
        BuildNumber = $osinfo.BuildNumber
        OSArchitecture = $osinfo.OSArchitecture
        PSVersion = $PSVersionTable.PSVersion
        DiskFreeSpace = ($ld|where-object -Property DeviceID -eq "C:").deviceid + [math]::round(($ld|where-object -Property DEviceID -eq "C:").FreeSpace /1gb,2) + " GB"                    }
    }
    
    get-mvComputerInfo
