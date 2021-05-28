declare @ava table(

	AVA_ID					int					 not null,
	AVA_USER_NAME		    varchar(20)          not null

)

declare @user varchar(20) = 'USER4'

insert into @ava(AVA_ID, AVA_USER_NAME)
values 
(14, 'USER5'),
(7, 'USER3')

select V.AVA_USER_NAME, 'COUNT_OF_LIKE' = case 
												when
														not exists (select *
														from BLOCKING as B
														where 
														B.BLOCKER_USER_NAME = V.AVA_USER_NAME
														and
														B.BLOCKED_USER_NAME = @user
														)
													then COUNT(L.AVA_USER_NAME)
												else 0
											end

from [LIKE] as L right join @ava as V
on L.AVA_ID = V.AVA_ID and L.AVA_USER_NAME = V.AVA_USER_NAME
group by V.AVA_USER_NAME
					