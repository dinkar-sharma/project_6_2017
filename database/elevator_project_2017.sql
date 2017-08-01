-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: elevator_project_2017
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

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
-- Table structure for table `CAN_network`
--

DROP TABLE IF EXISTS `CAN_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAN_network` (
  `CAN_ID` int(10) unsigned NOT NULL,
  `requestedFloor` tinyint(4) NOT NULL,
  `currentFloor` tinyint(4) NOT NULL,
  `doorState` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAN_network`
--

LOCK TABLES `CAN_network` WRITE;
/*!40000 ALTER TABLE `CAN_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAN_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorized_users`
--

DROP TABLE IF EXISTS `authorized_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorized_users` (
  `userID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_users`
--

LOCK TABLES `authorized_users` WRITE;
/*!40000 ALTER TABLE `authorized_users` DISABLE KEYS */;
INSERT INTO `authorized_users` VALUES (3,'anas','dasf'),(4,'hello','2'),(9,'mikeakl','mike');
/*!40000 ALTER TABLE `authorized_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevator_network`
--

DROP TABLE IF EXISTS `elevator_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elevator_network` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeID` int(10) unsigned NOT NULL,
  `requestedFloor` tinyint(3) unsigned NOT NULL,
  `controllerType` text NOT NULL,
  `doorState` text NOT NULL,
  `currentFloor` tinyint(4) NOT NULL,
  `dateID` date NOT NULL,
  `timeID` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevator_network`
--

LOCK TABLES `elevator_network` WRITE;
/*!40000 ALTER TABLE `elevator_network` DISABLE KEYS */;
INSERT INTO `elevator_network` VALUES (1,100,0,'EC','open',0,'2017-07-31','16:22:48'),(2,100,0,'EC','open',0,'2017-07-31','16:22:48'),(3,100,3,'FC','',0,'2017-07-31','16:24:24'),(4,100,3,'FC','',0,'2017-07-31','16:24:24'),(5,100,2,'FC','',0,'2017-07-31','16:24:25'),(6,100,2,'FC','',0,'2017-07-31','16:24:25'),(7,100,0,'EC','open',0,'2017-07-31','16:25:11'),(8,100,1,'EC','',0,'2017-07-31','16:25:12'),(9,100,2,'EC','',0,'2017-07-31','16:25:13'),(10,100,0,'EC','close',0,'2017-07-31','16:25:19'),(11,100,0,'EC','open',0,'2017-07-31','16:25:19'),(12,100,0,'EC','close',0,'2017-07-31','16:25:20'),(13,100,1,'FC','',0,'2017-07-31','16:25:21'),(14,100,2,'FC','',0,'2017-07-31','16:25:22'),(15,100,3,'EC','',0,'2017-07-31','16:25:36'),(16,100,2,'EC','',0,'2017-07-31','16:25:36'),(17,100,1,'EC','',0,'2017-07-31','16:25:37'),(18,100,0,'EC','close',0,'2017-07-31','16:25:38'),(19,100,0,'EC','open',0,'2017-07-31','16:25:38'),(20,100,1,'EC','',0,'2017-07-31','16:25:39'),(21,100,2,'EC','',0,'2017-07-31','16:25:40'),(22,100,3,'EC','',0,'2017-07-31','16:25:40'),(23,100,2,'FC','',0,'2017-07-31','16:25:41'),(24,100,1,'FC','',0,'2017-07-31','16:25:41'),(25,100,3,'FC','',0,'2017-07-31','16:25:42'),(26,100,1,'FC','',0,'2017-07-31','16:25:50'),(27,100,2,'FC','',0,'2017-07-31','16:25:51'),(28,100,0,'EC','close',0,'2017-07-31','16:25:51'),(29,100,0,'EC','open',0,'2017-07-31','16:25:52'),(30,100,1,'EC','',0,'2017-07-31','16:25:53'),(31,100,2,'EC','',0,'2017-07-31','16:25:53'),(32,100,2,'EC','',0,'2017-07-31','19:58:23'),(33,100,1,'EC','',0,'2017-07-31','19:58:23'),(34,100,0,'EC','close',0,'2017-07-31','19:58:24'),(35,100,1,'FC','',0,'2017-07-31','19:58:35'),(36,100,2,'FC','',0,'2017-07-31','19:58:36'),(37,100,2,'FC','',0,'2017-07-31','19:58:37'),(38,100,2,'EC','',0,'2017-07-31','19:58:37'),(39,100,1,'EC','',0,'2017-07-31','19:58:38'),(40,100,0,'EC','close',0,'2017-07-31','19:58:39'),(41,100,0,'EC','open',0,'2017-07-31','19:58:39'),(42,100,0,'EC','close',0,'2017-07-31','19:58:46'),(43,100,1,'EC','',0,'2017-07-31','19:58:46'),(44,100,2,'EC','',0,'2017-07-31','19:58:47'),(45,100,3,'EC','',0,'2017-07-31','19:58:47');
/*!40000 ALTER TABLE `elevator_network` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-31 20:07:03
