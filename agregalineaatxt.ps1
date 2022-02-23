
$encabezado = '*nota_'
$ruta = 'C:\RWS\SaludInvestiga2022\ene22'
$rutatxt = 'C:\RWS\SaludInvestiga2022\ene22\pepe.txt'
$files = Get-ChildItem $ruta -Filter *.txt
#sacar los segui leyendo
for ($i=0; $i -lt $files.Count; $i++) {
    $encabezado = $encabezado + $i
    $encabezado | Set-Content $rutatxt
    $contenido = Get-Content $files[$i].FullName 
    Add-Content $rutatxt -Value $contenido
    $rutaarchivo = $ruta + '\' + $files[$i]
    Remove-item $rutaarchivo
    Rename-Item $rutatxt -NewName $rutaarchivo
    $encabezado = '*nota_'
}