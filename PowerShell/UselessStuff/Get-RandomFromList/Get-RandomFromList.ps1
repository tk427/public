<#
.SYNOPSIS
    Inputs a list and selects items from it
    Code Author     : Tim Fox
    Dependencies    : Local File Access
    Creation Date   : 11/20/2019 13:05 PM 
    Code Version    : 20191120-1
    
.DESCRIPTION
    Generates a list of "winners" from a list input from a text file.  This can be as many "winners" as you choose from the input selection.  The script removes "winners" from the list
    so that they cannot be selected again.  This does not handle duplicate entries (IE two people named "Scott").
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

clear-host
$date = Get-Date -Format "MM-dd-yyy HH:mm"
$inputfile = "D:\Temp\RandomNamePicker\input.txt" # Input File
$outputfile ="D:\Temp\RandomNamePicker\winners_$date.txt" # Output File formatted with date/time
remove-item $outputfile # Removes the previous output file
$names = New-Object System.Collections.ArrayList # Creates new Array
$names.AddRange((get-content $inputfile)) # Imports Input File into Array

[uint16]$count = Read-Host "Enter the number of Selections" # Reads input of number of selections and stores it as an interger

do {
    # Selects a random item from $names
    $selection = Get-Random -InputObject $names # Selects a Name from the List
    $names.Remove("$selection") # Removes the selected name from the array

    $date = Get-Date -Format "MM-dd-yyy HH:mm:ss" # Generates a TimeStamp
    write-host "`nThe Winner is: $selection @ $date" # Writes Selection to the console
    Add-Content $outputfile "Winner is $selection @ $date" # Writes Selection to the Output File

    write-host "`nNames Left in the Pool: $names" # Outputs the rest of the list sans the selected Name
    $count--
    Start-Sleep -s 2
    } 
    until ( $count -eq 0)