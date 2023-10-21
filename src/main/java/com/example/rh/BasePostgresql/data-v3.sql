CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".avantage_id_avantage_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_en_cours_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".categorie_critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".conge_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".demande_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".employe_id_employe_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".entreprise_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".info_societe_id_info_societe_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".mission_id_mission_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".poste_employe_id_poste_employe_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".poste_id_poste_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".question_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".questionnaire_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_action_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".type_conge_id_type_conge_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".type_critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".candidat ( 
	id                   integer DEFAULT nextval('candidat_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(20)  NOT NULL  ,
	prenom               varchar(50)  NOT NULL  ,
	dtn                  date  NOT NULL  ,
	email                varchar(30)  NOT NULL  ,
	CONSTRAINT pk_candidat PRIMARY KEY ( id )
 );

CREATE  TABLE "public".categorie_critere ( 
	id                   integer DEFAULT nextval('categorie_critere_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(20)  NOT NULL  ,
	CONSTRAINT pk_categorie_critere PRIMARY KEY ( id )
 );

CREATE  TABLE "public".critere ( 
	id                   integer DEFAULT nextval('type_critere_id_seq'::regclass) NOT NULL  ,
	element              varchar(20)    ,
	categorie_critere_id integer  NOT NULL  ,
	CONSTRAINT type_critere_pkey PRIMARY KEY ( id ),
	CONSTRAINT fk_critere_categorie_critere FOREIGN KEY ( categorie_critere_id ) REFERENCES "public".categorie_critere( id )   
 );

CREATE  TABLE "public".critere_candidat ( 
	id                   integer DEFAULT nextval('critere_candidat_id_seq'::regclass) NOT NULL  ,
	candidat_id          integer  NOT NULL  ,
	critere_id           integer  NOT NULL  ,
	CONSTRAINT pk_critere_candidat PRIMARY KEY ( id ),
	CONSTRAINT fk_critere_candidat_candidat FOREIGN KEY ( candidat_id ) REFERENCES "public".candidat( id )   ,
	CONSTRAINT fk_critere_candidat_critere FOREIGN KEY ( critere_id ) REFERENCES "public".critere( id )   
 );

CREATE  TABLE "public".info_societe ( 
	id                   integer DEFAULT nextval('info_societe_id_info_societe_seq'::regclass) NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	adresse              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_info PRIMARY KEY ( id )
 );

CREATE  TABLE "public".service_action ( 
	id                   integer DEFAULT nextval('service_action_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(20)    ,
	CONSTRAINT service_action_pkey PRIMARY KEY ( id )
 );

CREATE  TABLE "public".type_conge ( 
	id                   integer DEFAULT nextval('type_conge_id_type_conge_seq'::regclass) NOT NULL  ,
	"value"              varchar(50)    ,
	comptabilise         boolean  NOT NULL  ,
	CONSTRAINT pk_type_conge PRIMARY KEY ( id )
 );

CREATE  TABLE "public".poste ( 
	id                   integer DEFAULT nextval('poste_id_poste_seq'::regclass) NOT NULL  ,
	service_action_id    integer  NOT NULL  ,
	"type"               varchar(50)  NOT NULL  ,
	superieur_poste_id   integer    ,
	CONSTRAINT pk_poste PRIMARY KEY ( id ),
	CONSTRAINT fk_poste_poste FOREIGN KEY ( superieur_poste_id ) REFERENCES "public".poste( id )   ,
	CONSTRAINT fk_poste_service_action FOREIGN KEY ( service_action_id ) REFERENCES "public".service_action( id )   
 );


CREATE  TABLE "public".poste_employe ( 
	id                   integer DEFAULT nextval('poste_employe_id_poste_employe_seq'::regclass) NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	essaie               boolean  NOT NULL  ,
	salaire              double precision  NOT NULL  ,
	employe_id           integer    ,
	CONSTRAINT pk_poste_employe PRIMARY KEY ( id ),
	CONSTRAINT fk_poste_employe_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id )   ,
	CONSTRAINT fk_poste_employe_candidat FOREIGN KEY ( employe_id ) REFERENCES "public".candidat( id )   
 );

INSERT INTO poste_employe(poste_id, debut, fin, essaie, salaire, employe_id) VALUES
    (1, '2023-10-20', '2023-12-12', true , 800000, 1);
CREATE  TABLE "public".service ( 
	id                   integer DEFAULT nextval('service_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(50)    ,
	prenom               varchar(50)    ,
	email                varchar(30)    ,
	mot_de_passe         varchar(16)    ,
	rh                   boolean    ,
	service_action_id    integer    ,
	profil               varchar(50)    ,
	CONSTRAINT service_pkey PRIMARY KEY ( id ),
	CONSTRAINT service_service_action_id_fkey FOREIGN KEY ( service_action_id ) REFERENCES "public".service_action( id )   
 );

CREATE  TABLE "public".avantage ( 
	id                   integer DEFAULT nextval('avantage_id_avantage_seq'::regclass) NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	CONSTRAINT pk_avantage PRIMARY KEY ( id ),
	CONSTRAINT fk_avantage_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id )   
 );

CREATE  TABLE "public".besoin ( 
	id                   integer DEFAULT nextval('besoin_id_seq'::regclass) NOT NULL  ,
	tache                varchar(100)    ,
	date_creation        timestamp    ,
	duree_tache          double precision    ,
	publie               integer DEFAULT 0   ,
	service_action_id    integer    ,
	service_id           integer    ,
	date_besoin          timestamp    ,
	CONSTRAINT besoin_pkey PRIMARY KEY ( id ),
	CONSTRAINT besoin_service_id_fkey FOREIGN KEY ( service_id ) REFERENCES "public".service( id )   ,
	CONSTRAINT besoin_service_action_id_fkey FOREIGN KEY ( service_action_id ) REFERENCES "public".service_action( id )   
 );

CREATE  TABLE "public".besoin_en_cours ( 
	id                   integer DEFAULT nextval('besoin_en_cours_id_seq'::regclass) NOT NULL  ,
	heures_par_jour      double precision    ,
	date_debut           timestamp    ,
	date_fin             timestamp    ,
	besoin_id            integer    ,
	CONSTRAINT besoin_en_cours_pkey PRIMARY KEY ( id ),
	CONSTRAINT besoin_en_cours_besoin_id_fkey FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   
 );

CREATE  TABLE "public".conge ( 
	id                   integer DEFAULT nextval('conge_id_seq'::regclass) NOT NULL  ,
	poste_employe_id     integer  NOT NULL  ,
	debut                date  NOT NULL  ,
	fin                  date  NOT NULL  ,
	conge_restant        double precision  NOT NULL  ,
	validation           integer  NOT NULL  ,
	type_conge_id        integer  NOT NULL  ,
	CONSTRAINT pk_conge PRIMARY KEY ( id ),
	CONSTRAINT fk_conge_type_conge FOREIGN KEY ( type_conge_id ) REFERENCES "public".type_conge( id )   ,
	CONSTRAINT fk_conge_poste_employe FOREIGN KEY ( poste_employe_id ) REFERENCES "public".poste_employe( id )   
 );

CREATE  TABLE "public".critere_besoin ( 
	id                   integer DEFAULT nextval('critere_besoin_id_seq'::regclass) NOT NULL  ,
	critere_id           integer    ,
	valeur               double precision    ,
	besoin_id            integer    ,
	CONSTRAINT critere_besoin_pkey PRIMARY KEY ( id ),
	CONSTRAINT critere_besoin_besoin_id_fkey FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   ,
	CONSTRAINT critere_besoin_type_critre_id_fkey FOREIGN KEY ( critere_id ) REFERENCES "public".critere( id )   
 );

CREATE  TABLE "public".demande ( 
	id                   integer DEFAULT nextval('demande_id_seq'::regclass) NOT NULL  ,
	candidat_id          integer  NOT NULL  ,
	besoin_id            integer  NOT NULL  ,
	CONSTRAINT pk_demande PRIMARY KEY ( id ),
	CONSTRAINT fk_demande_besoin FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   ,
	CONSTRAINT fk_demande_candidat FOREIGN KEY ( candidat_id ) REFERENCES "public".candidat( id )   
 );

CREATE  TABLE "public".mission ( 
	id                   integer DEFAULT nextval('mission_id_mission_seq'::regclass) NOT NULL  ,
	poste_id             integer  NOT NULL  ,
	"value"              varchar(50)  NOT NULL  ,
	CONSTRAINT pk_mission PRIMARY KEY ( id ),
	CONSTRAINT fk_mission_poste FOREIGN KEY ( poste_id ) REFERENCES "public".poste( id )   
 );

CREATE  TABLE "public".questionnaire ( 
	id                   integer DEFAULT nextval('questionnaire_id_seq'::regclass) NOT NULL  ,
	besoin_id            integer    ,
	CONSTRAINT pk_questionnaire PRIMARY KEY ( id ),
	CONSTRAINT fk_questionnaire_besoin FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   
 );

CREATE  TABLE "public".question ( 
	id                   integer DEFAULT nextval('question_id_seq'::regclass) NOT NULL  ,
	valeur               varchar    ,
	coefficient          integer DEFAULT 5 NOT NULL  ,
	questionnaire_id     integer  NOT NULL  ,
	"type"               varchar(10)    ,
	CONSTRAINT pk_question PRIMARY KEY ( id ),
	CONSTRAINT fk_question_questionnaire FOREIGN KEY ( questionnaire_id ) REFERENCES "public".questionnaire( id )   
 );

CREATE  TABLE "public".reponse ( 
	id                   integer DEFAULT nextval('reponse_id_seq'::regclass) NOT NULL  ,
	question_id          integer  NOT NULL  ,
	valeur               varchar    ,
	vrai                 boolean  NOT NULL  ,
	CONSTRAINT pk_reponse PRIMARY KEY ( id ),
	CONSTRAINT fk_reponse_question FOREIGN KEY ( question_id ) REFERENCES "public".question( id )   
 );

CREATE  TABLE "public".candidat_reponse ( 
	id                   serial  NOT NULL  ,
	candidat_id          integer  NOT NULL  ,
	reponse_id           integer  NOT NULL  ,
	CONSTRAINT pk_tbl PRIMARY KEY ( id ),
	CONSTRAINT fk_candidat_reponse_candidat FOREIGN KEY ( candidat_id ) REFERENCES "public".candidat( id )   ,
	CONSTRAINT fk_candidat_reponse_reponse FOREIGN KEY ( reponse_id ) REFERENCES "public".reponse( id )   
 );

CREATE VIEW "public".v_all_critere_besoin AS  SELECT b.id AS besoin_id,
    c.id AS critere_id
   FROM besoin b,
    critere c;

CREATE VIEW "public".v_all_critere_note AS  SELECT cn.id,
    cn.critere_id,
    COALESCE(cn.valeur, (0)::double precision) AS valeur,
    cn.besoin_id
   FROM (v_all_critere_besoin v
     JOIN critere_besoin cn ON (((v.besoin_id = cn.besoin_id) AND (v.critere_id = cn.besoin_id))));

CREATE VIEW "public".v_besoin_candidat AS  SELECT c.id AS candidat_id,
    c.nom,
    c.prenom,
    c.dtn,
    c.email,
    b.id AS besoin_id,
    b.tache,
    b.date_creation AS date_limite,
    b.duree_tache,
    b.publie,
    b.service_action_id,
    b.service_id
   FROM ((candidat c
     JOIN demande d ON ((c.id = d.candidat_id)))
     JOIN besoin b ON ((d.besoin_id = b.id)));

CREATE VIEW "public".v_candidat_note_critere AS  SELECT d.id AS demande_id,
    d.candidat_id,
    d.besoin_id,
    cc.critere_id,
    v.valeur
   FROM ((demande d
     JOIN critere_candidat cc ON ((d.candidat_id = cc.candidat_id)))
     JOIN v_all_critere_note v ON (((cc.critere_id = v.critere_id) AND (d.besoin_id = v.besoin_id))));

CREATE VIEW "public".v_critere_candidat AS  SELECT c.id AS candidat_id,
    c.nom,
    c.prenom,
    c.dtn,
    c.email,
    cr.id AS critere_id,
    cr.element,
    cr.categorie_critere_id
   FROM ((candidat c
     JOIN critere_candidat cc ON ((c.id = cc.candidat_id)))
     JOIN critere cr ON ((cr.id = cc.critere_id)));

INSERT INTO "public".service_action( id, nom ) VALUES ( 1, 'gestion');
INSERT INTO "public".service_action( id, nom ) VALUES ( 2, 'informatique');
INSERT INTO "public".service_action( id, nom ) VALUES ( 3, 'gestion');
INSERT INTO "public".service_action( id, nom ) VALUES ( 4, 'informatique');

INSERT INTO "public".service( id, nom, prenom, email, mot_de_passe, rh, service_action_id, profil ) VALUES ( 1, 'RATIATIANA', 'Jean Mirlin', 'jeanmirlin.r@gmail.com', 'huhu123', true, 1, null);
INSERT INTO "public".service( id, nom, prenom, email, mot_de_passe, rh, service_action_id, profil ) VALUES ( 2, 'RAMAROSON', 'Andrivola Fanambony Benjamina', 'ramarosonbenjamina@gmail.com', 'haha123', false, 1, null);
INSERT INTO "public".service( id, nom, prenom, email, mot_de_passe, rh, service_action_id, profil ) VALUES ( 3, 'RAMIANDRISOA', 'Tiavina Malalaniaina', 'tiavinaramia@gmail.com', 'hihi123', false, 1, null);

INSERT INTO "public".besoin( id, tache, date_creation, duree_tache, publie, service_action_id, service_id, date_besoin ) VALUES ( 3, 'Sécuriser et maintenir la base de donnée', '2023-10-08 01:41:05 PM', 400.0, 0, 2, 1, '2023-10-31 12:00:00 AM');
INSERT INTO "public".besoin( id, tache, date_creation, duree_tache, publie, service_action_id, service_id, date_besoin ) VALUES ( 4, 'Faire le tri entre les différentes informations budgétaires', '2023-10-14 06:07:48 AM', 400.0, 0, 1, 3, '2023-10-31 12:00:00 AM');

INSERT INTO "public".questionnaire( id, besoin_id ) VALUES ( 6, 3);
INSERT INTO "public".questionnaire( id, besoin_id ) VALUES ( 7, 3);

INSERT INTO "public".question( id, valeur, coefficient, questionnaire_id, "type" ) VALUES ( 48, 'Combien font 2+2?', 5, 6, null);
INSERT INTO "public".question( id, valeur, coefficient, questionnaire_id, "type" ) VALUES ( 49, 'Combien font 4+4?', 0, 6, 'boolean');
INSERT INTO "public".question( id, valeur, coefficient, questionnaire_id, "type" ) VALUES ( 50, 'null', 0, 7, null);

INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 51, 48, '5', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 52, 48, '4', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 53, 48, 'qsdfq', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 54, 49, 'of course', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 57, 49, null, false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 56, 49, 'le', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 58, 49, null, false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 55, 49, 'le', false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 59, 49, null, false);
INSERT INTO "public".reponse( id, question_id, valeur, vrai ) VALUES ( 60, 50, null, false);

