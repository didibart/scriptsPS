$files = Get-ChildItem "C:\RWS\AmilcarHerrera2020\textos\*.docx"
$ruta="C:\RWS\AmilcarHerrera2020\textos\"
for ($i=0; $i -lt $files.Count; $i++)
{
  
  $nomarch=$files[$i].BaseName
  $name = -join($nomarch, ".txt")
  $nameCO = -join($ruta,$name)
  pandoc -f docx $files[$i].FullName -t asciidoc -o $nameCO
}
Get-ChildItem C:\RWS\AmilcarHerrera2020\textos -include *.txt -rec | ForEach-Object {gc $_; ""} | out-file -Encoding default C:\RWS\AmilcarHerrera2020\textos\final\todos.txt