USE [master]
GO
/****** Object:  Database [messenger]    Script Date: 24.08.2015 23:18:52 ******/
CREATE DATABASE [messenger]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'messenger', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\messenger.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'messenger_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\messenger_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [messenger] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [messenger].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [messenger] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [messenger] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [messenger] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [messenger] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [messenger] SET ARITHABORT OFF 
GO
ALTER DATABASE [messenger] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [messenger] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [messenger] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [messenger] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [messenger] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [messenger] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [messenger] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [messenger] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [messenger] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [messenger] SET  ENABLE_BROKER 
GO
ALTER DATABASE [messenger] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [messenger] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [messenger] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [messenger] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [messenger] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [messenger] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [messenger] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [messenger] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [messenger] SET  MULTI_USER 
GO
ALTER DATABASE [messenger] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [messenger] SET DB_CHAINING OFF 
GO
ALTER DATABASE [messenger] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [messenger] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [messenger] SET DELAYED_DURABILITY = DISABLED 
GO
USE [messenger]
GO
/****** Object:  Table [dbo].[tbl_groups]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_groups](
	[group_id] [int] NOT NULL,
	[group_name] [int] NOT NULL,
	[group_status] [varchar](20) NOT NULL,
	[is_valid] [varchar](2) NOT NULL,
	[create_ts] [datetime] NOT NULL,
	[update_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_group_id] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_grp_messages]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_grp_messages](
	[grp_message_id] [bigint] NOT NULL,
	[user_from] [int] NOT NULL,
	[group_to] [int] NOT NULL,
	[msg_text] [varchar](8000) NULL,
	[is_valid] [varchar](2) NOT NULL,
	[msg_status] [varchar](20) NOT NULL,
	[create_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_grp_message_id] PRIMARY KEY CLUSTERED 
(
	[grp_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_prv_messages]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_prv_messages](
	[pvt_message_id] [bigint] NOT NULL,
	[user_from] [int] NOT NULL,
	[user_to] [int] NOT NULL,
	[msg_text] [varchar](8000) NULL,
	[is_valid] [varchar](2) NOT NULL,
	[msg_status] [varchar](20) NOT NULL,
	[create_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_pvt_message_id] PRIMARY KEY CLUSTERED 
(
	[pvt_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user_details]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user_details](
	[user_id] [int] NOT NULL,
	[user_login_name] [varchar](20) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[user_address] [varchar](20) NOT NULL,
	[land_phone] [varchar](20) NULL,
	[cell_phone] [varchar](20) NULL,
	[update_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_user_login_name] PRIMARY KEY CLUSTERED 
(
	[user_login_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_user_group_map]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user_group_map](
	[user_group_map_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[is_valid] [varchar](2) NOT NULL,
	[create_ts] [datetime] NOT NULL,
	[update_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_user_group_map_id] PRIMARY KEY CLUSTERED 
(
	[user_group_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 24.08.2015 23:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_users](
	[user_id] [int] NOT NULL,
	[user_status] [varchar](20) NOT NULL,
	[is_valid] [varchar](2) NOT NULL,
	[create_ts] [datetime] NOT NULL,
	[update_ts] [datetime] NOT NULL,
 CONSTRAINT [PK_user_id] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_grp_messages]  WITH NOCHECK ADD  CONSTRAINT [FK_grp_message_receiver] FOREIGN KEY([group_to])
REFERENCES [dbo].[tbl_groups] ([group_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_grp_messages] CHECK CONSTRAINT [FK_grp_message_receiver]
GO
ALTER TABLE [dbo].[tbl_grp_messages]  WITH NOCHECK ADD  CONSTRAINT [FK_grp_message_sender] FOREIGN KEY([user_from])
REFERENCES [dbo].[tbl_users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_grp_messages] CHECK CONSTRAINT [FK_grp_message_sender]
GO
ALTER TABLE [dbo].[tbl_prv_messages]  WITH NOCHECK ADD  CONSTRAINT [FK_pvt_message_receiver] FOREIGN KEY([user_to])
REFERENCES [dbo].[tbl_users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_prv_messages] CHECK CONSTRAINT [FK_pvt_message_receiver]
GO
ALTER TABLE [dbo].[tbl_prv_messages]  WITH NOCHECK ADD  CONSTRAINT [FK_pvt_message_sender] FOREIGN KEY([user_from])
REFERENCES [dbo].[tbl_users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_prv_messages] CHECK CONSTRAINT [FK_pvt_message_sender]
GO
ALTER TABLE [dbo].[tbl_user_details]  WITH NOCHECK ADD  CONSTRAINT [FK_user_id_details] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_user_details] CHECK CONSTRAINT [FK_user_id_details]
GO
ALTER TABLE [dbo].[tbl_user_group_map]  WITH NOCHECK ADD  CONSTRAINT [FK_usr_grp_map_2_group] FOREIGN KEY([group_id])
REFERENCES [dbo].[tbl_groups] ([group_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_user_group_map] CHECK CONSTRAINT [FK_usr_grp_map_2_group]
GO
ALTER TABLE [dbo].[tbl_user_group_map]  WITH NOCHECK ADD  CONSTRAINT [FK_usr_grp_map_2_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([user_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tbl_user_group_map] CHECK CONSTRAINT [FK_usr_grp_map_2_user]
GO
USE [master]
GO
ALTER DATABASE [messenger] SET  READ_WRITE 
GO
