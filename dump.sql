-- MySQL dump 10.13  Distrib 5.5.59, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: idologis
-- ------------------------------------------------------
-- Server version	5.5.59-0+deb7u1

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
-- Current Database: `idologis`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `idologis` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `idologis`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'root','63a9f0ea7bb98050796b649e85481845'),(3,'arthur','63a9f0ea7bb98050796b649e85481845'),(4,'nathan','63a9f0ea7bb98050796b649e85481845'),(5,'theo','c04667b9a1503857465c5e998f4734cc'),(6,'admin','21232f297a57a5a743894a0e4a801fc3'),(7,'julien','63a9f0ea7bb98050796b649e85481845');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `reference` int(10) NOT NULL AUTO_INCREMENT,
  `id_type` int(10) DEFAULT NULL,
  `id_secteur` int(10) DEFAULT NULL,
  `surface` int(10) DEFAULT NULL,
  `chambres` int(2) DEFAULT NULL,
  `surface_terrain` int(5) DEFAULT NULL,
  `classe_energetique` varchar(2) DEFAULT NULL,
  `les_plus` text,
  `loyer` int(9) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reference`),
  KEY `FK_TypeLocation` (`id_type`),
  KEY `FK_SecteurLocation` (`id_secteur`),
  CONSTRAINT `FK_SecteurLocation` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id`),
  CONSTRAINT `FK_TypeLocation` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,3,3,150,3,500,'B','Piscine',125900,'location1'),(2,2,2,72,2,130,'C','',53000,'location1'),(3,3,3,150,3,500,'B','Piscine',125900,'location1');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secteur` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secteur`
--

LOCK TABLES `secteur` WRITE;
/*!40000 ALTER TABLE `secteur` DISABLE KEYS */;
INSERT INTO `secteur` VALUES (1,'Calais'),(2,'Dunkerque'),(3,'Lille'),(4,'Calais'),(5,'Dunkerque'),(6,'Lille');
/*!40000 ALTER TABLE `secteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Appartement'),(2,'Maison'),(3,'Pavillon'),(4,'Appartement'),(5,'Maison'),(6,'Pavillon');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente` (
  `reference` int(10) NOT NULL AUTO_INCREMENT,
  `id_type` int(10) DEFAULT NULL,
  `id_secteur` int(10) DEFAULT NULL,
  `surface` int(10) DEFAULT NULL,
  `chambres` int(2) DEFAULT NULL,
  `surface_terrain` int(5) DEFAULT NULL,
  `classe_energetique` varchar(2) DEFAULT NULL,
  `les_plus` text,
  `prix` int(9) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reference`),
  KEY `FK_TypeVente` (`id_type`),
  KEY `FK_SecteurVente` (`id_secteur`),
  CONSTRAINT `FK_SecteurVente` FOREIGN KEY (`id_secteur`) REFERENCES `secteur` (`id`),
  CONSTRAINT `FK_TypeVente` FOREIGN KEY (`id_type`) REFERENCES `type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente`
--

LOCK TABLES `vente` WRITE;
/*!40000 ALTER TABLE `vente` DISABLE KEYS */;
INSERT INTO `vente` VALUES (1,1,1,150,3,500,'B','Piscine',125900,'vente1'),(2,2,2,72,2,130,'C','',53000,'location1'),(3,1,1,150,3,500,'B','Piscine',125900,'location1'),(4,2,2,72,2,130,'C','',53000,'location1'),(5,3,4,50,2,130,'C','piscine',1245,'location1.png');
/*!40000 ALTER TABLE `vente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-05 16:37:23
