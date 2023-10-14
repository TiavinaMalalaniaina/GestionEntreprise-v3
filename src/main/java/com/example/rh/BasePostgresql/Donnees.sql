INSERT INTO service_action VALUES
    (default , 'gestion'),
    (default , 'informatique');

INSERT INTO service VALUES
    (default, 'RATIATIANA', 'Jean Mirlin', 'jeanmirlin.r@gmail.com', 'huhu123', true, 'mirlin.jpg', 1),
    (default , 'RAMAROSON', 'Andrivola Fanambony Benjamina', 'ramarosonbenjamina@gmail.com', 'haha123', false, 'benja.jpg', 1),
    (default , 'RAMIANDRISOA', 'Tiavina Malalaniaina', 'tiavinaramia@gmail.com', 'hihi123', false, 'tiavina.jpg', 1);

INSERT INTO categorie_critere VALUES
    (default , 'Diplome') ,
    (default , 'Experience') ,
    (default , 'Sexe'),
    (default , 'Situation matrimoniale');

INSERT INTO critere VALUES
    (default, 1, 'CEPE'),
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


insert into besoin values
    (default, 'Assurer la gestion directe de l equipement de forage ainsi que le traitement et la collection des echantillons de qualite de forage.', '08-10-2023', '08-11-2023', 400, 1, 1, 1),
    (default, 'Un developpeur java pour une projet de 10 mois', '08-10-2023', '08-12-2023', 350, 1, 2, 2);

insert into question values
    (default, 'Quelle est la première étape du processus de résolution de problèmes ?', 2, 2, 'checkbox'),
    (default, 'Quelle est la principale fonction du département des ressources humaines dans une entreprise ?', 2, 2, 'checkbox'),
    (default, 'Quelle est l importance de la gestion du temps dans le milieu professionnel ?', 3, 2, 'checkbox'),
    (default, 'Qu est-ce que le sigle "CEO" signifie généralement dans le monde des affaires ?', 3, 2, 'checkbox'),
    (default, 'Vrai ou Faux : HTML est un langage de programmation.', 5, 2, 'radio'),
    (default, 'Vrai ou Faux : La diversification du portefeuille d investissement réduit le risque global d un investisseur.', 1, 2, 'radio'),
    (default, 'Quel est l objectif principal d une évaluation des performances annuelles d un employé ?', 4, 2, 'text'),
    (default, 'Comment gérez vous les défis ou les situations stressantes au travail ?', 3, 2, 'text'),
    (default, 'Comment gérez-vous votre temps et vos priorités au travail ?', 3, 2, 'text'),
    (default, 'Comment faites-vous preuve de leadershhp, le cas échéant ?', 5, 2, 'text');


insert into reponse values
                        (default, 1, 'Implémenter une solution', false),
                        (default, 1, 'Identifier le problème', true),
                        (default, 1, 'Collecter des données', false),
                        (default, 1, 'Analyser les résultats', false),
                        (default, 2, 'Gérer les finances de l entreprise', false),
                        (default, 2, 'Gérer les opérations de production', false),
                        (default, 2, 'Gérer les relations avec les clients', false),
                        (default, 2, 'Gérer les ressources humaines de l entreprise', true),
                        (default, 3, 'Gérer les ressources humaines de l entreprise', false),
                        (default, 3, 'Elle permet d augmenter la productivité et de respecter les échéances.', true),
                        (default, 3, 'Elle n a pas d importance dans le milieu professionnel.', false),
                        (default, 3, 'Elle permet de réduire les coûts de l entreprise.', false),
                        (default, 4, 'Chief Experience Officer', false),
                        (default, 4, 'Chief Executive Officer', true),
                        (default, 4, 'Chief Financial Officer', false),
                        (default, 4, 'Chief Marketing Officer', false),
                        (default, 5, 'Vrai', false),
                        (default, 5, 'Faux', true),
                        (default, 6, 'Vrai', false),
                        (default, 6, 'Faux', false),
                        (default, 7, '', false),
                        (default, 8, '', false),
                        (default, 9, '', false),
                        (default, 10, '', false);

insert into critere_besoin values
    (default, 5, 4, 2),
    (default, 5, 8, 2),
    (default, 5, 12, 2),
    (default, 5, 14, 2);