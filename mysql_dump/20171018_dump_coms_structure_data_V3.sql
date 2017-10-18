CREATE DATABASE  IF NOT EXISTS `bpmspace_coms_v3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bpmspace_coms_v3`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bpmspace_coms_v3
-- ------------------------------------------------------
-- Server version	5.5.57-0+deb8u1

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
  `coms_certificate_intro` longtext,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_certificate_id`),
  KEY `coms_certificate_type_id_fk1_idx` (`coms_certificate_type_id`),
  KEY `state_id_fk01` (`state_id`),
  CONSTRAINT `coms_certificate_type_id_fk1` FOREIGN KEY (`coms_certificate_type_id`) REFERENCES `coms_certificate_type` (`coms_certificate_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk01` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7932599 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_certificate`
--

LOCK TABLES `coms_certificate` WRITE;
/*!40000 ALTER TABLE `coms_certificate` DISABLE KEYS */;
INSERT INTO `coms_certificate` VALUES (7932567,'BPMspace 07CD2O0P','Sociis tempor tincidunt semper justo nonummy sit fames.',1,'8d061c6720a0709612fb7a9119a149ec','577','07CD2O0P','Nullam at libero adipiscing sagittis tempor ad litora elit. Molestie class tempor condimentum turpis eleifend libero mollis fermentum adipiscing cras nunc quam sodales. Integer adipiscing urna nisi diam commodo vitae.',55),(7932568,'BPMspace 07CD2PA0','Arcu mauris imperdiet habitant nonummy adipiscing euismod iaculis.',1,'dacd546f84d957e85f8dc1d63c2e008e','896','07CD2PA0','Amet sit accumsan neque taciti non lacus euismod dignissim. Sodales vitae iaculis tortor interdum facilisi etiam mi ridiculus. Dolor commodo tortor dis eu sociosqu habitant eleifend congue suspendisse vivamus. Quisque risus non placerat pellentesque enim elit magna phasellus a urna. Mattis nascetur facilisi.',55),(7932569,'BPMspace 07CD2PPR','Bibendum aliquet vel ornare in venenatis phasellus mus.',1,'627f061f9be21a50b238bb7507254885','403','07CD2PPR','Volutpat montes porttitor tristique lacus ipsum quisque netus orci. Interdum nisl semper euismod volutpat congue natoque mauris suspendisse risus facilisis diam. Litora facilisi condimentum orci ullamcorper parturient mi orci pede. Tellus elit nostra habitant tristique magnis pretium cum nibh mattis quis. At morbi metus.',55),(7932570,'BPMspace 07CD2QM8','Eros lacinia fames euismod metus pretium arcu cum nec.',1,'4c4908a010d7f71d6e0230785100d8f1','312','07CD2QM8','Natoque quis at bibendum duis sociosqu mus elit nam. Parturient bibendum libero volutpat nulla convallis sed odio ridiculus. Lobortis libero sociis sodales primis condimentum hendrerit lorem eros ultrices semper felis.',55),(7932571,'BPMspace 07CD2RUL','Rutrum lorem a nisi vivamus.',1,'93e785e1db9c57782bce32d34fd6c83f','605','07CD2RUL','Class inceptos pede cubilia pulvinar est conubia sociis sapien. Venenatis leo eu consectetuer pretium et donec dolor in fermentum litora feugiat. Iaculis adipiscing adipiscing aliquam congue litora varius hymenaeos viverra sodales. Scelerisque donec nostra magnis nibh magna ornare sed blandit.',55),(7932572,'BPMspace 07CD2SOP','Tellus euismod senectus enim rutrum.',1,'6bdc17571521c17cd82af93c67135d74','441','07CD2SOP','Senectus proin duis tellus porttitor ultricies mi semper montes. Netus dui facilisis tellus lorem pretium dui tincidunt sem inceptos. Lectus non pulvinar tempus dis feugiat at habitant mus placerat sociosqu commodo. Per lacinia.',55),(7932573,'BPMspace 07CD2TDF','Vel parturient lacinia consectetuer gravida.',2,'fd3aa7918842de694fd98886f14e5753','103','07CD2TDF','Cum diam leo pede ac aenean cubilia nunc proin. Posuere dolor tincidunt sit magna ultricies dis dolor lacinia malesuada dui nibh faucibus scelerisque. Taciti diam euismod tristique pharetra porta libero cras habitant. Pede eu leo fusce imperdiet tellus elementum natoque cras vitae malesuada. Cursus erat.',55),(7932574,'BPMspace 07CD2UOE','Commodo dignissim orci pellentesque ipsum ad taciti facilisi.',2,'74f11e72af1735cbce9f46abd94c84ad','478','07CD2UOE','Porta conubia montes felis venenatis tempor mattis tempor torquent. Magnis varius enim lectus ipsum primis laoreet velit mi proin condimentum fermentum euismod malesuada. Natoque accumsan habitant pretium nec porta ridiculus risus nec mollis.',55),(7932575,'BPMspace 07CD2VFV','Cum tristique augue per curabitur purus est commodo porttitor.',2,'3898d67e4f83c835686dcca05e882580','231','07CD2VFV','Nascetur orci nam sociosqu mi commodo ut interdum diam. Vestibulum rhoncus ullamcorper etiam parturient leo egestas sapien felis donec auctor quisque.',55),(7932576,'BPMspace 07CD316J','Non facilisi pellentesque libero egestas sapien faucibus.',2,'ef2461ca86a45da86f2a68c52bc4f950','979','07CD316J','Curabitur vitae lacus dictum orci pharetra malesuada lacus nunc. Nam consequat ultricies euismod pellentesque lorem fusce eu justo dolor risus facilisis cum tellus torquent. Parturient penatibus integer vehicula nibh class porttitor elit consequat taciti venenatis elit fringilla urna parturient. Mauris at semper tellus ultrices a eget cubilia aptent.',55),(7932577,'BPMspace 07CD31J0','Vitae justo consectetuer hymenaeos litora dis non litora lorem.',2,'5bd9e1224adda5ffbea2b0645b72558a','376','07CD31J0','Hendrerit lacinia aliquam tristique laoreet lacus sodales varius dis. Curae; iaculis hymenaeos placerat interdum turpis iaculis condimentum laoreet sit. Rhoncus facilisis dis bibendum sociosqu ut dis cras consequat donec pede placerat magnis id.',55),(7932578,'BPMspace 07CD32EK','A mattis molestie convallis auctor vitae pede imperdiet tortor.',2,'3fa903c9378e494df096a97ce847c472','260','07CD32EK','Porttitor amet congue laoreet sem ridiculus lectus suscipit vestibulum. Nibh amet lorem dis neque fames sapien auctor vestibulum pede id. Iaculis cras nonummy odio.',55),(7932579,'BPMspace 07CD33PH','Tellus facilisis tellus luctus quis habitant.',2,'9a9fe376c0c806b7413234c16bd1f78f','633','07CD33PH','Nonummy semper eleifend proin venenatis orci feugiat phasellus maecenas. Dictum velit enim id consequat malesuada congue auctor adipiscing tortor laoreet. Vivamus nascetur sollicitudin natoque euismod quisque ultrices fusce ullamcorper nibh dis dolor.',55),(7932580,'BPMspace 07CD350Q','Dapibus lacinia nec non faucibus pulvinar risus.',2,'15baceabeba909a5ed60cbd18c901473','890','07CD350Q','Consectetuer mattis dapibus hymenaeos facilisi in aliquet arcu dapibus. Tempor hymenaeos diam sem mollis eget montes accumsan leo curae; magnis.',55),(7932581,'BPMspace 07CD35H9','Integer arcu consectetuer ipsum penatibus cubilia pretium cursus penatibus.',2,'65e64528d7c70dca93ca5a8b5c58dc01','417','07CD35H9','Taciti luctus ridiculus lectus tellus amet nonummy ultrices sagittis. Molestie commodo urna hymenaeos ad viverra turpis nisl enim litora. Etiam sem egestas per pulvinar orci adipiscing dapibus sagittis.',55),(7932583,'BPMspace 07CD381D','Senectus scelerisque morbi feugiat ac amet donec.',6,'efa173dc88be087a1babf9e36e0c81e0','981','07CD381D','Nonummy maecenas nec laoreet justo rutrum placerat consequat metus. Nisi euismod pede lectus dis per sapien vel in arcu. Odio posuere nunc aenean erat dis donec leo nibh nullam. Vivamus sapien aenean quis porttitor erat cursus augue torquent elementum massa. Mi dignissim imperdiet fusce nec.',55),(7932587,'BPMspace 07CD3BNN','Laoreet pellentesque aliquet dolor tempus sociis metus augue sodales.',8,'bb79806f2d21e7c5d23f8f1d7e31c04a','767','07CD3BNN','Imperdiet litora cum imperdiet ligula congue dolor phasellus sodales. Euismod velit ultricies quis a proin per diam suspendisse risus. Erat feugiat taciti hendrerit dapibus sem molestie duis magnis sem neque. Neque massa rhoncus fusce.',55),(7932588,'BPMspace 07CD3CI5','Ac sem aliquet quisque porta duis viverra.',8,'95d1938829768ff5f1eba207b0d8f420','613','07CD3CI5','Nisi massa pretium condimentum hymenaeos massa ipsum montes maecenas. Malesuada congue auctor adipiscing ullamcorper mauris scelerisque maecenas vivamus magnis massa amet primis magnis. Ut suspendisse malesuada tempus ultricies a dui at posuere fusce. Suspendisse.',55),(7932589,'BPMspace 07CD3DLT','Iaculis auctor erat arcu nam netus enim.',8,'b8ebcda459c9598bf1d00346c93d8b5d','757','07CD3DLT','Mollis duis malesuada semper nonummy nisl dictum commodo vestibulum. Tellus porta tempor facilisi sociosqu faucibus aliquet et elementum inceptos elementum adipiscing. Turpis id conubia mollis etiam sed dignissim mollis class tempus convallis. Purus nullam ullamcorper placerat proin nibh pulvinar ut maecenas. Maecenas orci sapien.',55),(7932590,'BPMspace 07CD3EIF','Sodales bibendum tempor curae; curae;.',8,'a3f6063ec1734cb817b630571b62d00f','671','07CD3EIF','Sociosqu placerat velit primis quam neque odio luctus libero. Parturient tincidunt magnis ridiculus ipsum posuere fusce natoque sem hymenaeos iaculis quis placerat dolor. Amet leo.',55),(7932591,'BPMspace 07CD3FQE','Amet ad urna nullam fringilla.',7,'e81d8925686c0524b443e7cdad1ea94c','950','07CD3FQE','Iaculis volutpat tempus lectus mauris erat pulvinar vehicula montes. Nibh lacus hendrerit mi mollis congue vehicula lacus et commodo penatibus arcu fames fringilla. Sapien posuere cursus placerat vestibulum sapien arcu ultricies litora malesuada commodo aliquet tempor etiam. Vivamus nunc eget eget litora nonummy placerat orci conubia praesent donec.',55),(7932592,'BPMspace 07CD3GF3','Sed iaculis laoreet ante vehicula nostra elit hymenaeos augue.',7,'953b9a80b4e55e16a17a7895192afd18','611','07CD3GF3','Senectus aliquet purus non scelerisque dignissim montes conubia aenean. Placerat duis accumsan inceptos urna magna nunc posuere penatibus duis bibendum ridiculus nisl phasellus. Dapibus ullamcorper auctor nulla tortor nunc lorem.',55),(7932593,'BPMspace 07CD3H8H','Sed porttitor consequat massa convallis curabitur interdum.',7,'6800a009cf4ed5905cdabed67cd93a08','425','07CD3H8H','Porta consequat mauris dolor maecenas sagittis massa curabitur est. Natoque duis inceptos euismod euismod nibh at natoque ornare morbi rutrum euismod commodo odio tincidunt. Velit eleifend facilisi rhoncus venenatis mollis quisque egestas semper.',55),(7932594,'BPMspace 07CD3I4C','Nulla tempus morbi blandit sed ridiculus leo.',8,'4d50c76f4e27c91724c35c1b0c0127ef','316','07CD3I4C','Quam mi hymenaeos enim dapibus commodo a posuere montes. Elit mi suspendisse quam diam nullam nonummy dictum blandit tempus curae; cursus gravida.',55),(7932595,'BPMspace 07CD3JJ8','Vivamus massa natoque fusce volutpat.',8,'c73ec9c5615e9a200a4e18b58b22eda0','816','07CD3JJ8','Faucibus aliquet eros dolor donec libero nisi orci lectus. Urna ullamcorper sed etiam vestibulum adipiscing dis ullamcorper volutpat eget. Class ac quam proin lectus vel magna morbi eu sagittis. Cubilia lacinia parturient aliquam dolor tortor turpis suspendisse neque. Sociis duis nisl hymenaeos volutpat tempus ligula.',55),(7932596,'BPMspace 07CD3KMB','Nisl eleifend in donec tempus sed inceptos.',8,'e5766fb5a32a354bf9be2dc6c9bd536e','939','07CD3KMB','Sociosqu purus donec sapien iaculis libero conubia fames cubilia. Pellentesque taciti fringilla augue interdum quis nisi posuere ridiculus pretium facilisis fusce sapien velit. Eget tincidunt quam blandit dis praesent volutpat sociis dictum justo molestie.',55),(7932597,'BPMspace 07CD3L14','Pellentesque eleifend dapibus dapibus habitant eleifend.',8,'4564b939fd30d0be21d0a773979c2c4f','284','07CD3L14','Ultricies blandit pede ante et dui enim nostra feugiat. Ad pharetra id senectus viverra magna libero ridiculus morbi justo lacinia suscipit adipiscing nascetur. Varius natoque viverra erat faucibus sagittis ad pretium nec placerat quis placerat dui venenatis. Consequat ac penatibus fringilla ornare est id at.',55),(7932598,'BPMspace 07CD3MF4','Ullamcorper ultricies tempor non ipsum donec.',6,'b8af6d5a5a8eb54becdf80b292695418','756','07CD3MF4','Viverra lorem in mattis integer ligula arcu vestibulum pharetra. Interdum morbi metus velit erat inceptos dignissim sagittis id magnis fringilla donec. Malesuada justo netus placerat posuere luctus eget pulvinar ad. Elit parturient nam sapien.',55);
/*!40000 ALTER TABLE `coms_certificate` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  `coms_certificate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`coms_certificate_participant_id`),
  KEY `fk_1_certificate_id_idx` (`coms_certificate_id`),
  KEY `state_id_fk06` (`state_id`),
  KEY `fk_2_coms_participant_id_idx` (`coms_participant_id`),
  CONSTRAINT `fk_1_certificate_id` FOREIGN KEY (`coms_certificate_id`) REFERENCES `coms_certificate` (`coms_certificate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_2_coms_participant_id` FOREIGN KEY (`coms_participant_id`) REFERENCES `coms_participant` (`coms_participant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk06` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123727 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_certificate_participant`
--

LOCK TABLES `coms_certificate_participant` WRITE;
/*!40000 ALTER TABLE `coms_certificate_participant` DISABLE KEYS */;
INSERT INTO `coms_certificate_participant` VALUES (1655,'2011-12-28',NULL,'cc42acc8ce334185e0193753adb6cb77','836','0001IH0S',7932574,112932,NULL,NULL),(3033,'2011-11-09',NULL,'272e11700558e27be60f7489d2d782e7','160','0002SI28',7932568,1,NULL,NULL),(4056,'2010-08-11',NULL,'9529fbba677729d3206b3b9073d1e9ca','610','0003RPH2',7932574,112964,NULL,NULL),(7584,'2011-07-04',NULL,'44d5ec303a81339c0d05ec3cab0fccfa','281','00077EGP',7932577,112972,NULL,NULL),(8213,'2010-12-31',NULL,'0b3f44d9054402de39441e165a4bdfe0','460','0007QKUK',7932574,112981,NULL,NULL),(9644,'2011-04-27',NULL,'cfa3a0bc94975cb9c346a585ccb3ad9e','850','00096API',7932574,112943,NULL,NULL),(9819,'2010-10-29',NULL,'373cb8cd58cad5f1309b31c56e2d5a83','226','0009BL2Q',7932574,112983,NULL,NULL),(9871,'2011-10-25',NULL,'4bd6a600d4cb755c07712c599a95da2b','310','0009D7UE',7932574,112978,NULL,NULL),(10220,'2011-01-16',NULL,'da51e350898546dbafd0fd2d19540e44','894','0009NTAU',7932574,112979,NULL,NULL),(10282,'2011-11-16',NULL,'9b5474e725b0f83708e4b6dfa55b2512','636','0009PPKC',7932567,1,NULL,'testname.pdf'),(10691,'2010-05-20',NULL,'77b88288ebae7b17b7c8610a48c40dd1','490','000A68T2',7932574,112955,NULL,NULL),(10692,'2011-02-27',NULL,'8640ff6ca914c9855203ac93e4c05119','549','000A69U5',7932569,1,NULL,NULL),(10721,'2011-11-27',NULL,'9012aff7c8ebda670a1c7a20eee7322d','590','000A769M',7932574,112927,NULL,NULL),(10780,'2011-08-18',NULL,'a12f69495f41bb3b637ba1b6238884d6','660','000A8VVK',7932576,1,NULL,NULL),(11939,'2011-10-17',NULL,'412f1f1340a245ffec9fb8d47654da57','266','000BCBE2',7932574,112974,NULL,NULL),(12947,'2011-12-11',NULL,'16ad66b2d7d7eda19f34e2f6197e2236','928','000CB4EO',7932574,112921,NULL,NULL),(13200,'2010-08-25',NULL,'864dc00769bd71798c589f363eb7d222','550','000CIR56',7932574,112924,NULL,NULL),(14301,'2011-11-16',NULL,'901e70da072bc616caa6337421abe4ae','590','000DKECM',7932583,1,NULL,NULL),(14335,'2011-09-11',NULL,'4c4f120e57ea9448ccb7a07c48df40ff','312','000DLFAG',7932577,112971,NULL,NULL),(19027,'2012-01-02',NULL,'fee63dbf9ecae028b17151670b5945ff','104','000I4L50',7932598,112994,NULL,NULL),(21730,'2012-04-22',NULL,'0c8fc7adb07a67b40a6fd3093b8865a8','514','000KN56I',7932572,112971,NULL,NULL),(21914,'2011-05-02',NULL,'d84f9ebccf1b062f6dce85d56fe09420','886','000KSP86',7932574,112936,NULL,NULL),(22073,'2010-10-29',NULL,'2aac3124e77bcbfd5d0033a31ada2f55','174','000L1JQM',7932574,112937,NULL,NULL),(22725,'2010-06-02',NULL,'52f244f9df0168a1f9b62b9e17b3e963','339','000LLGMR',7932574,112953,NULL,NULL),(24084,'2010-10-06',NULL,'7a6cf796456b6d7c4c2bde93dd17c682','501','000MV00L',7932595,1,NULL,NULL),(24330,'2011-05-22',NULL,'aa799ad70bea3029d4141c7b773c1a46','698','000N6GEA',7932583,112970,NULL,NULL),(24526,'2011-08-14',NULL,'0b0ec6cad67953b011ceb4e83e6b18e7','452','000NCFJK',7932574,112962,NULL,NULL),(25075,'2010-12-07',NULL,'3e6bf902e857e7ce80846480c79ded99','255','000NT7HN',7932597,1,NULL,'2015-01-01-ITEMO SCRUM Foundation-[00000QFE]-Doe-Jane.pdf'),(26463,'2011-11-21',NULL,'b6034e2aec7cf857f86ec2322eee1180','745','000P7JG1',7932574,112946,NULL,NULL),(28887,'2011-12-14',NULL,'f0ab8e556d0cbb5c0e4201791cfaeae0','985','000RHITH',7932574,112918,NULL,NULL),(29484,'2010-10-28',NULL,'c6c07dc0686f5f5bca5c9794e8c44ffc','814','000S3POE',7932574,112968,NULL,NULL),(32703,'2010-06-07',NULL,'7dd99c4f451d71fda4133b730b054d09','515','000V610R',7932574,112951,NULL,NULL),(33293,'2011-01-16',NULL,'d66d7531860ea50930a6d1280ae9f5e3','878','000VO1HM',7932581,1,NULL,NULL),(35050,'2011-01-21',NULL,'8f9b9fd0f3d4fdb8e07c3c7b1640d9b7','588','0011DL2S',7932574,112952,NULL,NULL),(36394,'2011-02-11',NULL,'b9e8886808531456cd2f4bb4e718e22b','761','0012MLO9',7932592,1,NULL,NULL),(37346,'2011-08-24',NULL,'75701c7e77692e6195337368265ab985','481','0013JN5H',7932573,1,NULL,NULL),(39164,'2012-02-27',NULL,'022e17ea8e4b56279362591de2d4794d','892','0015B6US',7932577,1,NULL,NULL),(39248,'2011-04-02',NULL,'92c9627a1529f28cb04691b9fe1f6ec8','601','0015DOMP',7932579,1,NULL,NULL),(39471,'2011-06-21',NULL,'429be53185d62d6d41561471fdd129a1','272','0015KI58',7932575,1,NULL,NULL),(40430,'2010-08-31',NULL,'f999094362eeb32f2ef5a275991df98b','102','0016HQGM',7932574,112930,NULL,NULL),(41782,'2010-12-26',NULL,'363d66910c1e80925973c64d6e0f28a6','222','0017R2UE',7932574,112938,NULL,NULL),(42507,'2011-06-25',NULL,'6c8320275acb6a9ebf90845e7d9ea754','444','0018H75K',7932574,112965,NULL,NULL),(43174,'2011-06-25',NULL,'46ab5450fe949e0ee25a2f9530b71e24','289','00195ICH',7932574,112966,NULL,NULL),(43354,'2011-11-10',NULL,'5d1bfc800ab725e12f1ed161c3ba196a','381','0019B28D',7932572,112970,NULL,NULL),(45069,'2010-12-26',NULL,'0abab0b11a59f8e4b1df6e3f3f83bd7b','439','001AVD3V',7932574,112926,NULL,NULL),(47104,'2011-05-12',NULL,'cb1c772c359ae814c34a9c82352a77fb','831','001CTGPV',7932572,112972,NULL,NULL),(47286,'2011-10-27',NULL,'8ababfb3b5bfd90b512efe5304de5977','568','001D3298',7932574,112925,NULL,NULL),(47732,'2010-09-06',NULL,'59c9d333e920861c96299a5d6ecb3ecb','367','001DGLKF',7932574,112982,NULL,NULL),(51027,'2010-12-20',NULL,'baa67ffe986af10906830246751f8246','764','001GL7PK',7932596,1,NULL,NULL),(52525,'2011-01-22',NULL,'bbbff1ac390876499c81773c274878f8','769','001I2UM9',7932583,112971,NULL,NULL),(52919,'2010-10-31',NULL,'659724469b1616b7ddbffcd28e7c66f3','416','001IEV3O',7932574,112928,NULL,NULL),(56760,'2011-04-12',NULL,'5d7f740f45869e701edcb2bb129f59ae','382','001M461U',7932574,112984,NULL,NULL),(58379,'2011-01-17',NULL,'e614824e9d2d2593f59bca5c6425db06','942','001NLJL6',7932594,1,NULL,NULL),(59273,'2011-02-07',NULL,'c479cd6dfe9010e0f47bb49fdab10519','804','001OGSIC',7932583,112972,NULL,NULL),(64224,'2011-06-29',NULL,'19cdca9ec431ba4d99d3b2fc59709015','105','001T7UR9',7932574,112948,NULL,NULL),(64611,'2011-01-13',NULL,'73390cd6d99a35e120108b6e5c44cff2','471','001TJP4F',7932574,112931,NULL,NULL),(67022,'2012-02-29',NULL,'82f50411882c398411cfe0f94d8a77d1','536','001VTBM8',7932589,1,NULL,NULL),(68495,'2010-11-26',NULL,'fb8db03428fa70f7ffbe9b01ce134e84','103','0021A9NV',7932571,1,NULL,NULL),(69027,'2012-03-27',NULL,'5fdffef6b19aea41a1411580d7de4422','392','0021QHI0',7932574,112914,NULL,NULL),(69810,'2011-05-20',NULL,'b5c724fb6861c50a45726ce736eac8b8','744','0022IEHO',7932574,112915,NULL,NULL),(71732,'2010-12-05',NULL,'fb774c19f3511a5af40b08978b1d6764','103','0024D2S7',7932593,1,NULL,NULL),(72293,'2011-06-10',NULL,'1104ee86dba5b02932a7c577927ee38a','697','0024U7A1',7932574,112935,NULL,NULL),(76126,'2010-05-27',NULL,'fda2f44a2bb6137c4e67920d4a0074a3','103','0028J5SN',7932574,112967,NULL,NULL),(76764,'2011-12-23',NULL,'a7ed60cb598da717c4194725902422ba','687','00296LGF',7932588,1,NULL,NULL),(77633,'2010-05-02',NULL,'923a757e02cc0b6bfb8dc0bca186f7de','598','002A161U',7932574,112950,NULL,NULL),(78813,'2011-12-20',NULL,'76478fa3d7a419e06b5f27342f0eb99c','484','002B569C',7932574,112960,NULL,NULL),(79176,'2011-12-18',NULL,'26953a340d43e5b31ed8cda487e84eba','158','002BG8EU',7932598,112986,NULL,NULL),(79199,'2011-11-30',NULL,'161976cea3e3abfab96222ee23541f19','905','002BGVL1',7932574,112954,NULL,NULL),(79230,'2011-10-18',NULL,'b7ef0fdf88bda86c8e4dc9ff25c261ed','753','002BHTP1',7932574,112985,NULL,NULL),(80368,'2011-07-18',NULL,'facc14c5e2a33e5759ef717521af2328','102','002CKKF6',7932574,1,NULL,NULL),(82242,'2011-02-21',NULL,'fcb4b749eb825ba07647a78e38d134d7','103','002EDQHN',7932580,1,NULL,NULL),(83692,'2010-12-08',NULL,'bed9348bd05edc84217ad26fa852c7bc','781','002FQ37D',7932577,112970,NULL,NULL),(83860,'2011-08-29',NULL,'2487476ffe91055720cb2439010cb265','149','002FV6LL',7932570,1,NULL,NULL),(84055,'2010-11-11',NULL,'d0e8039fcee05fe320c9885ef781ae81','855','002G55PF',7932574,112975,NULL,NULL),(84266,'2012-03-10',NULL,'8464a0f970beb771d57482652711e58b','542','002GBJHE',7932574,112939,NULL,NULL),(84903,'2011-01-03',NULL,'652b0039ba4560a4149289ed805c34f1','414','002GV1FM',7932598,112989,NULL,NULL),(85074,'2011-10-05',NULL,'7f08d8843347bd557a1e0e93b136ff5e','520','002H48IO',7932574,112976,NULL,NULL),(86201,'2010-08-14',NULL,'cd806cf2ff4d66034cb4285c97ef4ff9','841','002I6LFH',7932587,1,NULL,NULL),(86243,'2012-01-25',NULL,'504618eee52cc2e8a6c6fca09ee458fd','328','002I7U00',7932578,1,NULL,NULL),(86616,'2010-12-08',NULL,'d3f954e0c0d60c4e50746123374197f2','868','002IJAP4',7932591,1,NULL,NULL),(88255,'2011-10-09',NULL,'65036bf9cef9acc969c140b98a70ccfb','413','002K5ATL',7932574,112977,NULL,NULL),(90555,'2010-08-15',NULL,'002e63c044dab9807015038e827459d3','742','002MBHAU',7932598,112993,NULL,NULL),(90875,'2011-03-29',NULL,'d6f12bd2eeff2104deee8f11ad177abc','880','002ML9V8',7932574,112944,NULL,NULL),(91328,'2011-09-30',NULL,'368fc718daabde3b42f69ebf018f6747','223','002N33MV',7932590,1,NULL,NULL),(94761,'2010-09-05',NULL,'4127e7e8e64f30eeb3f3b43eee06589d','266','002QBS9I',7932574,112933,NULL,NULL),(95413,'2010-09-21',NULL,'366425700da51f66b270d6ad114e1f09','222','002QVOV6',7932574,112949,NULL,NULL),(97777,'2011-10-10',NULL,'9c7b2a5993b53193145e794093962d67','640','002T7TV8',7932574,112923,NULL,NULL),(98043,'2011-05-10',NULL,'660b457bcd2d07da6118f5093f4b610a','417','002TG1GP',7932574,112920,NULL,NULL),(99296,'2011-02-09',NULL,'ce0d191bf78a81e7a451cb7c7c6c7e58','843','002UM9IB',7932572,1,NULL,NULL);
/*!40000 ALTER TABLE `coms_certificate_participant` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_certificate_type`
--

LOCK TABLES `coms_certificate_type` WRITE;
/*!40000 ALTER TABLE `coms_certificate_type` DISABLE KEYS */;
INSERT INTO `coms_certificate_type` VALUES (1,'role'),(2,'exam'),(3,'training'),(4,'trainer'),(5,'training organisation'),(6,'FOREIGN'),(7,'CUSTOMER 1 role'),(8,'CUSTOMER 2 Exam');
/*!40000 ALTER TABLE `coms_certificate_type` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_delivery_type`
--

LOCK TABLES `coms_delivery_type` WRITE;
/*!40000 ALTER TABLE `coms_delivery_type` DISABLE KEYS */;
INSERT INTO `coms_delivery_type` VALUES (4,'ATO_BULK_PAPERBASED'),(5,'ATO_SINGLE_ONLINE'),(6,'SELF_SINGLE_ONLINE');
/*!40000 ALTER TABLE `coms_delivery_type` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  `coms_exam_description` longtext,
  PRIMARY KEY (`coms_exam_id`),
  KEY `coms_exam_language_id_fk1_idx` (`coms_exam_language_id`),
  KEY `state_id_fk_131312` (`state_id`),
  CONSTRAINT `coms_exam_language_id_fk1` FOREIGN KEY (`coms_exam_language_id`) REFERENCES `coms_language` (`coms_language_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk_131312` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_exam`
--

LOCK TABLES `coms_exam` WRITE;
/*!40000 ALTER TABLE `coms_exam` DISABLE KEYS */;
INSERT INTO `coms_exam` VALUES (157281,'BPMspace EXAM 157281',5,NULL,77,NULL),(157282,'BPMspace EXAM 157282',5,NULL,77,NULL),(157283,'BPMspace EXAM 157283',5,NULL,77,NULL),(157284,'BPMspace EXAM 157284',5,NULL,77,NULL),(157285,'BPMspace EXAM 157285',5,NULL,77,NULL),(157286,'BPMspace EXAM 157286',5,NULL,77,NULL),(157287,'BPMspace EXAM 157287',5,NULL,76,NULL),(157288,'BPMspace EXAM 157288',5,NULL,76,NULL),(157289,'BPMspace EXAM 157289',5,NULL,76,NULL),(157290,'BPMspace EXAM 157290',5,NULL,76,NULL),(157291,'BPMspace EXAM 157291',5,NULL,76,NULL),(157292,'BPMspace EXAM 157292',5,NULL,76,NULL),(157293,'BPMspace EXAM 157293',5,NULL,76,NULL),(157294,'BPMspace EXAM 157294',5,NULL,77,NULL),(157295,'BPMspace EXAM 157295',5,NULL,76,NULL),(157296,'BPMspace EXAM 157296',5,NULL,76,NULL),(157297,'BPMspace EXAM 157297',5,NULL,76,NULL),(157298,'BPMspace EXAM 157298',5,NULL,76,NULL);
/*!40000 ALTER TABLE `coms_exam` ENABLE KEYS */;
UNLOCK TABLES;

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
  `coms_exam_event_location` varchar(256) DEFAULT NULL,
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
  KEY `coms_proctor_id_fk1_idx` (`coms_proctor_id`),
  CONSTRAINT `coms_delivery_type_id_fk1` FOREIGN KEY (`coms_delivery_type_id`) REFERENCES `coms_delivery_type` (`coms_delivery_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_exam_id_fk1` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_proctor_id_fk1` FOREIGN KEY (`coms_proctor_id`) REFERENCES `coms_proctor` (`coms_proctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_org_id_fk1` FOREIGN KEY (`coms_training_org_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=876068 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_exam_event`
--

LOCK TABLES `coms_exam_event` WRITE;
/*!40000 ALTER TABLE `coms_exam_event` DISABLE KEYS */;
INSERT INTO `coms_exam_event` VALUES (876043,'00Q3ENE0','adee7c8996cb8f30adb8f6188fd72828','712','2011-07-19 - [00Q3ENE0] - DE - BPMspace EXAM 157281 - Torres',157281,38,'2011-07-19 00:00:00',NULL,4,'Vestibulum ac class lobortis aenean rhoncus quam lobortis aliquet. Ac nascetur sagittis eros urna tortor phasellus quisque proin inceptos quisque nulla sociis facilisi. Aenean dui vel curabitur turpis blandit posuere euismod feugiat ridiculus tincidunt con',773533,17239803,NULL,NULL,26539818),(876044,'00Q3EOK2','16b6991c49e4c0ee68b6b73f43221b93','930','2010-09-11 - [00Q3EOK2] - DE - BPMspace EXAM 157281 - Torres',157281,38,'2010-09-11 00:00:00',NULL,5,'Varius nunc fringilla ridiculus tellus aliquet nibh senectus habitant. Iaculis vivamus sociis duis nisi felis sem congue consectetuer elit. Porttitor tempor erat parturient mauris non magna nonummy nisi cum venenatis imperdiet accumsan tristique metus. Qua',773533,17239803,NULL,NULL,26539816),(876045,'00Q3EPJH','e4f007fa1870f77e23e0b772d5998202','937','2010-07-14 - [00Q3EPJH] - DE - BPMspace EXAM 157281 - Torres',157281,38,'2010-07-14 00:00:00',NULL,5,'Justo lacus tincidunt dignissim eu sollicitudin integer lacus ut. Fusce interdum a rutrum ut fringilla suspendisse faucibus vivamus vestibulum ultricies posuere. Quam laoreet tincidunt dapibus dolor magna semper odio purus scelerisque sagittis molestie eui',773533,17239803,NULL,NULL,26539816),(876046,'00Q3EPSQ','3924b2b371c5bdfe353b8405fa6a397e','234','2010-05-02 - [00Q3EPSQ] - DE - BPMspace EXAM 157286 - Wilson',157286,37,'2010-05-02 00:00:00',NULL,4,'Lectus consectetuer euismod class nostra sed diam magna tempor. Congue porta dignissim sociis nisl mattis primis conubia litora tortor cras vivamus mi parturient pretium. Aptent gravida natoque scelerisque facilisis class netus odio ligula fusce gravida po',773532,17239804,NULL,NULL,26539817),(876047,'00Q3ERAO','ac02866d7dbefb72f16db0468600057e','704','2011-06-25 - [00Q3ERAO] - DE - BPMspace EXAM 157286 - Wilson',157286,39,'2011-06-25 00:00:00',NULL,4,'Aptent nonummy tincidunt nulla ligula id mi magnis tempus. Class orci urna primis suspendisse condimentum vehicula leo gravida interdum vitae placerat molestie natoque enim. Ad lectus consectetuer euismod blandit nibh per nostra at luctus dapibus leo.',773532,17239804,NULL,NULL,26539817),(876048,'00Q3ERUP','545d6e6e30046688aef3fb4ff2f3a062','345','2010-08-12 - [00Q3ERUP] - DE - BPMspace EXAM 157281 - Wilson',157281,33,'2010-08-12 00:00:00',NULL,4,'Porttitor pede dolor accumsan luctus faucibus cubilia sapien morbi. Blandit lacus sodales varius dui donec justo leo vestibulum mus sociis. Ante primis malesuada facilisi vitae accumsan convallis nulla primis quisque orci ultricies. Quam ornare viverra a a',773532,17239816,NULL,NULL,26539816),(876049,'00Q3ETHB','1785a0490e60e5e811ed26badde7c30f','963','2011-07-29 - [00Q3ETHB] - DE - BPMspace EXAM 157285 - Wilson',157285,33,'2011-07-29 00:00:00',NULL,4,'Neque sociis lectus pellentesque aliquam cursus proin dictum pretium. Curabitur netus lorem natoque leo mauris eleifend odio magna. Conubia condimentum cubilia interdum netus praesent sociis adipiscing nostra accumsan dui aenean. Laoreet orci urna quam veh',773532,17239804,NULL,NULL,26539821),(876050,'00Q3ETNB','260a20686699a2c268a7b42f1046fcd4','155','2010-05-30 - [00Q3ETNB] - DE - BPMspace EXAM 157282 - Wilson',157282,33,'2010-05-30 00:00:00',NULL,4,'Accumsan dapibus sodales placerat vehicula pellentesque magna laoreet phasellus. Posuere congue ipsum porta eu faucibus primis porta fringilla mus. Dignissim nunc nostra dapibus accumsan mus posuere ullamcorper libero maecenas ante sit vitae laoreet. Portt',773532,17239808,NULL,NULL,26539816),(876051,'00Q3EUTM','5d6cd344cd48c922f235ddf9ab81a1b1','382','2010-11-04 - [00Q3EUTM] - DE - BPMspace EXAM 157281 - Wilson',157281,33,'2010-11-04 00:00:00',NULL,4,'Molestie tempor sapien fusce faucibus mus semper laoreet porta. Ad justo ad sociosqu curae; etiam ullamcorper pulvinar velit nisl. Proin gravida montes pellentesque porttitor montes nibh fermentum.',773532,17239811,NULL,NULL,26539822),(876052,'00Q3F073','1143b55af354b5111c92bcfd5ee4527e','707','2012-01-16 - [00Q3F073] - DE - BPMspace EXAM 157285 - Wilson',157285,33,'2012-01-16 00:00:00',NULL,4,'Velit tristique odio magna mauris condimentum viverra nullam dictum. Odio bibendum mattis etiam tempor natoque dis est rhoncus. Sit augue tortor est orci lacinia curabitur montes duis. Praesent cursus.',773532,17239804,NULL,NULL,26539821),(876053,'00Q3F15M','a7b525f7a03bf13d41cf57f2338e85d5','686','2011-09-13 - [00Q3F15M] - DE - BPMspace EXAM 157294 - Torres',157294,33,'2011-09-13 00:00:00',NULL,4,'Natoque arcu non suscipit ligula placerat convallis neque magna. Aliquam auctor eros class porta duis viverra eu lobortis lobortis turpis dignissim egestas. A integer volutpat risus turpis eget justo in penatibus duis at porta. Iaculis venenatis pretium pr',773533,17239803,NULL,NULL,26539818),(876054,'00Q3F231','98ac0e5f7d63501887085ad1e02c5c6a','625','2011-07-02 - [00Q3F231] - DE - BPMspace EXAM 157281 - Wilson',157281,33,'2011-07-02 00:00:00',NULL,4,'Vel velit ut semper eros taciti nam dapibus dignissim. Nunc suscipit imperdiet fringilla montes per sapien ultricies et nec aptent nam. Lacinia elit vestibulum convallis quis iaculis natoque quam amet vitae rhoncus tincidunt cum. Varius magnis nostra nonum',773532,17239805,NULL,NULL,26539816),(876055,'00Q3F34J','aab8239440b3c0071b045f843d9dd27d','699','2011-12-31 - [00Q3F34J] - DE - BPMspace EXAM 157285 - Wilson',157285,33,'2011-12-31 00:00:00',NULL,4,'Porttitor non ultricies sed eros torquent pharetra purus penatibus. Pede torquent magnis risus lacus rutrum ornare torquent molestie. Eleifend etiam phasellus nostra accumsan duis arcu parturient commodo montes interdum inceptos pulvinar mollis leo. Quis u',773532,17239805,NULL,NULL,26539816),(876056,'00Q3F3I0','1f4b424508317849ed07536c0ef2bd89','128','2011-02-24 - [00Q3F3I0] - DE - BPMspace EXAM 157281 - Bailey',157281,33,'2011-02-24 00:00:00',NULL,4,'Suscipit lectus nisi phasellus ornare dictum venenatis facilisi netus. Lectus ante vel nunc fames odio et ligula laoreet. Pede vehicula ridiculus adipiscing sagittis tellus accumsan laoreet consequat fermentum enim etiam orci inceptos. Turpis mattis sed ma',773534,17239817,NULL,NULL,26539820),(876057,'00Q3F53O','affe184daff45283b80395ad52d6ce5c','720','2011-12-10 - [00Q3F53O] - DE - BPMspace EXAM 157294 - Wilson',157294,33,'2011-12-10 00:00:00',NULL,4,'Habitant tortor litora natoque maecenas placerat ante cursus penatibus. In etiam elit in dolor sociosqu nibh ligula luctus accumsan ornare eget diam egestas neque. Iaculis dictum sit neque lacinia fusce litora eros varius ut. Lorem risus massa cum est tinc',773532,17239818,NULL,NULL,26539823),(876058,'00Q3F61K','a50a9e170846ac56649c16398e191b6b','676','2010-08-10 - [00Q3F61K] - DE - BPMspace EXAM 157281 - Wilson',157281,33,'2010-08-10 00:00:00',NULL,4,'Tortor condimentum sollicitudin ullamcorper aptent metus lacinia mollis lacinia. Elementum posuere sit ac nam rhoncus dapibus nam est parturient massa montes. Euismod ultrices proin tristique feugiat ut porta placerat hymenaeos purus. Turpis per.',773532,17239804,NULL,NULL,26539821),(876059,'00Q3F6FL','1e85e8bb8ea09458f50d37ddc2b8af6e','125','2011-08-20 - [00Q3F6FL] - DE - BPMspace EXAM 157284 - Wilson',157284,33,'2011-08-20 00:00:00',NULL,4,'Dapibus dictum lacinia mollis laoreet mollis inceptos fusce mollis. Penatibus interdum volutpat risus torquent cras ad per fringilla nullam curae; tristique at. Suspendisse maecenas sapien morbi.',773532,17239806,NULL,NULL,26539824),(876060,'00Q3F88O','e8811c0018c82b285c329cf551793cae','952','2011-01-17 - [00Q3F88O] - DE - BPMspace EXAM 157294 - Wilson',157294,33,'2011-01-17 00:00:00',NULL,4,'Parturient sollicitudin euismod tempus nam conubia vitae massa netus. Fames faucibus nullam duis dis fringilla auctor id odio commodo natoque. Adipiscing luctus facilisis blandit.',773532,17239802,NULL,NULL,26539818),(876061,'00Q3F8FD','286400019bdb8fc38fd941a614690fd8','165','2011-05-29 - [00Q3F8FD] - DE - BPMspace EXAM 157295 - Wilson',157295,33,'2011-05-29 00:00:00',NULL,4,'Metus faucibus ac commodo maecenas blandit adipiscing suscipit donec. Porta congue lorem ac nullam convallis risus mattis dictum interdum lobortis commodo. Fermentum elit est nibh curae; aenean penatibus eu inceptos. Inceptos nulla.',773532,17239802,NULL,NULL,26539818),(876062,'00Q3F9GA','3540a91cbd17740eabec5b743febb750','218','2012-03-20 - [00Q3F9GA] - DE - BPMspace EXAM 157296 - Wilson',157296,33,'2012-03-20 00:00:00',NULL,4,'Interdum lorem convallis est urna tempus nostra leo fringilla. Sed vel id vitae sapien aenean quis porta elit consectetuer taciti. Enim fusce vehicula proin sem tempor vehicula congue pretium eu erat lacus fusce lectus curabitur. Venenatis hymenaeos ultric',773532,17239802,NULL,NULL,26539818),(876063,'00Q3FB23','c6326e92a24628c1bc3e289b01a10a00','811','2010-12-13 - [00Q3FB23] - DE - BPMspace EXAM 157286 - Wilson',157286,33,'2010-12-13 00:00:00',NULL,4,'Aliquet senectus viverra magnis maecenas ultricies donec elementum nibh. Hymenaeos cubilia nulla placerat nostra vivamus bibendum lobortis at vel. Ad hymenaeos quis placerat donec varius congue praesent erat cubilia varius facilisi orci. Pulvinar porta eti',773532,17239804,NULL,NULL,26539821),(876064,'00Q3FC5T','e9cf19f5b1934a4b71a49a407d4af677','957','2010-12-14 - [00Q3FC5T] - DE - BPMspace EXAM 157282 - Wilson',157282,33,'2010-12-14 00:00:00',NULL,4,'Mus eros parturient mattis nec fusce viverra urna porttitor. Malesuada faucibus auctor laoreet ullamcorper felis sociosqu erat quam vivamus penatibus lacinia at augue. Sagittis fermentum enim facilisi praesent porta habitant pede erat euismod. Nascetur.',773532,17239810,NULL,NULL,26539835),(876065,'00Q3FD6A','f2b0f75da884d9e60aaeadbb2cb0ef0d','994','2011-10-27 - [00Q3FD6A] - DE - BPMspace EXAM 157285 - Wilson',157285,33,'2011-10-27 00:00:00',NULL,4,'A suscipit eu suscipit lectus nisi pellentesque natoque sit. Sagittis netus mus a habitant quisque quisque mi fermentum arcu gravida mi.',773532,17239804,NULL,NULL,26539821),(876066,'00Q3FE4S','ed4e2dc5563ba76ce0cb6f5c65f8ebde','972','2011-02-27 - [00Q3FE4S] - DE - BPMspace EXAM 157281 - Bailey',157281,33,'2011-02-27 00:00:00',NULL,4,'Convallis sollicitudin taciti rhoncus elementum torquent quisque conubia iaculis. Consectetuer erat ut ullamcorper risus cras imperdiet lobortis diam mauris accumsan montes. Pulvinar pellentesque cras porta at erat auctor.',773534,17239817,NULL,NULL,26539837),(876067,'00Q3FEL5','787ebaf72150100e6788cbe5f630b927','493','2011-07-10 - [00Q3FEL5] - DE - BPMspace EXAM 157282 - Bailey',157282,33,'2011-07-10 00:00:00',NULL,4,'Ad semper aliquam posuere lorem donec nullam mi pretium. Consectetuer lacus quam massa erat ridiculus condimentum dolor placerat. Enim ornare massa natoque fusce a vestibulum taciti lacus metus fames viverra aliquet eget aenean. Cum laoreet pharetra conval',773534,17239817,NULL,NULL,26539838);
/*!40000 ALTER TABLE `coms_exam_event` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_exam_training`
--

LOCK TABLES `coms_exam_training` WRITE;
/*!40000 ALTER TABLE `coms_exam_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_exam_training` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_exam_version`
--

LOCK TABLES `coms_exam_version` WRITE;
/*!40000 ALTER TABLE `coms_exam_version` DISABLE KEYS */;
INSERT INTO `coms_exam_version` VALUES (6712465,'SET 6712465',157281),(6712466,'SET 6712466',157281);
/*!40000 ALTER TABLE `coms_exam_version` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_language`
--

LOCK TABLES `coms_language` WRITE;
/*!40000 ALTER TABLE `coms_language` DISABLE KEYS */;
INSERT INTO `coms_language` VALUES (5,'deutsch','DE'),(6,'english','EN'),(7,'francais','FR'),(8,'espanol','ES');
/*!40000 ALTER TABLE `coms_language` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=113109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_participant`
--

LOCK TABLES `coms_participant` WRITE;
/*!40000 ALTER TABLE `coms_participant` DISABLE KEYS */;
INSERT INTO `coms_participant` VALUES (1,'female','Barnes','Kevin',0,'Tempor','Dolor','1993-11-06',0),(112913,'male','Stewart','Jerry',0,'Elit','Aenean','1992-07-14',0),(112914,'male','Foster','Michael',0,'Magnis','Hendrerit','1977-03-04',0),(112915,'male','Thompson','Jose',0,'Nunc','Duis','1988-01-06',0),(112916,'female','Murphy','Michael',0,'Non','Mus','1982-11-03',0),(112917,'male','Powell','Susan',0,'Penatibus','Senectus','1987-04-09',0),(112918,'male','Gonzales','Janet',0,'Tincidunt','Accumsan','1988-11-06',0),(112919,'female','Harris','Raymond',0,'Magna','Senectus','1979-08-28',0),(112920,'male','Long','Andrew',0,'Dolor','Ornare','1985-03-29',0),(112921,'male','Smith','Jessica',0,'Magnis','Hymenaeos','1980-05-26',0),(112922,'female','Ward','Cynthia',0,'Lacinia','Mattis','1975-10-31',0),(112923,'male','Carter','Janet',0,'Tristique','Amet','1989-01-06',0),(112924,'male','Jackson','Melissa',0,'Elementum','Sagittis','1987-07-27',0),(112925,'male','Long','Gary',0,'Bibendum','Mauris','1989-09-01',0),(112926,'male','Jenkins','James',0,'Nascetur','Metus','1983-01-22',0),(112927,'male','Garcia','Virginia',0,'Scelerisque','Nullam','1981-05-08',0),(112928,'male','Barnes','Robert',0,'Cum','Risus','1978-05-08',0),(112929,'male','Hall','Peter',0,'Vehicula','Vivamus','1987-01-26',0),(112930,'male','Clark','Donald',0,'Dolor','Non','1983-05-19',0),(112931,'male','Young','Joseph',0,'Nec','Odio','1988-11-03',0),(112932,'male','Cooper','William',0,'Nonummy','Fusce','1984-02-28',0),(112933,'male','Simmons','Helen',0,'Praesent','Mi','1979-08-19',0),(112934,'male','Barnes','Donna',0,'Netus','Donec','1982-01-31',0),(112935,'male','James','Larry',0,'Quisque','Sapien','1984-12-18',0),(112936,'male','Moore','Roger',0,'Massa','Taciti','1988-06-12',0),(112937,'male','Simmons','Eric',0,'Luctus','Dignissim','1981-05-31',0),(112938,'female','Carter','Michael',0,'Mi','Malesuada','1988-08-02',0),(112939,'male','Cooper','Jennifer',0,'Felis','Venenatis','1992-02-19',0),(112940,'female','Bryant','Paul',0,'Aliquet','Leo','1978-05-21',0),(112941,'male','Young','Carl',0,'Eu','Lacus','1980-01-17',0),(112942,'male','Parker','Scott',0,'Vel','Semper','1983-03-09',0),(112943,'female','Howard','David',0,'Laoreet','Ornare','1993-02-09',0),(112944,'male','Brooks','Mary',0,'Euismod','Egestas','1989-10-04',0),(112945,'male','Baker','Stephen',0,'Fames','Mauris','1979-11-07',0),(112946,'male','Miller','Eric',0,'Feugiat','Mollis','1994-03-07',0),(112947,'male','Garcia','Barbara',0,'Vivamus','Curabitur','1981-07-22',0),(112948,'female','Hughes','Gary',0,'Sem','Viverra','1988-05-12',0),(112949,'male','Hernandez','Kimberly',0,'Eleifend','Euismod','1980-12-03',0),(112950,'male','Washington','Andrew',0,'Pharetra','Eleifend','1975-11-12',0),(112951,'female','King','Sharon',0,'Faucibus','Facilisi','1979-02-04',0),(112952,'male','King','Janet',0,'Lacinia','Senectus','1985-09-09',0),(112953,'male','Carter','Kevin',0,'Suspendisse','Curabitur','1982-12-06',0),(112954,'male','Bell','Debra',0,'Imperdiet','Porttitor','1979-05-19',0),(112955,'male','Perez','Jason',0,'Cras','Turpis','1978-01-31',0),(112956,'female','Cook','Edward',0,'Sem','Tristique','1989-09-26',0),(112957,'male','Brooks','Jessica',0,'Libero','Vel','1993-06-07',0),(112958,'male','Campbell','Melissa',0,'Egestas','Eu','1990-02-19',0),(112959,'male','Gonzales','Deborah',0,'Quisque','Lacus','1983-03-14',0),(112960,'female','Cook','Amy',0,'Posuere','Nulla','1979-01-19',0),(112961,'male','Flores','Janet',0,'Mauris','Curabitur','1987-05-03',0),(112962,'male','Cook','James',0,'Ridiculus','Velit','1978-05-01',0),(112963,'male','Lopez','Susan',0,'Parturient','Arcu','1992-11-20',0),(112964,'female','Green','Jennifer',0,'Eros','Rhoncus','1990-07-25',0),(112965,'female','Baker','Cynthia',0,'Sem','Ac','1984-12-11',0),(112966,'male','Ramirez','Barbara',0,'Ad','Luctus','1991-11-12',0),(112967,'male','Nelson','Sarah',0,'Enim','Ultricies','1986-12-31',0),(112968,'male','Collins','Kathleen',0,'Morbi','Montes','1985-06-20',0),(112969,'female','Campbell','Jerry',0,'Bibendum','Maecenas','1979-07-11',0),(112970,'male','Miller','Stephen',0,'Tristique','Suspendisse','1987-11-21',0),(112971,'male','Rivera','Joseph',0,'Nam','Id','1980-05-07',0),(112972,'male','Jenkins','Sharon',0,'Iaculis','Convallis','1992-05-03',0),(112973,'male','Washington','Frances',0,'Facilisi','Lorem','1981-04-21',0),(112974,'male','Torres','Laura',0,'Per','Eleifend','1983-02-21',0),(112975,'male','Gray','Donald',0,'Velit','Metus','1982-10-27',0),(112976,'male','James','Michelle',0,'Pharetra','Placerat','1979-07-16',0),(112977,'male','Parker','Virginia',0,'Mattis','Varius','1986-01-11',0),(112978,'female','Davis','Eric',0,'Nec','Justo','1994-01-26',0),(112979,'male','Bell','Elizabeth',0,'Lobortis','In','1990-05-06',0),(112980,'female','Rodriguez','Walter',0,'Risus','Placerat','1978-06-19',0),(112981,'male','Cox','Raymond',0,'Curabitur','Elit','1986-04-12',0),(112982,'female','Price','Joseph',0,'Donec','Accumsan','1986-10-08',0),(112983,'male','Gray','Gregory',0,'Quis','Tortor','1975-06-15',0),(112984,'male','Rivera','Mary',0,'Egestas','Risus','1985-09-11',0),(112985,'male','Parker','Walter',0,'Quisque','Curabitur','1994-05-17',0),(112986,'female','Butler','Virginia',0,'Quis','Tortor','1975-07-12',0),(112987,'male','Johnson','Patricia',0,'Odio','Augue','1989-05-12',0),(112988,'male','Harris','Frank',0,'Elementum','Enim','1988-03-21',0),(112989,'male','Russell','Arthur',0,'Interdum','Sapien','1977-03-02',0),(112990,'male','Bennett','Jeffrey',0,'Hendrerit','Accumsan','1994-04-13',0),(112993,'male','Rogers','Harold',0,'Ante','Laoreet','1988-07-18',0),(112994,'female','Foster','Virginia',0,'Lacus','Pulvinar','1975-11-29',0),(112995,'male','Barnes','Marie',0,'Morbi','Et','1989-01-06',0),(112996,'male','Thomas','Jose',0,'Faucibus','Placerat','1990-10-03',0),(112997,'male','Harris','Ronald',0,'Tortor','Blandit','1979-08-31',0),(112998,'male','Martinez','Betty',0,'Fusce','Lacinia','1978-04-12',0),(112999,'	male	','Edwards','James',0,'Sollicitudin','Viverra','1975-06-06',0),(113000,'	male	','Lee','Margaret',0,'Fusce','Sollicitudin','1987-10-02',0),(113001,'	female	','Robinson','Jennifer',0,'Nec','Nisl','1979-11-30',0),(113002,'	female	','Simmons','Henry',0,'Est','Molestie','1988-12-15',0),(113003,'	female	','Walker','Margaret',0,'Eu','Euismod','1978-01-31',0),(113004,'	male	','Peterson','Joyce',0,'Magna','Fermentum','1983-11-09',0),(113005,'	male	','Moore','Joseph',0,'Fermentum','Risus','1983-04-12',0),(113006,'	male	','Kelly','Jessica',0,'Eleifend','Rhoncus','1988-10-02',0),(113007,'	male	','Garcia','Carolyn',0,'Vitae','Quam','1978-11-04',0),(113008,'	male	','Henderson','Cynthia',0,'Auctor','Adipiscing','1985-10-23',0),(113009,'	male	','Long','Joshua',0,'Mi','Pede','1979-05-03',0),(113010,'	male	','Moore','Stephanie',0,'Quis','Morbi','1975-04-30',0),(113011,'	male	','Mitchell','Linda',0,'Augue','Mollis','1992-06-19',0),(113012,'	male	','Ross','Kevin',0,'Sem','Neque','1991-08-22',0),(113013,'	male	','Rogers','Mark',0,'Porta','Netus','1982-05-18',0),(113014,'	male	','Ramirez','Kevin',0,'Inceptos','Magna','1987-04-26',0),(113015,'	male	','Adams','Mary',0,'Sociosqu','Nonummy','1977-04-05',0),(113016,'	male	','Lopez','Sandra',0,'Curae;','Et','1990-10-07',0),(113017,'	male	','Ramirez','Dorothy',0,'Primis','Felis','1985-07-16',0),(113018,'	male	','Peterson','Peter',0,'Phasellus','Semper','1981-12-05',0),(113019,'	male	','Wood','Henry',0,'Luctus','Bibendum','1991-09-08',0),(113020,'	female	','Brown','Jerry',0,'Erat','Libero','1978-03-19',0),(113021,'	male	','Jenkins','Raymond',0,'Etiam','Sit','1985-10-23',0),(113022,'	male	','Henderson','Gary',0,'Tincidunt','Eros','1976-12-13',0),(113023,'	female	','Hughes','Thomas',0,'Sociis','Sodales','1976-03-17',0),(113024,'male','Wilson','Daniel',0,'Ac','Primis','1993-01-17',0),(113025,'female','Martinez','Betty',0,'Dui','Curae;','1979-08-12',0),(113026,'female','Walker','Melissa',0,'Montes','Nam','1986-06-22',0),(113028,'female','Brown','Larry',0,'Sodales','Faucibus','1977-07-01',0),(113031,'female','Thomas','Karen',0,'Urna','Risus','1978-07-14',0),(113032,'female','King','James',0,'Ornare','Interdum','1991-09-09',0),(113033,'female','Torres','Henry',0,'Velit','Ac','1981-10-31',0),(113035,'male','Cooper','David',0,'Consequat','Eleifend','1985-07-15',0),(113036,'female','Roberts','Jeffrey',0,'Per','Dictum','1985-02-18',0),(113037,'male','Roberts','Eric',0,'Ultricies','Varius','1984-04-27',0),(113038,'male','Evans','Robert',0,'Scelerisque','Cursus','1983-10-24',0),(113039,'male','Alexander','Shirley',0,'Habitant','Curae;','1988-03-11',0),(113040,'male','Rogers','Martha',0,'Porttitor','Torquent','1988-07-27',0),(113041,'male','Ramirez','Jessica',0,'Sociosqu','Habitant','1990-06-01',0),(113042,'male','Edwards','Joseph',0,'Litora','Luctus','1976-09-19',0),(113043,'male','Howard','Robert',0,'Egestas','Leo','1986-06-25',0),(113044,'female','Miller','Eric',0,'Fusce','Netus','1981-06-26',0),(113045,'male','Collins','Melissa',0,'Nam','Eleifend','1994-12-24',0),(113046,'female','Flores','Shirley',0,'Laoreet','Fames','1989-01-21',0),(113047,'male','Patterson','Donald',0,'Hymenaeos','Laoreet','1992-01-01',0),(113048,'female','Flores','Arthur',0,'Morbi','Pulvinar','1987-10-12',0),(113049,'male','Bailey','Susan',0,'Id','Sagittis','1980-03-27',0),(113050,'male','Davis','Jose',0,'Fermentum','Id','1989-01-28',0),(113051,'male','Green','Rebecca',0,'Ridiculus','Mauris','1990-05-15',0),(113052,'female','Martinez','Stephen',0,'At','Facilisi','1990-06-15',0),(113053,'male','Diaz','Virginia',0,'Morbi','Ante','1988-06-12',0),(113054,'male','Nelson','Roger',0,'Amet','Donec','1987-05-25',0),(113055,'male','Hernandez','Frank',0,'Commodo','Pretium','1975-12-18',0),(113056,'female','Jones','Elizabeth',0,'Massa','Habitant','1988-12-27',0),(113057,'female','Bennett','Dennis',0,'Ullamcorper','Sed','1991-12-16',0),(113060,'male','Smith','Jessica',0,'Fames','Lectus','1993-07-28',0),(113063,'male','Richardson','Michelle',0,'Porttitor','Sagittis','1981-07-06',0),(113064,'female','Hill','Gregory',0,'Cubilia','Nullam','1984-08-02',0),(113065,'male','Wright','Charles',0,'Porta','Pharetra','1993-07-10',0),(113067,'male','Bennett','Charles',0,'Nec','Curabitur','1994-07-26',0),(113068,'male','Harris','Christine',0,'Phasellus','Blandit','1990-06-23',0),(113069,'male','Morgan','Jeffrey',0,'Leo','Vel','1993-08-20',0),(113070,'male','Washington','Joshua',0,'Convallis','Placerat','1980-04-21',0),(113071,'male','Brown','Sarah',0,'Libero','Nascetur','1977-06-10',0),(113072,'male','Walker','Henry',0,'Lacinia','Quam','1994-12-31',0),(113073,'male','Russell','Catherine',0,'Pede','Porttitor','1977-12-21',0),(113074,'male','James','Charles',0,'Nam','Penatibus','1991-04-07',0),(113075,'male','Flores','Barbara',0,'Dolor','Ante','1982-09-30',0),(113076,'male','Kelly','Angela',0,'Praesent','Lorem','1981-10-30',0),(113077,'female','Martinez','Arthur',0,'Dui','Ultricies','1993-09-09',0),(113078,'male','Morgan','Elizabeth',0,'Nibh','Tristique','1987-12-22',0),(113079,'male','Sanders','Carolyn',0,'Eu','Tristique','1981-01-09',0),(113080,'male','Johnson','Daniel',0,'Porttitor','Congue','1984-01-26',0),(113081,'male','Thomas','Betty',0,'Est','Dui','1986-09-12',0),(113082,'male','Thomas','Christine',0,'Dolor','Dapibus','1976-01-21',0),(113083,'male','Cox','David',0,'Odio','Ante','1995-03-13',0),(113084,'male','Peterson','Anthony',0,'Facilisis','Taciti','1976-09-20',0),(113085,'male','Harris','Jessica',0,'Et','Sodales','1982-09-06',0),(113086,'male','Edwards','Carol',0,'Maecenas','Consectetuer','1976-09-12',0),(113087,'male','Peterson','Lisa',0,'Metus','Consequat','1994-01-09',0),(113088,'male','Moore','Scott',0,'Nostra','Elit','1978-05-02',0),(113089,'female','Coleman','Eric',0,'Consectetuer','Laoreet','1992-10-15',0),(113090,'male','Allen','Kathleen',0,'Risus','Laoreet','1978-04-14',0),(113091,'male','Wilson','Arthur',0,'Torquent','Pede','1979-02-11',0),(113092,'male','Perry','Scott',0,'Duis','Ante','1991-04-15',0),(113093,'male','Rodriguez','Virginia',0,'Commodo','Fusce','1985-11-01',0),(113094,'male','Collins','Catherine',0,'Quam','Ultrices','1983-08-06',0),(113095,'male','Sanders','Jessica',0,'Cum','Turpis','1989-09-02',0),(113096,'male','Butler','Michelle',0,'Magna','Adipiscing','1977-08-08',0),(113097,'male','Davis','Catherine',0,'Mollis','Justo','1980-06-28',0),(113098,'male','Barnes','Joseph',0,'Suspendisse','Parturient','1984-08-01',0),(113099,'male','Hall','Douglas',0,'Primis','Mattis','1978-01-02',0),(113100,'male','Patterson','Ryan',0,'Inceptos','Malesuada','1977-04-26',0),(113101,'male','Scott','Ronald',0,'Taciti','Consectetuer','1990-01-20',0),(113102,'male','Williams','Carl',0,'Dictum','Enim','1986-11-17',0),(113103,'male','Hernandez','Andrew',0,'Torquent','Accumsan','1993-06-19',0),(113104,'male','Bennett','Maria',0,'Hendrerit','Senectus','1975-12-21',0),(113105,'male','Hall','Dorothy',0,'Laoreet','Faucibus','1977-09-21',0),(113106,'male','Baker','Jason',0,'Tincidunt','Nibh','1977-01-31',0),(113107,'female','Jackson','Carol',0,'Vel','Condimentum','1994-04-20',0),(113108,'male','Wood','Michael',0,'Risus','Leo','1978-03-20',0);
/*!40000 ALTER TABLE `coms_participant` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=875844 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_participant_email`
--

LOCK TABLES `coms_participant_email` WRITE;
/*!40000 ALTER TABLE `coms_participant_email` DISABLE KEYS */;
INSERT INTO `coms_participant_email` VALUES (875646,'gtcz.mfqnrvbujoruz@yahoo.com',112913),(875647,'dkra.wflonvpp@mail.com',112914),(875648,'psq_wlonxakyhdw@mail.com',112915),(875649,'cprhnq_giwlomukclaux@google.com',112916),(875650,'tolvfo.wbrfydwzli@yahoo.com',112917),(875651,'tshp.tlzovmzmnmu@live.com',112918),(875652,'kilz.vsbcijvd@mail.com',112919),(875653,'spxpyz.tjnodcbasrfdyhp@google.com',112920),(875654,'wakuwzk_pcsfxxwqnde@yahoo.com',112921),(875655,'vscj_gobpwmvqqzclz@yahoo.com',112922),(875656,'pmoil.vkoobshj@mail.com',112923),(875657,'jhglu_heyisrgfsv@mail.com',112924),(875658,'dxd_cqxnwwtemqux@yahoo.com',112925),(875659,'num_agfgpiwfglkv@mail.com',112926),(875660,'xwpgb_stqabgcsea@live.com',112927),(875661,'dsg_fxwruxdaxuhb@yahoo.com',112928),(875662,'slbpboo.ariowruyays@live.com',112929),(875663,'ldgpivg_uvujnnbtrrhk@google.com',112930),(875664,'wqnmaor_zkfuhblb@mail.com',112931),(875665,'iyvb.gmqtxeelqkdn@google.com',112932),(875666,'avzqr.zrlenbtney@google.com',112933),(875667,'qvi.kdlvtilcw@live.com',112934),(875668,'wefsnl_dqtwcxeecm@google.com',112935),(875669,'bztydww_fteoixpgiiu@mail.com',112936),(875670,'amjzo_zcnjhjxkct@yahoo.com',112937),(875671,'dgu_nsyrpvmwszuxgo@google.com',112938),(875672,'kzqp_fcuqwicoior@mail.com',112939),(875673,'sktuen.wbskwdbywrux@google.com',112940),(875674,'caszyu.oefnyeburyqlft@google.com',112941),(875675,'azxbq.ikbchgivtx@yahoo.com',112942),(875676,'azysld.zcoklykfrrmjhl@yahoo.com',112943),(875677,'ahicbaw.evqpbptzhozcq@mail.com',112944),(875678,'ssksnof.wmtijvbvydwxwsx@yahoo.com',112945),(875679,'nfo_hkenfkkvfeiaeuk@live.com',112946),(875680,'iletvv_rmltinofjri@live.com',112947),(875681,'oizjilf_ihmohvhzywlolpr@yahoo.com',112948),(875682,'ltjcqt_mohwkkwauhcn@yahoo.com',112949),(875683,'fbpcgw_cznrvasnio@mail.com',112950),(875684,'gya_wlngtaxixodxeeh@mail.com',112951),(875685,'oeei.kpsuvscjvknk@live.com',112952),(875686,'ickbqzz_xrotenegsoqmm@google.com',112953),(875687,'rhjpdyj_ttpqlgybrg@google.com',112954),(875688,'ibiha.mkpufsynksgcsi@yahoo.com',112955),(875689,'dnd_lneiewuie@google.com',112956),(875690,'hxrism.cpphpezk@yahoo.com',112957),(875691,'jwec_hvhafxaipnvm@google.com',112958),(875692,'otede.mfqntftdzkc@google.com',112959),(875693,'wrufjfx_lreumygmpcvu@yahoo.com',112960),(875694,'catdpo.vulusetgwpkfwta@mail.com',112961),(875695,'txfh.sotbbcjokfxw@live.com',112962),(875696,'hrnke_uykfwpkfyagcupr@live.com',112963),(875697,'comrwhx_mlvseryqbbd@yahoo.com',112964),(875698,'cyj.czpzfaotrmkptwd@google.com',112965),(875699,'emwzged.knkmdftbvgqnpmo@yahoo.com',112966),(875700,'ytyf_qowuftcffvlunf@yahoo.com',112967),(875701,'xzdvoiy_vyfegvhaa@yahoo.com',112968),(875702,'zrlw_mpnsdmzmcznt@google.com',112969),(875703,'ujkjeqt_ygivhwmukkto@live.com',112970),(875704,'xahok.zdumbykfxufszrk@mail.com',112970),(875705,'ttm.opgmrzwjfg@live.com',112971),(875706,'glm.yqgizytzzevs@google.com',112972),(875707,'erxsc.qclxhrlfdkptyn@mail.com',112973),(875708,'gzbwb_rzzzyvgszkdjlf@live.com',112974),(875709,'rjv_anpizwiaw@live.com',112975),(875710,'wgrwp.lwycqzxrwsva@live.com',112976),(875711,'cptbsjs.atusetgzb@live.com',112977),(875712,'hkell_tkshivcaejfxak@mail.com',112978),(875713,'efo_fhubypdyox@mail.com',112979),(875714,'szqo_pmrwiyvgnygjac@yahoo.com',112980),(875715,'xed_dddhcnkmg@mail.com',112981),(875716,'piwf_hkgbmfqmcyk@google.com',112982),(875717,'yyxqgh_utksiljmq@live.com',112983),(875718,'dvrqjzu.vbrhmkqyfrqgja@google.com',112984),(875719,'jnn_lbxhvhywung@live.com',112985),(875720,'ymnp.qjxlmcbb@google.com',1),(875721,'lvxzewv_mppebushuy@yahoo.com',112986),(875722,'sot.eqrmkoqllf@live.com',112987),(875723,'rkyuk_bhhpcshiqadpp@google.com',112988),(875724,'eha_sqafzgjdcaw@google.com',112989),(875725,'lrzhwof.xpfkgdxdivddjkz@live.com',112990),(875728,'ldi.oufsymqtedemwvq@live.com',112993),(875729,'lgwmmz_ogocuppe@mail.com',112994),(875730,'kfxhcn.faldifegvxcvu@yahoo.com',112995),(875731,'yhp_cvvpnxwrldkrc@yahoo.com',112996),(875732,'skyij_bwcvxzfbdsdol@yahoo.com',112997),(875733,'atsm.tkvvqturwkjqdsf@mail.com',112998),(875734,'bjtzyu.iexzezkcs@mail.com',112999),(875735,'num_ufrsnmye@google.com',113000),(875736,'vyhjva_cqvgvhzac@mail.com',113001),(875737,'umcowtb.ciitqzywmel@mail.com',113002),(875738,'lwzq.darhkdmzjmg@mail.com',113003),(875739,'epjysuu_twbrgdxgika@mail.com',113004),(875740,'pcuzxp.rmlsfxxvnji@live.com',113005),(875741,'tch_pfjfwrwemcd@yahoo.com',113006),(875742,'dseigh_wanqmngqfvl@live.com',113007),(875743,'jpwcy.xozhkhcsfg@live.com',113008),(875744,'fhu.nicnickvdwzfedg@mail.com',113009),(875745,'igem_lvungstru@yahoo.com',113010),(875746,'ptboydv_jmgxrqdwdupnunc@mail.com',113011),(875747,'nqtmdh_bjrgeden@mail.com',113012),(875748,'ljk.yrlhaimllatrco@yahoo.com',113013),(875749,'jpwgn_tdnefpiu@live.com',113014),(875750,'fdcsnof.adquzmncqfehxql@yahoo.com',113015),(875751,'pvh.mmxdwakaczsmkn@yahoo.com',113016),(875752,'fydvokg.jtpvgueon@mail.com',113017),(875753,'dvs.dnhvhaewjmidtj@live.com',113018),(875754,'qpaw.cbbdneicdgw@live.com',113019),(875755,'fhxgl.xdbvzmlvfuiio@mail.com',113020),(875756,'naq.uvulxeegxixob@live.com',113021),(875757,'afx.jzvfnbqzyxpfixr@live.com',113022),(875758,'cpqlt.dgwmxakyzfef@live.com',113023),(875759,'glm.cnjewukqzzaadoj@google.com',113024),(875760,'zfbhli.trbjqdqxdzlj@yahoo.com',113025),(875761,'gwmakwg_nrvddgxuq@live.com',113026),(875763,'bmftqz.jpxqpagfika@mail.com',113028),(875766,'nwsttoo.dcbcfuhejvaqexa@yahoo.com',113031),(875767,'pzetdlx.wbrfboqltmf@live.com',113032),(875768,'cvy_wujlcfvjfpk@yahoo.com',113033),(875770,'ebvtesb.fvndbxhwgf@yahoo.com',113035),(875771,'wjg.dhaexajshbl@google.com',113036),(875772,'uwy_wkniafxwjdoj@google.com',113037),(875773,'ulx_afybonycbhhpd@mail.com',113038),(875774,'zghrgd.vapxsuvvxnwvm@mail.com',113039),(875775,'mknvs.zvejhitvngtyov@yahoo.com',113040),(875776,'xec_xeejexzcstrb@google.com',113041),(875777,'zioqpdv_aazxobpuxt@google.com',113042),(875778,'bdmivcz_kbzttprnttlar@yahoo.com',113043),(875779,'cfvvv_growpjbfvmvsdmc@google.com',113044),(875780,'ttl_kzqirkzubqzzza@google.com',113045),(875781,'hhp_nfnaoswfzfgn@mail.com',113046),(875782,'vpj.ldjjvcwd@mail.com',113047),(875783,'fmup_nyeczpcr@live.com',113048),(875784,'jevjb.dyfhwlqtcvvuig@yahoo.com',113049),(875785,'dmyz_ibinnzmija@mail.com',113050),(875786,'wlpnrs_acnhviexbkxgodw@google.com',113051),(875787,'nlpekoq.zwizyucb@google.com',113052),(875788,'cktgt.zuxfhviexwrrkay@live.com',113053),(875789,'ybkcvyf.twbsjslcn@google.com',113054),(875790,'xgp_npmojfydhgkii@live.com',113055),(875791,'rcl_qzzysvyfj@yahoo.com',113056),(875792,'ebuimi.brdtkqcm@mail.com',113057),(875795,'qfep.uarjweibgk@google.com',113060),(875797,'wrtnkl.xiwkkwamio@mail.com',113039),(875798,'ftebu_cmbwczqdolniac@yahoo.com',113063),(875799,'skw_ovnbtqyvwm@mail.com',113064),(875800,'poazs_tbaypfhu@google.com',113065),(875802,'yoxxtby_dvwtgzbjmfqoy@mail.com',113067),(875803,'xsuzitq_ufqoyywoc@google.com',113068),(875804,'azsmdi.gkjrdtjoaynvnf@live.com',113069),(875805,'vsamser_cyowrtshqg@yahoo.com',113070),(875806,'zwi_zxpebuvtjx@yahoo.com',113071),(875807,'xny.uracksjsynu@yahoo.com',113072),(875808,'hmoc.nmydzkeost@live.com',113073),(875809,'clys_nicokkvyd@google.com',113074),(875810,'epivemw_lwzhnuknziuw@google.com',113075),(875811,'lfu_flokjrfarsos@mail.com',113076),(875812,'yjxf_gjazuccemppf@google.com',113077),(875813,'iafxwrr.pcsfairjpvidr@mail.com',113078),(875814,'udh.atretjmiw@mail.com',113079),(875815,'qoxswhs_wxxvmxaknvofmuk@live.com',113080),(875816,'fbonqr.jkymppctatq@mail.com',113081),(875817,'txj_oybmdighgkfw@live.com',113082),(875818,'yntf.wcuqwlqwjpy@mail.com',113083),(875819,'ucfgyy_idqwlnhyzqfczn@live.com',113084),(875820,'peyt_rabgaiqf@mail.com',113085),(875821,'ecc.nbwcxdatilhaf@google.com',113086),(875822,'qyxkep.jqclbymoeu@yahoo.com',113087),(875823,'tkvxwru_dasonbpyjkvzjy@live.com',113088),(875824,'xwqjuv_thblcbzvj@yahoo.com',113089),(875825,'ivez.oklzpybkrbjosy@live.com',113090),(875826,'yahv.bayqjyrk@google.com',113091),(875827,'azv.ghrmluolgswc@mail.com',113092),(875828,'mpmspw_lluonwuisl@google.com',113093),(875829,'mxzp.kymqroqp@live.com',113094),(875830,'zzxbq.iotdkpsubrdsbdm@google.com',113095),(875831,'rjrx.wlnizackyecwbq@google.com',113096),(875832,'fyf_annbuqysrbhfhs@live.com',113097),(875833,'fcx.lomrackrgl@yahoo.com',113098),(875834,'dfol_hxqkchffmbx@yahoo.com',113099),(875835,'bhge_qjwhwlnjx@mail.com',113100),(875836,'sxj_jdolngudv@yahoo.com',113101),(875837,'yfer_cpubxllwkavdfqp@google.com',113102),(875838,'rcm_anqnukpum@mail.com',113103),(875839,'fhwc.waoswgqjozhmpoa@yahoo.com',113104),(875840,'slc_snlrdngscwbshl@yahoo.com',113105),(875841,'dwwftd.wzirjxhvp@yahoo.com',113106),(875842,'abdhu.nzlhbmhxkerv@google.com',113107),(875843,'uvvht_apvmuokhi@mail.com',113108);
/*!40000 ALTER TABLE `coms_participant_email` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_participant_exam_event`
--

LOCK TABLES `coms_participant_exam_event` WRITE;
/*!40000 ALTER TABLE `coms_participant_exam_event` DISABLE KEYS */;
INSERT INTO `coms_participant_exam_event` VALUES (1,112913,876043,30,NULL,'Hymenaeos enim diam cubilia dis morbi consequat a nullam.'),(2,112914,876043,32,60,'Nibh morbi venenatis donec convallis amet senectus vivamus lorem.'),(3,112915,876043,31,83.33,'Cras habitant gravida pede euismod lobortis lectus.'),(4,112916,876043,30,NULL,'Purus tempor curabitur curabitur faucibus augue maecenas cubilia.'),(5,112917,876043,30,NULL,'Maecenas cursus justo mus mollis.'),(6,112918,876043,31,86.67,'Arcu at curae; nisl metus risus hendrerit.'),(7,112919,876043,30,NULL,'Nonummy lorem mauris curae; et.'),(8,112920,876043,31,66,'Conubia a nulla commodo orci ullamcorper parturient.'),(9,112921,876043,31,100,'Augue dapibus nulla nisi congue rutrum netus nec.'),(10,112922,876043,30,NULL,'Aptent nullam vivamus aliquet elit commodo risus nibh nostra.'),(11,112923,876043,31,86.67,'Tellus at pretium lacinia ultrices hendrerit adipiscing aliquet.'),(12,112924,876043,31,80,'Imperdiet eleifend aenean ligula dapibus metus arcu.'),(13,112925,876043,31,90,'Sem dolor nascetur egestas laoreet luctus bibendum ac.'),(14,112926,876043,31,86.67,'Erat mauris sapien libero sodales tempus tempus rutrum erat.'),(15,112927,876043,31,76.67,'Urna sem est tincidunt pellentesque ornare erat fusce ultrices.'),(16,112928,876043,31,86.67,'Dis inceptos id placerat iaculis.'),(17,112929,876043,30,NULL,'Cursus rutrum ipsum pharetra dolor velit dolor consequat.'),(18,112930,876043,31,93.33,'Habitant purus pellentesque congue montes in facilisi feugiat.'),(19,112931,876043,31,93.33,'Nunc sociis et tempor nam cursus curabitur euismod.'),(20,112932,876043,31,70,'Ante eu eros luctus neque maecenas orci scelerisque arcu.'),(21,112933,876043,31,90,'Cras nec ligula molestie facilisi tortor.'),(22,112934,876043,30,NULL,'Tempor imperdiet est dis dignissim gravida.'),(23,112935,876043,31,73.33,'Nam fringilla ad bibendum iaculis nisi taciti nam dignissim.'),(24,112936,876043,31,100,'Iaculis facilisis lacinia diam parturient proin praesent in risus.'),(25,112937,876043,31,83.33,'Lectus donec primis aliquam vitae sagittis.'),(26,112938,876043,31,83.33,'Nonummy sollicitudin laoreet nisl porttitor proin nam natoque.'),(27,112939,876043,31,100,'Nam congue tortor cursus convallis dapibus.'),(28,112940,876043,30,NULL,'Nibh nam adipiscing leo convallis gravida feugiat nonummy.'),(29,112941,876043,30,NULL,'Nascetur convallis viverra morbi quam consectetuer fusce.'),(30,112942,876043,30,NULL,'Sapien pede urna penatibus nascetur sagittis erat ultricies.'),(31,112943,876043,31,83.33,'Hendrerit viverra tellus ipsum justo sollicitudin ac.'),(32,112944,876043,31,93.33,'Nonummy sit faucibus at ipsum sit urna.'),(33,112945,876043,30,NULL,'Ullamcorper feugiat tempor justo leo.'),(34,112946,876043,31,80,'Fames elementum euismod proin sapien sagittis mus.'),(35,112947,876043,30,NULL,'Diam commodo venenatis montes sapien habitant.'),(36,112948,876043,31,76.67,'Vivamus lobortis gravida hendrerit quam phasellus dictum suspendisse quisque.'),(37,112949,876043,31,83.33,'Lorem taciti ultricies amet lectus aliquam tempus faucibus ullamcorper.'),(38,112950,876043,31,86.67,'Nascetur facilisis sit eget penatibus penatibus hendrerit.'),(39,112951,876043,31,90,'Mattis elementum phasellus proin non sociis gravida eleifend.'),(40,112952,876043,31,83.33,'Etiam nisi cum vitae leo erat velit aptent inceptos.'),(41,112953,876043,31,80,'Imperdiet pede diam tristique ac felis nam sociosqu.'),(42,112954,876043,31,100,'Condimentum congue elit tempus pharetra.'),(43,112955,876043,31,93.33,'Nulla quisque varius libero in nisi senectus fermentum.'),(44,112956,876043,30,NULL,'Quam dolor quis dictum orci per lorem facilisis class.'),(45,112957,876043,30,NULL,'Donec eu scelerisque curae; integer malesuada euismod.'),(46,112958,876043,30,NULL,'Senectus facilisis aliquet fames integer arcu cras massa augue.'),(47,112959,876043,30,NULL,'Ridiculus vitae nec ultrices tortor pulvinar.'),(48,112960,876043,31,76.67,'Orci augue leo vivamus nisi aliquet interdum tempor.'),(49,112961,876043,30,NULL,'Donec varius condimentum porta dictum sit.'),(50,112962,876043,31,80,'Placerat vitae senectus curae; hymenaeos felis mattis.'),(51,112963,876043,32,56.67,'Curabitur parturient sed augue venenatis nisi.'),(52,112964,876043,31,93.33,'Tristique nunc ligula hendrerit leo cras hymenaeos integer.'),(53,112965,876043,31,76.67,'Vivamus torquent molestie vestibulum est lacinia.'),(54,112966,876043,31,80,'Eu primis ridiculus porta dapibus ridiculus.'),(55,112967,876043,31,80,'Semper volutpat metus nulla mus tempus.'),(56,112968,876043,31,76.67,'Sollicitudin montes cum cras erat taciti.'),(57,112969,876043,30,NULL,'Id eleifend amet molestie massa ullamcorper.'),(58,112963,876044,28,50,'Mi felis accumsan condimentum mauris elementum parturient nascetur.'),(59,112914,876045,31,73.33,'Aliquet penatibus erat eros mollis tempus senectus.'),(63,112970,876046,31,94,'Ut class ornare vestibulum ullamcorper pede nam sem imperdiet.'),(65,112971,876046,31,86,'Integer mi lacus mus magna.'),(66,112972,876046,31,76,'Varius habitant turpis mauris sociis nullam ornare.'),(67,112973,876048,30,NULL,'Leo maecenas arcu tempus eget mattis sociis ornare rhoncus.'),(68,112974,876048,31,NULL,'Adipiscing posuere magna facilisis aliquam.'),(69,112975,876048,31,NULL,'Placerat nam placerat semper volutpat mi.'),(70,112976,876048,31,NULL,'Dolor conubia aptent torquent facilisis senectus duis nonummy.'),(71,112977,876048,31,NULL,'Rutrum fermentum eros hendrerit viverra tempor.'),(72,112978,876048,31,NULL,'Arcu ultricies lobortis metus dis leo non.'),(73,112979,876048,31,NULL,'Nunc tristique nullam lectus euismod cum tempus velit.'),(74,112980,876048,31,NULL,'Amet metus ligula posuere dui urna adipiscing feugiat nam.'),(75,112981,876048,31,NULL,'Mattis id hendrerit parturient eget curabitur.'),(76,112982,876048,31,NULL,'Tempor eu rutrum bibendum arcu.'),(77,112983,876048,31,NULL,'Lorem vel imperdiet aenean accumsan.'),(78,112984,876048,31,NULL,'Habitant diam sollicitudin pretium aptent conubia lorem vel id.'),(79,112985,876048,31,NULL,'Et senectus facilisis aenean elit cras venenatis lacus dui.'),(80,112986,876050,27,NULL,'Convallis risus malesuada cubilia elementum ridiculus.'),(81,112987,876050,27,NULL,'Per congue mollis feugiat aptent eu enim.'),(82,112988,876050,27,NULL,'Laoreet convallis integer nascetur odio mauris.'),(83,112989,876050,27,NULL,'Elementum fringilla ut porta per facilisi libero fusce.'),(84,112990,876050,27,NULL,'Bibendum torquent egestas lectus mattis eleifend ornare natoque tellus.'),(85,112978,876050,27,NULL,'Lacus blandit dictum ornare placerat mi morbi cras.'),(86,112980,876050,27,NULL,'Proin per dolor velit dolor convallis aptent tortor fermentum.'),(87,112993,876050,27,NULL,'Dis eleifend nibh enim malesuada porttitor ante.'),(88,112994,876050,27,NULL,'Eget nascetur cras a netus ultricies tortor.'),(89,112995,876057,27,NULL,'Adipiscing nunc class nibh pellentesque natoque sociosqu magna turpis.'),(90,112996,876057,27,NULL,'Purus etiam curabitur vel fermentum pulvinar pulvinar lorem conubia.'),(91,112997,876057,27,NULL,'Ipsum nam nascetur cubilia amet risus rhoncus mauris eros.'),(92,112998,876057,27,NULL,'Conubia iaculis lorem eleifend risus.'),(93,112999,876053,30,NULL,'Eu proin sit ultricies cursus aptent ridiculus.'),(94,113000,876053,27,NULL,'Placerat ac vel quisque varius.'),(95,113001,876053,27,NULL,'Molestie montes congue ultricies feugiat sollicitudin.'),(96,113002,876053,27,NULL,'Ante varius nibh congue scelerisque ornare tellus integer.'),(97,113003,876053,27,NULL,'Eu id adipiscing vivamus tellus interdum inceptos quam.'),(98,113004,876053,27,NULL,'Massa nam etiam proin sit vel euismod nisi.'),(99,113005,876053,27,NULL,'Dolor ullamcorper vitae cum sed nibh mollis tortor.'),(100,113006,876053,27,NULL,'Dolor pharetra sem ac nisi venenatis aliquet fames.'),(101,113007,876053,27,NULL,'Feugiat fermentum nunc dui cum.'),(102,113008,876053,30,NULL,'Felis dis ad massa lobortis.'),(103,113009,876053,27,NULL,'Pretium purus natoque nibh elit lobortis natoque litora.'),(104,113010,876053,27,NULL,'Sodales per suscipit erat porttitor rhoncus praesent.'),(105,113011,876053,27,NULL,'Quisque senectus sociis placerat viverra suspendisse.'),(106,113012,876053,27,NULL,'Leo ut imperdiet auctor eleifend.'),(107,113013,876053,30,NULL,'Lectus viverra pede fusce pretium.'),(108,113014,876053,27,NULL,'Convallis fermentum duis consectetuer urna fermentum senectus cubilia.'),(109,113015,876053,27,NULL,'Leo per auctor fusce magnis justo nonummy sed dui.'),(110,113016,876053,30,NULL,'Scelerisque inceptos mus nec eget lectus luctus.'),(111,113017,876053,27,NULL,'Est per nisi ultricies tellus netus facilisis pulvinar sem.'),(112,113018,876053,27,NULL,'Etiam conubia sed odio sagittis ad pretium neque.'),(113,113019,876053,27,NULL,'Eget mauris taciti sed lectus quisque mauris eros ridiculus.'),(114,113020,876053,30,NULL,'Inceptos nam nisl habitant vel.'),(115,113021,876053,27,NULL,'Pulvinar fringilla lorem feugiat elementum duis imperdiet eget.'),(116,113022,876053,30,NULL,'Congue erat urna turpis quisque bibendum consectetuer.'),(117,113023,876053,27,NULL,'Volutpat quis risus odio tellus lectus nam.'),(118,113024,876053,27,NULL,'Elit aenean interdum ultricies libero libero torquent convallis.'),(119,113025,876053,27,NULL,'Ridiculus eget senectus lacus parturient adipiscing cras.'),(120,113026,876053,27,NULL,'Pede dignissim velit elit fusce vestibulum sodales felis.'),(121,112925,876053,27,NULL,'Imperdiet vitae quisque taciti aptent phasellus.'),(122,113028,876053,27,NULL,'Scelerisque adipiscing posuere mattis imperdiet in.'),(123,112936,876053,27,NULL,'Molestie felis viverra accumsan blandit justo scelerisque quisque.'),(124,112943,876053,27,NULL,'Leo ac primis nonummy tincidunt nisl gravida ultrices.'),(125,113031,876053,27,NULL,'Ullamcorper dolor eros porta pretium.'),(126,113032,876053,30,NULL,'Fringilla mus quisque cursus mus erat.'),(127,113033,876053,27,NULL,'Accumsan turpis mollis ultricies aliquet justo.'),(128,112938,876053,27,NULL,'Metus dis justo magna dapibus lectus ornare.'),(129,113035,876053,27,NULL,'Auctor aenean ultricies mus vitae elementum erat nec.'),(130,113036,876053,27,NULL,'Fames justo conubia lacinia porta elit consequat tempus.'),(131,113037,876053,27,NULL,'Diam tempor sociosqu neque id convallis morbi fermentum.'),(132,113038,876053,27,NULL,'Tempor magnis senectus orci purus sed sagittis molestie et.'),(133,113039,876053,30,NULL,'Gravida euismod justo dignissim pretium.'),(134,113040,876053,27,NULL,'Facilisis egestas eget lobortis nullam.'),(135,113041,876053,27,NULL,'Diam eget nostra inceptos condimentum hendrerit litora eleifend sapien.'),(136,113042,876053,27,NULL,'Integer semper tortor amet montes.'),(137,113043,876053,27,NULL,'Commodo arcu a semper bibendum.'),(138,113044,876053,27,NULL,'Dapibus ad natoque rutrum eget sagittis est venenatis.'),(139,113045,876053,27,NULL,'Mauris neque habitant aliquam condimentum laoreet.'),(140,113046,876053,27,NULL,'Primis cras malesuada auctor tempus donec imperdiet est dolor.'),(141,113047,876053,30,NULL,'Malesuada duis nisl habitant vehicula porttitor pharetra.'),(142,113048,876053,27,NULL,'Facilisis dignissim arcu pretium leo aliquam suscipit.'),(143,113049,876053,27,NULL,'Curae; sagittis lobortis vehicula iaculis vitae.'),(144,113050,876053,27,NULL,'Sem varius euismod nostra duis.'),(145,113051,876053,27,NULL,'Sem nec lectus litora vitae molestie placerat.'),(146,113052,876053,27,NULL,'Leo ultrices euismod penatibus mauris mi commodo.'),(147,113053,876053,27,NULL,'A ultricies nullam imperdiet a tempor.'),(148,113054,876053,30,NULL,'Libero elit torquent quis blandit dis.'),(149,113055,876053,27,NULL,'Fames ullamcorper pede mus ridiculus eget sem id libero.'),(150,113056,876053,27,NULL,'Nibh lacinia fermentum hendrerit senectus.'),(151,113057,876053,30,NULL,'Purus interdum rhoncus nulla sit et tempor natoque.'),(152,112954,876053,27,NULL,'Cursus quis et condimentum porta dolor.'),(153,112968,876053,27,NULL,'Pharetra sed vitae magnis massa aliquet placerat hendrerit porttitor.'),(154,113060,876053,30,NULL,'Penatibus primis nostra torquent odio mattis.'),(157,112949,876053,27,NULL,'Class porta duis vivamus eu litora laoreet.'),(158,113063,876049,27,NULL,'Sapien bibendum aliquet velit per mauris metus ante.'),(159,113064,876049,27,NULL,'Aptent velit orci fringilla pulvinar phasellus elit.'),(160,113065,876056,27,NULL,'Semper tristique blandit primis hymenaeos.'),(162,113067,876055,27,NULL,'Purus felis hendrerit senectus aliquet.'),(163,113068,876054,27,NULL,'Tempor metus varius dictum bibendum tellus condimentum ultrices.'),(164,113069,876054,27,NULL,'Nisi tortor posuere sollicitudin cras cras facilisi aliquet.'),(165,113070,876054,27,NULL,'Magna velit hymenaeos ullamcorper mauris sapien litora.'),(166,113071,876054,27,NULL,'Posuere gravida nisi urna tincidunt.'),(167,113072,876054,27,NULL,'Scelerisque imperdiet maecenas etiam varius tincidunt nostra.'),(168,113073,876054,27,NULL,'Congue praesent erat cras ultricies duis.'),(169,113074,876065,27,NULL,'Mi velit eleifend euismod quis turpis eu pharetra nec.'),(170,113075,876065,27,NULL,'Hymenaeos pretium mollis massa tristique aliquet.'),(171,113076,876065,27,NULL,'Sed facilisis augue massa et tellus.'),(172,113077,876065,27,NULL,'Non tristique pretium tincidunt facilisis.'),(173,113078,876065,27,NULL,'Mi aenean netus sociis justo.'),(174,113079,876065,27,NULL,'Aliquam nam phasellus rutrum sodales tellus sociosqu.'),(181,113086,876065,27,NULL,'Dui torquent sit lorem sodales senectus.'),(182,113087,876065,27,NULL,'Pretium congue in nibh sem euismod a.'),(183,113088,876065,27,NULL,'Gravida libero dignissim nulla mus tempus ridiculus dolor.'),(184,113089,876065,27,NULL,'Interdum facilisis facilisis nonummy cubilia tristique condimentum sapien pellentesque.'),(185,113090,876065,27,NULL,'Volutpat pellentesque habitant quisque quisque mauris euismod tristique.'),(186,113091,876065,27,NULL,'Varius venenatis a commodo mattis eleifend ornare.'),(188,113093,876065,27,NULL,'Lacus pellentesque arcu fames hymenaeos tincidunt hendrerit congue malesuada.'),(189,113094,876065,27,NULL,'Nullam mauris pharetra tempor fusce at.'),(190,113095,876065,27,NULL,'Fames cubilia sed nisl nibh cubilia velit.'),(191,113096,876065,27,NULL,'Sagittis ac pede facilisi massa nulla nostra duis eleifend.'),(192,113097,876065,27,NULL,'Sollicitudin nullam neque ad hendrerit praesent mi maecenas sem.'),(193,113098,876058,27,NULL,'Phasellus felis massa natoque feugiat ut porttitor primis.'),(194,113099,876058,27,NULL,'Imperdiet quam nostra sit facilisi a.'),(195,113100,876058,27,NULL,'Magna pretium curae; orci purus sagittis porttitor.'),(196,113101,876058,27,NULL,'Consectetuer justo posuere felis lobortis habitant iaculis sapien.'),(197,113102,876058,27,NULL,'Hymenaeos sem vestibulum leo eu condimentum pharetra class laoreet.'),(198,113103,876058,27,NULL,'Nostra vestibulum volutpat at habitant.'),(199,113104,876058,27,NULL,'Amet vivamus scelerisque amet senectus vitae laoreet duis.'),(200,113105,876058,27,NULL,'Faucibus morbi risus et adipiscing faucibus.'),(201,113106,876058,27,NULL,'Tellus vitae etiam litora libero tellus aenean.'),(202,113107,876058,27,NULL,'Auctor sagittis pulvinar felis id ultrices magnis.'),(203,113108,876058,27,NULL,'Nascetur aptent nisl sociosqu integer lorem cras fames consectetuer.');
/*!40000 ALTER TABLE `coms_participant_exam_event` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2037370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_participant_identifier`
--

LOCK TABLES `coms_participant_identifier` WRITE;
/*!40000 ALTER TABLE `coms_participant_identifier` DISABLE KEYS */;
INSERT INTO `coms_participant_identifier` VALUES (2037173,112913,112913383,'5db650bc22ce5221ada082e62957e086','003BLQV7'),(2037174,112914,112914741,'b4f3158acb5481ddf7e9480ffdd9b48d','003BLS9L'),(2037175,112915,112915878,'d6914cd79dfac0f059e42149cd65524a','003BLTD6'),(2037176,112916,112916210,'337b501bcfba5d96c6c106533524c02d','003BLTNI'),(2037177,112917,112917306,'077ab266faf68938eb6e1234a666a323','003BLUPQ'),(2037178,112918,112918104,'19a0819b81e6c67134a117d16486e371','003BLVIO'),(2037179,112919,112919295,'48158e55aa656b32d0f6a26d7cda4216','003BM0NV'),(2037180,112920,112920991,'f2166f2b896084110d040aac9f83bc76','003BM2CV'),(2037181,112921,112921754,'b8226e679bf4647eecfbf89a28237408','003BM34Q'),(2037182,112922,112922609,'94d8032589f4fc9505d0682cd6d2ce09','003BM3VH'),(2037183,112923,112923655,'a002d35ef9963a974595ffe3349eea82','003BM507'),(2037184,112924,112924387,'5e8d0a1821d8ec7d45ecbe83b54c6024','003BM5N3'),(2037185,112925,112925554,'875cf5b808fc9754b5949fe471a21fee','003BM6RI'),(2037186,112926,112926210,'334f4b9e606fc45a1db7bb5e89136f89','003BM7G2'),(2037187,112927,112927701,'ab615ec0ef781006b2d3bc61c7247c25','003BM8UL'),(2037188,112928,112928489,'7778f51dd2bfbe8e6e364770d1f28537','003BM9N9'),(2037189,112929,112929622,'981259d1dbc0bab19e8fe0aa9f2ea19a','003BMAQM'),(2037190,112930,112930166,'289a809f93905575efc37fdce76ebc63','003BMBBM'),(2037191,112931,112931766,'bb09ff791a4db61a09eae74aaf8921a7','003BMCTM'),(2037192,112932,112932939,'e5782307dd9a99d388505451bcd05086','003BME2B'),(2037193,112933,112933131,'2037818ab86920482a7040308f320970','003BME8B'),(2037194,112934,112934928,'e2a0a570cad7b4371dcb83016aed2ad7','003BMG0G'),(2037195,112935,112935781,'bec08224c269a63c8f977c6cd2d6aa41','003BMGR5'),(2037196,112936,112936363,'58c6ee2f46188f59eca18f32c2b435ea','003BMHDB'),(2037197,112937,112937231,'387205ad263e2341b8e358e4c74106e8','003BMI8F'),(2037198,112938,112938548,'85ffe3a876c4443166aa5be31f6ba528','003BMJHK'),(2037199,112939,112939975,'ee0de1485ef82a8c53c069a29e20e05e','003BMKU7'),(2037200,112940,112940925,'169b7c3dceb35070bb49b87719cb6490','003BMLRT'),(2037201,112941,112941834,'cbd84135f9f7bc57707859365b6d28fb','003BMMOA'),(2037202,112942,112942845,'ce76c1ff86cad021d73d45abf3300bf7','003BMNNT'),(2037203,112943,112943974,'eddaa186fc4dfad982c9663196e46a5c','003BMOR6'),(2037204,112944,112944159,'26fda6b27980c1892151a2786767bfd8','003BMP0V'),(2037205,112945,112945744,'b5c1af43a4d9b8853c0e790c853a2d29','003BMQIG'),(2037206,112946,112946412,'649b9551777fae6958002c3d0199c3ef','003BMR7C'),(2037207,112947,112947943,'e66e4d2ef8e085a30e3781e8ae1255c2','003BMSN7'),(2037208,112948,112948319,'0013fad9b119ffc4d94cae5bc0896e1c','003BMT2V'),(2037209,112949,112949648,'9e677410179a3c93d14270da814314fd','003BMUCG'),(2037210,112950,112950174,'2aa4e899dae4151ac22e7d6067f73985','003BMUSU'),(2037211,112951,112951968,'ec6832ee559e2ade8081c8a78678fa62','003BN0L0'),(2037212,112952,112952850,'cf91a8e4f07feeb8e3f35ae4166aa4cb','003BN1GI'),(2037213,112953,112953778,'be1e459c02a332cccfb612de4ca4c2df','003BN2DI'),(2037214,112954,112954820,'14055a1babd8cc7a70ff13740892f648','003BN3E4'),(2037215,112955,112955305,'4aadc0726b85f66f277dbe30cd104b37','003BN3T9'),(2037216,112956,112956801,'c3cb5aaa3bf8d354f54fd6d9fa155c1e','003BN5C1'),(2037217,112957,112957165,'285b58c6002698a3d84d2d7b943d49d4','003BN5ND'),(2037218,112958,112958826,'c9aeb57447eeb9e71f9bb532e90c9421','003BN7BA'),(2037219,112959,112959132,'206ac598ccbff7178227037bc5432743','003BN7KS'),(2037220,112960,112960375,'5ba1d67994213eaae4ad0a9628e6065f','003BN8RN'),(2037221,112961,112961798,'c2f9c1f2e2f8b3d6ba3ee350805b86a3','003BNA86'),(2037222,112962,112962875,'d5a8eb7c638f25c00a76ae4da498e5c9','003BNB9R'),(2037223,112963,112963156,'26265985da57528a62b062b4fc7900b9','003BNBIK'),(2037224,112964,112964882,'d77bf0f3ce7229ad489ff0c2248fdf78','003BND8I'),(2037225,112965,112965658,'a0b229ed122c1612cded28192d893929','003BNE0Q'),(2037226,112966,112966904,'dcebb34b9fea0e7aa6db8998c8513c56','003BNF7O'),(2037227,112967,112967748,'b6b148696237ea1932dafe93614ef407','003BNG24'),(2037228,112968,112968534,'829b501dd6f3715a71f43b0abdddfa9f','003BNGQM'),(2037229,112969,112969928,'e2a96216fbd8b7fbda269c22ee947a03','003BNI68'),(2037230,112970,112970565,'8a10bc369fb19b1c8ca26d5f6874310f','003BNIQ5'),(2037231,112971,112971968,'ec7335222dfbdb20e3d40b55820808ad','003BNK60'),(2037232,112972,112972666,'1042f988e3acf4efcdebb304fb039b17','003BNKRQ'),(2037233,112973,112973122,'02fec48cce22588164b836951d950c68','003BNLA2'),(2037234,112974,112974342,'5399f4c6e6a70f3608a084ddb938511a','003BNMG6'),(2037235,112975,112975137,'2186178190d2c5feed08a277ba676da6','003BNN91'),(2037236,112976,112976550,'8671e44c8c0129abd5bf3ab39f7e511f','003BNOL6'),(2037237,112977,112977520,'7f085e96b1e4f12bea9021f23aafb973','003BNPJG'),(2037238,112978,112978206,'32646a086d36564ab429c9bb5668a5d7','003BNQ8U'),(2037239,112979,112979320,'4e34e41e8da6334ccebf195957f45728','003BNRBO'),(2037240,112980,112980747,'b66383d08b41fe75f87492f7ba4c4e3f','003BNSOB'),(2037241,112981,112981198,'305a7008f54ed3f5e38d00b311668f8e','003BNT6E'),(2037242,112982,112982258,'3f098efb170e17387b60f08a6b406dbc','003BNU7I'),(2037243,112983,112983655,'a025b2f90fc0ba2221976be9fd32d0aa','003BNVJ7'),(2037244,112984,112984322,'4ecd76445a73d8df36d6ff974661fc83','003BO082'),(2037245,112985,112985433,'69b7a34894fb12a79047aa2c5f0505b1','003BO1AP'),(2037246,1,1806,'c4ca4238a0b923820dcc509a6f75849b','000001OE'),(2037247,112986,112986977,'eebf8bc2ea9d987dd367a77d0ed094ab','003BO2R1'),(2037248,112987,112987621,'97d36185a483469a7d6fb2a8d787ad26','003BO3F5'),(2037249,112988,112988546,'858ab5389569b15bed612f1f14fc2192','003BO4C2'),(2037250,112989,112989987,'f12264dcac4e6ce9b82ae8fa503a88cf','003BO5P3'),(2037251,112990,112990727,'b19f7840920bfe7e12558f646771304a','003BO6G7'),(2037254,112993,112993924,'e19f05a951bdd407dfeddc17be372d58','003BO9K4'),(2037255,112994,112994490,'77cdad8455f7a21863c108defa40aa1c','003BOA5Q'),(2037256,112995,112995411,'646336192abf5383cc42d9b4a564cf8b','003BOB2J'),(2037257,112996,112996318,'4daefab4a7307f5ab87f746f98e9e7f0','003BOBUU'),(2037258,112997,112997493,'787db85f266dc1a2ad6a3f4ac3b7235f','003BOD3L'),(2037259,112998,112998853,'d0611f78d08439c180b7b2547c8ea4f6','003BOEE5'),(2037260,112999,112999469,'7286678f1e61dea61dbd5af33d0cda2c','003BOF1D'),(2037261,113000,113000105,'0292dfe95f16b0580dd5672f5a6a9679','003BOFL9'),(2037262,113001,113001380,'5cdf113ffd8b0f4d005f5ad39d4fb2e1','003BOGT4'),(2037263,113002,113002224,'36e80ad911d3dfc3cde90c9ac9f8f859','003BOHNG'),(2037264,113003,113003167,'28caa8632f42f7faae63fd1d67677b09','003BOIKV'),(2037265,113004,113004910,'de3bb0c91ec200a56c1ffdf8eb10af41','003BOKBE'),(2037266,113005,113005986,'f0ec2a3fdae1cf112579d579afbe9813','003BOLD2'),(2037267,113006,113006551,'86941b92e2c44caf6d6becf9171d08b2','003BOLUN'),(2037268,113007,113007181,'2c398ecf351b909e03747463a6682767','003BOMID'),(2037269,113008,113008665,'a27081a8ebab24ce39cc4910436d4fe5','003BOO0P'),(2037270,113009,113009264,'408fc97c928a5d6173b72b4a45806c2d','003BOOJG'),(2037271,113010,113010736,'11fcdfee18ec6be96bb61207fa943677','003BOQ1G'),(2037272,113011,113011949,'e7b1d12cd1c20febc28843e08405db23','003BOR7D'),(2037273,113012,113012856,'d10b0d808b0cfd5fd53de71824456697','003BOS3O'),(2037274,113013,113013905,'dd23b42b2891e93c25e72f159932a294','003BOT4H'),(2037275,113014,113014316,'4d33a29913aa6d6b211286a76eb9b749','003BOTHC'),(2037276,113015,113015674,'a4a67097e8a310ada51b2017a9ceeb6e','003BOURQ'),(2037277,113016,113016325,'4f8cbded1f717a83d602892e26817d4e','003BOVG5'),(2037278,113017,113017755,'b8600f37d2c369465e340858cc5b1e5e','003BP0SR'),(2037279,113018,113018623,'9822c60cbd44380eab51af4199d17be4','003BP1NV'),(2037280,113019,113019243,'3b659c545a767c31aee24767af1a9b45','003BP2BB'),(2037281,113020,113020565,'89fb9d33afe9563a0c4a76c99484a0d9','003BP3KL'),(2037282,113021,113021562,'89486b18d97da6ca3c998162a254af38','003BP4JQ'),(2037283,113022,113022138,'21d7921acba7d42fa1d070e6d8547965','003BP55Q'),(2037284,113023,113023321,'4e87f2d9cb2f00f2ab5f7f9742445a4f','003BP6AP'),(2037285,113024,113024276,'436fc6a87245490c1c09148823eec9ff','003BP78K'),(2037286,113025,113025214,'344a2b39cdc26961b661071fdd3164c5','003BP85U'),(2037287,113026,113026226,'374776f1076b693ab82c7efccb1cf1c2','003BP95I'),(2037289,113028,113028857,'d154de59f82f09e9123e4f20addcf76b','003BPBNP'),(2037292,113031,113031101,'f8f5f370134d46cb215c82f92fcee9a0','003BPDTT'),(2037293,113032,113032476,'746f5c557ce2c412eee9017468c64f28','003BPF8S'),(2037294,113033,113033101,'f6d77b8ad5b7eefcaef0df63b0e1802a','003BPFSD'),(2037296,113035,113035149,'03a4d29c06c1d7af26560f7ca1b9da06','003BPHSD'),(2037297,113036,113036209,'332af0bf6d8a6c75f384f9ecb809ff3c','003BPITH'),(2037298,113037,113037631,'9a48a4db98bb07d6ec0660864c12378f','003BPK9V'),(2037299,113038,113038171,'29f30ddd863c889a33888faf270ae787','003BPKQR'),(2037300,113039,113039859,'d1e3d7adb57bf398f46a29b591e4cf60','003BPMFJ'),(2037301,113040,113040213,'342056c56263f934a9a937f340832fd9','003BPMQL'),(2037302,113041,113041624,'9884dfd73a2471545e0c3f8c14177a04','003BPO6O'),(2037303,113042,113042417,'65db279a9615793e73d18ab1a7d24b17','003BPOVH'),(2037304,113043,113043970,'ed0aaf49c68820e47b00d2b93fe507f2','003BPQG2'),(2037305,113044,113044778,'be06da3e0b6cc2ce04878fc4d2c04c1b','003BPR9A'),(2037306,113045,113045103,'fcac8b77e7900d5c3feb5f61c010ba09','003BPRJF'),(2037307,113046,113046933,'e3cf5953ccf1924fb2beba3c3517ae3c','003BPTCL'),(2037308,113047,113047892,'d9c8bdd403fc83eb9798a3a55f6e1c51','003BPUAK'),(2037309,113048,113048228,'37e46d8c70189663e79f9cb0780938f1','003BPUL4'),(2037310,113049,113049552,'86f2ffd6e31bfad5d8b640b6138ad121','003BPVUG'),(2037311,113050,113050415,'655eb6e2c9d89d42fabc57d6086bd4ed','003BQ0PF'),(2037312,113051,113051283,'06ea7c0c036ec003edd11cf6d38b88c1','003BQ1KJ'),(2037313,113052,113052802,'c3e1e20f6ec8413ec33d38b1e9c75daf','003BQ342'),(2037314,113053,113053149,'2462a76f718c97cfa773e42865b6ae51','003BQ3ET'),(2037315,113054,113054858,'d1856159683d6fdbc4d264c3012d8797','003BQ54A'),(2037316,113055,113055225,'370310d5dc90b9e3c7b070a6de532339','003BQ5FP'),(2037317,113056,113056782,'bf27a6175463542f7c8e05386b78755e','003BQ70E'),(2037318,113057,113057152,'254dbee18f28f9f9af9cadf084368271','003BQ7C0'),(2037321,113060,113060801,'c3a408338d796769a4f9a4be7c311143','003BQAU1'),(2037324,113063,113063298,'48dfe0942d47570c89ba7c27c4f8cef5','003BQDC2'),(2037325,113064,113064677,'a5777e03d2233f1836867bc7ff04c956','003BQEN5'),(2037326,113065,113065538,'837599629bbe720d53ab9a942d8e87b9','003BQFI2'),(2037328,113067,113067944,'e678079e5523b6ad5ded2314c9788349','003BQHT8'),(2037329,113068,113068709,'ad2b3af37972326a75715f36a2ca9614','003BQIL5'),(2037330,113069,113069101,'f8e278cdcc3e3197d1dba8fd921eda8f','003BQJ1D'),(2037331,113070,113070622,'97f627ab47e5948e9b7c061e7129c94d','003BQKGU'),(2037332,113071,113071725,'b120434bc398d14f3dda03fa4ca5e767','003BQLJD'),(2037333,113072,113072411,'64870032ba9ea3b90a9f091b6c4ae276','003BQM8R'),(2037334,113073,113073773,'bcddd7fb88e7a797242d318554bfda3c','003BQNJD'),(2037335,113074,113074771,'bc6d09a76d68ea0ea2c5864c45378541','003BQOIJ'),(2037336,113075,113075694,'a972e4d067d201b9bc66367e1b7fc7ce','003BQPFE'),(2037337,113076,113076101,'f85d80a0aa66824c24d0ced2fa670ebd','003BQPS5'),(2037338,113077,113077860,'d203cdd53482253a2bc9ab3eefe43880','003BQRJ4'),(2037339,113078,113078259,'3f75d34f83f3bd829b189002175b362b','003BQRVJ'),(2037340,113079,113079808,'c55d89701c262945ba72c48fbd102c6d','003BQTG0'),(2037341,113080,113080750,'b73dd7aa88855f767c19a4c6f588681d','003BQUDE'),(2037342,113081,113081702,'1126b4ac4e193ec840107cf403076491','003BQVB6'),(2037343,113082,113082973,'edc2f50a5bf41ed7f6660f727bd69f01','003BR0IT'),(2037344,113083,113083447,'6d391ff98f304e1374d3892bf0250f36','003BR11N'),(2037345,113084,113084817,'c7aa5b4aeef265811c6d61995bf418d8','003BR2CH'),(2037346,113085,113085323,'4f0348ef9e0ad66ab3ecb346fb04b9f5','003BR2SB'),(2037347,113086,113086380,'5d032420ce52894fa826e0fea5a60ac5','003BR3TC'),(2037348,113087,113087670,'a3a5aceee04f016c1d3ec34278396854','003BR55M'),(2037349,113088,113088904,'dcd7c01130057b960f3c2bdabf568518','003BR6C8'),(2037350,113089,113089152,'252620ed21db1b30cde293ff67d624ec','003BR6K0'),(2037351,113090,113090864,'d2fbc32fcc59fcb09c9cf84d48d1e781','003BR89G'),(2037352,113091,113091683,'a6e2a675cdac496d595c1ccd8f899fd2','003BR933'),(2037353,113092,113092541,'8447e9a6ca9837c305c5c4a9d55c7aed','003BR9TT'),(2037354,113093,113093696,'a9ef8f51f4c75787a88c027e9c369156','003BRB20'),(2037355,113094,113094985,'f0a7bf8a4fe902687b8079350762680b','003BRCA9'),(2037356,113095,113095463,'712a990b8a88c78e983d516a38c5e8eb','003BRCP7'),(2037357,113096,113096327,'5005979fb66d0e2384eb88f07d9a799d','003BRDK7'),(2037358,113097,113097385,'5e118bd9ae2910915bab484c51c54a41','003BREL9'),(2037359,113098,113098892,'d9efd1cd77e0a8f2cf0b868d9b70ea59','003BRG4C'),(2037360,113099,113099930,'e32917aaed6fd8cd6f38dc793c163777','003BRH4Q'),(2037361,113100,113100992,'f2673f6c2cd3db8ee65e779b80ff9142','003BRI60'),(2037362,113101,113101712,'adf2d724c3b8239b0afbbe2f6834d45b','003BRISG'),(2037363,113102,113102330,'5093d7dcaccc9c52a7e76e3a6e7a4b04','003BRJFQ'),(2037364,113103,113103304,'4a558a4d69ac769c8a306ff5aa01894f','003BRKE8'),(2037365,113104,113104776,'bd8412146cfd28e8b46cfefcf0f40b3a','003BRLS8'),(2037366,113105,113105615,'96504deb1005a2eb231907d2e8ddd0b2','003BRMMF'),(2037367,113106,113106443,'6c302e3dd5b5928173e07b7f98b11235','003BRNGB'),(2037368,113107,113107415,'6589970ae0d47435d6bd20819bd25b4f','003BROEN'),(2037369,113108,113108183,'2cb17b357a6c290417ec56ea8cbbdc49','003BRP6N');
/*!40000 ALTER TABLE `coms_participant_identifier` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_participant_training_event`
--

LOCK TABLES `coms_participant_training_event` WRITE;
/*!40000 ALTER TABLE `coms_participant_training_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_participant_training_event` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_proctor_id`),
  KEY `state_id_fk05` (`state_id`),
  CONSTRAINT `state_id_fk05` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26539839 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_proctor`
--

LOCK TABLES `coms_proctor` WRITE;
/*!40000 ALTER TABLE `coms_proctor` DISABLE KEYS */;
INSERT INTO `coms_proctor` VALUES (26539816,'Frances','Kelly','0OMUATQB','be5341ec98addcf0341207746d07d9bb','779',49),(26539817,'Harold','Thompson','0OMUAU4D','f7c36a788147425f43c8060249a553c9','101',49),(26539818,'Dorothy','Collins','0OMUAVTJ','e34d8196c3c08ecc8241c2c145857ad8','931',49),(26539819,'Harold','Washington','0OMUB055','2a3c90c0d408f2ed4f69fb532755fa33','173',49),(26539820,'Douglas','Bennett','0OMUB163','3776af5b14ae794d473dc95e3ecf63ac','227',49),(26539821,'Susan','Edwards','0OMUB263','3d482bc821ba880b4bfcb9a122cc3ded','251',49),(26539822,'Ryan','Perez','0OMUB3CT','788a340b5763113c1838180975351d1b','493',49),(26539823,'Maria','Phillips','0OMUB4MU','cc97159fcec0c53d789e586808781bf7','838',49),(26539824,'Stephanie','Wood','0OMUB5IE','af84804c84aa9fe48a0df0f3f6b7588b','718',49),(26539825,'Kevin','Patterson','0OMUB6PN','ee3c2f645bf91b5b7b4bf0cd3dd4a1fa','975',49),(26539826,'Mary','Evans','0OMUB7OO','ec855c865e8fe1af64d9a47f6d2f1ae3','968',49),(26539827,'Donna','Hall','0OMUB8C9','90ffbf16c1973f77e40cbcb49648dfb9','593',49),(26539828,'Mark','Bell','0OMUB9LH','def70f7645578683a0aa3448f1097b9f','913',49),(26539829,'Barbara','Howard','0OMUB9RE','fb73c5740e764e473efb29258b0f29b1','102',49),(26539830,'Robert','Hall','0OMUBBK2','df627bb715bb42ba8fd21ddb7b4ae126','914',49),(26539831,'Susan','Williams','0OMUBCKM','ea18653e406be2c5029655bd6f68c379','958',49),(26539832,'Scott','Miller','0OMUBD7R','8ba1024fda88cd5ded26d9eceefbcaf3','571',49),(26539833,'Jason','White','0OMUBDTK','417395f15eafa8082e4f1f2f263d59b3','268',49),(26539834,'Karen','Patterson','0OMUBFGK','15fe1c74f15771a53b61d7c751fe88a2','900',49),(26539835,'Brenda','Parker','0OMUBFU3','0817516714cf074a7ef0ac51ed554d31','331',49),(26539836,'Matthew','Brown','0OMUBH6K','9961b4fa5a2b7c6bc2f9c33de230535c','628',49),(26539837,'Jerry','Gray','0OMUBHUU','63502f00b7e6b57ef6455b686fa065f9','406',49),(26539838,'Joseph','Bennett','0OMUBJ87','b1880c198db5581e3a8ed33ec394ebc0','727',49);
/*!40000 ALTER TABLE `coms_proctor` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_proctor_email`
--

LOCK TABLES `coms_proctor_email` WRITE;
/*!40000 ALTER TABLE `coms_proctor_email` DISABLE KEYS */;
INSERT INTO `coms_proctor_email` VALUES (297,'ikzreu_fnzirlfrasjvzm@yahoo.com',26539816),(298,'zmmmlvs.qqhqffjf@yahoo.com',26539817),(299,'baxak_rmjkvyiszzxs@mail.com',26539818),(300,'uni_klyjabdokus@google.com',26539819),(301,'qrk.qyudidunn@google.com',26539820),(302,'lepil.ruxfjclvybmeknj@yahoo.com',26539821),(303,'ouij.yrnoixodotenbuu@live.com',26539822),(304,'lngmlw_ahlhebtnino@yahoo.com',26539823),(305,'qkcy.kxivgsvbmgudk@live.com',26539824),(306,'vgu_bvvthfgmckrew@live.com',26539825),(307,'bcg.avdfoehuo@google.com',26539826),(308,'icjfam.hiwibgctuun@google.com',26539827),(309,'mwwfvj.frrkzrjxkrd@live.com',26539828),(310,'hfghox_vjjtqzza@yahoo.com',26539829),(311,'znt.eyglksiojkwcyk@google.com',26539830),(312,'vmzna_ezgjaabg@live.com',26539831),(313,'odbzlfv_cxefmtjocdltmd@google.com',26539832),(314,'qowrld.qzabhffmeuihl@yahoo.com',26539833),(315,'tngtsi.cijtsgdyts@yahoo.com',26539834),(316,'vxbxql.isnmvqsrz@yahoo.com',26539835),(317,'mneu.oivfodznwfoef@yahoo.com',26539836),(318,'qxo_aeseteqqe@google.com',26539837),(319,'nanfi.ojewszttoanm@mail.com',26539838);
/*!40000 ALTER TABLE `coms_proctor_email` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_role`
--

LOCK TABLES `coms_role` WRITE;
/*!40000 ALTER TABLE `coms_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_role` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_role_liamuser`
--

LOCK TABLES `coms_role_liamuser` WRITE;
/*!40000 ALTER TABLE `coms_role_liamuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_role_liamuser` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_trainer_id`),
  KEY `state_id_fk02` (`state_id`),
  CONSTRAINT `state_id_fk02` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17239819 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_trainer`
--

LOCK TABLES `coms_trainer` WRITE;
/*!40000 ALTER TABLE `coms_trainer` DISABLE KEYS */;
INSERT INTO `coms_trainer` VALUES (17239801,'Gregory','Martinez','0G1P4VQV','a9ea1a1b97f8a4fc2b964e3f4c1bc59f','695',40),(17239802,'Raymond','Johnson','0G1P50VO','154f492b6fea0c726431cac4f7b8faba','872',40),(17239803,'Henry','Reed','0G1P51AG','34c65bf5336a929dc5c0625cd818ccc7','216',40),(17239804,'James','Nelson','0G1P5325','f38ad86ca1d467b7369bc5031b8958f9','997',40),(17239805,'Carl','Collins','0G1P537H','29541981e1fcccdeb08d06a6af96dfa2','169',40),(17239806,'Rebecca','Butler','0G1P54CI','56a242cab8f42baf0ff20c4a3c115cc7','354',40),(17239807,'Gary','Henderson','0G1P553U','fb36c2a0f16d174adcbdbbecca663568','102',40),(17239808,'Jessica','Garcia','0G1P5638','19744dc3c017b8c09a66c3b3d28129f7','104',40),(17239809,'Sandra','Miller','0G1P576N','3a68cf33bb6ed4d737fa725b5ba636d2','239',40),(17239810,'Brian','Sanders','0G1P58Q4','d7fb7b3d3f50c4d4da4449d9b814595a','884',40),(17239811,'Angela','Howard','0G1P592Q','279e4dd02be0ace4a03f8aa7f6e4699d','162',40),(17239812,'Timothy','Ramirez','0G1P5A06','fa346e4723723d2ff0c5d2ea5c84857a','102',40),(17239813,'Henry','Parker','0G1P5BD2','835ac624423a42fa07c85fa42cd19ae5','538',40),(17239814,'Melissa','Bell','0G1P5BUM','faee4a8c13cf0abfcfe03512ae957bc6','102',40),(17239815,'Elizabeth','Sanders','0G1P5D1C','33e90be224023086f49aa69ebe64d161','212',40),(17239816,'Matthew','Garcia','0G1P5EKK','d020bab12a03d340ce6bba1be6b2faa5','852',40),(17239817,'Michelle','Bell','0G1P5F10','3cc7ee1eb00dc30e8efea53520441a26','248',40),(17239818,'Scott','Perez','0G1P5GME','025729c2e0ad52889a85fc25f4ec529c','958',40);
/*!40000 ALTER TABLE `coms_trainer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_trainer_email`
--

LOCK TABLES `coms_trainer_email` WRITE;
/*!40000 ALTER TABLE `coms_trainer_email` DISABLE KEYS */;
INSERT INTO `coms_trainer_email` VALUES (703,'fsamujo_rirjvcylgi@mail.com',17239801),(704,'uatbge.dftawhxo@mail.com',17239802),(705,'goy_nhueltmapudhz@google.com',17239802),(706,'lbw.tuolonwvaot@google.com',17239803),(707,'luoqs_hlihlijv@mail.com',17239803),(708,'jckclb_aqagfiyrhljnm@mail.com',17239804),(709,'ktmt_mqtvyctm@google.com',17239805),(710,'lrbm.menapzaf@yahoo.com',17239806),(711,'axmdmy.pfgqkdkorkzsp@mail.com',17239807),(712,'phqm_qispwphtuniyvi@google.com',17239808),(713,'yctvx_copfhwjgi@mail.com',17239809),(714,'oaoovm_dxdzljkacbxjci@yahoo.com',17239810),(715,'bdksw.pffmtkrf@yahoo.com',17239811),(716,'idsz.wxxwqoxvptx@yahoo.com',17239812),(717,'rmlthdu_nwtciiqf@mail.com',17239813),(718,'uoj_hvhyvklzuihj@google.com',17239814),(719,'igke_irlencxgukpw@live.com',17239815),(720,'btny_nxbpvibkanqmpl@yahoo.com',17239816),(721,'buuia.vqrnnzkcbm@yahoo.com',17239817),(722,'aexrveg_wegsuurzgvhafy@google.com',17239818);
/*!40000 ALTER TABLE `coms_trainer_email` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_trainer_exam_id`),
  KEY `coms_trainer_id_fk_2_idx` (`coms_trainer_id`),
  KEY `coms_exam_id_fk_2_idx` (`coms_exam_id`),
  KEY `state_id_fk03` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_3` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainer_id_fk_4` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk03` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3924873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_trainer_exam`
--

LOCK TABLES `coms_trainer_exam` WRITE;
/*!40000 ALTER TABLE `coms_trainer_exam` DISABLE KEYS */;
INSERT INTO `coms_trainer_exam` VALUES (3924577,17239801,157281,NULL),(3924578,17239801,157282,NULL),(3924579,17239801,157283,NULL),(3924580,17239801,157284,NULL),(3924581,17239801,157285,NULL),(3924582,17239801,157290,NULL),(3924583,17239801,157288,NULL),(3924584,17239801,157289,NULL),(3924585,17239802,157281,NULL),(3924586,17239802,157282,NULL),(3924587,17239802,157283,NULL),(3924588,17239802,157284,NULL),(3924589,17239802,157288,NULL),(3924590,17239802,157289,NULL),(3924591,17239802,157294,NULL),(3924592,17239802,157295,NULL),(3924593,17239802,157296,NULL),(3924594,17239802,157297,NULL),(3924595,17239802,157298,NULL),(3924596,17239803,157281,NULL),(3924597,17239803,157282,NULL),(3924598,17239803,157283,NULL),(3924599,17239803,157284,NULL),(3924600,17239803,157288,NULL),(3924601,17239803,157289,NULL),(3924602,17239803,157294,NULL),(3924603,17239803,157295,NULL),(3924604,17239803,157296,NULL),(3924605,17239803,157297,NULL),(3924606,17239803,157298,NULL),(3924607,17239804,157281,NULL),(3924608,17239804,157282,NULL),(3924609,17239804,157283,NULL),(3924610,17239804,157284,NULL),(3924611,17239804,157285,NULL),(3924612,17239804,157286,NULL),(3924614,17239804,157288,NULL),(3924615,17239804,157289,NULL),(3924616,17239804,157290,NULL),(3924617,17239804,157291,NULL),(3924618,17239804,157292,NULL),(3924619,17239804,157293,NULL),(3924625,17239807,157281,NULL),(3924626,17239807,157282,NULL),(3924627,17239807,157283,NULL),(3924628,17239807,157284,NULL),(3924634,17239807,157290,NULL),(3924643,17239808,157281,NULL),(3924644,17239808,157282,NULL),(3924645,17239808,157283,NULL),(3924646,17239808,157284,NULL),(3924650,17239808,157288,NULL),(3924651,17239808,157289,NULL),(3924670,17239809,157290,NULL),(3924671,17239809,157291,NULL),(3924672,17239809,157292,NULL),(3924673,17239809,157293,NULL),(3924679,17239810,157281,NULL),(3924680,17239810,157282,NULL),(3924681,17239810,157283,NULL),(3924682,17239810,157284,NULL),(3924688,17239810,157290,NULL),(3924689,17239810,157291,NULL),(3924697,17239811,157281,NULL),(3924699,17239811,157283,NULL),(3924701,17239811,157285,NULL),(3924706,17239811,157290,NULL),(3924755,17239812,157285,NULL),(3924756,17239812,157286,NULL),(3924769,17239813,157281,NULL),(3924770,17239813,157282,NULL),(3924771,17239813,157283,NULL),(3924772,17239813,157284,NULL),(3924773,17239813,157285,NULL),(3924776,17239813,157288,NULL),(3924777,17239813,157289,NULL),(3924778,17239813,157290,NULL),(3924779,17239813,157291,NULL),(3924780,17239813,157292,NULL),(3924781,17239813,157293,NULL),(3924787,17239814,157281,NULL),(3924788,17239814,157282,NULL),(3924791,17239814,157285,NULL),(3924794,17239814,157288,NULL),(3924795,17239814,157289,NULL),(3924805,17239815,157281,NULL),(3924806,17239815,157282,NULL),(3924807,17239815,157283,NULL),(3924808,17239815,157284,NULL),(3924812,17239815,157288,NULL),(3924813,17239815,157289,NULL),(3924823,17239805,157281,NULL),(3924824,17239805,157282,NULL),(3924825,17239805,157283,NULL),(3924826,17239805,157285,NULL),(3924827,17239805,157286,NULL),(3924828,17239805,157288,NULL),(3924829,17239805,157289,NULL),(3924830,17239805,157290,NULL),(3924831,17239805,157291,NULL),(3924832,17239805,157292,NULL),(3924833,17239805,157293,NULL),(3924834,17239805,157294,NULL),(3924835,17239806,157281,NULL),(3924836,17239806,157282,NULL),(3924837,17239806,157283,NULL),(3924838,17239806,157284,NULL),(3924839,17239806,157285,NULL),(3924840,17239806,157286,NULL),(3924841,17239806,157287,NULL),(3924842,17239806,157288,NULL),(3924843,17239806,157289,NULL),(3924844,17239806,157290,NULL),(3924845,17239806,157291,NULL),(3924846,17239806,157292,NULL),(3924847,17239806,157293,NULL),(3924848,17239806,157294,NULL),(3924849,17239806,157295,43),(3924850,17239806,157296,43),(3924851,17239806,157297,43),(3924852,17239806,157298,43),(3924853,17239816,157281,43),(3924854,17239817,157281,43),(3924855,17239817,157282,43),(3924856,17239817,157283,43),(3924857,17239817,157284,43),(3924858,17239817,157285,43),(3924859,17239817,157286,43),(3924860,17239817,157287,43),(3924861,17239817,157288,43),(3924862,17239817,157289,43),(3924863,17239817,157290,43),(3924864,17239817,157291,43),(3924865,17239817,157292,43),(3924866,17239817,157293,43),(3924867,17239817,157294,43),(3924868,17239817,157295,43),(3924869,17239817,157296,43),(3924870,17239817,157297,43),(3924871,17239817,157298,43),(3924872,17239818,157294,43);
/*!40000 ALTER TABLE `coms_trainer_exam` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_training`
--

LOCK TABLES `coms_training` WRITE;
/*!40000 ALTER TABLE `coms_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_training` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_training_event`
--

LOCK TABLES `coms_training_event` WRITE;
/*!40000 ALTER TABLE `coms_training_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_training_event` ENABLE KEYS */;
UNLOCK TABLES;

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
  `coms_training_organisation_passwd_hash` varchar(512) DEFAULT NULL,
  `coms_training_organisation_email` varchar(100) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_training_organisation_id`),
  KEY `state_id_fk07` (`state_id`),
  CONSTRAINT `state_id_fk07` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=773539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_training_organisation`
--

LOCK TABLES `coms_training_organisation` WRITE;
/*!40000 ALTER TABLE `coms_training_organisation` DISABLE KEYS */;
INSERT INTO `coms_training_organisation` VALUES (773532,'OrgansationTorres','Wilson','00N1MAN3','387','5eaf1b26e33089eadf2d3652262f5dc0','6581f98cadde8ef2044846296bfc9ea7dee1fcde00ebf4a780dcda379bc106cf9c4d5d9461e0f0a0685dec59e97ed827e490542c379c4a7a3ac143d3aef288ba','jpvnl_yudjhiubwakzsq@google.com',62),(773533,'OrgansationWhite','Torres','00N1MC5B','867','d3e2049b15787580c9ab5f824f1444eb','b91bc4fc7a2b547857364bc23da45335eb3d1ed89ab099cb65ec970526f0a9c322b00557cd1b8afef66feee0b8439780e5e689ed83b2fb5b3d87600873197d45','ytvcrdr_nyctjpxut@google.com',62),(773534,'OrgansationGonzales','Bailey','00N1MCR1','561','8909851e0905f27cc9051c00aecb1272','94e9352dbcb44dd40e0939865b7273b0c10e43a17a8e49284f09bd11c1585b09aefae6b0e29d51621c37def3483ac343a5204eee22c240cf160ec28662f0d051','eaq_eanpmokjtbay@live.com',62),(773535,'OrgansationLewis','Lopez','00N1MDF6','206','324ec437063c76b9a17bb26e510db086','396b70af1048e55d7e326849cc7dcae7733b69bbdc7a50535f4c7e76355695a5e89bb8b1d35f39b0e1661c3a25f3281162e590f89a3e76982339994fe0848cc9','xnzk.cracnflr@yahoo.com',58),(773536,'OrgansationRoberts','White','00N1MELB','427','686bad9015734e8e5101330cf47a7394','493eeaabf78b6e708b2bd0e78842d8cb9c2fe92b45b6587a0015c63e6dae12ffb5d0377565231fa20e81b9bc6efae64d1f6c6dc462a0746f40bba4a23f099234','kqxgo_eamjkxiwfy@google.com',58),(773537,'OrgansationMorgan','Cooper','00N1MFTD','709','ad249bd9e799e8151dcf4625ae9ffbef','2f83f7d90fd37982470ab463c17ba941b1aa759546fc62ece759993a9a7be3733bce4f68b4bd01f6e1949e87e5d47c594cf8f0e566ca7edcd014664d88063ce8','kfuf.fnamkmgwvsb@google.com',58),(773538,'OrgansationCox','James','00N1MGB8','152','2529b107736b862c3daca397d0b3e940','653ec481048f6510ecd06cfa483e9cd7f9e7d3acf7ce8b78cd70a43798581a97f73ed57dca0543aebc816e5835e05381dbceb7de0a9cbd7559210e85a2a5b5cf','qbkyebt_obqzaevogct@yahoo.com',58);
/*!40000 ALTER TABLE `coms_training_organisation` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_training_organisation_proctor`
--

LOCK TABLES `coms_training_organisation_proctor` WRITE;
/*!40000 ALTER TABLE `coms_training_organisation_proctor` DISABLE KEYS */;
INSERT INTO `coms_training_organisation_proctor` VALUES (19,773532,26539816),(20,773532,26539817),(21,773533,26539818),(22,773533,26539816),(23,773533,26539817),(24,773534,26539819),(25,773534,26539820),(26,773532,26539821),(27,773532,26539822),(28,773532,26539823),(29,773532,26539824),(30,773532,26539825),(31,773532,26539826),(32,773532,26539827),(33,773532,26539828),(34,773532,26539829),(35,773532,26539830),(36,773532,26539831),(37,773532,26539832),(38,773532,26539833),(39,773532,26539834),(40,773532,26539835),(41,773532,26539836),(42,773534,26539837),(43,773534,26539838);
/*!40000 ALTER TABLE `coms_training_organisation_proctor` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_training_organisation_trainer_id`),
  KEY `coms_trainer_id_fk_1_idx` (`coms_trainer_id`),
  KEY `coms_training_organisationt_id_fk_2_idx` (`coms_training_organisation_id`),
  KEY `state_id_fk04` (`state_id`),
  CONSTRAINT `coms_trainer_id_fk_2` FOREIGN KEY (`coms_trainer_id`) REFERENCES `coms_trainer` (`coms_trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_training_organisation_id_fk_3` FOREIGN KEY (`coms_training_organisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk04` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_training_organisation_trainer`
--

LOCK TABLES `coms_training_organisation_trainer` WRITE;
/*!40000 ALTER TABLE `coms_training_organisation_trainer` DISABLE KEYS */;
INSERT INTO `coms_training_organisation_trainer` VALUES (1,773532,17239804,NULL),(2,773532,17239805,NULL),(3,773532,17239806,NULL),(4,773532,17239807,NULL),(5,773532,17239808,NULL),(6,773532,17239809,NULL),(7,773532,17239810,NULL),(8,773532,17239811,NULL),(9,773532,17239812,NULL),(10,773532,17239813,NULL),(11,773532,17239814,NULL),(12,773532,17239815,NULL),(13,773532,17239801,NULL),(14,773532,17239802,NULL),(15,773532,17239803,NULL),(16,773533,17239801,NULL),(17,773533,17239802,NULL),(18,773533,17239803,NULL),(19,773532,17239816,NULL),(20,773534,17239817,NULL),(21,773532,17239818,NULL);
/*!40000 ALTER TABLE `coms_training_organisation_trainer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `coms_training_organisation_training_event`
--

LOCK TABLES `coms_training_organisation_training_event` WRITE;
/*!40000 ALTER TABLE `coms_training_organisation_training_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `coms_training_organisation_training_event` ENABLE KEYS */;
UNLOCK TABLES;

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
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`coms_trainingsorganisation_exam_id`),
  KEY `coms_trainingsorganisation_id_fk_11_idx` (`coms_trainingsorganisation_id`),
  KEY `coms_exam_id_fk_12_idx` (`coms_exam_id`),
  KEY `state_id_fk08` (`state_id`),
  CONSTRAINT `coms_exam_id_fk_12` FOREIGN KEY (`coms_exam_id`) REFERENCES `coms_exam` (`coms_exam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `coms_trainingsorganisation_id_fk_11` FOREIGN KEY (`coms_trainingsorganisation_id`) REFERENCES `coms_training_organisation` (`coms_training_organisation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_id_fk08` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5929891 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coms_trainingsorganisation_exam`
--

LOCK TABLES `coms_trainingsorganisation_exam` WRITE;
/*!40000 ALTER TABLE `coms_trainingsorganisation_exam` DISABLE KEYS */;
INSERT INTO `coms_trainingsorganisation_exam` VALUES (5929853,773532,157281,NULL),(5929854,773532,157282,NULL),(5929855,773532,157283,NULL),(5929856,773532,157284,NULL),(5929857,773532,157285,NULL),(5929858,773532,157286,NULL),(5929859,773532,157287,NULL),(5929860,773532,157288,NULL),(5929861,773532,157289,NULL),(5929862,773532,157290,NULL),(5929863,773532,157291,NULL),(5929864,773532,157292,NULL),(5929865,773532,157293,NULL),(5929866,773532,157294,NULL),(5929867,773532,157295,NULL),(5929868,773532,157296,NULL),(5929869,773532,157297,NULL),(5929870,773532,157298,NULL),(5929871,773533,157281,NULL),(5929872,773534,157282,NULL),(5929873,773534,157283,NULL),(5929874,773534,157284,NULL),(5929875,773534,157285,NULL),(5929876,773534,157286,NULL),(5929877,773534,157287,NULL),(5929878,773534,157288,NULL),(5929879,773534,157289,NULL),(5929880,773534,157290,NULL),(5929881,773534,157291,NULL),(5929882,773534,157292,NULL),(5929883,773534,157293,NULL),(5929884,773533,157294,NULL),(5929885,773534,157295,NULL),(5929886,773534,157296,NULL),(5929887,773534,157297,NULL),(5929888,773534,157298,NULL),(5929889,773534,157281,NULL),(5929890,773534,157294,NULL);
/*!40000 ALTER TABLE `coms_trainingsorganisation_exam` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (27,'new',NULL,'coms_participant_exam_event'),(28,'prepared',NULL,NULL),(29,'participated ',NULL,NULL),(30,'not participated',NULL,NULL),(31,'succeeded',NULL,NULL),(32,'failed',NULL,NULL),(33,'new',NULL,'coms_training_organisation_exam_event'),(34,'bookable',NULL,NULL),(35,'prepared',NULL,NULL),(36,'ready',NULL,NULL),(37,'upheld',NULL,NULL),(38,'closed',NULL,NULL),(39,'canceled',NULL,NULL),(40,'new',NULL,'coms_trainer'),(41,'active',NULL,NULL),(42,'inactive',NULL,NULL),(43,'new',NULL,'coms_trainer_exam'),(44,'active',NULL,NULL),(45,'inactive',NULL,NULL),(46,'new',NULL,'coms_training_organisation_trainer'),(47,'active',NULL,NULL),(48,'inactive',NULL,NULL),(49,'new',NULL,'coms_proctor'),(50,'active',NULL,NULL),(51,'inactive',NULL,NULL),(52,'new',NULL,'coms_training_organisation_proctor'),(53,'active',NULL,NULL),(54,'inactive',NULL,NULL),(55,'new',NULL,'coms_certificate'),(56,'active',NULL,NULL),(57,'inactive',NULL,NULL),(58,'registered (new)',NULL,'coms_training_organisation'),(59,'classified',NULL,NULL),(60,'offer accepted',NULL,NULL),(61,'offer declined',NULL,NULL),(62,'temp. accredited',NULL,NULL),(63,'document audit succesfull',NULL,NULL),(64,'init audit succesfull',NULL,NULL),(65,'audit succesfull',NULL,NULL),(66,'accredited',NULL,NULL),(67,'accredited withdrawn',NULL,NULL),(68,'tmp accredited withdrawn',NULL,NULL),(69,'canceled',NULL,NULL),(70,'new',NULL,'coms_trainingsorganisation_exam'),(71,'active',NULL,NULL),(72,'inactive',NULL,NULL),(73,'new',NULL,'coms_certificate_participant'),(74,'active',NULL,NULL),(75,'inactive',NULL,NULL),(76,'new',NULL,'coms_exam'),(77,'orderable',NULL,NULL),(78,'not orderable any more',NULL,NULL);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_rules`
--

LOCK TABLES `state_rules` WRITE;
/*!40000 ALTER TABLE `state_rules` DISABLE KEYS */;
INSERT INTO `state_rules` VALUES (1,27,27,NULL),(2,27,28,NULL),(3,28,28,NULL),(4,28,29,NULL),(5,29,29,NULL),(6,28,30,NULL),(7,30,30,NULL),(8,29,31,NULL),(9,31,31,NULL),(10,29,32,NULL),(11,32,32,NULL),(12,33,33,NULL),(13,33,34,NULL),(14,34,34,NULL),(15,34,35,NULL),(16,35,35,NULL),(17,35,36,NULL),(18,36,36,NULL),(19,36,37,NULL),(20,37,37,NULL),(21,37,38,NULL),(22,38,38,NULL),(23,34,39,NULL),(24,35,39,NULL),(25,36,39,NULL),(26,39,39,NULL),(27,40,40,NULL),(28,40,41,NULL),(29,41,41,NULL),(30,41,42,NULL),(31,42,42,NULL),(32,43,43,NULL),(33,43,44,NULL),(34,44,44,NULL),(35,44,45,NULL),(36,45,45,NULL),(37,46,46,NULL),(38,46,47,NULL),(39,47,47,NULL),(40,47,48,NULL),(41,48,48,NULL),(42,49,49,NULL),(43,49,50,NULL),(44,50,50,NULL),(45,50,51,NULL),(46,51,51,NULL),(47,52,52,NULL),(48,52,53,NULL),(49,53,53,NULL),(50,53,54,NULL),(51,54,54,NULL),(52,55,55,NULL),(53,55,56,NULL),(54,56,56,NULL),(55,56,57,NULL),(56,57,57,NULL),(57,58,58,NULL),(58,58,59,NULL),(59,59,59,NULL),(60,59,60,NULL),(61,59,61,NULL),(62,60,60,NULL),(63,60,62,NULL),(64,60,63,NULL),(65,60,69,NULL),(66,61,61,NULL),(67,62,62,NULL),(68,62,65,NULL),(69,62,68,NULL),(70,63,63,NULL),(71,63,64,NULL),(72,63,69,NULL),(73,64,64,NULL),(74,64,66,NULL),(75,64,69,NULL),(76,65,65,NULL),(77,65,66,NULL),(78,66,66,NULL),(79,66,65,NULL),(80,66,68,NULL),(81,66,67,NULL),(82,67,67,NULL),(83,68,68,NULL),(84,68,67,NULL),(85,68,66,NULL),(86,68,65,NULL),(87,69,69,NULL),(88,58,69,NULL),(89,59,69,NULL),(90,70,70,NULL),(91,70,71,NULL),(92,71,71,NULL),(93,71,72,NULL),(94,72,72,NULL),(95,73,73,NULL),(96,73,74,NULL),(97,74,74,NULL),(98,74,75,NULL),(99,75,75,NULL),(100,76,76,NULL),(101,76,77,NULL),(102,77,77,NULL),(103,77,78,NULL),(104,78,78,NULL);
/*!40000 ALTER TABLE `state_rules` ENABLE KEYS */;
UNLOCK TABLES;

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
 1 AS `Certificate`*/;
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
 1 AS `coms_participant_emailadresss`,
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
 1 AS `coms_trainer_lastname`,
 1 AS `coms_proctor_id`,
 1 AS `coms_proctor_firstname`,
 1 AS `coms_proctor_lastname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'bpmspace_coms_v3'
--

--
-- Dumping routines for database 'bpmspace_coms_v3'
--
/*!50003 DROP FUNCTION IF EXISTS `generate_fname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_fname`() RETURNS varchar(255) CHARSET utf8
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generate_lname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_lname`() RETURNS varchar(255) CHARSET utf8
BEGIN
	RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `str_random` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `str_random`(p_pattern VARCHAR(200)) RETURNS varchar(2000) CHARSET utf8
    NO SQL
BEGIN
    /**
    * String function. Returns a random string based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 2.3
    * Example usage:
    * SELECT str_random('dddd CC') AS DutchZipCode;
    * SELECT str_random('d{4} C{2}') AS DutchZipCode;
    * SELECT str_random('*{5}*(4)') AS password;
    * select str_random('Cccc(4)') as name;
    * SELECT str_random('#X{6}') AS htmlColorCode;
    * See more complex examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          MASKS:
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexadecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          DIRECTIVES
    *                          "text"      : text is taken literally
    *                          {nn}        : repeat the last mask nn times
    *                          (nn)        : repeat random, but max nn times
    *                          [item|item] : pick a random item from this list, items are separated by a pipe symbol
    *                          All other characters are taken literally
    * %return String
    */

    DECLARE v_iter              SMALLINT DEFAULT 1;
    DECLARE v_char              VARCHAR(1) DEFAULT '';
    DECLARE v_next_char         VARCHAR(1) DEFAULT '';
    DECLARE v_list              VARCHAR(200) DEFAULT '';
    DECLARE v_text              VARCHAR(200) DEFAULT '';
    DECLARE v_result            VARCHAR(2000) DEFAULT '';
    DECLARE v_count             SMALLINT DEFAULT 0;
    DECLARE v_jump_characters   TINYINT DEFAULT 0;
    DECLARE v_end_position      SMALLINT DEFAULT 0;
    DECLARE v_list_count        TINYINT DEFAULT 0;
    DECLARE v_random_item       TINYINT DEFAULT 0;

    WHILE v_iter <= CHAR_LENGTH(p_pattern) DO

        SET v_char := BINARY SUBSTRING(p_pattern,v_iter,1);
        SET v_next_char := BINARY SUBSTRING(p_pattern,(v_iter + 1),1);

        -- check if text is a fixed text
        IF (v_char = '"') THEN
            -- get the text
            SET v_end_position := LOCATE('"', p_pattern, v_iter + 1);
            SET v_text := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- add the text to the result
            SET v_result := CONCAT(v_result, v_text);
            SET v_iter := v_iter + CHAR_LENGTH(v_text) + 2;
        -- if character has a count specified: repeat it
        ELSEIF (v_next_char = '{') OR (v_next_char = '(') THEN
            -- find out what the count is (max 999)...
            IF (SUBSTRING(p_pattern,(v_iter + 3),1) = '}') OR
               (SUBSTRING(p_pattern,(v_iter + 3),1) = ')') THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),1);
                SET v_jump_characters := 4;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 4),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 4),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),2);
                SET v_jump_characters := 5;
            ELSEIF (SUBSTRING(p_pattern,(v_iter + 5),1) = '}') OR
                   (SUBSTRING(p_pattern,(v_iter + 5),1) = ')')THEN
                SET v_count := SUBSTRING(p_pattern,(v_iter + 2),3);
                SET v_jump_characters := 6;
            ELSE
                SET v_count := 0;
                SET v_jump_characters := 3;
            END IF;
            -- if random count: make it random with a max of count
            IF (v_next_char = '(') THEN
                SET v_count := FLOOR((RAND() * v_count));
            END IF;
            -- repeat the characters
            WHILE v_count > 0 DO
                SET v_result := CONCAT(v_result,str_random_character(v_char));
                SET v_count := v_count - 1;
            END WHILE;
            SET v_iter := v_iter + v_jump_characters;
        -- check if there is a list in the pattern
        ELSEIF (v_char = '[') THEN
            -- get the list
            SET v_end_position := LOCATE(']', p_pattern, v_iter + 1);
            SET v_list := SUBSTRING(p_pattern,v_iter + 1,(v_end_position - v_iter) - 1);
            -- find out how many items are in the list, items are seperated by a pipe
            SET v_list_count := (LENGTH(v_list) - LENGTH(REPLACE(v_list, '|', '')) + 1);
            -- pick a random item from the list
            SET v_random_item := FLOOR(1 + (RAND() * v_list_count));
            -- add the item from the list
            SET v_result := CONCAT(v_result,
                                   REPLACE(SUBSTRING(SUBSTRING_INDEX(v_list, '|' ,v_random_item),
                                           CHAR_LENGTH(SUBSTRING_INDEX(v_list,'|', v_random_item -1)) + 1),
                                           '|', '')
                                  );
            SET v_iter := v_iter + CHAR_LENGTH(v_list) + 2;
        -- no directives: just get a random character
        ELSE
            SET v_result := CONCAT(v_result, str_random_character(v_char));
            SET v_iter := v_iter + 1;
        END IF;

   END WHILE;

   RETURN v_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `str_random_character` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `str_random_character`(p_char VARCHAR(1)) RETURNS varchar(1) CHARSET utf8
    NO SQL
