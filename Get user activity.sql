declare @usernames USER_TO_USER

insert into @usernames(FROM_USER_NAME, TO_USER_NAME)
values 
('USER1', 'USER2'),
('USER3', 'USER4')

select *
from AVA as A inner join @usernames as U
on 
A.USER_NAME = U.TO_USER_NAME
and
not exists (select *
			 from BLOCKING as B
			 where 
			 B.BLOCKER_USER_NAME = U.TO_USER_NAME
			 and
			 B.BLOCKED_USER_NAME = U.FROM_USER_NAME
			 )
