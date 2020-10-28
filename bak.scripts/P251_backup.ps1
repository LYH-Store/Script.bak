# title: backup P251 for windown7-powershell-2.0
# Notes: Runas Administrator for PowerShell：Set-ExecutionPolicy RemoteSigned
$Todays = Get-Date -Format "yyyyMMdd"
$folder_local_1 = "D:\WingTrace_Base_$Todays.bak"
$folder_local_2 = "D:\WingTrace_Code_$Todays.bak"
$folder_cloud = "\\n*\$Todays"
Write-Host "Run backup >"
Copy-Item -Path $folder_local_1 -Destination $folder_cloud -Recurse
Copy-Item -Path $folder_local_2 -Destination $folder_cloud -Recurse
Write-Host "Check folder and file >"
Invoke-Item "d:\"
Invoke-Item $folder_cloud