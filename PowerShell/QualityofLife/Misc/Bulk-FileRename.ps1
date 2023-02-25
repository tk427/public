$index = 16
$files = Get-ChildItem *.jpeg
    ForEach ($file in $files)
    {
        rename-item $file -NewName "image_$index.jpeg"
        $index++    
    }