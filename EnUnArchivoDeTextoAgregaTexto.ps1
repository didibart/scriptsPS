$fileName = "C:\RWS\UNDEC\entrevistas\salida\todos.txt"
$Patern = "<patern>" # the 2 lines will be added just after this pattern 
$FileOriginal = Get-Content $fileName

<# create empty Array and use it as a modified file... #>

$FileModified = @() 

Foreach ($Line in $FileOriginal)
{    
    $FileModified += $Line

    if ($Line -match $patern) 
    {
        #Add Lines after the selected pattern 
        $FileModified += 'add text'
        $FileModified += 'add second line text'
    } 
}
Set-Content $fileName $FileModified