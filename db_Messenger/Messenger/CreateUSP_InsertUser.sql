-- create stored procedures

Use [messenger]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertNewUser]
@user_id [int] ,
@user_status [varchar](20) ,
@is_valid varchar(2) ,
@create_ts [datetime] ,
@update_ts [datetime] 	
as
BEGIN
    SET NOCOUNT ON;
		BEGIN TRY
			INSERT INTO [dbo].[tbl_users]
				   ([user_id]
				   ,[user_status]
				   ,[is_valid]
				   ,[create_ts]
				   ,[update_ts])
			VALUES 
			(
				(select max(user_id)+1 from tbl_users)	 , --auto inscrement identity?
				'Disabled' , --should be inserted by default (need to create DEFAULT and assign to the table) untill user confirms email or whatever
				'Y' ,  	-- 'N' when user deletes his account
				GETDATE() ,
				GETDATE()	
			)
    END TRY
    BEGIN CATCH
        --EXECUTE [dbo].[uspLogError];
    END CATCH;
END;