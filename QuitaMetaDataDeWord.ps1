$path = "C:\RWS\scriptsPS\TestWordDocs"
Add-Type -AssemblyName Microsoft.Office.Interop.Word
$WdRemoveDocType = "Microsoft.Office.Interop.Word.WdRemoveDocInfoType" -as [type] 
$wordFiles = Get-ChildItem -Path $path -include *.doc, *.docx -recurse 
$objword = New-Object -ComObject word.application 
$objword.visible = $true 

foreach($obj in $wordFiles) 
{ 
    $documents = $objword.Documents.Open($obj.fullname) 
    "Removing document information from $obj" 
    # WdRemoveDocInfoType Enumeration Reference
    # http://msdn.microsoft.com/en-us/library/microsoft.office.interop.word.wdremovedocinfotype(v=office.14).aspx
    # 99 = WdRDIAll
    #$documents.RemoveDocumentInformation(99)
    $documents.RemoveDocumentInformation($WdRemoveDocType::wdRDIAll) 
    $documents.Save() 
    $objword.documents.close() 
} 
$objword.Quit()