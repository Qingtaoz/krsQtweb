-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: krswebframe
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `r_auth_element`
--

DROP TABLE IF EXISTS `r_auth_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_auth_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` varchar(32) NOT NULL,
  `elementid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AE_REF_AUTH` (`authid`),
  KEY `FK_AE_REF_ELEMENT` (`elementid`),
  CONSTRAINT `FK_AE_REF_AUTH` FOREIGN KEY (`authid`) REFERENCES `t_bd_auth` (`authid`),
  CONSTRAINT `FK_AE_REF_ELEMENT` FOREIGN KEY (`elementid`) REFERENCES `t_bd_element` (`elementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_auth_element`
--

LOCK TABLES `r_auth_element` WRITE;
/*!40000 ALTER TABLE `r_auth_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_auth_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_auth_file`
--

DROP TABLE IF EXISTS `r_auth_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_auth_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` varchar(32) NOT NULL,
  `authid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AF_REF_FILE` (`fileid`),
  KEY `FK_Reference_20` (`authid`),
  CONSTRAINT `FK_AF_REF_FILE` FOREIGN KEY (`fileid`) REFERENCES `t_bd_file` (`fileid`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`authid`) REFERENCES `t_bd_auth` (`authid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_auth_file`
--

LOCK TABLES `r_auth_file` WRITE;
/*!40000 ALTER TABLE `r_auth_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_auth_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_auth_menu`
--

DROP TABLE IF EXISTS `r_auth_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_auth_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` varchar(32) NOT NULL,
  `menuid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AM_REF_AUTH` (`authid`),
  KEY `FK_AM_REF_MENU` (`menuid`),
  CONSTRAINT `FK_AM_REF_AUTH` FOREIGN KEY (`authid`) REFERENCES `t_bd_auth` (`authid`),
  CONSTRAINT `FK_AM_REF_MENU` FOREIGN KEY (`menuid`) REFERENCES `t_bd_menu` (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_auth_menu`
--

LOCK TABLES `r_auth_menu` WRITE;
/*!40000 ALTER TABLE `r_auth_menu` DISABLE KEYS */;
INSERT INTO `r_auth_menu` VALUES (1,'24c1946841ca11e7a91992ebcb67fe33','0284aa2041ca11e7a91992ebcb67fe33'),(2,'24c1974241ca11e7a91992ebcb67fe33','0284ae2641ca11e7a91992ebcb67fe33'),(3,'24c1986441ca11e7a91992ebcb67fe33','0284afca41ca11e7a91992ebcb67fe33'),(4,'24c1995441ca11e7a91992ebcb67fe33','0284b12841ca11e7a91992ebcb67fe33'),(5,'24c19aa841ca11e7a91992ebcb67fe33','0284b29a41ca11e7a91992ebcb67fe33'),(6,'24c19f4e41ca11e7a91992ebcb67fe33','0284b7d641ca11e7a91992ebcb67fe33'),(7,'24c1a02a41ca11e7a91992ebcb67fe33','0284b9b641ca11e7a91992ebcb67fe33'),(8,'24c1a0f241ca11e7a91992ebcb67fe33','0284bb0041ca11e7a91992ebcb67fe33'),(9,'24c1a1ba41ca11e7a91992ebcb67fe33','0284bc4a41ca11e7a91992ebcb67fe33'),(10,'24c1a28241ca11e7a91992ebcb67fe33','0284bdc641ca11e7a91992ebcb67fe33'),(11,'24c1a34a41ca11e7a91992ebcb67fe33','0284bf4c41ca11e7a91992ebcb67fe33'),(12,'24c1a7aa41ca11e7a91992ebcb67fe33','0284c0be41ca11e7a91992ebcb67fe33'),(13,'24c1a8a441ca11e7a91992ebcb67fe33','0284c83441ca11e7a91992ebcb67fe33'),(14,'24c1a98a41ca11e7a91992ebcb67fe33','0284ca0a41ca11e7a91992ebcb67fe33'),(15,'24c1aa5241ca11e7a91992ebcb67fe33','0284cb6841ca11e7a91992ebcb67fe33'),(16,'24c1ab1a41ca11e7a91992ebcb67fe33','0284cd2041ca11e7a91992ebcb67fe33'),(17,'24c1abe241ca11e7a91992ebcb67fe33','0284ceb041ca11e7a91992ebcb67fe33'),(18,'24c1acb441ca11e7a91992ebcb67fe33','0284d01841ca11e7a91992ebcb67fe33'),(19,'24c1b11e41ca11e7a91992ebcb67fe33','0284d16c41ca11e7a91992ebcb67fe33'),(20,'24c1b23641ca11e7a91992ebcb67fe33','0284d82441ca11e7a91992ebcb67fe33'),(21,'24c1b30841ca11e7a91992ebcb67fe33','0284da4041ca11e7a91992ebcb67fe33'),(22,'24c1b3d041ca11e7a91992ebcb67fe33','0284db8a41ca11e7a91992ebcb67fe33'),(23,'24c1b49841ca11e7a91992ebcb67fe33','0284dcde41ca11e7a91992ebcb67fe33'),(24,'24c1b55641ca11e7a91992ebcb67fe33','0284de3241ca11e7a91992ebcb67fe33'),(25,'24c1b61e41ca11e7a91992ebcb67fe33','0284df7241ca11e7a91992ebcb67fe33'),(26,'24c1ba3841ca11e7a91992ebcb67fe33','0284e0bc41ca11e7a91992ebcb67fe33'),(27,'24c1bb1441ca11e7a91992ebcb67fe33','0284e6d441ca11e7a91992ebcb67fe33'),(28,'24c1bbe641ca11e7a91992ebcb67fe33','0284e87841ca11e7a91992ebcb67fe33'),(29,'24c1bcd641ca11e7a91992ebcb67fe33','0284ea1241ca11e7a91992ebcb67fe33'),(30,'24c1bd9e41ca11e7a91992ebcb67fe33','0284eb5c41ca11e7a91992ebcb67fe33'),(31,'24c1be5c41ca11e7a91992ebcb67fe33','0284ec9241ca11e7a91992ebcb67fe33'),(32,'24c1c34841ca11e7a91992ebcb67fe33','0284edb441ca11e7a91992ebcb67fe33'),(33,'24c1c48841ca11e7a91992ebcb67fe33','0284f2f041ca11e7a91992ebcb67fe33'),(34,'24c1c55041ca11e7a91992ebcb67fe33','0284f51641ca11e7a91992ebcb67fe33'),(35,'24c1c61841ca11e7a91992ebcb67fe33','0284f67e41ca11e7a91992ebcb67fe33'),(36,'24c1c6e041ca11e7a91992ebcb67fe33','0284f7fa41ca11e7a91992ebcb67fe33'),(37,'24c1c7a841ca11e7a91992ebcb67fe33','0284f94441ca11e7a91992ebcb67fe33'),(38,'24c1c87a41ca11e7a91992ebcb67fe33','0284fa7a41ca11e7a91992ebcb67fe33'),(39,'24c1cd5c41ca11e7a91992ebcb67fe33','0284fbb041ca11e7a91992ebcb67fe33'),(40,'24c1ce8841ca11e7a91992ebcb67fe33','0285010041ca11e7a91992ebcb67fe33'),(41,'24c1cf5a41ca11e7a91992ebcb67fe33','028502c241ca11e7a91992ebcb67fe33'),(42,'24c1d02241ca11e7a91992ebcb67fe33','0285040c41ca11e7a91992ebcb67fe33'),(43,'24c1d0f441ca11e7a91992ebcb67fe33','0285053841ca11e7a91992ebcb67fe33'),(44,'24c1d1bc41ca11e7a91992ebcb67fe33','0285067841ca11e7a91992ebcb67fe33'),(45,'24c1d28441ca11e7a91992ebcb67fe33','028507ae41ca11e7a91992ebcb67fe33'),(46,'07d1f9fe5afe11e7907ba6006ad3dba0','2fba2eb05afd11e7907ba6006ad3dba0');
/*!40000 ALTER TABLE `r_auth_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_auth_opt`
--

DROP TABLE IF EXISTS `r_auth_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_auth_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authid` varchar(32) NOT NULL,
  `optid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AO_REF_AUTH` (`authid`),
  KEY `FK_AO_REF_OPT` (`optid`),
  CONSTRAINT `FK_AO_REF_AUTH` FOREIGN KEY (`authid`) REFERENCES `t_bd_auth` (`authid`),
  CONSTRAINT `FK_AO_REF_OPT` FOREIGN KEY (`optid`) REFERENCES `t_bd_opt` (`optid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_auth_opt`
--

LOCK TABLES `r_auth_opt` WRITE;
/*!40000 ALTER TABLE `r_auth_opt` DISABLE KEYS */;
INSERT INTO `r_auth_opt` VALUES (1,'67eb4aa4362111e7a91992ebcb67fe33','4dcd678a361f11e7a91992ebcb67fe33'),(2,'67eb4eb4362111e7a91992ebcb67fe33','4dcd6a8c361f11e7a91992ebcb67fe33'),(3,'67eb50d0362111e7a91992ebcb67fe33','4dcd6b9a361f11e7a91992ebcb67fe33'),(4,'67eb54d6362111e7a91992ebcb67fe33','4dcd6c6c361f11e7a91992ebcb67fe33'),(5,'67eb56c0362111e7a91992ebcb67fe33','4dcd6d3e361f11e7a91992ebcb67fe33'),(6,'67eb59d6362111e7a91992ebcb67fe33','4dcd719e361f11e7a91992ebcb67fe33'),(7,'67eb5d82362111e7a91992ebcb67fe33','4dcd7298361f11e7a91992ebcb67fe33'),(8,'67eb5f80362111e7a91992ebcb67fe33','4dcd736a361f11e7a91992ebcb67fe33'),(9,'67eb62d2362111e7a91992ebcb67fe33','4dcd7432361f11e7a91992ebcb67fe33'),(10,'67eb64a8362111e7a91992ebcb67fe33','4dcd74fa361f11e7a91992ebcb67fe33'),(11,'67eb6822362111e7a91992ebcb67fe33','4dcd7626361f11e7a91992ebcb67fe33'),(12,'67eb69e4362111e7a91992ebcb67fe33','4dcd79a0361f11e7a91992ebcb67fe33'),(13,'67eb6e08362111e7a91992ebcb67fe33','4dcd7a86361f11e7a91992ebcb67fe33'),(14,'67eb7222362111e7a91992ebcb67fe33','4dcd7b4e361f11e7a91992ebcb67fe33'),(15,'67eb7416362111e7a91992ebcb67fe33','4dcd7c0c361f11e7a91992ebcb67fe33'),(16,'67eb77ae362111e7a91992ebcb67fe33','4dcd7cd4361f11e7a91992ebcb67fe33'),(17,'67eb7c18362111e7a91992ebcb67fe33','4dcd7d92361f11e7a91992ebcb67fe33'),(18,'67eb7f56362111e7a91992ebcb67fe33','4dcd7e5a361f11e7a91992ebcb67fe33'),(19,'67eb8140362111e7a91992ebcb67fe33','4dcd81a2361f11e7a91992ebcb67fe33'),(20,'67eb82f8362111e7a91992ebcb67fe33','4dcd8288361f11e7a91992ebcb67fe33'),(21,'67eb86d6362111e7a91992ebcb67fe33','4dcd835a361f11e7a91992ebcb67fe33'),(22,'67eb88b6362111e7a91992ebcb67fe33','4dcd8422361f11e7a91992ebcb67fe33'),(23,'67eb8bd6362111e7a91992ebcb67fe33','4dcd84ea361f11e7a91992ebcb67fe33'),(24,'67eb8dac362111e7a91992ebcb67fe33','4dcd85a8361f11e7a91992ebcb67fe33'),(25,'67eb9090362111e7a91992ebcb67fe33','4dcd867a361f11e7a91992ebcb67fe33'),(26,'67eb9266362111e7a91992ebcb67fe33','4dcd8a44361f11e7a91992ebcb67fe33'),(27,'67eb9572362111e7a91992ebcb67fe33','4dcd8b34361f11e7a91992ebcb67fe33'),(28,'67eb9a5e362111e7a91992ebcb67fe33','4dcd8bfc361f11e7a91992ebcb67fe33'),(29,'67eb9c8e362111e7a91992ebcb67fe33','4dcd8cba361f11e7a91992ebcb67fe33'),(30,'67eb9e64362111e7a91992ebcb67fe33','4dcd8d82361f11e7a91992ebcb67fe33'),(31,'67eba1f2362111e7a91992ebcb67fe33','ee7899fa361711e7a91992ebcb67fe33'),(32,'67eba558362111e7a91992ebcb67fe33','ee78a012361711e7a91992ebcb67fe33'),(33,'67eba724362111e7a91992ebcb67fe33','ee78a116361711e7a91992ebcb67fe33'),(34,'67eba8e6362111e7a91992ebcb67fe33','ee78a1e8361711e7a91992ebcb67fe33'),(36,'67ebadf0362111e7a91992ebcb67fe33','ee78a378361711e7a91992ebcb67fe33'),(37,'67ebb25a362111e7a91992ebcb67fe33','ee78a436361711e7a91992ebcb67fe33'),(38,'67ebb48a362111e7a91992ebcb67fe33','ee78a80a361711e7a91992ebcb67fe33'),(39,'67ebb7d2362111e7a91992ebcb67fe33','ee78a904361711e7a91992ebcb67fe33'),(40,'67ebbade362111e7a91992ebcb67fe33','ee78aa8a361711e7a91992ebcb67fe33'),(41,'67ebbcdc362111e7a91992ebcb67fe33','ee78ac24361711e7a91992ebcb67fe33'),(42,'67ebc11e362111e7a91992ebcb67fe33','ee78ad14361711e7a91992ebcb67fe33'),(43,'67ebc376362111e7a91992ebcb67fe33','ee78addc361711e7a91992ebcb67fe33'),(44,'67ebc682362111e7a91992ebcb67fe33','ee78aeae361711e7a91992ebcb67fe33'),(45,'67ebc84e362111e7a91992ebcb67fe33','ee78b35e361711e7a91992ebcb67fe33'),(46,'67ebcb96362111e7a91992ebcb67fe33','ee78b48a361711e7a91992ebcb67fe33'),(47,'67ebcee8362111e7a91992ebcb67fe33','ee78b552361711e7a91992ebcb67fe33'),(48,'67ebd0c8362111e7a91992ebcb67fe33','ee78b62e361711e7a91992ebcb67fe33'),(49,'67ebd406362111e7a91992ebcb67fe33','ee78b6f6361711e7a91992ebcb67fe33'),(50,'67ebd604362111e7a91992ebcb67fe33','ee78b7be361711e7a91992ebcb67fe33'),(51,'67ebd924362111e7a91992ebcb67fe33','ee78b87c361711e7a91992ebcb67fe33'),(52,'67ebdb0e362111e7a91992ebcb67fe33','ee78bc6e361711e7a91992ebcb67fe33'),(53,'67ebde88362111e7a91992ebcb67fe33','ee78bd4a361711e7a91992ebcb67fe33'),(54,'67ebe072362111e7a91992ebcb67fe33','ee78be12361711e7a91992ebcb67fe33'),(55,'67ebe2d4362111e7a91992ebcb67fe33','ee78beda361711e7a91992ebcb67fe33'),(56,'67ebe626362111e7a91992ebcb67fe33','ee78bfac361711e7a91992ebcb67fe33'),(57,'67ebe824362111e7a91992ebcb67fe33','ee78c074361711e7a91992ebcb67fe33'),(58,'67ebeb76362111e7a91992ebcb67fe33','ee78c132361711e7a91992ebcb67fe33'),(59,'67ebed74362111e7a91992ebcb67fe33','ee78c60a361711e7a91992ebcb67fe33'),(60,'67ebf292362111e7a91992ebcb67fe33','ee78c72c361711e7a91992ebcb67fe33'),(61,'67ebf490362111e7a91992ebcb67fe33','ee78c7f4361711e7a91992ebcb67fe33'),(62,'67ebf74c362111e7a91992ebcb67fe33','ee78c8d0361711e7a91992ebcb67fe33'),(63,'67ebfb20362111e7a91992ebcb67fe33','ee78c998361711e7a91992ebcb67fe33'),(64,'67ebfd14362111e7a91992ebcb67fe33','ee78ca60361711e7a91992ebcb67fe33'),(65,'67ebffe4362111e7a91992ebcb67fe33','ee78cb28361711e7a91992ebcb67fe33'),(66,'67ec01ba362111e7a91992ebcb67fe33','ee78ce7a361711e7a91992ebcb67fe33'),(67,'67ec04e4362111e7a91992ebcb67fe33','ee78cf74361711e7a91992ebcb67fe33'),(68,'67ec06c4362111e7a91992ebcb67fe33','ee78d032361711e7a91992ebcb67fe33'),(69,'67ec0890362111e7a91992ebcb67fe33','ee78d15e361711e7a91992ebcb67fe33'),(70,'67ec0c0a362111e7a91992ebcb67fe33','ee78d23a361711e7a91992ebcb67fe33'),(71,'67ec0df4362111e7a91992ebcb67fe33','ee78d302361711e7a91992ebcb67fe33'),(72,'67ec10e2362111e7a91992ebcb67fe33','ee78d65e361711e7a91992ebcb67fe33'),(73,'67ec1402362111e7a91992ebcb67fe33','ee78d73a361711e7a91992ebcb67fe33');
/*!40000 ALTER TABLE `r_auth_opt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_dept_cust`
--

DROP TABLE IF EXISTS `r_dept_cust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_dept_cust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` varchar(32) DEFAULT NULL,
  `customerid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_21` (`deptid`),
  KEY `FK_Reference_22` (`customerid`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`deptid`) REFERENCES `t_bd_department` (`deptid`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`customerid`) REFERENCES `t_bd_customer` (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_dept_cust`
--

LOCK TABLES `r_dept_cust` WRITE;
/*!40000 ALTER TABLE `r_dept_cust` DISABLE KEYS */;
INSERT INTO `r_dept_cust` VALUES (1,'75cbbe0cb97f47a2be6495a14af34dbe','53d6a6e31b5144808a76b889bdde4f7a');
/*!40000 ALTER TABLE `r_dept_cust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_dept_subdept`
--

DROP TABLE IF EXISTS `r_dept_subdept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_dept_subdept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` varchar(32) NOT NULL,
  `subdeptid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_23` (`deptid`),
  KEY `FK_Reference_24` (`subdeptid`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`deptid`) REFERENCES `t_bd_department` (`deptid`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`subdeptid`) REFERENCES `t_bd_department` (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_dept_subdept`
--

LOCK TABLES `r_dept_subdept` WRITE;
/*!40000 ALTER TABLE `r_dept_subdept` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_dept_subdept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_dept_trade`
--

DROP TABLE IF EXISTS `r_dept_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_dept_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` varchar(32) DEFAULT NULL,
  `tradeid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_25` (`deptid`),
  KEY `FK_Reference_26` (`tradeid`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`deptid`) REFERENCES `t_bd_department` (`deptid`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`tradeid`) REFERENCES `t_crm_trade` (`tradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_dept_trade`
--

LOCK TABLES `r_dept_trade` WRITE;
/*!40000 ALTER TABLE `r_dept_trade` DISABLE KEYS */;
INSERT INTO `r_dept_trade` VALUES (1,'75cbbe0cb97f47a2be6495a14af34dbe','d522d1b6f20a498192a76199a7137e4d');
/*!40000 ALTER TABLE `r_dept_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_dept_user`
--

DROP TABLE IF EXISTS `r_dept_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_dept_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DU_REF_DEPT` (`deptid`),
  KEY `FK_DU_REF_USER` (`userid`),
  CONSTRAINT `FK_DU_REF_DEPT` FOREIGN KEY (`deptid`) REFERENCES `t_bd_department` (`deptid`),
  CONSTRAINT `FK_DU_REF_USER` FOREIGN KEY (`userid`) REFERENCES `t_bd_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_dept_user`
--

LOCK TABLES `r_dept_user` WRITE;
/*!40000 ALTER TABLE `r_dept_user` DISABLE KEYS */;
INSERT INTO `r_dept_user` VALUES (1,'8ec57179f873442c93528576a7f46870','96b2656005714c65947bb398177ecd18'),(2,'75cbbe0cb97f47a2be6495a14af34dbe','6c1fc3f36749405ca1607f21f5d49a57'),(3,'83d05e3b22284d85b2784a97a6e6db07','c22d33456cae463eaa2f52a018c51bf1');
/*!40000 ALTER TABLE `r_dept_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_role_auth`
--

DROP TABLE IF EXISTS `r_role_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` varchar(32) NOT NULL,
  `authid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RA_REF_AUTH` (`authid`),
  KEY `FK_RA_REF_ROLE` (`roleid`),
  CONSTRAINT `FK_RA_REF_AUTH` FOREIGN KEY (`authid`) REFERENCES `t_bd_auth` (`authid`),
  CONSTRAINT `FK_RA_REF_ROLE` FOREIGN KEY (`roleid`) REFERENCES `t_bd_role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_role_auth`
--

LOCK TABLES `r_role_auth` WRITE;
/*!40000 ALTER TABLE `r_role_auth` DISABLE KEYS */;
INSERT INTO `r_role_auth` VALUES (1,'f0fd6c5841ef11e7a91992ebcb67fe33','24c1946841ca11e7a91992ebcb67fe33'),(2,'f0fd6c5841ef11e7a91992ebcb67fe33','24c1a1ba41ca11e7a91992ebcb67fe33'),(3,'f0fd6c5841ef11e7a91992ebcb67fe33','24c1a28241ca11e7a91992ebcb67fe33'),(4,'f0fd6c5841ef11e7a91992ebcb67fe33','24c1a34a41ca11e7a91992ebcb67fe33'),(5,'f0fd6c5841ef11e7a91992ebcb67fe33','67ebb25a362111e7a91992ebcb67fe33'),(6,'f0fd6c5841ef11e7a91992ebcb67fe33','67ebb48a362111e7a91992ebcb67fe33'),(7,'467570ac41f211e7a91992ebcb67fe33','24c1946841ca11e7a91992ebcb67fe33'),(8,'467570ac41f211e7a91992ebcb67fe33','24c1974241ca11e7a91992ebcb67fe33'),(9,'467570ac41f211e7a91992ebcb67fe33','24c1986441ca11e7a91992ebcb67fe33'),(10,'467570ac41f211e7a91992ebcb67fe33','24c1995441ca11e7a91992ebcb67fe33'),(11,'467570ac41f211e7a91992ebcb67fe33','24c19aa841ca11e7a91992ebcb67fe33'),(12,'467570ac41f211e7a91992ebcb67fe33','24c1a1ba41ca11e7a91992ebcb67fe33'),(13,'467570ac41f211e7a91992ebcb67fe33','24c1a34a41ca11e7a91992ebcb67fe33'),(14,'467570ac41f211e7a91992ebcb67fe33','24c1a7aa41ca11e7a91992ebcb67fe33'),(15,'467570ac41f211e7a91992ebcb67fe33','24c1a8a441ca11e7a91992ebcb67fe33'),(16,'467570ac41f211e7a91992ebcb67fe33','24c1a98a41ca11e7a91992ebcb67fe33'),(17,'467570ac41f211e7a91992ebcb67fe33','24c1b11e41ca11e7a91992ebcb67fe33'),(18,'467570ac41f211e7a91992ebcb67fe33','24c1b23641ca11e7a91992ebcb67fe33'),(19,'467570ac41f211e7a91992ebcb67fe33','24c1b30841ca11e7a91992ebcb67fe33'),(20,'467570ac41f211e7a91992ebcb67fe33','24c1b3d041ca11e7a91992ebcb67fe33'),(21,'467570ac41f211e7a91992ebcb67fe33','24c1b61e41ca11e7a91992ebcb67fe33'),(22,'467570ac41f211e7a91992ebcb67fe33','24c1ba3841ca11e7a91992ebcb67fe33'),(23,'467570ac41f211e7a91992ebcb67fe33','24c1bb1441ca11e7a91992ebcb67fe33'),(24,'467570ac41f211e7a91992ebcb67fe33','24c1bbe641ca11e7a91992ebcb67fe33'),(25,'467570ac41f211e7a91992ebcb67fe33','24c1bcd641ca11e7a91992ebcb67fe33'),(26,'467570ac41f211e7a91992ebcb67fe33','24c1c48841ca11e7a91992ebcb67fe33'),(27,'467570ac41f211e7a91992ebcb67fe33','24c1c55041ca11e7a91992ebcb67fe33'),(28,'467570ac41f211e7a91992ebcb67fe33','24c1c61841ca11e7a91992ebcb67fe33'),(29,'467570ac41f211e7a91992ebcb67fe33','24c1c6e041ca11e7a91992ebcb67fe33'),(30,'467570ac41f211e7a91992ebcb67fe33','24c1c7a841ca11e7a91992ebcb67fe33'),(31,'467570ac41f211e7a91992ebcb67fe33','24c1c87a41ca11e7a91992ebcb67fe33'),(32,'467570ac41f211e7a91992ebcb67fe33','24c1cf5a41ca11e7a91992ebcb67fe33'),(33,'467570ac41f211e7a91992ebcb67fe33','24c1d02241ca11e7a91992ebcb67fe33'),(34,'467570ac41f211e7a91992ebcb67fe33','24c1d0f441ca11e7a91992ebcb67fe33'),(35,'467570ac41f211e7a91992ebcb67fe33','67eb4aa4362111e7a91992ebcb67fe33'),(36,'467570ac41f211e7a91992ebcb67fe33','67eb50d0362111e7a91992ebcb67fe33'),(37,'467570ac41f211e7a91992ebcb67fe33','67eb56c0362111e7a91992ebcb67fe33'),(38,'467570ac41f211e7a91992ebcb67fe33','67eb5d82362111e7a91992ebcb67fe33'),(39,'467570ac41f211e7a91992ebcb67fe33','67eb62d2362111e7a91992ebcb67fe33'),(40,'467570ac41f211e7a91992ebcb67fe33','67eb6822362111e7a91992ebcb67fe33'),(41,'467570ac41f211e7a91992ebcb67fe33','67eb6e08362111e7a91992ebcb67fe33'),(42,'467570ac41f211e7a91992ebcb67fe33','67eb7222362111e7a91992ebcb67fe33'),(43,'467570ac41f211e7a91992ebcb67fe33','67eb77ae362111e7a91992ebcb67fe33'),(44,'467570ac41f211e7a91992ebcb67fe33','67eb7f56362111e7a91992ebcb67fe33'),(45,'467570ac41f211e7a91992ebcb67fe33','67eb8140362111e7a91992ebcb67fe33'),(46,'467570ac41f211e7a91992ebcb67fe33','67eb86d6362111e7a91992ebcb67fe33'),(47,'467570ac41f211e7a91992ebcb67fe33','67eb8bd6362111e7a91992ebcb67fe33'),(48,'467570ac41f211e7a91992ebcb67fe33','67eb8dac362111e7a91992ebcb67fe33'),(49,'467570ac41f211e7a91992ebcb67fe33','67eb9266362111e7a91992ebcb67fe33'),(50,'467570ac41f211e7a91992ebcb67fe33','67eb9a5e362111e7a91992ebcb67fe33'),(51,'467570ac41f211e7a91992ebcb67fe33','67eb9c8e362111e7a91992ebcb67fe33'),(52,'467570ac41f211e7a91992ebcb67fe33','67ebadf0362111e7a91992ebcb67fe33'),(53,'467570ac41f211e7a91992ebcb67fe33','67ebb48a362111e7a91992ebcb67fe33'),(54,'467570ac41f211e7a91992ebcb67fe33','67ebb7d2362111e7a91992ebcb67fe33'),(55,'467570ac41f211e7a91992ebcb67fe33','67ebbade362111e7a91992ebcb67fe33'),(56,'467570ac41f211e7a91992ebcb67fe33','67ebbcdc362111e7a91992ebcb67fe33'),(57,'467570ac41f211e7a91992ebcb67fe33','67ebc11e362111e7a91992ebcb67fe33'),(58,'467570ac41f211e7a91992ebcb67fe33','67ebc376362111e7a91992ebcb67fe33'),(59,'467570ac41f211e7a91992ebcb67fe33','67ebc682362111e7a91992ebcb67fe33'),(60,'467570ac41f211e7a91992ebcb67fe33','67ebc84e362111e7a91992ebcb67fe33'),(61,'467570ac41f211e7a91992ebcb67fe33','67ebcb96362111e7a91992ebcb67fe33'),(62,'467570ac41f211e7a91992ebcb67fe33','67ebcee8362111e7a91992ebcb67fe33'),(63,'467570ac41f211e7a91992ebcb67fe33','67ebd0c8362111e7a91992ebcb67fe33'),(64,'467570ac41f211e7a91992ebcb67fe33','67ebd406362111e7a91992ebcb67fe33'),(65,'467570ac41f211e7a91992ebcb67fe33','67ebd604362111e7a91992ebcb67fe33'),(66,'467570ac41f211e7a91992ebcb67fe33','67ebd924362111e7a91992ebcb67fe33'),(67,'467570ac41f211e7a91992ebcb67fe33','67ebdb0e362111e7a91992ebcb67fe33'),(68,'467570ac41f211e7a91992ebcb67fe33','67ebde88362111e7a91992ebcb67fe33'),(69,'467570ac41f211e7a91992ebcb67fe33','67ebe072362111e7a91992ebcb67fe33'),(70,'467570ac41f211e7a91992ebcb67fe33','67ebe2d4362111e7a91992ebcb67fe33'),(71,'467570ac41f211e7a91992ebcb67fe33','67ebe626362111e7a91992ebcb67fe33'),(72,'467570ac41f211e7a91992ebcb67fe33','67ebe824362111e7a91992ebcb67fe33'),(73,'7ad1422c41f211e7a91992ebcb67fe33','24c1946841ca11e7a91992ebcb67fe33'),(74,'7ad1422c41f211e7a91992ebcb67fe33','24c1974241ca11e7a91992ebcb67fe33'),(75,'7ad1422c41f211e7a91992ebcb67fe33','24c19f4e41ca11e7a91992ebcb67fe33'),(76,'7ad1422c41f211e7a91992ebcb67fe33','24c1a02a41ca11e7a91992ebcb67fe33'),(77,'7ad1422c41f211e7a91992ebcb67fe33','24c1a0f241ca11e7a91992ebcb67fe33'),(78,'7ad1422c41f211e7a91992ebcb67fe33','24c1a7aa41ca11e7a91992ebcb67fe33'),(79,'7ad1422c41f211e7a91992ebcb67fe33','24c1aa5241ca11e7a91992ebcb67fe33'),(80,'7ad1422c41f211e7a91992ebcb67fe33','24c1ab1a41ca11e7a91992ebcb67fe33'),(81,'7ad1422c41f211e7a91992ebcb67fe33','24c1abe241ca11e7a91992ebcb67fe33'),(82,'7ad1422c41f211e7a91992ebcb67fe33','24c1acb441ca11e7a91992ebcb67fe33'),(83,'7ad1422c41f211e7a91992ebcb67fe33','24c1b11e41ca11e7a91992ebcb67fe33'),(84,'7ad1422c41f211e7a91992ebcb67fe33','24c1b49841ca11e7a91992ebcb67fe33'),(85,'7ad1422c41f211e7a91992ebcb67fe33','24c1b55641ca11e7a91992ebcb67fe33'),(86,'7ad1422c41f211e7a91992ebcb67fe33','24c1b61e41ca11e7a91992ebcb67fe33'),(87,'7ad1422c41f211e7a91992ebcb67fe33','24c1ba3841ca11e7a91992ebcb67fe33'),(88,'7ad1422c41f211e7a91992ebcb67fe33','24c1bd9e41ca11e7a91992ebcb67fe33'),(89,'7ad1422c41f211e7a91992ebcb67fe33','24c1be5c41ca11e7a91992ebcb67fe33'),(90,'7ad1422c41f211e7a91992ebcb67fe33','24c1c34841ca11e7a91992ebcb67fe33'),(91,'7ad1422c41f211e7a91992ebcb67fe33','24c1c48841ca11e7a91992ebcb67fe33'),(94,'7ad1422c41f211e7a91992ebcb67fe33','24c1c6e041ca11e7a91992ebcb67fe33'),(95,'7ad1422c41f211e7a91992ebcb67fe33','24c1cd5c41ca11e7a91992ebcb67fe33'),(96,'7ad1422c41f211e7a91992ebcb67fe33','24c1ce8841ca11e7a91992ebcb67fe33'),(97,'7ad1422c41f211e7a91992ebcb67fe33','24c1cf5a41ca11e7a91992ebcb67fe33'),(98,'7ad1422c41f211e7a91992ebcb67fe33','24c1d1bc41ca11e7a91992ebcb67fe33'),(99,'7ad1422c41f211e7a91992ebcb67fe33','24c1d28441ca11e7a91992ebcb67fe33'),(100,'7ad1422c41f211e7a91992ebcb67fe33','67eb4eb4362111e7a91992ebcb67fe33'),(101,'7ad1422c41f211e7a91992ebcb67fe33','67eb54d6362111e7a91992ebcb67fe33'),(102,'7ad1422c41f211e7a91992ebcb67fe33','67eb59d6362111e7a91992ebcb67fe33'),(103,'7ad1422c41f211e7a91992ebcb67fe33','67eb5f80362111e7a91992ebcb67fe33'),(104,'7ad1422c41f211e7a91992ebcb67fe33','67eb64a8362111e7a91992ebcb67fe33'),(105,'7ad1422c41f211e7a91992ebcb67fe33','67eb69e4362111e7a91992ebcb67fe33'),(106,'7ad1422c41f211e7a91992ebcb67fe33','67eb7416362111e7a91992ebcb67fe33'),(107,'7ad1422c41f211e7a91992ebcb67fe33','67eb7c18362111e7a91992ebcb67fe33'),(108,'7ad1422c41f211e7a91992ebcb67fe33','67eb82f8362111e7a91992ebcb67fe33'),(109,'7ad1422c41f211e7a91992ebcb67fe33','67eb88b6362111e7a91992ebcb67fe33'),(110,'7ad1422c41f211e7a91992ebcb67fe33','67eb9090362111e7a91992ebcb67fe33'),(111,'7ad1422c41f211e7a91992ebcb67fe33','67eb9572362111e7a91992ebcb67fe33'),(112,'7ad1422c41f211e7a91992ebcb67fe33','67eb9e64362111e7a91992ebcb67fe33'),(113,'7ad1422c41f211e7a91992ebcb67fe33','67ebeb76362111e7a91992ebcb67fe33'),(114,'7ad1422c41f211e7a91992ebcb67fe33','67ebed74362111e7a91992ebcb67fe33'),(115,'7ad1422c41f211e7a91992ebcb67fe33','67ebf292362111e7a91992ebcb67fe33'),(116,'7ad1422c41f211e7a91992ebcb67fe33','67ebf490362111e7a91992ebcb67fe33'),(117,'7ad1422c41f211e7a91992ebcb67fe33','67ebf74c362111e7a91992ebcb67fe33'),(118,'7ad1422c41f211e7a91992ebcb67fe33','67ebfb20362111e7a91992ebcb67fe33'),(119,'7ad1422c41f211e7a91992ebcb67fe33','67ebfd14362111e7a91992ebcb67fe33'),(120,'7ad1422c41f211e7a91992ebcb67fe33','67ebffe4362111e7a91992ebcb67fe33'),(121,'7ad1422c41f211e7a91992ebcb67fe33','67ec01ba362111e7a91992ebcb67fe33'),(122,'7ad1422c41f211e7a91992ebcb67fe33','67ec04e4362111e7a91992ebcb67fe33'),(123,'7ad1422c41f211e7a91992ebcb67fe33','67ec06c4362111e7a91992ebcb67fe33'),(124,'7ad1422c41f211e7a91992ebcb67fe33','67ec0890362111e7a91992ebcb67fe33'),(125,'7ad1422c41f211e7a91992ebcb67fe33','67ec0c0a362111e7a91992ebcb67fe33'),(126,'7ad1422c41f211e7a91992ebcb67fe33','67ec0df4362111e7a91992ebcb67fe33'),(127,'7ad1422c41f211e7a91992ebcb67fe33','67ec10e2362111e7a91992ebcb67fe33'),(128,'7ad1422c41f211e7a91992ebcb67fe33','67ec1402362111e7a91992ebcb67fe33'),(129,'7ad1422c41f211e7a91992ebcb67fe33','07d1f9fe5afe11e7907ba6006ad3dba0');
/*!40000 ALTER TABLE `r_role_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_role_ugroup`
--

DROP TABLE IF EXISTS `r_role_ugroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_role_ugroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ugroupid` varchar(32) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RUG_REF_ROLE` (`roleid`),
  KEY `FK_RUG_REF_UGROUP` (`ugroupid`),
  CONSTRAINT `FK_RUG_REF_ROLE` FOREIGN KEY (`roleid`) REFERENCES `t_bd_role` (`roleid`),
  CONSTRAINT `FK_RUG_REF_UGROUP` FOREIGN KEY (`ugroupid`) REFERENCES `t_bd_ugroup` (`ugroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_role_ugroup`
--

LOCK TABLES `r_role_ugroup` WRITE;
/*!40000 ALTER TABLE `r_role_ugroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_role_ugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_user_role`
--

DROP TABLE IF EXISTS `r_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) NOT NULL,
  `roleid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UR_REF_ROLE` (`roleid`),
  KEY `FK_UR_REF_USER` (`userid`),
  CONSTRAINT `FK_UR_REF_ROLE` FOREIGN KEY (`roleid`) REFERENCES `t_bd_role` (`roleid`),
  CONSTRAINT `FK_UR_REF_USER` FOREIGN KEY (`userid`) REFERENCES `t_bd_user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_user_role`
--

LOCK TABLES `r_user_role` WRITE;
/*!40000 ALTER TABLE `r_user_role` DISABLE KEYS */;
INSERT INTO `r_user_role` VALUES (1,'6e01c7ce404411e7a91992ebcb67fe33','f0fd6c5841ef11e7a91992ebcb67fe33'),(8,'15092ae781604a779f740c9a94e86066','467570ac41f211e7a91992ebcb67fe33'),(9,'96b2656005714c65947bb398177ecd18','7ad1422c41f211e7a91992ebcb67fe33'),(10,'6c1fc3f36749405ca1607f21f5d49a57','7ad1422c41f211e7a91992ebcb67fe33'),(11,'c22d33456cae463eaa2f52a018c51bf1','7ad1422c41f211e7a91992ebcb67fe33');
/*!40000 ALTER TABLE `r_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_user_ugroup`
--

DROP TABLE IF EXISTS `r_user_ugroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_user_ugroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ugroupid` varchar(32) NOT NULL,
  `userid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_UUG_REF_UGROUP` (`ugroupid`),
  KEY `FK_UUG_REF_USER` (`userid`),
  CONSTRAINT `FK_UUG_REF_UGROUP` FOREIGN KEY (`ugroupid`) REFERENCES `t_bd_ugroup` (`ugroupid`),
  CONSTRAINT `FK_UUG_REF_USER` FOREIGN KEY (`userid`) REFERENCES `t_bd_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_user_ugroup`
--

LOCK TABLES `r_user_ugroup` WRITE;
/*!40000 ALTER TABLE `r_user_ugroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_user_ugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_auth`
--

DROP TABLE IF EXISTS `t_bd_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_auth` (
  `authid` varchar(32) NOT NULL,
  `authtype` varchar(50) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`authid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_auth`
--

LOCK TABLES `t_bd_auth` WRITE;
/*!40000 ALTER TABLE `t_bd_auth` DISABLE KEYS */;
INSERT INTO `t_bd_auth` VALUES ('07d1f9fe5afe11e7907ba6006ad3dba0','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1946841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1974241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1986441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1995441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c19aa841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c19f4e41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a02a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a0f241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a1ba41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a28241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a34a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a7aa41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a8a441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1a98a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1aa5241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1ab1a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1abe241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1acb441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b11e41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b23641ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b30841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b3d041ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b49841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b55641ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1b61e41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1ba3841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1bb1441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1bbe641ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1bcd641ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1bd9e41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1be5c41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c34841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c48841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c55041ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c61841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c6e041ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c7a841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1c87a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1cd5c41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1ce8841ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1cf5a41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1d02241ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1d0f441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1d1bc41ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('24c1d28441ca11e7a91992ebcb67fe33','AT_MENU',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb4aa4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb4eb4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb50d0362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb54d6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb56c0362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb59d6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb5d82362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb5f80362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb62d2362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb64a8362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb6822362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb69e4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb6e08362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb7222362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb7416362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb77ae362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb7c18362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb7f56362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb8140362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb82f8362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb86d6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb88b6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb8bd6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb8dac362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9090362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9266362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9572362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9a5e362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9c8e362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eb9e64362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eba1f2362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eba558362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eba724362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67eba8e6362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebadf0362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebb25a362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebb48a362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebb7d2362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebbade362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebbcdc362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebc11e362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebc376362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebc682362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebc84e362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebcb96362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebcee8362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebd0c8362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebd406362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebd604362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebd924362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebdb0e362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebde88362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebe072362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebe2d4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebe626362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebe824362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebeb76362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebed74362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebf292362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebf490362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebf74c362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebfb20362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebfd14362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ebffe4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec01ba362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec04e4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec06c4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec0890362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec0c0a362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec0df4362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec10e2362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL),('67ec1402362111e7a91992ebcb67fe33','AT_OPTION',0,'Admin','2017-05-11 15:35:28',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_customer`
--

DROP TABLE IF EXISTS `t_bd_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_customer` (
  `customerid` varchar(32) NOT NULL,
  `customerno` varchar(32) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `custfrom` varchar(20) NOT NULL,
  `relax` varchar(32) NOT NULL,
  `telphone` varchar(15) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_customer`
--

LOCK TABLES `t_bd_customer` WRITE;
/*!40000 ALTER TABLE `t_bd_customer` DISABLE KEYS */;
INSERT INTO `t_bd_customer` VALUES ('53d6a6e31b5144808a76b889bdde4f7a','003','沈阳冠宇科技有限公司','合作伙伴','李忠奇','02483656988','13995555333','lksj@163.com','沈阳市和平区三好街中润国际A2104',0,'6c1fc3f36749405ca1607f21f5d49a57','2017-06-27 13:24:20',NULL,NULL),('d2d73b3eb09b425599ac16cba068fbb4','001','沈阳金蝶分销有限公司','电话销售','王燕南','02483993289','13072455667','312915972@qq.com','沈阳市和平区三好街百脑汇1520室',0,'15092ae781604a779f740c9a94e86066','2017-06-23 13:38:06',NULL,NULL),('f9b45846cb7b442e8b2b3bae15fcddb8','002','沈阳好生意有限公司','电话销售','李**','02489556896','13842025895','13842025895@qq.com','沈阳市和平区三好街百脑汇1522',0,'15092ae781604a779f740c9a94e86066','2017-06-23 13:42:31',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_department`
--

DROP TABLE IF EXISTS `t_bd_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_department` (
  `deptid` varchar(32) NOT NULL,
  `deptno` varchar(16) NOT NULL,
  `deptname` varchar(32) NOT NULL,
  `deptlogo` varchar(50) DEFAULT NULL,
  `deptmanageruname` varchar(32) DEFAULT NULL,
  `isend` tinyint(1) DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_department`
--

LOCK TABLES `t_bd_department` WRITE;
/*!40000 ALTER TABLE `t_bd_department` DISABLE KEYS */;
INSERT INTO `t_bd_department` VALUES ('75cbbe0cb97f47a2be6495a14af34dbe','002','实施部',NULL,'lsm',NULL,0,'15092ae781604a779f740c9a94e86066','2017-06-21 09:14:22',NULL,NULL),('83d05e3b22284d85b2784a97a6e6db07','test','测试部门',NULL,'zqt',NULL,0,'15092ae781604a779f740c9a94e86066','2017-06-29 09:59:22',NULL,NULL),('8ec57179f873442c93528576a7f46870','001','开发部',NULL,'songshuwen',NULL,0,'15092ae781604a779f740c9a94e86066','2017-06-20 17:58:05',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_element`
--

DROP TABLE IF EXISTS `t_bd_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_element` (
  `elementid` varchar(32) NOT NULL,
  `elementcode` varchar(50) NOT NULL,
  `isdistribute` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`elementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_element`
--

LOCK TABLES `t_bd_element` WRITE;
/*!40000 ALTER TABLE `t_bd_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bd_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_file`
--

DROP TABLE IF EXISTS `t_bd_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_file` (
  `fileid` varchar(32) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `filepath` varchar(80) NOT NULL,
  `isdistribute` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_file`
--

LOCK TABLES `t_bd_file` WRITE;
/*!40000 ALTER TABLE `t_bd_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bd_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_menu`
--

DROP TABLE IF EXISTS `t_bd_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_menu` (
  `menuid` varchar(32) NOT NULL,
  `menuname` varchar(32) NOT NULL,
  `menuurl` varchar(80) DEFAULT NULL,
  `menulevel` tinyint(4) NOT NULL,
  `parentmenuid` varchar(32) DEFAULT NULL,
  `isdistribute` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_menu`
--

LOCK TABLES `t_bd_menu` WRITE;
/*!40000 ALTER TABLE `t_bd_menu` DISABLE KEYS */;
INSERT INTO `t_bd_menu` VALUES ('0284aa2041ca11e7a91992ebcb67fe33','系统设置',NULL,1,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284ae2641ca11e7a91992ebcb67fe33','角色管理',NULL,2,'0284aa2041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284afca41ca11e7a91992ebcb67fe33','组织角色列表','role_orgRoleList.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284b12841ca11e7a91992ebcb67fe33','组织角色新增','role_orgRoleAdd.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284b29a41ca11e7a91992ebcb67fe33','组织用户角色分配','role_orgRoleDist.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284b7d641ca11e7a91992ebcb67fe33','部门角色列表','role_deptRoleList.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284b9b641ca11e7a91992ebcb67fe33','部门角色新增','role_deptRoleAdd.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284bb0041ca11e7a91992ebcb67fe33','部门用户角色分配','role_deptRoleDist.html',3,'0284ae2641ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284bc4a41ca11e7a91992ebcb67fe33','组织管理',NULL,2,'0284aa2041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284bdc641ca11e7a91992ebcb67fe33','基础信息设置','sys_orgBaseInit.html',3,'0284bc4a41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284bf4c41ca11e7a91992ebcb67fe33','基础信息修改','org_orgBaseInfoSetting.html',3,'0284bc4a41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284c0be41ca11e7a91992ebcb67fe33','部门管理',NULL,2,'0284aa2041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284c83441ca11e7a91992ebcb67fe33','组织部门列表','dept_orgDeptList.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284ca0a41ca11e7a91992ebcb67fe33','组织部门新增','dept_orgDeptAdd.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284cb6841ca11e7a91992ebcb67fe33','同级部门列表','dept_deptList.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284cd2041ca11e7a91992ebcb67fe33','部门信息修改','dept_deptInfoSetting.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284ceb041ca11e7a91992ebcb67fe33','部门子部门列表','dept_subDeptList.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284d01841ca11e7a91992ebcb67fe33','部门子部门新增','dept_subDeptAdd.html',3,'0284c0be41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284d16c41ca11e7a91992ebcb67fe33','用户管理',NULL,2,'0284aa2041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284d82441ca11e7a91992ebcb67fe33','组织用户列表','user_orgUserList.html',3,'0284d16c41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284da4041ca11e7a91992ebcb67fe33','组织用户新增','user_orgUserAdd.html',3,'0284d16c41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284db8a41ca11e7a91992ebcb67fe33','组织用户分配','user_orgUserDist.html',3,'0284d16c41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284dcde41ca11e7a91992ebcb67fe33','部门用户列表','user_deptUserList.html',3,'0284d16c41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284de3241ca11e7a91992ebcb67fe33','部门用户分配','user_deptUserDist.html',3,'0284d16c41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284df7241ca11e7a91992ebcb67fe33','业务操作',NULL,1,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284e0bc41ca11e7a91992ebcb67fe33','客户管理',NULL,2,'0284df7241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284e6d441ca11e7a91992ebcb67fe33','组织客户列表','custom_orgCustList.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284e87841ca11e7a91992ebcb67fe33','组织客户新增','custom_orgCustAdd.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284ea1241ca11e7a91992ebcb67fe33','组织客户分配','custom_orgCustDist.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284eb5c41ca11e7a91992ebcb67fe33','部门客户列表','custom_deptCustList.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284ec9241ca11e7a91992ebcb67fe33','部门客户新增','custom_deptCustAdd.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284edb441ca11e7a91992ebcb67fe33','部门客户分配','custom_deptCustDist.html',3,'0284e0bc41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284f2f041ca11e7a91992ebcb67fe33','产品管理',NULL,2,'0284df7241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284f51641ca11e7a91992ebcb67fe33','组织产品列表','product_orgProList.html',3,'0284f2f041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284f67e41ca11e7a91992ebcb67fe33','组织产品新增','product_orgProAdd.html',3,'0284f2f041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284f7fa41ca11e7a91992ebcb67fe33','交易管理',NULL,2,'0284df7241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284f94441ca11e7a91992ebcb67fe33','组织交易列表','trade_orgTradeList.html',3,'0284f7fa41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284fa7a41ca11e7a91992ebcb67fe33','组织交易新增','trade_orgTradeAdd.html',3,'0284f7fa41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0284fbb041ca11e7a91992ebcb67fe33','部门交易列表','trade_deptTradeList.html',3,'0284f7fa41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0285010041ca11e7a91992ebcb67fe33','部门交易新增','trade_deptTradeAdd.html',3,'0284f7fa41ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('028502c241ca11e7a91992ebcb67fe33','服务管理',NULL,2,'0284df7241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0285040c41ca11e7a91992ebcb67fe33','组织服务列表','server_orgServList.html',3,'028502c241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0285053841ca11e7a91992ebcb67fe33','组织服务新增','server_orgServAdd.html',3,'028502c241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('0285067841ca11e7a91992ebcb67fe33','部门服务列表','server_deptServList.html',3,'028502c241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('028507ae41ca11e7a91992ebcb67fe33','部门服务新增','server_deptServAdd.html',3,'028502c241ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('2fba2eb05afd11e7907ba6006ad3dba0','部门产品列表','product_deptProList.html',3,'0284f2f041ca11e7a91992ebcb67fe33',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_opt`
--

DROP TABLE IF EXISTS `t_bd_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_opt` (
  `optid` varchar(32) NOT NULL,
  `optname` varchar(50) NOT NULL,
  `optcode` varchar(50) NOT NULL,
  `preurl` varchar(80) DEFAULT NULL,
  `parentid` varchar(32) DEFAULT NULL,
  `isdistribute` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`optid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_opt`
--

LOCK TABLES `t_bd_opt` WRITE;
/*!40000 ALTER TABLE `t_bd_opt` DISABLE KEYS */;
INSERT INTO `t_bd_opt` VALUES ('4dcd678a361f11e7a91992ebcb67fe33','组织层-查询所有交易记录','TRA_ORG_CHECKALLTRALIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd6a8c361f11e7a91992ebcb67fe33','部门层-查询部门交易记录','TRA_DEPT_CHECKDEPTTRALIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd6b9a361f11e7a91992ebcb67fe33','组织层-新增服务','SERV_ORG_ADDSERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd6c6c361f11e7a91992ebcb67fe33','部门层-新增服务','SERV_DEPT_ADDSERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd6d3e361f11e7a91992ebcb67fe33','组织层-分配客户给部门','CUST_ORG_DISDEPTCUST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd719e361f11e7a91992ebcb67fe33','部门层-分配客户给子部门','CUST_DEPT_DISSUBDEPTCUST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7298361f11e7a91992ebcb67fe33','组织层-新增组织客户','CUST_ORG_ADDORGCUST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd736a361f11e7a91992ebcb67fe33','部门层-新增此部门客户','CUST_DEPT_ADDDEPTCUST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7432361f11e7a91992ebcb67fe33','组织层-新增交易','TRA_ORG_ADDTRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd74fa361f11e7a91992ebcb67fe33','部门层-新增交易','TRA_DEPT_ADDTRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7626361f11e7a91992ebcb67fe33','组织层-修改交易','TRA_ORG_MODIFYTRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd79a0361f11e7a91992ebcb67fe33','部门层-修改交易','TRA_DEPT_MODIFYTRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7a86361f11e7a91992ebcb67fe33','组织层-修改产品','PRO_ORG_MODIFYPRO',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7b4e361f11e7a91992ebcb67fe33','组织层-查询所有服务记录','SERV_ORG_CHECKALLSERVLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7c0c361f11e7a91992ebcb67fe33','部门层-查询部门服务记录','SERV_DEPT_CHECKDEPTSERVLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7cd4361f11e7a91992ebcb67fe33','组织层-修改服务','SERV_ORG_MODIFYSERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7d92361f11e7a91992ebcb67fe33','部门层-修改服务','SERV_DEPT_MODIFYSERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd7e5a361f11e7a91992ebcb67fe33','组织层-删除产品','PRO_ORG_DELETEPRO',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd81a2361f11e7a91992ebcb67fe33','组织层-删除交易','TRA_ORG_DELETETRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8288361f11e7a91992ebcb67fe33','部门层-删除交易','TRA_DEPT_DELETETRA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd835a361f11e7a91992ebcb67fe33','组织层-删除服务','SERV_ORG_DELETESERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8422361f11e7a91992ebcb67fe33','部门层-删除服务','SERV_DEPT_DELETESERV',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd84ea361f11e7a91992ebcb67fe33','组织层-删除全部客户','CUST_ORG_DELETECUST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd85a8361f11e7a91992ebcb67fe33','组织层-查找全部客户','CUST_ORG_CHECKALLCUSTLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd867a361f11e7a91992ebcb67fe33','部门层-查找被分配客户','CUST_DEPT_CHECKCUSTLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8a44361f11e7a91992ebcb67fe33','组织层-查找全部产品','PRO_ORG_CHECKALLPROLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8b34361f11e7a91992ebcb67fe33','部门层-查找全部产品','PRO_DEPT_CHECKALLPROLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8bfc361f11e7a91992ebcb67fe33','组织层-添加产品','PRO_ORG_ADDPRO',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8cba361f11e7a91992ebcb67fe33','组织层-修改客户信息','CUST_ORG_MODIFYDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('4dcd8d82361f11e7a91992ebcb67fe33','部门层-修改被分配客户信息','CUST_DEPT_MODIFYDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee7899fa361711e7a91992ebcb67fe33','清理长期未使用的删除数据','SYS_SYS_CLEARDATA',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a012361711e7a91992ebcb67fe33','查看系统登录记录','SYS_SYS_LOGINLOG',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a116361711e7a91992ebcb67fe33','查看组织操作记录','SYS_SYS_OPTIONLOG',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a1e8361711e7a91992ebcb67fe33','查看错误日志','SYS_SYS_ERRORLOG',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a378361711e7a91992ebcb67fe33','查询组织结构框架','SYS_ORG_CHECKALLORGDOWNLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a436361711e7a91992ebcb67fe33','新增并分配组织管理员用户','SYS_ORG_ADDORGANDMANAGER','/sys/org/addorgandmanager',NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a80a361711e7a91992ebcb67fe33','修改组织基础信息','ORG_ORG_MODIFYORG',NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78a904361711e7a91992ebcb67fe33','查询所有用户','ORG_USER_CHECKORGUSERSLIST','/org/user/checkorguserslist',NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78aa8a361711e7a91992ebcb67fe33','分配部门用户','ORG_USER_DISDEPTUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78ac24361711e7a91992ebcb67fe33','分配部门子部门用户','ORG_USER_DISSUBDEPTUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78ad14361711e7a91992ebcb67fe33','设置用户基本信息','ORG_USER_ADDUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78addc361711e7a91992ebcb67fe33','禁用用户','ORG_USER_FORBDDENUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78aeae361711e7a91992ebcb67fe33','启用用户','ORG_USER_UNFORBDDENUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b35e361711e7a91992ebcb67fe33','删除用户','ORG_USER_DELETEUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b48a361711e7a91992ebcb67fe33','查询所有部门（包括子部门）列表','ORG_DEPT_CHECKDEPTLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b552361711e7a91992ebcb67fe33','设置部门基本信息','ORG_DEPT_ADDDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b62e361711e7a91992ebcb67fe33','设置部门管理员用户','ORG_DEPT_SETDEPTMANAGER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b6f6361711e7a91992ebcb67fe33','修改部门基本信息','ORG_DEPT_MODIFYDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b7be361711e7a91992ebcb67fe33','设置部门管理员用户','ORG_DEPT_MODIFYDEPTMANAGER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78b87c361711e7a91992ebcb67fe33','删除组织部门','ORG_DEPT_DELETEDEPT',NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78bc6e361711e7a91992ebcb67fe33','查询组织层级角色列表','ORG_ROLE_CHECKORGROLELIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78bd4a361711e7a91992ebcb67fe33','设置用户角色','ORG_ROLE_SETUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78be12361711e7a91992ebcb67fe33','修改用户角色','ORG_ROLE_MODIFYUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78beda361711e7a91992ebcb67fe33','增加组织层级角色','ORG_ROLE_ADDORGUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78bfac361711e7a91992ebcb67fe33','修改组织层级角色','ORG_ROLE_MODIFYORGUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c074361711e7a91992ebcb67fe33','删除组织层级角色','ORG_ROLE_DELETEORGUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c132361711e7a91992ebcb67fe33','查询部门用户列表','DEPT_USER_CHECKDEPTANDSUBDEPTUSERLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c60a361711e7a91992ebcb67fe33','分配子部门用户','DEPT_USER_DISSUBDEPTUSER',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c72c361711e7a91992ebcb67fe33','查询同级部门列表','DEPT_DEPT_CHECKPARDEPTLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c7f4361711e7a91992ebcb67fe33','修改部门基础信息','DEPT_DEPT_MODIFYDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c8d0361711e7a91992ebcb67fe33','查询部门子部门列表','DEPT_DEPT_CHECKSUBDEPTLIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78c998361711e7a91992ebcb67fe33','设置部门子部门基础信息','DEPT_DEPT_ADDSUBDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78ca60361711e7a91992ebcb67fe33','设置部门子部门管理员','DEPT_DEPT_SETSUBDEPTMANAGER',NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78cb28361711e7a91992ebcb67fe33','修改部门子部门基础信息','DEPT_DEPT_MODIFYSUBDEPT',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78ce7a361711e7a91992ebcb67fe33','修改部门子部门管理员','DEPT_DEPT_MODIFYSUBDEPTMANAGER',NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78cf74361711e7a91992ebcb67fe33','删除部门子部门','DEPT_DEPT_DELETESUBDEPT',NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d032361711e7a91992ebcb67fe33','查询部门层级角色列表','DEPT_ROLE_CHECKDEPTROLELIST',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d15e361711e7a91992ebcb67fe33','设置部门用户角色','DEPT_ROLE_SETDEPTUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d23a361711e7a91992ebcb67fe33','修改部门用户角色','DEPT_ROLE_MODIFYDEPTUSERROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d302361711e7a91992ebcb67fe33','增加部门层级角色','DEPT_ROLE_ADDDEPTROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d65e361711e7a91992ebcb67fe33','修改部门层级角色','DEPT_ROLE_MODIFYDEPTROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('ee78d73a361711e7a91992ebcb67fe33','删除部门层级角色','DEPT_ROLE_DELETEDEPTROLE',NULL,NULL,1,0,'Admin','2017-05-11 15:35:28',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_opt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_organization`
--

DROP TABLE IF EXISTS `t_bd_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_organization` (
  `orgid` varchar(32) NOT NULL,
  `orgname` varchar(32) NOT NULL,
  `orglogo` blob,
  `orgmanaerid` varchar(32) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_organization`
--

LOCK TABLES `t_bd_organization` WRITE;
/*!40000 ALTER TABLE `t_bd_organization` DISABLE KEYS */;
INSERT INTO `t_bd_organization` VALUES ('ac777b9d994d4f8eac84fac7826ee1b9','沈阳金日盛软件科技有限公司',NULL,'15092ae781604a779f740c9a94e86066',0,'6e01c7ce404411e7a91992ebcb67fe33','2017-06-06 09:59:50',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_product`
--

DROP TABLE IF EXISTS `t_bd_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_product` (
  `productid` varchar(32) NOT NULL,
  `productno` varchar(32) NOT NULL,
  `productname` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_product`
--

LOCK TABLES `t_bd_product` WRITE;
/*!40000 ALTER TABLE `t_bd_product` DISABLE KEYS */;
INSERT INTO `t_bd_product` VALUES ('8f3afdbc06764ba3a51ddba2bf55ff2e','kd001','金蝶KIS','12.0',0,'15092ae781604a779f740c9a94e86066','2017-06-22 11:20:28',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_role`
--

DROP TABLE IF EXISTS `t_bd_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_role` (
  `roleid` varchar(32) NOT NULL,
  `rolename` varchar(32) NOT NULL,
  `isbase` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_role`
--

LOCK TABLES `t_bd_role` WRITE;
/*!40000 ALTER TABLE `t_bd_role` DISABLE KEYS */;
INSERT INTO `t_bd_role` VALUES ('467570ac41f211e7a91992ebcb67fe33','组织管理员',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('7ad1422c41f211e7a91992ebcb67fe33','部门管理员',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('f0fd6c5841ef11e7a91992ebcb67fe33','系统管理员',1,0,'Admin','2017-05-11 15:35:28',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_ugroup`
--

DROP TABLE IF EXISTS `t_bd_ugroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_ugroup` (
  `ugroupid` varchar(32) NOT NULL,
  `ugroupname` varbinary(50) NOT NULL,
  `parentugroupid` varchar(32) DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ugroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_ugroup`
--

LOCK TABLES `t_bd_ugroup` WRITE;
/*!40000 ALTER TABLE `t_bd_ugroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bd_ugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bd_user`
--

DROP TABLE IF EXISTS `t_bd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bd_user` (
  `userid` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `phonenum` varchar(15) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL COMMENT '1：男 \n2：女\n3：其他',
  `birthdate` datetime DEFAULT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `isforbidden` tinyint(1) NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bd_user`
--

LOCK TABLES `t_bd_user` WRITE;
/*!40000 ALTER TABLE `t_bd_user` DISABLE KEYS */;
INSERT INTO `t_bd_user` VALUES ('15092ae781604a779f740c9a94e86066','zzc','123456','张志成',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'6e01c7ce404411e7a91992ebcb67fe33','2017-06-06 09:59:50',NULL,NULL),('4a6d3292ee044c44b7ab9158bf44c41a','test','test123','测试用户','','','1',NULL,'','HUN','HUN_1','',0,0,'15092ae781604a779f740c9a94e86066','2017-06-16 10:41:45',NULL,NULL),('6c1fc3f36749405ca1607f21f5d49a57','lsm','123456','李森茂','13840264264','','1','1981-03-25 00:00:00','李森茂','LN','LN_1','铁西滴',0,0,'15092ae781604a779f740c9a94e86066','2017-06-16 10:28:13',NULL,NULL),('6e01c7ce404411e7a91992ebcb67fe33','Admin','sa123','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,'Admin','2017-05-11 15:35:28',NULL,NULL),('96b2656005714c65947bb398177ecd18','songshuwen','12345b','宋书文','13888888888','2222222@qq.com','1','1979-06-20 00:00:00','宋书文','LN','LN_1','沈阳市大东区',0,0,'15092ae781604a779f740c9a94e86066','2017-06-15 11:48:02',NULL,NULL),('c22d33456cae463eaa2f52a018c51bf1','zqt','123456','张清涛','15640382380','312915972@qq.com','1','1988-10-30 00:00:00','张清涛','LN','LN_1','苏家屯',0,0,'15092ae781604a779f740c9a94e86066','2017-06-16 10:31:48',NULL,NULL),('cf70942c9fda447e850fd326c8da1f87','maru','123456','马茹','13656898745','564654@qq.com','2','1976-06-23 00:00:00','马茹','LN','LN_1','铁西区重工街',0,0,'15092ae781604a779f740c9a94e86066','2017-06-30 14:26:59',NULL,NULL);
/*!40000 ALTER TABLE `t_bd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_crm_server`
--

DROP TABLE IF EXISTS `t_crm_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_crm_server` (
  `serverid` varchar(32) NOT NULL,
  `serverNo` varchar(32) NOT NULL,
  `tradeNo` varchar(32) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `servertype` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `validitydate` datetime DEFAULT NULL,
  `servUsername` varchar(32) NOT NULL,
  `relax` varchar(32) NOT NULL,
  `telphone` varchar(15) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`serverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_crm_server`
--

LOCK TABLES `t_crm_server` WRITE;
/*!40000 ALTER TABLE `t_crm_server` DISABLE KEYS */;
INSERT INTO `t_crm_server` VALUES ('7604b8940c0646159c132d224731638a','serv20160628002','jy2017062801','2017-06-28 00:00:00','2017-06-28 00:00:00','升级','添加模块：报表',400,'2017-06-28 00:00:00','lsm','郭德纲','15640338987','分分分分分分',0,'6c1fc3f36749405ca1607f21f5d49a57','2017-06-28 15:38:56',NULL,NULL),('c9f0e47af2f84173963114d16c53bb10','serv20170625001','jy20170624001','2017-06-21 00:00:00','2017-06-20 00:00:00','升级服务','升级服务升级服务升级服务升级服务升级服务升级服务升级服务升级服务',500,'2017-06-06 00:00:00','zqt','someone','13959565452','sdfadfasdfasdfasdf',0,'15092ae781604a779f740c9a94e86066','2017-06-26 16:13:22',NULL,NULL);
/*!40000 ALTER TABLE `t_crm_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_crm_trade`
--

DROP TABLE IF EXISTS `t_crm_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_crm_trade` (
  `tradeId` varchar(32) NOT NULL,
  `tradeNo` varchar(32) NOT NULL,
  `customerNo` varchar(32) NOT NULL,
  `productNo` varchar(32) NOT NULL,
  `modules` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `freeServer` datetime NOT NULL,
  `serialnumber` varchar(32) DEFAULT NULL,
  `cdkey` varchar(32) DEFAULT NULL,
  `signatures` varchar(32) DEFAULT NULL,
  `encryptiontype` varchar(32) DEFAULT NULL,
  `voucherpapertype` varchar(32) DEFAULT NULL,
  `tradedate` datetime NOT NULL,
  `isdel` tinyint(1) NOT NULL,
  `createuserid` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `updateuserid` varchar(32) DEFAULT NULL,
  `updatedatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`tradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_crm_trade`
--

LOCK TABLES `t_crm_trade` WRITE;
/*!40000 ALTER TABLE `t_crm_trade` DISABLE KEYS */;
INSERT INTO `t_crm_trade` VALUES ('3ffdab2e0e814fe9b0326b84bc19f1c7','jy20170625002','002','kd001','总账，报表，采购，生产',200,68000,'2018-06-24 00:00:00','sdfghjkl654654jkh','erf5678909098098098','iuhiyhoiuy555','软加密','KP-J103','2017-06-24 00:00:00',0,'15092ae781604a779f740c9a94e86066','2017-06-24 18:47:51',NULL,NULL),('c17a9e0421614eff94f33fe6caa9cc08','jy20170624001','001','kd001','总账，报表',20,5000,'2018-06-24 00:00:00','SDF684351687432SD554','KKKK-DDDD-EEEE-XXXX','SADFASDFASDFAWEFWAFZ','智能卡','kpj103','2017-06-24 00:00:00',0,'15092ae781604a779f740c9a94e86066','2017-06-24 13:42:16',NULL,NULL),('d522d1b6f20a498192a76199a7137e4d','jy2017062801','003','kd001','采购',5,3000,'2018-06-28 00:00:00','','','','软加密','KP-J101','2017-06-28 00:00:00',0,'6c1fc3f36749405ca1607f21f5d49a57','2017-06-28 11:53:49',NULL,NULL);
/*!40000 ALTER TABLE `t_crm_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_params`
--

DROP TABLE IF EXISTS `t_sys_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_params` (
  `paramcode` varchar(32) NOT NULL,
  `paramtype` varchar(32) NOT NULL,
  `paramdesc` varchar(100) NOT NULL,
  `paramvalue` varchar(32) NOT NULL,
  PRIMARY KEY (`paramcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_params`
--

LOCK TABLES `t_sys_params` WRITE;
/*!40000 ALTER TABLE `t_sys_params` DISABLE KEYS */;
INSERT INTO `t_sys_params` VALUES ('ADMIN_PASSWORD','AdminType','管理员密码','sa123'),('AT_ELEMENT','AuthType','页面元素权限','AT_ELEMENT'),('AT_FILE','AuthType','文件权限','AT_FILE'),('AT_MENU','AuthType','菜单权限','AT_MENU'),('AT_OPTION','AuthType','操作权限','AT_OPTION'),('ET_HARD','EncryptionType','硬加密方式','ET_HARD'),('ET_SOFT','EncryptionType','软加密方式','ET_SOFT'),('ST_ADDMODULES','ServerType','加模块加点数服务','ST_ADDMODULES'),('ST_DEFINE','ServerType','综合性服务','ST_DEFINE'),('ST_DEVELOP','ServerType','个性开发服务','ST_DEVELOP'),('ST_SERVERPAY','ServerType','服务费收取','ST_SERVERPAY'),('ST_UPDATE','ServerType','升级服务','ST_UPDATE'),('VPT_KPJ101','VoucherPaperType','KP-J101纸型','VPT_KPJ101'),('VPT_KPJ103','VoucherPaperType','KP-J103纸型','VPT_KPJ103'),('VPT_KPJ105','VoucherPaperType','KP-J105纸型','VPT_KPJ105'),('VPT_KPZ101','VoucherPaperType','KP-Z101纸型','VPT_KPZ101'),('VPT_KPZ103','VoucherPaperType','KP-Z103纸型','VPT_KPZ103'),('VPT_KPZ105','VoucherPaperType','KP-Z105纸型','VPT_KPZ105');
/*!40000 ALTER TABLE `t_sys_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_sys_usertoken`
--

DROP TABLE IF EXISTS `t_sys_usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_usertoken` (
  `userid` varchar(32) NOT NULL,
  `token` varchar(32) NOT NULL,
  `createdatetime` datetime NOT NULL,
  `expirydate` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_usertoken`
--

LOCK TABLES `t_sys_usertoken` WRITE;
/*!40000 ALTER TABLE `t_sys_usertoken` DISABLE KEYS */;
INSERT INTO `t_sys_usertoken` VALUES ('15092ae781604a779f740c9a94e86066','8aca9e0767ec4c4e9590ca53ac7e8b24','2017-07-13 15:36:27',7200),('6c1fc3f36749405ca1607f21f5d49a57','7b7704d581ba4f9094dcf27acc686584','2017-07-10 13:15:57',7200),('6e01c7ce404411e7a91992ebcb67fe33','790f218a5c9c4a11af02e6c72d1e8cf0','2017-06-30 14:18:27',7200),('96b2656005714c65947bb398177ecd18','f3b0e1b109b44aa388bc1f4ca88e4983','2017-06-21 13:07:34',7200);
/*!40000 ALTER TABLE `t_sys_usertoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-13 16:58:06
