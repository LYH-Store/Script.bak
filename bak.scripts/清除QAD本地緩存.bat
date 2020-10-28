echo off
title Clear QAD local cache
% 警告：先保存 QAD 正在操作的程式然後退出 QAD %
tskill qad
rd %appdata%\qad_bak\ /s/q
xcopy %appdata%\qad\shell %appdata%\QAD_bak\shell\ /s/e/y
rd %appdata%\qad\ /s/q
"C:\Program Files (x86)\QAD\QAD Enterprise Applications\QAD.Applications.exe"




