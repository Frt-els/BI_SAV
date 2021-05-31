/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 10gR2                          */
/* Date de création :  15/11/2020 14:10:42                      */
/*==============================================================*/


alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_MAGS;

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_RECE;

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_ADRE;

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_RE2;

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_MAGA;

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   drop constraint FK_FAIT_CLI_REFERENCE_DIM_LOCA;

drop table ACSI_SAV_DWH_DM1.DIM_ADRESSE_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.DIM_LOCALISATION_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.DIM_MAGASIN_ACHAT_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.DIM_MAGASIN_SAV_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.DIM_RECEPTIONNISTE_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.DIM_RECEPTION_D cascade constraints;

drop table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F cascade constraints;

drop table ACSI_SAV_DWH_DM1.STAGING_CLIENT cascade constraints;

drop sequence ACSI_SAV_DWH_DM1.SEQ_AD;

drop sequence ACSI_SAV_DWH_DM1.SEQ_CL;

drop sequence ACSI_SAV_DWH_DM1.SEQ_FAIT_CLIENT;

drop sequence ACSI_SAV_DWH_DM1.SEQ_LO;

drop sequence ACSI_SAV_DWH_DM1.SEQ_MA;

drop sequence ACSI_SAV_DWH_DM1.SEQ_MS;

drop sequence ACSI_SAV_DWH_DM1.SEQ_RECEPTION;

drop sequence ACSI_SAV_DWH_DM1.SEQ_RECEPTIONNISTE;

drop sequence ACSI_SAV_DWH_DM1.SEQ_STAGING_CLIENT;

create sequence ACSI_SAV_DWH_DM1.SEQ_AD;

create sequence ACSI_SAV_DWH_DM1.SEQ_CL;

create sequence ACSI_SAV_DWH_DM1.SEQ_FAIT_CLIENT;

create sequence ACSI_SAV_DWH_DM1.SEQ_LO;

create sequence ACSI_SAV_DWH_DM1.SEQ_MA;

create sequence ACSI_SAV_DWH_DM1.SEQ_MS;

create sequence ACSI_SAV_DWH_DM1.SEQ_RECEPTION;

create sequence ACSI_SAV_DWH_DM1.SEQ_RECEPTIONNISTE;

create sequence ACSI_SAV_DWH_DM1.SEQ_STAGING_CLIENT;

/*==============================================================*/
/* Table : DIM_ADRESSE_D                                        */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_ADRESSE_D  (
   ID_ADRESSE           NUMBER                          not null,
   ID_ADRESSE_SRC       NUMBER,
   NUMERO               VARCHAR2(10 CHAR),
   RUE                  VARCHAR2(100 CHAR),
   CODE_POSTAL          NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   VILLE_PRECEDENTE     VARCHAR2(100 CHAR),
   constraint PK_DIM_ADRESSE_D primary key (ID_ADRESSE)
);

/*==============================================================*/
/* Table : DIM_LOCALISATION_D                                   */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_LOCALISATION_D  (
   ID_LOCALISATION      NUMBER                          not null,
   ID_LOCALISATION_SRC  NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   REGION               VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   constraint PK_DIM_LOCALISATION_D primary key (ID_LOCALISATION)
);

/*==============================================================*/
/* Table : DIM_MAGASIN_ACHAT_D                                  */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_MAGASIN_ACHAT_D  (
   ID_MAGASIN           NUMBER                          not null,
   ID_MAGASIN_SRC       NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(100 CHAR),
   constraint PK_DIM_MAGASIN_ACHAT_D primary key (ID_MAGASIN)
);

/*==============================================================*/
/* Table : DIM_MAGASIN_SAV_D                                    */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_MAGASIN_SAV_D  (
   ID_MAGASIN_SAV       NUMBER                          not null,
   ID_MAGASIN_SAV_SRC   NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(100 CHAR),
   constraint PK_DIM_MAGASIN_SAV_D primary key (ID_MAGASIN_SAV)
);

/*==============================================================*/
/* Table : DIM_RECEPTIONNISTE_D                                 */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_RECEPTIONNISTE_D  (
   ID_RECEPTIONNISTE    NUMBER                          not null,
   ID_RECEPTIONNISTE_SRC NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_DIM_RECEPTIONNISTE_D primary key (ID_RECEPTIONNISTE)
);

