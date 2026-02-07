CREATE DATABASE  IF NOT EXISTS `almaximodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `almaximodb`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: almaximodb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Id` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Activo` bit(1) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('CAMA-0811','Cama para gato',680.00,_binary '\0','Mascotas'),('CAMA-6797','Cama para gato',680.00,_binary '\0','Mascotas '),('CAMA-8809','Cama para gato',680.00,_binary '\0','Mascotas'),('CAMA-9715','Cama para gato',680.00,_binary '\0','Mascotas'),('CAMA-9733','Cama para gato',890.00,_binary '','Mascotas'),('COCA-0863','Coca-Cola 600ml',25.00,_binary '','Alimentos'),('ESCR-7008','Escritorio',1350.00,_binary '','Tecnologias'),('GORR-6351','gorra sport',287.00,_binary '','Ropa'),('HOND-9293','Honda CRV',250000.00,_binary '','Automovil'),('JVC -2087','JVC TV',5578.00,_binary '','Electrodomestico'),('LAPT-0219','Laptop HP',13899.00,_binary '','Tecnologias'),('LAPT-8721','Laptop',15000.00,_binary '\0','Tecnologias'),('LENT-4431','Lentes Ben&Frank ',1200.00,_binary '','opticos'),('LIBR-0760','Libreta Scribe',121.00,_binary '','Escolar'),('MONI-1272','Monitor Samsung',3789.00,_binary '','Tecnologias'),('MONI-3321','Monitor LG',4789.00,_binary '','Tecnologias'),('MOTO-9995','Motog10',3500.00,_binary '','Telefonia'),('RELO-3371','Reloj',800.00,_binary '','Tecnologias'),('SAMS-6054','Samsung SmartTV',8811.00,_binary '','Electrodomesticos'),('SIMB-3998','SimbaFunko',430.00,_binary '','FunkoPop de Simba'),('SOPI-0980','sopita de coditos',18.00,_binary '\0',NULL),('SUSU-1650','susuki ',78154.00,_binary '\0','automoviles'),('SUZU-9606','Suzuki Gixxer',58000.00,_binary '','Motocicletas '),('TECL-8879','Teclado',900.00,_binary '','Tecnologias'),('TEST-1351','test',590.00,_binary '','test'),('TEST-2427','test4',5.00,_binary '\0','test4'),('TEST-5018','testDummy3',17.00,_binary '','Test'),('TEST-5213','test1',100.00,_binary '','test'),('TEST-5659','TEST3',150.00,_binary '','TEST'),('TEST-8890','test2',7.00,_binary '\0','test');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_producto_before_insert` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
    IF NEW.Id IS NULL OR NEW.Id = '' THEN
        SET NEW.Id = CONCAT(
            UPPER(LEFT(NEW.Nombre, 4)),
            '-',
            LPAD(FLOOR(RAND() * 10000), 4, '0')
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productoproveedor`
--

DROP TABLE IF EXISTS `productoproveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productoproveedor` (
  `IdProducto` varchar(20) NOT NULL,
  `IdProveedor` int NOT NULL,
  `NombreProveedor` varchar(255) DEFAULT NULL,
  `PrecioProveedor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ClaveProveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`,`IdProveedor`),
  KEY `IdProveedor` (`IdProveedor`),
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`Id`),
  CONSTRAINT `productoproveedor_ibfk_2` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedor` (`IdProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoproveedor`
--

LOCK TABLES `productoproveedor` WRITE;
/*!40000 ALTER TABLE `productoproveedor` DISABLE KEYS */;
INSERT INTO `productoproveedor` VALUES ('CAMA-9733',453,'Grupo Montes Urales',5874.00,'Cma842'),('CAMA-9733',785,'Grupo Soriana',667.85,'HN7218'),('COCA-0863',785,'Grupo Soriana',943.00,'PG4415'),('ESCR-7008',453,'Grupo Montes Urales',254.02,'SB2878'),('GORR-6351',785,'Grupo Soriana',844.84,'NB8618'),('HOND-9293',655,'Tecnologias de Mexico SA',7600.00,'honda1'),('LAPT-0219',655,'Tecnologias de Mexico SA',103.08,'MJ5087'),('LAPT-0219',785,'Grupo Soriana',224.75,'IG2763'),('LENT-4431',904,'Mercantil Los Pinos',835.00,'lente_1BFRK'),('LENT-4431',906,'Comercializadora San Jorge',850.00,'Ben&Fra_lent1'),('LIBR-0760',453,'Grupo Montes Urales',340.19,'TY4797'),('LIBR-0760',785,'Grupo Soriana',381.44,'HO8729'),('MONI-3321',655,'Tecnologias de Mexico SA',678.52,'QG4477'),('MONI-3321',785,'Grupo Soriana',3587.00,'tvlg_sor'),('MOTO-9995',655,'Tecnologias de Mexico SA',237.05,'PO9687'),('SAMS-6054',785,'Grupo Soriana',7899.00,'startSamg1'),('SIMB-3998',453,'Grupo Montes Urales',246.71,'XC8019'),('SUZU-9606',453,'Grupo Montes Urales',619.38,'OZ4105'),('TECL-8879',785,'Grupo Soriana',762.83,'QA2705'),('TEST-1351',903,'Suministros del Bajío',750.00,'testinterno5'),('TEST-2427',453,'Grupo Montes Urales',4.00,'testinterno4'),('TEST-5018',785,'Grupo Soriana',15.00,'testinterDummy3'),('TEST-5213',655,'Tecnologias de Mexico SA',882.17,'UH1481'),('TEST-5213',785,'Grupo Soriana',745.00,'testdummy'),('TEST-5659',453,'Grupo Montes Urales',493.23,'AV9826'),('TEST-5659',785,'Grupo Soriana',600.00,'testdummy3.32'),('TEST-8890',785,'Grupo Soriana',524.09,'KR1364');
/*!40000 ALTER TABLE `productoproveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `IdProveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=908 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (453,'Grupo Montes Urales',_binary ''),(655,'Tecnologias de Mexico SA',_binary ''),(785,'Grupo Soriana',_binary ''),(900,'Abarrotera Universal',_binary ''),(901,'Distribuidora del Centro',_binary ''),(902,'Comercializadora La Estrella',_binary ''),(903,'Suministros del Bajío',_binary ''),(904,'Mercantil Los Pinos',_binary ''),(905,'Proveedora Nacional',_binary ''),(906,'Comercializadora San Jorge',_binary ''),(907,'Abastos del Norte',_binary '');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoproducto` (
  `IdTipoProducto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Activo` bit(1) DEFAULT b'1',
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'almaximodb'
--

--
-- Dumping routines for database 'almaximodb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductoProveedor_Actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoProveedor_Actualizar`(
    IN p_IdProducto VARCHAR(20),
    IN p_IdProveedor INT,
    IN p_PrecioProveedor DECIMAL(10,2),
    IN p_ClaveProveedor VARCHAR(50)
)
BEGIN
    UPDATE ProductoProveedor
    SET 
        PrecioProveedor = p_PrecioProveedor,
        ClaveProveedor = p_ClaveProveedor
    WHERE IdProducto = p_IdProducto
      AND IdProveedor = p_IdProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductoProveedor_Eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoProveedor_Eliminar`(
    IN p_IdProducto VARCHAR(20),
    IN p_IdProveedor INT
)
BEGIN
    DELETE FROM ProductoProveedor
    WHERE IdProducto = p_IdProducto
      AND IdProveedor = p_IdProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductoProveedor_Insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoProveedor_Insertar`(
    IN p_IdProducto VARCHAR(20),
    IN p_IdProveedor INT,
    IN p_PrecioProveedor DECIMAL(10,2),
    IN p_ClaveProveedor VARCHAR(50)
)
BEGIN
    INSERT INTO ProductoProveedor 
        (IdProducto, IdProveedor, NombreProveedor, PrecioProveedor, ClaveProveedor)
    SELECT 
        p_IdProducto,
        IdProveedor,
        Nombre,
        p_PrecioProveedor,
        p_ClaveProveedor
    FROM Proveedor
    WHERE IdProveedor = p_IdProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductoProveedor_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoProveedor_Listar`(
    IN p_IdProducto VARCHAR(20)
)
BEGIN
    SELECT 
        IdProducto,
        IdProveedor,
        NombreProveedor,
        PrecioProveedor,
        ClaveProveedor
    FROM ProductoProveedor
    WHERE IdProducto = p_IdProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ProductoProveedor_Obtener` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ProductoProveedor_Obtener`(
    IN p_IdProducto VARCHAR(20),
    IN p_IdProveedor INT
)
BEGIN
    SELECT 
        IdProducto,
        IdProveedor,
        NombreProveedor,
        PrecioProveedor,
        ClaveProveedor
    FROM ProductoProveedor
    WHERE IdProducto = p_IdProducto
      AND IdProveedor = p_IdProveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Producto_Actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Producto_Actualizar`(
    IN p_Id VARCHAR(20),
    IN p_Nombre VARCHAR(100),
    IN p_Precio DECIMAL(10,2),
    IN p_Descripcion VARCHAR(200)
)
BEGIN
    UPDATE Producto
    SET Nombre = p_Nombre,
        Precio = p_Precio,
        Descripcion = p_Descripcion
    WHERE Id = p_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Producto_Buscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Producto_Buscar`(
    IN p_Texto VARCHAR(100)
)
BEGIN
    SELECT 
        Id,
        Nombre,
        Descripcion,
        Precio,
        Activo
    FROM Producto
    WHERE Activo = 1
      AND (
           Nombre LIKE CONCAT('%', p_Texto, '%')
        OR Descripcion LIKE CONCAT('%', p_Texto, '%')
        OR Id LIKE CONCAT('%', p_Texto, '%')
      );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Producto_Eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Producto_Eliminar`(
    IN p_Id VARCHAR(20)
)
BEGIN
    UPDATE Producto
    SET Activo = 0
    WHERE Id = p_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Producto_Insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Producto_Insertar`(
    IN p_Id VARCHAR(20),
    IN p_Nombre VARCHAR(100),
    IN p_Descripcion VARCHAR(200),
    IN p_Precio DECIMAL(10,2)
)
BEGIN
    INSERT INTO Producto (Id, Nombre, Descripcion, Precio, Activo)
    VALUES (p_Id, p_Nombre, p_Descripcion, p_Precio, 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Producto_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Producto_Listar`()
BEGIN
    SELECT 
        Id,
        Nombre,
        Descripcion,
        Precio,
        Activo
    FROM Producto
    WHERE Activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Proveedor_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Proveedor_Listar`()
BEGIN
    SELECT IdProveedor, Nombre
    FROM Proveedor
    WHERE Activo = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_TipoProducto_Listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_TipoProducto_Listar`()
BEGIN
    SELECT IdTipoProducto, Nombre
    FROM TipoProducto
    WHERE Activo = 1;
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

-- Dump completed on 2026-02-07 17:07:05
