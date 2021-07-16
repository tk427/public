<#
.SYNOPSIS
    Generates Files of Increasing Size
    Code Author     : Tim Fox
    Dependencies    : Local File Access
    Creation Date   : 08/01/2019 13:05 PM 
    Code Version    : 20190801-1
    
.DESCRIPTION
    Generates Files of increasing Size for use in testing other PowerShell Scripts that interact with Files.  The script can
    be manually by hard coding varibles, or can have the variables randomized for more realistic results.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

$DestPath ="F:\child" # Destination Path
$pass = Get-Random -Minimum 1 -Maximum 7
# $pass = 1 # Comment line to generate Random Number
$number = Get-Random -Minimum 1 -Maximum 99
# $number = 1 # Comment line to generate Random Number
$minutes = Get-Random -Minimum 1 -Maximum 5
# $minutes = 2 # Comment line to generate Random Number
$c_pass = $pass

do {
    clear-host
    $timeout = new-timespan -Minutes $minutes
    $count = Get-Random -Minimum 1 -Maximum 99
    # $count = 1 # Comment line to generate Random Number
    $sw = [diagnostics.stopwatch]::StartNew()
    $length = Get-Random -Minimum 1 -Maximum 999999
    # $length = 10000 # Comment line to generate Random Number
    while ($sw.elapsed -lt $timeout){
        clear-host
        write-host $c_pass Passes Total - $pass Passes Left
        write-host $sw.elapsed.minutes minutes out of $minutes minutes has elapsed in this Pass
        write-host Files Larger than $length kb will be deleted at the end of the Pass
        write-host File $count
        get-childitem $DestPath -Recurse | out-file $DestPath\$count.txt -Append
        $count = $count + $number
    }
    $number++
    $pass--
    Get-ChildItem $DestPath\ -recurse | where-object {$_.length -gt $length} | Remove-Item
    Clear-RecycleBin -force
#    Start-Sleep -s 10
} until ( $pass -eq 0)
# $etime = get-date
# $timetaken = $etime - $stime
# Write-Host "This Job took "$timetaken
Write-Host `nJob Complete