/*
SQLyog - Free MySQL GUI v5.19
Host - 5.5.24 : Database - banquedbsecurity
*********************************************************************
Server version : 5.5.24
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `banquedbsecurity`;

USE `banquedbsecurity`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `authority` */

CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authority` */

insert into `authority` (`id`,`name`) values (1,'ROLE_USER');
insert into `authority` (`id`,`name`) values (2,'ROLE_ADMIN');

/*Table structure for table `authority_seq` */

CREATE TABLE `authority_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authority_seq` */

insert into `authority_seq` (`next_val`) values (3);

/*Table structure for table `comptes` */

CREATE TABLE `comptes` (
  `numero` varchar(255) NOT NULL,
  `proprietaire` varchar(255) DEFAULT NULL,
  `solde` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comptes` */

insert into `comptes` (`numero`,`proprietaire`,`solde`) values ('C1000','James Gosling ','1000.00');
insert into `comptes` (`numero`,`proprietaire`,`solde`) values ('C2000','Gavin King','2000.00');
insert into `comptes` (`numero`,`proprietaire`,`solde`) values ('C3000','Rod Johnson','3000.00');
insert into `comptes` (`numero`,`proprietaire`,`solde`) values ('C4000','Martin Fowler','4000.00');
insert into `comptes` (`numero`,`proprietaire`,`solde`) values ('C5000','Julien Dubois','5000.00');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastpasswordresetdate` datetime NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert into `user` (`id`,`email`,`enabled`,`firstname`,`lastpasswordresetdate`,`lastname`,`password`,`username`) values (1,'user@user.com','','User Firstname','2018-10-19 06:22:42','User Lastname','$2a$10$F4tCYD2oB2epF9lZfsTWaOd58CWmSIeQFnVfaG9CSxhCFyCYu4bqW','user');
insert into `user` (`id`,`email`,`enabled`,`firstname`,`lastpasswordresetdate`,`lastname`,`password`,`username`) values (2,'admin@admin.com','','Admin Firstname','2018-10-19 06:22:42','Admin Lastname','$2a$10$dHj/dXpb49hyoVRe.s.bSepTqEz8tGUCTLtxOcUWro.drnDnGSIW6','admin');

/*Table structure for table `user_authority` */

CREATE TABLE `user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_id` bigint(20) NOT NULL,
  KEY `FKgvxjs381k6f48d5d2yi11uh89` (`authority_id`),
  KEY `FKpqlsjpkybgos9w2svcri7j8xy` (`user_id`),
  CONSTRAINT `FKpqlsjpkybgos9w2svcri7j8xy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKgvxjs381k6f48d5d2yi11uh89` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_authority` */

insert into `user_authority` (`user_id`,`authority_id`) values (1,1);
insert into `user_authority` (`user_id`,`authority_id`) values (2,2);

/*Table structure for table `user_seq` */

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_seq` */

insert into `user_seq` (`next_val`) values (3);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
