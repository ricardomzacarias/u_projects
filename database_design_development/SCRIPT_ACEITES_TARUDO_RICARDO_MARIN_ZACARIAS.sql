CREATE DATABASE  IF NOT EXISTS `aceituna_8` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aceituna_8`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: aceituna_8
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agricultor`
--

DROP TABLE IF EXISTS `agricultor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agricultor` (
  `id_agricultor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `cooperativa` enum('si','no') NOT NULL,
  PRIMARY KEY (`id_agricultor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agricultor`
--

LOCK TABLES `agricultor` WRITE;
/*!40000 ALTER TABLE `agricultor` DISABLE KEYS */;
INSERT INTO `agricultor` VALUES (1,'yolanda','si'),(2,'jose','si'),(3,'manuel','no'),(4,'arturo','si'),(5,'sofia','si'),(6,'fernando','si'),(7,'joselito','no'),(9,'saxon','no');
/*!40000 ALTER TABLE `agricultor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `ref_almacen` int NOT NULL AUTO_INCREMENT,
  `cantidad_kgs` int NOT NULL,
  `destino` enum('almacen','prensado') NOT NULL,
  `id_agricultor` int DEFAULT NULL,
  `id_olivo` int NOT NULL,
  `id_cuba` int DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  PRIMARY KEY (`ref_almacen`),
  KEY `fk_almacen_olivo1_idx` (`id_olivo`),
  CONSTRAINT `fk_almacen_olivo1` FOREIGN KEY (`id_olivo`) REFERENCES `olivo` (`id_olivo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,100,'almacen',1,1,NULL,'2023-01-01'),(2,1000,'almacen',1,1,NULL,'2023-01-01'),(3,-1100,'prensado',NULL,1,1,'2023-01-01'),(4,750,'almacen',2,1,NULL,'2023-01-05'),(5,1500,'almacen',3,2,NULL,'2023-01-10');
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(45) DEFAULT NULL,
  `cooperativa` enum('si','no') NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'embotelladora astros caidos','no',NULL),(2,'masudo ','si',NULL),(3,'asus corporation','si',NULL),(4,'mayorista geforce','no',NULL),(6,'mallorcasa','si',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuba_mix`
--

DROP TABLE IF EXISTS `cuba_mix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuba_mix` (
  `id_cuba_mix` int NOT NULL AUTO_INCREMENT,
  `capacidad_total` int NOT NULL,
  `capacidad_actual` int NOT NULL,
  `id_recetas` int DEFAULT NULL,
  PRIMARY KEY (`id_cuba_mix`),
  KEY `fk_cuba_mix_recetas1_idx` (`id_recetas`),
  CONSTRAINT `fk_cuba_mix_recetas1` FOREIGN KEY (`id_recetas`) REFERENCES `recetas` (`id_recetas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuba_mix`
--

LOCK TABLES `cuba_mix` WRITE;
/*!40000 ALTER TABLE `cuba_mix` DISABLE KEYS */;
INSERT INTO `cuba_mix` VALUES (1,5000,0,0),(2,3000,3000,2);
/*!40000 ALTER TABLE `cuba_mix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cubas_basica`
--

DROP TABLE IF EXISTS `cubas_basica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cubas_basica` (
  `id_cuba` int NOT NULL,
  `capacidad_total` int NOT NULL,
  `capacidad_actual` int NOT NULL,
  `capacidad_restante` int GENERATED ALWAYS AS ((`capacidad_total` - `capacidad_actual`)) STORED,
  `porcentaje_llenado` int GENERATED ALWAYS AS (((`capacidad_actual` * 100) / `capacidad_total`)) STORED,
  `id_olivo_usado` int DEFAULT NULL,
  PRIMARY KEY (`id_cuba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cubas_basica`
--

LOCK TABLES `cubas_basica` WRITE;
/*!40000 ALTER TABLE `cubas_basica` DISABLE KEYS */;
INSERT INTO `cubas_basica` (`id_cuba`, `capacidad_total`, `capacidad_actual`, `id_olivo_usado`) VALUES (1,5000,0,NULL),(2,4000,0,1),(3,3000,3000,1),(4,6000,0,NULL);
/*!40000 ALTER TABLE `cubas_basica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada_almacen`
--

DROP TABLE IF EXISTS `entrada_almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada_almacen` (
  `ref_entrada` int NOT NULL,
  `id_agricultor` int NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  KEY `fk_entrada_almacen_table1_idx` (`ref_entrada`),
  KEY `fk_entrada_almacen_agricultor1_idx` (`id_agricultor`),
  CONSTRAINT `fk_entrada_almacen_agricultor1` FOREIGN KEY (`id_agricultor`) REFERENCES `agricultor` (`id_agricultor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_entrada_almacen_table1` FOREIGN KEY (`ref_entrada`) REFERENCES `almacen` (`ref_almacen`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada_almacen`
--

LOCK TABLES `entrada_almacen` WRITE;
/*!40000 ALTER TABLE `entrada_almacen` DISABLE KEYS */;
INSERT INTO `entrada_almacen` VALUES (1,1,'2023-02-25'),(2,1,'2023-01-01'),(4,2,'2023-01-05'),(5,3,'2023-01-10');
/*!40000 ALTER TABLE `entrada_almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olivo`
--

DROP TABLE IF EXISTS `olivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `olivo` (
  `id_olivo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_olivo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olivo`
--

LOCK TABLES `olivo` WRITE;
/*!40000 ALTER TABLE `olivo` DISABLE KEYS */;
INSERT INTO `olivo` VALUES (1,'arbequina'),(2,'hojiblanca'),(3,'picual'),(4,'cornibranca');
/*!40000 ALTER TABLE `olivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prensado`
--

DROP TABLE IF EXISTS `prensado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prensado` (
  `ref_prensado` int NOT NULL,
  `id_cuba` int NOT NULL,
  `id_olivo` int NOT NULL,
  `cantidad_kgs` int NOT NULL,
  `cantidad_lts` int GENERATED ALWAYS AS ((`cantidad_kgs` * 0.25)) STORED,
  `fecha_actualizacion` date NOT NULL,
  KEY `fk_prensado_almacen1_idx` (`ref_prensado`),
  KEY `fk_prensado_cubas1_idx` (`id_cuba`),
  CONSTRAINT `fk_prensado_almacen1` FOREIGN KEY (`ref_prensado`) REFERENCES `almacen` (`ref_almacen`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prensado_cubas1` FOREIGN KEY (`id_cuba`) REFERENCES `cubas_basica` (`id_cuba`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prensado`
--

LOCK TABLES `prensado` WRITE;
/*!40000 ALTER TABLE `prensado` DISABLE KEYS */;
INSERT INTO `prensado` (`ref_prensado`, `id_cuba`, `id_olivo`, `cantidad_kgs`, `fecha_actualizacion`) VALUES (3,1,1,1100,'2023-01-01');
/*!40000 ALTER TABLE `prensado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_recetas` int NOT NULL AUTO_INCREMENT,
  `caracteristicas` varchar(45) DEFAULT NULL,
  `olivos_usados` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_recetas`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (0,'0','0'),(1,'70% / 30%','hojiblanca, picual'),(2,'50% / 50%','arbequina, cornibranca'),(3,'20% / 80%','picual, arbequina'),(4,'60% / 40%','cornibranca, hojiblanca'),(6,'20% / 80%','picual,cornibranca');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_ventas` int NOT NULL AUTO_INCREMENT,
  `id_receta` int DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `cantidad_lts` int NOT NULL,
  `descripcion` enum('receta','basico') DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `fk_ventas_recetas1_idx` (`id_receta`),
  KEY `fk_ventas_cliente1_idx` (`id_cliente`),
  CONSTRAINT `fk_ventas_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_ventas_recetas1` FOREIGN KEY (`id_receta`) REFERENCES `recetas` (`id_recetas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,2000,NULL,'2023-01-02'),(2,2,2,1000,NULL,NULL),(3,4,6,2500,NULL,'2023-02-02'),(4,2,3,800,NULL,'2023-01-03'),(5,NULL,1,4000,NULL,'2023-01-04');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-27  2:01:44
