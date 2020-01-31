<#
.SYNOPSIS
    Generates Random Dice Rolls  
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Generates Random Dice Rolls.  This was an early on PowerShell exercise in generating random
    numbers for a D&D style process.  I need to rewrite this to 

.NOTES
#>

# Function to roll dice.  Run Script, and then you can enter "roll" to start the script anytime.
# This file can be saved in a specific place so that it is loaded when powershell starts.

Function roll
{
    [int]$counter = 0
    [int]$dice = Read-host "What is the Number of Dice? (default is 2)"
        If (!($dice)) {$dice = 2}
    [int]$sides = Read-host "What is the Number of Sides?(default is 20)"
        If (!($sides)) {$sides = 20}

        Write-Host `n

    Do {
        $counter = $counter + 1
        $num = get-random -min 1 -max $($sides + 1)
#        Write-Host "Rolling $diced$sides"
        Write-Host "Dice #"$counter": "$num -ForegroundColor "magenta"
        } until ($counter -eq $dice)
    }