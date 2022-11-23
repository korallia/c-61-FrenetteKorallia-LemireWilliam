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
INSERT INTO `unitofmeasure` VALUES (4,'UnitÃ©','UnitÃ©',0,1),(5,'Metre','m',0,1),(6,'Centimetre','cm',5,100),(7,'Kilogramme','kg',0,1),(8,'gramme','g',7,1000),(9,'pouce','Po',5,0.0254),(10,'pied','Pi',5,0.3048),(11,'litre','l',0,1),(12,'millilitre','ml',11,1000),(13,'decalitre','Dl',11,0.1),(14,'gallon AmÃ©ricain','gal',11,0.264172),(15,'pinte AmÃ©ricain','pint',11,2.11338),(16,'tasse AmÃ©ricaine','cup',11,4.16667),(17,'once liquide AmÃ©ricaine','oz',11,33.814),(18,'cuilliÃ¨re Ã  soupe AmÃ©ricaine','tbsp',11,67.628),(19,'cuillÃ¨re Ã  thÃ© AmÃ©ricaine','tsp',11,202.884),(20,'livre','lbs',7,2.20462),(21,'once solide','oz',7,35.274),(22,'centilitre','cl',11,100),(23,'millimetre','mm',5,1000);
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
  `productCategory` enum('vÃªtements','appareils Ã©lectroniques','produits pour animaux','artisanal','services','cosmÃ©tiques','passe-temps') NOT NULL,
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
INSERT INTO `user` VALUES (1,'','William','Lemire','wlemire.wl@gmail.com','123','William Lemire','3915 Rue Newmarch','MontrÃ©al','H4G 1G9','givesendgo.com',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0CÿÀ\0\0\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñ\ð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\ê\ñ\ò\ó\ô\õ\ö\÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3R\ðbr\Ñ\n$4\á%\ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\ê\ò\ó\ô\õ\ö\÷øùúÿ\Ú\0\0\0?\0·\ðVLü4\Ð:\ôÀ\ô®\Ôt\'\0\ö\Õ\Ä|#þŸ‡ý~Á9\ö®\ÛvÀ£‚>µ\Ê\÷:\Ã\Ó1J°\0l’sùT*C¡úf¥S€p£ÒÆ¸\Ú\Å1\ïÈ¥€»œd‘Cn\Îþ¼p*U‘B…\'\ñ\íJÁp8\È\0dÿ\0*“ùp4\Üf6*\0æš€Xœ’:bšB½\Å\ç;†x\ë\éN\Ê\çOoZ¯yumi\Íy*\Ã31À\ä?>/G\0’\Ç\Ã`;\ôk–\÷E&\Ò\Ò|Q\â\í#\Ãv\Æ[û„\óÝ‰O\Ìß…xþ,k\Z\Ò\Émf\â\ÎÑ¸Ú§\æ#ÐŸ\é^y©\êw—\÷Mqyq%Ä®r\Ìíš \òsÀ\éQv\ÄYº»’G$¾I\ç5E#¨¡›\Î9\æ¢rUF9zÐ€l\Æ\ãÈ¦–Ý€3Ÿ\åA!‡\\\ã\ëLn\ä\nb%I\\TH\Ç\'#?ÒœÄƒ¸\òqQ©\Û\Ãdý) Á\ä\ô\÷©P4Ñ‚£œþt1\Ú	€N	R)GBO=ª<°9\ëRnÂ€y¾i\0 \î\"¤^/r)ƒ u\ëN\éž\ôš\î\ß\íoA/\\{W¡J¼n>¿•s_\ô–\Ó<m\æ©If&V\ã×§\é]D\ç9j\ÒÐ´T”\ãªm\ÃGoJ¹.%pN*“’¼‘‘Ö˜\Ñ\\ü\ÄdcŠvŒŸ\éR(\rzL\õ ¨\n\Û@ü9§k‰—f8&ªkß»\ð\æ¦\ÄgS\î65h\Æ	\Çj¥\âL\Â3ª°<}Šlÿ\0ß¶«@Xø2\Øøi úqùWn#ŸL\×\r\ðuøi þN}«®\Üx\ã<T\É\ê$´.,œ•8J’)3\÷ŽA\íT\öÀu<r¡I=y©¸2ø9 [•˜\î\Úq•\ïUwpj¾£©\ÙiÖ­s}p°F£–cU~\ácHy9\ÏLW1\ãh¾€™®\÷€a`F\ç\ñ\ô¯3\ñ\÷\Å\É\æ\ßg\á\ò\Ð\Æ83Ÿ¼~ž•\ä·³\Ü\Î\óO+\È\í\Éf9&£›°Ž§Æ¾;\Ö|K;}¦s¸\'l(p¢¸ù$-’O¹\õ<\ÔløOL\õ\Í!\'\'\"˜\\Œ‚\ÆldM-€8 3\ñ’x¦–\ã\õ¦³\Ïÿ\0^£b P!\Ìy*—Jh=w\æšO9=qJci\Îsœ\Ð6H\ëù\Ó[;½\ÇJG\é\è3ƒM$qøS #\î“\Û\ò¤-K6ED­\É\ÎI£¯&\î\Î03R\î\Æ\à\Õc\Â\ñ\ëJ§n\â\ËQœ9\É\äš\ïþxAüC¬-\Õ\Ìm\öf\Ý!#†9\ák‘\ð¶“s®\ê\öºu¢–f=€\î\nú»\Ãz\r¦¢Ã§\Ú 	\Z\r\Ç³c’i\Å\\¨«–Fˆ\00:T2\óž\ã§Jµ À\àgÖ ”mP1\ÇZÑ–gH§©\Î*6ˆ3rG­[u\Ü:qši@3…ü)$|ª\ÊJ8§[†	–\ç#‘VdŒ\çvÜœQ\ò…T9ç¿­4„È°	\n?…S\ñ\á½[;x±œ\ò?\é›V‘^+7\Ä*\ÃZ¦\í\Ø6Sg\ÜymV„\'Á¥\Ç\Ã]\æ\0ý†3\ÓÚº·9_™{\ö\Èü#u\r´\Ø\"\Éÿ\0€Šê§™B\àgx¬¦\õ¡RBx\Ça_\æ\0\ãŠ\Î\r¤\'­%\Ý\ô6\ÝÜ¶\Ø\â]\ÎI\íQr\ì+\ñ%—‡\ô·½»n\éy\å|\ñ\ãO\ê>!¼y.&aû‘ƒ\ò­7Ç¾\'¸\×\õigv\"$D™\áErR\ÊÀNüÐ®\õd6>II9c\ÅB\ÎN0\Ù­G$™=3\É\Ò\à:S$”¾x1\ÇUÝ½8\ç\å `\òN) A\Üz\ÐO q\ëFF\Üs’z\ÒF¥›\nOš	¸œ†\ÇQŽ)V”\à+1<\à\n\ïü	\ð\îÿ\0^•$¸F†ß¿©\ïžøm \éP+$w\ï:\äŸÎ²uChP”µgÉ‰¥_É€¶’“ë¶¦\Z§Ÿø\ñ— wZûGþ\Í>1\ò\Ú\Â3ÿ\0L\ÇN\çE´!-\â#¨;EO´‘¯\Õ\Ó\ê|rºªÀ\æ\Æb?\Ý4«\ájNFŸ)þZú\Í\ô;T;¼¨\Æ}ª\íŒ1)UD#®B\Ör\Ä5Ðµ„‹\ê|­7‡5„X\ÉÓ®Ú©6›wns5³¯9Zú3X‚%bª\0Nkš\Ôa„£E$j\Êyû¼\ÒX–9`\ÒÙžX¡\ÏÒ‚\Ä`œWq¯øZ)I­\×\ä‚:~\"¹4-b[†‰,¥=9U\ã\ó­\áR2\êrÔ£(\õû2øu³\ï<Eq-#y6\äŽ\Ã\ïø\ñù×±N:®2Z\ò\ÏüI\ð×‡¼=¥h\Ú\ÝC\öx–9¥Ý¿<×¬[\ÍoseÍ¬‰,R¨du9A­©¸µ \Üe\Ê2\'<ƒÚ¡”p£‘úU\ë„Bž?­Qœm*ûU\Ú\ÂEf\01Ri\ñ–9µv\ìd‘\ëO\àV\Ï×±¡\r²\ñ\óc\ô¤‘2\0%zqO•IBGœ}j=›y=q\ÐU%Ü’5\ä\à\óŸj¥\âQ\á\íS$`YMŸoÝµh.3Ï½P\ñ\ßøFµ3ƒƒe7úf\Ô\Æfü&Áøo üÜ‹ÿ\0\ô\Z\Ý}¤\ç9\à\×=\ð•øq¡cý>s\í]; G|\×<–¬qZ\r¶\á\ðFOS^{\ñ\Ë\\6\ÚtZLO‡›\ç\î\ö¯J€\0v\à“Þ¾|ø\×vf\ñ½\Ü\\…‰U>œ\n\Ï\Èr8‰¥9\É\Î\ÑP»ƒ€99\ïLyBœ\õ\ëL\ñÀ«3í”\â£RrKsÚš2>n§g\0\ÎyÈ¦!\ÊrG§Òœ\ÇƒHO\Ë\ÇOZi\éM;I\Z´²-œ\0z·\Âÿ\0,\ÓGy~›‰9P{W)\ð\óH—\Â\æTÊ¯+_Cx>\Åa6§·N•Ãˆ®ù¹\"wa¨+sH\ê¼3¦Ao$q(U\Çj\ê\"O”eF*–šbU\n\0\ÆNj\nª£¥T†’z•\åP\Ä\Ó\éT®\Ð\0\Ãw«\óœ!\nk&þU³\ãÊ©\è	7±—¨JˆÌ§½sšÂ´›W¦*Ö±n™¤\ÜÞƒµsW\Z«†d\ÏC‚\rr\ÍÝP‹ \ÔZ7`\0ã¿½sš°F<r\0\æ¶\Ý\ÖDb2I=Eak’Ioo$Š„\È#Ò¦\Ö-\ì\ZŽu	Š\ò‹\É>€V‹f‡Jv†\ÊCŽ™\óžk\'\Ã^0ºK\ÓC\Û\È?xT`\ÆzÂ¯øµ-¦€\Ý,¤’2\ô\ÒjF\\\Ü\ê\è\â§_2@\ìK\Í{\çÀùn|\'%¬¬\Í\öiŠ®\îÀŒ\ãù×‚\È\ñ\Å\ö=ºW¼þÎ¶’Kx\ë´\Ït\Åx\ê þ5ß‡øŽ:ÿ\0§¢N7tjÏ“\ÛÀÁ>•¯\"lj\ö\Æj…\Ê\í\0z\×kG*3r\0\çµ!Á08Ï¥6e,¤\ò<Šj„PH\ËjKA½‡™\Ø\ç<v¨¤Œm\Ü8\í\ëM>h“vÌ‚?*{2¨\Ù×±§¸­b<…\Û\×\ÔVo‰\Â\Ç\á­[ymŒ\äý<¶­V*ªJŒz\ÖG‰\ö·†5R\ÙÁ±Ÿ<\õ[Scü##þÞ…Ó›û{WTY[n\0\Ïn+“øKƒ\ð\ëCÿ\0—ûûWT¿ \\	\æ¹\ç¹qØž\"3–\ë\í_6|_¾?\Ô\ñždŸ ¯¥c\Ã>O¥xŸ\Ç\Í\r¡\×cÔ£S\å\\®Ž\Ì+6¬Á£\È$|žOjEm\Êw3R\ÏF;A\éU\ó\ò\àƒ\ÇZ³1\Ä\ôšyÁ\0eÂ£lëŸÎ…pGZ6»kÒŸn¾l\ëÁ,@¨{–#>µ³\á+q>«W;NGÖ¦r\å‹cŒy¤‘\êŸ4\õŽ£U\Ç\'\íˆ…E*=y§‚m\ÈdT\Æ\âzÞƒ(T‚9<×	9J\çµ\Ë\Ë#¡²SÂ‘\Å^uv\Î;\ÒYB\'¾*\Ä\Ï6n\äÕ«Ñ§±\Ç$\îb\ê70\Û@\ÓM\" ½x\×ÄŸˆ1Yf8\ä–!W©oL\n\Ùø«\â9Ž}«…{š\ñ?	‹o\ât\Ö7ª\÷¸š A#pa»?\ð‘\ô5.W½¶Fªš®\÷6§Š5øS½½‹I\Ó~\ò’\Ã{\ô\é\Î)|-­ø:\×Pm>\ç_Ž\òBq†f\Éÿ\0u•pO¶k®øË£<?u\ËûRd\Õ\í„LÑ«g\ìÖ†@­´t\Ý\Óqtµ\ó\÷‹\ô¿M\ã‹-?\á\Ï\ö†¡§ˆm\ÃKtIi\' 4™!\n¤\í8\ÂH\ÈÁ=4°ª´9™\\_²—,U\ì}I¤\èšl°­Å•È’\'û¸\äb³<[¡-‰A•n\Ý\ê—À»}R\×L¸†\ã|–¢\æ_³—\ç\î8\Åu+™˜4d‚@¯6£Qº\êzNVg‡¦—›¨K$P\æ9;c<\Õ\ë\ô\r·=;f¶µø4\'=z\ô®j\Ð5\Å\Þ\æ` \ä\ç\Z¨ËÜ™\ÅAl|9}\âÇ¥\Ø\ÆY\æ\n½\Øû\nú·\ÃZ=¾‰¡Z\év\ÈV\Ñ\é\Ô\÷?‰\æ¹ß´³\ðäš¼Ê¿\ÚWŽ~\ö7,xG\ãœ\×{4ExUú×­‡§h\óEy¹J\Æd\êG\ÌIÇ§­V–0\Ç\å\äZÔ¸UÚª\ÜS™vƒµ:ú\×MŒ1§Œ¬Œ»\ã \n#Æ‡vpÁµ£$D¶\í¼\ã\ò¨&`¡Tý\ÑÐŠ›\"®g°\äR{\ã=(K\02 cŠžQº2G5UÊ€\ÄB\ö¥°\÷+\É&k\ò{€+/\Ä\ì©\á\ÍT±3\ì<¶«\÷\ÚGVÂ‘€?gx¨ \ðž®ÿ\06\r„\äŒÿ\0\Ó6¤UŠøøu¡`øñ·µunN0\í\Årÿ\0	˜‡z\ò\ãy\ö®˜\rÀsŠ\ç“Ô¨­\É\"©¯qX¾9\Ñ\"\ñƒ%§ü¶_š3\èj\ô\0±ÝƒÀ«\ð6®8\"§q£\å-{Iš\Ò\êK[ˆ\ÊO`«V\Ñ8+\È\à\×\Ôþ;\ð=—‰\í¼\Ä\"\Ôû’\×\Ø×ƒx§Ãº†‡r\öº¥£!\Ï\É*Œ«{\æ\í¡2\ö8°R·§j@N\à\0\È\é\Í_ž\ÂEB\È7\öª¾^¼æ©™XF¶º¿‡\Öû\õA€ü«•\nvŸ^Þµ\Õü<ž(5ˆ\ÖN²\r¾œ\æ°\Äÿ\0	š\á\Ò\öª\ç»øJ\Þ+KA+·\Êy\'€(Ö¾)\é:D­ed¦\ò\ã¦\ØF\ì\ïÓ­sZ\ÒjwZ<\Ö\ö\n\í\n.fd\ì½\ë9\ô\ïi\\›(ÊˆI4²¿ g“\É\à{×Ÿ†2G©Zm>S\Ð\ôˆ¾\"½Y4y\í\Øržr…\Ï\çj?øN\õû\ë\Ãkwd\ñƒ\Ã.0\ÏÒ¸x\÷PÖ¼\É4»U–Ø«¬jY€$\í88úW øcYµÕ€\"‰P\à_Cüë¢²p\ÝX(8\ÏmYzM\0\ê±$¨6H¯!°\ðþ¡¡ü^K\õVWT) #‚§\öƒ4;ý6ª#š\ã¾(xx5\Õl\â\ó\Z&‡BËži\Æ\äm-\ïNU9[\Õy£\êÆ™zªVKkˆwG\"°ÁF{\ð}\Åg\è^†Üƒ>•¦C\Õ\Û4øú|\Ò=±ù×´\è\Z=\öœ©\näªŒ‚:UmKHŽ\ÕK2©~Ø¬•jÑ»±\Ñ\ìhNZ\îsV\åmmF\ÕXÂ®UvŒ}+“\ñ\ã4¥z\÷<WS®\\\Åq´“\ëÒ¼\Ë\ÄÚ˜Vq8\ä\Z\ãjR•®nùb®aø“PRŒ„\ä±\Ç5\ÏÙ¼†\ö/%\ZFNˆ£%‰\è?\Z/\åi\î6\óc¿A^\Ùû&xN\ÛR\ñ\\º•\ô\"Qaš¡— 3p¹\÷û\Ä}+\Ò\Ã\Ò\ÙV&­\Ól\Æøs\â+\ï^ýµ§6v\ê\ÛË“´?EA\ôý1^\÷\"|›B\ä\ç\ò®’\óÁÖ¶ú‹\\\é\ð\Ç.w¼q¨nq\Þ-\ñ.‡\á\ÝIt½Nú;{—P\á0r\àf½jTU(\Ú\÷<ºµ}¤¯²2o\ì;šÎœ»x\ÏÓµh[\Ïoun\'´•$\×*\Êr½V˜C‘žy\ÅhB3&^0#IªÒ¨8\0\ãž\õ¡:†A\ÏÁµRU	Ê§&•ŠLÎ”lr¥»c\ÅSh‡˜N\ì®:b®\\†F\î8\Õ¥B\ÉÁ\ï\ë\íP\ÑF|\Ñ\á\ñŒ\ç\ñ¬Æ«\á=h?\äqÏ·”Õ½/Ê¹Qƒ\ßÖ±<Z¡¼%«ƒœ	\ó\Ïý3j]JF_\Â^>h\\ËŒ}½«©`w\ëŠ\æ~\àü<\Ðø96wÿ\0fº‡ù\0pk–[––‚@§©<zUøq\0úUhHa\òj\Ò.Ê´!–\Ð\í gjƒS\Ó,5Kfµ¿¶Žx\È\è\â¦E8Ry©£eRW‘\Üuª\ä^\'ø:“y“\è7^Vy\òd\éø\Z\óMkÁZþ\î—\ÚD¥ü´KÒ¾®“Á b¥(¡qŒ©ƒI\Å\ô‡\År\é\ê\å]OpËƒS\év\òAx“/;}+\ëû¯\è·ù[­2\Ù\òpIˆg\ó¬;ß„\Þ½,\ék-³\ñ9:r’°—*w3>j\Z]\÷‡n­_g›<A_<qƒ\\§\áùaƒÄž\Õ\Ö\áý\Å\Ë1H1’s‘´Œ\ï\ÅtZ‡‚\ï|ª$\ö·qc7ˆ\åO½vZ@·\ÖmV\å˜`W“ýV§,Ö‹cÖ5‰‹’{žs\ðgÃºw€`[«û\ï´\\‡‘²\ëµ\0u\nÁGrB¯©\â­øG@ž?_jÐ¬‘Z\ÜHZ8\ÈÀQ\ôþµë–ž\Ò\íÇ›kg\ìr\ìŸ8üiWMDb«ŸËš\ß‹\ö\Ê\ÛúŽ†\raý\æwÿ\0\n\î–;F‰†7ý1[7\Ö\ô‹;!ý¥*G;\Ø1 W‘i^0»\Ò59\ô\õ¶t)“\Ì~\ò0\ïXúM\îâ“¨_j\÷’^Ü¼¦-ª¬Ñ¯O\Ý\ã¿5xlC\ö,Ê¦_*•=«\Ñ~\']\á?h\Þ#\Ôn.4YDP«²£ƒL\ñF¤T2;)Á\í\Ð\Ö40\Ùhv\ñ[\é\Ð$QG“•\ñ®oÄšÔŽXs×¥pN³i\Ä\í¥Nw\èbø³Z\Ý\æ\0O¥yÆ©xf“np{Ö·ˆ¯ZY˜/Nø\ïX\ÑÂŠ\ZwnÕ¥³*\ò§Úƒr¬T\ï\Ï\Í}“û8x}4Ÿ& \ñm¸ÔŸ\ÍbG&1\Â~™?|\Ó\ðŸ\Ã\ç\Äþ%´Ò—;g|\Â!-ú_pX\ÛCig\r´ˆ\â‰`*€?!^\Ö\Z—3<\\dþ\Ê%À¯Œ?k+…\ï#ˆ‚V\Ò}‰\\\×\Ú\rÀ\Í|\ñ\×V:\×\Å}v\ô6cûIŠ3þ\Ê\0£ùW_C‰\ð¿\âM\ç†oû<úl­†L\ó\õ_\ð¯£,¯\ì\õ;(o,¦Y\á•r¬§9\ñlùCd\à\×K\àˆZÇ…n6\Ã\'Ÿf\Íû\È\ð}Ç¡¨æ¶…ÅŸUJ¸\ã·VR\Ø\Æ>œ\×?\à\ßh>\'·ÿ\0F¹Xnq\óA#ma\ô\õü+}˜Ú¿0-Ut\Ë3nr\Ì\òA\ïÚ©\ÌÄ–B‘\ÏJ¿:\r²2c$\óY\à RÊ¹lcÿ\0­P\Í\"\ÈÝQ¸x\éXþ-Úž\ÖŠü¶“øFÕ«&D„d\÷\Íax\ÖT\Ö\ä9?\ñ.¸b3ÿ\0Lš’)þ\0>h`‘ÍŒ}½«ª\Æ\ñƒ\éš\åþ~\èc>\Ãp}…u@C´“\Ír\Ër\ì$LÛˆÀ\â®Û‘·\ç\É\Ïj†\ð ª\óŽsVSUnž¢’Ce˜†p“üª\\mm¤©\" R@\Â.J‘\ï\r\ÔÓ°«O¸‹0\åT2OZ°’uþU*\0SŸ¯cS„ªûtªHŸ2UQÛ\ÏLŠž2C(\É@2¹Àüªr\íî§©µh–7Q±·Ô¬¤µ¸]\È\Üs\ÛÞ¼\ö\î\Â\ï\ÃÚ‡’\ë¾&ÿ\0Výˆ¯L„Ž8\õ¤\Ôl\íµV·ºŒ:rzpkVV™Ñ‡\Ä:O\È\ä\ô\ÝT´\\±_AZI¨\ÃL]\ð\Äc¥a\ê>Ô¬œ¶r³G\Ù\á…cj6\Þ$\Úi·\í\ã\äBAü«Æ•\n‘\Ý¼kB¢·1¥¬\Û\Ù\ë\×i\Ä~|cnxükQ`Ó´›D·R(\Õ~X\Ñp\0úWŸ7ˆ/t\évOg4§\ÈEG{\â\åh™°]»\ÖV}NŽiY$\ô7¼A®\ÃcV?\\\×­\ë+&\äV\ëÖ¹\Ïx‚v•Ÿf\ç\Ç\Ý\ê\ì¼Ë…žprE\\i]Ü‰Í]\Í\Ì.ýw~=j\í\Ð  \çšÂ‹XT,gq#’kW\ÂV^\"\Öm\ô\ÛD2O<ÊG^Oùü+¾…&\ÚH\ó«NûŸM~\Ç\Ú6ú‡ˆ¥\å¶·$w\ê\ä~ƒ\ó¯£\Ïü?\ðå§…|)c¢Y \Û\ÄŽ>ûc\æc\õ95¾M{I%±\âT—4›9ß‰~!‡\Â\Þ\Õ5¹˜³À\Þ^{¹Qù\×ç¦¯y6¡{5Ü„—f21úœ\×Ó¿¶_‹‘,l¼#nùf?j¹\Ç`8Qü\ë\å‰”Œ²K\0¥&IR\æe,x\ã\éUY\å\Î\õÉ«’D®À…\ï\ëX\Ú\Ä\ÄÌ¶\Ö\ä\ñ\ïY´	—,®¦´—Î¶™\Ñ\Ô\ä0$^£\ào‹—vÌ¶Zê‰¡80û\ã\ë\ë^H\Ñ‘pœs\Çz‚iŸ;J\àÂ’º)3\ì3V\ÓuKQ=•\Ôs\Æ\Ã$£dÂI•+´úW\É:ŠuM\ëÍ°º’2Ì¹ùX{Š\öÿ\0|L²\×\"—\Ê-/@\Ç\\,ŸO\ð¡Ë¹¬Zgy4ƒ…À \×;\ñ\0\ì\ð/ˆF²®¿\ôKÖ³HžYu\ë\ë\í\\\ï\åV\ð.½ƒ\É\Ó.r?\í“\Ò\æ4¶—.|&ü=\Ð\ñøò·µu0°\çp\'Ò¹„\Ø?tLgþ<c}«¨R¨B0\ã<ÕŒ·.Ú–\ã!G?Y„jª£p8\àg ©]\àd\â¥0µ\É!#\Í;‰`Gjµ\Z¨^H\èj«	\Ú\Üz\ö«‘Œ©	“•þ+\í‘O·•X•Ò‘Tœ1\äOŽ-x]\Êy\ëW\è\"\ÚTrJ\â§8\ñ\ÍBŠ<¼t^‡Þ¤\0 \È_n•¡Ñ¶\Ç*@$ûT\êF\ìu\0U8r\\³g§j¶Ï±G~(À}=‡¥]³# \éT·e\ðG½_·PªF) e ‘¹\Ø\ñ#.yÜ \Ô2izsÉ–°µ ÿ\0\Ó?Ò­\Æ\0¶MY\n0±þu¢I\î‰\ækcR\ðÖƒ©\Ûý–\÷H²–>@ú\Õ\ã~7ý—\ômY\ä¸\ðþ·>™)\É\ò\æ_5	\ô\êýk\è €Fp;ú×œüm\ñ·ü#ºi\öS¿ºR\Ìk\Üý{\nnœ­kN3æˆ¾	\ë_µ”Z•Ä¨û3™$þ5\ô\Ï\ì\ç\ðŠ\ÇÁ\ê5}E…Ö´A>H\ëS\êk\å\í¨oZh®\æŽ_06\õr\àrÖ½‡\Ä\Z\ï‰€4½Z\óT½†w•Œ`1h\0g>œd{\Z\çiQ\\Æž\ÒUä£±\ö\ZH™\nrzsTµýV\×G\Ònu+\Ç´M+’{_*|-\ñÏ‹o¼E¦Àšœ·rM0…L\Ìd\ÈlŒ\àž\Ýs\í]\ï\íY\â+;Àv\Ús°–ø¯œÃ©PF2MoF¢ª›[#*\ô&\÷>pø‰\â;Ÿø\Âÿ\0Xˆ¹ vUs7r	dF¡¶œÒ’I¿w\"¨;\Ë\ôb\Ê\ØGn\ÓH¹\õ©»h\ÃfTºo³#nQÀ8\ã\õ®{I®\ï\å¹Ù‘“ƒŠ¿­HZ=xÁ5&\Ãj“\Ï\åE\õ…t*¤º’MgÜ¬n\ä/\çZ\×Äž\0}…g\\\í„–\ëÒ†5¡‹q	°§SŠ–\0\ðuvA5+¡2o\"œ\î\0Ž\ó©eŸ\ð\÷Ç®\í—¬I“À†c\Ôû\Z\ê|y2·µ²¿Å§\\è¦¯n ©9==«»°\ñú§‚u=2|½\Ê\ÙMú¿\î˜Æ¥nm	7¡\ëŸ?\äžhcŽl£\í\í]‰ù³À\ö8®?\á\á\æˆ1\Ö\Æ1\×Úº\æ;¹¨–\æ¶\Ô|-“ž\Õe\0\É\ç¿j†2¤\0x¹\ëS©8_j”†HF\ÒFG·J±l\Ù9¨Im\Þ\Õ,M´o¨>µB\é©qIÀ\È\ÇsV£<\0\rTPsœ.j\Ì`kDAf.»\æ¥–9|‚;ŠŽ F\äS\ÙÂžs\ßÖ¬‘€²É€r\0\æ¦\É#“œ\ÕU`Ä¯LœŸzŸGÊ½jF=8}§i \ó\Åh\Ú\ç`x5n¼\î\ÇÍšÓ€\áUq\Å8 e\èy\Ú;}:U\Ä Uh†T\Ó85z\æ\ç8­’2cf\"8‹>\0Q“\ì5\ñ\ç\Åý}µ¯^\\\î\Ý·—\ôŠú\Ã\Çw\Ï\ÂZ\Èm¬¶Ïƒøb¾\Ö$-3±\Ë|\Ù4§¢®e\\¼Á&¾©µ\Ò4ÿ\0|\r\Óe¼@Á4\ÕhŸ¡R‘\ã?¦+\åIs#d\÷¯¤b\Ö\Ò\Û\ög\ÓL,I³\ë\Ð\î9ýþu„\ä¬\Ó\ìkB/[¸\Ï\ÙgGŽ\ã\Æw7;CE¦\Û\å|új\Ï\í}%Œwš}«n’\ò`²,pˆ¹@\÷8?…u¿²~œ°xBÿ\0Q\Ç\Ïstw¨Qþ$×•~\Ó7\Ú?®\á/\òZ\Û$_Nü~uµ(û:V]¿1\â\ç\ÏUù9ao“¹‘@N¼Œ\óÚ§\Ôü\ô·ù\Û*¿\ÂTb­C\Z[>\Ì\îÁ\àš\Î\Ö.\Úv\ò#9E\'š\Ïc—\ÔÀ\Ô\\I\na@V|d\Õ4“\ZÄ£+\ôª:Ô¾[A\ÈÀ\Ü=yÿ\0\õT2j\n\"\Û\ë\Ç¯m\Çcb\ê\æ¾F;\Îzwýk\î\äI6c\è85/).\Ù\à\ö5\â03žsš‰ŒŒFIÀ\ïšV/•C#d¸™ÊŽ}z\Òc,n\ÛÁ‰§\Ãy>™:_D\ß*v˜	\ê¨†H\rÁ\ãµ>\à‡²˜c \ÆF?Eµ);j}%\ð…±\ð\÷Esex\ö®\Ëxa…\çž8®\á\Ê|¢.qþ‡j\ë\÷mC·\ô¬\æ\õ:l_Ft\à\ßb\Ï\Þ9\ÏŸh\à©nA\Æ*\äR(PœÒ°™pg…w\ãÒ¬\Ðq‘Òª(\rŒ.qZ²¤.žqÓ­R]\ÄÉ¢`¯µ‰\äv\íVa\ÎÝ¸1\ê+1¬§\nGS\éZQ0\n±ž?•R.&FNy\õ\éK!\Úv5BN\Ð6€pOÿ\0^šIiORGOAWr,M–nq‘úU†=À<\ÒApsŒ\à\Zy\á±\ô¤1\ðwcÞ´­\Æ\âªQ@<¼ßµ^²\éÀ\æª$³N\Ýy\Ú\Ø<Ö¼y `q\íT\ìÀ8<“\õ­»HÀQ\Ç\'½k6r\ß,d¸\ðN©k¹Í»\0\î9þ•\ðæ¦Œ—RFëƒ¸Œc¥~Š\Ïn’Û´l \är\r|e\ñ\ó\Âi\á¯\Ü,J\Ë§ÌŒ\ã¨?\ài\ÍsCÐ¨žLv*‘Õ»{W£\ê‘\\|\Õ4\àù{\Ä\á3\Ópø5y\Ë2¬‡ \ç­^\Ðu\ì¯%ŽL‹[\Ä1K\è3\\U\"\ÜM\è\ÍB¢lûC\ökˆ\Ûü$\Ò\ËrÒ«\ÈO®]±ý?*ù»âŽ¢º§\Å\Üalªq\×h\0*ú/\öxÔ­eøAdbp\ßc\ã“\ê¹?Èƒ_\"\Ëy%\î­{.\à\×.\ÌKu&º¤ý\ÛÖ³¨ß˜\ÝKŒ6Fy##Ò°-\çYfg	‚NH\Ç½­†œÒ¯Ï°=Ï¯\ç\\m\ÝÔ¶zL“\ç\ãjŠ\Í3&Œmj\ð\Üj’\÷c%F>½*KXÅ½\ãw\áTtØƒÉ½\Ç$\äŸSZ\ó¾–‹‘\ÐúšV(€¶\âc\çŠl¸i\ô5*@\î2<â º6*\çÞ\"äƒšxbH$\ñÞ¢…\Æ3\ëO\'\åœg“R\ÆZBw\õ©\ñˆN\äz\Õxš¦c›i	\È\Î=qAI\÷\ð’`<£.?\å\Ñ9\ÇJ\ëV\å]Nr2x5\Æ|\"`|£‚§þ=S½v\ÈP¦\Ö\\€}k)|GLvip\Ì\Ø\ê9\ä\ñZQ\Ì`H\ãJ\Ú8Š’xãŠ¹ƒ‘\÷±Mn6¥C\òy\ö,2bj¨†0\Ý\ózúÔŠ‘\ì\n†ûU\Ñn6;Â¨\ÜG=kE@\\¯\ñX\ñ™FvžSVcœ\ÆA¨\ÍRv&H\ÓiA`®:\ö*€\îFu\Íeù\ì\ÎdT\Î95:\Ý\ä\0£¨\ëUq8’>«wJ‘\Ú\Æ\Ø$)n1\é^o\â¿xŸKœ\ÜG0«\óÑ¥zJ\Î.¬¤·\Ø\ñ\å\ÔüWx©\ìç¶š\Ä(\Ç;²;ú×•Zu#-\Ï_\rN”£¢\õ:/\nüH³\Õ,\î-f¶™p$r3€r9\äWTž7\Ð-fydb2B§Onq^C\à\ä’\òjª¡8“n7\n±¬\Ú6a&\äzUC=Œj`b¥¡\érüYÒ¬¦É´•\â®@8ú\õ\ë\Ð<\ã\ß\rø§1i\×\Ë\ö•0H6¸úÿ\0…|­\êŠ£\à\n\å³w¥j1_Y\\K\ÄRIˆe#Þ»)b&Þ»uhEh·?G†\ÍyO\í\à\á\âOOsl£\í¶H\ÓFq\Ë\02\ËùNýž¾\'\Ç\ãÿ\0\É\ÛFº­ˆU¸Q\Æ\ðz8ø9\÷ú\×u\â\ÍKJÓ´™®u[ˆ\á´T>c1\àŒt¯B›\×CX»œ·\Ë\å»\\H‡=qT\æ£e ž\àU¯\Z\êvw^#¿ŸOÿ\0G¸sÿ\0g<~•Z\ÎDš0\ä/•\Î\ô*Ç°þ\Í>2“G²\ñ^uvDis^BŽzJ‹ƒ¨\'\ök\Ì\ôù	™œ’FI\ÏLu®~;–²\Ô\è3®•°pH`Aˆ$~5£¦\ÝE=«~}­K•\ÒBz—\îY!‡SÛŠ\ã<Qr¬\ðØ¡ùQ‹{ÿ\0žµ\Ô\ÝÌ±Ä„Œœœu®&yÆ¥,¤3\çI\\\ÓaÃ¸Œ’rE]P6#\\\çÖ¢µÌˆTzvª\èT0¯V5V\ÐV0&\Ò28\ä\ÖË——\ÔûŠ·q½\Î3Œcªk\É\Èž´\\b À\ÚÃ¿qN\nKl~U!f€U;y©c°\æR^Â%\Ë¸\ëQ³nmÞ\0©	\Ñ\Æ	\È\é\ëAH\îü\ãxtŸ\rX\Ù\Ë\æ(daÿ\0×®ž/‰ºb‘\à~¼b\Ùÿ\0\â[oÿ\0\\WùTnÀv<Š\ÂR|\ÇLvG¾Z|S\Ñ1†v¯\ÛüO\ðÿ\0¿ ûŠù\Æ=¼ƒ\ëÖ¦P¬¸`\Ò\æ*\ç\ÓPüJ\Ðü½§N2j\Ô_|<O±Æ¾`‰K”žsO(\Èp¤žýj¹‰\Üú¦\ß\Ç\Þuÿ\0ø¹<\åª\í¿tÿ\01zxq_$+á™¹\ïšrHýD®1\ïO˜W>Á·ñŽ§P‡s¼T\ñø»@\í¨\Â	ÿ\0hW\ÇK-\Æ\ÒRW\ä\ð	§¬·Ci\ód\çýª®v\'c\í-Äš4Úœ>N¡o½Ž\Ð7ŽsÚ²>0i1[\Çi~É¶:ùÀw\æ¾K³»½†uxnfGV\Ç\ó¯®lüQ§x\×\áœ„Ouº‹˜\É\ÖE\0r:\÷\Ís\â#Ï©Ó†ª\á-=N-4ä¾…˜O\õqŽ¤\õ…\âmX\\\éj\ÒOû\Üs\Æ0+‘ø\ã]CûR\â\ëi\à Go@;W!y®\\\ßZ‘.\è[+žq\\ª›“\Ñs¯\Zk\Þz—o\ï#’V\Ã\îÁ\ëX:Œ\êÍ·¿®j´ÚŒ*…!,[¾z\Öl—;w³8\ä\×T!m>srw=\÷\ö&¹þ\'\ê1G¥¹“2eo\ò?‘®ƒ\ö¬\×\õK½E,>\Ð\écaW€q\×5¿ûøI´\Ï\ßøž\êZ\Ü\Ù]\Ã`„ü\ÉcùW7û[k6\Ò\ØOmial»eX\Þ\áW\çcŸ»ŸÂ½«S\Üç•œÏ—®&\'~\ÑëŠ±¥Hû\ÕÀ#pj„‡	\ÎjT“\É&0\Ç\Ðû\Ö&L±}s\ÊT¹\÷¦h\÷_d¹ù—)/\ÊG¡\õ¬ù	3\Û\ëR	W\ä`8^H¢ú\r¹q\åXy ®pG\ô®kO\ç,\Ø\é\Ïw]¸\ó­m\ÕA(pMT´cÊ‚<Ò™65VF…ƒ\ã§qKwv%P£<s\ôªS8g)$ .c=ú\Õ\Ü,4¶\\Ž\áO…9Á:Th(\ä\õ\â¤\'jª‘‘\ê\r>€\ç\Þ\ô\×`HÁÏ¥G3\ÇE\ÍF3Žµ#\'F!¶\ñùT\à%˜¶0\á\ÍA\à7~\õ#¶m$<\ô\Ï\åH´…±tøt\ò—?•6U^„t\éE™Se\0<)yü)\òª°\ã·\ë\\\ò^\ñÒ´µ;s\ÅB¥\÷·U¨\ÕTgÚ‚1\Û>\ô\0±€±\î\îi\Ë(f\0ŒPŸ:`Œ\çJG<\n¢IW`9\í\ÅT´p%m\ÝÏ¥Yu\Î9\ãØ Q»q\Ãu¦û:€jt\n\ËÁ\Æ:qQR\0\È\ÇOZ™Sj\à\n,-\ÅB3ƒÀúVµÜ¦!šH\Î0v¶+\rsEM\ç)\ã‘E…{jj^y‹1,Ç«’i\Íùúš©nûy\\\õ«\Ðns¸\õþT$\rš×žŽÿ\0\Ã2^[K„\È\"«|ømªø\÷\ÆP\è\ò\Ã,V\âkÛ¸`ûÇ j½n%\"ùnyZ\÷…t›\r2\ÛCŸGû9‰mq$\ö,1\Î}sUK\ÌoDv_u=SA\Ó\ôŸ	x<½Œ\÷\n°\Æ-À\Ì1(œŸ@?Jù\Ó\ö\Õ4ûµ\ðe…\Û_K§Ÿ2ú\å\ß{K3O¨\ç\ó¯yø\Ó\â\í;\Ã>}Z·]AÔ¥©\Î\é\å\õýk\áûû©®®¦žy¼Œ]Û¹\'“[N}•’ù\õ\÷¦]¹=@\È4\Í\Â5\ã¿^j[vXg?Ê³2\Ç\à\æ€ü\íO\Ò6ƒ\ÏZl\\° b˜™<®\Z$ŽC´Àri9^‡¯z\Ïù~Ó—Z–×ˆ\Ç\ì\ò>û\Ù\ëJÃ°\ç·À*\nœv\óPD¬KoRrz\â®y\Æ\ÅO\Í\Æ\åhDx\Ü=I\Çýj°+ùd-ø\Ó\çPªA\÷§M\"”Âœ„ú\ÕI\Ü‘É¢\â+Hÿ\01\öü©\"\'9\'#¸¨™°s\É\Ï4\èX´\ç¯Z–Q~,(\êI€[yA a;Šd`*\äR\\\ÚJH\'+ÒŽ¥¤Gf\ã\ì0/(v¡™†X\r%˜\Â±i]¶ŒXK\â7KAg5(rqƒÏ½F˜eüiH…\0I½#9ˆ\í’KP«ŽqÛšq§9\ÏZb³\ê*\Êü\0zv¨æ¸“\Ì?7N´\í¼p?\Z‰\âmÄ€MbXfe\ÏZ°³– \äÆª\0B€F}\éc\çœ`Uh$`@¨\ã,	n½©# ûT…À_QI\'›´‚1Òµ4û\õR¿Z\Åc»§½V¹¾D`‘ž{ŸJbºGm&½+µ\öú\Ôã•´$\Ú.OBOz\ó\ö™›%œšcœú\ð3N\Ö—c§\ñ‹/5¼™r\r£\'\ô®u‹0\Ê|\ËP1\Ï{v­-\Ô]\Û2\ó†ãžµD·Õ”¤\Ë6\ç8vþ+¨þÏ†~prpÃ¾j\ìø>\ê)>¹U$Cg;\å¾þ¸ u©­bÁb\ã¶I5\Ñh­\Â7•’G~µxUnœ‚Bc\ô¦\Ñ;• $…\ÜqŒqMš\'VÜ„\íëŠ»±L`¢\ç·4\ã;‡\Î{\Ô\Ð\Ó)\Çxvì“§\ëV›nG\é\éPMjŒ\Å\Ã\Ï$b™f«)\ëùQaÜ¶dý\ß*0O\ãT¥r[\àu\Ïjµs P’?Z¡#u\Æqži4sƒ‚GJž\Ý2\Äq\íÒ«ªœdO9\ëW!#}i\r&J®A\ny\ÏZ[–\Öo˜\'\åQ–\ã?ž).0,&>¨OJ\å¡úzgO„\ö\ò\ÇZ‘6\Çž\ç\ì0\Üy`Êœ\ç<9\ëÈ¬d¬ÙºØƒG\ô¢\å»ÓºrOjrt\Ãu\Í ¸\ñ\Û\òNq\ÅDÇŒ\ãNRh\Ê\Ø\'w9¥<“\Å1I\çw5\"\ò¤qÖ€\Ã`\åG•Œ‚i£Ž˜ü\êL\ð	9\âš)\ÜI<)\Ø$€:Ô±—\r\ëA\0t\ëøS$k#ª?»\Åb–|s[\Ìs\Ô\ñ¶©5¤x \í\r\Ô\ZiØ–¯©Ÿ´ù‡SF\ÐH\ÛÖ¬˜Ilr*`ˆƒN\äùeN\Ñ\ß\õ­\r\í½\òAÛ¸q\ÇN•—€	=¨¶-\r\òL2yŽ´Ðž\ÌÛ»%\0\n\àœ\òz°—ˆÀS†\Ý\ÏqU®ÎB\ãrŽ¾´\ñH\0’OZ\Óc¦£p\íz8T\å½+2\å\ÈY~`sÀkP,I#ø\Í\Ç<R\åÅ€y\îE44RÓ®‚‰\ó\è	\íZS\ê¬F\ï­c\ÝÚ\Ì\ÊÁNw)\ÍIk©Êª±H8)$g\\f\Ë6\Ø\ã\Ïn•ZùÀtÂ€\ÃÒ”O˜\Ê\ÇÔœg?Ö¨€\Í+;\ì)_@$g.py¨“$’\Ø \ñRIŒ\0¾\éA\n ­&P£\Ðu\ô©]»T\æ«\ò\Ã\ï\Í=\0^ƒ&§R‘`\åNÓ¦)·¼YL3ÝžŸJ²w1\Ï\ÝLÿ\0 J\Ùþþµ>¨¤ÿ\Ù');
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
