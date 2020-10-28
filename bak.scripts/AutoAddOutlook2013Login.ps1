# AutoAddOutlook2013Login.ps1
$command = '
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\AutoDiscover]
"excludehttpsrootdomain"=dword:00000001"

'
$command > C:\Users\Public\Desktop\修复无法登录Outlook2013.reg