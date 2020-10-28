@ECHO OFF

TITLE START-Control-Print
SET command="control.exe /name Microsoft.DevicesAndPrinters"
SET command_more="$ok = Get-StartApps | format-list $ko = "new" $ko"
POWERSHELL -command %command%

