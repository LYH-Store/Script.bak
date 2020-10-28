echo off
echo "\n 关闭网卡... \n"
ipconfig /release

echo "\n 重新获取网卡信息... \n"
ipconfig /renew