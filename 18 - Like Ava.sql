declare @like table(

	FROM_USER_NAME          varchar(20)          not null,
	TO_USER_NAME            varchar(20)          not null,
	To_AVA_ID				int                  not null

)


insert into @like(FROM_USER_NAME, To_AVA_ID, TO_USER_NAME)
values
('USER1', 14, 'USER5'),
('USER2', 14, 'USER5'),
('USER1', 5, 'USER2'),
('USER3', 5, 'USER2')



insert into [LIKE](USER_NAME, AVA_ID, AVA_USER_NAME)
select *
from @like as l
where not exists (select *
					from BLOCKING as B
					where 
					B.BLOCKER_USER_NAME = l.TO_USER_NAME
					and
					B.BLOCKED_USER_NAME = l.FROM_USER_NAME
					)
	 and
	 not exists (select *
				   from [LIKE] as L
				   where
				   L.AVA_ID = l.AVA_ID
				   and
				   L.AVA_USER_NAME = l.AVA_USER_NAME
				   and
				   L.USER_NAME = l.USER_NAME
				   )

select * 
from [LIKE]