/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/3 14:35:31                            */
/*==============================================================*/


drop table if exists r_auth_element;

drop table if exists r_auth_file;

drop table if exists r_auth_menu;

drop table if exists r_auth_opt;

drop table if exists r_dept_user;

drop table if exists r_org_dept;

drop table if exists r_role_auth;

drop table if exists r_role_ugroup;

drop table if exists r_user_role;

drop table if exists r_user_ugroup;

drop table if exists t_bd_auth;

drop table if exists t_bd_department;

drop table if exists t_bd_element;

drop table if exists t_bd_file;

drop table if exists t_bd_menu;

drop table if exists t_bd_opt;

drop table if exists t_bd_organization;

drop table if exists t_bd_role;

drop table if exists t_bd_ugroup;

drop table if exists t_bd_user;

/*==============================================================*/
/* Table: r_auth_element                                        */
/*==============================================================*/
create table r_auth_element
(
   id                   int not null auto_increment,
   authid               varchar(32) not null,
   elementid            varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_auth_file                                           */
/*==============================================================*/
create table r_auth_file
(
   id                   int not null auto_increment,
   fileid               varchar(32) not null,
   authid               varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: r_auth_menu                                           */
/*==============================================================*/
create table r_auth_menu
(
   id                   int not null auto_increment,
   authid               varchar(32) not null,
   menuid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_auth_opt                                            */
/*==============================================================*/
create table r_auth_opt
(
   id                   int not null auto_increment,
   authid               varchar(32) not null,
   optid                varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_dept_user                                           */
/*==============================================================*/
create table r_dept_user
(
   id                   int not null auto_increment,
   deptid               varchar(32) not null,
   userid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_org_dept                                            */
/*==============================================================*/
create table r_org_dept
(
   id                   int not null auto_increment,
   orgid                varchar(32) not null,
   deptid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_role_auth                                           */
/*==============================================================*/
create table r_role_auth
(
   id                   int not null auto_increment,
   roleid               varchar(32) not null,
   authid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_role_ugroup                                         */
/*==============================================================*/
create table r_role_ugroup
(
   id                   int not null auto_increment,
   ugroupid             varchar(32) not null,
   roleid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_user_role                                           */
/*==============================================================*/
create table r_user_role
(
   id                   int not null auto_increment,
   userid               varchar(32) not null,
   roleid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: r_user_ugroup                                         */
/*==============================================================*/
create table r_user_ugroup
(
   id                   int not null auto_increment,
   ugroupid             varchar(32) not null,
   userid               varchar(32) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_bd_auth                                             */
/*==============================================================*/
create table t_bd_auth
(
   authid               varchar(32) not null,
   authtype             varchar(50) not null,
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (authid)
);

/*==============================================================*/
/* Table: t_bd_department                                       */
/*==============================================================*/
create table t_bd_department
(
   deptid               varchar(32) not null,
   deptno               varchar(16) not null,
   deptname             varchar(32) not null,
   deptlogo             varchar(50) not null,
   parentdeptid         varchar(32),
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (deptid)
);

/*==============================================================*/
/* Table: t_bd_element                                          */
/*==============================================================*/
create table t_bd_element
(
   elementid            varchar(32) not null,
   elementcode          varchar(50) not null,
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (elementid)
);

/*==============================================================*/
/* Table: t_bd_file                                             */
/*==============================================================*/
create table t_bd_file
(
   fileid               varchar(32) not null,
   filename             varchar(50) not null,
   filepath             varchar(80) not null,
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (fileid)
);

/*==============================================================*/
/* Table: t_bd_menu                                             */
/*==============================================================*/
create table t_bd_menu
(
   menuid               varchar(32) not null,
   menuname             varchar(32) not null,
   menuurl              varchar(80) not null,
   parentmenuid         varchar(32),
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (menuid)
);

/*==============================================================*/
/* Table: t_bd_opt                                              */
/*==============================================================*/
create table t_bd_opt
(
   optid                varchar(32) not null,
   optname              varchar(50) not null,
   optcode              varchar(50) not null,
   preurl               varchar(80) not null,
   parentid             varchar(32),
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (optid)
);

/*==============================================================*/
/* Table: t_bd_organization                                     */
/*==============================================================*/
create table t_bd_organization
(
   orgid                varchar(32) not null,
   orgname              varchar(32) not null,
   orglogo              varchar(50) not null,
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (orgid)
);

/*==============================================================*/
/* Table: t_bd_role                                             */
/*==============================================================*/
create table t_bd_role
(
   roleid               varchar(32) not null,
   rolename             varchar(32) not null,
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (roleid)
);

/*==============================================================*/
/* Table: t_bd_ugroup                                           */
/*==============================================================*/
create table t_bd_ugroup
(
   ugroupid             varchar(32) not null,
   ugroupname           varbinary(50) not null,
   parentugroupid       varchar(32),
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (ugroupid)
);

/*==============================================================*/
/* Table: t_bd_user                                             */
/*==============================================================*/
create table t_bd_user
(
   userid               varchar(32) not null,
   username             varchar(32) not null,
   password             varchar(32) not null,
   nickname             varchar(32) not null,
   phonenum             varchar(15),
   email                varchar(32),
   sex                  char,
   age                  tinyint,
   realname             varchar(32),
   contry               varchar(32),
   city                 varchar(32),
   company              varchar(32),
   address              varchar(200),
   isdel                bool not null,
   createuserid         varchar(32) not null,
   createdatetime       datetime not null,
   updateuserid         varchar(32),
   updatedatetime       datetime,
   primary key (userid)
);

alter table r_auth_element add constraint FK_AE_REF_AUTH foreign key (authid)
      references t_bd_auth (authid) on delete restrict on update restrict;

alter table r_auth_element add constraint FK_AE_REF_ELEMENT foreign key (elementid)
      references t_bd_element (elementid) on delete restrict on update restrict;

alter table r_auth_file add constraint FK_AF_REF_FILE foreign key (fileid)
      references t_bd_file (fileid) on delete restrict on update restrict;

alter table r_auth_file add constraint FK_Reference_20 foreign key (authid)
      references t_bd_auth (authid) on delete restrict on update restrict;

alter table r_auth_menu add constraint FK_AM_REF_AUTH foreign key (authid)
      references t_bd_auth (authid) on delete restrict on update restrict;

alter table r_auth_menu add constraint FK_AM_REF_MENU foreign key (menuid)
      references t_bd_menu (menuid) on delete restrict on update restrict;

alter table r_auth_opt add constraint FK_AO_REF_AUTH foreign key (authid)
      references t_bd_auth (authid) on delete restrict on update restrict;

alter table r_auth_opt add constraint FK_AO_REF_OPT foreign key (optid)
      references t_bd_opt (optid) on delete restrict on update restrict;

alter table r_dept_user add constraint FK_DU_REF_DEPT foreign key (deptid)
      references t_bd_department (deptid) on delete restrict on update restrict;

alter table r_dept_user add constraint FK_DU_REF_USER foreign key (userid)
      references t_bd_user (userid) on delete restrict on update restrict;

alter table r_org_dept add constraint FK_OD_REF_DEPT foreign key (deptid)
      references t_bd_department (deptid) on delete restrict on update restrict;

alter table r_org_dept add constraint FK_OD_REF_ORG foreign key (orgid)
      references t_bd_organization (orgid) on delete restrict on update restrict;

alter table r_role_auth add constraint FK_RA_REF_AUTH foreign key (authid)
      references t_bd_auth (authid) on delete restrict on update restrict;

alter table r_role_auth add constraint FK_RA_REF_ROLE foreign key (roleid)
      references t_bd_role (roleid) on delete restrict on update restrict;

alter table r_role_ugroup add constraint FK_RUG_REF_ROLE foreign key (roleid)
      references t_bd_role (roleid) on delete restrict on update restrict;

alter table r_role_ugroup add constraint FK_RUG_REF_UGROUP foreign key (ugroupid)
      references t_bd_ugroup (ugroupid) on delete restrict on update restrict;

alter table r_user_role add constraint FK_UR_REF_ROLE foreign key (roleid)
      references t_bd_role (roleid) on delete restrict on update restrict;

alter table r_user_role add constraint FK_UR_REF_USER foreign key (userid)
      references t_bd_user (userid) on delete restrict on update restrict;

alter table r_user_ugroup add constraint FK_UUG_REF_UGROUP foreign key (ugroupid)
      references t_bd_ugroup (ugroupid) on delete restrict on update restrict;

alter table r_user_ugroup add constraint FK_UUG_REF_USER foreign key (userid)
      references t_bd_user (userid) on delete restrict on update restrict;

