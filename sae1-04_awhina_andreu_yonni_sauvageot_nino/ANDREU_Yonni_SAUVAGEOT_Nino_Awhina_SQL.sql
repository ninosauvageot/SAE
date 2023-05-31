/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de création :  18/11/2022 18:59:54                      */
/*==============================================================*/


alter table _CODE_AGENCE
   drop constraint FK__CODE_AG_ASSOCIATI__CODE_EM;

alter table _CODE_ASSOCIATION_12
   drop constraint FK__CODE_AS_ASSOCIATI__CODE_VE;

alter table _CODE_ASSOCIATION_12
   drop constraint FK__CODE_AS_ASSOCIATI__CODE_DE;

alter table _CODE_ASSOCIATION_19
   drop constraint FK__CODE_AS_ASSOCIATI__CODE_AG;

alter table _CODE_ASSOCIATION_19
   drop constraint FK__CODE_AS_ASSOCIATI__CODE_EM;

alter table _CODE_CLIENT
   drop constraint FK__CODE_CL_PERSONNE2__CODE_PE;

alter table _CODE_CONDUIRE
   drop constraint FK__CODE_CO_CONDUIRE__CODE_EM;

alter table _CODE_CONDUIRE
   drop constraint FK__CODE_CO_CONDUIRE2__CODE_VE;

alter table _CODE_DECLARER
   drop constraint FK__CODE_DE_DECLARER__CODE_EM;

alter table _CODE_DECLARER
   drop constraint FK__CODE_DE_DECLARER2__CODE_AB;

alter table _CODE_DEMENAGEMENT
   drop constraint FK__CODE_DE_ASSOCIATI__CODE_FO;

alter table _CODE_DEMENAGEMENT
   drop constraint FK__CODE_DE_ASSOCIATI__CODE_CL;

alter table _CODE_DEMENAGEMENT
   drop constraint FK1__Demenagement_Logement;

alter table _CODE_DEMENAGEMENT
   drop constraint FK2__Demenagement_Logement;

alter table _CODE_DEMENAGER
   drop constraint FK__CODE_DE_DEMENAGER__CODE_EM;

alter table _CODE_DEMENAGER
   drop constraint FK__CODE_DE_DEMENAGER__CODE_DE;

alter table _CODE_ELEVER
   drop constraint FK__CODE_EL_ELEVER__CODE_EM;

alter table _CODE_ELEVER
   drop constraint FK__CODE_EL_ELEVER2__CODE_EN;

alter table _CODE_EMPLOYE
   drop constraint FK__CODE_EM_COUPLE__CODE_EM;

alter table _CODE_EMPLOYE
   drop constraint FK__CODE_EM_COUPLE2__CODE_EM;

alter table _CODE_EMPLOYE
   drop constraint FK__CODE_EM_DIRIGER__CODE_EM;

alter table _CODE_EMPLOYE
   drop constraint FK__CODE_EM_PERSONNE3__CODE_PE;

alter table _CODE_ENFANT
   drop constraint FK__CODE_EN_PERSONNE__CODE_PE;

alter table _CODE_IMMOBILISATION
   drop constraint FK__CODE_IM_ASSOCIATI__CODE_VE;

alter table _CODE_IMMOBILISATION
   drop constraint FK__CODE_IM_ASSOCIATI__CODE_GA;

alter table _CODE_TOUCHER
   drop constraint FK__CODE_TO_TOUCHER__CODE_AB;

alter table _CODE_TOUCHER
   drop constraint FK__CODE_TO_TOUCHER2__CODE_DE;

drop table _CODE_ABSENCE cascade constraints;

drop index ASSOCIATION_18_FK;

drop table _CODE_AGENCE cascade constraints;

drop index ASSOCIATION_19_FK;

drop index ASSOCIATION_12_FK;

drop table _CODE_ASSOCIATION_12 cascade constraints;

drop index ASSOCIATION_21_FK;

drop index ASSOCIATION_20_FK;

drop table _CODE_ASSOCIATION_19 cascade constraints;

drop table _CODE_CLIENT cascade constraints;

