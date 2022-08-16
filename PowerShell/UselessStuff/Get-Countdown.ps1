<#
    Counts down to a specific date/time
#>


$i= "true"
$TargetDate = "8/19/2022 16:00:00"
Clear-Host

Do
{
    # Clear-Host
    Write-Host "Time until"$TargetDate":"
    Write-Host " Days, Hours, Minutes, Seconds"
    New-TimeSpan -Start (Get-Date) -End ([datetime]$TargetDate) | Select-Object Days, Hours, Minutes, Seconds
    # Start-Sleep -Seconds 1
    Start-Sleep -Milliseconds 900
    Clear-Host
}
until ($i -ne "true")