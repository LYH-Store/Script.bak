# title: backup DR-audit from windown7-powershell-2.0
# Notes: Runas Administrator for PowerShell：Set-ExecutionPolicy RemoteSigned

$Todays = Get-Date -Format "yyyyMMdd"
$folder_local = " ？ "
$folder_cloud = "\\*\$Todays\L232"
Write-Host "run backup"
Copy-Item -Path $folder_local -Destination $folder_cloud -Recurse

$folder_local_2 = Get-ChildItem -Path $folder_local -Force -Recurse
$folder_cloud_2 = Get-ChildItem -Path $folder_cloud -Force -Recurse
Write-Host "check toc-date tree"
Compare-Object -ReferenceObject $folder_local_2 -DifferenceObject $folder_cloud_2
