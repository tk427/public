# https://stackoverflow.com/questions/19824799/how-to-send-ctrl-or-alt-any-other-key
$val = 0
Do 
{
    $wait = get-random -minimum 37 -maximum 103 # number of seconds to wait
    $val++ # incriminate value number
    $keypress = Get-Random -Minimum 0 -Maximum 12 # Must be atleast 1 greater than the options below
    Add-Type -AssemblyName System.Windows.Forms
    Switch ($keypress)
    {
        "0" {[System.Windows.Forms.SendKeys]::SendWait('{F16}')} # <F16> Key
        "1" {[System.Windows.Forms.SendKeys]::SendWait('{F15}')} # <F15> Key
        "2" {[System.Windows.Forms.SendKeys]::SendWait('{F14}')} # <F14> Key
        "3" {[System.Windows.Forms.SendKeys]::SendWait('{LEFT}')} # Left Arrow Key
        "4" {[System.Windows.Forms.SendKeys]::SendWait('{RIGHT}')} # Right Arrow Key
        "5" {[System.Windows.Forms.SendKeys]::SendWait('{UP}')} # Up Arrow Key
        "6" {[System.Windows.Forms.SendKeys]::SendWait('{LEFT}')} # Left Arrow Key
        "7" {[System.Windows.Forms.SendKeys]::SendWait('{RIGHT}')} # Right Arrow Key
        "8" {[System.Windows.Forms.SendKeys]::SendWait('{UP}')} # Up Arrow Key
        "9" {[System.Windows.Forms.SendKeys]::SendWait('{DOWN}')} # Up Arrow Key
        Default {[System.Windows.Forms.SendKeys]::SendWait('^{ESC}''{ESC}')} # Opens the Windows Menu and closes it

    }
    Start-sleep $wait
} 
while($val -ne 50)
