CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".besoin_en_cours_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".candidat_reponse_id_seq1 START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".categorie_critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_besoin_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_candidat_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".critere_note_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".demande_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".question_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".questionnaire_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".reponse_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_action_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".type_critere_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".candidat ( 
	id                   integer DEFAULT nextval('candidat_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(20)  NOT NULL  ,
	prenom               varchar(50)  NOT NULL  ,
	dtn                  date  NOT NULL  ,
	email                varchar(30)  NOT NULL  ,
	CONSTRAINT pk_candidat PRIMARY KEY ( id )
 );

INSERT INTO candidat(nom, prenom, dtn, email) VALUES
    ('RAMAROSON', 'Benja', '12-05-1990', 'benja@gmail.com');

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

CREATE  TABLE "public".service_action ( 
	id                   integer DEFAULT nextval('service_action_id_seq'::regclass) NOT NULL  ,
	nom                  varchar(20)    ,
	CONSTRAINT service_action_pkey PRIMARY KEY ( id )
 );

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

CREATE  TABLE "public".critere_besoin ( 
	id                   integer DEFAULT nextval('critere_besoin_id_seq'::regclass) NOT NULL  ,
	critere_id           integer    ,
	valeur               double precision    ,
	besoin_id            integer    ,
	CONSTRAINT critere_besoin_pkey PRIMARY KEY ( id ),
	CONSTRAINT critere_besoin_besoin_id_fkey FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   ,
	CONSTRAINT critere_besoin_type_critre_id_fkey FOREIGN KEY ( critere_id ) REFERENCES "public".critere( id )   
 );

CREATE  TABLE "public".critere_note ( 
	id                   integer DEFAULT nextval('critere_note_id_seq'::regclass) NOT NULL  ,
	critere_id           integer  NOT NULL  ,
	valeur               double precision  NOT NULL  ,
	besoin_id            integer  NOT NULL  ,
	CONSTRAINT pk_critere_note PRIMARY KEY ( id ),
	CONSTRAINT fk_critere_note_besoin FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   ,
	CONSTRAINT fk_critere_note_critere FOREIGN KEY ( critere_id ) REFERENCES "public".critere( id )   
 );

CREATE  TABLE "public".demande ( 
	id                   integer DEFAULT nextval('demande_id_seq'::regclass) NOT NULL  ,
	candidat_id          integer  NOT NULL  ,
	besoin_id            integer  NOT NULL  ,
	CONSTRAINT pk_demande PRIMARY KEY ( id ),
	CONSTRAINT fk_demande_besoin FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )   ,
	CONSTRAINT fk_demande_candidat FOREIGN KEY ( candidat_id ) REFERENCES "public".candidat( id )
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
	id                   integer DEFAULT nextval('candidat_reponse_id_seq1'::regclass) NOT NULL  ,
	candidat_id integer  NOT NULL  ,
	reponse_id           integer  NOT NULL  ,
	CONSTRAINT pk_candidat_reponse_0 PRIMARY KEY ( id ),
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
     JOIN critere_note cn ON (((v.besoin_id = cn.besoin_id) AND (v.critere_id = cn.besoin_id))));

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

