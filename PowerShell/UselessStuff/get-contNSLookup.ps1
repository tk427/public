# Continous NSLookup of Host
function get-ContDNS {param($target = $(Throw "Requires a Host Name or IP Address"));
    while ($true)
        {
            Write-Host `n "$(Get-Date)" -foregroundcolor cyan
            Resolve-DnsName $target
            Start-Sleep -Milliseconds 1000
            # Start-Sleep -seconds 1
       }
    }