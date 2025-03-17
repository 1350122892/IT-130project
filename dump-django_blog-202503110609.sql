-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: django_blog
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 文章',7,'add_article'),(26,'Can change 文章',7,'change_article'),(27,'Can delete 文章',7,'delete_article'),(28,'Can view 文章',7,'view_article'),(29,'Can add 分类',8,'add_category'),(30,'Can change 分类',8,'change_category'),(31,'Can delete 分类',8,'delete_category'),(32,'Can view 分类',8,'view_category'),(33,'Can add 标签',9,'add_tag'),(34,'Can change 标签',9,'change_tag'),(35,'Can delete 标签',9,'delete_tag'),(36,'Can view 标签',9,'view_tag'),(37,'Can add 成员',10,'add_link'),(38,'Can change 成员',10,'change_link'),(39,'Can delete 成员',10,'delete_link'),(40,'Can view 成员',10,'view_link'),(41,'Can add 网站设置',11,'add_site'),(42,'Can change 网站设置',11,'change_site'),(43,'Can delete 网站设置',11,'delete_site'),(44,'Can view 网站设置',11,'view_site'),(45,'Can add 公告栏',12,'add_notice'),(46,'Can change 公告栏',12,'change_notice'),(47,'Can delete 公告栏',12,'delete_notice'),(48,'Can view 公告栏',12,'view_notice'),(49,'Can add valine评论',13,'add_valine'),(50,'Can change valine评论',13,'change_valine'),(51,'Can delete valine评论',13,'delete_valine'),(52,'Can view valine评论',13,'view_valine'),(53,'Can add 关于',14,'add_about'),(54,'Can change 关于',14,'change_about'),(55,'Can delete 关于',14,'delete_about'),(56,'Can view 关于',14,'view_about'),(57,'Can add 社交',15,'add_social'),(58,'Can change 社交',15,'change_social'),(59,'Can delete 社交',15,'delete_social'),(60,'Can view 社交',15,'view_social'),(61,'Can add 技能',16,'add_skill'),(62,'Can change 技能',16,'change_skill'),(63,'Can delete 技能',16,'delete_skill'),(64,'Can view 技能',16,'view_skill'),(65,'Can add 年份',17,'add_year'),(66,'Can change 年份',17,'change_year'),(67,'Can delete 年份',17,'delete_year'),(68,'Can view 年份',17,'view_year'),(69,'Can add city',18,'add_city'),(70,'Can change city',18,'change_city'),(71,'Can delete city',18,'delete_city'),(72,'Can view city',18,'view_city'),(73,'Can add user',19,'add_user'),(74,'Can change user',19,'change_user'),(75,'Can delete user',19,'delete_user'),(76,'Can view user',19,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$8qSpJD8ltQcVBevAXmhZ2X$7zJtjSt/A1z36w2SHEtyvezPYQXASD34EfQAcIh3U5c=','2025-03-11 04:20:05.582534',1,'admin','','','123@qq.com',1,1,'2025-02-09 22:25:09.102502');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_about`
--

DROP TABLE IF EXISTS `blog_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_about` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `career` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` longtext COLLATE utf8_unicode_ci NOT NULL,
  `skill_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_about`
--

