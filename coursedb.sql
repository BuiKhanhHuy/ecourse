-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: coursedb
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add action',7,'add_action'),(26,'Can change action',7,'change_action'),(27,'Can delete action',7,'delete_action'),(28,'Can view action',7,'view_action'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add course',10,'add_course'),(38,'Can change course',10,'change_course'),(39,'Can delete course',10,'delete_course'),(40,'Can view course',10,'view_course'),(41,'Can add lesson',11,'add_lesson'),(42,'Can change lesson',11,'change_lesson'),(43,'Can delete lesson',11,'delete_lesson'),(44,'Can view lesson',11,'view_lesson'),(45,'Can add tag',12,'add_tag'),(46,'Can change tag',12,'change_tag'),(47,'Can delete tag',12,'delete_tag'),(48,'Can view tag',12,'view_tag'),(49,'Can add view',13,'add_view'),(50,'Can change view',13,'change_view'),(51,'Can delete view',13,'delete_view'),(52,'Can view view',13,'view_view'),(53,'Can add rating',14,'add_rating'),(54,'Can change rating',14,'change_rating'),(55,'Can delete rating',14,'delete_rating'),(56,'Can view rating',14,'view_rating'),(57,'Can add application',15,'add_application'),(58,'Can change application',15,'change_application'),(59,'Can delete application',15,'delete_application'),(60,'Can view application',15,'view_application'),(61,'Can add access token',16,'add_accesstoken'),(62,'Can change access token',16,'change_accesstoken'),(63,'Can delete access token',16,'delete_accesstoken'),(64,'Can view access token',16,'view_accesstoken'),(65,'Can add grant',17,'add_grant'),(66,'Can change grant',17,'change_grant'),(67,'Can delete grant',17,'delete_grant'),(68,'Can view grant',17,'view_grant'),(69,'Can add refresh token',18,'add_refreshtoken'),(70,'Can change refresh token',18,'change_refreshtoken'),(71,'Can delete refresh token',18,'delete_refreshtoken'),(72,'Can view refresh token',18,'view_refreshtoken'),(73,'Can add id token',19,'add_idtoken'),(74,'Can change id token',19,'change_idtoken'),(75,'Can delete id token',19,'delete_idtoken'),(76,'Can view id token',19,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_action`
--

DROP TABLE IF EXISTS `courses_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_action_lesson_id_34714cd0_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_action_user_id_11c7ee5b_fk_courses_user_id` (`user_id`),
  CONSTRAINT `courses_action_lesson_id_34714cd0_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`),
  CONSTRAINT `courses_action_user_id_11c7ee5b_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_action`
--

LOCK TABLES `courses_action` WRITE;
/*!40000 ALTER TABLE `courses_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_category`
--

DROP TABLE IF EXISTS `courses_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_category`
--

LOCK TABLES `courses_category` WRITE;
/*!40000 ALTER TABLE `courses_category` DISABLE KEYS */;
INSERT INTO `courses_category` VALUES (1,'Công nghệ thông tin'),(2,'Khoa học dữ liệu'),(3,'Hệ thống thông tin quản lý'),(4,'An toàn bảo mật thông tin');
/*!40000 ALTER TABLE `courses_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_comment`
--

DROP TABLE IF EXISTS `courses_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_comment_lesson_id_ce88c0d1_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_comment_user_id_089d2325_fk_courses_user_id` (`user_id`),
  CONSTRAINT `courses_comment_lesson_id_ce88c0d1_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`),
  CONSTRAINT `courses_comment_user_id_089d2325_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_comment`
--

LOCK TABLES `courses_comment` WRITE;
/*!40000 ALTER TABLE `courses_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_category_id_d64b93bf_fk_courses_category_id` (`category_id`),
  CONSTRAINT `courses_course_category_id_d64b93bf_fk_courses_category_id` FOREIGN KEY (`category_id`) REFERENCES `courses_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'2022-03-13 18:25:26.639033','2022-03-13 18:25:26.639033',1,'Các công nghệ lập trình hiện đại','Các công nghệ lập trình hiện đại','courses/2022/03/14/sach.jpg',1),(2,'2022-03-13 18:25:49.960329','2022-03-13 18:25:49.960329',1,'Lập trình Java','Lập trình Java','courses/2022/03/14/sach_V8Stmqj.jpg',1),(3,'2022-03-13 18:26:03.299348','2022-03-13 18:26:03.299348',1,'Thiết kế Web','Thiết kế Web','courses/2022/03/14/sach_5ANIoGa.jpg',1),(4,'2022-03-13 18:26:23.982756','2022-03-13 18:26:23.982756',1,'Kiểm thử phần mềm','Kiểm thử phần mềm','courses/2022/03/14/sach_mgK51GM.jpg',1),(5,'2022-03-13 18:26:41.434700','2022-03-13 18:26:41.434700',1,'Công nghệ phần mềm','Công nghệ phần mềm','courses/2022/03/14/sach_1M0FqFS.jpg',1),(6,'2022-03-13 18:27:00.554504','2022-03-13 18:27:00.554504',1,'Cấu trúc dữ liệu và giải thuật','Cấu trúc dữ liệu và giải thuật','courses/2022/03/14/sach_9pQnrb8.jpg',1),(7,'2022-03-13 18:27:15.995560','2022-03-13 18:27:15.995560',1,'Kỹ thuật lập trình','Kỹ thuật lập trình','courses/2022/03/14/sach_o9WD5CQ.jpg',1),(8,'2022-03-13 18:27:41.445651','2022-03-13 18:27:41.445651',1,'Cơ sở lập trình','Cơ sở lập trình','courses/2022/03/14/sach_7mlHrWa.jpg',1),(9,'2022-03-15 18:32:18.375624','2022-03-15 18:32:18.375624',1,'Khóa học lập trình python căn bản','Khóa học lập trình python căn bản','courses/2022/03/16/sach.jpg',2),(10,'2022-03-15 18:33:24.639387','2022-03-15 18:33:24.639387',1,'Lập trình Python trong Máy học, Khoa học dữ liệu và Trực quan hóa dữ liệu','Lập trình Python trong Máy học, Khoa học dữ liệu và Trực quan hóa dữ liệu','courses/2022/03/16/sach_v5A15TO.jpg',2),(11,'2022-03-15 18:33:53.883265','2022-03-15 18:33:53.883265',1,'Toán và Xác suất thống kê cho Khoa học dữ liệu','Toán và Xác suất thống kê cho Khoa học dữ liệu','courses/2022/03/16/sach_WxGZQz0.jpg',2),(12,'2022-03-15 18:34:14.765410','2022-03-15 18:34:14.765410',1,'Truy vấn và thu thập dữ liệu cho Khoa học dữ liệu','Truy vấn và thu thập dữ liệu cho Khoa học dữ liệu','courses/2022/03/16/sach_0786Obn.jpg',2),(13,'2022-03-15 18:34:37.697058','2022-03-15 18:34:37.697058',1,'Tiền xử lý và phân tích dữ liệu','Tiền xử lý và phân tích dữ liệu','courses/2022/03/16/sach_9UGFqbK.jpg',2),(14,'2022-03-15 18:34:58.495726','2022-03-15 18:34:58.496692',1,'Máy học với Python','Máy học với Python','courses/2022/03/16/sach_aWLrqxv.jpg',2),(15,'2022-03-15 18:35:48.559952','2022-03-15 18:35:48.559952',1,'Lập trình R cho Khoa học dữ liệu','Lập trình R cho Khoa học dữ liệu','courses/2022/03/16/sach_PayVblE.jpg',2),(16,'2022-03-15 18:36:08.494950','2022-03-15 18:36:08.494950',1,'Học sâu với Python','Học sâu với Python','courses/2022/03/16/sach_FICnEIh.jpg',2),(17,'2022-03-15 18:36:27.982185','2022-03-15 18:36:27.982185',1,'Xử lý dữ liệu lớn trong Máy học','Xử lý dữ liệu lớn trong Máy học','courses/2022/03/16/sach_sjzRdPw.jpg',2);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_lesson` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'2022-03-13 18:28:48.553988','2022-03-13 18:28:48.553988',1,'Giới thiệu','<p>Content c&aacute;c c&ocirc;ng nghệ lập tr&igrave;nh hiện đại.</p>',1,NULL),(2,'2022-03-13 18:29:04.724638','2022-03-13 18:29:04.724638',1,'Phát triển API với Django REST framework','<p>Ph&aacute;t triển API với Django REST framework</p>',1,NULL),(3,'2022-03-13 18:29:16.465489','2022-03-13 18:29:16.465489',1,'ReactJS','<p>ReactJS</p>',1,NULL),(4,'2022-03-13 18:29:27.207800','2022-03-13 18:29:27.207800',1,'ReactNative','<p>ReactNative</p>',1,NULL);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson_tags`