INSERT INTO categorie_critere VALUES
      (default , 'Diplome') ,
      (default , 'Experience') ,
      (default , 'Sexe'),
      (default , 'Situation matrimo');

INSERT INTO critere(id, categorie_critere_id, element) VALUES
    (default, 1, '1'),
    (default, 1, 'BEPC'),
    (default, 1, 'BACC'),
    (default, 1, 'Licence'),
    (default, 1, 'Master'),
    (default, 1, 'Doctorat'),
    (default, 2, '1 ans'),
    (default, 2, '2 ans'),
    (default, 2, '3 ans'),
    (default, 2, '4 ans'),
    (default, 2, '5 ans et plus'),
    (default, 3, 'Masculin'),
    (default, 3, 'Feminin'),
    (default, 4, 'Celibataire'),
    (default, 4, 'Marié'),
    (default, 4, 'Divorcé'),
    (default, 4, 'Veuve');

insert into critere_besoin(id, critere_id, valeur, besoin_id) values
       (default, 5, 4, 3),
       (default, 5, 8, 3),
       (default, 5, 12, 3),
       (default, 5, 14, 3);

INSERT INTO candidat(nom, prenom, dtn, email) VALUES
    ('RAMAROSON', 'Benja', '12-05-1990', 'benja@gmail.com');

INSERT INTO demande(candidat_id, besoin_id) VALUES
    (1, 3);

INSERT INTO poste(service_action_id, type, superieur_poste_id) VALUES
    (1, 'huhu', 1);

INSERT INTO poste_employe(poste_id, debut, fin, essaie, salaire, employe_id) VALUES
    (1, '2023-10-20', '2023-12-12', true , 800000, 1);