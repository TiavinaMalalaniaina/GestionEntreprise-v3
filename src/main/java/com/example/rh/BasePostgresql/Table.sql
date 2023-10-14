CREATE DATABASE gestion_entreprise;
\c gestion_entreprise;

CREATE TABLE service_action(
   id SERIAL PRIMARY KEY ,
   nom VARCHAR (20)
);

CREATE TABLE service (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50) ,
    email VARCHAR (30) ,
    mot_de_passe VARCHAR (16) ,
    rh BOOLEAN ,
    profil VARCHAR(50) ,
    service_action_id INTEGER REFERENCES service_action
);

CREATE TABLE besoin (
    id SERIAL PRIMARY KEY ,
    tache VARCHAR (100) ,
    date_creation TIMESTAMP ,
    date_besoin TIMESTAMP ,
    duree_tache DOUBLE PRECISION ,
    publie INTEGER DEFAULT 0,
    service_action_id INTEGER REFERENCES service_action ,
    service_id INTEGER REFERENCES service
);

CREATE TABLE besoin_en_cours(
    id SERIAL PRIMARY KEY ,
    heures_par_jour DOUBLE PRECISION ,
    date_debut TIMESTAMP ,
    date_fin TIMESTAMP ,
    besoin_id INTEGER REFERENCES besoin
);

CREATE TABLE categorie_critere(
    id SERIAL PRIMARY KEY ,
    nom VARCHAR (100)
);
CREATE TABLE critere (
    id SERIAL PRIMARY KEY ,
    categorie_critere_id INTEGER REFERENCES categorie_critere,
    element VARCHAR (100)
);

CREATE  TABLE "public".candidat (
    id serial  NOT NULL  ,
    nom varchar(20)  NOT NULL  ,
    prenom varchar(50)  NOT NULL  ,
    dtn date  NOT NULL  ,
    email varchar(30)  NOT NULL  ,
    CONSTRAINT pk_candidat PRIMARY KEY ( id )
);


CREATE TABLE critere_besoin (
    id SERIAL PRIMARY KEY ,
    valeur DOUBLE PRECISION DEFAULT 0,
    critere_id INTEGER REFERENCES critere,
    besoin_id INTEGER REFERENCES besoin
);

CREATE  TABLE "public".demande (
    id serial  NOT NULL  ,
    id_candidat integer  NOT NULL  ,
    id_besoin integer  NOT NULL  ,
    CONSTRAINT pk_demande PRIMARY KEY ( id ),
    CONSTRAINT fk_demande_besoin FOREIGN KEY ( id_besoin ) REFERENCES "public".besoin( id )   ,
    CONSTRAINT fk_demande_candidat FOREIGN KEY ( id_candidat ) REFERENCES "public".candidat( id )
);

CREATE  TABLE "public".questionnaire (
    id integer DEFAULT nextval('questionnaire_id_seq'::regclass) NOT NULL  ,
    besoin_id integer    ,
    CONSTRAINT pk_questionnaire PRIMARY KEY ( id ),
    CONSTRAINT fk_questionnaire_besoin FOREIGN KEY ( besoin_id ) REFERENCES "public".besoin( id )
);

    CREATE  TABLE "public".question (
        id integer DEFAULT nextval('question_id_seq'::regclass) NOT NULL  ,
        valeur varchar    ,
        coefficient integer DEFAULT 5 NOT NULL  ,
        questionnaire_id integer  NOT NULL  ,
        "type" varchar(10)    ,
        CONSTRAINT pk_question PRIMARY KEY ( id ),
        CONSTRAINT fk_question_questionnaire FOREIGN KEY ( questionnaire_id ) REFERENCES "public".questionnaire( id )
    );

CREATE  TABLE "public".reponse (
    id integer DEFAULT nextval('reponse_id_seq'::regclass) NOT NULL  ,
    question_id integer  NOT NULL  ,
    valeur varchar    ,
    vrai boolean  NOT NULL  ,
    CONSTRAINT pk_reponse PRIMARY KEY ( id ),
    CONSTRAINT fk_reponse_question FOREIGN KEY ( question_id ) REFERENCES "public".question( id )
);

CREATE  TABLE "public".candidat_questionnaire (
    id serial  NOT NULL  ,
    candidat_id integer  NOT NULL  ,
    questionnaire_id integer  NOT NULL  ,
    CONSTRAINT pk_candidat_reponse PRIMARY KEY ( id ),
    CONSTRAINT fk_candidat_questionnaire_candidat FOREIGN KEY ( candidat_id ) REFERENCES "public".candidat( id )   ,
    CONSTRAINT fk_candidat_questionnaire_questionnaire FOREIGN KEY ( questionnaire_id ) REFERENCES "public".questionnaire( id )
);

CREATE  TABLE "public".candidat_reponse (
    id serial  NOT NULL  ,
    candidat_questionnaire_id integer  NOT NULL  ,
    reponse_id integer  NOT NULL  ,
    CONSTRAINT pk_candidat_reponse_0 PRIMARY KEY ( id ),
    CONSTRAINT fk_candidat_reponse_reponse FOREIGN KEY ( reponse_id ) REFERENCES "public".reponse( id )   ,
    CONSTRAINT fk_candidat_reponse_candidat_questionnaire FOREIGN KEY ( candidat_questionnaire_id ) REFERENCES "public".candidat_questionnaire( id )
);

CREATE OR REPLACE VIEW "public".v_besoin_candidat AS
SELECT c.id candidat_id, c.nom, c.prenom, c.dtn, c.email, b.id besoin_id, b.tache, b.date date_limite, b.duree_tache, b.publie, b.service_action_id, b.service_id
FROM candidat c
         JOIN demande d ON c.id=d.id_candidat
         JOIN besoin b ON d.id_besoin=b.id;

CREATE OR REPLACE VIEW "public".v_critere_candidat AS
SELECT c.id candidat_id, c.nom, c.prenom, c.dtn, c.email, cr.id critere_id, cr.element, cr.categorie_critere_id
FROM candidat c
         JOIN critere_candidat cc ON c.id=cc.candidat_id
         JOIN critere cr ON cr.id=cc.critere_id;