--

DROP TABLE IF EXISTS `courses_lesson_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_lesson_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_lesson_tags_lesson_id_tag_id_bae65f7d_uniq` (`lesson_id`,`tag_id`),
  KEY `courses_lesson_tags_tag_id_5f430326_fk_courses_tag_id` (`tag_id`),
  CONSTRAINT `courses_lesson_tags_lesson_id_0f6df217_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`),
  CONSTRAINT `courses_lesson_tags_tag_id_5f430326_fk_courses_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `courses_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson_tags`
--

LOCK TABLES `courses_lesson_tags` WRITE;
/*!40000 ALTER TABLE `courses_lesson_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_lesson_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_rating`
--

DROP TABLE IF EXISTS `courses_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_rating_lesson_id_373fa9b0_fk_courses_lesson_id` (`lesson_id`),
  KEY `courses_rating_user_id_1bfb10a7_fk_courses_user_id` (`user_id`),
  CONSTRAINT `courses_rating_lesson_id_373fa9b0_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`),
  CONSTRAINT `courses_rating_user_id_1bfb10a7_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_rating`
--

LOCK TABLES `courses_rating` WRITE;
/*!40000 ALTER TABLE `courses_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_tag`
--

DROP TABLE IF EXISTS `courses_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_tag`
--

LOCK TABLES `courses_tag` WRITE;
/*!40000 ALTER TABLE `courses_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user`
--

DROP TABLE IF EXISTS `courses_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user`
--

LOCK TABLES `courses_user` WRITE;
/*!40000 ALTER TABLE `courses_user` DISABLE KEYS */;
INSERT INTO `courses_user` VALUES (1,'pbkdf2_sha256$320000$PpXO0RhgaqLVlt4dD2PU3R$LTzOCSqH9WUNPk30FyWUjZ3ieGnSjbUnBGMtKJ/ow+0=','2022-03-17 16:54:39.143278',1,'admin','Huy','Bui Khanh','admin@gmail.com',1,1,'2022-03-13 18:19:13.000000','avatars/2022/03/3600_9_08.jpg'),(2,'pbkdf2_sha256$320000$PpXO0RhgaqLVlt4dD2PU3R$LTzOCSqH9WUNPk30FyWUjZ3ieGnSjbUnBGMtKJ/ow+0=','2022-03-17 16:54:49.250278',0,'khanhvan','van','khanh','van.bk@gmail.com',0,1,'2022-03-17 16:52:49.000000','avatars/2022/03/Cplusplus.png');
/*!40000 ALTER TABLE `courses_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user_groups`
--

DROP TABLE IF EXISTS `courses_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_user_groups_user_id_group_id_b5cd82da_uniq` (`user_id`,`group_id`),
  KEY `courses_user_groups_group_id_f1b5c084_fk_auth_group_id` (`group_id`),
  CONSTRAINT `courses_user_groups_group_id_f1b5c084_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `courses_user_groups_user_id_c63786e3_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user_groups`
