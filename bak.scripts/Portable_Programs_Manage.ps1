# REM Portable-Programs-Manage.ps1
# 部署
# portable-path
$pf_path = ".\Portable"
$lnk_path = ".\Portable\lnk"
$systemfile_path = "%SystemDrive%\Portable" # 系统存储路径
$userprofile_path = "%localappdata%\DATA\Portable" # 用户文件存储路径
# $desktop = "C:\Users\Public\Desktop\Outlook Web 客户端.lnk"
# Lnk-path
$user_lnk = "%appdata%\Microsoft\Windows\Start Menu\Programs\" # 用户快捷方式
$system_lnk = "%ProgramData%\Microsoft\Windows\Start Menu\Programs\" # 系统快捷方式
Copy-Item -Path $pf_path -Destination $userprofile_path -Recurse
Copy-Item -Path $lnk_path -Destination $user_lnk -Recurse

<# Attachment 1.Remove Portable Program
# 移除
# Remove-Portable
$user_lnk = "%appdata%\Microsoft\Windows\Start Menu\Programs\" # 用户快捷方式
$userprofile_path = "%localappdata%\DATA\Portable" # 用户文件存储路径
Remove-Item -Path $software_path
Remove-Item -Path $desktop
#>

<# 打包 ( 基于 7zip )
# to-7zip-package
# docs: https://sevenzip.osdn.jp/chm/cmdline/commands/add.htm
$date = Get-Date -Format "yyyy-MM-dd"
& 'C:\Program Files\7-Zip\7z.exe' a Package_$date.7z .\*
#>

<# 其他方式
# attch: batch-command
xcpoy /?
copy /?
#>



