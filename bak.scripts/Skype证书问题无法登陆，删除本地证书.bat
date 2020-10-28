echo off

% 脚本：skype 无法登陆，本地证书问题 %

tskill lync

rd %appdata%\microsoft\crypto\rsa /s/q




