CREATE DATABASE IF NOT EXISTS ludo CHARACTER SET utf8 COLLATE utf8_general_ci;

USE ludo;

CREATE TABLE `ludotheque` (
                              `id_ludotheque` int(11) NOT NULL,
                              `nom` varchar(20) NOT NULL,
                              `numeroTel` varchar(20) NOT NULL,
                              `numeRue` int(11) NOT NULL,
                              `typeRue` varchar(10) NOT NULL,
                              `nomRue` varchar(30) NOT NULL,
                              `codePostal` varchar(10) NOT NULL,
                              `ville` varchar(20) NOT NULL,
                              `Pays` varchar(20) NOT NULL,
                              PRIMARY KEY (`id_ludotheque`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `personne` (
                            `id_personne` int(11) NOT NULL AUTO_INCREMENT,
                            `nomPersonne` varchar(30) NOT NULL,
                            `prenomPersonne` varchar(30) NOT NULL,
                            `dateNaissance` date NOT NULL,
                            `email` varchar(30) NOT NULL,
                            `id_ludotheque` int(11) DEFAULT NULL,
                            PRIMARY KEY (`id_personne`),
                            KEY `ludo_constraint` (`id_ludotheque`),
                            CONSTRAINT `ludo_constraint` FOREIGN KEY (`id_ludotheque`) REFERENCES `ludotheque` (`id_ludotheque`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `specialite` (
                              `id_specialite` int(11) NOT NULL AUTO_INCREMENT,
                              `nom` varchar(30) NOT NULL,
                              PRIMARY KEY (`id_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `jouet` (
                         `id_jouet` int(11) NOT NULL AUTO_INCREMENT,
                         `designation` varchar(50) NOT NULL,
                         `marque` varchar(20) NOT NULL,
                         `description` text NOT NULL,
                         `categorieAge` varchar(10) NOT NULL,
                         PRIMARY KEY (`id_jouet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `theme` (
                         `id_theme` int(11) NOT NULL AUTO_INCREMENT,
                         `nom` varchar(40) NOT NULL,
                         PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `specialite_personne` (
                                       `id_specialite_personne` int(11) NOT NULL AUTO_INCREMENT,
                                       `id_specialite` int(11) NOT NULL,
                                       `id_personne` int(11) NOT NULL,
                                       PRIMARY KEY (`id_specialite_personne`),
                                       KEY `P_constraint` (`id_personne`),
                                       KEY `S_constraint` (`id_specialite`),
                                       CONSTRAINT `P_constraint` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE NO ACTION,
                                       CONSTRAINT `S_constraint` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ludotheque_personne` (
                                       `id_ludotheque_personne` int(11) NOT NULL AUTO_INCREMENT,
                                       `dateDebut` date NOT NULL,
                                       `dateFin` date NOT NULL,
                                       `id_personne` int(11) NOT NULL,
                                       `id_ludotheque` int(11) NOT NULL,
                                       PRIMARY KEY (`id_ludotheque_personne`),
                                       KEY `AP_constraint` (`id_personne`),
                                       KEY `AL_constraint` (`id_ludotheque`),
                                       CONSTRAINT `AL_constraint` FOREIGN KEY (`id_ludotheque`) REFERENCES `ludotheque` (`id_ludotheque`) ON DELETE CASCADE ON UPDATE NO ACTION,
                                       CONSTRAINT `AP_constraint` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `jouet_ludotheque` (
                                    `id_jouet_ludotheque` int(11) NOT NULL AUTO_INCREMENT,
                                    `id_jouet` int(11) NOT NULL,
                                    `id_ludotheque` int(11) NOT NULL,
                                    PRIMARY KEY (`id_jouet_ludotheque`),
                                    KEY `J_constraint` (`id_jouet`),
                                    KEY `L_constraint` (`id_ludotheque`),
                                    CONSTRAINT `J_constraint` FOREIGN KEY (`id_jouet`) REFERENCES `jouet` (`id_jouet`) ON DELETE CASCADE ON UPDATE NO ACTION,
                                    CONSTRAINT `L_constraint` FOREIGN KEY (`id_ludotheque`) REFERENCES `ludotheque` (`id_ludotheque`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jouet_theme` (
                               `id_jouet_theme` int(11) NOT NULL AUTO_INCREMENT,
                               `id_jouet` int(11) NOT NULL,
                               `id_theme` int(11) NOT NULL,
                               PRIMARY KEY (`id_jouet_theme`),
                               KEY `JO_constraint` (`id_jouet`),
                               CONSTRAINT `JO_constraint` FOREIGN KEY (`id_jouet`) REFERENCES `jouet` (`id_jouet`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ludotheque` (`id_ludotheque`, `nom`, `numeroTel`, `numeRue`, `typeRue`, `nomRue`, `codePostal`, `ville`, `Pays`) VALUES
                                                                                                                                  (1, 'La ludo', '0145464748', 123, 'rue', 'de Vanves', '92130', 'Issy-les-Moulineaux', 'France'),
                                                                                                                                  (2, 'Ludido', '0651973831', 6, 'rue', 'Hippolyte Maindron', '75014', 'Paris', 'France');

INSERT INTO `jouet` (`id_jouet`, `designation`, `marque`, `description`, `categorieAge`) VALUES
                                                                                             (1, 'LEGO POKEMON TORTANK', 'Lego', 'Pour rappel, Tortank est un Pokémon de type Eau de la première génération', '7'),
                                                                                             (2, 'LEGO POKEMON FLORIZARRE', 'Lego', 'Tu dois savoir en tant que jeune dresseur que Florizarre est un Pokémon de type Plante et Poison de la première génération', '7'),
                                                                                             (3, 'Astérix : La tente des légionnaires', 'Playmobil', 'Le Centurion Caius Bonus et son bras droit Marcus Sacapus sont dans leur tente richement meublée. Avec leurs boucliers, les quatres légionnaires romains peuvent réaliser la formation tortue. De nombreux accessoires complètent la tente romaine.', '5'),
                                                                                             (4, 'Astérix : La hutte d\'Abraracourcix', 'Playmobil', 'La hutte d’Abraracourcix comprend de nombreux détails, tels que la tête de taureau, les boucliers colorés et les portes battantes.', '5');


INSERT INTO `personne` (`id_personne`, `nomPersonne`, `prenomPersonne`, `dateNaissance`, `email`, `id_ludotheque`) VALUES
                                                                                                                       (1, 'dupond', 'Marie-Antoinette', '2000-01-03', 'ma@dupond.name', 1),
                                                                                                                       (2, 'Martin', 'Christopher', '1975-10-05', 'martinc@gmail.com', 1),
                                                                                                                       (3, 'Duchaine', 'Léa', '1995-08-04', 'lea.duchaine@yahoo.com', 2),
                                                                                                                       (4, 'Martin', 'Pascale', '1987-12-06', 'martin.pascale23@gmail.com', 2),
                                                                                                                       (5, 'Perrin', 'Calia', '2014-07-10', 'parrin12@gmail.com', NULL),
                                                                                                                       (6, 'Dupont', 'Margaux', '2015-12-30', 'dupont123@gmail.com', NULL),
                                                                                                                       (7, 'Chaine', 'Antoine', '2012-11-29', 'chaine.bruno@free.fr', NULL),
                                                                                                                       (8, 'Maurice', 'lilas', '2014-02-22', 'mauricette@gmail.com', NULL);

INSERT INTO `theme` (`id_theme`, `nom`) VALUES
                                            (1, 'Jeux de constructions'),
                                            (2, 'plein air');

INSERT INTO `specialite` (`id_specialite`, `nom`) VALUES
                                                      (1, 'animateur'),
                                                      (2, 'éducateur');



INSERT INTO `jouet_ludotheque` (`id_jouet_ludotheque`, `id_jouet`, `id_ludotheque`) VALUES
                                                                                        (1, 1, 1),
                                                                                        (2, 2, 1),
                                                                                        (3, 3, 1),
                                                                                        (4, 4, 1),
                                                                                        (5, 3, 2),
                                                                                        (6, 4, 2);


INSERT INTO `jouet_theme` (`id_jouet_theme`, `id_jouet`, `id_theme`) VALUES
                                                                         (1, 1, 1),
                                                                         (2, 2, 1),
                                                                         (3, 3, 1),
                                                                         (4, 4, 1);

INSERT INTO `ludotheque_personne` (`id_ludotheque_personne`, `dateDebut`, `dateFin`, `id_personne`, `id_ludotheque`) VALUES
                                                                                                                         (1, '2021-11-01', '2022-10-31', 5, 1),
                                                                                                                         (2, '2021-12-02', '2022-12-01', 6, 1),
                                                                                                                         (3, '2021-05-03', '2022-05-02', 7, 1),
                                                                                                                         (4, '2020-12-02', '2021-12-01', 8, 2);

INSERT INTO `specialite_personne` (`id_specialite_personne`, `id_specialite`, `id_personne`) VALUES
                                                                                                 (1, 1, 1),
                                                                                                 (2, 2, 2),
                                                                                                 (3, 1, 3),
                                                                                                 (4, 2, 4);
