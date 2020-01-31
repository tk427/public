<#
.SYNOPSIS
    Issues a restart command to all computers in a specific OU.
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 09/20/2019 13:07 PM 
    Code Version    : 20190920-1
    
.DESCRIPTION
        Issues a restart command to all computers in a specific OU.  This script also parses the comments
        AD Attribute for "noreboot" and filters those machines out.  This script is designed to run as a
        scheduled task.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>
Import-Module ActiveDirectory -ErrorAction SilentlyContinue
$count = 0 # Resets Counter Variable to 0

While ($computers -eq $null) # Loops using get-adcomputer command until $computers variable is NOT null
    { # Start of While Loop
        $computers = get-adcomputer -filter * -searchbase "OU=WS,DC=contoso,DC=com" -server s-ads-prd-dc1.contoso.com -properties comment | 
            where { $_.comment -ne "noreboot" } | 
            select-object name | 
            sort-object Name
            $count ++ # Adds 1 to current counter number
            If ($count -gt 25) {break} # If the command runs unsuccessfully for more than 25 times, the script will close.   
    } # End of While Loop

$sdate = get-date # Start Date/Time

foreach ($Computer in $Computers) 
    { # Beginning of ForEach
        $name = $Computer.Name
        Write-host $name
        cmd.exe /c "shutdown /r /t 900 -c "Your Computer will restart in 15 Minutes." /f /m \\$name"
    } # End of ForEach

$edate = get-date # End Date/Time
$cdate = $edate - $sdate # Run Date/Time of the Script
Write-Host `nJob Started at $sdate -ForegroundColor green # writes Status message
Write-Host Job Complete at $edate -ForegroundColor green # writes Status message 
Write-Host Job Elapsted Time: $cdate -ForegroundColor yellow # writes Status message

<#
Get List of Computers that will be rebooted
get-adcomputer -filter * -searchbase "OU=WS,DC=contoso,DC=com" -properties comment | 
    where-onbect { $_.comment -ne "noreboot" } | 
    sort-object name | select-object Name, Comment, Description, DistinguishedName
get-adcomputer -filter * -searchbase "OU=WS,DC=contoso,DC=com" -properties comment | 
    where { $_.comment -ne "noreboot" } | 
    sort-object name | select-object Name

    Get List of Computers that will NOT be rebooted
get-adcomputer -filter * -searchbase "OU=WS,DC=contoso,DC=com" -properties comment -server s-dc-prod01 | 
    where { $_.comment -eq "noreboot" } | 
    sort-object name | 
    select-object Name, Comment, Description, DistinguishedName

    Set Attribute for Computer
Set-ADComputer <computer> –replace @{comment="noreboot"}

Clear attribute from Computer
Set-ADComputer <computer> –clear comment
#>
