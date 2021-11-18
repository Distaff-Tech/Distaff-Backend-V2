-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: distaff
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` longtext,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_d930d1dc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `addresses_user_id_d930d1dc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Aman','Kumar','que hdhd did did d','1234567890','Ima','146001',0,'2020-03-11 13:08:41.423993',3),(2,'meera','ali','207 somsons','8899000000','Ldh','990088',1,'2020-03-19 03:06:22.691117',15),(3,'meera','ali','207 somsons','8899000000','Ldh','990088',1,'2020-03-19 04:50:32.731172',16),(4,'Atulosksjddiddjd','Atulosksjddiddjddjddjdddjdhdjdisjdjdjdjdjdjsjsjsjsjsjshdhdhdhdhdhdhdhdhrhdhrhrhrhrhrhdhdhrhrhrhrhrhrjdbdjehdbdhokaredxbxbd','isnsbdjdhddbdosksbdidbdodbdidbdidbdidbdid didn’t get a great day of the day I I am going haha haha was a good night and we had fun at night you haha was a great day for me and we were together for dinner last ','867594021385484648434948431948434846484546485358464','Bodhi’s was a great night and I just got off the road to get a good night out and then I’ll get to the coffee and I I am so excited to go get my coffee I love u I I am so sorry to you have to go get to get the stuff to get my stuff and get a ','qhwiwkendie djelens dbdbd d dbdjslsnvdejksnsbdjensvdhsjssj is the night I just wanted u I was just wanted u was the day I was a good customer service and customer customer care about you haha haha is is a good customer ',1,'2020-03-19 09:58:22.151762',18),(5,'Uuuuuuuiiiiiiiii','Okay editorshbbbhhbhbubhvhhhbhbvhbbhggjjjvvbh','week untilweek until gains I’ll off tooff to loved investloved invest in bd SC hhh India dh OK OKOK OK CD ef tu oktu oke esse hoesse ho I’m dd red as cch I’m Mx sect uh ima h ndd dB um hvum hv SC hmmm km HD am','3636669666966','ok','tag back idk d still Atlantic TBH gnomonTBH gnomonvvjkvfjbh',1,'2020-03-19 10:18:48.670493',18),(6,'Asfdsfsdfdsfdsfd','Addssfsomethings','sdfsdfsdfsdfsdfsdfsdfsdiufhsdioufyudisfyuisdifusdiufisudfiusdfiusdiufsdiufiusdfiusduifsdiufiusdfiusd','sdfsdfsdfsdfs','sdlfsdfidsfiosdoifoisdoifdsdoi','sdofuydisfoisdo',0,'2020-03-19 10:33:15.048514',14),(7,'Test','Test','1234 Hahahaha ','87545818','Boston ','02215',1,'2020-03-20 14:06:40.152610',22),(8,'Gssggsdggsgssggd','Hshshshdrhehhddh','hehehehdhdhddhdhehh','4554545445454','shhddhdhhdeheheh','gedghshdhdrhdhd',0,'2020-03-21 02:36:53.191767',2),(9,'Gags','Gags','shhsh','575778845454','hahaha','hahaha',0,'2020-03-21 03:33:23.485925',2),(10,'3saddasdasdasdsa','Adasdasdsadasdsa','sdfdsfdsfds fsdfsdfsdfdsfdsfdsfdsfdsfdsfdsfdsfsdfdsfsdfdsfsdfsdfsdfsdfdsfsdfsdfdsfdsddfsdfdsfdsfdsfd','3242342343242','sdfdsfdsfdsfsdfdsfdsfdsfsdfsdf','xvxccvcxvxvcxvx',0,'2020-03-21 15:24:04.582199',3),(11,'Amankumarsharma','Testuserdatahai','killing district una himacha Pradeep pin code 12344 has hai its ok fine grate data it has bye3444 nh','12885548635','una dicnjdbfhhffff122222222222','sdfsdfdsfdsfsdf',0,'2020-03-21 15:39:14.628491',3),(12,'Rewear','Dddd','sdfsdfdsfdsfsdfsd','vdssdfsdfsdfd','sdfsdfdsfdsfsdfsd','sdfsdfdsfdsfsdfsd',0,'2020-03-22 04:48:44.742967',14),(13,'Svvevveev','We’ve','bsbebeb','8448844848','s even','sbbevebshe',0,'2020-03-22 05:58:45.090718',3),(14,'Retretetreterte','Cxvcvcvcvcvcvcv','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','4534453453453','ccccccccccccccccccccccccc','234234234233423',0,'2020-03-22 11:57:34.009767',3),(15,'Tryout','Ytrytrytr','erythropoietin','44555455','dog','err',1,'2020-03-23 09:00:31.362150',14),(16,'Mama','Wee','sdfdsfdsfdsfsdfdsfdsfdsfsdfsdfds','2342342342343','wefsdfsdf','sdfsdfdsfdsfsdfsd',0,'2020-03-24 14:27:13.174965',3),(17,'123123','We’re','asdasdad','saasdasda','asdasdad','asdasdasdas',1,'2020-03-28 05:57:30.465987',25),(18,'234234','23424','23432424','234242323424','242342342','242424',0,'2020-03-29 10:35:42.743528',3),(19,'Ewe we','Qwewqwe','qwewqewqe','556855533','qeqwwewqe','asdasdad',1,'2020-03-30 06:29:05.207971',32),(20,'Johnbshdshdhsdg','Userjsddhsjbdjs','aisdtasudtasuydtasuydtasuydtasuydtasuydtuaystdausyduastuasuy','5555555585485','asdtuyadtuadtuaystduaasda','1231dwddsadasda',1,'2020-04-02 09:12:40.443253',36),(21,'Sam','Costich','5887 bent brook ct','7163616005','East Amherst ','14051',1,'2020-04-03 01:14:46.840287',37),(22,'Were we','Werwerw','sdfsdfdsfdsfsdfsd','34234234234','sdfdsfds','sdfdsfdsfdsfsdfdsfdsfdsfsdfsdfds',0,'2020-04-06 11:50:15.398877',3),(23,'Qweqweqweq','Qweqweqweq','we’re','r3454353445','qweqweqweqwe','qwrwqrqwrqwrqwr',1,'2020-04-09 11:37:40.331473',30),(24,'Assad','XXzx','fsdfsdfsdfdsfdsfdsfdsfdsfdsfdsfdsfsdfdsfsdfdsfsdfsdfsdfsdfdsfsdfsdfdsfdsddfsdfdsfdsfdsfdds','3453535345353','sdfsdfdsfdsfsdfsd','2234fsfwfsdfsdf',0,'2020-04-24 03:02:57.769289',3),(25,'John','Smith','New York was the best year of the day I just wanted you to k','8542256255255','Chandigarh Punjab ','345gfeefhuytfyy',1,'2020-04-24 04:42:23.650157',3);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apis_subscribe`
--

DROP TABLE IF EXISTS `apis_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apis_subscribe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apis_subscribe`
--

