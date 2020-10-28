@echo off
@REM cmdkey_clear.bat

for /F "tokens=1,2 delims= " %G in ('cmdkey /list ^| findstr Target') do  cmdkey /delete %H

rundll32.exe keymgr.dll,KRShowKeyMgr
