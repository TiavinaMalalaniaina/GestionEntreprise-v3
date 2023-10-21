CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".besoin_en_cours_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".categorie_critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_note_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".demande_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".question_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".questionnaire_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_action_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".type_question_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".avantage ( 
	id_avantage          serial  NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_avantage PRIMARY KEY ( id_avantage )
 );

CREATE  TABLE "public".employe ( 
	id_employe           serial  NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	CONSTRAINT pk_employe PRIMARY KEY ( id_employe )
 );

CREATE  TABLE "public".info_societe ( 
	id_info_societe      serial  NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	adresse              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_info PRIMARY KEY ( id_info_societe )
 );

CREATE  TABLE "public".poste ( 
	id_poste             serial  NOT NULL  ,
	service_id           integer  NOT NULL  ,
	superieur            varchar(50)  NOT NULL  ,
	"type"               varchar(50)  NOT NULL  ,
	CONSTRAINT pk_poste PRIMARY KEY ( id_poste )
 );

CREATE  TABLE "public".poste_employe ( 
	id_poste_employe     serial  NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	essaie               boolean  NOT NULL  ,
	salaire              double precision  NOT NULL  ,
	CONSTRAINT pk_poste_employe PRIMARY KEY ( id_poste_employe ),
	CONSTRAINT fk_poste_employe_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id_poste )   
 );

CREATE  TABLE "public".service_societe ( 
	id_service_societe   serial  NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	CONSTRAINT pk_service_societe PRIMARY KEY ( id_service_societe )
 );

CREATE  TABLE "public".type_conge ( 
	id_type_conge        serial  NOT NULL  ,
	"value"              varchar(50)    ,
	comptabilise         boolean  NOT NULL  ,
	CONSTRAINT pk_type_conge PRIMARY KEY ( id_type_conge )
 );

CREATE  TABLE "public".conge ( 
	id                   serial  NOT NULL  ,
	employe_id           integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	conge_restant        double precision  NOT NULL  ,
	validation           integer  NOT NULL  ,
	CONSTRAINT pk_conge PRIMARY KEY ( id ),
	CONSTRAINT fk_conge_employe FOREIGN KEY ( employe_id ) REFERENCES "public".employe( id_employe )   
 );

CREATE  TABLE "public".mission ( 
	id_mission           serial  NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_mission PRIMARY KEY ( id_mission ),
	CONSTRAINT fk_mission_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id_poste )   
 );

