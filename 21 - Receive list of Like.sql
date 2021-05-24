declare @ava table(

	AVA_ID					int					 not null,
	AVA_USER_NAME		    varchar(20)          not null

)

insert into @ava(AVA_ID, AVA_USER_NAME)
values 
(14, 'USER5'),
(5, 'USER2')

select L.USER_NAME, L.AVA_ID, L.AVA_USER_NAME
from [LIKE] as L join @ava as V
on L.AVA_ID = V.AVA_ID and L.AVA_USER_NAME = V.AVA_USER_NAME
where not exists (select *
					from BLOCKING as B
					where 
					B.BLOCKER_USER_NAME = L.USER_NAME
					and
					B.BLOCKED_USER_NAME = L.AVA_USER_NAME
					)
	and  not exists (select *
					from BLOCKING as B
					where 
					B.BLOCKER_USER_NAME = L.AVA_USER_NAME
					and
					B.BLOCKED_USER_NAME = L.USER_NAME
					)
					