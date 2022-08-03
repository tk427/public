# chrome-extension://fiabciakcmgepblmdkmemdbbkilneeeh/park.html?title=powershell%20-%20How%20to%20send%20CTRL%20or%20ALT%20%2B%20any%20other%20key%3F%20-%20Stack%20Overflow&url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F19824799%2Fhow-to-send-ctrl-or-alt-any-other-key&tabId=2783&sessionId=1658624287609&icon=https%3A%2F%2Fcdn.sstatic.net%2FSites%2Fstackoverflow%2FImg%2Ffavicon.ico%3Fv%3Dec617d715196

$val = 0
Do 
{
    $wait = get-random -minimum 37 -maximum 103
    $val++
    # Activating the Windows Key
    Add-Type -AssemblyName System.Windows.Forms
    # [System.Windows.Forms.SendKeys]::SendWait('^{ESC}')
    # [System.Windows.Forms.SendKeys]::SendWait('{ESC}')
    [System.Windows.Forms.SendKeys]::SendWait('{F16}')
    Start-sleep $wait
} 
while($val -ne 50)