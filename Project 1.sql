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

/*==============================================================*/
/* Table: AVA                                                   */
/*==============================================================*/
create table AVA (
   USER_NAME            varchar(20)          not null,
   AVA_ID               int                  not null,
   AVA_CONTENT          varchar(256)         not null,
   AVA_POSTAGE_DATE     datetime             not null,
   constraint PK_AVA primary key (USER_NAME, AVA_ID)
)
go

/*==============================================================*/
/* Table: BLOCKING                                              */
/*==============================================================*/
create table BLOCKING (
   BLOCKER_USER_NAME    varchar(20)          not null,
   BLOCKED_USER_NAME    varchar(20)          not null,
   IS_BLOCKED           bit                  not null,
   constraint PK_BLOCKING primary key (BLOCKER_USER_NAME, BLOCKED_USER_NAME)
)
go

/*==============================================================*/
/* Table: COMMENTING                                            */
/*==============================================================*/
create table COMMENTING (
   SENDER_COMMENTING_USER_NAME varchar(20)          not null,
   SENDER_AVA_ID        int                  not null,
   RECEVIER_COMMENTING_USER_NAME varchar(20)          not null,
   RECEVIER_AVA_ID      int                  not null,
   constraint PK_COMMENTING primary key (RECEVIER_COMMENTING_USER_NAME, SENDER_COMMENTING_USER_NAME, SENDER_AVA_ID, RECEVIER_AVA_ID)
)
go

/*==============================================================*/
/* Table: FOLLOWING                                             */
/*==============================================================*/
create table FOLLOWING (
   FOLLOWED_USER_NAME   varchar(20)          not null,
   FOLLOWER_USER_NAME   varchar(20)          not null,
   IS_FOLLOWED          bit                  not null,
   constraint PK_FOLLOWING primary key (FOLLOWED_USER_NAME, FOLLOWER_USER_NAME)
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
/* Table: LOGIN                                                 */
/*==============================================================*/
create table LOGIN (
   LOGIN_ID             int                  not null,
   USER_NAME            varchar(20)          not null,
   LOGIN_TIME           datetime             null,
   constraint PK_LOGIN primary key (USER_NAME, LOGIN_ID)
)
go

/*==============================================================*/
/* Table: MESSAGE                                               */
/*==============================================================*/
create table MESSAGE (
   SENDER_USER_NAME     varchar(20)          not null,
   RECEIVER_USER_NAME   varchar(20)          not null,
   MES_ID               int                  not null,
   AVA_ID               int                  null,
   MES_POSTAGE_DATE     datetime             null,
   MES_CONTENT          varchar(256)         null,
   constraint PK_MESSAGE primary key (SENDER_USER_NAME, RECEIVER_USER_NAME, MES_ID)
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
   BIRTHDAY             datetime             null,
   REGISTERY_DATE       datetime             null,
   BIOGRAPHY            varchar(64)          null,
   constraint PK_USER primary key (USER_NAME)
)
go

alter table AVA
   add constraint FK_AVA_REFERENCE_USER foreign key (USER_NAME)
      references "USER" (USER_NAME)
go

alter table BLOCKING
   add constraint FK_BLOCKING_RELATIONS_USER_BLOCKED foreign key (BLOCKED_USER_NAME)
      references "USER" (USER_NAME)
go

alter table BLOCKING
   add constraint FK_BLOCKING_RELATIONS_USER_BLOCKER foreign key (BLOCKER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table COMMENTING
   add constraint FK_COMMENTI_RELATIONS_AVA_RECEIVER foreign key (RECEVIER_COMMENTING_USER_NAME, RECEVIER_AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table COMMENTING
   add constraint FK_COMMENTI_RELATIONS_AVA_SENDER foreign key (SENDER_COMMENTING_USER_NAME, SENDER_AVA_ID)
      references AVA (USER_NAME, AVA_ID)
go

alter table FOLLOWING
   add constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWED foreign key (FOLLOWED_USER_NAME)
      references "USER" (USER_NAME)
go

alter table FOLLOWING
   add constraint FK_FOLLOWIN_RELATIONS_USER_FOLLOWER foreign key (FOLLOWER_USER_NAME)
      references "USER" (USER_NAME)
go

alter table LOGIN
   add constraint FK_LOGIN_RELATIONS_USER foreign key (USER_NAME)
      references "USER" (USER_NAME)
go

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

alter table RELATIONSHIP_HASHTAG_AVA
   add constraint FK_RELATION_RELATIONS_AVA foreign key (USER_NAME, AVA_ID)
      references AVA (USER_NAME, AVA_ID)
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

