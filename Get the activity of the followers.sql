declare @usernames USER_TABLE

insert into @usernames(USER_NAME)
values 
('USER1'),
('USER2')

select *
from FOLLOWING as F inner join MESSAGE as M
on 
F.FOLLOWER_USER_NAME = M.SENDER_USER_NAME
and
F.FOLLOWED_USER_NAME = M.RECEIVER_USER_NAME
and
M.MES_CONTENT is null
and
exists (select USER_NAME 
		from @usernames as U
		where U.USER_NAME = F.FOLLOWED_USER_NAME)
and
F.FOLLOWER_USER_NAME not in (select BLOCKER_USER_NAME from BLOCKING)
order by M.MES_POSTAGE_DATE DESC
