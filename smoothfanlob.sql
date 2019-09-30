-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: smoothfanlob
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` json DEFAULT NULL,
  `router` varchar(255) DEFAULT NULL,
  `userid` varchar(45) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (97,'{\"title\": \"你會哪幾種語言？\", \"topic\": [{\"q\": \"你會幾種語言？\", \"type\": \"radio\", \"option\": [\"一種\", \"兩種\", \"三種\", \"三種以上\"]}, {\"q\": \"包含下列哪些語言？\", \"type\": \"checkbox\", \"option\": [\"國語\", \"英語\", \"日語\", \"韓語\", \"其他\"]}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"type\": \"date\"}], \"router\": \"41569862437829\", \"userid\": \"4\", \"description\": \"想了解現代人大多會哪些語言\"}','41569862437829','4','你會哪幾種語言？','想了解現代人大多會哪些語言'),(98,'{\"title\": \"想喝什麼飲料？\", \"topic\": [{\"q\": \"你的名字\", \"type\": \"qa\"}, {\"q\": \"你的飲料要？\", \"type\": \"radio\", \"option\": [\"紅茶\", \"綠茶\", \"果汁\"]}], \"router\": \"41569862872320\", \"userid\": \"4\", \"description\": \"訂下午茶\"}','41569862872320','4','想喝什麼飲料？','訂下午茶');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `idmessage` int(11) NOT NULL AUTO_INCREMENT,
  `router` varchar(225) DEFAULT NULL,
  `userid` varchar(225) DEFAULT NULL,
  `message` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idmessage`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (13,'41568597146610','7','1234'),(14,'41568597146610','','wwwwww'),(15,'41568597146610','','');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `result` (
  `idresult` int(11) NOT NULL AUTO_INCREMENT,
  `router` varchar(225) NOT NULL,
  `result` json DEFAULT NULL,
  `time` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`idresult`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (14,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"三種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"英語\", \"日語\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 27, 2019\", \"type\": \"date\", \"number\": 3}]','1569862720856'),(15,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"一種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"其他\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 20, 2019\", \"type\": \"date\", \"number\": 3}]','1569862732230'),(16,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"兩種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"英語\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 13, 2019\", \"type\": \"date\", \"number\": 3}]','1569862743445'),(17,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"兩種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"英語\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 13, 2019\", \"type\": \"date\", \"number\": 3}]','1569862755885'),(18,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"三種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"日語\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 25, 2019\", \"type\": \"date\", \"number\": 3}]','1569862768179'),(19,'41569862437829','[{\"q\": \"你會幾種語言？\", \"ans\": \"一種\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"包含下列哪些語言？\", \"ans\": [\"日語\"], \"type\": \"checkbox\", \"number\": 2}, {\"q\": \"想要請您來分享語言學習相關經驗，想問方便在哪天？\", \"ans\": \"Oct 13, 2019\", \"type\": \"date\", \"number\": 3}]','1569862779006'),(20,'41569862872320','[{\"q\": \"你的名字\", \"ans\": \"test1\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的飲料要？\", \"ans\": \"紅茶\", \"type\": \"radio\", \"number\": 2}]','1569862981090'),(21,'41569862872320','[{\"q\": \"你的名字\", \"ans\": \"test2\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的飲料要？\", \"ans\": \"綠茶\", \"type\": \"radio\", \"number\": 2}]','1569862989184'),(22,'41569862872320','[{\"q\": \"你的名字\", \"ans\": \"test3\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的飲料要？\", \"ans\": \"果汁\", \"type\": \"radio\", \"number\": 2}]','1569862996666');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `access_expired` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `picture` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'native','aa','aa','0c35d8a893f5011a6cfe6828a079893d','1567757805996','aaa',NULL),(2,'native','qq','qq','b2b012866a39cc353ae1ef1f3d8564e7','1568077220904','qq',NULL),(3,'native','33','33','17e6c0ecc5e5fbb7d21d794ab6b26e24','1568080355005','33',NULL),(4,'native','123','123','4303909bb0ca0fdd7581a9d24a7adc58','1569857195032','12345','big.png-1569392347583.png'),(7,'facebook','cc','cc','a5ff0183a93d011853e65cf1037ed77e','1569561471430','cc',''),(12,NULL,NULL,'jwu7778@gmail.com',NULL,NULL,'1569689086674',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-01  1:14:23
