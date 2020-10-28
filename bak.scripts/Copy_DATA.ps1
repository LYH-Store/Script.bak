# Copy DATA.ps1
<#
- 2020.7.3
    creat project from yihong.liu

 -- Path --
 -  IR
    \\*\*\$Todays\L243
 -  TOC
    \\*\*\$Todays\L232    
 -  DR-audit
    \*\L188\System activity\$Todays
    \*\L189\System activity\$Todays
    \*\L363\System activity\$Todays
    \*\L371\System activity\$Todays
    \*\EL145\System activity\$Todays
    \*\L040\System activity\$Todays
    \*\L363\System activity\$Todays
    \*\L082\System activity\$Todays

 -- Workflow -- 
 1.保持网络凭证：服务器；
 2.自动化备份：文件夹、子文件夹；
 3.数据完整性，比对；
#>




#   --  Test Code   --
# $Todays = Get-Date -Format "yyyyMMdd"
# $local_file = "D:\SCM_backup"
# $nas_file = "\\*02\home\$Todays\SCM_backup"
# Copy-Item -Path $local_file -Destination $nas_file -Recurse
# Copy-Item $local_file -Destination $nas_file -ToSession $Session

$path_test = "C:\Users\yihong.liu\AppData\Nutstore\Workspace"
# size
$size = (Get-ChildItem -Path $path_test  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
"Folder Size: {0:n2} MB" -f ($size/1MB)
# count
$count = Get-ChildItem -Path $path_test  -Force -Recurse -ErrorAction SilentlyContinue | Measure-Object | Select-Object -ExpandProperty Count
"Number of files: $Count"

<#
Script Function: get size of folder
Script Editor: Snail Yu
#>
# $directories = Get-ChildItem D:\OneDrive -Directory
# foreach ($directory in $directories){       
#    $files = Get-ChildItem $directory.FullName -Recurse –File -ErrorAction SilentlyContinue   
#    foreach ($file in $files){            
#       $size=$size+$file.Length       
#       }
#    write-host "the size of $directory is : $size"     
# }

#   --  IR  --
<#
$Todays = Get-Date -Format "yyyyMMdd"
$local_file_irdata = "D:\IR DATA"
$local_file_audit = "C:\Programdata\ ?? "
$nas_file_irdata = "\\*\*\$Todays\L243\IR DATA"
$nas_file_audit = "\\*\*\$Todays\L243\Audit"
Copy-Item -Path $local_file -Destination $nas_file_irdata -Recurse
Copy-Item -Path $local_file -Destination $nas_file_audit -Recurse
#>

#   --  TOC  --
<#
$Todays = Get-Date -Format "yyyyMMdd"
$local_file = "D:\"
$nas_file = "\\*\*\$Todays\L232\ ? "
Copy-Item -Path $local_file -Destination $$nas_file -Recurse
#>


