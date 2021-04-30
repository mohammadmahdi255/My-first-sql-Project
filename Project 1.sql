

/*
	drop all constraint and table
	if they exist on the database
	and add again by query
*/

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AVA') and o.name = 'FK_AVA_REFERENCE_USER')
alter table AVA
   drop constraint FK_AVA_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_REFERENCE_AVA')
alter table MESSAGE
   drop constraint FK_MESSAGE_REFERENCE_AVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_REFERENCE_USER')
alter table MESSAGE
   drop constraint FK_MESSAGE_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_RELATIONS_USER')
alter table MESSAGE
   drop constraint FK_MESSAGE_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RELATIONSHIP_HASHTAG_AVA') and o.name = 'FK_RELATION_RELATIONS_AVA')
alter table RELATIONSHIP_HASHTAG_AVA
   drop constraint FK_RELATION_RELATIONS_AVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RELATIONSHIP_HASHTAG_AVA') and o.name = 'FK_RELATION_RELATIONS_HASHTAG')
alter table RELATIONSHIP_HASHTAG_AVA
   drop constraint FK_RELATION_RELATIONS_HASHTAG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AVA')
            and   type = 'U')
   drop table AVA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HASHTAG')
            and   type = 'U')
   drop table HASHTAG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MESSAGE')
            and   type = 'U')
   drop table MESSAGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RELATIONSHIP_HASHTAG_AVA')
            and   type = 'U')
   drop table RELATIONSHIP_HASHTAG_AVA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"USER"')
            and   type = 'U')
   drop table "USER"
go

/*==============================================================*/
/* Table: AVA                                                   */
/*==============================================================*/
create table AVA (
   AVA_ID               int identity(1,1)    not null,
   USER_NAME            varchar(20)          not null,
   AVA_CONTENT          varchar(256)         not null,
   AVA_POSTAGE_DATE     date	             not null,
   constraint PK_AVA primary key (USER_NAME, AVA_ID)
)
go

/*==============================================================*/
/* Table: HASHTAG                                               */
/*==============================================================*/
create table HASHTAG (
   TEXT                 varchar(6)           not null,
   constraint PK_HASHTAG primary key (TEXT)
)
go

/*==============================================================*/
/* Table: MESSAGE                                               */
/*==============================================================*/
create table MESSAGE (
   MES_ID               int identity(1,1)    not null,
   SENDING_USER_NAME    varchar(20)          not null,
   RECEIVER_USER_NAME   varchar(20)          not null,
   AVA_ID               int                  null,
   MES_POSTAGE_DATE     date                 null,
   MES_CONTENT          varchar(256)         null,
   constraint PK_MESSAGE primary key (SENDING_USER_NAME, RECEIVER_USER_NAME, MES_ID)
)
go

/*==============================================================*/
/* Table: RELATIONSHIP_HASHTAG_AVA                              */
/*==============================================================*/
create table RELATIONSHIP_HASHTAG_AVA (
   USER_NAME            varchar(20)          not null,
   AVA_ID               int                  not null,
   TEXT                 varchar(6)           not null,
   constraint PK_RELATIONSHIP_HASHTAG_AVA primary key (USER_NAME, AVA_ID, TEXT)
)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   FIRST_NAME           varchar(20)          null,
   LAST_NAME            varchar(20)          null,
   USER_NAME            varchar(20)          not null,
   PASSWORD             varchar(128)         not null,
   BIRTHDAY             date				 null,
   REGISTERY_DATE       date				 null,
   BIOGRAPHY            varchar(64)          null,
   constraint PK_USER primary key (USER_NAME)
)
go

alter table AVA
   add constraint FK_AVA_REFERENCE_USER foreign key (USER_NAME)
      references "USER" (USER_NAME)
go

alter table MESSAGE
   add constraint FK_MESSAGE_REFERENCE_AVA foreign key (SENDING_USER_NAME, AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table MESSAGE
   add constraint FK_MESSAGE_REFERENCE_USER foreign key (SENDING_USER_NAME)
      references "USER" (USER_NAME)
go

alter table MESSAGE
   add constraint FK_MESSAGE_RELATIONS_USER foreign key (RECEIVER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table RELATIONSHIP_HASHTAG_AVA
   add constraint FK_RELATION_RELATIONS_AVA foreign key (USER_NAME, AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table MESSAGE
   add constraint CK_MESSAGE check ((AVA_ID is null and MES_CONTENT is not null) 
   or (AVA_ID is not null and MES_CONTENT is null))
go

alter table RELATIONSHIP_HASHTAG_AVA
   add constraint FK_RELATION_RELATIONS_HASHTAG foreign key (TEXT)
      references HASHTAG (TEXT)
go

alter table HASHTAG
	add constraint CK_HASHTAG check (TEXT like '#%' and LEN(TEXT) = 6)
go


insert into [USER](FIRST_NAME, LAST_NAME, USER_NAME, PASSWORD, BIRTHDAY, REGISTERY_DATE, BIOGRAPHY)
values ('mahdi', 'nemati', '9831066', '0024067024', '', '', ''),
('amin', 'nemati', '9831068', '0110102142', '', '', '')

insert into AVA(USER_NAME, AVA_POSTAGE_DATE, AVA_CONTENT)
values ('9831068', '', 'khobi')

insert into [MESSAGE](SENDING_USER_NAME, RECEIVER_USER_NAME, MES_POSTAGE_DATE, AVA_ID, MES_CONTENT)
values ('9831066', '9831068', GETDATE(), null, null)

select *
from MESSAGE

