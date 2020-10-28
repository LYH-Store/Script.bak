# DATA-SHA-Check.ps1
# Test-static：on

<# 1.check 7zip file
PS C:\Users\yihong.liu> $DATA1 = & 'C:\Program Files\7-Zip\7z.exe' l -slt .\archive-test.7z
PS C:\Users\yihong.liu> $DATA2 = & 'C:\Program Files\7-Zip\7z.exe' l -slt <filepath>
PS C:\Users\yihong.liu> Compare-Object $DATA1 -ReferenceObject $DATA2 -DifferenceObject 
#>

<# 
# 2.check SHA2 （SHA256）
# Use Certutil or 7zip
# 1. PS C:\Users\yihong.liu> certutil -hashfile .\archive-test-pass.7z SHA256
# 2. PS C:\Users\yihong.liu> & 'C:\Program Files\7-Zip\7z.exe' h -scrcsha256 .\archive-test-pass.7z
$ArchivePath1 = "Path"
$ArchivePath2 = "Path"
$DATA1 =  certutil -hashfile $ArchivePath1 SHA256
$DATA2 =  certutil -hashfile $ArchivePath2 SHA256
Compare-Object $DATA1 -ReferenceObject $DATA2 -DifferenceObject 
#>