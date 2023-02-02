# Continous NSLookup of Host
function get-ContDNS {param($target = $(Throw "Requires a Host Name or IP Address"));
    while ($true)
        {
            Write-Host `n "$(Get-Date)" -foregroundcolor cyan
            nslookup $target
            Start-Sleep -Milliseconds 250
            # Start-Sleep -seconds 1
       }
    }