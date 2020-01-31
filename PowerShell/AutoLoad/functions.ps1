<#
.SYNOPSIS
    Examples functions in a PowerShell Session    
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20190805-1
    
.DESCRIPTION
    Examples functions in a PowerShell Session you can set to be used during a PowerShell session to 
    improve your quality of life and automate tasks.

.NOTES
#>
# Get IP Addresses of all IPv4 Adapters
function Get-IPv4Address {Get-NetIPAddress -AddressFamily IPv4 | 
    Select-Object InterfaceAlias, IPAddress}

# Get IP Addresses of all IPv6 Adapters
function Get-IPv6Address {Get-NetIPAddress -AddressFamily IPv6 | 
    Select-Object InterfaceAlias, IPAddress}

# Get ALL IP Addresses
function Get-IPAddress {Get-NetIPAddress | 
    Select-Object IPAddress, AddressFamily, InterfaceAlias | 
    Sort-Object AddressFamily}

# Convert Number to Binary
function Get-BinaryFromNumber {param($Num = $(Throw "We need a number to operate!"));[convert]::ToString($Num,2)}

# Convert Number to Hex
function Get-HexFromNumber {param($Num = $(Throw "We need a number to operate!"));[convert]::ToString($Num,16)}

# Convert Binary to Number
function Get-NumberFromBinary {param([string]$Num = $(Throw “We need a number to operate!”));If ($Num.length -le 31) {[convert]::ToInt32($Num,2)} ElseIf ($Num.Length –le 63) {[convert]::ToInt64($Num,2)} Else {“Number too large for this function”}}

# Convert ms to Seconds
function Get-SecondsFromMS 
{
    [double]$ms = Read-host "What is the Number of ms?"
    $results =  $ms/1000
    write-host $ms "milliseconds = "$results "seconds" 
}

# Vew netdom syntax
function Get-NetdomSyntax {view C:\scripts\netdom.txt}

# Vew Telnet Email syntax
function Get-TelnetEmailSyntax {view C:\scripts\TelnetEmail.txt}

# Converts Current Time to UTC
function Get-UTC 
{
    $now = Get-Date
    Write-Host "The current UTC Date/Time is" $now.ToUniversalTime()
}

# Backup Scripting Library to Network
Function Backup-Scripts {Start-Process "cmd.exe" "/c c:\scripts\Ω_Backup.bat"}

# Displays the username of the user you are logged in as
function whoami {Write-Host "`nYou are currently logged in as: " -NoNewline
    Write-Host $env:userdomain\$env:USERNAME -foregroundcolor yellow}

# Finds the location of a machine in AD
function Find-Computer {param($ADComp = $(Throw "Requires a Computer Name"));(Get-ADComputer $ADComp).distinguishedName}

# Finds the location of a user in AD
function Find-User {param($ADUser = $(Throw "Requires a User Name"));(Get-ADuser $ADUser).distinguishedName}

# Finds the location of a Group in AD
function Find-group {param($ADGroup = $(Throw "Requires a Group Name"));(Get-ADGroup $ADGroup).distinguishedName} 

# Lists Disabled Users
function Get-DisabledUsers {Search-ADAccount -AccountDisabled | 
    Select-Object Name, SAMAccountName, DistinguishedName, PasswordExpired, PasswordNeverExpires, Enabled, LockedOut, LastLogonDate | 
    Export-Csv C:\Code\ScriptsOutput\DisabledUserAccounts\disabledusers.csv -NoTypeInformation}

#List Disabled Computers
function Get-DisabledComps {Get-ADComputer -Filter 'Enabled -eq $false' | 
    Select-Object Name, DNSHostName, Enabled, DistinguishedName | 
    export-CSV C:\Code\ScriptsOutput\DisabledCompAccounts\disabledcomps.csv -NoTypeInformation}

# List AD GC Servers
function Get-GCs {(Get-ADForest).globalcatalogs}

# List Contoso Workstations
function Get-DomainWorkstations {Get-ADComputer -Filter * -SearchBase "OU=workstations,DC=contoso,DC=com" | 
    Select-Object SamAccountName | 
    export-csv c:\temp\contoso_workstations.csv -NoTypeInformation}

# List Contoso Servers
function Get-DomainServers {Get-ADComputer -Filter * -SearchBase "OU=SERVERS,DC=contoso,DC=com" | 
    Select-Object SamAccountName | 
    export-csv c:\temp\contoso_servers.csv -NoTypeInformation}

# List Contoso Machines
function Get-DomainMachines 
    {
        Get-ADComputer -Filter * | 
        Select-Object SamAccountName, DistinguishedName | 
        export-csv c:\temp\contoso_machines.csv -NoTypeInformation
    }

