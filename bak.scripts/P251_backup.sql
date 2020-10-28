/*
title:  -P251 backup for Microsoft SQL 2008 
log:    -20200730，create
*/
DECLARE @local_date NVARCHAR(64);
DECLARE @local_path1 NVARCHAR(64);
DECLARE @local_path2 NVARCHAR(64);
SET @local_date = CONVERT(VARCHAR(64),GETDATE(),112);
SET @local_path1 = 'D:/WingTrace_Base_'+@local_date+'.bak';
SET @local_path2 = 'D:/WingTrace_Code_'+@local_date+'.bak';
BACKUP DATABASE WingTrace_Base TO DISK=@local_path1;
BACKUP DATABASE WingTrace_Code TO DISK=@local_path2;