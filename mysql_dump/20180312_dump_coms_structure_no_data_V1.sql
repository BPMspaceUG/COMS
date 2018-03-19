CREATE DATABASE  IF NOT EXISTS `bpmspace_coms_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bpmspace_coms_v1`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bpmspace_coms_v1
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `coms_cert_cert`
--

DROP TABLE IF EXISTS `coms_cert_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_cert_cert` (
  `coms_cert_cert_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_cert_id_1` bigint(20) NOT NULL,
  `coms_cert_id_2` bigint(20) NOT NULL,
  `coms_cert_cert_info` text,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_cert_cert_id`),
  KEY `state_id_idx` (`state_id`),
  KEY `coms_cert_id_1_fk_5462531_idx` (`coms_cert_id_1`),
  KEY `coms_cert_id_2_fk_983456_idx` (`coms_cert_id_2`),
  CONSTRAINT `coms_cert_id_1_fk_5462531` FOREIGN KEY (`coms_cert_id_1`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_cert_id_2_fk_983456` FOREIGN KEY (`coms_cert_id_2`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_7325427` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_certificate`
--

DROP TABLE IF EXISTS `coms_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_certificate` (
  `coms_certificate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_certificate_type_id` bigint(20) DEFAULT NULL,
  `coms_certificate_name` longtext NOT NULL,
  `coms_certificate_description` longtext,
  `coms_certificate_id_md5` varchar(45) DEFAULT NULL,
  `coms_certificate_3digit` varchar(45) DEFAULT NULL,
  `coms_certificate_id_base32` varchar(45) DEFAULT NULL,
  `coms_certificate_intro` longtext,
  `coms_certificate_valid_months` int(11) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_certificate_id`),
  KEY `coms_certificate_type_id_fk1_idx` (`coms_certificate_type_id`),
  KEY `state_id_fk01` (`state_id`),
  CONSTRAINT `coms_certificate_type_id_fk1` FOREIGN KEY (`coms_certificate_type_id`) REFERENCES `coms_certificate_type` (`coms_certificate_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk01` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7932628 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_certificate_participant`
--

DROP TABLE IF EXISTS `coms_certificate_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_certificate_participant` (
  `coms_certificate_participant_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_certificate_id` bigint(20) DEFAULT NULL,
  `coms_participant_id` bigint(20) DEFAULT NULL,
  `coms_certificate_participant_date` date DEFAULT NULL,
  `coms_certificate_participant_description` longtext,
  `coms_certificate_participant_id_md5` varchar(45) DEFAULT NULL,
  `coms_certificate_participant_3digit` varchar(45) DEFAULT NULL,
  `coms_certificate_participant_id_base32` varchar(45) DEFAULT NULL,
  `coms_certificate` varchar(100) DEFAULT NULL,
  `coms_certificate_participant_expiration_date` date DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_certificate_participant_id`),
  KEY `fk_1_certificate_id_idx` (`coms_certificate_id`),
  KEY `fk_2_coms_participant_id_idx` (`coms_participant_id`),
  KEY `state_id_fk06` (`state_id`),
  CONSTRAINT `fk_1_certificate_id` FOREIGN KEY (`coms_certificate_id`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_2_coms_participant_id` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk06` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124392 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_certificate_type_id`),
  KEY `state_id_fk_56389_idx` (`state_id`),
  CONSTRAINT `state_id_fk_56389` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_delivery_type_id`),
  KEY `state_id_idx` (`state_id`),
  CONSTRAINT `state_id_fk_osdifzh439` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam`
--

DROP TABLE IF EXISTS `coms_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam` (
  `coms_exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_language_id` bigint(20) DEFAULT NULL,
  `coms_exam_type_id` bigint(20) DEFAULT NULL,
  `coms_exam_name` longtext,
  `coms_exam_description` longtext,
  `coms_exam_max_points` int(11) DEFAULT NULL,
  `coms_exam_pass_mark` int(11) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_id`),
  KEY `coms_exam_language_id_fk1_idx` (`coms_exam_language_id`),
  KEY `coms_exam_type_id_fk_8346_idx` (`coms_exam_type_id`),
  KEY `state_id_fk_93473` (`state_id`),
  CONSTRAINT `coms_exam_language_id_fk1` FOREIGN KEY (`coms_exam_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_type_id_fk_8346` FOREIGN KEY (`coms_exam_type_id`) REFERENCES `coms_delivery_type` (`coms_delivery_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_93473` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=157321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_cert`
--

DROP TABLE IF EXISTS `coms_exam_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_cert` (
  `coms_exam_cert_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_id` bigint(20) NOT NULL,
  `coms_cert_id` bigint(20) NOT NULL,
  `coms_exam_cert_info` text NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_cert_id`),
  KEY `state_id_fk_19325_idx` (`state_id`),
  KEY `coms_exam_id_fk_85565_idx` (`coms_exam_id`),
  KEY `coms_cert_id_fk_726359_idx` (`coms_cert_id`),
  CONSTRAINT `coms_cert_id_fk_726359` FOREIGN KEY (`coms_cert_id`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_id_fk_85565` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_19325` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_exam_id` bigint(20) NOT NULL,
  `coms_delivery_type_id` bigint(20) NOT NULL,
  `coms_proctor_id` bigint(20) DEFAULT NULL,
  `coms_training_org_id` bigint(20) DEFAULT NULL,
  `coms_trainer_id` bigint(20) DEFAULT NULL,
  `coms_exam_version_id` bigint(20) DEFAULT NULL,
  `coms_exam_event_id_base32` varchar(45) DEFAULT NULL,
  `coms_exam_event_id_md5` varchar(45) DEFAULT NULL,
  `coms_exam_event_3digit` varchar(45) DEFAULT NULL,
  `coms_exam_event_name` longtext,
  `coms_exam_event_start_date` datetime DEFAULT NULL,
  `coms_exam_event_finish_date` datetime DEFAULT NULL,
  `coms_exam_event_location` varchar(256) DEFAULT NULL,
  `coms_exam_event_percent` int(11) DEFAULT NULL,
  `coms_exam_event_info` longtext,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_event_id`),
  KEY `coms_exam_id_fk1_idx` (`coms_exam_id`),
  KEY `coms_delivery_type_id_fk1_idx` (`coms_delivery_type_id`),
  KEY `coms_training_org_id_fk1_idx` (`coms_training_org_id`),
  KEY `coms_trainer_id_fk2_idx` (`coms_trainer_id`),
  KEY `coms_proctor_id_fk1_idx` (`coms_proctor_id`),
  KEY `state_id_fk_474745_idx` (`state_id`),
  KEY `coms_exam_version_id_fk_24324_idx` (`coms_exam_version_id`),
  CONSTRAINT `coms_delivery_type_id_fk1` FOREIGN KEY (`coms_delivery_type_id`) REFERENCES `coms_delivery_type` (`coms_delivery_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_id_fk1` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_proctor_id_fk1` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_org_id_fk1` FOREIGN KEY (`coms_training_org_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_474745` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=876144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_exam`
--

DROP TABLE IF EXISTS `coms_exam_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_exam` (
  `coms_exam_exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_id_1` bigint(20) NOT NULL,
  `coms_exam_id_2` bigint(20) NOT NULL,
  `coms_exam_exam_info` text NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_exam_id`),
  KEY `state_id_fk_843645_idx` (`state_id`),
  KEY `coms_exam_id_1_fk_35674_idx` (`coms_exam_id_1`),
  KEY `coms_exam_id_2_fk_23674_idx` (`coms_exam_id_2`),
  CONSTRAINT `coms_exam_id_1_fk_35674` FOREIGN KEY (`coms_exam_id_1`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_id_2_fk_23674` FOREIGN KEY (`coms_exam_id_2`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_843645` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_exam_training`
--

DROP TABLE IF EXISTS `coms_exam_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_exam_training` (
  `coms_exam_training_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_exam_id` bigint(20) NOT NULL,
  `coms_training_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_training_id`),
  UNIQUE KEY `coms_exam_training_id_UNIQUE` (`coms_exam_training_id`),
  KEY `coms_trainng_id_fk_2_idx` (`coms_training_id`),
  KEY `coms_exam_id_fk_2_idx` (`coms_exam_id`),
  KEY `state_id_fk_12946_idx` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_2` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainng_id_fk_2` FOREIGN KEY (`coms_training_id`) REFERENCES `coms_training` (`coms_training_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_12946` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_exam_id` bigint(20) DEFAULT NULL,
  `coms_exam_version_name` longtext,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_exam_version_id`),
  KEY `coms_exam_id_fk_1_idx` (`coms_exam_id`),
  KEY `state_id_fk_556934_idx` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_1` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_556934` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_language_id`),
  UNIQUE KEY `idcoms_language_UNIQUE` (`coms_language_id`),
  KEY `state_id_fk_873456_idx` (`state_id`),
  CONSTRAINT `state_id_fk_873456` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_participant_LIAM_id` bigint(20) NOT NULL DEFAULT '0',
  `coms_participant_language_id` bigint(20) DEFAULT NULL,
  `coms_participant_gender` varchar(10) DEFAULT NULL,
  `coms_participant_lastname` varchar(60) DEFAULT NULL,
  `coms_participant_firstname` varchar(60) DEFAULT NULL,
  `coms_participant_public` tinyint(4) DEFAULT '0',
  `coms_participant_placeofbirth` varchar(60) DEFAULT NULL,
  `coms_participant_birthcountry` varchar(60) DEFAULT NULL,
  `coms_participant_dateofbirth` date DEFAULT NULL,
  `coms_participant_EXTERNAL_id` varchar(265) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_id`),
  KEY `state_id_fk_48991_idx` (`state_id`),
  KEY `coms_participant_language_id_fk_67576_idx` (`coms_participant_language_id`),
  CONSTRAINT `coms_participant_lang_id_fk_62` FOREIGN KEY (`coms_participant_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_7236547` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113512 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_participant_email`
--

DROP TABLE IF EXISTS `coms_participant_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_participant_email` (
  `coms_participant_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_participant_id` bigint(20) DEFAULT NULL,
  `coms_participant_emailadresss` varchar(70) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_email_id`),
  KEY `coms_participant_id_fk_2_idx` (`coms_participant_id`),
  KEY `state_id_fk_32678_idx` (`state_id`),
  CONSTRAINT `coms_participant_id_fk_2` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_58357` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=876243 DEFAULT CHARSET=utf8;
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
  `coms_participant_exam_event_percent` float DEFAULT NULL,
  `coms_participant_info` longtext,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_exam_event_id`),
  KEY `coms_participant_id_fk_3_idx` (`coms_participant_id`),
  KEY `coms_exam_event_id_fk_1_idx` (`coms_exam_event_id`),
  KEY `statd_id_76890876567_idx` (`state_id`),
  CONSTRAINT `coms_exam_event_id_fk_1` FOREIGN KEY (`coms_exam_event_id`) REFERENCES `coms_exam_event` (`coms_exam_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_participant_id_fk_3` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_43567890765` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_identifier_id`),
  UNIQUE KEY `coms_participant_identifier_id_UNIQUE` (`coms_participant_identifier_id`),
  KEY `coms_participant_id_fk_1_idx` (`coms_participant_id`),
  KEY `state_id_fk_93684_idx` (`state_id`),
  CONSTRAINT `coms_participant_id_fk_1` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_375568` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2037770 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_participant_training_event_id`),
  KEY `coms_participant_id_fk_4_idx` (`coms_participant_id`),
  KEY `coms_training_event_id_fk_1_idx` (`coms_training_event_id`),
  KEY `state_id_fk_498165_idx` (`state_id`),
  CONSTRAINT `coms_participant_id_fk_4` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_event_id_fk_1` FOREIGN KEY (`coms_training_event_id`) REFERENCES `coms_training_event` (`coms_training_event_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_498165` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_proctor_language_id` bigint(20) DEFAULT NULL,
  `coms_proctor_LIAM_id` bigint(20) DEFAULT NULL,
  `coms_proctorcol` varchar(45) DEFAULT NULL,
  `coms_proctor_firstname` mediumtext,
  `coms_proctor_lastname` mediumtext,
  `coms_proctor_id_base32` varchar(45) DEFAULT NULL,
  `coms_proctor_id_md5` varchar(45) DEFAULT NULL,
  `coms_proctor_3digit` varchar(45) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_proctor_id`),
  KEY `state_id_fk05` (`state_id`),
  KEY `coms_proctor_language_id_fk_25364_idx` (`coms_proctor_language_id`),
  CONSTRAINT `coms_proctor_language_id_fk_25364` FOREIGN KEY (`coms_proctor_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk05` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26539849 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_proctor_email`
--

DROP TABLE IF EXISTS `coms_proctor_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_proctor_email` (
  `coms_proctor_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_proctor_id` bigint(20) DEFAULT NULL,
  `coms_proctor_emailadresss` varchar(70) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_proctor_email_id`),
  KEY `coms_proctor_id_fk_1_idx` (`coms_proctor_id`),
  KEY `state_id_fk_28995_idx` (`state_id`),
  CONSTRAINT `coms_proctor_id_fk_1` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_23423425235` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_role`
--

DROP TABLE IF EXISTS `coms_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_role` (
  `coms_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` longtext,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_role_id`),
  KEY `state_id_fk_84521_idx` (`state_id`),
  CONSTRAINT `state_id_fk_84521` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_role_liamuser`
--

DROP TABLE IF EXISTS `coms_role_liamuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_role_liamuser` (
  `coms_role_LIAMUSER_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_role_id` bigint(20) DEFAULT NULL,
  `coms_LIAMUSER_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_role_LIAMUSER_id`),
  KEY `state_id_fk_11496_idx` (`state_id`),
  KEY `coms_role_id_fk_387456_idx` (`coms_role_id`),
  CONSTRAINT `coms_role_id_fk_387456` FOREIGN KEY (`coms_role_id`) REFERENCES `coms_role` (`coms_role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_11496` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_trainer_language_id` bigint(20) DEFAULT NULL,
  `coms_trainer_LIAM_id` bigint(20) DEFAULT NULL,
  `coms_trainer_firstname` mediumtext,
  `coms_trainer_lastname` mediumtext,
  `coms_trainer_id_base32` varchar(45) DEFAULT NULL,
  `coms_trainer_id_md5` varchar(45) DEFAULT NULL,
  `coms_trainer_3digit` varchar(45) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT '40',
  PRIMARY KEY (`coms_trainer_id`),
  KEY `state_id_fk02` (`state_id`),
  KEY `coms_trainer_language_id_idx` (`coms_trainer_language_id`),
  CONSTRAINT `coms_trainer_language_id` FOREIGN KEY (`coms_trainer_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk02` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17239828 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_trainer_email`
--

DROP TABLE IF EXISTS `coms_trainer_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_trainer_email` (
  `coms_trainer_email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainer_id` bigint(20) DEFAULT NULL,
  `coms_trainer_emailadresss` varchar(70) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_trainer_email_id`),
  KEY `coms_trainer_id_fk_1_idx` (`coms_trainer_id`),
  KEY `state_id_fk_348674_idx` (`state_id`),
  CONSTRAINT `coms_trainer_id_fk_1` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_348674` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_trainer_exam_id`),
  KEY `coms_trainer_id_fk_2_idx` (`coms_trainer_id`),
  KEY `coms_exam_id_fk_2_idx` (`coms_exam_id`),
  KEY `state_id_fk03` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_3` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk_4` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk03` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3924882 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_id`),
  KEY `state_id_fk_idx` (`state_id`),
  CONSTRAINT `state_id_fk_234243` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_training_id` bigint(20) DEFAULT NULL,
  `coms_training_org_id` bigint(20) DEFAULT NULL,
  `coms_trainer_id` bigint(20) DEFAULT NULL,
  `coms_training_event_name` longtext,
  `coms_training_event_id_base32` varchar(45) DEFAULT NULL,
  `coms_training_event_id_md5` varchar(45) DEFAULT NULL,
  `coms_training_event_3digit` varchar(45) DEFAULT NULL,
  `coms_training_event_start_date` datetime DEFAULT NULL,
  `coms_training_event_finish_date` datetime DEFAULT NULL,
  `coms_training_event_location` varchar(256) DEFAULT NULL,
  `coms_training_event_info` longtext,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_event_id`),
  KEY `coms_training_id_fk1_idx` (`coms_training_id`),
  KEY `state_id_fk_489217_idx` (`state_id`),
  KEY `coms_training_org_id_fk_84763_idx` (`coms_training_org_id`),
  CONSTRAINT `coms_trainer_id_fk_45698` FOREIGN KEY (`coms_training_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_id_fk1` FOREIGN KEY (`coms_training_id`) REFERENCES `coms_training` (`coms_training_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_org_id_fk_84763` FOREIGN KEY (`coms_training_org_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_489217` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `coms_training_organisation_language_id` bigint(20) DEFAULT NULL,
  `coms_training_organisation_name` longtext,
  `coms_training_organisation_short_name` varchar(45) DEFAULT NULL,
  `coms_training_organisation_id_base32` varchar(45) DEFAULT NULL,
  `coms_training_organisation_3digit` varchar(45) DEFAULT NULL,
  `coms_training_organisation_id_md5` varchar(45) DEFAULT NULL,
  `coms_training_organisation_passwd_hash` varchar(512) DEFAULT NULL,
  `coms_training_organisation_email` varchar(100) DEFAULT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_id`),
  KEY `state_id_fk07` (`state_id`),
  KEY `coms_training_organisation_language_id_fk_8675_idx` (`coms_training_organisation_language_id`),
  CONSTRAINT `coms_training_organisation_language_id_fk_8675` FOREIGN KEY (`coms_training_organisation_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk07` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=773546 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coms_training_organisation_exam`
--

DROP TABLE IF EXISTS `coms_training_organisation_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coms_training_organisation_exam` (
  `coms_trainingsorganisation_exam_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coms_trainingsorganisation_id` bigint(20) NOT NULL,
  `coms_exam_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_trainingsorganisation_exam_id`),
  KEY `coms_trainingsorganisation_id_fk_11_idx` (`coms_trainingsorganisation_id`),
  KEY `coms_exam_id_fk_12_idx` (`coms_exam_id`),
  KEY `state_id_fk08` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_12` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainingsorganisation_id_fk_11` FOREIGN KEY (`coms_trainingsorganisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk08` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5929938 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_proctor_id`),
  KEY `coms_training_organisation_fk_13_idx` (`coms_training_organisation_id`),
  KEY `coms_proctor_fk_3_idx` (`coms_proctor_id`),
  KEY `state_id_fk_195841_idx` (`state_id`),
  CONSTRAINT `coms_proctor_fk_3` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_fk_13` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_195841` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
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
  `state_id` bigint(20) NOT NULL,
  PRIMARY KEY (`coms_training_organisation_trainer_id`),
  KEY `coms_trainer_id_fk_1_idx` (`coms_trainer_id`),
  KEY `coms_training_organisationt_id_fk_2_idx` (`coms_training_organisation_id`),
  KEY `state_id_fk04` (`state_id`),
  CONSTRAINT `coms_trainer_id_fk_2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_id_fk_3` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk04` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
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
  `entrypoint` tinyint(4) DEFAULT '0',
  `statemachine_id` bigint(20) NOT NULL,
  `script_IN` longtext,
  `script_OUT` longtext,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_machines`
--

DROP TABLE IF EXISTS `state_machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_machines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(45) DEFAULT NULL,
  `transition_script` longtext,
  `form_data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
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
  `transition_script` longtext,
  PRIMARY KEY (`state_rules_id`),
  KEY `state_id_fk1_idx` (`state_id_FROM`),
  KEY `state_id_fk_to_idx` (`state_id_TO`),
  CONSTRAINT `state_id_fk_from` FOREIGN KEY (`state_id_FROM`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_to` FOREIGN KEY (`state_id_TO`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
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
 1 AS `state`,
 1 AS `coms_certificate_id`,
 1 AS `coms_certificate_name`,
 1 AS `coms_certificate_description`,
 1 AS `coms_certificate_intro`,
 1 AS `coms_certificate_type_id`,
 1 AS `coms_certificate_type_description`,
 1 AS `coms_participant_id`,
 1 AS `coms_participant_base32`,
 1 AS `coms_participant_matriculation`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_firstname`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`,
 1 AS `Certificate`,
 1 AS `Expiration_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_datasheet_exam_event`
--

DROP TABLE IF EXISTS `v_coms_datasheet_exam_event`;
/*!50001 DROP VIEW IF EXISTS `v_coms_datasheet_exam_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_datasheet_exam_event` AS SELECT 
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
 1 AS `coms_participant_emailadress`,
 1 AS `url_form_participant`,
 1 AS `coms_participant_exam_event_id`,
 1 AS `coms_exam_event_id`,
 1 AS `state_id`,
 1 AS `coms_participant_exam_event_percent`,
 1 AS `coms_participant_info`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_datasheet_exam_event_mail`
--

DROP TABLE IF EXISTS `v_coms_datasheet_exam_event_mail`;
/*!50001 DROP VIEW IF EXISTS `v_coms_datasheet_exam_event_mail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_datasheet_exam_event_mail` AS SELECT 
 1 AS `coms_exam_event_id`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_exam_name`,
 1 AS `coms_exam_event_start_date`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_firstname`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_emailadresss`,
 1 AS `coms_participant_md5`,
 1 AS `coms_participant_matriculation`,
 1 AS `coms_participant_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_coms_participant__exam_event`
--

DROP TABLE IF EXISTS `v_coms_participant__exam_event`;
/*!50001 DROP VIEW IF EXISTS `v_coms_participant__exam_event`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_participant__exam_event` AS SELECT 
 1 AS `coms_exam_event_id`,
 1 AS `coms_exam_event_name`,
 1 AS `event_state_id`,
 1 AS `event_state_name`,
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
 1 AS `participant_state_name`,
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
-- Temporary view structure for view `v_coms_participant__id__email_moodle`
--

DROP TABLE IF EXISTS `v_coms_participant__id__email_moodle`;
/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email_moodle`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_participant__id__email_moodle` AS SELECT 
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
-- Temporary view structure for view `v_coms_trainingorg_particicpant_`
--

DROP TABLE IF EXISTS `v_coms_trainingorg_particicpant_`;
/*!50001 DROP VIEW IF EXISTS `v_coms_trainingorg_particicpant_`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_coms_trainingorg_particicpant_` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_participant_gender`,
 1 AS `coms_participant_lastname`,
 1 AS `coms_participant_firstname`,
 1 AS `coms_participant_placeofbirth`,
 1 AS `coms_participant_birthcountry`,
 1 AS `coms_participant_dateofbirth`,
 1 AS `coms_participant_EXTERNAL_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_csvexport_trainer_exam`
--

DROP TABLE IF EXISTS `v_csvexport_trainer_exam`;
/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainer_exam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_csvexport_trainer_exam` AS SELECT 
 1 AS `coms_trainer_id`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_trainer_lastname`,
 1 AS `coms_exam_language_id`,
 1 AS `coms_exam_id`,
 1 AS `coms_exam_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_csvexport_trainingorg`
--

DROP TABLE IF EXISTS `v_csvexport_trainingorg`;
/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_csvexport_trainingorg` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_training_organisation_name`,
 1 AS `coms_training_organisation_passwd_hash`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_csvexport_trainingorg_exam`
--

DROP TABLE IF EXISTS `v_csvexport_trainingorg_exam`;
/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_exam`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_csvexport_trainingorg_exam` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_exam_id`,
 1 AS `coms_exam_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_csvexport_trainingorg_proctor`
--

DROP TABLE IF EXISTS `v_csvexport_trainingorg_proctor`;
/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_proctor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_csvexport_trainingorg_proctor` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_proctor_id`,
 1 AS `coms_proctor_firstname`,
 1 AS `coms_proctor_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_csvexport_trainingorg_trainer`
--

DROP TABLE IF EXISTS `v_csvexport_trainingorg_trainer`;
/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_trainer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_csvexport_trainingorg_trainer` AS SELECT 
 1 AS `coms_training_organisation_id`,
 1 AS `coms_trainer_id`,
 1 AS `coms_trainer_firstname`,
 1 AS `coms_trainer_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_dot__state_rules__state`
--

DROP TABLE IF EXISTS `v_dot__state_rules__state`;
/*!50001 DROP VIEW IF EXISTS `v_dot__state_rules__state`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dot__state_rules__state` AS SELECT 
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
 1 AS `coms_trainer_lastname`,
 1 AS `coms_proctor_id`,
 1 AS `coms_proctor_firstname`,
 1 AS `coms_proctor_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bpmspace_coms_v1'
--

--
-- Dumping routines for database 'bpmspace_coms_v1'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_part_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_part_event`(IN PART_ID CHAR(255), IN EVENT_ID CHAR(255))
BEGIN
set @EXAM_EVENT_ID = EVENT_ID;
SET @PARTICIPANTID = PART_ID;
INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cert_part_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cert_part_2`(IN PART_ID CHAR(255), IN CERT_ID CHAR(255), IN DATE_IN DATE)
BEGIN

set @Date = DATE_IN;
set @Cert_ID = CERT_ID;
set @Participant_ID = PART_ID;
set @state = "73";
-- set @revocation = 
-- SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID;
set @expdate = DATE_SUB(DATE_ADD(@Date, INTERVAL (SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID) MONTH), INTERVAL 1 DAY);

INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`, `coms_certificate_participant_expiration_date`, `state_id`) VALUES (@Date, @Cert_ID, @Participant_ID, @expdate, @state);

set @coms_certificate_participant_ID = LAST_INSERT_ID();

UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where coms_certificate_participant_id = @coms_certificate_participant_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_proctor_ato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_proctor_ato`(IN PROCTOR_ID CHAR(255), IN ATO_ID CHAR(255))
BEGIN
set @PROCTOR_ID = PROCTOR_ID;
SET @ATO_ID = ATO_ID;
INSERT INTO `coms_training_organisation_proctor` (`coms_training_organisation_id`, `coms_proctor_id`, `state_id`) VALUES (@ATO_ID, @TRAINER_ID, '52');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_trainerorg_exam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trainerorg_exam`(IN TRAINERORG_ID CHAR(255), IN EXAM_ID CHAR(255))
BEGIN
set @TRAINERORG_ID = TRAINERORG_ID;
SET @EXAM_ID = EXAM_ID;

INSERT INTO `coms_training_organisation_exam` (`coms_trainingsorganisation_id`, `coms_exam_id`, `state_id`) VALUES (@TRAINERORG_ID, @TRAINER_ID, '70');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_trainer_ato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trainer_ato`(IN TRAINER_ID CHAR(255), IN ATO_ID CHAR(255))
BEGIN
set @TRAINER_ID = TRAINER_ID;
SET @ATO_ID = ATO_ID;
INSERT INTO `coms_training_organisation_trainer` (`coms_training_organisation_id`, `coms_trainer_id`, `state_id`) VALUES (@ATO_ID, @TRAINER_ID, '43');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_trainer_exam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_trainer_exam`(IN TRAINER_ID CHAR(255), IN EXAM_ID CHAR(255))
BEGIN
set @TRAINER_ID = TRAINER_ID;
SET @EXAM_ID = EXAM_ID;

INSERT INTO `coms_trainer_exam` (`coms_trainer_id`, `coms_exam_id`, `state_id`) VALUES (@TRAINER_ID, @EXAM_ID, '43');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_create_OR_add_part_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_create_OR_add_part_event`(IN Lastname CHAR(255), IN Firstname CHAR(255), IN Gender CHAR(255), IN Email CHAR(255), IN DateOfBirth CHAR(255), IN CityOfBirth CHAR(255), IN CountryOfBirth CHAR(255), IN event INT , IN ext_part_id CHAR(255), OUT _result CHAR(255))
BEGIN
set @ERROR = FALSE;

--
set @LASTNAME = IF(LENGTH(Lastname)>0,trim(TRIM(CHAR(9) FROM TRIM(Lastname))),"ERROR: NO LASTNAME");
set @FIRSTNAME = IF(LENGTH(firstname)>0,trim(TRIM(CHAR(9) FROM TRIM(firstname))),"ERROR: NO FIRSTNAME");
set @GENDER = IF(LENGTH(Gender)>0,trim(TRIM(CHAR(9) FROM TRIM(Gender))),"ERROR: NO GENDER");
set @EMAIL = IF(LENGTH(Email)>0,trim(TRIM(CHAR(9) FROM TRIM(Email))),"ERROR: NO E_MAIL");

set @EXAM_EVENT_ID = IF(LENGTH(event)>0,event,"ERROR: NO EXAM EVENT ID");
set @EXAM_EVENT_ID = IF(@EXAM_EVENT_ID REGEXP '^[0-9]+$',@EXAM_EVENT_ID,"ERROR: EXAM EVENT ID NOT NUMBER");
-- 
set @BIRTHDATE = trim(TRIM(CHAR(9) FROM TRIM(DateOfBirth)));
set @BIRTHPLACE = trim(TRIM(CHAR(9) FROM TRIM(CityOfBirth)));
set @BIRTHCOUNTRY = trim(TRIM(CHAR(9) FROM TRIM(CountryOfBirth)));
--
set @PARTICIPANT_EXTERNAL_ID = IF(LENGTH(ext_part_id)>0,ext_part_id,'');
-- set @EXT_PART_EXIST = Select IF (EXITS(SELECT * FROM bpmspace_coms_v1.coms_participant WHERE coms_participant_EXTERNAL_id = @COUNT_PARTICIPANT_EXTERNAL_ID),1,0) ;


set @COUNT_PARTICIPANT_EXTERNAL_ID = (SELECT
			count(*)
			FROM
			  bpmspace_coms_v1.coms_participant
			WHERE
			  bpmspace_coms_v1.coms_participant.coms_participant_EXTERNAL_id LIKE concat('%',@PARTICIPANT_EXTERNAL_ID,'%'));

              
SET @EXT_PART_EXIST = IF(@COUNT_PARTICIPANT_EXTERNAL_ID ='',FALSE,TRUE);

set @ERROR = IF(
	@LASTNAME LIKE '%ERROR%' OR
	@FIRSTNAME LIKE '%ERROR%' OR
    @GENDER LIKE '%ERROR%' OR
    @EMAIL LIKE '%ERROR%' OR
    @EXAM_EVENT_ID LIKE '%ERROR%'
	,TRUE,FALSE);
              
set @ERROR_MESSAGE = CONCAT('@ERROR ', @ERROR, '@LASTNAME ', @LASTNAME,' @FIRSTNAME ', @FIRSTNAME, ' @GENDER ', @GENDER, ' @EMAIL ', @EMAIL, ' @EXAM_EVENT_ID ', @EXAM_EVENT_ID, ' @EXT_PART_EXIST ', @EXT_PART_EXIST);

set _result = IF((@ERROR = FALSE),concat("NO Error - ",@COUNT_PARTICIPANT_EXTERNAL_ID),@ERROR_MESSAGE);

-- SELECT CASE WHEN ( @ERROR = FALSE ) 
	-- THEN ( SELECT "NO Error" ) 
    -- ELSE ( SELECT CONCAT('@ERROR ', @ERROR, '@LASTNAME ', @LASTNAME,' @FIRSTNAME ', @FIRSTNAME, ' @GENDER ', @GENDER, ' @EMAIL ', @EMAIL, ' @EXAM_EVENT_ID ', @EXAM_EVENT_ID, ' @EXT_PART_EXIST ', @EXT_PART_EXIST))
-- END;

-- INSERT INTO .`coms_participant` (`coms_participant_gender`, `coms_participant_lastname`, `coms_participant_firstname`, `coms_participant_public`, `coms_participant_placeofbirth`, `coms_participant_dateofbirth`,  `coms_participant_birthcountry`, `coms_participant_EXTERNAL_id`) VALUES (@GENDER, @LASTNAME, @FIRSTNAME, '0', @BIRTHPLACE, @BIRTHDATE, @BIRTHCOUNTRY, @PARTICIPANT_EXTERNAL_ID);

-- SET @PARTICIPANTID = LAST_INSERT_ID();

-- INSERT INTO `coms_participant_identifier` (`coms_participant_id`, `coms_participant_md5`) VALUES (@PARTICIPANTID, md5(@PARTICIPANTID));

-- UPDATE `coms_participant_identifier` set `coms_participant_matriculation` = concat(`coms_participant_id`,SUBSTRING(CONV(SUBSTRING(coms_participant_md5,1,5),16,10),1,3)) where coms_participant_id = @PARTICIPANTID;

-- UPDATE `coms_participant_identifier` set `coms_participant_base32` = LPAD(CONV(`coms_participant_matriculation`,10,32),8,'0') where coms_participant_id = @PARTICIPANTID;

-- INSERT INTO `coms_participant_email` (`coms_participant_id`, `coms_participant_emailadresss`) VALUES (@PARTICIPANTID, @EMAIL);

-- INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cert_part` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cert_part`(IN PART_ID CHAR(255), IN CERT_ID CHAR(255),IN CERTDATE CHAR(255))
BEGIN

set @Date = CERTDATE; 
set @Cert_ID = CERT_ID;
set @Participant_ID = PART_ID;


INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`, `state_id`) VALUES (@Date, @Cert_ID, @Participant_ID, "73");

set @coms_certificate_participant_ID = LAST_INSERT_ID();

UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where coms_certificate_participant_id = @coms_certificate_participant_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_cert_part_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_cert_part_2`(IN PART_ID CHAR(255), IN CERT_ID CHAR(255), IN DATE_IN DATE)
BEGIN

set @Date = DATE_IN;
set @Cert_ID = CERT_ID;
set @Participant_ID = PART_ID;
set @state = "73";
-- set @revocation = 
-- SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID;
set @expdate = DATE_SUB(DATE_ADD(@Date, INTERVAL (SELECT coms_certificate_valid_months from coms_certificate where coms_certificate_id = @Cert_ID) MONTH), INTERVAL 1 DAY);

INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`, `coms_certificate_participant_expiration_date`, `state_id`) VALUES (@Date, @Cert_ID, @Participant_ID, @expdate, @state);

set @coms_certificate_participant_ID = LAST_INSERT_ID();

UPDATE coms_certificate_participant set coms_certificate_participant_id_md5 = md5(coms_certificate_participant_id) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_3digit = SUBSTRING(CONV(SUBSTRING(coms_certificate_participant_id_md5,1,5),16,10),1,3) where coms_certificate_participant_id = @coms_certificate_participant_ID;

UPDATE `coms_certificate_participant` set coms_certificate_participant_id_base32 = LPAD(CONV(concat(coms_certificate_participant_id,coms_certificate_participant_3digit),10,32),8,'0') where coms_certificate_participant_id = @coms_certificate_participant_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_event`(IN ATO_ID CHAR(255), IN EXAM_ID CHAR(255), IN TRAINER_ID CHAR(255), IN PROCTOR_ID CHAR(255), IN LOCATIONDES CHAR(255), IN STARTDATE CHAR(255))
BEGIN

set @LOCATION_DESCRIPTION = LOCATIONDES;
set @DELIVERY_TYPE_ID = '4';
set @ATO_ID = ATO_ID;
set @TRAINER_ID = TRAINER_ID;
set @PROCTOR_ID = PROCTOR_ID;
set @EXAM_ID = EXAM_ID;
set @start_date = STARTDATE;


INSERT INTO `coms_exam_event` 	(`coms_exam_id`,	`state_id`,	`coms_exam_event_start_date`,	`coms_exam_event_finish_date`,	`coms_delivery_type_id`,	`coms_exam_event_location`,	`coms_training_org_id`,	`coms_trainer_id`, coms_proctor_id) 	VALUES 	(@EXAM_ID ,	'33',	@start_date,	@end_date,	@DELIVERY_TYPE_ID,	@LOCATION_DESCRIPTION,	@ATO_ID,	@TRAINER_ID, @PROCTOR_ID);	

set @EXAM_EVENT_ID = LAST_INSERT_ID();	
UPDATE coms_exam_event set coms_exam_event_id_md5 = md5(coms_exam_event_id) where coms_exam_event_id = @EXAM_EVENT_ID;	
UPDATE coms_exam_event set coms_exam_event_3digit = SUBSTRING(CONV(SUBSTRING(coms_exam_event_id_md5,1,5),16,10),1,3) where coms_exam_event_id = @EXAM_EVENT_ID;	
UPDATE coms_exam_event set coms_exam_event_id_base32 = LPAD(CONV(concat(coms_exam_event_id,coms_exam_event_3digit),10,32),8,'0') where coms_exam_event_id = @EXAM_EVENT_ID;
UPDATE coms_exam_event AS ExEv	SET 	ExEv.coms_exam_event_name = (SELECT 	CONCAT(DATE(ExEv.coms_exam_event_start_date),	' - [',	ExEv.coms_exam_event_id_base32,	'] - ', 	Lg.language_short,	' - ',	Ex.coms_exam_name,	' - ',	TrOr.coms_training_organisation_short_namel)	FROM	((((((`coms_exam` `Ex`)	JOIN `state`)	JOIN `coms_delivery_type` `DeTy`)	JOIN `coms_training_organisation` `TrOr`)	JOIN `coms_trainer` `Tr`)	JOIN `coms_language` `Lg`)	WHERE	((`ExEv`.`coms_exam_id` = `Ex`.`coms_exam_id`)	AND (`ExEv`.`state_id` = `state`.`state_id`)	AND (`ExEv`.`coms_delivery_type_id` = `DeTy`.`coms_delivery_type_id`)	AND (`ExEv`.`coms_training_org_id` = `TrOr`.`coms_training_organisation_id`)	AND (`ExEv`.`coms_trainer_id` = `Tr`.`coms_trainer_id`)	AND (`Ex`.`coms_exam_language_id` = `Lg`.`coms_language_id`))	) where coms_exam_event_id = @EXAM_EVENT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_part_event` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_part_event`(IN Lastname CHAR(255), IN Firstname CHAR(255), IN Gender CHAR(255), IN Email CHAR(255), IN DateOfBirth CHAR(255), IN CityOfBirth CHAR(255), IN CountryOfBirth CHAR(255), IN event CHAR(255) , IN ext_part_id CHAR(255) )
BEGIN

set @LASTNAME = trim(TRIM(CHAR(9) FROM TRIM(Lastname)));
set @FIRSTNAME = trim(TRIM(CHAR(9) FROM TRIM(firstname)));
set @GENDER = trim(TRIM(CHAR(9) FROM TRIM(Gender)));
set @EMAIL = trim(TRIM(CHAR(9) FROM TRIM(Email)));
set @BIRTHDATE = trim(TRIM(CHAR(9) FROM TRIM(DateOfBirth)));
set @BIRTHPLACE = trim(TRIM(CHAR(9) FROM TRIM(CityOfBirth)));
set @BIRTHCOUNTRY = trim(TRIM(CHAR(9) FROM TRIM(CountryOfBirth)));
set @EXAM_EVENT_ID = event;
set @PARTICIPANT_EXTERNAL_ID = ext_part_id;
set @STATE_START_PART= '110';
set @STATE_START_PART_ID= '116';
set @STATE_START_PART_EMAIL= '113';
set @STATE_START_PART_EXAM_EVENT= '27';


INSERT INTO .`coms_participant` (`coms_participant_gender`, `coms_participant_lastname`, `coms_participant_firstname`, `coms_participant_public`, `coms_participant_placeofbirth`, `coms_participant_dateofbirth`,  `coms_participant_birthcountry`, `coms_participant_EXTERNAL_id`, `state_id`) VALUES (@GENDER, @LASTNAME, @FIRSTNAME, '0', @BIRTHPLACE, @BIRTHDATE, @BIRTHCOUNTRY, @PARTICIPANT_EXTERNAL_ID, @STATE_START_PART );

SET @PARTICIPANTID = LAST_INSERT_ID();

INSERT INTO `coms_participant_identifier` (`coms_participant_id`, `coms_participant_md5`, `state_id`) VALUES (@PARTICIPANTID, md5(@PARTICIPANTID),@STATE_START_PART_ID);

UPDATE `coms_participant_identifier` set `coms_participant_matriculation` = concat(`coms_participant_id`,SUBSTRING(CONV(SUBSTRING(coms_participant_md5,1,5),16,10),1,3)) where coms_participant_id = @PARTICIPANTID;

UPDATE `coms_participant_identifier` set `coms_participant_base32` = LPAD(CONV(`coms_participant_matriculation`,10,32),8,'0') where coms_participant_id = @PARTICIPANTID;

INSERT INTO `coms_participant_email` (`coms_participant_id`, `coms_participant_emailadresss`,`state_id`) VALUES (@PARTICIPANTID, @EMAIL, @STATE_START_PART_EMAIL);

INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, @STATE_START_PART_EXAM_EVENT);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_proctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_proctor`(IN ATO_ID CHAR(255), IN Lastname CHAR(255), IN firstname CHAR(255),  IN Email CHAR(255))
BEGIN
set @ATO_ID= ATO_ID;
set @LASTNAME = Lastname;
set @FIRSTNAME = firstname;
set @EMAIL = Email;


INSERT INTO `coms_proctor` (`coms_proctor_firstname`, `coms_proctor_lastname`, `state_id`) VALUES (@FIRSTNAME, @LASTNAME,'49');

set @PROCTOR_ID = LAST_INSERT_ID();

INSERT INTO `coms_proctor_email` (`coms_proctor_emailadresss`, `coms_proctor_id`, `state_id`) VALUES (@EMAIL, @PROCTOR_ID, '122');

INSERT INTO `coms_training_organisation_proctor` (`coms_training_organisation_id`, `coms_proctor_id`, `state_id`) VALUES (@ATO_ID, @PROCTOR_ID, '140');


UPDATE coms_proctor set coms_proctor_id_md5 = md5(coms_proctor_id) where coms_proctor_id = @PROCTOR_ID;

UPDATE coms_proctor set coms_proctor_3digit = SUBSTRING(CONV(SUBSTRING(coms_proctor_id_md5,1,5),16,10),1,3) where coms_proctor_id = @PROCTOR_ID;
	
UPDATE coms_proctor set coms_proctor_id_base32 = LPAD(CONV(concat(coms_proctor_id,coms_proctor_3digit),10,32),8,'0') where coms_proctor_id = @PROCTOR_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_trainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_trainer`(IN ATO_ID CHAR(255), IN Lastname CHAR(255), IN firstname CHAR(255),  IN Email CHAR(255))
BEGIN
set @ATO_ID= ATO_ID;
set @LASTNAME = Lastname;
set @FIRSTNAME = firstname;
set @EMAIL = Email;


INSERT INTO `coms_trainer` (`coms_trainer_firstname`, `coms_trainer_lastname`, `state_id`) VALUES (@FIRSTNAME, @LASTNAME, '40');

set @TRAINER_ID = LAST_INSERT_ID();

INSERT INTO `coms_trainer_email` (`coms_trainer_emailadresss`, `coms_trainer_id`, `state_id`) VALUES (@EMAIL, @TRAINER_ID, '131');

INSERT INTO `coms_training_organisation_trainer` (`coms_training_organisation_id`, `coms_trainer_id`, `state_id`) VALUES (@ATO_ID, @TRAINER_ID,'46');

UPDATE coms_trainer set coms_trainer_id_md5 = md5(coms_trainer_id) where coms_trainer_id = @TRAINER_ID;

UPDATE coms_trainer set coms_trainer_3digit = SUBSTRING(CONV(SUBSTRING(coms_trainer_id_md5,1,5),16,10),1,3) where coms_trainer_id = @TRAINER_ID;

UPDATE coms_trainer set coms_trainer_id_base32 = LPAD(CONV(concat(coms_trainer_id,coms_trainer_3digit),10,32),8,'0') where coms_trainer_id = @TRAINER_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_trainerorg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_trainerorg`(IN ATO_NAME CHAR(255), IN ATO_NAME_SHORT CHAR(255), IN ATO_PASSWORD CHAR(255), IN ATO_MAIL CHAR(255))
BEGIN
set @ATO_NAME = ATO_NAME;
set @ATO_NAME_SHORT = ATO_NAME_SHORT;
SET @ATO_PASSWORD = ATO_PASSWORD;
SET @ATO_MAIL = ATO_MAIL;

 
INSERT INTO coms_training_organisation(`coms_training_organisation_name`, `coms_training_organisation_short_namel`, `coms_training_organisation_email`,`state_id`) VALUES (@ATO_NAME, @ATO_NAME_SHORT, @ATO_MAIL, "58");

set @ATO_ID = LAST_INSERT_ID();
	
    UPDATE coms_training_organisation set coms_training_organisation_id_md5 = md5(coms_training_organisation_id) where coms_training_organisation_id = @ATO_ID ;
    UPDATE coms_training_organisation set coms_training_organisation_3digit = SUBSTRING(CONV(SUBSTRING(coms_training_organisation_id_md5,1,5),16,10),1,3) where coms_training_organisation_id = @ATO_ID ;
    UPDATE coms_training_organisation set coms_training_organisation_id_base32 = LPAD(CONV(concat(coms_training_organisation_id,coms_training_organisation_3digit),10,32),8,'0') where coms_training_organisation_id = @ATO_ID ;

UPDATE coms_training_organisation set coms_training_organisation_passwd_hash= SHA2(concat(@ATO_PASSWORD,coms_training_organisation_id_md5), 512)where  coms_training_organisation_id = @ATO_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `csvexport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `csvexport`(IN table_s CHAR(255), IN table_n CHAR(255), IN outfile_path CHAR(255))
BEGIN
SET @table_schema = table_s;
SET @table_n = table_n;
SET @outfile_path = outfile_path;

SET @col_names = (
SELECT GROUP_CONCAT(QUOTE(column_name)) AS columns
FROM information_schema.columns
WHERE table_schema = @table_schema
AND table_name = @table_n);

SET @cols = CONCAT('(SELECT ', @col_names, ')');

SET @query = CONCAT('(SELECT * FROM ', @table_schema, '.', @table_n,
' INTO OUTFILE \'',@outfile_path,'/',@table_n,'.csv\'
FIELDS ENCLOSED BY \'\\\'\' TERMINATED BY \'\t\' ESCAPED BY \'\'
LINES TERMINATED BY \'\n\')');

/* Concatenates column names to query */
SET @sql = CONCAT(@cols, ' UNION ALL ', @query);


PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `offline_quiz_results` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `offline_quiz_results`(IN EXAM_EVENT_ID CHAR(255))
BEGIN
SELECT
  CONCAT('UPDATE `bpmspace_coms_v1`.`coms_participant_exam_event` SET `coms_participant_info`=concat(\"SUMM POINTS: ',
  TRUNCATE(moodle.mdl_offlinequiz_results.sumgrades,3),' - MAX POINTS: ',
  bpmspace_coms_v1.coms_exam.coms_exam_max_points,' - PASS MARK: ',
  bpmspace_coms_v1.coms_exam.coms_exam_pass_mark,' - %: ',
  TRUNCATE((moodle.mdl_offlinequiz_results.sumgrades/bpmspace_coms_v1.coms_exam.coms_exam_max_points*100),3),' - CHECK: MDL',bpmspace_coms_v1.coms_exam_event.coms_exam_event_id,moodle.mdl_user.idnumber,
  "\")", ', `state_id`="',
  IF(bpmspace_coms_v1.coms_exam.coms_exam_pass_mark <= moodle.mdl_offlinequiz_results.sumgrades, '31', '32'),'" , coms_participant_exam_event_percent=\"', TRUNCATE((moodle.mdl_offlinequiz_results.sumgrades/bpmspace_coms_v1.coms_exam.coms_exam_max_points*100),3) ,
  ' " where `coms_participant_exam_event`.`coms_exam_event_id` ="' ,  EXAM_EVENT_ID , '" AND `coms_participant_exam_event`.`coms_participant_id`="' , LEFT(moodle.mdl_user.idnumber,length(moodle.mdl_user.idnumber)-3), '";'
  ) AS SQL_CMD
FROM
  ((moodle.mdl_offlinequiz_results
  JOIN moodle.mdl_user ON moodle.mdl_offlinequiz_results.userid = moodle.mdl_user.id)
  JOIN moodle.mdl_offlinequiz ON moodle.mdl_offlinequiz_results.offlinequizid = moodle.mdl_offlinequiz.id)
  JOIN bpmspace_coms_v1.coms_exam_event ON bpmspace_coms_v1.coms_exam_event.coms_exam_event_name =
    moodle.mdl_offlinequiz.name
  INNER JOIN bpmspace_coms_v1.coms_exam ON bpmspace_coms_v1.coms_exam_event.coms_exam_id =
    bpmspace_coms_v1.coms_exam.coms_exam_id
WHERE
  bpmspace_coms_v1.coms_exam_event.coms_exam_event_id = EXAM_EVENT_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test`()
BEGIN
    SET @var1 = 2 * 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50001 VIEW `v_certificate_participant` AS select distinct `cepa`.`coms_certificate_participant_id` AS `coms_certificate_participant_id`,`cepa`.`coms_certificate_participant_date` AS `coms_certificate_participant_date`,`cepa`.`coms_certificate_participant_id_base32` AS `coms_certificate_participant_id_base32`,`st`.`name` AS `state`,`cepa`.`coms_certificate_id` AS `coms_certificate_id`,`ce`.`coms_certificate_name` AS `coms_certificate_name`,`ce`.`coms_certificate_description` AS `coms_certificate_description`,`ce`.`coms_certificate_intro` AS `coms_certificate_intro`,`ce`.`coms_certificate_type_id` AS `coms_certificate_type_id`,`ct`.`coms_certificate_type_description` AS `coms_certificate_type_description`,`pa`.`coms_participant_id` AS `coms_participant_id`,`paid`.`coms_participant_base32` AS `coms_participant_base32`,`paid`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`pa`.`coms_participant_gender` AS `coms_participant_gender`,`pa`.`coms_participant_firstname` AS `coms_participant_firstname`,`pa`.`coms_participant_lastname` AS `coms_participant_lastname`,`pa`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`pa`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`pa`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`cepa`.`coms_certificate` AS `Certificate`,`cepa`.`coms_certificate_participant_expiration_date` AS `Expiration_date` from (((((`coms_certificate` `ce` join `coms_certificate_participant` `cepa`) join `coms_participant` `pa`) join `coms_participant_identifier` `paid`) join `coms_certificate_type` `ct`) join `state` `st`) where ((`ce`.`coms_certificate_id` = `cepa`.`coms_certificate_id`) and (`cepa`.`coms_participant_id` = `pa`.`coms_participant_id`) and (`paid`.`coms_participant_id` = `pa`.`coms_participant_id`) and (`ct`.`coms_certificate_type_id` = `ce`.`coms_certificate_type_id`) and (`paid`.`coms_participant_id` = `pa`.`coms_participant_id`) and (`cepa`.`state_id` = `st`.`state_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_datasheet_exam_event`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_datasheet_exam_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_datasheet_exam_event` AS select `v_coms_participant__id__email`.`coms_participant_id` AS `coms_participant_id`,`v_coms_participant__id__email`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`v_coms_participant__id__email`.`coms_participant_md5` AS `coms_participant_md5`,`v_coms_participant__id__email`.`coms_participant_base32` AS `coms_participant_base32`,`v_coms_participant__id__email`.`coms_participant_gender` AS `coms_participant_gender`,`v_coms_participant__id__email`.`coms_participant_lastname` AS `coms_participant_lastname`,`v_coms_participant__id__email`.`coms_participant_firstname` AS `coms_participant_firstname`,`v_coms_participant__id__email`.`coms_participant_public` AS `coms_participant_public`,`v_coms_participant__id__email`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`v_coms_participant__id__email`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`v_coms_participant__id__email`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`v_coms_participant__id__email`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,`v_coms_participant__id__email`.`coms_participant_emailadresss` AS `coms_participant_emailadress`,`v_coms_participant__id__email`.`url_form_participant` AS `url_form_participant`,`coms_participant_exam_event`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`,`coms_participant_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,`coms_participant_exam_event`.`state_id` AS `state_id`,`coms_participant_exam_event`.`coms_participant_exam_event_percent` AS `coms_participant_exam_event_percent`,`coms_participant_exam_event`.`coms_participant_info` AS `coms_participant_info` from (`v_coms_participant__id__email` join `coms_participant_exam_event` on((`v_coms_participant__id__email`.`coms_participant_id` = `coms_participant_exam_event`.`coms_participant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_datasheet_exam_event_mail`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_datasheet_exam_event_mail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_datasheet_exam_event_mail` AS select `coms_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,`coms_training_organisation`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`coms_exam`.`coms_exam_name` AS `coms_exam_name`,`coms_exam_event`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`coms_participant`.`coms_participant_gender` AS `coms_participant_gender`,`coms_participant`.`coms_participant_lastname` AS `coms_participant_lastname`,`coms_participant`.`coms_participant_firstname` AS `coms_participant_firstname`,`coms_participant`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`coms_participant`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`coms_participant`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`coms_participant_email`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,`coms_participant_identifier`.`coms_participant_md5` AS `coms_participant_md5`,`coms_participant_identifier`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`coms_participant`.`coms_participant_id` AS `coms_participant_id` from ((((((`coms_exam_event` join `coms_training_organisation` on((`coms_exam_event`.`coms_training_org_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_exam` on((`coms_exam_event`.`coms_exam_id` = `coms_exam`.`coms_exam_id`))) join `coms_participant_exam_event` on((`coms_participant_exam_event`.`coms_exam_event_id` = `coms_exam_event`.`coms_exam_event_id`))) join `coms_participant` on((`coms_participant_exam_event`.`coms_participant_id` = `coms_participant`.`coms_participant_id`))) join `coms_participant_email` on((`coms_participant_email`.`coms_participant_id` = `coms_participant`.`coms_participant_id`))) join `coms_participant_identifier` on((`coms_participant_identifier`.`coms_participant_id` = `coms_participant`.`coms_participant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_coms_participant__exam_event`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_participant__exam_event`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_participant__exam_event` AS select distinct `ee`.`coms_exam_event_id` AS `coms_exam_event_id`,`ee`.`coms_exam_event_name` AS `coms_exam_event_name`,`ee`.`state_id` AS `event_state_id`,`st2`.`name` AS `event_state_name`,`ee`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`ee`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`ee`.`coms_exam_event_location` AS `coms_exam_event_location`,`ee`.`coms_exam_id` AS `coms_exam_id`,`ee`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`dt`.`coms_delivery_description` AS `coms_delivery_description`,`ee`.`coms_training_org_id` AS `coms_training_org_id`,`tro`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`ee`.`coms_trainer_id` AS `coms_trainer_id`,`tr`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`tr`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`p`.`coms_participant_id` AS `coms_participant_id`,`p`.`coms_participant_gender` AS `coms_participant_gender`,`p`.`coms_participant_lastname` AS `coms_participant_lastname`,`p`.`coms_participant_firstname` AS `coms_participant_firstname`,`pee`.`state_id` AS `participant_state`,`st1`.`name` AS `participant_state_name`,`p`.`coms_participant_public` AS `coms_participant_public`,`p`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`p`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`p`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`p`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id` from (((((((`coms_participant` `p` join `coms_participant_exam_event` `pee`) join `coms_exam_event` `ee`) join `state` `st1`) join `state` `st2`) join `coms_delivery_type` `dt`) join `coms_training_organisation` `tro`) join `coms_trainer` `tr`) where ((`p`.`coms_participant_id` = `pee`.`coms_participant_id`) and (`pee`.`coms_exam_event_id` = `ee`.`coms_exam_event_id`) and (`st1`.`state_id` = `pee`.`state_id`) and (`st2`.`state_id` = `ee`.`state_id`) and (`dt`.`coms_delivery_type_id` = `ee`.`coms_delivery_type_id`) and (`tro`.`coms_training_organisation_id` = `ee`.`coms_training_org_id`) and (`tr`.`coms_trainer_id` = `ee`.`coms_trainer_id`)) */;
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
-- Final view structure for view `v_coms_participant__id__email_moodle`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_participant__id__email_moodle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_participant__id__email_moodle` AS select `coms_participant_email`.`coms_participant_emailadresss` AS `username`,`coms_participant`.`coms_participant_firstname` AS `firstname`,`coms_participant`.`coms_participant_lastname` AS `lastname`,`coms_participant_email`.`coms_participant_emailadresss` AS `email`,`coms_participant_identifier`.`coms_participant_matriculation` AS `idnumber`,ucase(substr(md5(rand()),1,10)) AS `password` from ((`coms_participant` join `coms_participant_identifier` on((`coms_participant`.`coms_participant_id` = `coms_participant_identifier`.`coms_participant_id`))) join `coms_participant_email` on((`coms_participant`.`coms_participant_id` = `coms_participant_email`.`coms_participant_id`))) */;
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
-- Final view structure for view `v_coms_trainingorg_particicpant_`
--

/*!50001 DROP VIEW IF EXISTS `v_coms_trainingorg_particicpant_`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_coms_trainingorg_particicpant_` AS select distinct `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_training_organisation`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`coms_participant`.`coms_participant_gender` AS `coms_participant_gender`,`coms_participant`.`coms_participant_lastname` AS `coms_participant_lastname`,`coms_participant`.`coms_participant_firstname` AS `coms_participant_firstname`,`coms_participant`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`coms_participant`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`coms_participant`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`coms_participant`.`coms_participant_EXTERNAL_id` AS `coms_participant_EXTERNAL_id` from (((`coms_training_organisation` join `coms_exam_event` on((`coms_exam_event`.`coms_training_org_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_participant_exam_event` on((`coms_participant_exam_event`.`coms_exam_event_id` = `coms_exam_event`.`coms_exam_event_id`))) join `coms_participant` on((`coms_participant_exam_event`.`coms_participant_id` = `coms_participant`.`coms_participant_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_csvexport_trainer_exam`
--

/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainer_exam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_csvexport_trainer_exam` AS select `coms_trainer`.`coms_trainer_id` AS `coms_trainer_id`,`coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`coms_exam`.`coms_exam_language_id` AS `coms_exam_language_id`,`coms_exam`.`coms_exam_id` AS `coms_exam_id`,`coms_exam`.`coms_exam_name` AS `coms_exam_name` from ((`coms_trainer` join `coms_trainer_exam` on((`coms_trainer_exam`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`))) join `coms_exam` on((`coms_trainer_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_csvexport_trainingorg`
--

/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_csvexport_trainingorg` AS select `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_training_organisation`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`coms_training_organisation`.`coms_training_organisation_passwd_hash` AS `coms_training_organisation_passwd_hash` from `coms_training_organisation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_csvexport_trainingorg_exam`
--

/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_exam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_csvexport_trainingorg_exam` AS select `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_exam`.`coms_exam_id` AS `coms_exam_id`,`coms_exam`.`coms_exam_name` AS `coms_exam_name` from ((`coms_training_organisation` join `coms_training_organisation_exam` on((`coms_training_organisation_exam`.`coms_trainingsorganisation_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_exam` on((`coms_training_organisation_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_csvexport_trainingorg_proctor`
--

/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_proctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_csvexport_trainingorg_proctor` AS select `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_proctor`.`coms_proctor_id` AS `coms_proctor_id`,`coms_proctor`.`coms_proctor_firstname` AS `coms_proctor_firstname`,`coms_proctor`.`coms_proctor_lastname` AS `coms_proctor_lastname` from ((`coms_training_organisation` join `coms_training_organisation_proctor` on((`coms_training_organisation_proctor`.`coms_training_organisation_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_proctor` on((`coms_training_organisation_proctor`.`coms_proctor_id` = `coms_proctor`.`coms_proctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_csvexport_trainingorg_trainer`
--

/*!50001 DROP VIEW IF EXISTS `v_csvexport_trainingorg_trainer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_csvexport_trainingorg_trainer` AS select `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_trainer`.`coms_trainer_id` AS `coms_trainer_id`,`coms_trainer`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`coms_trainer`.`coms_trainer_lastname` AS `coms_trainer_lastname` from ((`coms_training_organisation` join `coms_training_organisation_trainer` on((`coms_training_organisation_trainer`.`coms_training_organisation_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_trainer` on((`coms_training_organisation_trainer`.`coms_trainer_id` = `coms_trainer`.`coms_trainer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dot__state_rules__state`
--

/*!50001 DROP VIEW IF EXISTS `v_dot__state_rules__state`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dot__state_rules__state` AS select concat('"',`s1`.`name`,' (',`s1`.`state_id`,')','" -> "',`s2`.`name`,' (',`s2`.`state_id`,')','"') AS `concat("\"", S1.name, "\" -> \"" , S2.name, "\"")` from ((`state_rules` `sr` join `state` `s1`) join `state` `s2`) where ((`sr`.`state_id_FROM` = `s1`.`state_id`) and (`sr`.`state_id_TO` = `s2`.`state_id`)) */;
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
/*!50001 VIEW `v_exam_event__exam__trainingorg__trainer` AS select `exev`.`coms_exam_event_id` AS `coms_exam_event_id`,`exev`.`coms_exam_event_name` AS `coms_exam_event_name`,`exev`.`coms_exam_id` AS `coms_exam_id`,`exev`.`coms_exam_event_id_md5` AS `coms_exam_event_id_md5`,`exev`.`coms_exam_event_3digit` AS `coms_exam_event_3digit`,`exev`.`coms_exam_event_id_base32` AS `coms_exam_event_id_base32`,`ex`.`coms_exam_name` AS `coms_exam_name`,`lg`.`language` AS `exam_language`,`exev`.`state_id` AS `event_state_id`,`state`.`name` AS `event_state_name`,`exev`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`exev`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`exev`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`dety`.`coms_delivery_description` AS `coms_delivery_description`,`exev`.`coms_exam_event_location` AS `coms_exam_event_location`,`exev`.`coms_training_org_id` AS `coms_training_org_id`,`tror`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`exev`.`coms_trainer_id` AS `coms_trainer_id`,`tr`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`tr`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`exev`.`coms_proctor_id` AS `coms_proctor_id`,`pr`.`coms_proctor_firstname` AS `coms_proctor_firstname`,`pr`.`coms_proctor_lastname` AS `coms_proctor_lastname` from (((((((`coms_exam_event` `exev` join `coms_exam` `ex`) join `state`) join `coms_delivery_type` `dety`) join `coms_training_organisation` `tror`) join `coms_trainer` `tr`) join `coms_language` `lg`) join `coms_proctor` `pr`) where ((`exev`.`coms_exam_id` = `ex`.`coms_exam_id`) and (`exev`.`state_id` = `state`.`state_id`) and (`exev`.`coms_delivery_type_id` = `dety`.`coms_delivery_type_id`) and (`exev`.`coms_training_org_id` = `tror`.`coms_training_organisation_id`) and (`exev`.`coms_trainer_id` = `tr`.`coms_trainer_id`) and (`ex`.`coms_exam_language_id` = `lg`.`coms_language_id`) and (`exev`.`coms_proctor_id` = `pr`.`coms_proctor_id`)) */;
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

-- Dump completed on 2018-03-12 14:43:45
