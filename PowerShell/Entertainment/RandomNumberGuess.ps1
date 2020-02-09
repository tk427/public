Do {
	[int]$num = Get-Random -Minimum 0 -Maximum 100
    Do {
        [int]$guess = Read-Host "`nPlease guess a number between 0 & 100"
        If ($guess -gt $num) {Write-Host "`nThat number is too high" -ForegroundColor magenta}
        If ($guess -lt $num) {Write-Host "`nThat number is too low" -ForegroundColor magenta}
        If ($guess -eq $num) {Write-Host "`nThat is Correct!!!!" -ForegroundColor cyan}
        }
    While ($guess -ne $num)
    $again = Read-Host "`nWould you like to play again? (Y/n)"
    }
    Until ($again -ne "Y")
