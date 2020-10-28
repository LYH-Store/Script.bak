# title: backup DR-audit from windown7-powershell-2.0
# Notes: Runas Administrator for PowerShell：Set-ExecutionPolicy RemoteSigned
# Cloud-PATH：\\nasfab01\LAB DATA BACKUP\Dissolution\<ID>\System activity\$Todays\SCM_backup
<#
20200831,cmd_add_command: powershell.exe -file <path>

#>

$Todays = Get-Date -Format "yyyyMMdd"
$folder_local = "D:\SCM_backup"
$folder_cloud = "\\nasfab01\LAB DATA BACKUP\Dissolution\<ID>\System activity\$Todays\SCM_backup"

Write-Host "# Run backup >"
# Copy-Item -Path $folder_local -Destination $folder_cloud -Recurse
xcopy.exe $folder_local $folder_cloud /e /h /v /q /y
Write-Host "OK"

Write-Host "# Check folder and file >"
$folder_local_2 = Get-ChildItem -Path $folder_local -Force -Recurse
$folder_cloud_2 = Get-ChildItem -Path $folder_cloud -Force -Recurse
Compare-Object -ReferenceObject $folder_local_2 -DifferenceObject $folder_cloud_2
Write-Host "OK"

Write-Host "# Open folder >"
Invoke-Item $folder_local
Invoke-Item $folder_cloud
Write-Host "OK"
