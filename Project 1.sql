/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     2021-05-01 2:08:00 AM                        */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AVA') and o.name = 'FK_AVA_REFERENCE_USER')
alter table AVA
   drop constraint FK_AVA_REFERENCE_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BLOCKING') and o.name = 'FK_BLOCKING_RELATIONS_USER_BLOCKED')
alter table BLOCKING
   drop constraint FK_BLOCKING_RELATIONS_USER_BLOCKED
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BLOCKING') and o.name = 'FK_BLOCKING_RELATIONS_USER_BLOCKER')
alter table BLOCKING
   drop constraint FK_BLOCKING_RELATIONS_USER_BLOCKER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BLOCKING') and o.name = 'CK_BLOCKING')
alter table BLOCKING
   drop constraint CK_BLOCKING
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENTING') and o.name = 'FK_COMMENTI_RELATIONS_AVA_RECEIVER')
alter table COMMENTING
   drop constraint FK_COMMENTI_RELATIONS_AVA_RECEIVER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('COMMENTING') and o.name = 'FK_COMMENTI_RELATIONS_AVA_SENDER')
alter table COMMENTING
   drop constraint FK_COMMENTI_RELATIONS_AVA_SENDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FOLLOWING') and o.name = 'FK_FOLLOWIN_RELATIONS_USER_FOLLOWED')
alter table FOLLOWING
   drop constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWED
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FOLLOWING') and o.name = 'FK_FOLLOWIN_RELATIONS_USER_FOLLOWER')
alter table FOLLOWING
   drop constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('FOLLOWING') and o.name = 'CK_FOLLOWING')
alter table FOLLOWING
   drop constraint CK_FOLLOWING
go


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LOGIN') and o.name = 'FK_LOGIN_RELATIONS_USER')
alter table LOGIN
   drop constraint FK_LOGIN_RELATIONS_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_REFERENCE_AVA')
alter table MESSAGE
   drop constraint FK_MESSAGE_REFERENCE_AVA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_REFERENCE_USER_RECEEVIER')
alter table MESSAGE
   drop constraint FK_MESSAGE_REFERENCE_USER_RECEEVIER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'FK_MESSAGE_RELATIONS_USER_SENDER')
alter table MESSAGE
   drop constraint FK_MESSAGE_RELATIONS_USER_SENDER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MESSAGE') and o.name = 'CK_MESSAGE')
alter table MESSAGE
   drop constraint CK_MESSAGE
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
           where  id = object_id('BLOCKING')
            and   type = 'U')
   drop table BLOCKING
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMMENTING')
            and   type = 'U')
   drop table COMMENTING
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FOLLOWING')
            and   type = 'U')
   drop table FOLLOWING
go

if exists (select 1
            from  sysobjects
           where  id = object_id('HASHTAG')
            and   type = 'U')
   drop table HASHTAG
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LOGIN')
            and   type = 'U')
   drop table LOGIN
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

if exists (select 1
			from sysobjects
			where id = object_id('USER_LOGIN')
			and type = 'P')
			drop procedure USER_LOGIN
go

if type_id('USER_TABLE') is not null
	drop type USER_TABLE;

if type_id('USER_TO_USER') is not null
	drop type USER_TO_USER;


/*==============================================================*/
/* Table: AVA                                                   */
/*==============================================================*/
create table AVA (
   AVA_ID               int  identity(1, 1)					 not null,
   USER_NAME            varchar(20)							 not null,
   AVA_CONTENT          varchar(256)						 not null,
   AVA_POSTAGE_DATE     datetime default CURRENT_TIMESTAMP   not null,
   constraint PK_AVA primary key (USER_NAME, AVA_ID)
)
go

/*==============================================================*/
/* Table: BLOCKING                                              */
/*==============================================================*/
create table BLOCKING (
   BLOCKER_USER_NAME    varchar(20)          not null,
   BLOCKED_USER_NAME    varchar(20)          not null,
   constraint PK_BLOCKING primary key (BLOCKER_USER_NAME, BLOCKED_USER_NAME)
)
go

/*==============================================================*/
/* Table: COMMENTING                                            */
/*==============================================================*/
create table COMMENTING (
   SENDER_COMMENTING_USER_NAME varchar(20)          not null,
   SENDER_AVA_ID        int							not null,
   RECEVIER_COMMENTING_USER_NAME varchar(20)        not null,
   RECEVIER_AVA_ID      int							not null,
   constraint PK_COMMENTING primary key (RECEVIER_COMMENTING_USER_NAME, SENDER_COMMENTING_USER_NAME, SENDER_AVA_ID, RECEVIER_AVA_ID)
)
go

/*==============================================================*/
/* Table: FOLLOWING                                             */
/*==============================================================*/
create table FOLLOWING (
   FOLLOWER_USER_NAME   varchar(20)          not null,
   FOLLOWED_USER_NAME   varchar(20)          not null,
   constraint PK_FOLLOWING primary key (FOLLOWER_USER_NAME, FOLLOWED_USER_NAME)
)
go

/*==============================================================*/
/* Table: HASHTAG                                               */
/*==============================================================*/
create table HASHTAG (
   TEXT                 char(6)              not null,
   constraint PK_HASHTAG primary key (TEXT)
)
go

/*==============================================================*/
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN (
   LOGIN_ID             int  identity(1, 1)					not null,
   USER_NAME            varchar(20)						    not null,
   LOGIN_TIME           datetime default CURRENT_TIMESTAMP  not null,
   constraint PK_LOGIN primary key (LOGIN_ID, USER_NAME)
)
go

