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
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('economia','fisi');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto_de_pago`
--

DROP TABLE IF EXISTS `concepto_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concepto_de_pago` (
  `ID_CONCEPTO` varchar(40) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL,
  `NUMERO_DE_CUENTA` varchar(10) DEFAULT NULL,
  `MONTO` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID_CONCEPTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto_de_pago`
--

LOCK TABLES `concepto_de_pago` WRITE;
/*!40000 ALTER TABLE `concepto_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto_de_pago` ENABLE KEYS */;
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
  `HORA_TRANSACCION` timestamp NULL DEFAULT NULL,
  `SEMESTRE` varchar(10) DEFAULT NULL,
  `codigo` varchar(40) NOT NULL,
  `ID_CONCEPTO` varchar(40) NOT NULL,
  PRIMARY KEY (`ID_HISTORIAL`),
  KEY `codigo_idx` (`codigo`),
  CONSTRAINT `codigo` FOREIGN KEY (`codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_de_transaccion`
--

LOCK TABLES `historial_de_transaccion` WRITE;
/*!40000 ALTER TABLE `historial_de_transaccion` DISABLE KEYS */;
INSERT INTO `historial_de_transaccion` VALUES (1,NULL,NULL,'6','13200240','210-1320'),(2,NULL,NULL,'6','13200240','210-9852'),(3,NULL,NULL,'7','13200237','210-9874');
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
  `codigo` varchar(40) NOT NULL,
  `ID_ROL` int(11) NOT NULL,
  PRIMARY KEY (`codigo`,`ID_ROL`),
  KEY `TIPO_ROL_ROL_FK` (`ID_ROL`),
  CONSTRAINT `TIPO_ROL_ROL_FK` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`),
  CONSTRAINT `TIPO_ROL_USUARIO_FK` FOREIGN KEY (`codigo`) REFERENCES `usuarios` (`codigo`)
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
  `ID_TRANSACCION` varchar(40) NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `ID_CONCEPTO` varchar(40) NOT NULL,
  `MONTO_TOTAL` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSACCION`),
  KEY `TRANSACCION_USUARIO_FK` (`codigo`),
  KEY `TRANSACCION_CONCEPTO_DE_PAGO_FK` (`ID_CONCEPTO`),
  CONSTRAINT `TRANSACCION_CONCEPTO_DE_PAGO_FK` FOREIGN KEY (`ID_CONCEPTO`) REFERENCES `concepto_de_pago` (`ID_CONCEPTO`),
  CONSTRAINT `TRANSACCION_USUARIO_FK` FOREIGN KEY (`codigo`) REFERENCES `usuarios` (`codigo`)
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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `codigo` varchar(40) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CORREO` varchar(50) DEFAULT NULL,
  `ESCUELA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('07200126','ROQUER','',''),('13200237','keevin','kevin@gmail.com','sistemas'),('13200240','deave','george@gmail.com','sistemas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-02 12:27:42
