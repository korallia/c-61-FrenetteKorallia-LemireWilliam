-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: trocqc
-- ------------------------------------------------------
-- Server version	8.0.31

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
  `note_subject` varchar(250) NOT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'Get that spaghetti recipe','ANOTHER POST!!!!!',165,177),(3,'MAH!','Call Mom',112,283),(4,'Says what?','SAumon!',195,80);
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `addedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `quantity` float DEFAULT NULL,
  `idUnitOfMeasure` int DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rawmaterial_FK` (`idUnitOfMeasure`),
  CONSTRAINT `rawmaterial_FK` FOREIGN KEY (`idUnitOfMeasure`) REFERENCES `unitofmeasure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES (1,'Chaise',8,NULL,3,4,1),(2,'Double chaise',6,NULL,5,4,1),(3,'triple chaise',9,NULL,6,4,1);
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
  `fieldtypeName` varchar(20) NOT NULL,
  `fieldValue` varchar(100) NOT NULL,
  `UserId` int DEFAULT NULL,
  KEY `rawmaterialcustomfields_FK` (`rawMaterialid`),
  KEY `rawmaterialcustomfields_FK_1` (`fieldtypeName`),
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
INSERT INTO `rawmaterialcustomfields` VALUES (1,'Hello','Moto',1),(1,'Hello','Moto',1),(2,'Hello','Moto',1),(3,'Hello','Moto',1);
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
  `Avatar` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'','William','Lemire','wlemire.wl@gmail.com','123','William Lemire','3915 Rue Newmarch','Montréal','H4G 1G9','givesendgo.com',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0	\Z!\Z\"$\"$�\�\0C��\0\0\0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\�\�$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R\�br\�\n$4\�%\�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����\�\0\0\0?\0�\�VL�4\�:\���\��\�t\'\0\�\�\�|#����~�9\��\�v���>�\�\�:\�\�1�J�\0l�s�T*C��f�S�p�ҐƸ\�\�1\�ȥ���d�Cn\���p*U�B�\'\�\�J�p8\�\0d�\0*��p4\�f6*\0暀X��:b�B�\�\�;�x\�\�N\�\�OoZ�yumi\�y*\�31�\�?>/G\0�\�\�`;\�k�\�E&\�\�|Q\�\�#\�v\�[��\�݉O\�߅x��,k\Z\�\�mf\�\�Ѹڧ\�#П\�^y�\�w�\�Mqyq%Įr\�횠\�s�\�Qv\�Y���G$�I\�5E��#����\�9\�rUF9zЀl�\�\�Ȧ�݀3�\�A!�\\\�\�Ln\�\nb%I\\TH\�\'#?Ҝă�\�qQ�\�\�d�) �\�\�\��P4т���t1\�	�N	R)GBO=�<�9\�Rny�i\0�\�\"�^/r)� u\�N�\�\��\�\�\�oA/\\{W�J�n>��s_\��\�<m\�If&V\�ק\�]D\�9j\�дT�\��m\�GoJ�.%pN*�����֘\�\\�\�dc�v��\�R(\rzL\���\n\�@�9�k��f8&�k߻\�\�\�gS\�65h\�	\�j�\�L\�3��<}�l�\0߶�@X�2\��i��q��Wn#�L\�\r\�u��i���N}��\�x\�<T\�\�$�.,��8J�)3\��A\�T\���u<r�I=y��2�9 [��\�\�q�\�Uwpj���\�i֭s}p�F��cU~\�cHy9\�LW1\�h����\��a`F\�\�\��3\�\�\�\�\�\�g\�\�\�\�83��~��\���\�\�\�O+\�\�\�f9&�����ƾ;\�|K;}�s�\'l(p���$-�O�\�<\�l�OL\�\�!\'\'\"�\\��\�ld�M-�8�3\�x��\�\���\��\0^�b P!\�y*�Jh=w\�O9=qJci\�s�\�6H\��\�[;�\�JG\�\�3�M$q�S #\�\�\�-�K6ED�\�\�I��&�\�\�03�R\�\�\�\�c\�\�\�J�n\�\�Q�9\�\�\��xA�C�-\�\�m\�f\�!#�9\�k�\�s�\�\��u��f=�\�\n��\�z\r���ç\� 	\Z\r\��c�i\�\\���F�\00:T2\�\�J� �\�g֠�mP1\�ZіgH��\�*6�3rG�[u\�:q�i@3��)$|�\�J8�[�	�\�#�Vd�\�vܜQ\�T9翭4�Ȱ	\n?�S\�\�[;x��\�?\�V�^+7\�*\�Z�\�\�6Sg\�ymV�\'��\�\�]\�\0��3\�ں�9_�{\�\��#u\r�\�\"\��\0��꧙B\�gx��\��RBx\�a_\�\0\�\�\r�\'�%\�\�6\�ܶ\�\�]\�I\�Qr\�+\�%��\�����n\�y\�|\�\�O\�>!�y.&a���\�7Ǿ\'�\�\�igv\"$D�\�ErR\���N�Ю\�d6>II9c\�B\�N0\��G$�=3\�\�\�:S$��x1\�Uݽ8\�\� `\�N)�A\�z\�O q\�FF\�s�z\�F��\nO�	���\�Q�)V�\�+1<\�\n\��	\�\��\0^�$�F�߿�\��m�\�P+$w\�:\�βuChP��gɉ�_ɀ���붦\Z���\� wZ�G�\�>1\�\�\�3�\0L\�N\�E��!-\�#�;EO���\�\�\�|r���\�\�b?\�4�\�jNF�)�Z�\�\�;T;��\�}��\�1)UD#�B\�r\�5е��\�|�7�5�X\�Ӯک6�wns5��9Z�3X�%b�\0Nk�\�a��E$j\�y��\�X�9`\�ٞX�\�ҝ�\�`�Wq��Z)I�\�\�:~\"�4-b[��,�=9U\�\�\�R2\�rԣ(\��2�u�\�<Eq-#y6\�\�\��\��ױN:�2Z\�\��I\�ׇ�=�h\�\�C\�x�9�ݿ<׬[\�oseͬ�,R�du9A�����\�e\�2\'<�ڡ�p���U\�B�?�Q�m*�U\�\�Ef\01Ri\�9�v\�d�\�O\�V\�ױ�\r��\�\�c\���2\0%zqO�IBG�}j=�y=q\�U%ܒ5\�\�\�j�\�Q\�\�S$`YM�oݵh.3ϽP\�\��F�3��e7�f\�\�f�&��o��܋�\0\�\Z\�}�\�9\�\�=\��q�c�>s\�]; G|\�<��qZ\r�\�\�FOS^{\�\�\\6\�tZLO��\�\�\��J�\0v\��޾|�\�vf\�\�\\��U>�\n\�\�r8��9\�\�\�P���99\�LyB�\�\�L�\���3폔\�RrKsښ2>n�g\0\�yȦ!\�rG�Ҝ\��HO\�\�OZi\�M;I\Z��-�\0z�\��\0,\�Gy~��9P{W)\�\�H�\�\�Tʯ+_Cx>\�a�6��N�È���\"wa�+sH\�3�Ao$q(U\�j\�\"O�eF*���bU\n\0\�Nj\n���T��z�\�P\�\�\�T�\�\0\�w�\�!\nk&�U��\�ʩ\�	7���J�̧�s��´�W�*ֱn���\�ރ�sW\Z���d\�C�\rr\�ݝP� \�Z7`\0㿽s��F<r\0\�\�\�Db2I=Eak�Ioo$��\�#Ҧ\�-\�\Z�u	�\�\�>�V�f�Jv�\�C��\��k\'\�^0�K\�C\�\�?xT`\�z¯��-��\�,��2\�\�jF\\\�\�\�\�_2@\�K\�{\���n|\'%��\�\�i��\���\��ׂ\�\�\�\�=�W��ζ�Kx\�\�t\�x\��5߇��:�\0��N7t�jϓ�\���>��\"lj\�\�j�\�\�\0z\�kG*3r\0\��!�08ϥ6e,�\�<�j�PH\�jKA���\�\�<v���m\�8\�\�M>h�v̂?*{2�\�ױ���b<�\�\�\�Vo�\�\�\�[ym�\��<��V*�J�z\�G�\���5R\����<\�[Sc�##�ޅӛ�{WTY[n\0\�n+��K�\�\�C�\0���WT� \\	\�\�q؞\"3�\�\�_6|_�?\�\�d����c\�>O�x�\�\�\r�\�cԣS\�\\��\�+6���\�$|�OjEm\�w3R\�F;A\�U\�\�\��\�Z�1\�\��y�\0e£l끟΅pGZ6�kҟn�l\��,@�{�#>��\�+q>�W;NG֦r\�c�y��\�4\���U\�\'\���E*=y��m\�d�T�\�\�zރ(T�9<׍	9J\�\�\�#��S\�^uv�\�;\�YB\'�*\�\�6n\��իѧ�\�$\�b\�70\�@\�M\"��x\�ğ�1Yf8\��!W�oL\n\���\�9�}��{�\�?	�o\�t\�7�\��� A#pa�?\��\�5.W��F����\�6���5�S���I\�~\�\�{\�\�\�)|-��:\�Pm>\�_�\�Bq�f\��\0u�pO�k��ˣ<?u\��Rd\�\�Lѫg\�ֆ@��t\�\�qt�\�\��\��M\�-?\�\�\�����m\�KtIi\' 4�!\n�\�8\�H\��=4���9��\\_��,U\�}I�\�l��ŕȒ\'��\�b�<[�-�A�n\�\���}R\�L��\�|��\�_��\�\�8\�u+��4d�@�6�Q�\�zNVg�����K$P\�9;c<\�\�\�\r�=;f���4\'=z\��j\�5\�\�\�`�\�\�\Z�˝ܙ\�Al|9}\�ǥ\�\�Y\�\n�\��\n��\�Z=���Z\�v\�V\�\�\�\�?�\�߁��\�䚼ʿ\�W�~\�7,xG\�\�{4ExU�׭��h\�Ey�J\�d\�G\�Iǧ�V�0\�\�\�ZԸUڪ\��S�v��:�\�M�1������\�\n#Ƈvp���$D�\�\�\�&`�T�\�Њ�\"�g�\�R{\�=(�K\02�c��Q�2G5Uʀ\�B\���\�+\�&k\�{�+/\�\�\�\�T�3\�<��\�\�GV�?�gx��\��\06\r�\��\0\�6�U���u�`��񏷵unN0\�\�r�\0	��z\�\�y\����\r�s�\�Ԩ�\�\"��qX�9\�\"\��%���_�3\�j\�\0�݃��\�6�8\"�q�\�-{I�\�\�K[�\�O`�V\�8+\�\�\�\��;\�=��\�\�\"\����\�\�׃x�ú��r\����!\�\�*��{\�\�2�\�8�R��j@N\�\0\�\�\�_�\�EB\�7\���^��橙XF����\��\�A����\nv�^޵\��<�(5�\�N�\r��\�\��\0	�\�\�\��\��J\�+KA+�\�y\'�(־)\�:D�ed�\�\�\�F\�\�ӭsZ\�jwZ<\�\�\n\�\n.fd\�\�9\�\�i\\�(ʈI4�� g��\�\�{ן��2G�Zm>S\�\���\"�Y4y\�\�r�r�\�\�j?�N\��\�\�kwd\�\�.0\�Ҹx\�Pּ\�4�U�ث�jY�$\�88�W��cY�Հ\"�P\��_C�뢲p\�X(8\�mYzM\0\�$�6H�!�\�����^K\�VWT) #��\��4;�6�#�\�(xx5\�l\�\�\Z&�B˞i\�\�m-\�NU9[\�y�\��ƙz��VKk�wG\"��F{\�}\�g\�^�܃>��C\�\�4��|\�=��״\�\Z=�\���\n䪌�:UmKH�\�K2�~ج�jя��\�\�hNZ\�sV\�mmF\�X®Uv�}+�\�\�4�z\�<WS�\\\�q��\�Ҽ\�\�ژVq8\�\Z\�jR��n�b�a��PR��\�\�5\�ټ�\�/%\ZFN��%�\�?\Z/\�i\�6�\�c�A^\��&xN\�R\�\\��\�\"Qa��� 3p�\��\�}+\�\�\�\�V&�\�l\��s\�+\�^���6v\�\�˓�?EA\��1^\�\"|�B\�\�\�\��ֶ��\\\�\�\�.w�q�n�q\�-\�.�\�\�It�N�;{�P\�0r\�f�jTU(\�\�<��}���2o\�;�Μ�x\�ӵh[\�oun\'��$�\�*\�r�V�C��y\�hB3&^0#I�Ҩ8\0\�\��:�A\���RU	ʧ&��LΔlr��c�\�Sh��N\�:b�\\�F\�8\��B\��\�\�\�P\�F|\�\�\�\�\�ƫ\�=h?\�qϷ�ս/ʹQ�\�ֱ<Z��%���	\�\��3j]JF_\�^>h\\ˌ}���`w\�\�~\��<\��96w�\0f���\0pk�[���@��<zU�q�\0�UhHa�\�j\�.ʴ!�\�\� g�j�S\�,5Kf����x\�\�\�E8Ry��eRW�\�u�\�^\'�:�y�\�7^Vy\�d\��\Z\�Mk�Z��\�\�D����KҾ���� b�(�q���I\�\��\�r\�\�\�]Op˃S\�v\�Ax�/;}+\���\��[�2\�\�pI�g\�;߄\��,\�k-�\�9:r���*w3>j\Z]\��n�_g�<A_<q�\\�\��a�Ğ\�\�\��\�\��1H1�s����\�\�tZ��\�|�$\��qc7�\�O�vZ@�\�mV\��`W��V�,֋c֍5���{�s\�gúw�`[��\�\\���\�\0u\n�GrB��\��G@�?_jЬ�Z\�HZ8\��Q\���떞\�\�Ǜkg\�r\�8�iWMDb��˚\��\�\�\����\ra�\�w�\0\n\�;F��7�1[7\�\�;!��*G;\�1 W�i^0�\�59\�\��t)�\�~\�0\�X�M\�ⓨ_j\��^ܼ�-��ѯO\�\�5xlC\�,ʦ_*�=�\�~\']\�?h\�#\�n.4YDP�����L\�F�T2;)�\�\�\�40\�hv\�[\�\�$QG��\�oĚԎXsץpN�i\�\�Nw\�b��Z\�\�\0O�yƩxf�np{ַ��ZY�/N�\�X\�\Zwnե�*\��ڃr�T\�\�\�}��8x}4�&�\�m�ԟ\�bG&1\�~�?�|\�\�\�\�\��%�җ;g�|\�!-�_pX\�Cig\r��\�`*��?!^\�\Z��3<\\d�\�%���?k+�\�#��V\�}�\\\�\�\r�\�|\�\�V:\�\�}v\�6c�I�3�\�\0��W_C��\�\�M\�o��<�l��L\�\�_\�,�\�\�;(o,�Y\�r��9\�l�Cd\�\�K\��Zǅn6\�\'�f\��\�\�}ǡ�涅şUJ�\�VR\�\�>�\�?\�\�h>\'��\0F�Xnq\�A#ma\�\��+}�ڿ0-Ut\�3nr\�\�A\�ک\�ĖB�\�J�:\r�2c$\�Y\�Rʹlc�\0�P\�\"\�݁Q�x\�X�-ڞ\������Fի&D�d\�\�ax\�T\�\�9?\�.�b3�\0L��)�\0>h`�͌}���\�\�\�\���~\�c�>\�p}�u@C��\�r\�r\�$Lۈ�\�ۑ�\�\�\�j�\�\�sVSUn���Ce��p���\\mm��\"�R@\�.J�\�\r\�Ӱ�O��0\�T2OZ��u�U*\0S��cS���t�H�2UQہ\�L��2C(\�@�2����r\��h�7Q��Ԭ���]\�\�s\�޼\�\�\�\�\�ڇ�\�&�\0V���L��8\��\�l\�V���:rz�pkVV��ч\�:O\�\�\�\�T�\\�_AZI�\�L]\�\�c�a\�>Ԭ���r�G\�\�cj6\�$\�i�\�\�\�BA��ƕ\n�\��kB��1��\�\�\�\�i\�~|cnx�kQ`Ӵ�D��R(\�~X\�p\0�W�7�/t\�vOg4��\�EG{\�\�h��]�\�V}N�iY$\�7�A�\�cV?\\\��\�+&\�V\�ֹ\�x�v��f\�\�\�\�\��˅�prE\\i]܉͝]\�\�.�w~=j�\�\�  \��X�T,gq#�kW\�V^\"\�m\�\�D2O<ʁG^O��+��&\�H\�N��M~\�\�6�����\���$w\�\�~�\�\��?\�姅|)c�Y \�\��>�c\�c\�95�M{I%�\�T�4�9߉~!�\�\�\�5����\�^{�Q�\�禯y6�{5܄�f21��\�ӿ�_��,l�#n�f?j�\�`8Q�\�\����K\0�&IR\�e,x\�\�UY\�\�\�ɫ�D���\�\�X\�\�\�̶\�\�\�\�Y�	�,����ζ�\�\�\�0$^�\�o��v̶Zꉡ80�\�\�\�^H\��p�s\�z�i�;J\��)3\�3V\�uKQ=�\�s\�\�$�d�I�+��W\�:�uM\�Ͱ��2̹�X{�\��\0|L�\�\"�\�-/@\�\\,�O\�˹�Zgy4��� \�;\�\0\�\�/�F���\�KֳH�Yu\�\�\�\\\�\�V\�.��\�\�.r?\�\�\�4��.|&�=\�\��򏷵u0�\�p\'ҹ�\�?tLg�<c}��R�B0\�<Ռ�.ږ\�!G?�Y��j��p8\�g���]\�d\�0�\�!#\�;�`Gj�\Z�^H\�j�	\�\�z\�����	���+\�O��X�ґT�1\�O�-x]\�y\�W\�\"\�TrJ\�8\�\�B�<�t^�ޤ\0 \�_n��Ѷ\�*@$�T\�F\�u\0U8r\\�g�j�ϱG~(�}=��]�#�\�T�e\�G�_�P�F) e���\�\�#.yܠ\�2izsɖ�� �\0\�?ҭ\�\0�MY\n0��u�I\�\�kcR\�փ�\���\�H��>@�\�\�~7��\�mY\�\���>�)\�\�\�_5	\�\��k\� �Fp;�ל�m\��#�i\�S��R\�k\��{\nn��kN3戾	\�_��Z��Ĩ�3�$�5\�\�\�\�\��\��\�5}E�ִA>H\�S\�k\�\��oZh�\�_06\�r\�rֽ�\�\Z\��4�Z\�T��w��`1h\0g>�d{\Z\�iQ\\ƞ\�U䣱\�\ZH�\nrzsT��V\�G\�nu+\��M+�{_*|-\�ϋo�E�����rM0�L\�d\�l�\��\�s\�]\�\�Y\�+�;�v\�s�����éPF2MoF���[#*\�&\�>p��\�;��\��\0X��� vUs7r	dF���ҒI�w\"�;�\�\�b\�\�Gn\�H�\���h\�fT�o�#nQ�8\�\��{I��\�\�ّ�����HZ=x�5&�\�j�\�\�E\��t*���Mgܬn\�/\�Z\�Ğ\0}�g\\\��\�҆5��q	��S��\0\�uvA5+�2o\"�\�\0�\�e�\�\�Ǯ\���I���c\��\Z\�|y2�����ŧ\\覯n��9==���\����u=2|�\�\�M��\�ƥnm	7�\�?\�hc�l�\�\�]����\�8�?\�\�\�1\�\�1\�ں\�;���\�\�|-��\�e\0\�\�j�2�\0x�\�S�8_j��HF\�FG�J�l\�9�Im\�\�,M�o�>�B\�qI�\�\�sV�<\0\rTPs�.j\�`�kDAf.�\��9|�;�� F\�S\��s\�֬���ɀr\0\�\�#��\�U`įL��z�GʽjF=8}�i \�\�h\�\�`x5�n�\�\�͚Ӏ\�Uq\�8�e\�y\�;}:U\� Uh�T\�85z\�\�8��2cf\"8�>\0Q�\�5\�\�\��}��^\\\�\���\���\�\�w\�\�Z�\�m��σ�b�\�$-3�\�|\�4���e\\��&���\�4�\0|\r\�e�@�4\�h��R�\�?�+\�Is#d\���b\�\�\�\�g\�L,I�\�\�\�9��u�\�\�\�kB/�[�\�\�gG�\�\�w7;CE�\�\�|�j\�\�}%�w�}�n�\�`�,p��@\�8?�u��~��xB�\0Q\�\�stw�Q�$ו~\�7\�?�\�/\�Z\�$_N�~u�(�:V]�1\�\�\�U�9ao���@N��\�ڧ\��\���\�*�\�Tb�C\Z[>\�\��\��\�\�.\�v\�#9E\'�\�c�\��\�\\I\na@V|d\�4�\Zģ+\��:Ծ[A\��\�=y�\0\�T2j\n\"\�\�\��m\�cb\�\��F;\�zw�k\�\�I6c\�85/).\�\�\�5\�03�s����FI�\�V�/�C#d��ʎ}z\�c,n\����\�y>�:_D\�*v�	\���H\r�\�>\����c \�F?E�);j}%\���\�\�Esex\��\�xa�\�8�\�\�|�.q��j\�\�mC�\��\�\�:l_Ft\�\�b\�\�9\��h\�nA\�*\�R(P��Ұ�pg�w\�Ҭ�\�q�Ҫ(\r�.q�Z��.�qӭR]\�ɢ`���\�v\�Va\�ݸ1\�+1��\nGS\�ZQ0\n��?�R.&FNy\�\�K!\�v5BN\�6�pO�\0^�IiORGOAWr,M�nq��U�=�<\�Aps�\�\Zy\�\��1\�wc޴�\�\�Q@<�ߵ^�\��\�$�N\�y\�\�<֍�y `q\�T\��8<�\���H�Q\�\'�k6r\�,d�\�N�k�ͻ\0\�9��\�榌�RF냸�c�~�\�n�۴l�\�r\r|e\�\�\�i\�\�,J\��̌\�?\�i\�sCШ�Lv*�ջ{W�\�\\|\�4\��{\�\�3\�p��5y\�2�� \�^\�u\�%�L�[\�1K\�3\\U\"\�M\�\�B�l�C\�k�\��$\�\�rҫ\�O�]��?*��⎢��\�\�al�q\�h\0*�/\�xԭe�Adbp\�c�\�\�?ȃ_\"\�y%\�{.\�\�.\�Ku&���\�ֳ�ߘ\�K�6Fy##Ұ-\�Yfg	�NH\�����үϰ=ϯ\�\\m\�ԶzL�\�\�j�\�3&�mj\�\�j�\�c%F>�*KXŽ\�w\�Tt؃ɽ\�$\�SZ\����\���V(��\�c\�l�i\�5*@\�2<⠺6*\�ށ\"䃚xbH$\�ޢ�\�3\�O\'\��g�R\�ZBw\��\�N\�z\�x��c�i	\�\�=qAI\�\�`<�.?\�\�9\�J\�V\�]Nr2x5\�|\"`|����=S�v\�P�\�\\�}k)|GLvip\�\�\�9\�\�ZQ\�`H\�J\�8��x㊹��\��Mn6��C\�y\�,2bj��0\�\�z�Ԋ�\�\n��U\�n6;¨\�G=kE@\\�\�X\�Fv�SVc�\�A�\�Rv&H\�iA`�:\�*�\�Fu\�e�\�\�dT\�95:\�\�\0��\�Uq8�>�wJ�\�\�\�$)n1\�^o\�x�K�\�G0�\�я�zJ\�.���\�\�\�\��W�x�\�続\�(\�;�;�וZu#-\�_\rN���\�:/\n�H�\�,\�-f��p$r3�r9\�WT�7\�-�fydb2B�Onq^C\�\�\�j��8�n7\n��\�6a&\�zUC=�j`b��\�r�YҬ�ɴ�\��@8�\�\�\�<\�\�\r��1i\�\�\��0H6���\0�|�\��\�\n\��w�j1_Y\\K\�RI�e#޻)b&޻uhEh�?G�\�yO\�\�\�\�OOsl�\�H\�Fq\�\02\��N���\'\�\��\0\�\�F���U�Q\�\�z8�9\��\�u\�\�KJӴ��u[�\�T>c1\��t�B�\�C�X���\�\�\\H�=qT\��e �\�U�\Z\�vw^#��O�\0�G�s�\0g<~�Z\�D�0\�/�\�\�*ǰ�\�>2�G�\�^�uvDis^B�zJ����\'�\�k\�\��	���FI\�Lu�~;��\�\�3���pH`A�$~5��\�E=�~}�K�\�Bz�\�Y!�Sۊ\�<Qr�\�ء�Q�{�\0��\�\�̱Ą���u�&yƥ,�3\�I\\\�aø��rE]P�6#\\\�֢�̈Tzv�\�T�0�V5V\�V0&\�28\�\�˗�\����q�\�3�c�k\�\���\\b �\�ÿqN\nKl~U!f�U;y�c�\�R�^%\��\�Q�nmޝ\0�	\�\�	\�\�\�AH\��\�xt�\rX\�\�\�(da�\0׮�/��b��\�~�b\��\0\�[o�\0\\W�Tn�v<�\�R|\�LvG�Z|S\�1�v�\��O\��\0� ���\�=��\�֦P��`\�\�*\�\�P�J\����N2j\�_|<O��ƾ`�K���sO(\�p���j��\���\�\�\�u�\0���<\�\�t�\01zxq_$+ᙹ\�rH�D�1\�O�W>��񎁍�P�s�T\���@\�\�	�\0hW\�K-\�\�RW\�\�	���Ci\�d\����v\'c\�-Ě4ڜ>N�o��\�7�sڲ>0i1[\�i~ɶ:��w\�K����uxnfGV\�\�l�Q�x\�\��Ou���\�\�E\0�r:\�\�s\�#ϩӆ�\�-=N-4侁��O\�q��\��\�mX\\\�j\�O�\�s\�0+���\�]C�R\�\�i\� Go@;W!y�\\\�Z�.\�[+�q\\���\�s�\Zk\�z�o\�#�V\�\��\�X:�\�ͷ��j�ڌ*�!,[�z\�l�;w�8\�\�T!m>srw=\�\�&���\'\�1G���2e�o\�?���\��\�\�K�E,>\�\�ca�W�q\�5���I�\�\���\�Z\�\�]\�`���\�c�W7�[k6\�\�Omial�eX\�\�W\�c���½�S\�畜ϗ�&\'~\�늱�H�\��#pj��	\�jT�\�&0\�\��\�&L�}s\�T�\��h\�_d���)/\�G�\���	3\�\�R	W\�`8^H��\r��q\�Xy��pG\��kO\�,\�\�\�w]�\�m\�A(pMT�cʂ<ҏ�65VF��\�qKwv%P�<s\��S8g��)$ .c=�\�\�,4�\\�\�O��9�:Th(\�\�\�\'j���\�\r>�\�\�\�\�`H�ϥG3\�E\�F3��#\'F!�\��T\��%��0\�\�A\�7~\�#�m$<\�\�\�H���t�t\�?�6U^�t\�E�Se\0<)y�)\�\�\�\\\�^\�Ҵ�;s\�B�\��U�\�Tgڂ1\�>\�\0���\�\�i\�(f\0�P�:`�\�JG<\n�I�W`9\�\�T�p%m\�ϥYu\�9\�ؠQ�q\�u��:�jt\n\��\�:qQR\0\�\�OZ�Sj\�\n,-\�B3���V��ܐ�!�H\�0v�+\rsEM\�)\�E�{jj^y�1,ǫ�i\�����n�y\\\��\�ns�\��T$\r�מ��\0\�2^[K�\�\"�|�m��\�\�P\�\�\�,V\�kۍ�`�Ǡ�j�n%\"�nyZ\���t�\r2\�C�G�9�mq$\�,1\�}sUK\�oDv_u=SA\�\��	x<��\�\n�\�-�\�1(��@?J�\�\��\�4��\�e�\�_K��2�\�\�{K3�O�\�\�y�\�\�\�;\�>}Z�]Aԥ�\�\�\�\��k\��������y��]۹\'�[N}����\�\��]�=@\�4\�\�5\�^j[vXg?ʳ2\�\�\��\�O\�6�\�Zl\\� b��<�\Z$�C��ri9^��z\��~ӗZ�׈\�\�\�>�\�\�Jð\��*\n�v\�PD�KoRrz\�y�\�\�O\�\�\�hDx\�=I\��j�+�d-�\�\�P�A\��M\"���\�I\��ɢ\�+H�\01\���\"\'9\'#����s\�\�4\�X�\�Z�Q~,(\�I�[yA a;�d`*\�R\\\�JH\'+Ҏ��Gf\�\�0/(v���X\r%�\��i]��XK\�7KAg5(rq�ϽF�e�iH�\0I��#9�\�KP��qۚq��9\�Zb�\�*\��\0zv�渓\�?7N�\�p?\Z�\�mĀMbXfe\�Z��� \�ƪ\0B�F}\�c\�`Uh$`@�\�,	n��# �T��_QI�\'���1ҵ4�\�R�Z\�c���V��D`��{�Jb�Gm&�+�\���\�㕴$\�.OBOz\�\���%��c��\�3N\��c�\��/5��r\r�\'\��u�0\�|\�P1\�{v�-\�]\�2\�㞵D�Ք�\�6\�8v��+��φ~prpþj\��>\�)>�U$Cg;\���� u��b�b\�I5\�h�\�7��G~��xUn��Bc\��\�;��$�\�q�qM�\'V܄\�늻�L`�\�4\��;�\�{\�\�\�)\�xv쓧\�V�nG\�\�PMj�\�\�\�$b�f�)\��Qaܶd�\�*0O\�T�r[\�u\�j�s P�?Z�#u\�q�i4s��GJ�\�2\�q\�ҫ��dO9\�W!#}i\r&J�A\ny\�Z[�\�o�\'\�Q�\�?�).0,&>�OJ\��zgO�\�\�\�Z��6\��\�\�0�\�y`ʜ\�<9\�Ȭd�ٺ؍�G\��\�ӺrOjrt\�u\� �\�\�\�Nq\�Dǌ\�NRh\�\�\'w9�<�\�1I\�w5\"\�qր\�`\�G���i����\�L\�	9\�)\�I<)\�$�:Ա�\r\�A\0t\��S$k#�?�\�b�|s[\�s\�\�5�x \�\r\�\Ziؖ������SF\�H\�֬�Ilr*`���N\��eN\�\�\��\r\�\�A۸q\�N���	=��-\r\�L2y��О\�ۻ%\0\n\��\�z����S�\�\�qU�΍B\�r���\�H\0�OZ\�c��p\�z8T\�+2\�\�Y~`s�kP,I#��\�\�<R\�ŀy\�E44RӮ��\�\�	\�ZS�\�F\�c\�ڝ\�\��Nw)\�Ik�ʪ�H8)$g\\f�\�6\�\�\�n�Z��t\�ҔO�\�\�Ԝg?֨�\�+;\�)_@$g.py��$�\� \�RI�\0��\�A\n��&P�\�u\���]�T\�\�\�\�\�=\0^�&�R�`\�Nӏ�)��YL3�ݞ�J�w1\�\�L�\0�J\����>���\�');
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

-- Dump completed on 2022-11-23 13:03:27
