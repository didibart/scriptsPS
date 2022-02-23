# de word a html - correr todo el código, darle que sí al popup de word
$wdTypes = Add-Type -AssemblyName 'Microsoft.Office.Interop.Word' -Passthru
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.Office.Interop.Word.WdSaveFormat')
$docSrc = "C:\RWS\scriptsPS\atekna"
$htmlOutputPath = "C:\RWS\scriptsPS\atekna\html"
$srcFiles = Get-ChildItem $docSrc -filter "*.doc"
$saveFormat = [Enum]::Parse([Microsoft.Office.Interop.Word.WdSaveFormat], "wdFormatHTML");
$wordApp = new-object -comobject word.application
$wordApp.Visible = $true


function saveashtml {
  $openDoc = $wordApp.documents.open($doc.FullName);
  $wshell = New-Object -ComObject wscript.shell;
  $wshell.SendKeys('~')
  $openDoc.saveas([ref]"$htmlOutputPath\$doc.fullname.html", [ref]$saveFormat);
  $openDoc.close();
}

ForEach ($doc in $srcFiles) {
  Write-Host "Converting to html :" $doc.FullName
  saveashtml
  $doc = $null
}

$wordApp.quit();

