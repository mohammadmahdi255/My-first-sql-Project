declare @vote table(

	FROM_USER_NAME          varchar(20)          not null,
	To_AVA_ID					int                  not null,
	TO_USER_NAME            varchar(20)          not null,
	CONTENT                 varchar(128)         null

)

insert into @vote(FROM_USER_NAME, To_AVA_ID, TO_USER_NAME, CONTENT)
values
('USER6', 11, 'USER4', 'USER6 ----> USER4')

delete @vote 
from BLOCKING as B, @vote as V
where 
B.BLOCKER_USER_NAME = TO_USER_NAME
and
B.BLOCKED_USER_NAME = V.FROM_USER_NAME
		


declare @lastcolumn int = (select COUNT(*) from AVA)
declare @addcount int = (select COUNT(*) from @vote)

if (@addcount > 0) 
begin

	insert into AVA(USER_NAME, AVA_POSTAGE_DATE, AVA_CONTENT)
	select V.FROM_USER_NAME, GETDATE(), V.CONTENT
	from @vote as V

	insert into COMMENTING(SENDER_COMMENTING_USER_NAME, SENDER_AVA_ID, RECEVIER_COMMENTING_USER_NAME, RECEVIER_AVA_ID)
	select V.FROM_USER_NAME, A.AVA_ID, V.TO_USER_NAME, V.To_AVA_ID
	from @vote as V inner join AVA as A
	on V.FROM_USER_NAME = A.USER_NAME
	where A.AVA_ID > @lastcolumn

end

select *
from COMMENTING
order by SENDER_AVA_ID