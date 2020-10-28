@echo off
@REM 1.Install: Firefox_and_outlook_Web.bat
set filepath="\\fab-112\Temp\_edge\FirefoxPortable\FirefoxPortable"
set likpath="\\fab-112\Temp\_edge\Outlook Web 客户端.lnk"
set software_path="C:\.phd.software\FirefoxPortable\"
set desktop="C:\Users\Public\Desktop\"
xcopy %filepath% %software_path% /s /e /j /y /z
xcopy %likpath% %desktop% 

@REM 2.Remove
@REM rmdir %software_path% /s /q
@REM rmdir %desktop% /s /q


