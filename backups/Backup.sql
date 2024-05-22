CREATE DATABASE  IF NOT EXISTS `equipo_de_futbol_bastardmunchen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `equipo_de_futbol_bastardmunchen`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: equipo_de_futbol_bastardmunchen
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aficionados`
--

DROP TABLE IF EXISTS `aficionados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aficionados` (
  `aficionado_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `equipo_favorito` int NOT NULL,
  PRIMARY KEY (`aficionado_id`),
  KEY `equipo_favorito` (`equipo_favorito`),
  CONSTRAINT `aficionados_ibfk_1` FOREIGN KEY (`equipo_favorito`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los aficionados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aficionados`
--

LOCK TABLES `aficionados` WRITE;
/*!40000 ALTER TABLE `aficionados` DISABLE KEYS */;
INSERT INTO `aficionados` VALUES (1,'Juan','Pérez','1990-01-01',1),(2,'Luis','González','1985-02-15',2),(3,'María','López','1992-03-10',3);
/*!40000 ALTER TABLE `aficionados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentariosobservaciones`
--

DROP TABLE IF EXISTS `comentariosobservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentariosobservaciones` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `jugador_id` int NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_comentario` date NOT NULL,
  PRIMARY KEY (`comentario_id`),
  KEY `jugador_id` (`jugador_id`),
  CONSTRAINT `comentariosobservaciones_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`jugador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene comentarios y observaciones sobre los jugadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentariosobservaciones`
--

LOCK TABLES `comentariosobservaciones` WRITE;
/*!40000 ALTER TABLE `comentariosobservaciones` DISABLE KEYS */;
INSERT INTO `comentariosobservaciones` VALUES (1,1,'Buen desempeño en el último partido.','2024-04-02');
/*!40000 ALTER TABLE `comentariosobservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `contrato_id` int NOT NULL AUTO_INCREMENT,
  `jugador_id` int NOT NULL,
  `equipo_id` int NOT NULL,
  `patrocinador_id` int DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`contrato_id`),
  KEY `jugador_id` (`jugador_id`),
  KEY `equipo_id` (`equipo_id`),
  KEY `patrocinador_id` (`patrocinador_id`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`jugador_id`),
  CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`),
  CONSTRAINT `contratos_ibfk_3` FOREIGN KEY (`patrocinador_id`) REFERENCES `patrocinadores` (`patrocinador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los contratos de jugadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES (1,1,1,1,'2023-07-01','2025-06-30',1832400.00),(2,2,1,2,'2023-07-01','2025-06-30',305350.00),(3,3,1,3,'2023-07-01','2025-06-30',915900.00);
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarSalarioTotalEquipo` AFTER INSERT ON `contratos` FOR EACH ROW BEGIN
    DECLARE total_salario DECIMAL(10, 2);
    SELECT SUM(salario) INTO total_salario
    FROM Jugadores
    WHERE equipo_id = NEW.equipo_id;
    
    UPDATE Equipos
    SET salario_total = total_salario
    WHERE equipo_id = NEW.equipo_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrenadores`
--

DROP TABLE IF EXISTS `entrenadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenadores` (
  `entrenador_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `posicion` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `equipo_id` int DEFAULT NULL,
  PRIMARY KEY (`entrenador_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `entrenadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información básica de los entrenadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrenadores`
--

LOCK TABLES `entrenadores` WRITE;
/*!40000 ALTER TABLE `entrenadores` DISABLE KEYS */;
INSERT INTO `entrenadores` VALUES (1,'Noel','Noa','Entrenador/Delantero','1971-04-02','Países Bajos',15000000.00,1),(2,'Jurgen','Klopp','Entrenador','1967-06-16','Alemania',12000000.00,2);
/*!40000 ALTER TABLE `entrenadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `entrenadorespornacionalidad`
--

DROP TABLE IF EXISTS `entrenadorespornacionalidad`;
/*!50001 DROP VIEW IF EXISTS `entrenadorespornacionalidad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entrenadorespornacionalidad` AS SELECT 
 1 AS `nacionalidad`,
 1 AS `total_entrenadores`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `equipo_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `estadio` varchar(100) NOT NULL,
  PRIMARY KEY (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información básica de los equipos de fútbol';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'Bastard München','Alemania','Blue Lock Stadium'),(2,'Real Madrid','España','Santiago Bernabéu'),(3,'FC Barcelona','España','Camp Nou');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadios`
--

DROP TABLE IF EXISTS `estadios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadios` (
  `estadio_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `capacidad` int NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `equipo_id` int DEFAULT NULL,
  PRIMARY KEY (`estadio_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `estadios_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los estadios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadios`
--

LOCK TABLES `estadios` WRITE;
/*!40000 ALTER TABLE `estadios` DISABLE KEYS */;
INSERT INTO `estadios` VALUES (1,'Blue Lock Stadium',50000,'Múnich',1),(2,'Santiago Bernabéu',81044,'Madrid',2),(3,'Camp Nou',99354,'Barcelona',3);
/*!40000 ALTER TABLE `estadios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidades` (
  `habilidad_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`habilidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información sobre las habilidades de los jugadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Metavisión','Habilidad de ver el campo de juego desde una perspectiva amplia'),(2,'Movimiento sin balón','Capacidad de moverse estratégicamente sin tener la pelota'),(3,'Potencia de tiro','Fuerza y precisión en los disparos a portería');
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidadesjugadores`
--

DROP TABLE IF EXISTS `habilidadesjugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidadesjugadores` (
  `jugador_id` int NOT NULL,
  `habilidad_id` int NOT NULL,
  `nivel` enum('BAJO','MEDIO','ALTO') DEFAULT NULL,
  PRIMARY KEY (`jugador_id`,`habilidad_id`),
  KEY `habilidad_id` (`habilidad_id`),
  CONSTRAINT `habilidadesjugadores_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`jugador_id`),
  CONSTRAINT `habilidadesjugadores_ibfk_2` FOREIGN KEY (`habilidad_id`) REFERENCES `habilidades` (`habilidad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaciona jugadores con sus habilidades y niveles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidadesjugadores`
--

LOCK TABLES `habilidadesjugadores` WRITE;
/*!40000 ALTER TABLE `habilidadesjugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidadesjugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `jugador_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `habilidades_destacadas` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `equipo_id` int DEFAULT NULL,
  PRIMARY KEY (`jugador_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información básica de los jugadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Michael','Kaiser','Delantero','Metavisión, Movimientos sin balón, Potencia de tiro, Consciencia Espacial, \"Impacto Kaiser\", Ojo del Depredador','1998-04-27','Alemania',1832400.00,1),(2,'Alexis','Ness','Mediapunta','Flexibilidad, Regate, Pase','2000-10-27','Alemania',305350.00,1),(3,'Yoichi','Isagi','Delantero','Conciencia espacial, Tiro directo, Movimiento sin balón, Reflejos, Metavisión, Estado de Flow','1999-04-01','Japón',915900.00,1);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `jugadoresconlesionesactuales`
--

DROP TABLE IF EXISTS `jugadoresconlesionesactuales`;
/*!50001 DROP VIEW IF EXISTS `jugadoresconlesionesactuales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jugadoresconlesionesactuales` AS SELECT 
 1 AS `jugador_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `tipo_lesion`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `jugadoresdestacados`
--

DROP TABLE IF EXISTS `jugadoresdestacados`;
/*!50001 DROP VIEW IF EXISTS `jugadoresdestacados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jugadoresdestacados` AS SELECT 
 1 AS `jugador_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `posicion`,
 1 AS `habilidades_destacadas`,
 1 AS `salario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lesiones`
--

DROP TABLE IF EXISTS `lesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesiones` (
  `lesion_id` int NOT NULL AUTO_INCREMENT,
  `jugador_id` int NOT NULL,
  `tipo_lesion` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`lesion_id`),
  KEY `jugador_id` (`jugador_id`),
  CONSTRAINT `lesiones_ibfk_1` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`jugador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de las lesiones de los jugadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesiones`
--

LOCK TABLES `lesiones` WRITE;
/*!40000 ALTER TABLE `lesiones` DISABLE KEYS */;
INSERT INTO `lesiones` VALUES (1,1,'Rotura de ligamentos','2024-01-15','2024-04-15'),(2,2,'Fractura de tobillo','2024-02-10','2024-05-10'),(3,3,'Distensión muscular','2024-03-20','2024-04-20');
/*!40000 ALTER TABLE `lesiones` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarFechaInicioLesion` BEFORE INSERT ON `lesiones` FOR EACH ROW BEGIN
    DECLARE fecha_inicio_existente DATE;
    SELECT fecha_inicio INTO fecha_inicio_existente
    FROM Lesiones
    WHERE jugador_id = NEW.jugador_id
    ORDER BY fecha_inicio ASC
    LIMIT 1;

    IF fecha_inicio_existente IS NOT NULL AND NEW.fecha_inicio < fecha_inicio_existente THEN
        UPDATE Lesiones
        SET fecha_inicio = NEW.fecha_inicio
        WHERE jugador_id = NEW.jugador_id
        ORDER BY fecha_inicio ASC
        LIMIT 1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `medico_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `equipo_id` int NOT NULL,
  PRIMARY KEY (`medico_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los médicos de los equipos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Carlos','Gómez','Traumatología',1),(2,'Roberto','Fernández','Fisioterapia',2),(3,'Ana','Martínez','Medicina Deportiva',3);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `partido_id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estadio` varchar(100) NOT NULL,
  `equipo_local_id` int NOT NULL,
  `equipo_visitante_id` int NOT NULL,
  `resultado_local` int DEFAULT NULL,
  `resultado_visitante` int DEFAULT NULL,
  PRIMARY KEY (`partido_id`),
  KEY `equipo_local_id` (`equipo_local_id`),
  KEY `equipo_visitante_id` (`equipo_visitante_id`),
  CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`equipo_local_id`) REFERENCES `equipos` (`equipo_id`),
  CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los partidos, equipos participantes y resultados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,'2024-04-02','17:00:00','Blue Lock Stadium',1,2,1,1);
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `partidospendientes`
--

DROP TABLE IF EXISTS `partidospendientes`;
/*!50001 DROP VIEW IF EXISTS `partidospendientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partidospendientes` AS SELECT 
 1 AS `partido_id`,
 1 AS `fecha`,
 1 AS `hora`,
 1 AS `estadio`,
 1 AS `equipo_local_id`,
 1 AS `equipo_visitante_id`,
 1 AS `resultado_local`,
 1 AS `resultado_visitante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `patrocinadores`
--

DROP TABLE IF EXISTS `patrocinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patrocinadores` (
  `patrocinador_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `industria` varchar(100) NOT NULL,
  PRIMARY KEY (`patrocinador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los patrocinadores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patrocinadores`
--

LOCK TABLES `patrocinadores` WRITE;
/*!40000 ALTER TABLE `patrocinadores` DISABLE KEYS */;
INSERT INTO `patrocinadores` VALUES (1,'Adidas','Deportes'),(2,'Nike','Deportes'),(3,'Puma','Deportes');
/*!40000 ALTER TABLE `patrocinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patrocinadoresyjugadores`
--

DROP TABLE IF EXISTS `patrocinadoresyjugadores`;
/*!50001 DROP VIEW IF EXISTS `patrocinadoresyjugadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patrocinadoresyjugadores` AS SELECT 
 1 AS `patrocinador`,
 1 AS `jugador_nombre`,
 1 AS `jugador_apellido`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suplentes`
--

DROP TABLE IF EXISTS `suplentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suplentes` (
  `suplente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `posicion` varchar(50) NOT NULL,
  `habilidades_destacadas` varchar(255) DEFAULT '(NO_INFO)',
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT '(NO_INFO)',
  `salario` decimal(10,2) DEFAULT '0.00',
  `equipo_id` int DEFAULT NULL,
  PRIMARY KEY (`suplente_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `suplentes_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información básica de los suplentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suplentes`
--

LOCK TABLES `suplentes` WRITE;
/*!40000 ALTER TABLE `suplentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `suplentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulos` (
  `titulo_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `año` int NOT NULL,
  `equipo_id` int NOT NULL,
  PRIMARY KEY (`titulo_id`),
  KEY `equipo_id` (`equipo_id`),
  CONSTRAINT `titulos_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`equipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene información de los títulos ganados por los equipos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos`
--

LOCK TABLES `titulos` WRITE;
/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
INSERT INTO `titulos` VALUES (1,'Champions League',2023,1),(2,'La Liga',2023,2),(3,'Copa del Rey',2023,3);
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'equipo_de_futbol_bastardmunchen'
--

--
-- Dumping routines for database 'equipo_de_futbol_bastardmunchen'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcularDuracionLesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularDuracionLesion`(lesion_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE duracion INT;
    SELECT DATEDIFF(IFNULL(fecha_fin, CURDATE()), fecha_inicio) INTO duracion
    FROM Lesiones
    WHERE lesion_id = lesion_id;
    RETURN duracion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SalarioTotalEquipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `SalarioTotalEquipo`(equipo_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(salario) INTO total
    FROM Jugadores
    WHERE equipo_id = equipo_id;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarSalarioJugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarSalarioJugador`(IN jugador_id INT, IN nuevo_salario DECIMAL(10,2))
BEGIN
    -- Verificar si el jugador existe
    DECLARE jugador_existente INT;
    SELECT COUNT(*) INTO jugador_existente FROM Jugadores WHERE jugador_id = jugador_id;

    -- Si el jugador existe, actualizar su salario
    IF jugador_existente > 0 THEN
        UPDATE Jugadores SET salario = nuevo_salario WHERE jugador_id = jugador_id;
        SELECT CONCAT('Se actualizó el salario del jugador con ID ', jugador_id, ' a $', nuevo_salario) AS 'Mensaje';
    ELSE
        SELECT 'No se encontró ningún jugador con el ID especificado.' AS 'Error';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerInformacionJugador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerInformacionJugador`(IN jugador_id INT)
BEGIN
    -- Variables para almacenar la información
    DECLARE jugador_nombre VARCHAR(100);
    DECLARE jugador_apellido VARCHAR(100);
    DECLARE jugador_posicion VARCHAR(50);
    DECLARE jugador_habilidades TEXT;
    DECLARE jugador_lesiones TEXT;
    DECLARE jugador_comentarios TEXT;

    -- Obtener información básica del jugador
    SELECT nombre, apellido, posicion INTO jugador_nombre, jugador_apellido, jugador_posicion
    FROM Jugadores
    WHERE jugador_id = jugador_id;

    -- Obtener habilidades del jugador
    SELECT GROUP_CONCAT(nombre SEPARATOR ', ') INTO jugador_habilidades
    FROM Habilidades
    WHERE habilidad_id IN (
        SELECT habilidad_id FROM HabilidadesJugadores WHERE jugador_id = jugador_id
    );

    -- Obtener lesiones actuales del jugador
    SELECT GROUP_CONCAT(tipo_lesion SEPARATOR ', ') INTO jugador_lesiones
    FROM Lesiones
    WHERE jugador_id = jugador_id AND (fecha_fin IS NULL OR fecha_fin > CURDATE());

    -- Obtener comentarios y observaciones sobre el jugador
    SELECT GROUP_CONCAT(descripcion SEPARATOR '; ') INTO jugador_comentarios
    FROM ComentariosObservaciones
    WHERE jugador_id = jugador_id;

    -- Mostrar la información obtenida
    SELECT 
        jugador_nombre AS 'Nombre',
        jugador_apellido AS 'Apellido',
        jugador_posicion AS 'Posición',
        jugador_habilidades AS 'Habilidades',
        IFNULL(jugador_lesiones, 'Ninguna') AS 'Lesiones Actuales',
        IFNULL(jugador_comentarios, 'Ninguno') AS 'Comentarios/Observaciones';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `entrenadorespornacionalidad`
--

/*!50001 DROP VIEW IF EXISTS `entrenadorespornacionalidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `entrenadorespornacionalidad` AS select `entrenadores`.`nacionalidad` AS `nacionalidad`,count(0) AS `total_entrenadores` from `entrenadores` group by `entrenadores`.`nacionalidad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jugadoresconlesionesactuales`
--

/*!50001 DROP VIEW IF EXISTS `jugadoresconlesionesactuales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jugadoresconlesionesactuales` AS select `j`.`jugador_id` AS `jugador_id`,`j`.`nombre` AS `nombre`,`j`.`apellido` AS `apellido`,`l`.`tipo_lesion` AS `tipo_lesion`,`l`.`fecha_inicio` AS `fecha_inicio`,`l`.`fecha_fin` AS `fecha_fin` from (`jugadores` `j` join `lesiones` `l` on((`j`.`jugador_id` = `l`.`jugador_id`))) where ((`l`.`fecha_fin` is null) or (`l`.`fecha_fin` > curdate())) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jugadoresdestacados`
--

/*!50001 DROP VIEW IF EXISTS `jugadoresdestacados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jugadoresdestacados` AS select `jugadores`.`jugador_id` AS `jugador_id`,`jugadores`.`nombre` AS `nombre`,`jugadores`.`apellido` AS `apellido`,`jugadores`.`posicion` AS `posicion`,`jugadores`.`habilidades_destacadas` AS `habilidades_destacadas`,`jugadores`.`salario` AS `salario` from `jugadores` where (`jugadores`.`salario` > 1000000) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partidospendientes`
--

/*!50001 DROP VIEW IF EXISTS `partidospendientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partidospendientes` AS select `partidos`.`partido_id` AS `partido_id`,`partidos`.`fecha` AS `fecha`,`partidos`.`hora` AS `hora`,`partidos`.`estadio` AS `estadio`,`partidos`.`equipo_local_id` AS `equipo_local_id`,`partidos`.`equipo_visitante_id` AS `equipo_visitante_id`,`partidos`.`resultado_local` AS `resultado_local`,`partidos`.`resultado_visitante` AS `resultado_visitante` from `partidos` where (`partidos`.`fecha` > curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patrocinadoresyjugadores`
--

/*!50001 DROP VIEW IF EXISTS `patrocinadoresyjugadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patrocinadoresyjugadores` AS select `p`.`nombre` AS `patrocinador`,`j`.`nombre` AS `jugador_nombre`,`j`.`apellido` AS `jugador_apellido`,`c`.`fecha_inicio` AS `fecha_inicio`,`c`.`fecha_fin` AS `fecha_fin` from ((`patrocinadores` `p` join `contratos` `c` on((`p`.`patrocinador_id` = `c`.`patrocinador_id`))) join `jugadores` `j` on((`c`.`jugador_id` = `j`.`jugador_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 19:20:28
