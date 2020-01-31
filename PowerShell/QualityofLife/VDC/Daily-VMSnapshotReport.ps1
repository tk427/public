<#
.SYNOPSIS
    Daily VMWare Snapshot Report per vCenter
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 09/20/2019 12:50 PM 
    Code Version    : 20190920-1
    
.DESCRIPTION
    Generates an HTML report of snapshots on all of your VMWare vCenter servers and emails the reports
    to platform owners.  This script is desiged to be ran as a scheduled task from a service account that
    has read only rights to your vCenter servers.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

#Adds PowerCLI Module to script
Add-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue

# Number of days to go back for removal of old files
$limit = (Get-Date).AddDays(-35)

# HTML/CSS style for the output file
$head = "<style>"
$head = $head + "BODY{background-color:white;}"
$head = $head + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$head = $head + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
$head = $head + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:PaleGoldenrod}"
$head = $head + "</style>"

# SMTP info
$smtpServer = "mail.contoso.com" 
$strFrom = "ITOPSNotifications@contoso.com"
$strTo = "techsupport@contoso.com"
$strSubject = "Daily Snapshot Report - " + (get-date -DisplayHint date).ToString('MM-dd-yyy')
$strBody = "Attached is the Daily Snapshots Report for $Server"
$strMail = "<H2><u>" + $strSubject + "</u></H2>"

# List your vCenter servers in quotes separated by commas
$Servers="s-vctr-prd1.contoso.com", "s-vctr-dev1.contoso.com", "s-vctr-tst1.contoso.com", "s-vctr-prj1.contoso.com", "s-vctr-dr1.contoso.com"
foreach ($Server in $Servers)
	{ # Start of ForEach
		Connect-VIServer $Server
		$date=Get-Date -uFormat "%Y%m%d%H%M%S"
    		new-item D:\Scripts\VirtualDataCenter\DailySnapshotReport\Output\$Server -itemtype directory -ErrorAction SilentlyContinue
		$strOutFile = "D:\Scripts\VirtualDataCenter\DailySnapshotReport\Output\$Server\snapshot_list$date.htm"
		$strSubject = "Snapshot list $Server - "+ (get-date -DisplayHint date)
		# Get the list of VM's
		$vms = Get-VM
		$myCol = @()
		ForEach ($vm in $vms)
			{ # Start of Nested ForEach 1
				$snapshots = Get-SnapShot -VM $vm
				if ($snapshots.Name.Length -ige 1 -or $snapshots.length){
				ForEach ($snapshot in $snapshots)
					{ # Start of Nested ForEach 2
						$myObj = "" | Select-Object VM, Created, Snapshot, Description, SizeGB
						$myObj.VM = $vm.name
						$myObj.Created = $snapshot.created
						$myObj.Snapshot = $snapshot.name
						$myObj.Description = $snapshot.description
            					$myObj.SizeGB = $snapshot.SizeGB
						$myCol += $myObj
					} # End of Nested ForEach 2
			} # End of Nested ForEach 1
		} # End of ForEach

	# Write the output to an HTML file
	if ($myCol -ne $null)
		{
			$myCol | Sort-Object VM | ConvertTo-HTML -Head $head -Body $strMail | Out-File $strOutFile
			# Mail the output file
			$msg = new-object Net.Mail.MailMessage
			$att = new-object Net.Mail.Attachment($strOutFile)
			$smtp = new-object Net.Mail.SmtpClient($smtpServer)
			$msg.From = $strFrom
			$msg.To.Add($strTo)
			$msg.Subject = $strSubject
			$msg.IsBodyHtml = 1
			$msg.Body = Get-Content $strOutFile
			$msg.Attachments.Add($att)
			$msg.Headers.Add("message-id", "<3BD50098E401463AA228377848493927-1>")	# Adding a Bell Icon for Outlook users
			$smtp.Send($msg)}
			DisConnect-VIServer -Server * -Force -Confirm:$false
		}
