declare @usernames USER_TABLE

insert into @usernames(USER_NAME)
values 
('USER2'),
('USER5')

select L.AVA_USER_NAME, COUNT(*) as 'COUNT_OF_LIKE'
from [LIKE] as L
where not exists (select *
					from BLOCKING as B, @usernames as U
					where 
					B.BLOCKER_USER_NAME = L.USER_NAME
					and
					L.AVA_USER_NAME = U.USER_NAME
					and
					B.BLOCKED_USER_NAME = U.USER_NAME
					)
group by L.AVA_USER_NAME

select *
from BLOCKING as B, @usernames as U
where B.BLOCKED_USER_NAME = U.USER_NAME
					