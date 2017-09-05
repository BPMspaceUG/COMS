CREATE DATABASE  IF NOT EXISTS `bpmspace_coms_v2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bpmspace_coms_v2`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bpmspace_coms_v2
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB-1~jessie

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coms_certificate`
--

DROP TABLE IF EXISTS `coms_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_certificate` (
  `coms_certificate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_certificate_name` longtext NOT NULL,
  `coms_certificate_description` longtext,
  `coms_certificate_type_id` bigint(20) DEFAULT NULL,
  `coms_certificate_id_md5` varchar(45) DEFAULT NULL,
  `coms_certificate_3digit` varchar(45) DEFAULT NULL,
  `coms_certificate_id_base32` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coms_certificate_id`),
  KEY `coms_certificate_type_id_fk1_idx` (`coms_certificate_type_id`),
  CONSTRAINT `coms_certificate_type_id_fk1` FOREIGN KEY (`coms_certificate_type_id`) REFERENCES `coms_certificate_type` (`coms_certificate_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7932582 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_certificate_participant`
--

DROP TABLE IF EXISTS `coms_certificate_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_certificate_participant` (
  `coms_certificate_participant_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_certificate_participant_date` date DEFAULT NULL,
  `coms_certificate_participant_description` longtext,
  `coms_certificate_participant_id_md5` varchar(45) DEFAULT NULL,
  `coms_certificate_participant_3digit` varchar(45) DEFAULT NULL,
  `coms_certificate_participant_id_base32` varchar(45) DEFAULT NULL,
  `coms_certificate_id` bigint(20) DEFAULT NULL,
  `coms_participant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_certificate_participant_id`),
  KEY `fk_1_certificate_id_idx` (`coms_certificate_id`),
  CONSTRAINT `fk_1_certificate_id` FOREIGN KEY (`coms_certificate_id`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123692 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_certificate_type`
--

DROP TABLE IF EXISTS `coms_certificate_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_certificate_type` (
  `coms_certificate_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_certificate_type_description` longtext,
  PRIMARY KEY (`coms_certificate_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_delivery_type`
--

DROP TABLE IF EXISTS `coms_delivery_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_delivery_type` (
  `coms_delivery_type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_delivery_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coms_delivery_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam`
--

DROP TABLE IF EXISTS `coms_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam` (
  `coms_exam_id` bigint(20) NOT NULL,
  `coms_exam_name` longtext,
  `coms_exam_language_id` bigint(20) DEFAULT NULL,
  `coms_exam_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_exam_id`),
  KEY `coms_exam_language_id_fk1_idx` (`coms_exam_language_id`),
  CONSTRAINT `coms_exam_language_id_fk1` FOREIGN KEY (`coms_exam_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_event`
--

DROP TABLE IF EXISTS `coms_exam_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_event` (
  `coms_exam_event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_event_id_base32` varchar(45) DEFAULT NULL,
  `coms_exam_event_id_md5` varchar(45) DEFAULT NULL,
  `coms_exam_event_3digit` varchar(45) DEFAULT NULL,
  `coms_exam_event_name` longtext,
  `coms_exam_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `coms_exam_event_start_date` datetime DEFAULT NULL,
  `coms_exam_event_finish_date` datetime DEFAULT NULL,
  `coms_delivery_type_id` bigint(20) NOT NULL,
  `coms_exam_event_location` varchar(45) DEFAULT NULL,
  `coms_training_org_id` bigint(20) DEFAULT NULL,
  `coms_trainer_id` bigint(20) DEFAULT NULL,
  `coms_exam_event_percent` int(11) DEFAULT NULL,
  `coms_exam_event_info` longtext,
  `coms_proctor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_exam_event_id`),
  KEY `coms_exam_id_fk1_idx` (`coms_exam_id`),
  KEY `coms_delivery_type_id_fk1_idx` (`coms_delivery_type_id`),
  KEY `coms_training_org_id_fk1_idx` (`coms_training_org_id`),
  KEY `coms_trainer_id_fk2_idx` (`coms_trainer_id`),
  KEY `state_id_fk_57685_idx` (`state_id`),
  KEY `coms_proctor_id_fk1_idx` (`coms_proctor_id`),
  CONSTRAINT `coms_delivery_type_id_fk1` FOREIGN KEY (`coms_delivery_type_id`) REFERENCES `coms_delivery_type` (`coms_delivery_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_id_fk1` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_proctor_id_fk1` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_org_id_fk1` FOREIGN KEY (`coms_training_org_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=876047 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_training`
--

DROP TABLE IF EXISTS `coms_exam_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_training` (
  `coms_exam_training_id` bigint(20) NOT NULL,
  `coms_exam_id` bigint(20) NOT NULL,
  `coms_training_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_id`),
  KEY `coms_trainng_id_fk_2_idx` (`coms_training_id`),
  CONSTRAINT `coms_exam_id_fk_2` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainng_id_fk_2` FOREIGN KEY (`coms_training_id`) REFERENCES `coms_training` (`coms_training_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_version`
--

DROP TABLE IF EXISTS `coms_exam_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_version` (
  `coms_exam_version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_version_name` longtext,
  `coms_exam_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_exam_version_id`),
  KEY `coms_exam_id_fk_1_idx` (`coms_exam_id`),
  CONSTRAINT `coms_exam_id_fk_1` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6712467 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_language`
--

DROP TABLE IF EXISTS `coms_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_language` (
  `coms_language_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `language` varchar(45) DEFAULT NULL,
  `language_short` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`coms_language_id`),
  UNIQUE KEY `idcoms_language_UNIQUE` (`coms_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant`
--

DROP TABLE IF EXISTS `coms_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant` (
  `coms_participant_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_participant_gender` varchar(10) DEFAULT NULL,
  `coms_participant_lastname` varchar(60) DEFAULT NULL,
  `coms_participant_firstname` varchar(60) DEFAULT NULL,
  `coms_participant_public` tinyint(4) DEFAULT '0',
  `coms_participant_placeofbirth` varchar(60) DEFAULT NULL,
  `coms_participant_birthcountry` varchar(60) DEFAULT NULL,
  `coms_participant_dateofbirth` date DEFAULT NULL,
  `coms_participant_LIAM_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`coms_participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112970 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant_email`
--

DROP TABLE IF EXISTS `coms_participant_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant_email` (
  `coms_participant_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_participant_emailadresss` varchar(70) DEFAULT NULL,
  `coms_participant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_participant_email_id`),
  KEY `coms_participant_id_fk_2_idx` (`coms_participant_id`),
  CONSTRAINT `coms_participant_id_fk_2` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=875703 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant_exam_event`
--

DROP TABLE IF EXISTS `coms_participant_exam_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant_exam_event` (
  `coms_participant_exam_event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_participant_id` bigint(20) NOT NULL,
  `coms_exam_event_id` bigint(20) NOT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `coms_participant_exam_event_percent` float DEFAULT NULL,
  `coms_participant_info` longtext,
  PRIMARY KEY (`coms_participant_exam_event_id`),
  KEY `coms_participant_id_fk_3_idx` (`coms_participant_id`),
  KEY `coms_exam_event_id_fk_1_idx` (`coms_exam_event_id`),
  KEY `statd_id_76890876567_idx` (`state_id`),
  CONSTRAINT `coms_exam_event_id_fk_1` FOREIGN KEY (`coms_exam_event_id`) REFERENCES `coms_exam_event` (`coms_exam_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_participant_id_fk_3` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_43567890765` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant_identifier`
--

DROP TABLE IF EXISTS `coms_participant_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant_identifier` (
  `coms_participant_identifier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_participant_id` bigint(20) NOT NULL,
  `coms_participant_matriculation` int(255) NOT NULL,
  `coms_participant_md5` varchar(255) DEFAULT NULL,
  `coms_participant_base32` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`coms_participant_identifier_id`),
  UNIQUE KEY `coms_participant_identifier_id_UNIQUE` (`coms_participant_identifier_id`),
  KEY `coms_participant_id_fk_1_idx` (`coms_participant_id`),
  CONSTRAINT `coms_participant_id_fk_1` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2037230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant_training_event`
--

DROP TABLE IF EXISTS `coms_participant_training_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant_training_event` (
  `coms_participant_training_event_id` bigint(20) NOT NULL,
  `coms_participant_id` bigint(20) NOT NULL,
  `coms_training_event_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_training_event_id`),
  KEY `coms_participant_id_fk_4_idx` (`coms_participant_id`),
  KEY `coms_training_event_id_fk_1_idx` (`coms_training_event_id`),
  CONSTRAINT `coms_participant_id_fk_4` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_event_id_fk_1` FOREIGN KEY (`coms_training_event_id`) REFERENCES `coms_training_event` (`coms_training_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_proctor`
--

DROP TABLE IF EXISTS `coms_proctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_proctor` (
  `coms_proctor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_proctor_firstname` mediumtext,
  `coms_proctor_lastname` mediumtext,
  `coms_proctor_id_base32` varchar(45) DEFAULT NULL,
  `coms_proctor_id_md5` varchar(45) DEFAULT NULL,
  `coms_proctor_3digit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coms_proctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26539816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_proctor_email`
--

DROP TABLE IF EXISTS `coms_proctor_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_proctor_email` (
  `coms_proctor_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_proctor_emailadresss` varchar(70) DEFAULT NULL,
  `coms_proctor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_proctor_email_id`),
  KEY `coms_proctor_id_fk_1_idx` (`coms_proctor_id`),
  CONSTRAINT `coms_proctor_id_fk_1` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_role`
--

DROP TABLE IF EXISTS `coms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_role` (
  `coms_role_id` bigint(20) NOT NULL,
  `role_name` longtext,
  PRIMARY KEY (`coms_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_role_liamuser`
--

DROP TABLE IF EXISTS `coms_role_liamuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_role_liamuser` (
  `coms_role_LIAMUSER_id` bigint(20) NOT NULL,
  `coms_role_id` bigint(20) DEFAULT NULL,
  `coms_LIAMUSER_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_role_LIAMUSER_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_trainer`
--

DROP TABLE IF EXISTS `coms_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_trainer` (
  `coms_trainer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainer_firstname` mediumtext,
  `coms_trainer_lastname` mediumtext,
  `coms_trainer_id_base32` varchar(45) DEFAULT NULL,
  `coms_trainer_id_md5` varchar(45) DEFAULT NULL,
  `coms_trainer_3digit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coms_trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17239816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_trainer_email`
--

DROP TABLE IF EXISTS `coms_trainer_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_trainer_email` (
  `coms_trainer_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainer_emailadresss` varchar(70) DEFAULT NULL,
  `coms_trainer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_trainer_email_id`),
  KEY `coms_trainer_id_fk_1_idx` (`coms_trainer_id`),
  CONSTRAINT `coms_trainer_id_fk_1` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=720 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_trainer_exam`
--

DROP TABLE IF EXISTS `coms_trainer_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_trainer_exam` (
  `coms_trainer_exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainer_id` bigint(20) NOT NULL,
  `coms_exam_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_trainer_exam_id`),
  KEY `coms_trainer_id_fk_2_idx` (`coms_trainer_id`),
  KEY `coms_exam_id_fk_2_idx` (`coms_exam_id`),
  CONSTRAINT `coms_exam_id_fk_3` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk_4` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3924853 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training`
--

DROP TABLE IF EXISTS `coms_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training` (
  `coms_training_id` bigint(20) NOT NULL,
  `coms_training_name` longtext,
  PRIMARY KEY (`coms_training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_event`
--

DROP TABLE IF EXISTS `coms_training_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_event` (
  `coms_training_event_id` bigint(20) NOT NULL,
  `coms_training_event_name` longtext,
  `coms_training_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_training_event_id`),
  KEY `coms_training_id_fk1_idx` (`coms_training_id`),
  CONSTRAINT `coms_training_id_fk1` FOREIGN KEY (`coms_training_id`) REFERENCES `coms_training` (`coms_training_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation`
--

DROP TABLE IF EXISTS `coms_training_organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation` (
  `coms_training_organisation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_training_organisation_name` longtext,
  `coms_training_organisation_short_namel` varchar(45) DEFAULT NULL,
  `coms_training_organisation_id_base32` varchar(45) DEFAULT NULL,
  `coms_training_organisation_3digit` varchar(45) DEFAULT NULL,
  `coms_training_organisation_id_md5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`coms_training_organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=773539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation_exam_event`
--

DROP TABLE IF EXISTS `coms_training_organisation_exam_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation_exam_event` (
  `coms_training_organisation_exam_event_id` bigint(20) NOT NULL,
  `coms_training_organisation_id` bigint(20) NOT NULL,
  `coms_exam_event_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_exam_event_id`),
  KEY `coms_exam_event_id_fk_2_idx` (`coms_exam_event_id`),
  KEY `coms_training_organisationt_id_fk_1_idx` (`coms_training_organisation_id`),
  CONSTRAINT `coms_exam_event_id_fk_2` FOREIGN KEY (`coms_exam_event_id`) REFERENCES `coms_exam_event` (`coms_exam_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisationt_id_fk_1` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation_proctor`
--

DROP TABLE IF EXISTS `coms_training_organisation_proctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation_proctor` (
  `coms_training_organisation_proctor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_training_organisation_id` bigint(20) NOT NULL,
  `coms_proctor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_proctor_id`),
  KEY `coms_training_organisation_fk_13_idx` (`coms_training_organisation_id`),
  KEY `coms_proctor_fk_3_idx` (`coms_proctor_id`),
  CONSTRAINT `coms_proctor_fk_3` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_fk_13` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation_trainer`
--

DROP TABLE IF EXISTS `coms_training_organisation_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation_trainer` (
  `coms_training_organisation_trainer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_training_organisation_id` bigint(20) NOT NULL,
  `coms_trainer_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_trainer_id`),
  KEY `coms_trainer_id_fk_1_idx` (`coms_trainer_id`),
  KEY `coms_training_organisationt_id_fk_2_idx` (`coms_training_organisation_id`),
  CONSTRAINT `coms_trainer_id_fk_2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_id_fk_3` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation_training_event`
--

DROP TABLE IF EXISTS `coms_training_organisation_training_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation_training_event` (
  `coms_training_organisation_training_event_id` bigint(20) NOT NULL,
  `coms_training_organisation_id` bigint(20) NOT NULL,
  `coms_training_event_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_training_event_id`),
  KEY `coms_training_organisation_id_idx` (`coms_training_organisation_id`),
  KEY `coms_training_event_id_fk5_idx` (`coms_training_event_id`),
  CONSTRAINT `coms_training_event_id_fk5` FOREIGN KEY (`coms_training_event_id`) REFERENCES `coms_training_event` (`coms_training_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_id_fk5` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_trainingsorganisation_exam`
--

DROP TABLE IF EXISTS `coms_trainingsorganisation_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_trainingsorganisation_exam` (
  `coms_trainingsorganisation_exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainingsorganisation_id` bigint(20) NOT NULL,
  `coms_exam_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_trainingsorganisation_exam_id`),
  KEY `coms_trainingsorganisation_id_fk_11_idx` (`coms_trainingsorganisation_id`),
  KEY `coms_exam_id_fk_12_idx` (`coms_exam_id`),
  CONSTRAINT `coms_exam_id_fk_12` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainingsorganisation_id_fk_11` FOREIGN KEY (`coms_trainingsorganisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5929853 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `form_data` longtext,
  `tablename` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_rules`
--

DROP TABLE IF EXISTS `state_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_rules` (
  `state_rules_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state_id_FROM` bigint(20) NOT NULL,
  `state_id_TO` bigint(20) NOT NULL,
  `transition_script` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_certificate_participant`
--

DROP TABLE IF EXISTS `v_certificate_participant`;
/*!50001 DROP VIEW IF EXISTS `v_certificate_participant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_certificate_participant` AS SELECT 
 1 AS `coms_certificate_participant_id`,
 1 AS `coms_certificate_participant_date`,
 1 AS `coms_certificate_participant_id_base32`,
 1 AS `coms_certificate_id`,
 1 AS `coms_certificate_name`,
 1 AS `coms_certificate_description`,
 1 AS `coms_participant_id`,
 1 AS `coms_participant_base32`,
 1 AS `coms_participant_matriculation`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_firstname`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_participant__Exam_Event`
--

DROP TABLE IF EXISTS `v_coms_participant__Exam_Event`;
/*!50001 DROP VIEW IF EXISTS `v_coms_participant__Exam_Event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_participant__Exam_Event` AS SELECT 
 1 AS `coms_exam_event_id`,
 1 AS `coms_exam_event_name`,
 1 AS `event_state_id`,
 1 AS `event state name`,
 1 AS `coms_exam_event_start_date`,
 1 AS `coms_exam_event_finish_date`,
 1 AS `coms_exam_event_location`,
 1 AS `coms_exam_id`,
 1 AS `coms_delivery_type_id`,
 1 AS `coms_delivery_description`,
 1 AS `coms_training_org_id`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_trainer_id`,
 1 AS `coms_trainer_lastname`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_participant_id`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_firstname`,
 1 AS `participant_state`,
 1 AS `participant state name`,
 1 AS `coms_participant_public`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_LIAM_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_participant__id__email`
--

DROP TABLE IF EXISTS `v_coms_participant__id__email`;
/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_participant__id__email` AS SELECT 
 1 AS `coms_participant_id`,
 1 AS `coms_participant_matriculation`,
 1 AS `coms_participant_md5`,
 1 AS `coms_participant_base32`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_firstname`,
 1 AS `coms_participant_public`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_LIAM_id`,
 1 AS `coms_participant_emailadresss`,
 1 AS `url_form_participant`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_participant__id__email_MOODLE`
--

DROP TABLE IF EXISTS `v_coms_participant__id__email_MOODLE`;
/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email_MOODLE`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_participant__id__email_MOODLE` AS SELECT 
 1 AS `username`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `idnumber`,
 1 AS `password`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_trainer__exam`
--

DROP TABLE IF EXISTS `v_coms_trainer__exam`;
/*!50001 DROP VIEW IF EXISTS `v_coms_trainer__exam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_trainer__exam` AS SELECT 
 1 AS `coms_trainer_id_base32`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_trainer_lastname`,
 1 AS `coms_exam_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_trainer_exam_org`
--

DROP TABLE IF EXISTS `v_coms_trainer_exam_org`;
/*!50001 DROP VIEW IF EXISTS `v_coms_trainer_exam_org`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_trainer_exam_org` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_training_organisation_id_md5`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_trainer_id`,
 1 AS `coms_trainer_id_base32`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_trainer_lastname`,
 1 AS `coms_exam_id`,
 1 AS `coms_exam_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dot__state_rules__State`
--

DROP TABLE IF EXISTS `v_dot__state_rules__State`;
/*!50001 DROP VIEW IF EXISTS `v_dot__state_rules__State`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dot__state_rules__State` AS SELECT 
 1 AS `concat("\"", S1.name, "\" -> \"" , S2.name, "\"")`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_exam_event__exam__trainingorg__trainer`
--

DROP TABLE IF EXISTS `v_exam_event__exam__trainingorg__trainer`;
/*!50001 DROP VIEW IF EXISTS `v_exam_event__exam__trainingorg__trainer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_exam_event__exam__trainingorg__trainer` AS SELECT 
 1 AS `coms_exam_event_id`,
 1 AS `coms_exam_event_name`,
 1 AS `coms_exam_id`,
 1 AS `coms_exam_event_id_md5`,
 1 AS `coms_exam_event_3digit`,
 1 AS `coms_exam_event_id_base32`,
 1 AS `coms_exam_name`,
 1 AS `exam_language`,
 1 AS `event_state_id`,
 1 AS `event_state_name`,
 1 AS `coms_exam_event_start_date`,
 1 AS `coms_exam_event_finish_date`,
 1 AS `coms_delivery_type_id`,
 1 AS `coms_delivery_description`,
 1 AS `coms_exam_event_location`,
 1 AS `coms_training_org_id`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_trainer_id`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_trainer_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bpmspace_coms_v2'
--

--
-- Dumping routines for database 'bpmspace_coms_v2'
--

--
-- Final view structure for view `v_certificate_participant`
--

/*!50001 DROP VIEW IF EXISTS `v_certificate_participant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_certificate_participant` AS select distinct `CePa`.`coms_certificate_participant_id` AS `coms_certificate_participant_id`,`CePa`.`coms_certificate_participant_date` AS `coms_certificate_participant_date`,`CePa`.`coms_certificate_participant_id_base32` AS `coms_certificate_participant_id_base32`,`CePa`.`coms_certificate_id` AS `coms_certificate_id`,`Ce`.`coms_certificate_name` AS `coms_certificate_name`,`Ce`.`coms_certificate_description` AS `coms_certificate_description`,`Pa`.`coms_participant_id` AS `coms_participant_id`,`PaId`.`coms_participant_base32` AS `coms_participant_base32`,`PaId`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`Pa`.`coms_participant_gender` AS `coms_participant_gender`,`Pa`.`coms_participant_firstname` AS `coms_participant_firstname`,`Pa`.`coms_participant_lastname` AS `coms_participant_lastname`,`Pa`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`Pa`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`Pa`.`coms_participant_birthcountry` AS `coms_participant_birthcountry` from (((`coms_certificate` `Ce` join `coms_certificate_participant` `CePa`) join `coms_participant` `Pa`) join `coms_participant_identifier` `PaId`) where ((`Ce`.`coms_certificate_id` = `CePa`.`coms_certificate_id`) and (`CePa`.`coms_participant_id` = `Pa`.`coms_participant_id`) and (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`) and (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_participant__Exam_Event`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_participant__Exam_Event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_participant__Exam_Event` AS select distinct `EE`.`coms_exam_event_id` AS `coms_exam_event_id`,`EE`.`coms_exam_event_name` AS `coms_exam_event_name`,`EE`.`state_id` AS `event_state_id`,`ST2`.`name` AS `event state name`,`EE`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`EE`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`EE`.`coms_exam_event_location` AS `coms_exam_event_location`,`EE`.`coms_exam_id` AS `coms_exam_id`,`EE`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`DT`.`coms_delivery_description` AS `coms_delivery_description`,`EE`.`coms_training_org_id` AS `coms_training_org_id`,`TRO`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`EE`.`coms_trainer_id` AS `coms_trainer_id`,`TR`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`TR`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`P`.`coms_participant_id` AS `coms_participant_id`,`P`.`coms_participant_gender` AS `coms_participant_gender`,`P`.`coms_participant_lastname` AS `coms_participant_lastname`,`P`.`coms_participant_firstname` AS `coms_participant_firstname`,`PEE`.`state_id` AS `participant_state`,`ST1`.`name` AS `participant state name`,`P`.`coms_participant_public` AS `coms_participant_public`,`P`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`P`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`P`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id` from (((((((`coms_participant` `P` join `coms_participant_exam_event` `PEE`) join `coms_exam_event` `EE`) join `state` `ST1`) join `state` `ST2`) join `coms_delivery_type` `DT`) join `coms_training_organisation` `TRO`) join `coms_trainer` `TR`) where ((`P`.`coms_participant_id` = `PEE`.`coms_participant_id`) and (`PEE`.`coms_exam_event_id` = `EE`.`coms_exam_event_id`) and (`ST1`.`state_id` = `PEE`.`state_id`) and (`ST2`.`state_id` = `EE`.`state_id`) and (`DT`.`coms_delivery_type_id` = `EE`.`coms_delivery_type_id`) and (`TRO`.`coms_training_organisation_id` = `EE`.`coms_training_org_id`) and (`TR`.`coms_trainer_id` = `EE`.`coms_trainer_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_participant__id__email`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_participant__id__email` AS select `coms_participant`.`coms_participant_id` AS `coms_participant_id`,`coms_participant_identifier`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`coms_participant_identifier`.`coms_participant_md5` AS `coms_participant_md5`,`coms_participant_identifier`.`coms_participant_base32` AS `coms_participant_base32`,`coms_participant`.`coms_participant_gender` AS `coms_participant_gender`,`coms_participant`.`coms_participant_lastname` AS `coms_participant_lastname`,`coms_participant`.`coms_participant_firstname` AS `coms_participant_firstname`,`coms_participant`.`coms_participant_public` AS `coms_participant_public`,`coms_participant`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`coms_participant`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`coms_participant`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`coms_participant`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,`coms_participant_email`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,concat('https://ico-cert.org/de/formular-teilnehmer/',`coms_participant_identifier`.`coms_participant_md5`,'/',`coms_participant_identifier`.`coms_participant_id`) AS `url_form_participant` from ((`coms_participant` join `coms_participant_identifier` on((`coms_participant`.`coms_participant_id` = `coms_participant_identifier`.`coms_participant_id`))) join `coms_participant_email` on((`coms_participant`.`coms_participant_id` = `coms_participant_email`.`coms_participant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_participant__id__email_MOODLE`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email_MOODLE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_participant__id__email_MOODLE` AS select `coms_participant_email`.`coms_participant_emailadresss` AS `username`,`coms_participant`.`coms_participant_firstname` AS `firstname`,`coms_participant`.`coms_participant_lastname` AS `lastname`,`coms_participant_email`.`coms_participant_emailadresss` AS `email`,`coms_participant_identifier`.`coms_participant_matriculation` AS `idnumber`,`coms_participant_identifier`.`coms_participant_base32` AS `password` from ((`coms_participant` join `coms_participant_identifier` on((`coms_participant`.`coms_participant_id` = `coms_participant_identifier`.`coms_participant_id`))) join `coms_participant_email` on((`coms_participant`.`coms_participant_id` = `coms_participant_email`.`coms_participant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_trainer__exam`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_trainer__exam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_trainer__exam` AS select `trainer`.`coms_trainer_id_base32` AS `coms_trainer_id_base32`,`trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`exam`.`coms_exam_name` AS `coms_exam_name` from ((`coms_trainer` `trainer` join `coms_trainer_exam` `trainer_exam`) join `coms_exam` `exam`) where ((`trainer`.`coms_trainer_id` = `trainer_exam`.`coms_trainer_id`) and (`trainer_exam`.`coms_exam_id` = `exam`.`coms_exam_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_trainer_exam_org`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_trainer_exam_org`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_trainer_exam_org` AS select `training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`training_organisation`.`coms_training_organisation_id_md5` AS `coms_training_organisation_id_md5`,`training_organisation`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`trainer`.`coms_trainer_id` AS `coms_trainer_id`,`trainer`.`coms_trainer_id_base32` AS `coms_trainer_id_base32`,`trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`exam`.`coms_exam_id` AS `coms_exam_id`,`exam`.`coms_exam_name` AS `coms_exam_name` from ((((`coms_trainer` `trainer` join `coms_trainer_exam` `trainer_exam`) join `coms_exam` `exam`) join `coms_training_organisation_trainer` `training_organisation_trainer`) join `coms_training_organisation` `training_organisation`) where ((`trainer`.`coms_trainer_id` = `trainer_exam`.`coms_trainer_id`) and (`trainer_exam`.`coms_exam_id` = `exam`.`coms_exam_id`) and (`trainer`.`coms_trainer_id` = `training_organisation_trainer`.`coms_trainer_id`) and (`training_organisation`.`coms_training_organisation_id` = `training_organisation_trainer`.`coms_training_organisation_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dot__state_rules__State`
--

/*!50001 DROP VIEW IF EXISTS `v_dot__state_rules__State`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dot__state_rules__State` AS select concat('"',`S1`.`name`,' (',`S1`.`state_id`,')','" -> "',`S2`.`name`,' (',`S2`.`state_id`,')','"') AS `concat("\"", S1.name, "\" -> \"" , S2.name, "\"")` from ((`state_rules` `SR` join `state` `S1`) join `state` `S2`) where ((`SR`.`state_id_FROM` = `S1`.`state_id`) and (`SR`.`state_id_TO` = `S2`.`state_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_exam_event__exam__trainingorg__trainer`
--

/*!50001 DROP VIEW IF EXISTS `v_exam_event__exam__trainingorg__trainer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_exam_event__exam__trainingorg__trainer` AS select `ExEv`.`coms_exam_event_id` AS `coms_exam_event_id`,`ExEv`.`coms_exam_event_name` AS `coms_exam_event_name`,`ExEv`.`coms_exam_id` AS `coms_exam_id`,`ExEv`.`coms_exam_event_id_md5` AS `coms_exam_event_id_md5`,`ExEv`.`coms_exam_event_3digit` AS `coms_exam_event_3digit`,`ExEv`.`coms_exam_event_id_base32` AS `coms_exam_event_id_base32`,`Ex`.`coms_exam_name` AS `coms_exam_name`,`Lg`.`language` AS `exam_language`,`ExEv`.`state_id` AS `event_state_id`,`state`.`name` AS `event_state_name`,`ExEv`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`ExEv`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`ExEv`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`DeTy`.`coms_delivery_description` AS `coms_delivery_description`,`ExEv`.`coms_exam_event_location` AS `coms_exam_event_location`,`ExEv`.`coms_training_org_id` AS `coms_training_org_id`,`TrOr`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`ExEv`.`coms_trainer_id` AS `coms_trainer_id`,`Tr`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`Tr`.`coms_trainer_lastname` AS `coms_trainer_lastname` from ((((((`coms_exam_event` `ExEv` join `coms_exam` `Ex`) join `state`) join `coms_delivery_type` `DeTy`) join `coms_training_organisation` `TrOr`) join `coms_trainer` `Tr`) join `coms_language` `Lg`) where ((`ExEv`.`coms_exam_id` = `Ex`.`coms_exam_id`) and (`ExEv`.`state_id` = `state`.`state_id`) and (`ExEv`.`coms_delivery_type_id` = `DeTy`.`coms_delivery_type_id`) and (`ExEv`.`coms_training_org_id` = `TrOr`.`coms_training_organisation_id`) and (`ExEv`.`coms_trainer_id` = `Tr`.`coms_trainer_id`) and (`Ex`.`coms_exam_language_id` = `Lg`.`coms_language_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-04 15:35:55
