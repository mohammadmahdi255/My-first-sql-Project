declare @usernames USER_TO_USER

insert into @usernames(FROM_USER_NAME, TO_USER_NAME)
values 
('USER1', 'USER2'),
('USER5', 'USER4')

delete BLOCKING
from @usernames as U inner join BLOCKING as B
on 
U.FROM_USER_NAME = B.BLOCKER_USER_NAME
and
U.TO_USER_NAME = B.BLOCKED_USER_NAME

select *
from BLOCKING