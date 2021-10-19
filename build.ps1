$version = "-1"
$readme = (Get-Content ".\README.md") -as [string[]]
for($i=0; $i -lt $readme.Length; $i++){
    $row = $readme.Get($i)
    if($row -match "^ver="){
        $version = $row.SubString($row.IndexOf("ver=") + "ver=".length)
    }
}

if($version -eq "-1"){
    echo Error
}else{
    Compress-Archive -DestinationPath .\$version.zip -Path .\pack\*
}