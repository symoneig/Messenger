USE [master]
RESTORE DATABASE [AdventureWorksDW2014] 
FROM  DISK = N'D:\Max\_EDU\AdventureWorksDW2014.bak' 
WITH  FILE = 1,  
MOVE N'AdventureWorksDW2014_Data' TO N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdventureWorksDW2014_Data.mdf',  
MOVE N'AdventureWorksDW2014_Log' TO N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AdventureWorksDW2014_Log.ldf',  
NOUNLOAD,  STATS = 5

GO


