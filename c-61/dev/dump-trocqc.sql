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
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `availablequantity` int DEFAULT NULL,
  `originalquantity` int DEFAULT NULL,
  `addeddate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `lot_FK` (`productId`),
  CONSTRAINT `lot_FK` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` VALUES (1,7,0,100,NULL),(2,7,92,100,'2022-11-27 10:58:38'),(3,7,20,100,'2022-11-27 10:58:38');
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
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
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notes_FK` (`userID`),
  CONSTRAINT `notes_FK` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (8,'terert','fsdfdfsdfsdsfd',131,147,1);
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
  `idUnitOfMeasure` int NOT NULL,
  `lowQuantityLevel` float DEFAULT NULL,
  `userID` int NOT NULL,
  `QRcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_FK` (`idUnitOfMeasure`),
  KEY `product_FK_1` (`userID`),
  CONSTRAINT `product_FK` FOREIGN KEY (`idUnitOfMeasure`) REFERENCES `unitofmeasure` (`id`),
  CONSTRAINT `product_FK_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Widget A','WA1',9.99,'A medium Widget',99.99,'2022-11-20 15:36:30',4,20,1,NULL),(2,'Widget B','WB2',19.99,'A large Widget',249.49,'2022-11-20 15:37:30',4,3,1,NULL),(3,'Test from Front','123',28,'This is a test',128,NULL,4,18,1,'12345'),(4,'Test from Front','123',28,'This is a test',128,NULL,4,18,1,'12345'),(6,'Test from Front','123',28,'This is a test',128,NULL,4,18,1,'12345'),(7,'New name','123',14,'New description',256,NULL,5,1,1,'New QR code');
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
  CONSTRAINT `productcustomfields_FK` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcustomfields`
--

LOCK TABLES `productcustomfields` WRITE;
/*!40000 ALTER TABLE `productcustomfields` DISABLE KEYS */;
INSERT INTO `productcustomfields` VALUES (4,'Custom','value'),(4,'Custom2','value2');
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
  `addedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `quantity` float DEFAULT NULL,
  `idUnitOfMeasure` int DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rawmaterial_FK` (`idUnitOfMeasure`),
  CONSTRAINT `rawmaterial_FK` FOREIGN KEY (`idUnitOfMeasure`) REFERENCES `unitofmeasure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterial`
--

LOCK TABLES `rawmaterial` WRITE;
/*!40000 ALTER TABLE `rawmaterial` DISABLE KEYS */;
INSERT INTO `rawmaterial` VALUES (1,'Belle chaise',8,'2022-11-26 12:49:08',1,4,1),(2,'Double chaise',6,'2022-11-26 12:49:08',5,4,1),(3,'triple chaise',9,'2022-11-26 12:49:08',6,4,1),(4,'4 chaise',23,'2022-11-20 14:25:19',2,6,1),(7,'Belle chaise2',0,'2022-12-06 18:47:20',0,4,0);
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
  UNIQUE KEY `rawmaterialcustomfields_rawMaterialid_IDX` (`rawMaterialid`,`fieldtypeName`) USING BTREE,
  KEY `rawmaterialcustomfields_FK` (`rawMaterialid`),
  KEY `rawmaterialcustomfields_FK_1` (`fieldtypeName`),
  CONSTRAINT `rawmaterialcustomfields_FK` FOREIGN KEY (`rawMaterialid`) REFERENCES `rawmaterial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialcustomfields`
--

LOCK TABLES `rawmaterialcustomfields` WRITE;
/*!40000 ALTER TABLE `rawmaterialcustomfields` DISABLE KEYS */;
INSERT INTO `rawmaterialcustomfields` VALUES (1,'Hello','apple'),(2,'Hello','Moto'),(3,'Hello','Moto'),(4,'Hello','Moto');
/*!40000 ALTER TABLE `rawmaterialcustomfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rawmaterialperproduct`
--

DROP TABLE IF EXISTS `rawmaterialperproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rawmaterialperproduct` (
  `productid` int NOT NULL,
  `rawmaterialid` int NOT NULL,
  `quantity` float NOT NULL,
  UNIQUE KEY `MAIN` (`productid`,`rawmaterialid`) USING BTREE,
  KEY `RawMaterialProducts_UNIQUE` (`productid`),
  KEY `RawMaterialProducts_UNIQUE1` (`rawmaterialid`),
  CONSTRAINT `RawMaterialProducts_UNIQUE` FOREIGN KEY (`productid`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RawMaterialProducts_UNIQUE1` FOREIGN KEY (`rawmaterialid`) REFERENCES `rawmaterial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rawmaterialperproduct`
--

