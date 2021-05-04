declare @vote table(

	FROM_USER_NAME          varchar(20)          not null,
	To_AVA_ID				int                  not null,
	TO_USER_NAME            varchar(20)          not null

)


insert into @vote(FROM_USER_NAME, To_AVA_ID, TO_USER_NAME)
values
('USER1', 14, 'USER5')


select *
from @vote as V inner join COMMENTING as C
on 
V.To_AVA_ID = C.RECEVIER_AVA_ID
and
V.TO_USER_NAME = C.RECEVIER_COMMENTING_USER_NAME
inner join AVA as A
on
C.SENDER_AVA_ID = A.AVA_ID
and
C.SENDER_COMMENTING_USER_NAME = A.USER_NAME
and
not exists (select *
			from BLOCKING as B
			where 
			(
			B.BLOCKER_USER_NAME = C.SENDER_COMMENTING_USER_NAME
			or
			B.BLOCKER_USER_NAME = C.RECEVIER_COMMENTING_USER_NAME
			)
			and
			B.BLOCKED_USER_NAME = V.FROM_USER_NAME
			)