<#
.SYNOPSIS
    Creates Blank PowerShell Header
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Creates Blank PowerShell Header with some specific information filled out that can be copied and
    pasted into a script or can be used to start coding a script .
OPTIONAL parameter include
.PARAMETER PARAMETER Script Name
    The Filename portion of the script you want to create
OPTIONAL parameter include
.EXAMPLE
    "Create-ScriptTemplate Backup" would create a file called Backup.ps1 in the directory
    specfied as a variable below.
.NOTES
#>

function New-ScriptTemplate 
{
    param($scriptName = $(Throw "Requires a valid string of text"));
    $user = $env:username
    $today = Get-Date -format 'MM/dd/yyyy HH:mm tt' # Sets Date String
    $version =  Get-Date -format yyyyMMdd
    $body = "<#
    .SYNOPSIS
        What the heck does this thing do?
        Code Author     : $user
        Dependencies    : modules, (include permission types, e.g., admin account)
        Creation Date   : $today 
        Code Version    : $($version)-1
        
    .DESCRIPTION
        Detailed things about this script.
    OPTIONAL parameter include
    .PARAMETER PARAMETER NAME
        PARAMETER DESCRIPTION
    OPTIONAL parameter include
    .EXAMPLE
    .NOTES
    #>"
    $body | Add-Content "$scriptName.ps1" 
}