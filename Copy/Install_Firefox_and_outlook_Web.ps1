# REM Install_Firefox_and_outlook_Web.ps1
# Note：Runas Administrator
$filepath = ".\FirefoxPortable"
$likpath = ".\outlook web 客户端.lnk"
$software_path = "C:\.phd.software\FirefoxPortable"
$desktop = "C:\Users\Public\Desktop\Outlook Web 客户端.lnk"

Copy-Item -Path $filepath -Destination $software_path -Recurse
Copy-Item -Path $likpath -Destination $desktop -Recurse

Invoke-Item -Path $desktop

<# Attachment 1.Remove Portable Program
# Remove Firefox_and_outlook_Web.ps1
# Note：Runas Administrator
$software_path = "C:\.phd.software\"
$desktop = "C:\Users\Public\Desktop\Outlook Web 客户端.lnk"
Remove-Item -Path $software_path
Remove-Item -Path $desktop
#>



