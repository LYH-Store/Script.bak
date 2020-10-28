# backup data windown10 version (powershell 5.0)
# 对于无法运行的设备，请使用管理开启权限，如下：
# Set-ExecutionPolicy RemoteSigned

# - copy
$Todays = Get-Date -Format "yyyyMMdd"
$local_data = "D:\IR DATA"
$local_audit = ""
$nas_path_1 = "*\$Todays\L243" 
Copy-Item -Path $local_file -Destination $nas_path_1 -Recurse
Copy-Item -Path $local_audit -Destination $nas_path_1 -Recurse 
# - Compare
$data_local_folder = Get-ChildItem -Path $local_data -Force -Recurse
$data_nas_folder = Get-ChildItem -Path $nas_path_1 -Force -Recurse
Compare-Object -ReferenceObject $data_local_folder -DifferenceObject $data_nas_folder
# - folder 
$size_local = (Get-ChildItem -Path $local_data  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$count_local = Get-ChildItem -Path $local_data  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object | Select-Object -ExpandProperty Count
$size_cloud = (Get-ChildItem -Path $nas_path_1  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
$count_cloud = Get-ChildItem -Path $nas_path_1  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object | Select-Object -ExpandProperty Count
"Local Folder Size: {0:n2} MB" -f ($size_local/1MB)
"Local Number of files: $count_local"
"Cloud Folder Size: {0:n2} MB" -f ($size_cloud/1MB)
"Cloud Number of files: $count_cloud"