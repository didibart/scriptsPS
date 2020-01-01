﻿$files = Get-ChildItem "C:\RWS\UNDEC\*.docx"
$ruta="C:\RWS\UNDEC\entrevistas\"
for ($i=0; $i -lt $files.Count; $i++)
{
  $nomarch=$files[$i].BaseName
  $name = -join($nomarch, ".txt")
  $nameCO = -join($ruta,$name)
  #echo $files[$i].FullName
  #echo $nameCO
  pandoc -f docx $files[$i].FullName -t asciidoc -o $nameCO
}
#cls
#$name1="C:\Users\LENOV\Documents\entrevistas\ENFERMERIA2.docx"
#$name2="C:\Users\LENOV\Documents\entrevistas\ENFERMERIA2.txt"
#pandoc -f docx $name1 -t asciidoc -o $name2