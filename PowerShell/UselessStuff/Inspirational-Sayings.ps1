Function Inspirational-Sayings
{
    $Number = Get-Random -Minimum 0 -Maximum 15 # Must be atleast 1 greater than the options below
    Switch ($Number)
    {
        "0" {Write-Host `n'BY THE POWER OF GRAYSKULL!!!!' -ForegroundColor Yellow}
        "1" {Write-Host `n'Who you gonna call?....Ghostbusters!' -ForegroundColor Green}
        "2" {Write-Host `n'Do or do not.  There is no try.' -ForegroundColor Cyan}
        "3" {Write-Host `n'Transform and Roll Out' -ForegroundColor Magenta}
        "4" {Write-Host `n'Kaaaaaaaaaaahn!' -ForegroundColor Red}
        "5" {Write-Host `n"I'll be Back!" -ForegroundColor DarkCyan}
        "6" {Write-Host `n"I'm sorry, Dave.  I'm afraid I can't do that." -ForegroundColor Yellow}
        "7" {Write-Host `n'The first rule of Fight Club is: You do not talk about fight club.' -ForegroundColor Green}
        "8" {Write-Host `n'Understanding is a three edged sword.  Your side, their side, and the truth.' -ForegroundColor Cyan}
        "9" {Write-Host `n'May the odds be in your favor.' -ForegroundColor Magenta}
        "10" {Write-Host `n'I find your lack of faith disturbing.' -ForegroundColor Red}
        "11" {Write-Host `n"I'm your huckleberry." -ForegroundColor DarkCyan}
        "12" {Write-Host `n'Goonies Never Say Die!' -ForegroundColor Yellow}
        "13" {Write-Host `n'Fear is the mind killer.' -ForegroundColor Yellow}
        "14" {Write-Host `n'Greetings Programs!.' -ForegroundColor Yellow}
        Default {Write-Host `n'THE CAKE IS A LIE' -ForegroundColor Gray}
    }
}