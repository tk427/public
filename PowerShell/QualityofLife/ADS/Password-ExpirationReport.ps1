<#
.SYNOPSIS
    Generates a notification email to a user that their password is going to expire in X Days.
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 09/20/2019 13:01 PM 
    Code Version    : 20190920-1
    
.DESCRIPTION
    Generates a notification email to a user that their password is going to expire in X Days.  It also
    sends a daily report to your helpdesk so that they know who's password is expiring if they contact the
    helpdesk.  This script is designed to run as a scheduled task.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>


Clear-Host # Clears Terminal Screen
Import-Module ActiveDirectory -ErrorAction SilentlyContinue # Imports AD Module
Remove-Variable * -ErrorAction SilentlyContinue # Clears Variables
$smtpserver = "mail.contoso.com" # Sets Mail Server
$logdate = Get-Date -format yyyyMMdd # Sets Date String
$today = Get-Date -format MM/dd/yyyy # Sets Date String
$mailFrom = "ITNotifications@contoso.com" # From Email Address
$MailTo = "ITServices@contoso.com" # IT Services Email Address
$LogPath = "D:\Scripts\ActiveDirectoryServices\PasswordExpiration\logs\PasswordExp_$logdate.txt" # Log Output Folder
New-Item -ItemType "file" -Path $LogPath -ErrorAction SilentlyContinue # Creates Blank Log File

# Defines the OU's we want to Parse AD User Objects In
$OUs = @("OU=Users,DC=contoso,DC=com", "OU=Privileged Accounts,DC=contoso,DC=com")
$ulist = @() # Clears the working variable
foreach ($OU in $OUs)
    {
        $ulist += Get-ADUser -Filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} -SearchBase "$OU" -server s-ads-prd-dc1.contoso.com -Properties DisplayName, msDS-UserPasswordExpiryTimeComputed, mail, UserPrincipalName | 
            Where-Object {[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") -lt (Get-Date).AddDays(6) -and [datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed") -ge (Get-Date) -and $null -ne $_.mail}  | 
            Select-Object Displayname,samaccountname,mail, UserPrincipalName, @{Name="Expry";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} |
            Sort-Object Expry
    }

ForEach($u in $ulist)
    { # Start of ForEach
        $mail = $u.mail
        $mail = $mail.split("_""")[-1] # Strips the first charcater & underscore from Privileged email accounts.
        $mail = "$displayName `<$mail`>" # Formats the MailTo field to give the user's friendly name & email address
                $displayName = $u.DisplayName
        $UserPN = $u.UserPrincipalName
        $expiration = $u.Expry
        $expdays = (New-Timespan -Start (Get-Date) -End $expiration).Days
        $ddisplay = if($expdays -eq 1) {"day"} else {"days"}
        $subject = "Your Windows password will expire in $expdays $ddisplay please change your password."
        # $subject = "Your Windows password will expire in $expdays $ddisplay please change your password. - Debugging" # Used for debugging
        $msg = 
@"
            <b>$displayname, You are receiving this email for the account ($UserPN), as a reminder that your Windows password is going to expire soon. 
            Please take a moment <u>at this time</u> to change your Windows password to prevent loss of access to Contoso Systems.</b><br><br>  
        
            To change the password, follow these steps:<br><br> 
            Press <b>Ctrl-Alt-Delete</b> and then select ""<b>Change a Password...</b>"" option from the list.<br><br>
            <b>*If your email is synchronized with your mobile phone, please remember to change that password at this time also.</b><br><br>
            If you experience issues changing your password, please contact the Help Desk at ext. 5309 or 555-867-5309.<br><br><br>
         
            Thank you,<br>
            IT Services 
"@
    Send-MailMessage -To $mail -From $mailFrom -Subject $subject -Body $msg -BodyAsHtml -SmtpServer $smtpserver # Sends Email to End User
    Add-Content $LogPath "Email was sent to $displayName ($UserPN) on $today with expiration $expdays $ddisplay" # Writes information to Text log file
    } # End of ForEach
    
# Send Daily Report to ITServices; If there are users that meet the criteria, a list of them is sent to ITServices, otherwise a message saying no accounts meet the criteria is sent to ITServices
If((Get-Item $LogPath).length -gt 0kb) 
{ # Beginning of If Statemment
    Send-MailMessage -To $MailTo -From $mailFrom -Subject "Password change log for $today" -Body "This is the log from $today" -Attachments $LogPath -SmtpServer $smtpserver # Emails IT Services with Text File Attached
} # End of If Statemment
    ELSE
{ # Beginning of Else Statement
    Send-MailMessage -To $MailTo -From $mailFrom -Subject "Password change log for $today" -Body "There are no User Accounts that meet this requirement of password expiring in less than 6 days." -SmtpServer $smtpserver # Emails IT Services to say no users match criteria 
    Add-Content $LogPath  "There are no User Accounts that meet this requirement of password expiring in less than 6 days."
} # End of Else Statement

# Deletes Log Files that have a creation date older than 90 days
Get-ChildItem –Path $LogPath |
    Where-Object {($_.CreationTime -lt (Get-Date).AddDays(-90))} |
        Remove-Item -Force  -ErrorAction SilentlyContinue