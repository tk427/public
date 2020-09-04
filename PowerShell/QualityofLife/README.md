# QualityofLife_PS_Scripts
Various scripts that do not fit under the autoload repo

This Repo includes:
* Active Directory Related Scripts
  * Set-msTSPrimaryDesktop.ps1 - Allows you to set the msTSPrimaryDesktop AD Attribute for users and map desktops for Terminal Services
  * Password-ExpirationReport.ps1 - Generates a notification to the user and a report to helpdesk of expiring AD Passwords
* Misc
   * Remove-FolderSpaces.ps1 - Script that recursively removes spaces from any folder names under the root folder
 * VDC
   * Daily-VMSnapshotReport.ps1 - Generates an email report of VMWare vCenter Snapshots and the servers they are assoicated with
 * WDS
   * Get-WSUSGroupMemberships.ps1 - Lists the members of various predefined WSUS Groups for patch tracking
 * WS
   * WorkStation-Restart.ps1 - Script that restarts all machines in a specific AD OU that do not have the exception flag set
