<#
.SYNOPSIS
    Examples of Session Variables
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Examples of session variables you can set to be used during a PowerShell session.

.NOTES
#>

# Easier PowerShell Verions
$ver = $PSVersionTable.PSVersion

# Sets Scripts Output Path
$ScriptsOutPut = "C:\code\ScriptsOutput"

# Sets desktop working folder
$WorkingPath = "$DesktopPath\working"

# Sets PowerShell Path
$PowerShellPath = "C:\code\PowershellScripts"

#Sets a Variable to your mapped desktop folder
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
