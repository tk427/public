<#
.SYNOPSIS
    Tim's Personalized PowerShell Profile

    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    PowerSHell Profile script that auto loads the contents of the autoload folder for a custom PowerShell
    enviorment.
    C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include

.EXAMPLE

.NOTES

#>

Clear-Host
# Turns On Transcription
start-transcript -path "D:\code\PowerShellTranscripts\$env:username\$(get-date -f yyyy-MM-dd)-PS.txt" -Append

# directory where my scripts are stored
$autoload="D:\code\Repos-Private\Autoload" 

# load all scripts in autoload folder
Get-ChildItem "${autoload}\*.ps1" | ForEach-Object{.$_}
Set-Location D:\code\

# Welcome message
Write-Host "`nYou are now entering a custom PowerShell Environment : "$env:userDomain\$env:Username -foregroundcolor "black" -backgroundcolor "yellow"`n