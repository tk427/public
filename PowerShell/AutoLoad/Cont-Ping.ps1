clear-host
$a = 0
DO
    {
        $time = get-date
        write-host `n $time -foregroundcolor yellow
        Test-Connection google.com
        start-sleep 15
    } Until ($a -gt 5)