--

LOCK TABLES `courses_user_groups` WRITE;
/*!40000 ALTER TABLE `courses_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_user_user_permissions`
--

DROP TABLE IF EXISTS `courses_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courses_user_user_permis_user_id_permission_id_e0e9296d_uniq` (`user_id`,`permission_id`),
  KEY `courses_user_user_pe_permission_id_5803efd0_fk_auth_perm` (`permission_id`),
  CONSTRAINT `courses_user_user_pe_permission_id_5803efd0_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `courses_user_user_pe_user_id_699dc51a_fk_courses_u` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_user_user_permissions`
--

LOCK TABLES `courses_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `courses_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_view`
--

DROP TABLE IF EXISTS `courses_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `courses_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `view` bigint(20) NOT NULL,
  `lesson_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id` (`lesson_id`),
  CONSTRAINT `courses_view_lesson_id_280e892f_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_view`
--

LOCK TABLES `courses_view` WRITE;
/*!40000 ALTER TABLE `courses_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_courses_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-13 18:22:09.960933','1','Công nghệ thông tin',1,'[{\"added\": {}}]',8,1),(2,'2022-03-13 18:22:18.257955','2','Khoa học dữ liệu',1,'[{\"added\": {}}]',8,1),(3,'2022-03-13 18:25:26.655993','1','Các công nghệ lập trình hiện đại',1,'[{\"added\": {}}]',10,1),(4,'2022-03-13 18:25:49.978418','2','Lập trình Java',1,'[{\"added\": {}}]',10,1),(5,'2022-03-13 18:26:03.316307','3','Thiết kế Web',1,'[{\"added\": {}}]',10,1),(6,'2022-03-13 18:26:24.001703','4','Kiểm thử phần mềm',1,'[{\"added\": {}}]',10,1),(7,'2022-03-13 18:26:41.450685','5','Công nghệ phần mềm',1,'[{\"added\": {}}]',10,1),(8,'2022-03-13 18:27:00.571459','6','Cấu trúc dữ liệu và giải thuật',1,'[{\"added\": {}}]',10,1),(9,'2022-03-13 18:27:16.012546','7','Kỹ thuật lập trình',1,'[{\"added\": {}}]',10,1),(10,'2022-03-13 18:27:41.474615','8','Cơ sở lập trình',1,'[{\"added\": {}}]',10,1),(11,'2022-03-13 18:28:48.590890','1','Giới thiệu',1,'[{\"added\": {}}]',11,1),(12,'2022-03-13 18:29:04.756580','2','Phát triển API với Django REST framework',1,'[{\"added\": {}}]',11,1),(13,'2022-03-13 18:29:16.499398','3','ReactJS',1,'[{\"added\": {}}]',11,1),(14,'2022-03-13 18:29:27.240712','4','ReactNative',1,'[{\"added\": {}}]',11,1),(15,'2022-03-13 18:30:57.627621','1','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Avatar\"]}}]',6,1),(16,'2022-03-14 19:36:26.435475','3','Hệ thống thông tin quản lý',1,'[{\"added\": {}}]',8,1),(17,'2022-03-14 19:36:38.571004','4','An toàn bảo mật thông tin',1,'[{\"added\": {}}]',8,1),(18,'2022-03-15 18:32:18.414544','9','Khóa học lập trình python căn bản',1,'[{\"added\": {}}]',10,1),(19,'2022-03-15 18:33:24.658367','10','Lập trình Python trong Máy học, Khoa học dữ liệu và Trực quan hóa dữ liệu',1,'[{\"added\": {}}]',10,1),(20,'2022-03-15 18:33:53.904188','11','Toán và Xác suất thống kê cho Khoa học dữ liệu',1,'[{\"added\": {}}]',10,1),(21,'2022-03-15 18:34:14.782364','12','Truy vấn và thu thập dữ liệu cho Khoa học dữ liệu',1,'[{\"added\": {}}]',10,1),(22,'2022-03-15 18:34:37.715037','13','Tiền xử lý và phân tích dữ liệu',1,'[{\"added\": {}}]',10,1),(23,'2022-03-15 18:34:58.519630','14','Máy học với Python',1,'[{\"added\": {}}]',10,1),(24,'2022-03-15 18:35:48.578931','15','Lập trình R cho Khoa học dữ liệu',1,'[{\"added\": {}}]',10,1),(25,'2022-03-15 18:36:08.512912','16','Học sâu với Python',1,'[{\"added\": {}}]',10,1),(26,'2022-03-15 18:36:28.001117','17','Xử lý dữ liệu lớn trong Máy học',1,'[{\"added\": {}}]',10,1),(27,'2022-03-17 16:53:53.866343','2','khanhvan',1,'[{\"added\": {}}]',6,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'courses','action'),(8,'courses','category'),(9,'courses','comment'),(10,'courses','course'),(11,'courses','lesson'),(14,'courses','rating'),(12,'courses','tag'),(6,'courses','user'),(13,'courses','view'),(16,'oauth2_provider','accesstoken'),(15,'oauth2_provider','application'),(17,'oauth2_provider','grant'),(19,'oauth2_provider','idtoken'),(18,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-13 18:15:33.190675'),(2,'contenttypes','0002_remove_content_type_name','2022-03-13 18:15:33.303373'),(3,'auth','0001_initial','2022-03-13 18:15:33.608557'),(4,'auth','0002_alter_permission_name_max_length','2022-03-13 18:15:33.679368'),(5,'auth','0003_alter_user_email_max_length','2022-03-13 18:15:33.690339'),(6,'auth','0004_alter_user_username_opts','2022-03-13 18:15:33.702307'),(7,'auth','0005_alter_user_last_login_null','2022-03-13 18:15:33.713278'),(8,'auth','0006_require_contenttypes_0002','2022-03-13 18:15:33.716269'),(9,'auth','0007_alter_validators_add_error_messages','2022-03-13 18:15:33.726243'),(10,'auth','0008_alter_user_username_max_length','2022-03-13 18:15:33.736217'),(11,'auth','0009_alter_user_last_name_max_length','2022-03-13 18:15:33.747186'),(12,'auth','0010_alter_group_name_max_length','2022-03-13 18:15:33.766137'),(13,'auth','0011_update_proxy_permissions','2022-03-13 18:15:33.777107'),(14,'auth','0012_alter_user_first_name_max_length','2022-03-13 18:15:33.786083'),(15,'courses','0001_initial','2022-03-13 18:15:35.233750'),(16,'admin','0001_initial','2022-03-13 18:15:35.406289'),(17,'admin','0002_logentry_remove_auto_add','2022-03-13 18:15:35.426234'),(18,'admin','0003_logentry_add_action_flag_choices','2022-03-13 18:15:35.444187'),(19,'oauth2_provider','0001_initial','2022-03-13 18:15:36.438528'),(20,'oauth2_provider','0002_auto_20190406_1805','2022-03-13 18:15:36.520310'),(21,'oauth2_provider','0003_auto_20201211_1314','2022-03-13 18:15:36.602091'),(22,'oauth2_provider','0004_auto_20200902_2022','2022-03-13 18:15:37.158602'),(23,'oauth2_provider','0005_auto_20211222_2352','2022-03-13 18:15:37.274293'),(24,'sessions','0001_initial','2022-03-13 18:15:37.314188'),(25,'courses','0002_lesson_image','2022-03-15 11:20:19.396286');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint(20) DEFAULT NULL,
  `id_token_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_courses_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_courses_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_courses_user_id` FOREIGN KEY (`user_id`) REFERENCES `courses_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 15:23:02
