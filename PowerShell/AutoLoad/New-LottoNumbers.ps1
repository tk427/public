<#
.SYNOPSIS
    Generates Random Lottery Numbers  
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Generates Random Lottery Numbers.  This was an early on PowerShell exercise in generating random
    numbers for a lottery.  I should have created a revision that used a read-host to ask the user
    how many numbers and the range.  I will have to work on recovering/rewriting that functionality.

.NOTES
#>
Function megamillions
{
    Clear-Host
    
    $n1 = get-random -min 1 -max 75
    $n2 = get-random -min 1 -max 75
    $n3 = get-random -min 1 -max 75
    $n4 = get-random -min 1 -max 75
    $n5 = get-random -min 1 -max 75
    $mm = get-random -min 1 -max 15

    Write-host ""
    Write-host "1st Number: "$n1
    Write-host "2nd Number: "$n2
    Write-host "3rd Number: "$n3
    Write-host "4th Number: "$n4
    Write-host "5th Number: "$n5
    Write-host `n"Mega Millions: "$mm`n
}