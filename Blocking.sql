declare @blocking USER_TO_USER

insert into @blocking(FROM_USER_NAME, TO_USER_NAME)
values 
('USER1', 'USER2'),
('USER2', 'USER1'),
('USER4', 'USER1'),
('USER3', 'USER1')


insert into BLOCKING(BLOCKER_USER_NAME, BLOCKED_USER_NAME)
select *
from @blocking as B
where not exists (select * 
					from BLOCKING inner join @blocking
					on 
					BLOCKING.BLOCKER_USER_NAME = B.FROM_USER_NAME 
					and 
					BLOCKING.BLOCKED_USER_NAME = B.TO_USER_NAME
					and
					B.FROM_USER_NAME <> B.TO_USER_NAME
					and
					B.FROM_USER_NAME in (select USER_NAME from [USER])
					and
					B.TO_USER_NAME in (select USER_NAME from [USER])
				)


select *
from BLOCKING