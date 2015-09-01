
-- create stored procedures

CREATE PROCEDURE user_add
declare @usr_id [int] 
declare
declare
	INSERT INTO [tbl_users] VALUES 
	(
		[user_id]  , --passed by 'Registration' service
		'disabled' , --should be inserted by default (need to create DEFAULT and assign to the table) untill user confirms email or whatever
		'Y' ,  	-- 'N' when user deletes his account
		GETDATE() ,
		GETDATE()
	)
GO



CREATE PROCEDURE group_add
declare
declare
declare

	INSERT INTO [tbl_groups] VALUES 
	(
		[group_id]  , 	--passed by 'Add new group channel' service
		'disabled' , 	--should be inserted by default (need to create DEFAULT and assign to the table)  untill user confirms email or whatever
		'Y' ,  		--'N' when group admin deletes group channel
		GETDATE() ,
		GETDATE()
	)
GO



CREATE PROCEDURE group_add
declare
declare
declare

	INSERT INTO [tbl_user_group_map] VALUES 
	(
		[user_group_map_id] , 	--passed by 'Join the group' service
		[user_id] [int] ,	--passed by 'Join the group' service
		[group_id] [int] ,	--passed by 'Join the group' service
		'disabled' , 		--should be inserted by default (need to create DEFAULT and assign to the table)  untill 'group admin' confirms membership
		'Y' ,  			--'N' when user deletes his membership
		GETDATE() ,
		GETDATE()
	)

GO



CREATE PROCEDURE pvt_msg_send

declare 
declare
declare
declare

	INSERT INTO [tbl_pvt_messages] VALUES 
	(
	[pvt_messages_id] ,		--passed by 'Send message'
	[user_from] ,			--passed by 'Send message'
	[user_to] ,			--passed by 'Send message'
	[msg_text]  ,	
	'Y' ,
	'sent' ,			--defaults 'sent', ' failed', 'processing', 'pending', 'received'
	getdate()
	)

GO

CREATE PROCEDURE grp_msg_send
declare
declare
declare

	INSERT INTO [tbl_grp_messages] VALUES 
	(
	[grp_messages_id] ,		--passed by 'Send message'
	[user_from] ,			--passed by 'Send message'
	[group_to] ,			--passed by 'Send message'
	[msg_text]  ,	
	'Y' ,
	'sent' ,			--defaults 'sent', ' failed', 'processing', 'pending', 'received'
	getdate()
	)

GO