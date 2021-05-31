/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 10gR2                          */
/* Date de création :  15/11/2020 14:11:12                      */
/*==============================================================*/


alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_GARA;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_FOUR;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_REP1;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_ETAT;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_MAGA;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_LOCA;

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   drop constraint FK_FAIT_PRO_REFERENCE_DIM_REPA;

drop table ACSI_SAV_DWH_DM2.DIM_ETAT_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_FOURNISSEUR_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_GARANTIE_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_LOCALISATION_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_MAGASIN_SAV_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_REPARATEUR_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.DIM_REPARATION_D cascade constraints;

drop table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F cascade constraints;

drop table ACSI_SAV_DWH_DM2.STAGING_PRODUIT cascade constraints;

drop sequence ACSI_SAV_DWH_DM2.SEQ_ET;

drop sequence ACSI_SAV_DWH_DM2.SEQ_FAIT_PRODUIT;

drop sequence ACSI_SAV_DWH_DM2.SEQ_FO;

drop sequence ACSI_SAV_DWH_DM2.SEQ_GR;

drop sequence SEQ_LO;

drop sequence ACSI_SAV_DWH_DM2.SEQ_MS;

drop sequence SEQ_PR;

drop sequence ACSI_SAV_DWH_DM2.SEQ_REPARATEUR;

drop sequence ACSI_SAV_DWH_DM2.SEQ_REPARATION;

drop sequence ACSI_SAV_DWH_DM2.SEQ_STAGING_PRODUIT;

create sequence ACSI_SAV_DWH_DM2.SEQ_ET;

create sequence ACSI_SAV_DWH_DM2.SEQ_FAIT_PRODUIT;

create sequence ACSI_SAV_DWH_DM2.SEQ_FO;

create sequence ACSI_SAV_DWH_DM2.SEQ_GR;

create sequence SEQ_LO;

create sequence ACSI_SAV_DWH_DM2.SEQ_MS;

create sequence SEQ_PR;

create sequence ACSI_SAV_DWH_DM2.SEQ_REPARATEUR;

create sequence ACSI_SAV_DWH_DM2.SEQ_REPARATION;

create sequence ACSI_SAV_DWH_DM2.SEQ_STAGING_PRODUIT;

/*==============================================================*/
/* Table : DIM_ETAT_D                                           */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_ETAT_D  (
   ID_ETAT              NUMBER                          not null,
   ID_ETAT_SRC          NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(50 CHAR),
   constraint PK_DIM_ETAT_D primary key (ID_ETAT)
);

/*==============================================================*/
/* Table : DIM_FOURNISSEUR_D                                    */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_FOURNISSEUR_D  (
   ID_FOURNISSEUR       NUMBER                          not null,
   ID_FOURNISSEUR_SRC   NUMBER,
   CODE                 VARCHAR2(5 CHAR),
   RAISON_SOCIALE       VARCHAR2(200 CHAR),
   RAISON_SOCIALE_PRECEDENTE VARCHAR2(200 CHAR),
   constraint PK_DIM_FOURNISSEUR_D primary key (ID_FOURNISSEUR)
);

/*==============================================================*/
/* Table : DIM_GARANTIE_D                                       */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_GARANTIE_D  (
   ID_GARANTIE          NUMBER                          not null,
   ID_GARANTIE_SRC      NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   DATE_DEBUT           DATE,
   DATE_FIN             DATE,
   constraint PK_DIM_GARANTIE_D primary key (ID_GARANTIE)
);

/*==============================================================*/
/* Table : DIM_LOCALISATION_D                                   */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_LOCALISATION_D  (
   ID_LOCALISATION      NUMBER                          not null,
   ID_LOCALISATION_SRC  NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   REGION               VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   constraint PK_DIM_LOCALISATION_D primary key (ID_LOCALISATION)
);

/*==============================================================*/
/* Table : DIM_MAGASIN_SAV_D                                    */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_MAGASIN_SAV_D  (
   ID_MAGASIN_SAV       NUMBER                          not null,
   ID_MAGASIN_SAV_SRC   NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(100 CHAR),
   constraint PK_DIM_MAGASIN_SAV_D primary key (ID_MAGASIN_SAV)
);

/*==============================================================*/
/* Table : DIM_REPARATEUR_D                                     */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_REPARATEUR_D  (
   ID_REPARATEUR        NUMBER                          not null,
   ID_REPARATEUR_SRC    NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_DIM_REPARATEUR_D primary key (ID_REPARATEUR)
);

