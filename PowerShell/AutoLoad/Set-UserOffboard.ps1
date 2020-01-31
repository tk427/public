<#
.SYNOPSIS
Automates offboarding of user's AD Account
Code Author : Tim Fox
Dependencies : modules, (include permission types, e.g., admin account)
Creation Date : 08/23/2019 15:10 PM
Code Version : 20190823-2
	
.DESCRIPTION
Offboards users AD Account by disabling the account, moving the object to a pending deletion OU, updating the description with a date
30 days in the future as a quick reference of when the account can be deleted, & generates a CSV report of the groups that user was
a member of for future reference or onboarding of their replacement.
This is the inital build that only handles Active Directory.  Future goals are to add file permissions, SQL Permissions, Office 365, and other
facets of the user offboarding process.
	
OPTIONAL parameter include
.PARAMETER
PARAMETER NAME
PARAMETER DESCRIPTION
OPTIONAL parameter include
	
.EXAMPLE
Offboard-ADUser <SAMAccountName>
	
.NOTES
#>

function Set-UserOffboard
    { # Start of Function Code
        param($user = $(Throw"Requires a UserName (SAMAccountName)"));
        $servers = "s-ads-prd-dc1.contoso.local", "s-ads-prd-dc1.contoso.org"
        $DeleteDate = (get-date).adddays(31) # Gets Date X Days in the future
        $DeleteDate = Get-Date $DeleteDate –format MM-dd-yyyy # Formats Future Date to MM-DD-YYYY
        $DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop) # Sets Desktop Path Variable for Output File
        ForEach ($server in $servers)
            { # Start of ForEach 
                # Gets AD Properties of AD User Account
                $username = get-aduser -identity $user -server $server # Gets AD Info for User
                $UPN = $username.UserPrincipalName # Generates UPN for output filename
                $Domain=$UPN.Split(".")[1] # Captueres the domain type (Org/Local/Com)
                $DisableOU = "OU=Disabled Accounts,OU=SERS,DC=contoso,DC=$domain" # Builds Disabled Accounts OU Path

                # Disables AD User Account
                Write-Host "Disabling User Account: "$upn -foregroundcolor "yellow" -backgroundcolor "black"
                Disable-ADAccount –identity $username.DistinguishedName -server $server
                
                # Sets AD User Object Descruiption with Date to Delete for both domains
                Write-Host "Setting Description to pending deletion on $DeleteDate" -foregroundcolor "yellow" -backgroundcolor "black"
                Set-ADUser –identity $username.DistinguishedName –Description “User Account Pending Deletion on $DeleteDate” -server $server
                
                # Moves AD User Object to Pending Deletion OU for both domains
                Write-Host "Moving $username.DistinguishedName to Pending Deletion OU" -foregroundcolor "yellow" -backgroundcolor "black"                Move-ADObject –identity $username.DistinguishedName -TargetPath $DisableOU -server $server
                
                # Generates AD User Object Report for both domains
                Write-Host "Generating AD Group Membership Object Report for"$upn -foregroundcolor "yellow" -backgroundcolor "black"
                get-adprincipalgroupmembership $user -server $server |
                    select-object Name, GroupCategory, GroupScope |
                    Sort-Object Name
                    export-csv "$DesktopPath\$upn AD Membership.csv" –NoTypeInformation
            } # End of ForEach
    } # End of Function Code