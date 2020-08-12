$file = Get-ChildItem "C:\RWS\scriptsPS\hilo.docx"
$nameCO = "C:\RWS\scriptsPS\hilo.txt"
#tranformo el doc en txt
pandoc -f docx $file.FullName -t asciidoc -o $nameCO
#leo el txt
$fileTXT = Get-Content $nameCO -encoding UTF8 | Out-String
#cantidad de caracteres
$cantChar = $fileTXT | Measure-Object -Character | Select-Object -expand characters
#loop por caracteres 280 twitter
$i = 0
#creo el archivo
$fileN = "C:\RWS\scriptsPS\hiloM.txt"
"Hilo para Twitter" | Set-Content $fileN -encoding UTF8
"`r`n" | Add-Content $fileN
"/********************************************************************/" | Add-Content $fileN
"`r`n" | Add-Content $fileN
while ($i -le $cantChar) 
   {
     $twit = $fileTXT.Substring($i,280)
     $twit | Add-Content $fileN
     "`r`n" | Add-Content $fileN
     "/********************************************************************/" | Add-Content $fileN
     "`r`n" | Add-Content $fileN
     "`r`n" | Add-Content $fileN
     "`r`n" | Add-Content $fileN
     $i = $i + 280
     if (($cantChar - $i) -lt 280)
        {break}
    }
$nameDOC = "C:\RWS\scriptsPS\hiloM.docx"
pandoc -s $fileN -o $nameDOC --quiet
#pandoc --version
