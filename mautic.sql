-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: host.docker.internal    Database: mautic
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asset_downloads`
--

DROP TABLE IF EXISTS `asset_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int unsigned DEFAULT NULL,
  `ip_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `email_id` int unsigned DEFAULT NULL,
  `date_download` datetime NOT NULL,
  `code` int NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A6494C8F5DA1941` (`asset_id`),
  KEY `IDX_A6494C8FA03F5E9F` (`ip_id`),
  KEY `IDX_A6494C8F55458D` (`lead_id`),
  KEY `IDX_A6494C8FA832C1C9` (`email_id`),
  KEY `download_tracking_search` (`tracking_id`),
  KEY `download_source_search` (`source`,`source_id`),
  KEY `asset_date_download` (`date_download`),
  CONSTRAINT `FK_A6494C8F55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_A6494C8F5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6494C8FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_A6494C8FA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_downloads`
--

LOCK TABLES `asset_downloads` WRITE;
/*!40000 ALTER TABLE `asset_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_path` longtext COLLATE utf8mb4_unicode_ci,
  `original_file_name` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `download_count` int NOT NULL,
  `unique_download_count` int NOT NULL,
  `revision` int NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `disallow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79D17D8E12469DE2` (`category_id`),
  KEY `asset_alias_search` (`alias`),
  CONSTRAINT `FK_79D17D8E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint unsigned NOT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `date_added` datetime NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_search` (`object`,`object_id`),
  KEY `timeline_search` (`bundle`,`object`,`action`,`object_id`),
  KEY `date_added_index` (`date_added`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES
(1,0,'System','lead','lead',1,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:24','127.0.0.1'),
(2,0,'System','lead','lead',1,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:24','127.0.0.1'),
(3,0,'System','lead','lead',2,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:24','127.0.0.1'),
(4,0,'System','lead','lead',2,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:24','127.0.0.1'),
(5,0,'System','lead','lead',3,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:25','127.0.0.1'),
(6,0,'System','lead','lead',3,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:25','127.0.0.1'),
(7,0,'System','lead','lead',4,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:25','127.0.0.1'),
(8,0,'System','lead','lead',4,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:25','127.0.0.1'),
(9,0,'System','lead','lead',5,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:25','127.0.0.1'),
(10,0,'System','lead','lead',5,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:25','127.0.0.1'),
(11,0,'System','lead','lead',6,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:25','127.0.0.1'),
(12,0,'System','lead','lead',6,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:25','127.0.0.1'),
(13,0,'System','lead','lead',7,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:26','127.0.0.1'),
(14,0,'System','lead','lead',7,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:26','127.0.0.1'),
(15,0,'System','lead','lead',8,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:26','127.0.0.1'),
(16,0,'System','lead','lead',8,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:26','127.0.0.1'),
(17,0,'System','lead','lead',9,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:26','127.0.0.1'),
(18,0,'System','lead','lead',9,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:26','127.0.0.1'),
(19,0,'System','lead','lead',10,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:26','127.0.0.1'),
(20,0,'System','lead','lead',10,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:26','127.0.0.1'),
(21,0,'System','lead','lead',11,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:27','127.0.0.1'),
(22,0,'System','lead','lead',11,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:27','127.0.0.1'),
(23,0,'System','lead','lead',12,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:27','127.0.0.1'),
(24,0,'System','lead','lead',12,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:27','127.0.0.1'),
(25,0,'System','lead','lead',13,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:27','127.0.0.1'),
(26,0,'System','lead','lead',13,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:27','127.0.0.1'),
(27,0,'System','lead','lead',14,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:28','127.0.0.1'),
(28,0,'System','lead','lead',14,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:28','127.0.0.1'),
(29,0,'System','lead','lead',15,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:28','127.0.0.1'),
(30,0,'System','lead','lead',15,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:28','127.0.0.1'),
(31,0,'System','lead','lead',16,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:28','127.0.0.1'),
(32,0,'System','lead','lead',16,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:28','127.0.0.1'),
(33,0,'System','lead','lead',17,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:28','127.0.0.1'),
(34,0,'System','lead','lead',17,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:28','127.0.0.1'),
(35,0,'System','lead','lead',18,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:29','127.0.0.1'),
(36,0,'System','lead','lead',18,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:29','127.0.0.1'),
(37,0,'System','lead','lead',19,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:29','127.0.0.1'),
(38,0,'System','lead','lead',19,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:29','127.0.0.1'),
(39,0,'System','lead','lead',20,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:29','127.0.0.1'),
(40,0,'System','lead','lead',20,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:29','127.0.0.1'),
(41,0,'System','lead','lead',21,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:29','127.0.0.1'),
(42,0,'System','lead','lead',21,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:29','127.0.0.1'),
(43,0,'System','lead','lead',22,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:30','127.0.0.1'),
(44,0,'System','lead','lead',22,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:30','127.0.0.1'),
(45,0,'System','lead','lead',23,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:31','127.0.0.1'),
(46,0,'System','lead','lead',23,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:31','127.0.0.1'),
(47,0,'System','lead','lead',24,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:31','127.0.0.1'),
(48,0,'System','lead','lead',24,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:31','127.0.0.1'),
(49,0,'System','lead','lead',25,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:31','127.0.0.1'),
(50,0,'System','lead','lead',25,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:31','127.0.0.1'),
(51,0,'System','lead','lead',26,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:31','127.0.0.1'),
(52,0,'System','lead','lead',26,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:31','127.0.0.1'),
(53,0,'System','lead','lead',27,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:31','127.0.0.1'),
(54,0,'System','lead','lead',27,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:31','127.0.0.1'),
(55,0,'System','lead','lead',28,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:32','127.0.0.1'),
(56,0,'System','lead','lead',28,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:32','127.0.0.1'),
(57,0,'System','lead','lead',29,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:32','127.0.0.1'),
(58,0,'System','lead','lead',29,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:32','127.0.0.1'),
(59,0,'System','lead','lead',30,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:32','127.0.0.1'),
(60,0,'System','lead','lead',30,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:32','127.0.0.1'),
(61,0,'System','lead','lead',31,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:32','127.0.0.1'),
(62,0,'System','lead','lead',31,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:32','127.0.0.1'),
(63,0,'System','lead','lead',32,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:33','127.0.0.1'),
(64,0,'System','lead','lead',32,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:33','127.0.0.1'),
(65,0,'System','lead','lead',33,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:33','127.0.0.1'),
(66,0,'System','lead','lead',33,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:33','127.0.0.1'),
(67,0,'System','lead','lead',34,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:33','127.0.0.1'),
(68,0,'System','lead','lead',34,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:33','127.0.0.1'),
(69,0,'System','lead','lead',35,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:33','127.0.0.1'),
(70,0,'System','lead','lead',35,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:33','127.0.0.1'),
(71,0,'System','lead','lead',36,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:34','127.0.0.1'),
(72,0,'System','lead','lead',36,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:34','127.0.0.1'),
(73,0,'System','lead','lead',37,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:34','127.0.0.1'),
(74,0,'System','lead','lead',37,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:34','127.0.0.1'),
(75,0,'System','lead','lead',38,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:34','127.0.0.1'),
(76,0,'System','lead','lead',38,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:34','127.0.0.1'),
(77,0,'System','lead','lead',39,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:34','127.0.0.1'),
(78,0,'System','lead','lead',39,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:34','127.0.0.1'),
(79,0,'System','lead','lead',40,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:35','127.0.0.1'),
(80,0,'System','lead','lead',40,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:35','127.0.0.1'),
(81,0,'System','lead','lead',41,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:35','127.0.0.1'),
(82,0,'System','lead','lead',41,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:35','127.0.0.1'),
(83,0,'System','lead','lead',42,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:35','127.0.0.1'),
(84,0,'System','lead','lead',42,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:35','127.0.0.1'),
(85,0,'System','lead','lead',43,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:35','127.0.0.1'),
(86,0,'System','lead','lead',43,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:35','127.0.0.1'),
(87,0,'System','lead','lead',44,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:36','127.0.0.1'),
(88,0,'System','lead','lead',44,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:36','127.0.0.1'),
(89,0,'System','lead','lead',45,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:36','127.0.0.1'),
(90,0,'System','lead','lead',45,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:36','127.0.0.1'),
(91,0,'System','lead','lead',46,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:36','127.0.0.1'),
(92,0,'System','lead','lead',46,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:36','127.0.0.1'),
(93,0,'System','lead','lead',47,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:36','127.0.0.1'),
(94,0,'System','lead','lead',47,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:36','127.0.0.1'),
(95,0,'System','lead','lead',48,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:36','127.0.0.1'),
(96,0,'System','lead','lead',48,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:36','127.0.0.1'),
(97,0,'System','lead','lead',49,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:37','127.0.0.1'),
(98,0,'System','lead','lead',49,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:37','127.0.0.1'),
(99,0,'System','lead','lead',50,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:37','127.0.0.1'),
(100,0,'System','lead','lead',50,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:37','127.0.0.1'),
(101,0,'System','lead','lead',51,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:37','127.0.0.1'),
(102,0,'System','lead','lead',51,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:37','127.0.0.1'),
(103,0,'System','lead','lead',52,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:37','127.0.0.1'),
(104,0,'System','lead','lead',52,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:37','127.0.0.1'),
(105,0,'System','lead','lead',53,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:38','127.0.0.1'),
(106,0,'System','lead','lead',53,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:38','127.0.0.1'),
(107,0,'System','lead','lead',54,'create','a:1:{s:11:\"ipAddresses\";a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}}','2024-02-16 07:57:38','127.0.0.1'),
(108,0,'System','lead','lead',54,'ipadded','a:2:{i:0;s:0:\"\";i:1;s:9:\"127.0.0.1\";}','2024-02-16 07:57:38','127.0.0.1');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundle_grapesjsbuilder`
--

DROP TABLE IF EXISTS `bundle_grapesjsbuilder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_grapesjsbuilder` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int unsigned DEFAULT NULL,
  `custom_mjml` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_56A1EB07A832C1C9` (`email_id`),
  CONSTRAINT `FK_56A1EB07A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundle_grapesjsbuilder`
--

LOCK TABLES `bundle_grapesjsbuilder` WRITE;
/*!40000 ALTER TABLE `bundle_grapesjsbuilder` DISABLE KEYS */;
/*!40000 ALTER TABLE `bundle_grapesjsbuilder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_items`
--

DROP TABLE IF EXISTS `cache_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_items` (
  `item_id` varbinary(255) NOT NULL,
  `item_data` longblob NOT NULL,
  `item_lifetime` int unsigned DEFAULT NULL,
  `item_time` int unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_items`
--

LOCK TABLES `cache_items` WRITE;
/*!40000 ALTER TABLE `cache_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_events`
--

DROP TABLE IF EXISTS `campaign_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int unsigned NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_order` int NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `trigger_date` datetime DEFAULT NULL,
  `trigger_interval` int DEFAULT NULL,
  `trigger_interval_unit` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trigger_hour` time DEFAULT NULL,
  `trigger_restricted_start_hour` time DEFAULT NULL,
  `trigger_restricted_stop_hour` time DEFAULT NULL,
  `trigger_restricted_dow` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `trigger_mode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decision_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temp_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8EC42EE7F639F774` (`campaign_id`),
  KEY `IDX_8EC42EE7727ACA70` (`parent_id`),
  KEY `campaign_event_search` (`type`,`event_type`),
  KEY `campaign_event_type` (`event_type`),
  KEY `campaign_event_channel` (`channel`,`channel_id`),
  CONSTRAINT `FK_8EC42EE7727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `campaign_events` (`id`),
  CONSTRAINT `FK_8EC42EE7F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_events`
--

LOCK TABLES `campaign_events` WRITE;
/*!40000 ALTER TABLE `campaign_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_form_xref`
--

DROP TABLE IF EXISTS `campaign_form_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_form_xref` (
  `campaign_id` int unsigned NOT NULL,
  `form_id` int unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`form_id`),
  KEY `IDX_3048A8B25FF69B7D` (`form_id`),
  CONSTRAINT `FK_3048A8B25FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3048A8B2F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_form_xref`
--

LOCK TABLES `campaign_form_xref` WRITE;
/*!40000 ALTER TABLE `campaign_form_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_form_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_lead_event_failed_log`
--

DROP TABLE IF EXISTS `campaign_lead_event_failed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_lead_event_failed_log` (
  `log_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `reason` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`log_id`),
  KEY `campaign_event_failed_date` (`date_added`),
  CONSTRAINT `FK_E50614D2EA675D86` FOREIGN KEY (`log_id`) REFERENCES `campaign_lead_event_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_lead_event_failed_log`
--

LOCK TABLES `campaign_lead_event_failed_log` WRITE;
/*!40000 ALTER TABLE `campaign_lead_event_failed_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_lead_event_failed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_lead_event_log`
--

DROP TABLE IF EXISTS `campaign_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_lead_event_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `campaign_id` int unsigned DEFAULT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `rotation` int NOT NULL,
  `date_triggered` datetime DEFAULT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `system_triggered` tinyint(1) NOT NULL,
  `metadata` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `non_action_path_taken` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_rotation` (`event_id`,`lead_id`,`rotation`),
  KEY `IDX_B7420BA171F7E88B` (`event_id`),
  KEY `IDX_B7420BA155458D` (`lead_id`),
  KEY `IDX_B7420BA1F639F774` (`campaign_id`),
  KEY `IDX_B7420BA1A03F5E9F` (`ip_id`),
  KEY `campaign_event_upcoming_search` (`is_scheduled`,`lead_id`),
  KEY `campaign_event_schedule_counts` (`campaign_id`,`is_scheduled`,`trigger_date`),
  KEY `campaign_date_triggered` (`date_triggered`),
  KEY `campaign_leads` (`lead_id`,`campaign_id`,`rotation`),
  KEY `campaign_log_channel` (`channel`,`channel_id`,`lead_id`),
  KEY `campaign_actions` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `campaign_stats` (`campaign_id`,`date_triggered`,`event_id`,`non_action_path_taken`),
  KEY `campaign_trigger_date_order` (`trigger_date`),
  CONSTRAINT `FK_B7420BA155458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B7420BA171F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B7420BA1A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_B7420BA1F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_lead_event_log`
--

LOCK TABLES `campaign_lead_event_log` WRITE;
/*!40000 ALTER TABLE `campaign_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_leadlist_xref`
--

DROP TABLE IF EXISTS `campaign_leadlist_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_leadlist_xref` (
  `campaign_id` int unsigned NOT NULL,
  `leadlist_id` int unsigned NOT NULL,
  PRIMARY KEY (`campaign_id`,`leadlist_id`),
  KEY `IDX_6480052EB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_6480052EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6480052EF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_leadlist_xref`
--

LOCK TABLES `campaign_leadlist_xref` WRITE;
/*!40000 ALTER TABLE `campaign_leadlist_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_leadlist_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_leads`
--

DROP TABLE IF EXISTS `campaign_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_leads` (
  `campaign_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  `date_last_exited` datetime DEFAULT NULL,
  `rotation` int NOT NULL,
  PRIMARY KEY (`campaign_id`,`lead_id`),
  KEY `IDX_5995213D55458D` (`lead_id`),
  KEY `campaign_leads_date_added` (`date_added`),
  KEY `campaign_leads_date_exited` (`date_last_exited`),
  KEY `campaign_leads` (`campaign_id`,`manually_removed`,`lead_id`,`rotation`),
  CONSTRAINT `FK_5995213D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5995213DF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_leads`
--

LOCK TABLES `campaign_leads` WRITE;
/*!40000 ALTER TABLE `campaign_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_summary`
--

DROP TABLE IF EXISTS `campaign_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_summary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int unsigned DEFAULT NULL,
  `event_id` int unsigned NOT NULL,
  `date_triggered` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `scheduled_count` int NOT NULL,
  `triggered_count` int NOT NULL,
  `non_action_path_taken_count` int NOT NULL,
  `failed_count` int NOT NULL,
  `log_counts_processed` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campaign_event_date_triggered` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `IDX_6692FA4FF639F774` (`campaign_id`),
  KEY `IDX_6692FA4F71F7E88B` (`event_id`),
  CONSTRAINT `FK_6692FA4F71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6692FA4FF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_summary`
--

LOCK TABLES `campaign_summary` WRITE;
/*!40000 ALTER TABLE `campaign_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `canvas_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `allow_restart` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E373747012469DE2` (`category_id`),
  CONSTRAINT `FK_E373747012469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_alias_search` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_url_trackables`
--

DROP TABLE IF EXISTS `channel_url_trackables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_url_trackables` (
  `channel_id` int NOT NULL,
  `redirect_id` bigint unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int NOT NULL,
  `unique_hits` int NOT NULL,
  PRIMARY KEY (`redirect_id`,`channel_id`),
  KEY `channel_url_trackable_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_2F81A41DB42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `page_redirects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_url_trackables`
--

LOCK TABLES `channel_url_trackables` WRITE;
/*!40000 ALTER TABLE `channel_url_trackables` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_url_trackables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_cache` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `score` int DEFAULT NULL,
  `companyemail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyaddress1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyaddress2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyphone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companycity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companystate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyzipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companycountry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companywebsite` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyindustry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companydescription` longtext COLLATE utf8mb4_unicode_ci,
  `companynumber_of_employees` double DEFAULT NULL,
  `companyfax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companyannual_revenue` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8244AA3A7E3C61F9` (`owner_id`),
  KEY `companynumber_of_employees_search` (`companynumber_of_employees`),
  KEY `companyfax_search` (`companyfax`),
  KEY `companyannual_revenue_search` (`companyannual_revenue`),
  KEY `company_filter` (`companyname`,`companyemail`),
  KEY `company_match` (`companyname`,`companycity`,`companycountry`,`companystate`),
  CONSTRAINT `FK_8244AA3A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies_leads`
--

DROP TABLE IF EXISTS `companies_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_leads` (
  `company_id` int NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`lead_id`),
  KEY `IDX_F4190AB655458D` (`lead_id`),
  CONSTRAINT `FK_F4190AB655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F4190AB6979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies_leads`
--

LOCK TABLES `companies_leads` WRITE;
/*!40000 ALTER TABLE `companies_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_export_scheduler`
--

DROP TABLE IF EXISTS `contact_export_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_export_scheduler` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `scheduled_datetime` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_AC0A03CA76ED395` (`user_id`),
  CONSTRAINT `FK_AC0A03CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_export_scheduler`
--

LOCK TABLES `contact_export_scheduler` WRITE;
/*!40000 ALTER TABLE `contact_export_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_export_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_merge_records`
--

DROP TABLE IF EXISTS `contact_merge_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_merge_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `merged_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9B4F2BFE7A1254A` (`contact_id`),
  KEY `contact_merge_date_added` (`date_added`),
  KEY `contact_merge_ids` (`merged_id`),
  CONSTRAINT `FK_D9B4F2BFE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_merge_records`
--

LOCK TABLES `contact_merge_records` WRITE;
/*!40000 ALTER TABLE `contact_merge_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_merge_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_content`
--

DROP TABLE IF EXISTS `dynamic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_content` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `translation_parent_id` int unsigned DEFAULT NULL,
  `variant_parent_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `utm_tags` json DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `is_campaign_based` tinyint(1) NOT NULL DEFAULT '1',
  `slot_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_20B9DEB212469DE2` (`category_id`),
  KEY `IDX_20B9DEB29091A2FB` (`translation_parent_id`),
  KEY `IDX_20B9DEB291861123` (`variant_parent_id`),
  KEY `is_campaign_based_index` (`is_campaign_based`),
  KEY `slot_name_index` (`slot_name`),
  CONSTRAINT `FK_20B9DEB212469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_20B9DEB29091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_20B9DEB291861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content`
--

LOCK TABLES `dynamic_content` WRITE;
/*!40000 ALTER TABLE `dynamic_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_content_lead_data`
--

DROP TABLE IF EXISTS `dynamic_content_lead_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_content_lead_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `dynamic_content_id` int unsigned DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `slot` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_515B221B55458D` (`lead_id`),
  KEY `IDX_515B221BD9D0CD7` (`dynamic_content_id`),
  CONSTRAINT `FK_515B221B55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_515B221BD9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `dynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content_lead_data`
--

LOCK TABLES `dynamic_content_lead_data` WRITE;
/*!40000 ALTER TABLE `dynamic_content_lead_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content_lead_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_content_stats`
--

DROP TABLE IF EXISTS `dynamic_content_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_content_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dynamic_content_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `sent_count` int DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  `sent_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_E48FBF80D9D0CD7` (`dynamic_content_id`),
  KEY `IDX_E48FBF8055458D` (`lead_id`),
  KEY `stat_dynamic_content_search` (`dynamic_content_id`,`lead_id`),
  KEY `stat_dynamic_content_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_E48FBF8055458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E48FBF80D9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `dynamic_content` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_content_stats`
--

LOCK TABLES `dynamic_content_stats` WRITE;
/*!40000 ALTER TABLE `dynamic_content_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_content_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_assets_xref`
--

DROP TABLE IF EXISTS `email_assets_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_assets_xref` (
  `email_id` int unsigned NOT NULL,
  `asset_id` int unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`asset_id`),
  KEY `IDX_CA3157785DA1941` (`asset_id`),
  CONSTRAINT `FK_CA3157785DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA315778A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_assets_xref`
--

LOCK TABLES `email_assets_xref` WRITE;
/*!40000 ALTER TABLE `email_assets_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_assets_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_copies`
--

DROP TABLE IF EXISTS `email_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_copies` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `body_text` longtext COLLATE utf8mb4_unicode_ci,
  `subject` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_copies`
--

LOCK TABLES `email_copies` WRITE;
/*!40000 ALTER TABLE `email_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_list_xref`
--

DROP TABLE IF EXISTS `email_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_list_xref` (
  `email_id` int unsigned NOT NULL,
  `leadlist_id` int unsigned NOT NULL,
  PRIMARY KEY (`email_id`,`leadlist_id`),
  KEY `IDX_2E24F01CB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_2E24F01CA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2E24F01CB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_list_xref`
--

LOCK TABLES `email_list_xref` WRITE;
/*!40000 ALTER TABLE `email_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_stat_replies`
--

DROP TABLE IF EXISTS `email_stat_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_stat_replies` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `stat_id` bigint unsigned NOT NULL,
  `date_replied` datetime NOT NULL,
  `message_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_11E9F6E09502F0B` (`stat_id`),
  KEY `email_replies` (`stat_id`,`message_id`),
  KEY `date_email_replied` (`date_replied`),
  CONSTRAINT `FK_11E9F6E09502F0B` FOREIGN KEY (`stat_id`) REFERENCES `email_stats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stat_replies`
--

LOCK TABLES `email_stat_replies` WRITE;
/*!40000 ALTER TABLE `email_stat_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stat_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_stats`
--

DROP TABLE IF EXISTS `email_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `list_id` int unsigned DEFAULT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `copy_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_failed` tinyint(1) NOT NULL,
  `viewed_in_browser` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retry_count` int DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `open_count` int DEFAULT NULL,
  `last_opened` datetime DEFAULT NULL,
  `open_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `generated_sent_date` date NOT NULL COMMENT '(DC2Type:generated)',
  PRIMARY KEY (`id`),
  KEY `IDX_CA0A2625A832C1C9` (`email_id`),
  KEY `IDX_CA0A262555458D` (`lead_id`),
  KEY `IDX_CA0A26253DAE168B` (`list_id`),
  KEY `IDX_CA0A2625A03F5E9F` (`ip_id`),
  KEY `IDX_CA0A2625A8752772` (`copy_id`),
  KEY `stat_email_search` (`email_id`,`lead_id`),
  KEY `stat_email_search2` (`lead_id`,`email_id`),
  KEY `stat_email_failed_search` (`is_failed`),
  KEY `is_read_date_sent` (`is_read`,`date_sent`),
  KEY `stat_email_hash_search` (`tracking_hash`),
  KEY `stat_email_source_search` (`source`,`source_id`),
  KEY `email_date_sent` (`date_sent`),
  KEY `email_date_read_lead` (`date_read`,`lead_id`),
  KEY `generated_sent_date_email_id` (`generated_sent_date`,`email_id`),
  CONSTRAINT `FK_CA0A26253DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A262555458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A2625A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_CA0A2625A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CA0A2625A8752772` FOREIGN KEY (`copy_id`) REFERENCES `email_copies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stats`
--

LOCK TABLES `email_stats` WRITE;
/*!40000 ALTER TABLE `email_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_stats_devices`
--

DROP TABLE IF EXISTS `email_stats_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_stats_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `device_id` bigint unsigned DEFAULT NULL,
  `stat_id` bigint unsigned DEFAULT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_opened` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7A8A1C6F94A4C7D4` (`device_id`),
  KEY `IDX_7A8A1C6F9502F0B` (`stat_id`),
  KEY `IDX_7A8A1C6FA03F5E9F` (`ip_id`),
  KEY `date_opened_search` (`date_opened`),
  CONSTRAINT `FK_7A8A1C6F94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `lead_devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7A8A1C6F9502F0B` FOREIGN KEY (`stat_id`) REFERENCES `email_stats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_7A8A1C6FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_stats_devices`
--

LOCK TABLES `email_stats_devices` WRITE;
/*!40000 ALTER TABLE `email_stats_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_stats_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `translation_parent_id` int unsigned DEFAULT NULL,
  `variant_parent_id` int unsigned DEFAULT NULL,
  `unsubscribeform_id` int unsigned DEFAULT NULL,
  `preference_center_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `subject` longtext COLLATE utf8mb4_unicode_ci,
  `from_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply_to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_owner_as_mailer` tinyint(1) DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `plain_text` longtext COLLATE utf8mb4_unicode_ci,
  `custom_html` longtext COLLATE utf8mb4_unicode_ci,
  `email_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int NOT NULL,
  `sent_count` int NOT NULL,
  `variant_sent_count` int NOT NULL,
  `variant_read_count` int NOT NULL,
  `revision` int NOT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `dynamic_content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `headers` json NOT NULL,
  `public_preview` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C81E85212469DE2` (`category_id`),
  KEY `IDX_4C81E8529091A2FB` (`translation_parent_id`),
  KEY `IDX_4C81E85291861123` (`variant_parent_id`),
  KEY `IDX_4C81E8522DC494F6` (`unsubscribeform_id`),
  KEY `IDX_4C81E852834F9C5B` (`preference_center_id`),
  CONSTRAINT `FK_4C81E85212469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E8522DC494F6` FOREIGN KEY (`unsubscribeform_id`) REFERENCES `forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E852834F9C5B` FOREIGN KEY (`preference_center_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4C81E8529091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4C81E85291861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus`
--

DROP TABLE IF EXISTS `focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `focus_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `style` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `form_id` int DEFAULT NULL,
  `cache` longtext COLLATE utf8mb4_unicode_ci,
  `html_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` longtext COLLATE utf8mb4_unicode_ci,
  `html` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_62C04AE912469DE2` (`category_id`),
  KEY `focus_type` (`focus_type`),
  KEY `focus_style` (`style`),
  KEY `focus_form` (`form_id`),
  KEY `focus_name` (`name`),
  CONSTRAINT `FK_62C04AE912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus`
--

LOCK TABLES `focus` WRITE;
/*!40000 ALTER TABLE `focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `focus_stats`
--

DROP TABLE IF EXISTS `focus_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `focus_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C36970DC51804B42` (`focus_id`),
  KEY `IDX_C36970DC55458D` (`lead_id`),
  KEY `focus_type` (`type`),
  KEY `focus_type_id` (`type`,`type_id`),
  KEY `focus_date_added` (`date_added`),
  CONSTRAINT `FK_C36970DC51804B42` FOREIGN KEY (`focus_id`) REFERENCES `focus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C36970DC55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `focus_stats`
--

LOCK TABLES `focus_stats` WRITE;
/*!40000 ALTER TABLE `focus_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_actions`
--

DROP TABLE IF EXISTS `form_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_order` int NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_342491D45FF69B7D` (`form_id`),
  KEY `form_action_type_search` (`type`),
  CONSTRAINT `FK_342491D45FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_actions`
--

LOCK TABLES `form_actions` WRITE;
/*!40000 ALTER TABLE `form_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_fields`
--

DROP TABLE IF EXISTS `form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `label` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_label` tinyint(1) DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `custom_parameters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `default_value` longtext COLLATE utf8mb4_unicode_ci,
  `is_required` tinyint(1) NOT NULL,
  `validation_message` longtext COLLATE utf8mb4_unicode_ci,
  `help_message` longtext COLLATE utf8mb4_unicode_ci,
  `field_order` int DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `validation` json DEFAULT NULL,
  `parent_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `label_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `input_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `container_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lead_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `save_result` tinyint(1) DEFAULT NULL,
  `is_auto_fill` tinyint(1) DEFAULT NULL,
  `show_when_value_exists` tinyint(1) DEFAULT NULL,
  `show_after_x_submissions` int DEFAULT NULL,
  `always_display` tinyint(1) DEFAULT NULL,
  `mapped_object` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mapped_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7C0B37265FF69B7D` (`form_id`),
  KEY `form_field_type_search` (`type`),
  CONSTRAINT `FK_7C0B37265FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_fields`
--

LOCK TABLES `form_fields` WRITE;
/*!40000 ALTER TABLE `form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_submissions`
--

DROP TABLE IF EXISTS `form_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_submissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int unsigned NOT NULL,
  `ip_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `page_id` int unsigned DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C80AF9E65FF69B7D` (`form_id`),
  KEY `IDX_C80AF9E6A03F5E9F` (`ip_id`),
  KEY `IDX_C80AF9E655458D` (`lead_id`),
  KEY `IDX_C80AF9E6C4663E4` (`page_id`),
  KEY `form_submission_tracking_search` (`tracking_id`),
  KEY `form_date_submitted` (`date_submitted`),
  CONSTRAINT `FK_C80AF9E655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C80AF9E65FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C80AF9E6A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_C80AF9E6C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_submissions`
--

LOCK TABLES `form_submissions` WRITE;
/*!40000 ALTER TABLE `form_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_attr` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cached_html` longtext COLLATE utf8mb4_unicode_ci,
  `post_action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_action_property` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_kiosk_mode` tinyint(1) DEFAULT NULL,
  `render_style` tinyint(1) DEFAULT NULL,
  `form_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `progressive_profiling_limit` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FD3F1BF712469DE2` (`category_id`),
  CONSTRAINT `FK_FD3F1BF712469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_count` int NOT NULL,
  `inserted_count` int NOT NULL,
  `updated_count` int NOT NULL,
  `ignored_count` int NOT NULL,
  `priority` int NOT NULL,
  `status` int NOT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_ended` datetime DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `import_object` (`object`),
  KEY `import_status` (`status`),
  KEY `import_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration_entity`
--

DROP TABLE IF EXISTS `integration_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration_entity` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_entity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `integration_entity_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_entity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internal_entity_id` int DEFAULT NULL,
  `last_sync_date` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `integration_external_entity` (`integration`,`integration_entity`,`integration_entity_id`),
  KEY `integration_internal_entity` (`integration`,`internal_entity`,`internal_entity_id`),
  KEY `integration_entity_match` (`integration`,`internal_entity`,`integration_entity`),
  KEY `integration_last_sync_date` (`integration`,`last_sync_date`),
  KEY `internal_integration_entity` (`internal_entity_id`,`integration_entity_id`,`internal_entity`,`integration_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_entity`
--

LOCK TABLES `integration_entity` WRITE;
/*!40000 ALTER TABLE `integration_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `integration_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_addresses`
--

DROP TABLE IF EXISTS `ip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `ip_search` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_addresses`
--

LOCK TABLES `ip_addresses` WRITE;
/*!40000 ALTER TABLE `ip_addresses` DISABLE KEYS */;
INSERT INTO `ip_addresses` VALUES
(1,'127.0.0.1','a:10:{s:4:\"city\";s:0:\"\";s:6:\"region\";s:0:\"\";s:7:\"zipcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"latitude\";s:0:\"\";s:9:\"longitude\";s:0:\"\";s:3:\"isp\";s:0:\"\";s:12:\"organization\";s:0:\"\";s:8:\"timezone\";s:0:\"\";s:5:\"extra\";s:0:\"\";}');
/*!40000 ALTER TABLE `ip_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_categories`
--

DROP TABLE IF EXISTS `lead_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12685DF412469DE2` (`category_id`),
  KEY `IDX_12685DF455458D` (`lead_id`),
  CONSTRAINT `FK_12685DF412469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_12685DF455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_categories`
--

LOCK TABLES `lead_categories` WRITE;
/*!40000 ALTER TABLE `lead_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_companies_change_log`
--

DROP TABLE IF EXISTS `lead_companies_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_companies_change_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A034C81B55458D` (`lead_id`),
  KEY `company_date_added` (`date_added`),
  CONSTRAINT `FK_A034C81B55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_companies_change_log`
--

LOCK TABLES `lead_companies_change_log` WRITE;
/*!40000 ALTER TABLE `lead_companies_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_companies_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_devices`
--

DROP TABLE IF EXISTS `lead_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `client_info` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `device` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_shortname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_os_platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_48C912F47D05ABBE` (`tracking_id`),
  KEY `IDX_48C912F455458D` (`lead_id`),
  KEY `date_added_search` (`date_added`),
  KEY `device_search` (`device`),
  KEY `device_os_name_search` (`device_os_name`),
  KEY `device_os_shortname_search` (`device_os_shortname`),
  KEY `device_os_version_search` (`device_os_version`),
  KEY `device_os_platform_search` (`device_os_platform`),
  KEY `device_brand_search` (`device_brand`),
  KEY `device_model_search` (`device_model`),
  CONSTRAINT `FK_48C912F455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_devices`
--

LOCK TABLES `lead_devices` WRITE;
/*!40000 ALTER TABLE `lead_devices` DISABLE KEYS */;
INSERT INTO `lead_devices` VALUES
(1,1,'2024-02-16 07:57:24','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','ns4zwg2fqymm4o6gqsouwvj'),
(2,2,'2024-02-16 07:57:24','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','rzt4gy7qka9kiemuu9bs0i9'),
(3,3,'2024-02-16 07:57:25','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','4as2yqf4j5ejjg0fv9fh8i3'),
(4,4,'2024-02-16 07:57:25','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','9pgj7k12n9jb9afxv994of8'),
(5,5,'2024-02-16 07:57:25','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','fic5c6bctqc6thpuzzkfsmt'),
(6,6,'2024-02-16 07:57:26','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','qzg650fwy8v91ysas0sefvq'),
(7,7,'2024-02-16 07:57:26','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','var0ckotyxua11x1cuiaxag'),
(8,8,'2024-02-16 07:57:26','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','druk3abmsdsw95tbds01i8z'),
(9,9,'2024-02-16 07:57:26','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','57u5wshxx8pkp95qp1s3x46'),
(10,10,'2024-02-16 07:57:26','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','k02w8c3ezfesoi2n6nxs9lw'),
(11,11,'2024-02-16 07:57:27','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','jjqeaf7bqf8bloxro4zh4cg'),
(12,12,'2024-02-16 07:57:27','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','atwj1qjg2idxvehf7frctdd'),
(13,13,'2024-02-16 07:57:28','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','5fe2xbf5t269keywter0f8k'),
(14,14,'2024-02-16 07:57:28','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','qui421cqksepvdgnx6zv790'),
(15,15,'2024-02-16 07:57:28','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','4b6s257607c8bmvbyfrad8y'),
(16,16,'2024-02-16 07:57:28','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','b3w7h6ajrul2rjjbkfujig4'),
(17,17,'2024-02-16 07:57:28','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','pmyt72f8p76nvna87ul2ed2'),
(18,18,'2024-02-16 07:57:29','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','ysm4sv056opmdqjs7e6pxtm'),
(19,19,'2024-02-16 07:57:29','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','8odofjc9t8gq2hvyn5fkf0e'),
(20,20,'2024-02-16 07:57:29','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','e3ecy5wmf9ybzkdhwmwgy4m'),
(21,21,'2024-02-16 07:57:30','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','89j8r45qxvilhkajra4eqy6'),
(22,22,'2024-02-16 07:57:30','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','k0yj5agpu9pzw53lwtqtzwk'),
(23,23,'2024-02-16 07:57:31','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','qp2l0iz5q7sj8cqp8oy9910'),
(24,24,'2024-02-16 07:57:31','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','4d9dcjp306d065u6nik0jo7'),
(25,25,'2024-02-16 07:57:31','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','tca3bxvy226eestf6kdgdxf'),
(26,26,'2024-02-16 07:57:31','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','gl4tiyncbs3v3itr4svka6y'),
(27,27,'2024-02-16 07:57:31','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','km3zc3s2tpgpyn34fyfwy1i'),
(28,28,'2024-02-16 07:57:32','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','9wqfr5bdzk1ihmf3d7v038r'),
(29,29,'2024-02-16 07:57:32','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','bu9b250zrtvrivr0hw1g22z'),
(30,30,'2024-02-16 07:57:32','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','obsbujh4bimb68pr5m7tqbe'),
(31,31,'2024-02-16 07:57:32','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','4rpfshahfca859bgdm1o1bu'),
(32,32,'2024-02-16 07:57:33','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','bvx1s4td7ywsaycfl3azv5h'),
(33,33,'2024-02-16 07:57:33','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','5ljg5ppybf98s4r400z65bm'),
(34,34,'2024-02-16 07:57:33','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','m52tq568fbxa4n7dtlooqnp'),
(35,35,'2024-02-16 07:57:33','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','801st4qyctmbfgkfkk0ajrh'),
(36,36,'2024-02-16 07:57:34','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','halg4yyahl8u41l9t237ug8'),
(37,37,'2024-02-16 07:57:34','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','55frxc2fk5i2387ff7viw1l'),
(38,38,'2024-02-16 07:57:34','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','v0yahe2rl8l1kvoqwc11kht'),
(39,39,'2024-02-16 07:57:34','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','548n4gquefrkakkjuhdfdev'),
(40,40,'2024-02-16 07:57:35','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','zlrbrgs50w4ovg5jyodpjqw'),
(41,41,'2024-02-16 07:57:35','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','codzab7ovcvja0i5polg49u'),
(42,42,'2024-02-16 07:57:35','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','tjziv3hql5637wr35pkut78'),
(43,43,'2024-02-16 07:57:35','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','3mvfmexyszuiycccgtca3ob'),
(44,44,'2024-02-16 07:57:36','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','fr8gyhs7rh7bz34too6lmj9'),
(45,45,'2024-02-16 07:57:36','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','r83k89ow67xguha7d05zefc'),
(46,46,'2024-02-16 07:57:36','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','c4t0h5hdw4f52xtf3d67obp'),
(47,47,'2024-02-16 07:57:36','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','xo0onypmp7tcpr7waiscpdo'),
(48,48,'2024-02-16 07:57:37','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','mwctmoxczhsk6zd1pyrddnc'),
(49,49,'2024-02-16 07:57:37','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','7q6niyvc5y3eabxgo7k6b37'),
(50,50,'2024-02-16 07:57:37','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','o07m0yb6m9vrq1y8u2bve0a'),
(51,51,'2024-02-16 07:57:37','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','5wr8og0uq4x99pubtrqmzl6'),
(52,52,'2024-02-16 07:57:37','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','sn6rkd11k5dyqgqvgb7wti2'),
(53,53,'2024-02-16 07:57:38','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','v0hndfs9113yk1r1gc014y5'),
(54,54,'2024-02-16 07:57:38','a:7:{s:4:\"type\";s:7:\"browser\";s:4:\"name\";s:6:\"Chrome\";s:10:\"short_name\";s:2:\"CH\";s:7:\"version\";s:5:\"121.0\";s:6:\"engine\";s:5:\"Blink\";s:14:\"engine_version\";s:0:\"\";s:6:\"family\";s:6:\"Chrome\";}','desktop','Mac','MAC','10.15','','Apple','','qs4x261yih57ht1er4kqo0j');
/*!40000 ALTER TABLE `lead_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_donotcontact`
--

DROP TABLE IF EXISTS `lead_donotcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_donotcontact` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `reason` smallint NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int DEFAULT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_71DC0B1D55458D` (`lead_id`),
  KEY `dnc_reason_search` (`reason`),
  CONSTRAINT `FK_71DC0B1D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_donotcontact`
--

LOCK TABLES `lead_donotcontact` WRITE;
/*!40000 ALTER TABLE `lead_donotcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_donotcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_event_log`
--

DROP TABLE IF EXISTS `lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_event_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bundle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` int DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `properties` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id_index` (`lead_id`),
  KEY `lead_object_index` (`object`,`object_id`),
  KEY `lead_timeline_index` (`bundle`,`object`,`action`,`object_id`),
  KEY `IDX_SEARCH` (`bundle`,`object`,`action`,`object_id`,`date_added`),
  KEY `lead_timeline_action_index` (`action`),
  KEY `lead_date_added_index` (`date_added`),
  CONSTRAINT `FK_753AF2E55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_event_log`
--

LOCK TABLES `lead_event_log` WRITE;
/*!40000 ALTER TABLE `lead_event_log` DISABLE KEYS */;
INSERT INTO `lead_event_log` VALUES
(1,1,NULL,NULL,'page','hit','created_contact',1,'2024-02-16 07:57:24','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-form/src/jquery.form.js?ve5097c5a=\"}'),
(2,2,NULL,NULL,'page','hit','created_contact',2,'2024-02-16 07:57:24','{\"object_description\": \"https://mautic-test.com/node_modules/js-cookie/src/js.cookie.js?ve5097c5a=\"}'),
(3,3,NULL,NULL,'page','hit','created_contact',3,'2024-02-16 07:57:25','{\"object_description\": \"https://mautic-test.com/node_modules/jquery/dist/jquery.js?ve5097c5a=\"}'),
(4,4,NULL,NULL,'page','hit','created_contact',4,'2024-02-16 07:57:25','{\"object_description\": \"https://mautic-test.com/node_modules/bootstrap/dist/js/bootstrap.js?ve5097c5a=\"}'),
(5,5,NULL,NULL,'page','hit','created_contact',5,'2024-02-16 07:57:25','{\"object_description\": \"https://mautic-test.com/node_modules/moment/min/moment.min.js?ve5097c5a=\"}'),
(6,6,NULL,NULL,'page','hit','created_contact',6,'2024-02-16 07:57:26','{\"object_description\": \"https://mautic-test.com/node_modules/jquery.caret/dist/jquery.caret.js?ve5097c5a=\"}'),
(7,7,NULL,NULL,'page','hit','created_contact',7,'2024-02-16 07:57:26','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/lib/codemirror.js?ve5097c5a=\"}'),
(8,8,NULL,NULL,'page','hit','created_contact',8,'2024-02-16 07:57:26','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/addon/hint/show-hint.js?ve5097c5a=\"}'),
(9,9,NULL,NULL,'page','hit','created_contact',9,'2024-02-16 07:57:26','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/mode/xml/xml.js?ve5097c5a=\"}'),
(10,10,NULL,NULL,'page','hit','created_contact',10,'2024-02-16 07:57:26','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/mode/javascript/javascript.js?ve5097c5a=\"}'),
(11,11,NULL,NULL,'page','hit','created_contact',11,'2024-02-16 07:57:27','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/mode/htmlmixed/htmlmixed.js?ve5097c5a=\"}'),
(12,12,NULL,NULL,'page','hit','created_contact',12,'2024-02-16 07:57:27','{\"object_description\": \"https://mautic-test.com/node_modules/codemirror/mode/css/css.js?ve5097c5a=\"}'),
(13,13,NULL,NULL,'page','hit','created_contact',13,'2024-02-16 07:57:28','{\"object_description\": \"https://mautic-test.com/node_modules/jsplumb/dist/js/jsplumb.js?ve5097c5a=\"}'),
(14,14,NULL,NULL,'page','hit','created_contact',14,'2024-02-16 07:57:28','{\"object_description\": \"https://mautic-test.com/node_modules/typeahead.js/dist/typeahead.bundle.js?ve5097c5a=\"}'),
(15,15,NULL,NULL,'page','hit','created_contact',15,'2024-02-16 07:57:28','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-datetimepicker/build/jquery.datetimepicker.full.js?ve5097c5a=\"}'),
(16,16,NULL,NULL,'page','hit','created_contact',16,'2024-02-16 07:57:28','{\"object_description\": \"https://mautic-test.com/node_modules/shufflejs/dist/shuffle.js?ve5097c5a=\"}'),
(17,17,NULL,NULL,'page','hit','created_contact',17,'2024-02-16 07:57:28','{\"object_description\": \"https://mautic-test.com/node_modules/@claviska/jquery-minicolors/jquery.minicolors.js?ve5097c5a=\"}'),
(18,18,NULL,NULL,'page','hit','created_contact',18,'2024-02-16 07:57:29','{\"object_description\": \"https://mautic-test.com/node_modules/dropzone/dist/dropzone.js?ve5097c5a=\"}'),
(19,19,NULL,NULL,'page','hit','created_contact',19,'2024-02-16 07:57:29','{\"object_description\": \"https://mautic-test.com/node_modules/multiselect/js/jquery.multi-select.js?ve5097c5a=\"}'),
(20,20,NULL,NULL,'page','hit','created_contact',20,'2024-02-16 07:57:29','{\"object_description\": \"https://mautic-test.com/node_modules/chart.js/dist/Chart.js?ve5097c5a=\"}'),
(21,21,NULL,NULL,'page','hit','created_contact',21,'2024-02-16 07:57:30','{\"object_description\": \"https://mautic-test.com/node_modules/at.js/dist/js/jquery.atwho.js?ve5097c5a=\"}'),
(22,22,NULL,NULL,'page','hit','created_contact',22,'2024-02-16 07:57:30','{\"object_description\": \"https://mautic-test.com/node_modules/jquery.quicksearch/src/jquery.quicksearch.js?ve5097c5a=\"}'),
(23,23,NULL,NULL,'page','hit','created_contact',23,'2024-02-16 07:57:31','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/version.js?ve5097c5a=\"}'),
(24,24,NULL,NULL,'page','hit','created_contact',24,'2024-02-16 07:57:31','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widget.js?ve5097c5a=\"}'),
(25,25,NULL,NULL,'page','hit','created_contact',25,'2024-02-16 07:57:31','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/plugin.js?ve5097c5a=\"}'),
(26,26,NULL,NULL,'page','hit','created_contact',26,'2024-02-16 07:57:31','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/position.js?ve5097c5a=\"}'),
(27,27,NULL,NULL,'page','hit','created_contact',27,'2024-02-16 07:57:31','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/data.js?ve5097c5a=\"}'),
(28,28,NULL,NULL,'page','hit','created_contact',28,'2024-02-16 07:57:32','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/disable-selection.js?ve5097c5a=\"}'),
(29,29,NULL,NULL,'page','hit','created_contact',29,'2024-02-16 07:57:32','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/focusable.js?ve5097c5a=\"}'),
(30,30,NULL,NULL,'page','hit','created_contact',30,'2024-02-16 07:57:32','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/form-reset-mixin.js?ve5097c5a=\"}'),
(31,31,NULL,NULL,'page','hit','created_contact',31,'2024-02-16 07:57:32','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/jquery-patch.js?ve5097c5a=\"}'),
(32,32,NULL,NULL,'page','hit','created_contact',32,'2024-02-16 07:57:33','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/keycode.js?ve5097c5a=\"}'),
(33,33,NULL,NULL,'page','hit','created_contact',33,'2024-02-16 07:57:33','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/labels.js?ve5097c5a=\"}'),
(34,34,NULL,NULL,'page','hit','created_contact',34,'2024-02-16 07:57:33','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/scroll-parent.js?ve5097c5a=\"}'),
(35,35,NULL,NULL,'page','hit','created_contact',35,'2024-02-16 07:57:33','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/tabbable.js?ve5097c5a=\"}'),
(36,36,NULL,NULL,'page','hit','created_contact',36,'2024-02-16 07:57:34','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/unique-id.js?ve5097c5a=\"}'),
(37,37,NULL,NULL,'page','hit','created_contact',37,'2024-02-16 07:57:34','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effect.js?ve5097c5a=\"}'),
(38,38,NULL,NULL,'page','hit','created_contact',38,'2024-02-16 07:57:34','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/safe-blur.js?ve5097c5a=\"}'),
(39,39,NULL,NULL,'page','hit','created_contact',39,'2024-02-16 07:57:34','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/mouse.js?ve5097c5a=\"}'),
(40,40,NULL,NULL,'page','hit','created_contact',40,'2024-02-16 07:57:35','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/draggable.js?ve5097c5a=\"}'),
(41,41,NULL,NULL,'page','hit','created_contact',41,'2024-02-16 07:57:35','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/droppable.js?ve5097c5a=\"}'),
(42,42,NULL,NULL,'page','hit','created_contact',42,'2024-02-16 07:57:35','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/selectable.js?ve5097c5a=\"}'),
(43,43,NULL,NULL,'page','hit','created_contact',43,'2024-02-16 07:57:35','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/sortable.js?ve5097c5a=\"}'),
(44,44,NULL,NULL,'page','hit','created_contact',44,'2024-02-16 07:57:36','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/vendor/jquery-color/jquery.color.js?ve5097c5a=\"}'),
(45,45,NULL,NULL,'page','hit','created_contact',45,'2024-02-16 07:57:36','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-drop.js?ve5097c5a=\"}'),
(46,46,NULL,NULL,'page','hit','created_contact',46,'2024-02-16 07:57:36','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-fade.js?ve5097c5a=\"}'),
(47,47,NULL,NULL,'page','hit','created_contact',47,'2024-02-16 07:57:36','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-size.js?ve5097c5a=\"}'),
(48,48,NULL,NULL,'page','hit','created_contact',48,'2024-02-16 07:57:37','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-slide.js?ve5097c5a=\"}'),
(49,49,NULL,NULL,'page','hit','created_contact',49,'2024-02-16 07:57:37','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-transfer.js?ve5097c5a=\"}'),
(50,50,NULL,NULL,'page','hit','created_contact',50,'2024-02-16 07:57:37','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/safe-active-element.js?ve5097c5a=\"}'),
(51,51,NULL,NULL,'page','hit','created_contact',51,'2024-02-16 07:57:37','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/button.js?ve5097c5a=\"}'),
(52,52,NULL,NULL,'page','hit','created_contact',52,'2024-02-16 07:57:37','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/resizable.js?ve5097c5a=\"}'),
(53,53,NULL,NULL,'page','hit','created_contact',53,'2024-02-16 07:57:38','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/slider.js?ve5097c5a=\"}'),
(54,54,NULL,NULL,'page','hit','created_contact',54,'2024-02-16 07:57:38','{\"object_description\": \"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/controlgroup.js?ve5097c5a=\"}');
/*!40000 ALTER TABLE `lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_fields`
--

DROP TABLE IF EXISTS `lead_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_short_visible` tinyint(1) NOT NULL,
  `is_listable` tinyint(1) NOT NULL,
  `is_publicly_updatable` tinyint(1) NOT NULL,
  `is_unique_identifer` tinyint(1) DEFAULT NULL,
  `field_order` int DEFAULT NULL,
  `object` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `column_is_not_created` tinyint(1) NOT NULL DEFAULT '0',
  `original_is_published_value` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `search_by_object` (`object`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_fields`
--

LOCK TABLES `lead_fields` WRITE;
/*!40000 ALTER TABLE `lead_fields` DISABLE KEYS */;
INSERT INTO `lead_fields` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Title','title','lookup','core',NULL,0,1,1,0,1,0,0,1,'lead','a:1:{s:4:\"list\";a:3:{i:0;s:2:\"Mr\";i:1;s:3:\"Mrs\";i:2;s:4:\"Miss\";}}',0,0),
(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'First Name','firstname','text','core',NULL,0,1,1,1,1,0,0,2,'lead','a:0:{}',0,0),
(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Last Name','lastname','text','core',NULL,0,1,1,1,1,0,0,3,'lead','a:0:{}',0,0),
(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Primary company','company','text','core',NULL,0,1,1,0,1,0,0,4,'lead','a:0:{}',0,0),
(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Position','position','text','core',NULL,0,1,1,0,1,0,0,5,'lead','a:0:{}',0,0),
(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Email','email','email','core',NULL,0,1,1,1,1,0,1,6,'lead','a:0:{}',0,0),
(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mobile','mobile','tel','core',NULL,0,1,1,0,1,0,0,7,'lead','a:0:{}',0,0),
(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','phone','tel','core',NULL,0,1,1,0,1,0,0,8,'lead','a:0:{}',0,0),
(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Points','points','number','core','0',0,1,1,0,1,0,0,9,'lead','a:0:{}',0,0),
(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','fax','tel','core',NULL,0,0,1,0,1,0,0,10,'lead','a:0:{}',0,0),
(11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 1','address1','text','core',NULL,0,1,1,0,1,0,0,11,'lead','a:0:{}',0,0),
(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 2','address2','text','core',NULL,0,1,1,0,1,0,0,12,'lead','a:0:{}',0,0),
(13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','city','text','core',NULL,0,1,1,0,1,0,0,13,'lead','a:0:{}',0,0),
(14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','state','region','core',NULL,0,1,1,0,1,0,0,14,'lead','a:0:{}',0,0),
(15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','zipcode','text','core',NULL,0,1,1,0,1,0,0,15,'lead','a:0:{}',0,0),
(16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','country','country','core',NULL,0,1,1,0,1,0,0,16,'lead','a:0:{}',0,0),
(17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Preferred Locale','preferred_locale','locale','core',NULL,0,1,1,0,1,0,0,17,'lead','a:0:{}',0,0),
(18,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Preferred Timezone','timezone','timezone','core',NULL,0,1,1,0,1,0,0,18,'lead','a:0:{}',0,0),
(19,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Date Last Active','last_active','datetime','core',NULL,0,1,1,0,1,0,0,19,'lead','a:0:{}',0,0),
(20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution Date','attribution_date','datetime','core',NULL,0,1,1,0,1,0,0,20,'lead','a:0:{}',0,0),
(21,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution','attribution','number','core',NULL,0,1,1,0,1,0,0,21,'lead','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}',0,0),
(22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','website','url','core',NULL,0,0,1,0,1,0,0,22,'lead','a:0:{}',0,0),
(23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Facebook','facebook','text','social',NULL,0,0,1,0,1,0,0,23,'lead','a:0:{}',0,0),
(24,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Foursquare','foursquare','text','social',NULL,0,0,1,0,1,0,0,24,'lead','a:0:{}',0,0),
(25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Instagram','instagram','text','social',NULL,0,0,1,0,1,0,0,25,'lead','a:0:{}',0,0),
(26,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mautic.lead.field.linkedin','linkedin','text','social',NULL,0,0,1,0,1,0,0,26,'lead','a:0:{}',0,0),
(27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Skype','skype','text','social',NULL,0,0,1,0,1,0,0,27,'lead','a:0:{}',0,0),
(28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Twitter','twitter','text','social',NULL,0,0,1,0,1,0,0,28,'lead','a:0:{}',0,0),
(29,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 1','companyaddress1','text','core',NULL,0,1,1,0,1,0,0,1,'company','a:0:{}',0,0),
(30,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 2','companyaddress2','text','core',NULL,0,1,1,0,1,0,0,2,'company','a:0:{}',0,0),
(31,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Email','companyemail','email','core',NULL,0,1,1,0,1,0,0,3,'company','a:0:{}',0,0),
(32,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','companyphone','tel','core',NULL,0,1,1,0,1,0,0,4,'company','a:0:{}',0,0),
(33,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','companycity','text','core',NULL,0,1,1,0,1,0,0,5,'company','a:0:{}',0,0),
(34,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','companystate','region','core',NULL,0,1,1,0,1,0,0,6,'company','a:0:{}',0,0),
(35,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','companyzipcode','text','core',NULL,0,1,1,0,1,0,0,7,'company','a:0:{}',0,0),
(36,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','companycountry','country','core',NULL,0,1,1,0,1,0,0,8,'company','a:0:{}',0,0),
(37,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Name','companyname','text','core',NULL,1,1,1,0,1,0,1,9,'company','a:0:{}',0,0),
(38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','companywebsite','url','core',NULL,0,1,1,0,1,0,0,10,'company','a:0:{}',0,0),
(39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Number of Employees','companynumber_of_employees','number','professional',NULL,0,0,1,0,1,0,0,11,'company','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:0;}',0,0),
(40,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','companyfax','tel','professional',NULL,0,0,1,0,1,0,0,12,'company','a:0:{}',0,0),
(41,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual Revenue','companyannual_revenue','number','professional',NULL,0,0,1,0,1,0,0,13,'company','a:2:{s:9:\"roundmode\";i:4;s:5:\"scale\";i:2;}',0,0),
(42,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Industry','companyindustry','select','professional',NULL,0,1,1,0,1,0,0,14,'company','a:1:{s:4:\"list\";a:31:{i:0;a:2:{s:5:\"label\";s:11:\"Agriculture\";s:5:\"value\";s:11:\"Agriculture\";}i:1;a:2:{s:5:\"label\";s:7:\"Apparel\";s:5:\"value\";s:7:\"Apparel\";}i:2;a:2:{s:5:\"label\";s:7:\"Banking\";s:5:\"value\";s:7:\"Banking\";}i:3;a:2:{s:5:\"label\";s:13:\"Biotechnology\";s:5:\"value\";s:13:\"Biotechnology\";}i:4;a:2:{s:5:\"label\";s:9:\"Chemicals\";s:5:\"value\";s:9:\"Chemicals\";}i:5;a:2:{s:5:\"label\";s:14:\"Communications\";s:5:\"value\";s:14:\"Communications\";}i:6;a:2:{s:5:\"label\";s:12:\"Construction\";s:5:\"value\";s:12:\"Construction\";}i:7;a:2:{s:5:\"label\";s:9:\"Education\";s:5:\"value\";s:9:\"Education\";}i:8;a:2:{s:5:\"label\";s:11:\"Electronics\";s:5:\"value\";s:11:\"Electronics\";}i:9;a:2:{s:5:\"label\";s:6:\"Energy\";s:5:\"value\";s:6:\"Energy\";}i:10;a:2:{s:5:\"label\";s:11:\"Engineering\";s:5:\"value\";s:11:\"Engineering\";}i:11;a:2:{s:5:\"label\";s:13:\"Entertainment\";s:5:\"value\";s:13:\"Entertainment\";}i:12;a:2:{s:5:\"label\";s:13:\"Environmental\";s:5:\"value\";s:13:\"Environmental\";}i:13;a:2:{s:5:\"label\";s:7:\"Finance\";s:5:\"value\";s:7:\"Finance\";}i:14;a:2:{s:5:\"label\";s:15:\"Food & Beverage\";s:5:\"value\";s:15:\"Food & Beverage\";}i:15;a:2:{s:5:\"label\";s:10:\"Government\";s:5:\"value\";s:10:\"Government\";}i:16;a:2:{s:5:\"label\";s:10:\"Healthcare\";s:5:\"value\";s:10:\"Healthcare\";}i:17;a:2:{s:5:\"label\";s:11:\"Hospitality\";s:5:\"value\";s:11:\"Hospitality\";}i:18;a:2:{s:5:\"label\";s:9:\"Insurance\";s:5:\"value\";s:9:\"Insurance\";}i:19;a:2:{s:5:\"label\";s:9:\"Machinery\";s:5:\"value\";s:9:\"Machinery\";}i:20;a:2:{s:5:\"label\";s:13:\"Manufacturing\";s:5:\"value\";s:13:\"Manufacturing\";}i:21;a:2:{s:5:\"label\";s:5:\"Media\";s:5:\"value\";s:5:\"Media\";}i:22;a:2:{s:5:\"label\";s:14:\"Not for Profit\";s:5:\"value\";s:14:\"Not for Profit\";}i:23;a:2:{s:5:\"label\";s:10:\"Recreation\";s:5:\"value\";s:10:\"Recreation\";}i:24;a:2:{s:5:\"label\";s:6:\"Retail\";s:5:\"value\";s:6:\"Retail\";}i:25;a:2:{s:5:\"label\";s:8:\"Shipping\";s:5:\"value\";s:8:\"Shipping\";}i:26;a:2:{s:5:\"label\";s:10:\"Technology\";s:5:\"value\";s:10:\"Technology\";}i:27;a:2:{s:5:\"label\";s:18:\"Telecommunications\";s:5:\"value\";s:18:\"Telecommunications\";}i:28;a:2:{s:5:\"label\";s:14:\"Transportation\";s:5:\"value\";s:14:\"Transportation\";}i:29;a:2:{s:5:\"label\";s:9:\"Utilities\";s:5:\"value\";s:9:\"Utilities\";}i:30;a:2:{s:5:\"label\";s:5:\"Other\";s:5:\"value\";s:5:\"Other\";}}}',0,0),
(43,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Description','companydescription','text','professional',NULL,0,1,1,0,1,0,0,15,'company','a:0:{}',0,0);
/*!40000 ALTER TABLE `lead_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_frequencyrules`
--

DROP TABLE IF EXISTS `lead_frequencyrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_frequencyrules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `frequency_number` smallint DEFAULT NULL,
  `frequency_time` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferred_channel` tinyint(1) NOT NULL,
  `pause_from_date` datetime DEFAULT NULL,
  `pause_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA8A57F455458D` (`lead_id`),
  KEY `channel_frequency` (`channel`),
  CONSTRAINT `FK_AA8A57F455458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_frequencyrules`
--

LOCK TABLES `lead_frequencyrules` WRITE;
/*!40000 ALTER TABLE `lead_frequencyrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_frequencyrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_ips_xref`
--

DROP TABLE IF EXISTS `lead_ips_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_ips_xref` (
  `lead_id` bigint unsigned NOT NULL,
  `ip_id` int unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`ip_id`),
  KEY `IDX_9EED7E66A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_9EED7E6655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9EED7E66A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_ips_xref`
--

LOCK TABLES `lead_ips_xref` WRITE;
/*!40000 ALTER TABLE `lead_ips_xref` DISABLE KEYS */;
INSERT INTO `lead_ips_xref` VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1);
/*!40000 ALTER TABLE `lead_ips_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_lists`
--

DROP TABLE IF EXISTS `lead_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_lists` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_global` tinyint(1) NOT NULL,
  `is_preference_center` tinyint(1) NOT NULL,
  `last_built_date` datetime DEFAULT NULL,
  `last_built_time` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EC1522A12469DE2` (`category_id`),
  CONSTRAINT `FK_6EC1522A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_lists`
--

LOCK TABLES `lead_lists` WRITE;
/*!40000 ALTER TABLE `lead_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_lists_leads`
--

DROP TABLE IF EXISTS `lead_lists_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_lists_leads` (
  `leadlist_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`leadlist_id`,`lead_id`),
  KEY `IDX_F5F47C7C55458D` (`lead_id`),
  KEY `manually_removed` (`manually_removed`),
  CONSTRAINT `FK_F5F47C7C55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F5F47C7CB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_lists_leads`
--

LOCK TABLES `lead_lists_leads` WRITE;
/*!40000 ALTER TABLE `lead_lists_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_lists_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_notes`
--

DROP TABLE IF EXISTS `lead_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67FC6B0355458D` (`lead_id`),
  CONSTRAINT `FK_67FC6B0355458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_notes`
--

LOCK TABLES `lead_notes` WRITE;
/*!40000 ALTER TABLE `lead_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_points_change_log`
--

DROP TABLE IF EXISTS `lead_points_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_points_change_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `ip_id` int unsigned NOT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delta` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_949C2CCC55458D` (`lead_id`),
  KEY `IDX_949C2CCCA03F5E9F` (`ip_id`),
  KEY `IDX_949C2CCCFE54D947` (`group_id`),
  KEY `point_date_added` (`date_added`),
  CONSTRAINT `FK_949C2CCC55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_949C2CCCA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_949C2CCCFE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_points_change_log`
--

LOCK TABLES `lead_points_change_log` WRITE;
/*!40000 ALTER TABLE `lead_points_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_points_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_stages_change_log`
--

DROP TABLE IF EXISTS `lead_stages_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_stages_change_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `stage_id` int unsigned DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_73B42EF355458D` (`lead_id`),
  KEY `IDX_73B42EF32298D193` (`stage_id`),
  CONSTRAINT `FK_73B42EF32298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_73B42EF355458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_stages_change_log`
--

LOCK TABLES `lead_stages_change_log` WRITE;
/*!40000 ALTER TABLE `lead_stages_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_stages_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_tags`
--

DROP TABLE IF EXISTS `lead_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `lead_tag_search` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_tags`
--

LOCK TABLES `lead_tags` WRITE;
/*!40000 ALTER TABLE `lead_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_tags_xref`
--

DROP TABLE IF EXISTS `lead_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_tags_xref` (
  `lead_id` bigint unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`lead_id`,`tag_id`),
  KEY `IDX_F2E51EB6BAD26311` (`tag_id`),
  CONSTRAINT `FK_F2E51EB655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F2E51EB6BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `lead_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_tags_xref`
--

LOCK TABLES `lead_tags_xref` WRITE;
/*!40000 ALTER TABLE `lead_tags_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_tags_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_utmtags`
--

DROP TABLE IF EXISTS `lead_utmtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lead_utmtags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C51BCB8D55458D` (`lead_id`),
  CONSTRAINT `FK_C51BCB8D55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_utmtags`
--

LOCK TABLES `lead_utmtags` WRITE;
/*!40000 ALTER TABLE `lead_utmtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_utmtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int unsigned DEFAULT NULL,
  `stage_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `social_cache` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `date_identified` datetime DEFAULT NULL,
  `preferred_profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribution_date` datetime DEFAULT NULL,
  `attribution` double DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foursquare` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generated_email_domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:generated)',
  PRIMARY KEY (`id`),
  KEY `IDX_179045527E3C61F9` (`owner_id`),
  KEY `IDX_179045522298D193` (`stage_id`),
  KEY `lead_date_added` (`date_added`),
  KEY `date_identified` (`date_identified`),
  KEY `fax_search` (`fax`),
  KEY `preferred_locale_search` (`preferred_locale`),
  KEY `attribution_date_search` (`attribution_date`),
  KEY `attribution_search` (`attribution`),
  KEY `website_search` (`website`),
  KEY `facebook_search` (`facebook`),
  KEY `foursquare_search` (`foursquare`),
  KEY `instagram_search` (`instagram`),
  KEY `linkedin_search` (`linkedin`),
  KEY `skype_search` (`skype`),
  KEY `twitter_search` (`twitter`),
  KEY `contact_attribution` (`attribution`,`attribution_date`),
  KEY `date_added_country_index` (`date_added`,`country`),
  KEY `generated_email_domain` (`generated_email_domain`),
  CONSTRAINT `FK_179045522298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_179045527E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES
(1,NULL,NULL,1,'2024-02-16 07:57:24',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:24','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,1,'2024-02-16 07:57:24',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:24','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,NULL,NULL,1,'2024-02-16 07:57:25',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:25','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,NULL,NULL,1,'2024-02-16 07:57:25',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:25','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,NULL,NULL,1,'2024-02-16 07:57:25',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:25','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,NULL,NULL,1,'2024-02-16 07:57:25',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:26','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,NULL,NULL,1,'2024-02-16 07:57:26',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:26','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,NULL,NULL,1,'2024-02-16 07:57:26',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:26','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,NULL,NULL,1,'2024-02-16 07:57:26',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:26','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,NULL,NULL,1,'2024-02-16 07:57:26',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:26','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,NULL,NULL,1,'2024-02-16 07:57:27',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:27','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(12,NULL,NULL,1,'2024-02-16 07:57:27',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:27','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(13,NULL,NULL,1,'2024-02-16 07:57:27',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:28','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(14,NULL,NULL,1,'2024-02-16 07:57:28',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:28','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(15,NULL,NULL,1,'2024-02-16 07:57:28',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:28','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(16,NULL,NULL,1,'2024-02-16 07:57:28',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:28','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(17,NULL,NULL,1,'2024-02-16 07:57:28',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:28','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(18,NULL,NULL,1,'2024-02-16 07:57:29',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:29','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(19,NULL,NULL,1,'2024-02-16 07:57:29',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:29','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(20,NULL,NULL,1,'2024-02-16 07:57:29',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:29','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(21,NULL,NULL,1,'2024-02-16 07:57:29',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:30','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(22,NULL,NULL,1,'2024-02-16 07:57:30',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:30','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(23,NULL,NULL,1,'2024-02-16 07:57:30',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:31','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(24,NULL,NULL,1,'2024-02-16 07:57:31',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:31','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(25,NULL,NULL,1,'2024-02-16 07:57:31',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:31','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(26,NULL,NULL,1,'2024-02-16 07:57:31',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:31','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(27,NULL,NULL,1,'2024-02-16 07:57:31',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:31','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(28,NULL,NULL,1,'2024-02-16 07:57:32',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:32','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(29,NULL,NULL,1,'2024-02-16 07:57:32',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:32','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(30,NULL,NULL,1,'2024-02-16 07:57:32',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:32','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(31,NULL,NULL,1,'2024-02-16 07:57:32',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:32','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(32,NULL,NULL,1,'2024-02-16 07:57:33',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:33','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(33,NULL,NULL,1,'2024-02-16 07:57:33',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:33','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(34,NULL,NULL,1,'2024-02-16 07:57:33',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:33','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(35,NULL,NULL,1,'2024-02-16 07:57:33',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:33','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(36,NULL,NULL,1,'2024-02-16 07:57:34',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:34','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(37,NULL,NULL,1,'2024-02-16 07:57:34',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:34','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(38,NULL,NULL,1,'2024-02-16 07:57:34',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:34','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(39,NULL,NULL,1,'2024-02-16 07:57:34',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:34','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(40,NULL,NULL,1,'2024-02-16 07:57:35',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:35','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(41,NULL,NULL,1,'2024-02-16 07:57:35',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:35','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(42,NULL,NULL,1,'2024-02-16 07:57:35',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:35','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(43,NULL,NULL,1,'2024-02-16 07:57:35',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:35','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(44,NULL,NULL,1,'2024-02-16 07:57:36',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:36','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(45,NULL,NULL,1,'2024-02-16 07:57:36',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:36','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(46,NULL,NULL,1,'2024-02-16 07:57:36',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:36','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(47,NULL,NULL,1,'2024-02-16 07:57:36',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:36','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(48,NULL,NULL,1,'2024-02-16 07:57:36',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:37','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(49,NULL,NULL,1,'2024-02-16 07:57:37',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:37','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(50,NULL,NULL,1,'2024-02-16 07:57:37',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:37','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(51,NULL,NULL,1,'2024-02-16 07:57:37',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:37','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(52,NULL,NULL,1,'2024-02-16 07:57:37',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:37','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(53,NULL,NULL,1,'2024-02-16 07:57:38',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:57:38','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(54,NULL,NULL,1,'2024-02-16 07:57:38',NULL,NULL,NULL,NULL,' ',NULL,NULL,NULL,0,'2024-02-16 07:59:15','a:0:{}','a:0:{}',NULL,'gravatar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_channels`
--

DROP TABLE IF EXISTS `message_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int DEFAULT NULL,
  `properties` json NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_index` (`message_id`,`channel`),
  KEY `IDX_FA3226A7537A1329` (`message_id`),
  KEY `channel_entity_index` (`channel`,`channel_id`),
  KEY `channel_enabled_index` (`channel`,`is_enabled`),
  CONSTRAINT `FK_FA3226A7537A1329` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_channels`
--

LOCK TABLES `message_channels` WRITE;
/*!40000 ALTER TABLE `message_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_queue`
--

DROP TABLE IF EXISTS `message_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_queue` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int NOT NULL,
  `priority` smallint NOT NULL,
  `max_attempts` smallint NOT NULL,
  `attempts` smallint NOT NULL,
  `success` tinyint(1) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_805B808871F7E88B` (`event_id`),
  KEY `IDX_805B808855458D` (`lead_id`),
  KEY `message_status_search` (`status`),
  KEY `message_date_sent` (`date_sent`),
  KEY `message_scheduled_date` (`scheduled_date`),
  KEY `message_priority` (`priority`),
  KEY `message_success` (`success`),
  KEY `message_channel_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_805B808855458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_805B808871F7E88B` FOREIGN KEY (`event_id`) REFERENCES `campaign_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_queue`
--

LOCK TABLES `message_queue` WRITE;
/*!40000 ALTER TABLE `message_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DB021E9612469DE2` (`category_id`),
  KEY `date_message_added` (`date_added`),
  CONSTRAINT `FK_DB021E9612469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitor_post_count`
--

DROP TABLE IF EXISTS `monitor_post_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_post_count` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `monitor_id` int unsigned DEFAULT NULL,
  `post_date` date NOT NULL,
  `post_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3AC20CA4CE1C902` (`monitor_id`),
  CONSTRAINT `FK_E3AC20CA4CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `monitoring` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitor_post_count`
--

LOCK TABLES `monitor_post_count` WRITE;
/*!40000 ALTER TABLE `monitor_post_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitor_post_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring`
--

DROP TABLE IF EXISTS `monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoring` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lists` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `network_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `properties` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA4F975D12469DE2` (`category_id`),
  CONSTRAINT `FK_BA4F975D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring`
--

LOCK TABLES `monitoring` WRITE;
/*!40000 ALTER TABLE `monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoring_leads`
--

DROP TABLE IF EXISTS `monitoring_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitoring_leads` (
  `monitor_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`monitor_id`,`lead_id`),
  KEY `IDX_45207A4A55458D` (`lead_id`),
  CONSTRAINT `FK_45207A4A4CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `monitoring` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_45207A4A55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_leads`
--

LOCK TABLES `monitoring_leads` WRITE;
/*!40000 ALTER TABLE `monitoring_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoring_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `deduplicate` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6000B0D3A76ED395` (`user_id`),
  KEY `notification_read_status` (`is_read`),
  KEY `notification_type` (`type`),
  KEY `notification_user_read_status` (`is_read`,`user_id`),
  KEY `deduplicate_date_added` (`deduplicate`,`date_added`),
  CONSTRAINT `FK_6000B0D3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_accesstokens`
--

DROP TABLE IF EXISTS `oauth2_accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_accesstokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3A18CA5A5F37A13B` (`token`),
  KEY `IDX_3A18CA5A19EB6921` (`client_id`),
  KEY `IDX_3A18CA5AA76ED395` (`user_id`),
  KEY `oauth2_access_token_search` (`token`),
  CONSTRAINT `FK_3A18CA5A19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3A18CA5AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_accesstokens`
--

LOCK TABLES `oauth2_accesstokens` WRITE;
/*!40000 ALTER TABLE `oauth2_accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_accesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_authcodes`
--

DROP TABLE IF EXISTS `oauth2_authcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_authcodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D2B4847B5F37A13B` (`token`),
  KEY `IDX_D2B4847B19EB6921` (`client_id`),
  KEY `IDX_D2B4847BA76ED395` (`user_id`),
  CONSTRAINT `FK_D2B4847B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D2B4847BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_authcodes`
--

LOCK TABLES `oauth2_authcodes` WRITE;
/*!40000 ALTER TABLE `oauth2_authcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_authcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_clients`
--

DROP TABLE IF EXISTS `oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `random_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `allowed_grant_types` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_F9D02AE6D60322AC` (`role_id`),
  KEY `client_id_search` (`random_id`),
  CONSTRAINT `FK_F9D02AE6D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_clients`
--

LOCK TABLES `oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_refreshtokens`
--

DROP TABLE IF EXISTS `oauth2_refreshtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_refreshtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` bigint DEFAULT NULL,
  `scope` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_328C5B1B5F37A13B` (`token`),
  KEY `IDX_328C5B1B19EB6921` (`client_id`),
  KEY `IDX_328C5B1BA76ED395` (`user_id`),
  KEY `oauth2_refresh_token_search` (`token`),
  CONSTRAINT `FK_328C5B1B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_328C5B1BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_refreshtokens`
--

LOCK TABLES `oauth2_refreshtokens` WRITE;
/*!40000 ALTER TABLE `oauth2_refreshtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_refreshtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_user_client_xref`
--

DROP TABLE IF EXISTS `oauth2_user_client_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth2_user_client_xref` (
  `client_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`user_id`),
  KEY `IDX_1AE34413A76ED395` (`user_id`),
  CONSTRAINT `FK_1AE3441319EB6921` FOREIGN KEY (`client_id`) REFERENCES `oauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1AE34413A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_user_client_xref`
--

LOCK TABLES `oauth2_user_client_xref` WRITE;
/*!40000 ALTER TABLE `oauth2_user_client_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_user_client_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_hits`
--

DROP TABLE IF EXISTS `page_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_hits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int unsigned DEFAULT NULL,
  `redirect_id` bigint unsigned DEFAULT NULL,
  `email_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `ip_id` int unsigned NOT NULL,
  `device_id` bigint unsigned DEFAULT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `url_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_9D4B70F1C4663E4` (`page_id`),
  KEY `IDX_9D4B70F1B42D874D` (`redirect_id`),
  KEY `IDX_9D4B70F1A832C1C9` (`email_id`),
  KEY `IDX_9D4B70F155458D` (`lead_id`),
  KEY `IDX_9D4B70F1A03F5E9F` (`ip_id`),
  KEY `IDX_9D4B70F194A4C7D4` (`device_id`),
  KEY `page_hit_tracking_search` (`tracking_id`),
  KEY `page_hit_code_search` (`code`),
  KEY `page_hit_source_search` (`source`,`source_id`),
  KEY `date_hit_left_index` (`date_hit`,`date_left`),
  KEY `page_hit_url` (`url`(128)),
  CONSTRAINT `FK_9D4B70F155458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F194A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `lead_devices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_9D4B70F1A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1B42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `page_redirects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9D4B70F1C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_hits`
--

LOCK TABLES `page_hits` WRITE;
/*!40000 ALTER TABLE `page_hits` DISABLE KEYS */;
INSERT INTO `page_hits` VALUES
(1,NULL,NULL,NULL,1,1,1,'2024-02-16 07:57:24',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-form/src/jquery.form.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','ns4zwg2fqymm4o6gqsouwvj',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-form/src/jquery.form.js?ve5097c5a=\";}'),
(2,NULL,NULL,NULL,2,1,2,'2024-02-16 07:57:24',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/js-cookie/src/js.cookie.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','rzt4gy7qka9kiemuu9bs0i9',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/js-cookie/src/js.cookie.js?ve5097c5a=\";}'),
(3,NULL,NULL,NULL,3,1,3,'2024-02-16 07:57:25',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery/dist/jquery.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','4as2yqf4j5ejjg0fv9fh8i3',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:69:\"https://mautic-test.com/node_modules/jquery/dist/jquery.js?ve5097c5a=\";}'),
(4,NULL,NULL,NULL,4,1,4,'2024-02-16 07:57:25',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/bootstrap/dist/js/bootstrap.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','9pgj7k12n9jb9afxv994of8',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/bootstrap/dist/js/bootstrap.js?ve5097c5a=\";}'),
(5,NULL,NULL,NULL,5,1,5,'2024-02-16 07:57:25',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/moment/min/moment.min.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','fic5c6bctqc6thpuzzkfsmt',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/moment/min/moment.min.js?ve5097c5a=\";}'),
(6,NULL,NULL,NULL,6,1,6,'2024-02-16 07:57:26',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery.caret/dist/jquery.caret.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qzg650fwy8v91ysas0sefvq',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery.caret/dist/jquery.caret.js?ve5097c5a=\";}'),
(7,NULL,NULL,NULL,7,1,7,'2024-02-16 07:57:26',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/lib/codemirror.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','var0ckotyxua11x1cuiaxag',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:76:\"https://mautic-test.com/node_modules/codemirror/lib/codemirror.js?ve5097c5a=\";}'),
(8,NULL,NULL,NULL,8,1,8,'2024-02-16 07:57:26',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/addon/hint/show-hint.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','druk3abmsdsw95tbds01i8z',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:82:\"https://mautic-test.com/node_modules/codemirror/addon/hint/show-hint.js?ve5097c5a=\";}'),
(9,NULL,NULL,NULL,9,1,9,'2024-02-16 07:57:26',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/xml/xml.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','57u5wshxx8pkp95qp1s3x46',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/codemirror/mode/xml/xml.js?ve5097c5a=\";}'),
(10,NULL,NULL,NULL,10,1,10,'2024-02-16 07:57:26',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/javascript/javascript.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','k02w8c3ezfesoi2n6nxs9lw',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:88:\"https://mautic-test.com/node_modules/codemirror/mode/javascript/javascript.js?ve5097c5a=\";}'),
(11,NULL,NULL,NULL,11,1,11,'2024-02-16 07:57:27',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/htmlmixed/htmlmixed.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','jjqeaf7bqf8bloxro4zh4cg',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:86:\"https://mautic-test.com/node_modules/codemirror/mode/htmlmixed/htmlmixed.js?ve5097c5a=\";}'),
(12,NULL,NULL,NULL,12,1,12,'2024-02-16 07:57:27',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/css/css.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','atwj1qjg2idxvehf7frctdd',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/codemirror/mode/css/css.js?ve5097c5a=\";}'),
(13,NULL,NULL,NULL,13,1,13,'2024-02-16 07:57:28',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jsplumb/dist/js/jsplumb.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','5fe2xbf5t269keywter0f8k',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/jsplumb/dist/js/jsplumb.js?ve5097c5a=\";}'),
(14,NULL,NULL,NULL,14,1,14,'2024-02-16 07:57:28',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/typeahead.js/dist/typeahead.bundle.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qui421cqksepvdgnx6zv790',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:85:\"https://mautic-test.com/node_modules/typeahead.js/dist/typeahead.bundle.js?ve5097c5a=\";}'),
(15,NULL,NULL,NULL,15,1,15,'2024-02-16 07:57:28',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-datetimepicker/build/jquery.datetimepicker.full.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','4b6s257607c8bmvbyfrad8y',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:105:\"https://mautic-test.com/node_modules/jquery-datetimepicker/build/jquery.datetimepicker.full.js?ve5097c5a=\";}'),
(16,NULL,NULL,NULL,16,1,16,'2024-02-16 07:57:28',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/shufflejs/dist/shuffle.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','b3w7h6ajrul2rjjbkfujig4',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/shufflejs/dist/shuffle.js?ve5097c5a=\";}'),
(17,NULL,NULL,NULL,17,1,17,'2024-02-16 07:57:28',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/@claviska/jquery-minicolors/jquery.minicolors.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','pmyt72f8p76nvna87ul2ed2',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:96:\"https://mautic-test.com/node_modules/@claviska/jquery-minicolors/jquery.minicolors.js?ve5097c5a=\";}'),
(18,NULL,NULL,NULL,18,1,18,'2024-02-16 07:57:29',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/dropzone/dist/dropzone.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','ysm4sv056opmdqjs7e6pxtm',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/dropzone/dist/dropzone.js?ve5097c5a=\";}'),
(19,NULL,NULL,NULL,19,1,19,'2024-02-16 07:57:29',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/multiselect/js/jquery.multi-select.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','8odofjc9t8gq2hvyn5fkf0e',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:85:\"https://mautic-test.com/node_modules/multiselect/js/jquery.multi-select.js?ve5097c5a=\";}'),
(20,NULL,NULL,NULL,20,1,20,'2024-02-16 07:57:29',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/chart.js/dist/Chart.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','e3ecy5wmf9ybzkdhwmwgy4m',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/chart.js/dist/Chart.js?ve5097c5a=\";}'),
(21,NULL,NULL,NULL,21,1,21,'2024-02-16 07:57:30',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/at.js/dist/js/jquery.atwho.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','89j8r45qxvilhkajra4eqy6',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/at.js/dist/js/jquery.atwho.js?ve5097c5a=\";}'),
(22,NULL,NULL,NULL,22,1,22,'2024-02-16 07:57:30',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery.quicksearch/src/jquery.quicksearch.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','k0yj5agpu9pzw53lwtqtzwk',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:92:\"https://mautic-test.com/node_modules/jquery.quicksearch/src/jquery.quicksearch.js?ve5097c5a=\";}'),
(23,NULL,NULL,NULL,23,1,23,'2024-02-16 07:57:31',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/version.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qp2l0iz5q7sj8cqp8oy9910',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:71:\"https://mautic-test.com/node_modules/jquery-ui/ui/version.js?ve5097c5a=\";}'),
(24,NULL,NULL,NULL,24,1,24,'2024-02-16 07:57:31',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widget.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','4d9dcjp306d065u6nik0jo7',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/widget.js?ve5097c5a=\";}'),
(25,NULL,NULL,NULL,25,1,25,'2024-02-16 07:57:31',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/plugin.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','tca3bxvy226eestf6kdgdxf',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/plugin.js?ve5097c5a=\";}'),
(26,NULL,NULL,NULL,26,1,26,'2024-02-16 07:57:31',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/position.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','gl4tiyncbs3v3itr4svka6y',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/jquery-ui/ui/position.js?ve5097c5a=\";}'),
(27,NULL,NULL,NULL,27,1,27,'2024-02-16 07:57:31',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/data.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','km3zc3s2tpgpyn34fyfwy1i',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:68:\"https://mautic-test.com/node_modules/jquery-ui/ui/data.js?ve5097c5a=\";}'),
(28,NULL,NULL,NULL,28,1,28,'2024-02-16 07:57:32',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/disable-selection.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','9wqfr5bdzk1ihmf3d7v038r',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/disable-selection.js?ve5097c5a=\";}'),
(29,NULL,NULL,NULL,29,1,29,'2024-02-16 07:57:32',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/focusable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','bu9b250zrtvrivr0hw1g22z',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/focusable.js?ve5097c5a=\";}'),
(30,NULL,NULL,NULL,30,1,30,'2024-02-16 07:57:32',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/form-reset-mixin.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','obsbujh4bimb68pr5m7tqbe',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:80:\"https://mautic-test.com/node_modules/jquery-ui/ui/form-reset-mixin.js?ve5097c5a=\";}'),
(31,NULL,NULL,NULL,31,1,31,'2024-02-16 07:57:32',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/jquery-patch.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','4rpfshahfca859bgdm1o1bu',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:76:\"https://mautic-test.com/node_modules/jquery-ui/ui/jquery-patch.js?ve5097c5a=\";}'),
(32,NULL,NULL,NULL,32,1,32,'2024-02-16 07:57:33',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/keycode.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','bvx1s4td7ywsaycfl3azv5h',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:71:\"https://mautic-test.com/node_modules/jquery-ui/ui/keycode.js?ve5097c5a=\";}'),
(33,NULL,NULL,NULL,33,1,33,'2024-02-16 07:57:33',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/labels.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','5ljg5ppybf98s4r400z65bm',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/labels.js?ve5097c5a=\";}'),
(34,NULL,NULL,NULL,34,1,34,'2024-02-16 07:57:33',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/scroll-parent.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','m52tq568fbxa4n7dtlooqnp',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/jquery-ui/ui/scroll-parent.js?ve5097c5a=\";}'),
(35,NULL,NULL,NULL,35,1,35,'2024-02-16 07:57:33',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/tabbable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','801st4qyctmbfgkfkk0ajrh',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/jquery-ui/ui/tabbable.js?ve5097c5a=\";}'),
(36,NULL,NULL,NULL,36,1,36,'2024-02-16 07:57:34',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/unique-id.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','halg4yyahl8u41l9t237ug8',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/unique-id.js?ve5097c5a=\";}'),
(37,NULL,NULL,NULL,37,1,37,'2024-02-16 07:57:34',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effect.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','55frxc2fk5i2387ff7viw1l',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/effect.js?ve5097c5a=\";}'),
(38,NULL,NULL,NULL,38,1,38,'2024-02-16 07:57:34',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/safe-blur.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','v0yahe2rl8l1kvoqwc11kht',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/safe-blur.js?ve5097c5a=\";}'),
(39,NULL,NULL,NULL,39,1,39,'2024-02-16 07:57:34',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/mouse.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','548n4gquefrkakkjuhdfdev',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/mouse.js?ve5097c5a=\";}'),
(40,NULL,NULL,NULL,40,1,40,'2024-02-16 07:57:35',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/draggable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','zlrbrgs50w4ovg5jyodpjqw',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/draggable.js?ve5097c5a=\";}'),
(41,NULL,NULL,NULL,41,1,41,'2024-02-16 07:57:35',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/droppable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','codzab7ovcvja0i5polg49u',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/droppable.js?ve5097c5a=\";}'),
(42,NULL,NULL,NULL,42,1,42,'2024-02-16 07:57:35',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/selectable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','tjziv3hql5637wr35pkut78',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:82:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/selectable.js?ve5097c5a=\";}'),
(43,NULL,NULL,NULL,43,1,43,'2024-02-16 07:57:35',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/sortable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','3mvfmexyszuiycccgtca3ob',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:80:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/sortable.js?ve5097c5a=\";}'),
(44,NULL,NULL,NULL,44,1,44,'2024-02-16 07:57:36',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/vendor/jquery-color/jquery.color.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','fr8gyhs7rh7bz34too6lmj9',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:96:\"https://mautic-test.com/node_modules/jquery-ui/ui/vendor/jquery-color/jquery.color.js?ve5097c5a=\";}'),
(45,NULL,NULL,NULL,45,1,45,'2024-02-16 07:57:36',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-drop.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','r83k89ow67xguha7d05zefc',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-drop.js?ve5097c5a=\";}'),
(46,NULL,NULL,NULL,46,1,46,'2024-02-16 07:57:36',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-fade.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','c4t0h5hdw4f52xtf3d67obp',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-fade.js?ve5097c5a=\";}'),
(47,NULL,NULL,NULL,47,1,47,'2024-02-16 07:57:36',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-size.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','xo0onypmp7tcpr7waiscpdo',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-size.js?ve5097c5a=\";}'),
(48,NULL,NULL,NULL,48,1,48,'2024-02-16 07:57:37',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-slide.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','mwctmoxczhsk6zd1pyrddnc',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:84:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-slide.js?ve5097c5a=\";}'),
(49,NULL,NULL,NULL,49,1,49,'2024-02-16 07:57:37',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-transfer.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','7q6niyvc5y3eabxgo7k6b37',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:87:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-transfer.js?ve5097c5a=\";}'),
(50,NULL,NULL,NULL,50,1,50,'2024-02-16 07:57:37',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/safe-active-element.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','o07m0yb6m9vrq1y8u2bve0a',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/safe-active-element.js?ve5097c5a=\";}'),
(51,NULL,NULL,NULL,51,1,51,'2024-02-16 07:57:37',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/button.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','5wr8og0uq4x99pubtrqmzl6',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/button.js?ve5097c5a=\";}'),
(52,NULL,NULL,NULL,52,1,52,'2024-02-16 07:57:37',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/resizable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','sn6rkd11k5dyqgqvgb7wti2',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/resizable.js?ve5097c5a=\";}'),
(53,NULL,NULL,NULL,53,1,53,'2024-02-16 07:57:38',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/slider.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','v0hndfs9113yk1r1gc014y5',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/slider.js?ve5097c5a=\";}'),
(54,NULL,NULL,NULL,54,1,54,'2024-02-16 07:57:38','2024-02-16 07:59:15','','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/controlgroup.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:84:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/controlgroup.js?ve5097c5a=\";}'),
(55,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:01',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/js-cookie/src/js.cookie.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/js-cookie/src/js.cookie.js?ve5097c5a=\";}'),
(56,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:01',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery/dist/jquery.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:69:\"https://mautic-test.com/node_modules/jquery/dist/jquery.js?ve5097c5a=\";}'),
(57,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:01',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-form/src/jquery.form.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-form/src/jquery.form.js?ve5097c5a=\";}'),
(58,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:02',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/bootstrap/dist/js/bootstrap.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/bootstrap/dist/js/bootstrap.js?ve5097c5a=\";}'),
(59,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:02',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/moment/min/moment.min.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/moment/min/moment.min.js?ve5097c5a=\";}'),
(60,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:03',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery.caret/dist/jquery.caret.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery.caret/dist/jquery.caret.js?ve5097c5a=\";}'),
(61,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:03',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/lib/codemirror.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:76:\"https://mautic-test.com/node_modules/codemirror/lib/codemirror.js?ve5097c5a=\";}'),
(62,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:03',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/addon/hint/show-hint.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:82:\"https://mautic-test.com/node_modules/codemirror/addon/hint/show-hint.js?ve5097c5a=\";}'),
(63,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:03',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/xml/xml.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/codemirror/mode/xml/xml.js?ve5097c5a=\";}'),
(64,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:04',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/javascript/javascript.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:88:\"https://mautic-test.com/node_modules/codemirror/mode/javascript/javascript.js?ve5097c5a=\";}'),
(65,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:04',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/htmlmixed/htmlmixed.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:86:\"https://mautic-test.com/node_modules/codemirror/mode/htmlmixed/htmlmixed.js?ve5097c5a=\";}'),
(66,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:04',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/codemirror/mode/css/css.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/codemirror/mode/css/css.js?ve5097c5a=\";}'),
(67,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:05',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jsplumb/dist/js/jsplumb.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:74:\"https://mautic-test.com/node_modules/jsplumb/dist/js/jsplumb.js?ve5097c5a=\";}'),
(68,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:05',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/typeahead.js/dist/typeahead.bundle.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:85:\"https://mautic-test.com/node_modules/typeahead.js/dist/typeahead.bundle.js?ve5097c5a=\";}'),
(69,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:05',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-datetimepicker/build/jquery.datetimepicker.full.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:105:\"https://mautic-test.com/node_modules/jquery-datetimepicker/build/jquery.datetimepicker.full.js?ve5097c5a=\";}'),
(70,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:05',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/shufflejs/dist/shuffle.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/shufflejs/dist/shuffle.js?ve5097c5a=\";}'),
(71,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:05',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/@claviska/jquery-minicolors/jquery.minicolors.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:96:\"https://mautic-test.com/node_modules/@claviska/jquery-minicolors/jquery.minicolors.js?ve5097c5a=\";}'),
(72,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:06',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/dropzone/dist/dropzone.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/dropzone/dist/dropzone.js?ve5097c5a=\";}'),
(73,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:06',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/multiselect/js/jquery.multi-select.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:85:\"https://mautic-test.com/node_modules/multiselect/js/jquery.multi-select.js?ve5097c5a=\";}'),
(74,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:06',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/chart.js/dist/Chart.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/chart.js/dist/Chart.js?ve5097c5a=\";}'),
(75,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:07',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/at.js/dist/js/jquery.atwho.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/at.js/dist/js/jquery.atwho.js?ve5097c5a=\";}'),
(76,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:07',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery.quicksearch/src/jquery.quicksearch.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:92:\"https://mautic-test.com/node_modules/jquery.quicksearch/src/jquery.quicksearch.js?ve5097c5a=\";}'),
(77,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:08',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/version.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:71:\"https://mautic-test.com/node_modules/jquery-ui/ui/version.js?ve5097c5a=\";}'),
(78,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:08',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widget.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/widget.js?ve5097c5a=\";}'),
(79,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:08',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/plugin.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/plugin.js?ve5097c5a=\";}'),
(80,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:08',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/position.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/jquery-ui/ui/position.js?ve5097c5a=\";}'),
(81,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:09',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/data.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:68:\"https://mautic-test.com/node_modules/jquery-ui/ui/data.js?ve5097c5a=\";}'),
(82,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:09',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/disable-selection.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/disable-selection.js?ve5097c5a=\";}'),
(83,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:09',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/focusable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/focusable.js?ve5097c5a=\";}'),
(84,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:09',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/form-reset-mixin.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:80:\"https://mautic-test.com/node_modules/jquery-ui/ui/form-reset-mixin.js?ve5097c5a=\";}'),
(85,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:10',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/jquery-patch.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:76:\"https://mautic-test.com/node_modules/jquery-ui/ui/jquery-patch.js?ve5097c5a=\";}'),
(86,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:10',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/keycode.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:71:\"https://mautic-test.com/node_modules/jquery-ui/ui/keycode.js?ve5097c5a=\";}'),
(87,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:10',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/labels.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/labels.js?ve5097c5a=\";}'),
(88,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:10',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/scroll-parent.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/jquery-ui/ui/scroll-parent.js?ve5097c5a=\";}'),
(89,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:10',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/tabbable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:72:\"https://mautic-test.com/node_modules/jquery-ui/ui/tabbable.js?ve5097c5a=\";}'),
(90,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:11',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/unique-id.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/unique-id.js?ve5097c5a=\";}'),
(91,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:11',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effect.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:70:\"https://mautic-test.com/node_modules/jquery-ui/ui/effect.js?ve5097c5a=\";}'),
(92,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:11',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/safe-blur.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:73:\"https://mautic-test.com/node_modules/jquery-ui/ui/safe-blur.js?ve5097c5a=\";}'),
(93,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:11',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/mouse.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:77:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/mouse.js?ve5097c5a=\";}'),
(94,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:12',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/draggable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/draggable.js?ve5097c5a=\";}'),
(95,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:12',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/droppable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/droppable.js?ve5097c5a=\";}'),
(96,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:12',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/selectable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:82:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/selectable.js?ve5097c5a=\";}'),
(97,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:12',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/sortable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:80:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/sortable.js?ve5097c5a=\";}'),
(98,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:13',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/vendor/jquery-color/jquery.color.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:96:\"https://mautic-test.com/node_modules/jquery-ui/ui/vendor/jquery-color/jquery.color.js?ve5097c5a=\";}'),
(99,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:13',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-drop.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-drop.js?ve5097c5a=\";}'),
(100,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:13',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-fade.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-fade.js?ve5097c5a=\";}'),
(101,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:13',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-size.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-size.js?ve5097c5a=\";}'),
(102,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:14',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-slide.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:84:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-slide.js?ve5097c5a=\";}'),
(103,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:14',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-transfer.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:87:\"https://mautic-test.com/node_modules/jquery-ui/ui/effects/effect-transfer.js?ve5097c5a=\";}'),
(104,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:14',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/safe-active-element.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:83:\"https://mautic-test.com/node_modules/jquery-ui/ui/safe-active-element.js?ve5097c5a=\";}'),
(105,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:14',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/button.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/button.js?ve5097c5a=\";}'),
(106,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:15',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/resizable.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:81:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/resizable.js?ve5097c5a=\";}'),
(107,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:15',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/slider.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:78:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/slider.js?ve5097c5a=\";}'),
(108,NULL,NULL,NULL,54,1,54,'2024-02-16 07:59:15',NULL,'','','','','',404,'https://mautic-test.com/s/login','https://mautic-test.com/node_modules/jquery-ui/ui/widgets/controlgroup.js?ve5097c5a=',NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',NULL,NULL,'a:2:{i:0;s:5:\"en-US\";i:1;s:8:\"en;q=0.9\";}','qs4x261yih57ht1er4kqo0j',NULL,NULL,'a:2:{s:9:\"ve5097c5a\";s:0:\"\";s:8:\"page_url\";s:84:\"https://mautic-test.com/node_modules/jquery-ui/ui/widgets/controlgroup.js?ve5097c5a=\";}');
/*!40000 ALTER TABLE `page_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_redirects`
--

DROP TABLE IF EXISTS `page_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_redirects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int NOT NULL,
  `unique_hits` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_redirects`
--

LOCK TABLES `page_redirects` WRITE;
/*!40000 ALTER TABLE `page_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `translation_parent_id` int unsigned DEFAULT NULL,
  `variant_parent_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_html` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `hits` int NOT NULL,
  `unique_hits` int NOT NULL,
  `variant_hits` int NOT NULL,
  `revision` int NOT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_script` longtext COLLATE utf8mb4_unicode_ci,
  `footer_script` longtext COLLATE utf8mb4_unicode_ci,
  `redirect_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_preference_center` tinyint(1) DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2074E57512469DE2` (`category_id`),
  KEY `IDX_2074E5759091A2FB` (`translation_parent_id`),
  KEY `IDX_2074E57591861123` (`variant_parent_id`),
  KEY `page_alias_search` (`alias`),
  CONSTRAINT `FK_2074E57512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2074E5759091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2074E57591861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bitwise` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_perm` (`bundle`,`name`,`role_id`),
  KEY `IDX_2DEDCC6FD60322AC` (`role_id`),
  CONSTRAINT `FK_2DEDCC6FD60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_integration_settings`
--

DROP TABLE IF EXISTS `plugin_integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_integration_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plugin_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `supported_features` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `api_keys` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `feature_settings` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_941A2CE0EC942BCF` (`plugin_id`),
  CONSTRAINT `FK_941A2CE0EC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_integration_settings`
--

LOCK TABLES `plugin_integration_settings` WRITE;
/*!40000 ALTER TABLE `plugin_integration_settings` DISABLE KEYS */;
INSERT INTO `plugin_integration_settings` VALUES
(1,NULL,'OneSignal',0,'a:4:{i:0;s:6:\"mobile\";i:1;s:20:\"landing_page_enabled\";i:2;s:28:\"welcome_notification_enabled\";i:3;s:21:\"tracking_page_enabled\";}','a:0:{}','a:0:{}'),
(2,NULL,'Twilio',0,'a:0:{}','a:0:{}','a:0:{}'),
(3,1,'GrapesJsBuilder',1,'a:0:{}','a:0:{}','a:0:{}');
/*!40000 ALTER TABLE `plugin_integration_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_missing` tinyint(1) NOT NULL,
  `bundle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_bundle` (`bundle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'GrapesJS Builder','GrapesJS Builder with MJML support for Mautic',0,'GrapesJsBuilderBundle','1.0.0','Mautic Community');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_group_contact_score`
--

DROP TABLE IF EXISTS `point_group_contact_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_group_contact_score` (
  `contact_id` bigint unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  `score` int NOT NULL,
  PRIMARY KEY (`contact_id`,`group_id`),
  KEY `IDX_9D85A703FE54D947` (`group_id`),
  CONSTRAINT `FK_9D85A703E7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9D85A703FE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_group_contact_score`
--

LOCK TABLES `point_group_contact_score` WRITE;
/*!40000 ALTER TABLE `point_group_contact_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_group_contact_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_groups`
--

DROP TABLE IF EXISTS `point_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_groups`
--

LOCK TABLES `point_groups` WRITE;
/*!40000 ALTER TABLE `point_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_lead_action_log`
--

DROP TABLE IF EXISTS `point_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_lead_action_log` (
  `point_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`point_id`,`lead_id`),
  KEY `IDX_6DF94A5655458D` (`lead_id`),
  KEY `IDX_6DF94A56A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_6DF94A5655458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6DF94A56A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_6DF94A56C028CEA2` FOREIGN KEY (`point_id`) REFERENCES `points` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_lead_action_log`
--

LOCK TABLES `point_lead_action_log` WRITE;
/*!40000 ALTER TABLE `point_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_lead_event_log`
--

DROP TABLE IF EXISTS `point_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_lead_event_log` (
  `event_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`event_id`,`lead_id`),
  KEY `IDX_C2A3BDBA55458D` (`lead_id`),
  KEY `IDX_C2A3BDBAA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_C2A3BDBA55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C2A3BDBA71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `point_trigger_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C2A3BDBAA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_lead_event_log`
--

LOCK TABLES `point_lead_event_log` WRITE;
/*!40000 ALTER TABLE `point_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_trigger_events`
--

DROP TABLE IF EXISTS `point_trigger_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_trigger_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `trigger_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_order` int NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_D5669585FDDDCD6` (`trigger_id`),
  KEY `trigger_type_search` (`type`),
  CONSTRAINT `FK_D5669585FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `point_triggers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_trigger_events`
--

LOCK TABLES `point_trigger_events` WRITE;
/*!40000 ALTER TABLE `point_trigger_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_trigger_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_triggers`
--

DROP TABLE IF EXISTS `point_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point_triggers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `points` int NOT NULL,
  `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trigger_existing_leads` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9CABD32F12469DE2` (`category_id`),
  KEY `IDX_9CABD32FFE54D947` (`group_id`),
  CONSTRAINT `FK_9CABD32F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9CABD32FFE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_triggers`
--

LOCK TABLES `point_triggers` WRITE;
/*!40000 ALTER TABLE `point_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `points` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `group_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `repeatable` tinyint(1) NOT NULL,
  `delta` int NOT NULL,
  `properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_27BA8E2912469DE2` (`category_id`),
  KEY `IDX_27BA8E29FE54D947` (`group_id`),
  KEY `point_type_search` (`type`),
  CONSTRAINT `FK_27BA8E2912469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_27BA8E29FE54D947` FOREIGN KEY (`group_id`) REFERENCES `point_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `points`
--

LOCK TABLES `points` WRITE;
/*!40000 ALTER TABLE `points` DISABLE KEYS */;
/*!40000 ALTER TABLE `points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_ids`
--

DROP TABLE IF EXISTS `push_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_ids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned DEFAULT NULL,
  `push_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4F2393E855458D` (`lead_id`),
  CONSTRAINT `FK_4F2393E855458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_ids`
--

LOCK TABLES `push_ids` WRITE;
/*!40000 ALTER TABLE `push_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_list_xref`
--

DROP TABLE IF EXISTS `push_notification_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_notification_list_xref` (
  `notification_id` int unsigned NOT NULL,
  `leadlist_id` int unsigned NOT NULL,
  PRIMARY KEY (`notification_id`,`leadlist_id`),
  KEY `IDX_473919EFB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_473919EFB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_473919EFEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `push_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_list_xref`
--

LOCK TABLES `push_notification_list_xref` WRITE;
/*!40000 ALTER TABLE `push_notification_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_stats`
--

DROP TABLE IF EXISTS `push_notification_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_notification_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `list_id` int unsigned DEFAULT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `is_clicked` tinyint(1) NOT NULL,
  `date_clicked` datetime DEFAULT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retry_count` int DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `click_count` int DEFAULT NULL,
  `last_clicked` datetime DEFAULT NULL,
  `click_details` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_DE63695EEF1A9D84` (`notification_id`),
  KEY `IDX_DE63695E55458D` (`lead_id`),
  KEY `IDX_DE63695E3DAE168B` (`list_id`),
  KEY `IDX_DE63695EA03F5E9F` (`ip_id`),
  KEY `stat_notification_search` (`notification_id`,`lead_id`),
  KEY `stat_notification_clicked_search` (`is_clicked`),
  KEY `stat_notification_hash_search` (`tracking_hash`),
  KEY `stat_notification_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_DE63695E3DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DE63695E55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_DE63695EA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_DE63695EEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `push_notifications` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_stats`
--

LOCK TABLES `push_notification_stats` WRITE;
/*!40000 ALTER TABLE `push_notification_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `heading` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `button` longtext COLLATE utf8mb4_unicode_ci,
  `utm_tags` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `notification_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int NOT NULL,
  `sent_count` int NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  `mobileSettings` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_5B9B7E4F12469DE2` (`category_id`),
  CONSTRAINT `FK_5B9B7E4F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `system` tinyint(1) NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `columns` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `filters` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `table_order` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `graphs` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `group_by` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `aggregators` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `settings` json DEFAULT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `schedule_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_day` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule_month_frequency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visits published Pages',NULL,1,'page.hits','a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}','a:2:{i:0;a:3:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";}i:1;a:3:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}}','a:8:{i:0;s:35:\"mautic.page.graph.line.time.on.site\";i:1;s:27:\"mautic.page.graph.line.hits\";i:2;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:3;s:31:\"mautic.page.graph.pie.languages\";i:4;s:34:\"mautic.page.graph.pie.time.on.site\";i:5;s:27:\"mautic.page.table.referrers\";i:6;s:30:\"mautic.page.table.most.visited\";i:7;s:37:\"mautic.page.table.most.visited.unique\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),
(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Downloads of all Assets',NULL,1,'asset.downloads','a:7:{i:0;s:16:\"ad.date_download\";i:1;s:7:\"a.title\";i:2;s:12:\"i.ip_address\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:4:\"a.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"a.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:16:\"ad.date_download\";s:9:\"direction\";s:3:\"ASC\";}}','a:4:{i:0;s:33:\"mautic.asset.graph.line.downloads\";i:1;s:31:\"mautic.asset.graph.pie.statuses\";i:2;s:34:\"mautic.asset.table.most.downloaded\";i:3;s:32:\"mautic.asset.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),
(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Submissions of published Forms',NULL,1,'form.submissions','a:0:{}','a:1:{i:1;a:3:{s:6:\"column\";s:14:\"f.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:0:{}','a:3:{i:0;s:34:\"mautic.form.graph.line.submissions\";i:1;s:32:\"mautic.form.table.most.submitted\";i:2;s:31:\"mautic.form.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),
(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'All Emails',NULL,1,'email.stats','a:5:{i:0;s:12:\"es.date_sent\";i:1;s:12:\"es.date_read\";i:2;s:9:\"e.subject\";i:3;s:16:\"es.email_address\";i:4;s:4:\"e.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"e.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:12:\"es.date_sent\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.email.graph.line.stats\";i:1;s:42:\"mautic.email.graph.pie.ignored.read.failed\";i:2;s:35:\"mautic.email.table.most.emails.read\";i:3;s:35:\"mautic.email.table.most.emails.sent\";i:4;s:43:\"mautic.email.table.most.emails.read.percent\";i:5;s:37:\"mautic.email.table.most.emails.failed\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),
(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Leads and Points',NULL,1,'lead.pointlog','a:7:{i:0;s:13:\"lp.date_added\";i:1;s:7:\"lp.type\";i:2;s:13:\"lp.event_name\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:8:\"lp.delta\";}','a:0:{}','a:1:{i:0;a:2:{s:6:\"column\";s:13:\"lp.date_added\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.lead.graph.line.points\";i:1;s:29:\"mautic.lead.table.most.points\";i:2;s:29:\"mautic.lead.table.top.actions\";i:3;s:28:\"mautic.lead.table.top.cities\";i:4;s:31:\"mautic.lead.table.top.countries\";i:5;s:28:\"mautic.lead.table.top.events\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_schedulers`
--

DROP TABLE IF EXISTS `reports_schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_schedulers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int unsigned NOT NULL,
  `schedule_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C74CA6B84BD2A4C0` (`report_id`),
  CONSTRAINT `FK_C74CA6B84BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_schedulers`
--

LOCK TABLES `reports_schedulers` WRITE;
/*!40000 ALTER TABLE `reports_schedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(1) NOT NULL,
  `readable_permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Administrator','Full system access',1,'N;');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saml_id_entry`
--

DROP TABLE IF EXISTS `saml_id_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saml_id_entry` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiryTimestamp` int NOT NULL,
  PRIMARY KEY (`id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saml_id_entry`
--

LOCK TABLES `saml_id_entry` WRITE;
/*!40000 ALTER TABLE `saml_id_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `saml_id_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_message_list_xref`
--

DROP TABLE IF EXISTS `sms_message_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_message_list_xref` (
  `sms_id` int unsigned NOT NULL,
  `leadlist_id` int unsigned NOT NULL,
  PRIMARY KEY (`sms_id`,`leadlist_id`),
  KEY `IDX_B032FC2EB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_B032FC2EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `lead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B032FC2EBD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `sms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_message_list_xref`
--

LOCK TABLES `sms_message_list_xref` WRITE;
/*!40000 ALTER TABLE `sms_message_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_message_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_message_stats`
--

DROP TABLE IF EXISTS `sms_message_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_message_stats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sms_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `list_id` int unsigned DEFAULT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `tracking_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `tokens` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `details` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE1BAE9BD5C7E60` (`sms_id`),
  KEY `IDX_FE1BAE955458D` (`lead_id`),
  KEY `IDX_FE1BAE93DAE168B` (`list_id`),
  KEY `IDX_FE1BAE9A03F5E9F` (`ip_id`),
  KEY `stat_sms_search` (`sms_id`,`lead_id`),
  KEY `stat_sms_hash_search` (`tracking_hash`),
  KEY `stat_sms_source_search` (`source`,`source_id`),
  KEY `stat_sms_failed_search` (`is_failed`),
  CONSTRAINT `FK_FE1BAE93DAE168B` FOREIGN KEY (`list_id`) REFERENCES `lead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE1BAE955458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_FE1BAE9A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`),
  CONSTRAINT `FK_FE1BAE9BD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `sms_messages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_message_stats`
--

LOCK TABLES `sms_message_stats` WRITE;
/*!40000 ALTER TABLE `sms_message_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_message_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_messages`
--

DROP TABLE IF EXISTS `sms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sms_type` longtext COLLATE utf8mb4_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BDF43F9712469DE2` (`category_id`),
  CONSTRAINT `FK_BDF43F9712469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_messages`
--

LOCK TABLES `sms_messages` WRITE;
/*!40000 ALTER TABLE `sms_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_lead_action_log`
--

DROP TABLE IF EXISTS `stage_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_lead_action_log` (
  `stage_id` int unsigned NOT NULL,
  `lead_id` bigint unsigned NOT NULL,
  `ip_id` int unsigned DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`stage_id`,`lead_id`),
  KEY `IDX_A506AFBE55458D` (`lead_id`),
  KEY `IDX_A506AFBEA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_A506AFBE2298D193` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A506AFBE55458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A506AFBEA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_lead_action_log`
--

LOCK TABLES `stage_lead_action_log` WRITE;
/*!40000 ALTER TABLE `stage_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `stage_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stages`
--

DROP TABLE IF EXISTS `stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `weight` int NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FA26A6412469DE2` (`category_id`),
  CONSTRAINT `FK_2FA26A6412469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stages`
--

LOCK TABLES `stages` WRITE;
/*!40000 ALTER TABLE `stages` DISABLE KEYS */;
/*!40000 ALTER TABLE `stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_object_field_change_report`
--

DROP TABLE IF EXISTS `sync_object_field_change_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_object_field_change_report` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint unsigned NOT NULL,
  `object_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_at` datetime NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_composite_key` (`object_type`,`object_id`,`column_name`),
  KEY `integration_object_composite_key` (`integration`,`object_type`,`object_id`,`column_name`),
  KEY `integration_object_type_modification_composite_key` (`integration`,`object_type`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_field_change_report`
--

LOCK TABLES `sync_object_field_change_report` WRITE;
/*!40000 ALTER TABLE `sync_object_field_change_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_object_field_change_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_object_mapping`
--

DROP TABLE IF EXISTS `sync_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_object_mapping` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `integration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_object_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `internal_object_id` bigint unsigned NOT NULL,
  `integration_object_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `integration_object_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_sync_date` datetime NOT NULL,
  `internal_storage` json NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `integration_reference_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integration_object` (`integration`,`integration_object_name`,`integration_object_id`,`integration_reference_id`),
  KEY `integration_reference` (`integration`,`integration_object_name`,`integration_reference_id`,`integration_object_id`),
  KEY `integration_last_sync_date` (`integration`,`last_sync_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_object_mapping`
--

LOCK TABLES `sync_object_mapping` WRITE;
/*!40000 ALTER TABLE `sync_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `sync_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_stats`
--

DROP TABLE IF EXISTS `tweet_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweet_stats` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` int unsigned DEFAULT NULL,
  `lead_id` bigint unsigned DEFAULT NULL,
  `twitter_tweet_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `handle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `retry_count` int DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int DEFAULT NULL,
  `favorite_count` int DEFAULT NULL,
  `retweet_count` int DEFAULT NULL,
  `response_details` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB8CBAE51041E39B` (`tweet_id`),
  KEY `IDX_CB8CBAE555458D` (`lead_id`),
  KEY `stat_tweet_search` (`tweet_id`,`lead_id`),
  KEY `stat_tweet_search2` (`lead_id`,`tweet_id`),
  KEY `stat_tweet_failed_search` (`is_failed`),
  KEY `stat_tweet_source_search` (`source`,`source_id`),
  KEY `favorite_count_index` (`favorite_count`),
  KEY `retweet_count_index` (`retweet_count`),
  KEY `tweet_date_sent` (`date_sent`),
  KEY `twitter_tweet_id_index` (`twitter_tweet_id`),
  CONSTRAINT `FK_CB8CBAE51041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_CB8CBAE555458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_stats`
--

LOCK TABLES `tweet_stats` WRITE;
/*!40000 ALTER TABLE `tweet_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweet_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tweets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `page_id` int unsigned DEFAULT NULL,
  `asset_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `media_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_count` int DEFAULT NULL,
  `favorite_count` int DEFAULT NULL,
  `retweet_count` int DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA38402512469DE2` (`category_id`),
  KEY `IDX_AA384025C4663E4` (`page_id`),
  KEY `IDX_AA3840255DA1941` (`asset_id`),
  KEY `sent_count_index` (`sent_count`),
  KEY `favorite_count_index` (`favorite_count`),
  KEY `retweet_count_index` (`retweet_count`),
  CONSTRAINT `FK_AA38402512469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA3840255DA1941` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_AA384025C4663E4` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `authorizator` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `one_time_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CF080AB35CA2E8E5` (`secret`),
  KEY `IDX_CF080AB3A76ED395` (`user_id`),
  CONSTRAINT `FK_CF080AB3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tokens`
--

LOCK TABLES `user_tokens` WRITE;
/*!40000 ALTER TABLE `user_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `preferences` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `signature` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`),
  KEY `IDX_1483A5E9D60322AC` (`role_id`),
  CONSTRAINT `FK_1483A5E9D60322AC` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin','$2y$13$TJCROPyRfZs1IYapw0C68eb.1SfX4sLmoCzBVBQ0rocErpKZF.Eb6','Admin','Mautic','mautic@docker.local',NULL,'','',NULL,NULL,'a:0:{}',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_hits`
--

DROP TABLE IF EXISTS `video_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_hits` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` bigint unsigned DEFAULT NULL,
  `ip_id` int unsigned NOT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int NOT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `url` longtext COLLATE utf8mb4_unicode_ci,
  `user_agent` longtext COLLATE utf8mb4_unicode_ci,
  `remote_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int DEFAULT NULL,
  `time_watched` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_1D1831F755458D` (`lead_id`),
  KEY `IDX_1D1831F7A03F5E9F` (`ip_id`),
  KEY `video_date_hit` (`date_hit`),
  KEY `video_channel_search` (`channel`,`channel_id`),
  KEY `video_guid_lead_search` (`guid`,`lead_id`),
  CONSTRAINT `FK_1D1831F755458D` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1D1831F7A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `ip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_hits`
--

LOCK TABLES `video_hits` WRITE;
/*!40000 ALTER TABLE `video_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_events`
--

DROP TABLE IF EXISTS `webhook_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int unsigned NOT NULL,
  `event_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7AD44E375C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_7AD44E375C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_events`
--

LOCK TABLES `webhook_events` WRITE;
/*!40000 ALTER TABLE `webhook_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_logs`
--

DROP TABLE IF EXISTS `webhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int unsigned NOT NULL,
  `status_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `runtime` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_45A353475C9BA60B` (`webhook_id`),
  KEY `webhook_id_date_added` (`webhook_id`,`date_added`),
  CONSTRAINT `FK_45A353475C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_logs`
--

LOCK TABLES `webhook_logs` WRITE;
/*!40000 ALTER TABLE `webhook_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook_queue`
--

DROP TABLE IF EXISTS `webhook_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook_queue` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int unsigned NOT NULL,
  `event_id` int unsigned NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci,
  `payload_compressed` mediumblob,
  PRIMARY KEY (`id`),
  KEY `IDX_F52D9A1A5C9BA60B` (`webhook_id`),
  KEY `IDX_F52D9A1A71F7E88B` (`event_id`),
  CONSTRAINT `FK_F52D9A1A5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `webhooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F52D9A1A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `webhook_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_queue`
--

LOCK TABLES `webhook_queue` WRITE;
/*!40000 ALTER TABLE `webhook_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `webhook_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `events_orderby_dir` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_998C4FDD12469DE2` (`category_id`),
  CONSTRAINT `FK_998C4FDD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_by_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `cache_timeout` int DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `params` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-16  8:25:14
