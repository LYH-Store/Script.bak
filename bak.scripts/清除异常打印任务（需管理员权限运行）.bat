echo off
TITLE Clear Print error task
REM Need Run Administrator

net stop spooler 
rd C:\Windows\System32\spool\PRINTERS /s/q
net start spooler 

pause