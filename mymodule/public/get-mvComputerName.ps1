function get-mvcomputername {
    $cn = $env:COMPUTERNAME
 Write-host Computername is $cn

}

get-mvcomputername