LOCK TABLES `blog_about` WRITE;
/*!40000 ALTER TABLE `blog_about` DISABLE KEYS */;
INSERT INTO `blog_about` VALUES (1,'','','博客内容详情','我的技能');
/*!40000 ALTER TABLE `blog_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cover` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `click_count` int(10) unsigned NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `author` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `years_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_category_id_7e38f15e` (`category_id`),
  KEY `blog_article_years_id_4c1eb35f` (`years_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'test','111','https://haowallpaper.com/link/common/file/previewFileImg/15888296343948672','sadasdsadasdasdsad',117,0,'2025-02-10 07:27:26.000000','2025-03-11 06:06:10.592058','admin',1,1),(2,'AAAAA','GFNbrat的博客','https://haowallpaper.com/link/common/file/previewFileImg/16263610149424512','djsakljdklsajkld',85,0,'2025-02-10 21:26:12.000000','2025-03-11 05:56:37.219378','admin',NULL,NULL),(3,'django搭建','django搭建','https://haowallpaper.com/link/common/file/previewFileImg/16445193103461760','213213123sdaxczxczc',72,1,'2025-03-07 06:07:00.000000','2025-03-11 05:54:56.390318','admin',2,1),(4,'java心得','Java工具开发','https://haowallpaper.com/link/common/file/previewFileImg/16489573700390272','burpsuite',61,0,'2025-03-07 06:38:39.000000','2025-03-11 06:07:41.066745','admin',1,1),(5,'时代少年团','我们喜欢你','https://th.bing.com/th/id/R.591bc8bbb6c3fa076ee2d77238d48cc1?rik=HLoGoUjRvcnsCg&pid=ImgRaw&r=0','12322313',40,0,'2025-03-09 02:00:26.000000','2025-03-11 05:04:10.552153','admin',2,2);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tag`
--

DROP TABLE IF EXISTS `blog_article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tag_article_id_tag_id_818e752b_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tag_article_id_8db2395e` (`article_id`),
  KEY `blog_article_tag_tag_id_f2afe66b` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tag`
--

LOCK TABLES `blog_article_tag` WRITE;
/*!40000 ALTER TABLE `blog_article_tag` DISABLE KEYS */;
INSERT INTO `blog_article_tag` VALUES (1,3,1),(2,4,3),(3,5,1);
/*!40000 ALTER TABLE `blog_article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_menu` tinyint(1) NOT NULL,
  `icon` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'cyber security',1,0,'fas fa-home'),(2,'python',2,0,'fas fa-home');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_city`
--

DROP TABLE IF EXISTS `blog_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_city`
--

LOCK TABLES `blog_city` WRITE;
/*!40000 ALTER TABLE `blog_city` DISABLE KEYS */;
INSERT INTO `blog_city` VALUES (1,'北京',10),(2,'上海',8);
/*!40000 ALTER TABLE `blog_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_link`
--

DROP TABLE IF EXISTS `blog_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8_unicode_ci NOT NULL,
  `button_word` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_link`
--

LOCK TABLES `blog_link` WRITE;
/*!40000 ALTER TABLE `blog_link` DISABLE KEYS */;
INSERT INTO `blog_link` VALUES (1,'GitHub','https://github.com','https://i.loli.net/2020/04/23/jGP8gQOYW75TSJp.png','我的 GitHub 仓库','访问');
/*!40000 ALTER TABLE `blog_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_notice`
--

DROP TABLE IF EXISTS `blog_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_notice`
--

LOCK TABLES `blog_notice` WRITE;
/*!40000 ALTER TABLE `blog_notice` DISABLE KEYS */;
INSERT INTO `blog_notice` VALUES (1,'欢迎公告','欢迎来到我的博客！请多多指教。','fas fa-info-circle');
/*!40000 ALTER TABLE `blog_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_site`
--

DROP TABLE IF EXISTS `blog_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bg_cover` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dynamic_slogan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icp_number` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `icp_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_site`
--

LOCK TABLES `blog_site` WRITE;
/*!40000 ALTER TABLE `blog_site` DISABLE KEYS */;
INSERT INTO `blog_site` VALUES (1,'GFNbrat','/media/img/background.png','韶光易逝，请君惜取少年时','韶光易逝，请君惜取少年时','备案号','备案链接','关键字测试','','https://jwt1399.top/favicon.png');
/*!40000 ALTER TABLE `blog_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_skill`
--

DROP TABLE IF EXISTS `blog_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_skill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `skill_precent` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_skill`
--

LOCK TABLES `blog_skill` WRITE;
/*!40000 ALTER TABLE `blog_skill` DISABLE KEYS */;
INSERT INTO `blog_skill` VALUES (1,'Python','90%'),(2,'Django','85%');
/*!40000 ALTER TABLE `blog_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_social`
--

DROP TABLE IF EXISTS `blog_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_social` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `social_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `social_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `social_icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_social`
--

LOCK TABLES `blog_social` WRITE;
/*!40000 ALTER TABLE `blog_social` DISABLE KEYS */;
INSERT INTO `blog_social` VALUES (1,'https://twitter.com','Twitter','fab fa-twitter'),(2,'https://github.com','GitHub','fab fa-github');
/*!40000 ALTER TABLE `blog_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Python'),(2,'Javascript'),(3,'Java');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_user`
--

DROP TABLE IF EXISTS `blog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_user`
--

LOCK TABLES `blog_user` WRITE;
/*!40000 ALTER TABLE `blog_user` DISABLE KEYS */;
INSERT INTO `blog_user` VALUES (1,'admin','cce41e66c45b0d592977de57a9754a6f','12@qq.com');
/*!40000 ALTER TABLE `blog_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_valine`
--

DROP TABLE IF EXISTS `blog_valine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_valine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `appkey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pagesize` int(11) NOT NULL,
  `placeholder` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_valine`
--

LOCK TABLES `blog_valine` WRITE;
/*!40000 ALTER TABLE `blog_valine` DISABLE KEYS */;
INSERT INTO `blog_valine` VALUES (1,'your_appid_here','your_appkey_here','',10,'说点什么吧...');
/*!40000 ALTER TABLE `blog_valine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_year`
--

DROP TABLE IF EXISTS `blog_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_year` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_year`
--

LOCK TABLES `blog_year` WRITE;
/*!40000 ALTER TABLE `blog_year` DISABLE KEYS */;
INSERT INTO `blog_year` VALUES (1,'2022'),(2,'2023'),(3,'2024'),(4,'2025');
/*!40000 ALTER TABLE `blog_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-03-06 21:29:39.539059','2','我的博客',3,'',11,1),(2,'2025-03-07 05:55:43.008922','1','cyber security',1,'[{\"added\": {}}]',8,1),(3,'2025-03-07 05:55:54.201090','2','python',1,'[{\"added\": {}}]',8,1),(4,'2025-03-07 06:06:03.683956','1','Python',1,'[{\"added\": {}}]',9,1),(5,'2025-03-07 06:06:17.504707','2','Javascript',1,'[{\"added\": {}}]',9,1),(6,'2025-03-07 06:06:22.339160','3','Java',1,'[{\"added\": {}}]',9,1),(7,'2025-03-07 09:02:40.857923','2','2023',1,'[{\"added\": {}}]',17,1),(8,'2025-03-07 09:02:43.267944','3','2024',1,'[{\"added\": {}}]',17,1),(9,'2025-03-07 09:02:46.300930','4','2025',1,'[{\"added\": {}}]',17,1),(10,'2025-03-11 05:03:33.884838','5','时代少年团',2,'[{\"changed\": {\"fields\": [\"Recommended\"]}}]',7,1),(11,'2025-03-11 05:04:10.555900','5','时代少年团',2,'[{\"changed\": {\"fields\": [\"Recommended\"]}}]',7,1),(12,'2025-03-11 05:10:43.457813','3','django搭建',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1),(13,'2025-03-11 05:11:03.164044','3','django搭建',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1),(14,'2025-03-11 05:37:12.590344','3','django搭建',2,'[{\"changed\": {\"fields\": [\"Recommended\"]}}]',7,1),(15,'2025-03-11 05:54:56.398879','3','django搭建',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1),(16,'2025-03-11 05:56:37.225060','2','AAAAA',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1),(17,'2025-03-11 06:06:10.598702','1','test',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1),(18,'2025-03-11 06:07:41.074242','4','java心得',2,'[{\"changed\": {\"fields\": [\"Article Cover\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'blog','article'),(8,'blog','category'),(9,'blog','tag'),(10,'blog','link'),(11,'blog','site'),(12,'blog','notice'),(13,'blog','valine'),(14,'blog','about'),(15,'blog','social'),(16,'blog','skill'),(17,'blog','year'),(18,'blog','city'),(19,'blog','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-02-09 17:51:20.608211'),(2,'auth','0001_initial','2025-02-09 17:51:21.817694'),(3,'admin','0001_initial','2025-02-09 17:51:22.099611'),(4,'admin','0002_logentry_remove_auto_add','2025-02-09 17:51:22.108495'),(5,'admin','0003_logentry_add_action_flag_choices','2025-02-09 17:51:22.115381'),(6,'contenttypes','0002_remove_content_type_name','2025-02-09 17:51:22.254669'),(7,'auth','0002_alter_permission_name_max_length','2025-02-09 17:51:22.332634'),(8,'auth','0003_alter_user_email_max_length','2025-02-09 17:51:22.409699'),(9,'auth','0004_alter_user_username_opts','2025-02-09 17:51:22.417931'),(10,'auth','0005_alter_user_last_login_null','2025-02-09 17:51:22.490702'),(11,'auth','0006_require_contenttypes_0002','2025-02-09 17:51:22.494786'),(12,'auth','0007_alter_validators_add_error_messages','2025-02-09 17:51:22.501588'),(13,'auth','0008_alter_user_username_max_length','2025-02-09 17:51:22.565671'),(14,'auth','0009_alter_user_last_name_max_length','2025-02-09 17:51:22.627632'),(15,'auth','0010_alter_group_name_max_length','2025-02-09 17:51:22.704679'),(16,'auth','0011_update_proxy_permissions','2025-02-09 17:51:22.713123'),(17,'auth','0012_alter_user_first_name_max_length','2025-02-09 17:51:22.783675'),(18,'blog','0001_initial','2025-02-09 17:51:22.800692'),(19,'blog','0002_auto_20200421_1626','2025-02-09 17:51:22.953603'),(20,'blog','0003_auto_20200422_1856','2025-02-09 17:51:23.434673'),(21,'blog','0004_auto_20200424_0912','2025-02-09 17:51:23.462244'),(22,'blog','0005_auto_20200424_0913','2025-02-09 17:51:23.528657'),(23,'blog','0006_auto_20200425_1620','2025-02-09 17:51:23.535871'),(24,'blog','0007_site','2025-02-09 17:51:23.559558'),(25,'blog','0008_auto_20200426_1035','2025-02-09 17:51:24.213584'),(26,'blog','0009_auto_20200426_1202','2025-02-09 17:51:24.311468'),(27,'blog','0010_auto_20200426_1303','2025-02-09 17:51:24.431678'),(28,'blog','0011_notice_icon','2025-02-09 17:51:24.523666'),(29,'blog','0012_valine','2025-02-09 17:51:24.539699'),(30,'blog','0013_auto_20200426_2226','2025-02-09 17:51:24.545617'),(31,'blog','0014_auto_20200426_2252','2025-02-09 17:51:24.550436'),(32,'blog','0015_auto_20200426_2312','2025-02-09 17:51:24.554754'),(33,'blog','0016_auto_20200427_1024','2025-02-09 17:51:24.634663'),(34,'blog','0017_auto_20200427_1042','2025-02-09 17:51:24.840922'),(35,'blog','0018_skill','2025-02-09 17:51:24.868814'),(36,'blog','0019_auto_20200427_1119','2025-02-09 17:51:25.023665'),(37,'blog','0020_auto_20200429_1619','2025-02-09 17:51:25.030685'),(38,'blog','0021_auto_20200429_1622','2025-02-09 17:51:25.034811'),(39,'blog','0022_auto_20200430_1152','2025-02-09 17:51:25.040443'),(40,'blog','0023_auto_20200430_1156','2025-02-09 17:51:25.045823'),(41,'blog','0024_auto_20200430_1159','2025-02-09 17:51:25.115624'),(42,'blog','0025_auto_20241021_1449','2025-02-09 17:51:26.267706'),(43,'blog','0026_alter_site_logo','2025-02-09 17:51:26.273539'),(44,'blog','0027_auto_20241025_1606','2025-02-09 17:51:26.627545'),(45,'blog','0028_auto_20241111_1619','2025-02-09 17:51:26.782498'),(46,'blog','0029_auto_20241111_1625','2025-02-09 17:51:27.185521'),(47,'blog','0030_auto_20241114_2158','2025-02-09 17:51:27.326459'),(48,'blog','0031_alter_year_year','2025-02-09 17:51:27.389589'),(49,'blog','0032_alter_year_year','2025-02-09 17:51:27.453562'),(50,'blog','0033_city','2025-02-09 17:51:27.482616'),(51,'blog','0034_auto_20241117_2031','2025-02-09 17:51:27.491629'),(52,'blog','0035_user','2025-02-09 17:51:27.514798'),(53,'blog','0036_alter_article_update_time','2025-02-09 17:51:27.520642'),(54,'blog','0037_alter_article_update_time','2025-02-09 17:51:27.526896'),(55,'blog','0038_user_email','2025-02-09 17:51:27.589794'),(56,'sessions','0001_initial','2025-02-09 17:51:27.670628');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7hrw96p1fnr4721mabou94gowbd54mzd','eyJpbWFnZV9jb2RlIjoiUUdGQUEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1thF1U:waNWAk3ufAf_Vh95H0QoW2niKIbwDZ0KJtcRBybXGGA','2025-02-09 21:40:28.808917'),('iyzvwha8jcjhg95abumei2eczv247un3','eyJpbWFnZV9jb2RlIjoiQkJUVlciLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqItd:D1CvR14Y_KwL7UHxCt6YjcqlJ2exjO7fXnY615UI1dk','2025-03-06 21:37:49.835800'),('jbms1ezozgm4835su762l3csliakx9pb','eyJpbWFnZV9jb2RlIjoiVkpUQ1AiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqKAK:n46fU1m6Dje13kFrYEFbUaPWeY38kKmW47qMT9jY9Mo','2025-03-07 06:59:08.794583'),('k41kuue15wqgg4jsfa4s7drcq2kgod36','eyJpbWFnZV9jb2RlIjoiSkFPREUiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1thGii:Tr_1ytZvoXoRbDThryB4tt7Qq4UyIfCGVLsCCw59IaA','2025-02-09 23:29:12.904142'),('4s0xlfg0jsjg4z3500khlk90h97232l9','eyJpbWFnZV9jb2RlIjoiRVJJTVkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1thU2N:Yqd3H5g-MNQRq_Cf8OC6XGlUSnOpXT9WsLKN-ycTwHU','2025-02-10 13:42:23.709799'),('lng9j865p9hmwqvp04vij0fwhqmwy16c','eyJpbWFnZV9jb2RlIjoiVkhBSUYiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1thU8y:3IaVaMFKOiSu33Uvc9cOyv3Oys1w0SiMViOvoKhLW84','2025-02-10 13:49:12.141399'),('h9wail3omyepg5w2y632hozhfeblvbor','eyJpbWFnZV9jb2RlIjoiRlNQSkgiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqLKi:JCRBzCZQIa7qqX9dBg4220M7Ind__UrCVgfmSNx-Jco','2025-03-07 08:13:56.307550'),('jbr4y6mhl9gjco64aebxsmzed0o1mirx','eyJpbWFnZV9jb2RlIjoiSEFPR1oiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqyP4:FIjox6HY1AgGBcBRGPgH1zKWjetUSIAnbq55au5PSMA','2025-03-09 01:57:02.068058'),('synbq3doshmugbltc1me8wm77y6dxar0','eyJjYXB0Y2hhX2NvZGUiOiJSRldKUiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1trRyJ:drLqQrAMVMQcnFLe2Tqou3OvU7kloeTzJzHKtkAE_xI','2025-03-10 09:31:23.388751'),('gh45xm9kd87ufyaqw3kpc1o3l9wbglmb','eyJjYXB0Y2hhX2NvZGUiOiJETFBXSCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1trS48:qC-KIwfw3G53PYYOR_mYp-hitsLpBTF_hOIW8EjyobQ','2025-03-10 09:37:24.475229'),('z1gxaykxydh6lsoygticqv280q840vcy','eyJpbWFnZV9jb2RlIjoiS0VUWUEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1thrAi:57G07Yf4zndXEmnS5lihnTnVQsccGZ8xY1hAUwtySfs','2025-02-11 14:24:32.971393'),('g9k3bkv7azhwjuhvrs7zsirqwtgfh316','eyJpbWFnZV9jb2RlIjoiQ05XRVoiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tibU6:WswMLpMg010dAzR2hWQpXgnzhfv__Y8SGd3KpmWXwcQ','2025-02-13 15:51:38.300427'),('cdmgz3u7ikmpvlpu1uh8eqshzxm376l3','eyJpbWFnZV9jb2RlIjoiUkpUQloiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tibVi:hYFKCFDiUVDhybJh7ZyJ-QXK-zfVtHFdA9zK8qrWoa8','2025-02-13 15:53:18.817946'),('c1bpo6t39yaatxfl4n6ce9w40ck9om0n','eyJpbWFnZV9jb2RlIjoiSFhPR0wiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tjzi2:i3wsl-CRW0Lnflzq8GJ-mUSnwFVntBh5nJPZ6an2XvU','2025-02-17 11:55:46.859616'),('w6vsm9r6xmvp9xmyzj7pzdf2d97r988g','eyJpbWFnZV9jb2RlIjoiVEJVT08iLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tjzvi:zgBFxod-l291v9VopgbuqmfHt45I5f-3ZVqRfM6r2HI','2025-02-17 12:09:54.872250'),('xjk1tl8ouu4638lodbrc74aru9sntof9','eyJpbWFnZV9jb2RlIjoiQU5CQ1QiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqCe0:JVxfhFQhMl5FZdzqdBA6lTKYO4xAcrPClBJNysWGkrI','2025-03-06 14:57:16.485555'),('u6dgpgd4h23sr9d3fod0yvzx4i1axyfd','eyJpbWFnZV9jb2RlIjoiVUpER1kiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqEEK:gTJ7-e_40lbitnHZKZICEzGuK0NOjUYprieEMOfC4U0','2025-03-06 16:38:52.169785'),('4w8kibn37lagpvgdnhi0bbxl9iwe9iwx','eyJpbWFnZV9jb2RlIjoiVEtTSU8iLCJfc2Vzc2lvbl9leHBpcnkiOjYwLCJpbmZvIjp7ImlkIjoxLCJuYW1lIjoiYWRtaW4ifX0:1tqEHM:fa-i7b4HtKl7LABCVVTikd9zBJlov3bK55j_rdhr3_o','2025-03-06 16:42:00.146050'),('mbjwt8jan5mcsvic8gb4in4ywbax32g0','eyJpbWFnZV9jb2RlIjoiUENSSEMiLCJfc2Vzc2lvbl9leHBpcnkiOjYwfQ:1tqKBg:d4FYKnEWwwz0X-jbiRvQsz88Mge8pLq_BDVXaEsCZcg','2025-03-07 07:00:32.053637'),('91p8fniszeiz3l3mzlu5hx5u56jlku54','.eJydlk1v2zAMhv9K4XMTy_GH5Bx32GnDsOOwFAH15WhRLEOy1xZF__skO4c2st1iyEGBRPMhqZe0X5IjDP3pODhhj4on-yRL7t_uUWBn0YYD_gfaxmyZaXur6DaYbK-nbvvdcKG_XG3fOTiBO_mna8CokECgQBwLxFhOsxJLAkgyWZF6VwgmgGcYClFRgSpWY2Blyf1fKXkdnF5EOzjv6_fLIWnhIg7J_u6QHA5DVRLsFwwChYVCFpYCVYfk3lsoH_NkK8HdSdhQY84b04l2Or-E4F2wWPX8KV-D1dNxCvyi2pRq06Rge8W0SCcToXgwyRDavd7f3RLLnQ_bExmmC0StXL8CY9CLxtjniJbP0CqCxvwoFgu0Hhq3QvPHEaiYS0vgwi-FkPz_QM8CbEQqXx_eb2RzOe6yIIuyKEmMtgEdhLqC1qo9R-hqLsmsYiOpgKm2ckk0g9YnY9c00xqvmVgyeBaL87G2RPiFUBoWLKulKwXOrXBuw8DyDzvAN-mYDN6F1AopQm9VvikXaimVFmutQM3QR1nVM1nhOhdjVlAs5MHMxY-EfgN6rR-cYQr0LTJDs0ohQSn-3pZEyi3IXrVNYHfg1gTrzkrH2OxWsWQudVmOEwx4_akLbbShYuM9WMVgNSbVR5LKoin0F7ziJymxYgoAFm77egVrzMlbRL1OI-i66ZHwxphs3pei3JHxZnI8dhYJKqxyMm7iIl-oSOjojTspoT9W-FtE5G1hPIRo07Af5VXO6SoEehjqqhzfT4ItKTp49H1pmjlcY83QRbzqRlDZ3PS9CqomuBwXMl5rzWYG4hhHB52vX6ehFR8PiJzR4NSPhpuoT33f7dM02-Et8r9sTxBCqbTKfyTEYBrAj0ZLT2fnDYW-98ox7W3Ccw1TMj9qw8goq0_FoFounpamijWPEbS-rTJ-ffCfJOoCjTgyXxz_WfLr28-vP8J3ivPD1Qd-FE-dss_JvkKv_wBNONyV:1tqLIb:_xMvi-F0xw61qCblvY6oAZAO2LFRALtJYs0lXo_XEqc','2025-03-07 08:11:45.838364'),('zztpt60f5rluyqj3ais860xloz5kwux7','.eJydlk1v2zAMhv9K4XMTy_GH5BwH9Dhg2I5LEVBfjhbFMiR7bVH0v0-yc2gj2y2GHBRINB-Sekn7NTnC0J-OgxP2qHiyT7Lk_v0eBXYWbTjgf6BtzJaZtreKboPJ9nrqtt8NF_rb1faDgxO4k3-6BowKCQQKxLFAjOU0K7EkgCSTFal3hWACeIahEBUVqGI1BlaW3P-VktfB6UW0g_O-fr8ekhYu4pDs7w7J4TBUJcF-wSBQWChkYSlQdUjuvYXyMU-2EtydhA015rwxnWin80sI3gWLVc9f8jVYPR2nwC-qTak2TQq2V0yLdDIRigeTDKHd2_3dLbHc-bA9kWG6QNTK9SswBr1ojH2JaPkMrSJozI9isUDroXErNH8cgYq5tAQu_FIIyf8P9CLARqTy7fHjRjaX4y4LsiiLksRoG9BBqCtordpzhK7mkswqNpIKmGorl0QzaH0ydk0zrfGaiSWDZ7E4H2tLhF8IpWHBslq6UuDcCuc2DCz_tAN8k47J4F1IrZAi9Fblm3KhllJpsdYK1Ax9lFU9kxWuczFmBcVCHsxc_EjoN6DX-sEZpkDfIjM0qxQSlOLvbUmk3ILsVdsEdgduTbDurHSMzW4VS-ZSl-U4wYDXX7rQRhsqNt6DVQxWY1J9JKksmkJ_wSt-khIrpgBg4bavV7DGnLxF1Os0gq6bHglvjMnmYynKHRlvJsdjZ5Ggwion4yYu8oWKhI7euJMS-nOFv0dE3hbGQ4g2DftRXuWcrkKgh6GuyvH9JNiSooNH35emmcM11gxdxKtuBJXNTd-roGqCy3Eh47XWbGYgjnF00Pn6dRpa8fmAyBkNTv1ouIn61PfdPk2zHd4i_8v2BCGUSqv8R0IMpgH8ZLT0dHbeUOh7rxzT3iY81zAl86M2jIyy-lIMquXieWmqWPMUQevbKuO3R_9Joi7QiCPzxfGfJT8ffvx6CN8pzg9XH_hRPHfKviT7Cr39A0vy3Ik:1tqyKr:i-6Nd0lsEzhOORK6Ppk4RBlWadzqK_KErXawZQBb5NM','2025-03-09 01:52:41.989701'),('qliv55iadgmk4785t4iesye0em6yyz51','eyJjYXB0Y2hhX2NvZGUiOiJPRFNEUSIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1trS7Z:kV487p6fxK68qXwAj89fkfTn_vvMFXIJLtbngrsaJgs','2025-03-10 09:40:57.954368'),('ysekmee38kn1jlie5r9yhvrwpcsci42u','eyJjYXB0Y2hhX2NvZGUiOiJSQkxBRSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsInVzZXJfaW5mbyI6eyJpZCI6MSwibmFtZSI6ImFkbWluIn19:1trSFV:4ROTyGV1gFE_WVNeyK1ie6KWGMrErkqk1mE5XazxjJU','2025-03-10 09:49:09.615049'),('mpfslj7k7o3xxh16yrpn29hul9o0u67x','eyJjYXB0Y2hhX2NvZGUiOiJCVllaRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAsInVzZXJfaW5mbyI6eyJpZCI6MSwibmFtZSI6ImFkbWluIn19:1trd4s:aEI5rZDW2o6t8Hqefm5bQdfzrvhPD3DBMrJD0S2k6MU','2025-03-10 21:22:54.576993'),('ccqmqzec76cir549lingzgftulgor5vy','eyJjYXB0Y2hhX2NvZGUiOiJaSlVFRCIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1trd6f:Ryo104vYR8D03Zh-zqPepL42_qfb0VK44jppVd2aXDA','2025-03-10 21:24:45.483903'),('ivqu58olj6duupmzlli5v32gxdd6rsrj','eyJjYXB0Y2hhX2NvZGUiOiJOR1pFTiIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1trigZ:Oz9vuAuMJfw9X911FIx-SnCrvfxVHrti7nDiNQzTSCQ','2025-03-11 03:22:11.704886'),('0tz5ttqppkfydn6s5t0kmp8sjfwv2172','eyJjYXB0Y2hhX2NvZGUiOiJGSkhORyIsIl9zZXNzaW9uX2V4cGlyeSI6NjB9:1triwH:9E8ocslmQgT71zLIxdpuTQGYFSdE17nA-RX1ocoRr4o','2025-03-11 03:38:25.843345'),('9878hlq8pvcm64ad4thnxnqhaonkkxr0','.eJydld2O2yAQhV_F8nWc2JsfJ7nb9KpSV2rVRlXUrKIxjG0aDBZgqdlV3r0QZ9vGxG7VO4sZznfAB3gND9CY8tBoVAdGw3WYhKM_xzIgRxSuQL-DKOSYSGEUy8auZXyt6vGTpMg3194bgRJ0aWevII1nOSxhFtMUY0KmWTJP8yXEOckXy9XDDAkCTVKY4SLDeEFWKZD5nNrPPKcrJ1qhaLTV-va6DwVUuA_XwT58VIYRjkEFAgq0PWYfjuw4s07bjhx0kEOUSXmMZI2irVfOsnYdd_X-TaRRvC1PgFZMTDIuiwm0CpO2BRl1LUkcP5xHwQ3qHQetWX7qYXGmzQCGgMFCqpPHmXY5X6DoQRgo9ADClj31WVd9h6D-T_5kZ3r68_Pz7UDSBT5hleEdpHJIF7oBJGfi6CEXXcKm4RwNE0EmQdG-KNimUqqhJAhpk-AHIe3yPqOxtLe98khAqUKtI_LLTF94N6AZCd6LXKoKDJOiZ5dy9pbw-wnOZGM82yvPtiQMOHux1nucE1m5ExkBH0qyvuh0eUns8Y6M8x4SVZC7PXTI2h6rIZyT8WhJN3fLLv4rZpoZDPTw3yq4zDCysxQjMOjDink2rpcE1HU7wd2kbc9vI1ubcR2AoMGjrUrFXi7_us-QOxKRLhnyv6Rnq-8dq55T5YxN3Li3BO-G-IiqYvamkyIolGzqIaM25bK4h7rM9Fjd2yKZnp_tW0GgNqSEA7ErtS_G9tPuw849IRovNg74o2bqFK4X8fknSi0wuw:1trlIJ:ik1g_IxPN4VuiXbc7yMXUPh_75tCqIZqN_YmCYhUz3M','2025-03-11 06:09:19.520573');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'django_blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-11  6:09:28
