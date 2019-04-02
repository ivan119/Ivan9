-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresa`
--

DROP TABLE IF EXISTS `adresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresa` (
  `ID_Adrese` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv_Adrese` varchar(45) DEFAULT NULL,
  `Poštanski_Broj` varchar(45) DEFAULT NULL,
  `Grad_Mjesto` varchar(45) DEFAULT NULL,
  `Kucni_Broj` varchar(45) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Adrese`),
  KEY `fk_Adresa_Volonteri1_idx` (`Volonteri_ID_Volontera`),
  CONSTRAINT `fk_Adresa_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresa`
--

LOCK TABLES `adresa` WRITE;
/*!40000 ALTER TABLE `adresa` DISABLE KEYS */;
INSERT INTO `adresa` VALUES (1,'Jadranska','3200','Koprivnica','5',1),(2,'Japanska','2200','Osijek','11',2),(3,'Japanska','2200','Osijek','11',3),(4,'Drzimirova','1111','Zagreb','121',4),(5,'Hrvatskog_Dragovoljca','21','Split','331',5),(6,'Miodraga_Zderica','3131','Rijeka','777',6),(7,'Lelimirova','1221','Zadar','77',7);
/*!40000 ALTER TABLE `adresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brojevi`
--

DROP TABLE IF EXISTS `brojevi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `brojevi` (
  `ID_Brojevi` int(11) NOT NULL AUTO_INCREMENT,
  `Broj_Moba` int(11) DEFAULT NULL,
  `Broj_Telefona` int(11) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  `Volonteri_Nagradjivanja_ID_Nagradjivanja` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Brojevi`),
  KEY `fk_Brojevi_Volonteri1_idx` (`Volonteri_ID_Volontera`,`Volonteri_Nagradjivanja_ID_Nagradjivanja`),
  CONSTRAINT `fk_Brojevi_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brojevi`
--

LOCK TABLES `brojevi` WRITE;
/*!40000 ALTER TABLE `brojevi` DISABLE KEYS */;
INSERT INTO `brojevi` VALUES (1,978787878,21121112,1,NULL),(2,95637228,NULL,2,NULL),(3,917273832,NULL,3,NULL),(4,92323874,23323243,4,NULL),(5,983238743,3223243,5,NULL),(6,934238743,222533243,6,NULL),(7,934238743,NULL,7,NULL);
/*!40000 ALTER TABLE `brojevi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `email` (
  `ID_Email` int(11) NOT NULL AUTO_INCREMENT,
  `Gmail` varchar(45) DEFAULT NULL,
  `Hotmail` varchar(45) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Email`),
  UNIQUE KEY `ID_Email_UNIQUE` (`ID_Email`),
  KEY `fk_Email_Volonteri1_idx` (`Volonteri_ID_Volontera`),
  CONSTRAINT `fk_Email_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (1,'luka@gmail.com',NULL,1),(2,'sdas@gmail.com',NULL,2),(3,'swawd@gmail.com',NULL,3),(4,'kokos@gmail.com',NULL,4),(5,'lelerana@gmail.com',NULL,5),(6,'keeke@gmail.com',NULL,5),(7,'jandrla@gmail.com',NULL,7);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izvjesca`
--

DROP TABLE IF EXISTS `izvjesca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `izvjesca` (
  `ID_Izvjesca` int(11) NOT NULL AUTO_INCREMENT,
  `Opis_Izvjesca` varchar(45) DEFAULT NULL,
  `Datum_Predavanja` date DEFAULT NULL,
  `Datum_Od_Predavanja` date DEFAULT NULL,
  `Datum_Do_Predavanja` date DEFAULT NULL,
  `Zaduzenja_ID_Zaduzenja` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Izvjesca`),
  UNIQUE KEY `Zaduzenja_ID_Zaduzenja_UNIQUE` (`Zaduzenja_ID_Zaduzenja`),
  KEY `fk_Izvjesca_Zaduzenja1_idx` (`Zaduzenja_ID_Zaduzenja`),
  CONSTRAINT `fk_Izvjesca_Zaduzenja1` FOREIGN KEY (`Zaduzenja_ID_Zaduzenja`) REFERENCES `zaduzenja` (`ID_Zaduzenja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izvjesca`
--

LOCK TABLES `izvjesca` WRITE;
/*!40000 ALTER TABLE `izvjesca` DISABLE KEYS */;
INSERT INTO `izvjesca` VALUES (1,'Kopanje','2002-04-20','2003-03-20','2002-04-20',NULL),(2,'Kopanje ','2002-04-20','2003-03-20','2002-04-20',NULL),(3,'Gradjenje','2019-04-20','2019-03-27','2019-04-02',NULL);
/*!40000 ALTER TABLE `izvjesca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nagradjivanja`
--

DROP TABLE IF EXISTS `nagradjivanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nagradjivanja` (
  `ID_Nagradjivanja` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv_Ustanove` varchar(45) DEFAULT NULL,
  `Naziv_Tecaja` varchar(45) DEFAULT NULL,
  `Datum_Pocetka_Nagradjivanja` date DEFAULT NULL,
  `Datum_Zavrsetka_Nagradjivanja` date DEFAULT NULL,
  `Broj_Sati` int(11) DEFAULT NULL,
  `Iznos_Vrijednosti` decimal(10,0) DEFAULT NULL,
  `Opis_Nagradjivanja` varchar(45) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) NOT NULL,
  PRIMARY KEY (`ID_Nagradjivanja`),
  KEY `fk_Nagradjivanja_Volonteri1_idx` (`Volonteri_ID_Volontera`),
  CONSTRAINT `fk_Nagradjivanja_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nagradjivanja`
--

LOCK TABLES `nagradjivanja` WRITE;
/*!40000 ALTER TABLE `nagradjivanja` DISABLE KEYS */;
INSERT INTO `nagradjivanja` VALUES (1,'skoljic','bootcamp','2019-02-01','2019-04-02',32,8888,'tecaj za osposobljavanje programera',1),(2,'drenova','sobarmajstor','2019-02-01','2019-03-01',32,400,'tecaj za osposobljavanje sobara',2),(3,'stepri','notpad_master','2019-03-01','2019-04-01',40,500,'tecaj za osposobljavanje za pisanje u notepad',3);
/*!40000 ALTER TABLE `nagradjivanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekti`
--

DROP TABLE IF EXISTS `projekti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `projekti` (
  `ID_Projekta` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv_Projekta` varchar(45) DEFAULT NULL,
  `Datum_Pocetka` datetime DEFAULT NULL,
  `Datum_Zavrsetka` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Projekta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekti`
--

LOCK TABLES `projekti` WRITE;
/*!40000 ALTER TABLE `projekti` DISABLE KEYS */;
INSERT INTO `projekti` VALUES (1,'Gledanje','2019-03-01 00:00:00','2019-03-04'),(2,'Zujanje','2019-04-01 00:00:00','2019-04-06');
/*!40000 ALTER TABLE `projekti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `troskovi`
--

DROP TABLE IF EXISTS `troskovi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `troskovi` (
  `ID_Troskova` int(11) NOT NULL AUTO_INCREMENT,
  `Svrha_Troskova` varchar(45) DEFAULT NULL,
  `Vrsta_Naknade` varchar(45) DEFAULT NULL,
  `Iznos_Troskova` decimal(6,2) DEFAULT NULL,
  `Datum_Isplate_Troskova` varchar(45) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Troskova`),
  UNIQUE KEY `ID_Troskova_UNIQUE` (`ID_Troskova`),
  UNIQUE KEY `Volonteri_ID_Volontera_UNIQUE` (`Volonteri_ID_Volontera`),
  KEY `fk_Troskovi_Volonteri1_idx` (`Volonteri_ID_Volontera`),
  CONSTRAINT `fk_Troskovi_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `troskovi`
--

LOCK TABLES `troskovi` WRITE;
/*!40000 ALTER TABLE `troskovi` DISABLE KEYS */;
INSERT INTO `troskovi` VALUES (1,'Hrana','Jednokratna',222.99,'19-04-2019',1),(2,'Hrana','Jednokratna',89.99,'19-04-2019',2),(4,'Hrana','Jednokratna',29.99,'19-04-2019',4),(5,'Hrana','Jednokratna',29.99,'19-04-2019',5),(6,'Hrana','Jednokratna',39.99,'19-04-2019',6),(7,'Hrana','Jednokratna',329.99,'19-04-2019',7);
/*!40000 ALTER TABLE `troskovi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonteri`
--

DROP TABLE IF EXISTS `volonteri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `volonteri` (
  `ID_Volontera` int(11) NOT NULL AUTO_INCREMENT,
  `Ime_Volontera` varchar(45) DEFAULT NULL,
  `Prezime_Volontera` varchar(45) DEFAULT NULL,
  `Spol_Volontera` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID_Volontera`),
  UNIQUE KEY `ID_Volontera_UNIQUE` (`ID_Volontera`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonteri`
--

LOCK TABLES `volonteri` WRITE;
/*!40000 ALTER TABLE `volonteri` DISABLE KEYS */;
INSERT INTO `volonteri` VALUES (1,'Luka','Baljak','Z'),(2,'Borna','Baljak','Z'),(3,'Brna','Kist','M'),(4,'Najbolji','Volonter','M'),(5,'Najbolja','Volonterica','Z'),(6,'Volonterski','Volonter','M'),(7,'Branimir','Jandrlic','M');
/*!40000 ALTER TABLE `volonteri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonteri_has_projekti`
--

DROP TABLE IF EXISTS `volonteri_has_projekti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `volonteri_has_projekti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  `Projekti_ID_Projekta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Volonteri_has_Projekti_Projekti1_idx` (`Projekti_ID_Projekta`),
  KEY `fk_Volonteri_has_Projekti_Volonteri1_idx` (`Volonteri_ID_Volontera`),
  CONSTRAINT `fk_Volonteri_has_Projekti_Projekti1` FOREIGN KEY (`Projekti_ID_Projekta`) REFERENCES `projekti` (`ID_Projekta`),
  CONSTRAINT `fk_Volonteri_has_Projekti_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonteri_has_projekti`
--

LOCK TABLES `volonteri_has_projekti` WRITE;
/*!40000 ALTER TABLE `volonteri_has_projekti` DISABLE KEYS */;
/*!40000 ALTER TABLE `volonteri_has_projekti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaduzenja`
--

DROP TABLE IF EXISTS `zaduzenja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zaduzenja` (
  `ID_Zaduzenja` int(11) NOT NULL AUTO_INCREMENT,
  `Opis_Posla` varchar(45) DEFAULT NULL,
  `Sati_Volontiranja` int(11) DEFAULT NULL,
  `Datum_Pocetka_Zad` varchar(45) DEFAULT NULL,
  `Datum_Zavrsetka_Zad` varchar(45) DEFAULT NULL,
  `Volonteri_has_Projekti_id` int(11) NOT NULL,
  PRIMARY KEY (`ID_Zaduzenja`,`Volonteri_has_Projekti_id`),
  KEY `fk_Zaduzenja_Volonteri_has_Projekti1_idx` (`Volonteri_has_Projekti_id`),
  CONSTRAINT `fk_Zaduzenja_Volonteri_has_Projekti1` FOREIGN KEY (`Volonteri_has_Projekti_id`) REFERENCES `volonteri_has_projekti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaduzenja`
--

LOCK TABLES `zaduzenja` WRITE;
/*!40000 ALTER TABLE `zaduzenja` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaduzenja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zanimanje`
--

DROP TABLE IF EXISTS `zanimanje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zanimanje` (
  `zanimanje` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Iskustovo_Volontiranja` varchar(45) DEFAULT NULL,
  `Volonteri_ID_Volontera` int(11) DEFAULT NULL,
  `Volonteri_Nagradjivanja_ID_Nagradjivanja` int(11) DEFAULT NULL,
  KEY `fk_Zanimanje_Volonteri1_idx` (`Volonteri_ID_Volontera`,`Volonteri_Nagradjivanja_ID_Nagradjivanja`),
  CONSTRAINT `fk_Zanimanje_Volonteri1` FOREIGN KEY (`Volonteri_ID_Volontera`) REFERENCES `volonteri` (`ID_Volontera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zanimanje`
--

LOCK TABLES `zanimanje` WRITE;
/*!40000 ALTER TABLE `zanimanje` DISABLE KEYS */;
INSERT INTO `zanimanje` VALUES ('Informaticar','Dr.Mr.','0',1,NULL),('Informaticar','Dr.Mr.','30',2,NULL),('Doktor','Dr.Mr.','33',3,NULL),('Cipelar','Obucar','23',4,NULL),('Stolar','Stolar','223',5,NULL),('Pivar','Pivar','0',6,NULL),('Psiholog','Psiholog','0',7,NULL);
/*!40000 ALTER TABLE `zanimanje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-02 15:59:08
