@echo on
title Push_DATA_TO_NAS_Win7.bat
REM 不支持变量，撤销 BAT 脚本测试；

set local = ”C:\Users\*\AppData*“
set cloud = “D:\backup\Notes.bak”

echo "Title"
echo %local%
echo %cloud%

REM xcopy %local% %cloud% /h /e /i /y /s
REM xcopy "C:\Users\*\AppData*" "D:\backup\Notes" /h /e /i /y /s

pause
