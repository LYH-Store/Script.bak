@rem note: set word 2013 pritn image default: high
@rem link: https://docs.microsoft.com/zh-cn/office/troubleshoot/word/image-dpi-change-after-print-to-pdf
@echo off
reg add HKEY_CURRENT_USER \Software\Microsoft\Office\15.0\Word\Options\ /v PrintHighQualityDefault /t REG_DWORD /d 00000001 /F