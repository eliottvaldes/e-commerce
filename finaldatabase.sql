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
INSERT INTO `articulo` VALUES (1,'Taza magica','Taza personalizable que muestra una imagen al agregar una sustancia caliente',110,10,'assets/imgProductos/product-10.png','https://chat.whatsapp.com/EcoquXQvRsQDjLXm1abelm'),(2,'Collar de pareja','Collares de figuras variadas',55,10,'assets/imgProductos/product-04.png','https://chat.whatsapp.com/EcoquXQvRsQDjLXm1abelm'),(3,'Termo glitter','Termo de 700ml personalizable',250,10,'assets/imgProductos/product-06.png',NULL),(4,'Agenda 2020','Agendas personalizables de vinil/piel',220,5,'assets/imgProductos/product-12.png',NULL),(5,'SuperTips(100)','Con 100 colores primarios, secundarios y complementarios diferentes, estos marcadores lavables Crayola Super Tips garantizan que siempre tengas el color que buscas para completar tu obra de arte. ',599,10,'assets/imgProductos/product-01.png','null'),(6,'Libreta personalizada(Tipo 1) ','Libreta personalizable profesional de 100 hojas cuadriculadas en material MDF, cuenta con detalles limitados pero siempre personalizables',220,8,'assets/imgProductos/product-02.png','link'),(7,'Llaveros de pareja','Par de llaveros de acrilico con iniciales personalizable en colgante de madera',90,10,'assets/imgProductos/product-03.png','link'),(8,'Libreta personalizada(Tipo 2)','Libreta personalizable profesional de 100 hojas cuadriculadas en material MDF, cuenta con detalles limitados pero siempre personalizables',240,6,'assets/imgProductos/product-05.png','link'),(9,'Llavero de pareja','Par de llaveros de acrilico con la forma de manos entrelazadas',90,6,'assets/imgProductos/product-07.png','link'),(10,'Libreta personalizable(Tipo 3)','Libreta con pasta de madera personalizable',280,10,'assets/imgProductos/product-09.png','link'),(11,'Agenda de piel personalizable','Agenda 2020 con cubierta de piel personalizable',200,7,'assets/imgProductos/product-08.png','link'),(12,'Collar para mascotas','Graba el nombre de tu peque√É¬±o amigo en una de nuestras piezas de madera',25,7,'assets/imgProductos/product-11.png','link'),(13,'Llaveros de pareja (Puzzle)','Par de collares con forma de puzzle con grabaci√É¬≥n laser hechos en acrilico',90,9,'assets/imgProductos/product-13.png','link'),(15,'pruebalink','este es una prueba para el articulo xd',705,113,'assets/imgProductos/icon.png','https://chat.whatsapp.com/EcoquXQvRsQDjLXm1abelm');
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
  `count_arti` int(2) NOT NULL,
  PRIMARY KEY (`id_crt`),
  KEY `fk_id-usr_idx` (`id_user`),
  KEY `fk_id-art_idx` (`id_arti`),
  CONSTRAINT `fk_id-art` FOREIGN KEY (`id_arti`) REFERENCES `articulo` (`id_art`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id-usr` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id_usr`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
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
  `name_usr` blob NOT NULL,
  `appat_usr` blob NOT NULL,
  `apmat_usr` blob NOT NULL,
  `user_usr` varchar(20) NOT NULL,
  `ema_usr` blob NOT NULL,
  `pas_usr` blob NOT NULL,
  `priv_usr` int(11) NOT NULL,
  PRIMARY KEY (`id_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,_binary '˜Ω&\ﬁLdπ\’\Í(F]á\›',_binary 'ô)¨\√]Yfñz8D\ X+v',_binary 'É±ó±å\Ô†h\0+o°Iô','administrador',_binary 'PUMÍ°ú\À\\µv\‰GÚ\…-âÅSœòd{°\ÌòBß°˝\√\·',_binary '\nº±Æw\Ï	]\"\07û∫ö',1);
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

-- Dump completed on 2021-01-04  0:04:13
