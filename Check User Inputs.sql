
declare @usernames USER_TABLE

insert into @usernames(USER_NAME)
values 
('USER1'),
('USER2')

select L.USER_NAME, L.LOGIN_TIME
from LOGIN as L
where L.USER_NAME in (select USER_NAME from @usernames)
order by L.USER_NAME, L.LOGIN_TIME DESC