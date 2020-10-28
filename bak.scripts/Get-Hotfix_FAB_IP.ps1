
REM ### 获取局域网 Windows Host Update，不靠谱的脚本 ###
REM 缺点：目标主机处理开机、或关闭防火墙的条件下


$ip_list = New-Object System.Collections.ArrayList

for ($i=1 ; $i -le 255; $i++ )
{
    $name = "192.168.33."
    $name_add = $name + $i
    $ip_list.Add($name_add)
}

$HotFix_FAB = New-Object System.Collections.ArrayList

foreach ($ipname in $ip_list)
{
    $ipname
    REM $ipname_log = $ipname + ".LOG"
    REM Get-HotFix -ComputerName $ipname > $ipname_log
    $FAB = Get-HotFix -ComputerName $ipname
    $HotFix_FAB.Add($FAB)
}

$HotFix_FAB > FAB-Hotfix-IP.txt