LOCK TABLES `apis_subscribe` WRITE;
/*!40000 ALTER TABLE `apis_subscribe` DISABLE KEYS */;
INSERT INTO `apis_subscribe` VALUES (1,'a@gmail.com'),(2,'g1@gmail.com'),(3,'abc@gmail.com'),(4,'jhfjdhf@gmail.com'),(5,'diksha455sharma@gmail.com'),(6,'bac@gmail.com'),(7,'bbb@gmail.com'),(8,'jhdsfgjdg@gmail.com'),(9,'hjjh@gmail.com');
/*!40000 ALTER TABLE `apis_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appversion`
--

DROP TABLE IF EXISTS `appversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appversion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `createTime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appversion`
--

LOCK TABLES `appversion` WRITE;
/*!40000 ALTER TABLE `appversion` DISABLE KEYS */;
INSERT INTO `appversion` VALUES (1,'1.0','2020-01-01 00:00:00.000000');
/*!40000 ALTER TABLE `appversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Admin'),(1,'User');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(105,1,105),(106,1,106),(107,1,107),(108,1,108),(109,1,109),(110,1,110),(111,1,111),(112,1,112),(113,1,113),(114,1,114),(115,1,115),(116,1,116),(117,1,117),(118,1,118),(119,1,119),(120,1,120),(121,1,121),(122,1,122),(123,1,123),(124,1,124),(125,1,125),(126,1,126),(127,1,127),(128,1,128),(129,1,129),(130,1,130),(131,1,131),(132,1,132),(133,1,133),(134,1,134),(135,1,135),(136,1,136),(137,1,137),(138,1,138),(139,1,139),(140,1,140),(141,1,141),(142,1,142),(143,1,143),(144,1,144),(145,1,145),(146,1,146),(147,1,147),(148,1,148),(149,2,1),(150,2,2),(151,2,3),(152,2,4),(153,2,5),(154,2,6),(155,2,7),(156,2,8),(157,2,9),(158,2,10),(159,2,11),(160,2,12),(161,2,13),(162,2,14),(163,2,15),(164,2,16),(165,2,17),(166,2,18),(167,2,19),(168,2,20),(169,2,21),(170,2,22),(171,2,23),(172,2,24),(173,2,25),(174,2,26),(175,2,27),(176,2,28),(177,2,29),(178,2,30),(179,2,31),(180,2,32),(181,2,33),(182,2,34),(183,2,35),(184,2,36),(185,2,37),(186,2,38),(187,2,39),(188,2,40),(189,2,41),(190,2,42),(191,2,43),(192,2,44),(193,2,45),(194,2,46),(195,2,47),(196,2,48),(197,2,49),(198,2,50),(199,2,51),(200,2,52),(201,2,53),(202,2,54),(203,2,55),(204,2,56),(205,2,57),(206,2,58),(207,2,59),(208,2,60),(209,2,61),(210,2,62),(211,2,63),(212,2,64),(213,2,65),(214,2,66),(215,2,67),(216,2,68),(217,2,69),(218,2,70),(219,2,71),(220,2,72),(221,2,73),(222,2,74),(223,2,75),(224,2,76),(225,2,77),(226,2,78),(227,2,79),(228,2,80),(229,2,81),(230,2,82),(231,2,83),(232,2,84),(233,2,85),(234,2,86),(235,2,87),(236,2,88),(237,2,89),(238,2,90),(239,2,91),(240,2,92),(241,2,93),(242,2,94),(243,2,95),(244,2,96),(245,2,97),(246,2,98),(247,2,99),(248,2,100),(249,2,101),(250,2,102),(251,2,103),(252,2,104),(253,2,105),(254,2,106),(255,2,107),(256,2,108),(257,2,109),(258,2,110),(259,2,111),(260,2,112),(261,2,113),(262,2,114),(263,2,115),(264,2,116),(265,2,117),(266,2,118),(267,2,119),(268,2,120),(269,2,121),(270,2,122),(271,2,123),(272,2,124),(273,2,125),(274,2,126),(275,2,127),(276,2,128),(277,2,129),(278,2,130),(279,2,131),(280,2,132),(281,2,133),(282,2,134),(283,2,135),(284,2,136),(285,2,137),(286,2,138),(287,2,139),(288,2,140),(289,2,141),(290,2,142),(291,2,143),(292,2,144),(293,2,145),(294,2,146),(295,2,147),(296,2,148);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add auth_user',6,'add_user'),(22,'Can change auth_user',6,'change_user'),(23,'Can delete auth_user',6,'delete_user'),(24,'Can view auth_user',6,'view_user'),(25,'Can add address',7,'add_addresses'),(26,'Can change address',7,'change_addresses'),(27,'Can delete address',7,'delete_addresses'),(28,'Can view address',7,'view_addresses'),(29,'Can add appversion',8,'add_appversion'),(30,'Can change appversion',8,'change_appversion'),(31,'Can delete appversion',8,'delete_appversion'),(32,'Can view appversion',8,'view_appversion'),(33,'Can add clothstyle',9,'add_clothstyle'),(34,'Can change clothstyle',9,'change_clothstyle'),(35,'Can delete clothstyle',9,'delete_clothstyle'),(36,'Can view clothstyle',9,'view_clothstyle'),(37,'Can add colour',10,'add_colour'),(38,'Can change colour',10,'change_colour'),(39,'Can delete colour',10,'delete_colour'),(40,'Can view colour',10,'view_colour'),(41,'Can add fabric',11,'add_fabric'),(42,'Can change fabric',11,'change_fabric'),(43,'Can delete fabric',11,'delete_fabric'),(44,'Can view fabric',11,'view_fabric'),(45,'Can add pattern',12,'add_pattern'),(46,'Can change pattern',12,'change_pattern'),(47,'Can delete pattern',12,'delete_pattern'),(48,'Can view pattern',12,'view_pattern'),(49,'Can add post',13,'add_post'),(50,'Can change post',13,'change_post'),(51,'Can delete post',13,'delete_post'),(52,'Can view post',13,'view_post'),(53,'Can add reachus',14,'add_reachus'),(54,'Can change reachus',14,'change_reachus'),(55,'Can delete reachus',14,'delete_reachus'),(56,'Can view reachus',14,'view_reachus'),(57,'Can add sew',15,'add_sew'),(58,'Can change sew',15,'change_sew'),(59,'Can delete sew',15,'delete_sew'),(60,'Can view sew',15,'view_sew'),(61,'Can add shape',16,'add_shape'),(62,'Can change shape',16,'change_shape'),(63,'Can delete shape',16,'delete_shape'),(64,'Can view shape',16,'view_shape'),(65,'Can add shapecolour',17,'add_shapecolour'),(66,'Can change shapecolour',17,'change_shapecolour'),(67,'Can delete shapecolour',17,'delete_shapecolour'),(68,'Can view shapecolour',17,'view_shapecolour'),(69,'Can add size',18,'add_size'),(70,'Can change size',18,'change_size'),(71,'Can delete size',18,'delete_size'),(72,'Can view size',18,'view_size'),(73,'Can add subscribe',19,'add_subscribe'),(74,'Can change subscribe',19,'change_subscribe'),(75,'Can delete subscribe',19,'delete_subscribe'),(76,'Can view subscribe',19,'view_subscribe'),(77,'Can add verifylog',20,'add_verifylog'),(78,'Can change verifylog',20,'change_verifylog'),(79,'Can delete verifylog',20,'delete_verifylog'),(80,'Can view verifylog',20,'view_verifylog'),(81,'Can add reportpost',21,'add_reportpost'),(82,'Can change reportpost',21,'change_reportpost'),(83,'Can delete reportpost',21,'delete_reportpost'),(84,'Can view reportpost',21,'view_reportpost'),(85,'Can add relpostsize',22,'add_relpostsize'),(86,'Can change relpostsize',22,'change_relpostsize'),(87,'Can delete relpostsize',22,'delete_relpostsize'),(88,'Can view relpostsize',22,'view_relpostsize'),(89,'Can add relpostfabric',23,'add_relpostfabric'),(90,'Can change relpostfabric',23,'change_relpostfabric'),(91,'Can delete relpostfabric',23,'delete_relpostfabric'),(92,'Can view relpostfabric',23,'view_relpostfabric'),(93,'Can add postlike',24,'add_postlike'),(94,'Can change postlike',24,'change_postlike'),(95,'Can delete postlike',24,'delete_postlike'),(96,'Can view postlike',24,'view_postlike'),(97,'Can add postimage',25,'add_postimage'),(98,'Can change postimage',25,'change_postimage'),(99,'Can delete postimage',25,'delete_postimage'),(100,'Can view postimage',25,'view_postimage'),(101,'Can add postcomment',26,'add_postcomment'),(102,'Can change postcomment',26,'change_postcomment'),(103,'Can delete postcomment',26,'delete_postcomment'),(104,'Can view postcomment',26,'view_postcomment'),(105,'Can add orderdetail',27,'add_ordertrn'),(106,'Can change orderdetail',27,'change_ordertrn'),(107,'Can delete orderdetail',27,'delete_ordertrn'),(108,'Can view orderdetail',27,'view_ordertrn'),(109,'Can add orderpost',28,'add_orderpost'),(110,'Can change orderpost',28,'change_orderpost'),(111,'Can delete orderpost',28,'delete_orderpost'),(112,'Can view orderpost',28,'view_orderpost'),(113,'Can add notification',29,'add_notification'),(114,'Can change notification',29,'change_notification'),(115,'Can delete notification',29,'delete_notification'),(116,'Can view notification',29,'view_notification'),(117,'Can add message',30,'add_message'),(118,'Can change message',30,'change_message'),(119,'Can delete message',30,'delete_message'),(120,'Can view message',30,'view_message'),(121,'Can add forget password log',31,'add_forgetpasswordlog'),(122,'Can change forget password log',31,'change_forgetpasswordlog'),(123,'Can delete forget password log',31,'delete_forgetpasswordlog'),(124,'Can view forget password log',31,'view_forgetpasswordlog'),(125,'Can add follow_user',32,'add_followuser'),(126,'Can change follow_user',32,'change_followuser'),(127,'Can delete follow_user',32,'delete_followuser'),(128,'Can view follow_user',32,'view_followuser'),(129,'Can add favourite',33,'add_favourite'),(130,'Can change favourite',33,'change_favourite'),(131,'Can delete favourite',33,'delete_favourite'),(132,'Can view favourite',33,'view_favourite'),(133,'Can add contactus',34,'add_contactus'),(134,'Can change contactus',34,'change_contactus'),(135,'Can delete contactus',34,'delete_contactus'),(136,'Can view contactus',34,'view_contactus'),(137,'Can add clothstylecolour',35,'add_clothstylecolour'),(138,'Can change clothstylecolour',35,'change_clothstylecolour'),(139,'Can delete clothstylecolour',35,'delete_clothstylecolour'),(140,'Can view clothstylecolour',35,'view_clothstylecolour'),(141,'Can add cart',36,'add_cart'),(142,'Can change cart',36,'change_cart'),(143,'Can delete cart',36,'delete_cart'),(144,'Can view cart',36,'view_cart'),(145,'Can add Token',37,'add_token'),(146,'Can change Token',37,'change_token'),(147,'Can delete Token',37,'delete_token'),(148,'Can view Token',37,'view_token'),(149,'Can add relpostshape',38,'add_relpostshape'),(150,'Can change relpostshape',38,'change_relpostshape'),(151,'Can delete relpostshape',38,'delete_relpostshape'),(152,'Can view relpostshape',38,'view_relpostshape'),(153,'Can add relpostpattern',39,'add_relpostpattern'),(154,'Can change relpostpattern',39,'change_relpostpattern'),(155,'Can delete relpostpattern',39,'delete_relpostpattern'),(156,'Can view relpostpattern',39,'view_relpostpattern'),(157,'Can add relpostshapecolour',40,'add_relpostshapecolour'),(158,'Can change relpostshapecolour',40,'change_relpostshapecolour'),(159,'Can delete relpostshapecolour',40,'delete_relpostshapecolour'),(160,'Can view relpostshapecolour',40,'view_relpostshapecolour'),(161,'Can add relpostclothstylecolour',41,'add_relpostclothstylecolour'),(162,'Can change relpostclothstylecolour',41,'change_relpostclothstylecolour'),(163,'Can delete relpostclothstylecolour',41,'delete_relpostclothstylecolour'),(164,'Can view relpostclothstylecolour',41,'view_relpostclothstylecolour'),(165,'Can add relpostsew',42,'add_relpostsew'),(166,'Can change relpostsew',42,'change_relpostsew'),(167,'Can delete relpostsew',42,'delete_relpostsew'),(168,'Can view relpostsew',42,'view_relpostsew'),(169,'Can add relpostclothstyle',43,'add_relpostclothstyle'),(170,'Can change relpostclothstyle',43,'change_relpostclothstyle'),(171,'Can delete relpostclothstyle',43,'delete_relpostclothstyle'),(172,'Can view relpostclothstyle',43,'view_relpostclothstyle'),(173,'Can add clothstylecolour',44,'add_clothstylecolourimage'),(174,'Can change clothstylecolour',44,'change_clothstylecolourimage'),(175,'Can delete clothstylecolour',44,'delete_clothstylecolourimage'),(176,'Can view clothstylecolour',44,'view_clothstylecolourimage'),(177,'Can add clothstylepatterncolourimage',45,'add_clothstylepatterncolourimage'),(178,'Can change clothstylepatterncolourimage',45,'change_clothstylepatterncolourimage'),(179,'Can delete clothstylepatterncolourimage',45,'delete_clothstylepatterncolourimage'),(180,'Can view clothstylepatterncolourimage',45,'view_clothstylepatterncolourimage'),(181,'Can add fabriccolourimage',46,'add_fabriccolourimage'),(182,'Can change fabriccolourimage',46,'change_fabriccolourimage'),(183,'Can delete fabriccolourimage',46,'delete_fabriccolourimage'),(184,'Can view fabriccolourimage',46,'view_fabriccolourimage'),(185,'Can add fabriccolour',47,'add_fabriccolour'),(186,'Can change fabriccolour',47,'change_fabriccolour'),(187,'Can delete fabriccolour',47,'delete_fabriccolour'),(188,'Can view fabriccolour',47,'view_fabriccolour'),(189,'Can add duepayment',48,'add_duepayment'),(190,'Can change duepayment',48,'change_duepayment'),(191,'Can delete duepayment',48,'delete_duepayment'),(192,'Can view duepayment',48,'view_duepayment'),(193,'Can add bankdetail',49,'add_bankdetail'),(194,'Can change bankdetail',49,'change_bankdetail'),(195,'Can delete bankdetail',49,'delete_bankdetail'),(196,'Can view bankdetail',49,'view_bankdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `social_id` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `login_type` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `image` varchar(255) NOT NULL,
  `about_me` varchar(200) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `onoffnotification` int(11) NOT NULL,
  `total_follower` int(11) NOT NULL,
  `total_following` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `adminCardId` varchar(255) NOT NULL,
  `post_count` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `deviceId` varchar(255) NOT NULL,
  `deviceType` varchar(1) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `lastUpdated` datetime(6) DEFAULT NULL,
  `cartNo` int(11) NOT NULL,
  `is_pro_created` tinyint(1) NOT NULL,
  `is_email_sent` int(11) NOT NULL,
  `is_email_verified` int(11) NOT NULL,
  `has_bank_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES ('pbkdf2_sha256$180000$15bcQMmgoy8d$prnJaAC22vKqToFnpbim1Rabb88S723ywlnpfzFjumQ=','2020-03-11 12:41:18.849398',1,'admin','','','',1,1,'2020-03-11 12:41:11.554441',1,'','','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-11 12:41:11.687493','','a','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$Xzk3RwJC5l2Z$HQ8NrZYiBM9dT8md9QT6fS9GYpScufidLxj4KJumFko=',NULL,0,'101@yopmail.com','','','101@yopmail.com',0,1,'2020-03-11 12:42:42.586287',2,'','3333333333','e','mohali','Tiger Lion','M','/media/profileimages/2/E8D4D43C-747D-43D8-937D-B2014B0AA823.jpeg','design enthusiastic','cus_HTrTYAdxKmrG3L','1999-03-23',1,1,1,0,'',4,'2020-03-11 12:42:42.586397','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','kk789','2020-06-15 12:19:05.438456',0,1,-1,1,0),('pbkdf2_sha256$180000$behCEpNwLr9O$CV4yetWYPVmj51SLska0gGWaHNTsxSs+p3N9MB5s8yg=',NULL,0,'1@yopmail.com','','','1@yopmail.com',0,1,'2020-03-11 12:57:48.569352',3,'','4587877876','e','mohali','Sunny Kunar','F','/media/profileimages/3/65B63777-6E3D-4BAD-AF87-66780B0ADC8D.jpeg','design enthusiastic wdewrwerwe','cus_GtGqVOxeBrLDBS','2002-04-03',1,11,6,0,'',15,'2020-03-11 12:57:48.569441','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','kk786','2020-06-02 11:18:00.461810',0,1,-1,1,1),('pbkdf2_sha256$180000$r1I5LaTDKz6T$pDPf2PtGWToAsfUZsm6d/BNhAnX8IdH3o5uYiUO+w30=',NULL,0,'103@gmail.com','','','103@gmail.com',0,1,'2020-03-18 12:21:08.685870',6,'','3333333333','','','Onu','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-18 12:21:08.685950','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$TOmJsUGF5XuY$JZTjpo7r+xqhc3iY7W/q6MI0WioezsZZvcielJBomOQ=',NULL,0,'102@yopmail.com','','','102@yopmail.com',0,1,'2020-03-18 12:30:04.146787',10,'','3333333333','e','102 // 2','One Zero Two','M','/media/profileimages/10/050CA553-7EFD-449D-AF87-87F4C23CDBEE.jpeg','Wqeqeq','','2002-03-25',1,0,1,0,'',1,'2020-03-18 12:30:04.146875','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','102','2020-06-02 12:59:17.221475',0,1,-1,1,1),('pbkdf2_sha256$180000$d8PnbuPmUM7S$+jxmPrH/2mFgDliHZqWK2b8h9nqOS++dMXcRPhXMjAU=',NULL,0,'111@yopmail.com','','','111@yopmail.com',0,1,'2020-03-18 12:32:34.993988',13,'','3333333333','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-18 12:32:34.994072','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$DWzX4x4eeMNM$fu0DYu2ATMA6ZNjz0xmnragHsHmxObZXInqDDZsuaFs=',NULL,0,'110@yopmail.com','','','110@yopmail.com',0,1,'2020-03-18 12:37:58.738868',14,'','3333333333','e','handigarh','Neha Jain1','M','/media/profileimages/14/6BF60798-238B-4594-A655-FB81A43462FE.jpeg','Phython developer','cus_GxhYQpyW4PZwHd','2000-03-19',1,6,4,0,'',6,'2020-03-18 12:37:58.738952','cGQCwskzzd8:APA91bHVNMBlQjxbq6L2c20OgYmH4r8kVJJXqsAVgnjAjEIN0m4dRDfZdX0x_f2Rf8nP8Cz4oct2VXGYHF-RU0XLidjgAxov9s2r_EJbOuewl5jidZ-loT0EkLCThJW98H9pjLtOtsfc','I','neha_','2020-05-01 08:41:49.663149',1,1,-1,1,0),('pbkdf2_sha256$180000$Pi51SD0Qqrs6$QD5NT9tL+bp1xrniW6jSg5NotKJc6YC/uKW+iKUUmeY=',NULL,0,'1001@yopmail.com','','','1001@yopmail.com',0,1,'2020-03-19 02:59:13.063133',15,'','3333333333','e','mohali','One kk','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','design enthusiastic','cus_HTr7JWdtZnvVdL','2019-09-08',1,0,2,0,'',0,'2020-03-19 02:59:13.063215','111','a','abc_123','2020-03-19 03:03:47.728100',0,1,-1,1,1),('pbkdf2_sha256$180000$QGuvWFNSzTQg$ahfHNXU5VAAk+B1xZLiLEwHL3/q1hWnTIU39LrAaCog=',NULL,0,'1002@yopmail.com','','','1002@yopmail.com',0,1,'2020-03-19 04:40:24.848212',16,'','3333333333','e','mohali','One kk','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','design enthusiastic','','2019-09-08',1,1,2,0,'',1,'2020-03-19 04:40:24.848294','111','a','abc123','2020-03-19 04:48:40.267881',0,1,-1,1,0),('pbkdf2_sha256$180000$U6opmd4Y2eYT$6wkgS97kxt2gAhzkvGzUvABv3SBn5zTn82ZS/RPWBl8=',NULL,0,'1003@yopmail.com','','','1003@yopmail.com',0,1,'2020-03-19 09:14:56.663183',17,'','3333333333','e','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','cus_HTrNXqmllraHrG',NULL,1,0,1,0,'',0,'2020-03-19 09:14:56.663273','2222','a','','2020-03-19 09:16:34.824996',0,0,-1,1,0),('pbkdf2_sha256$180000$FZHWAiPZUCWy$NyArZd3v+Bai8KiP1x7Y4J0xlUlHaCWNJc5HfssvBgM=',NULL,0,'aj@yopmail.com','','','aj@yopmail.com',0,1,'2020-03-19 09:31:44.991894',18,'','123456789','e','okkkkkkk was the night you were coming home today I just got home from the service customer and I just got to the house I I am ttttttt was a great night and a good day I I just wanted to let u was the night I I am so excited to go get my coffee I ','JayOnu','M','/media/profileimages/18/D1403892-F2C7-462A-A531-FE2A6D15BCAC.jpeg','Playing this is is the best game ever but it is a good app to get the free app and a good customer service from a customer service provider customer customer and customer customer care about the      ','cus_HTrRil3uzfzRb5','1993-03-19',1,5,1,0,'',1,'2020-03-19 09:31:44.991982','123','I','ai','2020-03-19 09:35:14.362738',0,1,-1,1,0),('pbkdf2_sha256$180000$HmlTyVwwjP7m$BNezIXOjT3pHPcd1gP2MDJBVSHXUz6fp4wwKMOGW4Oc=',NULL,0,'201@yopmail.com','','','201@yopmail.com',0,1,'2020-03-19 10:44:37.635742',19,'','3333333333','','','Onu','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-19 10:44:37.635825','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$6YkitSdSJJuz$tvlIxT81GVd7iAa0uXhrXgdjm2WVdj8VwO3/KrsXqaw=',NULL,0,'202@yopmail.com','','','202@yopmail.com',0,1,'2020-03-19 10:45:37.702641',20,'','3333333333','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-19 10:45:37.702726','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$E75ucK2a1DmL$Ek+5l7qva4SbCVlY4zt9tG+p+XYhTIj6gxAWWkrEO2g=',NULL,0,'2011@yopmail.com','','','2011@yopmail.com',0,1,'2020-03-19 11:11:30.768875',21,'','3333333333','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-19 11:11:30.768959','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$Bkrwsai5XpXJ$3i+5XyEDLvEybG7+R0KoATh3FkBQzkCy8jY1VhK7pHE=',NULL,0,'ssc5887@gmail.com','','','ssc5887@gmail.com',0,1,'2020-03-20 14:01:36.818835',22,'','7163616005','e','ssc5887@gmail.com','Test Test','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','Test','cus_HTr2tLIFgw0Fmg','1998-07-11',1,2,1,0,'',3,'2020-03-20 14:01:36.818922','123','I','ssc','2020-03-20 14:02:09.034630',0,1,-1,1,1),('pbkdf2_sha256$180000$uv6gAQNX40Hb$jvT0sFG8hftfEnTAWWfM63wmdBCJKOK2eyAb7wAuByU=',NULL,0,'jain@gmail.com','','','jain@gmail.com',0,1,'2020-03-23 04:00:05.761315',23,'','3333333333','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-23 04:00:05.761413','111','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$KNB4bIvNtGOf$MGSiNifkTMWL3gOO2yigzmwMm5EDJkX/BXQ/7k9Nmpw=',NULL,0,'103@yopmail.com','','','103@yopmail.com',0,1,'2020-03-27 12:06:47.103814',24,'','','e','103 second floor','One Zero Three','M','/media/profileimages/24/DE15F49E-E3D9-4B67-B08C-0D3DD1393D27.jpeg','Adsasdasdasd','','2002-03-24',1,0,0,0,'',0,'2020-03-27 12:06:47.103903','eZH3xsn2Q9s:APA91bHXMw9ooK2p5qk5FlSMWe6IUmrE8fG944NZypD-jde5r6tMA2Hrv1F6oT7st57Dwi-zka2EnmZ_ZWXWjl1u4jVt1c_uODXfSDbwdduHsTtE9McmXHOL_aawzjOmpMXUqwGpTZnD','I','103','2020-04-26 05:45:39.667852',1,1,-1,1,0),('pbkdf2_sha256$180000$54JeCU35AtxF$kFxg/zkh2o9nf+mgA+C6pIrF4F9pJXlUEM484qTqmDo=',NULL,0,'104@yopmail.com','','','104@yopmail.com',0,1,'2020-03-27 12:08:28.936549',25,'','','e','105 / 2','One Zero Five','M','/media/profileimages/25/E2EBB845-95A1-4099-8332-9F48F8B8ADB2.jpeg','Asdasdad','cus_GzWj0BOMAOG1eY','2002-03-27',1,0,0,0,'',2,'2020-03-27 12:08:28.936659','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','105','2020-06-02 12:35:18.349430',0,1,-1,1,1),('pbkdf2_sha256$180000$CQyOC264gahf$KKqKdCXZeua/NTQXRf5TMPjf0sXOZ/6nxvfEWFNMneQ=',NULL,0,'105@yopmail.com','','','105@yopmail.com',0,1,'2020-03-27 12:09:02.529628',26,'','','e','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','cus_HTrM7VOpBcITmQ',NULL,1,0,0,0,'',0,'2020-03-27 12:09:02.529714','f-bG7lWgV3Q:APA91bEVxvOhsyYH3wgTFdriHEVLEztD6BzVTI3Mx1OxPodUVyHYtC55wjg5erRTinVsO2yn9jr3R76wRMKcpTkp6gwinarrdjCGIxo7K2GQ3TlMQEE8XSmCzjX2LRf7UqG_G336iCcS','I','','2020-06-02 10:49:22.086263',0,0,-1,1,0),('pbkdf2_sha256$180000$AyNOEb0xLJkr$GrqnfGIDnTjP5uD3G2aQfrOF4gu7hKRe5/Qbd2IEIgM=',NULL,0,'106@yopmail.com','','','106@yopmail.com',0,1,'2020-03-27 12:09:44.814390',27,'','','e','106','One Zeo Sux','M','/media/profileimages/27/92FF5A64-DDFC-4435-8D79-94B8119AD163.jpeg','Udududif','','2002-03-27',1,0,3,0,'',2,'2020-03-27 12:09:44.814501','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','106','2020-06-02 12:42:31.791731',1,1,-1,1,1),('pbkdf2_sha256$180000$mDn2VHjFPRVa$1ZT+el9cRLeQH35SHe7vqHRhNokiM7IPygbZMVgGelM=',NULL,0,'107@yopmail.com','','','107@yopmail.com',0,1,'2020-03-27 12:10:24.014701',28,'','','e','107','One Zero Seven','M','/media/profileimages/28/84E0F23C-98C5-4B5C-A930-C9EE98BC40B5.jpeg','Asdadadas','','2002-03-27',1,0,0,0,'',1,'2020-03-27 12:10:24.014792','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','107','2020-06-02 12:43:32.553456',0,1,-1,1,1),('pbkdf2_sha256$180000$ZQCfPLE6QZ5C$llJScIOGKepRNN1XecAj8cXlw0tZU9K+tCOA4cMIqdg=',NULL,0,'108@yopmail.com','','','108@yopmail.com',0,1,'2020-03-27 12:10:55.800443',29,'','','e','108/2hhzbzbzhz','One Zero Eight','F','/media/profileimages/29/D0B8E06A-89D4-43BA-A6D4-B7D17C8D02A2.jpeg','Qweqeqeqwe','cus_HTrGEbPLcvKQKZ','2002-03-27',1,0,2,0,'',10,'2020-03-27 12:10:55.800525','cR36GHFW9EY:APA91bHoDlk0qt5vGSVoAAhVP-w3zmOilOnIKwWV2eNNDOJePemsQzRtVyxncc0XeYm3ntuyaGR7b36qn0fgtx73qpkxW99bHoU6SfrX94PuOYgaNCPcdT6MKtIvoxL1o771gWEvo6R9','I','108','2020-06-03 01:43:22.804662',0,1,-1,1,1),('pbkdf2_sha256$180000$blZxKqeCc7uB$Yyre6c9T17cEL8L3/K2JsX7SIes/H2aR8oYO5vFTcBw=',NULL,0,'109@yopmail.com','','','109@yopmail.com',0,1,'2020-03-27 12:11:24.993805',30,'','','e','109','One Zero Nine','M','/media/profileimages/30/4B8AFB5E-8B73-4A1F-9363-3A774CECDCD1.jpeg','Qweqweqwe','cus_H46vzHBytAZkcE','2002-03-25',1,1,1,0,'',2,'2020-03-27 12:11:24.993893','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','109','2020-06-02 12:46:35.441103',0,1,-1,1,1),('pbkdf2_sha256$180000$pT4V42otkOwU$/d24HXxOFWm2Bm4wxnU1OMdunkOU7bZ6NeFCtqjJJdo=',NULL,0,'abc@yopmail.com','','','abc@yopmail.com',0,1,'2020-03-27 12:15:06.141035',31,'','','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-27 12:15:06.141121','No Token','I','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$dgbevzKbMbJb$Y/HAt3j1IB8MFdtkWH/fjRLp/TRMK55YfWDuhKJ8CIE=',NULL,0,'112@yopmail.com','','','112@yopmail.com',0,1,'2020-03-29 09:12:25.952489',32,'','','e','Gege','Sgsgg Shag','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','Hshshshdrhehhddhh','cus_H0JjvVwrPHGLJH','2002-03-26',1,0,0,0,'',1,'2020-03-29 09:12:25.952582','dOTFNzs396k:APA91bH4fk8mVKKbqPwAh-4ZGZ4Py_mM2NktPlpwBHg53vaDZpB0Mq4LGz__evpI6mh7ymWzDkjcC04-9CWP3OVpakCPbxoVDFhwsQy4Tm2k3gdtseOSmAQag4-IzI52_ZVznj8twMkj','I','gssgsggw','2020-06-02 12:56:35.795778',1,1,-1,1,1),('pbkdf2_sha256$180000$Bp1ONRTVP5N4$HFQO5iWRPhCoPNbfACBljOr/YtLSg2a1tTeSPwYVuUs=',NULL,0,'abcd@yopmail.com','','','abcd@yopmail.com',0,1,'2020-03-30 06:25:37.708370',33,'','','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-03-30 06:25:37.708456','No Token','I','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$gD9QCR9fp8kJ$PblZsdEdKU5weXUhLTka/dJSyHQnl9hpa31tYGS127Q=',NULL,0,'ab@yopmail.com','','','ab@yopmail.com',0,1,'2020-03-30 06:27:08.069802',34,'','','e','chhhj','Test User','M','/media/profileimages/34/7363314D-AB4C-42A3-BFFD-08CB2A9F87BE.jpeg','Can','cus_H0HhDEXcug0V1x','2002-03-30',1,2,2,0,'',0,'2020-03-30 06:27:08.069899','cpQZ8yvKCwQ:APA91bGsQU5oHISxXEH5kiY1T1UQ85ZgmEL5pxNYAB4058tdQNItzinnzc9JJvCkquXWGOZv-v9H8ejXRkhk2XyKu4pFn_x0bbfvSKL3fSvCz9Uy_3qXy-HFuA7CB462K1_PlIEbPBBA','I','an','2020-03-30 06:27:54.450142',0,1,-1,1,0),('pbkdf2_sha256$180000$ZgftLCwPUZLL$VW+I8pjn/TmNd7WYMvYOAjp/9bgj3erFR+S7SZ4z6L0=',NULL,0,'120@yopmail.com','','','120@yopmail.com',0,1,'2020-03-31 02:45:31.618471',35,'','','e','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,1,0,'',0,'2020-03-31 02:45:31.618554','No Token','I','','2020-03-31 02:46:25.989598',0,0,-1,1,0),('pbkdf2_sha256$180000$LVgDQ30oM00W$LE42GHwQ1UBtcmcm2uMalKmdhVf/fYJoTl6vgW7uwzk=',NULL,0,'Sam@yopmail.com','','','Sam@yopmail.com',0,1,'2020-04-02 09:03:05.968539',36,'','','e','cannada','Sam Smith','F','/media/profileimages/36/FD081109-378F-494D-B4A4-B85395FAB29B.jpeg','Hi its all about me ','cus_H1S07C5VNHG9BB','2000-04-02',1,1,1,0,'',3,'2020-04-02 09:03:05.968622','cKAPC_SaD6E:APA91bHrT1_yurYR0OY5Ysr_HQGJR9J9K9iOHWfpOdY9j6Do3JPH79eq46IBrEg75kSSmOBAyEuIOcUQqsSbHudzWVxuXvwV-sbWGIpxOcjrJ6_cmjuFExVEmApNBXcSEL9Yu6QEj4hW','I','Sam','2020-04-02 09:04:32.723688',1,1,-1,1,0),('pbkdf2_sha256$180000$7tx3DuBH2KWw$5s0RyHvCbLauBuwzPRNg2d0AhBGFEyXa6/y4waNEINg=',NULL,0,'scostich@bu.edu','','','scostich@bu.edu',0,1,'2020-04-03 01:07:27.637056',37,'','7163616005','e','5887 bent brook ct','Sam Costich','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','Test','cus_HTqxkczaeWcX7u','2002-04-02',1,1,1,0,'',8,'2020-04-03 01:07:27.637140','cuPEyI0QN9c:APA91bFMbB2zMRoSNCVjLRsOXYFveFza9OaSsWf7PrKzGZj6IGkuE3Q3LhTPva6z3jiboiv-9J7FvvR42ASnTMQ8ganxOu4F0Q5nlg9NxIcLrt4eVbC-FTDbfq0zklBZG0bxpo4VWsLo','I','Sam_Costich','2020-04-03 01:08:01.444403',0,1,-1,1,1),('pbkdf2_sha256$180000$32H9Qoo2NGv2$XzzSePVP70BkWZbUTAmgGC0TQWZMkAoqrPdHReG85MQ=',NULL,0,'2@yopmail.com','','','2@yopmail.com',0,1,'2020-04-03 10:19:51.952415',38,'','7676545678','','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','',NULL,1,0,0,0,'',0,'2020-04-03 10:19:51.952500','003','i','',NULL,0,0,-1,-1,0),('pbkdf2_sha256$180000$7MWE77RPs1nN$mLdDJB/h9B94J+4KAhdVemamHxBKNEkq4w0N7ahA2Qs=',NULL,0,'07@yopmail.com','','','07@yopmail.com',0,1,'2020-04-06 10:19:31.083318',39,'','3333333333','e','','ram','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','','cus_HTqrqrnPUr01Kh',NULL,1,0,0,0,'',0,'2020-04-06 10:19:31.083404','111','i','','2020-04-07 05:13:03.686036',0,0,-1,1,0),('pbkdf2_sha256$180000$2pbSBMpk2IOm$UbFB0/yheCQ3TVRu4I8Xo57uifOKy/7W11MnxvdXhi0=',NULL,0,'115@yopmail.com','','','115@yopmail.com',0,1,'2020-04-07 11:23:41.616189',40,'','','e','edgy','Whitewater ','M','/media/profileimages/40/16512701-5E7A-40A0-91DA-C970AB5C3E8B.jpeg','Hi there is rdfrf3wrfwefewfewfewefhwq9uhfeuwhq89feewq897f98qwyfe89fyew98yf98eqwyef98qweyef9qwy98fyqw98fy89weqyf98weqyf98weqyf98wqy9f8weqyf98wqfyeqw9yf98eqwyf98qwyf98eqwy98fwqey98fyqwe98fyqwe98fywq98fy','','2000-04-07',1,0,0,0,'',0,'2020-04-07 11:23:41.616285','cKAPC_SaD6E:APA91bHrT1_yurYR0OY5Ysr_HQGJR9J9K9iOHWfpOdY9j6Do3JPH79eq46IBrEg75kSSmOBAyEuIOcUQqsSbHudzWVxuXvwV-sbWGIpxOcjrJ6_cmjuFExVEmApNBXcSEL9Yu6QEj4hW','I','edgy','2020-04-07 11:27:08.513755',0,1,-1,1,0),('pbkdf2_sha256$180000$j6phE83gozIn$lfAoWBJxnh2O6i/pzfsDskPbSnyJD4VGx+9q8SKIISE=',NULL,0,'116@yopmil.com','','','116@yopmil.com',0,1,'2020-04-07 11:35:47.201044',41,'','','e','qweqweqweqwe','One One Six ','F','/media/profileimages/41/48EB7127-2F04-40F9-A58F-CE3780C77A17.jpeg','Qweqweqeqwehbvqwyegqy8gey7tqgeytqwgeyqwgweiuqwgeuyqgiueg	Quechua	Gruyter	qgweuiy	qgeuyqwuyegweuoygquwyegyoqoyouqgoyq','','2000-04-07',1,0,0,0,'',0,'2020-04-07 11:35:47.201128','cKAPC_SaD6E:APA91bHrT1_yurYR0OY5Ysr_HQGJR9J9K9iOHWfpOdY9j6Do3JPH79eq46IBrEg75kSSmOBAyEuIOcUQqsSbHudzWVxuXvwV-sbWGIpxOcjrJ6_cmjuFExVEmApNBXcSEL9Yu6QEj4hW','I','Abraham','2020-04-07 11:45:58.611865',0,1,-1,1,0),('pbkdf2_sha256$180000$IJ8MyZgM8zdb$ikMxXB8ay1xZxVJJtRkkfbNEb+wf0lzuljDvLNjP4rg=',NULL,0,'116@yopmail.com','','','116@yopmail.com',0,1,'2020-04-07 11:50:50.631394',42,'','','e','California ','John Cent ','F','/media/profileimages/42/4C9F6549-008A-4CBD-A5C4-98FBD8B5B69A.jpeg','32423423','','2002-04-07',1,0,1,0,'',0,'2020-04-07 11:50:50.631479','cKAPC_SaD6E:APA91bHrT1_yurYR0OY5Ysr_HQGJR9J9K9iOHWfpOdY9j6Do3JPH79eq46IBrEg75kSSmOBAyEuIOcUQqsSbHudzWVxuXvwV-sbWGIpxOcjrJ6_cmjuFExVEmApNBXcSEL9Yu6QEj4hW','I','John Ema','2020-04-07 11:51:21.153087',0,1,-1,1,0),('pbkdf2_sha256$180000$OWiXKEt7lOMz$4AfGXZoEScaPPjTUAzo1dUvd6gLbDIwf5u3YES1+iGA=',NULL,0,'admin@admin.com','Sam','','admin@admin.com',0,1,'2020-04-13 04:45:59.511744',43,'','','','','ram','M','/media/userimage/43/blob_CM3Y7ml','','',NULL,1,0,0,2,'',0,'2020-04-13 04:45:59.632414','1234567','a','','2020-06-04 03:58:20.029445',0,0,-1,-1,0),('pbkdf2_sha256$180000$ZDbLXQTQr4Xi$CX9ar0jdDkSbi6fsk1DdAgFWyGvl4vCAwKL9Z5M6gTk=',NULL,0,'0@yopmail.com','','','0@yopmail.com',0,1,'2020-04-13 05:47:51.090565',44,'','','e','London ','Bread Shah ','M','/media/profileimages/44/ED3937CF-7260-4906-9DBB-08FA4B96511A.jpeg','Hi there I got a wuhiuwhiuwheiuhiuewhfiuhweuifhweiufhweuihfweiuhfweuihfiuewhfu9wehfuwehf9u8wucbweiufbiuwebfiuwebfiuwebfiuwebfiuwebfiuwebfuwbfiuwebfiuwbuifwbeuifbweiufbweiufbweifbwieufbuweifbweiubfw','','1998-04-13',1,1,1,0,'',0,'2020-04-13 05:47:51.090659','cKAPC_SaD6E:APA91bHrT1_yurYR0OY5Ysr_HQGJR9J9K9iOHWfpOdY9j6Do3JPH79eq46IBrEg75kSSmOBAyEuIOcUQqsSbHudzWVxuXvwV-sbWGIpxOcjrJ6_cmjuFExVEmApNBXcSEL9Yu6QEj4hW','I','Bradshaw','2020-04-13 05:48:19.754087',1,1,-1,1,0),('pbkdf2_sha256$180000$EK1i4QomUCOh$Z+6+3kzuNnsHb/HCdcrma3DagOF4NWFR15QOc6zva44=',NULL,0,'admin@admin1.com','firstname','','admin@admin1.com',0,1,'2020-04-22 05:36:45.588146',45,'','','','','ram','M','/media/userimage/45/blob_TV7RSrC','','',NULL,1,0,0,2,'',0,'2020-04-22 05:36:45.709886','123','a','','2020-06-03 05:35:39.362506',0,0,-1,-1,0),('pbkdf2_sha256$180000$g6LDl96phNiy$ZRXOSCz5eHgeL5tx8rWn2mIwgzV+Bb2d0XkD9NrSamY=',NULL,0,'17841428948866332','','','',0,1,'2020-04-24 04:57:04.406632',49,'17841428948866332','','i','','ram','M','','','',NULL,1,0,0,0,'',0,'2020-04-24 04:57:04.406722','123','I','',NULL,0,0,-1,-1,0);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1),(2,3,1),(5,6,1),(9,10,1),(10,13,1),(11,14,1),(12,15,1),(13,16,1),(14,17,1),(15,18,1),(16,19,1),(17,20,1),(18,21,1),(19,22,1),(20,23,1),(21,24,1),(22,25,1),(23,26,1),(24,27,1),(25,28,1),(26,29,1),(27,30,1),(28,31,1),(29,32,1),(30,33,1),(31,34,1),(32,35,1),(33,36,1),(34,37,1),(35,38,1),(36,39,1),(37,40,1),(38,41,1),(39,42,1),(40,43,2),(41,44,1),(42,45,2),(43,49,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('0bcf158aae11135bdcdf5f7be25d2a96e30eb76f','2020-04-03 01:08:01.447475',37),('1a433a3af6318dcc949864f317bfc816cb06e9de','2020-03-20 14:02:09.037572',22),('35504e65c027e7eed0096500811c77e7eb634458','2020-06-03 05:35:39.495006',45),('390603fff43882e1acef399e89ed56027873ab75','2020-03-19 03:03:47.733041',15),('4980ae017ecfaf4cd63f3708bfbec7eb83688940','2020-06-02 10:49:22.091294',26),('500abd9831224abdf93c28e53260ad7f05fa2fa5','2020-03-19 09:16:34.828459',17),('51e926afc3a879b487389ded313a8dfe62515265','2020-03-19 09:35:14.365847',18),('6aee817b14bdea08a7d8a267833aadfd41c07f45','2020-06-15 12:19:05.441575',2),('7d67031a95d623c799e5f23c20a01b039031f9f2','2020-06-04 03:58:20.159665',43),('9210ce4a37f26dc172026a4406b20b78e6f46259','2020-04-24 04:57:04.412762',49),('b773f60db364dc0ad8870d5300caeeca2d5dc80e','2020-06-03 01:43:22.807816',29),('d432751059f6d1601b593bbc07295bd234e99257','2020-03-31 02:46:25.992496',35),('d83a48949e340887a9c14e65d089e76a483ef03f','2020-04-07 05:13:03.689920',39),('f2f5fb83d816c0d37ed9c7ca06e36f6948a000db','2020-03-19 04:48:40.274945',16);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankdetail`
--

DROP TABLE IF EXISTS `bankdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Account_name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `routing_number` varchar(255) NOT NULL,
  `acc_number` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bankdetail_user_id_1c7cc1ea_fk_auth_user_id` (`user_id`),
  CONSTRAINT `bankdetail_user_id_1c7cc1ea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdetail`
--

LOCK TABLES `bankdetail` WRITE;
/*!40000 ALTER TABLE `bankdetail` DISABLE KEYS */;
INSERT INTO `bankdetail` VALUES (1,'rrrrrrr','individual','123456789','5675678909876',37),(2,'Sunny Sha','company','110000000','000123456789',3),(3,'Assad','company','110000000','000123456789',27),(4,'rrrrrrr','individual','123456789','5675678909876',15),(5,'ikka','company','110000000','000123456789',30),(6,'rrrrrrr','individual','123456789','5675678909876',22),(7,'123','company','110000000','000123456789',25),(8,'add daddy’s','company','asdadasds','45555555552585',28),(9,'Aman ','Company','123123123','1155585588',32),(10,'ikkkka','Company','122555555','5555556655',10),(11,'cggg can','Company','282828','9866835533535',29);
/*!40000 ALTER TABLE `bankdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(9,2) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `post_images_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_post_id_19b29034_fk_post_id` (`post_id`),
  KEY `cart_post_images_id_d0513860_fk_postimage_id` (`post_images_id`),
  KEY `cart_size_id_e226c4c8_fk_size_id` (`size_id`),
  KEY `cart_user_id_1361a739_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cart_post_id_19b29034_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `cart_post_images_id_d0513860_fk_postimage_id` FOREIGN KEY (`post_images_id`) REFERENCES `postimage` (`id`),
  CONSTRAINT `cart_size_id_e226c4c8_fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (213,1200.00,'2020-04-05 12:15:32.016196',15,20,1,36),(252,56.00,'2020-04-09 05:42:53.417803',34,40,3,27),(285,12.00,'2020-04-09 12:04:40.371164',27,33,3,32),(316,56.77,'2020-04-14 04:15:57.982627',35,41,2,44),(372,56.00,'2020-04-26 08:16:57.129321',34,40,1,24),(384,444.00,'2020-05-01 06:57:03.928367',49,59,1,14);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothstyle`
--

DROP TABLE IF EXISTS `clothstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothstyle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `style_name` varchar(59) NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothstyle`
--

LOCK TABLES `clothstyle` WRITE;
/*!40000 ALTER TABLE `clothstyle` DISABLE KEYS */;
INSERT INTO `clothstyle` VALUES (1,'Typee1',18.89,1),(2,'Typee2',15.45,1),(3,'Typee3',20.15,1);
/*!40000 ALTER TABLE `clothstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothstylecolour`
--

DROP TABLE IF EXISTS `clothstylecolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothstylecolour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `colour` varchar(59) NOT NULL,
  `colour_code` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `cloth_style_id` bigint(20) DEFAULT NULL,
  `front_image` varchar(255) NOT NULL,
  `back_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clothstylecolour_cloth_style_id_18504098_fk_clothstyle_id` (`cloth_style_id`),
  CONSTRAINT `clothstylecolour_cloth_style_id_18504098_fk_clothstyle_id` FOREIGN KEY (`cloth_style_id`) REFERENCES `clothstyle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothstylecolour`
--

LOCK TABLES `clothstylecolour` WRITE;
/*!40000 ALTER TABLE `clothstylecolour` DISABLE KEYS */;
INSERT INTO `clothstylecolour` VALUES (1,'red','FF0000',1,1,'/media/clothstylecolourimages/43/red_tshirtnew11.png','/media/clothstylecolourimages/43/blueTshirt.jpeg'),(2,'black','000000',1,1,'/media/clothstylecolourimages/43/black_tshirtnew11.png','/media/clothstylecolourimages/43/blueTshirt.jpeg'),(3,'black','000000',1,2,'/media/clothstylecolourimages/43/black_tshirtnew11.png','/media/clothstylecolourimages/43/blueTshirt.jpeg'),(5,'red','FF0000',1,2,'/media/clothstylecolourimages/43/red_tshirtnew11.png','/media/clothstylecolourimages/43/blueTshirt.jpeg'),(15,'green','333300',1,3,'/media/clothstylecolourimages/43/green_tshirtnew.png','/media/clothstylecolourimages/43/blueTshirt.jpeg'),(16,'black','000000',1,3,'/media/clothstylecolourimages/43/black_tshirtnew11.png','/media/clothstylecolourimages/43/blueTshirt.jpeg');
/*!40000 ALTER TABLE `clothstylecolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothstylecolourimage`
--

DROP TABLE IF EXISTS `clothstylecolourimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothstylecolourimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `cloth_style_id` bigint(20) DEFAULT NULL,
  `colour_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clothstylecolourimage_cloth_style_id_0bc8bd38_fk_clothstyle_id` (`cloth_style_id`),
  KEY `clothstylecolourimage_colour_id_10fb5791_fk_clothstylecolour_id` (`colour_id`),
  CONSTRAINT `clothstylecolourimage_cloth_style_id_0bc8bd38_fk_clothstyle_id` FOREIGN KEY (`cloth_style_id`) REFERENCES `clothstyle` (`id`),
  CONSTRAINT `clothstylecolourimage_colour_id_10fb5791_fk_clothstylecolour_id` FOREIGN KEY (`colour_id`) REFERENCES `clothstylecolour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothstylecolourimage`
--

LOCK TABLES `clothstylecolourimage` WRITE;
/*!40000 ALTER TABLE `clothstylecolourimage` DISABLE KEYS */;
INSERT INTO `clothstylecolourimage` VALUES (1,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg',1,1),(2,1,'/media/clothstylecolourimages/43/greent.jpeg',1,2),(3,1,'/media/clothstylecolourimages/43/blackTshirt.jpeg',2,3),(5,1,'/media/clothstylecolourimages/43/redTshirt.jpeg',2,5);
/*!40000 ALTER TABLE `clothstylecolourimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothstylepatterncolourimage`
--

DROP TABLE IF EXISTS `clothstylepatterncolourimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothstylepatterncolourimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `cloth_style_id` bigint(20) DEFAULT NULL,
  `colour_id` bigint(20) DEFAULT NULL,
  `pattern_id` bigint(20) DEFAULT NULL,
  `back_image` varchar(255) DEFAULT NULL,
  `front_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `clothstylepatterncol_cloth_style_id_ba398575_fk_clothstyl` (`cloth_style_id`),
  KEY `clothstylepatterncol_colour_id_c4061856_fk_clothstyl` (`colour_id`),
  KEY `clothstylepatterncolourimage_pattern_id_a6faeb1d_fk_pattern_id` (`pattern_id`),
  CONSTRAINT `clothstylepatterncol_cloth_style_id_ba398575_fk_clothstyl` FOREIGN KEY (`cloth_style_id`) REFERENCES `clothstyle` (`id`),
  CONSTRAINT `clothstylepatterncol_colour_id_c4061856_fk_clothstyl` FOREIGN KEY (`colour_id`) REFERENCES `clothstylecolour` (`id`),
  CONSTRAINT `clothstylepatterncolourimage_pattern_id_a6faeb1d_fk_pattern_id` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothstylepatterncolourimage`
--

LOCK TABLES `clothstylepatterncolourimage` WRITE;
/*!40000 ALTER TABLE `clothstylepatterncolourimage` DISABLE KEYS */;
INSERT INTO `clothstylepatterncolourimage` VALUES (50,1,1,1,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/red_tshirt_pattren1new11.png'),(51,1,1,2,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren1new11.png'),(52,1,2,3,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren1new11.png'),(54,1,2,5,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/red_tshirt_pattren1new11.png'),(55,1,3,15,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/green_tshirtnew_pattern1new.png'),(56,1,3,16,1,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren1new11.png'),(57,1,1,1,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/red_tshirt_pattren2new11.png'),(58,1,1,2,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren2new11.png'),(59,1,2,3,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren2new11.png'),(60,1,2,5,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/red_tshirt_pattren2new11.png'),(61,1,3,15,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/green_tshirt_pattern2new.png'),(62,1,3,16,2,'/media/clothstylecolourimages/43/blueTshirt.jpeg','/media/patterncolourTshirtimages/43/black_tshirt_pattren2new11.png');
/*!40000 ALTER TABLE `clothstylepatterncolourimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colour`
--

DROP TABLE IF EXISTS `colour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `colour` varchar(59) NOT NULL,
  `colour_code` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colour`
--

LOCK TABLES `colour` WRITE;
/*!40000 ALTER TABLE `colour` DISABLE KEYS */;
INSERT INTO `colour` VALUES (1,'INDIANRED','CD5C5C',1),(2,'BROWN','A52A2A',1),(3,'GREEN','00FF00',1),(4,'CRIMSON','DC143C',1),(5,'BLUE','0000FF',1);
/*!40000 ALTER TABLE `colour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_us_user_id_60031f5b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `contact_us_user_id_60031f5b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (1,'Ok','ans@gmail.com','ok','Ok','2020-03-19 10:14:16.705070',18),(2,'Assad as a','acascascas@gmail.com','qoidjqwidjqwidj','Asoicqiocjqiocjqiocioqwcioqwjcioqw','2020-04-27 10:52:10.719465',2);
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-11 12:41:41.199225','1','User',1,'[{\"added\": {}}]',3,1),(2,'2020-03-11 12:41:49.623193','2','Admin',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'apis','addresses'),(8,'apis','appversion'),(49,'apis','bankdetail'),(36,'apis','cart'),(9,'apis','clothstyle'),(35,'apis','clothstylecolour'),(44,'apis','clothstylecolourimage'),(45,'apis','clothstylepatterncolourimage'),(10,'apis','colour'),(34,'apis','contactus'),(48,'apis','duepayment'),(11,'apis','fabric'),(47,'apis','fabriccolour'),(46,'apis','fabriccolourimage'),(33,'apis','favourite'),(32,'apis','followuser'),(31,'apis','forgetpasswordlog'),(30,'apis','message'),(29,'apis','notification'),(28,'apis','orderpost'),(27,'apis','ordertrn'),(12,'apis','pattern'),(13,'apis','post'),(26,'apis','postcomment'),(25,'apis','postimage'),(24,'apis','postlike'),(14,'apis','reachus'),(43,'apis','relpostclothstyle'),(41,'apis','relpostclothstylecolour'),(23,'apis','relpostfabric'),(39,'apis','relpostpattern'),(42,'apis','relpostsew'),(38,'apis','relpostshape'),(40,'apis','relpostshapecolour'),(22,'apis','relpostsize'),(21,'apis','reportpost'),(15,'apis','sew'),(16,'apis','shape'),(17,'apis','shapecolour'),(18,'apis','size'),(19,'apis','subscribe'),(6,'apis','user'),(20,'apis','verifylog'),(3,'auth','group'),(2,'auth','permission'),(37,'authtoken','token'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-11 12:34:45.833041'),(2,'contenttypes','0002_remove_content_type_name','2020-03-11 12:34:46.100745'),(3,'auth','0001_initial','2020-03-11 12:34:46.348393'),(4,'auth','0002_alter_permission_name_max_length','2020-03-11 12:34:47.034004'),(5,'auth','0003_alter_user_email_max_length','2020-03-11 12:34:47.048335'),(6,'auth','0004_alter_user_username_opts','2020-03-11 12:34:47.057856'),(7,'auth','0005_alter_user_last_login_null','2020-03-11 12:34:47.067623'),(8,'auth','0006_require_contenttypes_0002','2020-03-11 12:34:47.072919'),(9,'auth','0007_alter_validators_add_error_messages','2020-03-11 12:34:47.087073'),(10,'auth','0008_alter_user_username_max_length','2020-03-11 12:34:47.096531'),(11,'auth','0009_alter_user_last_name_max_length','2020-03-11 12:34:47.106363'),(12,'auth','0010_alter_group_name_max_length','2020-03-11 12:34:47.131683'),(13,'auth','0011_update_proxy_permissions','2020-03-11 12:34:47.147951'),(14,'apis','0001_initial','2020-03-11 12:34:49.812260'),(15,'admin','0001_initial','2020-03-11 12:34:57.903153'),(16,'admin','0002_logentry_remove_auto_add','2020-03-11 12:34:58.297676'),(17,'admin','0003_logentry_add_action_flag_choices','2020-03-11 12:34:58.321894'),(18,'authtoken','0001_initial','2020-03-11 12:34:58.426123'),(19,'authtoken','0002_auto_20160226_1747','2020-03-11 12:34:58.896523'),(20,'sessions','0001_initial','2020-03-11 12:34:58.977349'),(21,'apis','0002_auto_20200319_0914','2020-03-19 09:14:25.407636'),(22,'apis','0003_auto_20200323_1045','2020-03-23 10:45:28.020633'),(23,'apis','0004_auto_20200323_1116','2020-03-23 11:16:34.247067'),(24,'apis','0005_auto_20200324_0310','2020-03-24 03:10:16.134967'),(25,'apis','0006_auto_20200330_0616','2020-03-30 06:17:15.435787'),(26,'apis','0007_notification_order_id','2020-04-01 08:00:13.106162'),(27,'apis','0008_auto_20200401_0847','2020-04-01 08:48:43.863873'),(28,'apis','0009_relpostclothstyle_relpostclothstylecolour_relpostpattern_relpostsew_relpostshape_relpostshapecolour','2020-04-13 04:43:08.934211'),(29,'apis','0010_auto_20200413_0512','2020-04-13 05:12:28.123264'),(30,'apis','0011_clothstyle_price','2020-04-13 05:44:55.326581'),(31,'apis','0012_auto_20200413_0848','2020-04-13 08:48:26.520098'),(32,'apis','0013_clothstyle_clothstylecolour_relpostclothstyle_relpostclothstylecolour','2020-04-13 08:53:37.945452'),(33,'apis','0014_auto_20200413_1304','2020-04-13 13:04:13.121346'),(34,'apis','0015_clothstyle_clothstylecolour_clothstylecolourimage_relpostclothstyle_relpostclothstylecolour','2020-04-13 13:10:30.316639'),(35,'apis','0016_auto_20200414_0644','2020-04-14 06:44:59.427906'),(36,'apis','0017_auto_20200417_0846','2020-04-17 08:46:43.514832'),(37,'apis','0018_reportpost_status','2020-04-27 08:00:03.634082'),(38,'apis','0019_fabriccolour_fabriccolourimage','2020-04-28 13:02:10.245388'),(39,'apis','0020_duepayment','2020-05-04 07:05:00.029903'),(40,'apis','0021_post_post_type','2020-05-06 12:09:18.998703'),(41,'apis','0022_auto_20200602_0947','2020-06-02 09:47:25.495753'),(42,'apis','0023_auto_20200630_0935','2020-06-30 09:36:16.672990');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0if93ze1y840rrlukfx8oqt618wbzuxd','MWVkYTMzNzRkNTRkZmEzZjliMDRmMzc0NWMwZjZkZGFjZDA5YzY0ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGYzOTM4OGRkOTNiZDQxOTA4N2FhYTM1YTUzMzUwYmI2NTY0Y2VmIn0=','2020-03-25 12:41:18.859502');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duepayment`
--

DROP TABLE IF EXISTS `duepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duepayment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_time` datetime(6) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `duepayment_user_id_7004246a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `duepayment_user_id_7004246a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duepayment`
--

LOCK TABLES `duepayment` WRITE;
/*!40000 ALTER TABLE `duepayment` DISABLE KEYS */;
INSERT INTO `duepayment` VALUES (3,123.85,0,'','2020-04-03 01:08:01.447475','2020-05-15 10:39:26.843747',27),(4,181.83,0,'','2020-03-20 14:02:09.037572','2020-05-15 10:43:10.165158',27),(5,269.12,0,'','2020-03-19 04:48:40.274945','2020-05-19 08:01:56.666610',3),(6,84664.00,0,'','2020-06-03 05:36:14.156347','2020-06-03 05:05:58.907598',37),(7,45.98,1,'',NULL,'2020-06-05 14:51:34.978715',29);
/*!40000 ALTER TABLE `duepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabric`
--

DROP TABLE IF EXISTS `fabric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabric` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fabric` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabric`
--

LOCK TABLES `fabric` WRITE;
/*!40000 ALTER TABLE `fabric` DISABLE KEYS */;
INSERT INTO `fabric` VALUES (1,'Silk',1,'/media/fabricimages/43/silknew.jpg',NULL,12.89),(2,'Cotton',1,'/media/fabricimages/43/cottonnew.jpg',NULL,20.34),(3,'Jute',1,'/media/fabricimages/43/jute.jpg',NULL,10.45),(4,'Nylon',1,'/media/fabricimages/43/nylonnew.jpg',NULL,25.34),(5,'Wool',1,'/media/fabricimages/43/wool.jpeg',NULL,12.67);
/*!40000 ALTER TABLE `fabric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabriccolour`
--

DROP TABLE IF EXISTS `fabriccolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabriccolour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `colour` varchar(59) NOT NULL,
  `colour_code` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabriccolour`
--

LOCK TABLES `fabriccolour` WRITE;
/*!40000 ALTER TABLE `fabriccolour` DISABLE KEYS */;
INSERT INTO `fabriccolour` VALUES (1,'blue','33B5FF',1),(2,'red','FF0000',1);
/*!40000 ALTER TABLE `fabriccolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabriccolourimage`
--

DROP TABLE IF EXISTS `fabriccolourimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabriccolourimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `image` varchar(255) NOT NULL,
  `fabric_id` bigint(20) DEFAULT NULL,
  `fabriccolour_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fabriccolourimage_fabric_id_27d865a9_fk_fabric_id` (`fabric_id`),
  KEY `fabriccolourimage_fabriccolour_id_89a14f79_fk_fabriccolour_id` (`fabriccolour_id`),
  CONSTRAINT `fabriccolourimage_fabric_id_27d865a9_fk_fabric_id` FOREIGN KEY (`fabric_id`) REFERENCES `fabric` (`id`),
  CONSTRAINT `fabriccolourimage_fabriccolour_id_89a14f79_fk_fabriccolour_id` FOREIGN KEY (`fabriccolour_id`) REFERENCES `fabriccolour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabriccolourimage`
--

LOCK TABLES `fabriccolourimage` WRITE;
/*!40000 ALTER TABLE `fabriccolourimage` DISABLE KEYS */;
INSERT INTO `fabriccolourimage` VALUES (1,1,'/media/fabricimages/43/bluesilk.jpg',1,1),(2,1,'/media/fabricimages/43/bluecotton.jpg',2,1),(3,1,'/media/fabricimages/43/bluejute.jpg',3,1),(4,1,'/media/fabricimages/43/bulenylon.jpg',4,1),(5,1,'/media/fabricimages/43/bluewool.jpg',5,1),(6,1,'/media/fabricimages/43/redsilk1.jpg',1,2),(7,1,'/media/fabricimages/43/redcotton1.jpg',2,2),(8,1,'/media/fabricimages/43/redjute1.jpg',3,2),(9,1,'/media/fabricimages/43/rednylon1.jpg',4,2),(10,1,'/media/fabricimages/43/redwool1.jpg',5,2);
/*!40000 ALTER TABLE `fabriccolourimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favourite_post_id_100cd4c5_fk_post_id` (`post_id`),
  KEY `favourite_user_id_b8bf9aff_fk_auth_user_id` (`user_id`),
  CONSTRAINT `favourite_post_id_100cd4c5_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `favourite_user_id_b8bf9aff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite`
--

LOCK TABLES `favourite` WRITE;
/*!40000 ALTER TABLE `favourite` DISABLE KEYS */;
INSERT INTO `favourite` VALUES (4,'2020-03-19 09:51:30.032435',5,18),(19,'2020-03-27 11:56:40.760647',4,14),(25,'2020-03-27 13:44:47.323600',12,25),(26,'2020-03-27 13:46:32.783186',13,25),(32,'2020-03-27 14:32:25.607312',6,25),(33,'2020-03-27 14:33:26.861838',4,25),(34,'2020-03-27 14:33:29.081461',5,25),(49,'2020-03-29 15:33:01.790627',14,32),(50,'2020-03-30 10:01:03.223884',12,34),(57,'2020-04-02 09:10:17.614004',15,36),(58,'2020-04-03 01:35:13.486987',17,37),(59,'2020-04-05 11:42:21.582769',17,36),(63,'2020-04-05 13:23:39.088343',4,29),(64,'2020-04-07 06:04:47.463820',29,29),(65,'2020-04-07 10:32:28.628936',25,29),(66,'2020-04-07 10:40:26.726724',32,14),(67,'2020-04-08 03:30:15.513348',33,42),(68,'2020-04-08 04:14:14.648501',32,42),(70,'2020-04-09 04:56:56.574695',34,14),(88,'2020-05-01 05:25:34.683682',49,14),(114,'2020-05-12 17:11:55.947909',57,3),(115,'2020-05-18 06:28:00.317476',54,3),(119,'2020-05-18 10:38:17.990195',58,3),(124,'2020-06-03 05:49:05.459873',76,29),(126,'2020-06-05 13:18:21.451955',77,10),(129,'2020-06-15 13:03:48.743275',37,2),(131,'2020-06-19 02:19:10.554453',76,2),(132,'2020-06-25 06:44:25.883139',73,29),(133,'2020-06-25 12:25:13.815031',78,2),(134,'2020-06-30 06:09:27.762241',27,2),(142,'2020-06-30 06:10:46.835489',65,2);
/*!40000 ALTER TABLE `favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_user`
--

DROP TABLE IF EXISTS `follow_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `follow_by_id` bigint(20) DEFAULT NULL,
  `follow_to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_user_follow_by_id_a70de72d_fk_auth_user_id` (`follow_by_id`),
  KEY `follow_user_follow_to_id_4e77621c_fk_auth_user_id` (`follow_to_id`),
  CONSTRAINT `follow_user_follow_by_id_a70de72d_fk_auth_user_id` FOREIGN KEY (`follow_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `follow_user_follow_to_id_4e77621c_fk_auth_user_id` FOREIGN KEY (`follow_to_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_user`
--

LOCK TABLES `follow_user` WRITE;
/*!40000 ALTER TABLE `follow_user` DISABLE KEYS */;
INSERT INTO `follow_user` VALUES (59,'2020-03-26 04:23:31.640948',14,18),(100,'2020-03-30 08:16:29.700574',34,22),(103,'2020-03-30 08:47:43.379341',34,3),(106,'2020-03-30 11:00:39.332755',16,3),(108,'2020-03-30 12:14:01.172952',15,3),(115,'2020-03-31 07:00:24.089638',35,3),(120,'2020-03-31 08:33:33.787046',18,3),(157,'2020-04-01 10:58:30.236244',16,18),(169,'2020-04-01 12:26:03.595977',17,14),(170,'2020-04-01 12:55:12.938632',15,14),(172,'2020-04-01 13:10:08.923114',22,14),(270,'2020-04-02 04:30:16.876272',14,34),(300,'2020-04-05 11:40:33.940398',36,37),(306,'2020-04-07 06:56:33.303206',29,18),(307,'2020-04-07 07:30:05.621691',29,14),(312,'2020-04-08 08:02:20.109588',10,3),(314,'2020-04-08 10:44:57.972491',42,3),(316,'2020-04-08 11:09:12.834883',27,3),(336,'2020-04-09 11:19:43.391787',27,16),(339,'2020-04-09 11:29:06.723909',27,14),(340,'2020-04-09 11:32:12.490102',30,14),(341,'2020-04-09 11:39:50.030897',14,30),(389,'2020-04-12 14:49:00.312632',3,34),(390,'2020-04-13 11:35:09.217198',44,3),(438,'2020-04-30 14:00:09.948710',14,3),(440,'2020-05-12 17:32:37.441422',3,3),(443,'2020-05-15 08:29:32.061280',3,18),(444,'2020-05-15 08:29:57.393741',3,2),(445,'2020-05-18 04:09:05.710510',3,22),(447,'2020-05-30 12:55:36.602924',3,44),(448,'2020-06-02 17:34:28.342353',37,36),(453,'2020-06-15 13:05:58.473178',2,18);
/*!40000 ALTER TABLE `follow_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgetpasswordlog`
--

DROP TABLE IF EXISTS `forgetpasswordlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forgetpasswordlog` (
  `id` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `createdTime` datetime(6) NOT NULL,
  `codeUsed` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forgetpasswordlog_user_id_291879c0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `forgetpasswordlog_user_id_291879c0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgetpasswordlog`
--

LOCK TABLES `forgetpasswordlog` WRITE;
/*!40000 ALTER TABLE `forgetpasswordlog` DISABLE KEYS */;
INSERT INTO `forgetpasswordlog` VALUES ('0ad532b1-2609-4cbe-8670-515c55ab0aa1','5ew-dcb7565cf8f5a115bce5','2020-03-18 12:38:54.000000',0,14),('2e417eed-b212-4295-916c-e651a5a40a59','5ex-14d2bf49246779e09f34','2020-03-19 09:33:51.000000',1,13),('427612c6-d8af-4886-8249-2930e36dde54','5ex-db9f80965d1749db5c77','2020-03-19 09:34:25.000000',1,14),('4e9c7344-8bda-49a0-b504-2114cb363073','5ex-24fa0b4f55ec99099adc','2020-03-19 03:01:10.000000',0,15),('55853789-e3ab-4252-830c-a836a0ede9ca','5ex-9eca40231bdbe632fb33','2020-03-19 09:30:04.000000',1,10),('748300a4-3012-4e2e-b41e-ffbdaf887915','5ex-30e5a8504d0ea56de817','2020-03-19 09:26:24.000000',1,2),('7a133e55-5fe8-4cbb-b881-341dc9d6b4fc','5ex-24fa0b4f55ec99099adc','2020-03-19 03:02:20.000000',1,15),('955d168f-71b0-4022-acec-c3bb65b83bbb','5fb-8e1798a4d486c8008551','2020-04-02 14:33:04.000000',0,22),('d4ae77d0-87bd-4684-aefe-649f7d6169f1','5ex-59ea1d6682f2626ca011','2020-03-19 04:47:31.000000',1,16);
/*!40000 ALTER TABLE `forgetpasswordlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `sender_status` tinyint(1) NOT NULL,
  `receiver_status` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_receiver_id_763b350f_fk_auth_user_id` (`receiver_id`),
  KEY `message_sender_id_a2a2e825_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `message_receiver_id_763b350f_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `message_sender_id_a2a2e825_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=531 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Okay',1,0,0,'2020-03-11 13:09:22.948238',2,3),(2,'Hiii',1,1,0,'2020-03-19 10:19:48.270883',14,18),(3,'Okk',1,1,0,'2020-03-19 10:20:00.585186',14,18),(4,'Okkgff',1,1,0,'2020-03-19 10:20:03.969338',14,18),(5,'Okhcdd hvhi',1,1,0,'2020-03-19 10:20:08.104356',14,18),(6,'Hi hi I hi hi hello there is a great night out for the day I ttt is the day you want me and you want me I u was a great night and a good day for me haha was a great night and a good day for me and you and we had fun I just wanted to you and we are going out and I I am so sorry I just wanted u I was a little late but it u is the day I just wanted to you and we are just getting out and we had a good time with kids I I am going to be home I I am going to be a little bit later I just got home I just wanted u was the day I just wanted to you and we are going out and I am so sorry I ',1,1,0,'2020-03-19 10:20:46.758720',14,18),(7,'\\ud83d\\udc4b\\ud83d\\ude9e\\ud83d\\udef0\\u26f5\\ufe0f\\ud83d\\ude89\\ud83d\\ude86\\ud83d\\ude86\\ud83d\\ude82\\ud83d\\ude9c\\ud83d\\ude89\\ud83d\\ude9c\\ud83d\\ude9c\\ud83d\\ude0e\\ud83d\\ude80\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0e\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude80\\ud83d\\ude0e\\ud83d\\ude0e\\ud83d\\ude0e\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0e\\ud83d\\ude0e\\ud83d\\ude0e\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\ude0a\\ud83d\\udc4d\\ud83d\\udc4d\\ud83d\\udc4d\\ud83d\\udc4d\\ud83d\\udc4d',1,1,0,'2020-03-19 10:21:15.167920',14,18),(8,'\\ud83d\\ude15\\ud83d\\ude15\\ud83d\\udea0\\ud83d\\udcba\\ud83d\\ude01\\ud83d\\ude02\\ud83d\\ude02\\ud83d\\ude43\\u263a\\ufe0f\\u263a\\ufe0f\\u263a\\ufe0f\\ud83d\\ude43\\ud83d\\ude43\\ud83d\\ude43\\ud83d\\ude09\\ud83d\\ude09\\ud83d\\ude09\\ud83d\\ude09\\ud83d\\ude09\\ud83d\\ude09\\u263a\\ufe0f\\u263a\\ufe0f\\u263a\\ufe0f\\u263a\\ufe0f\\ud83d\\ude09\\u263a\\ufe0f\\u263a\\ufe0f\\ud83d\\ude09\\u263a\\ufe0f',1,1,0,'2020-03-19 10:21:31.157663',14,18),(9,'Hi ',1,0,1,'2020-03-19 10:21:59.352001',18,14),(10,'Work from home kava do',1,0,1,'2020-03-19 10:22:15.056471',18,14),(11,'Okkk',1,1,0,'2020-03-19 10:22:34.836282',14,18),(12,'Think krda me',1,1,0,'2020-03-19 10:23:19.442075',14,18),(13,'Okkk',1,1,0,'2020-03-19 10:23:51.134564',14,18),(14,'Okkk',1,1,0,'2020-03-19 10:26:41.533843',14,18),(15,'Okkk',1,1,0,'2020-03-19 10:28:41.810727',14,18),(16,'Ok',1,1,0,'2020-03-19 10:29:05.790914',14,18),(17,'Ok',1,1,0,'2020-03-19 10:29:10.020690',14,18),(18,'Djd',1,1,0,'2020-03-19 10:29:15.386245',14,18),(19,'Okkoo',1,1,0,'2020-03-19 10:29:20.760870',14,18),(20,'Ok',1,1,0,'2020-03-19 10:29:23.206207',14,18),(21,'A',1,1,0,'2020-03-19 10:29:26.246147',14,18),(22,'A',1,1,0,'2020-03-19 10:29:31.672888',14,18),(23,'A',1,1,0,'2020-03-19 10:29:33.845808',14,18),(24,'A',1,1,0,'2020-03-19 10:29:35.790909',14,18),(25,'A',1,1,0,'2020-03-19 10:29:37.714491',14,18),(26,'A',1,1,0,'2020-03-19 10:29:39.481309',14,18),(27,'A',1,1,0,'2020-03-19 10:29:41.421350',14,18),(28,'A',1,1,0,'2020-03-19 10:29:43.477959',14,18),(29,'A',1,1,0,'2020-03-19 10:29:45.480807',14,18),(30,'A',1,1,0,'2020-03-19 10:29:47.281954',14,18),(31,'S',1,1,0,'2020-03-19 10:29:50.956076',14,18),(32,'A',1,1,0,'2020-03-19 10:29:53.596858',14,18),(33,'A',1,1,0,'2020-03-19 10:29:57.305812',14,18),(34,'A',1,1,0,'2020-03-19 10:30:00.347702',14,18),(35,'A',1,1,0,'2020-03-19 10:30:07.316100',14,18),(36,'A',1,1,0,'2020-03-19 10:30:09.926502',14,18),(37,'A',1,1,0,'2020-03-19 10:30:12.386227',14,18),(38,'A',1,1,0,'2020-03-19 10:30:15.517093',14,18),(39,'A',1,1,0,'2020-03-19 10:30:21.157185',14,18),(40,'A',1,1,0,'2020-03-19 10:30:23.657523',14,18),(41,'A',1,1,0,'2020-03-19 10:30:25.735689',14,18),(42,'A',1,1,0,'2020-03-19 10:30:28.057127',14,18),(43,'A',1,1,0,'2020-03-19 10:30:30.245700',14,18),(44,'A',1,1,0,'2020-03-19 10:30:34.762696',14,18),(45,'Aaa',1,1,0,'2020-03-19 10:30:40.836445',14,18),(46,'A',1,1,0,'2020-03-19 10:30:43.141200',14,18),(47,'A',1,1,0,'2020-03-19 10:30:45.135721',14,18),(48,'A',1,1,0,'2020-03-19 10:30:47.565901',14,18),(49,'A',1,1,0,'2020-03-19 10:30:50.560773',14,18),(50,'Asdasd',1,0,1,'2020-03-19 10:31:33.824795',18,14),(51,'Asdasd',1,0,1,'2020-03-19 10:31:35.061355',18,14),(52,'Asdasdas',1,0,1,'2020-03-19 10:31:36.341527',18,14),(53,'Asdasd',1,0,1,'2020-03-19 10:31:37.548487',18,14),(54,'Asdasd',1,0,1,'2020-03-19 10:31:38.743189',18,14),(55,'Asdasd',1,0,1,'2020-03-19 10:31:39.910128',18,14),(56,'Asdas',1,0,1,'2020-03-19 10:31:40.895522',18,14),(57,'Asdfdsfsd',1,0,1,'2020-03-19 10:31:48.700434',18,14),(58,'Sdfdsf',1,0,1,'2020-03-19 10:31:49.869548',18,14),(59,'Dsfdsf',1,0,1,'2020-03-19 10:31:50.885674',18,14),(60,'Sdf',1,0,1,'2020-03-19 10:31:51.755618',18,14),(61,'Sdfsdfdsf',1,0,1,'2020-03-19 10:31:54.629675',18,14),(62,'Hgfhgfhgfhgfhgf',0,0,1,'2020-03-19 15:45:11.151275',18,3),(63,'D',0,0,1,'2020-03-21 11:35:18.340317',22,2),(64,'X',0,0,1,'2020-03-21 11:35:21.556309',22,2),(65,'Bxbxxhxh',0,0,1,'2020-03-21 11:35:25.532641',22,2),(66,'J',0,0,1,'2020-03-21 11:35:28.139542',22,2),(67,'Ndnjdjddj',0,0,1,'2020-03-21 11:35:32.423470',22,2),(68,'Xbdhhxxhdhdhhdhdd',0,0,1,'2020-03-21 11:36:41.517401',22,2),(69,'Hdhdhdhhdeh',0,0,1,'2020-03-21 11:36:51.325960',22,2),(70,'Dhhd gddg',0,0,1,'2020-03-21 11:37:02.222680',22,2),(71,'H',0,0,1,'2020-03-21 11:39:16.812644',22,2),(72,'Hhhhh',0,0,1,'2020-03-21 11:39:18.727274',22,2),(73,'Hhhhhhhhhhxhxhd',0,0,1,'2020-03-21 11:39:26.613338',22,2),(74,'Re',1,0,0,'2020-03-21 15:04:19.129350',14,3),(75,'324easiduhasudhasuhduashdu8ashdu8ahudhasudhuasdhuashduashduhasudhasuhdaushduashduashd8uashd8uahdu8ashd8uashd8uahd8auhda8uhdau8shd8auhd8uashd8uashdu8ashd8uashd8uashdu8ashd8uashdu8ahdu8ashdu8ashduashdasu8hdsau8hduashduashduashdusahduhsuhsuhdushd',1,0,0,'2020-03-21 15:05:37.687427',14,3),(76,'W',1,0,0,'2020-03-21 15:05:46.638605',14,3),(77,'Sdfsdfdsfi0dsjfi0dsjfidsjfodsjfosdijfoidsjfoidsjfois 456',1,0,0,'2020-03-21 15:09:40.944429',14,3),(78,'Xccxcx',1,0,0,'2020-03-21 15:11:57.760331',14,3),(79,'23',0,0,1,'2020-03-22 03:11:46.451461',22,3),(80,'The ',1,0,0,'2020-03-22 06:33:44.502661',14,3),(81,'G',1,0,0,'2020-03-22 06:33:47.688495',14,3),(82,'C\\ud83d\\ude34\\ud83d\\ude1c\\ud83d\\ude04\\ud83d\\ude48\\ud83d\\ude34\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude03\\ud83d\\ude04\\ud83d\\ude04\\ud83d\\ude04\\ud83d\\ude04\\ud83d\\ude04\\ud83d\\ude04',1,0,0,'2020-03-22 06:34:05.215098',14,3),(83,'D',1,0,0,'2020-03-22 06:50:48.703036',14,3),(84,'Dssdsd',1,0,0,'2020-03-22 06:51:11.307011',14,3),(85,'S',1,0,0,'2020-03-22 06:51:46.829507',14,3),(86,'Ddsd',0,0,1,'2020-03-22 06:52:31.811592',22,3),(87,'Sdsddsd',1,0,0,'2020-03-22 06:52:37.911969',14,3),(88,'45',1,0,0,'2020-03-22 06:53:20.150646',14,3),(89,'Dfdf',1,0,0,'2020-03-22 06:54:15.739556',14,3),(90,'Eeeee',1,0,0,'2020-03-22 06:54:31.578502',14,3),(91,'E',1,0,0,'2020-03-22 06:54:33.050638',14,3),(92,'3',1,0,0,'2020-03-22 06:54:41.564886',14,3),(93,'E',1,0,0,'2020-03-22 07:05:34.709332',14,3),(94,'E',1,0,0,'2020-03-22 07:16:06.609150',14,3),(95,'Saasasasdasd',1,0,0,'2020-03-22 07:52:42.721299',14,3),(96,'Edere',1,0,0,'2020-03-22 10:10:04.453359',14,3),(97,'435345',1,0,0,'2020-03-22 11:56:01.205460',14,3),(98,'J',0,0,1,'2020-03-22 11:59:51.804726',22,3),(99,'U',1,0,0,'2020-03-22 12:03:45.844889',14,3),(100,'D',1,0,0,'2020-03-22 12:03:50.252263',14,3),(101,'F',1,0,0,'2020-03-22 12:03:56.293062',14,3),(102,'H',1,0,0,'2020-03-22 12:03:59.923547',14,3),(103,'Hshshsh',0,0,1,'2020-03-22 12:05:00.691144',16,14),(104,'Hddhd',0,0,1,'2020-03-22 12:05:04.320247',16,14),(105,'Dfggdfgdf',1,0,0,'2020-03-22 12:05:07.090352',14,3),(106,'Dfgdfgdfgfdgfd',1,0,0,'2020-03-22 12:05:10.598311',14,3),(107,'Hah',0,0,1,'2020-03-22 12:17:15.999044',22,3),(108,'Hahai',0,0,1,'2020-03-22 12:17:18.131791',22,3),(109,'Is',0,0,1,'2020-03-22 12:17:22.629140',22,3),(110,'Bsbsbsjs',0,0,1,'2020-03-22 12:17:26.453009',22,3),(111,'Hahsjs',0,0,1,'2020-03-22 12:17:28.531936',22,3),(112,'shshshsshsh',0,0,1,'2020-03-22 12:17:32.003566',22,3),(113,'Th',1,0,0,'2020-03-22 12:33:34.750510',14,3),(114,'Sadasdasd',1,0,0,'2020-03-23 06:59:52.452478',3,14),(115,'A',1,0,0,'2020-03-23 09:17:32.214930',14,3),(116,'Rdsfsdfsdfs',1,0,0,'2020-03-23 09:17:40.686743',14,3),(117,'Hi',1,0,0,'2020-03-23 09:17:53.323874',3,14),(118,'Ok',1,0,0,'2020-03-23 09:18:00.496044',14,3),(119,'Dsdfsdfdsfsdfsdfsdfdsjhfgdsjhgfsjdhfgsdjfgsjhfgsdj',1,0,0,'2020-03-23 09:18:12.048136',14,3),(120,'Iuriuhriuwhriuwehiurhewiurhiuwehrwe',1,0,0,'2020-03-23 09:18:16.240754',3,14),(121,'Hi',1,0,0,'2020-03-23 09:19:05.123074',14,3),(122,'Gmmmm',1,0,0,'2020-03-23 09:19:29.034489',3,14),(123,'E',1,0,0,'2020-03-23 09:57:55.232157',3,14),(124,'Fgggg',0,0,1,'2020-03-23 14:36:20.912981',22,3),(125,'G',1,0,0,'2020-03-23 14:47:06.152761',14,2),(126,'G',1,0,0,'2020-03-23 14:47:07.684919',14,2),(127,'dchngggghh',1,0,0,'2020-03-23 14:47:15.084694',14,2),(128,'G',1,0,0,'2020-03-24 09:55:52.300426',3,14),(129,'Sadadasdas',1,0,0,'2020-03-25 15:53:46.184055',3,14),(130,'H',1,0,0,'2020-03-25 16:06:45.844355',14,3),(131,'T',1,0,0,'2020-03-26 01:33:49.007464',14,3),(132,'Vashsha',1,0,0,'2020-03-26 12:30:52.616981',14,3),(133,'R',1,0,0,'2020-03-27 11:58:39.714722',2,14),(134,'Hi',0,1,1,'2020-03-27 15:02:05.979967',18,25),(135,'Nnzbxzx',1,1,0,'2020-03-27 15:02:17.138517',14,25),(136,'Qweqwewqwe',0,1,1,'2020-03-27 15:02:27.048451',15,25),(137,'Qwewqeqweqw',0,0,1,'2020-03-27 15:02:34.972733',16,25),(138,'Qweqweqweq',1,1,1,'2020-03-27 15:02:43.688550',27,25),(139,'Qweqeqeq',1,1,0,'2020-03-27 15:02:51.370679',29,25),(140,'Qweqeqweqweqw',1,1,1,'2020-03-27 15:03:01.865367',30,25),(141,'Qweqweqweqwwe',0,0,1,'2020-03-27 15:03:10.494783',28,25),(142,'Qweqweqweqwe',1,0,1,'2020-03-27 15:03:19.303789',24,25),(143,'Qweqeqweqw',1,0,0,'2020-03-27 15:03:28.426517',10,25),(144,'Qewqweqweqwe',1,0,0,'2020-03-27 15:03:45.377939',3,25),(145,'Ertertetrerterterrter',0,1,1,'2020-03-27 16:14:02.018728',22,25),(146,'Erterterter',0,1,1,'2020-03-27 16:14:04.104682',22,25),(147,'Tert',0,1,1,'2020-03-27 16:14:05.439032',22,25),(148,'Ertertretre',1,0,0,'2020-03-27 16:14:13.779438',2,25),(149,'Zxczxcxzc',0,1,1,'2020-03-27 16:21:04.697582',28,25),(150,'Zxczxczxcxz',1,1,1,'2020-03-27 16:21:15.821714',24,25),(151,'Zxczxcxzcxz',1,1,0,'2020-03-27 16:21:29.926739',2,25),(152,'Dc hi',1,1,0,'2020-03-27 16:53:39.210459',2,25),(153,'F',1,1,1,'2020-03-28 01:43:58.351382',25,27),(154,'I ',1,0,0,'2020-03-28 05:23:59.695342',14,3),(155,'H',0,0,1,'2020-03-29 03:13:16.860789',18,3),(156,'H',1,0,0,'2020-03-29 03:13:27.777060',14,3),(157,'V',0,0,1,'2020-03-29 04:46:13.301881',18,3),(158,'Q',0,0,1,'2020-03-30 05:37:31.041865',25,14),(159,'V',1,0,0,'2020-03-30 14:01:53.059613',14,3),(160,'G',1,0,0,'2020-03-30 14:01:54.581984',14,3),(161,'H',1,0,0,'2020-03-30 14:02:12.714702',14,3),(162,'J',1,0,0,'2020-03-30 14:02:14.421328',14,3),(163,'H',1,0,0,'2020-03-30 14:02:17.552385',14,3),(164,'H',0,0,1,'2020-03-30 15:02:52.152208',16,3),(165,'Bbbbbbh',0,0,1,'2020-03-31 06:19:26.565393',16,3),(166,'Bxbxbzbzbzbzbabywwyywwywywyywwyywwywywywyywywywtwwywywywywywtwtwywywywwywywuwuwuwuwuwuwuwwuwy ywtetwywywywwyw weyeywywywywywywywywwywywywywywywywywywywwywywywywywyww was the way I can do this game for the game I play f Bxbxbzbzbzbzbabywwyywwywywyywwyywwywywywyywywywtwwywywywywywtwtwywywywwywywuwuwuwuwuwuwuwwuwy ywtetwywywywwyw weyeywywywywywywywywwywywywywywywywywywywwywywywywywyww was the way I can do this game for the game I play for Bxbxbzbzbzbzbabywwyywwywywyywwyywwywywywyywywywtwwywywywywywtwtwywywywwywywuwuwuwuwuwuwuwwuwy ywtetwywywywwyw weyeywywywywywywywywwywywywywywywywywywywwywywywywywyww was the way I can do this game for the game I play for a yyyyy year  a yyyyy year or a yyyyy year ',0,0,1,'2020-03-31 06:20:07.362660',16,3),(168,'ok',1,1,0,'2020-04-01 14:11:05.251816',14,16),(169,'Hi',1,0,0,'2020-04-01 14:13:11.403369',14,3),(170,'Fggg',1,0,0,'2020-04-01 14:13:28.831870',14,3),(171,'Ffgg',1,0,0,'2020-04-01 14:13:39.867013',14,3),(172,'ok',1,1,0,'2020-04-02 03:53:08.822762',14,16),(173,'Dfgg',1,0,0,'2020-04-02 04:22:24.479022',14,3),(174,'Ddccf',1,0,0,'2020-04-02 04:22:50.195808',14,3),(175,'Gggg',1,0,0,'2020-04-02 04:22:52.639845',14,3),(176,'Fggg',1,0,0,'2020-04-02 04:32:42.442420',14,3),(177,'Ggg',1,0,0,'2020-04-02 05:25:00.527516',14,3),(178,'Tyuu',1,0,0,'2020-04-02 05:25:58.050697',14,3),(179,'Cgg',1,0,0,'2020-04-02 05:34:31.247433',14,3),(180,'Hshss',1,0,0,'2020-04-02 05:45:45.523765',14,3),(181,'Scdggse',1,0,0,'2020-04-02 05:48:37.189142',14,3),(182,'U',1,0,0,'2020-04-02 05:53:26.179851',14,3),(183,'Ggggg',1,0,0,'2020-04-02 05:54:44.145075',14,3),(184,'Cggg',1,0,1,'2020-04-02 05:57:52.280516',27,3),(185,'Dbbddvdbsh',1,0,1,'2020-04-02 05:57:57.924511',27,3),(186,'Ffgghh ',1,0,1,'2020-04-02 05:58:01.426639',27,3),(187,'F',1,0,0,'2020-04-02 05:58:09.267248',14,3),(188,'Ffggffggffgggg',1,0,0,'2020-04-02 06:00:14.027949',14,3),(189,'H',1,0,0,'2020-04-02 06:00:25.026749',14,3),(190,'G',1,0,0,'2020-04-02 06:00:34.030265',3,14),(191,'G',1,0,0,'2020-04-02 06:00:41.839062',14,3),(192,'Jchxhxuxuciv',1,0,0,'2020-04-02 06:00:49.269875',14,3),(193,'F',1,0,0,'2020-04-02 06:02:04.523522',3,14),(194,'Cggg',1,0,1,'2020-04-02 06:02:21.753738',27,3),(195,'Yu',1,0,1,'2020-04-02 06:02:24.935762',27,3),(196,'F',1,0,0,'2020-04-02 06:10:57.723328',14,3),(197,'D',1,0,0,'2020-04-02 06:11:09.114489',14,3),(198,'H',1,0,0,'2020-04-02 06:11:15.075002',14,3),(199,'Dfgfhcjcc',1,0,0,'2020-04-02 06:11:25.833195',14,3),(200,'Yddydyd',1,0,0,'2020-04-02 06:11:44.200923',14,3),(201,'J',1,0,0,'2020-04-02 06:11:48.475323',14,3),(202,'Hhhh',1,0,0,'2020-04-02 06:16:06.129807',14,3),(203,' Fgg',1,0,1,'2020-04-02 06:16:15.784439',27,14),(204,'Ggffghhh',1,0,0,'2020-04-02 06:16:23.802497',14,3),(205,'Qaqa',1,0,0,'2020-04-02 06:16:28.405037',14,3),(206,'H',1,0,1,'2020-04-02 06:24:08.959931',27,3),(207,'Fgggg',1,0,0,'2020-04-02 06:24:14.591990',14,3),(208,'D',1,0,0,'2020-04-02 06:24:24.018913',14,3),(209,'Hmmm I know I wanna say it na hora is your ',1,0,0,'2020-04-02 06:24:33.185500',14,3),(210,'Hi ',1,0,0,'2020-04-02 06:24:45.692647',14,3),(211,'S',1,0,0,'2020-04-02 06:25:13.086500',14,3),(212,'Cc\\u2019d',1,0,1,'2020-04-02 06:25:37.755941',27,3),(213,'Hmmm ',1,0,0,'2020-04-02 06:25:44.622403',14,3),(214,'D',1,0,0,'2020-04-02 06:25:54.259135',14,3),(215,'245566',1,0,0,'2020-04-02 06:26:03.993437',14,3),(216,'(',1,0,0,'2020-04-02 06:26:09.396028',14,3),(217,'I ',1,0,0,'2020-04-02 06:26:14.727324',14,3),(218,'Hmmm ',1,0,0,'2020-04-02 06:26:19.423558',14,3),(219,'C',1,0,0,'2020-04-02 06:26:26.427988',14,3),(220,'\\ud83e\\uddc8\\ud83e\\uddc8\\ud83e\\uddc8\\ud83c\\udf57',1,0,0,'2020-04-02 06:26:53.069132',14,3),(221,'Q',1,0,0,'2020-04-02 06:27:02.011159',14,3),(222,'Okmjinbv',1,0,0,'2020-04-02 06:28:27.688125',14,3),(223,'Hmmm ',1,0,0,'2020-04-02 06:28:33.546674',14,3),(224,'Hi ',1,0,0,'2020-04-02 06:28:50.033683',14,3),(225,'D',1,0,0,'2020-04-02 06:29:49.085278',14,3),(226,'Csvgsgshs',1,0,0,'2020-04-02 06:34:51.602006',14,3),(227,'Fsgsy',1,0,0,'2020-04-02 06:34:56.454765',14,3),(228,'Vsvxbxbz',1,0,0,'2020-04-02 06:44:01.749551',14,3),(229,'T',1,0,0,'2020-04-02 06:44:37.705821',14,3),(230,'G',1,0,0,'2020-04-02 07:47:01.461048',14,29),(231,'\\ud83d\\udc4b ',1,0,0,'2020-04-02 07:47:12.639970',14,29),(232,'How\\u2019s y',1,0,0,'2020-04-02 07:47:21.770880',14,29),(233,'F',1,0,0,'2020-04-02 07:47:54.625670',14,29),(234,'Check',1,0,0,'2020-04-02 07:48:34.267038',29,14),(235,'123',1,0,0,'2020-04-02 07:49:03.502844',14,3),(236,'123',1,0,0,'2020-04-02 07:49:19.252049',14,3),(237,'5',1,0,0,'2020-04-02 07:49:23.954381',14,3),(238,'6',1,0,0,'2020-04-02 07:49:38.958703',14,3),(239,'7',1,0,0,'2020-04-02 07:49:49.121011',14,3),(240,'D',1,0,0,'2020-04-02 07:50:41.062598',29,14),(241,'8',1,0,0,'2020-04-02 07:55:09.399759',14,3),(242,'8',1,0,0,'2020-04-02 07:55:19.259061',14,3),(243,'677686786',1,0,0,'2020-04-02 07:55:30.474966',14,3),(244,'34345435435435453534354',1,0,0,'2020-04-02 07:55:46.198840',14,3),(245,'12',1,0,0,'2020-04-02 07:57:23.844051',14,3),(246,'13',1,0,0,'2020-04-02 07:57:29.525050',14,3),(247,'10',1,0,0,'2020-04-02 07:57:58.695739',14,29),(248,'14',1,0,0,'2020-04-02 07:58:07.773936',14,3),(249,'73)4737:',1,0,0,'2020-04-02 07:58:12.448562',14,29),(250,'Bdbdhd',1,0,0,'2020-04-02 07:58:29.328770',14,29),(251,'Dhdhdhdhdhd',1,0,0,'2020-04-02 07:58:36.398159',14,29),(252,'112222',1,0,0,'2020-04-02 07:58:42.394510',14,3),(253,'W',1,0,0,'2020-04-02 07:59:14.986995',14,3),(254,'D',1,0,0,'2020-04-02 07:59:14.987991',14,29),(255,'1',1,0,0,'2020-04-02 07:59:25.290940',14,3),(256,'G',1,0,0,'2020-04-02 07:59:26.408746',14,29),(257,'YiSTDQW87DT8QWTD87WQTWD8QTWQ87TD87QWTD87QTD8QWTDW78QTDW87WQTD87QWTD87QWTD8QW7TDW78WDT87WQTD87QTQWD78TQW87DT87QWTD87QWTD87QTD8QDQWDQWD',1,0,1,'2020-04-02 09:06:57.555822',27,36),(258,'SAJHGDUAYSGDUYAGUYDSAGSU',1,0,1,'2020-04-02 09:07:04.026503',27,36),(259,'ADASDASDASSDSA',1,0,1,'2020-04-02 09:07:08.250138',27,36),(260,'Bxbxxh',1,0,0,'2020-04-02 13:00:32.063183',14,29),(261,'GG',1,0,0,'2020-04-02 13:00:47.203407',14,29),(262,'Hi',0,0,1,'2020-04-03 01:18:36.122717',22,37),(263,'ok',1,1,0,'2020-04-03 11:07:19.988646',14,16),(264,'87678vc87hgfygfhgfghfytfytftyftyftyftyftyfytftyftyfytfytfytfytfytfytfytfytfytfytftyfytftyfytfytfytftyfytfytfytftyfytfytftyftyftyfytfytftyfytfytfytfytftyfytfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff786666666666666666666666666666666666666666666666666666666666666666666666 ',1,0,0,'2020-04-05 12:11:36.659135',3,36),(265,'Hi',1,0,0,'2020-04-06 11:52:47.605448',14,3),(266,'Hey !!!!!',1,0,0,'2020-04-06 11:52:59.228355',14,3),(267,'S',1,0,0,'2020-04-06 11:53:05.018473',3,14),(268,'Hi there just wanted you know if I',1,1,0,'2020-04-07 03:11:23.794962',14,27),(269,'Hi',1,0,0,'2020-04-07 04:26:26.890501',3,29),(270,'T',1,0,0,'2020-04-07 04:26:32.627538',3,29),(271,'Qsqewqwe',1,0,0,'2020-04-07 04:26:35.095208',3,29),(272,'Qwewqeqweqwewqe',1,0,0,'2020-04-07 04:26:38.343934',3,29),(273,'Qweqwewqeqweqwew',1,0,0,'2020-04-07 04:26:48.515798',14,29),(274,'Qweqweqweqwe',1,0,0,'2020-04-07 04:26:51.346549',14,29),(275,'Hi',0,0,1,'2020-04-07 04:27:07.205503',16,29),(276,'T',0,0,1,'2020-04-07 04:27:21.591839',16,29),(277,'F',1,0,0,'2020-04-07 04:28:13.084876',3,10),(278,'Hf dnyk',1,0,0,'2020-04-07 04:28:19.025516',3,10),(279,'XX XX XX z z',1,0,0,'2020-04-07 04:28:30.574127',3,29),(280,'32423423423423',1,0,0,'2020-04-07 04:28:34.168724',3,29),(281,'Qwqqweqeqweqw',1,0,0,'2020-04-07 04:28:40.313332',3,29),(282,'434534535345',1,0,0,'2020-04-07 04:28:46.001831',3,29),(283,'Dddddddd',1,0,0,'2020-04-07 04:28:52.594119',3,29),(284,'Tghg',1,0,0,'2020-04-07 04:28:54.608935',3,10),(285,'Hi ',1,0,0,'2020-04-07 04:28:58.900240',3,29),(286,'Hmmm ',1,0,0,'2020-04-07 04:29:10.540100',3,10),(287,'767675765756756756',1,0,0,'2020-04-07 04:29:17.879949',3,29),(288,'123',1,0,0,'2020-04-07 05:36:31.017286',14,29),(289,'123',1,0,0,'2020-04-07 05:36:39.474777',3,29),(290,'Tqweqweqe',1,0,0,'2020-04-07 05:37:05.077903',3,29),(291,'Qqeqewqewqe',1,0,0,'2020-04-07 05:37:09.655952',3,29),(292,'Dsfsdfsfsfdsd',1,0,0,'2020-04-07 05:37:13.593689',3,29),(293,'Dererre',1,0,0,'2020-04-07 05:38:46.643711',3,29),(294,'2343234234',1,0,0,'2020-04-07 05:57:21.135687',3,29),(295,'24234234234234',1,0,0,'2020-04-07 05:57:27.628180',3,29),(296,'Asdasdasdasdas',1,0,0,'2020-04-07 05:57:37.848799',3,29),(297,'Werewrewrewr',1,0,0,'2020-04-07 06:06:06.393444',3,29),(298,'Werwerwerwrwer',1,0,0,'2020-04-07 06:06:13.934559',3,29),(299,'Werewrwerewr',1,0,0,'2020-04-07 06:06:19.476916',3,29),(300,'Werewrwerw',1,0,0,'2020-04-07 06:06:22.214184',3,29),(301,'As;of	pjf0wquf0weu08fu08weyf0weyf908wyfw89yfw89yfw9fwy98fwy89v',0,0,1,'2020-04-07 06:07:16.854503',15,29),(302,'Werewrewrewr',0,0,1,'2020-04-07 06:55:50.511158',16,29),(303,'We',0,0,1,'2020-04-07 06:55:52.454988',16,29),(304,'Werwerewrwerwerewrwe',0,0,1,'2020-04-07 06:55:55.644305',16,29),(305,'Rewrwerewrwerewrrwr',0,0,1,'2020-04-07 06:55:59.186833',16,29),(306,'Werwerewewerweew',0,0,1,'2020-04-07 06:56:01.742099',16,29),(307,'Red	erqrt2y2eryeywryre',0,0,1,'2020-04-07 06:56:04.198436',16,29),(308,'Rev y rewyrewryre',0,0,1,'2020-04-07 06:56:08.593024',16,29),(309,'DLFHEWOIHFWOUEHFOEWOFHQOI;SHFOWQHFOQWHFIUQRHFOUHWUFIUWEFIUWGFIUWEGFIUGWEIUFGIUWEFGIUWEGFUIWGIFGQWIUFGIUWQGUIFGQWIUFGIUQEWGFIUWEQGFIUWEQGFIUWQEGFIUEWGFIUQWEGFIUWEGFIUWEGFIUQWGFIUQWEGFIUWEGFIUWEGFIUWQGFIUGWIUFGWEIUGFIUWEGFIUWEGFIUWEGFIUGWEIUFGWQEIUFGIUWQEGFIUWGFIUWEGFIUWEGIUFGWEIUFGIWEFGIUWEGFIUWGFIUWEGFIUWEGFUIWEGFIUWQGFIUWQEFGWQEIUFGWQEIUFGIUWQEFGUIWEFGUIWGFIUWEGFIWEFGIWUEFGIUWEGFIWQUFGIUWQFGWIUFGWUIQEGFIWQUEFGIUWQEGFIUWEFGWQIEUFGIUWQFGIUWQEGFUIEWGFUIWQEGFIUGWQFIUWEQIUFGWIUGFIUWEQFGUIWEQGFGWEIUFGIUWEGFIUWEFGIUWEGFQUWIEFGQWIUFGIUWEGFIUWEQGFIUQWEGFIUQWFGQWIUFGQWEIUEFGWELFGI1WQFUGQFG1OIUGF314R13478RY197RY289RU89134RY89131Y9814Y498R1289RU289RY892YR8923YR982YR892Y89R2Y89RY2389RY2839RY8923RY2938RYHFSDQKJLVBADSNBVWQLGHVQIPUWFGHWEIPUEHFIOUW	HFOIWHIUPFHWPIUEHFIUWGF2134P98R2QIQFUWILUFIUWEGFWIUFIQWUFWEIUFHIUQWEFHEQWIUHFWIPEUHFIUWEHFIDFNEWIUFHUWEHNQWHFQWEIOUHFO	HFQIFHQEIRUHF;IQRFDSFHQIUFHIUQHFWIURHIURY2134623784628736412874612394871264128346128974612897468271364128796428974612897461289734612398476123897461238976412987462389736412383764812946829746213834612837461289461238946238461238974687923164821687461238946AJBCSDQJKHFCSBFJQSHBDFHBJafjhasgfjhkafgjag	uogruwyfbmdsbfbasdbqjsfweqgufgqwuyefweqgfugyweufygewuyfgweufyguywegfweuyfguywegfweuyfguywegfuywegfwueygfuywegfuwyegfuywegfuywefguywegfuywefgweuyfguywegfweuygfuywegfuyewfgweuyfgweuygfweuygfuywegfuywegfyuwegfuywefgweuyfguwyefgwuyefguywefguwyegfuywefgwuflkaSFHQWIUOgfouwgf8owgfguy8wuqgfqwuyogfqwiufgqwuofgqwuoyfguwqfguyoqwofgqwouyfgqouwyfgqweouyfguoqwegyfqweoufgowqufgweouifgwioufi	wufgweoieufgweouefg	who	ifgieuwfgiqowugfiweoufgqweiufgiuweqfgouwqegfiuweqgifugweiufgweiufgiuwqegfqw8efgqskjdcbajkhzcgadjCHSUJHFGQWUFGWYUFGUQWEGFUYQWGFUYQWGFUUGFGUOQWEEGFWQEOUFGUOQWYGFQWEUOYFGOUWYEGFUOYQWEGFOUYQWEGFCJKHADGUOQSDYDGFUWEYGFOUQWYGFUOYQWEFGQWEUOEYEFGQWUOYFGQUWEOYGFWEUYOFGUYEWGFUYOWEGFUYOWEQGFWEOFUWGFUYWEQGFUWQCGASDJKHKCQWEUYGFUYOQWECBQUIYFGUYWEGFUYSJCHQWUYGFUYQWEGFUWQYCVWQUYEFYWQEUYCGQWEUYOCGUWOEYGCUOYEQWCVQWEUYOCVEWUYCUYQWBCYQWCVQWUYCVWQUYGCUYWQVCUWYEVECUYWQVCQWUVCUYWQVCUYQWYCVUWYQCWQUCGWEUYQCGQWUGCIWUECGQWUYCSMANZCBJKSDHVJSQDMVBASJKHVBUQDSVSVWQUYEYDHVUQWEYCWEQUYCUYQUYW',0,0,1,'2020-04-07 07:03:16.781665',18,29),(310,'AIF	7FT	WTFTFT23askdgasiudgaisuydgiuyasgdyuasduyasduyasgduyasgyudauysdguyasgduyasgduyasdguyasgduyasgduyasduyauydgasuydgasuydguyasgduyasgduyasgduygasuydsuygduyasgduasygduysagduyasgduyasgduyasgduyasguydgasuydgasuydguyasdguyasgdausydguyasgduyasgduyasgduyasgduyasgduyasgduyagsdyuasgduyasguydagsuydgasuydgsuyadgasuydgasuydgasuydgyuasdguyasdgyuasgduyasgduyasgdyuasgyudgsauydguyasgduyasgdyuasgdyuasgdyuadgasyudguyasdguyasdgasuydgyuasgdyuasgdas',1,0,0,'2020-04-07 07:30:42.459836',14,29),(311,'WjheguyqgewuyqwgeuyqwgeuyqwgeuywgueygqwuyeguyqwgeuyqwgeqwuyegquwygeuqywgeuywqgeuywqguyqwxquxqwxqygwxqhgvqgyvgyqvxygqwvxqwgxvqwygxvqxvqwygxvqwyxvqywtvxqwytxvqwytxvytqwvxytqwvxqwytvxyqtwvxqywtvxytqwvxtqvxqytvxqtwyvxytqwvxtyqvqytxqvxytxvqwvwtxywqvytxvwqytxvqwtyxvqwytvxqwytvxqywtxvqwytxvqwytxvqwytvxqwytxvqwytxvqwytxvqwytxvqwytxvqwytxvqwytxvqwytxvqwtyxvqwtyxvqwytvxqtwyvxqwtyxvqwtyxvqwytxvqwytwxvqwyxvqwytxvqwytxvqwytvxqwytvqxytqwvxqxyqwvxqwxyqwvxqwytxvqwytxvqwytxvqwytxvqwxytqwxvqwytvxytqwvxytqwvxytqwvxytqwvxytqwvyxvqwytxvqwytvxtyqvxqwuxqwlxjqwljcoiqwhquiehqwuiehqwiuheiuqwheiuqwhiuhqiuahcNcbzxmncbjahsbdidiudqgiquwdghiuqwgdiuqwgdgwqiudqwiudgqwiudgqwidgqwi',0,0,1,'2020-04-07 07:37:20.070483',27,29),(312,'1131231232131312312312312312123123131231312312312312312',1,0,0,'2020-04-07 08:03:55.634197',29,29),(313,'Qw',1,0,0,'2020-04-07 10:36:00.411391',29,29),(314,'Qwdqdqw',1,0,0,'2020-04-07 10:36:02.014857',29,29),(315,'4523523352dgqwydgqwuydgquwydgquwygdqwyudgqwuydgquydgquywdgqwydgqwuydgqwuydgquywgdquwygduyqgduyqwgduyqwgduyqwgduyqgwuydgqwuydgquydgquywdguyqwdgquywgdquygduyqwgduyqwgduyqwgduyqwgduygqwuydgquydguyqwgduyqgduyqgduyqwgduyqwgduyqwgduyqwgduyqwgduyqwgduyqwgduyqwgduyqwgduyqdgwehfew89fhuweifgew89fgwe7fgwefwegfiuwegfiuwegfiuwegfwiufgwiufgwiufgwiufgiwuegfiwegfiuwegfiuwegfiuwyegfuyewgfiewgfiuwegfiuwegfiuwegfiuwefiweufgiwefgwifwe',1,0,0,'2020-04-08 03:40:08.920876',3,42),(316,'123',1,0,0,'2020-04-08 03:49:44.712028',3,42),(317,'Wehfwfwefwefwe',1,0,0,'2020-04-08 03:49:50.100384',3,42),(318,'E',1,0,0,'2020-04-08 03:49:52.603753',3,42),(319,'E',1,0,0,'2020-04-08 03:49:55.591021',42,3),(320,'Okay ',1,0,0,'2020-04-08 03:50:03.509667',3,42),(321,'XaSsSsa',1,0,0,'2020-04-08 03:50:10.714465',3,42),(322,'QS	QS	QS	QS	QS	QS',1,0,0,'2020-04-08 03:50:13.001211',3,42),(323,'QQS	QS	QS	QS	QS	SQQ	Q	S	QSQ	',1,0,0,'2020-04-08 03:50:16.493049',3,42),(324,'QQS	Q	QS	QS	S	Q',1,0,0,'2020-04-08 03:50:19.695478',3,42),(325,'Werwrwerwe',1,0,0,'2020-04-08 05:44:17.686230',2,42),(326,'Werwerwerwerwer',1,0,0,'2020-04-08 05:44:21.415989',2,42),(327,'Hi',1,1,0,'2020-04-08 10:17:07.357697',3,42),(328,'Hi',1,1,0,'2020-04-08 10:17:47.307934',3,42),(329,'123',1,1,0,'2020-04-08 10:18:02.867359',3,42),(330,'Asdasdadad',1,1,0,'2020-04-08 10:43:34.163205',3,42),(331,'Sdasdasdasd',1,1,0,'2020-04-08 10:43:36.749380',3,42),(332,'Ascascacas',1,1,0,'2020-04-08 10:43:58.489674',3,42),(333,'Qweqweqweq',1,1,0,'2020-04-08 10:58:04.237290',3,42),(334,'Sdfdsfdsfsfs',1,1,0,'2020-04-08 10:58:10.854796',3,42),(335,'Ok',1,1,0,'2020-04-08 10:58:16.461310',3,42),(336,'Canada',1,1,0,'2020-04-08 10:58:25.331510',3,42),(337,'Hi',0,1,1,'2020-04-08 10:58:39.505644',18,42),(338,'Oktober ',1,1,0,'2020-04-08 10:59:20.360450',3,27),(339,'Asadasds',1,1,0,'2020-04-08 10:59:25.818879',3,27),(340,'We\\u2019re ',1,1,0,'2020-04-08 10:59:53.115624',3,27),(341,'E',1,1,0,'2020-04-08 11:00:16.466818',3,27),(342,'I ',1,1,0,'2020-04-08 11:00:23.204849',3,27),(343,'09u',1,1,0,'2020-04-08 11:04:49.642228',3,27),(344,'Hi ',1,1,0,'2020-04-08 11:04:54.600350',3,27),(345,'D',1,1,0,'2020-04-08 11:05:04.016197',3,27),(346,'W',1,1,0,'2020-04-08 11:05:41.402842',3,27),(347,'Ascacsacsacasc',1,0,0,'2020-04-08 13:05:40.432153',3,14),(348,'Kbdaisdbsaiubiubiuqwbxiuqb',0,0,1,'2020-04-09 02:29:32.797103',42,14),(349,'Dddd',0,0,1,'2020-04-09 03:18:51.389703',42,14),(350,'Hjgsfuygqyufguyqgfuyqguyfgqwyufgqwuyfgquwyfguyqgfuyqgfuyqwgfuyqwgfuyqwgfuyqgfuyqwgfuyqwgfuyqgwuyfqwgfuyqwgufygqwuyfgquwyfguyqwgfuyqwgfuyqwgfuygwquyfgqwuyfgqwuyfgqwuygfqyuwgfuyqgfuyqwgfuywqgfuygwquyfguyqwgfuyqwgfyuqwf',0,0,1,'2020-04-09 04:01:16.424197',42,14),(351,'Qwfwqfiuqwfu9qgui9fgqwgf8qwgfu8qgfq',0,0,1,'2020-04-09 04:01:31.815930',42,14),(352,'Eiurhewu8hruwehr8uewhr8whr87hwe78rhew78fuidsbfiusbfiudsbfuihfuisduifhsdufhsduifhuisdfhuisdhfiusdhfiusdhfiusdhiuhiuhiuhiuhiuhiuhiuhiuhiuhiuhiuhiuhiuhuihiuuuuuuuhhiiiiiiiiiiiiiiiasdhaiuhdiuahduiashdiuahdiuahdiuashiudahdiushiud',0,0,1,'2020-04-09 04:57:15.786633',42,14),(353,'Erwrwerewrewr',1,1,0,'2020-04-09 11:13:27.284359',14,30),(354,'Fwewerwrweerewr',1,1,0,'2020-04-09 11:31:18.566704',14,30),(355,'Wqrqrqrqwr',1,1,0,'2020-04-09 11:32:21.662144',14,30),(356,'Ihfuwihfuiwehefuwehfuwhufwhuifhuwehfuwehfeuwfhuweifhuwhfuwehfuiwehfuiwehfuiwhfihpwhfwupeqhfiuwqhfupwqhfpwheufhweuipfhuipwehfuiwhfuiwehfiuwhfuihweiufhweuifhwqiufhweuihfiuweqhfuiweqhfiuwqehfiuwqhfiuwqhfiuwehfuiwehfiuwhfiuwefhweiufhweuifhweiuhfiuwehfwuiehfuiwqehfiuwqehfuiweqhfuiwqehfiuwqehfiuwhfuwqehfuwqehfiuwqehfiuwhefiuwheuifwheuifhwequifhwqeufhwquifhwquifhiuwhfiuwqfhuiwfhwueihfiuwehfiuwehfwuihfuwihfuiwefw',0,0,1,'2020-04-09 12:42:28.033648',30,3),(357,'DZcZCzc',0,0,1,'2020-04-10 02:55:03.890857',30,3),(358,'Xczxczcz',1,0,0,'2020-04-10 03:39:47.982405',3,14),(359,'Zxczxcxz',1,0,0,'2020-04-10 03:39:50.524888',3,14),(360,'XX z XX XX XX XX xz',1,0,0,'2020-04-10 03:40:11.769647',3,14),(361,'QadadDd',1,0,0,'2020-04-10 03:40:13.786210',3,14),(362,'Hte',1,0,0,'2020-04-10 03:40:15.213143',3,14),(363,'H',1,0,0,'2020-04-10 03:40:16.289518',3,14),(364,'Sdfsdfsdf',1,0,0,'2020-04-10 03:44:54.265226',3,14),(365,'Wearwerqr',1,0,0,'2020-04-10 03:45:04.077083',3,14),(366,'Qrqrqrwqrqwrqwrqw',1,0,0,'2020-04-10 03:45:08.209199',3,14),(367,'Qwrqrwqrqwr',1,0,0,'2020-04-10 03:45:10.825286',3,14),(368,'Qrqrqrwrqwr',1,0,0,'2020-04-10 03:45:13.118311',3,14),(369,'qwrqwrqwrr',1,0,0,'2020-04-10 03:45:14.653236',3,14),(370,'Qwrqrqwrwqrqwrqwr',1,0,0,'2020-04-10 03:45:18.366558',3,14),(371,'Qwrqwrqwrqwr',1,0,0,'2020-04-10 03:45:21.332986',3,14),(372,'Qweqwewqeqweq',1,0,0,'2020-04-10 03:46:14.268164',3,14),(373,'Qweqweqwweqw',1,0,0,'2020-04-10 03:46:16.345939',3,14),(374,'Qweqweqweqwe qw',1,0,0,'2020-04-10 03:46:22.084974',3,14),(375,'22223',1,0,0,'2020-04-10 03:47:53.255167',3,14),(376,'Dsfsfdsfs',1,0,0,'2020-04-10 03:59:16.558858',3,14),(377,'Hmmm I know I don\\u2019t worry mai was the best day yuytuytr tccgy is a time to be cool and fun and again I wanna spend your life mai was your birthday \\ud83c\\udf81 I',0,0,1,'2020-04-12 14:53:56.106633',42,3),(378,'Yytytddytdytdytdytdtydytdytdytdytdytdytddytdytdytdytdytdytdytdytdytdtydytdytdytdytdytdydydytdydytdytdytdytdytdytdytdytdythjgkgjfuyytrzfdvbcmydgfxbvntytgfbnmkieredfzcxvhetrsfxcvvbc7tuyfgr698oilk,mbxrtetretetretretetetdcbcncghchghgdhdhgdhgdghdgdhgdhgdh',0,0,1,'2020-04-13 11:52:05.839940',44,3),(379,'Hjjghjgjhghjghjghjgjhgjhgjhggguygguygyugyugyuguyguyguyguyguyguyguyguygguyguyguyguyguyguygyuguyguyguygyuguyguygyuguuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuugyugyuguyguyg',0,0,1,'2020-04-13 12:07:15.904303',42,3),(380,'Poiokpokpokpokpokpokopkopkpokpokpokpkpokpokpokpokpokpokpokpokpokopkpokpokpokpokopkpokopkop',0,0,1,'2020-04-13 12:26:00.241628',42,3),(381,'Hi',0,0,1,'2020-04-20 04:42:36.965999',42,3),(382,'Heyyyy',0,0,1,'2020-04-20 05:05:46.901838',42,3),(383,'Hello ',1,0,0,'2020-04-23 03:00:46.713292',29,3),(384,'Hi',1,0,0,'2020-04-23 07:09:40.849394',29,3),(385,'Ububububu',1,0,0,'2020-04-23 12:02:23.442770',29,3),(386,'Sbhhd',1,0,0,'2020-04-23 13:46:44.068478',3,2),(387,'Tggg',1,0,0,'2020-04-23 13:46:53.934862',2,3),(388,'Wcweecwcwc',1,0,0,'2020-04-24 04:04:59.237750',3,2),(389,'Gyi',1,0,0,'2020-04-24 04:06:13.185172',3,2),(390,'Wefwefwefwefwef',1,0,0,'2020-04-24 04:22:19.871801',2,3),(391,'Hello',1,0,0,'2020-04-24 04:22:45.780727',2,3),(392,'Hello',1,0,0,'2020-04-24 05:25:23.203848',3,2),(393,'Hi ',1,0,0,'2020-04-24 05:25:59.869109',3,2),(394,'I ',1,0,0,'2020-04-24 05:26:04.167106',3,2),(395,'We\\u2019re ',1,0,0,'2020-04-24 05:26:10.242872',3,2),(396,'Hi ',1,0,0,'2020-04-24 05:26:21.100875',3,2),(397,'We\\u2019re ',1,0,0,'2020-04-24 05:26:25.349131',3,2),(398,'G',1,0,0,'2020-04-24 05:26:33.574526',3,2),(399,'S',1,0,0,'2020-04-24 05:26:40.037556',3,2),(400,'Hi there ',1,0,0,'2020-04-24 05:26:48.824212',3,2),(401,'We\\u2019re going to get a couple ',1,0,0,'2020-04-24 05:26:55.065374',3,2),(402,'Hi there I got your text message and you got ',1,0,0,'2020-04-24 05:27:01.819074',3,2),(403,'T',1,0,0,'2020-04-24 05:27:07.280806',3,2),(404,'\\ud83d\\udc4d',1,0,0,'2020-04-24 05:28:37.076459',3,2),(405,'\\ud83d\\ude09Google ',1,0,0,'2020-04-24 05:32:50.901611',3,2),(406,'got ',1,0,0,'2020-04-24 06:05:22.608129',3,2),(407,'Hi',1,0,0,'2020-04-24 12:15:54.511899',2,3),(408,'Hey',1,0,0,'2020-04-24 12:16:54.172836',2,3),(409,'Hello ',1,0,0,'2020-04-24 12:40:27.041661',29,3),(410,'123\\ud83d\\ude41',0,0,1,'2020-04-24 12:40:58.230000',27,3),(411,'Hi',0,0,1,'2020-04-24 12:54:51.035253',42,3),(412,'\\ud83d\\ude0b\\ud83d\\ude0f\\ud83d\\ude00',0,0,1,'2020-04-24 12:55:19.406876',22,3),(413,'\\ud83d\\ude00\\ud83d\\ude03',0,0,1,'2020-04-24 12:55:33.583626',32,3),(414,'2466;)&',1,0,1,'2020-04-24 12:55:47.647659',10,3),(415,'Okay',1,0,1,'2020-04-24 12:56:07.532994',24,3),(416,'Ijqsgq ccewcwecewcwcwwwcw',0,0,1,'2020-04-24 12:56:32.915785',30,3),(417,'12321222',0,0,1,'2020-04-24 12:56:43.146571',25,3),(418,'\\ud83d\\ude01\\ud83d\\ude04\\ud83d\\ude04\\ud83d\\ude00\\ud83d\\ude03\\ud83d\\ude04\\ud83d\\ude01',0,0,1,'2020-04-24 12:57:04.137207',15,3),(419,'The new update has a few minor ',0,0,1,'2020-04-24 12:57:31.059365',44,3),(420,'Hi there ',0,0,1,'2020-04-24 12:57:34.669395',44,3),(421,'\\ud83d\\ude00\\ud83d\\ude03',1,0,0,'2020-04-25 03:55:31.452251',2,3),(422,'\\ud83d\\udc4b was a ',0,0,1,'2020-04-27 02:40:38.156678',40,3),(423,'Hier sind wir',0,0,1,'2020-04-27 02:40:51.324574',36,3),(424,'\\ud83d\\ude04',0,0,1,'2020-04-27 02:41:10.217750',44,3),(425,'123',0,0,1,'2020-04-27 02:53:01.251438',34,3),(426,'1s2d2d2d2',0,0,1,'2020-04-27 02:54:02.444670',44,3),(427,'Sdqwdqd',0,0,1,'2020-04-27 04:16:44.086881',18,3),(428,'Asxassxaxasx',1,0,0,'2020-04-27 04:17:03.562473',14,3),(429,'Asxasxasxaxasx',0,0,1,'2020-04-27 04:17:13.277293',15,3),(430,'Asxsaxasxasx',0,0,1,'2020-04-27 04:17:21.077661',16,3),(431,'Asxsaxasxasxasx',0,0,1,'2020-04-27 04:17:36.715273',41,3),(432,'Fdchts ST',0,0,1,'2020-04-27 04:18:39.115587',40,3),(433,'12322',1,0,0,'2020-04-27 04:29:08.385309',2,3),(434,'32323232',0,0,1,'2020-04-27 04:29:16.563061',34,3),(435,'23131312312',0,0,1,'2020-04-27 04:29:33.010480',36,3),(436,'1e12e1e12e12e',0,0,1,'2020-04-27 04:29:47.762232',28,3),(437,'Wefwfewfewfwefw',0,0,1,'2020-04-27 04:30:12.344299',44,3),(438,'\\ud83d\\ude43',1,0,0,'2020-04-27 04:47:21.277852',3,2),(439,'\\ud83e\\udd70\\ud83d\\ude0b\\ud83d\\ude0b',1,0,0,'2020-04-27 04:47:27.855852',3,2),(440,'Effeeeefe',1,0,0,'2020-04-27 04:55:58.971808',14,2),(441,'Eefefe',1,0,0,'2020-04-27 04:56:09.881792',3,2),(442,'Wcwecwecwcwecw',1,0,0,'2020-04-27 04:58:14.254639',3,2),(443,'Zhr',1,0,0,'2020-04-27 05:01:20.245176',3,2),(444,'Sqqsqsq',1,0,0,'2020-04-27 05:01:55.715783',3,2),(445,'asasdsassdasdasdasd',1,0,0,'2020-04-27 05:49:47.420888',3,2),(446,'Hi',0,0,1,'2020-04-27 06:04:29.867768',44,2),(447,'1',0,0,1,'2020-04-27 06:05:24.413015',44,2),(448,'2',0,0,1,'2020-04-27 06:05:33.171402',18,2),(449,'3',0,0,1,'2020-04-27 06:05:40.157296',42,2),(450,'4',1,0,0,'2020-04-27 06:05:48.384011',14,2),(451,'Wdcwcwc',1,0,0,'2020-04-27 06:06:36.750599',14,2),(452,'Wdcwcwcwdc',0,0,1,'2020-04-27 06:06:44.608593',42,2),(453,'Wcwdcwcwdc',0,0,1,'2020-04-27 06:06:53.758296',44,2),(454,'Wcwcwcd',0,0,1,'2020-04-27 06:07:02.934230',15,2),(455,'Wdcwcwcdw',0,0,1,'2020-04-27 06:07:14.936162',16,2),(456,'Wcwcwcwdcd',0,0,1,'2020-04-27 06:07:24.224478',41,2),(457,'2e2e2e2',0,0,1,'2020-04-27 06:07:32.832201',27,2),(458,'Wcwcwc',1,0,0,'2020-04-27 06:07:45.645364',29,2),(459,'Sddwdad',0,0,1,'2020-04-27 06:07:54.455062',25,2),(460,'Wwedwedwe',0,0,1,'2020-04-27 06:08:06.587798',28,2),(461,'Wdwedwedwed',0,0,1,'2020-04-27 06:08:23.521536',24,2),(462,'Ddcwcwcwc',0,0,1,'2020-04-27 06:08:32.349188',32,2),(463,'Wdweedwedwd',1,0,0,'2020-04-27 06:08:44.356899',3,2),(464,'Wcwcwcwc',0,0,1,'2020-04-27 06:09:04.900666',22,2),(465,'Cwcwcwdcwc',0,0,1,'2020-04-27 06:09:12.141543',34,2),(466,'Wcwcwdcwcdwdcwdc',0,0,1,'2020-04-27 06:09:20.458086',40,2),(467,'Asxscaca',1,0,0,'2020-04-27 06:15:08.969695',3,2),(468,'Wqddqdwqdqwd',1,0,0,'2020-04-27 06:28:17.363186',3,2),(469,'Sdcdscsdcsc',0,0,1,'2020-04-27 07:41:16.552595',28,2),(470,'Cgh',0,0,1,'2020-04-27 07:43:39.662262',27,2),(471,'Wdwqdqdqwd',0,0,1,'2020-04-27 07:43:46.859525',25,2),(472,'2e32e23e23',0,0,1,'2020-04-27 07:43:55.264274',30,2),(473,'Wqdqdqwdqwdqwdw',1,0,0,'2020-04-27 07:45:52.628396',14,2),(474,'Asxasxass',0,0,1,'2020-04-27 07:57:21.347309',41,2),(475,'ZZcZ',0,0,1,'2020-04-27 08:03:27.801234',22,2),(476,'AxaxaXa',1,0,0,'2020-04-27 08:03:34.485541',3,2),(477,'XXaxaX',0,0,1,'2020-04-27 08:03:41.004092',32,2),(478,'AxaXaxa',1,0,1,'2020-04-27 08:03:47.869681',37,2),(479,'AxaXaxax',1,0,1,'2020-04-27 08:03:56.556697',10,2),(480,'AxxaxaxaXa',0,0,1,'2020-04-27 08:04:03.927616',30,2),(481,'Qwqqw',0,0,1,'2020-04-27 08:05:39.112669',28,2),(482,'Qwxqwxqwxq',1,0,1,'2020-04-27 08:05:47.256420',10,2),(483,'Qwxqxqwxqwx',0,0,1,'2020-04-27 08:05:55.171547',34,2),(484,'Qwxqwxqwwxq',0,0,1,'2020-04-27 08:06:03.214349',40,2),(485,'Tyuuuyf',0,0,1,'2020-04-27 08:23:14.593488',40,2),(486,'Dafafasf',1,0,0,'2020-04-27 09:06:33.709950',3,2),(487,'Hhhh',1,0,0,'2020-04-27 09:06:38.297787',3,2),(488,'dasdasdasd',1,0,0,'2020-04-27 09:12:11.545953',3,2),(489,'XXzvxzvxzvxzvxzv',1,0,0,'2020-04-27 09:12:17.521348',3,2),(490,'Txvasvsavsavsava',1,0,0,'2020-04-27 09:12:21.689518',3,2),(491,'Qwewqeqwewq',1,0,0,'2020-04-27 09:12:42.503711',3,2),(492,'\\ud83d\\ude00\\ud83d\\ude05',1,0,0,'2020-04-27 09:13:37.262131',3,2),(493,'Ccg',0,0,1,'2020-04-27 09:15:20.467611',34,2),(494,'Rru',1,0,1,'2020-04-27 09:15:35.384221',10,2),(495,'Ethgi',0,0,1,'2020-04-27 09:15:43.678760',30,2),(496,'Sdfu',1,0,0,'2020-04-27 09:16:03.083542',3,2),(497,'\\ud83d\\ude00hi',1,0,0,'2020-04-27 09:16:10.542628',3,2),(498,'\\ud83d\\ude00\\ud83d\\ude03\\ud83d\\ude04',1,0,0,'2020-04-27 09:16:34.551204',3,2),(499,'We\\u2019re going to be there in a few minutes \\ud83d\\ude0e',1,0,0,'2020-04-27 09:16:46.314868',3,2),(500,'Hi I just got off work I just wanted you know if I can help me out with you or you wanted to come home I wanted you know if you got a chance I just \\ud83d\\ude02\\ud83d\\ude02\\ud83e\\udd23\\ud83d\\ude03\\ud83d\\ude03',1,0,0,'2020-04-27 09:17:01.047618',3,2),(501,'\\ud83d\\ude04',1,0,0,'2020-04-27 10:11:25.135816',3,2),(502,'Sdfsdfsddfds',0,0,1,'2020-04-27 10:12:58.957182',36,2),(503,'Ascascacasc',0,0,1,'2020-04-27 10:15:30.804401',24,2),(504,'XX XX XX x xc',0,0,1,'2020-04-27 10:16:18.205416',28,2),(505,'Z XX z XX ',0,0,1,'2020-04-27 10:17:19.612973',25,2),(506,'23212412412',1,0,0,'2020-04-27 10:18:01.938692',29,2),(507,'12e1243tt2',0,0,1,'2020-04-27 10:18:10.249920',41,2),(508,'Dfgdfgdfgdfgdf',0,0,1,'2020-04-27 10:18:21.723663',16,2),(509,'Gfdfbdndndndndfn',0,0,1,'2020-04-27 10:18:35.069669',15,2),(510,'Asdasdad',1,0,0,'2020-04-27 10:30:04.481415',3,2),(511,'\\ud83d\\ude03',1,0,0,'2020-04-27 10:30:10.919400',3,2),(512,'Dui',1,0,0,'2020-04-27 10:41:02.544532',3,2),(513,'\\ud83d\\ude00',1,0,0,'2020-04-27 10:41:10.091106',3,2),(514,' \\ud83d\\ude16\\ud83e\\udd73\\ud83d\\ude09',1,0,0,'2020-04-27 10:41:16.690623',3,2),(515,'\\u0686\\u06a9\\u0686\\u062c \\u062c \\u062c \\u062c \\u062c \\u06a9\\u0686\\u06be \\u0641\\u0641\\u06af\\u06af\\u06af \\u06af\\u0634\\u06af',1,0,0,'2020-04-27 10:57:29.624173',2,3),(516,'\\ud83d\\ude03\\ud83d\\ude04\\ud83d\\ude02\\ud83d\\ude0f',0,0,1,'2020-04-27 11:00:53.127989',40,2),(517,'We\\u2019reety',1,0,0,'2020-04-28 13:07:39.994206',14,3),(518,'Gggg',1,0,1,'2020-04-29 12:57:21.486268',37,3),(519,'\\ud83d\\udc7e',1,0,0,'2020-04-30 04:18:17.751338',3,14),(520,'Tyyy',1,0,0,'2020-04-30 04:29:03.819277',3,14),(521,'Sadadas',1,0,0,'2020-04-30 11:46:51.469318',3,14),(522,'Fqfqwfqwfqwfqwfqwfqw',0,0,1,'2020-05-01 05:31:53.304837',16,14),(523,'Sfffffff',0,0,1,'2020-05-18 10:38:42.705166',40,3),(524,'Bxbxxbxbxbxbbxbxbxxbxbxbxbxbxbxbxbxbbxbxxbxbxbxbbxxbbxxbbxbxbxbxbxbbxxbxbxbxbxbxbxbbxxbxbxbxbxbxbxbxbxbxbxbxbbxxbxbbxxbxbxbxbbxxbxbbxxbxbxbbxbxxbxbxbxbxbxbxbxbxbbxxbxbxbbxxbxbxbxbxbxbbxxbxbxbxbxbxbxbxbxbxbxbxbxbxbbxbzbxbxbxxbxbxbxbxbbxxbxbxbxbbxxbxbxbxbxbxbxbxbxbx',1,0,0,'2020-05-23 06:23:19.119876',29,3),(525,'Hmmm \\ud83e\\uddd0 ',0,0,1,'2020-05-30 12:56:07.971191',42,3),(526,'Very ',0,0,1,'2020-05-31 01:44:57.099026',42,3),(527,'Sjsjdjdjdjdjdjjdjdjjdjdjdhycyccycycycyccycyycycycucycuucucyccycycycycyccycycycycycucucuvuu',0,0,1,'2020-06-05 14:52:06.858555',30,29),(528,'Ashdbhasbdasdsadasdas',1,1,0,'2020-06-15 12:10:21.598495',2,10),(529,'Fsdfsdfsdfsdfhsdfsdihfiusdfhsdiufhsdiuhfiusdhfiusdhfiusdhfiusdhfiusdhfiusdhfiudshfiusdhfiusdhfiusdhfiusdhfiusdhfiusdhfsdiufhsdiufhsidufhiusdfhiusdhfuisdfhsdiufhiusdfhiusdhfiusdhfuisdhfiusdhfisdfhisudfisdhfuisdhfuisdhufhsdiufhsduifhuisdfhuisdfhisudfhiudshfiusdhfisudfhuisdhfiusdhfiusdhfuisdhfiusdhfiusdhfusdhfiusdhfiushfisdhfiusdhfiusdhdfiushdfiudshifssdfaisudhaiudhasiudhiuashdiuashdiashidahsihdiashdiuashdiuashdiuahdiuahdiuahduiashdiuashdsiuashdasiu',0,0,1,'2020-06-15 13:04:30.914261',3,2),(530,'\\ud83e\\uddd8\\ud83c\\udffc',0,0,1,'2020-06-25 06:46:38.601377',34,29);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` varchar(255) NOT NULL,
  `notification_time` datetime(6) NOT NULL,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `tag` varchar(150) NOT NULL,
  `title` varchar(255) NOT NULL,
  `table_id` varchar(150) NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notification_receiver_id_cf7a839d_fk_auth_user_id` (`receiver_id`),
  KEY `notification_sender_id_e65a000f_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `notification_receiver_id_cf7a839d_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `notification_sender_id_e65a000f_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('0123599c-a275-11ea-ad27-0a412a2af476','2020-05-30 12:56:40.214077','liked your post',0,'like','','58',43,3,0),('02faca6e-7a54-11ea-ad27-0a412a2af476','2020-04-09 11:19:43.390429','has followed you',0,'follow','','336',16,27,0),('090705a0-798a-11ea-ad27-0a412a2af476','2020-04-08 11:13:54.665508','Sunny Kunar has placed an order',1,'order place','','25',27,3,186),('0d3739a8-a73c-11ea-ad27-0a412a2af476','2020-06-05 14:51:34.975680','Accept your order',0,'Order Accept','','247',30,29,247),('0eb34bb4-8847-11ea-ad27-0a412a2af476','2020-04-27 05:22:15.269292',' has placed an order',0,'order place','','35',30,2,286),('140f9f48-8f97-11ea-ad27-0a412a2af476','2020-05-06 12:42:42.758051','liked your post',0,'like','','51',43,3,0),('148be616-8f8d-11ea-ad27-0a412a2af476','2020-05-06 11:31:08.605361','liked your post',0,'like','','50',14,3,0),('1850c26a-824c-11ea-ad27-0a412a2af476','2020-04-19 14:43:12.524847','liked your post',0,'like','','35',30,3,0),('18ab4b7a-7d7b-11ea-ad27-0a412a2af476','2020-04-13 11:37:03.651568','has followed you',0,'follow','','391',34,44,0),('1fc12b2c-85d8-11ea-ad27-0a412a2af476','2020-04-24 03:03:07.407260',' has placed an order',0,'order place','','14',27,3,269),('2144394e-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:42.380903','liked your post',1,'like','','14',27,36,0),('22c45412-7a56-11ea-ad27-0a412a2af476','2020-04-09 11:34:55.138889','Neha Jain1 has placed an order',1,'order place','','35',30,14,241),('22c45413-7a56-11ea-ad27-0a412a2af476','2020-04-09 11:34:55.138889','Neha Jain1 has placed an order',1,'order place','','35',30,14,242),('23f92ba4-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:46.922062','liked your post',1,'like','','14',27,36,0),('24e302c8-890d-11ea-ad27-0a412a2af476','2020-04-28 05:00:13.462234','has followed you',0,'follow','','429',37,2,0),('25f2c46a-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:50.235570','liked your post',1,'like','','14',27,36,0),('26a092f2-a72f-11ea-ad27-0a412a2af476','2020-06-05 13:19:14.154584','has followed you',0,'follow','','449',42,29,0),('26d72388-7e5a-11ea-ad27-0a412a2af476','2020-04-14 14:13:45.197118','liked your post',0,'like','','35',30,3,0),('27749360-78ac-11ea-ad27-0a412a2af476','2020-04-07 08:45:37.984041','liked your post',1,'like','','25',27,29,0),('28472706-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:54.144328','liked your post',1,'like','','14',27,36,0),('28472707-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:55.888585','liked your post',1,'like','','14',27,36,0),('297f7ee8-8fa1-11ea-ad27-0a412a2af476','2020-05-06 13:54:53.690904','liked your post',0,'like','','55',43,3,0),('29a609c4-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:28.308047','liked your post',0,'like','','76',37,2,0),('2a4e7040-74c1-11ea-ad27-0a412a2af476','2020-04-02 09:05:57.547420','liked your post',1,'like','','14',27,36,0),('2b14fe26-8ecb-11ea-ad27-0a412a2af476','2020-05-05 12:23:04.048087','liked your post',0,'like','','46',37,3,0),('2c925afc-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:33.218324','liked your post',0,'like','','76',37,2,0),('2cf2ec44-8ecb-11ea-ad27-0a412a2af476','2020-05-05 12:23:07.180194','liked your post',0,'like','','46',37,3,0),('2e922092-8ecb-11ea-ad27-0a412a2af476','2020-05-05 12:23:09.901449','liked your post',0,'like','','46',37,3,0),('2f62b1dc-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:37.939029','liked your post',0,'like','','76',37,2,0),('2f6a936a-9686-11ea-ad27-0a412a2af476','2020-05-15 08:29:25.348452','has followed you',0,'follow','','441',44,3,0),('30d58de6-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:40.369635','liked your post',0,'like','','76',37,2,0),('31b0c5cc-9686-11ea-ad27-0a412a2af476','2020-05-15 08:29:29.163716','has followed you',0,'follow','','442',18,3,0),('32354758-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:42.674649','liked your post',0,'like','','76',37,2,0),('336ab0e4-9686-11ea-ad27-0a412a2af476','2020-05-15 08:29:32.059904','has followed you',0,'follow','','443',18,3,0),('339c7968-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:45.028737','liked your post',0,'like','','76',37,2,0),('33dd8e3e-8fa1-11ea-ad27-0a412a2af476','2020-05-06 13:55:11.084462','liked your post',0,'like','','56',43,3,0),('3556887c-ba82-11ea-ad27-0a412a2af476','2020-06-30 03:31:39.147488','liked your post',0,'like','','27',29,2,0),('38a97b9a-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:53.502448','liked your post',0,'like','','76',37,2,0),('38db5430-7a29-11ea-ad27-0a412a2af476','2020-04-09 06:13:25.433288','has followed you',0,'follow','','323',17,3,0),('3a62fec0-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:56.396255','liked your post',0,'like','','76',37,2,0),('3a84868a-8f9b-11ea-ad27-0a412a2af476','2020-05-06 13:12:25.264597','liked your post',0,'like','','51',43,3,0),('3bcd8dac-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:18:58.772075','liked your post',0,'like','','76',37,2,0),('3d406ad8-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:19:01.202792','liked your post',0,'like','','76',37,2,0),('3dcf4b46-9472-11ea-ad27-0a412a2af476','2020-05-12 17:01:37.235861','liked your post',0,'like','','58',43,3,0),('3ec375e4-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:19:03.739131','liked your post',0,'like','','76',37,2,0),('416ce816-b1d3-11ea-ad27-0a412a2af476','2020-06-19 02:19:08.205147','liked your post',0,'like','','76',37,2,0),('4873b7fc-74f7-11ea-ad27-0a412a2af476','2020-04-02 15:33:20.943612','liked your post',0,'like','','5',18,29,0),('4a02c590-74f7-11ea-ad27-0a412a2af476','2020-04-02 15:33:23.551234','liked your post',0,'like','','5',18,29,0),('4a36c8a6-ba82-11ea-ad27-0a412a2af476','2020-06-30 03:32:14.179795','liked your post',0,'like','','27',29,2,0),('4c3d724c-74f7-11ea-ad27-0a412a2af476','2020-04-02 15:33:27.301912','liked your post',0,'like','','5',18,29,0),('4f5ac26a-a4f7-11ea-ad27-0a412a2af476','2020-06-02 17:34:28.341035','has followed you',0,'follow','','448',36,37,0),('50a00aae-98bd-11ea-ad27-0a412a2af476','2020-05-18 04:09:05.709179','has followed you',0,'follow','','445',22,3,0),('512ec77a-b6af-11ea-ad27-0a412a2af476','2020-06-25 06:44:28.573224','liked your post',0,'like','','73',28,29,0),('520a9cc8-7cda-11ea-ad27-0a412a2af476','2020-04-12 16:26:10.932273','liked your post',0,'like','','33',42,3,0),('544ea416-7cda-11ea-ad27-0a412a2af476','2020-04-12 16:26:14.727739','liked your post',0,'like','','33',42,3,0),('5664f908-7cda-11ea-ad27-0a412a2af476','2020-04-12 16:26:18.235287','liked your post',0,'like','','33',42,3,0),('585ab4a4-9d6a-11ea-ad27-0a412a2af476','2020-05-24 02:57:46.261892','has followed you',0,'follow','','446',37,3,0),('59050328-8f82-11ea-ad27-0a412a2af476','2020-05-06 10:14:19.020061','liked your post',0,'like','','50',14,3,0),('591eab7c-ba82-11ea-ad27-0a412a2af476','2020-06-30 03:32:39.187696','liked your post',0,'like','','27',29,2,0),('59781710-9698-11ea-ad27-0a412a2af476','2020-05-15 10:39:26.840528','Accept your order',0,'Order Accept','','257',30,27,257),('5ff993f4-7549-11ea-ad27-0a412a2af476','2020-04-03 01:20:58.605314','Sam Costich has placed an order',1,'order place','','4',16,37,181),('5ff993f5-7549-11ea-ad27-0a412a2af476','2020-04-03 01:20:58.605314','Sam Costich has placed an order',1,'order place','','4',16,37,182),('6147899c-8f7e-11ea-ad27-0a412a2af476','2020-05-06 09:45:54.889257','liked your post',0,'like','','46',37,3,0),('6393b6d2-79b5-11ea-ad27-0a412a2af476','2020-04-08 16:24:15.485278','has followed you',0,'follow','','320',34,3,0),('65398756-7a45-11ea-ad27-0a412a2af476','2020-04-09 09:35:05.778816','has followed you',0,'follow','','324',41,3,0),('65a84758-79b5-11ea-ad27-0a412a2af476','2020-04-08 16:24:18.975609','has followed you',0,'follow','','321',16,3,0),('66fb60a0-7a45-11ea-ad27-0a412a2af476','2020-04-09 09:35:08.716110','has followed you',0,'follow','','325',41,3,0),('68df5da4-7a45-11ea-ad27-0a412a2af476','2020-04-09 09:35:11.898851','has followed you',0,'follow','','326',41,3,0),('6964ed9c-7d7f-11ea-ad27-0a412a2af476','2020-04-13 12:07:57.072668','has followed you',0,'follow','','392',44,3,0),('71bbc528-ba98-11ea-ad27-0a412a2af476','2020-06-30 06:10:49.410529','liked your post',0,'like','','65',37,2,0),('734aeb94-ba98-11ea-ad27-0a412a2af476','2020-06-30 06:10:52.026543','liked your post',0,'like','','65',37,2,0),('734aeb95-ba98-11ea-ad27-0a412a2af476','2020-06-30 06:10:53.865572','liked your post',0,'like','','65',37,2,0),('766f5284-79b5-11ea-ad27-0a412a2af476','2020-04-08 16:24:46.363861','Sunny Kunar has placed an order',0,'order place','','4',16,3,216),('77180656-7d82-11ea-ad27-0a412a2af476','2020-04-13 12:29:48.546961','has followed you',0,'follow','','394',18,3,0),('798fdd86-781a-11ea-ad27-0a412a2af476','2020-04-06 15:22:49.202810','has followed you',0,'follow','','305',34,3,0),('8126eb43-7a57-11ea-ad27-0a412a2af476','2020-04-09 11:44:42.837840','One Zero Nine has placed an order',0,'order place','','25',27,30,251),('855b0f52-8871-11ea-ad27-0a412a2af476','2020-04-27 10:26:13.819799','liked your post',0,'like','','4',16,2,0),('8b76a368-a934-11ea-ad27-0a412a2af476','2020-06-08 03:02:53.137995','liked your post',0,'like','','76',37,29,0),('8c67c686-7a03-11ea-ad27-0a412a2af476','2020-04-09 01:43:44.119380','Sunny Kunar has placed an order',0,'order place','','34',42,3,217),('8c67c687-7a03-11ea-ad27-0a412a2af476','2020-04-09 01:43:44.119380','Sunny Kunar has placed an order',0,'order place','','34',42,3,218),('8c67c688-7a03-11ea-ad27-0a412a2af476','2020-04-09 01:43:44.119380','Sunny Kunar has placed an order',0,'order place','','34',42,3,219),('8d08977e-7561-11ea-ad27-0a412a2af476','2020-04-03 04:14:02.660977','liked your post',1,'like','','14',27,29,0),('8d84def2-7740-11ea-ad27-0a412a2af476','2020-04-05 13:22:52.408743','liked your post',0,'like','','4',16,29,0),('8de67044-7737-11ea-ad27-0a412a2af476','2020-04-05 12:18:27.567322','has followed you',0,'follow','','301',36,37,0),('8e65c6f2-7e51-11ea-ad27-0a412a2af476','2020-04-14 13:12:13.455792','liked your post',0,'like','','35',30,3,0),('91a7fa1c-8ade-11ea-ad27-0a412a2af476','2020-04-30 12:31:51.915810','has followed you',0,'follow','','433',22,14,0),('935a2606-7cc3-11ea-ad27-0a412a2af476','2020-04-12 13:43:22.081312','has followed you',0,'follow','','388',40,3,0),('942aad08-7561-11ea-ad27-0a412a2af476','2020-04-03 04:14:14.617898','liked your post',1,'like','','14',27,29,0),('989691ae-8f97-11ea-ad27-0a412a2af476','2020-05-06 12:46:25.101645','liked your post',0,'like','','51',43,3,0),('994e8a0c-8fa1-11ea-ad27-0a412a2af476','2020-05-06 13:58:01.264308','liked your post',0,'like','','47',37,3,0),('9965bd64-ba97-11ea-ad27-0a412a2af476','2020-06-30 06:04:46.448330','liked your post',0,'like','','65',37,2,0),('9a8bf7a0-7549-11ea-ad27-0a412a2af476','2020-04-03 01:22:36.921778','Sam Costich has placed an order',0,'order place','','8',22,37,183),('9c7ef2ec-98f3-11ea-ad27-0a412a2af476','2020-05-18 10:37:45.821929','liked your post',0,'like','','58',43,3,0),('9e276be0-a7a0-11ea-ad27-0a412a2af476','2020-06-06 02:51:27.817610','has followed you',0,'follow','','450',37,29,0),('9f829ff0-7e51-11ea-ad27-0a412a2af476','2020-04-14 13:12:42.177378','has followed you',0,'follow','','395',44,3,0),('9fcfa0d8-b5bb-11ea-ad27-0a412a2af476','2020-06-24 01:40:03.286829','liked your post',0,'like','','4',16,29,0),('a031da20-7bee-11ea-ad27-0a412a2af476','2020-04-11 12:19:00.813658','has followed you',0,'follow','','385',27,3,0),('a03c87ee-a7a0-11ea-ad27-0a412a2af476','2020-06-06 02:51:31.311296','has followed you',0,'follow','','451',37,29,0),('a0f4acda-7bee-11ea-ad27-0a412a2af476','2020-04-11 12:19:02.100978','has followed you',0,'follow','','386',42,3,0),('a1b0b6ec-8f98-11ea-ad27-0a412a2af476','2020-05-06 12:53:49.869456','liked your post',0,'like','','50',14,3,0),('a23246ec-a7a0-11ea-ad27-0a412a2af476','2020-06-06 02:51:34.599544','has followed you',0,'follow','','452',37,29,0),('a3a608be-af08-11ea-ad27-0a412a2af476','2020-06-15 13:03:42.834477','liked your post',0,'like','','37',3,2,0),('a45a32f6-749a-11ea-ad27-0a412a2af476','2020-04-02 04:30:11.924595','has followed you',0,'follow','','269',34,14,0),('a4ea7186-98f3-11ea-ad27-0a412a2af476','2020-05-18 10:37:59.948311','liked your post',0,'like','','58',43,3,0),('a74c07d2-749a-11ea-ad27-0a412a2af476','2020-04-02 04:30:16.874832','has followed you',0,'follow','','270',34,14,0),('a7601c12-a60f-11ea-ad27-0a412a2af476','2020-06-04 03:01:15.098619','liked your post',0,'like','','76',37,10,0),('aa0df6ca-a58b-11ea-ad27-0a412a2af476','2020-06-03 11:16:26.025988','liked your post',0,'like','','74',32,10,0),('ac6b25fa-a58b-11ea-ad27-0a412a2af476','2020-06-03 11:16:29.977212','liked your post',0,'like','','74',32,10,0),('ad86c698-7a60-11ea-ad27-0a412a2af476','2020-04-09 12:50:23.492002','liked your post',0,'like','','35',30,3,0),('afdfaa92-8f94-11ea-ad27-0a412a2af476','2020-05-06 12:25:35.674928','liked your post',0,'like','','51',43,3,0),('afe638aa-7737-11ea-ad27-0a412a2af476','2020-04-05 12:19:24.618908','liked your post',0,'like','','19',36,3,0),('b3edebc8-7737-11ea-ad27-0a412a2af476','2020-04-05 12:19:31.380266','liked your post',0,'like','','19',36,3,0),('b4a062d3-7a5a-11ea-ad27-0a412a2af476','2020-04-09 12:07:37.713149','One Zero Nine has placed an order',0,'order place','','25',27,30,256),('b4b3c30a-7e3c-11ea-ad27-0a412a2af476','2020-04-14 10:42:58.299669','liked your post',0,'like','','35',30,3,0),('b7c2b690-884c-11ea-ad27-0a412a2af476','2020-04-27 06:02:47.006973','has followed you',0,'follow','','420',42,2,0),('b8cef1c4-7407-11ea-ad27-0a412a2af476','2020-04-01 10:58:30.234997','has followed you',0,'follow','','157',18,16,0),('b96330a4-8f7e-11ea-ad27-0a412a2af476','2020-05-06 09:48:22.712148','has followed you',0,'follow','','439',40,3,0),('bd6b84e8-a492-11ea-ad27-0a412a2af476','2020-06-02 05:34:32.991399',' has placed an order',0,'order place','','65',37,3,292),('beb85d50-7ccc-11ea-ad27-0a412a2af476','2020-04-12 14:49:00.311354','has followed you',0,'follow','','389',34,3,0),('c25462ae-7a21-11ea-ad27-0a412a2af476','2020-04-09 05:20:00.099867','liked your post',0,'like','','34',42,14,0),('c69d8eea-8fa1-11ea-ad27-0a412a2af476','2020-05-06 13:59:17.290279','liked your post',0,'like','','54',43,3,0),('c702e7ae-7949-11ea-ad27-0a412a2af476','2020-04-08 03:33:56.661614','has followed you',0,'follow','','308',16,42,0),('ca2b4674-a4be-11ea-ad27-0a412a2af476','2020-06-02 10:49:53.075422','liked your post',0,'like','','65',37,27,0),('cab5961c-8f92-11ea-ad27-0a412a2af476','2020-05-06 12:12:01.697576','liked your post',0,'like','','51',43,3,0),('cb1fbdd4-789b-11ea-ad27-0a412a2af476','2020-04-07 06:48:31.129815','liked your post',1,'like','','25',27,29,0),('d22f92ea-7a56-11ea-ad27-0a412a2af476','2020-04-09 11:39:50.029598','has followed you',1,'follow','','341',30,14,0),('d8d77e14-9d74-11ea-ad27-0a412a2af476','2020-05-24 04:12:56.794744','liked your post',0,'like','','17',36,3,0),('db38ab24-a274-11ea-ad27-0a412a2af476','2020-05-30 12:55:36.601562','has followed you',0,'follow','','447',44,3,0),('de94b2dc-9698-11ea-ad27-0a412a2af476','2020-05-15 10:43:10.162049','Accept your order',0,'Order Accept','','256',30,27,256),('e6b7fa14-8ecd-11ea-ad27-0a412a2af476','2020-05-05 12:42:37.833661','liked your post',0,'like','','50',14,3,0),('e8eea7a0-a55d-11ea-ad27-0a412a2af476','2020-06-03 05:48:54.667504','liked your post',0,'like','','76',37,29,0),('e9a905ba-a557-11ea-ad27-0a412a2af476','2020-06-03 05:05:58.904501','Accept your order',0,'Order Accept','','292',3,37,292),('ea3e8e32-9698-11ea-ad27-0a412a2af476','2020-05-15 10:43:29.731741','Accept your order',0,'Order Accept','','255',30,27,255),('ea8543f0-789c-11ea-ad27-0a412a2af476','2020-04-07 06:56:33.301840','has followed you',0,'follow','','306',18,29,0),('ec4bd2fa-7949-11ea-ad27-0a412a2af476','2020-04-08 03:34:59.215339','has followed you',0,'follow','','309',41,42,0),('ec4dfdfa-b6de-11ea-ad27-0a412a2af476','2020-06-25 12:25:15.170997','liked your post',0,'like','','78',37,2,0),('ee0aeeb4-b6de-11ea-ad27-0a412a2af476','2020-06-25 12:25:18.077253','liked your post',0,'like','','78',37,2,0),('f174d024-7548-11ea-ad27-0a412a2af476','2020-04-03 01:17:52.918155','Sam Costich has placed an order',1,'order place','','14',27,37,180),('f4802a4e-af08-11ea-ad27-0a412a2af476','2020-06-15 13:05:58.471925','has followed you',0,'follow','','453',18,2,0),('f6cf9fd8-7a5a-11ea-ad27-0a412a2af476','2020-04-09 12:09:28.879815','One Zero Nine has placed an order',0,'order place','','24',27,30,260);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_time` datetime(6) NOT NULL,
  `refund_transaction_id` varchar(255) NOT NULL,
  `refund_time` datetime(6) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderdetail_address_id_f2456886_fk_addresses_id` (`address_id`),
  KEY `orderdetail_user_id_aa74ebaf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orderdetail_address_id_f2456886_fk_addresses_id` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orderdetail_user_id_aa74ebaf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (9,989.00,'PLACED','ch_1GQ6aoCNOO38bx2iVh1ekXQm','2020-03-24 06:50:30.782708','','2020-03-24 06:50:30.783154',7,22),(10,12.08,'PLACED','ch_1GQDixCNOO38bx2islJRzAhi','2020-03-24 14:27:23.988278','','2020-03-24 14:27:23.988769',16,3),(11,33.00,'PLACED','ch_1GQDkDCNOO38bx2i9leYv1Mm','2020-03-24 14:28:41.846851','','2020-03-24 14:28:41.847195',16,3),(12,670.00,'PLACED','ch_1GQDtjCNOO38bx2isJES2JEA','2020-03-24 14:38:31.557321','','2020-03-24 14:38:31.557663',16,3),(13,1882.11,'PLACED','ch_1GQDzfCNOO38bx2iXNdWL1f8','2020-03-24 14:44:40.212568','','2020-03-24 14:44:40.212922',16,3),(14,12.08,'PLACED','ch_1GQE6vCNOO38bx2iaWWDvZjX','2020-03-24 14:52:09.587094','','2020-03-24 14:52:09.587458',16,3),(15,24.16,'PLACED','ch_1GQE8gCNOO38bx2ixYA5XEOl','2020-03-24 14:53:59.293171','','2020-03-24 14:53:59.293529',16,3),(16,24.16,'PLACED','ch_1GQE9RCNOO38bx2iiIOi8HoE','2020-03-24 14:54:46.332705','','2020-03-24 14:54:46.333063',16,3),(17,1882.11,'PLACED','ch_1GQEL1CNOO38bx2ijYa86lnR','2020-03-24 15:06:44.346672','','2020-03-24 15:06:44.347037',16,3),(18,12.08,'PLACED','ch_1GQENSCNOO38bx2iFr4090x0','2020-03-24 15:09:14.763574','','2020-03-24 15:09:14.763929',16,3),(19,12.08,'PLACED','ch_1GQESRCNOO38bx2iBpHOpyln','2020-03-24 15:14:23.552735','','2020-03-24 15:14:23.553085',16,3),(20,12.08,'PLACED','ch_1GQEUTCNOO38bx2iXaFbwzFd','2020-03-24 15:16:29.507261','','2020-03-24 15:16:29.507618',16,3),(21,12.08,'PLACED','ch_1GQEWTCNOO38bx2i48O6ELS2','2020-03-24 15:18:34.192379','','2020-03-24 15:18:34.192740',16,3),(22,670.00,'PLACED','ch_1GQEbCCNOO38bx2iPwaxImIu','2020-03-24 15:23:26.986128','','2020-03-24 15:23:26.986490',16,3),(23,1120.16,'PLACED','ch_1GQEitCNOO38bx2iiAiuAcdh','2020-03-24 15:31:24.131255','','2020-03-24 15:31:24.131607',16,3),(24,548.00,'PLACED','ch_1GQFI7CNOO38bx2i4NQrrnIV','2020-03-24 16:07:47.644367','','2020-03-24 16:07:47.644728',16,3),(25,24.16,'PLACED','ch_1GQFRrCNOO38bx2irs2CJBS4','2020-03-24 16:17:51.736048','','2020-03-24 16:17:51.736402',16,3),(26,12.08,'PLACED','ch_1GQFY0CNOO38bx2ilKbZhqPZ','2020-03-24 16:24:12.500139','','2020-03-24 16:24:12.500490',16,3),(27,12.08,'PLACED','ch_1GQFahCNOO38bx2i8FASSQFQ','2020-03-24 16:27:00.018443','','2020-03-24 16:27:00.018834',16,3),(28,24.16,'PLACED','ch_1GQFcQCNOO38bx2iJhLhqJfA','2020-03-24 16:28:46.575661','','2020-03-24 16:28:46.576020',16,3),(29,12.08,'PLACED','ch_1GQFinCNOO38bx2imCxP8QZA','2020-03-24 16:35:22.446810','','2020-03-24 16:35:22.447158',16,3),(30,1644.00,'PLACED','ch_1GQFkVCNOO38bx2itB0HKv0p','2020-03-24 16:37:07.976040','','2020-03-24 16:37:07.976389',16,3),(31,24.16,'PLACED','ch_1GQForCNOO38bx2iRuU4GypZ','2020-03-24 16:41:37.920073','','2020-03-24 16:41:37.920427',16,3),(32,12.08,'PLACED','ch_1GQFvZCNOO38bx2iiM4KQ4J2','2020-03-24 16:48:34.184007','','2020-03-24 16:48:34.184372',16,3),(33,24.16,'PLACED','ch_1GQFwWCNOO38bx2iIjAB5Meh','2020-03-24 16:49:33.454426','','2020-03-24 16:49:33.454795',16,3),(34,46.65,'PLACED','ch_1GQPCyCNOO38bx2iko2F8Biy','2020-03-25 02:43:08.869515','','2020-03-25 02:43:08.869859',15,14),(35,24.16,'PLACED','ch_1GQQJyCNOO38bx2iuDrC1kGL','2020-03-25 03:54:26.542559','','2020-03-25 03:54:26.542912',16,3),(36,33.00,'PLACED','ch_1GQQPHCNOO38bx2i163vgZuz','2020-03-25 03:59:55.904359','','2020-03-25 03:59:55.904700',16,3),(37,1200.03,'PLACED','ch_1GQQPxCNOO38bx2iaoUyOdzj','2020-03-25 04:00:38.034267','','2020-03-25 04:00:38.034643',16,3),(38,13808.70,'PLACED','ch_1GQQaMCNOO38bx2ig2osbcvv','2020-03-25 04:11:23.380592','','2020-03-25 04:11:23.380954',15,14),(39,173.25,'PLACED','ch_1GQQbqCNOO38bx2il2AeSKf6','2020-03-25 04:12:54.706637','','2020-03-25 04:12:54.706992',15,14),(40,69.30,'PLACED','ch_1GQQd8CNOO38bx2iwMUo40Ue','2020-03-25 04:14:14.717307','','2020-03-25 04:14:14.717671',15,14),(41,12.00,'PLACED','ch_1GQQfVCNOO38bx2iLIqZVP4o','2020-03-25 04:16:41.642438','','2020-03-25 04:16:41.642778',15,14),(42,24.16,'PLACED','ch_1GQQgSCNOO38bx2iIYq00rd3','2020-03-25 04:17:40.373431','','2020-03-25 04:17:40.373814',16,3),(43,670.00,'PLACED','ch_1GQQkrCNOO38bx2ior1FORPW','2020-03-25 04:22:13.678335','','2020-03-25 04:22:13.678727',16,3),(44,12.00,'PLACED','ch_1GQR5OCNOO38bx2i1908DsjG','2020-03-25 04:43:26.508640','','2020-03-25 04:43:26.508996',15,14),(45,12.00,'PLACED','ch_1GQRC7CNOO38bx2i8Xg1TURc','2020-03-25 04:50:23.966272','','2020-03-25 04:50:23.966648',15,14),(46,12.00,'PLACED','ch_1GQRDXCNOO38bx2irwQlS1mA','2020-03-25 04:51:51.433520','','2020-03-25 04:51:51.433862',15,14),(47,12.00,'PLACED','ch_1GQRGUCNOO38bx2iFOnqHfTG','2020-03-25 04:54:55.014950','','2020-03-25 04:54:55.015287',15,14),(48,12.00,'PLACED','ch_1GQRJKCNOO38bx2iDQ23oawZ','2020-03-25 04:57:50.526268','','2020-03-25 04:57:50.526633',15,14),(49,12.00,'PLACED','ch_1GQRLMCNOO38bx2ixdWMCOck','2020-03-25 04:59:57.230325','','2020-03-25 04:59:57.230716',15,14),(50,670.00,'PLACED','ch_1GQRMbCNOO38bx2iDteG1Igr','2020-03-25 05:01:14.099980','','2020-03-25 05:01:14.100312',15,14),(51,12.00,'PLACED','ch_1GQROmCNOO38bx2iM46yqMrF','2020-03-25 05:03:29.389793','','2020-03-25 05:03:29.390135',15,14),(52,4598.90,'PLACED','ch_1GQRPjCNOO38bx2iFcZIjqlH','2020-03-25 05:04:27.421461','','2020-03-25 05:04:27.421810',15,14),(53,4598.90,'PLACED','ch_1GQRWyCNOO38bx2iIZ8vvKAu','2020-03-25 05:11:57.349667','','2020-03-25 05:11:57.350031',15,14),(54,12.00,'PLACED','ch_1GQS5rCNOO38bx2iz1feCal3','2020-03-25 05:48:00.003227','','2020-03-25 05:48:00.003659',15,14),(55,12.00,'PLACED','ch_1GQSWjCNOO38bx2iLfovZ2t2','2020-03-25 06:15:45.540927','','2020-03-25 06:15:45.541268',15,14),(56,12.00,'PLACED','ch_1GQSXrCNOO38bx2i1VVpjxm7','2020-03-25 06:16:55.421904','','2020-03-25 06:16:55.422280',15,14),(57,12.00,'PLACED','ch_1GQSZYCNOO38bx2iSfGB4mXg','2020-03-25 06:18:40.850647','','2020-03-25 06:18:40.850994',15,14),(58,12.08,'PLACED','ch_1GQSaDCNOO38bx2it5kwoWff','2020-03-25 06:19:22.215177','','2020-03-25 06:19:22.215551',16,3),(59,670.00,'PLACED','ch_1GQSb9CNOO38bx2iWjIDP3Iu','2020-03-25 06:20:19.557655','','2020-03-25 06:20:19.558116',16,3),(60,12.08,'PLACED','ch_1GQSbWCNOO38bx2i7pnDPN29','2020-03-25 06:20:42.837706','','2020-03-25 06:20:42.838070',16,3),(61,2400.00,'PLACED','ch_1GQSdrCNOO38bx2iKxjnaRVf','2020-03-25 06:23:07.628582','','2020-03-25 06:23:07.628938',16,3),(62,12.00,'PLACED','ch_1GQThYCNOO38bx2iyzLUKZ7N','2020-03-25 07:31:00.582472','','2020-03-25 07:31:00.582940',15,14),(63,12.00,'PLACED','ch_1GQTmoCNOO38bx2iOCsBnsyB','2020-03-25 07:36:27.076077','','2020-03-25 07:36:27.076542',15,14),(64,12.00,'PLACED','ch_1GQTnECNOO38bx2iynHDUUie','2020-03-25 07:36:53.069902','','2020-03-25 07:36:53.070235',15,14),(65,12.00,'PLACED','ch_1GQTq4CNOO38bx2ikKEAcU7d','2020-03-25 07:39:49.234501','','2020-03-25 07:39:49.234858',15,14),(66,12.00,'PLACED','ch_1GQTrnCNOO38bx2isiYKqfcy','2020-03-25 07:41:35.946272','','2020-03-25 07:41:35.946639',15,14),(67,12.00,'PLACED','ch_1GQTuICNOO38bx2iPIPHB5e2','2020-03-25 07:44:11.143371','','2020-03-25 07:44:11.143851',15,14),(68,12.00,'PLACED','ch_1GQU5rCNOO38bx2imAkBWlTI','2020-03-25 07:56:07.658882','','2020-03-25 07:56:07.659333',15,14),(69,12.00,'PLACED','ch_1GQUCKCNOO38bx2ib8pOts85','2020-03-25 08:02:48.949565','','2020-03-25 08:02:48.949896',15,14),(70,1200.00,'PLACED','ch_1GQkeGCNOO38bx2iBMbiugo2','2020-03-26 01:36:44.469927','','2020-03-26 01:36:44.470332',16,3),(71,1200.00,'PLACED','ch_1GQmz5CNOO38bx2iRXb6Gi6S','2020-03-26 04:06:24.237710','','2020-03-26 04:06:24.238050',16,3),(72,12.08,'PLACED','ch_1GQmzPCNOO38bx2iInK6Xzgi','2020-03-26 04:06:43.979435','','2020-03-26 04:06:43.979798',16,3),(73,12.08,'PLACED','ch_1GQmzvCNOO38bx2iakMYRPDs','2020-03-26 04:07:15.980554','','2020-03-26 04:07:15.980916',16,3),(74,2400.00,'PLACED','ch_1GQnGzCNOO38bx2imLHxedfO','2020-03-26 04:24:54.301941','','2020-03-26 04:24:54.302279',16,3),(75,1200.00,'PLACED','ch_1GQnurCNOO38bx2iwgyza4ZE','2020-03-26 05:06:06.170052','','2020-03-26 05:06:06.170433',16,3),(76,12.00,'PLACED','ch_1GQohVCNOO38bx2ihF3zUc28','2020-03-26 05:56:21.725409','','2020-03-26 05:56:21.725741',15,14),(77,12.00,'PLACED','ch_1GQpQcCNOO38bx2i7ZnKxbD2','2020-03-26 06:42:59.146477','','2020-03-26 06:42:59.146967',15,14),(78,12.00,'PLACED','ch_1GQrk7CNOO38bx2iCV2J3i1d','2020-03-26 09:11:16.366808','','2020-03-26 09:11:16.367293',15,14),(79,12.00,'PLACED','ch_1GQsV4CNOO38bx2i3rNANXNO','2020-03-26 09:59:46.406202','','2020-03-26 09:59:46.406576',15,14),(80,12.00,'PLACED','ch_1GQsxHCNOO38bx2i2TAU3ZUr','2020-03-26 10:28:55.956238','','2020-03-26 10:28:55.956663',15,14),(81,69.30,'PLACED','ch_1GQsyCCNOO38bx2iafjvKPd1','2020-03-26 10:29:52.916534','','2020-03-26 10:29:52.916914',15,14),(82,12.00,'PLACED','ch_1GQt5iCNOO38bx2idM5PopJM','2020-03-26 10:37:39.141351','','2020-03-26 10:37:39.141704',15,14),(83,4598.90,'PLACED','ch_1GQtHhCNOO38bx2iKVq7jazt','2020-03-26 10:50:02.479089','','2020-03-26 10:50:02.479442',15,14),(84,12.00,'PLACED','ch_1GQtQ1CNOO38bx2iXfO7wVjA','2020-03-26 10:58:38.363479','','2020-03-26 10:58:38.363825',15,14),(85,12.00,'PLACED','ch_1GQtSVCNOO38bx2i8Id6wg5g','2020-03-26 11:01:11.503424','','2020-03-26 11:01:11.503765',15,14),(86,1200.00,'PLACED','ch_1GQvXwCNOO38bx2ibc90Klcx','2020-03-26 13:14:57.174663','','2020-03-26 13:14:57.175108',16,3),(87,1212.08,'PLACED','ch_1GQyJLCNOO38bx2ievz1EZOI','2020-03-26 16:12:03.500318','','2020-03-26 16:12:03.500686',16,3),(88,1200.00,'PLACED','ch_1GRXgLCNOO38bx2iGADEIDGZ','2020-03-28 05:58:09.831587','','2020-03-28 05:58:09.832031',17,25),(89,12.00,'PLACED','ch_1GRZ4fCNOO38bx2ifWM0jP5S','2020-03-28 07:27:21.718718','','2020-03-28 07:27:21.719178',17,25),(90,670.00,'PLACED','ch_1GRyZwCNOO38bx2i8uJzoSDG','2020-03-29 10:41:20.731189','','2020-03-29 10:41:20.731537',18,3),(91,45.00,'PLACED','ch_1GRycSCNOO38bx2ifquT7v1L','2020-03-29 10:43:57.339484','','2020-03-29 10:43:57.339816',18,3),(92,45.00,'PLACED','ch_1GRyhtCNOO38bx2i6PaYBMKh','2020-03-29 10:49:34.599028','','2020-03-29 10:49:34.599377',18,3),(93,45.00,'PLACED','ch_1GRypXCNOO38bx2itTbjb6OK','2020-03-29 10:57:28.050221','','2020-03-29 10:57:28.050603',18,3),(94,45.00,'PLACED','ch_1GRyqECNOO38bx2ieCRMjeNn','2020-03-29 10:58:10.971984','','2020-03-29 10:58:10.972322',18,3),(95,45.00,'PLACED','ch_1GRyu0CNOO38bx2iuZTjrp9s','2020-03-29 11:02:04.837536','','2020-03-29 11:02:04.837880',18,3),(96,135.00,'PLACED','ch_1GRyxOCNOO38bx2iBMLLwxHQ','2020-03-29 11:05:34.874422','','2020-03-29 11:05:34.874773',18,3),(97,45.00,'PLACED','ch_1GRyygCNOO38bx2ibid5chn9','2020-03-29 11:06:55.137013','','2020-03-29 11:06:55.137337',18,3),(98,45.00,'PLACED','ch_1GRzGJCNOO38bx2i8YyNevCO','2020-03-29 11:25:08.037587','','2020-03-29 11:25:08.037936',18,3),(99,45.00,'PLACED','ch_1GSF5ACNOO38bx2iqge8SKNh','2020-03-30 04:18:41.122508','','2020-03-30 04:18:41.122979',18,3),(100,45.00,'PLACED','ch_1GSFIYCNOO38bx2i8BqbkS10','2020-03-30 04:32:31.312550','','2020-03-30 04:32:31.312897',18,3),(101,45.00,'PLACED','ch_1GSFOfCNOO38bx2ieTQ0sK12','2020-03-30 04:38:49.881315','','2020-03-30 04:38:49.881655',18,3),(102,548.00,'PLACED','ch_1GSGEACNOO38bx2iII1SvLGw','2020-03-30 05:32:03.310826','','2020-03-30 05:32:03.311296',15,14),(103,548.00,'PLACED','ch_1GSGJ5CNOO38bx2i6fTCeZxW','2020-03-30 05:37:07.463840','','2020-03-30 05:37:07.464208',15,14),(104,45.00,'PLACED','ch_1GSH7qCNOO38bx2iZECrFAhs','2020-03-30 06:29:35.248900','','2020-03-30 06:29:35.249345',19,34),(105,989.00,'PLACED','ch_1GSJ8fCNOO38bx2iP3J0qkek','2020-03-30 08:38:33.754973','','2020-03-30 08:38:33.755421',19,32),(106,989.00,'PLACED','ch_1GSLFyCNOO38bx2iWoQR02d4','2020-03-30 10:54:14.508323','','2020-03-30 10:54:14.508824',19,32),(107,45.00,'PLACED','ch_1GSjqmCNOO38bx2ijAWZ4NCO','2020-03-31 13:09:53.191417','','2020-03-31 13:09:53.191886',18,3),(108,666.00,'PLACED','ch_1GSyuACNOO38bx2iijCnkAMB','2020-04-01 05:14:22.653001','','2020-04-01 05:14:22.653427',18,3),(109,45.00,'PLACED','ch_1GT1JyCNOO38bx2i8GhqBavj','2020-04-01 07:49:11.133689','','2020-04-01 07:49:11.134100',18,3),(110,99.00,'PLACED','ch_1GT1KvCNOO38bx2iXXeBuf9B','2020-04-01 07:50:10.362786','','2020-04-01 07:50:10.363136',18,3),(111,4598.90,'PLACED','ch_1GT1L8CNOO38bx2i2B6kxZ0L','2020-04-01 07:50:22.713622','','2020-04-01 07:50:22.716874',15,14),(112,12.00,'PLACED','ch_1GT1X6CNOO38bx2iwJkdII01','2020-04-01 08:02:45.374498','','2020-04-01 08:02:45.374958',15,14),(113,12.00,'PLACED','ch_1GT1aYCNOO38bx2i8XHqg6rr','2020-04-01 08:06:19.251223','','2020-04-01 08:06:19.251555',15,14),(120,96.00,'PLACED','ch_1GT5p7CNOO38bx2ibztCl3ZE','2020-04-01 12:37:38.024333','','2020-04-01 12:37:38.024753',18,3),(121,1200.00,'PLACED','ch_1GT69mCNOO38bx2iTq1u4Oav','2020-04-01 12:58:58.477997','','2020-04-01 12:58:58.478467',18,3),(122,96.00,'PLACED','ch_1GT6iPCNOO38bx2i7w8IvvmH','2020-04-01 13:34:46.230248','','2020-04-01 13:34:46.230771',18,3),(123,1200.03,'PLACED','ch_1GT6lBCNOO38bx2iydDXXPzN','2020-04-01 13:37:37.818201','','2020-04-01 13:37:37.818587',18,3),(124,45.00,'PLACED','ch_1GT85eCNOO38bx2i43EoO55M','2020-04-01 15:02:50.555834','','2020-04-01 15:02:50.556303',15,14),(125,12.08,'PLACED','ch_1GT87YCNOO38bx2igfoWclKS','2020-04-01 15:04:49.081259','','2020-04-01 15:04:49.081606',18,3),(126,1200.00,'PLACED','ch_1GT8LdCNOO38bx2ilNEFKhy5','2020-04-01 15:19:21.954586','','2020-04-01 15:19:21.954940',18,3),(127,1200.00,'PLACED','ch_1GT8MVCNOO38bx2itzmhlNSJ','2020-04-01 15:20:16.426593','','2020-04-01 15:20:16.426935',18,3),(128,1200.00,'PLACED','ch_1GT8SWCNOO38bx2iAWsEcAwX','2020-04-01 15:26:29.196226','','2020-04-01 15:26:29.196530',18,3),(129,1200.00,'PLACED','ch_1GT8TqCNOO38bx2ilqPsjCur','2020-04-01 15:27:50.708657','','2020-04-01 15:27:50.709010',18,3),(130,1200.00,'PLACED','ch_1GT8lqCNOO38bx2iTDKqFSst','2020-04-01 15:46:26.730482','','2020-04-01 15:46:26.730826',18,3),(131,1200.00,'PLACED','ch_1GTLVXCNOO38bx2iTADSGA7g','2020-04-02 05:22:27.699293','','2020-04-02 05:22:27.699769',18,3),(132,1200.00,'PLACED','ch_1GTLWwCNOO38bx2inn5Wu258','2020-04-02 05:23:55.143126','','2020-04-02 05:23:55.143480',18,3),(133,2400.00,'PLACED','ch_1GTP74CNOO38bx2ixJVE79q7','2020-04-02 09:13:27.029772','','2020-04-02 09:13:27.030227',20,36),(134,12.00,'PLACED','ch_1GTQfbCNOO38bx2iOdSYS1Li','2020-04-02 10:53:11.763466','','2020-04-02 10:53:11.763915',15,14),(135,45645.00,'PLACED','ch_1GTQuXCNOO38bx2ipkXjx36H','2020-04-02 11:08:38.062586','','2020-04-02 11:08:38.062944',15,14),(136,91290.00,'PLACED','ch_1GTQw6CNOO38bx2iOWpNNosc','2020-04-02 11:10:15.325342','','2020-04-02 11:10:15.325676',15,14),(137,91290.00,'PLACED','ch_1GTR1TCNOO38bx2ioUxbHHSc','2020-04-02 11:15:47.695192','','2020-04-02 11:15:47.695644',15,14),(138,91290.00,'PLACED','ch_1GTRCtCNOO38bx2itP4WsB2o','2020-04-02 11:27:35.937775','','2020-04-02 11:27:35.938242',15,14),(139,91290.00,'PLACED','ch_1GTRRKCNOO38bx2iV3zMeDyQ','2020-04-02 11:42:30.835706','','2020-04-02 11:42:30.836214',15,14),(140,91290.00,'PLACED','ch_1GTRVXCNOO38bx2iUZN96bIF','2020-04-02 11:46:52.273259','','2020-04-02 11:46:52.273622',15,14),(141,91290.00,'PLACED','ch_1GTRelCNOO38bx2i6tayhoET','2020-04-02 11:56:23.571957','','2020-04-02 11:56:23.572417',15,14),(142,91290.00,'PLACED','ch_1GTS1zCNOO38bx2iAGjg8rKe','2020-04-02 12:20:23.599117','','2020-04-02 12:20:23.599599',18,3),(143,45.00,'PLACED','ch_1GTeAPCNOO38bx2izd41t7QO','2020-04-03 01:17:53.721027','','2020-04-03 01:17:53.721459',21,37),(144,1340.00,'PLACED','ch_1GTeDOCNOO38bx2iLgyV89AY','2020-04-03 01:20:59.140620','','2020-04-03 01:20:59.140966',21,37),(145,548.00,'PLACED','ch_1GTeEzCNOO38bx2iBnmPYrpa','2020-04-03 01:22:37.399990','','2020-04-03 01:22:37.400299',21,37),(146,1200.03,'PLACED','ch_1GUtTXCNOO38bx2iPqQCoFqT','2020-04-06 11:50:47.996556','','2020-04-06 11:50:47.997026',22,3),(147,1200.00,'PLACED','ch_1GUtUdCNOO38bx2iISYUQSWM','2020-04-06 11:51:55.475327','','2020-04-06 11:51:55.475666',22,3),(148,123.85,'PLACED','ch_1GVbqwCNOO38bx2ihhENmnVw','2020-04-08 11:13:55.204938','','2020-04-08 11:13:55.205448',22,3),(149,57.98,'PLACED','ch_1GVbxmCNOO38bx2iEFHEEJdk','2020-04-08 11:20:58.953859','','2020-04-08 11:20:58.954208',22,3),(150,1200.00,'PLACED','ch_1GVcXvCNOO38bx2iudg4tB7X','2020-04-08 11:58:20.029337','','2020-04-08 11:58:20.029815',22,3),(151,231.92,'PLACED','ch_1GVcYwCNOO38bx2i0vy9KPI0','2020-04-08 11:59:23.037340','','2020-04-08 11:59:23.037714',22,3),(152,1202.34,'PLACED','ch_1GVcfoCNOO38bx2i7F8KC5ni','2020-04-08 12:06:28.891239','','2020-04-08 12:06:28.891612',15,14),(153,12.00,'PLACED','ch_1GVcm7CNOO38bx2ib3cclYdw','2020-04-08 12:12:59.769502','','2020-04-08 12:12:59.769853',15,14),(154,34.65,'PLACED','ch_1GVcqmCNOO38bx2iXyXI4zm4','2020-04-08 12:17:48.786216','','2020-04-08 12:17:48.786634',15,14),(155,4598.90,'PLACED','ch_1GVd9OCNOO38bx2iNMme2TDQ','2020-04-08 12:37:03.287022','','2020-04-08 12:37:03.287378',15,14),(156,34.65,'PLACED','ch_1GVdB8CNOO38bx2i1EDMf5I6','2020-04-08 12:38:50.996410','','2020-04-08 12:38:50.996768',15,14),(157,12.00,'PLACED','ch_1GVdBxCNOO38bx2iUZW4aw4b','2020-04-08 12:39:41.830855','','2020-04-08 12:39:41.831219',15,14),(158,4598.90,'PLACED','ch_1GVdCqCNOO38bx2iN5CEXS4K','2020-04-08 12:40:36.557000','','2020-04-08 12:40:36.557383',15,14),(159,12.00,'PLACED','ch_1GVdIcCNOO38bx2iPTuNtv4p','2020-04-08 12:46:35.525038','','2020-04-08 12:46:35.525393',15,14),(160,4598.90,'PLACED','ch_1GVdMpCNOO38bx2iOwa7INN8','2020-04-08 12:50:55.979290','','2020-04-08 12:50:55.979665',15,14),(161,1200.00,'PLACED','ch_1GVdT6CNOO38bx2igV5iUC7h','2020-04-08 12:57:25.072929','','2020-04-08 12:57:25.073267',22,3),(162,57.98,'PLACED','ch_1GVdV6CNOO38bx2ief6SJ9yM','2020-04-08 12:59:28.534403','','2020-04-08 12:59:28.534766',22,3),(163,2003.90,'PLACED','ch_1GVdvwCNOO38bx2irdKu1QZU','2020-04-08 13:27:12.401186','','2020-04-08 13:27:12.401555',15,14),(164,150.60,'PLACED','ch_1GVe2uCNOO38bx2ismMRy4qq','2020-04-08 13:34:24.682012','','2020-04-08 13:34:24.682399',15,14),(165,670.00,'PLACED','ch_1GVghmCNOO38bx2ivxQxgw1R','2020-04-08 16:24:47.119794','','2020-04-08 16:24:47.120131',22,3),(166,168.00,'PLACED','ch_1GVpQiCNOO38bx2iqYpW8IOQ','2020-04-09 01:43:44.725013','','2020-04-09 01:43:44.725370',22,3),(167,2003.90,'PLACED','ch_1GVxlkCNOO38bx2iXT31IGlo','2020-04-09 10:38:00.597275','','2020-04-09 10:38:00.597633',15,14),(168,138.60,'PLACED','ch_1GVxmZCNOO38bx2iIk7FymMu','2020-04-09 10:38:52.112934','','2020-04-09 10:38:52.113288',15,14),(169,2003.90,'PLACED','ch_1GVxu7CNOO38bx2iMR649nLn','2020-04-09 10:46:39.888754','','2020-04-09 10:46:39.889207',15,14),(170,173.25,'PLACED','ch_1GVyALCNOO38bx2iBM8bsgeN','2020-04-09 11:03:26.215583','','2020-04-09 11:03:26.215921',15,14),(171,9197.80,'PLACED','ch_1GVyBMCNOO38bx2iwlf9JLa5','2020-04-09 11:04:29.454585','','2020-04-09 11:04:29.454935',15,14),(172,113.54,'PLACED','ch_1GVyepCNOO38bx2it6FQCMyz','2020-04-09 11:34:55.721063','','2020-04-09 11:34:55.721555',15,14),(173,277.90,'PLACED','ch_1GVyhwCNOO38bx2iADFJP04l','2020-04-09 11:38:09.472821','','2020-04-09 11:38:09.473315',23,30),(174,297.79,'PLACED','ch_1GVyoICNOO38bx2ikGdwTYtY','2020-04-09 11:44:43.558909','','2020-04-09 11:44:43.559406',23,30),(175,355.77,'PLACED','ch_1GVzATCNOO38bx2ifZ3s4Hgu','2020-04-09 12:07:38.406878','','2020-04-09 12:07:38.407335',23,30),(176,297.79,'PLACED','ch_1GVzCGCNOO38bx2iPAhj327x','2020-04-09 12:09:29.447791','','2020-04-09 12:09:29.448134',23,30),(177,9197.80,'PLACED','ch_1GWDSaCNOO38bx2iD26MDoZV','2020-04-10 03:23:16.882683','','2020-04-10 03:23:16.883181',15,14),(178,12.00,'PLACED','ch_1GWDYTCNOO38bx2i8vQfcELi','2020-04-10 03:29:22.059786','','2020-04-10 03:29:22.060137',15,14),(179,13796.70,'PLACED','ch_1GWE3KCNOO38bx2iRhT4aWOp','2020-04-10 04:01:14.488181','','2020-04-10 04:01:14.488664',15,14),(180,34.65,'PLACED','ch_1GWE3lCNOO38bx2iGwKPMrTf','2020-04-10 04:01:42.056152','','2020-04-10 04:01:42.056504',15,14),(181,12.00,'PLACED','ch_1GWEPVCNOO38bx2iEyoHjidE','2020-04-10 04:24:09.575931','','2020-04-10 04:24:09.576315',15,14),(182,45.00,'PLACED','ch_1GbHolCNOO38bx2igE0qr14R','2020-04-24 03:03:08.033034','','2020-04-24 03:03:08.033519',24,3),(183,12.08,'PLACED','ch_1GbHpBCNOO38bx2iiwfFjF5v','2020-04-24 03:03:33.530073','','2020-04-24 03:03:33.530492',24,3),(184,60.90,'PLACED','ch_1GbI4JCNOO38bx2iyImr6yW8','2020-04-24 03:19:12.248799','','2020-04-24 03:19:12.249171',24,3),(185,15.78,'PLACED','ch_1GbIooCNOO38bx2idcGco6et','2020-04-24 04:07:14.849021','','2020-04-24 04:07:14.849403',9,2),(186,60.90,'PLACED','ch_1GbJToCNOO38bx2iaQiy1E4c','2020-04-24 04:49:37.076430','','2020-04-24 04:49:37.076785',25,3),(187,14555.00,'PLACED','ch_1GbKfVCNOO38bx2iYzMdG5wN','2020-04-24 06:05:46.491700','','2020-04-24 06:05:46.492195',9,2),(188,60.90,'PLACED','ch_1GbKgjCNOO38bx2iM5focRZd','2020-04-24 06:07:01.642961','','2020-04-24 06:07:01.643331',25,3),(189,60.90,'PLACED','ch_1GbKikCNOO38bx2iMvPdeFt7','2020-04-24 06:09:07.453570','','2020-04-24 06:09:07.453923',25,3),(190,14555.00,'PLACED','ch_1GbKjtCNOO38bx2inRHJ9Oy1','2020-04-24 06:10:17.920215','','2020-04-24 06:10:17.920572',9,2),(191,14555.00,'PLACED','ch_1GbKlYCNOO38bx2iO3X3zgMS','2020-04-24 06:12:01.263306','','2020-04-24 06:12:01.263644',9,2),(192,14555.00,'PLACED','ch_1GbLIqCNOO38bx2iP5cfGRSr','2020-04-24 06:46:24.797271','','2020-04-24 06:46:24.797752',9,2),(193,14555.00,'PLACED','ch_1GbLJTCNOO38bx2iQcCrLvGO','2020-04-24 06:47:03.916643','','2020-04-24 06:47:03.917000',9,2),(194,16.00,'PLACED','ch_1Gbg0bCNOO38bx2i6UprW43p','2020-04-25 04:52:57.968041','','2020-04-25 04:52:57.968456',25,3),(195,63.78,'PLACED','ch_1Gbhz0CNOO38bx2ieUJbF5Mf','2020-04-25 06:59:27.058251','','2020-04-25 06:59:27.058746',25,3),(196,133.98,'PLACED','ch_1GbiQUCNOO38bx2ifwJ2I72x','2020-04-25 07:27:50.768971','','2020-04-25 07:27:50.769384',25,3),(197,17.35,'PLACED','ch_1GcP9nCNOO38bx2ijHnCgH0a','2020-04-27 05:05:27.951891','','2020-04-27 05:05:27.952403',9,2),(198,62.44,'PLACED','ch_1GcPQ3CNOO38bx2ibOy6v7mK','2020-04-27 05:22:15.883722','','2020-04-27 05:22:15.884077',9,2),(199,17.35,'PLACED','ch_1GcTfMCNOO38bx2iqzaGj4pF','2020-04-27 09:54:21.259482','','2020-04-27 09:54:21.259976',9,2),(200,17.36,'PLACED','ch_1GcVhACNOO38bx2isyEXSy1Q','2020-04-27 12:04:20.662938','','2020-04-27 12:04:20.663427',9,2),(201,296.03,'PLACED','ch_1GkQNNCNOO38bx2iDtbKGjeS','2020-05-19 08:00:40.314074','','2020-05-19 08:00:40.315285',9,2),(202,93130.40,'PLACED','ch_1GpSlhCNOO38bx2iMlQq5xVO','2020-06-02 05:34:33.826444','','2020-06-02 05:34:33.826894',25,3);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderpost`
--

DROP TABLE IF EXISTS `orderpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderpost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_status` varchar(255) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `post_images_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `buyer_status` varchar(255) NOT NULL,
  `seller_status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderpost_order_id_f93ba09b_fk_orderdetail_id` (`order_id`),
  KEY `orderpost_post_id_8a1b377b_fk_post_id` (`post_id`),
  KEY `orderpost_post_images_id_479505a7_fk_postimage_id` (`post_images_id`),
  KEY `orderpost_size_id_75f6fa7e_fk_size_id` (`size_id`),
  KEY `orderpost_user_id_10b6530c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orderpost_order_id_f93ba09b_fk_orderdetail_id` FOREIGN KEY (`order_id`) REFERENCES `orderdetail` (`id`),
  CONSTRAINT `orderpost_post_id_8a1b377b_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `orderpost_post_images_id_479505a7_fk_postimage_id` FOREIGN KEY (`post_images_id`) REFERENCES `postimage` (`id`),
  CONSTRAINT `orderpost_size_id_75f6fa7e_fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  CONSTRAINT `orderpost_user_id_10b6530c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderpost`
--

LOCK TABLES `orderpost` WRITE;
/*!40000 ALTER TABLE `orderpost` DISABLE KEYS */;
INSERT INTO `orderpost` VALUES (37,'2',12.08,1,'2020-03-24 16:17:51.755720',25,9,12,2,3,'-1','-1'),(38,'2',12.08,1,'2020-03-24 16:24:12.503997',26,9,12,1,3,'-1','-1'),(39,'1',12.08,1,'2020-03-24 16:27:00.022678',27,9,12,1,3,'-1','-1'),(40,'2',12.08,1,'2020-03-24 16:28:46.579617',28,9,12,1,3,'-1','-1'),(41,'2',12.08,1,'2020-03-24 16:28:46.596064',28,9,12,2,3,'-1','-1'),(42,'2',12.08,1,'2020-03-24 16:35:22.454543',29,9,12,1,3,'-1','-1'),(43,'0',548.00,1,'2020-03-24 16:37:07.980038',30,8,11,2,3,'-1','0'),(44,'0',548.00,1,'2020-03-24 16:37:08.015455',30,8,11,3,3,'-1','0'),(45,'0',548.00,1,'2020-03-24 16:37:08.023447',30,8,11,4,3,'-1','0'),(46,'2',12.08,1,'2020-03-24 16:41:37.924148',31,9,12,1,3,'-1','-1'),(47,'2',12.08,1,'2020-03-24 16:41:37.931864',31,9,12,2,3,'-1','-1'),(48,'1',12.08,1,'2020-03-24 16:48:34.187983',32,9,12,1,3,'-1','-1'),(49,'2',12.08,1,'2020-03-24 16:49:33.462191',33,9,12,1,3,'-1','-1'),(50,'1',12.08,1,'2020-03-24 16:49:33.472914',33,9,12,2,3,'-1','-1'),(51,'2',12.00,1,'2020-03-25 02:43:08.873509',34,12,15,3,14,'-1','-1'),(52,'0',34.65,1,'2020-03-25 02:43:08.892288',34,11,14,5,14,'-1','-1'),(53,'1',12.08,1,'2020-03-25 03:54:26.546579',35,9,12,1,3,'-1','-1'),(54,'0',12.08,1,'2020-03-25 03:54:26.564528',35,9,12,2,3,'-1','-1'),(55,'0',33.00,1,'2020-03-25 03:59:55.908185',36,5,4,1,3,'-1','0'),(56,'2',1200.03,1,'2020-03-25 04:00:38.042168',37,7,10,2,3,'-1','-1'),(57,'0',12.00,1,'2020-03-25 04:11:23.384558',38,12,15,3,14,'-1','-1'),(58,'1',4598.90,1,'2020-03-25 04:11:23.402729',38,10,13,1,14,'-1','-1'),(59,'0',4598.90,1,'2020-03-25 04:11:23.410238',38,10,13,2,14,'-1','-1'),(60,'0',4598.90,1,'2020-03-25 04:11:23.417311',38,10,13,3,14,'-1','-1'),(61,'0',34.65,1,'2020-03-25 04:12:54.710617',39,11,14,1,14,'-1','-1'),(62,'0',34.65,1,'2020-03-25 04:12:54.725889',39,11,14,2,14,'-1','-1'),(63,'0',34.65,1,'2020-03-25 04:12:54.733530',39,11,14,3,14,'-1','-1'),(64,'0',34.65,1,'2020-03-25 04:12:54.740689',39,11,14,4,14,'-1','-1'),(65,'0',34.65,1,'2020-03-25 04:12:54.747696',39,11,14,5,14,'-1','-1'),(66,'0',34.65,1,'2020-03-25 04:14:14.721223',40,11,14,2,14,'-1','-1'),(67,'0',34.65,1,'2020-03-25 04:14:14.728508',40,11,14,3,14,'-1','-1'),(68,'0',12.00,1,'2020-03-25 04:16:41.646306',41,12,15,3,14,'-1','-1'),(69,'1',12.08,1,'2020-03-25 04:17:40.381457',42,9,12,1,3,'-1','-1'),(70,'2',12.08,1,'2020-03-25 04:17:40.393380',42,9,12,2,3,'-1','-1'),(71,'0',670.00,1,'2020-03-25 04:22:13.682215',43,4,2,2,3,'-1','0'),(72,'0',12.00,1,'2020-03-25 04:43:26.512638',44,12,15,3,14,'-1','-1'),(73,'0',12.00,1,'2020-03-25 04:50:23.970151',45,12,15,3,14,'-1','-1'),(74,'0',12.00,1,'2020-03-25 04:51:51.437333',46,12,15,3,14,'-1','-1'),(75,'0',12.00,1,'2020-03-25 04:54:55.022684',47,12,15,3,14,'-1','-1'),(76,'-2',12.00,1,'2020-03-25 04:57:50.530086',48,12,15,3,14,'-1','-1'),(77,'0',12.00,1,'2020-03-25 04:59:57.234156',49,12,15,3,14,'-1','-1'),(78,'0',670.00,1,'2020-03-25 05:01:14.103901',50,4,2,2,14,'-1','0'),(79,'0',12.00,1,'2020-03-25 05:03:29.393727',51,12,15,3,14,'-1','-1'),(80,'0',4598.90,1,'2020-03-25 05:04:27.429852',52,10,13,1,14,'-1','-1'),(81,'0',12.00,1,'2020-03-25 05:48:00.012403',54,12,15,3,14,'-1','-1'),(82,'0',12.00,1,'2020-03-25 06:15:45.544737',55,12,15,3,14,'-1','-1'),(83,'0',12.00,1,'2020-03-25 06:16:55.425889',56,12,15,3,14,'-1','-1'),(84,'2',12.00,1,'2020-03-25 06:18:40.854506',57,12,15,3,14,'-1','-1'),(85,'1',12.08,1,'2020-03-25 06:19:22.219107',58,9,12,1,3,'-1','-1'),(86,'0',670.00,1,'2020-03-25 06:20:19.561617',59,4,2,2,3,'-1','0'),(87,'1',12.08,1,'2020-03-25 06:20:42.845670',60,9,12,1,3,'-1','-1'),(88,'2',1200.00,1,'2020-03-25 06:23:07.632563',61,13,16,3,3,'-1','-1'),(89,'1',1200.00,1,'2020-03-25 06:23:07.639958',61,13,16,4,3,'-1','-1'),(90,'1',12.00,1,'2020-03-25 07:31:00.586645',62,12,15,3,14,'-1','-1'),(91,'2',12.00,1,'2020-03-25 07:36:27.080371',63,12,15,3,14,'-1','-1'),(92,'2',12.00,1,'2020-03-25 07:39:49.238472',65,12,15,3,14,'-1','-1'),(93,'0',12.00,1,'2020-03-25 07:41:35.950077',66,12,15,3,14,'-1','-1'),(94,'2',12.00,1,'2020-03-25 07:44:11.151496',67,12,15,3,14,'-1','-1'),(95,'1',12.00,1,'2020-03-25 07:56:07.662914',68,12,15,3,14,'-1','-1'),(96,'1',12.00,1,'2020-03-25 08:02:48.953344',69,12,15,3,14,'-1','-1'),(97,'1',1200.00,1,'2020-03-26 01:36:44.474031',70,13,16,3,3,'-1','-1'),(98,'2',1200.00,1,'2020-03-26 04:06:24.241632',71,13,16,3,3,'-1','-1'),(99,'1',12.08,1,'2020-03-26 04:06:43.988976',72,9,12,1,3,'-1','-1'),(100,'1',12.08,1,'2020-03-26 04:07:15.984432',73,9,12,2,3,'-1','-1'),(101,'2',1200.00,1,'2020-03-26 04:24:54.305777',74,13,16,4,3,'-1','-1'),(102,'1',1200.00,1,'2020-03-26 04:24:54.313161',74,13,16,5,3,'-1','-1'),(103,'2',1200.00,1,'2020-03-26 05:06:06.177921',75,13,16,3,3,'-1','-1'),(104,'-2',12.00,1,'2020-03-26 05:56:21.729176',76,12,15,3,14,'-1','-1'),(105,'-2',12.00,1,'2020-03-26 06:42:59.150683',77,12,15,3,14,'-1','-1'),(106,'-2',12.00,1,'2020-03-26 09:11:16.371074',78,12,15,3,14,'-1','-1'),(107,'-2',12.00,1,'2020-03-26 09:59:46.410077',79,12,15,3,14,'-1','-1'),(108,'-2',12.00,1,'2020-03-26 10:28:55.960368',80,6,9,1,14,'-1','-1'),(109,'0',34.65,1,'2020-03-26 10:29:52.920687',81,11,14,1,14,'-1','-1'),(110,'-2',34.65,1,'2020-03-26 10:29:52.939718',81,11,14,2,14,'-1','-1'),(111,'-2',12.00,1,'2020-03-26 10:37:39.145179',82,12,15,3,14,'-1','-1'),(112,'-2',4598.90,1,'2020-03-26 10:50:02.486687',83,10,13,1,14,'-1','-1'),(113,'-2',12.00,1,'2020-03-26 10:58:38.371394',84,12,15,3,14,'-1','-1'),(114,'-2',12.00,1,'2020-03-26 11:01:11.507345',85,12,15,3,14,'-1','-1'),(115,'-2',1200.00,1,'2020-03-26 13:14:57.178757',86,13,16,3,3,'-1','-1'),(116,'-2',1200.00,1,'2020-03-26 16:12:03.504234',87,13,16,3,3,'-1','-1'),(117,'-2',12.08,1,'2020-03-26 16:12:03.511638',87,9,12,1,3,'-1','-1'),(118,'-2',1200.00,1,'2020-03-28 05:58:09.835682',88,13,16,3,25,'0','-1'),(119,'1',12.00,1,'2020-03-28 07:27:21.722963',89,12,15,3,25,'0','-1'),(120,'0',670.00,1,'2020-03-29 10:41:20.735073',90,4,3,2,3,'-1','0'),(121,'1',45.00,1,'2020-03-29 10:43:57.343297',91,14,17,1,3,'-1','0'),(122,'0',45.00,1,'2020-03-29 10:49:34.602981',92,14,17,1,3,'-1','0'),(123,'0',45.00,1,'2020-03-29 10:57:28.054120',93,14,17,1,3,'-1','0'),(124,'0',45.00,1,'2020-03-29 10:58:10.979605',94,14,17,1,3,'-1','0'),(125,'0',45.00,1,'2020-03-29 11:02:04.841473',95,14,17,1,3,'-1','0'),(126,'0',45.00,1,'2020-03-29 11:05:34.878253',96,14,17,1,3,'-1','0'),(127,'0',45.00,1,'2020-03-29 11:05:34.895898',96,14,17,3,3,'-1','0'),(128,'0',45.00,1,'2020-03-29 11:05:34.903186',96,14,17,4,3,'-1','0'),(129,'0',45.00,1,'2020-03-29 11:06:55.140793',97,14,17,1,3,'-1','0'),(130,'0',45.00,1,'2020-03-29 11:25:08.041500',98,14,17,1,3,'-1','0'),(131,'0',45.00,1,'2020-03-30 04:18:41.126603',99,14,17,1,3,'-1','0'),(132,'0',45.00,1,'2020-03-30 04:32:31.316400',100,14,17,1,3,'-1','0'),(133,'0',45.00,1,'2020-03-30 04:38:49.885291',101,14,17,1,3,'-1','0'),(134,'-2',548.00,1,'2020-03-30 05:32:03.315000',102,8,11,2,14,'-1','0'),(135,'0',548.00,1,'2020-03-30 05:37:07.467812',103,8,11,2,14,'-1','0'),(136,'0',45.00,1,'2020-03-30 06:29:35.253263',104,14,17,1,34,'0','0'),(137,'0',45.00,1,'2020-03-30 08:38:33.763460',105,14,17,4,32,'0','0'),(138,'0',45.00,1,'2020-03-31 13:09:53.195693',107,14,17,1,3,'-1','0'),(139,'0',1200.03,1,'2020-04-01 05:14:22.657296',108,7,10,3,3,'-1','-1'),(140,'0',45.00,1,'2020-04-01 07:49:11.137735',109,14,17,1,3,'-1','0'),(141,'0',4598.90,1,'2020-04-01 07:50:22.720448',111,10,13,1,14,'-1','-1'),(142,'0',12.00,1,'2020-04-01 08:02:45.378680',112,6,9,1,14,'-1','-1'),(143,'1',12.00,1,'2020-04-01 08:06:19.255069',113,6,9,1,14,'-1','-1'),(150,'1',1200.00,1,'2020-04-01 12:37:38.028672',120,13,16,3,3,'-1','-1'),(151,'1',1200.00,1,'2020-04-01 12:58:58.482166',121,13,16,3,3,'-1','-1'),(152,'1',1200.03,1,'2020-04-01 13:37:37.822175',123,7,10,1,3,'-1','-1'),(153,'0',45.00,1,'2020-04-01 15:02:50.560162',124,14,17,1,14,'-1','0'),(154,'1',12.08,1,'2020-04-01 15:04:49.085254',125,9,12,1,3,'-1','-1'),(155,'2',1200.00,1,'2020-04-01 15:19:21.958818',126,13,16,3,3,'-1','-1'),(156,'0',1200.00,1,'2020-04-01 15:20:16.430604',127,13,16,3,3,'-1','-1'),(157,'0',1200.00,1,'2020-04-01 15:26:29.199983',128,13,16,3,3,'-1','-1'),(158,'1',1200.00,1,'2020-04-01 15:27:50.712652',129,13,16,3,3,'-1','-1'),(159,'1',1200.00,1,'2020-04-01 15:46:26.738605',130,13,16,3,3,'-1','-1'),(160,'1',1200.00,1,'2020-04-02 05:22:27.703476',131,13,16,3,3,'-1','-1'),(161,'2',1200.00,1,'2020-04-02 05:23:55.147037',132,13,16,3,3,'-1','-1'),(162,'1',1200.00,1,'2020-04-02 09:13:27.033994',133,15,20,2,36,'0','-1'),(163,'-2',1200.00,1,'2020-04-02 09:13:27.319367',133,15,19,1,36,'0','-1'),(164,'1',12.00,1,'2020-04-02 10:53:11.767565',134,16,21,1,14,'-1','-1'),(165,'1',45645.00,1,'2020-04-02 11:08:38.066494',135,17,22,2,14,'-1','-1'),(166,'1',45645.00,1,'2020-04-02 11:10:15.329277',136,17,22,3,14,'-1','-1'),(167,'1',45645.00,1,'2020-04-02 11:10:15.491550',136,17,22,2,14,'-1','-1'),(168,'1',45645.00,1,'2020-04-02 11:15:47.699382',137,17,22,2,14,'-1','-1'),(169,'1',45645.00,1,'2020-04-02 11:15:47.838276',137,17,22,3,14,'-1','-1'),(170,'1',45645.00,1,'2020-04-02 11:27:35.942017',138,17,22,2,14,'-1','-1'),(171,'1',45645.00,1,'2020-04-02 11:27:36.107493',138,17,22,3,14,'-1','-1'),(172,'1',45645.00,1,'2020-04-02 11:42:30.840382',139,17,22,2,14,'-1','-1'),(173,'1',45645.00,1,'2020-04-02 11:42:31.010518',139,17,22,3,14,'-1','-1'),(174,'1',45645.00,1,'2020-04-02 11:46:52.277181',140,17,22,2,14,'-1','0'),(175,'0',45645.00,1,'2020-04-02 11:46:52.420246',140,17,22,3,14,'-1','0'),(176,'1',45645.00,1,'2020-04-02 11:56:23.576135',141,17,22,2,14,'-1','0'),(177,'0',45645.00,1,'2020-04-02 11:56:23.749084',141,17,22,3,14,'-1','0'),(178,'1',45645.00,1,'2020-04-02 12:20:23.606765',142,17,22,2,3,'-1','0'),(179,'0',45645.00,1,'2020-04-02 12:20:23.786149',142,17,22,3,3,'-1','0'),(180,'-2',45.00,1,'2020-04-03 01:17:53.725055',143,14,17,1,37,'-1','0'),(181,'-2',670.00,1,'2020-04-03 01:20:59.144523',144,4,3,3,37,'-1','0'),(182,'-2',670.00,1,'2020-04-03 01:20:59.253414',144,4,2,2,37,'-1','0'),(183,'-2',548.00,1,'2020-04-03 01:22:37.407679',145,8,11,3,37,'-1','0'),(184,'0',1200.03,1,'2020-04-06 11:50:48.000693',146,7,10,1,3,'-1','-1'),(185,'1',1200.00,1,'2020-04-06 11:51:55.479285',147,13,16,3,3,'-1','-1'),(186,'1',123.85,1,'2020-04-08 11:13:55.209211',148,25,31,2,3,'-1','0'),(187,'0',57.98,1,'2020-04-08 11:20:58.957837',149,24,30,1,3,'-1','-1'),(188,'1',1200.00,1,'2020-04-08 11:58:20.033521',150,13,16,3,3,'-1','-1'),(189,'0',57.98,1,'2020-04-08 11:59:23.041224',151,24,30,1,3,'-1','-1'),(190,'0',57.98,1,'2020-04-08 11:59:23.171888',151,24,30,2,3,'-1','-1'),(191,'0',57.98,1,'2020-04-08 11:59:23.302510',151,24,30,3,3,'-1','-1'),(192,'2',57.98,1,'2020-04-08 11:59:23.430207',151,24,30,4,3,'-1','-1'),(193,'2',400.78,1,'2020-04-08 12:06:28.895246',152,23,28,1,14,'-1','-1'),(194,'0',400.78,1,'2020-04-08 12:06:29.434831',152,23,28,2,14,'-1','-1'),(195,'0',400.78,1,'2020-04-08 12:06:29.607220',152,23,28,3,14,'-1','-1'),(196,'0',12.00,1,'2020-04-08 12:12:59.773529',153,12,15,3,14,'-1','-1'),(197,'0',34.65,1,'2020-04-08 12:17:48.790221',154,11,14,1,14,'-1','-1'),(198,'0',4598.90,1,'2020-04-08 12:37:03.290796',155,10,13,1,14,'-1','-1'),(199,'0',34.65,1,'2020-04-08 12:38:51.000223',156,11,14,1,14,'-1','-1'),(200,'0',12.00,1,'2020-04-08 12:39:41.834872',157,12,15,3,14,'-1','-1'),(201,'0',4598.90,1,'2020-04-08 12:40:36.560813',158,10,13,1,14,'-1','-1'),(202,'0',12.00,1,'2020-04-08 12:46:35.528951',159,6,9,1,14,'-1','-1'),(203,'0',4598.90,1,'2020-04-08 12:50:55.983214',160,10,13,1,14,'-1','-1'),(204,'2',1200.00,1,'2020-04-08 12:57:25.080701',161,13,16,3,3,'-1','-1'),(205,'1',57.98,1,'2020-04-08 12:59:28.538415',162,24,30,1,3,'-1','-1'),(206,'0',400.78,1,'2020-04-08 13:27:12.405298',163,23,28,1,14,'-1','-1'),(207,'0',400.78,1,'2020-04-08 13:27:12.803752',163,23,28,2,14,'-1','-1'),(208,'0',400.78,1,'2020-04-08 13:27:13.221151',163,23,28,3,14,'-1','-1'),(209,'0',400.78,1,'2020-04-08 13:27:13.382438',163,23,28,4,14,'-1','-1'),(210,'0',400.78,1,'2020-04-08 13:27:13.597166',163,23,28,5,14,'-1','-1'),(211,'0',12.00,1,'2020-04-08 13:34:24.686044',164,12,15,3,14,'-1','-1'),(212,'0',34.65,1,'2020-04-08 13:34:25.080396',164,11,14,2,14,'-1','-1'),(213,'0',34.65,1,'2020-04-08 13:34:25.246721',164,11,14,3,14,'-1','-1'),(214,'0',34.65,1,'2020-04-08 13:34:25.592981',164,11,14,4,14,'-1','-1'),(215,'0',34.65,1,'2020-04-08 13:34:25.767174',164,11,14,5,14,'-1','-1'),(216,'0',670.00,1,'2020-04-08 16:24:47.123746',165,4,2,2,3,'-1','0'),(217,'0',56.00,1,'2020-04-09 01:43:44.729302',166,34,40,1,3,'-1','0'),(218,'0',56.00,1,'2020-04-09 01:43:44.954214',166,34,40,2,3,'-1','0'),(219,'0',56.00,1,'2020-04-09 01:43:45.102457',166,34,40,3,3,'-1','0'),(220,'0',400.78,1,'2020-04-09 10:38:00.601296',167,23,28,1,14,'-1','-1'),(221,'0',400.78,1,'2020-04-09 10:38:00.987561',167,23,28,2,14,'-1','-1'),(222,'0',400.78,1,'2020-04-09 10:38:01.156890',167,23,28,3,14,'-1','-1'),(223,'0',400.78,1,'2020-04-09 10:38:01.566319',167,23,28,4,14,'-1','-1'),(224,'0',400.78,1,'2020-04-09 10:38:01.721381',167,23,28,5,14,'-1','-1'),(225,'0',34.65,1,'2020-04-09 10:38:52.117017',168,11,14,1,14,'-1','-1'),(226,'0',34.65,1,'2020-04-09 10:38:52.278161',168,11,14,2,14,'-1','-1'),(227,'0',34.65,1,'2020-04-09 10:38:52.432537',168,11,14,3,14,'-1','-1'),(228,'0',34.65,1,'2020-04-09 10:38:52.616621',168,11,14,4,14,'-1','-1'),(229,'0',400.78,1,'2020-04-09 10:46:39.892922',169,23,28,1,14,'-1','-1'),(230,'2',400.78,1,'2020-04-09 10:46:40.311098',169,23,28,2,14,'-1','-1'),(231,'0',400.78,1,'2020-04-09 10:46:40.478957',169,23,28,3,14,'-1','-1'),(232,'2',400.78,1,'2020-04-09 10:46:40.893984',169,23,28,4,14,'-1','-1'),(233,'0',400.78,1,'2020-04-09 10:46:41.064227',169,23,28,5,14,'-1','-1'),(234,'2',34.65,1,'2020-04-09 11:03:26.219580',170,11,14,1,14,'-1','-1'),(235,'2',34.65,1,'2020-04-09 11:03:26.371040',170,11,14,2,14,'-1','-1'),(236,'1',34.65,1,'2020-04-09 11:03:26.504999',170,11,14,3,14,'-1','-1'),(237,'2',34.65,1,'2020-04-09 11:03:26.636711',170,11,14,4,14,'-1','-1'),(238,'2',34.65,1,'2020-04-09 11:03:26.764676',170,11,14,5,14,'-1','-1'),(239,'2',4598.90,1,'2020-04-09 11:04:29.458444',171,10,13,1,14,'-1','-1'),(240,'0',4598.90,1,'2020-04-09 11:04:29.606746',171,10,13,2,14,'-1','-1'),(241,'1',56.77,1,'2020-04-09 11:34:55.725710',172,35,41,1,14,'-1','0'),(242,'1',56.77,1,'2020-04-09 11:34:55.870893',172,35,41,2,14,'-1','0'),(243,'0',57.98,1,'2020-04-09 11:38:09.477257',173,24,30,1,30,'0','-1'),(244,'0',57.98,1,'2020-04-09 11:38:09.480838',173,24,30,2,30,'0','-1'),(245,'0',57.98,1,'2020-04-09 11:38:09.484259',173,24,30,3,30,'0','-1'),(246,'0',57.98,1,'2020-04-09 11:38:09.487673',173,24,30,4,30,'0','-1'),(247,'1',45.98,1,'2020-04-09 11:38:09.491083',173,26,32,1,30,'0','-1'),(248,'0',57.98,1,'2020-04-09 11:44:43.563360',174,24,30,2,30,'0','-1'),(249,'0',57.98,1,'2020-04-09 11:44:43.567247',174,24,30,3,30,'0','-1'),(250,'0',57.98,1,'2020-04-09 11:44:43.570724',174,24,30,4,30,'0','-1'),(251,'0',123.85,1,'2020-04-09 11:44:43.574235',174,25,31,2,30,'0','0'),(252,'0',57.98,1,'2020-04-09 12:07:38.411065',175,24,30,1,30,'0','-1'),(253,'0',57.98,1,'2020-04-09 12:07:38.414624',175,24,30,2,30,'0','-1'),(254,'0',57.98,1,'2020-04-09 12:07:38.417973',175,24,30,3,30,'0','-1'),(255,'1',57.98,1,'2020-04-09 12:07:38.421362',175,24,30,4,30,'0','-1'),(256,'1',123.85,1,'2020-04-09 12:07:38.424715',175,25,31,2,30,'0','0'),(257,'1',123.85,1,'2020-04-09 12:09:29.453176',176,25,31,2,30,'0','0'),(258,'0',57.98,1,'2020-04-09 12:09:29.456679',176,24,30,1,30,'0','-1'),(259,'0',57.98,1,'2020-04-09 12:09:29.460165',176,24,30,2,30,'0','-1'),(260,'0',57.98,1,'2020-04-09 12:09:29.463940',176,24,30,3,30,'0','-1'),(261,'0',4598.90,1,'2020-04-10 03:23:16.886960',177,10,13,3,14,'-1','-1'),(262,'0',4598.90,1,'2020-04-10 03:23:16.894469',177,10,13,1,14,'-1','-1'),(263,'1',12.00,1,'2020-04-10 03:29:22.063621',178,12,15,3,14,'-1','-1'),(264,'0',4598.90,1,'2020-04-10 04:01:14.496589',179,10,13,1,14,'-1','-1'),(265,'0',4598.90,1,'2020-04-10 04:01:14.503488',179,10,13,2,14,'-1','-1'),(266,'0',4598.90,1,'2020-04-10 04:01:14.507287',179,10,13,4,14,'-1','-1'),(267,'0',34.65,1,'2020-04-10 04:01:42.060060',180,11,14,1,14,'-1','-1'),(268,'0',12.00,1,'2020-04-10 04:24:09.579818',181,12,15,3,14,'-1','-1'),(269,'1',45.00,1,'2020-04-24 03:03:08.037239',182,14,17,1,3,'-1','0'),(270,'0',12.08,1,'2020-04-24 03:03:33.534030',183,9,12,1,3,'-1','-1'),(271,'0',60.90,1,'2020-04-24 03:19:12.252971',184,41,47,1,3,'-1','-1'),(272,'0',15.78,1,'2020-04-24 04:07:14.853012',185,38,44,1,2,'-1','-1'),(273,'0',60.90,1,'2020-04-24 04:49:37.080281',186,41,47,1,3,'-1','-1'),(274,'1',14555.00,1,'2020-04-24 06:05:46.496018',187,42,48,1,2,'-1','-1'),(275,'1',60.90,1,'2020-04-24 06:07:01.646861',188,41,47,1,3,'-1','-1'),(276,'1',60.90,1,'2020-04-24 06:09:07.457395',189,41,47,1,3,'-1','-1'),(277,'2',14555.00,1,'2020-04-24 06:10:17.924190',190,42,48,1,2,'-1','-1'),(278,'0',14555.00,1,'2020-04-24 06:12:01.267124',191,42,48,1,2,'-1','-1'),(279,'0',14555.00,1,'2020-04-24 06:46:24.801608',192,42,50,1,2,'-1','-1'),(280,'1',14555.00,1,'2020-04-24 06:47:03.920531',193,42,49,1,2,'-1','-1'),(281,'-2',16.00,1,'2020-04-25 04:52:57.972287',194,43,53,1,3,'-1','-1'),(282,'0',57.98,1,'2020-04-25 06:59:27.062525',195,24,30,1,3,'-1','-1'),(283,'0',60.90,1,'2020-04-25 07:27:50.772969',196,41,47,1,3,'-1','-1'),(284,'0',60.90,1,'2020-04-25 07:27:50.776608',196,41,47,2,3,'-1','-1'),(285,'0',15.78,1,'2020-04-27 05:05:27.956323',197,44,54,1,2,'-1','-1'),(286,'0',56.77,1,'2020-04-27 05:22:15.887621',198,35,41,1,2,'-1','0'),(287,'0',15.78,1,'2020-04-27 09:54:21.267715',199,44,54,1,2,'-1','-1'),(288,'0',15.79,1,'2020-04-27 12:04:20.667052',200,37,43,1,2,'0','-1'),(289,'1',100.56,1,'2020-05-19 08:00:40.319016',201,63,74,1,2,'0','0'),(290,'1',100.56,1,'2020-05-19 08:00:40.327354',201,63,73,1,2,'0','0'),(291,'1',68.00,1,'2020-05-19 08:00:40.330885',201,61,71,1,2,'0','0'),(292,'1',84664.00,1,'2020-06-02 05:34:33.830971',202,65,76,2,3,'0','0');
/*!40000 ALTER TABLE `orderpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pattern`
--

DROP TABLE IF EXISTS `pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pattern` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(59) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pattern`
--

LOCK TABLES `pattern` WRITE;
/*!40000 ALTER TABLE `pattern` DISABLE KEYS */;
INSERT INTO `pattern` VALUES (1,'pattern1','/media/patternimages/43/pattrennew1.png',1,10.87),(2,'pattern2','/media/patternimages/43/pattrennew2.png',1,13.87);
/*!40000 ALTER TABLE `pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` decimal(9,2) DEFAULT NULL,
  `post_description` longtext NOT NULL,
  `total_likes` int(11) NOT NULL,
  `total_comments` int(11) NOT NULL,
  `post_status` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_user_id_e5dbe93c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `post_user_id_e5dbe93c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (4,670.00,'designed',5,0,1,'2020-03-19 04:51:20.582218',16,''),(5,33.00,'Okay',1,9,1,'2020-03-19 09:47:36.033723',18,''),(6,12.00,'Jersey  and I will have a few more hours to get to ',4,0,1,'2020-03-19 09:53:37.390959',3,''),(7,1200.03,'Adsradasdasdasd',2,2,1,'2020-03-19 10:25:35.982034',14,''),(8,548.00,'H',2,1,1,'2020-03-20 14:05:44.650342',22,''),(9,12.08,'234242424',3,0,1,'2020-03-22 04:27:11.947370',14,''),(10,4598.90,'Lamborghini car ',3,0,1,'2020-03-23 06:22:56.347676',3,''),(11,34.65,'Jordan nba star all time',3,0,1,'2020-03-23 06:25:25.432438',3,''),(12,12.00,'sddghssdjgjkfhgikjfkdfsjhfuiewyriuewrhkwf',3,0,1,'2020-03-23 06:26:08.276793',3,''),(13,1200.00,'Qweqweqeqweqweqwe',2,5,1,'2020-03-25 06:22:26.396116',14,''),(14,45.00,'red rose is the first to the point where he has',1,0,1,'2020-03-28 15:28:08.933244',27,''),(15,1200.00,'Hshshshshsz',1,0,1,'2020-04-02 09:09:24.033687',14,''),(16,12.00,'Afghan',0,0,1,'2020-04-02 10:25:33.819752',36,''),(17,45645.00,'46456',3,1,1,'2020-04-02 10:55:59.150486',36,''),(19,8888.00,'I just got to ',1,0,1,'2020-04-05 12:17:36.697420',36,''),(20,25.05,'Shaggshssh',1,0,1,'2020-04-05 13:58:05.659103',29,''),(21,284.67,'Shshhd',0,0,1,'2020-04-05 13:58:37.321928',29,''),(22,4642.45,'Shhsh did',0,0,1,'2020-04-05 13:59:14.488771',29,''),(23,400.78,'Red rose for sale',1,0,1,'2020-04-07 03:08:07.103283',3,''),(24,57.98,'mountains are in a great place',1,0,1,'2020-04-07 03:10:09.273250',14,''),(25,123.85,'Ryyu',1,2,1,'2020-04-07 03:38:40.168007',27,''),(26,45.98,'jdgfhjgfhdgfjeryuegfehjd',0,0,1,'2020-04-07 04:13:15.554934',29,''),(27,12.00,'nmbncvsgsdftrwueissas',2,0,1,'2020-04-07 04:14:47.190129',29,''),(28,34.67,'235235',0,0,1,'2020-04-07 05:54:00.874101',29,''),(29,34.45,'knbbvcdytweuygwwn',2,0,1,'2020-04-07 06:04:29.215151',29,''),(30,54454.00,'hgfehjrtwieuowjdnsb',0,0,1,'2020-04-07 09:18:42.109869',29,''),(31,45.55,'llllllllllll',0,0,1,'2020-04-07 10:35:14.528831',29,''),(32,80.88,'New T shirt for Sale !!!!!!!!!!',1,0,1,'2020-04-07 10:37:17.760464',29,''),(33,16.00,'wett',1,0,0,'2020-04-07 13:07:52.539181',42,''),(34,56.00,'7t67gy7g7',1,2,0,'2020-04-08 06:28:55.875470',42,''),(35,56.77,'oeurgdcdgfrtyuewi',1,0,1,'2020-04-09 11:34:35.284139',30,''),(36,32.76,'gfygfehghdgfehfweyhfgefgjehfge',0,0,1,'2020-04-23 10:14:29.943612',3,''),(37,15.79,'gfygfehghdgfehfweyhfgefgjehfge',1,0,1,'2020-04-23 11:25:15.690541',3,''),(38,15.78,'DFG',3,0,1,'2020-04-23 12:50:31.718056',3,''),(39,29.76,'Edwqdwed',1,0,1,'2020-04-23 13:07:58.850166',2,''),(40,40.00,'R3f3f',0,0,1,'2020-04-23 13:09:49.152706',2,''),(41,60.90,'This is custom design posting . It has square shape on T Shirt with wooden fabric.it has gray color',2,0,1,'2020-04-24 03:18:12.051288',2,''),(42,14555.00,'Erde ist nicht mehr mit der Frau zu Hause zu haben oder wie sie es hat und was ist das denn so in Ordnung wenn wir das machen und ich will das du mir die ganze Woche Zeit haben und ich will das ',1,0,1,'2020-04-24 04:51:48.566927',3,''),(43,16.00,'Qwdwqdwqdqwdqwdqw',0,0,1,'2020-04-24 09:08:18.197603',2,''),(44,15.78,'Us usually do something about it haha morning and I will start to see u tomorrow morning I will lgta next next day ',2,0,1,'2020-04-24 09:53:09.256490',3,''),(45,680.00,'Bb',0,1,1,'2020-04-27 15:31:57.785876',37,''),(46,580.00,'H',0,0,1,'2020-04-27 15:34:28.665955',37,''),(47,120.00,'Horrible ',0,1,1,'2020-04-27 15:56:07.607488',37,''),(48,412.55,'Trgftttr',0,0,1,'2020-04-30 09:46:09.981565',3,''),(49,444.00,'F',1,0,1,'2020-04-30 10:18:32.829513',3,''),(50,566.00,'QSQSQSQS',0,3,1,'2020-04-30 10:20:40.747573',14,''),(51,NULL,'promotionalpost',1,4,0,'2020-05-06 12:05:26.530236',43,'promotional'),(52,NULL,'dfsdfsdf',0,0,0,'2020-05-06 13:16:45.364316',43,'promotional'),(53,NULL,'https://material.angular.io/components/table/overview',0,0,1,'2020-05-06 13:40:58.016061',43,'promotional'),(54,NULL,'url: https://material.angular.io/components/table/overview',1,1,1,'2020-05-06 13:50:47.838528',43,'promotional'),(55,NULL,'url: https://material.angular.io/components/table/overview',1,0,1,'2020-05-06 13:50:47.849828',43,'promotional'),(56,NULL,'url: https://material.angular.io/components/table/overview  mobile:6789765678  email:abc@gmail.com',1,0,1,'2020-05-06 13:51:21.621760',43,'promotional'),(57,NULL,'email:promotion@gmail.com',0,0,1,'2020-05-07 03:43:05.373757',43,'promotional'),(58,NULL,'9789087678',1,1,1,'2020-05-07 03:53:57.675560',43,'promotional'),(59,NULL,'test',0,0,0,'2020-05-07 07:58:23.834968',43,'promotional'),(60,NULL,'rfrgthtr',0,0,0,'2020-05-07 13:01:19.263800',43,'promotional'),(61,68.00,'Qweqweqweqwe',0,0,1,'2020-05-14 11:16:32.501048',3,''),(62,NULL,'jdbgjdhf',0,0,0,'2020-05-15 13:21:12.910025',43,'promotional'),(63,100.56,'Hi there just got a new ts5y)g)y7u',0,0,1,'2020-05-19 07:56:12.182432',3,''),(64,412.55,'S$4f(j$f(ff(((gf(g(game du hast es dir doch gesagt das ich mich y6y',0,0,1,'2020-05-19 07:57:35.743695',3,''),(65,84664.00,'Bending',2,0,1,'2020-05-19 15:47:06.010052',37,''),(66,300.00,'Sadasdsad',0,0,1,'2020-06-02 11:57:38.095434',30,''),(67,670.00,'designed',0,0,1,'2020-06-02 12:25:19.345777',37,''),(68,670.00,'designed',0,0,1,'2020-06-02 12:26:40.035701',37,''),(69,670.00,'designed',0,0,1,'2020-06-02 12:29:24.495810',22,''),(70,670.00,'designed',0,0,1,'2020-06-02 12:34:52.136606',22,''),(71,121231.00,'123123',0,0,1,'2020-06-02 12:36:17.629809',25,''),(72,132.00,'12312321312',0,0,1,'2020-06-02 12:38:24.626617',25,''),(73,123.00,'Adsasdasdsadasdas',1,0,1,'2020-06-02 12:46:16.080288',28,''),(74,12321.00,'123213',0,0,1,'2020-06-02 12:52:11.714466',32,''),(75,213123.00,'the',0,0,1,'2020-06-02 12:58:42.655901',10,''),(76,858.00,'Je',3,1,1,'2020-06-02 17:33:35.182048',37,''),(77,159797.00,'Dddf',1,0,0,'2020-06-03 01:46:42.964566',29,''),(78,855.00,'BLM',0,0,1,'2020-06-09 17:58:25.893239',37,'');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcomment`
--

DROP TABLE IF EXISTS `postcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcomment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext,
  `status` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postcomment_post_id_3e8149a3_fk_post_id` (`post_id`),
  KEY `postcomment_user_id_0aef25a4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `postcomment_post_id_3e8149a3_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `postcomment_user_id_0aef25a4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcomment`
--

LOCK TABLES `postcomment` WRITE;
/*!40000 ALTER TABLE `postcomment` DISABLE KEYS */;
INSERT INTO `postcomment` VALUES (10,'Hi net set here',0,'2020-03-19 09:49:15.737529',5,3),(11,'Okay',1,'2020-03-19 09:51:37.089918',5,18),(12,'Erwiouroruweoiruoiweuroiweuroiweruoiweuroweiruoweuroweuroiweuroweurouweoruweoruweoruoweiuroweuroweuroiweuroiweuroiweuroweuroiweuroweurowueroiweuroiweuroiweuroweur',0,'2020-03-19 09:52:04.313038',5,3),(13,'09qr80r809ew890reworjelksjdflasjlkdjlasdjlaskdjlkasjdlasdjaslkdjlkasdjlkasjdaslkdjalskdjlaksdjlkasdjlaksdjlkasdjlkasdjlaksdjlkasdjlkasdjlkasdjlaksdjlaksdjlaksdjlaksdjlaksdjlkasjdlkasdjlkasjdlaksdjlaksdjlaskdjaslkdjalksdjaslkdjalskdjalksdjlaksdjlaksdjalksdjaslkdjalskdjaslkdjaslkdjaslkdjlaksdjaslkdjaslkdjalskdjaslkdjaslkdjaslkdjalskdjalskdjaslkdjalskdjaslkdjaslkdjaslkdjalskdjlaskdjalskdsj',0,'2020-03-19 09:59:33.603660',5,3),(14,'Okkk',0,'2020-03-19 10:25:49.744515',6,18),(15,'Qeqewqwe',1,'2020-03-19 10:54:58.469582',7,14),(16,'Qewrpoiewpoeriweporiwepoirpweirewirpoweporiweporiewporipweirpoweirpoweirpoweirpoweirpoweirpoweirpoweirpwoeirpoweirpoweirpoweirpoweirpwirpoweirpoweirweporiweporiweporipweoirpewirpweoirpoweirpweirpoweirpweirwer',0,'2020-03-19 10:58:45.578504',5,14),(17,'Bzzbbdbdxbbxbxxbxbxbdb a gente n\\343o tem eyeyeteyeeyeyyewyywwwuwywyeyyeyeyeueywywuwwuwyyeywywwyywyewyyeywwyywwywyeywuwueuwyywwyeyyeyeeyeyyeeyxdbxhxhzhzhzxh',1,'2020-03-19 11:00:53.030682',7,18),(18,'Dfvdfvfdvdfvdfvpjdfvdpfjvopidfjvpdfjvdf',0,'2020-03-19 11:07:49.584839',5,14),(19,'Erverververver',0,'2020-03-19 11:08:15.479889',5,14),(20,'Vevevreverveverv',0,'2020-03-19 11:08:23.662154',5,14),(21,'Ertertret',1,'2020-03-19 11:08:42.460725',5,14),(22,'Ertert',1,'2020-03-19 11:08:43.781627',5,14),(23,'Ertert',1,'2020-03-19 11:08:45.056154',5,14),(24,'Ertreter',1,'2020-03-19 11:08:46.117161',5,14),(25,'Ertertretretretre',1,'2020-03-19 11:08:48.943206',5,14),(26,'Rt0h-irt0-is-0rthi-0rthirt0-hir0-tho-0rih-0rtih0-Ruth-r0tih-r0tih-0rtih-0rtih-r0thi-0rtih-0rtih-0rtih-0rthi-0rtih-0rtih-0rthi-0rtih-0rtih-0rtih-0rthi-0rthir-t0ih-rt0ih-0rthi-0rthi-0rtih-0rtih-0rtih-0rth-0tr-0hirt-0hitr-0hirt-0hi-0rtih',1,'2020-03-19 11:09:10.151918',5,14),(27,'Hi',0,'2020-03-21 02:35:39.508943',8,2),(28,'Dhhddhhdhdhdhdhdbdbdbdhdhdhdhhddhhdhxhxxhdhdhdjdhdhdhdhdhhdjdjzzjjszjsjzjjzjzjzjzjzjzzjjsjsdjjsjssjjdjsjddjdjjssjdjjdjdjddjdjdjjddj',0,'2020-03-21 02:35:55.998921',8,2),(29,'Hi',1,'2020-03-21 03:32:36.271089',8,2),(30,'123',0,'2020-03-21 14:00:22.243120',4,3),(31,'12121212121',0,'2020-03-21 14:00:25.986536',4,3),(32,'1212121',0,'2020-03-21 14:00:28.010689',4,3),(33,'Dsasdadsadhaiuhdaudiahuidhaiudhasuidhiauhdiuadhasiudhaisuhdiuashdiuashdiuashsdiuahsdiuhasiudhasiudhasiuhdiuahdiuashdiuashdiuashdiuashdiuashdiuashdiuashduashdasidhasiudhaisudhiuashdiuashdasiudhaisuhdiuashdiuashdiuashdiuashdiasuhdiuashdiuashduiashdiuashdiuashdiuashdiuhaidhaiuhdiuashdiashdi',0,'2020-03-21 14:00:42.618448',4,3),(34,'F',0,'2020-03-21 14:00:59.987098',4,3),(35,'F',0,'2020-03-21 14:04:08.897694',8,3),(36,'F.       Ff',0,'2020-03-21 14:04:30.506819',8,3),(37,'Rrrr',0,'2020-03-21 14:05:13.160074',8,3),(38,'C',0,'2020-03-21 14:05:43.946161',8,3),(39,'Afsdfdsf',0,'2020-03-21 14:07:54.109918',7,3),(40,'Werwrwrwerw',0,'2020-03-21 14:08:14.310365',7,3),(41,'324234324234',0,'2020-03-21 14:14:34.437294',7,3),(42,'Ewrwrweerwer',0,'2020-03-21 14:28:43.370509',8,3),(43,'Retertertre',0,'2020-03-21 14:46:05.224869',8,3),(44,'Ertertret',0,'2020-03-21 14:46:07.363320',8,3),(45,'Wrrwrwer',0,'2020-03-21 14:54:26.854864',8,3),(46,'Werewrwerwerwerwrw',0,'2020-03-21 14:54:36.936598',8,3),(47,'Fsfddsfsdfs',0,'2020-03-21 14:54:39.032163',8,3),(48,'Werewrw',0,'2020-03-21 14:54:42.850270',8,3),(49,'Rwr',0,'2020-03-21 14:54:44.279292',8,3),(50,'Werewrwerwerwerw',0,'2020-03-21 14:54:46.915236',8,3),(51,'W',0,'2020-03-21 14:54:48.265985',8,3),(52,'R',0,'2020-03-21 14:54:49.365290',8,3),(53,'G',0,'2020-03-26 16:18:26.766570',4,3),(54,'2',1,'2020-03-27 13:16:00.467231',13,25),(55,'Eqwqwewqeqweqw',1,'2020-03-27 13:46:41.821237',13,25),(56,'Dqwrwerewrewrwrewrwerewrewrw',1,'2020-03-27 13:46:49.511698',13,25),(57,'3453534535',1,'2020-03-27 14:19:58.757516',5,25),(58,'Ggggggggggggggggggggggggggggggggggggggggggggg',1,'2020-03-28 08:04:00.099260',5,3),(59,'Eee',0,'2020-03-28 15:59:45.938254',14,3),(60,'U',0,'2020-03-28 15:59:50.655159',14,3),(61,'Bhzhz',0,'2020-03-28 15:59:59.149859',14,29),(62,'Hssuud',0,'2020-03-28 16:00:01.369115',14,29),(63,'H',0,'2020-03-29 08:27:41.294949',7,29),(64,'H',0,'2020-03-29 08:27:51.589365',7,29),(65,'Dfffg',1,'2020-04-01 12:26:22.498480',13,14),(66,'D',1,'2020-04-01 13:46:02.498789',13,14),(67,'Hi',0,'2020-04-02 09:06:09.293921',14,36),(68,'Jhsdgjhdgjahsgdjhasgdjhasgdjhasgdjhasgdjhagdjhasgdjhgasjhdgasjhdgasjhdgajhdgajshdgjahsgdjhasdgjhasgdjhadgjahsdgasjhdgjhasdgjhasgdjhasgdjhasgdjhasgdauysdguyiqsdgyuasuydgasuydguyasgduyasgduyasgduyasgduyasgduyasgduyasgduyagduyasgduyasgduyasgduyasgdsuyagadsuydguyasdguyasgdasuygdauyasdguyasgdasuyd',0,'2020-04-02 09:06:22.285292',14,36),(69,'Nice pic',1,'2020-04-03 01:35:23.395830',17,37),(70,'This yui',0,'2020-04-05 13:23:46.653134',4,29),(71,'G',0,'2020-04-05 13:23:52.418057',4,29),(72,'Hi Hun is your mom and I wanna is your mom dad ya want me for lunch today or do u wanna merry u I wanna love ya morning',0,'2020-04-05 13:24:09.846755',4,29),(73,'Hhgghhhhh',0,'2020-04-05 13:25:24.078693',4,29),(74,'Hi this is very first comment',0,'2020-04-07 06:05:01.052782',29,29),(75,'Ccc',1,'2020-04-07 06:48:35.789077',25,29),(76,'34412hy	fig	8wfg8ygfy8ewgfy8gfy8gfyguyfgqwuyfgwqeuygfuqywegfuyqwgfuyqgwyufgwqeuyfgqwyfgweygfywqgfyuwqgfuywqeguyfgwyufgyuwgfyuwqegfyuwqgfuyqwgfuywgfuyqwgfuywgfuywqgfyuwgfuywguyfgwqeyufgqweuyfgwequyfgwqueygfuywegfuyqwegfyuwqegefyugqweyufgqwyufgyuqwfgyuwqegfyuewgfyuwgfyuwgfygwquyfgwquyfwqyufwquyfgyugfyuweqgfuygqweuyfgweyufgweyufgyuqwgfuywqegfyueqwgfewuyqgwuygfuyweqgfywgyufgwequfgwquyfgwquyfgwquyfgwquygfyuqwgfeuwygfywqgfuywqgfyuwqgfwygfwqeyufgwquygfwqyufg3yufg3yfgyu334yfewguqywvfquwyfvuy13vfuy3vf3uy41vf13uy4fvyu3vfuyqsvfuyqvwfuyqwvuyfvqweuyfvewqfuywqvfuyvqwfuywevuyfvwqeuyfvwquyfvyuweqfvweuyfvweuyfvwqeuyfvweuyfvweuyfvweyuvfwuyqefvwuyfvewuyfvwquyfvyuwevfweuyvfuyewqvfwuyqefvwquyfvweuyvfweyufvweuyvfweuyfvewuyvfuywvfuywfvyuwevefuywevfweyuvfweuyfvuywefvweuyvfweuyf',0,'2020-04-07 08:46:21.407821',14,29),(77,'Erqwrhuwehrihqwrhqwrhqworhoquwhriuqhfiahfiuqfiuqhfiuqhfqhfiuqhfiuqhfiuqhfiuqhfiuqhifuhqiufhqiufhqiufhiuqhfiuqhfiuqhfiuqhfiuqhfiuqhfiuqhfiuqhfiuqhfiqufiuqhfiuqwhfiuqwfiuwqgfiugqiufgqwiufgqwiufgqiufgiqufgiuqfgiuqgfiuqgfiuqgfiuqgfiuqgfiuqgfiuqgfiuqufgqiufgqiufgiqufgiuqgfiuqgfiuqgfiuqgfiuqgfiuqgfiugqfiugqiufgqiufgqiufgiqfgiuqgfiuqgfiuqgfiuqgfiuqgfiuqgfiuqwgfiuqwgfiugqfiuqwgiufqgiufgqiufgqiufgqiufgiuqgfiuqwgfiuqgfiuqwgfiuqgfuiwqwfgqwiufgwqigfiuqwgfiuqwgfiuqwgfiuqf',1,'2020-04-07 10:32:52.123283',25,29),(78,'Hello my friend how is the weather been defeefeffeefpoewjf0ipjfiopejwoifhewoifhewiofhewooeifhwoifhoiqehfoiwewfew',0,'2020-04-08 03:29:42.701101',20,42),(79,'F',0,'2020-04-08 03:29:45.317432',20,42),(80,'Tretgrth98erht9u8erht98her98t89erht98erht98erht98wht98hw98tywe89ty89ewt9ewu8t9ywe89tywe98ty89ewyt89weyt89wye89tywe89ty89wety89weyt98weyt89weyt98wey98tywe98tywe98tywe98yt98weyt98weyt89yw98tywe98tywe98ty89wetywe89ty89weyt98wyt98wye98tyw98eyt98weyt89weyt89weyt89wyet98ywe89tyw89etywe89tywe89tyw98etyew98tywe89ty89weytwe89tywe89tyew89ty98ewty9w8eyt98weyt98weyt98ewyt89weyt89ewyt9ewyt98wey98ty9we8t',1,'2020-04-09 05:20:20.874693',34,14),(81,'Eqijrioejioqrjwiojrioqjiorjeioqrjqiojrioqjrioqjwkiorjqwiorjiqwojrqwiojrioqwjrioqwjrioqjwiorjqwiorjqwiorjqiojriqwjrioqwjriojqwiorjwqiorjqwiorjiowqjrioqjriojqwiorjqiorjqwoirjiqowjrioqwjrioqwjrioqjiorjqwoirjqijrioqwjrio',1,'2020-04-09 05:21:22.325769',34,14),(82,'Kdfnkdfdfwdf',0,'2020-04-09 12:50:32.762899',35,3),(83,'Psmvkosndvdsoiv snvsionvsoinvsoivnsoivnsdoivnsdoivnsionvoidsnviosnviodsvnsionvsoivnsoivnisonvoisdnviosnvdsiovnsdoivnsdoivndsovsdiovnsdiov dsnviosvnsdiovnsdiovnsdiovnsdiovnsdiovnsiovnsdoivnsdiodvndsiodvnsdoivnsdoivndsiovnsdoivnsdiovnsdoivnsiodvnsdiovniosdnviosdvnsiovnsdiovniosdvisdnvoi',0,'2020-04-09 12:50:53.949726',35,3),(84,'Zbhshshshs',0,'2020-04-10 05:37:06.526720',35,3),(85,'Hi I have',0,'2020-04-11 12:14:35.004738',32,3),(86,'We\\u2019re just got',0,'2020-04-11 12:14:37.636062',32,3),(87,'Hi I got your message',0,'2020-04-11 12:14:58.621612',32,3),(88,'Hi I got the message I got to get the kids and a few hours ago I just wanted you know I got the money and I\\u2019m not going home to go get the money and then we\\u2019re just got home we\\u2019re going home we\\u2019re just got to go home and we\\u2019re just going out and going home and then going to the gym we\\u2019re just going home and going to get home I just wanted',0,'2020-04-11 12:15:19.645259',32,3),(89,'H',0,'2020-04-11 13:44:46.524441',24,3),(90,'Hmmm hmmm what u',0,'2020-04-12 16:26:37.364214',33,3),(91,'S',0,'2020-04-27 10:30:21.746928',42,2),(92,'Aaa',0,'2020-04-27 10:30:23.049211',42,2),(93,'Nice  \\ud83d\\udc4d',1,'2020-04-28 03:04:46.099449',45,2),(94,'\\ud83d\\ude2b\\ud83e\\udd73\\ud83e\\udd73\\ud83e\\udd70\\ud83e\\udd70\\ud83e\\udd70\\ud83e\\udd70\\ud83e\\udd70',0,'2020-04-28 13:04:03.126758',47,3),(95,'Hiwoifhwehfowefhewufhweofwfiwofjwoifjweoifjwiojiowejiowejfiowjfiowjfiowefjwiofjweoifjwefweoifjoiewjfoiewjfiowejfiowejfoiewjfiowefjowiejfwoijfoiwejfiowefjiowejfiowejfiowefjoiwejfoiwejfiowejfiowejfiowejfiowejfiowifjweiofjweiofjweiofjweiofjwiofjwioefjwiofjweiojfiowejfiowejfwioejfiowfjiweojfweiofjweiofjiowejfweioeiofiowefjweoifjwioejfwiofjiowefjioewjfiowefwef',0,'2020-05-01 05:52:54.502942',49,14),(96,'Sfg',1,'2020-05-06 11:04:26.551212',50,3),(97,'3345345345',1,'2020-05-06 11:30:17.355273',50,3),(98,'Hi',1,'2020-05-06 12:25:42.543644',51,3),(99,'Ojeniuweruweirweuihriuw',1,'2020-05-06 12:25:50.891826',51,3),(100,'Qwxqwxqwwxwqxqwx',1,'2020-05-06 12:42:07.037341',51,3),(101,'Qwxqwxqwxqx',1,'2020-05-06 12:42:53.156869',51,3),(102,'Sdfdsfs',1,'2020-05-06 12:53:59.703966',50,3),(103,'ASsaSasa',1,'2020-05-06 13:58:59.688766',47,3),(104,'Asaaassa',0,'2020-05-12 17:35:18.736209',27,3),(105,'asas',0,'2020-05-12 17:35:19.818999',27,3),(106,'Asdasdasdasd',0,'2020-05-12 17:35:22.508467',27,3),(107,'scrollToItem',1,'2020-05-18 04:40:36.766693',58,3),(108,'IndexPath',0,'2020-05-18 06:28:09.208639',54,3),(109,'Beejehhe',1,'2020-06-06 07:12:21.508655',76,29),(110,'Dfsfsdfs',1,'2020-06-15 12:15:59.766320',54,10),(111,'XZxxZxZxz',0,'2020-06-19 02:19:20.122929',76,2),(112,'Sasdasdas',0,'2020-06-19 02:19:27.816682',76,2);
/*!40000 ALTER TABLE `postcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postimage`
--

DROP TABLE IF EXISTS `postimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_images` varchar(255) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `colour_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postimage_colour_id_5374f5dc_fk_colour_id` (`colour_id`),
  KEY `postimage_post_id_c22b32e1_fk_post_id` (`post_id`),
  CONSTRAINT `postimage_colour_id_5374f5dc_fk_colour_id` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`id`),
  CONSTRAINT `postimage_post_id_c22b32e1_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postimage`
--

LOCK TABLES `postimage` WRITE;
/*!40000 ALTER TABLE `postimage` DISABLE KEYS */;
INSERT INTO `postimage` VALUES (2,'/media/postimages/4/download%20(2).jpeg','2020-03-19 04:51:20.606611',3,4),(3,'/media/postimages/4/download%20(1).jpeg','2020-03-19 04:51:20.607581',4,4),(4,'/media/postimages/5/720BA52F-CFCB-45DB-90DB-1934C93D2AF8.jpeg','2020-03-19 09:47:36.049951',1,5),(5,'/media/postimages/5/50F92EC9-BFE9-406F-8C56-16F9062B9A9F.jpeg','2020-03-19 09:47:36.051132',2,5),(6,'/media/postimages/5/A99D86D1-804A-42F9-97D5-3CCD6311254E.jpeg','2020-03-19 09:47:36.052346',3,5),(7,'/media/postimages/5/3A28A4B4-2976-44DB-95E2-08C0E772C625.jpeg','2020-03-19 09:47:36.068951',3,5),(8,'/media/postimages/5/5F401D36-71F5-44AD-882A-F5EAD5D93852.jpeg','2020-03-19 09:47:36.070044',4,5),(9,'/media/postimages/6/27FFD578-E338-4DE2-8561-C381B90233C6.jpeg','2020-03-19 09:53:37.404402',2,6),(10,'/media/postimages/7/5418DA05-EE74-40F2-A82C-DD3A565AE7F6.jpeg','2020-03-19 10:25:35.996859',2,7),(11,'/media/postimages/8/BDB544BB-364A-45EE-9E91-0C0138449667.jpeg','2020-03-20 14:05:44.676149',5,8),(12,'/media/postimages/9/464FD630-AE55-4E78-B58B-3E4AA6DD706E.jpeg','2020-03-22 04:27:11.952511',4,9),(13,'/media/postimages/10/A3D3B662-A2CA-4BFA-B3B8-A0996ED06264.jpeg','2020-03-23 06:22:56.382893',5,10),(14,'/media/postimages/11/627E29E8-CB36-47F3-8F8D-6327D70A0CE4.jpeg','2020-03-23 06:25:25.450608',2,11),(15,'/media/postimages/12/271973FA-D773-4BFA-984C-8D5E98129833.jpeg','2020-03-23 06:26:08.291761',1,12),(16,'/media/postimages/13/D78343BE-E459-4F03-9651-A8FF8E696BAD.jpeg','2020-03-25 06:22:26.410960',2,13),(17,'/media/postimages/14/9D4953F2-D5AF-4DE3-A986-62B27D27103C.jpeg','2020-03-28 15:28:08.938603',2,14),(18,'/media/postimages/15/EC5ADB10-41E6-4483-8191-C27EA56BF515.jpeg','2020-04-02 09:09:24.082488',2,15),(19,'/media/postimages/15/0F42CCCF-A179-481D-86F8-BC7CE693C398.jpeg','2020-04-02 09:09:24.093162',3,15),(20,'/media/postimages/15/F97F266E-BE1C-431C-90B6-56B122A0460F.jpeg','2020-04-02 09:09:24.094456',2,15),(21,'/media/postimages/16/D1C78C28-7A38-4959-887C-ADE8296EABD0.jpeg','2020-04-02 10:25:33.835531',3,16),(22,'/media/postimages/17/D75255FD-A9EF-4C8B-A03B-4B928C8E68D9.jpeg','2020-04-02 10:55:59.155028',1,17),(24,'/media/postimages/19/1E998D7D-D982-49A7-9E06-C9E222726240.jpeg','2020-04-05 12:17:36.718944',3,19),(25,'/media/postimages/20/839BB53D-03BF-4D1D-B6E4-29F4AFA0D30E.jpeg','2020-04-05 13:58:05.682185',1,20),(26,'/media/postimages/21/0E6188AE-E9F1-4E71-A944-9C3828B5573B.jpeg','2020-04-05 13:58:37.338885',2,21),(27,'/media/postimages/22/3FEE94CF-30AE-4868-828A-FB4140E6AA19.jpeg','2020-04-05 13:59:14.511146',1,22),(28,'/media/postimages/23/08603DA4-67B7-43BE-B0F2-19276AC819EC.jpeg','2020-04-07 03:08:07.127201',5,23),(29,'/media/postimages/23/C531C153-4572-4471-86B0-DF0105464F83.jpeg','2020-04-07 03:08:07.128232',5,23),(30,'/media/postimages/24/E3616F45-FBE2-4719-95B6-8EAB914B8BE8.jpeg','2020-04-07 03:10:09.279612',2,24),(31,'/media/postimages/25/CCB677CE-E68C-4811-B6C7-5845C8EC38A5.jpeg','2020-04-07 03:38:40.211143',2,25),(32,'/media/postimages/26/B6B65BEB-0E55-4457-BDCC-650EABAA5DD3.jpeg','2020-04-07 04:13:15.560596',2,26),(33,'/media/postimages/27/B7C075E7-6BA9-4372-AB2C-B5BC86A23AE0.jpeg','2020-04-07 04:14:47.215516',4,27),(34,'/media/postimages/28/C8D1DEFA-0496-4047-AD3E-E7D8E7004613.jpeg','2020-04-07 05:54:00.880795',3,28),(35,'/media/postimages/29/B17B256F-5ED5-47AA-9754-F58D3EE1988A.jpeg','2020-04-07 06:04:29.231680',4,29),(36,'/media/postimages/30/F8F8146D-BDAF-476C-AD73-35432DACBA0B.jpeg','2020-04-07 09:18:42.131740',3,30),(37,'/media/postimages/31/E03DB2E1-3861-469E-92A3-A502E1856B41.jpeg','2020-04-07 10:35:14.534014',3,31),(38,'/media/postimages/32/B16CD1E4-B3FC-4592-8288-6CF93B08F4A6.jpeg','2020-04-07 10:37:17.766128',5,32),(39,'/media/postimages/33/2E2E7291-96DF-4F9E-85A6-67CC16CA460B.jpeg','2020-04-07 13:07:52.562226',3,33),(40,'/media/postimages/34/7F37FEFF-BDD3-4E95-9020-CF985BFB241F.jpeg','2020-04-08 06:28:55.890772',3,34),(41,'/media/postimages/35/9C943675-6A3D-425A-ABB3-523FA264D035.jpeg','2020-04-09 11:34:35.288636',3,35),(42,'/media/postimages/36/A329263C-8C52-4B1B-BD08-5AA5BA55E7B1.jpeg','2020-04-23 10:14:29.949515',2,36),(43,'/media/postimages/37/9663EBC2-B1E8-4095-85B6-07B0A44EC6C0.jpeg','2020-04-23 11:25:15.713677',2,37),(44,'/media/postimages/38/63EE60CA-42AF-424F-83C2-4FECFAE0F848.jpeg','2020-04-23 12:50:31.732839',1,38),(45,'/media/postimages/39/C277B300-8461-4C1A-B626-DB8CFC9D623A.jpeg','2020-04-23 13:07:58.853992',2,39),(46,'/media/postimages/40/BB17803A-AA9F-4E0E-B5FD-B83CCDE554AA.jpeg','2020-04-23 13:09:49.157285',3,40),(47,'/media/postimages/41/9B839C61-1B53-4BC7-9C7B-49EE1C046BF0.jpeg','2020-04-24 03:18:12.057516',3,41),(48,'/media/postimages/42/8D06846B-D2A1-460E-B695-9B2193596034.jpeg','2020-04-24 04:51:48.589933',3,42),(49,'/media/postimages/42/A279B24E-86EA-468D-818C-A488B9E23777.jpeg','2020-04-24 04:51:48.590984',4,42),(50,'/media/postimages/42/1A89318D-C4AC-4AD4-90FF-7AF19BF3C65C.jpeg','2020-04-24 04:51:48.591942',3,42),(51,'/media/postimages/42/BCCD1389-771F-40DC-AB73-AABCB877E3DA.jpeg','2020-04-24 04:51:48.593034',4,42),(52,'/media/postimages/42/811E16A9-3350-4F4D-87D6-6740A74234E9.jpeg','2020-04-24 04:51:48.593988',4,42),(53,'/media/postimages/43/402BD0CA-AEFB-4864-89D0-5382EC585629.jpeg','2020-04-24 09:08:18.213204',2,43),(54,'/media/postimages/44/F5C118C9-8366-4D2A-9B9A-D58ADCCABB03.jpeg','2020-04-24 09:53:09.261770',2,44),(55,'/media/postimages/45/4EB7F79E-2377-433C-85D1-C1D5938D87B3.jpeg','2020-04-27 15:31:57.792432',3,45),(56,'/media/postimages/46/DAB62E56-9511-4D51-B833-8C485A585017.jpeg','2020-04-27 15:34:28.689866',3,46),(57,'/media/postimages/47/88377C95-4618-4D0D-A472-5B00B6C56BD3.jpeg','2020-04-27 15:56:07.613624',3,47),(58,'/media/postimages/48/E7B7F3B5-A047-4285-91C9-F02AD585ED47.jpeg','2020-04-30 09:46:09.986626',3,48),(59,'/media/postimages/49/D20B8DA6-DD3F-4678-BE82-153DFF3042F2.jpeg','2020-04-30 10:18:32.868170',2,49),(60,'/media/postimages/50/970C203B-2AA9-4DED-B364-08ED21909ADC.jpeg','2020-04-30 10:20:40.753346',3,50),(63,'/media/postimages/26/B6B65BEB-0E55-4457-BDCC-650EABAA5DD3.jpeg','2020-05-06 11:30:40.753346',NULL,53),(64,'/media/postimages/13/D78343BE-E459-4F03-9651-A8FF8E696BAD.jpeg','2020-05-06 11:31:40.753346',NULL,54),(65,'/media/postimages/27/B7C075E7-6BA9-4372-AB2C-B5BC86A23AE0.jpeg','2020-05-06 11:31:50.753346',NULL,55),(66,'/media/postimages/22/3FEE94CF-30AE-4868-828A-FB4140E6AA19.jpeg','2020-05-06 11:41:50.753346',NULL,56),(67,'/media/postimages/57/whitehdtshirt.jpeg','2020-05-07 03:43:06.701461',NULL,57),(68,'/media/postimages/58/wool.jpeg','2020-05-07 03:53:58.732541',NULL,58),(71,'/media/postimages/61/2DE34150-6266-41DB-A530-677D7B52EC36.jpeg','2020-05-14 11:16:32.514675',3,61),(73,'/media/postimages/63/81254C90-461C-44DF-B37D-E7F40664A514.jpeg','2020-05-19 07:56:12.189180',3,63),(74,'/media/postimages/63/8C10CF87-8377-4649-9558-757FA79A4321.jpeg','2020-05-19 07:56:12.190176',1,63),(75,'/media/postimages/64/BD25C12D-2C09-46BE-A776-D1AE297B60F5.jpeg','2020-05-19 07:57:35.749578',4,64),(76,'/media/postimages/65/B92178EF-4ED8-4383-BFC2-E3EED5CEB456.jpeg','2020-05-19 15:47:06.015434',4,65),(77,'/media/postimages/66/C06D4C01-9BA2-49C2-84E0-82442B6C2D7D.jpeg','2020-06-02 11:57:38.111156',3,66),(78,'/media/postimages/67/nike.png','2020-06-02 12:25:19.350241',3,67),(79,'/media/postimages/68/nike.png','2020-06-02 12:26:40.042350',3,68),(80,'/media/postimages/69/nike.png','2020-06-02 12:29:24.500232',3,69),(81,'/media/postimages/70/nike.png','2020-06-02 12:34:52.141072',3,70),(82,'/media/postimages/71/3283C132-526C-40AB-92C6-A193C62ADAF5.jpeg','2020-06-02 12:36:17.634656',2,71),(83,'/media/postimages/72/5BAFB731-9153-47BF-BA29-E0A8D3CC0548.jpeg','2020-06-02 12:38:24.631705',3,72),(84,'/media/postimages/73/3E139532-6CA5-471F-B696-6AB93275D4E2.jpeg','2020-06-02 12:46:16.084762',3,73),(85,'/media/postimages/74/15611FDC-FB5A-45E8-8186-0382B97995BC.jpeg','2020-06-02 12:52:11.719033',2,74),(86,'/media/postimages/75/B964AA86-5CB7-4E92-BFEC-B8A3F2FE723D.jpeg','2020-06-02 12:58:42.689133',2,75),(87,'/media/postimages/76/33888CFC-893A-4CFF-A2F7-EAA81F57EABC.jpeg','2020-06-02 17:33:35.188681',5,76),(88,'/media/postimages/77/D9AB6F0F-2D20-42BD-8C55-5C2FBB97DFC7.jpeg','2020-06-03 01:46:42.970056',1,77),(89,'/media/postimages/78/D18CF3C2-4236-4738-BDB0-3055B5FD2AB6.jpeg','2020-06-09 17:58:25.898959',5,78);
/*!40000 ALTER TABLE `postimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postlike`
--

DROP TABLE IF EXISTS `postlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postlike` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `postlike_post_id_0c24c7bd_fk_post_id` (`post_id`),
  KEY `postlike_user_id_d8a42c44_fk_auth_user_id` (`user_id`),
  CONSTRAINT `postlike_post_id_0c24c7bd_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `postlike_user_id_d8a42c44_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postlike`
--

LOCK TABLES `postlike` WRITE;
/*!40000 ALTER TABLE `postlike` DISABLE KEYS */;
INSERT INTO `postlike` VALUES (4,0,'2020-03-19 10:31:15.068576',7,18),(5,0,'2020-03-19 10:31:18.817598',6,18),(6,0,'2020-03-19 10:31:21.388701',4,18),(14,0,'2020-03-22 03:59:31.397901',8,2),(21,0,'2020-03-23 09:57:33.555141',6,14),(29,0,'2020-03-26 16:18:04.377028',4,3),(78,0,'2020-03-28 05:05:19.937122',5,3),(139,0,'2020-03-30 07:35:59.390059',10,34),(147,0,'2020-03-30 08:48:19.674115',11,34),(151,0,'2020-03-30 08:48:42.304595',8,34),(153,0,'2020-03-30 08:48:58.209695',4,34),(155,0,'2020-03-30 09:47:39.596749',6,34),(168,0,'2020-03-30 10:26:41.535396',12,34),(170,0,'2020-03-30 10:54:50.275866',14,3),(177,0,'2020-03-30 12:43:54.843971',11,17),(183,0,'2020-04-01 03:38:48.134315',10,3),(188,0,'2020-04-01 09:17:08.640246',12,14),(248,0,'2020-04-01 14:22:08.140432',13,14),(249,0,'2020-04-01 14:23:02.685829',9,14),(268,0,'2020-04-02 01:55:33.629903',7,3),(277,0,'2020-04-02 05:19:25.558365',9,3),(282,0,'2020-04-02 05:42:22.527719',11,14),(285,0,'2020-04-02 05:46:59.575574',13,3),(292,0,'2020-04-02 09:09:52.626305',15,36),(296,0,'2020-04-03 01:18:07.650210',10,37),(297,0,'2020-04-03 01:18:11.032269',9,37),(298,0,'2020-04-03 01:35:17.667705',17,37),(304,0,'2020-04-03 10:28:20.363420',17,29),(308,0,'2020-04-05 11:42:25.984079',17,36),(310,0,'2020-04-05 12:19:31.381484',19,3),(312,0,'2020-04-07 06:04:49.037907',29,29),(314,0,'2020-04-07 08:45:37.985288',25,29),(315,0,'2020-04-07 10:40:25.001952',32,14),(316,0,'2020-04-08 03:29:31.967619',20,42),(318,0,'2020-04-08 10:46:52.382917',6,42),(319,0,'2020-04-09 05:20:00.101154',34,14),(321,0,'2020-04-09 11:05:16.336011',23,14),(324,0,'2020-04-09 11:32:06.889678',24,30),(326,0,'2020-04-11 11:53:31.660904',12,3),(330,0,'2020-04-12 16:26:18.236603',33,3),(334,0,'2020-04-19 14:43:12.526164',35,3),(336,0,'2020-04-23 12:01:24.332776',27,3),(341,0,'2020-04-24 03:58:15.971329',41,3),(345,0,'2020-04-24 06:04:26.335397',38,2),(351,0,'2020-04-27 10:26:13.821178',4,2),(352,0,'2020-04-27 10:37:54.358559',44,2),(353,0,'2020-04-27 12:36:07.133011',42,2),(355,0,'2020-04-30 05:03:42.554004',38,14),(357,0,'2020-04-30 06:15:43.587505',38,3),(358,0,'2020-05-01 05:52:32.201004',49,14),(359,0,'2020-05-01 06:34:26.481751',39,14),(372,0,'2020-05-06 13:12:25.265860',51,3),(373,0,'2020-05-06 13:54:53.692137',55,3),(374,0,'2020-05-06 13:55:11.085749',56,3),(376,0,'2020-05-06 13:59:17.291528',54,3),(378,0,'2020-05-11 09:44:18.277794',44,3),(382,0,'2020-05-12 14:52:49.744867',29,3),(389,0,'2020-05-30 12:56:40.215382',58,3),(390,0,'2020-06-02 06:01:11.797761',41,2),(391,0,'2020-06-02 10:49:53.076747',65,27),(395,0,'2020-06-04 03:01:15.099949',76,10),(397,0,'2020-06-05 13:18:32.674474',77,10),(399,0,'2020-06-08 03:02:53.139324',76,29),(400,0,'2020-06-15 13:03:42.835843',37,2),(412,0,'2020-06-19 02:19:08.206497',76,2),(413,0,'2020-06-24 01:40:03.288189',4,29),(414,0,'2020-06-25 06:44:28.574514',73,29),(419,0,'2020-06-30 03:32:39.189010',27,2),(423,0,'2020-06-30 06:10:53.866860',65,2);
/*!40000 ALTER TABLE `postlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reachus`
--

DROP TABLE IF EXISTS `reachus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reachus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reachus`
--

LOCK TABLES `reachus` WRITE;
/*!40000 ALTER TABLE `reachus` DISABLE KEYS */;
INSERT INTO `reachus` VALUES (1,'fgfgf','abc@gmail.com','fgfdgfdgfd','Messagefdgfdgfdgfd','gfbf','2020-04-19 09:41:15.548579'),(2,'hhhhhh','xyz@gmail.com','hh','Messagefgfdbfbcvbdfvfd','4567890123','2020-04-19 09:53:08.510930'),(3,'abc','test@gmail.com','abc','abc','2929292929','2020-04-20 03:18:13.145016'),(4,'ndvbjhd','test1@gmail.com','hdvbdhh','Messagenscbhdsgchdgfd','3434343434','2020-04-20 03:22:12.720638'),(5,'ndvbjhd','test2@gmail.com','hdvbdhh','Messagenscbhdsgchdgfd','3434343434','2020-04-20 03:22:14.700218'),(6,'hbhjsd','test3@gmail.com','shdgj','sdhgfydugydvgjd','7878787878','2020-04-20 03:23:33.587529'),(7,'jhrghuehfue','dbfjdbd@gmail.com','jvhjkfhgkfdj','Messagejvjfdhgjdfhfusgjds','jdhjdhure','2020-04-20 03:24:03.455442'),(8,'hgffgfhfg','uuytr@gmail.com','djfhfvjdfjeh','Messagecbvbhxcbvhdgchsd','4545454545','2020-04-20 03:34:42.323856'),(9,'vfhfh','dnbfdn@gmail.com','dhfhdgfhd','Messagednbfjdfjdhfj','6767676767','2020-04-20 05:57:28.981323'),(10,'Gurmukh','gurmukh@yopmail.com','Hello ','This is for testing','9876543210','2020-04-22 04:47:04.763253'),(11,'dfds','dhfh@gmail.com','hdfghd','Messagedjfbhgdf','7878787878','2020-04-22 04:53:38.617160');
/*!40000 ALTER TABLE `reachus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostclothstyle`
--

DROP TABLE IF EXISTS `relpostclothstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostclothstyle` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cloth_style_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostclothstyle_cloth_style_id_23fec1e7_fk_clothstyle_id` (`cloth_style_id`),
  KEY `relpostclothstyle_post_id_a0cbaacc_fk_post_id` (`post_id`),
  CONSTRAINT `relpostclothstyle_cloth_style_id_23fec1e7_fk_clothstyle_id` FOREIGN KEY (`cloth_style_id`) REFERENCES `clothstyle` (`id`),
  CONSTRAINT `relpostclothstyle_post_id_a0cbaacc_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostclothstyle`
--

LOCK TABLES `relpostclothstyle` WRITE;
/*!40000 ALTER TABLE `relpostclothstyle` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostclothstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostclothstylecolour`
--

DROP TABLE IF EXISTS `relpostclothstylecolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostclothstylecolour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cloth_style_colour_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostclothstylecolour_post_id_ce3be20a_fk_post_id` (`post_id`),
  KEY `relpostclothstylecol_cloth_style_colour_i_ca60f88f_fk_clothstyl` (`cloth_style_colour_id`),
  CONSTRAINT `relpostclothstylecol_cloth_style_colour_i_ca60f88f_fk_clothstyl` FOREIGN KEY (`cloth_style_colour_id`) REFERENCES `clothstylecolour` (`id`),
  CONSTRAINT `relpostclothstylecolour_post_id_ce3be20a_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostclothstylecolour`
--

LOCK TABLES `relpostclothstylecolour` WRITE;
/*!40000 ALTER TABLE `relpostclothstylecolour` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostclothstylecolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostfabric`
--

DROP TABLE IF EXISTS `relpostfabric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostfabric` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fabric_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostfabric_fabric_id_fc18f45e_fk_fabric_id` (`fabric_id`),
  KEY `relpostfabric_post_id_462f0069_fk_post_id` (`post_id`),
  CONSTRAINT `relpostfabric_fabric_id_fc18f45e_fk_fabric_id` FOREIGN KEY (`fabric_id`) REFERENCES `fabric` (`id`),
  CONSTRAINT `relpostfabric_post_id_462f0069_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostfabric`
--

LOCK TABLES `relpostfabric` WRITE;
/*!40000 ALTER TABLE `relpostfabric` DISABLE KEYS */;
INSERT INTO `relpostfabric` VALUES (4,1,4),(5,1,5),(6,3,6),(7,4,7),(8,3,8),(9,4,9),(10,3,10),(11,3,11),(12,4,12),(13,4,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(19,4,19),(20,3,20),(21,3,21),(22,4,22),(23,4,23),(24,4,24),(25,3,25),(26,4,26),(27,2,27),(28,4,28),(29,4,29),(30,2,30),(31,3,31),(32,3,32),(33,2,33),(34,3,34),(35,4,35),(36,3,36),(37,3,37),(38,2,38),(39,4,39),(40,3,40),(41,4,41),(42,3,42),(43,1,43),(44,3,44),(45,3,45),(46,2,46),(47,2,47),(48,2,48),(49,3,49),(50,3,50),(51,2,61),(52,3,63),(53,1,64),(54,3,65),(55,4,66),(56,1,67),(57,1,68),(58,1,69),(59,1,70),(60,3,71),(61,2,72),(62,3,73),(63,3,74),(64,2,75),(65,2,76),(66,2,77),(67,2,78);
/*!40000 ALTER TABLE `relpostfabric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostpattern`
--

DROP TABLE IF EXISTS `relpostpattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostpattern` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pattern_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostpattern_post_id_3c60ed59_fk_post_id` (`post_id`),
  KEY `relpostpattern_pattern_id_a11c639f_fk_pattern_id` (`pattern_id`),
  CONSTRAINT `relpostpattern_pattern_id_a11c639f_fk_pattern_id` FOREIGN KEY (`pattern_id`) REFERENCES `pattern` (`id`),
  CONSTRAINT `relpostpattern_post_id_3c60ed59_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostpattern`
--

LOCK TABLES `relpostpattern` WRITE;
/*!40000 ALTER TABLE `relpostpattern` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostpattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostsew`
--

DROP TABLE IF EXISTS `relpostsew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostsew` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sew_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostsew_post_id_786cfab9_fk_post_id` (`post_id`),
  KEY `relpostsew_sew_id_3581633f_fk_sew_id` (`sew_id`),
  CONSTRAINT `relpostsew_post_id_786cfab9_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `relpostsew_sew_id_3581633f_fk_sew_id` FOREIGN KEY (`sew_id`) REFERENCES `sew` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostsew`
--

LOCK TABLES `relpostsew` WRITE;
/*!40000 ALTER TABLE `relpostsew` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostsew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostshape`
--

DROP TABLE IF EXISTS `relpostshape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostshape` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shape_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostshape_post_id_ff5ae0ba_fk_post_id` (`post_id`),
  KEY `relpostshape_shape_id_840990db_fk_shape_id` (`shape_id`),
  CONSTRAINT `relpostshape_post_id_ff5ae0ba_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `relpostshape_shape_id_840990db_fk_shape_id` FOREIGN KEY (`shape_id`) REFERENCES `shape` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostshape`
--

LOCK TABLES `relpostshape` WRITE;
/*!40000 ALTER TABLE `relpostshape` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostshape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostshapecolour`
--

DROP TABLE IF EXISTS `relpostshapecolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostshapecolour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shape_colour_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostshapecolour_post_id_364d230f_fk_post_id` (`post_id`),
  KEY `relpostshapecolour_shape_colour_id_46c5d95b_fk_shapecolour_id` (`shape_colour_id`),
  CONSTRAINT `relpostshapecolour_post_id_364d230f_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `relpostshapecolour_shape_colour_id_46c5d95b_fk_shapecolour_id` FOREIGN KEY (`shape_colour_id`) REFERENCES `shapecolour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostshapecolour`
--

LOCK TABLES `relpostshapecolour` WRITE;
/*!40000 ALTER TABLE `relpostshapecolour` DISABLE KEYS */;
/*!40000 ALTER TABLE `relpostshapecolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relpostsize`
--

DROP TABLE IF EXISTS `relpostsize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relpostsize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `relpostsize_post_id_4b0e46de_fk_post_id` (`post_id`),
  KEY `relpostsize_size_id_ca9b9bff_fk_size_id` (`size_id`),
  CONSTRAINT `relpostsize_post_id_4b0e46de_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `relpostsize_size_id_ca9b9bff_fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relpostsize`
--

LOCK TABLES `relpostsize` WRITE;
/*!40000 ALTER TABLE `relpostsize` DISABLE KEYS */;
INSERT INTO `relpostsize` VALUES (7,4,2),(8,4,3),(9,5,1),(10,5,2),(11,5,3),(12,5,4),(13,6,1),(14,7,1),(15,7,2),(16,8,2),(17,8,3),(18,8,4),(19,9,1),(20,9,2),(21,10,1),(22,10,2),(23,10,3),(24,10,4),(25,10,5),(26,11,1),(27,11,2),(28,11,3),(29,11,4),(30,11,5),(31,12,3),(32,13,3),(33,13,4),(34,13,5),(35,14,1),(36,14,3),(37,14,4),(38,15,1),(39,15,2),(40,15,3),(41,15,4),(42,16,1),(43,16,2),(44,16,3),(45,17,2),(46,17,3),(49,19,2),(50,19,3),(51,20,1),(52,20,2),(53,20,3),(54,20,4),(55,20,5),(56,21,1),(57,21,2),(58,21,3),(59,21,4),(60,21,5),(61,22,1),(62,22,2),(63,22,3),(64,22,4),(65,22,5),(66,23,1),(67,23,2),(68,23,3),(69,23,4),(70,23,5),(71,24,1),(72,24,2),(73,24,3),(74,24,4),(75,24,5),(76,25,2),(77,25,3),(78,25,4),(79,25,5),(80,26,1),(81,26,2),(82,26,3),(83,26,4),(84,26,5),(85,27,1),(86,27,2),(87,27,3),(88,27,4),(89,27,5),(90,28,1),(91,28,2),(92,28,3),(93,28,4),(94,28,5),(95,29,1),(96,29,2),(97,29,3),(98,29,4),(99,29,5),(100,30,1),(101,30,2),(102,30,3),(103,31,1),(104,31,2),(105,31,3),(106,31,4),(107,32,1),(108,32,2),(109,32,3),(110,32,4),(111,32,5),(112,33,1),(113,33,2),(114,34,1),(115,34,2),(116,34,3),(117,35,1),(118,35,2),(119,36,1),(120,36,2),(121,36,3),(122,36,4),(123,37,1),(124,37,2),(125,37,3),(126,38,1),(127,38,2),(128,39,2),(129,40,1),(130,40,2),(131,41,1),(132,41,2),(133,41,3),(134,42,1),(135,42,2),(136,42,3),(137,42,4),(138,42,5),(139,43,1),(140,43,2),(141,43,3),(142,44,1),(143,44,2),(144,44,3),(145,44,4),(146,45,1),(147,45,2),(148,45,3),(149,45,4),(150,45,5),(151,46,1),(152,46,2),(153,46,3),(154,46,4),(155,47,1),(156,47,2),(157,47,3),(158,47,4),(159,47,5),(160,48,1),(161,48,2),(162,48,3),(163,49,1),(164,49,2),(165,49,3),(166,49,4),(167,50,1),(168,50,2),(169,50,3),(170,50,4),(171,61,1),(172,61,2),(173,63,1),(174,63,2),(175,63,3),(176,63,4),(177,64,1),(178,64,2),(179,64,3),(180,64,4),(181,64,5),(182,65,2),(183,65,3),(184,65,4),(185,65,5),(186,66,1),(187,66,2),(188,66,3),(189,67,2),(190,67,3),(191,68,2),(192,68,3),(193,69,2),(194,69,3),(195,70,2),(196,70,3),(197,71,1),(198,71,2),(199,71,4),(200,72,1),(201,72,2),(202,72,3),(203,73,1),(204,73,2),(205,73,3),(206,74,1),(207,74,2),(208,74,3),(209,75,1),(210,75,2),(211,75,3),(212,76,2),(213,76,3),(214,76,4),(215,77,1),(216,77,2),(217,77,3),(218,77,4),(219,77,5),(220,78,2),(221,78,3),(222,78,4),(223,78,5);
/*!40000 ALTER TABLE `relpostsize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportpost`
--

DROP TABLE IF EXISTS `reportpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportpost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime(6) NOT NULL,
  `reason` longtext,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reportpost_post_id_af26f40d_fk_post_id` (`post_id`),
  KEY `reportpost_user_id_58059ffc_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reportpost_post_id_af26f40d_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `reportpost_user_id_58059ffc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportpost`
--

LOCK TABLES `reportpost` WRITE;
/*!40000 ALTER TABLE `reportpost` DISABLE KEYS */;
INSERT INTO `reportpost` VALUES (1,'2020-03-19 10:24:35.478695','Threatening or violent',6,18,1),(2,'2020-03-19 10:26:25.511093','Unauthorized Sales',7,18,1),(3,'2020-03-19 10:36:31.822357','Unauthorized Sales',7,14,1),(4,'2020-03-19 10:44:25.840556','Inappropriate content',6,14,1),(5,'2020-03-21 03:31:16.005987','Others',8,2,1),(6,'2020-03-21 07:56:18.432007','Others',7,2,1),(7,'2020-03-25 16:20:30.214398','Threatening or violent',4,3,1),(8,'2020-03-26 02:31:42.218209','Inappropriate content',13,14,1),(9,'2020-03-26 03:52:43.878663','Others',9,14,1),(10,'2020-03-26 05:57:03.970472','Threatening or violent',12,14,1),(11,'2020-03-26 11:34:07.217394','Threatening or violent',13,3,1),(12,'2020-03-27 03:01:23.463569','Others',9,3,1),(13,'2020-04-02 09:11:03.169214','Unauthorized Sales',15,36,1),(14,'2020-04-03 01:18:22.196443','Unauthorized Sales',8,37,1),(15,'2020-04-05 11:42:59.754672','Inappropriate content',17,36,1),(16,'2020-04-08 03:30:45.678150','Others',5,42,1),(17,'2020-04-08 03:41:06.919823','Unauthorized Sales',9,42,1),(18,'2020-04-09 03:26:14.840568','Others',31,14,1),(19,'2020-04-10 02:54:45.988290','Others',28,3,1),(20,'2020-04-10 04:43:44.687591','Others',10,14,1),(21,'2020-04-18 05:07:54.147821','Unauthorized Sales',35,3,1),(22,'2020-04-25 08:45:58.139847','Threatening or violent',41,3,1),(23,'2020-04-27 10:37:18.718679','Others',28,2,1),(24,'2020-04-27 10:40:52.246488','Inappropriate content',44,2,1),(25,'2020-04-30 04:18:43.535955','Threatening or violent',42,14,1),(26,'2020-04-30 04:34:53.074824','Threatening or violent',11,14,1),(27,'2020-04-30 04:37:15.406285','Threatening or violent',37,14,1),(28,'2020-04-30 04:40:18.141557','Threatening or violent',23,14,1),(29,'2020-04-30 04:43:16.921430','Inappropriate content',38,14,1),(30,'2020-04-30 04:55:44.882358','Threatening or violent',44,14,1),(31,'2020-04-30 09:34:21.733264','Threatening or violent',36,14,1),(32,'2020-04-30 10:21:24.093817','Unauthorized Sales',50,3,1),(33,'2020-04-30 10:28:47.723175','Inappropriate content',24,3,1),(34,'2020-04-30 10:33:04.348511','Inappropriate content',21,3,1),(35,'2020-04-30 10:37:00.278811','Inappropriate content',20,3,1),(36,'2020-04-30 10:37:06.652018','Inappropriate content',19,3,1),(37,'2020-04-30 10:38:12.571738','Inappropriate content',43,3,1),(38,'2020-04-30 12:59:16.598674','Threatening or violent',40,3,1),(39,'2020-04-30 13:15:39.053452','Threatening or violent',39,3,1),(40,'2020-04-30 13:22:16.053115','Threatening or violent',34,3,0),(41,'2020-04-30 13:34:57.320526','Inappropriate content',33,3,0),(42,'2020-06-08 04:21:22.101753','Unauthorized Sales',77,10,0),(43,'2020-06-15 12:12:51.708415','Others',78,10,1),(44,'2020-06-25 06:44:43.421588','Unauthorized Sales',73,29,1),(45,'2020-06-30 06:05:17.303943','Others',65,2,1);
/*!40000 ALTER TABLE `reportpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sew`
--

DROP TABLE IF EXISTS `sew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sew` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sew_name` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sew`
--

LOCK TABLES `sew` WRITE;
/*!40000 ALTER TABLE `sew` DISABLE KEYS */;
INSERT INTO `sew` VALUES (1,'sew',1),(2,'hem',1);
/*!40000 ALTER TABLE `sew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shape`
--

DROP TABLE IF EXISTS `shape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shape` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shape` varchar(59) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shape`
--

LOCK TABLES `shape` WRITE;
/*!40000 ALTER TABLE `shape` DISABLE KEYS */;
INSERT INTO `shape` VALUES (1,'rectangle','/media/shapesimages/43/rectangleneww.png',1,14.23),(3,'circle','/media/shapesimages/43/1.png',1,12.34);
/*!40000 ALTER TABLE `shape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shapecolour`
--

DROP TABLE IF EXISTS `shapecolour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shapecolour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `colour` varchar(59) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shapecolour`
--

LOCK TABLES `shapecolour` WRITE;
/*!40000 ALTER TABLE `shapecolour` DISABLE KEYS */;
INSERT INTO `shapecolour` VALUES (1,'FF0000','null'),(2,'000000','null'),(3,'00FF00','null'),(4,'008000','null'),(5,'D3D3D3','null'),(6,'C0C0C0','null');
/*!40000 ALTER TABLE `shapecolour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `size` varchar(59) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'XS',1),(2,'S',1),(3,'M',1),(4,'L',1),(5,'XL',1);
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verifylog`
--

DROP TABLE IF EXISTS `verifylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verifylog` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `codeUsed` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verifylog_user_id_433404f2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `verifylog_user_id_433404f2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verifylog`
--

LOCK TABLES `verifylog` WRITE;
/*!40000 ALTER TABLE `verifylog` DISABLE KEYS */;
INSERT INTO `verifylog` VALUES ('05151d4f-d98e-40c8-beee-8a89fcddfd1b','5ep-c47bde6090741e1b5a2d',1,'2020-03-11 12:42:42.000000',2),('122de646-b711-41b1-926a-ac294f662951','5ew-dcb7565cf8f5a115bce5',1,'2020-03-18 12:37:58.000000',14),('1256ee01-2718-4d9c-9f10-96487b1d66e7','5f8-801cde3989c8c5a85574',0,'2020-03-30 06:25:37.000000',33),('1a938c48-7652-46d7-8a19-ea4f4d7864c5','5fm-d7f00654022f0c85898f',1,'2020-04-13 05:47:51.000000',44),('1dedf738-0810-4567-a2eb-42cb2e7708b6','5fb-2ff7a4439e24eea2dbf4',1,'2020-04-02 09:03:05.000000',36),('1e9d6645-efbb-498e-9ff2-d895f17572ca','5fg-4dc8be15454bf426dce4',0,'2020-04-07 11:35:47.000000',41),('200cba71-2bea-4c32-bb19-bddba88bf1f3','5fc-402155f01e95cf9e0f86',0,'2020-04-03 10:19:51.000000',38),('20e7ef1b-a1c1-4c4d-a92b-020528a3eec2','5f5-0c1df408a97ecd9460c2',1,'2020-03-27 12:11:25.000000',30),('2141d6c7-19bb-46dd-89cc-7fbf5716be2d','5ew-92550119c24ee02823ab',0,'2020-03-18 12:21:08.000000',6),('224b2421-9666-4beb-8ff2-9903b560dc86','5f5-7521d56f9693e6b84160',1,'2020-03-27 12:08:28.000000',25),('3a190617-76c3-4796-b07c-b6882b729404','5f8-f2a56b2f61841324e181',1,'2020-03-30 06:27:08.000000',34),('3a8f5145-beee-4f33-8348-0f65b703d1c4','5ep-810654427cf68d7d87e7',1,'2020-03-11 12:57:48.000000',3),('4499fa07-8979-47dd-9fd1-0a9059d86887','5f7-589c0978d26402bc7d48',1,'2020-03-29 09:12:25.000000',32),('46f256b1-43d9-4b1d-9664-13b8d5daf496','5ex-3fb71ac445cf252369f2',0,'2020-03-19 10:45:37.000000',20),('495eaa36-b3e3-45c4-b14a-658f1c263c02','5f5-1d7bd4d32c71b4fd7668',1,'2020-03-27 12:06:47.000000',24),('63b4268d-eb81-42d3-89ca-c4eb128bfa9d','5f1-10bb85392cd1c517f774',0,'2020-03-23 04:00:05.000000',23),('6e4e046c-9f81-4da5-b8bd-e7a4eb936278','5ey-47d09287595f816d1450',1,'2020-03-20 14:01:36.000000',22),('72731892-daa9-4c11-af1d-7d1b4f986b06','5ff-fd75a8434f6f83df5cef',1,'2020-04-06 10:19:31.000000',39),('78375911-fcdf-4bcb-9d78-8c801a30f66a','5f9-01a92991c97b99eb6a4e',1,'2020-03-31 02:45:31.000000',35),('7b1c4c11-3fe0-42d0-8c73-a632ebfc7228','5ew-890b4c8b19cdf660a449',0,'2020-03-18 12:30:04.000000',10),('7bfad0ba-908b-4c8a-aa18-e56e061f0a1d','5ex-c348966b9a4482c1bbec',0,'2020-03-19 10:44:37.000000',19),('86f5aab9-6227-4258-bd8d-95723bb89793','5ex-24fa0b4f55ec99099adc',1,'2020-03-19 02:59:13.000000',15),('8b470991-a2a7-4e14-b59c-1c3a5440c5f6','5ex-59ea1d6682f2626ca011',1,'2020-03-19 04:40:24.000000',16),('95c127d7-ed52-45ef-9b2d-4aa6aeb65e87','5fg-a932e7a48fdae07144f5',1,'2020-04-07 11:23:41.000000',40),('9904b77c-2997-4217-8e4d-526ec1665f17','5fc-8eba3596e82bc8aaba33',1,'2020-04-03 01:07:27.000000',37),('9e0f6dcf-2bb4-4a5c-86c7-0012c482b019','5ex-ac864905718b274f6527',0,'2020-03-19 11:11:30.000000',21),('a14be3a4-f808-4890-ab4b-76ba67b5914b','5ew-540c55c9527601bb6558',0,'2020-03-18 12:32:35.000000',13),('ac7c4c6f-3c54-42c2-b406-bd294d00610a','5f5-3bdb94741f609d0069f5',0,'2020-03-27 12:09:02.000000',26),('af523e9d-4ef0-4ee2-a783-c0144654738d','5ex-8e0bef85e2a511e7c1fe',1,'2020-03-19 09:14:56.000000',17),('c05f8202-e9da-496d-97d9-0013ee489d14','5f5-00b8c7957b6db141fa41',1,'2020-03-27 12:09:44.000000',27),('c3d5bfb8-4e22-4869-ac18-7f4c9b1bedae','5f5-13d1fbba2a12ca4ea1af',0,'2020-03-27 12:15:06.000000',31),('c7c10566-79d6-474e-b03d-ee31163695bf','5fg-c82b01e4209ad86b4f42',1,'2020-04-07 11:50:50.000000',42),('e6fd0318-69e8-43f8-a82a-cdf4e17f3d17','5ex-08c7afa750ad159eee1d',1,'2020-03-19 09:31:44.000000',18),('e70089ea-8b68-4c4c-988b-264f36b617ee','5f5-f616d8a5474d65785f01',1,'2020-03-27 12:10:24.000000',28),('fabe2968-27e6-4563-b715-380af525ee2e','5f5-00720103ddb2d435436c',1,'2020-03-27 12:10:55.000000',29);
/*!40000 ALTER TABLE `verifylog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-30 12:33:36
