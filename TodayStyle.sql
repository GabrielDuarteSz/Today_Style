-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: todaystyle
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `carrito_compras`
--

DROP TABLE IF EXISTS `carrito_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_compras` (
  `idCarrito` int(11) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `detalleCompra` varchar(100) NOT NULL,
  `valorCompra` varchar(100) NOT NULL,
  `fechaCompra` datetime NOT NULL,
  `precioVenta` varchar(45) NOT NULL,
  `estadoCompra` tinyint(4) NOT NULL,
  PRIMARY KEY (`idCarrito`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idCarrito`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_compras`
--

LOCK TABLES `carrito_compras` WRITE;
/*!40000 ALTER TABLE `carrito_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `Talla` varchar(10) NOT NULL,
  `Color` varchar(60) NOT NULL,
  `tipoPrenda` varchar(40) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_usuario`
--

DROP TABLE IF EXISTS `historial_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_usuario` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `fechaCompra` datetime NOT NULL,
  `totalCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_idUsuario_Historial` (`idUsuario`),
  KEY `fk_idPedido_Historial` (`idPedido`),
  CONSTRAINT `fk_idPedido_Historial` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario_Historial` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_usuario`
--

LOCK TABLES `historial_usuario` WRITE;
/*!40000 ALTER TABLE `historial_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `fechaInventario` datetime NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  PRIMARY KEY (`idInventario`),
  CONSTRAINT `idProducto` FOREIGN KEY (`idInventario`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPagos` int(11) NOT NULL,
  `metodoPago` varchar(45) NOT NULL,
  `fechaPago` datetime NOT NULL,
  PRIMARY KEY (`idPagos`),
  CONSTRAINT `idPedido` FOREIGN KEY (`idPagos`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `estadoPedido` varchar(45) NOT NULL,
  `logisticaPedido` varchar(45) NOT NULL,
  `Factura` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCarrito` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_idUsuario` (`idUsuario`),
  KEY `fk_idCarrito` (`idCarrito`),
  CONSTRAINT `fk_idCarrito` FOREIGN KEY (`idCarrito`) REFERENCES `carrito_compras` (`idCarrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(45) NOT NULL,
  `precioProducto` varchar(45) NOT NULL,
  `descripciónProducto` varchar(100) NOT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `idCarrito` FOREIGN KEY (`idProducto`) REFERENCES `carrito_compras` (`idCarrito`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCategoria` FOREIGN KEY (`idProducto`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseña`
--

DROP TABLE IF EXISTS `reseña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseña` (
  `idReseña` int(11) NOT NULL AUTO_INCREMENT,
  `calificacion` int(11) NOT NULL,
  `comentario` varchar(250) NOT NULL,
  `fechaReseña` datetime NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idReseña`),
  KEY `fk_idUsuario_Reseña` (`idUsuario`),
  KEY `fk_idProducto_Reseña` (`idProducto`),
  CONSTRAINT `fk_idProducto_Reseña` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario_Reseña` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseña`
--

LOCK TABLES `reseña` WRITE;
/*!40000 ALTER TABLE `reseña` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombresUsuario` varchar(80) NOT NULL,
  `apellidosUsuario` varchar(80) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `telefonoUsuario` varchar(15) NOT NULL,
  `direcciónUsuario` varchar(80) NOT NULL,
  `passwordUsuario` varchar(200) NOT NULL,
  `rolUsuario` varchar(45) NOT NULL,
  `loginUsuario` datetime NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10000,'Cristian Andres','Alarcon Sogamoso','cristian_aalarcon@soy.sena.edu.co','3102782961','Calle 51 # 12 - 49','PruebadeCarga2025','Administrador','2025-03-05 22:39:12'),(10001,'Sergio Stiven','Barrera','sergio_sbarrera@soy.sena.edu.co','3132770815','Calle 51 # 12 - 49','PruebadeCarga2025','Administrador','2025-03-05 22:47:08'),(10002,'Carlos Daniel','Martinez','cdmartinez5608@soy.sena.edu.co','3107223298','Calle 51 # 12 - 49','pruebadeCarga2025','Administrador','2025-03-08 10:04:08'),(10004,'Gabriel Esteban','Duarte','gabriel_eduarte@soy.sena.edu.co','3013157014','Calle 51 # 12 - 49 ','PruebadeCarga2025','Administrador','2025-03-08 10:50:10'),(10005,'Carlos ','Castillo','carlos_dcastillo@soy.sena.edu.co','3112016065','Calle 51 # 12 - 49','pruebadeCarga2024','Administrador','2025-03-08 10:52:10');
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

-- Dump completed on 2025-03-08 17:07:02
