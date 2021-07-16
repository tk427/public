<#

This script only captures live systems!!!!!!!

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