/*==============================================================*/
/* Table: MESSAGE                                               */
/*==============================================================*/
create table MESSAGE (
   MES_ID               int  identity(1, 1)						not null,
   SENDER_USER_NAME     varchar(20)								not null,
   RECEIVER_USER_NAME   varchar(20)								not null,
   AVA_ID               int										null,
   MES_POSTAGE_DATE     datetime default CURRENT_TIMESTAMP      null,
   MES_CONTENT          varchar(256)							null,
   constraint PK_MESSAGE primary key (MES_ID, SENDER_USER_NAME, RECEIVER_USER_NAME)
)
go

/*==============================================================*/
/* Table: RELATIONSHIP_HASHTAG_AVA                              */
/*==============================================================*/
create table RELATIONSHIP_HASHTAG_AVA (
   AVA_ID               int                  not null,
   USER_NAME            varchar(20)          not null,
   TEXT                 char(6)              not null,
   constraint PK_RELATIONSHIP_HASHTAG_AVA primary key (USER_NAME, AVA_ID, TEXT)
)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   FIRST_NAME           varchar(20)						      null,
   LAST_NAME            varchar(20)						      null,
   USER_NAME            varchar(20)						      not null,
   PASSWORD             varchar(128)					      not null,
   BIRTHDAY             datetime							  null,
   REGISTERY_DATE       datetime default CURRENT_TIMESTAMP    null,
   BIOGRAPHY            varchar(64)						      null
   constraint PK_USER primary key (USER_NAME)
)
go

alter table AVA
   add constraint FK_AVA_REFERENCE_USER foreign key (USER_NAME)
      references "USER" (USER_NAME)
go

alter table BLOCKING
   add constraint FK_BLOCKING_RELATIONS_USER_BLOCKER foreign key (BLOCKER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table BLOCKING
   add constraint FK_BLOCKING_RELATIONS_USER_BLOCKED foreign key (BLOCKED_USER_NAME)
      references "USER" (USER_NAME)
go

alter table BLOCKING
   add constraint CK_BLOCKING check (BLOCKER_USER_NAME <> BLOCKED_USER_NAME)
go

alter table COMMENTING
   add constraint FK_COMMENTI_RELATIONS_AVA_RECEIVER foreign key (RECEVIER_COMMENTING_USER_NAME, RECEVIER_AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table COMMENTING
   add constraint FK_COMMENTI_RELATIONS_AVA_SENDER foreign key (SENDER_COMMENTING_USER_NAME, SENDER_AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go


--Following alter start ==============================================================

alter table FOLLOWING
   add constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWED foreign key (FOLLOWER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table FOLLOWING
   add constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWER foreign key (FOLLOWED_USER_NAME)
      references "USER" (USER_NAME)
go

alter table FOLLOWING
   add constraint CK_FOLLOWING check (FOLLOWER_USER_NAME <> FOLLOWED_USER_NAME)
go

--Following alter end ================================================================


alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_USER foreign key (USER_NAME)
      references "USER" (USER_NAME)
go


--Message alter start ================================================================

alter table MESSAGE
   add constraint FK_MESSAGE_REFERENCE_AVA foreign key (SENDER_USER_NAME, AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table MESSAGE
   add constraint FK_MESSAGE_REFERENCE_USER_RECEEVIER foreign key (RECEIVER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table MESSAGE
   add constraint FK_MESSAGE_RELATIONS_USER_SENDER foreign key (SENDER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table MESSAGE
   add constraint CK_MESSAGE check (
								((AVA_ID is null and MES_CONTENT is not null) 
								or 
								(AVA_ID is not null and MES_CONTENT is null))
								and
								(SENDER_USER_NAME <> RECEIVER_USER_NAME)
							   )
go

create trigger MESSAGE_BLOCK 
on MESSAGE
instead of insert as
begin

insert into [MESSAGE](SENDER_USER_NAME, RECEIVER_USER_NAME, MES_POSTAGE_DATE, AVA_ID, MES_CONTENT)
select  SENDER_USER_NAME, RECEIVER_USER_NAME, MES_POSTAGE_DATE, AVA_ID, MES_CONTENT
from inserted as I
where not exists (select *
					from BLOCKING as B
					where 
					(B.BLOCKER_USER_NAME = I.RECEIVER_USER_NAME
					and
					B.BLOCKED_USER_NAME = I.SENDER_USER_NAME)
					or
					(I.AVA_ID is not null
					and 
					B.BLOCKER_USER_NAME = I.SENDER_USER_NAME
					and
					B.BLOCKED_USER_NAME = I.RECEIVER_USER_NAME)
					)

end
go

--Message alter end ================================================================

alter table RELATIONSHIP_HASHTAG_AVA
   add constraint FK_RELATION_RELATIONS_AVA foreign key (USER_NAME, AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table RELATIONSHIP_HASHTAG_AVA
   add constraint FK_RELATION_RELATIONS_HASHTAG foreign key (TEXT)
      references HASHTAG (TEXT)
go

--User alter start ==============================================================

create type USER_TABLE as table(
	USER_NAME            varchar(20)		  not null,
	PASSWORD             varchar(128)         null
)
go

--User alter end ================================================================

--hashtag alter start ==============================================================

--Hashtag check to see is start with '#' and have 5 characters
alter table HASHTAG
	add constraint CK_HASHTAG check (TEXT like '#%' and LEN(TEXT) = 6)
go

--auto add for Hashtag used in 
create trigger HASHTAG_AVA 
on RELATIONSHIP_HASHTAG_AVA
instead of insert as
begin

insert into HASHTAG
select TEXT 
from inserted 
where inserted.TEXT not in (select TEXT from HASHTAG)

insert into RELATIONSHIP_HASHTAG_AVA
select *
from inserted

end
go

-- hashtag alter end ================================================================

create type USER_TO_USER as table(
	FROM_USER_NAME            varchar(20)		  not null,
	TO_USER_NAME            varchar(20)		  not null
)
go




