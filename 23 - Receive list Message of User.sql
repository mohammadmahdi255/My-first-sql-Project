


select *
from [MESSAGE] as M
where M.AVA_ID is null or ( M.AVA_ID is not null 
							and
							not exists (select *
										from BLOCKING as B
										where
										B.BLOCKER_USER_NAME = M.SENDER_USER_NAME
										and
										B.BLOCKED_USER_NAME = M.RECEIVER_USER_NAME
							)
)