# Disable all AD Users in a specific OU
function Disable-OUUsers {Get-ADUser -Filter Name -like "*" -SearchBase "OU=TempUsers,DC=contoso,DC=com" | Disable-ADAccount}

# Disable all AD Computers in a specific OU
Function Disable-OUComputers {Get-ADUser -Filter Name -like "*" -SearchBase "OU=TempUsers,DC=contoso,DC=com" | Disable-ADAccount}

# List Users mapped to "home" workstation for RDS
function Get-PrimaryDesktop 
    {
        Get-ADUser -Filter * -Properties msTSPrimaryDesktop |
        Where-Object { $_.msTSPrimaryDesktop -ne  $null } |
        Sort-Object name | Format-Table Name, SAMAccountName, msTSPrimaryDesktop -auto
    }

# Lists the version of PowerShell
function Get-Version {$PSVersionTable}

# Recursively search folder for text string
function Find-String {param($txtString = $(Throw "Requires a string of text!"));(Get-ChildItem -recurse | 
    Select-String -pattern $txtString | 
    Group-Object path | 
    Select-Object name)}

# Find User that have not logged on in X number of days
function Get-LastUserLogon {param($lldays = $(Throw "Requires a number of days!"));(get-ADUser -Filter * -Properties CN, SAMAccountName, lastLogonDate | 
Select-Object CN, SAMAccountName, LastLogonDate | 
Where-Object {$_.lastLogonDate -le (get-date).AddDays(-$lldays)} | 
sort-object LastLogonDate)}

# Find last login date for a specific computer
function Get-LastComputerLogon {param($computer = $(Throw "Requires a machine name!"));(Get-ADComputer -Identity $computer -Properties lastlogondate | 
Select-Object Name, DNSHostName, DistinguishedName, LastLogonDate)}

# Generate Random FileName
Function New-RandomFilename {[System.IO.Path]::GetRandomFileName()}

# Continous Ping of Host
function Set-ContPing {param($target = $(Throw "Requires a Host Name or IP Address"));
    while ($true)
        {
            $results = Test-Connection -ComputerName $target -Quiet
            Write-Host "$target" -ForegroundColor gray -NoNewline
            Write-Host " responded as " -NoNewline
            If ($results -eq "True") {
                Write-Host "Up" -ForegroundColor cyan -NoNewLine
                }  Else {
                Write-Host "Down" -ForegroundColor magenta -NoNewLine
                } 
            Write-Host " $(Get-Date)`n"
        }
    }

# Unlocks AD Account
function Unlock-User {param($aduser = $(Throw "Requires a string of text!"));(Unlock-ADAccount -Identity $aduser)}

# Disable AD Account
function Disable-User {param($aduser = $(Throw "Requires a string of text!"));(Disable-ADAccount -Identity $aduser)}


# Date Caculator
function Get-DateCalc {param($days = $(Throw "Requires a number!"));((get-date).AddDays($days))}

# Get AD User's Group Memberships in CSV
function get-groupmembership_com {param($user = $(Throw "Requires a valid AD username"));
    get-adprincipalgroupmembership $user -server s-ads-prd-dc1.contoso.com |
        select-object Name, GroupCategory, GroupScope | 
        export-csv "U:\users\$env:USERNAME\desktop\$user AD Membership_COM.csv" -NoTypeInformation
}

# Get AD User's Group Memberships in CSV
function get-groupmembership_org {param($user = $(Throw "Requires a valid AD username"));
    get-adprincipalgroupmembership $user -server s-ads-prd-dc1.contoso.org |
        select-object Name, GroupCategory, GroupScope | 
        export-csv "U:\users\$env:USERNAME\desktop\$user AD Membership_ORG.csv" -NoTypeInformation
}

# Gets Uptime
Function Get-Uptime {(get-date) - (gcim win32_OperatingSystem).LastBootUpTime}

# Generates Random Password
function New-RandomPassword {param($num);[Reflection.Assembly]::LoadWithPartialName(“System.Web”)
If ($num -gt 0) { $num } else { $num = 128 }
$RandPassLength = [int] $num
Write-Output “Generating $RandPassLength Character Random Password”
$RandomPassword = [System.Web.Security.Membership]::GeneratePassword($RandPassLength,2)
$RandomPassword}

# Loads PowerCLI Modules
# function Load-PowerCLI {&"C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1"}

# Restarts Service in Multiple Machines (in Dev)
# Get-Service -ComputerName (Get-Content "<ComputerList.txt>" "<ServiceName>" | Restart-Service
