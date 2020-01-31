<#
.SYNOPSIS
    Changes the Last Write Time of Files
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/13/2019 09:36 AM 
    Code Version    : 20190813-1
    
.DESCRIPTION
    Script changes the Last Write Time of files based on the number in their filenames.  This is useful if you are testing a script that
    filters or modifies scripts based on last write time.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

$DestPath = "d:\child" # Destination Path

Get-ChildItem  $destpath\*1*.txt | % {$_.LastWriteTime = '07/23/2019 06:00:36'}
Get-ChildItem  $destpath\*2*.txt | % {$_.LastWriteTime = '07/24/2019 06:00:36'}
Get-ChildItem  $destpath\*3*.txt | % {$_.LastWriteTime = '07/25/2019 06:00:36'}
Get-ChildItem  $destpath\*4*.txt | % {$_.LastWriteTime = '07/26/2019 06:00:36'}
Get-ChildItem  $destpath\*5*.txt | % {$_.LastWriteTime = '07/27/2019 06:00:36'}
Get-ChildItem  $destpath\*6*.txt | % {$_.LastWriteTime = '07/29/2019 06:00:36'}
Get-ChildItem  $destpath\*7*.txt | % {$_.LastWriteTime = '07/01/2019 06:00:36'}
Get-ChildItem  $destpath\*8*.txt | % {$_.LastWriteTime = '06/01/2019 06:00:36'}
Get-ChildItem  $destpath\*9*.txt | % {$_.LastWriteTime = '08/01/2018 06:00:36'}
Get-ChildItem  $destpath\*10*.txt | % {$_.LastWriteTime = '07/22/2019 06:00:36'}
