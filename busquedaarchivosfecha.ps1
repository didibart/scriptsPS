set-executionpolicy unrestricted
cls
$FindDate=Get-Date -Year 2017 -Month 01 -Day 01
Get-ChildItem -File -Exclude *jpg* -Path C:\vinosyco\public_html\paraver -Recurse | Where-Object { $_.LastWriteTime -ge $FindDate -and $_.fullname -notmatch "\\moodle\\?" }
#| except "C:\vinosyco\public_html\paraver\moodle"
#| $_.Name -NotMatch "nls"
#[Environment]::Is64BitProcess
#Get-ExecutionPolicy