/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     28/06/2016 18:02:46                          */
/*==============================================================*/


drop table if exists CURSO;

drop table if exists ESTUDIANTE;

drop table if exists PERSONA;

drop table if exists PRESTAMO;

drop table if exists PROFESOR;

drop table if exists RECURSO;

drop table if exists RELATIONSHIP_6;

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO
(
   IDCURSO              int not null,
   IDPROFESOR           int,
   PERIODOACADEMICO     varchar(5) not null,
   NOMBRECURSO          varchar(50) not null,
   HORARIODIAS          varchar(50) not null,
   HORARIOHORA          varchar(20) not null,
   AULACURSO            varchar(10) not null,
   DESCRIPCION          varchar(1024) not null,
   primary key (IDCURSO)
);

/*==============================================================*/
/* Table: ESTUDIANTE                                            */
/*==============================================================*/
create table ESTUDIANTE
(
   IDESTUDIANTE         int not null,
   IDPERSONA            int,
   NUMEROUNICO          varchar(9) not null,
   ASOCIADOESTUDIANTE   bool not null,
   APORTANTEESTUDIANTE  bool not null,
   SEMESTREESTUDIANTE   int not null,
   primary key (IDESTUDIANTE)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA
(
   IDPERSONA            int not null,
   CEDULAPERSONA        varchar(10) not null,
   NOMBREPERSONA        varchar(30) not null,
   APELLIDOPERSONA      varchar(30) not null,
   CORREOPERSONA        varchar(50) not null,
   CELULARPERSONA       varchar(15) not null,
   primary key (IDPERSONA)
);

/*==============================================================*/
/* Table: PRESTAMO                                              */
/*==============================================================*/
create table PRESTAMO
(
   IDPRESTAMO           int not null,
   IDPERSONA            int,
   IDRECURSO            int,
   FECHAINI             datetime not null,
   FECHAFIN             datetime not null,
   COSTOPRESTAMO        float(8,2),
   primary key (IDPRESTAMO)
);

/*==============================================================*/
/* Table: PROFESOR                                              */
/*==============================================================*/
create table PROFESOR
(
   IDPROFESOR           int not null,
   IDPERSONA            int,
   DESCRIPCIONPROFESOR  varchar(1024) not null,
   primary key (IDPROFESOR)
);

/*==============================================================*/
/* Table: RECURSO                                               */
/*==============================================================*/
create table RECURSO
(
   IDRECURSO            int not null,
   IDPERSONA            int,
   NOMBRERECURSO        varchar(50) not null,
   MARCARECURSO         varchar(50),
   ESTADORESCURO        varchar(50) not null,
   DESCRIPCIONRECURSO   varchar(1024) not null,
   primary key (IDRECURSO)
);

/*==============================================================*/
/* Table: RELATIONSHIP_6                                        */
/*==============================================================*/
create table RELATIONSHIP_6
(
   IDESTUDIANTE         int not null,
   IDCURSO              int not null,
   primary key (IDESTUDIANTE, IDCURSO)
);

alter table CURSO add constraint FK_RELATIONSHIP_8 foreign key (IDPROFESOR)
      references PROFESOR (IDPROFESOR) on delete restrict on update restrict;

alter table ESTUDIANTE add constraint FK_RELATIONSHIP_1 foreign key (IDPERSONA)
      references PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table PRESTAMO add constraint FK_RELATIONSHIP_4 foreign key (IDPERSONA)
      references PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table PRESTAMO add constraint FK_RELATIONSHIP_5 foreign key (IDRECURSO)
      references RECURSO (IDRECURSO) on delete restrict on update restrict;

alter table PROFESOR add constraint FK_RELATIONSHIP_9 foreign key (IDPERSONA)
      references PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table RECURSO add constraint FK_RELATIONSHIP_3 foreign key (IDPERSONA)
      references PERSONA (IDPERSONA) on delete restrict on update restrict;

alter table RELATIONSHIP_6 add constraint FK_RELATIONSHIP_6 foreign key (IDESTUDIANTE)
      references ESTUDIANTE (IDESTUDIANTE) on delete restrict on update restrict;

alter table RELATIONSHIP_6 add constraint FK_RELATIONSHIP_7 foreign key (IDCURSO)
      references CURSO (IDCURSO) on delete restrict on update restrict;

