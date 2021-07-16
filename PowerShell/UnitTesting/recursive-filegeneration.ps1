cls
$c1 = 1
Do
    {
        $c2 = get-Random -Minimum 1 -Maximum 199
        # $c2 = 1
        Do
            { 
                get-childitem f:\ -Recurse | out-file f:\child\$c2.txt -Append
                Write-Host "Processing File: $c2" 
                $c2++
            } 
        while ($c2 -lt 151)
        $c1++
        Write-Host "`nPass: $c1"
    }
        while ($c1 -lt 11)
Get-ChildItem f:\child -recurse | where-object {$_.length -gt 19999999} | Remove-Item