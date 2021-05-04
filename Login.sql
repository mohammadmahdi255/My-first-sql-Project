declare @usernames USER_TABLE

insert into @usernames(USER_NAME, PASSWORD)
values ('USER1', 'USER0001'),
('USER2', 'USER0010')

if (select COUNT(*) from @usernames) <> 0
	begin
		insert into LOGIN(USER_NAME, LOGIN_TIME)
		select U.USER_NAME, GETDATE() as 'LOGIN_TIME'
		from [USER] as U join @usernames as S
		on U.USER_NAME = S.USER_NAME and U.PASSWORD = S.PASSWORD 
	end

select *
from LOGIN