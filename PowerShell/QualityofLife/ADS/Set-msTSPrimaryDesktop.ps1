<#
.SYNOPSIS
    Manages the msTSPrimaryDesktop Active Directory Attribute
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 09/11/2019 15:40 PM 
    Code Version    : 20190911-1
    
.DESCRIPTION
    Allows you to set, clear and report on the msTSPrimaryDesktop Active Directory Attribute.  This
    attribute is used to map users to desktops for terminal services.
#>

#Set User to their Computer
Set-ADUser <SAMAccountName> –replace @{msTSPrimaryDesktop="CN=desktop1,OU=workstations,DC=contoso,DC=com"}

#Clear Attribute
Set-ADUser <SAMAccountName> –clear msTSPrimaryDesktop

#List all users who have the Attribute set
Get-ADUser -Filter * -Properties msTSPrimaryDesktop | 
    Where-Object { $_.msTSPrimaryDesktop -ne  $null } | Sort-Object name |
    Format-Table Name, SAMAccountName, msTSPrimaryDesktop -auto

#List all users who have the Attribute set & generate a CSV file on the runas user's desktop
Get-ADUser -Filter * -Properties msTSPrimaryDesktop | 
    Where-Object { $_.msTSPrimaryDesktop -ne  $null } | 
    Sort-Object name | 
    select-object Name, SAMAccountName, MSTSPrimaryDesktop | 
    export-csv $homepathdesktop\RDS_Users.csv -NoTypeInformation
