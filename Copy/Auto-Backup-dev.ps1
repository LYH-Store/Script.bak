# Auto-Backup-PD.dev.ps1
<#
phd.it:hliu
request:date-range // 时间区间 （简而言之就是上一次修改日期到今天日期）
Useful：backup data
NOTE: RunasAdministrator // Set-ExecutionPolicy RemoteSigned
#>

# 0. base-information
$days = Get-Date -Format "yyyyMMdd"
$local = " none " # // local data
$nas = " none " # to nas path
$nas_backup_id = 'None'
$PDF_LastWriteTime = Read-Host -Prompt 'Enter PDF_LastWriteTime of event (yyyy-MM-dd)' # read enter date
# 0.1 add-credential
# $server= 'None'
$user = 'YQBkAG0AaQBuAA=='
# $pass = 'None'
$read_server = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($server))
$read_user = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($user))
$read_pass = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($pass))
cmdkey.exe /add:$read_server /user:$read_user /pass:$read_pass

# 1. copy-data
Write-Host "- Run backup >"
$pdf_file = Get-ChildItem -Path $local -Filter *.pdf -Include *.pdf -Recurse -ErrorAction SilentlyCon   # Only PDF File
$Filter_pdf_data = $pdf_file | Where-Object {$_.LastWriteTime -gt $PDF_LastWriteTime}
# New-Item -Path $nas_backup_id -Name $days -ItemType "directory"
Copy-Item -Path $Filter_pdf_data -Destination $nas -Recurse

# 2. check-data
Write-Host "- Check folder and file >"
$data_nas = Get-ChildItem -Path $nas -Force -Recurse
Compare-Object -ReferenceObject $pdf_file -DifferenceObject $data_nas

# 3. open
Write-Host "- Open folder>"
Invoke-Item $local
Invoke-Item $nas
