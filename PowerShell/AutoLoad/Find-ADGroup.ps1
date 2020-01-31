<#
.SYNOPSIS
    Function to Search for AD Users Accounts
        
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/22/2019 09:51 AM
    Code Version    : 20190822-1
    
.DESCRIPTION
    Function to Search for AD Users with an approximate string match and generate a detailed report based on that.

OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include

.EXAMPLE
    Find-AdUser Tim

.NOTES
#> 

Function Find-ADUser ( [string] $UserName) {
$UserName = '*' + $UserName + '*'
Get-ADUser -Filter { Name -like $UserName -or SamAccountName -like $UserName} -Properties * | Out-GridView}
