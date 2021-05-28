declare @usernames USER_TABLE

insert into @usernames(USER_NAME)
values 
('USER1'),
('USER2')

select *
from [MESSAGE] as M join @usernames as U
on M.RECEIVER_USER_NAME = U.USER_NAME
where M.AVA_ID is null or ( M.AVA_ID is not null 
							and
							not exists (select *
										from BLOCKING as B
										where
										B.BLOCKER_USER_NAME = M.SENDER_USER_NAME
										and
										B.BLOCKED_USER_NAME = M.RECEIVER_USER_NAME
							)
						)
order by M.RECEIVER_USER_NAME, M.MES_POSTAGE_DATE DESC