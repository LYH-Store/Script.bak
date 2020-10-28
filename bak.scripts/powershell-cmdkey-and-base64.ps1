# Base64_code
<#
$base64_str = "base64"
[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($base64_str), 'InsertLineBreaks')
#>

$server= '*'
$user = 'YQBkAG0AaQBuAA=='
$pass = "*"
$read_server = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($server))
$read_user = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($user))
$read_pass = [Text.Encoding]::Unicode.GetString([Convert]::FromBase64String($pass))
cmdkey.exe /add:$read_server /user:$read_user /pass:$read_pass
