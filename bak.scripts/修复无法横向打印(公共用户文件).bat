@echo off

@mode con lines=40 cols=100


title 修复无法横向打印(公共用户文件)

echo 请先尝试设置[打印输出]默认为"与原稿相同"

net stop spooler 

del %public%\Documents\Brocadesoft\*PRINT

net start spooler 

pause