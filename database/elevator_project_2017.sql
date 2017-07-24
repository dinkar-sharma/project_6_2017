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
  `CAN_nodeID` int(10) unsigned NOT NULL,
  `CAN_status` tinyint(4) NOT NULL,
  `CAN_currentFloor` tinyint(4) NOT NULL,
  `MC_Enable` tinyint(4) NOT NULL,
  `MC_Floor_Cmd` tinyint(4) NOT NULL,
  KEY `CAN_nodeID` (`CAN_nodeID`),
  CONSTRAINT `CAN_network_ibfk_1` FOREIGN KEY (`CAN_nodeID`) REFERENCES `elevator_network` (`nodeID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_users`
--

LOCK TABLES `authorized_users` WRITE;
/*!40000 ALTER TABLE `authorized_users` DISABLE KEYS */;
INSERT INTO `authorized_users` VALUES (1,'dinkar','sharma'),(3,'anas','yassin'),(4,'hello','2');
/*!40000 ALTER TABLE `authorized_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevator_network`
--

DROP TABLE IF EXISTS `elevator_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elevator_network` (
  `nodeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requestedFloor` tinyint(3) unsigned NOT NULL,
  `doorState` text NOT NULL,
  `currentFloor` tinyint(4) NOT NULL,
  `dateID` date NOT NULL,
  `timeID` time NOT NULL,
  PRIMARY KEY (`nodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevator_network`
--

LOCK TABLES `elevator_network` WRITE;
/*!40000 ALTER TABLE `elevator_network` DISABLE KEYS */;
INSERT INTO `elevator_network` VALUES (1,1,'open',1,'0000-00-00','00:00:00'),(2,2,'open',4,'0000-00-00','00:00:00'),(3,1,'open',1,'2017-07-24','12:02:32'),(4,0,'open',0,'2017-07-24','12:50:33'),(5,0,'open',0,'2017-07-24','12:50:35'),(6,0,'open',0,'2017-07-24','12:50:36'),(7,0,'open',0,'2017-07-24','12:51:35'),(8,0,'open',0,'2017-07-24','12:51:44'),(9,0,'open',0,'2017-07-24','12:51:46'),(10,0,'open',0,'2017-07-24','12:52:47'),(11,0,'open',0,'2017-07-24','13:06:44'),(12,3,'open',0,'2017-07-24','13:08:14'),(13,3,'open',0,'2017-07-24','13:08:24'),(14,2,'open',0,'2017-07-24','13:08:45'),(15,2,'open',0,'2017-07-24','13:17:37'),(16,0,'open',0,'2017-07-24','13:17:49'),(17,0,'open',0,'2017-07-24','13:18:16'),(18,0,'open',0,'2017-07-24','13:18:21'),(19,0,'close',0,'2017-07-24','13:19:10'),(20,0,'close',0,'2017-07-24','13:19:14'),(21,0,'open',0,'2017-07-24','13:19:21'),(22,0,'close',0,'2017-07-24','13:19:27'),(23,0,'close',0,'2017-07-24','13:26:45'),(24,0,'close',0,'2017-07-24','13:27:19'),(25,0,'close',0,'2017-07-24','13:28:21'),(26,0,'close',0,'2017-07-24','13:34:58'),(27,0,'close',0,'2017-07-24','13:36:57'),(28,0,'close',0,'2017-07-24','13:40:49'),(29,0,'close',0,'2017-07-24','13:41:58'),(30,0,'close',0,'2017-07-24','13:43:32'),(31,0,'close',0,'2017-07-24','13:43:55'),(32,2,'na',0,'2017-07-24','13:44:17'),(33,2,'na',0,'2017-07-24','13:44:27'),(34,1,'na',0,'2017-07-24','13:44:35'),(35,3,'na',0,'2017-07-24','13:44:42'),(36,3,'na',0,'2017-07-24','13:44:53'),(37,3,'na',0,'2017-07-24','13:46:10'),(38,1,'na',0,'2017-07-24','13:47:46'),(39,0,'na',0,'2017-07-24','13:52:14'),(40,0,'na',0,'2017-07-24','13:54:43'),(41,0,'na',0,'2017-07-24','13:55:27'),(42,0,'na',0,'2017-07-24','13:55:33'),(43,0,'na',0,'2017-07-24','14:01:12'),(44,0,'na',0,'2017-07-24','14:03:03'),(45,0,'na',0,'2017-07-24','14:06:25'),(46,0,'na',0,'2017-07-24','14:07:37'),(47,0,'na',0,'2017-07-24','14:08:46'),(48,0,'na',0,'2017-07-24','14:09:28'),(49,0,'na',0,'2017-07-24','14:11:52'),(50,0,'na',0,'2017-07-24','14:14:39'),(51,0,'na',0,'2017-07-24','14:16:07'),(52,2,'na',0,'2017-07-24','14:16:09'),(53,2,'na',0,'2017-07-24','14:16:10'),(54,2,'na',0,'2017-07-24','14:17:08'),(55,0,'na',0,'2017-07-24','14:18:19'),(56,0,'na',0,'2017-07-24','14:18:47'),(57,0,'na',0,'2017-07-24','14:20:59'),(58,0,'na',0,'2017-07-24','14:22:08'),(59,0,'na',0,'2017-07-24','14:22:40'),(60,0,'na',0,'2017-07-24','14:22:46'),(61,0,'na',0,'2017-07-24','14:22:56'),(62,3,'na',0,'2017-07-24','14:23:11'),(63,2,'na',0,'2017-07-24','14:23:16'),(64,2,'na',0,'2017-07-24','14:24:39'),(65,2,'na',0,'2017-07-24','14:24:44'),(66,2,'na',0,'2017-07-24','14:38:29'),(67,2,'na',0,'2017-07-24','14:38:38'),(68,2,'na',0,'2017-07-24','14:39:19'),(69,3,'na',0,'2017-07-24','14:39:24'),(70,3,'na',0,'2017-07-24','14:40:28');
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

-- Dump completed on 2017-07-24 14:41:27