drop index CONDUIRE2_FK;

drop index CONDUIRE_FK;

drop table _CODE_CONDUIRE cascade constraints;

drop index DECLARER2_FK;

drop index DECLARER_FK;

drop table _CODE_DECLARER cascade constraints;

drop index ASSOCIATION_17_FK;

drop index ASSOCIATION_16_FK;

drop index ASSOCIATION_13_FK;

drop index ASSOCIATION_11_FK;

drop table _CODE_DEMENAGEMENT cascade constraints;

drop index DEMENAGER2_FK;

drop index DEMENAGER_FK;

drop table _CODE_DEMENAGER cascade constraints;

drop index ELEVER2_FK;

drop index ELEVER_FK;

drop table _CODE_ELEVER cascade constraints;

drop index DIRIGER_FK;

drop index COUPLE2_FK;

drop index COUPLE_FK;

drop table _CODE_EMPLOYE cascade constraints;

drop table _CODE_ENFANT cascade constraints;

drop table _CODE_FORMULE cascade constraints;

drop table _CODE_GARAGE cascade constraints;

drop index ASSOCIATION_15_FK;

drop index ASSOCIATION_14_FK;

drop table _CODE_IMMOBILISATION cascade constraints;

drop table _CODE_LOGEMENT cascade constraints;

drop table _CODE_PERSONNE cascade constraints;

drop index TOUCHER2_FK;

drop index TOUCHER_FK;

drop table _CODE_TOUCHER cascade constraints;

drop table _CODE_VEHICULE cascade constraints;

/*==============================================================*/
/* Table : _CODE_ABSENCE                                        */
/*==============================================================*/
create table _CODE_ABSENCE 
(
   IDABS                INTEGER              not null,
   DATEDEBABS           DATE                 not null,
   DATEFINABS           DATE                 not null,
   DATEDEMANDEABS       DATE                 not null,
   DATEREPABS           DATE,
   MOTIFABS             VARCHAR2(100)        not null,
   ETATABS              VARCHAR2(100),
   constraint PK__CODE_ABSENCE primary key (IDABS)
);

/*==============================================================*/
/* Table : _CODE_AGENCE                                         */
/*==============================================================*/
create table _CODE_AGENCE 
(
   IDAG                 INTEGER              not null,
   IDPERSO              INTEGER              not null,
   NOMAG                VARCHAR2(100)        not null,
   TELAG                CHAR(10),
   EMAILAG              VARCHAR2(100),
   constraint PK__CODE_AGENCE primary key (IDAG)
);

/*==============================================================*/
/* Index : ASSOCIATION_18_FK                                    */
/*==============================================================*/
create index ASSOCIATION_18_FK on _CODE_AGENCE (
   IDPERSO ASC
);

/*==============================================================*/
/* Table : _CODE_ASSOCIATION_12                                 */
/*==============================================================*/
create table _CODE_ASSOCIATION_12 
(
   IDVHC                INTEGER              not null,
   IDDEM                INTEGER              not null,
   TEMPSTRAJET          DATE,
   NBKM                 FLOAT,
   constraint PK__CODE_ASSOCIATION_12 primary key (IDVHC, IDDEM)
);

