CREATE DATABASE  IF NOT EXISTS `ifollowdatabase` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ifollowdatabase`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: ifollowdatabase
-- ------------------------------------------------------
-- Server version	5.6.14-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `postId` bigint(20) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comments_userId_idx` (`userId`),
  KEY `FK_comments_postId_idx` (`postId`),
  CONSTRAINT `FK_comments_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comments_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `ownerId` bigint(20) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_emails_ownerId_idx` (`ownerId`),
  CONSTRAINT `FK_emails_ownerId` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followers` (
  `followedId` bigint(20) NOT NULL,
  `followerId` bigint(20) NOT NULL,
  `isBlocked` bit(1) DEFAULT b'0',
  PRIMARY KEY (`followedId`,`followerId`),
  KEY `FK_followers_followerId_idx` (`followerId`),
  CONSTRAINT `FK_followers_followedId` FOREIGN KEY (`followedId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_followers_followerId` FOREIGN KEY (`followerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` bigint(20) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `ownerId` bigint(20) NOT NULL,
  `isAvatar` bit(1) DEFAULT b'0',
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_images_ownerId_idx` (`ownerId`),
  CONSTRAINT `FK_images_ownerId` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'201312022026299670.png',1,'\0','\0'),(2,'201312022035436636.png',1,'\0','\0'),(3,'201312022036169605.png',1,'\0','\0'),(4,'201312022049232875.png',1,'\0','\0'),(5,'201312022056081907.png',1,'\0','\0'),(6,'201312022056315210.png',1,'\0','\0'),(7,'201312022127210438.png',3,'\0','\0'),(8,'201312022128488848.png',3,'\0','\0'),(9,'201312022131295540.png',3,'\0','\0'),(10,'201312022133006452.png',3,'\0','\0'),(11,'201312022135198672.png',1,'\0','\0'),(12,'201312022137231112.png',2,'\0','\0'),(13,'201312022138236847.png',2,'\0','\0'),(14,'201312022140082017.png',2,'\0','\0'),(15,'201312022215362934.png',1,'\0','\0'),(16,'201312030730536231.png',1,'\0','\0'),(17,'201312032233413235.png',1,'\0','\0'),(18,'201312040647041675.png',4,'\0','\0');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `ownerId` bigint(20) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `commentId` bigint(20) DEFAULT NULL,
  `postId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notifications_ownerId_idx` (`ownerId`),
  KEY `FK_notificatons_commentId_idx` (`commentId`),
  KEY `FK_notifications_postId_idx` (`postId`),
  KEY `FK_notifications_userId_idx` (`userId`),
  CONSTRAINT `FK_notifications_ownerId` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_notifications_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_notifications_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_notificatons_commentId` FOREIGN KEY (`commentId`) REFERENCES `comments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `ownerId` bigint(20) NOT NULL,
  `imageId` bigint(20) DEFAULT '0',
  `dateCreated` datetime DEFAULT NULL,
  `rating` float DEFAULT '0',
  `isDeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK_posts_ownerId_idx` (`ownerId`),
  KEY `FK_posts_imageId_idx` (`imageId`),
  CONSTRAINT `FK_posts_imageId` FOREIGN KEY (`imageId`) REFERENCES `images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_posts_ownerId` FOREIGN KEY (`ownerId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Look at this awesome...thing',1,1,'2013-12-02 20:26:30',0,'\0'),(2,'To the Moon and Back',1,2,'2013-12-02 20:35:44',0,'\0'),(3,'Something\'s fishy here....',1,3,'2013-12-02 20:36:17',0,'\0'),(4,'Helloooooo!',1,4,'2013-12-02 20:49:24',0,'\0'),(5,'Fly',1,5,'2013-12-02 20:56:09',0,'\0'),(6,'house',1,6,'2013-12-02 20:56:32',0,'\0'),(7,'Awesome site',1,NULL,'2013-12-02 21:00:22',0,'\0'),(8,'Nice to have',3,7,'2013-12-02 21:27:21',0,'\0'),(9,'Christmas is coming!!!',3,8,'2013-12-02 21:28:49',0,'\0'),(10,'Let\'s think about a X-mass theme for the tree!!!',3,9,'2013-12-02 21:31:30',0,'\0'),(11,'Letter to Santa...',3,10,'2013-12-02 21:33:01',0,'\0'),(12,'Let it snow, let it snow, let it snow',1,11,'2013-12-02 21:35:20',0,'\0'),(13,'Snooooow!!!!',2,12,'2013-12-02 21:37:24',0,'\0'),(14,'...to me!!! :D',2,13,'2013-12-02 21:38:24',0,'\0'),(15,'Sleeeeep....',2,14,'2013-12-02 21:40:08',0,'\0'),(16,'Let\'s just...sleep',1,15,'2013-12-02 22:15:37',0,'\0'),(17,'cool',1,16,'2013-12-03 07:30:54',0,'\0'),(18,'EER',1,17,'2013-12-03 22:33:42',0,'\0'),(19,'diagram......................',4,18,'2013-12-04 06:47:05',0,'\0');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `userId` bigint(20) NOT NULL,
  `postId` bigint(20) NOT NULL,
  `value` int(11) DEFAULT '0',
  PRIMARY KEY (`userId`,`postId`),
  KEY `FK_ratings_postId_idx` (`postId`),
  CONSTRAINT `FK_ratings_postId` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ratings_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sharedposts`
--

DROP TABLE IF EXISTS `sharedposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sharedposts` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`userId`),
  KEY `FK_sharedposts_userId_idx` (`userId`),
  CONSTRAINT `FK_sharedposts_id` FOREIGN KEY (`id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sharedposts_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sharedposts`
--

LOCK TABLES `sharedposts` WRITE;
/*!40000 ALTER TABLE `sharedposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sharedposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `confirmationKey` varchar(45) DEFAULT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `isConfirmed` bit(1) DEFAULT b'0',
  `isDeleted` bit(1) DEFAULT b'0',
  `enabledNotif` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'laurasurcel16','','123456','laurasurcel16@gmail.com',NULL,'2013-12-01 13:52:15',NULL,NULL,NULL,NULL,NULL,NULL),(2,'andrei.spatarelu','','123456','andrei.spatarelu@gmail.com',NULL,'2013-12-01 15:00:54',NULL,NULL,NULL,NULL,NULL,NULL),(3,'sorin.sbora','','123456','sorin.sbora@gmail.com',NULL,'2013-12-02 23:24:19',NULL,NULL,NULL,NULL,NULL,NULL),(4,'elvira.popescu','','123456','elvira.popescu@gmail.com',NULL,'2013-12-04 08:43:37',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-07 10:35:44
