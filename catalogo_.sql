CREATE DATABASE  IF NOT EXISTS `carrito` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `carrito`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carrito
-- ------------------------------------------------------
-- Server version	5.7.30-log

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `id_art` int(11) NOT NULL AUTO_INCREMENT,
  `nom_art` varchar(50) NOT NULL,
  `des_art` varchar(500) NOT NULL,
  `prc_art` double NOT NULL,
  `stock_art` int(11) NOT NULL,
  `img_art` varchar(100) NOT NULL,
  `wts_art` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_art`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'Taza magica','Taza personalizable que muestra una imagen al agregar una sustancia caliente',110,10,'assets/imgProductos/product-10.png','link'),(2,'Collar de pareja','\r\nCollares de figuras variadas',55,10,'assets/imgProductos/product-04.png','https://chat.whatsapp.com/EcoquXQvRsQDjLXm1abelm'),(3,'Termo glitter','Termo de 700ml personalizable',250,10,'assets/imgProductos/product-06.png',NULL),(4,'Agenda 2020','Agendas personalizables de vinil/piel',220,5,'assets/imgProductos/product-12.png',NULL),(5,'SuperTips(100)','Con 100 colores primarios, secundarios y complementarios diferentes, estos marcadores lavables Crayola Super Tips garantizan que siempre tengas el color que buscas para completar tu obra de arte. Este conjunto de marcadores a granel es ideal para actividades para colorear en grupo y aporta tonos vÃ­vidos a libros para colorear, proyectos artesanales y mucho mÃ¡s. Ideal para profesores como suministros para el aula. AdemÃ¡s, Super Tips Marcadores dibujar lÃ­neas gruesas y delgadas todo en uno!',700,10,'assets/imgProductos/product-01.png',NULL),(6,'Libreta personalizada(Tipo 1) ','Libreta personalizable profesional de 100 hojas cuadriculadas en material MDF, cuenta con detalles limitados pero siempre personalizables',220,8,'assets/imgProductos/product-02.png','link'),(7,'Llaveros de pareja','Par de llaveros de acrilico con iniciales personalizable en colgante de madera',90,10,'assets/imgProductos/product-03.png','link'),(8,'Libreta personalizada(Tipo 2)','Libreta personalizable profesional de 100 hojas cuadriculadas en material MDF, cuenta con detalles limitados pero siempre personalizables',240,6,'assets/imgProductos/product-05.png','link'),(9,'Llavero de pareja','Par de llaveros de acrilico con la forma de manos entrelazadas',90,6,'assets/imgProductos/product-07.png','link'),(10,'Libreta personalizable(Tipo 3)','Libreta con pasta de madera personalizable',280,10,'assets/imgProductos/product-09.png','link'),(11,'Agenda de piel personalizable','Agenda 2020 con cubierta de piel personalizable',200,7,'assets/imgProductos/product-08.png','link'),(12,'Collar para mascotas','Graba el nombre de tu pequeÃ±o amigo en una de nuestras piezas de madera',25,7,'assets/imgProductos/product-11.png','link'),(13,'Llaveros de pareja (Puzzle)','Par de collares con forma de puzzle con grabaciÃ³n laser hechos en acrilico',90,9,'assets/imgProductos/product-13.png','link'),(15,'pruebalink','este es una prueba para el articulo xd',705,113,'assets/imgProductos/icon.png','https://chat.whatsapp.com/EcoquXQvRsQDjLXm1abelm');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id_crt` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_arti` int(11) NOT NULL,
  PRIMARY KEY (`id_crt`),
  KEY `fk_id-usr_idx` (`id_user`),
  KEY `fk_id-art_idx` (`id_arti`),
  CONSTRAINT `fk_id-art` FOREIGN KEY (`id_arti`) REFERENCES `articulo` (`id_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id-usr` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_usr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,3,2),(2,3,3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `id_usr` int(11) NOT NULL,
  `id_cartb` int(11) NOT NULL,
  `fec_com` datetime NOT NULL,
  `total_com` double NOT NULL,
  PRIMARY KEY (`id_com`),
  KEY `id_cli_idx` (`id_usr`),
  KEY `fk-idcart_idx` (`id_cartb`),
  CONSTRAINT `fk-idu` FOREIGN KEY (`id_usr`) REFERENCES `usuario` (`id_usr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,0,'2020-06-10 13:25:04',191.4),(2,1,0,'2020-06-11 11:40:53',290),(3,3,0,'2020-06-13 19:23:19',1067.2),(4,3,0,'2020-06-17 20:13:09',812),(5,2,0,'2020-06-18 08:43:15',133.4),(6,2,0,'2000-06-20 14:30:48',208.8),(7,1,0,'2000-06-21 21:04:12',290);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcompra`
--

DROP TABLE IF EXISTS `dcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dcompra` (
  `id_com` int(11) NOT NULL,
  `id_art` int(11) NOT NULL,
  `cant_com` int(11) NOT NULL,
  `subt_com` double NOT NULL,
  KEY `id_com_idx` (`id_com`),
  KEY `id_art_idx` (`id_art`),
  KEY `id_art_dc_idx` (`id_art`),
  KEY `id_art_index` (`id_art`),
  CONSTRAINT `id_art` FOREIGN KEY (`id_art`) REFERENCES `articulo` (`id_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_com` FOREIGN KEY (`id_com`) REFERENCES `compra` (`id_com`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcompra`
--

LOCK TABLES `dcompra` WRITE;
/*!40000 ALTER TABLE `dcompra` DISABLE KEYS */;
INSERT INTO `dcompra` VALUES (1,1,1,110),(1,2,1,55),(2,3,1,250),(3,5,1,700),(3,6,1,220),(4,5,1,700),(5,13,1,90),(5,12,1,25),(6,7,2,180),(7,11,1,200),(7,12,2,50);
/*!40000 ALTER TABLE `dcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id_favoritos` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_articulo` int(11) NOT NULL,
  PRIMARY KEY (`id_favoritos`),
  KEY `fk_id_user_idx` (`id_usuario`),
  KEY `fk_id_art_idx` (`id_articulo`),
  CONSTRAINT `fk_id_art` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`id_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_user` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (2,3,3),(3,3,5);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usr` int(11) NOT NULL AUTO_INCREMENT,
  `name_usr` varchar(30) NOT NULL,
  `appat_usr` varchar(20) NOT NULL,
  `apmat_usr` varchar(20) NOT NULL,
  `user_usr` varchar(20) NOT NULL,
  `ema_usr` varchar(50) NOT NULL,
  `pas_usr` varchar(15) NOT NULL,
  `priv_usr` int(11) NOT NULL,
  PRIMARY KEY (`id_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Eliot','Valdes','uwu','Eli','eliottvaldes@outlook.com','1234',1),(2,'Pedrito','Sola','Lola','pedrito','pedritosola@cismecito.com','yeah',1),(3,'Cliente','Benitez','Ramirez','uwu2000','correo@hotmail.com','123456',0),(4,'prueba','prueba','prueba','prueba','pruebaprogramacion007@gmail.com','prueba',0),(5,'diana','valdes','luis','alangas','diana@hotmail.com','alangas',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carrito'
--

--
-- Dumping routines for database 'carrito'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-02  0:20:57
