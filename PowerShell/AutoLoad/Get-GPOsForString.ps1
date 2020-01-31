<#
.SYNOPSIS
    Function that searches for a string in GPO

    Original Code Author    : Tony Murray
    Update Code Author      : Tim Fox
    Dependencies            : modules, (include permission types, e.g., admin account)
    Creation Date           : 13/07/2016
    Update Date             : 08/19/2019 13:59 PM 
    Code Version            : 20190819-1.1
    
.DESCRIPTION
    Function that searches for a string in GPO using the domain of the run as user.

OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include

.EXAMPLE
    Get-GPOsForString <string of text>
.NOTES

#>

function Get-GPOsForString {param($String = $(Throw "Requires a String of Text"));

# Set the domain to search for GPOs
    $DomainName = $env:USERDNSDOMAIN

# Find all GPOs in the current domain
    write-host "Finding all the GPOs in $DomainName"
    Import-Module grouppolicy
    $allGposInDomain = Get-GPO -All -Domain $DomainName

# Look through each GPO's XML for the string
    Write-Host "Starting search...."
    foreach ($gpo in $allGposInDomain) {
        $report = Get-GPOReport -Guid $gpo.Id -ReportType Xml
        if ($report -match $string) {
            write-host "********** Match found in: $($gpo.DisplayName) **********"
        } # end if
        else {
            Write-Host "No match in: $($gpo.DisplayName)"
        } # end else
    } # end foreach
} # end of function