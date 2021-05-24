declare @usernames USER_TABLE

insert into @usernames(USER_NAME)
values 
('USER1'),
('USER2')

select *
from AVA 
where AVA.USER_NAME in (select USER_NAME from @usernames)

