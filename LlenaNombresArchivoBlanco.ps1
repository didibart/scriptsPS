cd ..
cd ..
cd RWS
cd UNLa
cd Lucia2022
cd words2022
cd salida
Dir | Rename-Item –NewName { $_.name –replace “ “,”_” }

get-location