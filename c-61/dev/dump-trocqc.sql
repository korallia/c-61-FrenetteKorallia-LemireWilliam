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
  `id` int NOT NULL,
  `note_text` varchar(250) NOT NULL,
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
  `addedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `idUnitOfMeasure` int NOT NULL,
  `quantity` double NOT NULL,
  `lowQuantityLevel` float DEFAULT NULL,
  `userID` int NOT NULL,
  `QRcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_FK` (`idUnitOfMeasure`),
  KEY `product_FK_1` (`userID`),
  CONSTRAINT `product_FK` FOREIGN KEY (`idUnitOfMeasure`) REFERENCES `unitofmeasure` (`id`),
  CONSTRAINT `product_FK_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Widget A','WA1',9.99,'A medium Widget',99.99,'2022-11-20 15:36:30',0,4,12,20,1,NULL),(2,'Widget B','WB2',19.99,'A large Widget',249.49,'2022-11-20 15:37:30',0,4,23,3,1,NULL);
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
  `fieldtypeName` varchar(20) DEFAULT NULL,
  `fieldvalue` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  KEY `productcustomfields_FK` (`productid`),
  CONSTRAINT `productcustomfields_FK` FOREIGN KEY (`productid`) REFERENCES `product` (`id`)
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
-- Table structure for table `rawmaterial`
--

DROP TABLE IF EXISTS `rawmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `addedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` float DEFAULT NULL,
  `idUnitOfMeasure` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rawmaterial_FK` (`idUnitOfMeasure`),
  CONSTRAINT `rawmaterial_FK` FOREIGN KEY (`idUnitOfMeasure`) REFERENCES `unitofmeasure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES (1,'Wigdet Wood',0.5,'2022-11-20 15:38:48',900,5,1),(2,'Knob',1,'2022-11-20 15:38:48',1990,4,1),(3,'Name1',22,'2022-11-20 19:25:19',23,5,1),(4,'FROM FRONT CONTROLLER',28.5,NULL,228,4,1),(7,NULL,234,NULL,12,NULL,NULL),(8,NULL,12,NULL,11,NULL,NULL),(9,NULL,12,NULL,11,NULL,NULL),(10,'test post',2899,NULL,28,4,1),(11,'sadsdsd',2334,NULL,234,4,1);
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
  `fieldtypename` varchar(20) NOT NULL,
  `fieldValue` varchar(100) NOT NULL,
  `UserId` int DEFAULT NULL,
  KEY `rawmaterialcustomfields_FK` (`rawMaterialid`),
  KEY `rawmaterialcustomfields_FK_1` (`fieldtypename`),
  KEY `rawmaterialcustomfields_FK_2` (`UserId`),
  CONSTRAINT `rawmaterialcustomfields_FK` FOREIGN KEY (`rawMaterialid`) REFERENCES `rawmaterial` (`id`),
  CONSTRAINT `rawmaterialcustomfields_FK_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialcustomfields`
--

LOCK TABLES `rawmaterialcustomfields` WRITE;
/*!40000 ALTER TABLE `rawmaterialcustomfields` DISABLE KEYS */;
INSERT INTO `rawmaterialcustomfields` VALUES (8,'test1','kjlkjlkj',1),(10,'test2','lkjlkj',1),(11,'test4','4444',1);
/*!40000 ALTER TABLE `rawmaterialcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterialproducts`
--

DROP TABLE IF EXISTS `rawmaterialproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterialproducts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productid` int NOT NULL,
  `rawmaterialid` int NOT NULL,
  `quantity` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RawMaterialProducts_FK` (`productid`),
  KEY `RawMaterialProducts_FK_1` (`rawmaterialid`),
  CONSTRAINT `RawMaterialProducts_FK` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  CONSTRAINT `RawMaterialProducts_FK_1` FOREIGN KEY (`rawmaterialid`) REFERENCES `rawmaterial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialproducts`
--

LOCK TABLES `rawmaterialproducts` WRITE;
/*!40000 ALTER TABLE `rawmaterialproducts` DISABLE KEYS */;
INSERT INTO `rawmaterialproducts` VALUES (1,1,1,10),(2,1,2,1),(3,2,1,20),(4,2,2,4);
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
-- Table structure for table `unitofmeasure`
--

DROP TABLE IF EXISTS `unitofmeasure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitofmeasure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abbrievation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  `ratio` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitofmeasure`
--

LOCK TABLES `unitofmeasure` WRITE;
/*!40000 ALTER TABLE `unitofmeasure` DISABLE KEYS */;
INSERT INTO `unitofmeasure` VALUES (4,'Unité','Unité',0,1),(5,'Metre','m',0,1),(6,'Centimetre','cm',5,100),(7,'Kilogramme','kg',0,1),(8,'gramme','g',7,1000),(9,'pouce','Po',5,0.0254),(10,'pied','Pi',5,0.3048),(11,'litre','l',0,1),(12,'millilitre','ml',11,1000),(13,'decalitre','Dl',11,0.1),(14,'gallon Américain','gal',11,0.264172),(15,'pinte Américain','pint',11,2.11338),(16,'tasse Américaine','cup',11,4.16667),(17,'once liquide Américaine','oz',11,33.814),(18,'cuillière à soupe Américaine','tbsp',11,67.628),(19,'cuillère à thé Américaine','tsp',11,202.884),(20,'livre','lbs',7,2.20462),(21,'once solide','oz',7,35.274),(22,'centilitre','cl',11,100),(23,'millimetre','mm',5,1000);
/*!40000 ALTER TABLE `unitofmeasure` ENABLE KEYS */;
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

-- Dump completed on 2022-11-23  0:09:58
