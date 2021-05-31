/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 10gR2                          */
/* Date de création :  15/11/2020 14:05:41                      */
/*==============================================================*/


alter table ACSI_SAV_OPE.CLIENT
   drop constraint FK_CLIENT_REFERENCE_ADRESSE;

alter table ACSI_SAV_OPE.MAGASIN_ACHAT
   drop constraint FK_MAGASIN__REFERENCE_LOCALIS2;

alter table ACSI_SAV_OPE.MAGASIN_SAV
   drop constraint FK_MAGASIN__REFERENCE_LOCALISA;

alter table ACSI_SAV_OPE.PRODUIT
   drop constraint FK_PRODUIT_REFERENCE_GARANTIE;

alter table ACSI_SAV_OPE.PRODUIT
   drop constraint FK_PRODUIT_REFERENCE_CLIENT;

alter table ACSI_SAV_OPE.PRODUIT
   drop constraint FK_PRODUIT_REFERENCE_FOURNISS;

alter table ACSI_SAV_OPE.PRODUIT
   drop constraint FK_PRODUIT_REFERENCE_MAGASIN_;

alter table ACSI_SAV_OPE.RECEPTION
   drop constraint FK_RECEPTIO_REFERENCE_RECEPTIO;

alter table ACSI_SAV_OPE.RECEPTION
   drop constraint FK_RECEPTIO_REFERENCE_CLIENT;

alter table ACSI_SAV_OPE.RECEPTIONNISTE
   drop constraint FK_RECEPTIO_REFERENCE_MAGASIN_;

alter table ACSI_SAV_OPE.REPARATEUR
   drop constraint FK_REPARATE_REFERENCE_MAGASIN_;

alter table ACSI_SAV_OPE.REPARATION
   drop constraint FK_REPARATI_REFERENCE_REPARATE;

alter table ACSI_SAV_OPE.REPARATION
   drop constraint FK_REPARATI_REFERENCE_ETAT;

alter table ACSI_SAV_OPE.REPARATION
   drop constraint FK_REPARATI_REFERENCE_PRODUIT;

drop view ACSI_SAV_OPE.VIEW_RECEPTION_FOR_DWH;

drop view ACSI_SAV_OPE.VIEW_REPARATION_FOR_DWH;

drop table ACSI_SAV_OPE.ADRESSE cascade constraints;

drop table ACSI_SAV_OPE.CLIENT cascade constraints;

drop table ACSI_SAV_OPE.ETAT cascade constraints;

drop table ACSI_SAV_OPE.FOURNISSEUR cascade constraints;

drop table ACSI_SAV_OPE.GARANTIE cascade constraints;

drop table ACSI_SAV_OPE.LOCALISATION cascade constraints;

drop table ACSI_SAV_OPE.MAGASIN_ACHAT cascade constraints;

drop table ACSI_SAV_OPE.MAGASIN_SAV cascade constraints;

drop table ACSI_SAV_OPE.PRODUIT cascade constraints;

drop table ACSI_SAV_OPE.RECEPTION cascade constraints;

drop table ACSI_SAV_OPE.RECEPTIONNISTE cascade constraints;

drop table ACSI_SAV_OPE.REPARATEUR cascade constraints;

drop table ACSI_SAV_OPE.REPARATION cascade constraints;

drop sequence ACSI_SAV_OPE.SEQ_AD;

drop sequence ACSI_SAV_OPE.SEQ_CL;

drop sequence ACSI_SAV_OPE.SEQ_ET;

drop sequence ACSI_SAV_OPE.SEQ_FO;

drop sequence ACSI_SAV_OPE.SEQ_GR;

drop sequence ACSI_SAV_OPE.SEQ_LO;

drop sequence ACSI_SAV_OPE.SEQ_MA;

drop sequence ACSI_SAV_OPE.SEQ_MS;

drop sequence ACSI_SAV_OPE.SEQ_PR;

drop sequence SEQ_RECEPTION;

drop sequence SEQ_RECEPTIONNISTE;

