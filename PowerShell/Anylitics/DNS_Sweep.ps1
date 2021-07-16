<#
.SYNOPSIS
    Proof of concept DNS Sweep of an IP Range    
    Code Author     : Tim Fox
    Dependencies    : modules, (include permission types, e.g., admin account)
    Creation Date   : 08/05/2019 09:37 AM 
    Code Version    : 20210716-1
    
.DESCRIPTION
    Proof of concept script to generate a report of all know DNS objects on an IP range.
.NOTES
#>

Clear-Host
$last_sn = 1

Do
    {
       $IP = "192.168.1."+$last_sn
       write-host `n "Looking up $IP" -foregroundcolor Yellow
       Resolve-DnsName $IP
       $Output = Resolve-DnsName $IP
       $Output | 
            Select-Object NameHost, @{Name="IP Address";Expression={ $IP }} |
            Sort-Object $IP |
            Export-Csv DNS_Sweep.csv -NoTypeInformation -Append
        $last_sn ++
        # start-sleep 1
    } While ($last_sn -lt 256)
