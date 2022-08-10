$i= "true"
$TargetDate = "8/19/2022 16:00:00"

Do
{
    Write-Host "Time until"$TargetDate":"
    Write-Host "Days, Hours, Minutes, Seconds"
    New-TimeSpan -Start (Get-Date) -End ([datetime]$TargetDate) | Select-Object Days, Hours, Minutes, Seconds
    Start-Sleep -Seconds 1
    Clear-Host
}
until ($i -ne "true")