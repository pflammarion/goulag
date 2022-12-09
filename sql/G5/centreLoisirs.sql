-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 05, 2022 at 03:52 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centreLoisirs`
--
CREATE DATABASE IF NOT EXISTS `centreLoisirs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `centreLoisirs`;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom`) VALUES
(1, '3-5 ans'),
(2, '6-8 ans'),
(3, '7-12 ans'),
(4, '13-17 ans');

-- --------------------------------------------------------

--
-- Table structure for table `centre`
--

CREATE TABLE IF NOT EXISTS `centre` (
  `id_centre` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `numeroTel` varchar(15) NOT NULL,
  `capacite` int(11) NOT NULL,
  `numeroRue` int(11) NOT NULL,
  `typeRue` varchar(15) NOT NULL,
  `nomRue` varchar(30) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `pays` varchar(15) NOT NULL,
  `id_dirigeant` int(11) NOT NULL,
  PRIMARY KEY (`id_centre`),
  KEY `centre_personne_contrainte` (`id_dirigeant`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `centre`
--

INSERT INTO `centre` (`id_centre`, `nom`, `numeroTel`, `capacite`, `numeroRue`, `typeRue`, `nomRue`, `codePostal`, `ville`, `pays`, `id_dirigeant`) VALUES
(1, 'ALM Cabourg', '0171109640', 50, 36, 'rue', 'Antoine Fratacci', 92170, 'Vanves', 'France', 2),
(2, 'ALM Gambetta', '0158049024', 40, 1, 'rue', 'Gambetta', 92170, 'Vanves', 'France', 5),
(3, 'Clavim', '0141238600', 15, 47, 'rue', 'Général Leclerc', 92130, 'Issy-les-Moulineaux', 'France', 8),
(4, 'Jean Monnet', '0145291768', 30, 25, 'rue', 'Pierre Corby', 92140, 'Clamart', 'France', 4),
(5, 'La Fontaine', '0141099377', 45, 38, 'avenue', 'J.B. Clément', 92140, 'Clamart', 'France', 12);

-- --------------------------------------------------------

--
-- Table structure for table `centre_personne`
--

CREATE TABLE IF NOT EXISTS `centre_personne` (
  `id_centre_personne` int(11) NOT NULL AUTO_INCREMENT,
  `id_centre` int(11) NOT NULL,
  `id_animateur` int(11) NOT NULL,
  PRIMARY KEY (`id_centre_personne`),
  KEY `animer_personne_contrainte` (`id_animateur`),
  KEY `animer_centre_contrainte` (`id_centre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (1, 1, 2);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (2, 1, 3);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (3, 1, 7);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (4, 1, 10);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (5, 1, 11);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (6, 2, 5);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (7, 2, 3);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (8, 2, 7);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (9, 2, 10);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (10, 3, 8);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (11, 3, 1);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (12, 3, 6);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (13, 4, 4);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (14, 4, 9);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (15, 4, 13);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (16, 4, 14);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (17, 5, 12);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (18, 5, 9);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (19, 5, 13);
insert into centre_personne (id_centre_personne, id_centre, id_animateur) values (20, 5, 14);
-- --------------------------------------------------------

--
-- Table structure for table `enfant`
--

