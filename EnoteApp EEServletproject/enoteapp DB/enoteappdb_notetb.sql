-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: enoteappdb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `notetb`
--

DROP TABLE IF EXISTS `notetb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notetb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL,
  `content` text,
  `date` date DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notetb`
--

LOCK TABLES `notetb` WRITE;
/*!40000 ALTER TABLE `notetb` DISABLE KEYS */;
INSERT INTO `notetb` VALUES (63,'What is Java?','Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.','2023-11-25',26,'active'),(64,'What is Java?','Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.','2023-11-25',26,'deleted'),(65,'Defense of the Ancients (DotA) ','Defense of the Ancients (DotA) is a multiplayer online battle arena (MOBA) mod for the video game Warcraft III: Reign of Chaos (2002) and its expansion, The Frozen Throne. The objective of the game is for each team to destroy their opponents\' Ancient, a heavily guarded structure at the opposing corner of the map. Players use powerful units known as heroes, and are assisted by allied teammates and AI-controlled fighters. As in role-playing games, players level up their heroes and use gold to buy equipment during the game.','2023-11-25',26,'active'),(66,'Defense of the Ancients (DotA) ','Defense of the Ancients (DotA) is a multiplayer online battle arena (MOBA) mod for the video game Warcraft III: Reign of Chaos (2002) and its expansion, The Frozen Throne. The objective of the game is for each team to destroy their opponents\' Ancient, a heavily guarded structure at the opposing corner of the map. Players use powerful units known as heroes, and are assisted by allied teammates and AI-controlled fighters. As in role-playing games, players level up their heroes and use gold to buy equipment during the game.','2023-11-25',26,'deleted'),(67,'Happiness','Happiness is that feeling that comes over you when you know life is good and you can\'t help but smile. It\'s the opposite of sadness.\r\n\r\nHappiness is a sense of well-being, joy, or contentment. When people are successful, or safe, or lucky, they feel happiness. The \"pursuit of happiness\" is something this country is based on, and different people feel happiness for different reasons. Whenever doing something causes happiness, people usually want to do more of it. No one ever complained about feeling too much happiness.','2023-11-25',26,'active'),(68,'Happiness','Happiness is that feeling that comes over you when you know life is good and you can\'t help but smile. It\'s the opposite of sadness.\r\n\r\nHappiness is a sense of well-being, joy, or contentment. When people are successful, or safe, or lucky, they feel happiness. The \"pursuit of happiness\" is something this country is based on, and different people feel happiness for different reasons. Whenever doing something causes happiness, people usually want to do more of it. No one ever complained about feeling too much happiness.','2023-11-25',26,'deleted'),(69,' Music','Music is generally defined as the art of arranging sound to create some combination of form, harmony, melody, rhythm, or otherwise expressive content.[1][2][3] Definitions of music vary depending on culture,[4] though it is an aspect of all human societies and a cultural universal.[5] While scholars agree that music is defined by a few specific elements, there is no consensus on their precise definitions.[6] The creation of music is commonly divided into musical composition, musical improvisation, and musical performance,[7] though the topic itself extends into academic disciplines, criticism, philosophy, psychology, and therapeutic contexts. Music may be performed or improvised using a vast range of instruments, including the human voice.','2023-11-25',26,'active'),(70,' Music','Music is generally defined as the art of arranging sound to create some combination of form, harmony, melody, rhythm, or otherwise expressive content.[1][2][3] Definitions of music vary depending on culture,[4] though it is an aspect of all human societies and a cultural universal.[5] While scholars agree that music is defined by a few specific elements, there is no consensus on their precise definitions.[6] The creation of music is commonly divided into musical composition, musical improvisation, and musical performance,[7] though the topic itself extends into academic disciplines, criticism, philosophy, psychology, and therapeutic contexts. Music may be performed or improvised using a vast range of instruments, including the human voice.','2023-11-25',26,'deleted'),(71,'Hobby',' hobby is considered to be a regular activity that is done for enjoyment, typically during one\'s leisure time. Hobbies include collecting themed items and objects, engaging in creative and artistic pursuits, playing sports, or pursuing other amusements. Participation in hobbies encourages acquiring substantial skills and knowledge in that area. A list of hobbies changes with renewed interests and developing fashions, making it diverse and lengthy. Hobbies tend to follow trends in society. For example, stamp collecting was popular during the nineteenth and twentieth centuries as postal systems were the main means of communication; as of 2023, video games became more popular following technological advances. The advancing production and technology of the nineteenth century provided workers with more leisure time to engage in hobbies. Because of this, the efforts of people investing in hobbies has increased with time.','2023-11-25',26,'active'),(72,' Toggle the table of contents Hobby',' hobby is considered to be a regular activity that is done for enjoyment, typically during one\'s leisure time. Hobbies include collecting themed items and objects, engaging in creative and artistic pursuits, playing sports, or pursuing other amusements. Participation in hobbies encourages acquiring substantial skills and knowledge in that area. A list of hobbies changes with renewed interests and developing fashions, making it diverse and lengthy. Hobbies tend to follow trends in society. For example, stamp collecting was popular during the nineteenth and twentieth centuries as postal systems were the main means of communication; as of 2023, video games became more popular following technological advances. The advancing production and technology of the nineteenth century provided workers with more leisure time to engage in hobbies. Because of this, the efforts of people investing in hobbies has increased with time.','2023-11-25',26,'deleted'),(73,'Bladvasvabldv','afdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfas','2023-11-25',26,'deleted'),(74,'Bladvasvabldv','afdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfasafdsafasfas','2023-11-25',26,'deleted');
/*!40000 ALTER TABLE `notetb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-25 18:48:46
