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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_users`
--

LOCK TABLES `authorized_users` WRITE;
/*!40000 ALTER TABLE `authorized_users` DISABLE KEYS */;
INSERT INTO `authorized_users` VALUES (1,'dinkar','sharma'),(3,'anas','yassin'),(4,'hello','2'),(5,'mike','galle'),(7,'mikel','akl');
/*!40000 ALTER TABLE `authorized_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elevator_network`
--

DROP TABLE IF EXISTS `elevator_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elevator_network` (
  `nodeID` int(10) unsigned NOT NULL,
  `requestedFloor` tinyint(3) unsigned NOT NULL,
  `controllerType` text NOT NULL,
  `doorState` text NOT NULL,
  `currentFloor` tinyint(4) NOT NULL,
  `dateID` date NOT NULL,
  `timeID` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elevator_network`
--

LOCK TABLES `elevator_network` WRITE;
/*!40000 ALTER TABLE `elevator_network` DISABLE KEYS */;
INSERT INTO `elevator_network` VALUES (100,3,'EC','',0,'2017-07-29','21:32:16'),(100,2,'EC','',0,'2017-07-29','21:32:16'),(100,1,'EC','',0,'2017-07-29','21:32:17'),(100,0,'EC','open',0,'2017-07-29','21:32:17'),(100,0,'EC','close',0,'2017-07-29','21:32:18'),(100,3,'FC','',0,'2017-07-29','21:32:19'),(100,2,'FC','',0,'2017-07-29','21:32:19'),(100,1,'FC','',0,'2017-07-29','21:32:20'),(100,1,'FC','',0,'2017-07-29','21:33:10'),(100,2,'FC','',0,'2017-07-29','21:33:11');
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

-- Dump completed on 2017-07-29 21:34:45
