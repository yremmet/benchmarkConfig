-- CREATE DATABASE  IF NOT EXISTS `mensa4` /*!40100 DEFAULT CHARACTER SET utf8 */;
-- USE `mensa4`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: mensa
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `Buildings`
--

DROP TABLE IF EXISTS `Buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Buildings` (
  `buildingId` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(511) NOT NULL,
  `timeOpenFrom` time NOT NULL,
  `timeOpenTill` time NOT NULL,
  PRIMARY KEY (`buildingId`),
  UNIQUE KEY `ID_Building_IND` (`buildingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buildings`
--

LOCK TABLES `Buildings` WRITE;
/*!40000 ALTER TABLE `Buildings` DISABLE KEYS */;
INSERT INTO `Buildings` VALUES (4,868,'Mensa Bingen','Berlinstraße 109, 55411 Bingen','11:00:00','23:00:00'),(8,150,'Café Bingen Rochusberg','Rochusallee 4, 55411 Bingen','11:00:00','14:00:00');
/*!40000 ALTER TABLE `Buildings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Buildings_BINS` BEFORE INSERT ON `Buildings` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Buildings_BUPD` BEFORE UPDATE ON `Buildings` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Buildings_BDEL` BEFORE DELETE ON `Buildings` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Building", OLD.buildingId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Dates`
--

DROP TABLE IF EXISTS `Dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dates` (
  `dateId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  PRIMARY KEY (`dateId`),
  UNIQUE KEY `ID_Dates_IND` (`dateId`),
  UNIQUE KEY `date_UNIQUE` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dates`
--

LOCK TABLES `Dates` WRITE;
/*!40000 ALTER TABLE `Dates` DISABLE KEYS */;
INSERT INTO `Dates` VALUES (20,286,'2015-11-16'),(21,299,'2015-11-17'),(22,312,'2015-11-18'),(23,324,'2015-11-19'),(24,336,'2015-11-20'),(25,348,'2015-11-23'),(26,360,'2015-11-24'),(27,372,'2015-11-25'),(28,383,'2015-11-26'),(29,396,'2015-11-27'),(30,536,'2015-11-30'),(31,547,'2015-12-01'),(32,558,'2015-12-02'),(33,567,'2015-12-03'),(34,578,'2015-12-04'),(35,744,'2015-12-07'),(36,755,'2015-12-08'),(37,765,'2015-12-09'),(38,775,'2015-12-10'),(40,853,'2015-12-11'),(41,905,'2015-12-14'),(42,922,'2015-12-15'),(43,933,'2015-12-16'),(44,942,'2015-12-17'),(45,953,'2015-12-18');
/*!40000 ALTER TABLE `Dates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dates_BINS` BEFORE INSERT ON `Dates` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dates_BUPD` BEFORE UPDATE ON `Dates` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dates_BDEL` BEFORE DELETE ON `Dates` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Date", OLD.dateId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Dishes`
--

DROP TABLE IF EXISTS `Dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dishes` (
  `dishId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `ingredients` varchar(45) NOT NULL,
  `priceStd` decimal(4,2) NOT NULL,
  `priceNonStd` decimal(4,2) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `fk_buildingId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`dishId`),
  UNIQUE KEY `ID_Dishes_IND` (`dishId`),
  KEY `FKofferedIn_IND` (`fk_buildingId`),
  CONSTRAINT `FKofferedIn_FK` FOREIGN KEY (`fk_buildingId`) REFERENCES `Buildings` (`buildingId`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dishes`
--

LOCK TABLES `Dishes` WRITE;
/*!40000 ALTER TABLE `Dishes` DISABLE KEYS */;
INSERT INTO `Dishes` VALUES (53,310,'Pommes frites','',0.60,1.10,2,4),(55,437,'Allgäuer Käsespätzle mit Röstzwiebeln','Ei,Gl,La,Sl',1.95,3.60,1,4),(56,438,'Lauchcremesuppe','1,La,So',0.25,0.45,1,4),(57,439,'Chinesischer Gemüseeintopf','Sl',0.40,0.75,2,4),(58,440,'Spätzle','Ei,Gl',0.50,0.90,1,4),(59,444,'Paniertes Schweineschnitzel Schweineschnitzel \"Strindberg\"','S,Sf,Ei,Gl,Sl',1.80,3.30,0,4),(60,445,'Gebratene Möhrenschnitzel mit Spinatsauce','Se,Ei,Gl,La,Sl,So',1.60,2.95,1,4),(61,377,'Gemüsebrühe','Sl',0.25,0.45,2,4),(62,403,'Hausgemachter Linseneintopf','Sf,Sl',0.40,0.75,2,4),(63,345,'Kartoffeln','',0.50,0.90,2,4),(64,449,'Putengeschnetzeltes \"Züricher Art\"','1,La,G,So',1.60,2.95,0,4),(65,450,'Vegetarische Frühlingsrolle mit Sweet Chili Sauce','Ei,Gl,Sl',1.60,2.95,1,4),(66,451,'Champignonsuppe','La',0.25,0.45,1,4),(67,452,'Pichelsteiner Eintopf','Sl',0.40,0.75,2,4),(68,357,'Reis','',0.50,0.90,2,4),(69,453,'Schlemmerfilet \"Italiano\" mit Tomatensauce','Fi,Gl,La',1.75,3.20,0,4),(70,454,'Pfälzer Dampfnudel mit Dessertsauce \"Vanillegeschmack\" mit heißen Kirschen','Gl,La',1.90,3.50,1,4),(71,353,'Broccolirahmsuppe','1,La,Sl,So',0.25,0.45,1,4),(72,455,'Berliner Erbseneintopf','Sl',0.40,0.75,2,4),(73,407,'Paniertes Hähnchenschnitzel mit Champignonsahnesauce','Sf,Gl,La,G',1.85,3.40,0,4),(74,408,'Rigatoni \"gorgonzola e noce\" mit Gorgonzola-Walnuss-Sauce und Rucola','Gl,La,Nu,Sl',2.20,4.05,1,4),(75,409,'Kartoffel-Möhren-Kichererbsen-Eintopf','Sl',0.40,0.75,2,4),(76,410,'Schmetterlingsnudeln mit Schinken mit Tomatensauce','2,3,S,Gl,8',1.95,3.60,0,4),(77,411,'2 Kartoffel-Käsetaschen mit Schnittlauchsauce','La',1.70,3.15,1,4),(78,412,'\"Minestrone\", italienischer Gemüseeintopf','Sl',0.40,0.75,2,4),(79,413,'Kartoffeln oder Farfalle','Gl',0.50,0.90,2,4),(80,414,'\"Kötbullar\", schwedische Hackfleischklopse und Preiselbeeren mit Rahmsauce','R,S,3,Sf,Ei,La',1.75,3.20,0,4),(81,415,'Asiatische Reispfanne, mit Gemüse, Pilzen und Sojakeimlingen mit Schmand','La,Sl,So',1.55,2.85,1,4),(82,416,'Badischer Kartoffeleintopf','La,Sl',0.40,0.75,1,4),(83,417,'Sauer eingelegter Rinderbraten','R,Sf,Nu,Sl',1.90,3.50,0,4),(84,418,'Karibische Linsen mit buntem Gemüse und Ananas','Nu,Sl',1.45,2.65,2,4),(85,419,'Blumenkohlcremesuppe','La,Sl',0.25,0.45,1,4),(86,420,'Schnippelbohneneintopf','Sl',0.40,0.75,2,4),(87,462,'Rotkohl','3,9',0.50,0.90,2,4),(88,422,'Kloß oder Pommes frites','Ei,La',0.60,1.10,1,4),(89,423,'Piccata vom Seelachs mit Kräuterrahmsauce','1,2,Fi,Ei,Gl,La,Sl,So',2.20,4.05,0,4),(90,399,'Broccolisouffle mit Kerbel-Karottenschaum','Ei,Gl,La,Sl,So',0.00,0.00,1,4),(91,424,'Tomatensuppe','',0.25,0.45,2,4),(92,435,'Farfalle mit Tomatenwürfeln und sahniger Blattspinatsauce','Gl,La',1.70,3.15,1,8),(93,443,'Schwäbischer Rahmbraten in deftiger Sauce mit Spätzle','S,Sf,Ei,La,Gl',2.15,3.95,0,8),(94,448,'Paniertes Schweineschnitzel Schweineschnitzel \"Strindberg\" , Kartoffeln','S,Sf,Ei,Gl,Sl',2.30,4.25,0,8),(95,460,'Putengeschnetzeltes \"Züricher Art\" oder Reis','1,La,G,So',2.10,3.85,0,8),(96,461,'Schlemmerfilet \"Italiano\" mit Tomatensauce, Kartoffeln','Fi,Gl,La',2.25,4.15,0,8),(97,478,'Paniertes Hähnchenschnitzel mit Champignonsahnesauce ,Reis','Sf,Gl,La,G',2.35,4.30,0,8),(98,479,'Schmetterlingsnudeln mit Schinken mit Tomatensauce','2,3,S,Gl,8',1.95,3.60,0,8),(99,480,'Asiatische Reispfanne, mit Gemüse, Pilzen und Sojakeimlingen mit Schmand','La,Sl,So',1.55,2.85,1,8),(100,481,'Sauer eingelegter Rinderbraten Kloß','R,Sf,Ei,La,Nu,Sl',2.50,4.60,0,8),(101,482,'Piccata vom Seelachs , Kartoffeln mit Kräuterrahmsauce','1,2,Fi,Ei,Gl,La,Sl,So',2.70,4.95,0,8),(102,600,'Cevapcici mit Tomatenreis mit Tzaziki','R,Sf,Ei,Gl,La',2.10,3.85,0,4),(103,601,'Kartoffelschupfnudeln mit Gemüse','3,Ei,Gl,Sl',1.75,3.20,1,4),(104,602,'Bunte Gemüsecremesuppe','La,Sl',0.25,0.45,1,4),(105,603,'Irischer Gemüseeintopf','Sl',0.40,0.75,2,4),(106,604,'Frisch gebackener Fleischkäse \"Bayrische Art\" mit Zwiebelsauce','2,R,3,S,Sf,G',1.70,3.15,0,4),(107,605,'Knoblauch-Spaghetti mit Champignons und Tomatenwürfeln','Gl',1.70,3.15,2,4),(108,606,'Geröstete Grießsuppe','1,Gl,Sl,So',0.25,0.45,2,4),(109,607,'Spaghetti oder Frühlingszwiebelpüree','3,Gl,La',0.50,0.90,1,4),(110,608,'Hähnchenstreifen \"Chinesische Art typisch gewürzt\"','2,3,Gl,G,So',1.80,3.30,0,4),(111,609,'mit Semmelknödel mit Pilzragout','Ei,Gl,La,Sl',1.95,3.60,1,4),(112,610,'Rindergulasch','R,Sf',1.75,3.20,0,4),(113,611,'Tortellini - Ruccola mit Pesto, Parmesan und Sahnesauce','2,Ei,Gl,La,Nu',1.80,3.30,1,4),(114,612,'Lauch-Karotteneintopf','La,Sl',0.40,0.75,1,4),(115,613,'Spiralli','Gl',0.50,0.90,2,4),(116,614,'Geflügel-Currywurst mit Currysauce','1,R,2,Sf,G,8,Sl,9',1.60,2.95,0,4),(117,615,'Amerikanischer Kartoffel - Mais Auflauf mit Kräutersauce','1,Ei,La,Sl,So',1.60,2.95,1,4),(118,616,'Karottenrahmsuppe','La,Sl',0.25,0.45,1,4),(119,617,'Pommes frites Wedgeskartoffeln','Gl',0.60,1.10,2,4),(120,618,'Cevapcici vom Rind mit Tomatenreis mit Tzaziki','R,Sf,Ei,Gl,La',2.10,3.85,0,8),(121,619,'Kräuter-Knoblauch Spaghetti mit Champignon und Tomatenwürfel','Gl',1.70,3.15,2,8),(122,620,'Hähnchenstreifen \"Chinesische Art typisch gewürzt\" oder Reis','2,3,Gl,G,So',2.30,4.25,0,8),(123,621,'Rindergulasch , Spiralli','R,Sf,Gl',2.25,4.15,0,8),(124,622,'Geflügel-Currywurst mit Currysauce , Kartoffeln','1,R,2,Sf,G,8,Sl,9',2.10,3.85,0,8),(125,807,'Schweineschnitzel \"Mailänder Art\" im Parmesan-Eimantel mit Tomatensauce','2,S,Ei,Gl,La',1.80,3.30,0,4),(126,808,'Bandnudeln Ragout von Pilzen und Zucchini','Gl,Sl,So',1.95,3.60,2,4),(127,809,'Roter Bohneneintopf','Sl',0.40,0.75,2,4),(128,810,'Bandnudeln','Gl',0.50,0.90,2,4),(129,811,'Geflügel-Nuggets mit Sweet Chili Sauce','Ei,Gl,La,G,Sl',1.70,3.15,0,4),(130,812,'Spaghetti Gemüsebolognese','Gl,Sl,So',1.95,3.60,2,4),(131,813,'Spaghetti oder Reis','Gl',0.50,0.90,2,4),(132,902,'Hirschgulasch mit Schokolade','Sf,So',0.00,0.00,0,4),(133,815,'3 Stück Reibekuchen mit Apfelkompott','3,Ei,Gl',1.80,3.30,1,4),(134,816,'Spätzle oder Rosenkohl','Ei,Gl,Sl',0.50,0.90,1,4),(135,817,'Spaghetti mit Sauce Bolognese','R,Sf,Gl',2.05,3.75,0,4),(136,818,'Holsteiner Getreideröstling mit Lauch-Käsesauce','3,Ei,Sw,Gl,La,9,Sl',1.60,2.95,1,4),(137,819,'Russischer Krauteintopf mit Rote Bete und Schmand','La,9,Sl',0.40,0.75,1,4),(138,820,'Spaghetti','Gl',0.50,0.90,2,4),(139,821,'Seelachs paniert mit Frankfurter Kräutersauce','1,2,Fi,Sf,Gl,La,So',1.85,3.40,0,4),(140,822,'Capeletti Rustico mit Basilikumsauce','Ei,Gl,La',2.60,4.80,1,4),(141,823,'Rheinischer Bauerneintopf','Sl',0.40,0.75,2,4),(142,824,'Bratkartoffen','',0.60,1.10,2,4),(143,825,'Bandnudeln Ragout von Pilzen und Zucchini','Gl,Sl,So',1.95,3.60,2,8),(144,826,'Geflügel-Nuggets mit Sweet Chili Sauce oder Reis','Ei,Gl,La,G,Sl',2.20,4.05,0,8),(145,827,'Hirschgulasch mit Schokolade mit Spätzle','Sf,Ei,Gl,So',3.70,6.80,0,8),(146,828,'Spaghetti mit Sauce Bolognese','R,Sf,Gl',2.05,3.75,0,8),(147,829,'Capeletti Rustico mit Basilikumsauce','Ei,Gl,La',2.60,4.80,1,8),(148,851,'Fränkische Kartoffelsuppe','3,La,Sl',0.25,0.45,1,4),(149,918,'Hähnchengyros mit Tzaziki ,Weißkrautsalat, Fladenbrot','Se,La,Gl,G',2.50,4.60,0,4),(150,919,'Gebratenes Blumenkohl-Käsemedaillon mit Kräutersauce','1,Gl,La,Sl,So',1.60,2.95,1,4),(151,920,'Gemüsesuppe','1,La,So',0.25,0.45,1,4),(152,921,'Gemüseeintopf','Sl',0.40,0.75,2,4),(153,959,'Gebratenes Blumenkohl-Käsemedaillon mit Kräutersauce ,Reis','1,Gl,La,Sl,So',2.10,3.85,1,8),(154,972,'Cheeseburger oder Pommes frites','1,2,Se,R,Sf,Ei,Gl,La,9,So',3.15,5.80,0,4),(155,973,'Spaghetti \"Primavera\", mit Auberginen, Zucchini und Kapern','Gl,Sl',1.80,3.30,2,4),(156,974,'Wirsingeintopf','La,Sl',0.40,0.75,1,4),(158,977,'Schweinegeschnetzeltes \"süß sauer\" mit Asiagemüse','2,3,S,9,Sl',1.75,3.20,0,4),(159,978,'Quarkauflauf mit Sauerkirschen mit Dessertsauce \"Vanillegeschmack\"','Ei,La',1.50,2.75,1,4),(160,979,'Cordon Bleu vom Schwein mit Rahmsauce','2,3,S,Sf,Ei,Gl,La',1.85,3.40,0,4),(161,980,'Zucchinischiffchen mit Ratatouille-Auflage und Mozzarella mit Tomatensauce','1,Gl,La',1.80,3.30,1,4),(162,981,'Tomatisierter Bohneneintopf','Sl',0.40,0.75,2,4),(163,982,'Spiralli Broccoligemüse','Gl,Sl',0.50,0.90,2,4),(164,983,'Tortellini mit Käse gefüllt mit Sahnesauce','1,Gl,La,Sl,So',1.95,3.60,1,4),(165,984,'Spaghetti \"Primavera\", mit Auberginen, Zucchini und Kapern','Gl,Sl',1.80,3.30,2,8),(166,985,'Schweinegeschnetzeltes \"süß sauer\" mit Asiagemüse oder Reis','2,3,S,9,Sl',2.25,4.15,0,8),(167,986,'Cordon Bleu vom Schwein mit Rahmsauce ,Reis','2,3,S,Sf,Ei,Gl,La',2.35,4.30,0,8),(168,987,'Tortellini mit Käse gefüllt mit Sahnesauce','1,Gl,La,Sl,So',1.95,3.60,1,8),(169,995,'Hamburger','1,2,Se,R,Sf,Ei,Gl,9,So',0.00,0.00,0,4);
/*!40000 ALTER TABLE `Dishes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dishes_BINS` BEFORE INSERT ON `Dishes` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dishes_BUPD` BEFORE UPDATE ON `Dishes` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Dishes_BDEL` BEFORE DELETE ON `Dishes` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Dish", OLD.dishId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Ingredients`
--

DROP TABLE IF EXISTS `Ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ingredients` (
  `key` varchar(4) NOT NULL,
  `description` varchar(90) NOT NULL,
  `seq` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredients`
--

LOCK TABLES `Ingredients` WRITE;
/*!40000 ALTER TABLE `Ingredients` DISABLE KEYS */;
INSERT INTO `Ingredients` VALUES ('1','Farbstoffe',623),('2','Konservierungsstoffe',624),('3','Antioxidationsmittel',625),('4','Geschmacksverstärker',626),('5','geschwefelt',627),('6','geschwärzt',628),('7','gewachst',629),('8','Phosphat',630),('9','Süßungsmittel',631),('Gl','Gluten',633),('Kr','Krebstiere',634),('Ei','Eier',635),('Fi','Fisch',636),('En','Erdnüsse',637),('So','Soja',638),('La','Milch/-erzeugnisse',639),('Nu','Schalenfrüchte',640),('Sl','Sellerie',641),('Sf','Senf',642),('Se','Sesamsamen',643),('Sw','Schwefeldioxid/Sulfite > 10mg/kg',644),('Lu','Lupine',645),('Wt','Weichtiere',646),('S','Schweinefleisch',647),('G','Geflügelfleisch',648),('R','Rindfleisch',649),('10','eine Phenylalaninquelle',866);
/*!40000 ALTER TABLE `Ingredients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ingredients_BINS` BEFORE INSERT ON `Ingredients` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ingredients_BUPD` BEFORE UPDATE ON `Ingredients` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ingredients_BDEL` BEFORE DELETE ON `Ingredients` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Ingredient", OLD.key);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Photos`
--

DROP TABLE IF EXISTS `Photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Photos` (
  `photoId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned DEFAULT NULL COMMENT 'Filled by trigger before INSERT or UPDATE',
  `dateUpload` date NOT NULL,
  `complains` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fk_dishId` int(10) unsigned NOT NULL,
  `thumb` blob,
  PRIMARY KEY (`photoId`),
  UNIQUE KEY `ID_Photos_IND` (`photoId`),
  KEY `FKtakenPhotos_IND` (`fk_dishId`),
  CONSTRAINT `FKtakenPhotos_FK` FOREIGN KEY (`fk_dishId`) REFERENCES `Dishes` (`dishId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Photos`
--

LOCK TABLES `Photos` WRITE;
/*!40000 ALTER TABLE `Photos` DISABLE KEYS */;
INSERT INTO `Photos` VALUES (14,739,'2015-11-26',1,53,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�g���P�F����6���Q�wHfoa����~\n������*�Tv�h�\\Qƈ�@0J�7zg����l�GS�UO��[��\nS�rYv�{\n԰�Ke[��I7�E<e�.ϥ;�V���Q��J*�w���g损	��;WD��cj��>YP\0�j��҅�s8��>�GS�+F(��1quZ���\\�;��2p=�G�������A�{E�,K<�����i.�Sc#3��(�\0���\0A�����j�\0g\' 7t�N�kKXs�,�2)F��`���\'N��ZܻTi6���tYM����K�G�k<�I<��)��r�US�h</�˛������%A8�?�Z�X4[R�oF2Nx��~��mS�۲&������VT��J1#C�}\rMs�p�L˳���������֧���J-�d��L�=;z�������b^�$ev9\\\0}s��t�5^����$��,p\0���=�Մq4�g��>\\��N��:�rh��S��FVH_�A��:Շ�{[fuQ���k�>���k�\n���F=����>�n@(�Ŵ\Ẕ���L���qW-���&y+I/\'V��Τ�W�(�?u@_�m���jt�YN ���\nԎ�bn�G	�@:�}�ƋH����k��1�Q�5��9��M��$��	58��=:�kRm����\"�@����p}jK��{�NĶ�X\'Q��pq����{{ł��dVݶ����`=:���۱�G��w��dln�y�Pc N�qߥr���̗��Q�V\"�\r����?�u� ���C*����,:��H�I�<gָ�c�$�F{05Nj�\ZQ�w��xgH�n�X��&�J��I����{�g��i�ztf(��LŸ��-���	,��e��{V�x��X|�iX���\0� �\\��S�N�F�q�i�[mA�a��0b98Wp1�\0~���փ�Yl�c��2����ǧ˟��kS�zJ-�� c2>Фq��G5���\Z$�l\Z�ܲs��9Њj��K��<���\Z��efYm-��de6�@�=y��M��%��n�����R6n��O|�Z�7���m]?�\"2��d��F�l������RysG~PB,Q`�\0��Mj�YR���1���5���|�@s�A��^��gR�6Y�\0M�<yC�+{����r�cX$���i���\nj�4l�%ī$r��F�\0�}	�A�z���C�D]3N:�I��0-��?0uzv�i�Xj)�FT�,c�Yc$c�������ZO|�ZWY��dCШ�n��?=�!վ�dv�����i��䞤�Ex��uQ���\'\r�z���w�xX��\"�Oʊ8\0We��)m4Qtb\r+�����	��#\\>��I{�(lc6�29P��^�m�[C�{�3JU��@=�?��T�&�F�#�ց�i �b�+�����:��N�ǜ�j�#U�S�y(�\'!r=y4�sU�,��l�S�N���	^��}+�X�ҵI,�mS�2�����F��v�\Z��ֳkc��T�J�z������4�ʓ0ȏ�rI��y�ղ��F�@gS�G<r:����,t�aVp����8==r}3\\ƫ\r��.�ieM۱��үBq�r���1r�W.=��$v�F��\\�Hq�*���t�x�l���\0�qԜsY,�|���IZ5�,��z���o&J�C�.qǭt����m��V��o{�y�Y���.�9��=kKRM$.c�Y\Z<�	68�+��PykEh����\0��Zhi2��1c��\0_��8�����V4�D�j�;mr\"�$P���ޯ�h��9v?�rG����L�5҇!�a�q��E����g�/�m���Q玨�i�]L��nj쪸v���$c�����sM�V�I\Z&�8w�DH�� px��Z\Z�e�46~H��~��8מ����CO��UyT�W\'�޼D���v��;����j�G/$+6����Ƴ�ß1����88�3M��&�mŪJ̏�����E7H�m=�0o.B#e=\n�~ �cZv�m���d�*�T��=8��ױV1kTyTg$�V�o�����\rl#�����0���s���5��z� ��;�b\Z#$��@(�W���+�4�9�M�e�g��P���c?���J�R%��YV\r�X�ӎ�U�I�����:����֯�e���y#��e�b�|�)=�$�\0�Y�kS��Ot�\"��?��\0� ���zMC��,�������\\z�j�e��,�I�/�\"����8�n�0�d�5�JTޥ=z&�2C�*Nᴁ��1�=knSɒ�G�+�L��ӭV�\r���Uc���>����8�1�6=H98���)�ܒ�Ly�1��ǅ@pI�\ZM2�t��fk�)��6��q��������kkiV�\n�{�J�i�*G����G֣kU�)!�N���O���랟S\\��lޒI\\�^��jћ&��x\\�\rPI�u�gk��կ ��3y\\�p��o�z����j�4�ܗV1�r�Sf~����֩k:�����H�$�t�ʺ�,>���ySJhי;�cG���,s�H\"L�V�O��:�˶�@d� ���U}*��^0pJ�+c��,qj:��f���|��O^�ⴥJP���eԯ	EM|H��N��#���Bl�p���NjG�Iv,��Y\n���6�s��ҹ�m,n����A�O��Wΰ��{]��ʹ�������.+N���F��X�Z��ɕ��Ÿ}���y�+Zĉ$D��[i�>�������Υk�G����1ק���)�$1[Ɓ�d��n�0{������t�\0y�ʬ��tZ���o�5�*��`q�����O�3ľ���N�bY�������=걖u��h�Dݕua��;ȣ���H��v�e�\0	����n��ՆD�M��y�y��Ҍ^癍Vk{u��B�G�=�{��ּ\Z���#�<�0<�;y��Z�\Z^�.�-c\r������=�^T���*��lh����\r�g��qT�O�r+���V����1��4��,�-!m�7g?�zȓ���Cp���3C�Z����i�\'+)?��\'��\Z��M3:���J��r�gH�x��Nk�w�\Zm��C�Uy`pF����+�x/4�	<G\n�W��\0��Df�H�э�n�yd�����E>��m�S������&��!s�������E/���m���P��t,��7m��Ϲ�J�4]t��/��vl���<s�U�\0Mo$D���J��=��?J��˨����9C2]�n:�)��;Lc����)��?ɪ�q�v� �,���@?�[�/E��UeE;r2�}��w�C���贋�6�$�kd�1�FN;w�Ww���ﭡ��;�ǰ=�?\Z�+�03FcI%V%�S��<�{u���S��R�F��$�;�%�k�=[\r�rz婇�2mR}$\n~�we��`�+F@<|���9�?\Z��}�:V�m����(�K+t��I�;|�x������L6�Q�n �f�� �v3�p=���� �<SsjXCo*��ѴgA�}kT�gs�Z�O�I�H#rUwa�=ʞ���%.,!��!$��$<���pA�k�v�$���5��\"�g��B�\0��j[?d�\0��{ֺ$KOs&�O���U*\n���8�����d\"�0G�^��x0Z�>�a�9�,�+��9��?Ƹ��8�nc��\r�20Ps���wge6��:Մ�rRF�\r�<�j�X��xm�l2�\\��pj�h�4o,�6�v���ګMw��$L��(?�A�����hI�{Ż���IO�c���b��{X��i�@ͻpz԰�]gR��a^f\n��������6��~�,�[6C4���v���%�ެ�Q�c���j��,Ѭ��(��Z\Z�\'�Lx�?�k7�{� ��XCmV��ϵj��՚��!z��\n��4��I��������I��0�I�$���=�Il\":���/ҮG<����J�.|1��\0hIm�ݻơ�|�=�\'>��ELT)��P�m���m�$[q�q�����D��\Z��xW�E��X.y��<�r��)���&H�h�y��J��j�e�G�4�\"\0#a��ӡ�H�)S�\n�W�(h�{����%����\Z�|�#n�:q��(�N�W��cs�ռ�5;�\r���U�&����8��}��|��^mAf��P��T�\\���\Z�V��:\'}�i�l�\0ǿƞ[]�.�`r��`��q@�d�c��R��������ތin�\0)��\0�b�WsV�=��, �n`���o���s���A�q�9�Әմ�SW��gO/�K�Fr	�S\\��x�ڊNWbr>\\����]�^ ����n�<�O`7p��\'5��ՙ�[��6�,&����1͊h���=J�C�{�gfh�`�\Z�x���\0��Co=��+��IQ\\�����[����f�Ռ�������ʃ�7�۳=2�Ey-Loi��B��N���\'�r�t�_ҳ�5��hn�\Z@�͜?\Z׽�O�9���H����#�)��d�����\0����ϫ]L��JM���Zս��i$��\Z?�#�3�����%ݥٺ���h��J�zɷ��)�y9��_�m\"����p�A<c�o9򫳓���|��D�����?��\rc�$�Xȣq~�*�Z-���D7V�y�.h$��8�9��pz݀�Ԥ�(�\r�I�Ʈ\Z5�E,d�������ee��|�|�0<u8�\Z͏ɄƄc]��\0�$�|}땰t�PH�&rX��:��/.�d���0�����*�Omf���ye� ��:���C¡0���g�\0��*���4�[L��/|�$%��C\'���d5�m\Z�U��*��x$�\"�c�����ֶ���FN)I3$�6�d�}2zUk�$��~�#���m1�9�-��U�2Iأ�b���m��pG�463��*O(�ߥFa$�v�D;�v��F��+u#��(�\0e��#ڮ,z^��G�M�W$���A\\W<aCF½i�-N���k�PaS!�� e?�~��#B̒}���pH=~��#H�(�w\r����(\n5�:�7������M7I�c��.���J��e9�=�=��k2b�uǹP�Y�|��}~;c޹�Ԧ��}t��fb?�,P,�s;�\Z�N �ΛQ����<2�\n� nOV\'���+�7P�ϕ�����@�*�6��A��x��*�YzrMc:��k$E-���^�Goʠ�/,`};�Ҹ����=�b�B�L3Sz��t�%�a!-�z�*�H��g�\0XĞ;LQi5մ��/�3V� 7p�ǉ$ずj�Y\\�-��'),(15,741,'2015-11-26',1,53,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�+_�-���|��Yp��� ��Z-�\rZ�m\Z]&��\0���[��].(&�Y�L)2E��������;��8�,�x\"���1:c�y�+��\\\\���y�\0�9���Cit�+�Ж,���PāO_��W�*~_\"F���%���Y��2�.��{HX|� ��h���Ƣ���ҧ#�i��r䉥8�0�Ӛ�mpH����E������]\'���SA%�Z\\���5��\0.s���7Z�V�[�a\"D݌��1Y��$����՛	6F�EA$�d������][O>��&�5�����W+�ج�ccY]R{������G8Q���\0\rk�ago�w�H00�}��b@�# ���\\���ӟε��6S�yzWe���4����Օ\'t}c��#[#	\0�ֹψ�q}��\0�Z�#�a#����\\��|c��,����8]�M崀�}H\0c�?�\\���\Zj_xg�W\Z�� K�wŞF�z�q^5,\'	��-��b������ԣC�����9K��ǎI8��XͣƧ$�Wso��vz-嗈Ibͥ˩I|�ʥ����+�q��\Z�p���߶W]����������\0\Z��߃5?Nd�yV�q%Կtq����\0[8��x��MCR\r��*���v�_�z�lH�����\"�5ڪ�*����S��t�X�m<�hb2\\�O ����V��n|�!��H��Z���@@��Q鞜v�(�>��kUXę��	����Z�Q�Ev*�j7im`ZFc��$��+>���Ɋ\\C\"�\'�>��>TZ��]LȈ�dO�\0?J�Y���#�v�Nr�E�s��+���gN�,ctztp��O��g��#g�����<K�޳̬I鎄~Y������J�myk)�*r�zc��Z�e�=\"��n-�f��T��\0��R����i]_M�Z�\'�>��X��W�,f���A8\0�u��x+P���\0�����PZN\"�\0����κy����j�̬�|���]�}OL��z��5��Ξ�q80l�0H��ּ�5�\n��v��Q�\'f`I��Z�Nk�+�K�Q�O��j��\"h$�	Q��	WF*GPE{�2�J�ZK���C�P}z׎�K�?�X:�F1�~�~��[	���=�����c�pN7F+�\0\\u�mn\'Ӧ���ɍ���PGz�[�z��\'rk�n2Vg;Gg�o����R��\\�c�2��%�L0[�{?ؖ�k�� �����C\n���d����~Es���+��}���)S�j��`� �4\nU@\0�Uu}b8�\'�@�����qߌ�5�6�K4�ss�Iɕ��G�NMr�$��~�[�����\\v��k�sQZ�s3�z����o\n���#�H ���=k�_겻�ua��ߗZ��=<z������$���(���������fH��^MlSs�4~튚J��b���f��^���o���@(\\�;~a��[mCT��X[=ě�碯��+��C��tsq(�U,�G�ea��^f3��kRKR==onW\rnH������W>�-�M���7���ޭQ�N�+�Hw� �R͂	�g�k��Ӗ��]Au�Y.��QZI \0#����W����Ҥ�U|��q�*i2j1���!۲�H;��s�k��f�^����l;Z?@�8���Ҡ񷎵8���w�6H�G�X�\Z��xx�?ۤ�̕�9�Q�s���ji�F&��w=�N���\'��Y�-�t_P�����ӯb�iN�����\'��{�\0:�ѵ�?��$J�\\�*b������\0�[��ΥuU~����?J���9^���\n�9w<o�~����j��>P}\rr^k#mpA�yX��Ŵ����*P�]r1����{\Z��~{MV��T�����~��a1Nj����aU7��Ϥ��#��:�^6*��S��w\\��M��w0�2!ې�q�9���qU�U�S&��F}��#߃X��<�abQ9⧆1\r�HܰoҊ�t�eъ���N���L����\0dmZ�t�\r\Z�!f�H����=2rG�\"��$&h�5f��㷥zn�c6R[1�;����q��ּl\\c{��)�4��Fh�ǋMx�Դ�Rtsד�����h�>�&�e����؁�k�Ԙi�-�\\ί%�n����85�����`b�����Ҧ�8Z��Ï��5\Zj�_m��è�}ij�J�;����y8���N�<w�-㙝�M��կKma��G$r2|�w|�H=??�ZvS�݈�o)>@����1�{�p��c�\nX}��v��O�F��{Z�4d$��\0�L9�9������-KZi���i�Vt�.IV��]Ū@�J�D��)�0�q�v�T�-���[C���~����I�i\n�r���AΛp��.xM�����G��Jѡ��w�\Zҿ�a���w�\r�{`���}\n-������N9�`~��tѺK�����0v�k%��4+N�W{��V�h�k������g��SP����J{�������gm=���B��J7V�	����akM���.��l�\0=��.][�����ք�\0v��f��43�����c#HFg��+��֍dl��� X7?�q\0OC]�ǝ5��4m�g͂8��\0��=㻈��e˰]�ʮc\r��1��kҧ&���J����u�x5{h��i�:���A�����	�%Dkhv�9�ް�KH��ю�%B���o�ב�\"�m\"���ZJ̻[$����Ua&���g+�CO�q\'��E Eb��?��W��;I4��(ǧ�}q�q�W��Z]�y�!h܌�Č�����Ǯ.�Q�-�y����66��s\\�R���Ƿ��*t��h�kW7!�$�-��0��iX�Q�a�\0=�N���P,M\r̸��M�O~\0���{F�\'�Y�y\0W���wbI�c�r����-�da@��_4~q�G)9�3��*m�/,�7ZT���$M�+v��u栳�u���	���������]$�>�c�?f��a���.�d$mL��Z�RSoCeJ�W�Ujzf��Y�q�v�gF\'�{n�c���Qe�K�aIH�Ϩ��W�x]��ׁHWg8>a��zW�����:�	-!3�h�3��ϯ����BR�b���=��ҢO����a���qT�\Z[}�X4�̢o��?�����\Z�[�P�b��l���FC����\\��{a-��Ev�6��rGO����+\'��K��K���-��v����߄P�w�G^Fk��n�-W��+�.��dv�~��R�L4��+��0����׽tV3A![YQB�\n7gq�\Z�R�6���E��g��a��\Zcɴ*�t��q��G���u0����8,�O־��n�n�jO,���H��_j���]�s��}��G��4��/ql�2�ṉ���\0�A��wV���H��p�(?�[2����ߥq�UY�o��ֺ�w�R�4�>Un%Tb:��\Zx���J�f�%��5��HO��|���&zpz\0�M���,\"�I�\\N�I�r	��}��=�[ѧ[�KU��px�ʹ��W�bi\0ee�\0������i\'�U�PQ;M$��2�kxV@Pe��=x�?���L�+��\0G���op�EgxO�-euhc�P(sʕ!��\Z��\"8��H�-^Nr�x�^��´|��xz�ܬ���59�ƍai\"Er���M,dp���|2�]�/.u)�t�)L*э�ws�޺�R�{M\ZH�Wf��\r���u�j��Qa��R7n}�������Y��M�Y�N1�\"K-��yv��ې��q�$�Y�\"�ž��n�\"�=ի��?������V��岶���� |��\0�Z��̽$0-��?Z�r�dS�z\\���r������pN�e��88�����ť��*�BC�[��r=�?AZ�7����[�2\0��	�K�0n;s���p�h�����*�ݱ�\0뭩B�����O�{����d�KM��K���9�j#�A,7�	%q��\0\"���yt�8��1��wh�<\Z����X�R%�Ķ��#�}�[�?U���3I��g}�kR%�i�&�2���#����z��ΑXi7w�Z(�P#\'������\rv��Kl���JOr���XZ��\rzI�)\n`}�����B0vN��YUI.��[*p{�_�m�3[���mr\Zd�y^r���U�Au�6�&6N\\�wT��sFV=\ZmN����T��*7��\n��\Z�P�QAq�<4a8|r�g�����?79m���.0	�7]��4l�=�Z�N��2c^ul3h��SZ�POmqd�]][�F\rk\\j�]E�&(�ƫ�N:g�W����Ly]l�&X�3	q��c���U��ɦy��Fv�\r���+�Xy-Y�N3�=_PӮ5I��`\'��x�\0=�Ӯ���������q�:���^{�m.�-啯aV��ҩ{���Z����6��%�ɑH]�1��.1��\0��~�Ç�8%(�k����{��P�.�3�C��5�u`�$����̾[�?�`}=+.�X��g���2A��pϠ�Xw��Ԝ%�|�?)#����������|�N*	�gQ�4�#Os��a�!���>�y�=��/��I9���?ʺk�)�e�m���;wzv�]�4�[���>�+u{�_���I_y见�S������Ȯ�{+k{s%�ۜ���SP7���e-���Aj餥Q�#���ܧ�Lng0�s\Z�H?xջ;�\0�{\Z�H�~�/݈��+��ҭa��H����#�+���tW2�D�<��)��\"�E\r���	�������;�5	��k�F����S\0�˫`�?Ү����f%�C�������o4��t$V3�&�ݫï��Ʋ\'е8��Fİ`�����\0=�\"���:���۱*����W�	�\Z�[�ף�}��H�>~T��>�E��+Y�<�F�w��kH�cb��\"@;���3���������f��o弎��QVH�������n}��U�j<@�m\"��\ZO���ՍH���Z�Mo��I�ou��&i$��f�\0�\n�9���۵E�b��5I��U�C�G&�_-9=����du��u=~�;{8�T��ֽZO�Wv�~�U�[�8���>��|$�H�n�\0P^:f���w+�^����2�%ζoE�Sy�����'),(16,743,'2015-11-26',0,53,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��L��6�;�@嘑��ߚ�3���Uݐ0��k��X�d�������}�ws��n4�&��&2���N+�T\\V������G�����8uuQ�=�#����h^i��8\\��$���*�g��{���c���@M`M3IH2#b@VS�;��?����eV���5�.�=˖v\n���`��I\'�Lcڣ]a��D��G!�J�^E��1�ΨC�D��3�ۼ}�L�,ӭܓJ\\�N+��,������Q��eK����֐[�8i���L� �V#�I��z��(�K)#���<����j$�����\nD�&d��L�v��c#{V��g]n���%H�q�#�5�މ�\rVm�TZ�V=>FI!�]�aT�_קj�t�?{�^���`i�� /^���o\\�a�F�r�vm��`�}�@�޹k\rͨE�1�6��\"��S�r��z�a�EsT�_��3��\"�7/_K�\0�4��v\\�#�3�\"���OLsT�Ӂck��Rn\\�S��=�\0¦����� ��\"g0� s��G��W��n�7wi�B���$e��l۵S����\niO٩;��W�=���[�ي�Im�w1!�r���Օ�;��O���H�\'\0?�qs$ڜ��I|��ys���=1��]Λekk�;�#�U��c9�<V�h&������5�e���{�����v�7�,�����޺Iʭ����zA��Ub��;y�ud�p(�\\�����]��4ѽ*�cyVg5�=SC�x���k�!�.�Y��Q��Q����q�ā\n�p\0�\0�s��Z9���$%r|��\n�y���vW�G\'���)�)�єl|�u9?�z�\0W�(��������la�=Ԏ��$g�*3��-;˒���$�ዪ���q����^��-l<�ur��Oҹ�\0\r[\\hf�R��kKo)�I&��f ��x<�\0q��u9`��ҌT���lc2�4��Qџ��*�.xR*�H�8�|WG��iZ��_\\���8����l-�z�=x�J�>*��Ăh�2Gl$h8�R<����)������QQ�G6o����K$1~�ٻ�p� ���q�]�����m�6JY;�H`6��f���^=JO�$h���ah�m�޼�ÿֽ-�x�N�#Ybbz�ba�\0�5�����jk75�ѻ\ZXT��`6��L���0H�\Z������{�f�cP%��7K&����PG^I�J�D�&�]2;�*L���L�\n��߭t��rY�/����� H�0Iu)9�98����f��ݗ�sX�����Ҵ�#�6A��u]�4�2c���zc�j��`��$�,[��C�>V|�G�c��/��KR��J�URq���ך��?����xoo��3溞���S��)7�4q�nX�>G%n�����kfk6��x��*A�	��~8����\Z��,#�ڗ�`w�s�h��pjp�I,غlX�ŏC�� ��{��\\���%��r�p� ?����D�ۡ�R��ݚ~+���J4�.�X�@��A�9��rk\n4׵�X\"�wX����gr~aמ�ڽ\r�bԳo��\"��p�\n���5\r�jN�s����.AO|���=�$��QSpKU��)9S��R�r��҈�o*$�\n���q�\\�m;I�\Zy$vb�K3I�8�ڸ�6�q6$bNI�n���oT����.�����Lc���ֵ�	BI����j囫�;Q����n�c�����\'ӦA��W[��[���s9Ys�X�;�z�5�xWX��\r~VL3�C$P�#�RT��?�5�Ǯ:l�G`W�9���R\rM;Y��k�xwH��m��m\0�ߒ1�=�z�umf������(9��r��3�Z[��m��m�)\"A�eԊ�����A�8H�{��Q�\'t�4J�:��4��F���WcPI��Snǩ��\Z��9�)$�\'�&��jV��\0طV��W���s�G\\�5ߊE��hQ\\F~`N3[S�����-���+[	^w?=�Ǜ&I;�p=���x�cϒ���\\�:�چ�������(?���>��]˛�C�p��q�Ċ�E>iY�����3���э��#_�U.�Y���������������!��|�,����Kisucm�6�bA�\0-6��܎;�	�[H��ZWHՖ�-F2�L��\\���i# ��W�Z|�-�Jْ�6�U²�c�?�qL�u;}OP���%���p�~}EE��R{=b�K�w3����ygl��e9�8��Bj.�G���~gb�\Z�]i/����e��8��=�=iږ�u}�M�jK�� \n��:�Ҙڶ�5\r���\n�\Z[�	m�$`�?Z�x�]���E����I.�������떭+ϙ���m���S�҈[�%\\�\0�ͺ�\r�\0=�R�{�v8�a�h��o��G��N��j�\"�-��e��#���X�U�k+U�{���&1\\p?�8�F>LR���B������I�6����$��O����h|<�!Y��9bq�\0Fk��񵆟,��:d׳��j��98ǰ�?�<��YM�����Vw�:t�:�<L�}��S�b�M_�͙|3m�B��P�\0^��k7P���-�pI��J�\'����!n�V$3���Fx9����ƺ�_�m���j��8��Z��V|ߋ�\0#7�A��#��O3\n���\0cjA�<�\'���i����,>+c#���s3J0$�,�8�\rK�;���\'�Ҭ�6AUUQ��6��ֿ��Ҥ��C�[�$��\0��9�+�����z�uiFs���G�y�tC.��N���P�*a���U��\0��vV�;�k��91� �H�$c=���\\�b;���C�e�6#; �g���?���I���S����3.�@`w*�� �g<�\"�N0����,&�Kï��Cyj�S714�]I�R*`�)�\\v#�?J�5��n�R�T�z��@#i�p\0�W�do��ahJ�Y�fxf���m�A`3�����ޜ�i�d�6���Ft9��\0v��N�y\"�\"�~��iԪ��7���\03���K\rE�Q���Y|�le�<3�N8��_L�Ŝ����̽:�ҧH��+t��� 	<����5�������]ڼ�3�0� F	����iJR�,�o��tT�ӿ5����z�Ŧ���,A�!G\'��?Ƴ�,��XOumi6��@��``�$�=z/�.��զ@�U�������U&�峷c��[.dy �2c�Kc������5��\03�Yr�J��҈\\L�_p\'��k?]�f���<નH�cK�{�͆I�`�*]v�k�(�2K\r�2�!�7�\0�c�j֜�my.S���5$��3gq,W���<�㧶zT�z6�,E-�k�,�8a�����LWt�.�W��OV�B�>a��d��<q�qڸ���KK���[˅\\�\r��\r�pv;�b��W�Yk(���\0���\'ʢ�ds3�����PHV�-�\\犹o���P�ܽ��#�$)��~¢��|Ee�Fڥ��@Fn�\'�c��\"��~\'iV�6��i�s8|�:���G�[՞:)*Vm�N�\0��)ӕ��[B�]7�VV����=X��=���5�H{����Rx5��E��\Z|ҡ�`Ul����ZMRm~��)�A2�\0�\'#�O�]��`����{�+�=f�\rO2G;,�c�H�9�O����K�z���w��� ܌E��d��q��t�4Vﰩb{Ȥ��PX<�+�\ZnYgr?:�Iƥ���UR�IS�-����|1�D�f��[���F��^pj���i�I*��R�\'`}����[7^7����Abbf��	(O\\n�g�r��n���o�V�Y����ӅJk��5^Kw�i�u����I��\rkx÷0Ous4i�G�ڝ�~�5hǮExSA<k��$��������߽Ŵ��m�,������WM)ԗ�.���8�^8�_��m�(��4{\ZR�%����Nº�}z;�&;��\Z�X��ݔ�/N����Sf������v�\\~5�������q�cU)N�:�3���8h���i#8܄�ʳu-?U��-����m���$�*B����9�Tv[�2C\"�dbC�T7�,u�]N��h�x]�x�POo\\���1��;�:}.�0�6�C$F�;J��IQ���6j�,�6Kn�=�8V�\0��{SG���k����4Ou*~����V���@Gc���k�xh�sJ#�y]#��~�s~.�mV����4�\"�Q�\0�<t�\n�>\r�a+�[mN�q�,F�H�a@�>���\0�Aqt�GOd\'������e��qm(󮭦Lgʶ��0�,[j��ں9�=�_r�\r�J+x]��[�PC<mM��\'�X�N�z�y�+��x��i�YX�O�Lj���3��t�kJ�Ws,V�!��0�r\0�������[��4^T�	]�@9y#�vR�Rw�ƭ9)mc_X�\"�ђHu�1n#@���$mèT�Ϩ�.�K����r���;���OV��\0\Z�\rSú^�,S\\�(���Iׂq�7��֛ky��H��76P��ť\n���9�\\����oe_Sl+�S�O��4�\n���a����yr�1�GJ%�Յ�R=���I����nއ�Ͻu��\0d4h�_[]�|��/9>����<s.#(Đ�����̞#��{���_tG��e,���YlYG>[nQ���ֺ������R�KVV��U�R�<����J���Ї�:��F��j�&P�&�=sZR�O���WJ�y��s�)�:���$��#�(��L��cJ�f��\"������W��w\0���W�[����F�m]�᱇yg���\rzo�tׇN�����KrT\r�g,@��z�ȴWl�Zj<���[�J�]]&��[y�yݑu���00{�w�s\Zȷ��#���������\\>���fԖU�se^V$�bpT�z��\0�u��I�?g�g_=X��1����W���Ϲ׉^�3W���v��\0�8��6�;!vDv�v�78�\'�Oҽv?��jlaؤ��C�$�����\'�:K\"���w�ƯxGSׅ���F�Z��Q\Z��A�Z�BU�)�Z�|,�*Μ,����4�(ʅ��p�s�΢k+PD��(%��I�{�r�\0o��ĉqs4��8��#�99�\'�\0�B��Q��:�ʹ\0�*#a?��	�;��M�2��qӖ�����\"���#�a��?Ҥ��a/����5��x��Ό�i��f02����=J�ҵ��bm�xv�M�w�?��k��\Z�^�͈�W,7�k��\0��P�/8�F}A�5�(y���<�;(�v%A����]��l-!��x]�Q��8�s>0ѵyu	�,���jB>�\\���H�����S��WM���͒��[�9dl4��N	�*G�5Z�,$)Ք[�U�U�#���\0�Y��m�Y�qa5�Dr �NFjh�J��t��42,�K�9=��끟W*M���b!�(Y4�.ʗK�[_[E���m�o.2999$g�Ҭ;���Z�%�V�H�]���P\0\nG��+�]��8Z7G#�xٷl��R>\\�L�O&�iq%���ۗ��Iua��򧿥s�*sJk��Z<�wo+�\0Z�1�*�Kq1�u~�`~�X4�$�0�;�Q����3\\���5��>�Y�\'��\0�]�R��R��@3�3���q�Nm�+ECC�t����]�5ĦT�-���㏭w��\Z~����nX�r��<����Jlb���x�\"��������^���턓��gY��\0�K� ���\0�]��k�������V�?��mb�OZ��y���%HY�{��)�-��aa(mT;��U�� \r������^���8%W�}������d�H��Y�h��oLb�U��+Z\\Ҥ��x���ͼ8���\"�����-��c�������y67�^A��F1�g��+�9�ed�OZΚ ���19?�8����M~�Ri^ǂ^^��+ƻ�G�{���]G��3�jo�J����?>�v��Vײ��XdC6�\r��lV]�6�}�֖i$��4H�q��V��).^[Լ�l��`o�\'Br��\0��+�ҵ}3]�Ih�g���޿�=�y���=���?����p��3N����T��Ls\'+\"�}\r*�b�p���v��\r�I�ys\0X�z|��<�eƕe+c|\nݱ��+�$�Z��;}R4p�+t�����_���B�})C#,����{\\�j:ęaܞ��>��)ƍ`�?�`P:�Լ5����:u��`r��oCRZ�yv�Ks0�	;q��A���F��q)V�G�s��Ҕ��\0�i{3\Z�e}wP�`Wɗ����d~f�=1��jE�`)^O�\0���:�7��D���+��.p���ҧ��l�N�y�Jѓ���Ó���N\rɵ���I���'),(17,867,'2015-12-08',1,133,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�<!��D4c�\0NP�\0�������xCF�\0�(�[�HV��\Z�%�3��%S�<���O���Y���=�Rb�_���=�ťi�7��\"����^��^��O�\\�uu+Mq4����Êڍ>w�y��_�C��)��0��g��zw�^�ϋ4��D�^D�l��ٛ����R=�̼��YG��,/{(ܰ��1���g�|>�\'���Ю����F�9~h%$c#��^���	�mj}-�?|�\0�5>��j+E?g��\ZM��\0ϽX�N+D�2?,z7�Ld�T����$�\0\n�ș:���L�O�3��)S�;�` �Y�G�@�L���#?�$�P��B��\0x���6�m���\'fI��2���y*��n�sCC��*(���Ϲ�\0\n��]}���H�ˑ����Q�̩u�$���o\n-�u��v̏&��\05�F��J���?����\0��7��k|t��?�!����7��k���|&�\"\Z1�����+t�Kg�?	���l�\0ϔ?�\0���*}�^T�&w�dy��OJ�k�[eQ�2��|*�0���&��6=+�����.��DĲ��2{����ܴnzWv>���=�@����4�q�,�0�ۗ�s�ޫ��\r2O_�[�Z^�ICH�aé�3�rEq��v�G�y��N�]7����A���!?c3p_[��FZ��jY��I8]âK�erQ	�c�r*�̱�\"�Y�RxU����u->�]-��������?�y����:��wN�{;F�L�2A��t�=�(6�;�S��ap���fI����-�>�����|u���F�j����H?���}F/\"�\0�a��מ�~�k(�S�܎T��{�}j�;�������Z�S�EŹ�Qڢ���i�WP�6�&D���|��\Zk\Z�\r�ᣔ��$�0�\0&�7Ú��7֭.`h�q�?J�\'y:�����v�������s�c��4ˢl�Iwe�[���\0ҷ\\Y�G�B�b?h@�@9b~�����!�	\"\\�l?��q�IOS�����\\�\0��C׿��o�\0��~���������\0@5��Fg9�G_�C�q�E�?�\0��;̂�r@隇@����eO�a���T���q�g�ys����h��g�2��^R�;�³��.�Ua�e�7�G�����uǻ�\'���X���]��e�ӞX�d�~ѷl�2���ֽ+��ܕiKS���t�r�0)\'��]�	��q$H��\n1Ұ�մkL<�����ӓ�U��V��K�y��R�������q�7��)�+\\��˟��W��1Еe$��S����(uo�ݸ�G�#,/���|������%�צ�[��������k[�\Z��i,%m��,�OR��V.��E)[��n�b��1���I\n,1;�\n����H��#kTӞ�Y��TǕ!=��c�K}�hm����!��9㞹&����s���_h�Ǧ_j�\ZJQ��C/���\Z҄,q̱ �p���?5_��h���|�Fd�9sڳᴔÁ �k1?S\\|���ҍ;�u�ZK6�3����FQ�a������x��$�N����P��R�m4��CŌ�&�q����S���+#�GS��m��Uʰ�s�\0\"&��\0^��ml`>���_ȉ�ׄ���[�#���\"O��w��l\0���Ӯ�%�#z�kO�m���C��Q��5����h�$R���>V�g�\r��C18 �b�D�m=�oP��)bn\0���@1�+�G�8��Sv;��\0]z4꩓V��5L�Tm7S�񬶽\\}�j�4�q	����1����d�����\'�l�3�~~�9�Om�d���E垩,�6vB�q�Z���e�^�=N��:-��Ox&K�!ǖ���c#��K��hq�{)ð���B�*�M����G\0\0?�K��ڏ��V���v�s�����r����A��iC]�����|�q��H�A�[��4��,�F����⺻���TQ���k��Q��oU�V�Mv���s����i�ʈb��{\n��N�j>c(rH���X�Am�>�c�����[���$#�3�qG�-ד\n� \n��j�������6s�\0\05���+ŧ	ց���a�\0�\Z�5%̵!�X���7�!zN����\0�\n�v�8�����#���E�\0�\n���Ā����?��T��-z\'C�7(�Ƽ��@t{{X�#�l������J���6�X��fp?�^l���5ۆ��v�_Df�o\Z>�{��d�$�C��R���a;y\n�V#@k����P� \Z�O�w�oR��E��\rܜ��^�s�\n	Y:��\r�V��7۳D�9�3ؙ�~ѭzX��ٙA��[*�4�\0`\r�����°m�rZιa̰\\j�Ȝ~��rWz�� u[����W�Ck{6�r�hZe��y\0c��\\���I��������Qdi�͕��)��ݹ���S<\nŬ#��IpI��[�5pŁ�a�~+�\Z4g��\n�O�f�=�[��`x���Z��\0z�c�!��ۆG�FA�_�����:��_�\0��֌����~�Ǡ��?���1>����$���]�\r�T����\0@�&�y9�Y����3��ɞq��w�K�$%c\"5�?�k�,�<��*�̦�Y\'<3�l{�T�������W���#�n��2�z��\n�X���!��,�-��b�$�8��C��բ�9f��6=?�Z�φ\Z����r����>U$�U��;�x�$����y?��k��4��	[\\^�v�SL��� ێ��?Z��\'���y������jS*���ְ[����%���\0Vޟ�C7ÿ^;�߮Rb?�`-�_�6����2Z�����^���;��[���O0�1]�!��͕:������U�th`��]�?ں?�K������k����̽	�s�	�\0�$U�q��SS�e#g��T�?e�kD��+�\'�#ҳ��i�^���}AⱼXs��h�\0Ӕ���i�9]��q���k#Ň>���o�\0�0��=���M�\0��3��/�U�6��V���rm\\Vf��xoK�\0ˤX�\0�O�,!�o	���uI���r^�:h����rF�M,8��rrx8��ßƭ�Jc֮��`�1�3TĊ�z�wI�SV`�8�i����?�)��=�Ԋ�`�U9J��#�y��xf���h�6\"\"��q�����	�$�u�a��� ���5mA��N[t�Xc\n �Aہ�D��Oz�����ҝ��&A�����})��,���r�g�޵�A�[�0c����\0e��+Vc��.�L3�D��K�ֱS��h��\\��5��e�fuG|�z՛Mn��O%^Hn;C7G��\rӱ4��v����p���Q9˒�\'�FHu\r�:w��7r�*�TO0>ؑ�n܇z���W;�L��<��sO)8����k�C��\0�+�y�\0�CY�\r����QH�\n�6�׊��c�M[.���/��k|Hrٜ����3�����tS/b�#�Oq�;�Ê���o���g��(�G�3R��5��J�3���K沕��)�GF��r�J����t�J�!�ee�Em\n�Z\\�4�%v�W�����B�,~Y�$�O/�=Im��uj��I\\�85�e���(��^��l�9��\"q���5��ɤ����CuC*7�	����Q�c�\"�N]�#����\0�[���h�\n����+εٞ�V��\'ʠ�WM6�$��4��>��]M�����?\Z鴛ˈtf�]E�҇e��]�#��\\��fn���X�^�?Ι��ˤ�=�s�ք����cZY=�=W�7��֚_Q�����i_�����N՞YO�}�1�).1�/��#��kȼ-��������ޠv���n���H�P��&ܼ�>�Cұ��̤�uW?|�1�����I�\0���~з1$ɒ�(a���9���\0���\0�f�{2��q�R\"��G5C�[�\'�]e���\nᣏ\'�@��ͷ�:�v6���熒E�f��'),(20,872,'2015-12-09',0,82,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�-��V�Q�*��p+J$��K\"5e\">����[�!�T��\n��R�]ȫK�Jx�֙,��n���	n�\\$Q.I���&ּ[�k�K���gjNk�n�f�o�7/�ij�V9�ß��\0�םG{ieeڧX�@6����nƴi����+�i�����?6Yd��o��^��z=~��\'�y�`�v7?�=��a�&����#�����7�b���d��ݖB���Ͽ4\'r�SI]���q�Q2W�Tm�Y�����x�M���/jB��$}j���̱qҨ�5-��m���Z϶\nӇ�X����Z���V��!�Z\"	��Jv)������ڌ�����MeD�y3���~u�A�_Nh$���?*�K]�,5�A\r�>`B]$~���c��f�W�v(<��S+�uДZ����О�M��s(��\n@=�M���L�l�4�O2Y�˔�8U�,@���e&��i!v�,c\'�\0\Z�O�:���B�R�\ncߞE��*.��\Z,�L~�l�3�4�G��<�F:����Q�R\Z��,\\\ZϚ>zVԩTfA�R�ѕm�V�F����z3���Hݲ�mVQ��7?�z|���ZKu;�$.��\0��4���yu�\0��8����lg��\\v��+Z�w�ڌ1�6�v��q���&C�=�Ş2��22Ku!8w~��+�<S���翶�ؿȼ�r��]����s�?�z��#xN�Yk�R�<�6F�>a��5�(A�37Zp�Y��~���yr�����־��k���s+�i���	<�\0#^I�u)uyd�p�J��-�����Cĺ���i�Mk>�\n7�p�#�S�uˣԩb��m��p3��R����о\'X^���.8�N�?�~��[^�^!{i�z�\Z�%�Qi�JED�$b���PYZATfvF�T�5,L��� rkB)GL�ʱm��G�W┃�	���4��dW�ST��� u Lz���]2�ŲEy�\rPM�Zة��s{3���8�Cw��Ÿ�I�9��b	c��a����\r� e�\Z�Ln&ڶ��һ�}K��OuhkGr��T�o�^h�!pq�C���MU�O��#˕���\\�\0��[�ݘMhw�	1�y+E��?�z�u��u�VN��_�k��k,i�\\�\0��\\c$���8�o�<��|���\'� ��܅���<�yQ�V���{�6����[�1�U+�6��0�E���\0�\Z�{�.�r�pC�Tɖ���V��{���G�&�dB3H�����C���\ZH������b�0�k����D��Nf���j��sY�6�zݰ�����q�Yv����� 4��nz׀�B�k��\0픠���W�+w�|��;��k�ӓ��;~lMm�%��!a��zQ�M����ԧ��B����Wm\'�`�r�+9%\n�7B*�Ǳ�pw&>`=+h���>��Ӭ�iY�8�&�~¸��s��u>�!���gs\n��r*�;���b��s�FX���ri��e\'��^x�8=����b@ �0hm腘���1\r�v9�yOcX�C�������e�\0��垫��\0?�wmppk˾��ڄ��I�7#ц��z4��m�ML�rlH�$����w���R<o��ި�;z��;�v�Us���T֌Z�pې������:*��k^�с\'\ny��XsIN�^���Т&`ç��:���I���@�~��]A�ȧ*=��c����5�̹yH�m?�5[K%}��d�y\\��@�?\Z�kw�����ܡ#�A�ix{+�}>^H�a1�|�ҨJ�I,�2��ň�ɣ�t�@1\"e}Gj�F��[��\'t���Y�XX��T��b]�ʌz95�Sz��$.�s��w�+�9cڕ\"�) f�_SP�l�>�Wv�;�d������8lc9����>٩���#[�7�����<���U�{���R��߄��i��i�F��7@�~#5��9���}����@�~�}8�~U4��ƙ���ؑҚѻ��Ԋ!�gܟ֚���ey��oA\"�Cw*mބ�z��5�1�\Z��\n1�f�rw:�Q4�$���g<����N?zÞ\Z�M�	�z��/�Fn�G5�JW1�l\\�)%uǘ�2)�M���U����?Z��2Q�?:�\\�6��V�fe�v�y��4�0[��MF�����E�p��)s0�������s�N�}j����7)�}����9�V��l�4c$}�Z���fK�y��z|���eG�M�pCT��>�(O���c\Z��i��8�R٤��1�I^��T�\\G�|(�M�Yfo�clH����^�d�Mxwë�ms{$r:�����9�kГZ�*Bέ��Is��tu1����S]�뙋^�%)*��S���D�����l|���2v[d$61ޭH�68|��5���v��#4���m=�z-Bذ\0��c��oS�31��PY��Z�5E��v��C��$��u��\0_���x\"!��݆��\Z֎�uv1�$F9+�L/����Mc��gr��~�?θ{�i��$��\n�gWC�c1�L��<R�	?�5&�R�HX�A�kmrH���F�\re�CH\0<�zI��F���2�!���_ʯ�j)v�{o��\0?ι����WM��Ճ�B�[{�Lg��|�j��ODv�[{	n6�Ӱ�{��&���6�2k\Z�\06QFJr�J>��s9]��P������Ps�N� à#��������8��r1\'��5&����'),(21,874,'2015-12-09',0,82,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0۲_�V�.*���z�E8�ɏ��;�TQ�O\0W���Ĳ_�Z�1Ka�#��\0���5��C�[6\"C���}+�H3Y�}�J�VT��T�	��]K|㊜@�9��[gRE\0��s�Ԫ\n�Z�Мg�j\"�#n1�h��m�0���PjV�h�>޵*`�7��W8�]� $zU&D��7�\")I��-�L�pX���+����\\�jH>ݫ#�Ջ ta��[�G$�]��sa��+�����c[�B�x%�V8+���.�j8�s��u���-�����\0��<�򭬚1g�	t!��;��ZU=ұ���b���!����ܐÓ�\0�I�;	��j����4�����{T0J*=|�v�9?�hh���^R\\䓒OsS�}0)��N*�i�q�`w\"5�\0dT�P�H㰩�\0FM8��2OABC�FdPF�KvQU��i��\'=V��\"�n\\�`[s��)�	�k�ˏ��W�!�R��?��OU�!��� ?Yvs�]�aFl�s�Q��s:�S�Qy=A�\0?Z��I�h�l=?ϥ-�2�ls��\0?�k��	�S�MQ\r�+YO�]�@�s�ӭt6����|Ź\\��V��G&U�{γ�љ��c���δ���}Qb�P�4�?*�\n����ק�S���G���X��0�*�*r��>�\0�Op�		H���QVW:i�M��pj]H��f�C��O*j-fo.�O���U�s�U�XP�OAP�����U���.{VV;K	�3rOAJ����\nX�����ڬ��y���|�����w*[Z�#�֮*d�����//��*�!�\"i��P�.|� �=+�mF�OQom�Qʠ��Gq��Y �H�n�Jlv��h3jf%���+�-ܷ�愜��mA]�]~�X1�`�	�\rl����)9��X>�Ʊ��q�댫�{@�� U�;c�L�)Q|�TX�����O�M�1�Ω�$�r�XB\0�����Ԧ�7 �2 �?O��cj���CC�9Ϩ�v�L:�O�j��O��}1�\0֭$��u.I�����d ���S)�E:��XKp]p��!;3��L���W��cy�X���*42:��.T�B\rY������*\Z:Ԯ����,j�i�Vd����@� ��G�Tg;T��j\"�GH�b���j�a��Y�kp�@���ւx�D��ڛ�W�E�(A��S\r�ڽ�ȭd2��үH�\\0\0Pjddm��}�T�&��*�X[��E�Id�\n1�S��H�$��\0�S�~_��~��q0?�9�n�I�媂;��x�\0j��c��I4�r?��I\r��9�����Z�˽��\0���x�n�����զaQ_R�g(*�\rT!pR�������<Mg���q:�\0�����ʆI��»M[O�UӤ�|#(��aҼ�Q}�\\�c>^y�ڝ�i	t#��5�_�Uߥj�A��il�I�m�w&�KGrf���r�>eD���PJ�g8�Z�Io�G�5��A$���@����\0�Z��l�� ��X:��5���=M��f��\0v�tK�%��i�%���e�e���<LĞ��ҳmdU��q�5t�B�Fs�՝�nNņy����Q�@7�9<`���u����kbH��8��w$��BOH�\"�~Q��>���Ӻ�O\0b� `��\0*��z��&\0?���QC�R܇Vg^㨡E��z1M8�\'K���7I?�j�m�:��K6a~*�O��Y��\\U��Z��W�/��MR�a�0��	=�e��N���$�qbMů%�� )\"+ucϱ+�VN�gkf�Wd����P�4���˷�B���ޮnf��Q�㞆�3\0\0���2㏥r��Z����b�36�}+�i�pz{מ���Vt�8QNý�M_S�X���s����-.i�Ob>������X}��&�T~-����pú;X�2x,(�Ҿ�tV�,by��o�*y��v1�I����m�bB8��d����@5�c\'�L�>V�wu���RK�7�!�ʞ��;���|����\n���[y��{/z�[���(���a�5��a��7��Z�a#Yd��V^��bMҥY}�ؓDKR��Z�������3Q�[��C��t�C\\��$LRE*è5Й���q\\��\0�b:�|�ƥ�0Zc��\\V�C�;8�z��/-��9��÷ֹ�F�.����\Z�\'}��:�\"�<�e�����%��x�}��O`J�z�s�D!�\'�+��G��v�X{քr��D��\"�a�tێ3S�xN� �a&M>Z@b��n|�y�_h\0����T�������Ob��	y�|�+,K�L%��H�#U&�zԫ7�eG7jQ7JdX�����fy��?�K/�����e>��cU`/��� ��˭:�h��on��/�G��F�[7:]�\n���ꦹ��\Z����Om���7�)��Ū��y��X������.)N>lg�ףL�΅%�YO\\��5�H��UF�eA��I����\'Q�U�xǵ0��7ҥ�c��'),(22,876,'2015-12-09',0,136,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�e�嫶��\nk�(jŢ��9Ǆ�	�҄�c�~#�ό�ٷ�K�����\'eq�.Nȇ��*�L\rkhD�]��\0ׯ8�������V���X��6��9$��}i�o���g6��t�JH���2�\\u�WE��O4ք)�2A�nn�B�П�T�5�0�zc���h���¥�l9?��;���u�cc$?)��s���l��w����t$�[�OZ�o�Lrr��#��-�F�.������C�-ΚR)Y��$eI��J���Ѓ޴��-n��A?�ե�0=,̗�c`�܃Tf�/ߴ[��o��{\ZޜVVv�e>J��q�S��)��k��c5+�a��rFv.@�=��fi.�^iX��Ř�Z�o3}�!�?�pI�N+\Z��Շ��+�Gf�Hs�ά�C��!F`u���#�09�E$_/ˀ��im%�@:Uw��>l� <E���1�0�w5\Z�[#�~�7��HvP������h��\\�T۰9XthJ�=;��R��c�8e�rx��qPǪ���aO�5�o!1+0,s۵;4f�g}����a��ڬ��yЈ���?LWUq�e�<�u���M�5�\\�i�2�/�R1�Nz�ƶ-��Y@�xl���([̉�N��8&��*K�Kq�Tڱ�as�Pe)a��ݧ ��na���<(�kH~���$u�x�\\��wa��\0N{w����G�#\0g�j�T����  \0���*d\r(.l�V6�\\�e�/aNh�I�����W-�z�YsE�r��[{g��Fk����u?-�Jy��v���hFF��VD4�@���������l���,�:\\8��HSS�k6FM�Ȥ�ڲ$����_jY���(�9�@*պi���W6h�0�ds��K���)��VK��cG�Ts�_�H!���4�S�z��6˰���������V��&nvu8�W#�H#֮ȫ,E[���ы|���~\\T�$�`j���WR9^�;��h���x�`O�es*���k��m%�گ�����I�|\n�h����w�5����8V�O9�uSZ�/�z�\Z\\TS߽)!A�UmN�>��Sr�Dma�zv�ŷ�(!���ƻ�igQ��ֺ�%�����_4�P��o��lf6���j�<6r���2�C�St�9,-Vpp;���&�5��\' ����ȣ�_�ߊ��J�[	\\�8��0#��jӶGLq���UiA�gb��ʓV�H�j��!}�)�$��X�����>�F\'��õu��[�]ۥ팰8�u#��^`�32�\0m���z�o�מx��M.�\0�B�O�9�z�����*�dҭ���<���n�X��o͵��Q�h�ȵSgl�v���n�[yҲ35�r���O�\rČҿu&��Ҫ���w5j��<J�R@�:�}xBoWo��[���Pm={愮�VvGAms4q������՝䌆��VU2)~��u��񑞕�F�d�Ŕ�\n��\'�Gn}zT��\Z�0, W#�-�̗�6q������;�(�{�\rsM�q\"���b@$�޲f�\r�$/aIA���s�V�����ľM��c�8�[- n�����s�Q��e���W��s\'Ԏ9���`�m��F�G�W�N:ԾmG�k�����V��I#h�z��j�+��)>0�GS^�eb�5�j�梈.s�\"��/SH��-����Fpï�i�Y��`������m>�ɌW\'��=E,jP�7hl�z�X\0�{c�d�O%��ǖ�����=}�ڤѶN0((���E=�4F٭�8C��>�r$x��`02qК̾�^mAʹ�j�{T�6/4�wr� R��zS��}�:eîe\n��˷��iå�HI��n��V��;-��-=��B�2�\\�څ���ț��Z~�e���?@�����F㞠k敘8�����!�3�&1�M�|���p9�D�/Z�̽��\'��Y�/\'����M���R	��ީ}�<��6����l\"�`NB��&��Ԗ�m�>SчC]	���X�\"1ʡ���ظ��6�V��l����������V<�d�������և䤗�\'\0�Ml�Ri�&<\0;Yڕ��O�G������3\0���\Zv/�rmڇ\nd��0��M��U�G�(	�\'�֋\n��\'een0�9�˕L?\\�U�fb����mҎ	R>niؖ�r�x�OY�:�w��9&�ֈ���\\7Z�ά�7���<�z�I��7���^w�!�ޤe���Df��o75���]3{�m�7Yu>\\���R���=&��[v0��?1Gt���(����q]ٟ������\rX�T�yD�<Rm`x>�ᒤc#�zsG�c�\0�Ec�ZM��3Ă)@�Tu��.;�#�8x����ϭJ�X�c�r;R(��'),(23,878,'2015-12-09',0,138,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�x#��$�\"짡��mi2�*�;���Av�\Z���oq\08�q�_«^�k66�\0iv�.\0_�6��z�i+ث�[\ZX�,���������IؖbI��]��	����Z�Z|�Вkg�d�A�4�Y/�-�y(����\0Ս:Y-fiԲ��/1U��u��[��<��$�\Z�\nґ�2ß�N���N�G6�p�J�X�S���^FUP�v�-��⺦����Cl��2p��Ϸ5��8�t2sqz�t�d�܊r9�*2�o����\n�}>��ڋY��J��l}��Q�P�\0��ZpF?�;�;���1���DNI9��5\n9R�M��b�$�ڪ�jF~*5QCC\\�)I��,���袕������$7\Zy��)���P���ir��y�~�~V�eg��n�d\n��\\�=�N�\0o�u=�N�o�e��w}3QW`��3��s7�mmt�v�A����ݎ�D��Hϥi�W��*�&p+1S�pjQs �$-��b�qm�(�t\Z�˴��̭���z�O�麬��[�U�GD���͊��\n[i��Q�2p�1�\0��kx�i�d%�~�$f!)8ڹ��j�Q����ƋXƟ����1�cJ�\'�\0d�kƌ�#ƽ����ֲ��E�$#�g�c�ރ\'�>���\0h�R��F��u��z�Q�����:�j�sZ2J6g���d�ף�����o�YB��\0U�N�Z�5�\nj�q��f7ܙyV�\0��X�-�)��a��S�I��Ģ�(دnmf�ol\"m���e���_j��+����\\ԓj֟�/����w��Jθ�5�C�6�A�N\\��tblڱ����ڌ�(���rk�յQ �#@1�橴R0,A>���I�żO������c!�s՛h��O�k*���Ks��t=KXv[9g���GʿS�V�^צm�X�p2T:�~��Z��8t�[�)\r��� :������쥖�u�H	�����z���Ӛ�[;D�UC�t_�0j5��d�e�w�B��#�����}oK���\Z�ؖ,Y�t�t�Z7���5����F�������а��u��l%�H�,o��d\0�c\0���SNK���G}G���xoNxn/���#́ۡ�Ӯ:V������F�6�۱q���׽k���E\\�\'?4o�8������F�q�Fl���	=9�5����KK���Dv�K2����Q]vv��Km�Ƴ��\\���~����[�+�q�X�����v6)�3\0�Б�n{�����}����G����]�ɏ��g�=v����+_S��;k���J��-de�8eBA����\Z2;We*���M��+F*R=�1�[\Z\Z�7s^�e��1��\n-�缙a��ydc�����`���#1I����:����{W��^�|=\0�M����o�i�\"����-������/M�q3��?�֩}�X�M��qpĬ�l9#��3��_D��+��%��dq;Ņ��#<��׆h�{[�5��&p�z��=z�(�Wz].����!���\0<VTzF�♣��,�������j6x�%Fp?�r�x������b�a9?�j(�w��}�������m\"ڣ$,�I^�9�ӽl�i��RXŕ8��p��8ֵH��4�|pv�?^�����4->I��S�`f��=Ժ�V�[^��Ar�\0og&b�v=rp��U��������k�K���g��oN+�\Z���k�/�pv�@�?�5Vw��%Ee�|�7��֕YY�;��/vei04/i$m�A�H��2k����tB��8�&���5K)�`�1o��LV݃ܽ���U�I�ɮGt䍕s�8е��?\Zh�N�e.�c�\\��s��ּ;{��a�4�m�g���z¾�{�ìk��8QU/���;7���9�u��z�\0#]��S��E�3�4����NW�w\n�/r7-��������ɟ�֎�^]��-��~�=�E�MR)�*��ǅ5����\"���[�Ia\'�=�T����{1��UĦ8�%#���.��=Zm��#H9��Q�g�vڵ��ޞ�2[��<c�`:�)7���m��+J���1\n������gDtGw���L�;��N:��L�>8R?�nk:��X��BB7�pFj�<\ZڜR�~�\0�\n�D��P=+E�v\'��}���Q	,p\0S^���z\0�M����	��\'<\Z���Z�_Cy>�����o	�~�8���{K;�J���y]�Qx	�?,Tժ�љ�)h�ka��ԑ�*��V̑\\%�4W�*�cH�A=rs�~°짆�	Q+pq�y5�k���Q�q�AYF|׾娥�\'���|�2�l�X���|�ki+F� �S��⩅�8�f`��\\����{�͚�l��8<w�����=I-�IcR�Ppq�c��ʍ���炣�N9�\0?J����pG��E<�P�p�!�?��S��|�nFn1t��dtx�:��$�\r��pO��m_Z��a\r?�#�*�S�\0֮s��\\<MoJ�i�Ĝ�Li]TgU<��x�ӎ��h~6�a�$I�{�i� �1�8��^�kvn ��p�R0k\Z�I�l�2[�Ec��l�y\"�%2��zz�m�W8l�4�q��A �d��j�(\Zcȶ���A%�}+zMj�I��A7�\'w��r��qz�:������L�p�c8Ϡ�Q�OSX����:��l�l$�Q$L��n~��yu�0�L�/����l\rt�d���(��=��\0\Z��U�Y�Xb� ��3�\n�i^�*�ֶT�J�Ǫ���!V����X�)�䌒x���Jk���.wE2�{����hZ��Cyr����f\\��J�NOd+�����)�Ӽ+��;�Z��H#�2E#6	`�<�Z�ikeu�:��X�r}���v���d�\nO����F���]\n�!��iYH����c9�\0�V����qI\"G�1��s����>ld][�����|���M��2�$��c&�+�k�}��T~�+����r> ��o��4��\"����c��+}��{x7]]@w*@K�ǰ漟ƞ(��T�-���e�B����|Ҏ���%%���5����Y2��:��1QGo%�	��!�$T!��fX؀aV\nI�?\Zұ���C:H�a\'sG��+�i��j���`�����Q���Փ���KXn,4�l�fI�\0d��cҺ�ӑC��s0ǥc��Kn�s��`1�H�v���c���<�O����<���Xf���d����t�gJ�嬐Y]���;Zy;��V�։�j�{D�=�r�P���lu��G@���Ł,�y���CnX��k�^��Z��x#֯����wr�e�]����\n魴��Q���l#o��@����:�������y<.�V8��~\0=���V!Mu7�����1F�=�的���ܑ�V�\0d�3nma��G�h.\Z&��s�¼z�Y��2%��k�x��B�F<�uޥ����&���d���Hgq&�,⬚�uֆ� �Xq�3��z�;��.��t�h�if�U�\'��>�T�Մ�֞���b����Ӿ�V�òIr|��Gj��N�4�\Z^�s#����//�2ڨ/��;p>�-��4s��w}����f�o^K%��\Z��/o1f�Bw�LrF+��Ǟk�{�*-�1�����F2}��p���f]_J��\r��(Dyid�\0݀z�Wƞ+�_֌�0m\\�3u&��O���2���V_\0�C5�l�9 �=+XBr~�J�Et�ӯF��l��]>�����8��I��9�:Wsu�_i���c\Z _\Zˎ�\0A���D(`H�1\'��a[�Y�ǷK7Q�k6Ѓ�ک������F$�Ya�1���\\���=r1{�ٗ�o��nWQ�9�|W|hF2�M�<���Q��d��/�FQ�qҳc�,%�\0Ww}T�s]}�k�\"w�:�ܬ�|;Aڛ�oC�+F��z���5`rs��w�8�Th����OSO�6��O9��(R��3���F���u帆{H�A�rs��=i�D#D�6T�vn\r��zU�.�|٣!��\'��J�%�i�QmSM����\\1h�� �{�b��İ�y�a����\r��	]]&fÔnH��*�6��$���ǚ�Ʋv�IG�����\0K.0G֒I�����~T�y\nd�#�����q���])wܛ�Ϙ��1��2e{r7����*�����)��U\0�T�5�f�``�����s��B呢��*x�H��\"��eu}ʬq�t�U���R��u\Z�n2w���ͳ��zw5M��v�\0?�gS	�r�����'),(24,880,'2015-12-09',0,135,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�a�L���mR�A]e��g��}[�^Lj����i<L!�2�9�dr	���>[wߊ��.��4�rk�7\n�U��V��L��M�[,�B��<�Z���n�-��ٗ��i�9W�5(�[\'�Lk�uf��W�%�x%��*N�;cӊ��u+{���c����qV����83������{�0R�ڑ�q{qcmhKE#>�F\0���W��\0�3`@ ɏ����M�6�=��ol#�9���@�<{m��[M$�R|̨�����C�*j�Qь\\����F,���t�*\'��g�V4}`j�|7QH�%�7U�5��\\dH:�՚�<��k��?�۝�@�S֩��+��r}�k�W`���/��tm�1Z��o\r.��ˡ_C�ھ����f*pT�=EzG۠k\r+Civ�2F��V��Ҟ��*#�<���D�������֒dǺ3�r+���băۃZ�&d�:/�HG�Y���dy��ڜY�Ut�GP�Sd�;�B�ܜ�|����)�\rk�#q\\�3\\�\0�#:ƀ�Ѳ��!q��\ZכP��67S�܀N3\\N��}�Y�щ����~��e$���4+��n���<�SӮt��U���q�U�i6�����P�7�� ��NҼ��i����\\\\L�َB*u�:��tk]I�Hl��E6FIg˟C��U�ƭ���0N7�Y�ڽ��y����e1��<���\\v�����h�	uy4�=��6�R��\'RJ�z��d�K�\n�d�j��,E����z�)&�r,4c�yލ��Uә��tC�� B�����Qo�Ko��^��0ַ����\0\n����p0Ns�d�ӽ�w}j�\\����kzr]K<�H�qJıs�qY��v�L�-Qd���H$0�28�]d��H�������\0�\\�5M+U��eh�P������eB\r�:��s{����\"{+���)���U��FwD��\0��y}�������F�D\0���\0~`��Z��|�h��KmwG���#�r�Ij�����Б�����ᗨ�7�t<�����d\'���0�FjB\'K�(����oT��੅\\�lY�Q�|���}�z{�+��9c��6*CT+yl<�rs���I���|�����ϊ�u%tz�(r��F�ջk�e�)J��s�Vlkam<����ܔT�9�p{�>�N�P���i��;���7(a��y��lWa��u�¶֨Q�#C�`�c����4�-��T�d�e����d?۳�\Z{ISGS�+��0\0_�*�㟥j�ZB��Kx��n�ƞcv�N�0	8�T^%�/�O����I��1L��c�_~��iZ��Z3Hѭ�a\\��s��~��T\"�N*��%��\Z0�:W�l�I$���,Y��\'8�OtVD��S��H{�?�5�.�wm�I<>lQgf�\0���z����6�=�35̍��I���犵.�#���4�^w2���è�B�2G�I-�h��&#�pGҤԧ�+]�Uݷ\n2y���[	��,��I.�a.~\\{{��[���W��f��]�$����K�w�i�xc�ʰ�C����l��@|��e�Н�`�oz����Z�y\Z�H\"v�D%���rz����٘�L���)���3H뜌��.iy(�v�=g�:U��\'����؆F��S��\n5k�z�o �������\\F[��g�r�W7Si�C�?�-��l���>�i��o&�<��n��[��oƢ�?3�*u����J���[���s�3���<��Or �y��{��ky�r��=+��Y��-����t���{�O~k��;jv��\"���/�.�DE��[�|�z�Z����C8Y�E\0\0�<�+\Z+���\\L�7�� c�Oʪ���8���e���;��ۜԧ��l\\������q�_jl�n���z0$��zq[\Zu��X\\�ov���.�P���G5�װ\\�O}~���G� �r��3�\\�W�p4R,Br��\';Oj�ۓbt)��3����-֦.�\\���-��.02{w�_jQx�4��G��7>|������b��Tյ%K�%4��m\\���+P�;뿳�+NX�\0:d��9�{$)S�j��ָ�\0��[��X�; �*}�@<��=3�y���:գ���^X�{m#m�\"�T�rG>�{W�����ݩ�S�X��%�B�I囏L�j�f?���{��<lL���]��1�ZE����^�勹�k~2�..\"V2dPl\0J�\'��|9�8/-��I�J88l�P2{��y��7�B��>}�lgۓZ����6V�VS��gr���ߟN�*�UE�S�����^�k���_@�u����8�\0�\'�Ԏ9�^b�_�7�@����L��(�@���|O=�v��ΒD��1�����T6�BE����m�è ��*�I�¨I�r徻5��Q��gD�,�V��H��c׵U�ol�͍�[�!��&$6z`v�{�t��r�����X��4�J��B�2��ힾ�r��q�����soP�e��ڛ����\"�hd�=��^�|�3���Sx��.�M!-��0�����hi�\0��%Sx�Ad����VS��M)b9`����ky�Knc$��O�k��kD��P��Y�#\0�>�zWS�=!�R�x����!�ZĻ��,?s,2������߀�J�^����J���縳�R��ċ�\00\0�8�Z����D34e��2������-/e�5�=�b]�@z:z��k�v��Kb��\04{Am�ڮS|��\\ʚ�J��\n\Z.�\ZZ�\Z(��;F�dvǿ^ޕ�_$�_Hcߴ�\'p#h���ki�n�o\"R�*85KQ��{��0\rץkM(��D��)��[��1����l��n0?\n�>��]��.�c�PIǵY�㷸���\"��T������Of/�#(F#ˌ���j�R���p�i���\'�_�����K��}{�����h��!\0p7�\\:��	<C5�ܴ���\0)<�*��K�A-\"v����.O\'ڰW�=7�}��#�d�����\0m�P�i����� K�O�\rkh�,8/�s�\Z�.%�G�Ν�Y0�%%�o�8�������I�hl��*�^BA��\0*�+ꑊN:\'�S���X���u�%�+f�%Ί��RD���zd��_U�]b��cX�퓁Oӭe��,�+9\'�s�1�U��5ќ�S�T�GSc����]��>[��w>�=ݖ��� �H.Z]��ۓ�ߑָ;��<?�+@�*�Џ�;�5�l4\'[�a����\\���\\�Md�9�ٿw��v���Y#Akp�Z��^Jc�[ٖeZ[x�`07�?�bi�U����_�N%_��nګA2�18�����ЪI�$��l,\ZIa�D%�DS���~\r��l�GnXF�	����F푶�J��g[O�~񿨬��n|��#�4�9=W�s�3-�E��f����ɬ���KɭQ��N;Ú���J�m�W6�T����E`�3�,�eq#	�\\��;�zr�\"�G����ᵏ?�Â+d��\0���\0�(�q�P��[{�Y�ȱ�hUs�~��=B9<;�%����\"@ps���4�q]#U�Hè^\'��A�+Lڧ+�#���-a�)^�v�V����5ѭ曥�Ф0�yHi.@��\\��;�#5�,��I3�3�+�Q�g<yhA�ܟR����F�J��-�].|�\\��x5X[�Ms����1���k\r�ykq:�1��s�V�b���Z�W�U�Q��\r���^���PjQYݦHH�Lw�\0?ֹ{\r%�/�d��	�Xw�D��Ɠo�eE�p�O@?ι�IKD*�PWoVk6�������ё�$v�������K���1�{�+��R���ՙ����������廟̞^��J�sJ7ks����7\r�K!�Ue�&�>.��V��X;�0��O�Px��,�$���W\\��^&*���T�X�eOpy���Ӣ�S�2?���\\��v)\"Nɳ� �i\"��ԍ�M���䚌g�ž[Ĥ,o��+��畑7}s�_�m���$u�F�������8�u�P�3B�L���z�����&u$���9Oi_�Z�Fc�8ȣ�ǯ��O�D�h�V��|�U2;���W���\'R�v���aK�{K��ong�,c����,���֕t������MK��yJq�w߇5�g�Z^�63	~�/�W�M� �����W�7\ZN�mp��2�.?�Ƣ2=���W�*�g���O��Fd�}��O���+U��ld;Q���2W�5Ꚗ��\\K�K\n	�7�8�U��;��ڬ�\\����|TN�~��3N6HU[�A\ZM�L���f�\'Z�a�uM�1_~��^Ҟ��V`�A+:�溏M�dOe)�6����8%\"+>z�>�O�����&ERW�U��W��Eh� @��5�h��哵�ܯ�dc!��+����-�UI�$�=T�\rd��_��4�+�\Z6g[�52�\"8�=EB�)�c��\Z͸�>��̟ �b��E0�@ϻ=���K�cP<�I����k\n����sH�����hی([9��\\�!�\0=Z�7�22���\'Wn��$f��V����4P��N������?��]uK7��,��όUc�De�qu%�섌~��ӡ��ܘ�lc�b��h��4n�,��k�y���RBG�V��jWK{\"��p�8�[6�JnF�\'^�%\0�Jlm3�-�B~T��ҭ�rJۊ3Q��s�v����x]㷉w;��A���z\re���\"����{�5��:��I�%�1Z��@?^*ƍ�84�7�����W��h��ұ0�;7����}:�K�F)%�[m�a���ʳt�+P��x�un��ܼۚ����Lbg�1\Z���ARE�\\32m��\Z�Fr�R��u�m�R�9���Qz)�ml��T�z�SAao�r�սjߘL\n�%��e]�?��'),(25,898,'2015-12-10',0,135,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�Ƞ�b8�Ϣ�kf��:��<�\0=ߊ��i�j6Ѯ=\nچ�4����U�E	ɞe�W�gH�������d�\\HǾ8�I�Y���k�i�<����S<�U��	)I����7�p�w��{�P��XB���������Ay�U�����ܾ��}�\rb;+e��	S�p:\Z����1��n�O���e���F�dB5���j�&��L03�qڸHm���T�1�:��БRK�K3�i����3e�wMct����eе��g_���n�7�x=�kY����\n�=\ry���Ai5�����T�J�I{H�Ե���&+$\nK{�UGR�8��UpTU�eoSa��>�acp1M�\r\"5S#D�+���+��v\nM�\"�omP!X����ݮ՚�d��Z�,����;x��>�CD�\'\"���)G��+�����,䄮8㡭{_$��A��ot%�hs���E����σt���:�+���ܔR�C]6��ͩ�I�l8ʏjѽ1��� �Z´*G���գ>Ing��ķ���5>b���kRmz�� (��x�����w)kY�obĐ��,u�j~)�n�Ed�� N�1��G�foR�=e\nZ���=GEdEa0�nW+���eD%�F�y}-̓�);U�j��+2$���m>�m��T��uSZ�\\���,d��\\�\0�+��-%˹�O%%);z����4��϶�ڏ�\n�ߠ�[ɭ]�s�dCr_��v0M��3X���D�20�����omuw�b�rN�x�����\"Ir�R�8�/�WaE�떅!��ƽO�6��ng��Im�2˜ym����Z�Mo�����ra_�Z���\0c���=EU���9M�7��������&��l��x�7���u�چ�4�$Ƨ�`?Ïz��\0�z͵�\\�&�>f�T��~��k���`��8��@������+������ד���V\Zĺ�K5���!�8���rW�隆�40\\�$\r�|��:��\\�ı�-�o*<6U��:�s�xT�Mi����r1�ަ��o~�;�S�.�/N�uz�ou#�!�L?��H-��ൻ�C8�s�c^��-��}>�h���\"/�8�+��[��좶i#W$���V7�+Ks���������Z��C\n�<�/�<G}r��J��\"��x�.�O�~T$G�=*�m�i%�ch�DFZ�U}��sYR�Sq׹�Zy�+��d<���ln&�Ԝ�8 ����c]@���-��%�v�V���}CQ��H��)!��p<v⵫7(�-��\Zt���I�#˘�J��1����t��kz�O-���T��S�0���=�l/����cQ���P�S^\\��I\Z��M1l\0���d�3f�ѽ���XǦڋy��;ۆ��*�\r�t_:6qv��+s���+�6q��G��om�S\"8pJt���V�^#�}�f�O�J2�l�8�r=�/d�4����Ř��#���)��ٜ�~u�g{m�q堝�;����t��}��\r����(��xB��NOz,�I\nG/�i6� r��#�23�ک�������Jvz�Ӹ��9q��\"2ᶡ�O�zW|*�\\��F�f�R�e�_�5�/�Z�-yDa�P�9�J��Zk�-�D��3.p�;c�JRV^��5\\HÚ߉sF����lۤ0dbq�y>��M?U���{�!�R&.�1��#$��U�}�ݷ����ĐN0wz��ރ�]R�\n\'��H�w���TJ�6���6���Z����a���$�_1�p����}�է{�5����E `�NME�Awe�O+�\Z�$�F{��ʥY�E�:+��nQ�Ee%���=�i%$�2/��K�fľdo����jY�����\'i�I�����i��ī�cH�v��\0^���wķ6�\0����U�]�ԥ�9Y�]�c�1#��Z���k��HA�Gp+\Zi��by� �����gp̿+d��=+ӝ?ݴp*�����������0�P�W���1�!� �Oj���<�r�yI��?������)5[W��-ir\nI�N�����yݥ6��%�:Th//0�*��J�=:w��rw��\0d��Ao�F�q�L��U���@ӗR� ��X��2���>�k��t�\r���2�� u��j�5rn�\n2�\\��cE��v�\n#v�������B+�)/--�PHs����G �\Z��t�\'���`U.%U�gnO\'�V���\'\'���K���?u��qZ6��ͨ�r�Fo��<FI�ly�f:q�®h��P�\"i\n��s���5���%�B~餗͏QI�YA8��4��q#����]Nᣋ[�I�l̄��xW��zĒ��\r�-A�@;�u���h�䖎H�K��y���%�7zTw��r\0^HMrk�>i�cE%�֬\"��ɹE�u�3�מꋨhZ��}�j˃��������1��?\n�����bP2�V8�銺Q�,�g���Q��~�6�{=Ք�rb;r�8����7��C�����3�W5�Ky`\\�<�eoA�:sZ..uV[��.+x���	���N�yv=�V�z���:�XH���*Κ�h�Uu��[��|��� zQ�\\�6��$,�T�3��^�����b|�u��m�X����OCM:��rmF�ڝʌ��ްd��.��0H��+w�zɳԣ���6�`�6w�?ص��ʘ�A^�fƋ���j\"{�A�\'����h�D0��!a�ۮMe��LQ_�u�E+i�I��W�9�y�jŦ�oun�or�<|���k\Z�4��F�&�D`�o�\'�C�]����5��r���ě���\'8�$�x��CK�\'��F#�2�����ƕ���\0�]��S�@��5���ZQܙՃ���嶶z�WX�,Z<�qȭ�?G{�i0�!b��\0���z�\0T���HT�?�s^\"֣��n�gww\n1ҪU��ʿ��p�7D�����$��P�Y$�s��>}&[v��pcDev&��(`��h�fg�rܖ�z��xn{��>��A@��^H#�~U��8�7<�E�m�M2�����Q~y�h��� ����-.)�.[z�屑Ӷq[��X\\�7Z\"�JC4M# 9�lq�� ���\r�Y�t�G�U#�H=>��%+[Tm���3���\'�\r�(eYЌ0�m�p	�c�Ht�Y�\'�j1w���+s[�Q��l\Zi��ӿ�ֹ�?W��Oo{��H����n+�S����9����O�\'�E�dp�b}�j�v�u4h�0~b{V��SO\n���ԓL��/\"�VY�#\'�rO�T�E&�rV���%��[Ue����� :��?�V֏�ͨ����(�VqpX��l�d1ڑ;�3R���\"��gb�޸j���+��ά�\r[��ٰH�1�~�W�\\�se��r��<���U��p����f��M7��\"HY#f��aןz���Q�yy��E&�%{#�ѡk�^3�����8��%�lz�c��*�M���ˀ6�~���.���L\r��/������s9�EC}~W1��&��6��V7��$�[�<g�Ҳ�>V�UզU;H�#=sZ^�Km9��9�On�U}n��(�}ORHU��[𫤧aԖғ��1-5�{O��$V����}?��Ok��V���>lW?)�yi�����*���p@\'�5�_k��^��&Q�ǧ_�koe$Ԛ����#�F�l�]�/o�GVy�g��Ծ 6��qK\"˜��R@�XVm��-խ� mg r��	�*8mo�K%.|�#(A\'��zV�c��*)ϝ;[COSё��nt�S#o;�UFG5�����_<sǟ1�,�p���ˍV����0X���5��jz|EgE�Y\'\\�#��kXT�mn��P����w-��YdNyGR3]/��)�A��r:�<�qW/aӵ$>n���\0�+�b�97�|�g�7:s^���纳;k�B�r�pA�.I��2��{������a�1�,��Q*��Mw�M-IT2�c���ٽ���wc��Z�N1.7�9\'���Z��\0�\n�f��k�]��}�r#W�D2����}�`\n�=�=����J\"�\\�g�Vj��W�8���Tj����\0Pd�7݅N�*k��+��ciyf?��}~��Vi�����ó���O#�>���Rc%ŤD���=���q|�H�7�t6W���XA!�;u��n�����\0�P�z�ǪC�I`�v�a���]r~w����U�ec�\Z�Q��Y/�=T��P������(���fv�g዆K;�M�V#���a\\�i��\rΛ���o�����\0�~���i�ys-А�\\�9=Ms���Y�\\�1�9�U�js��FԒJ��W�ob�/�8��$\\g8=+wF�V����ی&ݬ/�v�]�v\'ʶS��6��޻)|n��fUQ����uΔ�x�t�F��fw�4�l��^X��;���?:��.���g+���k������Țg1�\0����o��Iͫ�_�Xg���N��-(�S�Ei&gI�]���s�x�`?��h��\r4���i!��O�Ԓw6}�kЭ�OX���c��͔�O�%�>��M���p��S��t\rc$�hO�����21��V/H4tB�V��2����*����Imb��o<��4�j&s�Z1��T^\0f��H�,���d��j��qb��9�\n�\"H^&S�0�j�vf���6�8�֋���t��þ*�5v�a���Z�t�]�X���Ϛ%�X\"�D{�V~�V���xJ6�R1����6dO1sߚ���l0h�^EDi�kf��e�t��\0.�&5=U���U�,mf727�U\0U�:�Vl�@*kh|���-���iN��얬�j�e�Ӵ��v�z�fg$�O�J�dw?,g�x�i�+Յ:�(+����ܞ쵼��U晐�ƅ���\0ף�V���]>ŵm���?��'),(26,999,'2015-12-16',0,53,'����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n*��.��3������==j�J�ĬQE�Q@Q@Q@Q@Q@��\r��5�X�V\'�*�.���q��i	��C�3�pq��DR��H���FS�N��k�<�#cҕ��u�\"�����b1|uPy��3�z��P��F��Ï+�m���8��$��c�6���U���qq����EPbQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0��');
/*!40000 ALTER TABLE `Photos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Photos_BINS` BEFORE INSERT ON `Photos` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Photos_BUPD` BEFORE UPDATE ON `Photos` FOR EACH ROW
BEGIN
    IF(OLD.photoId = NEW.photoId)       AND 
      (OLD.dateUpload = NEW.dateUpload) AND 
      (OLD.fk_dishId = NEW.fk_dishId)   AND
	  (OLD.thumb = NEW.thumb)           AND
      (OLD.complains <> NEW.complains)
    THEN
        SET NEW.seq = OLD.seq;
    ELSE
        SET NEW.seq = getNextSeq("sync");
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Photos_BDEL` BEFORE DELETE ON `Photos` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Photo", OLD.photoId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ratings` (
  `ratingId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `value` tinyint(3) unsigned NOT NULL,
  `fk_dishId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ratingId`),
  UNIQUE KEY `ID_Ratings_IND` (`ratingId`),
  KEY `FKrated_IND` (`fk_dishId`),
  CONSTRAINT `FKrated_FK` FOREIGN KEY (`fk_dishId`) REFERENCES `Dishes` (`dishId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES (2,464,'2015-11-21',3,53),(3,465,'2015-11-21',4,53),(4,466,'2015-11-21',5,53),(5,467,'2015-11-21',4,53),(6,483,'2015-11-22',1,53),(7,484,'2015-11-22',1,53),(8,485,'2015-11-22',1,53),(9,486,'2015-11-22',1,53),(10,487,'2015-11-22',1,53),(11,488,'2015-11-22',2,53),(12,489,'2015-11-22',2,53),(13,490,'2015-11-22',2,53),(14,491,'2015-11-22',2,53),(15,492,'2015-11-22',2,53),(16,493,'2015-11-22',5,53),(17,494,'2015-11-22',5,53),(18,495,'2015-11-22',4,53),(19,496,'2015-11-22',4,53),(20,497,'2015-11-22',5,53),(21,498,'2015-11-22',5,53),(22,499,'2015-11-22',5,53),(23,500,'2015-11-22',5,53),(24,501,'2015-11-22',5,53),(25,502,'2015-11-22',5,53),(26,503,'2015-11-22',5,53),(29,508,'2015-11-24',5,77),(30,509,'2015-11-24',5,77),(31,510,'2015-11-22',5,53),(32,511,'2015-11-24',1,76),(33,512,'2015-11-24',2,76),(34,513,'2015-11-24',3,76),(35,514,'2015-11-24',4,76),(36,515,'2015-11-24',5,76),(37,516,'2015-11-24',5,76),(38,517,'2015-11-24',5,76),(39,518,'2015-11-24',4,76),(40,519,'2015-11-24',1,76),(41,520,'2015-11-24',1,76),(42,521,'2015-11-24',2,76),(43,522,'2015-11-24',4,77),(44,523,'2015-11-24',5,79),(45,524,'2015-11-24',5,79),(46,525,'2015-11-24',5,79),(47,526,'2015-11-24',4,79),(48,527,'2015-11-24',4,79),(49,528,'2015-11-24',3,79),(50,529,'2015-11-24',5,76),(51,530,'2015-11-24',3,78),(53,532,'2015-11-24',3,53),(54,533,'2015-11-24',1,79),(56,535,'2015-11-24',5,78),(57,599,'2015-11-24',4,71),(58,650,'2015-11-24',5,74),(59,651,'2015-11-24',5,74),(60,652,'2015-11-24',5,74),(61,653,'2015-11-24',5,74),(62,654,'2015-11-24',5,74),(63,655,'2015-11-24',5,74),(65,657,'2015-11-24',4,74),(66,658,'2015-11-24',4,74),(67,659,'2015-11-24',4,74),(68,660,'2015-11-24',4,74),(69,661,'2015-11-24',4,74),(70,662,'2015-11-24',4,74),(71,663,'2015-11-24',4,74),(77,669,'2015-11-24',4,74),(78,670,'2015-11-24',4,74),(81,673,'2015-11-24',3,74),(82,674,'2015-11-24',3,74),(83,675,'2015-11-24',3,74),(84,676,'2015-11-24',3,74),(85,677,'2015-11-24',3,74),(86,678,'2015-11-24',3,74),(87,679,'2015-11-24',3,74),(88,680,'2015-11-24',3,74),(92,684,'2015-11-24',2,74),(93,685,'2015-11-24',2,74),(94,686,'2015-11-24',2,74),(95,687,'2015-11-24',2,74),(98,690,'2015-11-24',1,74),(99,691,'2015-11-24',1,74),(100,692,'2015-11-24',1,74),(101,693,'2015-11-24',1,74),(102,830,'2015-12-07',2,53),(103,831,'2015-12-07',3,127),(105,861,'2015-12-07',4,125),(106,862,'2015-12-07',3,127),(107,881,'2015-12-10',4,53),(108,882,'2015-12-10',4,53),(109,883,'2015-12-10',4,53),(110,884,'2015-12-10',4,53),(111,885,'2015-12-10',5,53),(112,886,'2015-12-10',5,53),(113,887,'2015-12-10',3,53),(114,888,'2015-12-10',3,53),(115,889,'2015-12-10',3,53),(116,890,'2015-12-10',2,53),(117,891,'2015-12-10',1,53),(118,892,'2015-12-10',1,53),(119,895,'2015-12-10',4,135),(120,896,'2015-12-10',5,135),(121,970,'2015-12-14',4,53),(122,993,'2015-12-15',5,53),(123,997,'2015-12-16',4,53),(124,1000,'2015-12-16',4,53);
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ratings_BINS` BEFORE INSERT ON `Ratings` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ratings_BUPD` BEFORE UPDATE ON `Ratings` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `Ratings_BDEL` BEFORE DELETE ON `Ratings` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "Rating", OLD.ratingId);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `_deletes`
--

DROP TABLE IF EXISTS `_deletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_deletes` (
  `seq` int(10) unsigned NOT NULL,
  `tableName` varchar(45) NOT NULL,
  `id` int(10) unsigned NOT NULL COMMENT 'Stores DELETE operations on all tables.\nThis is required for keep deletes in sync. Alternative is to have a delete flag on all tables.',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_deletes`
--

LOCK TABLES `_deletes` WRITE;
/*!40000 ALTER TABLE `_deletes` DISABLE KEYS */;
INSERT INTO `_deletes` VALUES (83,'Building',80),(84,'Building',21),(90,'Dish',89),(103,'Building',102),(107,'Building',106),(135,'Rating',133),(136,'Rating',126),(137,'Rating',122),(138,'Rating',130),(152,'Building',104),(161,'Dish',156),(162,'Dish',157),(163,'Dish',158),(164,'Dish',159),(165,'Dish',160),(168,'Dish',166),(169,'Dish',167),(235,'Dish',143),(236,'Dish',39),(237,'Dish',40),(238,'Dish',77),(239,'Dish',85),(240,'Dish',86),(241,'Dish',141),(242,'Dish',140),(243,'Dish',180),(244,'Dish',170),(245,'Dish',171),(246,'Dish',173),(247,'Dish',175),(248,'Dish',177),(249,'Dish',195),(250,'Dish',196),(251,'Dish',197),(252,'Dish',198),(253,'Dish',199),(254,'Dish',200),(255,'Dish',202),(256,'Dish',204),(257,'Dish',206),(258,'Dish',232),(259,'Dish',212),(260,'Dish',214),(261,'Dish',216),(262,'Dish',218),(263,'Dish',220),(264,'Dish',224),(265,'Dish',226),(266,'Dish',228),(267,'Dish',230),(268,'Date',13),(269,'Date',14),(270,'Date',15),(271,'Date',41),(272,'Date',42),(273,'Date',91),(274,'Date',92),(275,'Date',93),(276,'Date',94),(277,'Date',95),(278,'Date',96),(279,'Date',97),(280,'Date',98),(281,'Date',99),(282,'Date',100),(283,'Date',193),(284,'Date',211),(285,'Date',223),(425,'Building',146),(426,'Building',148),(427,'Building',149),(428,'Building',151),(506,'Rating',504),(507,'Rating',505),(694,'Rating',656),(695,'Rating',664),(696,'Rating',665),(697,'Rating',666),(698,'Rating',667),(699,'Rating',668),(700,'Rating',671),(701,'Rating',672),(702,'Rating',681),(703,'Rating',682),(704,'Rating',683),(705,'Rating',688),(706,'Rating',689),(718,'Photo',707),(719,'Photo',708),(720,'Photo',709),(721,'Photo',710),(722,'Photo',711),(723,'Photo',712),(724,'Photo',713),(725,'Photo',716),(731,'Photo',727),(732,'Photo',728),(733,'Photo',730),(833,'Photo',832),(835,'Dish',48),(836,'Dish',49),(837,'Dish',50),(838,'Dish',51),(841,'Dish',52),(844,'Dish',54),(845,'Building',16),(846,'Rating',104),(847,'OfferedAt',840),(848,'Date',39),(849,'Photo',13),(850,'Rating',1),(893,'Photo',18),(894,'Photo',19),(971,'Dish',157),(988,'Dish',169),(991,'Dish',170),(992,'Photo',27),(994,'Photo',26);
/*!40000 ALTER TABLE `_deletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_sequence`
--

DROP TABLE IF EXISTS `_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sequence` (
  `seq_name` varchar(63) NOT NULL,
  `seq_val` int(10) unsigned NOT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sequence`
--

LOCK TABLES `_sequence` WRITE;
/*!40000 ALTER TABLE `_sequence` DISABLE KEYS */;
INSERT INTO `_sequence` VALUES ('sync',1000);
/*!40000 ALTER TABLE `_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offeredAt`
--

DROP TABLE IF EXISTS `offeredAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offeredAt` (
  `fk_dateId` int(10) unsigned NOT NULL,
  `fk_dishId` int(10) unsigned NOT NULL,
  `seq` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_dishId`,`fk_dateId`),
  UNIQUE KEY `ID_offeredAt_IND` (`fk_dishId`,`fk_dateId`),
  KEY `FKoff_Dat_IND` (`fk_dateId`),
  CONSTRAINT `FKoff_Dat_FK` FOREIGN KEY (`fk_dateId`) REFERENCES `Dates` (`dateId`) ON DELETE CASCADE,
  CONSTRAINT `FKoff_Dis` FOREIGN KEY (`fk_dishId`) REFERENCES `Dishes` (`dishId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offeredAt`
--

LOCK TABLES `offeredAt` WRITE;
/*!40000 ALTER TABLE `offeredAt` DISABLE KEYS */;
INSERT INTO `offeredAt` VALUES (20,53,298),(21,53,311),(22,53,323),(23,53,335),(24,53,347),(25,53,359),(26,53,371),(27,53,382),(29,53,406),(30,53,546),(31,53,557),(32,53,566),(33,53,577),(35,53,754),(36,53,764),(37,53,774),(38,53,785),(41,53,915),(42,53,932),(43,53,941),(44,53,952),(45,53,958),(21,55,303),(21,56,305),(36,56,760),(42,56,927),(21,57,307),(36,57,761),(21,58,309),(22,59,314),(22,60,316),(22,61,318),(27,61,378),(33,61,572),(37,61,770),(45,61,956),(22,62,320),(29,62,404),(32,62,564),(45,62,957),(22,63,322),(24,63,346),(27,63,381),(29,63,405),(34,63,586),(40,63,858),(23,64,326),(23,65,328),(23,66,330),(38,66,780),(40,66,904),(44,66,947),(23,67,332),(23,68,334),(25,68,358),(30,68,545),(32,68,565),(41,68,914),(43,68,940),(24,69,338),(24,70,340),(24,71,342),(25,71,354),(24,72,344),(34,72,585),(25,73,350),(25,74,352),(25,75,356),(26,76,362),(26,77,364),(26,78,368),(26,79,370),(27,80,374),(27,81,376),(27,82,380),(37,82,771),(28,83,385),(28,84,387),(28,85,389),(32,85,563),(28,86,391),(28,87,393),(28,88,395),(29,89,398),(29,90,400),(29,91,402),(38,91,899),(40,91,856),(20,92,434),(21,93,442),(22,94,447),(23,95,457),(24,96,459),(25,97,469),(26,98,471),(27,99,473),(28,100,475),(29,101,477),(30,102,538),(30,103,540),(30,104,542),(30,105,544),(43,105,939),(31,106,549),(31,107,551),(31,108,553),(31,109,556),(32,110,560),(32,111,562),(33,112,569),(33,113,571),(33,114,574),(33,115,576),(34,116,580),(34,117,582),(34,118,584),(43,118,938),(34,119,588),(30,120,590),(31,121,592),(32,122,594),(33,123,596),(34,124,598),(35,125,746),(35,126,748),(35,127,751),(35,128,753),(36,129,757),(36,130,759),(36,131,763),(37,132,767),(40,132,903),(37,133,769),(37,134,773),(38,135,777),(38,136,779),(38,137,782),(38,138,784),(40,139,854),(40,140,855),(40,141,857),(40,142,859),(35,143,798),(36,144,800),(37,145,802),(38,146,804),(40,147,860),(35,148,852),(41,149,907),(41,150,909),(41,151,911),(41,152,913),(41,153,917),(42,154,924),(42,155,926),(42,156,929),(43,158,935),(43,159,937),(44,160,944),(44,161,946),(44,162,949),(44,163,951),(45,164,955),(42,165,961),(43,166,963),(44,167,965),(45,168,967),(43,169,996);
/*!40000 ALTER TABLE `offeredAt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `offeredAt_BINS` BEFORE INSERT ON `offeredAt` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `offeredAt_BUPD` BEFORE UPDATE ON `offeredAt` FOR EACH ROW
BEGIN
    SET NEW.seq = getNextSeq("sync");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `offeredAt_BDEL` BEFORE DELETE ON `offeredAt` FOR EACH ROW
BEGIN
    INSERT INTO _deletes(`seq`,`tableName`,`id`) 
    VALUES(getNextSeq("sync"), "OfferedAt", OLD.seq);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'mensa2'
--
/*!50003 DROP FUNCTION IF EXISTS `getNextSeq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE 
-- DEFINER=`root`@`localhost` 
FUNCTION `getNextSeq`(sSeqName VARCHAR (63)) RETURNS int(10) unsigned
BEGIN
    DECLARE nLast_val INT UNSIGNED;
	SET nLast_val = (SELECT seq_val 
					 FROM _sequence 
					 WHERE seq_name = sSeqName);

    IF nLast_val IS NULL THEN
        SET nLast_val = 1;
        INSERT INTO _sequence(seq_name, seq_val) 
		VALUES (sSeqName, nLast_Val);
    ELSE
        SET nLast_val = nLast_val + 1;
		UPDATE _sequence SET seq_val = nLast_val
        WHERE seq_name = sSeqName;
    END IF;

RETURN nLast_val;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-23 17:24:25
