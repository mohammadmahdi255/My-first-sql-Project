declare @addhashtag table(

	AVA_ID				 int                  not null,
	USER_NAME            varchar(20)          not null,
	HASHTAG              char(6)              not null

)


insert into @addhashtag(AVA_ID, USER_NAME, HASHTAG)
values
(10, 'USER4', '#abcde')

insert into RELATIONSHIP_HASHTAG_AVA(AVA_ID, USER_NAME, TEXT)
select G.AVA_ID, G.USER_NAME, G.HASHTAG
from @addhashtag as G inner join AVA as A
on
G.AVA_ID = A.AVA_ID
and
G.USER_NAME = A.USER_NAME
and
not exists (select *
			 from RELATIONSHIP_HASHTAG_AVA as R
			 where
			 R.AVA_ID = G.AVA_ID
			 and 
			 R.USER_NAME = G.USER_NAME
			 and
			 R.TEXT = G.HASHTAG
			)


select *
from HASHTAG

select *
from RELATIONSHIP_HASHTAG_AVA
