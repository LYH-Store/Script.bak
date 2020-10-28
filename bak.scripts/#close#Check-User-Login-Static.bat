@echo off
@REM # Check-User-Login-Static.bat
@REM # Plan 失败，batch command 不支持传递结果，需第三支持；

SET command="quser"
SET command_more="$ok = Get-StartApps | format-list $ko = "new" $ko"
POWERSHELL -command %command%
POWERSHELL -command %command%
%quser%
pause

tree