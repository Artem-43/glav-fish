-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: my_database
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `bank_visits`
--

DROP TABLE IF EXISTS `bank_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_visits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `arrival_date` date NOT NULL,
  `departure_date` date NOT NULL,
  `fish_quality` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `bank_visits_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_visits`
--

LOCK TABLES `bank_visits` WRITE;
/*!40000 ALTER TABLE `bank_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boats`
--

DROP TABLE IF EXISTS `boats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `boat_type` varchar(100) NOT NULL,
  `displacement` float NOT NULL,
  `build_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boats`
--

LOCK TABLES `boats` WRITE;
/*!40000 ALTER TABLE `boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `boats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_members`
--

DROP TABLE IF EXISTS `crew_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `trip_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  CONSTRAINT `crew_members_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_members`
--

LOCK TABLES `crew_members` WRITE;
/*!40000 ALTER TABLE `crew_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish_catches`
--

DROP TABLE IF EXISTS `fish_catches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fish_catches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int NOT NULL,
  `fish_type_id` int NOT NULL,
  `weight` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trip_id` (`trip_id`),
  KEY `fish_type_id` (`fish_type_id`),
  CONSTRAINT `fish_catches_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`),
  CONSTRAINT `fish_catches_ibfk_2` FOREIGN KEY (`fish_type_id`) REFERENCES `fish_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish_catches`
--

LOCK TABLES `fish_catches` WRITE;
/*!40000 ALTER TABLE `fish_catches` DISABLE KEYS */;
/*!40000 ALTER TABLE `fish_catches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fish_types`
--

DROP TABLE IF EXISTS `fish_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fish_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fish_types`
--

LOCK TABLES `fish_types` WRITE;
/*!40000 ALTER TABLE `fish_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `fish_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boat_id` int NOT NULL,
  `departure_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boat_id` (`boat_id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`boat_id`) REFERENCES `boats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01 23:53:46
