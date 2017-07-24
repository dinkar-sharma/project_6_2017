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
INSERT INTO `elevator_network` VALUES (100,0,'none','open',0,'2017-07-24','16:13:00'),(100,0,'none','open',0,'2017-07-24','16:13:04'),(100,0,'none','open',0,'2017-07-24','16:13:05'),(100,0,'none','open',0,'2017-07-24','16:13:06'),(100,0,'none','open',0,'2017-07-24','16:13:08'),(100,0,'none','open',0,'2017-07-24','16:13:11'),(100,0,'none','open',0,'2017-07-24','16:13:13'),(100,0,'none','open',0,'2017-07-24','16:13:33'),(100,1,'EC','open',0,'2017-07-24','16:13:35'),(100,3,'FC','open',0,'2017-07-24','16:13:40'),(100,1,'FC','open',0,'2017-07-24','16:13:43'),(100,2,'EC','open',0,'2017-07-24','16:13:49'),(100,0,'','open',0,'2017-07-24','16:15:43'),(100,0,'','open',0,'2017-07-24','16:15:48'),(100,0,'','open',0,'2017-07-24','16:15:52'),(100,3,'EC','open',0,'2017-07-24','16:16:16'),(100,0,'','close',0,'2017-07-24','16:16:20'),(100,0,'','open',0,'2017-07-24','16:16:26'),(100,3,'EC','open',0,'2017-07-24','16:16:28'),(100,3,'EC','na',0,'2017-07-24','16:18:17'),(100,2,'FC','na',0,'2017-07-24','16:18:20'),(100,2,'FC','na',0,'2017-07-24','16:18:41'),(100,2,'EC','na',0,'2017-07-24','16:18:45'),(100,0,'','open',0,'2017-07-24','16:19:25'),(100,0,'','close',0,'2017-07-24','16:19:29'),(100,1,'EC','',0,'2017-07-24','16:19:32'),(100,2,'EC','',0,'2017-07-24','16:19:36');
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

-- Dump completed on 2017-07-24 16:29:01
