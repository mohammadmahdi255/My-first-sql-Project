declare @following USER_TO_USER

insert into @following(FROM_USER_NAME, TO_USER_NAME)
values 
('USER1', 'USER2'),
('USER9', 'USER1'),
('USER3', 'USER4')



insert into FOLLOWING(FOLLOWER_USER_NAME, FOLLOWED_USER_NAME)
select *
from @following as F
where not exists (select *
					from FOLLOWING inner join @following
					on 
					FOLLOWING.FOLLOWER_USER_NAME = F.FROM_USER_NAME 
					and 
					FOLLOWING.FOLLOWED_USER_NAME = F.TO_USER_NAME)
					and
					F.FROM_USER_NAME <> F.TO_USER_NAME
					and
					F.FROM_USER_NAME in (select USER_NAME from [USER])
					and
					F.TO_USER_NAME in (select USER_NAME from [USER])


select *
from FOLLOWING