$files = Get-ChildItem "C:\RWS\UNLaM\entrevistas2021\salida\*.txt"
$ruta="C:\RWS\UNLaM\entrevistas2021\salida\"
for ($i=0; $i -lt $files.Count; $i++)
{
  $nomarch=$files[$i].BaseName
  $name = -join($nomarch, ".rtf")
  $nameCO = -join($ruta,$name)
  #echo $files[$i].FullName
  #echo $nameCO
  #pandoc -f docx $files[$i].FullName -t rtf -o $nameCO
  pandoc -t textfile -s $files[$i].FullName -t rtf -o $nameCO
}