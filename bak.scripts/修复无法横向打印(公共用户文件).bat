@echo off

@mode con lines=40 cols=100


title �޸��޷������ӡ(�����û��ļ�)

echo ���ȳ�������[��ӡ���]Ĭ��Ϊ"��ԭ����ͬ"

net stop spooler 

del %public%\Documents\Brocadesoft\*PRINT

net start spooler 

pause