/*==============================================================*/
/* Table : DIM_REPARATION_D                                     */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.DIM_REPARATION_D  (
   ID_REPARATION        NUMBER                          not null,
   ID_REPARATION_SRC    NUMBER,
   DATE_DEBUT           DATE,
   DATE_FIN             DATE,
   TEMPS                NUMBER,
   PRIX                 FLOAT,
   SCD_ACTIVE           VARCHAR2(5 CHAR),
   SCD_VERSION          NUMBER,
   SCD_START            DATE,
   SCD_END              DATE,
   constraint PK_DIM_REPARATION_D primary key (ID_REPARATION)
);

/*==============================================================*/
/* Table : FAIT_PRODUIT_F                                       */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F  (
   ID_PRODUIT           NUMBER                          not null,
   ID_GARANTIE          NUMBER,
   ID_FOURNISSEUR       NUMBER,
   ID_REPARATEUR        NUMBER,
   ID_ETAT              NUMBER,
   ID_MAGASIN_SAV       NUMBER,
   ID_LOCALISATION      NUMBER,
   ID_REPARATION        NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   NOM                  VARCHAR2(100 CHAR),
   TYPE                 VARCHAR2(100 CHAR),
   PRIX                 REAL,
   constraint PK_FAIT_PRODUIT_F primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Table : STAGING_PRODUIT                                      */
/*==============================================================*/
create table ACSI_SAV_DWH_DM2.STAGING_PRODUIT  (
   ID_STA_PRD           NUMBER                          not null,
   ID_GARANTIE          NUMBER,
   CODE_GARANTIE        VARCHAR2(3 CHAR),
   DATE_DEBUT           DATE,
   DATE_FIN             DATE,
   ID_FOURNISSEUR       NUMBER,
   CODE_FOURNISSEUR     VARCHAR2(5 CHAR),
   RAISON_SOCIALE       VARCHAR2(200 CHAR),
   ID_REPARATEUR        NUMBER,
   NOM_REPARATEUR       VARCHAR2(100 CHAR),
   PRENOM_REPARATEUR    VARCHAR2(100 CHAR),
   ID_ETAT              NUMBER,
   CODE_ETAT            VARCHAR2(3 CHAR),
   LIBELLE_ETAT         VARCHAR2(50 CHAR),
   ID_MAGASIN_SAV       NUMBER,
   CODE_SAV             VARCHAR2(3 CHAR),
   LIBELLE_SAV          VARCHAR2(100 CHAR),
   ID_LOCALISATION      NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   REGION               VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   ID_REPARATION        NUMBER,
   DATE_DEBUT_REPARATION DATE,
   DATE_FIN_REPARATION  DATE,
   TEMPS                NUMBER,
   PRIX                 FLOAT,
   ID_PRODUIT           NUMBER,
   CODE_PRODUIT         VARCHAR2(3 CHAR),
   NOM_PRODUIT          VARCHAR2(100 CHAR),
   TYPE_PRODUIT         VARCHAR2(100 CHAR),
   PRIX_PRODUIT         REAL,
   constraint PK_STAGING_PRODUIT primary key (ID_STA_PRD)
);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_GARA foreign key (ID_GARANTIE)
      references ACSI_SAV_DWH_DM2.DIM_GARANTIE_D (ID_GARANTIE);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_FOUR foreign key (ID_FOURNISSEUR)
      references ACSI_SAV_DWH_DM2.DIM_FOURNISSEUR_D (ID_FOURNISSEUR);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_REP1 foreign key (ID_REPARATEUR)
      references ACSI_SAV_DWH_DM2.DIM_REPARATEUR_D (ID_REPARATEUR);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_ETAT foreign key (ID_ETAT)
      references ACSI_SAV_DWH_DM2.DIM_ETAT_D (ID_ETAT);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_MAGA foreign key (ID_MAGASIN_SAV)
      references ACSI_SAV_DWH_DM2.DIM_MAGASIN_SAV_D (ID_MAGASIN_SAV);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_LOCA foreign key (ID_LOCALISATION)
      references ACSI_SAV_DWH_DM2.DIM_LOCALISATION_D (ID_LOCALISATION);

alter table ACSI_SAV_DWH_DM2.FAIT_PRODUIT_F
   add constraint FK_FAIT_PRO_REFERENCE_DIM_REPA foreign key (ID_REPARATION)
      references ACSI_SAV_DWH_DM2.DIM_REPARATION_D (ID_REPARATION);

