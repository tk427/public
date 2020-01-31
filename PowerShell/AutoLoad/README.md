# PowerShellAutoLoad
Auto-loaded PowerShell Quality of Life Scripts.

Various Functions, alaises, and variables that imrpove your quality of live and are auto loaded with PowerShell(ISE) or Visual Studio Code.  The scripting mainly focuses on Windows Active Directory management.  This idea came from lessions I learned in PowerShell and provides a framework for Quality of Life Improvements for PowerShell Scripting.  Some of these items are real world tools that I use on a regular basis, others were proof of concepts that didn't have good real world applications.

This Repo includes
* PowerShell Profile Examples
  * Microsoft VSCode
    * Set's Working Folder
    * Loads AutoLoad Folder
    * Sets PowerShell Transcription _(Seperate Transcript for Each Interpreter)_
  * Microsoft PowerShell
    * Set's Working Folder
    * Loads AutoLoad Folder
    * Sets PowerShell Transcription _(Seperate Transcript for Each Interpreter)_
  * Microsoft PowerShell ISE
    * Set's Working Folder
    * Loads AutoLoad Folder
    * Sets PowerShell Transcription  _(Seperate Transcript for Each Interpreter)_
 * <a href="https://devblogs.microsoft.com/scripting/understanding-the-six-powershell-profiles/">Understanding the Six PowerShell Profles</a> - _Reference Link_
  * <a href="https://wagthereal.com/2017/08/25/visual-studio-code-powershell-profile/">Visual Studio Code PowerShell Profile</a> - _Reference Link_
* PowerShell Session Functions
   * Get-IPv4Address - _Gets IPv4 Address of local Machine_
   * Get-IPv6Address - _Gets IPv6 Address of local Machine_
   * Get-IPvAddress - _Gets All IP Address of local Machine_
   * Convert-ToBinary - _Converts Base 10 Number to Base 2 Number_
   * Convert-ToHex - _Converts Base 10 Number to Base 16 Number_
   * Convert-FromBinary - _Converts Base 2 Number to Base 10 Number_
   * Convert-ToSeconds - _Converts MS to Seconds_Un
   * Open-netdom - _Opens a Text file with instructions on Netdomming a computer_
   * Open-TelnetEmail - _Opens a Text file with instructions on logging into an email server with telnet_
   * UTC - _Displays the current time in UTC_
   * Backup-Scrupts - _backups up scripting folder to another folder/drive_
   * Whoami - _displays the name of the user the terminal us running as, just like MS-DOS_
   * Find-Computer - _Displays the CN of an AD Computer Object; must provide full machine name_
   * Find-User - _Displays the CN of an AD User Object; must provide full SAMAccountName_
   * Find-Group - _Displays the CN of an AD Group Object; must provide full group name_
   * Find-ADComputer - _Generates report based on partial machine or DNSHostName_
   * Find-ADUser - _Generates report based on partial user's name or SAMAccountName_
   * Find-ADGroup - _Generates report based on partial group name or SAMAccountName_
   * Get-DisabledUsers - _Generates a report of disabled AD User Objects_
   * Get-DisabledComps - _Generates a report of disabled AD Computer Objects_
   * Get-GCs - _Lists AD Global Catalog Servers_
   * Get-Workstations - _Lists all computers in a specific OU (workstations)_
   * Get-Servers - _Lists all computers in a specific OU (servers)_
   * Get-Machines - _Lists all computers in the domain_
   * Disable-Users - _Disables all AD User Objects in a predefined OU_
   * Disable-Computers - _Disables all AD Computer Objects in a predefined OU_
   * Get-PrimaryDesktop - _Lists all users with the AD Attribute MSTSPrimaryDesktop Attribute set & the CN of the computer they are mapped to_
   * Get-Version - _displays the value of $PSVersionTable_
   * Find-String - _Recursively searches current folder for a string of text provided and retunrs the filename & line number_
   * Get-LastUserLogon - _Lists the users's last log on to that specific Domain Controller_
   * Get-LastComputerLogon - _Lists the computer's last log on to that specific Domain Controller_
   * New-RandomFilename - _Generates a random filename to the terminal_
   * New-RandomFile - _Generates a random file in the current directory_
   * Set-ContPing - _Continous Ping that includes the time_
   * Unlock-User - _Unlocks AD User Object_
   * Disable-User - _Disables AD User Object_
   * Disable-Comp - _Disables AD Computer Object_
   * Get-DateCalc - _Caculates a date in the past/futue based on the numeric provided_
   * Get-GroupMembership_com - _Generates a CSV on your desktop of the groups the AD User is a member of (Multi Domain Enviorment)_
   * Get-GroupMembership_org - _Generates a CSV on your desktop of the groups the AD User is a member of (Multi Domain Enviorment)_
   * Get-Uptime - _Displays uptime for the local machine_
   * New-RandomPassword - _Generates a random password of the length specified.  Default is 128 charaters_
   * Offboard-ADUser - _Automates the AD Account Offboarding Process_
* PowerShell Session Alaises
  * ifconfig - _Maps IPConfig command to IPConfig_
  * view - _Maps to Start-Process; Add a filename and it will open the file with the default application_
  * edit - _Maps to Notepad application; Add a filename and it will open the file with Notepad_
  * exchange-console - _Launches Exchange Console Script_
  * FlushDNS - _FLushes DNS Cache with Clear-DnsClientCache_
* PowerShell Session Variables
  * $ScriptsOutPut - _Sets Scripts Output Folder Path_
  * $WorkingPath - _Sets Scripts Working Folder Path_
  * $PowerShellPath - _Sets Powershell Scripting Root Path_
  * $DesktopPath - _Sets Variable with the path to your desktop folder_