CREATE TABLE IF NOT EXISTS `enfant` (
  `id_enfant` int(11) NOT NULL AUTO_INCREMENT,
  `nomEnfant` varchar(20) NOT NULL,
  `prenomEnfant` varchar(20) NOT NULL,
  `dateNaissance` date NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_enfant`),
  KEY `Enf_Cat_contrainte` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfant`
--

INSERT INTO `enfant` (`id_enfant`, `nomEnfant`, `prenomEnfant`, `dateNaissance`, `id_categorie`) VALUES
(1, 'Ferby', 'Solène', '2018-07-05', 1),
(2, 'Silcocks', 'Stévina', '2017-12-18', 1),
(3, 'Tommasuzzi', 'Danièle', '2018-01-02', 1),
(4, 'Fairlem', 'Gisèle', '2018-04-09', 1),
(5, 'Pirt', 'Ráo', '2018-12-12', 1),
(6, 'Kloser', 'Crééz', '2017-02-15', 1),
(7, 'Mithon', 'Sòng', '2019-08-14', 1),
(8, 'Bartrap', 'Loïs', '2018-01-31', 1),
(9, 'Connock', 'Médiamass', '2019-04-25', 1),
(10, 'Clayill', 'Estée', '2018-11-13', 1),
(11, 'Cotter', 'Audréanne', '2017-05-20', 1),
(12, 'Angeau', 'Mà', '2017-08-17', 1),
(13, 'Pawley', 'Loïc', '2019-04-14', 1),
(14, 'Skelhorne', 'Marie-noël', '2018-11-06', 1),
(15, 'Kennelly', 'Marylène', '2017-11-26', 1),
(16, 'Burree', 'Mélodie', '2019-06-13', 1),
(17, 'Duddell', 'Naëlle', '2018-09-19', 1),
(18, 'Vergine', 'Bérénice', '2018-01-05', 1),
(19, 'Gaukroger', 'Judicaël', '2017-07-12', 1),
(20, 'Havesides', 'Vénus', '2017-10-04', 1),
(21, 'Densey', 'Salomé', '2014-03-20', 2),
(22, 'Baude', 'Cécile', '2015-07-07', 2),
(23, 'Trulock', 'Maëlle', '2016-03-25', 2),
(24, 'Craighall', 'Nuó', '2014-02-24', 2),
(25, 'Palser', 'Judicaël', '2016-05-18', 2),
(26, 'Surgey', 'Renée', '2015-01-24', 2),
(27, 'Meineken', 'Estée', '2015-01-09', 2),
(28, 'Fattorini', 'Méng', '2014-03-15', 2),
(29, 'Novakovic', 'Maïté', '2014-01-25', 2),
(30, 'Fellnee', 'Nuó', '2016-01-08', 2),
(31, 'Hovenden', 'Vénus', '2016-12-20', 2),
(32, 'MacDowall', 'Marie-françoise', '2014-05-20', 2),
(33, 'Denham', 'Yáo', '2016-07-05', 2),
(34, 'Okenden', 'Mégane', '2015-06-29', 2),
(35, 'Long', 'Angèle', '2015-06-26', 2),
(36, 'Snawdon', 'Gösta', '2014-12-19', 2),
(37, 'Bengtson', 'Björn', '2014-03-30', 2),
(38, 'Eadmeads', 'Aí', '2016-02-13', 2),
(39, 'Bruhke', 'Léonore', '2014-01-04', 2),
(40, 'Bawcock', 'Lauréna', '2016-10-15', 2),
(41, 'Embling', 'Thérèse', '2013-01-14', 3),
(42, 'Cufflin', 'Léon', '2013-03-02', 3),
(43, 'Parnall', 'Méthode', '2012-02-29', 3),
(44, 'Adamovsky', 'Inès', '2013-11-01', 3),
(45, 'Chaperling', 'François', '2012-05-20', 3),
(46, 'Bohills', 'Andréanne', '2012-06-11', 3),
(47, 'Easey', 'Noémie', '2013-06-30', 3),
(48, 'Spaxman', 'Cloé', '2011-04-11', 3),
(49, 'Toulamain', 'Laïla', '2012-06-01', 3),
(50, 'Deex', 'Mylène', '2011-08-02', 3),
(51, 'Stearne', 'Michèle', '2012-10-09', 3),
(52, 'Soot', 'Estève', '2012-05-11', 3),
(53, 'Roubeix', 'Gwenaëlle', '2011-08-22', 3),
(54, 'Slinger', 'Mégane', '2012-04-15', 3),
(55, 'Martineau', 'Océane', '2012-08-02', 3),
(56, 'McCandie', 'Françoise', '2012-06-19', 3),
(57, 'Gathercoal', 'Estée', '2011-12-05', 3),
(58, 'Filipputti', 'Aurélie', '2011-09-17', 3),
(59, 'Jarmaine', 'Eliès', '2013-02-17', 3),
(60, 'Whapham', 'Vénus', '2013-08-24', 3),
(61, 'Klulik', 'Hélèna', '2007-12-23', 4),
(62, 'Nurcombe', 'Maëline', '2009-03-15', 4),
(63, 'Keyho', 'Noémie', '2006-09-09', 4),
(64, 'Regler', 'Lèi', '2009-07-07', 4),
(65, 'Trengrove', 'Gisèle', '2006-11-19', 4),
(66, 'Leggin', 'Anaël', '2007-03-12', 4),
(67, 'Hedworth', 'Alizée', '2008-04-21', 4),
(68, 'Langstaff', 'Märta', '2007-10-20', 4),
(69, 'Farens', 'Anaëlle', '2009-07-14', 4),
(70, 'Affron', 'Nadège', '2007-01-13', 4),
(71, 'Stewart', 'Maïlys', '2007-03-15', 4),
(72, 'Pozer', 'Annotée', '2007-04-17', 4),
(73, 'Harrie', 'Maëline', '2006-09-01', 4),
(74, 'Janzen', 'Gaïa', '2006-04-02', 4),
(75, 'Simonson', 'Görel', '2009-08-28', 4),
(76, 'Balsillie', 'Vénus', '2008-09-09', 4),
(77, 'Salvidge', 'Méthode', '2008-05-06', 4),
(78, 'Bollins', 'Gaïa', '2008-03-13', 4),
(79, 'Enrrico', 'Estève', '2006-01-04', 4),
(80, 'Alben', 'Kù', '2009-08-31', 4);

-- --------------------------------------------------------

--
-- Table structure for table `enfant_centre`
--

CREATE TABLE IF NOT EXISTS `enfant_centre` (
  `id_enfant_centre` int(11) NOT NULL AUTO_INCREMENT,
  `id_enfant` int(11) NOT NULL,
  `id_centre` int(11) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `cantine` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_enfant_centre`),
  KEY `enfant_contrainte` (`id_enfant`),
  KEY `centre_contrainte` (`id_centre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (1, 1, 3, '2022-12-22', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (2, 2, 5, '2022-12-21', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (3, 3, 2, '2022-12-20', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (4, 4, 5, '2022-12-22', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (5, 5, 5, '2022-12-21', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (6, 6, 5, '2022-12-20', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (7, 7, 3, '2022-12-19', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (8, 8, 2, '2022-12-22', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (9, 9, 5, '2022-12-20', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (10, 10, 4, '2022-12-21', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (11, 11, 2, '2022-12-22', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (12, 12, 3, '2022-12-20', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (13, 13, 3, '2022-12-19', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (14, 14, 3, '2022-12-20', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (15, 15, 2, '2022-12-22', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (16, 16, 3, '2022-12-20', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (17, 17, 2, '2022-12-20', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (18, 18, 3, '2022-12-20', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (19, 19, 1, '2022-12-21', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (20, 20, 1, '2022-12-20', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (21, 21, 4, '2022-12-22', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (22, 22, 2, '2022-12-19', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (23, 23, 1, '2022-12-21', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (24, 24, 4, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (25, 25, 1, '2022-12-19', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (26, 26, 5, '2022-12-20', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (27, 27, 2, '2022-12-19', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (28, 28, 4, '2022-12-22', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (29, 29, 4, '2022-12-22', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (30, 30, 2, '2022-12-21', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (31, 31, 4, '2022-12-21', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (32, 32, 2, '2022-12-19', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (33, 33, 3, '2022-12-20', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (34, 34, 1, '2022-12-20', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (35, 35, 5, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (36, 36, 2, '2022-12-21', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (37, 37, 5, '2022-12-21', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (38, 38, 4, '2022-12-19', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (39, 39, 4, '2022-12-20', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (40, 40, 2, '2022-12-19', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (41, 41, 1, '2022-12-19', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (42, 42, 2, '2022-12-22', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (43, 43, 1, '2022-12-21', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (44, 44, 5, '2022-12-19', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (45, 45, 2, '2022-12-22', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (46, 46, 4, '2022-12-20', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (47, 47, 2, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (48, 48, 2, '2022-12-22', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (49, 49, 4, '2022-12-20', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (50, 50, 3, '2022-12-19', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (51, 51, 2, '2022-12-22', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (52, 52, 2, '2022-12-19', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (53, 53, 3, '2022-12-21', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (54, 54, 4, '2022-12-21', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (55, 55, 3, '2022-12-22', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (56, 56, 5, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (57, 57, 5, '2022-12-22', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (58, 58, 1, '2022-12-22', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (59, 59, 5, '2022-12-20', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (60, 60, 5, '2022-12-22', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (61, 61, 5, '2022-12-22', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (62, 62, 2, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (63, 63, 1, '2022-12-19', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (64, 64, 5, '2022-12-19', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (65, 65, 2, '2022-12-20', '2022-12-26', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (66, 66, 2, '2022-12-21', '2022-12-27', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (67, 67, 4, '2022-12-22', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (68, 68, 4, '2022-12-19', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (69, 69, 4, '2022-12-20', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (70, 70, 5, '2022-12-19', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (71, 71, 1, '2022-12-21', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (72, 72, 5, '2022-12-20', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (73, 73, 3, '2022-12-21', '2022-12-29', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (74, 74, 5, '2022-12-22', '2022-12-28', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (75, 75, 5, '2022-12-20', '2022-12-28', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (76, 76, 1, '2022-12-20', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (77, 77, 4, '2022-12-21', '2022-12-29', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (78, 78, 1, '2022-12-19', '2022-12-27', true);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (79, 79, 3, '2022-12-19', '2022-12-26', false);
insert into enfant_centre (id_enfant_centre, id_enfant, id_centre, dateDebut, dateFin, cantine) values (80, 80, 5, '2022-12-21', '2022-12-28', true);
-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(11) NOT NULL AUTO_INCREMENT,
  `nomPersonne` varchar(20) NOT NULL,
  `prenomPersonne` varchar(20) NOT NULL,
  `dateNaissance` date NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id_personne`, `nomPersonne`, `prenomPersonne`, `dateNaissance`) VALUES
(1, 'Duchaine', 'Léa', '1995-08-04'),
(2, 'Martin', 'Pascale', '1975-10-05'),
(3, 'Dupont', 'Margaux', '1983-12-12'),
(4, 'Martin', 'Marion', '1980-03-28'),
(5, 'Deschamps', 'Didier', '1979-11-08'),
(6, 'Duhamel', 'Arthur', '2000-01-01'),
(7, 'Richard', 'Antoine', '2001-05-06'),
(8, 'Moussi', 'Malika', '1975-05-08'),
(9, 'Bertrand', 'Camille', '2002-02-03'),
(10, 'Sublime', 'Matéo', '2000-10-04'),
(11, 'Leblanc', 'Cassandra', '1988-04-23'),
(12, 'Poulain', 'Louis', '1989-04-30'),
(13, 'Leclerc', 'Yann', '1986-05-11'),
(14, 'Lamarche', 'Alexandre', '1987-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `personne_categorie`
--

CREATE TABLE IF NOT EXISTS `personne_categorie` (
  `id_personne_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `id_animateur` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_personne_categorie`),
  KEY `personne_contrainte` (`id_animateur`),
  KEY `categorie_contrainte` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (1, 1, 2);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (2, 2, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (3, 3, 2);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (4, 4, 2);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (5, 5, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (6, 6, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (7, 7, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (8, 8, 4);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (9, 9, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (10, 10, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (11, 11, 4);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (12, 12, 4);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (13, 1, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (14, 2, 4);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (15, 3, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (16, 4, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (17, 5, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (18, 6, 2);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (19, 7, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (20, 8, 1);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (21, 9, 2);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (22, 10, 4);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (23, 11, 3);
insert into personne_categorie (id_personne_categorie, id_animateur, id_categorie) values (24, 12, 2);
--
-- Constraints for dumped tables
--

--
-- Constraints for table `centre_personne`
--
ALTER TABLE `centre_personne`
  ADD CONSTRAINT `animer_centre_contrainte` FOREIGN KEY (`id_centre`) REFERENCES `centre` (`id_centre`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `animer_personne_contrainte` FOREIGN KEY (`id_animateur`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `Enf_Cat_contrainte` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `enfant_centre`
--
ALTER TABLE `enfant_centre`
  ADD CONSTRAINT `centre_contrainte` FOREIGN KEY (`id_centre`) REFERENCES `centre` (`id_centre`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `enfant_contrainte` FOREIGN KEY (`id_enfant`) REFERENCES `enfant` (`id_enfant`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `personne_categorie`
--
ALTER TABLE `personne_categorie`
  ADD CONSTRAINT `categorie_contrainte` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `personne_contrainte` FOREIGN KEY (`id_animateur`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
