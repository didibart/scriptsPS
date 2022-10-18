
$encabezado = '**** *nota_'
#$encabezado = '**** *texto_'
$ruta = 'C:\RWS\SaludInvestiga2022\dic21'
#$ruta = 'C:\RWS\UNLa\Lucia2022\words2022\salida'
$rutatxt = 'C:\RWS\SaludInvestiga2022\dic21\pepe.txt'
#$rutatxt = 'C:\RWS\UNLa\Lucia2022\words2022\salida\pepe.txt'
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
    $encabezado = '**** *nota_'
    #$encabezado = '**** *texto_'
}