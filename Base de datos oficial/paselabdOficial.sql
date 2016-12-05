-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: pasarelabd
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `nombre` varchar(200) NOT NULL,
  `contrasenia` varchar(200) NOT NULL,
  `contraseniaDeEdicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('economia','fisi','economiaFisiAdmi');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto` (
  `ID_P` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `id_concepto` varchar(10) DEFAULT NULL,
  `monto` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID_P`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto`
--

LOCK TABLES `concepto` WRITE;
/*!40000 ALTER TABLE `concepto` DISABLE KEYS */;
INSERT INTO `concepto` VALUES (1,'Carnet','201-302',10.00),(2,'2da repitencia','201-224',12.50),(3,'3ra repitencia','201-331',25.00),(4,'laboratorio','201-324',35.00),(5,'Autoseguro','201-325',45.00),(6,'4ta repitencia','201-326',55.00),(7,'5ta repitencia','201-327',65.00),(8,'6ta repitencia','201-309',70.00);
/*!40000 ALTER TABLE `concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_de_transaccion`
--

DROP TABLE IF EXISTS `historial_de_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial_de_transaccion` (
  `ID_HISTORIAL` int(11) NOT NULL,
  `FECHA_TRANSACCION` date DEFAULT NULL,
  `HORA_TRANSACCION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEMESTRE` varchar(10) DEFAULT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `ID_CONCEPTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_HISTORIAL`),
  KEY `HISTORIAL_DE_TRANSACCION_TRANSACCION_FK` (`ID_USUARIO`,`ID_CONCEPTO`),
  CONSTRAINT `HISTORIAL_DE_TRANSACCION_TRANSACCION_FK` FOREIGN KEY (`ID_USUARIO`, `ID_CONCEPTO`) REFERENCES `transaccion` (`ID`, `ID_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_de_transaccion`
--

LOCK TABLES `historial_de_transaccion` WRITE;
/*!40000 ALTER TABLE `historial_de_transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_de_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL,
  `NOMBREROL` varchar(30) DEFAULT NULL,
  `TIPOROL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_rol`
--

DROP TABLE IF EXISTS `tipo_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_rol` (
  `ID` int(11) NOT NULL,
  `ID_ROL` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`ID_ROL`),
  KEY `TIPO_ROL_ROL_FK` (`ID_ROL`),
  CONSTRAINT `TIPO_ROL_ROL_FK` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_rol`
--

LOCK TABLES `tipo_rol` WRITE;
/*!40000 ALTER TABLE `tipo_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `ID` int(11) NOT NULL,
  `ID_P` int(11) NOT NULL,
  `MONTO_TOTAL` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`ID_P`),
  KEY `TRANSACCION_CONCEPTO_DE_PAGO_FK` (`ID_P`),
  CONSTRAINT `TRANSACCION_CONCEPTO_DE_PAGO_FK` FOREIGN KEY (`ID_P`) REFERENCES `concepto` (`ID_P`),
  CONSTRAINT `TRANSACCION_USUARIO_FK` FOREIGN KEY (`ID`) REFERENCES `usuario` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(8) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `EAP` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'12345678','Kevin Yzacupe','mail1@unmsm.com','Software'),(2,'12345601','Ronald Santos','mail12@unmsm.com','Software'),(3,'12345602','Miguel Silva','mail13@unmsm.com','Software'),(4,'12345603','Eugenia Perez','mail4@unmsm.com','Software'),(5,'12345604','Magaly Balta','mail15@unmsm.com','Software'),(6,'12345605','Deave Torres','mail16@unmsm.com','Software'),(7,'12345606','Christiam Mendives','mail17@unmsm.com','Software'),(8,'12345607','Fernando Supo','mail18@unmsm.com','Software'),(9,'12345608','Jose Zea','mail19@unmsm.com','Software'),(10,'13200060','Christiam Mendives','mendives@unmsm.com','Software');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-03  9:29:32
