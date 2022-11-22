-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: trocqc
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` int NOT NULL,
  `cost` float NOT NULL,
  `duration` enum('hour','day','week','month','trimester','year') NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `note_body` varchar(250) NOT NULL,
  `note_subject` varchar(100) NOT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `SKU` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `MSRP` double NOT NULL,
  `addedData` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `idUnitOfMesure` int NOT NULL,
  `quanity` double NOT NULL,
  `lowQuantityLevel` float DEFAULT NULL,
  `userID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_FK` (`idUnitOfMesure`),
  KEY `product_FK_1` (`userID`),
  CONSTRAINT `product_FK` FOREIGN KEY (`idUnitOfMesure`) REFERENCES `unitofmesure` (`id`),
  CONSTRAINT `product_FK_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcustomfields`
--

DROP TABLE IF EXISTS `productcustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcustomfields` (
  `productid` int DEFAULT NULL,
  `fieldtypeid` int DEFAULT NULL,
  `fieldvalue` varchar(100) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  KEY `productcustomfields_FK` (`productid`),
  KEY `productcustomfields_FK_1` (`fieldtypeid`),
  KEY `productcustomfields_FK_2` (`userId`),
  CONSTRAINT `productcustomfields_FK` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  CONSTRAINT `productcustomfields_FK_1` FOREIGN KEY (`fieldtypeid`) REFERENCES `productcustomfieldtypes` (`id`),
  CONSTRAINT `productcustomfields_FK_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcustomfields`
--

LOCK TABLES `productcustomfields` WRITE;
/*!40000 ALTER TABLE `productcustomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `productcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcustomfieldtypes`
--

DROP TABLE IF EXISTS `productcustomfieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productcustomfieldtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `type` enum('int','varchar','color') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcustomfieldtypes`
--

LOCK TABLES `productcustomfieldtypes` WRITE;
/*!40000 ALTER TABLE `productcustomfieldtypes` DISABLE KEYS */;
INSERT INTO `productcustomfieldtypes` VALUES (1,'Couleur Principale','color'),(2,'Type de batterie','varchar');
/*!40000 ALTER TABLE `productcustomfieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterial`
--

DROP TABLE IF EXISTS `rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `cost` float NOT NULL,
  `addedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quanity` float NOT NULL,
  `idUnitOfMesure` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rawmaterial_FK` (`idUnitOfMesure`),
  CONSTRAINT `rawmaterial_FK` FOREIGN KEY (`idUnitOfMesure`) REFERENCES `unitofmesure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `rawmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterialcustomfields`
--

DROP TABLE IF EXISTS `rawmaterialcustomfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterialcustomfields` (
  `rawMaterialid` int NOT NULL,
  `fieldtypeid` int NOT NULL,
  `fieldValue` varchar(100) NOT NULL,
  `UserId` int NOT NULL,
  KEY `rawmaterialcustomfields_FK` (`rawMaterialid`),
  KEY `rawmaterialcustomfields_FK_1` (`fieldtypeid`),
  KEY `rawmaterialcustomfields_FK_2` (`UserId`),
  CONSTRAINT `rawmaterialcustomfields_FK` FOREIGN KEY (`rawMaterialid`) REFERENCES `rawmaterial` (`id`),
  CONSTRAINT `rawmaterialcustomfields_FK_1` FOREIGN KEY (`fieldtypeid`) REFERENCES `rawmaterialcustomfieldtypes` (`id`),
  CONSTRAINT `rawmaterialcustomfields_FK_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialcustomfields`
--

LOCK TABLES `rawmaterialcustomfields` WRITE;
/*!40000 ALTER TABLE `rawmaterialcustomfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `rawmaterialcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterialcustomfieldtypes`
--

DROP TABLE IF EXISTS `rawmaterialcustomfieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterialcustomfieldtypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `type` enum('nombre','texte','couleur') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialcustomfieldtypes`
--

LOCK TABLES `rawmaterialcustomfieldtypes` WRITE;
/*!40000 ALTER TABLE `rawmaterialcustomfieldtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `rawmaterialcustomfieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterialproducts`
--

DROP TABLE IF EXISTS `rawmaterialproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterialproducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduct` int NOT NULL,
  `idMaterial` int NOT NULL,
  `QuantityMaterialForProduct` float NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RawMaterialProducts_FK` (`idProduct`),
  KEY `RawMaterialProducts_FK_1` (`idMaterial`),
  CONSTRAINT `RawMaterialProducts_FK` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`),
  CONSTRAINT `RawMaterialProducts_FK_1` FOREIGN KEY (`idMaterial`) REFERENCES `rawmaterial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialproducts`
--

LOCK TABLES `rawmaterialproducts` WRITE;
/*!40000 ALTER TABLE `rawmaterialproducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rawmaterialproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenugrowth`
--

DROP TABLE IF EXISTS `revenugrowth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenugrowth` (
  `id` int NOT NULL,
  `date` timestamp NOT NULL,
  `total_expenses` float NOT NULL,
  `total_revenu` float NOT NULL,
  `profit` float NOT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenugrowth_FK` (`UserID`),
  CONSTRAINT `revenugrowth_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenugrowth`
--

LOCK TABLES `revenugrowth` WRITE;
/*!40000 ALTER TABLE `revenugrowth` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenugrowth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitofmesure`
--

DROP TABLE IF EXISTS `unitofmesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitofmesure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `abrievation` varchar(100) NOT NULL,
  `parent` int NOT NULL,
  `ratio` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unitofmesure_un` (`parent`),
  CONSTRAINT `unitofmesure_FK` FOREIGN KEY (`parent`) REFERENCES `unitofmesure` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitofmesure`
--

LOCK TABLES `unitofmesure` WRITE;
/*!40000 ALTER TABLE `unitofmesure` DISABLE KEYS */;
/*!40000 ALTER TABLE `unitofmesure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productCategory` enum('vêtements','appareils électroniques','produits pour animaux','artisanal','services','cosmétiques','passe-temps') NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` char(7) NOT NULL,
  `siteWeb` varchar(100) DEFAULT NULL,
  `Avatar` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'passe-temps','Bob','Builder','bob@bob.bob','bob','bob','262 bob','bobtown','B0B0B0',NULL,NULL),(2,'artisanal','Ava','Adam','ava@ava.ava','ava','ava','293 ava','avacity','A7A7A7',NULL,NULL),(8,'appareils électroniques','Korallia','Frenette','KoralliaFrenette@gmail.com','123','Korallia Frenette','2370 rue des saturnies','St-bruno','J3V 0E3','qqw','ArthemisMasque.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'trocqc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-16 19:52:30
