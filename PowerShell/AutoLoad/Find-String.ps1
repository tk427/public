<#
.SYNOPSIS
    Searches for String of Text Provided
    Code Author     : Tim
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/09/2019 11:53 AM 
    Code Version    : 20190809-1
    
.DESCRIPTION
    Recursively Searches for String of Text Provided and display on the screen or output to a text file.

OPTIONAL parameter include
.PARAMETER PARAMETER <Search String>
    String of Text You want to Search For
OPTIONAL parameter include > <filepath\filename> to outout a text file too
.EXAMPLE
    find-string computer
    find-string-computer > c:\temp\computer.txt
.NOTES
#>

function Find-String {param($string = $(Throw "Requires a string of text!"));(Get-ChildItem -recurse | 
    Select-String -pattern $string) |
    ForEach-Object {$_.Path+"`n"+$_.FileName+"`n"+$_.LineNumber+':'+$_.Line+"`n"}}