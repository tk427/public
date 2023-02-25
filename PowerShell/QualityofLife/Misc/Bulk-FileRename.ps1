<#
Bulk renames image files to the format of "imageXX.xxx"
#>

$index = 0
$exts = "jpg", "jpeg", "png"
$ext = "png"
$files = Get-ChildItem *.png
#     Foreach ($ext in $exts)
#    {
#        Write-Host "Looking at $ext file extension"
        ForEach ($file in $files)
        {
            Write-host "Remaming file $file to image$index.$ext"
            rename-item $file -NewName "image$index.$ext"
            $index++    
        }
#    }
