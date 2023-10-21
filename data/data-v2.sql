CREATE SCHEMA IF NOT EXISTS "public";

CREATE  TABLE "public".avantage ( 
	id                   integer DEFAULT nextval('avantage_id_avantage_seq'::regclass) NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_avantage PRIMARY KEY ( id )
 );

CREATE  TABLE "public".employe ( 
	id                   integer DEFAULT nextval('employe_id_employe_seq'::regclass) NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	prenom               varchar(50)  NOT NULL  ,
	dtn                  date  NOT NULL  ,
	email                varchar(30)    ,
	CONSTRAINT pk_employe PRIMARY KEY ( id )
 );

CREATE  TABLE "public".entreprise ( 
	id                   integer DEFAULT nextval('entreprise_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(35)  NOT NULL  ,
	addresse             varchar(100)  NOT NULL  ,
	CONSTRAINT pk_entreprise PRIMARY KEY ( id )
 );

CREATE  TABLE "public".info_societe ( 
	id                   integer DEFAULT nextval('info_societe_id_info_societe_seq'::regclass) NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	adresse              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_info PRIMARY KEY ( id )
 );

CREATE  TABLE "public".poste ( 
	id                   integer DEFAULT nextval('poste_id_poste_seq'::regclass) NOT NULL  ,
	service_action_id    integer  NOT NULL  ,
	superieur            varchar(50)  NOT NULL  ,
	"type"               varchar(50)  NOT NULL  ,
	CONSTRAINT pk_poste PRIMARY KEY ( id )
 );

CREATE  TABLE "public".poste_employe ( 
	id                   integer DEFAULT nextval('poste_employe_id_poste_employe_seq'::regclass) NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	essaie               boolean  NOT NULL  ,
	salaire              double precision  NOT NULL  ,
	CONSTRAINT pk_poste_employe PRIMARY KEY ( id ),
	CONSTRAINT fk_poste_employe_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id )   
 );

CREATE  TABLE "public".type_conge ( 
	id                   integer DEFAULT nextval('type_conge_id_type_conge_seq'::regclass) NOT NULL  ,
	"value"              varchar(50)    ,
	comptabilise         boolean  NOT NULL  ,
	CONSTRAINT pk_type_conge PRIMARY KEY ( id )
 );

CREATE  TABLE "public".conge ( 
	id                   integer DEFAULT nextval('conge_id_seq'::regclass) NOT NULL  ,
	employe_id           integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	conge_restant        double precision  NOT NULL  ,
	validation           integer  NOT NULL  ,
	type_conge_id        integer  NOT NULL  ,
	CONSTRAINT pk_conge PRIMARY KEY ( id ),
	CONSTRAINT fk_conge_employe FOREIGN KEY ( employe_id ) REFERENCES "public".employe( id )   ,
	CONSTRAINT fk_conge_type_conge FOREIGN KEY ( type_conge_id ) REFERENCES "public".type_conge( id )   
 );

CREATE  TABLE "public".mission ( 
	id                   integer DEFAULT nextval('mission_id_mission_seq'::regclass) NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_mission PRIMARY KEY ( id ),
	CONSTRAINT fk_mission_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id )   
 );