LOCK TABLES `rawmaterialperproduct` WRITE;
/*!40000 ALTER TABLE `rawmaterialperproduct` DISABLE KEYS */;
INSERT INTO `rawmaterialperproduct` VALUES (1,1,10),(1,2,1),(2,1,20),(2,2,4),(7,1,23);
/*!40000 ALTER TABLE `rawmaterialperproduct` ENABLE KEYS */;
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
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adress` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` char(7) NOT NULL,
  `siteWeb` varchar(100) DEFAULT NULL,
  `Avatar` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_un` (`username`),
  UNIQUE KEY `user_deux` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'','William','Lemire','wlemire.wl@gmail.com','123','William Lemire','3915 Rue Newmarch','MontrÃ©al','H4G 1G9','givesendgo.com',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0	\Z!\Z\"$\"$ÿ\Û\0CÿÀ\0\0\0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁR\Ñ\ð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\á\â\ã\ä\å\æ\ç\è\é\ê\ñ\ò\ó\ô\õ\ö\÷øùúÿ\Ä\0\0\0\0\0\0\0\0	\nÿ\Ä\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3R\ðbr\Ñ\n$4\á%\ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹º\Â\Ã\Ä\Å\Æ\Ç\È\É\Ê\Ò\Ó\Ô\Õ\Ö\×\Ø\Ù\Ú\â\ã\ä\å\æ\ç\è\é\ê\ò\ó\ô\õ\ö\÷øùúÿ\Ú\0\0\0?\0·\ðVLü4\Ð:\ôÀ\ô®\Ôt\'\0\ö\Õ\Ä|#þŸ‡ý~Á9\ö®\ÛvÀ£‚>µ\Ê\÷:\Ã\Ó1J°\0l’sùT*C¡úf¥S€p£ÒÆ¸\Ú\Å1\ïÈ¥€»œd‘Cn\Îþ¼p*U‘B…\'\ñ\íJÁp8\È\0dÿ\0*“ùp4\Üf6*\0æš€Xœ’:bšB½\Å\ç;†x\ë\éN\Ê\çOoZ¯yumi\Íy*\Ã31À\ä?>/G\0’\Ç\Ã`;\ôk–\÷E&\Ò\Ò|Q\â\í#\Ãv\Æ[û„\óÝ‰O\Ìß…xþ,k\Z\Ò\Émf\â\ÎÑ¸Ú§\æ#ÐŸ\é^y©\êw—\÷Mqyq%Ä®r\Ìíš \òsÀ\éQv\ÄYº»’G$¾I\ç5E#¨¡›\Î9\æ¢rUF9zÐ€l\Æ\ãÈ¦–Ý€3Ÿ\åA!‡\\\ã\ëLn\ä\nb%I\\TH\Ç\'#?ÒœÄƒ¸\òqQ©\Û\Ãdý) Á\ä\ô\÷©P4Ñ‚£œþt1\Ú	€N	R)GBO=ª<°9\ëRnÂ€y¾i\0 \î\"¤^/r)ƒ u\ëN\éž\ôš\î\ß\íoA/\\{W¡J¼n>¿•s_\ô–\Ó<m\æ©If&V\ã×§\é]D\ç9j\ÒÐ´T”\ãªm\ÃGoJ¹.%pN*“’¼‘‘Ö˜\Ñ\\ü\ÄdcŠvŒŸ\éR(\rzL\õ ¨\n\Û@ü9§k‰—f8&ªkß»\ð\æ¦\ÄgS\î65h\Æ	\Çj¥\âL\Â3ª°<}Šlÿ\0ß¶«@Xø2\Øøi úqùWn#ŸL\×\r\ðuøi þN}«®\Üx\ã<T\É\ê$´.,œ•8J’)3\÷ŽA\íT\öÀu<r¡I=y©¸2ø9 [•˜\î\Úq•\ïUwpj¾£©\ÙiÖ­s}p°F£–cU~\ácHy9\ÏLW1\ãh¾€™®\÷€a`F\ç\ñ\ô¯3\ñ\÷\Å\É\æ\ßg\á\ò\Ð\Æ83Ÿ¼~ž•\ä·³\Ü\Î\óO+\È\í\Éf9&£›°Ž§Æ¾;\Ö|K;}¦s¸\'l(p¢¸ù$-’O¹\õ<\ÔløOL\õ\Í!\'\'\"˜\\Œ‚\ÆldM-€8 3\ñ’x¦–\ã\õ¦³\Ïÿ\0^£b P!\Ìy*—Jh=w\æšO9=qJci\Îsœ\Ð6H\ëù\Ó[;½\ÇJG\é\è3ƒM$qøS #\î“\Û\ò¤-K6ED­\É\ÎI£¯&\î\Î03R\î\Æ\à\Õc\Â\ñ\ëJ§n\â\ËQœ9\É\äš\ïþxAüC¬-\Õ\Ìm\öf\Ý!#†9\ák‘\ð¶“s®\ê\öºu¢–f=€\î\nú»\Ãz\r¦¢Ã§\Ú 	\Z\r\Ç³c’i\Å\\¨«–Fˆ\00:T2\óž\ã§Jµ À\àgÖ ”mP1\ÇZÑ–gH§©\Î*6ˆ3rG­[u\Ü:qši@3…ü)$|ª\ÊJ8§[†	–\ç#‘VdŒ\çvÜœQ\ò…T9ç¿­4„È°	\n?…S\ñ\á½[;x±œ\ò?\é›V‘^+7\Ä*\ÃZ¦\í\Ø6Sg\ÜymV„\'Á¥\Ç\Ã]\æ\0ý†3\ÓÚº·9_™{\ö\Èü#u\r´\Ø\"\Éÿ\0€Šê§™B\àgx¬¦\õ¡RBx\Ça_\æ\0\ãŠ\Î\r¤\'­%\Ý\ô6\ÝÜ¶\Ø\â]\ÎI\íQr\ì+\ñ%—‡\ô·½»n\éy\å|\ñ\ãO\ê>!¼y.&aû‘ƒ\ò­7Ç¾\'¸\×\õigv\"$D™\áErR\ÊÀNüÐ®\õd6>II9c\ÅB\ÎN0\Ù­G$™=3\É\Ò\à:S$”¾x1\ÇUÝ½8\ç\å `\òN) A\Üz\ÐO q\ëFF\Üs’z\ÒF¥›\nOš	¸œ†\ÇQŽ)V”\à+1<\à\n\ïü	\ð\îÿ\0^•$¸F†ß¿©\ïžøm \éP+$w\ï:\äŸÎ²uChP”µgÉ‰¥_É€¶’“ë¶¦\Z§Ÿø\ñ— wZûGþ\Í>1\ò\Ú\Â3ÿ\0L\ÇN\çE´!-\â#¨;EO´‘¯\Õ\Ó\ê|rºªÀ\æ\Æb?\Ý4«\ájNFŸ)þZú\Í\ô;T;¼¨\Æ}ª\íŒ1)UD#®B\Ör\Ä5Ðµ„‹\ê|­7‡5„X\ÉÓ®Ú©6›wns5³¯9Zú3X‚%bª\0Nkš\Ôa„£E$j\Êyû¼\ÒX–9`\ÒÙžX¡\ÏÒ‚\Ä`œWq¯øZ)I­\×\ä‚:~\"¹4-b[†‰,¥=9U\ã\ó­\áR2\êrÔ£(\õû2øu³\ï<Eq-#y6\äŽ\Ã\ïø\ñù×±N:®2Z\ò\ÏüI\ð×‡¼=¥h\Ú\ÝC\öx–9¥Ý¿<×¬[\ÍoseÍ¬‰,R¨du9A­©¸µ \Üe\Ê2\'<ƒÚ¡”p£‘úU\ë„Bž?­Qœm*ûU\Ú\ÂEf\01Ri\ñ–9µv\ìd‘\ëO\àV\Ï×±¡\r²\ñ\óc\ô¤‘2\0%zqO•IBGœ}j=›y=q\ÐU%Ü’5\ä\à\óŸj¥\âQ\á\íS$`YMŸoÝµh.3Ï½P\ñ\ßøFµ3ƒƒe7úf\Ô\Æfü&Áøo üÜ‹ÿ\0\ô\Z\Ý}¤\ç9\à\×=\ð•øq¡cý>s\í]; G|\×<–¬qZ\r¶\á\ðFOS^{\ñ\Ë\\6\ÚtZLO‡›\ç\î\ö¯J€\0v\à“Þ¾|ø\×vf\ñ½\Ü\\…‰U>œ\n\Ï\Èr8‰¥9\É\Î\ÑP»ƒ€99\ïLyBœ\õ\ëL\ñÀ«3í”\â£RrKsÚš2>n§g\0\ÎyÈ¦!\ÊrG§Òœ\ÇƒHO\Ë\ÇOZi\éM;I\Z´²-œ\0z·\Âÿ\0,\ÓGy~›‰9P{W)\ð\óH—\Â\æTÊ¯+_Cx>\Åa6§·N•Ãˆ®ù¹\"wa¨+sH\ê¼3¦Ao$q(U\Çj\ê\"O”eF*–šbU\n\0\ÆNj\nª£¥T†’z•\åP\Ä\Ó\éT®\Ð\0\Ãw«\óœ!\nk&þU³\ãÊ©\è	7±—¨JˆÌ§½sšÂ´›W¦*Ö±n™¤\ÜÞƒµsW\Z«†d\ÏC‚\rr\ÍÝP‹ \ÔZ7`\0ã¿½sš°F<r\0\æ¶\Ý\ÖDb2I=Eak’Ioo$Š„\È#Ò¦\Ö-\ì\ZŽu	Š\ò‹\É>€V‹f‡Jv†\ÊCŽ™\óžk\'\Ã^0ºK\ÓC\Û\È?xT`\ÆzÂ¯øµ-¦€\Ý,¤’2\ô\ÒjF\\\Ü\ê\è\â§_2@\ìK\Í{\çÀùn|\'%¬¬\Í\öiŠ®\îÀŒ\ãù×‚\È\ñ\Å\ö=ºW¼þÎ¶’Kx\ë´\Ït\Åx\ê þ5ß‡øŽ:ÿ\0§¢N7tjÏ“\ÛÀÁ>•¯\"lj\ö\Æj…\Ê\í\0z\×kG*3r\0\çµ!Á08Ï¥6e,¤\ò<Šj„PH\ËjKA½‡™\Ø\ç<v¨¤Œm\Ü8\í\ëM>h“vÌ‚?*{2¨\Ù×±§¸­b<…\Û\×\ÔVo‰\Â\Ç\á­[ymŒ\äý<¶­V*ªJŒz\ÖG‰\ö·†5R\ÙÁ±Ÿ<\õ[Scü##þÞ…Ó›û{WTY[n\0\Ïn+“øKƒ\ð\ëCÿ\0—ûûWT¿ \\	\æ¹\ç¹qØž\"3–\ë\í_6|_¾?\Ô\ñždŸ ¯¥c\Ã>O¥xŸ\Ç\Í\r¡\×cÔ£S\å\\®Ž\Ì+6¬Á£\È$|žOjEm\Êw3R\ÏF;A\éU\ó\ò\àƒ\ÇZ³1\Ä\ôšyÁ\0eÂ£lëŸÎ…pGZ6»kÒŸn¾l\ëÁ,@¨{–#>µ³\á+q>«W;NGÖ¦r\å‹cŒy¤‘\êŸ4\õŽ£U\Ç\'\íˆ…E*=y§‚m\ÈdT\Æ\âzÞƒ(T‚9<×	9J\çµ\Ë\Ë#¡²SÂ‘\Å^uv\Î;\ÒYB\'¾*\Ä\Ï6n\äÕ«Ñ§±\Ç$\îb\ê70\Û@\ÓM\" ½x\×ÄŸˆ1Yf8\ä–!W©oL\n\Ùø«\â9Ž}«…{š\ñ?	‹o\ât\Ö7ª\÷¸š A#pa»?\ð‘\ô5.W½¶Fªš®\÷6§Š5øS½½‹I\Ó~\ò’\Ã{\ô\é\Î)|-­ø:\×Pm>\ç_Ž\òBq†f\Éÿ\0u•pO¶k®øË£<?u\ËûRd\Õ\í„LÑ«g\ìÖ†@­´t\Ý\Óqtµ\ó\÷‹\ô¿M\ã‹-?\á\Ï\ö†¡§ˆm\ÃKtIi\' 4™!\n¤\í8\ÂH\ÈÁ=4°ª´9™\\_²—,U\ì}I¤\èšl°­Å•È’\'û¸\äb³<[¡-‰A•n\Ý\ê—À»}R\×L¸†\ã|–¢\æ_³—\ç\î8\Åu+™˜4d‚@¯6£Qº\êzNVg‡¦—›¨K$P\æ9;c<\Õ\ë\ô\r·=;f¶µø4\'=z\ô®j\Ð5\Å\Þ\æ` \ä\ç\Z¨ËÜ™\ÅAl|9}\âÇ¥\Ø\ÆY\æ\n½\Øû\nú·\ÃZ=¾‰¡Z\év\ÈV\Ñ\é\Ô\÷?‰\æ¹ß´³\ðäš¼Ê¿\ÚWŽ~\ö7,xG\ãœ\×{4ExUú×­‡§h\óEy¹J\Æd\êG\ÌIÇ§­V–0\Ç\å\äZÔ¸UÚª\ÜS™vƒµ:ú\×MŒ1§Œ¬Œ»\ã \n#Æ‡vpÁµ£$D¶\í¼\ã\ò¨&`¡Tý\ÑÐŠ›\"®g°\äR{\ã=(K\02 cŠžQº2G5UÊ€\ÄB\ö¥°\÷+\É&k\ò{€+/\Ä\ì©\á\ÍT±3\ì<¶«\÷\ÚGVÂ‘€?gx¨ \ðž®ÿ\06\r„\äŒÿ\0\Ó6¤UŠøøu¡`øñ·µunN0\í\Årÿ\0	˜‡z\ò\ãy\ö®˜\rÀsŠ\ç“Ô¨­\É\"©¯qX¾9\Ñ\"\ñƒ%§ü¶_š3\èj\ô\0±ÝƒÀ«\ð6®8\"§q£\å-{Iš\Ò\êK[ˆ\ÊO`«V\Ñ8+\È\à\×\Ôþ;\ð=—‰\í¼\Ä\"\Ôû’\×\Ø×ƒx§Ãº†‡r\öº¥£!\Ï\É*Œ«{\æ\í¡2\ö8°R·§j@N\à\0\È\é\Í_ž\ÂEB\È7\öª¾^¼æ©™XF¶º¿‡\Öû\õA€ü«•\nvŸ^Þµ\Õü<ž(5ˆ\ÖN²\r¾œ\æ°\Äÿ\0	š\á\Ò\öª\ç»øJ\Þ+KA+·\Êy\'€(Ö¾)\é:D­ed¦\ò\ã¦\ØF\ì\ïÓ­sZ\ÒjwZ<\Ö\ö\n\í\n.fd\ì½\ë9\ô\ïi\\›(ÊˆI4²¿ g“\É\à{×Ÿ†2G©Zm>S\Ð\ôˆ¾\"½Y4y\í\Øržr…\Ï\çj?øN\õû\ë\Ãkwd\ñƒ\Ã.0\ÏÒ¸x\÷PÖ¼\É4»U–Ø«¬jY€$\í88úW øcYµÕ€\"‰P\à_Cüë¢²p\ÝX(8\ÏmYzM\0\ê±$¨6H¯!°\ðþ¡¡ü^K\õVWT) #‚§\öƒ4;ý6ª#š\ã¾(xx5\Õl\â\ó\Z&‡BËži\Æ\äm-\ïNU9[\Õy£\êÆ™zªVKkˆwG\"°ÁF{\ð}\Åg\è^†Üƒ>•¦C\Õ\Û4øú|\Ò=±ù×´\è\Z=\öœ©\näªŒ‚:UmKHŽ\ÕK2©~Ø¬•jÑ»±\Ñ\ìhNZ\îsV\åmmF\ÕXÂ®UvŒ}+“\ñ\ã4¥z\÷<WS®\\\Åq´“\ëÒ¼\Ë\ÄÚ˜Vq8\ä\Z\ãjR•®nùb®aø“PRŒ„\ä±\Ç5\ÏÙ¼†\ö/%\ZFNˆ£%‰\è?\Z/\åi\î6\óc¿A^\Ùû&xN\ÛR\ñ\\º•\ô\"Qaš¡— 3p¹\÷û\Ä}+\Ò\Ã\Ò\ÙV&­\Ól\Æøs\â+\ï^ýµ§6v\ê\ÛË“´?EA\ôý1^\÷\"|›B\ä\ç\ò®’\óÁÖ¶ú‹\\\é\ð\Ç.w¼q¨nq\Þ-\ñ.‡\á\ÝIt½Nú;{—P\á0r\àf½jTU(\Ú\÷<ºµ}¤¯²2o\ì;šÎœ»x\ÏÓµh[\Ïoun\'´•$\×*\Êr½V˜C‘žy\ÅhB3&^0#IªÒ¨8\0\ãž\õ¡:†A\ÏÁµRU	Ê§&•ŠLÎ”lr¥»c\ÅSh‡˜N\ì®:b®\\†F\î8\Õ¥B\ÉÁ\ï\ë\íP\ÑF|\Ñ\á\ñŒ\ç\ñ¬Æ«\á=h?\äqÏ·”Õ½/Ê¹Qƒ\ßÖ±<Z¡¼%«ƒœ	\ó\Ïý3j]JF_\Â^>h\\ËŒ}½«©`w\ëŠ\æ~\àü<\Ðø96wÿ\0fº‡ù\0pk–[––‚@§©<zUøq\0úUhHa\òj\Ò.Ê´!–\Ð\í gjƒS\Ó,5Kfµ¿¶Žx\È\è\â¦E8Ry©£eRW‘\Üuª\ä^\'ø:“y“\è7^Vy\òd\éø\Z\óMkÁZþ\î—\ÚD¥ü´KÒ¾®“Á b¥(¡qŒ©ƒI\Å\ô‡\År\é\ê\å]OpËƒS\év\òAx“/;}+\ëû¯\è·ù[­2\Ù\òpIˆg\ó¬;ß„\Þ½,\ék-³\ñ9:r’°—*w3>j\Z]\÷‡n­_g›<A_<qƒ\\§\áùaƒÄž\Õ\Ö\áý\Å\Ë1H1’s‘´Œ\ï\ÅtZ‡‚\ï|ª$\ö·qc7ˆ\åO½vZ@·\ÖmV\å˜`W“ýV§,Ö‹cÖ5‰‹’{žs\ðgÃºw€`[«û\ï´\\‡‘²\ëµ\0u\nÁGrB¯©\â­øG@ž?_jÐ¬‘Z\ÜHZ8\ÈÀQ\ôþµë–ž\Ò\íÇ›kg\ìr\ìŸ8üiWMDb«ŸËš\ß‹\ö\Ê\ÛúŽ†\raý\æwÿ\0\n\î–;F‰†7ý1[7\Ö\ô‹;!ý¥*G;\Ø1 W‘i^0»\Ò59\ô\õ¶t)“\Ì~\ò0\ïXúM\îâ“¨_j\÷’^Ü¼¦-ª¬Ñ¯O\Ý\ã¿5xlC\ö,Ê¦_*•=«\Ñ~\']\á?h\Þ#\Ôn.4YDP«²£ƒL\ñF¤T2;)Á\í\Ð\Ö40\Ùhv\ñ[\é\Ð$QG“•\ñ®oÄšÔŽXs×¥pN³i\Ä\í¥Nw\èbø³Z\Ý\æ\0O¥yÆ©xf“np{Ö·ˆ¯ZY˜/Nø\ïX\ÑÂŠ\ZwnÕ¥³*\ò§Úƒr¬T\ï\Ï\Í}“û8x}4Ÿ& \ñm¸ÔŸ\ÍbG&1\Â~™?|\Ó\ðŸ\Ã\ç\Äþ%´Ò—;g|\Â!-ú_pX\ÛCig\r´ˆ\â‰`*€?!^\Ö\Z—3<\\dþ\Ê%À¯Œ?k+…\ï#ˆ‚V\Ò}‰\\\×\Ú\rÀ\Í|\ñ\×V:\×\Å}v\ô6cûIŠ3þ\Ê\0£ùW_C‰\ð¿\âM\ç†oû<úl­†L\ó\õ_\ð¯£,¯\ì\õ;(o,¦Y\á•r¬§9\ñlùCd\à\×K\àˆZÇ…n6\Ã\'Ÿf\Íû\È\ð}Ç¡¨æ¶…ÅŸUJ¸\ã·VR\Ø\Æ>œ\×?\à\ßh>\'·ÿ\0F¹Xnq\óA#ma\ô\õü+}˜Ú¿0-Ut\Ë3nr\Ì\òA\ïÚ©\ÌÄ–B‘\ÏJ¿:\r²2c$\óY\à RÊ¹lcÿ\0­P\Í\"\ÈÝQ¸x\éXþ-Úž\ÖŠü¶“øFÕ«&D„d\÷\Íax\ÖT\Ö\ä9?\ñ.¸b3ÿ\0Lš’)þ\0>h`‘ÍŒ}½«ª\Æ\ñƒ\éš\åþ~\èc>\Ãp}…u@C´“\Ír\Ër\ì$LÛˆÀ\â®Û‘·\ç\É\Ïj†\ð ª\óŽsVSUnž¢’Ce˜†p“üª\\mm¤©\" R@\Â.J‘\ï\r\ÔÓ°«O¸‹0\åT2OZ°’uþU*\0SŸ¯cS„ªûtªHŸ2UQÛ\ÏLŠž2C(\É@2¹Àüªr\íî§©µh–7Q±·Ô¬¤µ¸]\È\Üs\ÛÞ¼\ö\î\Â\ï\ÃÚ‡’\ë¾&ÿ\0Výˆ¯L„Ž8\õ¤\Ôl\íµV·ºŒ:rzpkVV™Ñ‡\Ä:O\È\ä\ô\ÝT´\\±_AZI¨\ÃL]\ð\Äc¥a\ê>Ô¬œ¶r³G\Ù\á…cj6\Þ$\Úi·\í\ã\äBAü«Æ•\n‘\Ý¼kB¢·1¥¬\Û\Ù\ë\×i\Ä~|cnxükQ`Ó´›D·R(\Õ~X\Ñp\0úWŸ7ˆ/t\évOg4§\ÈEG{\â\åh™°]»\ÖV}NŽiY$\ô7¼A®\ÃcV?\\\×­\ë+&\äV\ëÖ¹\Ïx‚v•Ÿf\ç\Ç\Ý\ê\ì¼Ë…žprE\\i]Ü‰Í]\Í\Ì.ýw~=j\í\Ð  \çšÂ‹XT,gq#’kW\ÂV^\"\Öm\ô\ÛD2O<ÊG^Oùü+¾…&\ÚH\ó«NûŸM~\Ç\Ú6ú‡ˆ¥\å¶·$w\ê\ä~ƒ\ó¯£\Ïü?\ðå§…|)c¢Y \Û\ÄŽ>ûc\æc\õ95¾M{I%±\âT—4›9ß‰~!‡\Â\Þ\Õ5¹˜³À\Þ^{¹Qù\×ç¦¯y6¡{5Ü„—f21úœ\×Ó¿¶_‹‘,l¼#nùf?j¹\Ç`8Qü\ë\å‰”Œ²K\0¥&IR\æe,x\ã\éUY\å\Î\õÉ«’D®À…\ï\ëX\Ú\Ä\ÄÌ¶\Ö\ä\ñ\ïY´	—,®¦´—Î¶™\Ñ\Ô\ä0$^£\ào‹—vÌ¶Zê‰¡80û\ã\ë\ë^H\Ñ‘pœs\Çz‚iŸ;J\àÂ’º)3\ì3V\ÓuKQ=•\Ôs\Æ\Ã$£dÂI•+´úW\É:ŠuM\ëÍ°º’2Ì¹ùX{Š\öÿ\0|L²\×\"—\Ê-/@\Ç\\,ŸO\ð¡Ë¹¬Zgy4ƒ…À \×;\ñ\0\ì\ð/ˆF²®¿\ôKÖ³HžYu\ë\ë\í\\\ï\åV\ð.½ƒ\É\Ó.r?\í“\Ò\æ4¶—.|&ü=\Ð\ñøò·µu0°\çp\'Ò¹„\Ø?tLgþ<c}«¨R¨B0\ã<ÕŒ·.Ú–\ã!G?Y„jª£p8\àg ©]\àd\â¥0µ\É!#\Í;‰`Gjµ\Z¨^H\èj«	\Ú\Üz\ö«‘Œ©	“•þ+\í‘O·•X•Ò‘Tœ1\äOŽ-x]\Êy\ëW\è\"\ÚTrJ\â§8\ñ\ÍBŠ<¼t^‡Þ¤\0 \È_n•¡Ñ¶\Ç*@$ûT\êF\ìu\0U8r\\³g§j¶Ï±G~(À}=‡¥]³# \éT·e\ðG½_·PªF) e ‘¹\Ø\ñ#.yÜ \Ô2izsÉ–°µ ÿ\0\Ó?Ò­\Æ\0¶MY\n0±þu¢I\î‰\ækcR\ðÖƒ©\Ûý–\÷H²–>@ú\Õ\ã~7ý—\ômY\ä¸\ðþ·>™)\É\ò\æ_5	\ô\êýk\è €Fp;ú×œüm\ñ·ü#ºi\öS¿ºR\Ìk\Üý{\nnœ­kN3æˆ¾	\ë_µ”Z•Ä¨û3™$þ5\ô\Ï\ì\ç\ðŠ\ÇÁ\ê5}E…Ö´A>H\ëS\êk\å\í¨oZh®\æŽ_06\õr\àrÖ½‡\Ä\Z\ï‰€4½Z\óT½†w•Œ`1h\0g>œd{\Z\çiQ\\Æž\ÒUä£±\ö\ZH™\nrzsTµýV\×G\Ònu+\Ç´M+’{_*|-\ñÏ‹o¼E¦Àšœ·rM0…L\Ìd\ÈlŒ\àž\Ýs\í]\ï\íY\â+;Àv\Ús°–ø¯œÃ©PF2MoF¢ª›[#*\ô&\÷>pø‰\â;Ÿø\Âÿ\0Xˆ¹ vUs7r	dF¡¶œÒ’I¿w\"¨;\Ë\ôb\Ê\ØGn\ÓH¹\õ©»h\ÃfTºo³#nQÀ8\ã\õ®{I®\ï\å¹Ù‘“ƒŠ¿­HZ=xÁ5&\Ãj“\Ï\åE\õ…t*¤º’MgÜ¬n\ä/\çZ\×Äž\0}…g\\\í„–\ëÒ†5¡‹q	°§SŠ–\0\ðuvA5+¡2o\"œ\î\0Ž\ó©eŸ\ð\÷Ç®\í—¬I“À†c\Ôû\Z\ê|y2·µ²¿Å§\\è¦¯n ©9==«»°\ñú§‚u=2|½\Ê\ÙMú¿\î˜Æ¥nm	7¡\ëŸ?\äžhcŽl£\í\í]‰ù³À\ö8®?\á\á\æˆ1\Ö\Æ1\×Úº\æ;¹¨–\æ¶\Ô|-“ž\Õe\0\É\ç¿j†2¤\0x¹\ëS©8_j”†HF\ÒFG·J±l\Ù9¨Im\Þ\Õ,M´o¨>µB\é©qIÀ\È\ÇsV£<\0\rTPsœ.j\Ì`kDAf.»\æ¥–9|‚;ŠŽ F\äS\ÙÂžs\ßÖ¬‘€²É€r\0\æ¦\É#“œ\ÕU`Ä¯LœŸzŸGÊ½jF=8}§i \ó\Åh\Ú\ç`x5n¼\î\ÇÍšÓ€\áUq\Å8 e\èy\Ú;}:U\Ä Uh†T\Ó85z\æ\ç8­’2cf\"8‹>\0Q“\ì5\ñ\ç\Åý}µ¯^\\\î\Ý·—\ôŠú\Ã\Çw\Ï\ÂZ\Èm¬¶Ïƒøb¾\Ö$-3±\Ë|\Ù4§¢®e\\¼Á&¾©µ\Ò4ÿ\0|\r\Óe¼@Á4\ÕhŸ¡R‘\ã?¦+\åIs#d\÷¯¤b\Ö\Ò\Û\ög\ÓL,I³\ë\Ð\î9ýþu„\ä¬\Ó\ìkB/[¸\Ï\ÙgGŽ\ã\Æw7;CE¦\Û\å|új\Ï\í}%Œwš}«n’\ò`²,pˆ¹@\÷8?…u¿²~œ°xBÿ\0Q\Ç\Ïstw¨Qþ$×•~\Ó7\Ú?®\á/\òZ\Û$_Nü~uµ(û:V]¿1\â\ç\ÏUù9ao“¹‘@N¼Œ\óÚ§\Ôü\ô·ù\Û*¿\ÂTb­C\Z[>\Ì\îÁ\àš\Î\Ö.\Úv\ò#9E\'š\Ïc—\ÔÀ\Ô\\I\na@V|d\Õ4“\ZÄ£+\ôª:Ô¾[A\ÈÀ\Ü=yÿ\0\õT2j\n\"\Û\ë\Ç¯m\Çcb\ê\æ¾F;\Îzwýk\î\äI6c\è85/).\Ù\à\ö5\â03žsš‰ŒŒFIÀ\ïšV/•C#d¸™ÊŽ}z\Òc,n\ÛÁ‰§\Ãy>™:_D\ß*v˜	\ê¨†H\rÁ\ãµ>\à‡²˜c \ÆF?Eµ);j}%\ð…±\ð\÷Esex\ö®\Ëxa…\çž8®\á\Ê|¢.qþ‡j\ë\÷mC·\ô¬\æ\õ:l_Ft\à\ßb\Ï\Þ9\ÏŸh\à©nA\Æ*\äR(PœÒ°™pg…w\ãÒ¬\Ðq‘Òª(\rŒ.qZ²¤.žqÓ­R]\ÄÉ¢`¯µ‰\äv\íVa\ÎÝ¸1\ê+1¬§\nGS\éZQ0\n±ž?•R.&FNy\õ\éK!\Úv5BN\Ð6€pOÿ\0^šIiORGOAWr,M–nq‘úU†=À<\ÒApsŒ\à\Zy\á±\ô¤1\ðwcÞ´­\Æ\âªQ@<¼ßµ^²\éÀ\æª$³N\Ýy\Ú\Ø<Ö¼y `q\íT\ìÀ8<“\õ­»HÀQ\Ç\'½k6r\ß,d¸\ðN©k¹Í»\0\î9þ•\ðæ¦Œ—RFëƒ¸Œc¥~Š\Ïn’Û´l \är\r|e\ñ\ó\Âi\á¯\Ü,J\Ë§ÌŒ\ã¨?\ài\ÍsCÐ¨žLv*‘Õ»{W£\ê‘\\|\Õ4\àù{\Ä\á3\Ópø5y\Ë2¬‡ \ç­^\Ðu\ì¯%ŽL‹[\Ä1K\è3\\U\"\ÜM\è\ÍB¢lûC\ökˆ\Ûü$\Ò\ËrÒ«\ÈO®]±ý?*ù»âŽ¢º§\Å\Üalªq\×h\0*ú/\öxÔ­eøAdbp\ßc\ã“\ê¹?Èƒ_\"\Ëy%\î­{.\à\×.\ÌKu&º¤ý\ÛÖ³¨ß˜\ÝKŒ6Fy##Ò°-\çYfg	‚NH\Ç½­†œÒ¯Ï°=Ï¯\ç\\m\ÝÔ¶zL“\ç\ãjŠ\Í3&Œmj\ð\Üj’\÷c%F>½*KXÅ½\ãw\áTtØƒÉ½\Ç$\äŸSZ\ó¾–‹‘\ÐúšV(€¶\âc\çŠl¸i\ô5*@\î2<â º6*\çÞ\"äƒšxbH$\ñÞ¢…\Æ3\ëO\'\åœg“R\ÆZBw\õ©\ñˆN\äz\Õxš¦c›i	\È\Î=qAI\÷\ð’`<£.?\å\Ñ9\ÇJ\ëV\å]Nr2x5\Æ|\"`|£‚§þ=S½v\ÈP¦\Ö\\€}k)|GLvip\Ì\Ø\ê9\ä\ñZQ\Ì`H\ãJ\Ú8Š’xãŠ¹ƒ‘\÷±Mn6¥C\òy\ö,2bj¨†0\Ý\ózúÔŠ‘\ì\n†ûU\Ñn6;Â¨\ÜG=kE@\\¯\ñX\ñ™FvžSVcœ\ÆA¨\ÍRv&H\ÓiA`®:\ö*€\îFu\Íeù\ì\ÎdT\Î95:\Ý\ä\0£¨\ëUq8’>«wJ‘\Ú\Æ\Ø$)n1\é^o\â¿xŸKœ\ÜG0«\óÑ¥zJ\Î.¬¤·\Ø\ñ\å\ÔüWx©\ìç¶š\Ä(\Ç;²;ú×•Zu#-\Ï_\rN”£¢\õ:/\nüH³\Õ,\î-f¶™p$r3€r9\äWTž7\Ð-fydb2B§Onq^C\à\ä’\òjª¡8“n7\n±¬\Ú6a&\äzUC=Œj`b¥¡\érüYÒ¬¦É´•\â®@8ú\õ\ë\Ð<\ã\ß\rø§1i\×\Ë\ö•0H6¸úÿ\0…|­\êŠ£\à\n\å³w¥j1_Y\\K\ÄRIˆe#Þ»)b&Þ»uhEh·?G†\ÍyO\í\à\á\âOOsl£\í¶H\ÓFq\Ë\02\ËùNýž¾\'\Ç\ãÿ\0\É\ÛFº­ˆU¸Q\Æ\ðz8ø9\÷ú\×u\â\ÍKJÓ´™®u[ˆ\á´T>c1\àŒt¯B›\×CX»œ·\Ë\å»\\H‡=qT\æ£e ž\àU¯\Z\êvw^#¿ŸOÿ\0G¸sÿ\0g<~•Z\ÎDš0\ä/•\Î\ô*Ç°þ\Í>2“G²\ñ^uvDis^BŽzJ‹ƒ¨\'\ök\Ì\ôù	™œ’FI\ÏLu®~;–²\Ô\è3®•°pH`Aˆ$~5£¦\ÝE=«~}­K•\ÒBz—\îY!‡SÛŠ\ã<Qr¬\ðØ¡ùQ‹{ÿ\0žµ\Ô\ÝÌ±Ä„Œœœu®&yÆ¥,¤3\çI\\\ÓaÃ¸Œ’rE]P6#\\\çÖ¢µÌˆTzvª\èT0¯V5V\ÐV0&\Ò28\ä\ÖË——\ÔûŠ·q½\Î3Œcªk\É\Èž´\\b À\ÚÃ¿qN\nKl~U!f€U;y©c°\æR^Â%\Ë¸\ëQ³nmÞ\0©	\Ñ\Æ	\È\é\ëAH\îü\ãxtŸ\rX\Ù\Ë\æ(daÿ\0×®ž/‰ºb‘\à~¼b\Ùÿ\0\â[oÿ\0\\WùTnÀv<Š\ÂR|\ÇLvG¾Z|S\Ñ1†v¯\ÛüO\ðÿ\0¿ ûŠù\Æ=¼ƒ\ëÖ¦P¬¸`\Ò\æ*\ç\ÓPüJ\Ðü½§N2j\Ô_|<O±Æ¾`‰K”žsO(\Èp¤žýj¹‰\Üú¦\ß\Ç\Þuÿ\0ø¹<\åª\í¿tÿ\01zxq_$+á™¹\ïšrHýD®1\ïO˜W>Á·ñŽ§P‡s¼T\ñø»@\í¨\Â	ÿ\0hW\ÇK-\Æ\ÒRW\ä\ð	§¬·Ci\ód\çýª®v\'c\í-Äš4Úœ>N¡o½Ž\Ð7ŽsÚ²>0i1[\Çi~É¶:ùÀw\æ¾K³»½†uxnfGV\Ç\ó¯®lüQ§x\×\áœ„Ouº‹˜\É\ÖE\0r:\÷\Ís\â#Ï©Ó†ª\á-=N-4ä¾…˜O\õqŽ¤\õ…\âmX\\\éj\ÒOû\Üs\Æ0+‘ø\ã]CûR\â\ëi\à Go@;W!y®\\\ßZ‘.\è[+žq\\ª›“\Ñs¯\Zk\Þz—o\ï#’V\Ã\îÁ\ëX:Œ\êÍ·¿®j´ÚŒ*…!,[¾z\Öl—;w³8\ä\×T!m>srw=\÷\ö&¹þ\'\ê1G¥¹“2eo\ò?‘®ƒ\ö¬\×\õK½E,>\Ð\écaW€q\×5¿ûøI´\Ï\ßøž\êZ\Ü\Ù]\Ã`„ü\ÉcùW7û[k6\Ò\ØOmial»eX\Þ\áW\çcŸ»ŸÂ½«S\Üç•œÏ—®&\'~\ÑëŠ±¥Hû\ÕÀ#pj„‡	\ÎjT“\É&0\Ç\Ðû\Ö&L±}s\ÊT¹\÷¦h\÷_d¹ù—)/\ÊG¡\õ¬ù	3\Û\ëR	W\ä`8^H¢ú\r¹q\åXy ®pG\ô®kO\ç,\Ø\é\Ïw]¸\ó­m\ÕA(pMT´cÊ‚<Ò™65VF…ƒ\ã§qKwv%P£<s\ôªS8g)$ .c=ú\Õ\Ü,4¶\\Ž\áO…9Á:Th(\ä\õ\â¤\'jª‘‘\ê\r>€\ç\Þ\ô\×`HÁÏ¥G3\ÇE\ÍF3Žµ#\'F!¶\ñùT\à%˜¶0\á\ÍA\à7~\õ#¶m$<\ô\Ï\åH´…±tøt\ò—?•6U^„t\éE™Se\0<)yü)\òª°\ã·\ë\\\ò^\ñÒ´µ;s\ÅB¥\÷·U¨\ÕTgÚ‚1\Û>\ô\0±€±\î\îi\Ë(f\0ŒPŸ:`Œ\çJG<\n¢IW`9\í\ÅT´p%m\ÝÏ¥Yu\Î9\ãØ Q»q\Ãu¦û:€jt\n\ËÁ\Æ:qQR\0\È\ÇOZ™Sj\à\n,-\ÅB3ƒÀúVµÜ¦!šH\Î0v¶+\rsEM\ç)\ã‘E…{jj^y‹1,Ç«’i\Íùúš©nûy\\\õ«\Ðns¸\õþT$\rš×žŽÿ\0\Ã2^[K„\È\"«|ømªø\÷\ÆP\è\ò\Ã,V\âkÛ¸`ûÇ j½n%\"ùnyZ\÷…t›\r2\ÛCŸGû9‰mq$\ö,1\Î}sUK\ÌoDv_u=SA\Ó\ôŸ	x<½Œ\÷\n°\Æ-À\Ì1(œŸ@?Jù\Ó\ö\Õ4ûµ\ðe…\Û_K§Ÿ2ú\å\ß{K3O¨\ç\ó¯yø\Ó\â\í;\Ã>}Z·]AÔ¥©\Î\é\å\õýk\áûû©®®¦žy¼Œ]Û¹\'“[N}•’ù\õ\÷¦]¹=@\È4\Í\Â5\ã¿^j[vXg?Ê³2\Ç\à\æ€ü\íO\Ò6ƒ\ÏZl\\° b˜™<®\Z$ŽC´Àri9^‡¯z\Ïù~Ó—Z–×ˆ\Ç\ì\ò>û\Ù\ëJÃ°\ç·À*\nœv\óPD¬KoRrz\â®y\Æ\ÅO\Í\Æ\åhDx\Ü=I\Çýj°+ùd-ø\Ó\çPªA\÷§M\"”Âœ„ú\ÕI\Ü‘É¢\â+Hÿ\01\öü©\"\'9\'#¸¨™°s\É\Ï4\èX´\ç¯Z–Q~,(\êI€[yA a;Šd`*\äR\\\ÚJH\'+ÒŽ¥¤Gf\ã\ì0/(v¡™†X\r%˜\Â±i]¶ŒXK\â7KAg5(rqƒÏ½F˜eüiH…\0I½#9ˆ\í’KP«ŽqÛšq§9\ÏZb³\ê*\Êü\0zv¨æ¸“\Ì?7N´\í¼p?\Z‰\âmÄ€MbXfe\ÏZ°³– \äÆª\0B€F}\éc\çœ`Uh$`@¨\ã,	n½©# ûT…À_QI\'›´‚1Òµ4û\õR¿Z\Åc»§½V¹¾D`‘ž{ŸJbºGm&½+µ\öú\Ôã•´$\Ú.OBOz\ó\ö™›%œšcœú\ð3N\Ö—c§\ñ‹/5¼™r\r£\'\ô®u‹0\Ê|\ËP1\Ï{v­-\Ô]\Û2\ó†ãžµD·Õ”¤\Ë6\ç8vþ+¨þÏ†~prpÃ¾j\ìø>\ê)>¹U$Cg;\å¾þ¸ u©­bÁb\ã¶I5\Ñh­\Â7•’G~µxUnœ‚Bc\ô¦\Ñ;• $…\ÜqŒqMš\'VÜ„\íëŠ»±L`¢\ç·4\ã;‡\Î{\Ô\Ð\Ó)\Çxvì“§\ëV›nG\é\éPMjŒ\Å\Ã\Ï$b™f«)\ëùQaÜ¶dý\ß*0O\ãT¥r[\àu\Ïjµs P’?Z¡#u\Æqži4sƒ‚GJž\Ý2\Äq\íÒ«ªœdO9\ëW!#}i\r&J®A\ny\ÏZ[–\Öo˜\'\åQ–\ã?ž).0,&>¨OJ\å¡úzgO„\ö\ò\ÇZ‘6\Çž\ç\ì0\Üy`Êœ\ç<9\ëÈ¬d¬ÙºØƒG\ô¢\å»ÓºrOjrt\Ãu\Í ¸\ñ\Û\òNq\ÅDÇŒ\ãNRh\Ê\Ø\'w9¥<“\Å1I\çw5\"\ò¤qÖ€\Ã`\åG•Œ‚i£Ž˜ü\êL\ð	9\âš)\ÜI<)\Ø$€:Ô±—\r\ëA\0t\ëøS$k#ª?»\Åb–|s[\Ìs\Ô\ñ¶©5¤x \í\r\Ô\ZiØ–¯©Ÿ´ù‡SF\ÐH\ÛÖ¬˜Ilr*`ˆƒN\äùeN\Ñ\ß\õ­\r\í½\òAÛ¸q\ÇN•—€	=¨¶-\r\òL2yŽ´Ðž\ÌÛ»%\0\n\àœ\òz°—ˆÀS†\Ý\ÏqU®ÎB\ãrŽ¾´\ñH\0’OZ\Óc¦£p\íz8T\å½+2\å\ÈY~`sÀkP,I#ø\Í\Ç<R\åÅ€y\îE44RÓ®‚‰\ó\è	\íZS\ê¬F\ï­c\ÝÚ\Ì\ÊÁNw)\ÍIk©Êª±H8)$g\\f\Ë6\Ø\ã\Ïn•ZùÀtÂ€\ÃÒ”O˜\Ê\ÇÔœg?Ö¨€\Í+;\ì)_@$g.py¨“$’\Ø \ñRIŒ\0¾\éA\n ­&P£\Ðu\ô©]»T\æ«\ò\Ã\ï\Í=\0^ƒ&§R‘`\åNÓ¦)·¼YL3ÝžŸJ²w1\Ï\ÝLÿ\0 J\Ùþþµ>¨¤ÿ\Ù'),(4,'cosmÃ©tiques','test','test','test','test','test','test','test','test','www.subgenius.com',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\n\n			\n\n		\r\r\n	ÿ\Â\0\ô\0ÿ\Ä\06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0øG\ñ?\õ8údrŸ Ÿ`ºX\éªkt\ëÒzON¶\ë\Ö\Ýz9­1i\ÓE6Gl*V\ÐYT´_:¹df\ÃKE(\Ép)\×\"@UCQ&u*VjSOXj‘5\á:_C\rk,Ø´§Î±æ³¦\É/œ³o\\±É¿?’­y8\é|ÿ\06‡\Ì\ç“É¡Ç„\å\Ø\ÜJa>ü\ï­_\Zkœ\öNvr­eæ‰T¹‹ª(Üº[2ºE/]SA\ë´=~…}\Ò\ôúV\ô\õž\Ý{¿W7^¥\rd\ék`¤ƒ·;\ñ_Ÿ¦\Â\Ùn\Õ_EWµWn\Î\õ\Û\Ýztž-Ó¤\ô\ÛZ\Ó:0hšu£stµª^\r)bCQ+Ó”L\ÍÊ´0¡\ó¦®Q±	ª\Ê\ÕËº‡B\Íyƒ\ëK\r››X˜l\ï!¤¦Ë›“¬»®CKM\äf\æ\ó­xø\êxü\ìøü\Îy¼\Ú^^\'\ó£4[xL’t6FÎ‰\ÇvÅ­•\Ö&h¹\ÕR—#ëš†\ç\ÒÙµ\Öib½UÓ =¶¿~\à\ë\Ý^ý\×\ôu¿n“\×nu\Ð:\ïº\ë\ÐX\Ã5U\í	µ)ø¿\ÎÓ¥M¦‡Ò¯Ö¯Ø¿ewo½N\õ\Ú\Ü\ôÙºl½6Mlú2>h\êi\\š-B(\ÍÔ¹¦.\Z,£S¡J‘¬£CG3Yš ¥\Î}‹gU4u	a3S<u\Ó¼\Ék46u”\ÒY\Ù\Õ]b\Ú\å2Žo77™\ß\ro7\òù\ß\óy\Þ\ò\ò{Äžv5\éŽ\Õ&4x¶6NZ‹:\ÈK\ËR›\Íl.:N]`\÷•:À\í4>½×°\÷\èN\á\ï»u\éÞ_¾”\í\ÓC®´´¸0P¦\ã?8.”=4ºµ]Qv¡\ëW\ì¯A7¢kVÖ£{7M›{&\ô\Å\ÓB´\ò\\©Kž\r04AE1\Ä%\ÐV)¤Œb²©¢[‰B1¤u:_«XÚ³JLj6u–Ò“f–º\æ-`™¢o3Oœs\É\ÇO\Ï\Æ|\Þw¼ü^\òcC\ç\Æ8\Ð\ë\"\Þl\Ñd&6Nz¬\ÌT\×D¥Y\åu	\É[¼\'\×\"\è\êM\Ó}¥\è^\ô\ë\Ò;\è\î€\ô\õ]\ënž¥W*T¢ŒLT\éù\ðu/Öz\èúh](»Qvª\Ú\Ù7²kE\ÞË½_¦\Ù¦\ËS:\ËÉ¡‹T³hb[­\â«R\åJ%®U¥©˜.uqe2%8\ÌQ®©¹\ôY¸\Ú\ÌgY\í)6Ô§\×4µ—³G5‘)Š~\\\Û\óp?Ÿ\Î\÷“ŽŠi|\è\çš	:\ËA%\'=\ô\È\õ›3\ÚR\Ê\êL²ƒ\ÞG¬¥\Û#\è‹\r:u\ô\Ó}\é×ªþ\î‰}>\Ézº\ÏM·wXu\\© €\Æx½{¯\Æ~}nºZ´z´\Ým-Ú‹¶£ªûÝµ²\ïf\é£kLST\Ø\ÂMÇ‘\Ð\Ò]/¥\É“E\Ö%\ÂÕ˜*‘I\Ù\Ô\Ö)\Õ{\Ö2\×usU•5›j¬úX\Ë\ÔS:I¡\Í7+:\æµÎœ\Õsr\óµb\Ò_ü¼4||µ<\ïŸ\ñ\æü\ñ–¢\ó\Ü\æ\Ò\â,\ë!Ž®–,‚5‘u\æ\åN¹YPù1\ËG\ç\Ü\ï^½r¾¯l¿±\ê§«=7F•…\ÆhµÀÀƒ„…\ê¡~3\à+Ö¯Úƒ¦Çº-\ÐvµmS®§z.ú_¦Í­7Mh\Ð\Ø\Ú4†+d\Ó\ôÌ…¡4\âP\ÐÒ’X–‹P‘ZR\Ã\Å\æ\å)¬Ž\ç\Ç\ê›\Z¦nL\Ók‡K\\\ïFf¢9\Ð\Öf)\î±Õœ\ë;4PQla\Ï?Ÿ4~vù\âx\òÏŸ—c–ü\õMgˆA\ïœ\Ü\ô\Ô\Ë\ÉM`¸‡®\í\ÒE1Î³\Çmp\ëiµû\ô\ókÓ‰\ö=“\ì\îþ\ô´\Òp9X¦,U¥ƒ…€Z‹)\ô/\Ç|úi~”]hw¡t\ÒýK\÷/Ú¦\ã®û}	\Ómj»c\ã£!\Æ†Z&«MXY\r/Ru…\Z\Í,°µ*.£Jˆ½–š\àCš\Î.\æ<¤\ç¬²\æ\ãj\ÍÆž&·/Vµ¤Šk\ZAy	å7¾nO\à\Ç\Ì\Þn\'\ã\Îø±\'(·ÏµÏ¥™¹)®K\÷\à˜_¬DQ±\\\ãÑŽ=-\'\êß›û^¬Ÿ§\ëW\Û\è\î%EV¥\0l6ˆ˜²L{\Ï\È|%»h]4\Út£\Ý[µ_¶•\ô\Ò×§X\é¾\ÞÙ­4U\Ô}Œ!\Ò\éz€´Jc#Á–,\àƒPFªUD$,-*VQ³cºÏ™ÔŽ{\Ì\Î\ó3¥-¶°d[5A‚\ów65‹Šµ³s|\Ò³C\ÅÍ¯™)\á‹øùw—ƒ^\\žzI–»\Ä\ÊLjÒƒ¯}p\ï\Ø{B’VùiŽ]mdûú\à}Z~\ÏB^¾\èúz–R\r)\ÒjE¡WAU:	[¯µü‡\ÃW¸4.”}-.ƒØ¿j¯¢‹®«Ó¤t\ßkD¦“Fµ‡‘›’…B¡ZŽ1‚-RT\ÊSŠ\ËUB3)UZ±iQÖ¶±›¸¦49¯;ž€ˆ\ÖlÎ•%[OM¬\éX\ñYe	D\Í5\æœa>~V\ðeoù8ŸÇ†¼¹¶d\\\Ú	\ÚPtä§§\Ì¸®Uš,\Ó¥Æ¦o/\Ù\×3\èú”\õ\÷\Í\öwK\Ù\Üú\Ñe:‰D¥#.µd¡5yoV”ºz/\ÇüE»h=\0\ê\è\÷A\×@\ï v­¯N‘\ÓEÖ®\Æi\óH~Æ®[‚3Å ¡4±h5 C‚f°°D½*2\â™\ôœ*ª¢\èM©«¬aË¥5\ç\æ\Ð\ÍŒ¢òª»¨\×\Ö=^²ú7]ša¥\ì\Ók$Da_,C\Ã\Ì.ø¹ŸÁ‡|pÜ§Ih¾m³ uâ§£Î¿~u\Ü\éy¢gl\â\Îm±¤½:G\Û\éC\Û\è\Ì\ö\÷³\Ñn\Ý¤©\rW¡\Æl\'(\ÎK\Úee\\†C~G\ã-Ú‡®…\Ð=\Ñ\î-Úƒ¾–\î§MW§N\é¢\Ý\ra¨\èÑ¡c\ÔÍA$›,(CŽ°•x2\Ì4ª5\ì\è”¸r\'h\ZQe!Š\Ò\ÖPS\æ°\Ö$¨V…\Ê\Ù\ÒÇ£³\Ó\ô\ç\êYº<¥—‡¦ ¼\Íh\çyÔ¼|—\ñp\ï2x2o&[\óeŽ\ÙÕ¥^Jz<\Ëw\ã]\ÊU³\Ð\Ù\è|Y\Êe\å\Ï\öw\Ë\÷z\÷w§¯¼\÷\ë~½;vKT,gBR¯m\ÃZ\Ðø\ð\Øq?\Èü•»Ò‹¢›Ðº@v«\ö«ú ºt®\õ^›5§±‹\Z‡Fi\Äzš\n„-$\é!R\çK[-V‹/\Í<Ð¦ƒ’¹c\ÝeF}¯‰Ù˜É‹\è[Î·k6h)k)(EY\Ö{M\ñ\ØIV¦£4ªÄ°ƒ‹Z™\ç3S\ã\Ío¾~;Ã’ù0×ù3ll]9§\è\ó\'\è\áN™¥—\ÎÏž¦\ço‹2\Ø]\äûý\n{½\ô\ö\îýmÛ§u\Ýzh[¶,PC%Z¢\Ü=645O‡0ÿ\0\ò–\ïAÖ¥\à\ö_¶—\ïEÖ‹µMOM‹GFGFÑ«“A\éš2M—9.–R„--W#MRn™#.=\Ò \Í%M{\Ô\Ç\Î\Ý5(r%e¢4\ôv§­\ß\Ík:\Ý3£GJ,®e(\ÎVc.f\ðs&/\â\Ã^hørLaOGOv\æ=Nhø\è\Ç_	–\ëÕ›\ìì¯³\Ð/Gqv\ë\Ýz®\ç­£q× À\n\Âr¯i•¡„=­£A‚3\ó\ïA\Ð¶›£\ÝrÝ´>”\Õ\ëm½Œ…£#ˆ\åŒAj\é]JY{\"K—‹©‚­‘mb„\Å\Ú\ì\ê3¤¡:X,¤\\¤Ð°š4™¤›Iš&9f²­¼:\ä¾z;S:V(-!¥KEI°	>-\ã\ä6¼wÁ\r\äÁ1\åO·œ]p¿lZ&t\Ç\ZNt™“R‹u\ÚÞŸH»\÷W¯a\ô\èN›sÑ³úú—Óµ\õr%IWU…­°\Ì25F.a[Cß’ù«u =(\÷iº·j\Ûrý\Õ\é£n²†°¡ƒ±\äpiE°VE“$AJÑ‚J¬­-\í^+Sš‰F)+’¢¹h\õR\Íd\'³Kže6’·V\×<\Ü\ä9\ëL\ï9@\0\0•zi1~<\Û\ðq\×ù\óGÁ#\ËÀ\òL\ä¸\äi|\rÎ›+IS­\í\õ^\ê\ô\ì\ôŽ\ÝX\õ\õ\Ó\ö\ô7§¦^™syj*”®–T\ãÀ`\ãa’\æG\ä¾rÝ¨:…½rš«\ö \ë ú*ž‹4]‡F)\áK‡±\Ë‡ ¬ZeR‰X\à”yª\æ\Ü~é˜¢Ü¥Œ´Ybå±ˆuŒ¨¡\ì\×k	tX\Õ<¢jRsDc\ÌfŠt^Um{-P\013¬07s:\Í35<\\¶¾~]\ðr\ï?q\ó\×0.{„ƒe|\È\Ì4\Ù&\ë7Mn:\Ó\è/¯³>¾½ßª}º§ßª5˜$P£‹«#\Ô\Èp‰rÁËˆþK\æ/\Û@\ë¡\ô¢Òu\Ð:\Ð\÷«z-:Shj$-Œ\'B²ÅŒA# Tµ‹X4‚ \á*¹¦4n´³H¶J\ê\Z\ØÎœ[:@Ê¬¹u•¥\ó)¸˜\Â\È\ìQå¢­D×ª6\ÆÊ‰™&A…I\Ü\Z\Çu–Q\î\Ôùøs\ÅÇ¼¾z\ð\å¸S<E\Ó¹kg2\Ù\Z™®š7=t/¯´ú»§ß½z\õ·£ªþž‰v\è‚\ç\Ú\"«\Õub¦¹xº\ÙoDAþO\å®Ò‹­\õ]Pv¡\íA\ßJ\÷´\è5¯D\n24‡.Iu’ZH”`\èDI`ƒW-h¦…ºQyJ‘eÀŒ\\½\0—6\Ï?t}$×”³\Ï\Ê<\ï;,Ja}\ä¾\Ø\Þ\0\È<Ñ‚cY…r¨\åÎ®²xs\Ç\Ìþ.\rx¹[\Í\Ä\\øD\á\Z\Åuh^\r„Ä‡\ç¶9jý:¿pu\îGRú:‹·D{tO·D7¼\ÕRÐ•KRŒ#JJ˜½^K­\Ò?1\ò\Ób\éG­S¥¥Ðºƒ\Û`ïµ½\nt¦«\Å\í\"B‡FF	8ºH8•(VZ–°¡‘¡\ô\ÑFuKLÁsª¤$®zWX0Œ-o››Ñšw7\Ë§ž•^w8R½¬\×\Údºc%>py)1)T\Ó9\n\ï:Ûž\ñq?‹‘<\Ü;Ÿž“ˆnD1\Íi\"\ËÁ±X\ãM\ËW\Þ\Ø\ô\öŸG`t\ê.½U\í\Õ\Ý3ztC{SzZ…mR\á\ÃZq‚\õh\ã‰&ü\ß\Ç_®…\ÓCÝ¦µMZt\Ð:\è¶§¡4KH,‹EB—%lrZ­ER¡\ôÅšHú:h¥\õkMJ–@\ä¹iA.M\Îu\É\Å\ÕEÄ›\ô\ÒùU©*$œ~k\êªÁ\Ê4ø\\y¥‰BTMef\Ö\ê¶lù¹9\á\ó“\Ï\çS<PÜ‰Y\å\Ì\Ù\ÅÐ¸Í¹‹\È\Ç(\\^\é¦;u\îU\ë\ÙN”\é\Ñ^šO{S{[¦‡«\É5Úµ\ßN´¶œ¹j´±Æ\æ¾2ý´.š­7kº›_­_¾—\íª\ïw[¢…	[9,X­¼š³-\Ø\å4\Ëc\È\ðÀAZ\nµ4(´ª“’’\ä\ê!`\åar¦™Q¢3I\"2\Ð?fµ ²q\ós\ò\öb°\á¹W­\ãj\å}P\ål`\ÞO:XåŸªBsÁ\ó–\ñ\Ì\Ü\ó\\K\ó—\Îoœ›”.!5ª\ï¨7\Ð\Úû\Øw¡\ë|p=P\õ\Úýz/×¨:\ô¦\öeb‰SLLl~s\á®\Ã\×cÞ‡­Wt]jý´¿m¶\é­Þ¥lŽ/Y!z-RB(ÝŽ\\žÆ¬zF\nªKœcR\ÊErQhRT\ô¡IJ‚–\è›B¹T\õ§\ì\ål~d>A™X\ã@\õZž\ÃY\Ð\Þ°J\ÃÈ¦s™	\ò\È2c>1\Ì\ã$™´…\Ç6¸\ó?,–o\Ïˆº›o˜-i~›W·u»v[¿e»uN¢\×An\ÛT\ñbe&\ó¯q­\ó\çþt=6>›­5ª\ï@\ëA\×@\ï±u\éM\î\ë5!\ÑÁeºI2\ô°E…°\Ô\Ê:X\í\ÃZ‡\n…\Ê\ÍUQšK4je¼º\n\äp’ù\ñ,ŠƒQ›d\ëm`\"\"µÇ­—\õ\Ëf.&~xg\ä\ñ™=½ŸH\é\Í^œ—ZM©@\"F|Ò¹-šœµ±™˜g\Ú\çÍŽ|\Í\Ë\Ë\0\ÆŒ\÷<[žo\Ï$ç™ \õ\ì§_Jý=#¾ªkµ7µú\é>\Å{	\rb³\Ì\Ö\ó”cœ.\Ó\ó\á\ÞÇ½¦«u]\Ðt\Òý¨z\ì]z}:\ê\ÑrÄ—£&.4±G°¶5¬»c\ö<\Ëik8\ék/*3Y\óLK­.\òìš†ª”X\ð\É\ð&s’‹z\ënœi+)—\õ\äÖ²\Ü	\ò4ùrxøÍ†c\ô7H¿>³\\i¬le¬µ‰B†tÒ¹\Ò\ö\È\â>Ž£\ç8À1c\çc\"\åÎ¼¤\ó·\å£p\în^–yúž\áÞ‘\ô³ûÁ\ôSQnÓ¨²_0˜9š\âc“\Î{?:\ì{\Ø\õºkT\ÕZ¿]‹¦\Ç× ·Ó®¤°H’\Õhµ\\ H¹X8\å2Ž\ë.\ë.\ê4Í¨iX´;[:Î•|\ë]­\å\ô‡¦]\á#L\Ù3“\ò³-ªiº|Ù³\Ô2	¿~\Íú;N’žm~zžX¿W\í\Ë\æÝ¸›œ>vº\Â\\²\Ä*y\Úy\ô¬¡M+7™Õ°’-IHœŠ\ã\"\åš\ð¥\ót?‹«þ.\ÎyºU~…´\Ët)\ÙB/\ÕM/\Í73\\k¼.šµ\É\àAù€\ïb\Þ\éu]j–ƒ®ƒ\Ób\ÞÇ®\é\Ö5«$š$Xµ\\¹b\á`Á¬m4lÐ¹sYb\ËjXˆf£)4¦u¥\î/¥_^¾ \Ç_ž2<¤eŸN£\Ù\ðK˜\'MK=ú‡?l—k\ÉKŸýF_tº\'	Ž¯˜\ß?‹\ö\à\îs³*V‚\Å\Ö^\Zi	¼Œ\ë6U\Ø\ë:\ZÆ\Ë%µ*«\çJÊ¶\á®\óhžmÉ¢ùª”–‰\ô‰\ì¾\Ô\ÕkŽ\Í\ËV^R\Ê\×1ù\Ãs\Éq\Îüø\óŸ‰ûÿ\0[Ø·º]W[´\èzÐ·±\ï¨z\ô‹¹,I%\Ë\\!t\"-ŒX\í2\î£%¹¸¼\ÖnY“Y\óJ\ç[“^–_j¾\å]_Ÿ:œÇ’EÏ²i\à\÷1MM=ž¶c\Ú&ƒJ\Ë\ä.±y¾ ×¢7\Ö@\'\Ï:sù/N’_E4­ˆ\"\×=©¤hA¦•\ÍÁš\Äix3:w\Z¶?L\×YE¤*%*œ\íx\Ûù—\ò—•+¥-Z\Ð]QZ\ó\Ö8­œY\ç|\ç|\à\ØÁùd¹˜K\È\ì}6;ºkT\Õ¶=l[ÐºtN´\Ö\ìL¼Y.¼Y$±%Â‡F¬gG\õ¹m.‹J–J*Y\Ö\\\Þvo¢_n¾ü\÷k\Ç\ÏO–.\ÌB8“\Úhm\Ï1e\ãRµ4\ô\ó?Cgz1\í¦/•_L¾sSJRž|\òµ\Ï\Ö5\èc+%\Ð\Z7¼¼ld\á1ž\Ö\Ö›(%¨MM=gZ\çB\å„5Z:P‰JŒ«\òw˜¶jWH]­hZV\ã‚\ñ\æ~\\\Ø\ã–xF¸˜\æo¾\Zs†\Ï\Îü»\õ¿\Øúlz\Ø\÷i­[¶.¾\ëÒ¶\ó}d—‹$Õ¥\ã‰,¦§Q\íe½CYŠU£:\\\Ü\ë;:\nús\ÜA=\ÛEO|€ù4)™\Ã\'µÒºž_P£É®šº¾¢g\èRo\Âg?C\ÕùÄ¢\Ö›\ð\ÇožªzA\ÊC\êjÆžc«¡Fek1\æ¼\ÃXm\"´BÜºÎµÎ#(\Í¬\0\n«*’§%-‚ü\è¹H\ã’\ð\Ë>c~S¾[¡\äÛž}5\Çmù\ö\ß‡\ã\Òù¿þ‰ù\ô\Ðúh:\è=êº¢\ÖÅ½‹}\Ó`\éÒ›\ß³m¢\ÖX™l’œÕ‚)†\éË\Z¹µ\n#.t\Ò0œ,»g»_¢AW—\åü(\ó˜\\\ö6ú»<ýyD&Œt\ç«3\ô)½,½®¡3QBfß£\Ìù©¿›Y\á\ô-\Ä\Å(Úš>št\ì;+ \ë>\Ü	|þn|«À¬.¦ÎÎ\Ëch\Ê½Vi3=¤³A\Ì.J\ðÉ¦üzoÇ·|[{É·üºsÏ§|úcŽ\ËË¤\ÍL|3úG\âC\Ób\é¡t\Ð\õ±\î‹[\ö.Ó :l=u\É+%’\Ç²²X2±N\r\Ü=c:‡²¤¹\Ù\ÞntŒ%*\Ö\Z½œ¿E—\ékº¶A->b´cb\Ìüf±m\ë\r¼\Z•\ì=¯Y\î°<Ñ¶\ÒfG„·OL|ya©¤Ö±\ígBgM4&š´0‘.¹M.\0´Yz\ãHÒ³MrD²\0YRTeFh|„\óV<}\ã\Ùü\ò\íŸ.\æÑ¸VxW<úwÏ£r\×þ‰øÀ\ô\Ðzh]4-j›Ð·±o ºl=:-\×@\ë®X%d”•’\Ç¤.¬\rX\ÝË¶1e€ŠÊŒÒ™\Ò2­(’u4z¿K—\èp\ò\ÂTª…<\åŸ-¸ùu¹\Ò\ÅE\æm=¥Ç±\ÎÛµ\îjVŠj\Í\ô¾R\ãSs\Ò\çC\Í\ð_=05	f’m3®ÎµŽ\rGPL\õÀš\Å2\óV¥\îMct\ë:Š=\r\Ø\Å].M«*R¥-|úcÇ¦|{?¡¼šgË¢\ð\Ô\ð§\á¦ü\Õÿ\0.\Ç_þø\à\ô\Ðz\èZ\ÐúZkb\ÞÅ½‹¯Eúmnº_®º\Ø^^$’K²\\ a¡šj\ÆnX.‚U…f“Î””1¨\Öi\Ù\ë—\è‘\ôu\å	•^n\ç\Â\\ø<ýÒ±\ÚÍ·À\ö½¹­—›\ÐY\í\ò\ÏcZ\ëC\õŸFÎ§7·\È\ç^%rµ’šæ±·qª\\°\0J0š\Åk.TlY-F±›\ZG\äuJ•©Š(•\\Õ¦©\ç·\òlþ=ŸÉ³y7nÜµ<i|\õŸ-g\Ï~Sû/Éƒ¦ƒÒ‹¦©½Z\ö.½¯\Ûku\Ð;jš\éz:ÎŽÕ±Å‹…`=\ËZ†K\Ù\Ê	V\ÎÁR±º%„±›\ÓF\æ—\Í\Í\ÎÓ¬LÒ±j\çU\ö\Òz›¶11·–\ËHŽuŽŸ[\Ó\Ñg^T\ðû\ç©\ÇO&¾3Y35¥.Æ±µq§r\èp2\æM\á\ÍdMfÒ¢\÷%\Ö\\±\Ôy4\á¤e\\¢\ÑC*°””µo&‹\ã\Ù|º¿\Ü\ì\ò\Ñ8\Ò\ð¤\ã|W\Ùü¸ºP\ôÐºh{¢\Ö\Ç\ÓB\ß@t\è¿m+\Û@é¨¶\Z…“Ž‰,DZ‰F‚Ñƒ\ØÞ²RÁHÎ…/Vu\Z²º’@h\ÑeÑŒV\æ±5<æ¹¢¤\ÏE•Jú¹ý8\×\ÏK\êhF\×Î—s\\þ\ç_\'>s¹\è\Ø\÷³x9ß„\ÔË²a\ì\ër\ç\Ðk:·iŽPMdgYsY’ ª¬±¬·c¨\íš;&€\èÁcŠ\Ê	VšMRT•~t\Þ]É¨\å{\Ü\íùÆ“•\Å\ëù\Ðî‹¦…Òt[\Ø\÷°\ô\è¿]-\ÛJ\õ\Ð\÷ª[K®\Í\ãŽ\'K‹Q\Zš°\÷,K‹ÊœªMQnQ«“!,cSV\Í\é52&:g\Í$bï—‘\é\Ì\ßcª\íÏ®\ô\ç\ìq—s­5,DZ\ß:f\ë>¦<\Æ5\ñŠ\òž›XúTÒ˜\é\ãW\Ï\êY-\r¦\Ên\ëÜ³h\Ìù¬\é¬\ÉsU	E(\Ã\\±rÎ£—:)¤Ë£Ãªh,³/(*\í#Ê¶Q\æG*<…‹L#š¸Oƒ\ã¥J.š\è\õ \ï`ë¥»i^\Ú\÷MQ\ëTXk‰:¬Ib\Õb\å\à£\Í2Œ2j˜^T5\è&£6:‡\Ôf\Ç\î4\îYCf—43V\Ô\ð›ÏZf;]­nœþ¯3\ë1}t	Eƒ\ëVŒCF¾a5\ò›”\õ6\õªf\èg®\rye\n\Î\Í¬ËªÎž°ý\Ë(¢\æ\ÍdMf\óAX”\Ö3rÅŒ\Ø\Ý\Ë\Öh#cÀH4]«Qª²¨-*ù€d©˜o\Î|ÁuJjz\èwµú\é~µnÖš\Õ.‡­/\×uº\è\ê\âÅ‹¢/§\\\Ý+IËž .\Ç¦Z\Ñ\Ä\"^\æ\ô\ÖE[¢\Úyq\å$=—[|¾\Ã^\ç\Z\È\ç¯r.™s\ét\÷se\Î\á~7/Ïºr\ôÛ¯¬\Ë\Òcxµ•¬š\Ì\è\ósY\Ù\Õ\Ít×¦nGfT¹meF{JJ2ÃƒzŒ2\Ê9rí£c!\Ë\Å\à«UV€/-\n­%X¯\äþU6œ\Ê\è”[\Ð:i~ú[µMWZ\Ò\Ýv›«\\qÄ–,Z¬\\¼1MŽX\Ê\ËUr\È\Òh&…› Y	5Ÿ’\ÊÖ²+œ+WµQ~{FW·\Ë\íz}ž¿:\ñ\ë\æ\õ†w“!\÷\Ï\éG\Ô\ó\Ð\Ó\'›\ñ}8úËÙ½‰t\ó¬…\Ë\Ön³\óq‘5xÜ­›ƒ\\yqW1P–c7,F\õe¤db\\,Yj¡P(eX¤µj±Yß”ù“e³‘n‡¦‡º¿m/\×Kv£Ö«t\é^»M\Â\ñ\ÇJ\\½²-m±\Ôp 5\ÏT”cé¦¦³®†/*‹—–D\Õ\ÖgYZ‰\Ñ<\ÐX}g\ë©\õN[ü±Žª\õ\Ïj0i«q\öû>‡øÙ¯¦ýÎ¼jMh\çxi‘¬\Ø<*y\Ê\ó•‘6‡*Â‘“.dªªŠ!‘´b\ÃX[.Œ\ê8£Cr3)‹(A-R‚)UB«‚ü¿Í¹3!\éE\ÓB\Øt¿]ª&‡½/\×Kt\Úý7V¸\ãŽ$¹b\ô@Ã–<ŽŒYe…¤ Ò¹\ÕM‹4²JŽ3ZK:È›É€o²1UQ2¶‘sC\élýšk\å¸\é\åúgWYÊŒUÂ—\Ú1ú\',ù¿§®\ÍÒ²\íd¦²²5(sqe\ó\Ö\æ\ë(Ö„iKjœfÊˆpJ0\Ø\ÕË·,k$\n3!\ÃJÀR@ª\à”„\ÒX3?/\óHœ‚\Ø{\Ðú\×K\ö´¶º«\ïku\Ò\Û\Úý4;¾^Ž©‰¢Z‰NX\è\ÐP‹T^U`#F•L½©­p\Ò@£IK‘\áZµ\Ê\ô9WÎ¨ƒ¡\Ü\Õ*¾¶\ç\ì\Ó;8\ë\â76nD¹i\çn¼\×\èi\Ï\×\æù‹zµ\òp	—¦=\Îs,)¦°\ó|\Óy–9®vÑµ®j\ò¡.5©))q\Ö9s£r\Å\ÉlbU©‹EÖ¤,¬+¬\Ï\Êüë¨=AoB\Ø¨\÷kt\r\Õúmnš[z¶\î.»)®&¬\\µ%;NBjZ*V¬Ò¹Ø¸Ô¸6‹Â“K\Ë\æó¬µ¥€ZM-(\îFC#šµ>\Ï\Óú»wZ DÁ™WO¡¤\æ\'i\"\â\æMejg2RTy×˜šóª¶³»®{W%\\y¼©¬\Ùq\ÕB	†h\á`¡\ê\ìž\ÇYÒ±\Ô:3U€­%\å2ÊŒqZ\Åü¿Í’5+`·Eµ7ª\Ú\r\ÕúmnšW¦ƒ®€\é \ë¤[\Õ\Ç%nZ\Â§Fƒ%\Ò\Ê\Z£Š\ËcQ4®4\îY\Öb¢—o\"PT¤µ—)sVx¬ÙŽOGq\õmOw;¢Zši2R‡,‹˜‚Ÿ¬„€\ò\ã\ÍyµÉ°\÷;›Æ¬—Î°¦\ñf²¥\ÌX«§#t\àblº\Z±«†Ñ€Á–¥TM@8˜n™‹\ó_2j,‚¶Z­¡\é¥úinºW®–\Þ\Ã\ÓA\ÖÅ­\Å\×G\\X²‘	L\rQ\à–^­-@J\Ø\Â6Ž\ë-\\\Ù¨Me\Ê;BBg´Ž5F+s\É-4X-Ç´¹úž²mÀ‡E\Î-\\x…Á\\‹•¨•\Ð—²*”î³¨\Ë*†nw•5.\ÑQ\Ä5H\åŽ2\å–J\ØTbÆ‡F\"\ëYh	FB\Ýb\0X\Íü\ÇÌ²E•JZ=\è ë¥º\Õz\ím\èÐ·±oB\Ö\ê¼\×,\Ùb\Ëd \Å2\Z‰AYVD_¹j\Ée\ÚR3š¢ª	\Ò9 ’¶-R\Ó¶¥\è\õÏ®˜\ök¿5«)b\ëR\×B„¹5žgX\Ép±™xŠGF\Õ\Ô\áL²¦\ñ3¼¡¥8:5E¢XI–\ì\Ñ`Ú‘aQ\Ê\ÄX–K@É¨„ÿ\0)\ò© \ô¦ƒ \ï@\éAÖ­\×Ku\ÒývlÐ·\ÐR\òÕ©!e,X PÁ†S$µrÁ¡\ë\Z±¦jŠh2„Z—¡°¹º\ZkY[\ÏE)Lž±=LžŸmf^ H¸’„#d…¢\ÕQH\Í2Ji¡aµ—\ÏÎ²—+ÇšÏš^º\å±Áúp½”°Ì¾Ë·3¬HPªiY–e\Z\Â\Ñzª\0ü¯\ÊƒÒºƒ\Ó@\ëV\í¥º\énš\ö-l4î™±,5\Ë\Ñk,J\Ý`h1rŠ‹$–\Z\Z\Ë	{%¢Î—\ÑI\0´ D%\Æe\Ð\ÔÔ¹f\ã[Yâ­º\Î\äÇ¶\ÇM\\\è–\ÌH²®.žƒl\ÕEPK¹v\Òá»ŸE¨c.2c&k#:Ïš\\ª\òšÆ“D\×G,”°\Ì\èX\Ó&®Eª%<­K+J5]EYŸ•ùBÚš…Ò‡¥]-Ö¯\Ó@\é±oaÞ–\Þ\Æ\Õsªµ\'-¬˜µ\\¸q²¥ª\ÑUƒ”ä¤£\ÕI6]”3T3Ph N—5n4uKÍ¶\ât,\Þ[\Ù×¦\Æ\ßn\Ñbê…µ‘SDšVgFZ\æ¢\r-h5—Ø¹\Ù.*\à¹³jEK´¬j5YÓ°¡u9\nŒŒ£T1Ax²²^Š/\'œü\×\Ì”\Õ\àºh;«u\Ð:\Õúh;\Øwµu\Ð7uŽZ¬/GE\ô\â\å‹£CjbNY£\Ø`rS7:¢¨K\r$‹L\õ£k e\è#BÍ›m\óÑœ\õ\Zm\Ó:g;Xn=67 \ÛcY§Z\ÝJ¢°¬ªQQs\ÇTU5kYkSJ\ÍFzL\é¼|k\ÆU²Ä·\Ô:%3c(úhX\ò,]—[­(\0–”¥\ä\óŸùƒÕ¦ · \ô¡\éW\éA\Ó`\é°\ëj\ïa»¢Á\Ñ[¨^Ž[Y\'.¬#EŠ„£EªŠfÌ¼Ž\ï:\ìU¥VT\în	«Ê¼]«\\Ü°\õ›W\Z:\Æ\Ä\ÎÒ¶\Ðd\ó\ÛÊ©\ë3¦&ªjf\ë\Í\Þ\Õ\å\ÏE™\àY)JR‚:f™\ò\æ\Í\çgYwYÑ¶\ò\'y\ÖwŽ¹\Å&jCShÖ¡®[d¬¸šh\ÕIa™LrÐ†«n?\ç¾U4\èzh=(· o`Þ½ƒz·Kª\Äkšƒ“‰,qfŽ$\àˆjf‹W*5iJ1¬\ê\\H\Ô\í\ë°µ+‘e­—\"\ÔÜ¸j\çbOB6Aƒ¨•ž“:Ð–‹1¥hUN\ÎL!KHzÊ®¬\êÈ…&Œ=¬lk&Cªy¹«‘›‹5žµ+«-”¡\Ñ\Ë¹~\á»*Œ\Ø\õ„‰•©J¼B¤*xo…\ò\é­St[\Ý.\ët\r\è\Ð7¡jZ´¡\ÝB\Ô\ãŽ%l–[\Ëb\Õt±tf›®8¤jGlf\ä\Ö\"Q(­ˆ\r@$6m¥„JŸY\Ûf\é\è\äÛ³E›µ™b«¯1\nª´ü=6\Ã i	³%V±\ñ\íDLs*ƒ)•\än\åÛ™±9T\Î\ñ\ò\Ë\\Æ¸¬X½X»L…¹-\Ø\ã/£5²\Ö8\É\ÂJe¼¬\ÍAE	\à~\'‚Z·K±\ÝB‹T{´´t;E­`\è-Qj\Ò\Þ$’\ÇJ”ºÝ’¦*Kf\Ô\àÁ¬%EJEf£JÀ%¦ƒb\ÒZl’\ò.\Ñ\ÛÆœ²žŠMd\ì\óC\0ºØºŠI¶©l\èB¦z¢NF\Ð\ö7¦fÂŠZ\ÑrTŸ4†nl¹\Ê:±x\ê±fˆ0Ë´Jµ\Ël´Ë¨\æ \ä›¦²Â›6\êy|À\óZ\ÕnºY)¥(wC\Ð:¢¡l\r\Ðjƒt[±»\Åe…š³6\nYl·d\Ôr\Ñu’\Éb\ÕSª%¥	i¨)‚¯M2BL‘¬³›Æ²k\ë\r$Ke¬if\èÅ’Uqe\ÍQ\"Ê¥5L²¥”W,%cd´R\Ý]F× ¨¤f\Í,©ff¦\r§X*’\Çª\ÖK-Ãœ\Ú´\ö\Ð~ŽG\ëƒ\Ø‰b<\ç\æ9ZŠ\é`‹)m-‚\ÐZ\Ð4\èh[zªý4ª\×MJY/D%©B!‚–VJ—±c¦¦ ¤.S³-i%)en\ÔFiQ\äwY4t§ˆV\ãFE¬¼ U”%H\Ò\ð¥\äè¼½i\ô‰À\Ç\ìÐ¡K gÊˆ°´¡’Á	Ð°Bµ!V\Êv^­(gŽ˜\å¦ø\è\Üu¡ÎŸPŽkzø“\ÓÉb•‰ø\ÉZ¦”ªiZ¦ƒ\ØmT:¡\ÐT=Q\ÐwC­©nº_­®’Ir\ë6HU¸T\ÄJ\õ—®\ÈAj	\0…$0QƒMr¬VŠÕŽ\Ùt¦Wº´0þd\è@%¥`Ïh\"F¬\ÑeayªjÁY\0}¥\ã4\Í\ÍU\ä\"l—SÒ¡`\Ô\ò·\Î\êsÖ§-†\Çg\á¹\ç£\\›S»rS\Ý\Æ=\ñÿ\0-\ä\ä*SA\ÙMQ\êŠ\ÑZ=)t:¢\Ð:¡\ÝJ·j¿]+\Ú\×K®,\\º”\ä\à§¶[\Ü\ÖJ˜\ë8*¤ \Ð\ÍiÁL\Ú\Í“”Z\áx0X3!¬VQK4¬M+Z\Ð\õŒ²#>U\î•\\i\'*$´*¼–.…h„¥Õ€’’4#C¼i®;\Ð\ç_\ç«ùú–»žû•¼3¬\Ý<]ü\÷œU+T´z´ª­-£Qj`\ê‡t4¿]-\×Jz*ýN’X B‹!Y•@E Du&	R\Zž­\èP@\Ê)\rUˆ‹‹®\È\ô\Õ\ÍDe•p¥1e£q%)YY©ª–\ô¬J––3e\ÎŠ­IY--‚\ØQˆkž´1]Í¶4hÐ‡±O\Çf\ó\ôsžØ–\Ü\é9\ê\Ü7>~–\ç|_\Øüb\ó£]8M\Ê\\=Yb(´¶€µC­@\ï`\Ù~º[®\Ö\í´½{»N8±r\ñ\Û%’\ëu³2\0«S%é‚–uTX°¡´\Ø5„#8\Ì+MD…à¥•r\äAi\Íe›œ¼è²²\\\Ñ\ÖQ]i6JB\\ISZ\Ñe(t¢\ò\\	“’¥H^,¶š¾oY{cy®\ñÛ¼µ§“y\×J\Ì?Š\÷*n/\æ\ê\Ît\Èn\Zc\ÏÐ¼\öë¿‘z¿w\Äw¹\éùþ\åþ›_·‡C~o~o\÷ªp\ôQEª\rP\î­\×K\õÒ¶§n‰z.¤©ÓŽ,q$\Ä\ÍM\Ì\Ëz%’@2¥\"ŠE‘A;+’Fl\ÚV`Œ#±¨…ˆ]ll-‡ueŒ\ë†\Ú.°\íŠeéµ—.\ÖH´I¦Èº\Ñg\ä¸2N%l³5|\Þ[k%¹b49\é\î4¹]\\\èø\×C\ñ£Ê¿\Ëf\ò\õ·“³Y­M–¾?\ö}`\ó\"Ž·Ä¶5|K\ó¤À6¯Ö­\Ójv\ÒŽŠz:\æz™ž\Å:\"¬qb\Ê\ë\Ëdå››\Ñ\n€%zS%\ÂÕ’ú \æš(>ã‹¦^$Â¥\n#\ñ±\Í\r,½7©«s79\Ù\Ýá¥š\ô:ç‰›ªž–°\ã\noÏ‚:˜	5¤\Í)U¹FA$j\Ñl\ê\Ëvú\æúÁML4|½t8kk7SŸAâ±¦¯j\ñ9Ç þo¢þ~¤·ÿ\Ä\0$\0\0\0\0\0\0 ÿ\Ú\0\0\0%’«i\Ð{x\ñ\êX©•’¹4eÖ”\ñ2úþ¹\ó\ën\rgžÓ¡>}\ê8B™µ\ãX¹‹-#[2¾ƒ\Ý\Ès¥º/Vý5U«\'£\õ\ËÚ¶‘\Ùp\r+‰2p6B \ðsA*\æ‰\èD\ãqø\ÜY¬\Ï=]ÞŠKZ\ö­\Z¬Ê¹¾¼˜)©Ž> dY}Ÿs\éý^IsT¢Rdù”n*I\ÔF¹\ô\æ\×:†*G&~µU$\èi0;\'¼Lø¦©£;\r\r–\õ/:|;s¬¶\êÛ¯¦ªš{\ì~‘7>5\íž\Èü—0-_!“z•^,\Ös˜TO<*x\ò\å¸S„;R£Œ\ÏWz\Zq‘`±ž]\Z2\àÍ•M¨\Ökµ¼SŽ\Ìì®”›§·°>€M€J+J°¶}¨R†~ƒ“ 	\Å\çU>\\I\Ö)\Äd\å‘Æ™º\ãx\Ó=\Z\Ý\ì\Ð\æ¯_X\ÓUû\ín3\õ\í¹\÷²\ñ0™\Ì\ó\áZ+/¢\"ª§‚<p–\àUCü¥+_%\ÉcBfÊ’m/£Z®wýv±kmý\ÌÜ·‹7Ž¡‘×ž\"ª UC\ngx\Ð(S# ’*¨¡L\Õ8¢\ÒyÈ£«h•…¼\ß\ì\Ô\ô{\ñ«Z_M5\×\í\÷\ÛN˜MºÑ o22·;«\È\ç!+Àzž\0B¯„zª7<R”rO £…\ÏR‘–y£\îk}\ÕK}\îi\Æ%›ŒY™Ü‚º”a\Å\ä„\Ñ&\'Ê·ª\n*I•&\Þ\Ä{^~\èfk\ÊÎ©¸b\Ñr4b\×\Ý%6¾\Îý½vi\Z\ôS¯e¦>x\ßÂ¹\×+A \Ù\Ù8\ÊUP*#pª¯¯\nªÄšV´\ò\nL\ÈÄ§Õ¦¬ú6f\ÄnmM\ÓsaCJjjR\×\×\÷S”\Æ\ãi\Ç%\Ã\n	\",¸“El\Ñx¼«\åJ\ð(\ä\ÙV…s©\ò\Ã\Í¨)\æ\Â\Ó\í3aÒ•žŽü—\÷h\î\í¯Wß–Y\Þ,œQ¡j‘Z4›*I\"½TT~\é¬Å©JT‘\ÄIH\É\æ\ó\Ý\ÙSI3\ÍK[`¤À>Ï¥¨Ô¦šØŸ4Z\Ê/ÀE¥I´Ä„\Ö\\˜^<fÑ¢2²0$)›£\ÇV™B¼¼Ù¥d³YZ°\ìa\r;Ž\Ý=¥2\Ü?\ß\Ü\èÓ ¼\\R´\ë¢\Æ\âª\ñY\Âya	B^g\Ï\Ï<*x\Íý\ñGfzV¾URr\Î\0ž«v]½tg\×K[R¤\Õ9[½}\éz]\è\Ï\ç\Å\Z…ø\ÜpÁù@\ÌO°t¬š<‡$S“3\äÕ³\"¥£)\Ð	\Ñ+\çÇ«Í‡µy¡~Ã¡\íú\ç«\ä9”­»‡RV\í‡GkZ\Ó\Ý\ZT\ñžx\Ó\\\ÒKÉŠ\ã)°\öƒ),—o\0€yJ½\éOPˆ‘€v\ö{»¹¯\ì:ATœB½š¯w£P°P¾´.X±bÜ¨ ~\Ü4\Ïh´i,\æ©\Ä úz¥¦\è\Ê\ÄùBœ\õ\àk­CWAûª—Ñ›^–jv¼\ë\ï±\ôS%\õP¸*s\ó$5¦,ÖŠ\æ\Îe\Ç,qœ–¯V›Ê…‹)wQ\ÅS\Ê\Ñ\è\ÎX	8\Åx\Í\Øvš)Ni\ÑÅ”\á8,}~«5¬\ôj3ø\ng\ôS”W,If¡ §\ðÀX¾kg¤š5BÐµ\ê¦uJ-#(\ò]«§š(Ú­V\Óm\Zn›p\ï\îa+\ö\Ð<\ÞTÍ´hLŽ¾=vmY¥ž°8\Ó\âLc\"\ÇÖ…¸Ïž‹\Ï>ˆ„Ò´©bGIN`µ6\í¯,t\èH¤S8\âÀ&šÝ¨\î\Ü\0\"¤\á8}\ã–.¤’\å\Í	*¨UT‘…³\è“J\ó¨b•\ÃøQ:\n-V‡“²»²Ú†\ç[R\õµn\÷:\Ã\å\Ù[—\Î\Ú3o–b³Ô“L9Ì°e\ë±\×8\Îù4²ë–¹­ž\ïg~Nœ\ð¡5¥hÄy9ªù\óª\Ô]W³˜¤Y(Ï¡\î\ïÂ¡U3ŒsC\á¯·‡Ž¯\Ç.O=ƒ/ U˜!iRfm\ìU]………É ¼´ý¬F\r¯š9g²\èmiŸN¶\ëtv¹\Úv„e\ØG<1ÀK®\Å\×\æ\Ï39\Ã<¾”€Bºg¶ŠÖ²p4žnª\åkZ3³yPˆ£€T\è}\Z~‹!/x	k6‡ e²IK4q\Êr\ä£9~9nS”‘\á\ZfeI‘<WW\àŠþ\ësYl7£›i;V‚•™´µG\æ–ü\Ø\Îg\ì±nÅŽ=žhdË—\\üu\óµqŠÖ—7ZkÑ±«i•P³™ÿ\0*\ö«ÑŸ\ÙD\Õx\0!t\Ò\ì\è\ÒY…ú|\ñF©»?‰O<\óMe\ÂRúª1bC\ñË’)\Æ\â\ð\äšB%U-\î)\î**t-C<ÖŒ\ÍB\Ó\Ñ\÷;ûê†¬ÕŽv¦}”\ë)F˜\ã\ËeÏƒ^\×6<y2`\ÄR´Gm-y\ì)½5\èß§umZÈ—W\rƒ»\Þ\Î\Ì\ÜS0¥X\ÍMrÅ™B‚†-\çJÒ•zÐ™\ÎQY\Î2”\Ñl¶\å8\Ü~8b\Ü~?³qB¢ª‰‰4^|‘DE\õe\ö\r\Å\Ò\nºT3/±S\"ª\â\Í\Â4eü\÷Åž\Z0\ê\ëºø\å†\ì•\Ï\Õ[-;Iu˜\ç<9\ö],u•\ì?u{%\ì#¿Oj›+¯\Ù4Kx”T£ZŒ\ì\Ç\ÙJ°}\íFG<š\Í0Ë¥\õhz=ª\ìÈ²T2…—“Y§¥K–\ã“\Æ\å\Z3\ó)\Å(j£X\Úm.	´Y\ÏV\æ²\Ô\Õ{‹Ê¥hœV\õ\ô|‚}|\òvLf\êlY×¬=®>\Ô|r?g7lž¶\ÝNÉ¶®­\ZŽ=“\îg­mk\ËD)e\Ës\ìb\î\ÜWB­\ì\ÕPgC@e\õC41;_^š\Ù\ég¯Ž+¡›\'PMf©o\ÛN?7·(O)Ê‘\ÄR“3¢0P“x\è\Ò\ëV\ãNœk}_\Ø+=e…–\Ù\õxú~)\ÌgIœ¿“\ê\Ý\Ö<±\Û\ó\÷½wÆ´»\÷i\ð\íý\Õ\ô\í]º»¼–E\ÈØ«“Vgˆ¬´þ¹¿Ù‹™¨¶%™ªx\ï\î…[\î‹\î\\É¥\ôO$\Ù\ôÚ´:Ae,\îy—Š¡Æ•(\ß}8\ì\å‹\å8K\ò¼^\'©)\'‘›	„J\ÏZh\Z\Í\Ý\è\ÎÆ„Š#¡S\õ\É\ói˜ü\é3ŸÑ†{A\ô\å\Ñ\n\Åg\Õ\é\ß5×«\ä<ø–\Ö\Õ\ò.\Å\ö¾¨G­\ê°\ô\ß\òU~·W]³\Ì\éYUr\ÍH\Útk–\ò\õ$pt\â1°t\0¤R\êXUª\Ú\õ¥	<6“%}Õ…Å‘¼»»7	r\á…B\ñ‘Á\Ä22(\ÈÂ¾þ>\õ\ÔtM¡ª\Ôû…¥tY/\äœ\ò\Öl$‹\õ<P\ätk³\ö–üú{\ì\Úvvvéµ½\÷`/™z^‹®\è¡\ÒÃ¯K\Øa\ÛMt\Ó\rÙ¦`Ñ¢¼¬º$Z¯`O\Z¾\êC/\'\Å\â8zs\ëUµ+k5\ôZÔ£WÊ²²Ro:‡8u±Ù™˜³X1~WŠ«À@^!^#J\Ë_°:\é6p\\\ØÙ´\n†Z\'\"”#9&5\Ë)\ÌzŠ \Z/ª]‹l\Ð\Û¥\ì{\æ]cY\ÓúûO\ô\Ý\Æ\òt‰Ã¼\×\Ü\ö;\ô\é\Ñ[\ÝL&™\Äø¯ûº‡¶´ Ã«\'¨Q¦\îvk>·­¹Z=\Zž\á§\Å\â2P8»\ô\n\ñøün7	%Ëš\ËEee)\Å	E\"Ÿ¸&\Æ\Ï\ÂV‰/E„c%š>*OT\è]6j+¸\ë\Ú\×\ß~\Â=cIvp\ìZ\ã^Ê­\íD?\æ¿Í—ù¢ÿ\0-ù\Ý>NÝ­\ëJgJ\â—_ùÄ… ­k\ë®\äyTiGUœFZ«%¨i¦»ª\ÔzÒ…\æs_\ê$Q):ýƒ€+\öS\Ç,|âœ£1\òde¢¼\Û\Øp¸`\ëf¡¼\ê8`³%	\ä” \Ó\â/.\'\ÛÂšÿ\0\êkÖ\É\íûZ;	\öš;$\î6ž£µ\ìoMOfg\çÇ²\ô\Ýh\Ï\öß—\ì\ïü½Ä¶Ï~+a(\Ó\ô¢K3>\Ð)35ý¥l5.¤¸§\êvqGr\Èr~‰¥N?)\Æ#ˆžÿ\0g\Ø(\Ù\Ù\ËqøI.\\ÓŒ¾\0\â²!k\öp?\ÛÁÅŠ\Î-<Ë–R’Ni5ª\Õ\éºo®=•\"\'»®®ƒ\Ù\ß]t3\ÐúWE´R¿i-\Ï\òh\ç«\ö\rÎ¿Î¯W^Nm²x•¦ygiiZÌ¬¥\÷þ•qÀÈ’’H†\"\õ\ç#Š58ü«;¹nyVJ\',0\éÿ\0\â»1b\ìIg._ŒC{\n°p\ê\ëo³\ÐK\Ës\Òj†\\Š\ÆI\Ég&*+G»W´’eF\\ƒ§ÿ\0‰¯\â\ß\Âu¥)\÷\nŠ5z„¤ÿ\0\É\ë\nƒ\ÎÝ¾k\×\ö\Ø?‘n um\î\ÜúD¹t¬o\'\ÍjV¨³Œ\ÒY\ç•2,K½X†\ZF´»;½h\à\â=kb¬¬¦IšX\'\×O\Z\"Q”,Y™‹B\å‹Á7²2¿°+Eº\Ô\ñd¢s”bIñ·³Z·Ñ¦·\Ír\Å<ør\ô\ñ\èÿ\0ù\íùù/u\Ó1\öV\ö<D\\\Ð\êwu¿\Ó\Ð\í\Û–t\Ý\ßE»£lgK\ñ\ó’v@*NYÊ³¦[N\èù2NŽYbL-–…‹ü[\É\ÓÏ¨üu\Ò\Ê2S\ÅY\\šJi%\õ~1bO–.X’\ä‘ÁÀAUÖ—ù\ë7•e\ÉBI “\Ï\Ñ\ö\ÓUm¦l©‚x0u½dá·¹\Õ\òeù¯U\ó?\ô\ó¾ß©<^B9zü\Ý7[\ñ\î\ë n»\ã Á¬/Žÿ\0¢\íþ/¯\â9¿Ï¾\rþi\ó?WN|—’\Í\\·\Ël\ÏU\æ,yz\èM¥\\VC£ Š`—[Ÿ\'‡µ5SM4R´pÌ´—¢ª¢FYaƒ?Yÿ\01\ÙË’|±rxx\Üo\à\à<2¡AWJ!U‚Á\ái\Ñx&R“»\×]4¾Œm†]n~§e\Ûv=·q\Ú|‡\Ë\Ï?\Ìÿ\0\Ü\Ù~\"f89Ö®h\õzœý¿[\Úüg¦\ìº/\õÝ¨ážžŸÿ\0—\Ë\×ü\óæš·e\Å(Ui\ÃÌ¹¢†\Z—P´žq\äŽkJ\Ë\Ï\Ê\Ý}:\êb|Ç‚\ë¥*Öµ\ëzÞº[H¤À‰\Ì1O\ñ¤\×B\öÿ\0ý\'ÿ\0PÅ‹|»1bI,}\r\ï\ì·²¸¨ª\Ñ]9!•¥Y*¸è¶­5»Ú©³úÁ\ÓÃ¨Í¨\÷º{\íý\÷o}‹üW\åŸ-\ëˆÖ®küc_ZŸ“\ä²_‹\â\ïú\Íý_\ÈW´N\ÇWk\ó_\õ¥¿OÔ®M\å\Õ3\æ„\à:\íY6\ÏJ°\õ‘\Ë\\\õž„\Ð\Ú>Ç°×¯|€*™\Òv\Õk+¯`{f\ícúƒ,“:eü\Æ\ãp\ð–/\Æ\ã\ñ‹üƒø+D¢Ro:J¹\ÚUKý\ö½)[\è×§BÛª=7:4À›\×\ä|ù-{{ÿ\0u/\òb&\ÏÎš\ß\Ó\ÚCç½§ù\ÏÁûùO\å>e\Ø|ÿ\0¾ù\æ­\ë—\ÔúE¥,¹³u©&}Q\Ý\rsªû}\ñÓ›Nk\ÉÓ‹1\ÏIY+¥ª\÷[#\ñ\çù†TÈ˜“¯—T<úy\ô\Ò\ée\Òÿ\0\ÇpÁÔ†0`\á¸ÿ\0ø^Ÿ>Á••‘‘\äaÈ¼\ØU´µ\ëM\Z-k\ÚO\ÔÓ¥n„\ä4O“aù^^\Í˜3\å\Ë\Ý*\ñNJ#\à\ö¹k~G›|\ã\å/À;^‹w]–øu\Ç^®úý“víš°\ß\r°\ÐÜ­;\Üt\Ù\ìk:\çÑ—TvO\\\ô¥ÓGJ¥MEcH²·e	dŽ(cž)\áŽ\à\\Ÿ•Ñ”£)VŽ”ú>A\àþ€ª‹9\Í\"#%_­¥E\Ðl,h®:&ŽƒO_A\ÎÏ­ù—Å¾UÓ‘|w\ã\ë\Õü¨•™D\ë\ç\ñ\ê\ç?•%\Õ\õ$\×\ðO†\öýw\É!v‹Ý»_\Ó\nFP\\üžˆk]T}+¾:\Í+Jý’\Ó\r™\öKD©=)­4Q\ê\Ö[Êˆ\Ê\Ò\åžX\ã’9\ã\ÎIY\ó\å•Õ•Õ•ƒ‡V´ç·Ÿn\äyÊ”t¬\Zm™dT:\Ùt¥§sBüÅ£¤\ß\Ðo\è6\ë§\'\Èÿ\0\Èû_ÿ\04`ÿ\0\êÿ\0\Îû\î«\äœ\õ\ôG—a\nÁ>+\ò¹vÛ±#À;­\ô\é!þu\Ûüg°\éÅ§¢Z\ñî•³\å†X\'š6žm†\ÌÖƒ\Ì\ð<š\r3$fTV< ¢^\Él\ß\\øœ^%\ç©.š\\¶Kdn9\á\Õ\Õ\ÕÕ”£«##Š/<z\êÀ_\à\à“3i<h·ý6\ÕMU½t\Þ\ÎH	\Ön\è{Ÿw}n\ßB¤[Gu\Û|«¾\í,s\çø¨­úì—¾}1\ìb4¶\îë¦Œ3v}\ñŽ\ë (œ\Ç|›²\í‹\ÆK7\Î\Ò\×\r³\Ô,(~\Ùè–¨n‡a\ñ\Õ=\n‚œ¯‰\òW¯·W^±r\Î3Š\åLÓÐ³CB\ÞÇŒ\Æ\Æ\ã\òœ¯	\ö\ö\ö\ÞÀŽ/&Q\åY\ÞwK}\ÏK3‹qø\Ã\ëTœ\ðß¥ù\'\Çþ_\Ö|¡u\Ûv\Þ\÷³ù{\ò~ç¶¸\õ(’“\Çz\öXþS\Õ|\ó;P\å\í;ß”üo®\ë\ó\í\ì/\òúû\\¾D\Õ-96\ä\ì\òvQ\ì\ç¿\î£j¥ª\æ\Zt%\É<4B\ñi\\Y›\î\ögsAD´J#)\ZÆ„\ÓŸ¹ƒ\ñ\Ã\á\ã\Êr¼?\Ï\Ï>A\ó\ä2•\âdy¼\È`\Å^7›£\ÈIe,\ó\ÊsNr®n\Þ&ÿ\0\ë¯\óŠüŸBi\Í@%\"u\0\Ë\ñ™t»¾-\ÓC_o\Ûv½.~‡\'¿}\Ú\ì\îzŽÇ°N\ã6¥†\Ü\ÚrkÉ¢6\Ílž¹\é5Ó“h´V\"—&U>†\ÌyN9§+\Ãeº\ìMß¼\é]K³\÷¿:¸`C\å9NP·<“\çž<ü^OŠT£+Á’¾\ÊG\Ý\êþþ\Êe\Ä¡?<z8ü\n\æøa\Ã\ÙjÔ¥\Ä\Ü×Ÿ\é0u\í,ýM>#ÿ\0\'¹ø\×gþuñž—©\É\Ú\Ó\å\ÝÅ»?v¯«´Ì½•\ò\Û¬i~c\Zh¾U\Ðú\éj&‰êŽ˜\ê†\ÈèŽ˜\éÖž¾\Zt•#h×–\ç\èM« \êF\ÕÞ‡\ín78`Áƒ\ò†…ø\Ü$Ÿ>|ù\Õ\â•dy´\ÚNY©[R”¨¢¼\ÞO\ö(Œ2c\Ä#¡¶k\ì\ë\Ðv1\Ûd\ã»×¦\Ë\Ò\Ç\n\Ç$G…\ã/s\Ô\ä\æ5ùWe\ò^Ì¿AÎ¶[\òwy•üL\Êø;,û\ç¢z45k¦¶¦‡¥” EŸ\"s´\Z&4›¥‡`\ÈÓ´­š¸ß®+cl\Æf_S\ñ¸\Ün7\Ð\ÔÑ<o\ïP<\âANJi)A\"³)Y\è\'€¨’Jj‘Ž|°Ê“m9\õg\ß\Ûvý\Å\íAc\Íø´þ;‹®ˆG\Ö\Ý\Âv‘\ÑYÓ«Eù¦þÂ´\êþ<½Ñƒ±\ët|bÿ\0¿T°Š\æ9ª–\Ñ-9\õg¼\ì=Ÿ&’\ä–\rž‰\\iMK°jýgcé­ª_Æ£U\ô6·\Ûÿ\0M\É\ã+)VGZ-\Ð\Ì\Í\Õ\Ïþ€\0…\à(\Ó1\ä\Ê4z\Ò\à\Í\"‘ŒEEdZ’¤²¥?\èn·g¨KÒ­C\ñ\Ûüqú\Øü›\ä\Úþ[N\ò-\è¾c“]§\Î\å~§\Çz9¼vÉ¢SwW·¬u“\ã\Ñ²¾}2\Ò4rü`\É:F\è\ói¼k#-3²hZ[fj–¢2·h¶Ju/\Ó\Æc\Ï\r\Æ\ãr†œ¡`Cr¤ƒ\Ãý0 †V3”¥\Äd\ç£%9n0EŒ%W,—¢\Ã\ó›\ë\íg²v>­`\ØÖ•~ž¿¡\ç\ÏþY\Ù{\ä\î²wù¦m%>k.«lø\ã›-eªuÊ°¶Ç¯ÛŽ‘Ï§cÀj»lÏ§5\ãY­\ÇSY\ñ\ZtŽ¨\êDœ’J\Ê\ß{+\Å\åLÏ›Ô—\ã_\õýÄ¨!‹\ñ9Bü Šr¤Ÿü¯‹Á\Å(e\ÉN2–yeúnÕ«‚#,‘Œ2\à8W!Ë©\õ3Ä¯ï½ µz5x[O†j\ÑO‘\õ\Ò\Â\Ýs\å\ö\é{Ï\÷\Òo˜\â\Ã\Õ\ãÄ¹°\Â\Ó\Ù+\ó=9¤\ö9¶\õµ–=\ë=†\ÚPµ(\ÕO1\Õ:§Ž%\'x\Özg¦]‚\ïZ\ð6j½\çG\Ü\ÕzRO\Æ\ãqÃŠOGJ-‡þGUšEfcE\ÐjK°fš\çÍ–YX_À\å\Îi\ÑZ\Ö\íF\ÑMFGl\Í\ð­\Ý~Ÿ˜ü[XŸ\ì>;·£×—ü\Ó\äø+\ò\\¯±\ÎliC´k(\È\Ú\Î\Ël…¤\Ù\ñ]\\5­¢šT±#Š“y\Ú[eU\Ì!7˜GK¥R\â…é™‘\â\ñhxg\è‚YYh¬¾Ž((8?ø\ðª8!”\çT\âŸ¶\õgg\ÌÑ¬+šùx\ï6Û¥ŸµÓ¦\Ä\Ò\á©`k@h\àüo°ø¯m\Ú\õ\Í\Ñu]]z›ük´øuzO\ó\î\äŽ\ï\ãøsEUlta\Òª\ö0\Ý\ì\"£\ó\Òš£¥A«\â¨YºRmFªd\Æ€yûG\è-\é\\›\Ð\0\Ç\ãB®)\Êqøüaü\ØW‹ÀT\æ3aE`­ZÐ\ÅxS:âœ¹JSG®«\í\ÓKQý/üw\ò	*½n¿…\÷v\Ê\õ’Á\\£:®\÷\áÿ\0È„©Â‰Ë\\\ÔÑ–\Û\'\Ùd\Öa\Ì[\òRø6\ä·5&‰\õKÍ“‹DuP²ÕŸ±[O‹:u\Æ,Ë±nr¶&À\Ø\n}ž‹ü\òÅ¸À©44\å8\Ür\Çÿ\0\0‚§Šg\È	€\ËOgvn\Z$\ò\Æ=C;Òš»\rz\ÝdÂ‹z3’I\àBü²ø¯y›X\ãg¬Q\ë”qþh)cD~KCO°M²¾\\š\ò´4Q·\â\Ó-R F2k˜IžfBaf–¾\ã\Æ\Är:×¸—j‡\ó)$\ó\Ã)V\å\r\ZŽ\ì\åÁú_\ä\ÄÄ˜`\ã\Ê\äd¦T\áQ¢w\Ó}Ww1pN«±<r¸‹(\ÖX\Çû§¹ÉºV<Y”\á\çš1ª\Ò\Ü\ìüT|u•4n\ë™l…v&±ªvFXVnr\Îr¼´Ng¯8\ä³y2­³6w\Ñûe!^´C\Ê\Ë\ë(T†\ãšj\Zqƒq‰?\ßnfbd2\ñx8\É\êÌ¤Rm}¨C³l¢\ñ\Í^7fRg\ö„r\å§W\Øu\Ûz½ro\0’Ì´³5\ï§M4¡L\ë\í\çvmK\í\\X\é)[=©¶\Ze¥ùš\Òtçª,ûc´Ãˆ\'9\Ñj¼!ƒM\ð×®|ÿ\0£\ôý…[„’Å‹r†Fvb\å‰þy<\ò\à\0!VŸŠQhi \Å\\\í€Ó¡©@©G«\ÐÕ€³\ó\ÄWQ~˜dÑ›+\õ=‡M³5\ð–\è\íZW\Ís+Z\õ\Ò\÷Xo\\P\ô&•\×\Íi°:\å£=\Õ;r:#¥+\ô.¤Ú–M\rF>…ÿ\0S¥º\Ïù\ìX±n1f£Q¨\Î[\Ç$ž1#×ƒ€‚œC.L\î\ÚªHDX‰¥63r‚\Õew¥O™U\nªd±–hh\Íù±Ž·_U±(\ÝN¹%t4KÁZšV:é­¶RµjaÓ“N®¾\Ü\×\ÍÔ¶\ç±’¬¯›±Í¤-z\ñ)h…Ö©\Ê`x-g¹.\È(\Ì\ð¦o±\Ë1,\Î\Î\Ôg4-\Æ44bI\ñ\Â\Þx\à\â\ñx\ÝW\Ë7Äƒr|l\ZA¹{ª\êµ\é\ê\í\èÀ$fW,\Ñ2\ç\Ï‘\ñ:#\ô{²\ìJ—J1¤ýY},v¼J.£c¦\Ô\ÛpNc\ÃF¡».¹\é\å¸Ä²²\É\Ò\Z2\ör\ØHBtJ\Ê\Éka®&ŠkMÂ¬ž}Ù™˜±b\íFvrÆGfþÿ\0€lŠ8h¼b²E\õ¡Gj­s\ÅWc¬\éj\ÕRÌ³¯\ZqT\æ>gW\\©þ^\Ë%y\Ôjû\ç\ØG°J#\Õ\ìƒfžRœt\ìk\Ûi·µ\\­œÂ•\Z9±6\ËHb@\à3¢¤vg\Ñ&Q\ô£	‡Z´\Ú4\ÄQt¦ïµ˜±g£»»»»»½‰< ÿ\0\à\n	,\Ô\×\ìR *\å)ZÍ‹\ã\Ì	z5žÎ¡\ÈR“x\× \Â67ZrNk\ØObd¤l 6\rf¦O·Ft¥\ì\ô¹¦\\nkV9k™¦r³µ›bk\æ¤e \0\ãdœ¬’T†\ÈjRhœK1*GŠ\õ¶‡£9vw£Q™Ë—j;\Ï?ø\óüPŠŒjLù0«\í\öU\É^f\Ë\í¢\á\É\ÐÈ\Å\åYaNw\é)\ÖS®¤š\éº\ó\á„\'TŽ±\Ù>\÷?Y®«\×d\ö½iÂš\Þ\ÍyI2\åth¦Á©X²‚\0U\n³¤\ôK‘\Ð#\õGTµ”J®‰?\Úc\\\á¿O¡r\ìX*\á\ÕÑ¤\ÐiOþ<*Ž{†^†<S\ä¸f*¹\å\ìk–gv\õr\çÏ€<€¹\Ëjh\ëOV\ð¯\é\ÝTÑo\é­Pâ¤ˆ­¶\Ãf\Í\ZŽœz\Z:¹¯•§¼“9!ª¢šµ6¦\Ð\Õ\n\Ä)i²\Å:!ikxJ\óÐ¨ª-=\0\ñ\ñ~A2Œ…H*\Òi4ZF-&“E¤\Ãù\à\0}½‡C6\öž(P¼Wj³û@üb¢®ƒ\ÝWÕ¹!´{a\×\Öê–‘«C\ó¸1l\ó¥¶7a]Ú¶¶\ãJNZ±\ÓËI\æF,¥\Ö[4=©jYlOž¼J™ZTWŽ‰Z]‚«\ä\á¤%\Û\õKW\ØfÀ©—\Ó\õ4š/6“M¤\óty™x$žy\à\â\ðWˆW€\å\rj)\íF\Ê\ñ¸\å\Ù2\Æ\àž„€“«c¾\rr\Õú¯¢z2\ê¶Á\Ù_vv\Øû\í´\ß\Ø9»\Ýí°\ìdJÀŠ²\ÓE«g5\ÐA!\\WVc®v0\r™\æ™\÷$Ÿ¯;\ÚDù\Úf?G\Ó\õ24šm7›«#I¢\òy:ÿ\0\â\ñž\Ë\Ä>\ëÀM—c\ì8\ÌJpµ›Ë²\Ä|G.¥nN™Ÿ&‰j:\ôj†˜mM\Ò\Ûÿ\0A;	\î\ØÓ¤i©\Ól´z†GŽÝ‰\ö°\Åv%\Í4\Zµ-F³ùV\à\âW\ë!X3¦}u\Í15˜†¡;\àüÉ»\êü\Æ&&FfflŒŒŒ¬Ž&‹I\åI¼\ÞO0\0\âp#ŠU‡\r\÷\öf˜­ƒ©.¥\Í\Ê\0T\"bW@\ÒY±s\Ý*4¾:smžÜ»~\Ô\à\ãq\Ø\é\Ûin	™b(¾\Ôi\ëÐŸl\é\reÝ¬\Ú9¤µ¿Š\ê|++¼UƒË’Œc“L—\óO‹ªµ1·]\ô\ó\É$2²°`\Ê\Èff\È\Ói¼\Þo\'&\ã\È\à>Ax¤¸`\ÞþC/+g¤\Éd§š\Ã\Éÿ\0\":ˆkæ•±#9.\í\Ê•9«{\ÓF\í4\×=ÝƒÅ“‘_§\Æ\Ô\ÐiGxjº%’\Ò^üµ43ÿ\0|Ž+«Vvœ?£œE<§›B\'Ð£\ó}sU§ù\çØ±\ã++!FF›#+#+£¥“²ü\ò\0}½Ô†\ó\åE*X™2\ð±\'”31\nd™%s³ŽOŠ\Îh\éCQCo\ÔuKF†\ËY:|Ù“r5-™œ0¹\Ã\ËK\ÓZ\Ù\É\òO€­¥\Î3þ¬9%X\"C@O­Pfúe”¿Y\Õ\ö=7\0\õ33(\È\Ê\êÁ¸ÆG¥- ·\õG=ý¸8\à\à§’G‰\Æ ;L*\à…M`\Ï\É\ñ8œ~W“\â–$¿\"rrsa¡ úg˜ºc­3¼\õÁùR¬\ZTtS\àS_4©\á\çžüJN‘\Õ*CV}\"T4B³\"8\Õd\')þo\ñ\Ç\ê»\Û\ßH½_k\Ü\ÏÕ¦\óyº¸§*\ô{é¶\Ð<\ó\È\çŸd\àç—³¸n5$+rŒŠ\Í5Š\çN¤Ýˆ\Ü\í\Å\äJ\ñ¹~KŠi\ÅþI³°”&2rG®¦üy©\ÖiÝ—\\û\\“\'óž´‰j›WC±<\ò\à!¸•¤¯\r2¦]·\åT\Ï|\ï 2,`\é/¤[»N\Þ;88?‰\Â(®(-\Ë\ZU­\0\óü¸?\ðx¼qØ’T¯\ñCžL\'$½_.Ãšxþ[–\äˆ4\â‘\É\'Šb.hºWª¡[¦Á§€\Ì\òG9\Õ\"m\Í þ\à\à\àÿ\0Â´\ß¤sS3\ÄZ09:¤\és\Ïÿ\Ä\0@\0\0!1AQ\"2aBqR‘ #¡S±3b$%0CÁ\Ñ\ðEcr‚\áÿ\Ú\0\0?\0R\äG†…±¯r¹<ŠKb\å¦…-‘Cƒ/M•´\Ïg³i6iFLµk‚¿b9tJúd‡þ%h­H§kÁ¦‘i3\Ê?TK]’\å\r:|	\é\ð\Ç	S,µCkµø\à’we¥$w\Ã|¡f\Å\Ý[Dœ]rŽ\èý\\¡wU\ò<9´\ëdr¯\È\ñeŒ¿\'v(\å^\Â\ê:IÇ–ŽÌªi/¨†E\Ã*y1_ÜŽ\è\ç\Åü\Ý±¿	£\å\æ\ê¡|\Ùÿ\0\Ë\çáš†\Ê\ÅÖ·\ì\Ç\ð’^\òº¼q®d_\Ä\ñ\Ãú\"‡\ÔüW§Ä¸\"Ž\×\ìRm\nSýØ’s|-!¹¿Ám¶R²“~\æ\è·^\Çt«\ØIQ»¡¥^KúP’;W\å”W\î^\ÙE^‡-±{R±{bHr‚¶\Ï-”©1\ÈQ\Û%6w>\Ø/Ý‹\Û\÷fû0«~X£Y3½~Hc‡l*1ÿ\0¹Ÿ¬’Ž$\èp]\Ù²)¥DcÎ£\öžl\ögþ\ñ±H\å¢\Ñ[\Zc?\"—Ž\"\ö¹$·\à|2\öŽ\×L¥W£·O‚3V™\Ú\ôG\"µ\ÉZkC\Æý\Ó©Ÿ¦B\÷\Ñ\Úÿ\0\ð5\ãLp—tQÞ¿\"’\ígrü£û–‡©.V\È\Ë\é9\é\ð\Î\É\ÓZbRu\Ã\Ø\ñ\Ì\Ôr/ä¸¦žÐ³\áµ\Ê\Èì—ƒ·#‡\é’;[ij\ì\î„Z\ð\ÎÞ®/ú§\Õ\å\ÆüÅŽ;³go\Äs\ÃÝ²ºl‘>˜\ì¬R\÷ÿ\0b‚\ò\Å.»~\ß\ñl\ÙP¥\ñg?\éE\â\í\\É‹\î\Î\ì‡n5rû#\ô¯s¶*Ž\åGc\Ø\íN^©\èWfYE»<²Ý²•ž_¦‡\'³_G\ËV\Ë=Ä¹\àr\ÒWä»”˜\ò?h‘Š¹i3>Øª‰‹§\É\\\Ò\Û\ðgê¦¥‘4¬\éúH$\ÒlžmEv£I\÷HorbC«oD§¥¤/qr½?‚´\ÄÑ¯q44\ïÕµ³ù;D´\Å\Ê\Z,qtø8\Ù\Ú\Õ=È„¢³ú_c\ÓÑ¢¾—Áý†˜\ÍSZ\ð|¹ZE\í1µk‘\ßr+dd¸®\á#¹&)Â¼¡¸\Ýp,‘¯(\ív\Ñ\ô8ø|pc¦Š\È×¸\ã‘_¸²\àr®Q\÷Aøg\ËÏŽW\æ…‹Axšg\Ê\ëúŒ–Ï—\ñ©\Æù>œ±³\èGû]N\ÏþC‚%uQg\Ä2\Ëÿ\0qÿ\0\Ä\ç\Ëì¨¹E§\ØnO\ò\Æ\ÚGf+\ò\Å,›Z\á·\àî›¢•\"¼‚–\Û7Eú[ª+\ÓÉ±\Éúx\ôQGq±G\÷!Ek‘-¾IMÜ¿„G*ß„9¾\é\ðcÁ¡ýÌ½D»1§±*É›Ÿ\É.\ÌQ\Ùÿ\0¹š_À\ä»1}1<¶xˆü¹²0UL…pxb|3cS\Ê‚„\õ\è˜ü¹/\÷Yj\Ñ(?À\ÝS&¶™ÞªOem1dT\ôÆ´\Çø\Zý†¾™p1¦3¹S[%W¡ø$¼hK^þ’\ÕW\ì/m®‡dg¯s²zB’q’):\ð|¬É¯\"u$ù,\Ê_‘4§ÜU\Ñ\Õ\ÛHù]\\\à\õ±\ãJ_\ÒÄº¾—2|\Ñ\ò¾2ý²FÏ•\ñÈ»\äJYw\Ê\Ë_¸–<\éù?ùWO\Ï%er\öE\æÍ‘ÿ\0S/\\Ÿ\Õ!\Ï7\ì;b\ïV\'*;b—².V\Ä\é%ü–¨ýC=\ÏÁ\æÁÚŠý\Æø+Ek\Ö\Æß¥iX¢¹¶Íž\Ã$ø\àiR%\ÂV\Æ\Þù\ò\È\âU¿q/ªo^\Þ\âÒŸ\ðŒ\ÝT·}§O\ÒÇ„\Ù,œj&,*±Ô¥\îO+¹HK†{»¼Æ¹¶J|:G\äÿ\0\Ý\èŠ\Ú7¿V….O)–>F‹ŸGz¹;^¸#4<n\â$\éžP¥©Àä©­‰é¡§¥£\ÝZ’\ÑC‹ü\Ê!5®F¾‰\è‹G”\öŽø\Ó\ätF´)Ç’Ii\ð|\Ø\Û\ç\Évšeøgcµª;\ñ§|\nx»—(sÃ·µ¦v\ÎX\ä\ô\Å­\Íy;°¿z/{„ŸS\Òg¿º)Ÿ\Ã?s\ïwÈ»\"¯\É\ß\óU\ò\Î\ì8\ã|!B9e\í\ðMù“g\Ë\è¡2¶\'&Ë“_“±k’\ål\×\î:¶wK\ö5eE\r\Ä\î~”¨\öE.\ç\é\îRß¥›\Ò=…H­¾J\ò93\È\ä\é\n­Ž_°’;®•/q7Kr8—ly\ö\ç\'lr—f/©ûŽO\æfoù#Š±\âHPú²\Ë~\Ä\ò}0t¿;“/!·HŒm¶=¨»n\Å¶6Ú‹\Ñ/\ê64\Ïq•Áf™V\Ç1¡Ø‹\Ñ\\	ž¤\Ç\ÌX¦©¡§q]1=®G¤7´?\"½‹‚´ø;]=¢-Q©\Ã&ŸtY&ªKhI\ÓÜ™[Ü…gl«Á\Ú\Ó|	­pÄ—µ³¿ÌŠß‘\á\Î\ð\ÏV\'\ôvNP~E­\ìoL\íq™ÝŠ\Ó;S\ð\Îþƒ£\ÍkHÿ\0\âpd¿cOc¢\Ü\äýËŒW¹\òúl®\÷-pqC†(§\á±r‘y;Ÿ¾£j(q‚j\÷gCµøŠ‘=£\ð^\Ùg…\Â,Ø¹\è±\n*—\'–W‘·H­²Y.9»kBŽ\Ø\äÿ\0QÛ¤Œxo*l¿\÷2Kø3\õo¶	¨zH\÷Nœ‰dû~˜û\Å\ô\ãÜ½\É\åv\ÙCvØ£¨\ò9r\Å%p9>Oqzè¥¡\Zt5¡4S¿J?\'³“=Ž\î4\ÇÄ¿¸\ÕkEy#-ù5Lo\ê‰(1Ms±Ç–)p\Ä\ô\Ä{•§Á\\½ÈµI†Š}\Éš´‡ÆŠ\ðø\ôiÐ§\Ö\ö\Ó|	\êO‘;‘ÉŽp®W\É\ê/†˜\×lfù\ò8\ÉMÇ?µ\ì]W\Ã\ã•r‘Ü¥²²\Î,Y~{\Ç$\\1Jý‹ŒwÉ¦V?Ý—8¯cýª•´)\å\í\\-\rcý\Øç’’–‘Ù7\Ë\Ø\ÞKd§5\Z\ÐÜ¸\Ò$““\ò4­¢ØœjÍˆPy/Ò‹\Ò\õ\ð‹ý…9+žJ\\—im”®\\’\Èÿ\0Ž«c“RšU$wrb\é Ü™9\Ü`\é\r»«lži©\å•#ü¼J\äWû™\ç¿ž_¥j>\Ãoe	-‘Š\Ñ)yÐ—‘%¦7\ä\÷e\ðX\Ê‹~!=žG{rQ\ä®N\á¡3ú‡6a\ð7È¨‹WG	\nJŸ%2/\÷E\èkžµ\àp\Óz¤xgkü®„´\Ñûeü\É\ZOh”[h”à¦¤¤Z»9)^¼‘“MK’\å\ób´\Î\ì-=8‹6/—>W \çŠ\\r\ÐO¥z\Ð\ñu.7[;z›\ñ$_\Â\ó\áo‡hs\é±Jø\Ñx\ñ»,¨#»%#I§\èû\Ú\ÛD²>\ïvj0…³s•qÁÆŽûÖ–†¶“\îkgl¶\Îp8Æ—,j[\á\Ã4„¶\Î\ï%\Òb\òX\ÙZU#\Í\íú7¥\É[c“¶xŠØ•7¶Wå˜ºhµ	\\‰\õ\rÜ‡&\Ñ=™\'\ô\Å\ö¡cU\r\É\òÙ“+¹¶\Í\ð6­\èHkH\æØ—“\ò7\ä\öü\ò{!›\ô¤{úZ\ôhW\ê«CE4\'V&p™kB{\'‰i‰s²Ö‰&w¯\É(r5¦†\ö‡\å\àMSBø\Óz\ò_\è’tÐ±\òŸ\î\öJ»¢\í2*]²TE¯¥\òJ7	lRµ\îS\ì“\ÚS\Ò8KmpÏ•™\Æ\\pS¸³¹©?bX²\ÏŸ<K—\ä\îŒ2/drF\õ4w\ôµ\í#\é‚~\rYPC–MMk–8\ô\ñ‚0§[eE¿ÁÛŠ\Úû™\äí‚m\òZ¤‡%O[7~\Â\\m~\ÃU·“¹ž\\}-\ÙzG¸¢Ž\ß\Ü\Þù=†\Ê\Ø\äÿ\0–£º<$G{¤\èt\á…Ñ“+nR±¦¹fL®\êÖ¬m\ÛµC\å¶J\\p4­‘‰½\r\òÄ¸½\ôr$\'Àü\rh²ýµé³‘Yo\ÛÑ¢¹¤5´\Ä\ô\ô\Ë\ä’\×(\í\Ú1\ð\âG˜¢3\\üP£´B_¹GšD%¦„ž¸#\Ã+†J­2OŽIVÈµ\Û4F;Gk\îŽ\Êý™	\ó\Èá«´$û\Óý\Ç\ß¦m6\È\ÉvM\Úz>NO›µ‰´¥\ÃÁ\ß\ÖÆ²\Ç*þN\éß¹ß†½‡\ÙPqü\Ø\Ý~<mû!¬t>\ë-\Å\Ðþ˜\Ò;1\Æ5\ànr\Ç\'Ö’-\é:¥¢•µÈ”¨qTv\Ç\òÍ·\á\ÒlI‰nù[\ó\ëo\ðV‘[bJ\Ê\òW\îYer[¶7·À¢e¡c²YŠz/lI[e\ÜqŽoºl½EP–’¶$®oG\é\Ç½ÈŒW\\[\ð%~\ãoŸFø‘Ëƒ\Ü\â‘øB\Zzä»¡¡W¥/O\'%±p{\È\âUl´¶E«%\r=¡KqdeÆ™\îv\ò\Äøe\ð\Ë\á\ì­I»»B\ð)/\È\×i\ðyOD–\â\Ë\çddµÉ§K~\Âwù\Zm_·griKcI\â\Éü\niü¹mx%	¥{#\Ô\ôÝ²w¡ã“‹|p.§\Ç-Ú¡\à\Ï<rZ»CqSƒn\Èû\Z®¢¯\Øs’_“ýœ–¸GûQ~\ò¾žMÁQ\Ý\ÔB5¤r\ëC¸A-½‰=-\ð(\Æ\Ú\Ý\n<Glv•\n0QHi\ÛV†þ”ù;c³ºUzuøGu%\éeX’\ôü±pW§–¿-\Ëû\Ï­ºD§q†—,„<\Û2f~hKÅ³ú†\÷TˆÁT²S\ÜÞˆ\ÇQEm–šBW{\òmŽý/“\ÙMTlm\'=½ú{ž\Ì\÷hhV?OrÍŠ´^†¼´W\à~X¤¹ª-}CZk^\ã—”O®XžÖ™Ý§¦‰ÁÔ¸\Ý¡ò˜¥¦é—´8\ê\Å%\É$\í1\Ö\Å-ù;¢\Ó\ä\ím>W´,ŸK%ŽWZ?Y,Y”\â\ôùCIeW\îG?O‘{ZhQÉ½X\ã>\É?\ØR”r¥\÷y;r\ËE©mÁ™4\Ð\î®QPŽŠ\íu\Ë+mq½b‚\ó#\í´(¾\æ¸G\Í\êd\ëI‹\ÛWB\ïye\áhS\Éo\ÜI6)Ïº¾˜—/\î•]¢=­Š3‚\îl\Ý\'È’¥\ÉÚ©;;’/e\Ç\ä·\é\ärtn’¶(~X\ÞØ¹ck\Ù\n)’v¢\Æ\÷?\'²¤^’!ol”ÿ\0Œ,\÷\áhHg)\r\òloÀ¼ø¡Ê©	ndc\öÄœ\ëC4\ö/MŒT5ÈžÆŸ¦†ž½\ô´)m\Ê\Zü¢¸Ñ­\rbÈ½HMZ\Ø\âÿ\0{Bž¤Kµ´\'¸±?\Ã\ÚÄ¶žÄ15¦?¹1½\r\íÉ±Û¦dÁ’Ú´b\ê\ñj®‡ŽO–¼k†C<O›•Á>—;Àþ\Ùp<¸;«\ê€\å¯(]V\Ó\äû—‡fJ\ÜYß‚9R\ð^\è¬\nT_M%~³ýž£_ý±\Êx\íp\Î\ØE´,X\Ýy;S“\ò\Åß¾Piy+µ?\äN]©\éQ‹ä¤£{bŒm¾D“©,\ô\ÅU$»\ßcol\îwe~ÞÈ£À—“¹‰k\Él²\ô¿¸–£ýýl\÷\äQ\\’\ÈÚ‹t¶\Ï2\Ùd\Æ\õ¡Gr\Û\ZüoEmíŽ„´]‰=\"\ö\Ùg¸\å\Â#\Z\î\Ù\â(olŠkCuH^\è[¦5þ\Z66.=\ôz\Zg‘RL½Å—Ê¯\É(\óµ\î4«‘ø¸Ÿ$±¿tF|=’~i‘–™ü¢Q}ø\ß\îˆIoLŠØŸw©l’Ô˜\Ä\öˆMSbw²q}\Ð\Ú%5MÁ\ò§RTˆ\õX\ê.\ä¸d·	\Ç\êC‡P¤l“\Ç\Én>H\õ\í+RT\Ñ>—©—jÕJ9£ü‘\ëzYE/©+C\Ï\Ð\Ê;Š{\ñ\É}¬®º‡/†\ÆUÄ‘\ôd‡oÝ‹ÿ\0ÁY`«\õÃ‹\Z­ŠSŽ5ü‘…/d.\æ“\ÛbŒ\\¯\ð\'\ç\÷\òRzG|\õ\"1T¥À›¥.Hü¾v\Ç<½‹$uZHŠ[z}¨­	-ˆQOc›;u\ä\ò\Ï\ìw~Æ©	!Ë!-Gû‘\Ç\é=Žo\r­p(£gv\Û\Ðê¢¨Ö‘o‹%\\-l¯\"\Ý\ì^\å\É|	m\ìo„{•T…¹¤cŽ–Ì“ûtŒ¿\Ôý5\é\ìÆ¼Ï§’·e½‰½	ø\ôkB%\Z®Ë1­§bžš\Z\ãh1þ\Å~(\òZwGé˜¥´4ù<65´\Å=§Li\Ógv\â?rk\É4¹’/\ê\òC\"©iœ¸±7N\"RîŠ§\ìN“ƒi£\çG\æ\ö\ïÈ£55\ZbÉ‹\åMx³\Å\Åm	\Ê9\\tù%Ó®è«‹\Ù	¨¾|2+6H%©lùd\ã\Û]\Çw\ÃÚ­ÅŠzâ…4b—ÝˆK2“\\6Ê–5e\õ\rÙ¹\Î\ô´}OeÎ”´¡.\ïù;b\êC¦Ü¶Ê‹›uGtŸ\ÖK,œ¯H\×Ý¶v\í\ò\Î\ß#›\ä­\'¶-yl\íV\Þ\Ø\Å\Û\È\ç&V¢m¶[/’¸nD¥ª¤F[d¤\÷±¾N\Õ\Å\nù±·Á½\ìºTJ^\Çr!ªTw:‰\î\Ïbù‘n’-\ìHK‚ü‡,“\Ô)nrb\ð½°\ï\Ó\ó\é[F\å”\ôV„\Í\Ò\ö8þO’2«\Ó$ªžˆKžGU\à\ö\ÙC\òE­ŽŽMpÇ\í\èS–„—td)i½“\Æ\÷´G\"µüŠH”^Ž\ï%9.\ä­\ö)\÷\Çh‡QŽ\ëhx\å¤(º”~™i\'ø\'ƒ%p\Ó\å\émsù!\Öb”#\Ê\Ù\ó0¼rŽÖ‰\ô=\\±K\ín\È\ö\ãÎ¶ž˜¥’9\àŽ\ØeÄ¼\ìY~	™ÿ\0J/¬\Çý,œ¿ù\Ø\Õøt¥|	`–ùc\\=³¶£{|“›¨§H\É}©¶¿ÇB\öI\ÒOl”#\Ûc”“|.%±\÷vÇE[\ä\âOm\ðiN|³¹lPûY+¯´$†Ä¹?°\Ûx\Û+rd¥¥¤9		p9ry¢Þ‰I\Õ\n*\äcÄµ\ÈÝ¤6Ý±¦\èK—d¥À\ß,Š\ö=…\å‹\Â&ùt…û±þ\Æø³ÌšHÃ\ò\Èÿ\0A¿_Š<úkÒ˜›+†I\Ê†W(R\à^Ä—i’S´Eþ\×;De\Ã\ä‹\ä\í\àk‘?\'o\é‘\æ,qu&\È\ä]\Ñcƒ\í–\Ð\á.ür×°²%ºbÈ¸\ÙOhSU[\'‰\Þ\èSWVE\ñ«%ƒ%I&Œs¬ÕŽx©-¡uxrF²C‡\îvË¿·\÷2tñ´» (J9\ñ\ðµ$c\Éþ\ì¦‰cq\êa9#›ºvÿ\0aIK\å³”¿\ê\Ó|&W\Å:x\ßÜ¨X#(¦wukzŒG\Û\'gf.\Þ\îL\ÝV[V¢¼’ÉŸ‡Hx\ñ\ñ\õ2M·CŽ	JMÓ¢po&\õÁ&\êM‘ºW¢8\ñ\ö\Û\îb\ì\ï˜ûû¥Ç\ë$ÿ\0‚\é¾\n\Ògw\Õ\"Þ¸5H¾EØ¹\ß\ZDbª;c“\ÞÄ–\È\ÅP¥ª\ð%ù%.[•\ñ\é$>ß‘·È£~II¿\öEpy³~\ä\ß\×s­P¥\Ã?„c.\Øø‚¢rT™Ž³¯E\èŸ&‡^¼•³Ø¥±\rp\É.N\ï45\Î\Å-kÃÇ‘¯$e»¦5§³»‰\Ã\"\Ýp\ÉEù\ç’p‚U7LÉ\ó¢9cù\'\Üx7q\Ó$\é>E•m[‰®Ù¢x%q\ÜX\ÚRÞ¾¥´|¶£.Þž™5–\nŸº;\ÓMlŒn.:\ò…\ÓuOý8;[\é²s¯Ø†\\r‹W\"_\rø¢kPnš.®O\é\È/—9£\å\ô=^&ùL¿‹\ôŽøe\ÊmK\Èå™¾\ïŠ®\îL½vT\Ý\öx\ZÆª§>Á½v•o´i7\Ø:¥µ5\ÚJ-¤‡‰\Ó\ðwËºLRTÞ¥S—„[I\ðRI1UÉ¾t7\Ç|‹À£¹2\ô¸<¶{	p\Ç/\'\r–\é\nO\ê1bZ\äwD¥ÁKl^{dU\ì{­!·Í’dW\ÜÈ¯µ\È\ß_s;~\ÄN_tˆ®X–¢‰\Ë\É\ï\"\'ƒE\è\Ù\\‰¢ýy\ô£ÈŸ‘¯\"ob<Øš\Ú+iž\ä$5´\ÉGCZ»/‡C\âE\ñL•Zz/	jEqÀž\ã¦~™—\õAØ²i\òS¸­’n’¦J/¶j˜æ´¶w¾*D¾\É\ÇD\ñK¥®ø¡\Å\Ý	.\ä\ÈIvIª7ke\Ç\ó\ð=®Q<¸\\ã¬˜\ö„þWW\õE\ÔÑ65mv\É§\ê{—i/C%\îŽ‡)\ß1™1]w&%\ñS¿µ´wMEK–\Øû»¬Ÿ[\Ô\Ç8oc¨ý;b]œcQŒ£\ör4·NŸ\ö1Bû`ˆJÛŠ1\ä·\Ã;\ÇÀÛ¤4\ö\ô…4·ÁOB‚MŽO“¹\\˜£®QlÕ¶wsÀ¡Á)±\'­±-É\é\í³Ø¥lI\ÜvIFß’R{\ñe+#\Ø\ß\Õ\ÎTc¯ûŠm\ìI\é~E\Ëb\÷ý\Z$\Ïv$1yd«\Õ\ðl³ÁW\éÈ™¿OO“\òIzDµÍ”%\É	\ð^\â8\ò\Ø×›G\ô\òI-ŽoEr„w}¥Ò’%\Zkd\ñL\ìúrrW\í\ÉÙŽŸ\÷\Õ5¿\ÕJ;D>É¡\á~\ñf<\Ðn*¤|¬“>K´\ôC¨\Ç\ò\æ\÷\àÿ\0/™\Â_lŒ}\îøú.¦x\×þž]¯\ÜTú|’ú \ô.£ \ï_v=ÿ\0\âÉ…¾U¡\äø{\Æ\ß\Ú|Œ\òš~,˜\ç{rN¦[\ãE»\ö\'\ÖMu2\÷=~\Ãq‹xÿ\0\àÅ….ä¿±‚\n”‰þ…ýŽ\áø~®Õ’KH†i7§ü	·²\Û±gj\'ŽM$Ij‰\÷Rt4¾­½–\èj\às#úYnL	\ï“Ý”´\'«¿O\êbZŠ;–\Å´’î“¤cŽ–\ÉÏ#m\ÊVÅµýŒ“~\ÂýNÊº^ž\æ\Çcb\"„~OÈ—”#$´‘“\ÜWb6oÒ„!xc¿J\äB~‰\ò?nš\"\Ç\áŽ<‰\ò\'\Ã+\É\\±K\\‰\ð\öJ<¢2t\Å\Ìžš\Ù\'\Ê\ÐÓ´)$¥Qú¡´xq¦&»rFÐ°ýX\Ûq\ö#-]þ5ÅŠ;‹]¹\Zý\È=\Ý{1\ãú2ýKÜŒ\ÂZ1\õx¾f\'Y#\àŽH<[R¹“¤\É\÷ZL‡Wƒ\æFW%\É£‡}\ÊùŽžTþ¸mXçŒªQu$G­\è\ç\ën#Ç•Å¿¶Uüªp½2\Ô\ä™Rƒo\ívwe”¯–I\Ô#·\'H\ì\èp9cªŠ½ºh,x\ã^\ï\×Kƒ\'Sšj8\ñE\ÎO\Ù%lÿ\09\Ö\åÈ²RmÒ¾°§?ý_ù1\õ+\î\ß\î[{-\Ò;Ÿ*Ÿf\Ù|\Ãbgj¤­‘‡\×.IKQ5\Ý>¥Q\à\ì\\\Ñ9ºM\Ð\å\Ë#\rÙ“\'\n\×%pwr\È\Ä\ðŠw&:¬qdå¼¹){qj\n\ß\äË“Q±µsŸ\ð%\Â\òI\Ý!È“\á|¢¹#¸¹\ïÈ‰>	¾X—-‘{Ÿ—\ë^—\É\çÑ¡¯#l^¾\Ï\Ó\ó±sÀŸ\ä‰%\Ã/M	\ðÆ†6\î\É!K“»D^êŒ‘z\ÙÝ©+;¾\ß\ì+\â™\Û\÷!B¨Å“\Å21û‘«‹\Ñû ûd<R\ìÉ¦C*úZ±$\×uFW\Ýa\Åw\ãŸtH¯£$´<RS´G\"ÿ\07Ó½þ¤…—·´O§\ËjK\ä–«>	U\òˆu\ïN¥\å¹žLo\éŸ(ž$\â\å¸\óûù\ï,\Ó=¿R|\ñ¾Gt¨}øƒ\á½c;ª\Å\nü9«1ü3 \Å\Ó\Æ)IEw}aþÿ\0?‡\â\ÉYú\ÎR\åAû\ö:Î«#—{IJw\ó–Jmþ\âÏ‰I=ù;\åKcmkdqc‡r\Û#\Û‰m£w=2Y%¡cw!%IR;xc“v\ì½\ð(ù2d\áR!¹\Û˜\ä\÷!/%j\Ñ\ìÉ½\Ý›¶dZŒhË“r•[å…¡¾	\ËÁ)xdŸ*Œq\ä\Ç\ì†ü”\Él\÷d¼1û\ßÑŒB\â„Z(\÷ÿ\0F\ÄW¯“\Ë\Òt5\Ã$ŠÐŸ(^äŒ´\ÕÃ±]4)p\èË£»RTwn,§´8\ð_$U\'ÁŽJ\ã*’©hÆ•\ÆVtù5#—3\ô\Ó\íOHžWÛ’5ù%5q™–\rÅ¶\âùFVžL3×·±\Õ\ô«³<\\¡\î¼\Ä\î9./\ò5\'’O”w:º±\ÓÅ—ø%‡%_\Ò\Ç]·hx²¬‘zzci«\Ó\Úiª>¢\Ù£ÿ\0~Š\ã¡\äÿ\0¬%/û£\ê\õ„\"\ç\'J*\Ûü¾7\ñn£©\È\ßm\öc‹ý1\\!\ÆM?®>\\ž™8µå‘4»¤ü	´šú½…\r\ÉlR¹IR\'–_A,©G¹\Î\èpM\"Snø#6Ì“•E…9»b†­Á)p¬kžIŽ\\‰q/—B‰[\î<]Ž~	O’<¹aÉŽ?j5IQ\î\Å\ì/\ì/oÁ\'\àw\ÉB\ð‹’|E™¦ø¢r®\í\ÜTlØ¬³Gƒ\òr†$\ö&{1±\"¸~Ü®Lr\å	ý¬š\Z\å	p\É.v.‰¿\É	}Ñ¦_\Ú\ÉF»£d%º£±[\Ù©\"\ì•\n\Zš1\Í}:%‰¹BBN§q~\ä²5	&×¹‹¨Vüù\'\Ý¢—l\áÜˆeW\Óý‰\ÇRÇ§øX·z~(\ê!O\\_:GU\Ðe}7U	E¯\"”mªoŽ\Ö\Þ\Î\èþQÜ©ø.-Le\ÈqVGøÓ¥\Îù\Ç	µû\ñÿ\0\äY°cÊ¿TS<úJ?\r\Ï\Ú\ö\à\Ð\òe\È\ë\Ë\'‡,¥\êý½\\rÁ¯rMAE9J\\$O\áý\Z\êú\Ä\ã’k\é‹\ð½\ÈO$¥vü¶<®’¤Gi\"\r}\\_úQ¤%\÷lM\Ò_Ø§rˆ¡¨ÆŒf\ô¬qû·ø2=(\Ñ/(µt\"\Û!¨—Â¡¿\'o\"\\!¿$Ÿ–7\Ë ¼¢>6eŸ\Ûu2\ð\É\ó&c‡$\"µøDÜ¾\Öe“ûL•BýFr‘†5QBZŒI¾	þOf2¶y/×‘ûgº¿£\\1ûüú/qøcL—A¯©Ÿ‰7i’Jœl„Ÿ±%\ö\ì~bUV‰-IZ1W4\Å\á\èUÁ¿¥’Ž¥´\'Ã¦I&Û´C+\íh\í§¯b2j®/\òA:‘\Óe§S\ò¨Nœadg«ƒ\Ù#¦\ÍšŽÿ\0Š\ô\ÓùX\êi\\\'bÏˆÿ\0†þ#“\áŸ\Â\ñ\ä†\ÓkS‰/Ç£O\ð.S*Z.:k\\’”ªŒ™¨½qc·K¡ÿ\0\ô\ózr}¿\öÿ\0\ôc\Í\ðþž._S‚4hù\Ý&H{¡\ÊS}¾äœ¥\ôa\'(A£ª‹¯–\Ù\ñ¿¬\Å\Ó\à\é\å)Ni$‘ƒü9\ÑC\â_Æ¥Õ¸§ˆ~eùü\nY#\Ë\à‚s’¿br}Õ£W\ä\ïus2.?í’–\ä\é\ñ\ßdmû²rm±KzþH\Åý½\Â\\ª1?\'[û#ff¿\ô\é\Z¹ÊˆGQVIþ“\ßBVK„¨|²1\ñ³,µ3«\Í\á£,¾\öb†\å0A}ª\Ìij„®‘n¨Œù1Gš1A\ðB<Do„M½±¾E\å‘B\ÕD—\ôÿ\0Ç¥\"Ð1»\ô[+\Ñ\Ìhü\n\òJ\Ïq1^‡Zd™8\ê\Ç[I›\â…\ÌY(\é«˜‰+±Q>b\ÇSE\í4R§³“ú©™\"Ÿc´I»œ6I´\âŽúŽH\'rT¬î«±ƒ¥\Ç\Ý*²8“Q’Gc\î&W\óW\ò|7®’ÃŸ,q\ÊZM½\nÿ\0üpœ>³\ns\éúˆ/ª\ö~\éùG_\ð/ˆføWÄ°ü¼\Ø]?i/O\Ê~š6<®—r{\ð9N.¹-_g(Q\é\å.\Î?N“\â}6lpûr¦\õùù8ûþØ¥\É¯Z’º=\ÅT.¡Jp¦I\Ê_í“œŸû_\ðufUN\ä\ä\éR>þ‡þk\×c†Nµ+‚{X¿ÿ\0¿“;È‘“ª\Ë,²\å\ñøD\ç\õ\ÎD±¯––\åÆ¢\ôJ[\î5\ô\Æß¸\å¶\ìU´7uÁ{s·\ì:\í\í¤7*Œ[gS‘­(£Ryd›üa\ZÇŒÍ‘xHŠ\ÜÝ˜c\öÄ’\ÔV‰1ÄœøD\å\Ë\"\ÉYŠ4ûHA$ vû#Ÿ©\r¾K¿©»\\’;•6E^\á~(d¥\á“m}$[£\óÿ\0/\Ó\Û\Ñ\Zß§\'%øù¸ý\Z\ò?c\Ý\÷\á’\\\\£\÷G³#.R	“y+˜‘KŸ\î\'\Ì±…\'\ÉJ«hPºm\Þ\Äø{29\Òdf—r\Ù\Õ1K·E\Õ\"81ÿ\0’cw\Ö8\ß\Ö<mÿ\0»ÿ\0&l3¸d“¯c¥y¡\ð?\ñV°Î£‹4¿C\ö~\ëþ\ÇM\ñL?ùF \òF=ø²GjI\ïŸfJ2pšjQt\Ó*Ñ³iP\ÔÓ­HžLW\Û}¬Š\Ç(.YºF”U\ÉûÁ\Ôvq»£?K\×vI¾uû‰\Í[0\õp]\ÒVF\\4&©\í\'Qw+ün\ä¿\à\èºþ\Æ\Åû\ÖÎƒü?\Ò>šYTºœ‹\é\Å\õ?\ß\Ù~N·\ã]Sêº™\ÒoQ\\$Jt¢¨X1}Kt9I\É!¨““¤Ž\å\õ;~\Ä\à\êq¤FQµÁ\ÝFÌ¿\õ3{“lQ\Ôq¥ù;]¼´%T›%%\ìJ\\I™§\Ã$þ\ä%\ÍEq(=¤B/V.IøD»wD\Ü\Ìt\è—\éfE\É&ü™‘)r\Ë\ò9-\"^\Ã\òAm\Ñ\ÓÃ™E>r#¢\Ç\Æ\Ì0û1‹þ’6hÑ¡zn\ÆÏ¥1Þ¨K\Ë?\'\àHüŒ\ñD_(»C[R\Z\å	*1\ËLµ\ô³$tÕ¢¿4¶\öE*R³ºØ•»\ÍWd&–\Î\æ†ûm\n0S£³iŽ*[{¾¡Ã»\ê2g›”\äÿ\0oG,\'N-3._…G\á?\È\òt\òC¹\Û\Æÿ\0ÀºŠ\ÎP_FMÿ\0%\í\ÏCµøbmpwwBK’n\Ú>£\ZƒZLÁ‡,\r}OHÈ±K¬”*•¦fÿ\0\Í\×Ã±:’t\ë\Ø\Ï\Ñ\ô\ð›\Ém¢S¥,Ÿ\òb\ìRoþL9~\ß\ïgM7,‹_“¦øN)\ôŸœru/_3˜\Ã\ö\÷ÿ\0?_\ñ®ª}wW’yg’]ÒœÝ¶d\Î\Ó\ì\Ò:~’ºœŽ\ôûX\ö¹g{ä”¤´$“Kd²*q2%u£\Z‹µ³±¾Ø’ovM?§\ÞÜše?,J®I:«•˜ø‚C#ú“1ËˆŸ	’±®Q(;ùvI~Š2>$M­¶ý\"¼_¨Æˆ.\"ˆ9}T`\ê:x¯sûbIý±:‡\ö\è\ê¥úÙš\\É™6É¿›ý\ÉýšÑ¢¿\Ó\Íß¢\õ~K\ô~}=Æ¸cý\òKÜºrˆ•$Ú¢_Ô˜Ò·/•3$n™Z’#$\é\Ð\ÞjL“j\Äûm	\öŠ=:ü—\Ò\òI)$¢\åü\'P\ã|zÜ’\÷d\ñ`…>þk¡†ynX\Ý\\›]¾GŽk¼Ž)\÷CV.£\Z‹jÅ\Û\'\×\õ˜0Ç‹:O\ðÿ\0øvPI|\ÙG¶+\Ëf^¯¾3\×*\Í\Ô>\ôŸ„eø<T\\\×\Z°\ð\ä¨\Í\ÚæŽ«­ŸËŒ\ÜqÇ–\Ï\òPùXr+Knø>/\ñ>î—£œÚ–y3\æš\ê~%‘\ÊO}¤gK·²]\'O\òúx¥®LŽM\äž\ÉÖ¥¢NW\Ù”\ïlN]®\Z\÷1$¥hÇS‰\áp9&ë’¯¹M\ÐÓµ*\Zæ†¼‹»r#¯¨º¹tEùF7\É	pˆ¥\÷I\ð\Èÿ\0I\ÄY8\ñ2‰\'\÷1?\ÔI}ª\ÉyE\î\Æþ\Û2\ßOa¾D\Ëý%þ‘]8‹\ÌùúHGü¯O(\ó\é\ã\×g&ÿ\0\Ð\Æ4_ƒ\Ü~\ég\çÕ½±\òÆ•h—¸\å\ÎÈ¤\ßv¢É¯66Þ„²¦Èº¦}®\Åp+E’>ä’Ÿ\Ó\îJ=úz©\'\ë.£¨ŒR´Ž\Ò\öGo\ÃfŸ–Š\Ú;dšt\Ñøû£%ÜŽ­F2Ž;K“6.¡m\ÅqCËƒ½½4c†U•¥h\Ïþ+ÿ\0a\è¥o¥éš“\öl\Ã\ðÎ($¡Š4’\'\Õ\õ¿\äð§“«\Ìûq\Â;¥\î|BQŒú¬’s\É\õK\ðcøWN\ñb•J¹3¼¯&l¯·\Ø\é:o²1¿vaÍ‘wM~\ÇM†	\äÈ’£8t\ñ¿\És¹\Ëc½+GÎ—Ü¢C›bI\'Á%]ŒY\Ö\ÈEw%bqk‚-6\Ù·[oD\×\ß(‚ä…¯U}D*›³\ß\Ú\ì›\Óü•ù1¯ºÁtŠ\×`\å\â‹{’!¹¦`\÷0\'¥dLFÿ\0H\Ý}%\Ó\"\÷Bþ’Ö¢7\à~Ç¹\Éa½ú»=ÿ\0×¯Z\ô_\ê^\Â~\È\Û\Ó$©Qz¡{Ž©\rø\ô®Ý¤\ô5{%³\ð4\í[>Ý›†Å“§U\à\Ñ¿T”«û™\â§xŸ\ö3t}C\È\à\ÒZz(Ëžj\âÝ“U)A·ûŒ~\Ý\ÑX\×N¹\òI;B–ž‰¦š\Z”dÞ¯g\ÂaCªkhø?ù™G\Z[z\Ù§£\É\×\ÓÀ\ã9E¿p\õz§\Ý7Hÿ\0Ë¾“$#Ý’ª)yd±u3ÿ\0|e|Î«¨w\Ë\ô#¦\éqW\ËV\Ñ¹K:\äX{¢Q5—³”\äÎ³¤jy\\“e\×Ìœ›\ö\'%Qz\ÝÈœ¥\ô™%¶\é™b\êS\Ñ¥r´c…v2R\á2mSz#/%¦™]³¤AºJ†ÝŠ-mŠ´ØŸ6wU?K3G–7Ìš»dZ\Ül^1“|BŒ\Ò\à\ËýL’\æØ—†\Ä\ß\ØK•~cDŸ”I1*²+„/c\ð&–†¸\Zÿ\0Ôš-\Íp~=ýhLU\èý\Ç\á’$5\Ê/”C\Ê b\åÈƒ\âBþ£\ZTÙŽ­´A\ð\Ñj-Y6\Ý\ìP\å	®I^¸%ƒ\"·¦+\Ô}¿P§\Ö\ÏoNŸª\Æ\ñu8!’/\ÃGøgüA	«\Í\ÓN^aRŠþÿ\0\ä\ë°f–_…üKWŠ\õ	ýÿ\0\õÿ\0\'\Åú¨\åø|\Õ:´­Á—¥Æžl]•\î¨\éþ†J	9W+Á)\õR\î°Öš±-\Ð\â­;^Ä±ý†uýLW\Ér\Ó\ÕÁ\ÔFsùšÚ³\âxz\õ\Ò\Ë»d·¡\äRÍ›—\àM\÷:^\Ã\ërB9t½‹â–‘\óeÝ‘\éÇ‰\ôý3IygS\ñŽª_22ùwÏ¹ƒ§\Æ\óF)º7(¬-ÿ\0NšNI3$>™h­ÝT”\'Ò”¦›ü\Ë*Šfv\ÓVvS™m2\ril­~X\çvs¢I\î,~Q½\Ä\Çý¿B3=ZGQ¯­s#«\Ëÿ\0$_\ß+0û³8ÿ\0&\Ì?¶1#ý(‹\ö$øI“w\ô™\"\ô†µ$b\\³§\òb\\l„I‰\óG\ô’Ÿ¹?\ê\'ýGw,‹\à^\â¡£_\é{=\Å\é\ì?O\è\Øý\ÆKD—‚^\Ã^•´5\à—³$\ÝS\ZGso¹•j\Ç7±?&\Æ\öd\éæ”¸\÷\íúˆ\Ü~¯ù1\õ˜•Iw$?q£Ü¢0MZ>L%\õ\"SRÿ\0\È\ófrnËºg¹(\ím?§5%Áƒ¦\Éy\ñ§\É\ðŽ§\åÇ»\Zh\é1\çy\ã4—(…\'Ž.‘<™\íý¨\Ã<½¥Z#›jZ#Š\ëQŠå³¥yž|\Éyf\\\ÉNX\é{\r%kø:n·’ŠR\ö£¾”GrŽš\ö>L»\Øù£R¸\íT»’Vµ¯q\åI\öžú\"ü	­¢\nÓ˜\é\Ô¯\é9\ÒD\ÓÐšú–\Êz\ì5\â\Ç\Z§CuRDŸ,›­\ò\Å?\Ô5´\Ù\÷£E§Lq\Ü]¡½U|_\Ï}­™c®\Ó*\æ$\Ú\Ú\Ú2.\Z2yh—’Iý\ÆHù&«c’¦\Ñûú\ë\Ó^›5\êï‚½?\à³\ò1—\é³\ò4ù†I\Øo\ð/b/‘Y|4j´A7i\ö\"\ÝQx,\É\Ó4\ã\'^\Â\Äâ¥‘ª\÷!\ó\×\÷:.ªY2.\ïsE\Ýh\éq\ßvDŽž	\ÆD1\'/š¿k3\ærKQ?\Ì7\È\Úm­•\Êb‘J\Û>_\ØÎ¢\íS¢q]ÿ\0.Rk\Ø\ëº\é\Ç\çv7¤\×,ygŸ¯Q‹›¤až—µ%\Ê>¢ÔŸ#ÅŽ\å*Šü‹¨“ÁŽMx\Ó1g’\Ë(\ÛoÉ(¥¨MIhÉŽuª?\ónj[ho¹8\Ø\ñ\É\Ê0~™Dú\î(Im\"¾¥û5+F)#tFqúdv\ï¿B’md.þ±;úÄX¯“µ\ÚdW)\ÅW\'Ä¨\É\ÕfE[c’]\Ö5´Æ¹b­¡=«\ZÓ¿\îwn,’\ÓBk\îho\õû\ÅfC\ÌÙþ£1ÿ\0\Ôd\ëd#Ì™\Ó=;0þ™2–\È\'¦Gú½w\é¯KE?\ôo\Ñ\ð/À„!¢ýZ$I\ðLš\\\Û%\öI\òK\Øw¸‹úHùþ/¶$£Â£¨\Æÿ\0\Û\È\âÿ\0‹â¥\â¡ûdhÿ\0\ãÿ\0ú\çT—·\Îg\Å\"¯?\Ær¿\ÞvF	©uS\É/ÿ\0\È\êº\Ö\Ö-û\ê—\Õ7ýÅ¾\ì\Ò\ò\Æ\Ý\÷Y&ø+m¦©__\ÔÇ¢\è19ä›¥FN‹$2|c-\Í\ï¶\Ì1¼¸°E®kÁ\ÑbN}GM\ñ\'Áz¼²\É.žQ\Í?±\ÃÁþ!øoÿ\0—¦–Nž?dŸ4d†g£§\ìI\í‘]#ÿ\0/\ÔS—\nÌW\\–f\å»fx\â¡\Z¢8q9/a%+•%ù \òý9W\÷X\ö|Õ¿\É97\æ\É8»CÇ•ª\òW-;¢š\ä\Ç-\ÙË´AWÕ£×‚\r8\ö¯À\Õÿ\0¶‰&\ê’º€\ÓiÀœ–’Ô‘\ìN<1ÊµFE\ÊdüV†¸\æ\ÑK†Ñ‰\óh\Â\Ö\Ì\\\Æb†›´bd\rwÀ—±Û«C\å45¦Iy’\â“+†4%ÎˆY¿\ô\ì\ðmz\íŽ\ôK\Øc\öc=\Å\ï\ê„Ex±\ìÁ¤oÀ\Ç[U\èR‘\"üz\í!h½Z\Ñ&\õ\"u\÷³¨Ë¨M£\â¹\Ýc\Ê\ö|cªÜº\ÉE?\É8ý}O\Å$\Ò\åY\ðŒ©\ÍÍ¯<Ÿ\è!\ô\Â*¼´tÒ¸\ám¿ÁM\Êlƒt¢%ç¢®“\É5K–c\èš\ëšO\'=\ÏÁˆ\æ}ORÜ¨ÃŠ=°\Çø!š-M}3\Û\Ð\ñ\õ¿\æº|\×\é~¥\ãU%±‹¬\Å8uxÿ\0T9>+£\çü/\â?7\nw\ò\ä\öŽ£§Ÿÿ\0Ž²-U«>GL\ë\Øq\ïuyŸ\Öÿ\0¹Û’.M\òaÍM¯)Aµ²+#’U³·\Ã!\æ\Ð\àÓ»FRÿ\0c¦’N9ƒ40\Ëh\Éjlž7m½27c·³\ÉcM¡©Y^Z“\ÚTe2ºÙ’^L±\çh“\ðKTŽþ`?OúFÿ\0K%ý,o\ô³,n¢\Ì\Ë\ô2~\Íq¿µ‰\êQ#Z±\ÇÁ‹\Ãb\\³û™Óˆ\Ùg‚ý5\é·\ê\ìc\Ç\ä~º½6R\ò_\ê#{‘«d­‹z-\éè±a.å¤‡$w½˜\õd0¥I*\ÕK2ŠüÄ«&I\ä~\Ëb—\Ñ\Ðü=¶øm\ê\ã\óú\Ê\Åft¿‹Pú¥\î|Ù»x=¹½{\íM$ë¢Ÿtø1cÁm¤G;qÁ<³¹j&<uˆ¶\Ò]x#-J)¦Gÿ\0\Ì\ô\ê½\è†Lµ5M˜»“´\ñBiN¹\'—$¢\å{c–^\á¹E\Åù^’¥hn±’§Ý¯\àI\ö\Ê\Å.GË–‘8´\â¸4”´\ÈM$\Ä\×\Ó*\'\ö¶6¶‰A:\àn\ô~	+¤;\àS\\l§Me-!¡:½UR²O\É?EI™\ZÑ—Ø›ý\à›ý6_\è\Z\æ¿bÿ\0\íÿ\0Á‰þø1I´—ü¸´IkDŸ‚\Òe_¤È¹‹&øL\Íÿ\0\ñ\ÑH\÷7\é¿\ôl\ð??\èc?\"\÷§\à\ò;\ào‚M\Ûc~F¼Š\÷b\\#\\!y´‹eú&\Å[B^	\É& Ù•\×\Ñ_¸ ¾¼‰œ«\æ}+Í&Ø³§O»\å&ÿ\0$ û\Ö8\ß\ìf\Í-/žY8®q“½²O…C“nEý)\ru)ù³¿\'Ïœµ<¹»«Da\ÂH\é \ÛsZü,]\êÎšP\îRLÅwbš¿(†h8IZdqg\îŠ\Ó–^\Ô}Yr=7¦K¨\Î\ã%vÌ°]\ð2c\É85²91v\Þß¸œh†X¸¸FK\ö1\Ë#q\ÃW\ì(_\Ó(¿\ØÉ‰ù¯s$\ÜJùD\ÒTìš«‹b¥i¢3…7dÓ¡S¦‰-¢[\Ð\âÞ˜½\Ç\î~\n®Eù#Å]³¢k\õ™—\Ì\ËN&NQ™r™—Å’ªœ	/µhR\æ#Žœ_±Ž\\F¿‚˜£¶¢ˆxˆ“ûX—1d|9!\Ç\õ±¯\ÖN;R2{ž\r\Ø|ž\Ã\õ¶P½ˆ¢\ßúü–!y\"…À´!{\à¯Q%D\äÞ‰V\Ñ\æ\Å\äŠ\ðE~b\äŸËµû–¡Š«\ðuY7)v¢´\æ\Ý\ò}1º%]\ó\ñ\îF\Í_F$\ä\ÉGy&£~	Ïº8b\Ú\ò\ÉJW$\ÛbÄ¾½~\î4v«cY\â“\ò\ãƒ\Ò[NOÉ‡\á\ñùk\"J·³\ç\'\ò\ó½¿s$ð¹¬¿R^\çS‚+ºoGO–Q3¶M\ïd:¼K6)&Ÿ±ßº³»H7\ÌLË‘W’]Fv\Ö\Úd3bQœ6e\ÃSŒm\Ã(\Âq¡ü­Äƒm8\Ó%—¢3U“\Zk\ö:yÅ¸Ál†9>Ø\Â\êJ‘´\ñ\åÿ\0‘ºú…$­&Em#¾?I’6’$ž™?)3»\Æ\Çù\'È˜ý„\ß8\ó´BZº\'\ÆCZ‘µ2^eh\î\á£\"\á&x—0b‡)\×\ìb~R0¾\\L[¤ŒW¸˜R\Ül\éÿ\0V6tR\åQ\ÑK\Ê:I\î3Fú\Ñ\Óÿ\0Ô‰»,\÷o\×l\Ó\õ\÷½z2…\ãý>Å\Óe‘»l„OdI¯aûŠ¶›<(Ÿ“\òI®	I¡¤¹>d­\ðtø#n„“Ž(rg\Ê\éý(ÃŽ“ú˜°\ÇèŠ‰“\íŒ\éy#\÷d\Ém“—Ó†5ù1\Å9\õ9­ÿ\0M‘\Ë/—‚\nˆ\ãu\Ý?û[rv\È\ÅY)¶\Ù,y¢“\Ûdq\à\ÅW$›c\Ç\ð\é\ä^\"Ù›?\Æ2\ô˜f\ê™\Ô(ýRº2(\×{W\àS…6KDá’¿’}4¡\Ó\î\Ç-;|z¬1\ê:y)BJ\Å8MEÕ¢pÏ’ai¾Dº‰4¼‰¨Ç·ùG\ÊQOh\Ç&¤•1\Ã\nÖŒs¾\åDc+‹•Û²Tû£G*J\È\âzl”$’›FH¤œ“E¥Üˆ/\ØÁ’7tÙŽW\ÚÑ¶5d“´.\'Ÿ6\õ*$¿R~’^Q~\ÖO\Ü{‘\Ò\å\ÔÓ‹1=\Ã.l‰’\÷£,<6E\êj™[Œ¬\ñ$š0\ä\ÚH‚\á\óde¸\Ì\Ë¶vg›2?º$–ûGQ©}\Ë6W&«Ò‘\ã\Ò\Û\õ\Ó<Žÿ\0ú;\ô±Ö‰1º$øDªÞŒQû¤ŒPÒ¶]\é\n\Û{-\é\rŸR\Ñ)½#3‡uR;~\÷dTmEX’úŸ$a\ô\ã‰>\ÖÌ¹&\ïK’Ÿt\ß\ðN1¬j—¹“3rœŽ{t½\È\ã‹PW&(§|‹™y\ðwI¿\í\ê\ÓüŸ3\å\ÉËŠøyEs_\ØÍ\ã=Fi\Åýs|™%\Â\Õ\Z¶¼™1¶¸2\ã{½\é:ˆ\Ã,¾‰:\'(G²wc—.Ÿ¹ŽY%\ßR\Ù\Ô\Ë\åW$\ÖK”D\Ò\Õ2V´)c¯a¦\ÉE‹†\Ç\á\Å\ÆPŒ—³:II\÷A\ãoÛ\í\â\É¯o\'É—Ôš#j2v4¾™\r.\Ù\Å?\É‘\à^\íµ+%nÐ¥\à·h”v„•d\òb—š8©\ð9#$%©Zd£¸\Î\Ñ\ÝË¦d–ÿ\0“\"\óý\ÈKY1¯\Ü\Ä\Õ\Å¦¶\Ú2/«K3\ÃS‰\'\Ê$¹Ep\'ÈŸ°\×\éM§©BŒ/Á‡\ßþ=8\ô\äf½]úx4*ÿ\0^Í›„Èª¶cŒu¥Q6·6~\öM\Ä\å¶F(s–†\ê\ÕƒWLŠiF&”±½½:\ð9{»n\ÙÂ¸!\ã\r¶w\Í\ÊOKÁ)\ê:BU;U\'H¶\è¤\òM\ï¹ù\àX\ñ\Òå¹“±G$`Þ´.£á¯¦›\å—.xc\Ö\ßûn9!\Ã^›\æ\Â7\ä\É\÷#ŽI¤Ú‹Ù—§“S‹^\Ìÿ\0-\×Ã \ê\ò}2uÅ“$\él–\\60\îŠ\æ¼0u‹&é½£U‰G,jIrJ´­	A¾\ÝÚ¡)i\Ð\ë“$Wwgrü\ò&Ÿ\öddÛƒqƒ4“ŒÒŸ\î(J\ãdJ¤®ˆI/pvž}Q!n\ôFV\â\Ó%\ÊE\éªe=‘|¡\óN.›fU¸»#\Æ\\m~NŸ\"ûÿ\0¹	\î‹þL¸·º!-M8±\Çí“¢Kkf7©F™ù1?\×L‡‰£\õ6‹\Þ9Y’.šÚˆ¼Á\ô¶d‡.\Å?4\Ér¶‰Ie½u±Wƒ^¾\r›ÿ\0C6$y\ôk‚Lu¶D¥T?q%È—\îM¯a\ÖØ›£¶’G»+d\äù]\Ò4”E\ç\'lrkt¼Š\ïØ•\ö©R%ÅŸNüºŠ\Ø\Ò\ï›%)rylùŽ—ú¿bù\Z’hx\'§\ÃB\êTWrz£W\Òä¨§gbœ{)ß±];ƒ\\#E<s?Ø†HJ=‰\Ï	E\ãßƒ®ø?\Å\â”d”eqcø‡\Ã1\á\Ï/\÷ ’Ø¥«‹\ÓLX²š\é£qn\Ú‚”m?$¤”d¬QT´Rb•‰7{\ÜO&\à\å\ß\àÃ•>ø\öK\ÝF”%Ü‘\Ïý\ØS\\7WŒ•²XŸrƒ¯Á\Ý!\ÅyEª±4\Õ\Ç\'M™\"\ë“ù\Ó$Ÿ‰D„—LÉ­Õ’‹\ò„þø¢	\ÜLZ¹¸3-}T\ò}ø\×\î‡\Ðè„µt\Å%i.™|2\Ôdkm£ª†\á&fZÍù\"\ö­z“_É…ÿ\0I‚zi¥¸I¦eƒúfu\ë\Òÿ\0\Ó|zW\'+Ó’\ËL\ó\ëC<D~\rù=Ä™­\"r\ãBýRºD¤´S.ZB‡,mh“¢*†\Ò\\\"\Õ&6©\Ë7/ù1\ô\ØÚ\Õ#ºNNVßŸa9R\Û%T‡~í±¦.Y­ŠV93CÁ:lx\ò\Æ\çû\ê°$\Ú1\å\ÜW?\à•%¢.n\ãÈœ\ÜSt)6ù0üG§ù\Øñ¯›|¾™Gµªt\Ñ\Ýß”FQq’´\ÌP“–=\n\òh\ÑM\ÑÜ›Oc‹¦FpÓ¦Oµ\àéº¸\ß\Ù?ø3\ô\í\Ê*\ã\îŒSn9!OÜŸO>\ìS¸’k{\÷GI™%%\Û\'\ì}=\ÐjIŽ\ê‰\"3N\ÖÄ¶™wdã¸½/ê‰\'\Û*~\ÆH\ð\ì½N?6ˆK†„=;„š2\Ã\õo\ò4«$Ž“*¶»Yý™F\Úm&In2Á\ÓFXo·E}\ÑgK—S¥fn2M~K‰Q4þ™Y\ÔsÎ³\ÜY)*œÏª/\Ò\Å\îW®ý(·þ›+\×À\Û\n\ö\ÅÁù­hŒyv\Ëz\Ñ)\ÓØ£d{’^ød›¶\ìŽ<w\'·\àqƒr}«Ø–g\Û\Û9·ûŽ;eý[\òC-ýÃœ\î\ôŽ\ï\Ù[£EH\àÔ‘,Y-J‹P„§¦FuN\Ñlï¶’\'%¸‰Ö…uÛ¦cÅŸ\æv$˜’¤.\Ùj™kc†G|š´\Î\æ\Ó2aW¡d•\'OÙ˜\ò®\×.\Éû?\'Q\ÓÚ’n?\ðtù\ä\Ó]ù:Ž–W\Ýt+JI¦9%(JÉ¨\Ól†h8M\")·\r…\÷!;hi‰\êN†ü&J\êˆJ£?¥û“­T¢FK\í$¸´d\\2I\íQzdRk\ò1•—\ãû\ÆF™\Ö\á\á\÷D\î\ÖLF7\Âþ\çO=NÁ5þ\ÜÑ—ú&\ÑÕ®%gW‡\ï\Çk\Ý‹ú\ã(.MJq¹\Ñf\ÚQ:O\è_\ÜcüŒü	!l\Ó,u\é\íþšÿ\0E‰4W–xHmlKÀ\ëC©´C\ZK\È\ß.‘\Úþ²M\\™Gû’É¨Š3j\í¡¨\\\ß\ðK$­\ðF2\ï™,“¨\ðCµ¶Jo’R×ƒ\Â(½ú^\Ø\å\à¯°\Ê\Ð\ñN\Å9\é\ËûŽ\åi‘Ÿ\Ý\Ìw\ö\ð„žÐª\Ñk\ò^¯e=—\äM7¢p¶¸7rMû˜\Ú\îª~\Z3v}i\É.’p‹†D²Aø~K”ºiSþ–f\é¤\ð\õuù1JWÛ§\ìd\Åÿ\0§&\ÑT²DŒ•Á’jŠmI\r=ŸÁú$\÷\à\í}³Šk\òaÈ®¶Î§ú%\ß¿×†Œ\\d…~Q\Ó\æ_D‘{HÉ‰Û¯ÁÝ¯ø%ÁTè„ªÿ\0\ä\í\\ZüŸ\ÛW\ì\Äÿ\0M3\ÃFXntg†¤5\÷DÁ-M#¤ÎµHKp\ã\÷3cFI\'ûoýyz%\è¹\ôUþ‹Ck\Ñ%\é_\èüzhH±•¶$?|ú\ê\Û.-¤+¤ŠŠ½\n\ô9J…\Z\ò\Î\ÔO+KÁ\ò£\ÛD›“w&K&J\ö7-¿bY”¸; \ÚþØ¿-Œ\í]¨\í‰nÁ\Ü\Ç9¥\àJ)$\\‡VO§ÊŸ‚»_q\'‰5!\äµ&Y»,\Ø\ÔY^D\×r•®W¥Æ…94ù‹¢WÁ\Ù&ÿ\0\ÊVø\"\ãD&›‹í‘—\ßrqk†Œ]^?—ž)\Éy2t\í\Ë\Õ-¤\Õ23Ž\ÕþIcJX\ØÚ©ÄŽD\ÜIA´\ÏÀ\Ó\÷6)®\Ùr…MhŒ«µ’\å\Å3•I4JV9\Ú3c\ó†Fk\ë‡\ö0fú±Ë¶_’xŸnH\Ú\÷1\Ëq•\ö\É3&.c£\÷\Ã—)•¦…Õ£Ntÿ\0&9p\É-\ÄË\Ã3b\óhŽNU1û¡!+<£ŸE\égŸ]ú6\ô/\'à±–$$kC~T…\äo„cÆ®N\ÙqqŠ¤?aù)w6V\ÆøG™[J’_d\Ýyb‚r{‘T…m/“¡.M¶\Î\ço‚\Ý.=*?–Z¶\\Ð’t9K‚±«\\+KÉ“\nŽÆ±%d\\¶ùWbq\ô\òZhùsqcp\ÑR\îCO¾<yV9\Í\ß\"’©\"1N~Ã”«ƒ´mZ7²;´¤¿$›\Âû_°\ã>\Ì\ÑÑ‹7û˜\ZM\ìË‚J3O\÷!8vËŸsµ´é¢®´6«\"\íq\è\ÐÓµ¦IR–\ÈK‡L½6BzK\÷\'khž7tF\÷\ô¿ÁJUû‘’©m\î\ÅMZwg\Å\÷.\äaŸ\Ý\Zf4\î3¢\ÕZb\ç´\Ç/Ál¨Ï‹\òŒr\ÖLtt™u¤B_V)¬\òy\ô\×ú®\ÎMKc\òx6;\àe\Z(~š#‚\å\Ù9j{“¶j>´¶J\\¢´F^\å¾ìŽ¢„—f=!\ÊW{;x\çÜ¤—–vF“q<\ÉÚœŸ\'süíš¥À\Þ\ËeÊ‘IGØ¥h¨\ÅW;\ñ\ä\î\Z\à\çEC‚X¥^	bÈ·\äŽe\÷xZf½{—|yEÇ‘Á\÷®¤¿q\Æ\Õht9ûŽš>o\Ñbq·§\î8:—#ƒ´\ÌyU§R\Zm=1\É\Ótý\È\Ïé’¦¼™0´”¸0\õQÈ•ŸO\Ì\é\ß\ð:p\É\Zhq»\àæ˜­ø)	\êHÞ˜Ó³\Ük‰Š\ãÿ\0c’pž½ŒYcRŠh\í}Ø¯bk[‹ü™q:š´Ft\á:dŸþ¤S^\æ	ªºý\Î\å\ÝýŒ¸ùLœ|²pû£§Ì¿¥’[„­š³û `É¸º3\ãú±dµûo³<§_ý\nü‰\Ã~\Ñø(\Ñn¬†5Í²ru½É‰q¡½$%\Ë%7HQV\Êt´\\’HŽ5\Ý\'oØœüÿ\0Ž\Ø\ç-\"´\Ë\ÉI\ð<²\îŸ¿¡p†\ßjf­Ž\é~D\ôU/s¿-øE%8\Ç\Ë;¥\Ý\áhÿ\0o½¢¡\\Šiµª\ò<3®EÜ†¤•‹\æ(\Ê\\›£v~E%³\å\Í\×\ïN\òKJ\ð,ü\Ç›\Ù)I¸	ýÜŠXŠ¸Mk\Üì¸·q|2PW1\ödþ\å-m{5(»^M«\ÚcW”9´bÉ¶–\Í7hjÆ¹B\Ý1§M\Ç\çhR\ÚÀ\×5\É,m8J‡¥\'LÇ•St\Êu5\Ý\äÇ‘}ø%\r¤Ì\ò\Å/º?\Ê\'p—r\ö0\æU$“1\Ïqxl\ÍqlÏ‹R¶ˆO\î\Ó!/)‘\æ$£Ä‰¢—§Ÿ]úW£ý(\ö?&¸\èorb\\	j;e\í³\Â¶\Å%²¾©RÖ‘z>\ã“Ð¢”W,žfh‡O\Z[“G\ËU\åŽM\Î\\\ni\"“o–9\ÊÄ—j-\ì­\Ç\Ý/<±³»\"¿\ås\ñG\Ñ\î,8#q\ÍÂ¼\"\Ú^\Äg\Ñ\Ú\â\Ò¹VüŽ3Lqi·\Ê!‘S{B’RL´w”\È\Î7\å\Ç7\ê‰\ç—rz-4Ç\Ú\ð5E’.I\ìQ¸Ï‚Q•Á\ÜX»{“ß±,s\Þ×”G\"ù˜_<\ÄRúZ©!¤½\ÑAx4\Ç\ö#&\ÓT8”\Í\ìO§¦/Ùi\ìŒø{\Zt\ÉW‰G†J4¥´cÈ®2_±5¸»ü3^Wd¿\à”}™º’¢3WS3bÔ•¡Mø#-­3Ä¢˜ž\à\Ú2\ã{2\ã\á˜\ç\ô\ä?s§þ¿Tú¤{zR|–\ÏoE\çý7\éG°ü–$F+›%\'Î\èoB\\þ¯\É\în——\ZE¾Ø’\Ë5|\"8#\ÛEœžÏŸ‘\ÎOH¿¦:B„m±ä˜¡\Ôw;bK\ö\äwdQ\ð¶\Å9þP³µ9²£\æNÏ›\Ôc‡‹Ÿj\ð\èM_²¤w+ü1j…<i\×\î%‹5û1eÁø\ñ&¹FHdÔ2mvÉ²\Õ6(ºl„o{\ä\Ôy%\'\óV\ÅìŠ¦G/\òK\Ó-\é‹<o(x\ÓSZ*\ç¡dm=2P}’t\×2¤¤©û’\Ç\í/$rb´\ÉCO;M¯H\É:\Ñ\Ú\ë\Ó\Ý\Ã\ð\ö{\é‘NEkÜ’]ø\'Ü½ˆ7Û–.,m\'š\Zv¾–e\ÅK.×¹*U$\Ä\×\Ó*d£¬RF9\éd\ì~\Ì\ËYaÜ½\Ñ\Óf\Üd£\"p\åZ\÷†8\î¬Á“\é—\ÒÉµÝ‰©\"Pµ“D¯\Ó\ò~O\É\ì1\Ó\Øo\Ñ/Fÿ\0ú=Q\'Àß¥ú.YKC\÷/–wK|\íC–K’\ÑN4(+“\Ø\äù\Z‹o\Ém·À\òK¶<‘\Ño\Ó]¨\í{>\\¼È¾D’Š+³|\ò.û\ñH_9\å—èŠu+\æEFü\nP¦Ç´\Îø4†Ÿ¾v\×#x{w¢“‹á‘Š»\à†)\'Üˆ¸\\e´d8²y—sb‹\ï!\Ù\î,3\îO\ézbM\ãoO\ÆN–\È\æƒWl—{Ž\Î\Ø\Û\Ó\íp\Ç;\ã\É\î\â\ñ\à†h§\Ã\÷%Š]™7N-=Å’Ä»±½Ê»d\é”\Ý3•!;¢¬M\Ó\Zü–hOg¾\Ï)™1;\Úü£eYbŸ\årJ\ð\äµ\ìÈ¿§4iûš¼rµ\ìO¸\Ú2\ÃMÙ\'\Ó\'O\ò&¯•îŒ¸\ß\Ñ;^\Ì\Å?ý\\n/ú‘‘+Ã™M{3þœØ»_ºW\"k\Ø~`\×\å±?¢lŽE\Û\ÔbM{\Ñ\ð\ï\èÿ\0K=ýÇŠ|ú1i•¥þ–{‰\Ã\ô¢\Ëb‚ü—Ï¦\íŽN\Î\çÁ;–\ÅuDqF\ß#–\Û;¤wh\×j²•\Èß¹\Ý*-¨ø\\\×^Ø—“~™\Í\ñ¶—\õ3\ä\ô¹%{–\ÓÃ\ËCùm{Dn6\ßƒ„›|3´ÙÞ¼˜\ã4\Ò\Õr‰4\ÒL\Í%#$“]\ÛC’§É¾Ù²8‘–‡\Ódv›údoå·¿\Ò\Éd’§Sü#OŠ\å\Ê\ë\Ë\à”n\Ó\\Iµ\÷#¹¸Ë‘\ÂV¶¼‘r\î\Ä\êüÏ¶KfL[‹!5§_5\ßIEýDf»¢4­\niûŽ2e\ê\Ê|L\òv½‰\ñ_³#-Á\ö¿fd\Ä\êkE®S^\ÌW\ôKµû3ˆ\æ\òbÊ»¡*d\ãÊ¿É›\åµù1e\åS\Z\Ü$¤½ˆ=«„¿x*•dü<;\Ç/\ÏH«‹S\àÁ—Sk-^)&½™“þš,¯O%¡ûzþ=?±\îWz²Š\ð1–k\Ó^”\ôR+Ó»I\n\\\î|‰+»f­³»e-r\Î\Õùgsü±E×±\åÒ¶wKµp…bQ¥\Ë*’\Ñ\ÛýÏ—\Ó\Ê^d¼«\ôÄ¼0‚\ò\ìo­Šþ”\Ö)\Ó\ñCùt\ß(jß‘¹Õ‰¶›\äT«Ü\Òûˆ\ã”m\é\ï­Tˆ\â\ÊØ°\æi\ð\ÎÝ§´w+L¦\Õ\óÁq´ø>r\ìo‘\æOŸ\×µ™%Ÿ\ß¹{¢*6>R©&c\ëp)Á®\ô‰)¸\ÉT¤Ü£¦}T\ÇiÐ¥$øœ{_?\÷%Ž]\Ð¾™Š\Ø\àŸ±\Ú6Æ¤\ì\ò…\ö\Í\Üz5±1¡­>%OhRú±ºd\ñºÈ¿‘ÖŸr\öb»\Ç7\ì\ÉA\öçŽ½Ñ‡¨W¦J.\á¦e\Â\ë,]{¢3\á©~$\'\öOµûŽ³c\î^\èpw\Ó\æqü2uþ\ö$ÿ\0(\Ã\'Q\É\Úý™/ú‹ûŠ+Ñ±±þ=°½Áø\ô¿\àk\Ñû\rnŠ£eÆ„Š\ô\ö=\Ê\òX\Ût‹Ùª‰ª¿dv%½²•Ë–wlùq~\ì¿\Ø\îtŽ\Ø\Ñn\Ù\áx•³\é¶¶\ëÎ‰dÈ ‘Ú¡~\ì\íR\ÈüºœU\ðwuN’ºi\ÊùeB\ïÀ¥ŽO»\ÉYù*\\–¶ø)%cx\î\Ú;±B}\Ü”c;äƒŒr\'û‘œS\î\äx²89h”£i\ð<\Ðt\ö‰\Ç\'\ò.Õš/qäŒ±,ø«ÿ\0r)|\Øn\å{\\]\ÂD±S\î\Ñ\ðY±½Í§©\"\ãk”8µ\Ü\ïQk“]²\×\ä\ñ7û1ý\Ñ\ÓDª¤&›»\Z“i\èRmy>£µþ\ö‡3ý\Çø\ô®K%\ÉUlÇ‘S¦/»£$~ø\ß\å\rª»^\Ì\íjX¤\ã/bJ¡\ÔB×¹ƒ:¼m?\Ãw\àÎ«+¾$\Ó7\Úý™‹*îŠ§ø3cûehÅ“Y`\âýÑƒþ»þ\ãc|¯D„/_o_oF\ÏÁ^\è\Ó\ßúxÿ\0Cb^–\öhITK{)vÅ–\ép(Ã¹\òRo‚\ö%rÀ\Ûç“µR\ä\òY\ä¶l·Hº\Ù>\ê\ð}r—¶Ž\ÌQ_\È\ãr;\å&Æºuå±\íº\Ð\Ö9\ï\Èû\â\Û7Ÿ(»Vv¿¸S\Æ\âß\Ô\ñ\÷pw`k»h\ï\Ç,n[\'&\à\ß”šš{%8\í‹j›Ôˆ(·Q\Û*oO‘\á\Ë\Ûw	Ÿ.o\÷›D±I\àÉ¸¾\à\Þ9=>	c}“züŠ_\ïb“OŸ(J„šŒ¸#%\È\â»e´k¶N×†v¶Ÿ\÷*\éŸSL]\ö´\\¶;7¦\'\È\Ñz¤®,q\äW¦Y^Iª¦8´§£]\Ý6\'\õpý\Ñ8jJ×¸¦—kþ	\ãv›D«·\"\îF\ßd»_±	}\ðþQ\Ô\à}\Ý6F×³ \ßgW‰\Â_ÔˆdWŠk\"ÿ\0“ÿ\0\í²\"?x°¼£\Ü\ö\ð~=+G\ì~,i–W­\Íú\×&×±j“5£\Â\à\ñe\é	}R\à\î|\é\Ò/\ö/ŽØ¹1¶R¥\ä\ðRF\èª._¶Ï\Õ-ilPR•p¥\îvm\"•\rBL¬q‰Wû±jù>˜;>˜»sW\ÈÔš%-Y5\ÔUýÄ»\Üo‘\â\Ì\ÓbÅ™J\õ\"3…yG\É\Ì\à\ô˜û\â\ö›\Ù=\ñ\È\ò7\rþ’¾\è\ð|\ì?._tx>eã–¥]“û\Ú\Û\Ø\ã\ô\ËhM|\Ø=2´\ÎÆŸƒJ-é‘’\äp\ß(Œ\ãiÿ\0‹´\í\r;Co\ö;Ÿ§”\Ä\ô\Êü¡=\Äqvˆd\Ó\Ó\Z\Ú%LLr;•=™1;\Ç-{5ª1\äV´I}KþÄ•Š[\Æ\éû2Pu5O\Ü\É¯©2\ò»$)\Ç\êŒf½\Ç\Ý\Ó\äp~\ÇÄ¿\ê¯D/b\ÏÇ£\ô\ö·¯\ã\Ó\ØüzyHü	/Ñ”†{è£·\È\Þ\Û,´x³Ùž{\Ò-\ÒzG\ävT{S/~\Ò<›³ºE!\Êf\ëØ¸¹{›–G\çƒ\é’^]“\ö.EÊ† \ÐÜ«\Ø{%\Û\È\Þ8—†-øÈˆ¬œ\òF«!FhIG\"¹µ’/“\æt\êi\î\'v54ø\Ó%$²G\÷?\Ítß•\É,9UûŠJ3\\²Žx->NÖ²\Ãù;¢³Ã•È§Y#¦¹-+\äÞ<rzfÓ‰\Ú\ê\\’µ\ö”¶\í\nKn\Ó7k†mž\Æ\õ\è×§¸\â^\ÓÔ¹\Z\Ú\ZÔ¶…—\ê\ö$þ\Í?bx\ÝN4-	Ð¤¶‘“\à\í{\Ô^Ÿ\äÅ•_\Úý\É\Ãuk\Ý\nJ¤”‘»\Æ\ë\ð>2Cù2c\Ü\'kØ†Me…?s¿ª\ôBc\ð3\ñ\éø°¼z{È½\Å\à\\\ÙtS\ôl³\ÉzBŠ<³\òy~–\Í\Ñei“\ÉJ\Ù\Ü(F‘e*-\Ò6ŠI\õ3\é·\äúc“…kÅ\Í\ß\îV?\Üú‹›)SeD¨Ž%\â«\ò5>F©\Ù8Ë’Y1\Ón\Ñ)\á¦øG\Ì\é\íx$Ü±\É\éG½Hùx\å\Ê\àÿ\0/\Ô<r\âF»\âv7´FW	q/ø)¼9Ÿcpk%†N¯µ–´_/e;E\ÒlR\àqúd´8q´Æµv…(\×(q–¸n\Å\Ç=ú~}+	\éq²6š¿aÁªtBZ–™Žj¤“>¬{^\Çk©i‘\à‹¢2bz\Ú<7ü3Ek\éd\á\÷+^\èŒ\Õr{h’\æ\'\á^~Ÿ?Wƒ¤Í“J¢\ó\å„†%\'Q\îkQ·¥|¿OŠüo¬\Ãþ\r\ðÎ«¯ê¦›Ž—²\ä’J\ÛQŠm\Ò\Ù\ñŸ„|·\ño„\õ½Í¿—þc\ñ\÷\ÒM\×rWJQþ\ë\ß\Ö\Ï\äþ?\Ñ\\zU›\ã\ÑGmú9;~¾=ih\òù,VlÙ²\Ý\n+µ\Û\ô\î\Ù\à\íV\Ë+l¥e³\É\ß2ª(¹\Æ\Ç\Í\ÍÖ–\Ån¿b\âÿ\0:+\é\ö6}g\Ò\Ù\Éq*}1.^Ì©Eš‹7^\æ\Ü%\ÆxŸ\î<=CGÛ‘nEû2\Ò\Éb.«¦¿)l—Ož\×}I{Ÿ\æ0¬‘_\\™\n|£\æbj¶‡\á/lš-YkE5lï¢¾™\ð8;\ðW\ì\ÅW\áŠÆ˜¥ûž\×\ì_\ô¡¡§i\Ó<L½¦JmS1\å[\Ó\÷2bw\Ê\ZÕ‰Ðž™¯c&.6‹\ÓþÌ„ÿ\0\ö²pû—r\÷!5¯\ì/\éGø>=G\Äeþ,‡Á\ç“¢x£\ñ&¾zùŠ=ÿ\0û~\ê\ñ\Éÿ\0‡?\éþ/tÿ\0\álR–/…uY~_O\Ó\á\æ¥<\ðÊ¦ “X\ê8>f?µ/©\Å99<á®Ÿ¦\êºø†:^»\â_\àÿ\0‰üù\ô?D\ðu¾~X\ãQ\ìO¤\ÔTj\Zu[\àÿ\0|g\áÿ\0ø§øm…:\ï‹tÿ\0Œ\ßQÕ¾$1\Ë\æ\ô8\â\òK7ûi\ö¼‘{®R\ö?Á\ñÿ\0ÄŸ‹\õ½ø\'þ]•u\Øþ³d\Æú5\×G\np\î„\ÝGÌŸ\Ñ,‰ct¶\Ôe__“üûÿ\0ÿ\0æ¯¬øcøŠ¾™\ôK \ì—ùŸ—\Ýþ\×Í¿—\ßþ^Ý·\òÿ\0R_øy\ÓÃ¢Á\ÓtŸ\áitøqü;$%\Õt\Ý<\òJS\ë\ç\ß1\ä]\Òk¦kº2¾\ÕS¥$¤ºL\ë\ñ\ô¦U–8\\%\Ý–¦ûiùU[G\ã\×^·~‰+bŽOC{~¶P½(²—ú7B‹¤92\ÝÎ‘J%›7H·Eª‘J\ÙrskHm¹±%9¾jŠ]¥¥\íVwd¹¶S³»e&}\'Ò¦\'Ü®¦‹\ÇûL\í\Ï^\çnX\ËÄ´vMM/\"Ë\Ç\Ê)\Ëþë„\ðu/¾\Ö\Ë]\ñ_”KQ~8\íoi\é‹U’+\èž\ÎÝ®ÿ\0Ý\òyÜ‹ElµL\ïV‡\Û#¶š\àu­¡6#e\òQ\å4\é–XÖrX\Úi\Ú#?4Æ©¦5Q™®mË¸i™pºš¹j˜¤…/g´©™1r­¯\Æ9»\Ò\Éûo\Ãz¼]Ãº\Ìý/S‚Jx³`\È\á’\÷Œ–\Óý‹|s«ø\×\Å:¿ˆuRŠŒ³\õY\å—#K„\å&\Ý#¬\é\ð\ç\éº~«6,]T3\ã†GåŠ’’RKRJQ‹§\å\'\ã\ÓF½S\öŠ\àv\ÐÕ“WL”žØ†\Ù^š<ÿ\0M\Ð\Í\rp7-±\Ñ[*6l¨ª\ô¨·\ä\Óg\Ô}-—\" ¨¬J¼‰bÑ¯\änr¿sý©¿d^GfŸ¥b~•GÐ‡Q>¹\\M³\éhcS\Ç%\Éþ\Ìe\å22\é£&¶\Ñþ\åxb‡P»u³·<Z\ò¶v\åŒ\ã§b\Ë\Ð\ÆSÛ¡Bm\ÇD´¯‘f\è\ÌWÚ´\'˜»d¼ý\Í\rO^5Gr\Þ\Èv\Ýlµ\Ú\öŠ•\"¤nú^Šz\ô¾M•\éC[$¶ž\ÉÊ”D\à\õ\"M\'dr$§\ÈbŸ\Ñkc\÷\äM+!%´B.âŸ£\÷?ÿ\Ä\0!\0\0\0\0\0\0\0 0@ÿ\Ú\0\0 Õ«X ˆ–\ÞuŸ\âOoGOOgOLg3sµX¯U•Šª­´š«FÍ¡\Ð@§+R²²­m\Öw`eZ¢$ ˆˆŒ\óŸD\è\é\èza\àoD#\Ó\Ê\Þ\\½n.\è‹m[[DU`TVÐ€+@©YX5F°> eZ¢BDD~™\è\ð\nxa\Û\ö\ôB=2\Í\å\å‹…\àˆ¯\é³m\Ý\Ý\Ø\n°µ@­J••+ZÒ´‰\0„²°\0B\÷ë§¶½½\í\ìL´½o[V\õ\ä9\"Ž¶\ÖÍ¶n\ô:\Ø\è+P„Ý¬\ZSŽ´+Ÿ\"V!¥`\0\0\àø\ç\Í\ì\í\ðG¢=½1‰jÞ·­\ÎS´Ö¶m¤]l@\n\×\"þÿ\0b[‡‹ˆ©Y¾\÷ª\Ê\Â	XJ„&\0z†}G¬\òt\öùc\Ò^·­\ÎS¹7[nýT\0­:[X±jOùÿ\0\ç\â\â­Az>U•„!	R²°€@øx>û:{“­„|=±\î\Å\ë\Èrœ…\Ët¯d:zekP­k‘mu\Þ.?ù¿\æ\á\ã­c\ö%B„¬¬!+\\›\ôÞˆub=	G¼½y«\Ë^JÞ¶ª3:3IZÖ¡Rkk]\ë‡þnù¸©Jû™\ÖÍ¬ 	YYXBWü{¿]1\ð\Í\Ý\è\ó\'59i\ÉK\Ò\õµr0\"¬¥kXV\Öf\Ïÿ\07\nTø\çê²°„\ÂVVV‡\Ã;\ß\ò\Ön\ì \ë\Ó\Û\ë:\Î\ÂrW’œ”½/NJ\Úf3W+ZW.«‹‹Œ¡\ÇZ›\Öt\Ì\ó\ÖV„\nÊ•„!\ì\ë&\÷fbg\Ô^ž$\å§%9)zrV\õfÅ•­j\Ógx\Î:\ñÖþ©XBk+\0t|s\Æw“=o“\æB=¾7«œ•\ä¯-y+z\Ü{­iPŠ±•8\Î:\ñÖ²°ÿ\0ea+J\Ê\Ê\Â\ï>9žI½¤O\'‚=\ñ˜zY»\Ö\ì\ä¯%y+z\òVåº­iZ\Ô1Š³gx«JÕª%‡üD‡AYXJ\Ê\Ã\ígœ‰2gƒ\Ã\ê¤U\ó½\Ç-y+zrW½JÒµ¨¬L:RU,XµZžs\åXB		YYYX}Ž“¼\÷‰\Îgª\Åbø\ßä­¸ù)\É^JÚŸŠÖ F1™™J\ÖV-[P¥Bn\Ìù\Ö‰T•+\á™\Ø\ï\Ù:\ÌÎ»\ì\ñœ”\ä§-9)j5*H\Ï\Îd¬ªXµgiZ\Íß½aB°••„>Y\Þ\îü·fd\ÄÏƒ\Ö\îŒßŽJr\Ö\ôµZþ`g\å«_\Ê$ýVR´­\nµC>\õ„!•+)\Ñ\Ó[\Û\Ö\ï{»7\ÈýYº\÷¿¾J\òR\ôµl\'\ä\n\â\"~Z¥kJP-V…`\ô}€•„%a++)\Þüw|nøÙ“3­Ý™	™Ù½nû;œ•\ä¥\ëjþ!˜\Äü¥£(\rekYV©4\ïz\ß{P\n€j\ÖWÁ4ø\ï{¿$\ó¯–[\êz½y+\É[W\óù(Õù\ÆXee+X$ªX±b\Û\õ\0\0€++\à\ïwvn\ìføß‹\Û7zÙ½k\ö:Î™\È^¶¯\ó8šµþmQk‚%‹,_úO\Ùa\÷»YXB••*Wü\Þ½\ß4uw­ù>HtÍ–/C‡ùµxÿ\0\rZµiüž6Ÿ’	b\Â[úS¸\Ö\ï7\ôB„!++o\Çwáž·w\Ë\Ð\Í\ôû|\é33\ñj´h\Õ\ãx\Þ?\åü\ÚZ\Z5ü\Ï\Ó\Éý¥JÖ¥A\ë[<-¹¿¸T\Â+++ºù}f3µ\ëw|‘\õŸ\è€W<±??\Ï\á£F-G\âxž62…jþ\Ç1\É[\Ö\ÅÛ¼#\È\Ú\Ömú\0!J•}\Ï9™\Ó\åû\çXüªV¬U:ÎŸ9ùj\Ñ\ãx\Ú<oF¶Wþ‡þ\éV­_\Ù\È_u³fÖµ­ú\0Àÿ\0„‡ŒLfý\ó3†e\rm3:zÉ¾3\óùhÑ¥‹¼—\äZGP\nŒ\Ûún\ò[–\Ü\×\æþÀ\È\0B\\\ðu§olcí›»\Ñ\Öy\Ïu¬fgx\ö™\Ñ\åˆ\ÖüV\à¿\r\è\Ð\ã8Nˆ\ãü\Ú69_\è\ÝQ\â\æÿ\0\È@\0!C\ï¾wUc\ñ|Y\ÖV‘\ët™7\Î\î\ïY™¥¸o\Ãn/\Ç\ç\óùü4·\Ãü\åüÚ±³\ÉýDa\ÙB\à{Uø>vM\éH¡\Øbîšº¾p0›º½k-[qÿ\0/\åü¿›Eµ›Û–\Ü\öÿ\0¢\ß\ô\Ûþ«\Õoúÿ\0\õˆŽˆƒ\Ñ\ö:Þµ›‹\à‡xÀfY£Ê°„\ÕßŽ\ï¼\ëŒe¥›7½ù/\Í~ks[ž\Ü\ö\çy¨\Õ´„!\ð\ä:c\Û\óz\ÈtL‹»\Ø0\è\ï3¬\Ì\ó½dKK·¿%ù/{\Þ×µ›Ù²\ô5DGH\"\'ø\Î\ñ;:\Ï;3¢a7lTG½]:\ß[2n\ÌÉ»\Ö\î\ïy\ÞZœœw\â\ä\â¿øo\Ãn+q[Š\ÜV§B\"#¢BUª|\÷Á\Ö\î\îÇ½\ë=2f	g&\ôW\ò\Í\è|n\Ì\ñ™™\ÖfgÁœ”\ä¥\éz^·­«jÚ·¥\éù!ˆB••‡øY9™“03°#\Ö03\ò„Ÿœøg\ë~™™1­ø¯\Å\É\Å~;\ñ¼v\ã·ø¯\Ãü‰T\ìD•••‡œ\Í\ßg{¾2fL\ë1\è\ó»5•‰ªt\ÂY\ï2=n\ô|7wwvZœœw\ã¿\Ä\ñ<V\á¿\ñ„¬„%e`\ìÞ·z\ß\'\Ì\ë&dU„\"0\ëL`\Í\ël|q;\Ñ\Ý\ÝúZœœW\ãx\Þ+q[†\ÜÂ°•„!	YR°\è&\÷™Ÿ5\Þ\ó£¬\Æ3`Ea\ÛÖ¯b\Ä:#\Ñ\ÖgZ=½\ä\Ò\õ‰z<o\Æ\ñ¼Î°„!J•+\Ö\Âfg”ú„:b\'\ä®F0„z]\Ì\èVa\à„I\÷¡Ù»7èŸŸ\Ç\á\ãx¿•a\ôXF­Qý~«\ñ\æfw»Ö®\ô³B1Œ:fgD;c\é\é\ëvoŒ\Ì\ñ¾3\í4„%J•‰S\âùžM\ÕÝ›\Ûue•Abtu«\Þ\ë3!\ëww}®\îú\Ý\Ý\Ý\Ò=••+´‡\Äû†yÎ´›»\Ö\í¦T@`±\è‹[½f\ì\Ï{\Ù\Þg¤ø0„ VW²V·\í»\ÖùV\01\ì\ð\õX±2=\ëft™\Ñ\Öa\ÞfwŸ\÷™žˆBVIXB7ü;°\ð\ötø\"\ìc\õº\Ç\Ù\á;‰\ï:\Ø;¾2g\Ã:•š$!$\Øþ‡o€dÞ‡^·¡šŸ\'²½?\Ö\îü\ØL!\×\ëHB„\Ì\ì{>;\Ø\Âj\Åø>“\Ðú<>žŸ\ñf|³#\ô$\n€B\é™\ó\×\Ù7¥\éHÇ³¼‡LÏ©\Ó\èùo[\Ö\õ™7ãŸ­Ý€P\è\0<o\Ã}i\Þú\×\Ëf\'ú™¿\Ò|4N‚•+R L?ÉŸ\">NŽ\ð\íøÏ®\î\÷¿`!\Ð@¨B#\ã!þ,\òFgoGG–?-fú!\å#\Ù\çw­\Ý\í<oD\0\0\0€Mÿ\0[\Öy#\Ñ\ðGü\'Á\ë~\çw|=h\0\0\0\ëf\ôý\ó;>{&\Ã\Ë\á&zfû<\'œƒ\ã3\î\0\0\0C\â9þF¢>ž\Ó\Ù\Ù\à\ôž1™\Ðù\ÌÏˆ\0V :\0Ï–ü—£\Ë\âw½‘W§\âL:Hy}o\×\ÙPnˆ‰o\ß\ë~[\à\í~\n_¦\î\ö\õ»\òC­?A\ì|¦x\Ñ\Ý\Ý,[\õú-ú,X¶®ú<wÀv¡\é\ðv¿\òx;\ØD\Þ\Þ\Ç\ây\ß\Ö\÷fŽ\ï\ë\öX·\ë\ôX°–,XN·býˆ\ôyaƒµ\ØüO\'ƒ\Î\ï{\ñÞ–\×y?µ\è¯0\ô˜[\õúý\î\ï\ë\ô\"%‹,X¹mš\Ã\êM\ò|Z\ö\÷Ÿ#§±\öù\ßkkZ\ömv\ç-?\é§ý5¿_²ß¯\Ñm\Ðþ¿[¿¢ß¢Õµl 	™\ñß‘,\Ì\ï<ø\ß;\ðÙ±Š\ËVÅ›\×\ôr”ÿ\0«þ\ÏýS:\ßÐˆ\èþ¿E¿BXkj\Øw\Æ|2>“\ò>O\Ïw\ôÙ»,·³q²6þ¿\×û\÷f\î\îþ„DDj\Õ&|w\àz=gOÀ™\Ù3ü\Û\Ó7n\Û\ôÙ½\ËY\äTmz\Ùþ\Çq\ñ_‹¥ý~¿_¡!¥kZ•Ù¿#ü\Ì;|ÿ\0>\ô\Ö\ÔF3XŒ¿§\ô[\Ö\×ý\ò§ÿ\0|\Ó8g/<lX±aT©JV\åŒfû\Ó\Ë\àÿ\0\ß—üI\Ö\õjZ¬c?LKœV¥Ÿ\ç+~^R\ìc´F­eegkS\à|wÁ\ñ<1ø½L=½\ñ±ùØ¸\Æ3e\â\òW”ý~ÿ\0ÿ\Ä\0/\0\0\0\0\0\0\0 0@!1PQ`A2B\"p‘abq‚¡ÿ\Ú\0?\0\ì\Ëz\õ\Ö*(\î\î\ì½Gžb´•Ö»º\ô$v.\ïAG{Yr\Ô\å½O¡\ò\Ôy\ó\ÓZK\rP\ê5ƒ\ÅY`\ðQG53\"\Ë\Ñ9j=ŠÁâ¬£Š\Z\Ì]b‹tûÃ%e \ô<\Ç\Ò\ZúÁM—±¸±Q\Ø\Ôg˜)ºª\òWY¬¸ŠŠ-o>–\óX<ž\Ûly+½u\ë.\ËÕ–N\ëlc\ôWu’\ÑvX½³\ô¥‚»Š8²v^°\òZKn´o]\ä°y+ug·G°>Ô­\çŠ±6h½\é¼Ý€Ü®Ö·.<ŒZ\Ùz\ìŽÀG<À0&\ËHzÓ°\Äp•”Yra\Ó»›Ü‹8´\Ì6W\'J.\Üû8°\Ò0\Ü}\ÊD¦\Î\Â\Ân=!`³:BÀJiž!2£\ÝÕ§+=¢Š©Q•(+\Ý\ÞÄ˜ºG±q\Ç` …\Âa\ÅE‰•Y•}\ÎOh\ã€A	„\Ã`%2‘)”ˆ \ïj<–/P\ê<D¢‹½;±ƒ\ÐQ\âL;Q(³=\åGµ{u†a\îcA\Æ2]œ\Ã\rŽË³=ªºÀÅ¿A°ƒiÏ°u	À\Ùv—º;ÁÚ\ÐQ¹]\ð5\Ý}\É\í’\Ü;-\'µ½‰†\à\È\ï°½‚\Ø\r\â\Ö{¥wº~¦£\Ð\çŠ\ôc‹\ì<ûÀØ»-‹\Û,_£?\ì‹\ôa\ìkvýýo_¢=7‘Ü½‰·×¢/V~„®;\õýÿ\0m¤«½Èƒxl³\åÝ–\Í\\‹\n ;wg\ê*x‹­ˆ„@`:¯E\í_j{Pa#\ägˆi\ë„CLr›\ð´Ÿ`\ñ°1tž`=%T\õ‚.\÷^]\Ï\Ì|\Ä\"Â¨GI\æ\ÒUD2ª¨C­«ùj\àø\é$øÏ“\âý\ô‘ÿ\0!]Eƒì¶ƒeuP³\Ä4\ÃPŽb.FS>\0jýuüz¯<úÿ\0\ìüJ\Å?ª)þ ù‚\×\×F:}®n\Çª¸A«ã©¡J%•Ó—øŸ\ËEUü< :ž4o—üqùu\ÕO	\â\áiq.\\\Ó\èùƒ>>/\êý>\'Ký¼<(\ñ/§\Ñ\ðÿ\0\×\î~%< \n\á\ê\çY¿\ö\õ}:\õ\ç)%\\ZN/QqE€0ˆ*ž!¦y‚¨-U\n©(¿š®/’¢O’\\ª@<_\õ\Éf \óÇœY\óÇž\ÕhýoW6\åDa©ÿ\Ä\0!\0\0\0\0\0\0 0@ÿ\Ú\0\0¹_? Bbˆˆ\Üv\ê\÷~/U1Ñ£N˜h†•‡¢™™Œ\0Ž‚€*’1”\Ö8\ãŽ&&3<,®	UUP„\å\æú|N\Øh†²Xh\Ös)‘˜H€)†5\0uŽ8\ãŽ8\â—cU*ª•*¨A*]ø=¤gFˆk(ÃŒ¦S)•IF5F2˜\Ê²\ÍcŽ8\áŽ \Z1	rµ\\\à*€!£\Å\Ù\Õi\à\Ó\Ñ±\Ù\r:4DLŒ„ªª£\Zu[ªy\Ä\Æb„\0\nª\ñª‡@U\ã{»\â»z8x!\è\Ð\"dd8üü\Ò|Ñ‰‹\ÕU*­\Å&3LLp\0\÷h\Ð\0\0W½\ß/“d%iÓ¢Ž‰™\ã_.)\0‰K@”«wv€A\Ãq\0\õ\rµP\0øn\Ô4‰£FÓƒt@\ÞFX¸üü¢PmŒ :\Ë,²[\Ð8Ÿž\â\ÕqR\àP@ „!\é\ö;J6Ñªa+FžoH”™Lµw¬˜\Z\Ë,²]ÑˆLq\Ã\ó\Ãq\è:¾\rV‰@<]_5³Š„¤\Ñ\r°•Ã².\Ø\é™L´°rt<²\Ëu@J\Ã\ó\Ãq\ÇÞ«\æ·T!t\ð\÷wÉ¦ªŒvm†¨Ó«¸¦–\Ýd\ä±\Ú\è,\ò\ËaTq11Ò«Šª—\r‡o¸\ìæ¶•i‡9;¦S(\Êt”,²\Ê\\\0†±0\Ç\ô¯\Z­„*\órj¶†ŽÙ“p\Ù+3!)S3\Ë,•@a‰‰Œ%\öJê¡¢UV0‡\ô\ö›4svÌ›„ª‰ZfB\"#e–y.€,\Õc111„ \ßG‘\rV\ÉTB<¼¼]ø\ØÃ”Ù«^2X@\nª•U2²\Ë<•\ÐX\á1˜\ÂÄ‡5\äl•*´<½\Ý\ß¡—w¦::5–€Â²‰”ee3U•Pn\î\ñ˜Lf(‰kº\ò!ª<]Usz\r\Ý\Þ\Æ&”\ÖP\0<X™D¬œ\æqkŒ22\Æb	¥ù^\è\à†\Ï*\Ýj«ƒW\Í\Æ]Ž˜GƒH	[v\ÇY\Æg2\ÕÝ¬\ã11„\Ä£»•Wc	F>•UUU]$¸Ë»¸<ª sU\ÇYJ\Êdde»!B3ˆA\Ê\îV\ì\â\à‡U\ÍWURªWl`Ý\îƒ\Ñ\ÕFVQ2222•+\çf‰Œ\Æ‰1\Õsr¥\Ý\Ê460„<\ê«uUªª\Õtˆh†ê‚¡\Åx;q\ÈL¦Q>~j2¡¬\\\\\\\\R™]\ê\÷r¸†¬F\á\á\\UUUm\á\ÐÊ©F’‰Th”_Lx¬Œ¦Cùü8üü¥T \ââˆ™§ú}™bK%ŽˆCÆ«Á\â\÷Uºâª¨jøeWO7”\Èøøqqøqø?‡\Z‚dfffgþŸ\ëþ¦bBB\"$4B\ôª\é|*‚ªª´£“D»\åŒ[\ã\å\Ç\ãü\Ü\\\Íüþ\\\\\\\\R\ßúÿ\0©úb\âbb€nª¶A²\rˆ‰üWz»—J©Uº­^\ïd4G¦dÙ»½\×\ÏË‹‹‹‹‹‹Ã‹‹‹‹Ž8c†–Ž?‰ùUUqwb<‰|kW\Å\Çwn«ªeøa²ra	r\î\ÈK·LqpqqpqOƒ\ò?\ç\Ãþ\\?\æ\Ç\ð0\æ\îú ~†\á\0þ^\Ù\â‰\ÊË²ú\Í\Ñ.Ü¬â¥­ý]\Äø?#\ò\Ç\ó\Ç\0¿«¿¯¯¥\â«\ç\ã\à‚h„!L…Ó«\Ù\ržI§l6xg“•T»\Ñ	r\Ø\í”¢}\×\ß\ß\Õ\Ê%ü|\Ç7\ö\Ëþœ¿\ëÿ\0\ì‚&\ÈA!üLuA¢\Ñ\æ\ò\òqw—\ë–<\Õi‰\óUR\õw\õg/ý\Ùý\ß\Ùý\\Ü˜Ÿ!»!A¾—\Å\ÒUUUo)R Ý‹’À•IUH1\ÕË»¾\ZµUU•\ó\ð~g\åþ$ œ	C‡W\áLxª\0\æj.\Í„#Z­Ui\Ð\Ø\ÆV\î\ì\Ê\ìg\×\×Ó•Ï“\ó?3\ó?3\ò?#\òÿ\0\"†ˆB†\ïd·Á\Ó\Åv1<”UhŠii\á—{­]\é\ÕU¾\0\Ä\ÄÀÀ\Ç\ä\Ä\Ä*ˆ\0h„ †\Å\à\ñx±Û¡\Ý\ð\ÅQU[ªªùù§F¯UUH‰UU]Á”\0BeÁ°„D!­Tª\í*¨·R»c	j\å\ô·Á#\Évíˆ•U«»¿«»¾*·wwb\"#»!B„\Æ\Z4¯VuFCµa¼¦N\'É„¶X¬	fC\Â1Váª•UUUµ\âªP„5r\å\ÙLa\r\Z=UV\î\î\ô\Äeý\î\Óü\ÐmŒ¿š\Ûƒkr’¶&‰U\ÂË•\àhDn\î\î\èJ!1†\Í\×w.\á¥r\ÖPH\è*0\Û,\ÕV\Ø\êˆCF©\'UR´‚#w_th\ÑCf\ä4KUŒeØšfJc\rä’£be\Õ\íƒF\é*’T©P4swwwt\0\Z!¡=\ëd®Ylt&_NvŠ¬ =\Z»`\Ý\íRˆl\á#ª®,e\ßUUÀ\ÂÕˆ‰üd»e\Ë\Ó*ª’‰sÅ†²—C™A\Úln\õP\ðH\é=¯Švh†‰D!\éz½žUULª #*c¬”\Ë±–J•R\ö\Ê\Ý\ÕW4zºª\Ñ\r„?ˆ•§WB¾jUGL\ÇJ\êœMù£O]Þ†\ö‘\ÕUK½‹£F®	\r½Wz!«+wLÅ¶]Œ\Ëduk|S\ÍW‚<^«‹\â\ïu»†\Æ\õ¯2\Íma¦2˜\Â:ª•Gl¸&‘—w~Tšvq^.\Ér\áHC\Ö\ï¶1Ñ£’:]¥\É´ª\ážn’V\ï\Ô\Ý\Â€B\õ\Óª\0l”«¢:B_.Î“Dˆ„5U\ÅÞ²¸<®\î\Z!B}kºeJ\0\Õ];\"V«¦T!«¾+wwrÿ\0„\Ñ\r^«Þ£\É\ÉUmwc\å~£ª\é%\Ý\ê\î„4h„!£D¤\ô­ºvz²\Í3Èš Ž\ë†R%j\î\Z»¿D!¢\Z4K\ô®/ƒÍ‹”\ÂXøUK\å7P†¯ONªª«C»\è\Ðh\Ñg¥\Ý\òm{c\ÂÐŽ\ÎO#º\ÝK\á5[ªª£›Ù£F€G\ð\ßK\Â\ÃG,c¢B8w|šHÊƒ(\Ð\ÕtùUth\Ð\09¯\à\Å\ÙÁ\Û\Ê:!²¯Ly \î\ö\éŽ\îú¿\0\0\0\0\ØU\Þ\Í>A\òƒDxcˆGT#\ê\ÇWÁ\Í\é\Ò$M]\ÝÞ®\\ 11\0\0â¹¨p\é\ä\Û\Èsq\ÕGUL5AU\ÒT®­\ä\êøJ•\Ø\ÝË†? ^[^/£wÀlŒXlŒuQ\â¹<+’UT%wiº¨•\óU,nî‚«»\ì\àð®Žº4\ÇU\êùV¨\ñ¾k\ç\ç\ç\áü\òü\Üx­\ÝÞ¬\Ý\Ü\Ó\Í<>\çf\Õz:7\\«ÖªP\ÏÃ†_–_“„¾/c.]\Ãw/“U/‡øh9¯c\ÅW5ª\î´@!?~Y~?\ãwwr\ìn\î\ïWpîžˆÿ\0k\âÿ\0§Š\â¨‰_\çþr\î\î]Ë±»—d%xÖ«¡þ‡–\\x4y\Z%Ul*ªª„¨‚~\Óþúú\ã±\Õ\Ã`c\âKÛº\Ý?\ÍI£‡“—\Æ\à\Â%K2Ñª¡\Ç!ùÿ\0\õþŸ\Äü¿\ãŽ\õ?¿ü\ß\ò2\î€b!.ût¾¯‰¶!œ‘¨j“FBn¥9\Ä*~Ÿ—ü\ß\óeù\Ñ1\Ä\ÓÙ§F\Ï\"1\è\Ñ\r1†\Èù\Za§ÀM£¡6n¦.)>ÿ\Ä\0.\0\0\0\0\0\0\0\0\00 !@P`1\"QAq‘2R#aÿ\Ú\0?\0Â¨½\Ç=\Â\é;Ö¥TZW³¬ƒÄ´Š» \öl\èª“;–{ç¯ˆ¼k\\+É…©\\)Pp¯~aW\\\ÐxEq0¨¼KŠ«ž\'s‡\0k_XÎšÔ¾©¾J±¬–.T²¹\í«T¶— z·³8Z‡¡W+Ÿ/{\ó¤\ôjŠ\Ô\nùl¯jzL\Ü0=™\ÓZgzÂµ\Ãk{#¹\\v¨.\àˆ“€½;\nî‰ƒ\n\æ	‡\Âþ\ÔT:.\áT›Œ7«—Î‚\Ð\n	‚o\0¿:J£Ñ¸p @€ \nÇƒ‰nw*\ç¨\î(‰DJ £\ì!\ë\Æ\n0L	ƒ=ŒR;c\ßp\õWž¸\ïW\óUR{\ÜÖ\Æx+w;–‰qÀ½\ÜN8H\Æ\è=\ÍmªŠ\åk½\î\Ãrt\ÏvW\å\ç\Æl©®0\ð;\ÕU]l®\Ö\ñ:lB\ØOW>\ö\Û_!xž\Îv\'¶>¶%­XŸZ\áµ\nŸ<UC\å\ê‚\Õ.< ¾\"ª= 4y\â{z\ÕX¸/‰@\ò² \ñE©½3\á£\ÄVË„<@\Ý$“K$\Ó\0f\ðefWÊºÇ¤³6½D\âYGÜ\ìÅ‡Rý	\Ä\Ë\Ê ¯\×\àþ¨|\ãT•ùFXì°«•p8º\ã-˜\è»Ú\ö?\ë“_\÷\Ãû\Ç\Õl&´ÿ\0Úœ\íe\Ì} HeMû™›¶o$\ä\n\0\×\Í4–^¤\ÒIof»£¶R[=À\ÜÙ†\ãª\éml\ìz¿V[39\Ê^\ðNV¤¡/»\Ê\'·?:\ó\ô›+;Nÿ\0Pv\Ð=ý†l\Ñg\í\á)\î’PlÇ¥\ëú}¶ŸÏ¿½ŽÆ½ý¾{}L¿¿\Ú>«hgšy­{‰´\Ó8Y*Y\öx#\É\ö\æ3\Í\Ó\Èm’\rü¬è­«+Þ™\Ðt<d\\>¢Cgk(šS\äÁüƒ=$ž—O –_€\0¡O4³\Í(&\\Á^2Y|dHü]%UQÊŽ{s ªÿ\Ù'),(7,'','Korallia','Frenette','KoralliaFrenette@gmail.com','$2a$10$hK0IiUa2pbJ0Y6W20ZSNwuPLRbwexVW0Qs2Bt/StEs/ivtaRFX.4G','mpf','2370 rue des saturnies','St-bruno','J3V 0E3','','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `ventedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `userid` int DEFAULT NULL,
  UNIQUE KEY `vente_id_IDX` (`id`) USING BTREE,
  KEY `vente_FK` (`userid`),
  CONSTRAINT `vente_FK` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente`
--

LOCK TABLES `vente` WRITE;
/*!40000 ALTER TABLE `vente` DISABLE KEYS */;
INSERT INTO `vente` VALUES (1,7,10,'2022-11-27 11:17:08',1);
/*!40000 ALTER TABLE `vente` ENABLE KEYS */;
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

-- Dump completed on 2022-12-06 20:38:21