drop sequence SEQ_REPARATEUR;

drop sequence SEQ_REPARATION;

create sequence ACSI_SAV_OPE.SEQ_AD;

create sequence ACSI_SAV_OPE.SEQ_CL;

create sequence ACSI_SAV_OPE.SEQ_ET;

create sequence ACSI_SAV_OPE.SEQ_FO;

create sequence ACSI_SAV_OPE.SEQ_GR;

create sequence ACSI_SAV_OPE.SEQ_LO;

create sequence ACSI_SAV_OPE.SEQ_MA;

create sequence ACSI_SAV_OPE.SEQ_MS;

create sequence ACSI_SAV_OPE.SEQ_PR;

create sequence SEQ_RECEPTION;

create sequence SEQ_RECEPTIONNISTE;

create sequence SEQ_REPARATEUR;

create sequence SEQ_REPARATION;

/*==============================================================*/
/* Table : ADRESSE                                              */
/*==============================================================*/
create table ACSI_SAV_OPE.ADRESSE  (
   ID_ADRESSE           NUMBER                          not null,
   NUMERO               VARCHAR2(10 CHAR),
   RUE                  VARCHAR2(100 CHAR),
   CODE_POSTAL          NUMBER,
   VILLE                VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   constraint PK_ADRESSE primary key (ID_ADRESSE)
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table ACSI_SAV_OPE.CLIENT  (
   ID_CLIENT            NUMBER                          not null,
   ID_ADRESSE           NUMBER,
   NUMERO_CLIENT        NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_CLIENT primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table : ETAT                                                 */
/*==============================================================*/
create table ACSI_SAV_OPE.ETAT  (
   ID_ETAT              NUMBER                          not null,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(50 CHAR),
   constraint PK_ETAT primary key (ID_ETAT)
);

/*==============================================================*/
/* Table : FOURNISSEUR                                          */
/*==============================================================*/
create table ACSI_SAV_OPE.FOURNISSEUR  (
   ID_FOURNISSEUR       NUMBER                          not null,
   CODE                 VARCHAR2(5 CHAR),
   RAISON_SOCIALE       VARCHAR2(200 CHAR),
   constraint PK_FOURNISSEUR primary key (ID_FOURNISSEUR)
);

/*==============================================================*/
/* Table : GARANTIE                                             */
/*==============================================================*/
create table ACSI_SAV_OPE.GARANTIE  (
   ID_GARANTIE          NUMBER                          not null,
   CODE                 VARCHAR2(3 CHAR),
   DATE_DEBUT           DATE,
   DATE_FIN             DATE,
   constraint PK_GARANTIE primary key (ID_GARANTIE)
);

/*==============================================================*/
/* Table : LOCALISATION                                         */
/*==============================================================*/
create table ACSI_SAV_OPE.LOCALISATION  (
   ID_LOCALISATION      NUMBER                          not null,
   VILLE                VARCHAR2(100 CHAR),
   REGION               VARCHAR2(100 CHAR),
   PAYS                 VARCHAR2(100 CHAR),
   constraint PK_LOCALISATION primary key (ID_LOCALISATION)
);

/*==============================================================*/
/* Table : MAGASIN_ACHAT                                        */
/*==============================================================*/
create table ACSI_SAV_OPE.MAGASIN_ACHAT  (
   ID_MAGASIN           NUMBER                          not null,
   ID_LOCALISATION      NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(100 CHAR),
   constraint PK_MAGASIN_ACHAT primary key (ID_MAGASIN)
);

/*==============================================================*/
/* Table : MAGASIN_SAV                                          */
/*==============================================================*/
create table ACSI_SAV_OPE.MAGASIN_SAV  (
   ID_MAGASIN_SAV       NUMBER                          not null,
   ID_LOCALISATION      NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   LIBELLE              VARCHAR2(100 CHAR),
   constraint PK_MAGASIN_SAV primary key (ID_MAGASIN_SAV)
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table ACSI_SAV_OPE.PRODUIT  (
   ID_PRODUIT           NUMBER                          not null,
   ID_CLIENT            NUMBER,
   ID_GARANTIE          NUMBER,
   ID_MAGASIN           NUMBER,
   ID_FOURNISSEUR       NUMBER,
   CODE                 VARCHAR2(3 CHAR),
   NOM                  VARCHAR2(100 CHAR),
   TYPE                 VARCHAR2(100 CHAR),
   PRIX                 REAL,
   constraint PK_PRODUIT primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Table : RECEPTION                                            */
/*==============================================================*/
create table ACSI_SAV_OPE.RECEPTION  (
   ID_RECEPTION         NUMBER                          not null,
   ID_CLIENT            NUMBER,
   ID_RECEPTIONNISTE    NUMBER,
   DATE_RECEPTION       DATE,
   TEMPS                NUMBER,
   constraint PK_RECEPTION primary key (ID_RECEPTION)
);

/*==============================================================*/
/* Table : RECEPTIONNISTE                                       */
/*==============================================================*/
create table ACSI_SAV_OPE.RECEPTIONNISTE  (
   ID_RECEPTIONNISTE    NUMBER                          not null,
   ID_MAGASIN_SAV       NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_RECEPTIONNISTE primary key (ID_RECEPTIONNISTE)
);

/*==============================================================*/
/* Table : REPARATEUR                                           */
/*==============================================================*/
create table ACSI_SAV_OPE.REPARATEUR  (
   ID_REPARATEUR        NUMBER                          not null,
   ID_MAGASIN_SAV       NUMBER,
   NOM                  VARCHAR2(100 CHAR),
   PRENOM               VARCHAR2(100 CHAR),
   constraint PK_REPARATEUR primary key (ID_REPARATEUR)
);

/*==============================================================*/
/* Table : REPARATION                                           */
/*==============================================================*/
create table ACSI_SAV_OPE.REPARATION  (
   ID_REPARATION        NUMBER                          not null,
   ID_PRODUIT           NUMBER,
   ID_REPARATEUR        NUMBER,
   ID_ETAT              NUMBER,
   DATE_DEBUT           DATE,
   DATE_FIN             DATE,
   TEMPS                NUMBER,
   PRIX                 FLOAT,
   constraint PK_REPARATION primary key (ID_REPARATION)
);

/*==============================================================*/
/* Vue : VIEW_RECEPTION_FOR_DWH                                 */
/*==============================================================*/
create or replace view ACSI_SAV_OPE.VIEW_RECEPTION_FOR_DWH as
select
   RECEPTIONNISTE.ID_RECEPTIONNISTE RECEPTIONNISTE_ID_RECEPTIONNISTE,
   RECEPTIONNISTE.ID_MAGASIN_SAV RECEPTIONNISTE_ID_MAGASIN_SAV,
   RECEPTIONNISTE.NOM RECEPTIONNISTE_NOM,
   RECEPTIONNISTE.PRENOM RECEPTIONNISTE_PRENOM,
   MAGASIN_SAV.ID_MAGASIN_SAV MAGASIN_SAV_ID_MAGASIN_SAV,
   MAGASIN_SAV.ID_LOCALISATION MAGASIN_SAV_ID_LOCALISATION,
   MAGASIN_SAV.CODE MAGASIN_SAV_CODE,
   MAGASIN_SAV.LIBELLE MAGASIN_SAV_LIBELLE,
   LOCALISATION.ID_LOCALISATION LOCALISATION_ID_LOCALISATION,
   LOCALISATION.VILLE LOCALISATION_VILLE,
   LOCALISATION.REGION,
   LOCALISATION.PAYS LOCALISATION_PAYS,
   RECEPTION.ID_RECEPTION,
   RECEPTION.ID_CLIENT RECEPTION_ID_CLIENT,
   RECEPTION.ID_RECEPTIONNISTE RECEPTION_ID_RECEPTIONNISTE,
   RECEPTION.DATE_RECEPTION,
   RECEPTION.TEMPS,
   MAGASIN_ACHAT.ID_MAGASIN,
   MAGASIN_ACHAT.ID_LOCALISATION MAGASIN_ACHAT_ID_LOCALISATION,
   MAGASIN_ACHAT.CODE MAGASIN_ACHAT_CODE,
   MAGASIN_ACHAT.LIBELLE MAGASIN_ACHAT_LIBELLE,
   CLIENT.ID_CLIENT CLIENT_ID_CLIENT,
   CLIENT.ID_ADRESSE CLIENT_ID_ADRESSE,
   CLIENT.NUMERO_CLIENT,
   CLIENT.NOM CLIENT_NOM,
   CLIENT.PRENOM CLIENT_PRENOM,
   ADRESSE.ID_ADRESSE ADRESSE_ID_ADRESSE,
   ADRESSE.NUMERO,
   ADRESSE.RUE,
   ADRESSE.CODE_POSTAL,
   ADRESSE.VILLE ADRESSE_VILLE,
   ADRESSE.PAYS ADRESSE_PAYS
from
   RECEPTIONNISTE,
   MAGASIN_SAV,
   LOCALISATION,
   RECEPTION,
   MAGASIN_ACHAT,
   CLIENT,
   ADRESSE
Where
    MAGASIN_ACHAT.ID_LOCALISATION = LOCALISATION.ID_LOCALISATION AND
    MAGASIN_SAV.ID_LOCALISATION = LOCALISATION.ID_LOCALISATION AND
    RECEPTIONNISTE.ID_MAGASIN_SAV = MAGASIN_SAV.ID_MAGASIN_SAV AND
    CLIENT.ID_ADRESSE = ADRESSE.ID_ADRESSE AND
    RECEPTION.ID_CLIENT = CLIENT.ID_CLIENT AND
    RECEPTION.ID_RECEPTIONNISTE = RECEPTIONNISTE.ID_RECEPTIONNISTE

with read only;

/*==============================================================*/
/* Vue : VIEW_REPARATION_FOR_DWH                                */
/*==============================================================*/
create or replace view ACSI_SAV_OPE.VIEW_REPARATION_FOR_DWH as
select
   ACSI_SAV_OPE.MAGASIN_SAV.ID_MAGASIN_SAV ACSI_SAV_OPE_MAGASIN_SAV_ID_MAGASIN_SAV,
   ACSI_SAV_OPE.MAGASIN_SAV.ID_LOCALISATION ACSI_SAV_OPE_MAGASIN_SAV_ID_LOCALISATION,
   ACSI_SAV_OPE.MAGASIN_SAV.CODE ACSI_SAV_OPE_MAGASIN_SAV_CODE,
   ACSI_SAV_OPE.MAGASIN_SAV.LIBELLE ACSI_SAV_OPE_MAGASIN_SAV_LIBELLE,
   ACSI_SAV_OPE.LOCALISATION.ID_LOCALISATION ACSI_SAV_OPE_LOCALISATION_ID_LOCALISATION,
   ACSI_SAV_OPE.LOCALISATION.VILLE,
   ACSI_SAV_OPE.LOCALISATION.REGION,
   ACSI_SAV_OPE.LOCALISATION.PAYS,
   ACSI_SAV_OPE.REPARATEUR.ID_REPARATEUR ACSI_SAV_OPE_REPARATEUR_ID_REPARATEUR,
   ACSI_SAV_OPE.REPARATEUR.ID_MAGASIN_SAV ACSI_SAV_OPE_REPARATEUR_ID_MAGASIN_SAV,
   ACSI_SAV_OPE.REPARATEUR.NOM ACSI_SAV_OPE_REPARATEUR_NOM,
   ACSI_SAV_OPE.REPARATEUR.PRENOM,
   ACSI_SAV_OPE.REPARATION.ID_REPARATION,
   ACSI_SAV_OPE.REPARATION.ID_PRODUIT ACSI_SAV_OPE_REPARATION_ID_PRODUIT,
   ACSI_SAV_OPE.REPARATION.ID_REPARATEUR ACSI_SAV_OPE_REPARATION_ID_REPARATEUR,
   ACSI_SAV_OPE.REPARATION.ID_ETAT ACSI_SAV_OPE_REPARATION_ID_ETAT,
   ACSI_SAV_OPE.REPARATION.DATE_DEBUT ACSI_SAV_OPE_REPARATION_DATE_DEBUT,
   ACSI_SAV_OPE.REPARATION.DATE_FIN ACSI_SAV_OPE_REPARATION_DATE_FIN,
   ACSI_SAV_OPE.REPARATION.TEMPS,
   ACSI_SAV_OPE.REPARATION.PRIX ACSI_SAV_OPE_REPARATION_PRIX,
   ACSI_SAV_OPE.ETAT.ID_ETAT ACSI_SAV_OPE_ETAT_ID_ETAT,
   ACSI_SAV_OPE.ETAT.CODE ACSI_SAV_OPE_ETAT_CODE,
   ACSI_SAV_OPE.ETAT.LIBELLE ACSI_SAV_OPE_ETAT_LIBELLE,
   ACSI_SAV_OPE.GARANTIE.ID_GARANTIE ACSI_SAV_OPE_GARANTIE_ID_GARANTIE,
   ACSI_SAV_OPE.GARANTIE.CODE ACSI_SAV_OPE_GARANTIE_CODE,
   ACSI_SAV_OPE.GARANTIE.DATE_DEBUT ACSI_SAV_OPE_GARANTIE_DATE_DEBUT,
   ACSI_SAV_OPE.GARANTIE.DATE_FIN ACSI_SAV_OPE_GARANTIE_DATE_FIN,
   ACSI_SAV_OPE.PRODUIT.ID_PRODUIT ACSI_SAV_OPE_PRODUIT_ID_PRODUIT,
   ACSI_SAV_OPE.PRODUIT.ID_CLIENT,
   ACSI_SAV_OPE.PRODUIT.ID_GARANTIE ACSI_SAV_OPE_PRODUIT_ID_GARANTIE,
   ACSI_SAV_OPE.PRODUIT.ID_MAGASIN,
   ACSI_SAV_OPE.PRODUIT.ID_FOURNISSEUR ACSI_SAV_OPE_PRODUIT_ID_FOURNISSEUR,
   ACSI_SAV_OPE.PRODUIT.CODE ACSI_SAV_OPE_PRODUIT_CODE,
   ACSI_SAV_OPE.PRODUIT.NOM ACSI_SAV_OPE_PRODUIT_NOM,
   ACSI_SAV_OPE.PRODUIT.TYPE,
   ACSI_SAV_OPE.PRODUIT.PRIX ACSI_SAV_OPE_PRODUIT_PRIX,
   ACSI_SAV_OPE.FOURNISSEUR.ID_FOURNISSEUR ACSI_SAV_OPE_FOURNISSEUR_ID_FOURNISSEUR,
   ACSI_SAV_OPE.FOURNISSEUR.CODE ACSI_SAV_OPE_FOURNISSEUR_CODE,
   ACSI_SAV_OPE.FOURNISSEUR.RAISON_SOCIALE
from
   ACSI_SAV_OPE.MAGASIN_SAV,
   ACSI_SAV_OPE.LOCALISATION,
   ACSI_SAV_OPE.REPARATEUR,
   ACSI_SAV_OPE.REPARATION,
   ACSI_SAV_OPE.ETAT,
   ACSI_SAV_OPE.GARANTIE,
   ACSI_SAV_OPE.PRODUIT,
   ACSI_SAV_OPE.FOURNISSEUR
 where
    MAGASIN_SAV.ID_LOCALISATION = LOCALISATION.ID_LOCALISATION AND
    PRODUIT.ID_GARANTIE = GARANTIE.ID_GARANTIE AND
    PRODUIT.ID_FOURNISSEUR = FOURNISSEUR.ID_FOURNISSEUR AND 
    REPARATION.ID_PRODUIT = PRODUIT.ID_PRODUIT AND
    REPARATION.ID_ETAT = ETAT.ID_ETAT AND
    REPARATEUR.ID_MAGASIN_SAV = MAGASIN_SAV.ID_MAGASIN_SAV AND
    REPARATION.ID_REPARATEUR = REPARATEUR.ID_REPARATEUR
with read only;

alter table ACSI_SAV_OPE.CLIENT
   add constraint FK_CLIENT_REFERENCE_ADRESSE foreign key (ID_ADRESSE)
      references ACSI_SAV_OPE.ADRESSE (ID_ADRESSE);

alter table ACSI_SAV_OPE.MAGASIN_ACHAT
   add constraint FK_MAGASIN__REFERENCE_LOCALIS2 foreign key (ID_LOCALISATION)
      references ACSI_SAV_OPE.LOCALISATION (ID_LOCALISATION);

alter table ACSI_SAV_OPE.MAGASIN_SAV
   add constraint FK_MAGASIN__REFERENCE_LOCALISA foreign key (ID_LOCALISATION)
      references ACSI_SAV_OPE.LOCALISATION (ID_LOCALISATION);

alter table ACSI_SAV_OPE.PRODUIT
   add constraint FK_PRODUIT_REFERENCE_GARANTIE foreign key (ID_GARANTIE)
      references ACSI_SAV_OPE.GARANTIE (ID_GARANTIE);

alter table ACSI_SAV_OPE.PRODUIT
   add constraint FK_PRODUIT_REFERENCE_CLIENT foreign key (ID_CLIENT)
      references ACSI_SAV_OPE.CLIENT (ID_CLIENT);

alter table ACSI_SAV_OPE.PRODUIT
   add constraint FK_PRODUIT_REFERENCE_FOURNISS foreign key (ID_FOURNISSEUR)
      references ACSI_SAV_OPE.FOURNISSEUR (ID_FOURNISSEUR);

alter table ACSI_SAV_OPE.PRODUIT
   add constraint FK_PRODUIT_REFERENCE_MAGASIN_ foreign key (ID_MAGASIN)
      references ACSI_SAV_OPE.MAGASIN_ACHAT (ID_MAGASIN);

alter table ACSI_SAV_OPE.RECEPTION
   add constraint FK_RECEPTIO_REFERENCE_RECEPTIO foreign key (ID_RECEPTIONNISTE)
      references ACSI_SAV_OPE.RECEPTIONNISTE (ID_RECEPTIONNISTE);

alter table ACSI_SAV_OPE.RECEPTION
   add constraint FK_RECEPTIO_REFERENCE_CLIENT foreign key (ID_CLIENT)
      references ACSI_SAV_OPE.CLIENT (ID_CLIENT);

alter table ACSI_SAV_OPE.RECEPTIONNISTE
   add constraint FK_RECEPTIO_REFERENCE_MAGASIN_ foreign key (ID_MAGASIN_SAV)
      references ACSI_SAV_OPE.MAGASIN_SAV (ID_MAGASIN_SAV);

alter table ACSI_SAV_OPE.REPARATEUR
   add constraint FK_REPARATE_REFERENCE_MAGASIN_ foreign key (ID_MAGASIN_SAV)
      references ACSI_SAV_OPE.MAGASIN_SAV (ID_MAGASIN_SAV);

alter table ACSI_SAV_OPE.REPARATION
   add constraint FK_REPARATI_REFERENCE_REPARATE foreign key (ID_REPARATEUR)
      references ACSI_SAV_OPE.REPARATEUR (ID_REPARATEUR);

alter table ACSI_SAV_OPE.REPARATION
   add constraint FK_REPARATI_REFERENCE_ETAT foreign key (ID_ETAT)
      references ACSI_SAV_OPE.ETAT (ID_ETAT);

alter table ACSI_SAV_OPE.REPARATION
   add constraint FK_REPARATI_REFERENCE_PRODUIT foreign key (ID_PRODUIT)
      references ACSI_SAV_OPE.PRODUIT (ID_PRODUIT);

