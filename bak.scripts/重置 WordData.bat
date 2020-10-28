@rem note: backup and delete worddata 
@echo off
reg export HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Data C:\Users\Public\Documents\Office_reg_bak\WordData_2013_bak.reg
reg delete HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Word\Data
