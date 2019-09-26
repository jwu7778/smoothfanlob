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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
INSERT INTO `form` VALUES (66,'{\"title\": \"你好誒\", \"topic\": [{\"q\": \"心情如何？\", \"type\": \"qa\"}, {\"q\": \"最適合的形容詞\", \"type\": \"radio\", \"option\": [\"開心\", \"快樂\", \"幸福\", \"傷心\"]}, {\"q\": \"早餐吃什麼\", \"type\": \"checkbox\", \"option\": [\"牛奶\", \"蛋餅\", \"豆漿\", \"飯糰\"]}, {\"q\": \"今天幾號？\", \"type\": \"date\"}], \"router\": \"41568597146610\", \"userid\": \"4\", \"description\": \"妳好\"}','41568597146610','4','你好誒','妳好'),(78,'{\"title\": \"你叫什麼名字？\", \"topic\": [{\"q\": \"你的名字\", \"type\": \"qa\"}, {\"q\": \"你的生肖\", \"type\": \"radio\", \"option\": [\"鼠\", \"牛\", \"虎\", \"兔\", \"龍\"]}, {\"q\": \"你喜歡哪個數字\", \"type\": \"checkbox\", \"option\": [\"1\", \"2\", \"3\", \"4\", \"5\", \"6\"]}, {\"q\": \"生日幾號？\", \"type\": \"date\"}], \"router\": \"41569201062341\", \"userid\": \"4\", \"description\": \"想要了解大家gfg\"}','41569201062341','4','你叫什麼名字？','想要了解大家gfg'),(83,'{\"title\": \"gg\", \"topic\": [{\"q\": \"dddddddd\", \"type\": \"qa\"}], \"router\": \"41569394712670\", \"userid\": \"4\", \"description\": \"\"}','41569394712670','4','gg',''),(84,NULL,'41569405140412','4',NULL,NULL),(85,'{\"title\": \"test\", \"topic\": [{\"q\": \"d23r23r3r23\", \"type\": \"checkbox\", \"option\": [\"\"]}], \"router\": \"41569463356862\", \"userid\": \"4\", \"description\": \"123\"}','41569463356862','4','test','123');
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,'41568526978712','[{\"q\": \"231123\", \"ans\": \"qweqweqw\", \"type\": \"radio\", \"number\": 1}, {\"q\": \"eqweqweqw\", \"ans\": [\"ewqeqweqwe\"], \"type\": \"checkbox\", \"number\": 2}]','1568527438061'),(2,'41568597146610','[{\"q\": \"心情如何？\", \"ans\": \"還好\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"最適合的形容詞\", \"ans\": \"快樂\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"早餐吃什麼\", \"ans\": [\"蛋餅\", \"豆漿\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"今天幾號？\", \"ans\": \"Sep 16, 2019\", \"type\": \"date\", \"number\": 4}]','1568597273914'),(3,'41568597146610','[{\"q\": \"心情如何？\", \"ans\": \"還好\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"最適合的形容詞\", \"ans\": \"幸福\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"早餐吃什麼\", \"ans\": [\"蛋餅\", \"豆漿\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"今天幾號？\", \"ans\": \"Sep 16, 2019\", \"type\": \"date\", \"number\": 4}]','1568597305859'),(4,'41568770435135','[{\"q\": \"sdadasdasreberberber\", \"ans\": \"fwefwfwqdqw\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"sadadasd\", \"ans\": \"wdwdqwdqw\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"dwdwdqwdqwfvdfvdfv\", \"ans\": [\"weqwe\", \"dqwdwdqw\"], \"type\": \"checkbox\", \"number\": 3}]','1568771805172'),(5,'41568597146610','[{\"q\": \"心情如何？\", \"ans\": \"傷心\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"最適合的形容詞\", \"ans\": \"傷心\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"早餐吃什麼\", \"ans\": [\"牛奶\", \"蛋餅\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"今天幾號？\", \"ans\": \"Sep 25, 2019\", \"type\": \"date\", \"number\": 4}]','1568772881303'),(6,'41568968435632','[{\"q\": \"weee\", \"ans\": \"eeeee\", \"type\": \"radio\", \"number\": 1}]','1568968481704'),(7,'41569201062341','[{\"q\": \"你的名字\", \"ans\": \"佳穎\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的生肖\", \"ans\": \"牛\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"你喜歡哪個數字\", \"ans\": [\"3\", \"4\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"生日幾號？\", \"ans\": \"Sep 22, 2019\", \"type\": \"date\", \"number\": 4}]','1569201858017'),(8,'41569201062341','[{\"q\": \"你的名字\", \"ans\": \"Crystal\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的生肖\", \"ans\": \"鼠\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"你喜歡哪個數字\", \"ans\": [\"5\", \"6\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"生日幾號？\", \"ans\": \"Sep 01, 2019\", \"type\": \"date\", \"number\": 4}]','1569201891648'),(9,'41569201062341','[{\"q\": \"你的名字\", \"ans\": \"tt\", \"type\": \"qa\", \"number\": 1}, {\"q\": \"你的生肖\", \"ans\": \"牛\", \"type\": \"radio\", \"number\": 2}, {\"q\": \"你喜歡哪個數字\", \"ans\": [\"3\", \"4\"], \"type\": \"checkbox\", \"number\": 3}, {\"q\": \"生日幾號？\", \"ans\": \"Sep 29, 2019\", \"type\": \"date\", \"number\": 4}]','1569204690365'),(10,'41569394712670','[{\"q\": \"dddddddd\", \"ans\": \"\", \"type\": \"qa\", \"number\": 1}]','1569394778280');
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
  `access_token` varchar(45) DEFAULT NULL,
  `access_expired` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `picture` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'native','aa','aa','0c35d8a893f5011a6cfe6828a079893d','1567757805996','aaa',NULL),(2,'native','qq','qq','b2b012866a39cc353ae1ef1f3d8564e7','1568077220904','qq',NULL),(3,'native','33','33','17e6c0ecc5e5fbb7d21d794ab6b26e24','1568080355005','33',NULL),(4,'native','123','123','9348fd55bcd1cd79844bc0daa961f544','1569400146770','123','big.png-1569392347583.png'),(5,'native','22','22','23ade80a46764b6ec5a689b3bb0d8ca4','1568177302765','22',NULL),(6,'native','88','88','e1bb3ad9e4ec2ecd9eda15d918d143eb','1568382506253','88',NULL),(7,'native','cc','cc','6d747f1d02c4508ce0530d1865d1b349','1568387529114','cc',NULL);
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

-- Dump completed on 2019-09-26 10:15:07
