# invoca y trae la página
$url = "espaciopla.com" 
return @((invoke-webrequest -uri $url).links.href)
#write-host $url
#uso regex para encontrar algo
#return @($webpages.links.href)
# trae links .content .images .headers
#$webpage.links
# escribe a un archivo todo el contenido
$url.links | Out-File "c:\scripts\webpage.txt" ASCII -Width 9999 -append
#cls
#$outputfile = "c:\scripts\listofURLs.txt"
#get-process | out-file -width 900 $outputfile