/*==============================================================*/
/* Index : ASSOCIATION_12_FK                                    */
/*==============================================================*/
create index ASSOCIATION_12_FK on _CODE_ASSOCIATION_12 (
   IDVHC ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_19_FK                                    */
/*==============================================================*/
create index ASSOCIATION_19_FK on _CODE_ASSOCIATION_12 (
   IDDEM ASC
);

/*==============================================================*/
/* Table : _CODE_ASSOCIATION_19                                 */
/*==============================================================*/
create table _CODE_ASSOCIATION_19 
(
   IDAG                 INTEGER              not null,
   IDPERSO              INTEGER              not null,
   constraint PK__CODE_ASSOCIATION_19 primary key (IDAG, IDPERSO)
);

/*==============================================================*/
/* Index : ASSOCIATION_20_FK                                    */
/*==============================================================*/
create index ASSOCIATION_20_FK on _CODE_ASSOCIATION_19 (
   IDAG ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_21_FK                                    */
/*==============================================================*/
create index ASSOCIATION_21_FK on _CODE_ASSOCIATION_19 (
   IDPERSO ASC
);

/*==============================================================*/
/* Table : _CODE_CLIENT                                         */
/*==============================================================*/
create table _CODE_CLIENT 
(
   IDPERSO              INTEGER              not null,
   NOMPERSO             VARCHAR2(100)        not null,
   PNOMPERSO            VARCHAR2(100)        not null,
   ADPERSO              VARCHAR2(100),
   VILLEPERSO           VARCHAR2(100),
   CPPERSO              CHAR(5),
   TELCLT               CHAR(10),
   EMAILCLT             VARCHAR2(100),
   constraint PK__CODE_CLIENT primary key (IDPERSO)
);

/*==============================================================*/
/* Table : _CODE_CONDUIRE                                       */
/*==============================================================*/
create table _CODE_CONDUIRE 
(
   IDPERSO              INTEGER              not null,
   IDVHC                INTEGER              not null,
   constraint PK__CODE_CONDUIRE primary key (IDPERSO, IDVHC)
);

/*==============================================================*/
/* Index : CONDUIRE_FK                                          */
/*==============================================================*/
create index CONDUIRE_FK on _CODE_CONDUIRE (
   IDPERSO ASC
);

/*==============================================================*/
/* Index : CONDUIRE2_FK                                         */
/*==============================================================*/
create index CONDUIRE2_FK on _CODE_CONDUIRE (
   IDVHC ASC
);

/*==============================================================*/
/* Table : _CODE_DECLARER                                       */
/*==============================================================*/
create table _CODE_DECLARER 
(
   IDPERSO              INTEGER              not null,
   IDABS                INTEGER              not null,
   constraint PK__CODE_DECLARER primary key (IDPERSO, IDABS)
);

/*==============================================================*/
/* Index : DECLARER_FK                                          */
/*==============================================================*/
create index DECLARER_FK on _CODE_DECLARER (
   IDPERSO ASC
);

/*==============================================================*/
/* Index : DECLARER2_FK                                         */
/*==============================================================*/
create index DECLARER2_FK on _CODE_DECLARER (
   IDABS ASC
);

/*==============================================================*/
/* Table : _CODE_DEMENAGEMENT                                   */
/*==============================================================*/
create table _CODE_DEMENAGEMENT 
(
   IDDEM                INTEGER              not null,
   IDLOG                INTEGER              not null,
   _CO_IDLOG            INTEGER              not null,
   IDFORM               INTEGER              not null,
   IDPERSO              INTEGER              not null,
   DATEDEM              DATE,
   DATEDEMANDEDEM       DATE,
   DATEVISITEDEM        DATE,
   DATEFINDEM           DATE,
   DATEPAIEMENTDEM      DATE,
   ETATDEM              VARCHAR2(100),
   constraint PK__CODE_DEMENAGEMENT primary key (IDDEM)
);

/*==============================================================*/
/* Index : ASSOCIATION_11_FK                                    */
/*==============================================================*/
create index ASSOCIATION_11_FK on _CODE_DEMENAGEMENT (
   IDFORM ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_13_FK                                    */
/*==============================================================*/
create index ASSOCIATION_13_FK on _CODE_DEMENAGEMENT (
   IDPERSO ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_16_FK                                    */
/*==============================================================*/
create index ASSOCIATION_16_FK on _CODE_DEMENAGEMENT (
   _CO_IDLOG ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_17_FK                                    */
/*==============================================================*/
create index ASSOCIATION_17_FK on _CODE_DEMENAGEMENT (
   IDLOG ASC
);

/*==============================================================*/
/* Table : _CODE_DEMENAGER                                      */
/*==============================================================*/
create table _CODE_DEMENAGER 
(
   IDPERSO              INTEGER              not null,
   IDDEM                INTEGER              not null,
   constraint PK__CODE_DEMENAGER primary key (IDPERSO, IDDEM)
);

/*==============================================================*/
/* Index : DEMENAGER_FK                                         */
/*==============================================================*/
create index DEMENAGER_FK on _CODE_DEMENAGER (
   IDPERSO ASC
);

/*==============================================================*/
/* Index : DEMENAGER2_FK                                        */
/*==============================================================*/
create index DEMENAGER2_FK on _CODE_DEMENAGER (
   IDDEM ASC
);

/*==============================================================*/
/* Table : _CODE_ELEVER                                         */
/*==============================================================*/
create table _CODE_ELEVER 
(
   IDPERSO              INTEGER              not null,
   _CO_IDPERSO          INTEGER              not null,
   ROLE                 VARCHAR2(2)          not null,
   constraint PK__CODE_ELEVER primary key (IDPERSO, _CO_IDPERSO)
);

/*==============================================================*/
/* Index : ELEVER_FK                                            */
/*==============================================================*/
create index ELEVER_FK on _CODE_ELEVER (
   IDPERSO ASC
);

/*==============================================================*/
/* Index : ELEVER2_FK                                           */
/*==============================================================*/
create index ELEVER2_FK on _CODE_ELEVER (
   _CO_IDPERSO ASC
);

/*==============================================================*/
/* Table : _CODE_EMPLOYE                                        */
/*==============================================================*/
create table _CODE_EMPLOYE 
(
   IDPERSO              INTEGER              not null,
   _CO_IDPERSO          INTEGER,
   _CO_IDPERSO2         INTEGER,
   _CO_IDPERSO3         INTEGER,
   NOMPERSO             VARCHAR2(100)        not null,
   PNOMPERSO            VARCHAR2(100)        not null,
   ADPERSO              VARCHAR2(100),
   VILLEPERSO           VARCHAR2(100),
   CPPERSO              CHAR(5),
   POSTEEMPL            VARCHAR2(100)        not null,
   DATEEMBEMPL          DATE                 not null,
   NUMPERMISEMPL        CHAR(12),
   DATENAISEMPL         DATE                 not null,
   SEXEEMPL             CHAR(5)              not null,
   constraint PK__CODE_EMPLOYE primary key (IDPERSO)
);

/*==============================================================*/
/* Index : COUPLE_FK                                            */
/*==============================================================*/
create index COUPLE_FK on _CODE_EMPLOYE (
   _CO_IDPERSO ASC
);

/*==============================================================*/
/* Index : COUPLE2_FK                                           */
/*==============================================================*/
create index COUPLE2_FK on _CODE_EMPLOYE (
   _CO_IDPERSO2 ASC
);

/*==============================================================*/
/* Index : DIRIGER_FK                                           */
/*==============================================================*/
create index DIRIGER_FK on _CODE_EMPLOYE (
   _CO_IDPERSO3 ASC
);

/*==============================================================*/
/* Table : _CODE_ENFANT                                         */
/*==============================================================*/
create table _CODE_ENFANT 
(
   IDPERSO              INTEGER              not null,
   NOMPERSO             VARCHAR2(100)        not null,
   PNOMPERSO            VARCHAR2(100)        not null,
   ADPERSO              VARCHAR2(100),
   VILLEPERSO           VARCHAR2(100),
   CPPERSO              CHAR(5),
   DATENAISENF          DATE                 not null,
   constraint PK__CODE_ENFANT primary key (IDPERSO)
);

/*==============================================================*/
/* Table : _CODE_FORMULE                                        */
/*==============================================================*/
create table _CODE_FORMULE 
(
   IDFORM               INTEGER              not null,
   LIBFORM              VARCHAR2(100)        not null,
   PRIXHTFORM           NUMBER(8,2)          not null,
   constraint PK__CODE_FORMULE primary key (IDFORM)
);

/*==============================================================*/
/* Table : _CODE_GARAGE                                         */
/*==============================================================*/
create table _CODE_GARAGE 
(
   IDGAR                INTEGER              not null,
   ADGAR                VARCHAR2(100)        not null,
   VILLEGAR             VARCHAR2(100)        not null,
   CPGAR                CHAR(5)              not null,
   TELGAR               CHAR(10)             not null,
   NOMGAR               VARCHAR2(100)        not null,
   constraint PK__CODE_GARAGE primary key (IDGAR)
);

/*==============================================================*/
/* Table : _CODE_IMMOBILISATION                                 */
/*==============================================================*/
create table _CODE_IMMOBILISATION 
(
   IDIMMO               INTEGER              not null,
   IDGAR                INTEGER,
   IDVHC                INTEGER              not null,
   TPIMMO               VARCHAR2(100)        not null,
   DATEDEBIMMO          DATE                 not null,
   DATEFINIMMO          DATE,
   INFOIMMO             VARCHAR2(100),
   constraint PK__CODE_IMMOBILISATION primary key (IDIMMO)
);

/*==============================================================*/
/* Index : ASSOCIATION_14_FK                                    */
/*==============================================================*/
create index ASSOCIATION_14_FK on _CODE_IMMOBILISATION (
   IDVHC ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_15_FK                                    */
/*==============================================================*/
create index ASSOCIATION_15_FK on _CODE_IMMOBILISATION (
   IDGAR ASC
);

/*==============================================================*/
/* Table : _CODE_LOGEMENT                                       */
/*==============================================================*/
create table _CODE_LOGEMENT 
(
   IDLOG                INTEGER              not null,
   ADLOG                VARCHAR2(100)        not null,
   VILLELOG             VARCHAR2(100)        not null,
   CPLOG                CHAR(5)              not null,
   LATLOG               FLOAT,
   LONGLOG              FLOAT,
   RMQLOG               VARCHAR2(100),
   constraint PK__CODE_LOGEMENT primary key (IDLOG)
);

/*==============================================================*/
/* Table : _CODE_PERSONNE                                       */
/*==============================================================*/
create table _CODE_PERSONNE 
(
   IDPERSO              INTEGER              not null,
   NOMPERSO             VARCHAR2(100)        not null,
   PNOMPERSO            VARCHAR2(100)        not null,
   ADPERSO              VARCHAR2(100),
   VILLEPERSO           VARCHAR2(100),
   CPPERSO              CHAR(5),
   constraint PK__CODE_PERSONNE primary key (IDPERSO)
);

/*==============================================================*/
/* Table : _CODE_TOUCHER                                        */
/*==============================================================*/
create table _CODE_TOUCHER 
(
   IDABS                INTEGER              not null,
   IDDEM                INTEGER              not null,
   constraint PK__CODE_TOUCHER primary key (IDABS, IDDEM)
);

/*==============================================================*/
/* Index : TOUCHER_FK                                           */
/*==============================================================*/
create index TOUCHER_FK on _CODE_TOUCHER (
   IDABS ASC
);

/*==============================================================*/
/* Index : TOUCHER2_FK                                          */
/*==============================================================*/
create index TOUCHER2_FK on _CODE_TOUCHER (
   IDDEM ASC
);

/*==============================================================*/
/* Table : _CODE_VEHICULE                                       */
/*==============================================================*/
create table _CODE_VEHICULE 
(
   IDVHC                INTEGER              not null,
   IMMATVHC             CHAR(9)              not null,
   PRIXKMVHC            NUMBER(8,2)          not null,
   VOLUTILVHC           FLOAT,
   NBPLCVHC             INTEGER,
   HAYONVHC             INTEGER,
   COUCHETTEVHC         INTEGER,
   CONSOVHC             FLOAT,
   constraint PK__CODE_VEHICULE primary key (IDVHC)
);

alter table _CODE_AGENCE
   add constraint FK__CODE_AG_ASSOCIATI__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_ASSOCIATION_12
   add constraint FK__CODE_AS_ASSOCIATI__CODE_VE foreign key (IDVHC)
      references _CODE_VEHICULE (IDVHC);

alter table _CODE_ASSOCIATION_12
   add constraint FK__CODE_AS_ASSOCIATI__CODE_DE foreign key (IDDEM)
      references _CODE_DEMENAGEMENT (IDDEM);

alter table _CODE_ASSOCIATION_19
   add constraint FK__CODE_AS_ASSOCIATI__CODE_AG foreign key (IDAG)
      references _CODE_AGENCE (IDAG);

alter table _CODE_ASSOCIATION_19
   add constraint FK__CODE_AS_ASSOCIATI__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_CLIENT
   add constraint FK__CODE_CL_PERSONNE2__CODE_PE foreign key (IDPERSO)
      references _CODE_PERSONNE (IDPERSO);

alter table _CODE_CONDUIRE
   add constraint FK__CODE_CO_CONDUIRE__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_CONDUIRE
   add constraint FK__CODE_CO_CONDUIRE2__CODE_VE foreign key (IDVHC)
      references _CODE_VEHICULE (IDVHC);

alter table _CODE_DECLARER
   add constraint FK__CODE_DE_DECLARER__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_DECLARER
   add constraint FK__CODE_DE_DECLARER2__CODE_AB foreign key (IDABS)
      references _CODE_ABSENCE (IDABS);

alter table _CODE_DEMENAGEMENT
   add constraint FK__CODE_DE_ASSOCIATI__CODE_FO foreign key (IDFORM)
      references _CODE_FORMULE (IDFORM);

alter table _CODE_DEMENAGEMENT
   add constraint FK__CODE_DE_ASSOCIATI__CODE_CL foreign key (IDPERSO)
      references _CODE_CLIENT (IDPERSO);

alter table _CODE_DEMENAGEMENT
   add constraint FK1__Demenagement_Logement foreign key (_CO_IDLOG)
      references _CODE_LOGEMENT (IDLOG);

alter table _CODE_DEMENAGEMENT
   add constraint FK2__Demenagement_Logement foreign key (IDLOG)
      references _CODE_LOGEMENT (IDLOG);

alter table _CODE_DEMENAGER
   add constraint FK__CODE_DE_DEMENAGER__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_DEMENAGER
   add constraint FK__CODE_DE_DEMENAGER__CODE_DE foreign key (IDDEM)
      references _CODE_DEMENAGEMENT (IDDEM);

alter table _CODE_ELEVER
   add constraint FK__CODE_EL_ELEVER__CODE_EM foreign key (IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_ELEVER
   add constraint FK__CODE_EL_ELEVER2__CODE_EN foreign key (_CO_IDPERSO)
      references _CODE_ENFANT (IDPERSO);

alter table _CODE_EMPLOYE
   add constraint FK__CODE_EM_COUPLE__CODE_EM foreign key (_CO_IDPERSO)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_EMPLOYE
   add constraint FK__CODE_EM_COUPLE2__CODE_EM foreign key (_CO_IDPERSO2)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_EMPLOYE
   add constraint FK__CODE_EM_DIRIGER__CODE_EM foreign key (_CO_IDPERSO3)
      references _CODE_EMPLOYE (IDPERSO);

alter table _CODE_EMPLOYE
   add constraint FK__CODE_EM_PERSONNE3__CODE_PE foreign key (IDPERSO)
      references _CODE_PERSONNE (IDPERSO);

alter table _CODE_ENFANT
   add constraint FK__CODE_EN_PERSONNE__CODE_PE foreign key (IDPERSO)
      references _CODE_PERSONNE (IDPERSO);

alter table _CODE_IMMOBILISATION
   add constraint FK__CODE_IM_ASSOCIATI__CODE_VE foreign key (IDVHC)
      references _CODE_VEHICULE (IDVHC);

alter table _CODE_IMMOBILISATION
   add constraint FK__CODE_IM_ASSOCIATI__CODE_GA foreign key (IDGAR)
      references _CODE_GARAGE (IDGAR);

alter table _CODE_TOUCHER
   add constraint FK__CODE_TO_TOUCHER__CODE_AB foreign key (IDABS)
      references _CODE_ABSENCE (IDABS);

alter table _CODE_TOUCHER
   add constraint FK__CODE_TO_TOUCHER2__CODE_DE foreign key (IDDEM)
      references _CODE_DEMENAGEMENT (IDDEM);

