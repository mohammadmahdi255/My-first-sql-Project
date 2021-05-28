insert into [MESSAGE](SENDER_USER_NAME, RECEIVER_USER_NAME, MES_POSTAGE_DATE, AVA_ID, MES_CONTENT)
values 
('USER1', 'USER2', GETDATE(), 3, null),
('USER2', 'USER3', GETDATE(), 4, null),
('USER3', 'USER4', GETDATE(), 7, null),
('USER4', 'USER5', GETDATE(), 10, null),
('USER5', 'USER6', GETDATE(), 13, null),
('USER6', 'USER7', GETDATE(), 16, null),
('USER7', 'USER8', GETDATE(), 20, null),
('USER8', 'USER9', GETDATE(), 22, null),
('USER9', 'USER1', GETDATE(), 25, null)

select * 
from [MESSAGE] as M
where MES_CONTENT is null and not exists (select *
											from BLOCKING as B
											where
											B.BLOCKER_USER_NAME = M.RECEIVER_USER_NAME
											and
											B.BLOCKED_USER_NAME = M.SENDER_USER_NAME
											)
							and not exists (select *
											from BLOCKING as B
											where
											B.BLOCKER_USER_NAME = M.SENDER_USER_NAME
											and
											B.BLOCKED_USER_NAME = M.RECEIVER_USER_NAME
											)