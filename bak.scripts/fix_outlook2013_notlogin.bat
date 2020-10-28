@rem # reg add outlook.bat
@echo off
reg add \HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\AutoDiscover /v excludehttpsrootdomain /t REG_DWORD /d 00000001 /F