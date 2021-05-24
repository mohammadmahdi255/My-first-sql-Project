declare @usernames USER_TO_USER

insert into @usernames(FROM_USER_NAME, TO_USER_NAME)
values ('USER1', 'USER2')

delete FOLLOWING
from @usernames as U inner join FOLLOWING as F
on 
U.FROM_USER_NAME = F.FOLLOWER_USER_NAME
and
U.TO_USER_NAME = F.FOLLOWED_USER_NAME) 
				

select *
from FOLLOWING