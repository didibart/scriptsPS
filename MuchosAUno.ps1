﻿$MySourcePath = "C:\RWS\Saludinvestiga2022\dic21"
Get-ChildItem $MySourcePath -Recurse -Include "*.txt" | get-content |  Out-File -Encoding default -Append C:\RWS\Saludinvestiga2022\dic21\salida\todos.txt