/*==============================================================*/
/* Table : DIM_RECEPTION_D                                      */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.DIM_RECEPTION_D  (
   ID_RECEPTION         NUMBER                          not null,
   ID_RECEPTION_SRC     NUMBER,
   DATE_RECEPTION       DATE,
   TEMPS                NUMBER,
   SCD_END              DATE,
   SCD_START            DATE,
   SCD_VERSION          NUMBER,
   SCD_ACTIVE           VARCHAR2(5 CHAR),
   constraint PK_DIM_RECEPTION_D primary key (ID_RECEPTION)
);

/*==============================================================*/
/* Table : FAIT_CLIENT_F                                        */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F  (
   ID_CLIENT            NUMBER                          not null,
   ID_MAGASIN_SAV       NUMBER,
   ID_RECEPTIONNISTE    NUMBER,
   ID_ADRESSE           NUMBER,
   ID_RECEPTION         NUMBER,
   ID_MAGASIN           NUMBER,
   ID_LOCALISATION      NUMBER,
   NUMERO_CLIENT        NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_FAIT_CLIENT_F primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : STAGING_CLIENT                                       */
/*==============================================================*/
create table ACSI_SAV_DWH_DM1.STAGING_CLIENT  (
   ID_STA_CLI           NUMBER                          not null,
   ID_RECEPTION         NUMBER,
   DATE_RECEPTION       DATE,
   TEMPS                NUMBER,
   ID_MAGASIN           NUMBER,
   CODE_ACHAT           VARCHAR2(3 CHAR),
   LIBELLE_ACHAT        VARCHAR2(100 CHAR),
   ID_LOCALISATION      NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   REGION               VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   ID_MAGASIN_SAV       NUMBER,
   CODE_SAV             VARCHAR2(3 CHAR),
   LIBELLE_SAV          VARCHAR2(100 CHAR),
   ID_RECEPTIONNISTE    NUMBER,
   NOM_RECEPTIONNISTE   VARCHAR2(100 CHAR),
   PRENOM_RECEPTIONNISTE VARCHAR2(100 CHAR),
   ID_ADRESSE           NUMBER,
   NUMERO               VARCHAR2(10 CHAR),
   RUE                  VARCHAR2(100 CHAR),
   CODE_POSTAL          NUMBER,
   VILLE_ADRESSE        VARCHAR2(100 CHAR),
   PAYS_ADRESSE         VARCHAR2(100 CHAR),
   ID_CLIENT            NUMBER,
   NUMERO_CLIENT        NUMBER,
   NOM_CLIENT           VARCHAR2(100 CHAR),
   PRENOM_CLIENT        VARCHAR2(100 CHAR),
   constraint PK_STAGING_CLIENT primary key (ID_STA_CLI)
);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_MAGS foreign key (ID_MAGASIN_SAV)
      references ACSI_SAV_DWH_DM1.DIM_MAGASIN_SAV_D (ID_MAGASIN_SAV);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_RECE foreign key (ID_RECEPTIONNISTE)
      references ACSI_SAV_DWH_DM1.DIM_RECEPTIONNISTE_D (ID_RECEPTIONNISTE);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_ADRE foreign key (ID_ADRESSE)
      references ACSI_SAV_DWH_DM1.DIM_ADRESSE_D (ID_ADRESSE);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_RE2 foreign key (ID_RECEPTION)
      references ACSI_SAV_DWH_DM1.DIM_RECEPTION_D (ID_RECEPTION);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_MAGA foreign key (ID_MAGASIN)
      references ACSI_SAV_DWH_DM1.DIM_MAGASIN_ACHAT_D (ID_MAGASIN);

alter table ACSI_SAV_DWH_DM1.FAIT_CLIENT_F
   add constraint FK_FAIT_CLI_REFERENCE_DIM_LOCA foreign key (ID_LOCALISATION)
      references ACSI_SAV_DWH_DM1.DIM_LOCALISATION_D (ID_LOCALISATION);

