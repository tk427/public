<#
    .SYNOPSIS
        Outputs text to a text file from the command line, or internal to a script.
        Code Author     : Tim
        Dependencies    : N/A
        Creation Date   : 05/15/2022 09:50 AM 
        Code Version    : 20220515-1
        
    .DESCRIPTION
        Writes a string of text to an output file as a way to make inline notes from the command prompt,  or internal to a script.
    OPTIONAL parameter include Any string of text wrapped in double quotes.
    .PARAMETER PARAMETER NAME
        Any string of text wrapped in double quotes.
    OPTIONAL parameter include
    .EXAMPLE
    .NOTES
        Does not seem to function on PowerShell v5.1!!!!!!!!!
#>

Function Write-Note
{
    param($message);
    $date = Get-Date -Format "dddd MM/dd/yyyy HH:mm:ss K"
    Write-Host $date - $message
    "$date - $message" | Out-File "D:\code\PowerShellTranscripts\$env:username\$(get-date -f yyyy-MM-dd)-Notes.txt" -Append
}
