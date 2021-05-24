insert into [USER](FIRST_NAME, LAST_NAME, USER_NAME, PASSWORD, BIRTHDAY, REGISTERY_DATE, BIOGRAPHY)
values 
('FN1', 'LN1', 'USER1', 'USER0001', '2000/1/1', GETDATE(), 'i am FN1'),
('FN2', 'LN2', 'USER2', 'USER0010', '2000/1/1', GETDATE(), 'i am FN2'),
('FN3', 'LN3', 'USER3', 'USER0011', '2000/2/1', GETDATE(), 'i am FN3'),
('FN4', 'LN4', 'USER4', 'USER0100', '2000/3/1', GETDATE(), 'i am FN4'),
('FN5', 'LN5', 'USER5', 'USER0101', '2000/4/1', GETDATE(), 'i am FN5'),
('FN6', 'LN6', 'USER6', 'USER0110', '2000/5/1', GETDATE(), 'i am FN6'),
('FN7', 'LN7', 'USER7', 'USER0111', '2000/6/1', GETDATE(), 'i am FN7'),
('FN8', 'LN8', 'USER8', 'USER1000', '2000/7/1', GETDATE(), 'i am FN8'),
('FN9', 'LN9', 'USER9', 'USER1001', '2000/8/1', GETDATE(), 'i am FN9')


select *
from [USER]