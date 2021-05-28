


select A.USER_NAME , COUNT(A.AVA_ID) as 'COUNT_OF_LIKE'
from [AVA] as A join [LIKE] as L
on A.AVA_ID = L.AVA_ID and A.USER_NAME = L.AVA_USER_NAME
where not exists (select *
					from BLOCKING as B
					where
					B.BLOCKER_USER_NAME = L.AVA_USER_NAME
					and
					B.BLOCKED_USER_NAME = L.USER_NAME
					)
group by A.USER_NAME
order by COUNT(A.AVA_ID) 