BEGIN
    /**
    * String function. Returns random character based on a mask
    * <br>
    * %author Ronald Speelman
    * %version 1.5
    * Example usage:
    * SELECT str_random_character('d') AS digit;
    * SELECT str_random_character('C') AS UPPER;
    * See more examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_pattern String: the pattern describing the random values
    *                          c returns lower-case character [a-z]
    *                          C returns upper-case character [A-Z]
    *                          A returns either upper or lower-case character [a-z A-Z]
    *                          d returns a digit [0-9]
    *                          D returns a digit without a zero [1-9]
    *                          b returns a bit [0-1]
    *                          X returns hexedecimal character [0-F]
    *                          * returns characters, decimals and special characters [a-z A-Z 0-9 !?-_@$#]
    *                          All other characters are taken literally
    * %return VARCHAR(1)
    */

    DECLARE v_result   VARCHAR(1) DEFAULT '';

        CASE p_char
            WHEN BINARY '*' THEN SET v_result := ELT(1 + FLOOR(RAND() * 69),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                                                                                 '!','?','-','_','@','$','#',
                                                                                 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'A' THEN SET v_result := ELT(1 + FLOOR(RAND() * 52),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                                                 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'c' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
            WHEN BINARY 'C' THEN SET v_result := ELT(1 + FLOOR(RAND() * 26),'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
            WHEN BINARY 'd' THEN SET v_result := ELT(1 + FLOOR(RAND() * 10), 0,1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'D' THEN SET v_result := ELT(1 + FLOOR(RAND() * 9), 1,2,3,4,5,6,7,8,9);
            WHEN BINARY 'X' THEN SET v_result := ELT(1 + FLOOR(RAND() * 16), 0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F');
            WHEN BINARY 'b' THEN SET v_result := ELT(1 + FLOOR(RAND() * 2), 0,1);
            ELSE
                SET v_result := p_char;
        END CASE;

   RETURN v_result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `str_random_lipsum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `str_random_lipsum`(p_max_words SMALLINT
                                 ,p_min_words SMALLINT
                                 ,p_start_with_lipsum TINYINT(1)
                                 ) RETURNS varchar(10000) CHARSET utf8
    NO SQL
BEGIN
    /**
    * String function. Returns a random Lorum Ipsum string of nn words
    * <br>
    * %author Ronald Speelman
    * %version 1.0
    * Example usage:
    * SELECT str_random_lipsum(5,NULL,NULL) AS fiveWordsExactly;
    * SELECT str_random_lipsum(10,5,0) AS five-tenWords;
    * SELECT str_random_lipsum(50,10,1) AS startWithLorumIpsum;
    * See more complex examples and a description on www.moinne.com/blog/ronald
    *
    * %param p_max_words         Number: the maximum amount of words, if no
    *                                    min_words are provided this will be the
    *                                    exaxt amount of words in the result
    *                                    Default = 50
    * %param p_min_words         Number: the minimum amount of words in the
    *                                    result, By providing the parameter, you provide a range
    *                                    Default = 0
    * %param p_start_with_lipsum Boolean:if "1" the string will start with
    *                                    'Lorum ipsum dolor sit amet.', Default = 0
    * %return String
    */

        DECLARE v_max_words SMALLINT DEFAULT 50;
        DECLARE v_random_item SMALLINT DEFAULT 0;
        DECLARE v_random_word VARCHAR(25) DEFAULT '';
        DECLARE v_start_with_lipsum TINYINT DEFAULT 0;
        DECLARE v_result VARCHAR(10000) DEFAULT '';
        DECLARE v_iter INT DEFAULT 1;
        DECLARE v_text_lipsum VARCHAR(1500) DEFAULT 'a ac accumsan ad adipiscing aenean aliquam aliquet amet ante aptent arcu at auctor augue bibendum blandit class commodo condimentum congue consectetuer consequat conubia convallis cras cubilia cum curabitur curae; cursus dapibus diam dictum dignissim dis dolor donec dui duis egestas eget eleifend elementum elit enim erat eros est et etiam eu euismod facilisi facilisis fames faucibus felis fermentum feugiat fringilla fusce gravida habitant hendrerit hymenaeos iaculis id imperdiet in inceptos integer interdum ipsum justo lacinia lacus laoreet lectus leo libero ligula litora lobortis lorem luctus maecenas magna magnis malesuada massa mattis mauris metus mi molestie mollis montes morbi mus nam nascetur natoque nec neque netus nibh nisi nisl non nonummy nostra nulla nullam nunc odio orci ornare parturient pede pellentesque penatibus per pharetra phasellus placerat porta porttitor posuere praesent pretium primis proin pulvinar purus quam quis quisque rhoncus ridiculus risus rutrum sagittis sapien scelerisque sed sem semper senectus sit sociis sociosqu sodales sollicitudin suscipit suspendisse taciti tellus tempor tempus tincidunt torquent tortor tristique turpis ullamcorper ultrices ultricies urna ut varius vehicula vel velit venenatis vestibulum vitae vivamus viverra volutpat vulputate';
        DECLARE v_text_lipsum_wordcount INT DEFAULT 180;
        DECLARE v_sentence_wordcount INT DEFAULT 0;
        DECLARE v_sentence_start BOOLEAN DEFAULT 1;
        DECLARE v_sentence_end BOOLEAN DEFAULT 0;
        DECLARE v_sentence_lenght TINYINT DEFAULT 9;

        SET v_max_words := COALESCE(p_max_words, v_max_words);
        SET v_start_with_lipsum := COALESCE(p_start_with_lipsum , v_start_with_lipsum);

        IF p_min_words IS NOT NULL THEN
            SET v_max_words := FLOOR(p_min_words + (RAND() * (v_max_words - p_min_words)));
        END IF;

        IF v_max_words < v_sentence_lenght THEN
            SET v_sentence_lenght := v_max_words;
        END IF;

        IF p_start_with_lipsum = 1 THEN
            SET v_result := CONCAT(v_result,'Lorem ipsum dolor sit amet.');
            SET v_max_words := v_max_words - 5;
        END IF;

        WHILE v_iter <= v_max_words DO
            SET v_random_item := FLOOR(1 + (RAND() * v_text_lipsum_wordcount));
            SET v_random_word := REPLACE(SUBSTRING(SUBSTRING_INDEX(v_text_lipsum, ' ' ,v_random_item),
                                           CHAR_LENGTH(SUBSTRING_INDEX(v_text_lipsum,' ', v_random_item -1)) + 1),
                                           ' ', '');

            SET v_sentence_wordcount := v_sentence_wordcount + 1;
            IF v_sentence_wordcount = v_sentence_lenght THEN
                SET v_sentence_end := 1 ;
            END IF;

            IF v_sentence_start = 1 THEN
                SET v_random_word := CONCAT(UPPER(SUBSTRING(v_random_word, 1, 1))
                                            ,LOWER(SUBSTRING(v_random_word FROM 2)));
                SET v_sentence_start := 0 ;
            END IF;

            IF v_sentence_end = 1 THEN
                IF v_iter <> v_max_words THEN
                    SET v_random_word := CONCAT(v_random_word, '.');
                END IF;
                SET v_sentence_lenght := FLOOR(9 + (RAND() * 7));
                SET v_sentence_end := 0 ;
                SET v_sentence_start := 1 ;
                SET v_sentence_wordcount := 0 ;
            END IF;

            SET v_result := CONCAT(v_result,' ', v_random_word);
            SET v_iter := v_iter + 1;
        END WHILE;

        RETURN TRIM(CONCAT(v_result,'.'));
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


INSERT INTO `coms_certificate_participant` (`coms_certificate_participant_date`, `coms_certificate_id`, `coms_participant_id`) VALUES (@Date, @Cert_ID, @Participant_ID);

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_part_event`(IN Lastname CHAR(255), IN Firstname CHAR(255), IN Gender CHAR(255), IN Email CHAR(255), IN DateOfBirth CHAR(255), IN CityOfBirth CHAR(255), IN CountryOfBirth CHAR(255), IN event CHAR(255))
BEGIN

set @LASTNAME = trim(TRIM(CHAR(9) FROM TRIM(Lastname)));
set @FIRSTNAME = trim(TRIM(CHAR(9) FROM TRIM(firstname)));
set @GENDER = trim(TRIM(CHAR(9) FROM TRIM(Gender)));
set @EMAIL = trim(TRIM(CHAR(9) FROM TRIM(Email)));
set @BIRTHDATE = trim(TRIM(CHAR(9) FROM TRIM(DateOfBirth)));
set @BIRTHPLACE = trim(TRIM(CHAR(9) FROM TRIM(CityOfBirth)));
set @BIRTHCOUNTRY = trim(TRIM(CHAR(9) FROM TRIM(CountryOfBirth)));
set @EXAM_EVENT_ID = event;

INSERT INTO .`coms_participant` (`coms_participant_gender`, `coms_participant_lastname`, `coms_participant_firstname`, `coms_participant_public`, `coms_participant_placeofbirth`, `coms_participant_dateofbirth`,  `coms_participant_birthcountry`) VALUES (@GENDER, @LASTNAME, @FIRSTNAME, '0', @BIRTHPLACE, @BIRTHDATE, @BIRTHCOUNTRY );

SET @PARTICIPANTID = LAST_INSERT_ID();

INSERT INTO `coms_participant_identifier` (`coms_participant_id`, `coms_participant_md5`) VALUES (@PARTICIPANTID, md5(@PARTICIPANTID));

UPDATE `coms_participant_identifier` set `coms_participant_matriculation` = concat(`coms_participant_id`,SUBSTRING(CONV(SUBSTRING(coms_participant_md5,1,5),16,10),1,3)) where coms_participant_id = @PARTICIPANTID;

UPDATE `coms_participant_identifier` set `coms_participant_base32` = LPAD(CONV(`coms_participant_matriculation`,10,32),8,'0') where coms_participant_id = @PARTICIPANTID;

INSERT INTO `coms_participant_email` (`coms_participant_id`, `coms_participant_emailadresss`) VALUES (@PARTICIPANTID, @EMAIL);

INSERT INTO coms_participant_exam_event (coms_participant_id, coms_exam_event_id, state_id) VALUES (@PARTICIPANTID, @EXAM_EVENT_ID, '27');

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

INSERT INTO `coms_proctor_email` (`coms_proctor_emailadresss`, `coms_proctor_id`) VALUES (@EMAIL, @PROCTOR_ID);

INSERT INTO `coms_training_organisation_proctor` (`coms_training_organisation_id`, `coms_proctor_id`) VALUES (@ATO_ID, @PROCTOR_ID);


UPDATE coms_proctor set coms_proctor_id_md5 = md5(coms_proctor_id) where coms_proctor_id = @PROCTOR_ID;

UPDATE coms_proctor set coms_proctor_3digit = SUBSTRING(CONV(SUBSTRING(coms_proctor_id_md5,1,5),16,10),1,3) where coms_proctor_id = @PROCTOR_ID;
	
UPDATE coms_proctor set coms_proctor_id_base32 = LPAD(CONV(concat(coms_proctor_id,coms_proctor_3digit),10,32),8,'0') where coms_proctor_id = @PROCTOR_ID;

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
/*!50001 VIEW `v_certificate_participant` AS select distinct `CePa`.`coms_certificate_participant_id` AS `coms_certificate_participant_id`,`CePa`.`coms_certificate_participant_date` AS `coms_certificate_participant_date`,`CePa`.`coms_certificate_participant_id_base32` AS `coms_certificate_participant_id_base32`,`CePa`.`coms_certificate_id` AS `coms_certificate_id`,`Ce`.`coms_certificate_name` AS `coms_certificate_name`,`Ce`.`coms_certificate_description` AS `coms_certificate_description`,`Ce`.`coms_certificate_intro` AS `coms_certificate_intro`,`Ce`.`coms_certificate_type_id` AS `coms_certificate_type_id`,`CT`.`coms_certificate_type_description` AS `coms_certificate_type_description`,`Pa`.`coms_participant_id` AS `coms_participant_id`,`PaId`.`coms_participant_base32` AS `coms_participant_base32`,`PaId`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`Pa`.`coms_participant_gender` AS `coms_participant_gender`,`Pa`.`coms_participant_firstname` AS `coms_participant_firstname`,`Pa`.`coms_participant_lastname` AS `coms_participant_lastname`,`Pa`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`Pa`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`Pa`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`CePa`.`coms_certificate` AS `Certificate` from ((((`coms_certificate` `Ce` join `coms_certificate_participant` `CePa`) join `coms_participant` `Pa`) join `coms_participant_identifier` `PaId`) join `coms_certificate_type` `CT`) where ((`Ce`.`coms_certificate_id` = `CePa`.`coms_certificate_id`) and (`CePa`.`coms_participant_id` = `Pa`.`coms_participant_id`) and (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`) and (`CT`.`coms_certificate_type_id` = `Ce`.`coms_certificate_type_id`) and (`PaId`.`coms_participant_id` = `Pa`.`coms_participant_id`)) */;
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
/*!50001 VIEW `v_coms_datasheet_exam_event` AS select `v_coms_participant__id__email`.`coms_participant_id` AS `coms_participant_id`,`v_coms_participant__id__email`.`coms_participant_matriculation` AS `coms_participant_matriculation`,`v_coms_participant__id__email`.`coms_participant_md5` AS `coms_participant_md5`,`v_coms_participant__id__email`.`coms_participant_base32` AS `coms_participant_base32`,`v_coms_participant__id__email`.`coms_participant_gender` AS `coms_participant_gender`,`v_coms_participant__id__email`.`coms_participant_lastname` AS `coms_participant_lastname`,`v_coms_participant__id__email`.`coms_participant_firstname` AS `coms_participant_firstname`,`v_coms_participant__id__email`.`coms_participant_public` AS `coms_participant_public`,`v_coms_participant__id__email`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`v_coms_participant__id__email`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`v_coms_participant__id__email`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`v_coms_participant__id__email`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id`,`v_coms_participant__id__email`.`coms_participant_emailadresss` AS `coms_participant_emailadresss`,`v_coms_participant__id__email`.`url_form_participant` AS `url_form_participant`,`coms_participant_exam_event`.`coms_participant_exam_event_id` AS `coms_participant_exam_event_id`,`coms_participant_exam_event`.`coms_exam_event_id` AS `coms_exam_event_id`,`coms_participant_exam_event`.`state_id` AS `state_id`,`coms_participant_exam_event`.`coms_participant_exam_event_percent` AS `coms_participant_exam_event_percent`,`coms_participant_exam_event`.`coms_participant_info` AS `coms_participant_info` from (`v_coms_participant__id__email` join `coms_participant_exam_event` on((`v_coms_participant__id__email`.`coms_participant_id` = `coms_participant_exam_event`.`coms_participant_id`))) */;
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
/*!50001 VIEW `v_coms_participant__Exam_Event` AS select distinct `EE`.`coms_exam_event_id` AS `coms_exam_event_id`,`EE`.`coms_exam_event_name` AS `coms_exam_event_name`,`EE`.`state_id` AS `event_state_id`,`ST2`.`name` AS `event_state_name`,`EE`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`EE`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`EE`.`coms_exam_event_location` AS `coms_exam_event_location`,`EE`.`coms_exam_id` AS `coms_exam_id`,`EE`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`DT`.`coms_delivery_description` AS `coms_delivery_description`,`EE`.`coms_training_org_id` AS `coms_training_org_id`,`TRO`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`EE`.`coms_trainer_id` AS `coms_trainer_id`,`TR`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`TR`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`P`.`coms_participant_id` AS `coms_participant_id`,`P`.`coms_participant_gender` AS `coms_participant_gender`,`P`.`coms_participant_lastname` AS `coms_participant_lastname`,`P`.`coms_participant_firstname` AS `coms_participant_firstname`,`PEE`.`state_id` AS `participant_state`,`ST1`.`name` AS `participant_state_name`,`P`.`coms_participant_public` AS `coms_participant_public`,`P`.`coms_participant_placeofbirth` AS `coms_participant_placeofbirth`,`P`.`coms_participant_birthcountry` AS `coms_participant_birthcountry`,`P`.`coms_participant_dateofbirth` AS `coms_participant_dateofbirth`,`P`.`coms_participant_LIAM_id` AS `coms_participant_LIAM_id` from (((((((`coms_participant` `P` join `coms_participant_exam_event` `PEE`) join `coms_exam_event` `EE`) join `state` `ST1`) join `state` `ST2`) join `coms_delivery_type` `DT`) join `coms_training_organisation` `TRO`) join `coms_trainer` `TR`) where ((`P`.`coms_participant_id` = `PEE`.`coms_participant_id`) and (`PEE`.`coms_exam_event_id` = `EE`.`coms_exam_event_id`) and (`ST1`.`state_id` = `PEE`.`state_id`) and (`ST2`.`state_id` = `EE`.`state_id`) and (`DT`.`coms_delivery_type_id` = `EE`.`coms_delivery_type_id`) and (`TRO`.`coms_training_organisation_id` = `EE`.`coms_training_org_id`) and (`TR`.`coms_trainer_id` = `EE`.`coms_trainer_id`)) */;
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
/*!50001 VIEW `v_csvexport_trainingorg_exam` AS select `coms_training_organisation`.`coms_training_organisation_id` AS `coms_training_organisation_id`,`coms_exam`.`coms_exam_id` AS `coms_exam_id`,`coms_exam`.`coms_exam_name` AS `coms_exam_name` from ((`coms_training_organisation` join `coms_trainingsorganisation_exam` on((`coms_trainingsorganisation_exam`.`coms_trainingsorganisation_id` = `coms_training_organisation`.`coms_training_organisation_id`))) join `coms_exam` on((`coms_trainingsorganisation_exam`.`coms_exam_id` = `coms_exam`.`coms_exam_id`))) */;
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
/*!50001 VIEW `v_exam_event__exam__trainingorg__trainer` AS select `ExEv`.`coms_exam_event_id` AS `coms_exam_event_id`,`ExEv`.`coms_exam_event_name` AS `coms_exam_event_name`,`ExEv`.`coms_exam_id` AS `coms_exam_id`,`ExEv`.`coms_exam_event_id_md5` AS `coms_exam_event_id_md5`,`ExEv`.`coms_exam_event_3digit` AS `coms_exam_event_3digit`,`ExEv`.`coms_exam_event_id_base32` AS `coms_exam_event_id_base32`,`Ex`.`coms_exam_name` AS `coms_exam_name`,`Lg`.`language` AS `exam_language`,`ExEv`.`state_id` AS `event_state_id`,`state`.`name` AS `event_state_name`,`ExEv`.`coms_exam_event_start_date` AS `coms_exam_event_start_date`,`ExEv`.`coms_exam_event_finish_date` AS `coms_exam_event_finish_date`,`ExEv`.`coms_delivery_type_id` AS `coms_delivery_type_id`,`DeTy`.`coms_delivery_description` AS `coms_delivery_description`,`ExEv`.`coms_exam_event_location` AS `coms_exam_event_location`,`ExEv`.`coms_training_org_id` AS `coms_training_org_id`,`TrOr`.`coms_training_organisation_name` AS `coms_training_organisation_name`,`ExEv`.`coms_trainer_id` AS `coms_trainer_id`,`Tr`.`coms_trainer_firstname` AS `coms_trainer_firstname`,`Tr`.`coms_trainer_lastname` AS `coms_trainer_lastname`,`ExEv`.`coms_proctor_id` AS `coms_proctor_id`,`Pr`.`coms_proctor_firstname` AS `coms_proctor_firstname`,`Pr`.`coms_proctor_lastname` AS `coms_proctor_lastname` from (((((((`coms_exam_event` `ExEv` join `coms_exam` `Ex`) join `state`) join `coms_delivery_type` `DeTy`) join `coms_training_organisation` `TrOr`) join `coms_trainer` `Tr`) join `coms_language` `Lg`) join `coms_proctor` `Pr`) where ((`ExEv`.`coms_exam_id` = `Ex`.`coms_exam_id`) and (`ExEv`.`state_id` = `state`.`state_id`) and (`ExEv`.`coms_delivery_type_id` = `DeTy`.`coms_delivery_type_id`) and (`ExEv`.`coms_training_org_id` = `TrOr`.`coms_training_organisation_id`) and (`ExEv`.`coms_trainer_id` = `Tr`.`coms_trainer_id`) and (`Ex`.`coms_exam_language_id` = `Lg`.`coms_language_id`) and (`ExEv`.`coms_proctor_id` = `Pr`.`coms_proctor_id`)) */;
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

-- Dump completed on 2017-10-18 14:19:47
