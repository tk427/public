<#
.SYNOPSIS
    Recursively removes spaces from folder path names
    Original Code Author    : Unknown
    Update Code Author      : Tim Fox
    Dependencies            : modules, (include permission types, e.g., admin account)
    Creation Date           : 9/4/2020
    Update Date             : 09/04/2020
    Code Version            : 20200904-1
.DESCRIPTION
    Recursively removes spaces from folder path names
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
    Remove-FolderSpaces.ps1 from the root folder you want to target
.NOTES
#>

$folders = Get-ChildItem -Path d:\scripts -Recurse -Directory

foreach ($folder in $folders)
{
    if ($folder.Name.Contains(" "))
    {
        Rename-Item -Path $folder.FullName $folder.Name.Replace(" ","")
    }
}