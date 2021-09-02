/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - seminarski
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`seminarski` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `seminarski`;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`timestamp`,`name`) values 
(1,1621246992063,'kreirajTabeluStudenti1621246992063'),
(2,1621247097134,'kreirajTabeluProfesor1621247097134'),
(3,1621247333435,'kreirajTabeluPredmetIPomocneTabele1621247333435'),
(4,1621247621637,'kreirajTabeluSeminarski1621247621637'),
(5,1621247689298,'dodajSemestarPredmetu1621247689298'),
(6,1621247954922,'kreirajTabeluPrijava1621247954922'),
(7,1622150543284,'dodajEmailStudentu1622150543284'),
(8,1622222260427,'mentorJeNaPrijavi1622222260427'),
(9,1622494406313,'preimenujFajlNaFile1622494406313');

/*Table structure for table `predmet` */

DROP TABLE IF EXISTS `predmet`;

CREATE TABLE `predmet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `espb` int(11) NOT NULL,
  `semestar` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `predmet` */

insert  into `predmet`(`id`,`naziv`,`opis`,`espb`,`semestar`) values 
(1,'mata1','opis',6,1),
(2,'mata2','opis2',6,2),
(3,'epos','epos',5,5),
(4,'iteh','agsr',6,7);

/*Table structure for table `prijava` */

DROP TABLE IF EXISTS `prijava`;

CREATE TABLE `prijava` (
  `brojPoena` int(11) DEFAULT NULL,
  `nazivTeme` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `studentId` int(11) NOT NULL,
  `seminarskiId` int(11) NOT NULL,
  `mentorId` int(11) DEFAULT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`studentId`,`seminarskiId`),
  KEY `FK_a2217159547438cbb9041cfbf1a` (`seminarskiId`),
  KEY `FK_3f1c7fa3851a5e29bdfd767ca76` (`mentorId`),
  CONSTRAINT `FK_3f1c7fa3851a5e29bdfd767ca76` FOREIGN KEY (`mentorId`) REFERENCES `profesor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_82ad3391439eac7900c6118a418` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_a2217159547438cbb9041cfbf1a` FOREIGN KEY (`seminarskiId`) REFERENCES `seminarski` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `prijava` */

insert  into `prijava`(`brojPoena`,`nazivTeme`,`status`,`studentId`,`seminarskiId`,`mentorId`,`file`) values 
(15,'teagr','ocenjena',1,1,1,'ALPIS-FINAL.pdf'),
(10,'afdsg','ocenjena',1,2,1,'gallery3.jpg'),
(18,'asfd','ocenjena',1,4,1,'ALPIS-FINAL (1).pdf'),
(NULL,'afds','kreirana',1,5,1,'gallery5.jpg'),
(NULL,'afdg','kreirana',1,8,1,'gallery3.jpg');

/*Table structure for table `profesor` */

DROP TABLE IF EXISTS `profesor`;

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `sifra` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `profesor` */

insert  into `profesor`(`id`,`ime`,`prezime`,`sifra`,`email`) values 
(1,'dusan','barac','dusan','db@fon.rs');

/*Table structure for table `profesor_predmet` */

DROP TABLE IF EXISTS `profesor_predmet`;

CREATE TABLE `profesor_predmet` (
  `profesorId` int(11) NOT NULL,
  `predmetId` int(11) NOT NULL,
  PRIMARY KEY (`profesorId`,`predmetId`),
  KEY `IDX_f10f1eaedbb2deecf1ccf18852` (`profesorId`),
  KEY `IDX_d66911194d6321abb2ffc5d2d7` (`predmetId`),
  CONSTRAINT `FK_d66911194d6321abb2ffc5d2d75` FOREIGN KEY (`predmetId`) REFERENCES `predmet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_f10f1eaedbb2deecf1ccf188521` FOREIGN KEY (`profesorId`) REFERENCES `profesor` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `profesor_predmet` */

insert  into `profesor_predmet`(`profesorId`,`predmetId`) values 
(1,2),
(1,3),
(1,4);

/*Table structure for table `seminarski` */

DROP TABLE IF EXISTS `seminarski`;

CREATE TABLE `seminarski` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maksBrojPoena` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `predmetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5eda3c0581bc110da61c175973d` (`predmetId`),
  CONSTRAINT `FK_5eda3c0581bc110da61c175973d` FOREIGN KEY (`predmetId`) REFERENCES `predmet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `seminarski` */

insert  into `seminarski`(`id`,`maksBrojPoena`,`naziv`,`opis`,`predmetId`) values 
(1,10,'php','afdg',4),
(2,10,'laravel','aefdsg',4),
(4,40,'projekat','fsg',4),
(5,30,'algebra','nesto',2),
(8,23,'aaaa','aesgrdth',2),
(10,10,'dsfh','aefdsg',4),
(11,20,'zez','fas',4),
(12,32,'dms1','fsddgfnf',2),
(13,15,'xzczvx','dafsg',2);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `godinaUpisa` int(11) NOT NULL,
  `brojIndeksa` int(11) NOT NULL,
  `sifra` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `student` */

insert  into `student`(`id`,`ime`,`prezime`,`godinaUpisa`,`brojIndeksa`,`sifra`,`email`) values 
(1,'vojislav','stefanovic',2017,94,'voja','vs20170094@student.fon.bg.ac.rs');

/*Table structure for table `student_predmet` */

DROP TABLE IF EXISTS `student_predmet`;

CREATE TABLE `student_predmet` (
  `studentId` int(11) NOT NULL,
  `predmetId` int(11) NOT NULL,
  PRIMARY KEY (`studentId`,`predmetId`),
  KEY `IDX_cb232076331ef10e016292ac9f` (`studentId`),
  KEY `IDX_84b9170e1ee332e4329bc3475e` (`predmetId`),
  CONSTRAINT `FK_84b9170e1ee332e4329bc3475e6` FOREIGN KEY (`predmetId`) REFERENCES `predmet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_cb232076331ef10e016292ac9f8` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `student_predmet` */

insert  into `student_predmet`(`studentId`,`predmetId`) values 
(1,1),
(1,2),
(1,3),
(1,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
