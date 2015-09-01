--(Re)Create general database

Print 'Create general database [messenger]'
USE [master]
GO
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'messenger')
ALTER DATABASE [messenger] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

/****** Object:  Database [messenger]    Script Date: 18/08/2015 23:28:30 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'messenger')
DROP DATABASE [messenger]
GO

USE [master]
GO

/****** Object:  Database [messenger]    Script Date: 18/08/2015 23:28:30 ******/
CREATE DATABASE [messenger]
GO

ALTER DATABASE [messenger] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [messenger].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO




USE [messenger]
GO


--creating tables--
Print 'Creating tables'


CREATE TABLE [tbl_users] (
	[user_id] [int] NOT NULL ,
	[user_status] [varchar] (20) NOT NULL ,
	[is_valid] [varchar] (2) NOT NULL ,
	[create_ts] [datetime] NOT NULL ,
	[update_ts] [datetime] NOT NULL 
) ON [PRIMARY]

GO

CREATE TABLE [tbl_user_details] (
	[user_id] [int] NOT NULL ,
	[user_login_name] [varchar] (20) NOT NULL ,
	[first_name] [varchar] (20) NOT NULL ,
	[last_name] [varchar] (20) NOT NULL ,
	[user_address] [varchar] (20) NOT NULL ,
	[land_phone] [varchar] (20) ,
	[cell_phone] [varchar] (20) ,
	[update_ts] [datetime] NOT NULL 
) ON [PRIMARY]

GO


CREATE TABLE [tbl_groups] (
	[group_id] [int] NOT NULL ,
	[group_name] [int] NOT NULL ,
	[group_status] [varchar] (20) NOT NULL ,
	[is_valid] [varchar] (2) NOT NULL ,
	[create_ts] [datetime] NOT NULL ,
	[update_ts] [datetime] NOT NULL 
) ON [PRIMARY]

GO

CREATE TABLE [tbl_user_group_map] (
	[user_group_map_id] [int] NOT NULL ,
	[user_id] [int] NOT NULL ,
	[group_id] [int] NOT NULL ,
	[is_valid] [varchar] (2) NOT NULL ,
	[create_ts] [datetime] NOT NULL ,
	[update_ts] [datetime] NOT NULL 
) ON [PRIMARY]

GO

CREATE TABLE [tbl_prv_messages] (
	[pvt_message_id] [bigint] NOT NULL ,
	[user_from] [int] NOT NULL ,
	[user_to] [int] NOT NULL ,
	[msg_text] [varchar] (8000) ,
	[is_valid] [varchar] (2) NOT NULL ,
	[msg_status] [varchar] (20) NOT NULL ,		--defaults 'sent', ' failed', 'processing', 'pending', 'received'
	[create_ts] [datetime] NOT NULL ,
) ON [PRIMARY]

GO


CREATE TABLE [tbl_grp_messages] (
	[grp_message_id] [bigint] NOT NULL ,
	[user_from] [int] NOT NULL ,
	[group_to] [int] NOT NULL ,
	[msg_text] [varchar] (8000) ,
	[is_valid] [varchar] (2) NOT NULL ,
	[msg_status] [varchar] (20) NOT NULL ,		--defaults 'sent', ' failed', 'processing', 'pending', 'received'
	[create_ts] [datetime] NOT NULL ,
) ON [PRIMARY]

GO

--creating primary key constraints

Print 'Creating primery keys'

ALTER TABLE [dbo].[tbl_users] ADD 
	CONSTRAINT [PK_user_id] PRIMARY KEY  CLUSTERED 
	(
		[user_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_user_details] ADD 
	CONSTRAINT [PK_user_login_name] PRIMARY KEY  CLUSTERED 
	(
		[user_login_name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_groups] ADD   
	CONSTRAINT [PK_group_id] PRIMARY KEY  CLUSTERED 
	(
	[group_id] 
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_user_group_map] ADD   
	CONSTRAINT [PK_user_group_map_id] PRIMARY KEY  CLUSTERED 
	(
	[user_group_map_id] 
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_prv_messages] ADD   
	CONSTRAINT [PK_pvt_message_id] PRIMARY KEY  CLUSTERED 
	(
	[pvt_message_id]	
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[tbl_grp_messages] ADD   
	CONSTRAINT [PK_grp_message_id] PRIMARY KEY  CLUSTERED 
	(
	[grp_message_id]
	)  ON [PRIMARY] 
GO



--creating foreign key constraints

Print 'Creating foreign keys'

ALTER TABLE [dbo].[tbl_user_details] ADD 
	CONSTRAINT [FK_user_id_details] FOREIGN KEY 
	(
		[user_id]
	)  REFERENCES [dbo].[tbl_users] (
		[user_id]
	) NOT FOR REPLICATION  
GO


ALTER TABLE [tbl_user_group_map] ADD
	CONSTRAINT [FK_usr_grp_map_2_user] FOREIGN KEY  
	(
		[user_id] 
	)  REFERENCES [dbo].[tbl_users] (
		[user_id]
	) NOT FOR REPLICATION  

GO

ALTER TABLE [tbl_user_group_map] ADD
	CONSTRAINT [FK_usr_grp_map_2_group] FOREIGN KEY  
	(
		[group_id] 
	)  REFERENCES [dbo].[tbl_groups] (
		[group_id]
	) NOT FOR REPLICATION  

GO

ALTER TABLE [tbl_prv_messages] ADD
	CONSTRAINT [FK_pvt_message_sender] FOREIGN KEY  
	(
		[user_from] 
	)  REFERENCES [dbo].[tbl_users] (
		[user_id]
	) NOT FOR REPLICATION  
GO

ALTER TABLE [tbl_prv_messages] ADD
	CONSTRAINT [FK_pvt_message_receiver] FOREIGN KEY  
	(
		[user_to] 
	)  REFERENCES [dbo].[tbl_users] (
		[user_id]
	) NOT FOR REPLICATION  
GO

ALTER TABLE [tbl_grp_messages] ADD   
	CONSTRAINT [FK_grp_message_receiver] FOREIGN KEY  
	(
		[group_to] 
	)  REFERENCES [dbo].[tbl_groups] (
		[group_id]
	) NOT FOR REPLICATION  
GO