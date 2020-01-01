Clear-Variable -Name $i
$i = 1
get-childitem "C:\RWS\UNDEC\entrevistas" -file -recurse | foreach {

	rename-item $_.fullname -new ($_.directory.name + '-' + $i++ + '.txt')

}
