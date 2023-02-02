<#
.SYNOPSIS
    Moves the mouse a small ammount to keep the display from going to sleep.  This will not prevent the computer
    from going to sleep.  I did not completely write this script, I only modified a version I found at the following 
    URL: https://gist.github.com/MatthewSteeples/ce7114b4d3488fc49b6a
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 04/14/202020 9:07 AM 
    Code Version    : 20200414-1
    
.DESCRIPTION
        Moves the mouse a small ammount to keep the display and possibly the entire computer from going to sleep.  
        This is useful if you are watching a streaming video and you do not want your stream to be interupted.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
      Run script, leave PowerShell open in the background.
.NOTES
    THIS SCRIPT IS NOT FUNCTIONAL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#>

Clear-Host
Echo "Moving mouse..."
Add-Type -AssemblyName System.Windows.Forms

$PlusOrMinusY = Get-Random -Minimum -30 -Maximum 30 #Modify the numbers to change the amount the mouse uses
$PlusOrMinusX = Get-Random -Minimum -30 -Maximum 30 #Modify the numbers to change the amount the mouse uses
while ($true)
{
  $p = [System.Windows.Forms.Cursor]::Position
  $x = $p.X + $PlusOrMinusX
  $y = $p.Y + $PlusOrMinusY
  [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
  Start-Sleep -Seconds 900
  $PlusOrMinusY = Get-Random -Minimum -30 -Maximum 30 #Resets the amount the mouse moves within the constraints
  $PlusOrMinusX = Get-Random -Minimum -30 -Maximum 30 #Resets the amount the mouse moves within the constraints
}
