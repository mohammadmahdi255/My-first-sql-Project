declare @getava table(

	USER_NAME            varchar(20)          not null,
	HASHTAG              char(6)              not null

)

insert into @getava(USER_NAME, HASHTAG)
values 
('USER1', '#abcde')


select G.USER_NAME, TEXT, A.AVA_ID, A.USER_NAME, A.AVA_CONTENT, A.AVA_POSTAGE_DATE
from @getava as G inner join RELATIONSHIP_HASHTAG_AVA as R
on
G.HASHTAG = R.TEXT
inner join AVA as A
on
R.AVA_ID = A.AVA_ID
and
R.USER_NAME = A.USER_NAME
and
not exists (select * 
			from BLOCKING as B
			where 
			B.BLOCKER_USER_NAME = R.USER_NAME
			and
			B.BLOCKED_USER_NAME = G.USER_NAME
			)