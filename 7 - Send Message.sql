insert into [MESSAGE](SENDER_USER_NAME, RECEIVER_USER_NAME, MES_POSTAGE_DATE, AVA_ID, MES_CONTENT)
values 
('USER1', 'USER2', GETDATE(), null, 'USER1 -> USER2'),
('USER2', 'USER3', GETDATE(), null, 'USER2 -> USER3'),
('USER3', 'USER4', GETDATE(), null, 'USER3 -> USER4'),
('USER4', 'USER5', GETDATE(), null, 'USER4 -> USER5'),
('USER5', 'USER6', GETDATE(), null, 'USER5 -> USER6'),
('USER6', 'USER7', GETDATE(), null, 'USER6 -> USER7'),
('USER7', 'USER8', GETDATE(), null, 'USER7 -> USER8'),
('USER8', 'USER9', GETDATE(), null, 'USER8 -> USER9'),
('USER9', 'USER1', GETDATE(), null, 'USER9 -> USER1')


select * 
from [MESSAGE] as M
where MES_CONTENT is not null and not exists (select *
											from BLOCKING as B
											where
											B.BLOCKER_USER_NAME = M.RECEIVER_USER_NAME
											and
											B.BLOCKED_USER_NAME = M.SENDER_USER_NAME
											)