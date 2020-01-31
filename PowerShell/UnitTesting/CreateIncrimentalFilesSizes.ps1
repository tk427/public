<#
.SYNOPSIS
    Generates Files of Random Size
    Code Author     : Tim Fox
    Dependencies    : Local File Access
    Creation Date   : 08/01/2019 13:05 PM 
    Code Version    : 20190801-1
    
.DESCRIPTION
    Generates Files of Random Size for use in testing other PowerShell Scripts that interact with Files.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

clear-host
$count = 1
$size = 20
# $size = Get-Random -Minimum 1024 -Maximum 2048
$stime = get-date # Start Time

Write-Host Task Starting at $stime
while ($count -lt 23713)
    { # Start of While Loop
        $f = new-object System.IO.FileStream E:\child\$count.txt, Create, ReadWrite
        $f.SetLength($size)
        $f.Close()
    $size = $size + 20 # Comment line to make all the files the same size
#    clear-host
#    write-host Current File: $count
	$count++
    } # End of While Loop
$size = "{0:N2} GB" -f ((Get-ChildItem e:\child\ -Recurse |
    Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB)
$etime = get-date # End Time
$rtime = $etime - $stime #Running Time
Write-Host Task ran for $rtime and takes up $size # Status of Task
