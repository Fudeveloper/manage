# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: admin
# Generation Time: 2018-05-07 07:08:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table audit_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `audit_results`;

CREATE TABLE `audit_results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  `co` varchar(255) DEFAULT NULL,
  `reviewer` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpaqlvtpmuus6ksj3n2t36rsys` (`state_id`),
  KEY `FK21ugmlx3kmnjpqrxtwu9m05x5` (`teacher_id`),
  CONSTRAINT `FK21ugmlx3kmnjpqrxtwu9m05x5` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKpaqlvtpmuus6ksj3n2t36rsys` FOREIGN KEY (`state_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table awards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `awards`;

CREATE TABLE `awards` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `award_amount` int(11) NOT NULL,
  `awarded_name` varchar(255) NOT NULL,
  `awarding_unit` varchar(255) NOT NULL,
  `get_date` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `award_level_id` bigint(20) NOT NULL,
  `my_ranking_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkkewxf5olxjjxdibjgiv587j4` (`award_level_id`),
  KEY `FKkeupsl1ejtgkqvyl2hwjpl0qy` (`my_ranking_id`),
  KEY `FKlpnspqgrapirtiauebgdpn05s` (`teacher_id`),
  CONSTRAINT `FKkeupsl1ejtgkqvyl2hwjpl0qy` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKkkewxf5olxjjxdibjgiv587j4` FOREIGN KEY (`award_level_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKlpnspqgrapirtiauebgdpn05s` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;

INSERT INTO `awards` (`id`, `created_time`, `updated_time`, `annex`, `award_amount`, `awarded_name`, `awarding_unit`, `get_date`, `remark`, `award_level_id`, `my_ranking_id`, `teacher_id`)
VALUES
	(1,'2018-03-30 13:47:50','2018-05-07 13:22:01','[{\"fileName\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"code\":200,\"file\":{\"id\":37,\"createdTime\":\"2018-04-10 05:57:15\",\"updatedTime\":\"2018-04-10 05:57:15\",\"fileName\":\"123.jpg\",\"hash\":\"6254422dcf2cec7ca9911dbd1ed8a5a8\",\"size\":181100}},{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":44,\"createdTime\":\"2018-04-10 06:03:03\",\"updatedTime\":\"2018-04-10 06:03:03\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}},{\"fileName\":\"d8285913021cf333a1fb1904fcb512d6.jpg\",\"code\":200,\"file\":{\"id\":46,\"createdTime\":\"2018-04-10 06:03:03\",\"updatedTime\":\"2018-04-10 06:03:03\",\"fileName\":\"20180104133327.jpg\",\"hash\":\"d8285913021cf333a1fb1904fcb512d6\",\"size\":135870}}]',1,'231','12312','2018-03-30 00:00:00','',53,59,5);

/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `admission_date` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5qadfeir1l1eom7uqcfk2uore` (`department_id`),
  CONSTRAINT `FK5qadfeir1l1eom7uqcfk2uore` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;

INSERT INTO `class` (`id`, `created_time`, `updated_time`, `admission_date`, `name`, `department_id`)
VALUES
	(1,'2018-03-28 07:09:45',NULL,2017,'123',1);

/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi1btm7ma8n3gaj6afdno300wm` (`department_id`),
  CONSTRAINT `FKi1btm7ma8n3gaj6afdno300wm` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`id`, `created_time`, `updated_time`, `name`, `remark`, `department_id`)
VALUES
	(1,'2018-04-01 04:49:20',NULL,'1123','',1);

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course_build
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course_build`;

CREATE TABLE `course_build` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `related_file_name` varchar(255) DEFAULT NULL,
  `annex` longtext,
  `remark` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl3c7ge2qfd34tj5qka8uof09s` (`level_id`),
  KEY `FK9xi2p1ktd9k7a163snh0fkp6y` (`teacher_id`),
  CONSTRAINT `FK9xi2p1ktd9k7a163snh0fkp6y` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKl3c7ge2qfd34tj5qka8uof09s` FOREIGN KEY (`level_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1t68827l97cwyxo9r1u6t4p7d` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`id`, `created_time`, `updated_time`, `name`)
VALUES
	(1,'2018-03-28 07:09:29','2018-04-18 15:22:08','计算机系');

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table departments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7q3r9vm9yxa1hec5xgavk3edv` (`department_id`),
  CONSTRAINT `FK7q3r9vm9yxa1hec5xgavk3edv` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;

INSERT INTO `departments` (`id`, `created_time`, `updated_time`, `name`, `department_id`)
VALUES
	(1,'2018-03-29 13:57:33',NULL,'123',1),
	(2,'2018-04-18 15:22:17',NULL,'系部领导',1);

/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dictionary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;

INSERT INTO `dictionary` (`id`, `created_time`, `updated_time`, `name`, `pid`, `value`)
VALUES
	(1,'2018-02-09 14:45:55',NULL,'用户状态',0,0),
	(2,'2018-02-09 14:46:06','2018-03-22 19:41:43','正常',1,0),
	(3,'2018-02-09 14:46:21',NULL,'冻结',1,1),
	(4,'2018-02-09 15:17:09',NULL,'性别',0,0),
	(5,'2018-02-09 15:17:17',NULL,'男',4,0),
	(6,'2018-02-09 15:17:31',NULL,'女',4,1),
	(7,'2018-02-09 15:19:14',NULL,'学历',0,0),
	(14,'2018-02-09 15:21:36',NULL,'授课状态',0,0),
	(15,'2018-02-09 15:22:05',NULL,'在授',14,0),
	(16,'2018-02-09 15:22:29',NULL,'已结束',14,1),
	(17,'2018-02-09 15:22:44',NULL,'职称',0,0),
	(18,'2018-02-09 15:23:04',NULL,'教授',17,0),
	(19,'2018-02-09 15:23:23',NULL,'副教授',17,1),
	(20,'2018-02-09 15:23:37',NULL,'讲师',17,2),
	(21,'2018-02-09 15:24:00',NULL,'助讲',17,3),
	(22,'2018-03-21 12:28:56',NULL,'聘用性质',0,0),
	(23,'2018-03-21 12:29:08',NULL,'在编',22,1),
	(24,'2018-03-21 12:29:16',NULL,'聘用',22,2),
	(25,'2018-03-21 12:29:25',NULL,'外聘',22,3),
	(26,'2018-03-21 12:32:06',NULL,'博士研究生',7,1),
	(27,'2018-03-21 12:32:21',NULL,'硕士研究生',7,2),
	(28,'2018-03-21 12:32:33',NULL,'大学本科',7,3),
	(29,'2018-03-21 12:32:42',NULL,'专科',7,4),
	(30,'2018-03-21 12:33:09',NULL,'专科以下',7,5),
	(31,'2018-03-21 12:35:26',NULL,'专业领域',0,0),
	(32,'2018-03-21 12:35:35',NULL,'哲学',31,1),
	(33,'2018-03-21 12:35:46',NULL,'经济学',31,2),
	(34,'2018-03-21 13:00:08',NULL,'学位',0,0),
	(35,'2018-03-21 13:00:16',NULL,'博士',34,1),
	(36,'2018-03-21 13:00:24',NULL,'硕士',34,2),
	(37,'2018-03-21 13:00:32',NULL,'学士',34,3),
	(38,'2018-03-21 13:00:48',NULL,'专业领域',0,0),
	(39,'2018-03-21 13:00:59',NULL,'哲学',38,1),
	(40,'2018-03-21 13:01:09',NULL,'经济学',38,2),
	(41,'2018-03-21 13:01:17',NULL,'法学',38,3),
	(42,'2018-03-21 13:01:30',NULL,'教育学',38,4),
	(43,'2018-03-21 13:01:38',NULL,'文学',38,5),
	(44,'2018-03-21 13:01:51',NULL,'历史学',38,6),
	(45,'2018-03-21 13:02:06',NULL,'理学',38,7),
	(46,'2018-03-21 13:02:18',NULL,'工学',38,8),
	(47,'2018-03-21 13:02:27',NULL,'农学',38,9),
	(48,'2018-03-21 13:02:41',NULL,'医学',38,10),
	(49,'2018-03-21 13:02:54',NULL,'管理学',38,11),
	(50,'2018-03-21 13:03:49',NULL,'行政单位级别',0,0),
	(51,'2018-03-21 13:04:04',NULL,'国家级',50,1),
	(52,'2018-03-21 13:04:15',NULL,'省部级',50,2),
	(53,'2018-03-21 13:04:24',NULL,'地市级',50,3),
	(54,'2018-03-21 13:04:42',NULL,'院校级',50,4),
	(55,'2018-03-21 13:04:51',NULL,'无',50,5),
	(56,'2018-03-21 13:06:01',NULL,'本人排名',0,0),
	(57,'2018-03-21 13:06:11',NULL,'主持',56,1),
	(58,'2018-03-21 13:06:36',NULL,'第二',56,2),
	(59,'2018-03-21 13:06:47',NULL,'第三',56,3),
	(60,'2018-03-21 13:07:08',NULL,'参与',56,4),
	(61,'2018-03-21 13:39:14',NULL,'专利类型',0,0),
	(62,'2018-03-21 13:39:30',NULL,'发明专利',61,1),
	(63,'2018-03-21 13:39:50',NULL,'实用新型专利',61,2),
	(64,'2018-03-21 13:40:12',NULL,'外观专利',61,3),
	(65,'2018-03-21 13:40:23',NULL,'著作权',61,4),
	(66,'2018-03-21 13:40:32',NULL,'课题性质',0,0),
	(67,'2018-03-21 13:40:44',NULL,'教学改革',66,1),
	(68,'2018-03-21 13:40:56',NULL,'技术开发',66,2),
	(69,'2018-03-21 13:41:09',NULL,'社会科学',66,3),
	(70,'2018-03-21 13:41:18',NULL,'其他',66,4),
	(71,'2018-03-21 13:41:31',NULL,'主编参编',0,0),
	(72,'2018-03-21 13:41:42',NULL,'主编',71,1),
	(73,'2018-03-21 13:43:24',NULL,'参编',71,2),
	(74,'2018-03-21 13:43:42',NULL,'刊物类别',0,0),
	(75,'2018-03-21 13:43:50',NULL,'SCI',74,1),
	(76,'2018-03-21 13:44:43',NULL,'EI',74,2),
	(77,'2018-03-21 13:44:57',NULL,'核心期刊',74,3),
	(78,'2018-03-21 13:45:08',NULL,'本科学报',74,4),
	(79,'2018-03-21 13:45:16',NULL,'CN刊物',74,5),
	(80,'2018-04-15 17:29:09',NULL,'成果类型',0,0),
	(81,'2018-04-15 17:29:35',NULL,'著作',80,0),
	(82,'2018-04-15 17:29:44',NULL,'科研课题',80,1);

/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;

INSERT INTO `file` (`id`, `created_time`, `updated_time`, `file_name`, `hash`, `size`)
VALUES
	(1,'2018-04-10 01:26:30',NULL,'20180104134309.jpg','7f1da3ce7193349b2a954684a8ed4c9f',86498),
	(2,'2018-04-10 01:26:30',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(3,'2018-04-10 01:57:25',NULL,'20180104134309.jpg','7f1da3ce7193349b2a954684a8ed4c9f',86498),
	(4,'2018-04-10 02:04:28',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(5,'2018-04-10 02:04:28',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(6,'2018-04-10 02:04:28',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(7,'2018-04-10 03:28:32',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(8,'2018-04-10 04:29:07',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(9,'2018-04-10 04:29:07',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(10,'2018-04-10 04:29:07',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(11,'2018-04-10 04:42:32',NULL,'53D237C24932712A43ED5F5A304D37A5.png','53d237c24932712a43ed5f5a304d37a5',92025),
	(12,'2018-04-10 04:42:32',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(13,'2018-04-10 04:42:32',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(14,'2018-04-10 04:42:32',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(15,'2018-04-10 04:42:32',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(16,'2018-04-10 04:43:40',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(17,'2018-04-10 04:43:40',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(18,'2018-04-10 04:48:03',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(19,'2018-04-10 04:48:03',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(20,'2018-04-10 04:48:03',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(21,'2018-04-10 05:08:15',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(22,'2018-04-10 05:11:37',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(23,'2018-04-10 05:11:52',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(24,'2018-04-10 05:13:01',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(25,'2018-04-10 05:13:31',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(26,'2018-04-10 05:31:46',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(27,'2018-04-10 05:31:46',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(28,'2018-04-10 05:31:46',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(29,'2018-04-10 05:32:03',NULL,'53D237C24932712A43ED5F5A304D37A5.png','53d237c24932712a43ed5f5a304d37a5',92025),
	(30,'2018-04-10 05:37:24',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(31,'2018-04-10 05:37:29',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(32,'2018-04-10 05:38:00',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(33,'2018-04-10 05:38:43',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(34,'2018-04-10 05:38:46',NULL,'53D237C24932712A43ED5F5A304D37A5.png','53d237c24932712a43ed5f5a304d37a5',92025),
	(35,'2018-04-10 05:38:49',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(36,'2018-04-10 05:47:52',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(37,'2018-04-10 05:57:15',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(38,'2018-04-10 05:57:26',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(39,'2018-04-10 05:57:26',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(40,'2018-04-10 05:57:26',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(41,'2018-04-10 05:59:38',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(42,'2018-04-10 05:59:38',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(43,'2018-04-10 06:01:02',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(44,'2018-04-10 06:03:03',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(45,'2018-04-10 06:03:03',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(46,'2018-04-10 06:03:03',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(47,'2018-04-10 06:03:28',NULL,'desktop.ini','29eae335b77f438e05594d86a6ca22ff',504),
	(48,'2018-04-10 06:03:28',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(49,'2018-04-10 06:03:28',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(50,'2018-04-10 06:03:43',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(51,'2018-04-10 06:03:44',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(52,'2018-04-10 06:03:44',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(53,'2018-04-10 06:04:03',NULL,'desktop.ini','29eae335b77f438e05594d86a6ca22ff',504),
	(54,'2018-04-10 06:04:03',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(55,'2018-04-10 06:04:21',NULL,'desktop.ini','29eae335b77f438e05594d86a6ca22ff',504),
	(56,'2018-04-10 06:04:21',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(57,'2018-04-10 06:04:31',NULL,'desktop.ini','29eae335b77f438e05594d86a6ca22ff',504),
	(58,'2018-04-10 06:04:40',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(59,'2018-04-10 06:04:47',NULL,'20180104134309.jpg','7f1da3ce7193349b2a954684a8ed4c9f',86498),
	(60,'2018-04-10 06:05:01',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(61,'2018-04-10 06:05:12',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(62,'2018-04-10 06:12:44',NULL,'53D237C24932712A43ED5F5A304D37A5.png','53d237c24932712a43ed5f5a304d37a5',92025),
	(63,'2018-04-10 06:12:44',NULL,'3112.jpg','b7f883846d21418fe0af632bf2a84019',79997),
	(64,'2018-04-10 06:12:44',NULL,'desktop.ini','29eae335b77f438e05594d86a6ca22ff',504),
	(65,'2018-04-10 06:12:44',NULL,'20180104133327.jpg','d8285913021cf333a1fb1904fcb512d6',135870),
	(66,'2018-04-10 06:12:44',NULL,'12320180104134508.jpg','366172235361f14ee06d91383a56c572',94552),
	(67,'2018-04-10 06:12:44',NULL,'20180104134309.jpg','7f1da3ce7193349b2a954684a8ed4c9f',86498),
	(68,'2018-04-10 06:12:44',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(69,'2018-04-10 06:12:44',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(70,'2018-04-11 11:59:11',NULL,'鱼刺类_HTTPv5.0_版本17.zip','5dddf73b12ce990dcfe8dac34a498844',217831),
	(71,'2018-04-15 14:07:42',NULL,'百度网盘直接下载助手.user.js','08457a58e9ecec6a543a9b3d07be9b5a',90510),
	(72,'2018-04-15 17:00:41',NULL,'百度网盘直接下载助手.user.js','08457a58e9ecec6a543a9b3d07be9b5a',90510),
	(73,'2018-04-15 17:55:17',NULL,'百度网盘直接下载助手.user.js','08457a58e9ecec6a543a9b3d07be9b5a',90510),
	(74,'2018-04-16 20:43:07',NULL,'123.jpg','6254422dcf2cec7ca9911dbd1ed8a5a8',181100),
	(75,'2018-04-18 08:10:55',NULL,'lab.obj','94080de5257ecebe22f2f692495441fc',40042),
	(76,'2018-04-18 08:11:45',NULL,'下载.png','5f326d7a02cb34a17be639d02b383ad2',2751),
	(77,'2018-04-18 08:14:06',NULL,'改密.bak','02336114be714a6e8db039f78267e235',6026),
	(78,'2018-04-18 08:23:52',NULL,'TIM截图20180403164815.png','21df0fb8e09d44d8186ae4e2f28be673',54915),
	(79,'2018-05-06 09:38:34',NULL,'Snipaste_2018-05-06_09-38-09.png','6734d36dce588f84261a179830fb03e4',13231),
	(80,'2018-05-06 09:38:46',NULL,'Snipaste_2018-05-06_09-38-09.png','6734d36dce588f84261a179830fb03e4',13231),
	(81,'2018-05-07 13:21:36',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(82,'2018-05-07 13:26:05',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(83,'2018-05-07 13:28:30',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(84,'2018-05-07 13:28:44',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(85,'2018-05-07 14:04:13',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(86,'2018-05-07 14:06:16',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(87,'2018-05-07 14:23:07',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(88,'2018-05-07 14:35:15',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(89,'2018-05-07 14:39:39',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243),
	(90,'2018-05-07 14:43:42',NULL,'Snipaste_2018-05-07_13-21-01.png','13ec40c70d15634ad72763cf02aebce6',17243);

/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table further_study
# ------------------------------------------------------------

DROP TABLE IF EXISTS `further_study`;

CREATE TABLE `further_study` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `advanced_degree` varchar(255) NOT NULL,
  `annex` text,
  `complete_time` datetime NOT NULL,
  `further_education` varchar(255) NOT NULL,
  `professional_title` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `study_school` varchar(255) NOT NULL,
  `training_time` datetime NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdy6gk30u9l7a9jyygmgamul3d` (`teacher_id`),
  CONSTRAINT `FKdy6gk30u9l7a9jyygmgamul3d` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `further_study` WRITE;
/*!40000 ALTER TABLE `further_study` DISABLE KEYS */;

INSERT INTO `further_study` (`id`, `created_time`, `updated_time`, `advanced_degree`, `annex`, `complete_time`, `further_education`, `professional_title`, `remark`, `study_school`, `training_time`, `teacher_id`)
VALUES
	(1,'2018-04-06 05:36:09','2018-05-07 14:41:28','1231','[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":47,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}},{\"fileName\":\"366172235361f14ee06d91383a56c572.jpg\",\"code\":200,\"file\":{\"id\":48,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"12320180104134508.jpg\",\"hash\":\"366172235361f14ee06d91383a56c572\",\"size\":94552}},{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":49,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}}]','2018-04-06 00:00:00','12312','123126','123','12312','2018-04-06 00:00:00',5);

/*!40000 ALTER TABLE `further_study` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_certificate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_certificate`;

CREATE TABLE `job_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `fzdw` varchar(255) NOT NULL,
  `get_date` datetime NOT NULL,
  `level` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj2rch91pq85flbvbce5b55eiu` (`teacher_id`),
  CONSTRAINT `FKj2rch91pq85flbvbce5b55eiu` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `job_certificate` WRITE;
/*!40000 ALTER TABLE `job_certificate` DISABLE KEYS */;

INSERT INTO `job_certificate` (`id`, `created_time`, `updated_time`, `annex`, `fzdw`, `get_date`, `level`, `name`, `teacher_id`, `remark`)
VALUES
	(1,'2018-04-09 04:20:14','2018-05-07 11:54:21','[{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":50,\"createdTime\":\"2018-04-10 06:03:43\",\"updatedTime\":\"2018-04-10 06:03:43\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}},{\"fileName\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"code\":200,\"file\":{\"id\":51,\"createdTime\":\"2018-04-10 06:03:44\",\"updatedTime\":\"2018-04-10 06:03:44\",\"fileName\":\"123.jpg\",\"hash\":\"6254422dcf2cec7ca9911dbd1ed8a5a8\",\"size\":181100}},{\"fileName\":\"d8285913021cf333a1fb1904fcb512d6.jpg\",\"code\":200,\"file\":{\"id\":52,\"createdTime\":\"2018-04-10 06:03:44\",\"updatedTime\":\"2018-04-10 06:03:44\",\"fileName\":\"20180104133327.jpg\",\"hash\":\"d8285913021cf333a1fb1904fcb512d6\",\"size\":135870}}]','1231','2018-04-09 00:00:00','123','12321',5,'12321312666\n');

/*!40000 ALTER TABLE `job_certificate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `created_time`, `updated_time`, `name`, `pid`, `href`, `icon`)
VALUES
	(1,'2018-03-23 12:37:32',NULL,'123',0,NULL,NULL),
	(2,'2018-03-23 12:38:11',NULL,'1231',0,NULL,NULL),
	(3,'2018-03-23 14:26:49',NULL,'12312',0,NULL,NULL),
	(4,'2018-03-23 16:05:19',NULL,'123',0,NULL,NULL);

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_roles`;

CREATE TABLE `menu_roles` (
  `menu_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`roles_id`),
  UNIQUE KEY `UK_fytpsxrm17hws6r46eunc0csd` (`roles_id`),
  CONSTRAINT `FKauv6mbpeo296vhbm7avtoi3o8` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKq7k54hb6f3ngdbfpblwj68bhg` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table paper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `paper`;

CREATE TABLE `paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `issue_number` varchar(255) NOT NULL,
  `journal_of_publications` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `publication_date` datetime NOT NULL,
  `my_ranking_id` bigint(20) NOT NULL,
  `publication_category_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `annex` text,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKicjs5xavueeehh2pecm5l9hgq` (`my_ranking_id`),
  KEY `FKdt3mug47im2f8kqogg2sl0973` (`publication_category_id`),
  KEY `FKf86f7tb86ee7yclqw208r1epm` (`teacher_id`),
  CONSTRAINT `FKdt3mug47im2f8kqogg2sl0973` FOREIGN KEY (`publication_category_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKf86f7tb86ee7yclqw208r1epm` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKicjs5xavueeehh2pecm5l9hgq` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;

INSERT INTO `paper` (`id`, `created_time`, `updated_time`, `issue_number`, `journal_of_publications`, `name`, `publication_date`, `my_ranking_id`, `publication_category_id`, `teacher_id`, `annex`, `remark`)
VALUES
	(6,'2018-04-01 05:02:41','2018-05-07 13:21:39','1312','1231','123','2018-04-01 00:00:00',57,77,6,'[{\"fileName\":\"13ec40c70d15634ad72763cf02aebce6.png\",\"code\":200,\"file\":{\"id\":81,\"createdTime\":\"2018-05-07 13:21:35\",\"updatedTime\":\"2018-05-07 13:21:35\",\"fileName\":\"Snipaste_2018-05-07_13-21-01.png\",\"hash\":\"13ec40c70d15634ad72763cf02aebce6\",\"size\":17243}}]','123');

/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;

INSERT INTO `permission` (`id`, `created_time`, `updated_time`, `name`, `pid`, `description`, `url`)
VALUES
	(2,'2018-04-01 03:30:17',NULL,'用户',0,NULL,'/user/**'),
	(3,'2018-04-01 03:30:30','2018-04-01 04:15:27','权限',0,NULL,'/permission/**'),
	(4,'2018-04-01 03:30:43',NULL,'角色',0,NULL,'/role/**'),
	(5,'2018-04-01 03:31:12','2018-04-01 04:59:24','字典',0,NULL,'/dictionary'),
	(6,'2018-04-01 03:31:27',NULL,'系部',0,NULL,'/department/**'),
	(7,'2018-04-01 03:31:39',NULL,'班级',0,NULL,'/class/**'),
	(14,'2018-04-01 04:22:34','2018-04-01 04:48:28','教师',0,NULL,'/teacher'),
	(15,'2018-04-01 04:23:13',NULL,'保存',14,NULL,'/teacher/save'),
	(16,'2018-04-01 04:24:09',NULL,'数据审核',14,NULL,'/teacher/'),
	(17,'2018-04-01 04:24:31',NULL,'读取',14,NULL,'/teacher/list'),
	(18,'2018-04-01 04:59:50',NULL,'保存',5,NULL,'/dictionary/save'),
	(19,'2018-04-01 05:00:13',NULL,'读取',5,NULL,'/dictionary/list'),
	(20,'2018-04-01 05:00:39',NULL,'浏览页',5,NULL,'/dictionary/');

/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post_workout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_workout`;

CREATE TABLE `post_workout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `company_name` varchar(255) NOT NULL,
  `end_time` datetime NOT NULL,
  `job` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `starting_time` datetime NOT NULL,
  `dispatch_department_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKly4apgx1vnoe1369q847s56ae` (`dispatch_department_id`),
  KEY `FKobw6kiq7289cohxae5l61e9nu` (`teacher_id`),
  CONSTRAINT `FKly4apgx1vnoe1369q847s56ae` FOREIGN KEY (`dispatch_department_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKobw6kiq7289cohxae5l61e9nu` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post_workout` WRITE;
/*!40000 ALTER TABLE `post_workout` DISABLE KEYS */;

INSERT INTO `post_workout` (`id`, `created_time`, `updated_time`, `annex`, `company_name`, `end_time`, `job`, `remark`, `starting_time`, `dispatch_department_id`, `teacher_id`)
VALUES
	(1,'2018-04-09 04:49:29','2018-04-10 06:04:05','[{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":54,\"createdTime\":\"2018-04-10 06:04:03\",\"updatedTime\":\"2018-04-10 06:04:03\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}},{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":53,\"createdTime\":\"2018-04-10 06:04:03\",\"updatedTime\":\"2018-04-10 06:04:03\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}}]','1231','2018-04-09 00:00:00','2312','','2018-04-09 00:00:00',52,5),
	(2,'2018-04-09 04:54:03',NULL,'[]','123','2018-04-09 00:00:00','1231','','2018-04-09 00:00:00',53,5);

/*!40000 ALTER TABLE `post_workout` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publishing_books
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publishing_books`;

CREATE TABLE `publishing_books` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `isbn` varchar(255) NOT NULL,
  `annex` text,
  `name` varchar(255) NOT NULL,
  `press` varchar(255) NOT NULL,
  `publication_date` datetime NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `my_ranking_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmh17f80j7omqua79vv2b7bvs1` (`my_ranking_id`),
  KEY `FKm2ymkkbxde1198l6unabgurd7` (`teacher_id`),
  CONSTRAINT `FKm2ymkkbxde1198l6unabgurd7` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKmh17f80j7omqua79vv2b7bvs1` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publishing_books` WRITE;
/*!40000 ALTER TABLE `publishing_books` DISABLE KEYS */;

INSERT INTO `publishing_books` (`id`, `created_time`, `updated_time`, `isbn`, `annex`, `name`, `press`, `publication_date`, `remark`, `my_ranking_id`, `teacher_id`)
VALUES
	(1,'2018-04-09 04:54:18','2018-04-10 06:04:22','12312','[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":55,\"createdTime\":\"2018-04-10 06:04:21\",\"updatedTime\":\"2018-04-10 06:04:21\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}},{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":56,\"createdTime\":\"2018-04-10 06:04:21\",\"updatedTime\":\"2018-04-10 06:04:21\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}}]','123','12312','2018-04-09 00:00:00','',59,5);

/*!40000 ALTER TABLE `publishing_books` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table report_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_data`;

CREATE TABLE `report_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `data_base` text,
  `data_expand` text,
  `data_custom` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `report_data` WRITE;
/*!40000 ALTER TABLE `report_data` DISABLE KEYS */;

INSERT INTO `report_data` (`id`, `created_time`, `updated_time`, `form_id`, `teacher_id`, `data_base`, `data_expand`, `data_custom`)
VALUES
	(5,'2018-04-28 09:19:52','2018-04-28 09:19:52',10,0,'{\"birthday\":\"2018-03-29\",\"qq\":\"12312\",\"education\":\"博士研究生\",\"sex\":\"男\",\"mobile\":\"17683912590\",\"degree\":\"博士\",\"fullName\":\"中文\",\"zc\":\"讲师\",\"gxzg\":true,\"zyly\":\"哲学\",\"zytc\":\"\",\"ggjs\":false,\"verify\":true,\"departments\":\"123\",\"job\":\"1231\",\"department\":\"计算机系\",\"user\":{\"accountNonExpired\":true,\"accountNonLocked\":true,\"authorities\":[{\"authority\":\"管理员\"}],\"createdTime\":1520742207000,\"credentialsNonExpired\":true,\"enabled\":true,\"id\":1,\"lastLoginTime\":1524878372000,\"password\":\"$2a$10$N7Ws5GyACowKSFVSUQMX5.G6tEVuukexgAEtcdr3vYPL.L/zlhUwq\",\"roles\":[{\"createdTime\":1518158705000,\"id\":1,\"name\":\"管理员\",\"permissions\":[{\"createdTime\":1522524643000,\"id\":4,\"name\":\"角色\",\"pid\":0,\"url\":\"/role/**\"},{\"createdTime\":1522530039000,\"id\":20,\"name\":\"浏览页\",\"pid\":5,\"url\":\"/dictionary/\"},{\"createdTime\":1522524687000,\"id\":6,\"name\":\"系部\",\"pid\":0,\"url\":\"/department/**\"},{\"createdTime\":1522530013000,\"id\":19,\"name\":\"读取\",\"pid\":5,\"url\":\"/dictionary/list\"},{\"createdTime\":1522527793000,\"id\":15,\"name\":\"保存\",\"pid\":14,\"url\":\"/teacher/save\"},{\"createdTime\":1522527849000,\"id\":16,\"name\":\"数据审核\",\"pid\":14,\"url\":\"/teacher/\"},{\"createdTime\":1522524617000,\"id\":2,\"name\":\"用户\",\"pid\":0,\"url\":\"/user/**\"},{\"createdTime\":1522524672000,\"id\":5,\"name\":\"字典\",\"pid\":0,\"updatedTime\":1522529964000,\"url\":\"/dictionary\"},{\"createdTime\":1522524630000,\"id\":3,\"name\":\"权限\",\"pid\":0,\"updatedTime\":1522527327000,\"url\":\"/permission/**\"},{\"createdTime\":1522529990000,\"id\":18,\"name\":\"保存\",\"pid\":5,\"url\":\"/dictionary/save\"},{\"createdTime\":1522527871000,\"id\":17,\"name\":\"读取\",\"pid\":14,\"url\":\"/teacher/list\"},{\"createdTime\":1522524699000,\"id\":7,\"name\":\"班级\",\"pid\":0,\"url\":\"/class/**\"},{\"createdTime\":1522527754000,\"id\":14,\"name\":\"教师\",\"pid\":0,\"updatedTime\":1522529308000,\"url\":\"/teacher\"}]}],\"state\":2,\"teacher\":{\"annex\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"birthday\":1522252800000,\"createdTime\":1522325571000,\"degree\":{\"createdTime\":1521608416000,\"id\":35,\"name\":\"博士\",\"parentName\":\"学位\",\"pid\":34,\"value\":1},\"department\":{\"createdTime\":1522192169000,\"id\":1,\"name\":\"计算机系\",\"updatedTime\":1524036128000},\"departments\":{\"createdTime\":1522303053000,\"department\":{\"$ref\":\"$.user.teacher.department\"},\"id\":1,\"name\":\"123\"},\"education\":{\"createdTime\":1521606726000,\"id\":26,\"name\":\"博士研究生\",\"parentName\":\"学历\",\"pid\":7,\"value\":1},\"email\":\"1231@qq.com\",\"fullName\":\"中文\",\"ggjs\":false,\"gxzg\":true,\"id\":5,\"job\":\"1231\",\"jobNumber\":\"123\",\"mobile\":\"17683912590\",\"pyxz\":{\"createdTime\":1521606548000,\"id\":23,\"name\":\"在编\",\"parentName\":\"聘用性质\",\"pid\":22,\"value\":1},\"qq\":\"12312\",\"sex\":{\"createdTime\":1518160637000,\"id\":5,\"name\":\"男\",\"parentName\":\"性别\",\"pid\":4,\"value\":0},\"ssjs\":false,\"updatedTime\":1523882590000,\"user\":{\"$ref\":\"..\"},\"verify\":true,\"zc\":{\"createdTime\":1518161017000,\"id\":20,\"name\":\"讲师\",\"parentName\":\"职称\",\"pid\":17,\"value\":2},\"zyly\":{\"createdTime\":1521606935000,\"id\":32,\"name\":\"哲学\",\"parentName\":\"专业领域\",\"pid\":31,\"value\":1},\"zytc\":\"\"},\"updatedTime\":1524878372000,\"userState\":\"正常\",\"username\":\"admin\"},\"email\":\"1231@qq.com\",\"jobNumber\":\"123\",\"ssjs\":false,\"pyxz\":\"在编\"}','{\"name\":\"12321\",\"getDate\":\"2018-04-09\",\"level\":\"123\",\"fzdw\":\"1231\"}',NULL);

/*!40000 ALTER TABLE `report_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table report_form
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_form`;

CREATE TABLE `report_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `bh` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `field_base` text,
  `table_expend` text,
  `field_expend` text,
  `field_custom` text,
  `created_teacher_id` bigint(20) DEFAULT NULL,
  `range_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `report_form` WRITE;
/*!40000 ALTER TABLE `report_form` DISABLE KEYS */;

INSERT INTO `report_form` (`id`, `created_time`, `updated_time`, `bh`, `name`, `field_base`, `table_expend`, `field_expend`, `field_custom`, `created_teacher_id`, `range_id`, `remark`)
VALUES
	(10,'2018-04-26 18:53:51','2018-04-28 09:15:37','1231','555333','[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]','JobCertificate','[\"29\",\"30\",\"31\",\"32\"]','',0,0,NULL),
	(11,'2018-04-27 17:12:44','2018-04-27 23:00:03','888','8888','[\"4\",\"5\",\"6\",\"10\",\"11\"]','ServiceProject','[\"107\",\"108\",\"109\",\"110\",\"111\",\"112\",\"113\",\"114\",\"115\",\"116\",\"117\",\"118\",\"119\",\"120\",\"121\"]','',0,0,NULL);

/*!40000 ALTER TABLE `report_form` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table research_subject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `research_subject`;

CREATE TABLE `research_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `date_of_establishment` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `project_number` varchar(255) NOT NULL,
  `project_source` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `the_amount_of_money` int(11) NOT NULL,
  `my_ranking_id` bigint(20) NOT NULL,
  `nature_of_the_project_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKth7k9rg4m1nrgkjcqxdbpu3lb` (`my_ranking_id`),
  KEY `FK6jyrex5yy48o1dar6k7lbevic` (`nature_of_the_project_id`),
  KEY `FKo29qe9xkfn91rhuf6w4j806mf` (`teacher_id`),
  CONSTRAINT `FK6jyrex5yy48o1dar6k7lbevic` FOREIGN KEY (`nature_of_the_project_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKo29qe9xkfn91rhuf6w4j806mf` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKth7k9rg4m1nrgkjcqxdbpu3lb` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `research_subject` WRITE;
/*!40000 ALTER TABLE `research_subject` DISABLE KEYS */;

INSERT INTO `research_subject` (`id`, `created_time`, `updated_time`, `annex`, `date_of_establishment`, `name`, `project_number`, `project_source`, `remark`, `the_amount_of_money`, `my_ranking_id`, `nature_of_the_project_id`, `teacher_id`)
VALUES
	(1,'2018-04-09 04:54:29','2018-04-10 06:04:32','[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":57,\"createdTime\":\"2018-04-10 06:04:31\",\"updatedTime\":\"2018-04-10 06:04:31\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}}]','2018-04-09 00:00:00','123','123412','1231','',12312,59,68,5);

/*!40000 ALTER TABLE `research_subject` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `created_time`, `updated_time`, `name`)
VALUES
	(1,'2018-02-09 14:45:05',NULL,'管理员'),
	(2,'2018-02-09 14:45:06',NULL,'教师'),
	(3,'2018-02-09 14:45:06',NULL,'学生');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permissions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permissions_id`),
  KEY `FKa1duuqu7fiw2v9r5va5esghd5` (`permissions_id`),
  CONSTRAINT `FK4hrolwj4ned5i7qe8kyiaak6m` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKa1duuqu7fiw2v9r5va5esghd5` FOREIGN KEY (`permissions_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles_permissions` WRITE;
/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;

INSERT INTO `roles_permissions` (`role_id`, `permissions_id`)
VALUES
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(2,5),
	(3,5),
	(1,6),
	(2,6),
	(3,6),
	(1,7),
	(2,7),
	(3,7),
	(1,14),
	(2,14),
	(1,15),
	(2,15),
	(1,16),
	(1,17),
	(2,17),
	(1,18),
	(1,19),
	(2,19),
	(1,20);

/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table service_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_project`;

CREATE TABLE `service_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `achievement_adscription` varchar(255) DEFAULT NULL,
  `achievement_content` varchar(255) DEFAULT NULL,
  `achievement_name` varchar(255) DEFAULT NULL,
  `achievement_official_document` varchar(255) DEFAULT NULL,
  `achievement_owner` varchar(255) DEFAULT NULL,
  `annex` text,
  `contract_money` int(11) NOT NULL,
  `cooperation_institution` varchar(255) DEFAULT NULL,
  `other_member` varchar(255) DEFAULT NULL,
  `project_content` varchar(255) DEFAULT NULL,
  `project_institution` varchar(255) DEFAULT NULL,
  `project_name` varchar(255) NOT NULL,
  `project_official_document` varchar(255) DEFAULT NULL,
  `project_team` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `achievement_type_id` bigint(20) DEFAULT NULL,
  `my_ranking_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbuihfs02s925ityn7ubuv6v8o` (`achievement_type_id`),
  KEY `FKrohio85j0gx22y89qxelmr9op` (`my_ranking_id`),
  KEY `FKetmhuxpfalvyklf25uh11iq9d` (`teacher_id`),
  CONSTRAINT `FKbuihfs02s925ityn7ubuv6v8o` FOREIGN KEY (`achievement_type_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKetmhuxpfalvyklf25uh11iq9d` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKrohio85j0gx22y89qxelmr9op` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `service_project` WRITE;
/*!40000 ALTER TABLE `service_project` DISABLE KEYS */;

INSERT INTO `service_project` (`id`, `created_time`, `updated_time`, `achievement_adscription`, `achievement_content`, `achievement_name`, `achievement_official_document`, `achievement_owner`, `annex`, `contract_money`, `cooperation_institution`, `other_member`, `project_content`, `project_institution`, `project_name`, `project_official_document`, `project_team`, `remark`, `achievement_type_id`, `my_ranking_id`, `teacher_id`)
VALUES
	(1,'2018-04-18 08:05:50','2018-05-07 12:29:25','213','1231','123','123','123','[{\"fileName\":\"94080de5257ecebe22f2f692495441fc.obj\",\"code\":200,\"file\":{\"id\":75,\"createdTime\":\"2018-04-18 08:10:55\",\"updatedTime\":\"2018-04-18 08:10:55\",\"fileName\":\"lab.obj\",\"hash\":\"94080de5257ecebe22f2f692495441fc\",\"size\":40042}},{\"fileName\":\"5f326d7a02cb34a17be639d02b383ad2.png\",\"code\":200,\"file\":{\"id\":76,\"createdTime\":\"2018-04-18 08:11:45\",\"updatedTime\":\"2018-04-18 08:11:45\",\"fileName\":\"下载.png\",\"hash\":\"5f326d7a02cb34a17be639d02b383ad2\",\"size\":2751}}]',111,'123','123','123','12312','123','123111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111','123','123',81,57,6);

/*!40000 ALTER TABLE `service_project` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_work
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_work`;

CREATE TABLE `social_work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `company_name` varchar(255) NOT NULL,
  `end_time` datetime NOT NULL,
  `job` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `starting_time` datetime NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKipqh4q8swb41sttwh4oagq4vq` (`teacher_id`),
  CONSTRAINT `FKipqh4q8swb41sttwh4oagq4vq` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `social_work` WRITE;
/*!40000 ALTER TABLE `social_work` DISABLE KEYS */;

INSERT INTO `social_work` (`id`, `created_time`, `updated_time`, `annex`, `company_name`, `end_time`, `job`, `remark`, `starting_time`, `teacher_id`)
VALUES
	(1,'2018-04-09 04:54:38','2018-04-10 06:04:41','[{\"fileName\":\"366172235361f14ee06d91383a56c572.jpg\",\"code\":200,\"file\":{\"id\":58,\"createdTime\":\"2018-04-10 06:04:40\",\"updatedTime\":\"2018-04-10 06:04:40\",\"fileName\":\"12320180104134508.jpg\",\"hash\":\"366172235361f14ee06d91383a56c572\",\"size\":94552}}]','12312','2018-04-09 00:00:00','1231','','2018-04-09 00:00:00',5);

/*!40000 ALTER TABLE `social_work` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table student_award
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student_award`;

CREATE TABLE `student_award` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `award_year` varchar(255) DEFAULT NULL,
  `awarding_unit` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `related_file_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `student` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `my_ranking_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6nlv7gdbqk1thr13ueibbyxu` (`level_id`),
  KEY `FKd8fe2l1qk2wn5ivyqfe6jekpr` (`my_ranking_id`),
  KEY `FK9ir1b910bo7qu2jpaadtk516l` (`teacher_id`),
  CONSTRAINT `FK9ir1b910bo7qu2jpaadtk516l` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKd8fe2l1qk2wn5ivyqfe6jekpr` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKt6nlv7gdbqk1thr13ueibbyxu` FOREIGN KEY (`level_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `student_award` WRITE;
/*!40000 ALTER TABLE `student_award` DISABLE KEYS */;

INSERT INTO `student_award` (`id`, `created_time`, `updated_time`, `annex`, `award_year`, `awarding_unit`, `name`, `related_file_name`, `remark`, `student`, `level_id`, `my_ranking_id`, `teacher_id`)
VALUES
	(1,'2018-04-18 08:13:29','2018-04-18 08:14:07','[{\"fileName\":\"02336114be714a6e8db039f78267e235.bak\",\"code\":200,\"file\":{\"id\":77,\"createdTime\":\"2018-04-18 08:14:06\",\"updatedTime\":\"2018-04-18 08:14:06\",\"fileName\":\"改密.bak\",\"hash\":\"02336114be714a6e8db039f78267e235\",\"size\":6026}}]','qweqw','1231','12312',NULL,'123','12312',53,59,5);

/*!40000 ALTER TABLE `student_award` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subject_build
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject_build`;

CREATE TABLE `subject_build` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `name` varchar(255) NOT NULL,
  `related_file_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmvmugpua0411b44c27pv1sjqg` (`level_id`),
  KEY `FKifw8n97h05057yvusqgqcsh42` (`teacher_id`),
  CONSTRAINT `FKifw8n97h05057yvusqgqcsh42` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKmvmugpua0411b44c27pv1sjqg` FOREIGN KEY (`level_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tclass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tclass`;

CREATE TABLE `tclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `admission_date` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfssx90cuv67i0yqtfrxmcbwjx` (`department_id`),
  CONSTRAINT `FKfssx90cuv67i0yqtfrxmcbwjx` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tclass` WRITE;
/*!40000 ALTER TABLE `tclass` DISABLE KEYS */;

INSERT INTO `tclass` (`id`, `created_time`, `updated_time`, `admission_date`, `name`, `department_id`)
VALUES
	(1,'2018-03-29 13:59:19',NULL,2010,'112312',1);

/*!40000 ALTER TABLE `tclass` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teacher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `ggjs` bit(1) NOT NULL,
  `gxzg` bit(1) NOT NULL,
  `job` varchar(255) DEFAULT NULL,
  `job_number` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `ssjs` bit(1) NOT NULL,
  `zytc` varchar(255) DEFAULT NULL,
  `degree_id` bigint(20) NOT NULL,
  `education_id` bigint(20) NOT NULL,
  `jxms_id` bigint(20) DEFAULT NULL,
  `pyxz_id` bigint(20) NOT NULL,
  `sex_id` bigint(20) NOT NULL,
  `zyly_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) NOT NULL,
  `departments_id` bigint(20) NOT NULL,
  `verify` bit(1) NOT NULL,
  `annex` text,
  `zc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i5wqs2ds2vpmfpbcdxi9m2jvr` (`user_id`),
  KEY `FK9gj2ep7kmtu98osc6s2gtmei2` (`education_id`),
  KEY `FKct2b2aw4iurrqbf701cf47nyk` (`pyxz_id`),
  KEY `FKhir219hkk0uhl9ekutk7yqiok` (`degree_id`),
  KEY `FKi5bvfklyr2iyc9wkrv8as6mk` (`jxms_id`),
  KEY `FKm5rct39580v70ew9717w275sl` (`sex_id`),
  KEY `FKs46b4u0r2xs28oll04xq2eu1t` (`zyly_id`),
  KEY `FKd419q6obhj46eoye136y7rjyq` (`department_id`),
  KEY `FKmk9wscky83gklx4i7y8t4yx55` (`departments_id`),
  KEY `FKgwr9ngu0xkprgqnudmniwuu2o` (`zc_id`),
  CONSTRAINT `FK9gj2ep7kmtu98osc6s2gtmei2` FOREIGN KEY (`education_id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKct2b2aw4iurrqbf701cf47nyk` FOREIGN KEY (`pyxz_id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKd419q6obhj46eoye136y7rjyq` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKgwr9ngu0xkprgqnudmniwuu2o` FOREIGN KEY (`zc_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKhir219hkk0uhl9ekutk7yqiok` FOREIGN KEY (`degree_id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKi5bvfklyr2iyc9wkrv8as6mk` FOREIGN KEY (`jxms_id`) REFERENCES `dictionary` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `FKm5rct39580v70ew9717w275sl` FOREIGN KEY (`sex_id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKmk9wscky83gklx4i7y8t4yx55` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FKpb6g6pahj1mr2ijg92r7m1xlh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKs46b4u0r2xs28oll04xq2eu1t` FOREIGN KEY (`zyly_id`) REFERENCES `dictionary` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;

INSERT INTO `teacher` (`id`, `created_time`, `updated_time`, `birthday`, `email`, `full_name`, `ggjs`, `gxzg`, `job`, `job_number`, `mobile`, `qq`, `ssjs`, `zytc`, `degree_id`, `education_id`, `jxms_id`, `pyxz_id`, `sex_id`, `zyly_id`, `user_id`, `department_id`, `departments_id`, `verify`, `annex`, `zc_id`)
VALUES
	(5,'2018-03-29 20:12:51','2018-05-06 09:38:49','2018-03-29 00:00:00','1231@qq.com','中文',b'0',b'1','1231','123','17683912590','12312',b'0','',35,26,NULL,23,5,32,NULL,1,1,b'1','6734d36dce588f84261a179830fb03e4.png',20),
	(6,'2018-04-01 04:57:13',NULL,'2018-04-01 00:00:00','22113@qq.com','胡了了',b'0',b'0','12312','12313','18986324133','1231231',b'0','',37,28,NULL,24,6,41,4,1,1,b'1',NULL,18),
	(7,'2018-04-18 08:24:28',NULL,'2018-04-18 00:00:00','12312@qq.com','小甜瓜',b'1',b'1','12312','12313','17683912590','1021515457',b'1','12312',36,27,NULL,25,5,43,3,1,1,b'0','21df0fb8e09d44d8186ae4e2f28be673.png',20),
	(17,'2018-04-18 16:32:06',NULL,'2017-01-02 00:00:00','chen@163.com','陈',b'1',b'1','无','110110','13960','123456',b'1','软件',37,28,NULL,23,5,46,24,1,2,b'0',NULL,20),
	(18,'2018-04-18 18:32:25','2018-04-19 15:18:51','2017-01-02 00:00:00','chen@163.com','陈',b'1',b'1','无','110110','18972254546','123456',b'1','软件',37,28,NULL,23,5,46,NULL,1,2,b'0','',18);

/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teacher_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teacher_field`;

CREATE TABLE `teacher_field` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `table_label` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `table_entity` varchar(255) DEFAULT NULL,
  `field_label` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_attr` varchar(255) DEFAULT NULL,
  `type_label` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teacher_field` WRITE;
/*!40000 ALTER TABLE `teacher_field` DISABLE KEYS */;

INSERT INTO `teacher_field` (`id`, `created_time`, `updated_time`, `table_label`, `table_name`, `table_entity`, `field_label`, `field_name`, `field_attr`, `type_label`, `type_name`)
VALUES
	(3,NULL,NULL,'基本资料','teacher','Teacher','出生年月','birthday','birthday','日期时间','datetime'),
	(4,NULL,NULL,'基本资料','teacher','Teacher','邮箱','email','email','文本','varchar'),
	(5,NULL,NULL,'基本资料','teacher','Teacher','姓名','full_name','fullName','文本','varchar'),
	(6,NULL,NULL,'基本资料','teacher','Teacher','骨干教师','ggjs','ggjs','是否','bit'),
	(7,NULL,NULL,'基本资料','teacher','Teacher','高校资格','gxzg','gxzg','是否','bit'),
	(8,NULL,NULL,'基本资料','teacher','Teacher','职务','job','job','文本','varchar'),
	(9,NULL,NULL,'基本资料','teacher','Teacher','工号','job_number','jobNumber','文本','varchar'),
	(10,NULL,NULL,'基本资料','teacher','Teacher','手机号','mobile','mobile','文本','varchar'),
	(11,NULL,NULL,'基本资料','teacher','Teacher','QQ号','qq','qq','文本','varchar'),
	(12,NULL,NULL,'基本资料','teacher','Teacher','双师教师','ssjs','ssjs','是否','bit'),
	(13,NULL,NULL,'基本资料','teacher','Teacher','专业特长','zytc','zytc','文本','varchar'),
	(14,NULL,NULL,'基本资料','teacher','Teacher','学位','degree_id','degree','字典','bigint'),
	(15,NULL,NULL,'基本资料','teacher','Teacher','学历','education_id','education','字典','bigint'),
	(16,NULL,NULL,'基本资料','teacher','Teacher','教学名师','jxms_id','jxms_id','字典','bigint'),
	(17,NULL,NULL,'基本资料','teacher','Teacher','聘用性质','pyxz_id','pyxz','字典','bigint'),
	(18,NULL,NULL,'基本资料','teacher','Teacher','性别','sex_id','sex','字典','bigint'),
	(19,NULL,NULL,'基本资料','teacher','Teacher','专业领域','zyly_id','zyly','字典','bigint'),
	(20,NULL,NULL,'基本资料','teacher','Teacher','用户编号','user_id','user','对象','bigint'),
	(21,NULL,NULL,'基本资料','teacher','Teacher','所属系部','department_id','department','对象','bigint'),
	(22,NULL,NULL,'基本资料','teacher','Teacher','所属部门','departments_id','departments','对象','bigint'),
	(23,NULL,NULL,'基本资料','teacher','Teacher','启用','verify','verify','是否','bit'),
	(24,NULL,NULL,'基本资料','teacher','Teacher','职称','zc_id','zc','字典','bigint'),
	(25,NULL,NULL,'专业技术职务','technical_posts','TechnicalPosts','发证单位','fzdw','fzdw','文本','varchar'),
	(26,NULL,NULL,'专业技术职务','technical_posts','TechnicalPosts','获取日期','get_date','getDate','日期时间','datetime'),
	(27,NULL,NULL,'专业技术职务','technical_posts','TechnicalPosts','等级','level','level','文本','varchar'),
	(28,NULL,NULL,'专业技术职务','technical_posts','TechnicalPosts','名称','name','name','文本','varchar'),
	(29,NULL,NULL,'职业资格证书','job_certificate','JobCertificate','发证单位','fzdw','fzdw','文本','varchar'),
	(30,NULL,NULL,'职业资格证书','job_certificate','JobCertificate','获取日期','get_date','getDate','日期时间','datetime'),
	(31,NULL,NULL,'职业资格证书','job_certificate','JobCertificate','等级','level','level','文本','varchar'),
	(32,NULL,NULL,'职业资格证书','job_certificate','JobCertificate','名称','name','name','文本','varchar'),
	(33,NULL,NULL,'进修学习','further_study','FurtherStudy','进修学历','advanced_degree','advancedDegree','文本','varchar'),
	(34,NULL,NULL,'进修学习','further_study','FurtherStudy','完成时间','complete_time','completeTime','日期时间','datetime'),
	(35,NULL,NULL,'进修学习','further_study','FurtherStudy','进修学位','further_education','furtherEducation','文本','varchar'),
	(36,NULL,NULL,'进修学习','further_study','FurtherStudy','专业名称','professional_title','professionalTitle','文本','varchar'),
	(37,NULL,NULL,'进修学习','further_study','FurtherStudy','备注','remark','remark','文本','varchar'),
	(38,NULL,NULL,'进修学习','further_study','FurtherStudy','进修学校','study_school','studySchool','文本','varchar'),
	(39,NULL,NULL,'进修学习','further_study','FurtherStudy','进修时间','training_time','trainingTime','日期时间','datetime'),
	(40,NULL,NULL,'培训学习','training','Training','完成时间','complete_time','completeTime','日期时间','datetime'),
	(41,NULL,NULL,'培训学习','training','Training','获取证书','getacertificate','getACertificate','文本','varchar'),
	(42,NULL,NULL,'培训学习','training','Training','备注','remark','remark','文本','varchar'),
	(43,NULL,NULL,'培训学习','training','Training','培训名称','training_name','trainingName','文本','varchar'),
	(44,NULL,NULL,'培训学习','training','Training','培训时间','training_period','trainingPeriod','日期时间','datetime'),
	(45,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','单位名称','company_name','companyName','文本','varchar'),
	(46,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','结束时间','end_time','endTime','日期时间','datetime'),
	(47,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','岗位','job','job','文本','varchar'),
	(48,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','备注','remark','remark','文本','varchar'),
	(49,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','开始时间','starting_time','startingTime','日期时间','datetime'),
	(50,NULL,NULL,'挂职锻炼','post_workout','PostWorkout','派出部门','dispatch_department_id','dispatchDepartment','字典','bigint'),
	(51,NULL,NULL,'社会兼职','social_work','SocialWork','公司名称','company_name','companyName','文本','varchar'),
	(52,NULL,NULL,'社会兼职','social_work','SocialWork','结束时间','end_time','endTime','日期时间','datetime'),
	(53,NULL,NULL,'社会兼职','social_work','SocialWork','岗位','job','job','文本','varchar'),
	(54,NULL,NULL,'社会兼职','social_work','SocialWork','备注','remark','remark','文本','varchar'),
	(55,NULL,NULL,'社会兼职','social_work','SocialWork','开始时间','starting_time','startingTime','日期时间','datetime'),
	(56,NULL,NULL,'获奖荣誉','awards','Awards','获奖金额','award_amount','awardAmount','数字','int'),
	(57,NULL,NULL,'获奖荣誉','awards','Awards','获奖名称','awarded_name','awardedName','文本','varchar'),
	(58,NULL,NULL,'获奖荣誉','awards','Awards','颁奖单位','awarding_unit','awardingUnit','文本','varchar'),
	(59,NULL,NULL,'获奖荣誉','awards','Awards','获奖日期','get_date','getDate','日期时间','datetime'),
	(60,NULL,NULL,'获奖荣誉','awards','Awards','备注','remark','remark','文本','varchar'),
	(61,NULL,NULL,'获奖荣誉','awards','Awards','获奖级别','award_level_id','awardLevel','字典','bigint'),
	(62,NULL,NULL,'获奖荣誉','awards','Awards','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(63,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','获取日期','get_date','getDate','日期时间','datetime'),
	(64,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','名称','name','name','文本','varchar'),
	(65,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','专利编号','number','number','文本','varchar'),
	(66,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','备注','remark','remark','文本','varchar'),
	(67,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(68,NULL,NULL,'技术专利','technology_patent','TechnologyPatent','专利类型','patent_type_id','patentType','字典','bigint'),
	(69,NULL,NULL,'科研课题','research_subject','ResearchSubject','立项日期','date_of_establishment','dateOfEstablishment','日期时间','datetime'),
	(70,NULL,NULL,'科研课题','research_subject','ResearchSubject','名称','name','name','文本','varchar'),
	(71,NULL,NULL,'科研课题','research_subject','ResearchSubject','立项编号','project_number','projectNumber','文本','varchar'),
	(72,NULL,NULL,'科研课题','research_subject','ResearchSubject','项目来源','project_source','projectSource','文本','varchar'),
	(73,NULL,NULL,'科研课题','research_subject','ResearchSubject','备注','remark','remark','文本','varchar'),
	(74,NULL,NULL,'科研课题','research_subject','ResearchSubject','到款金额','the_amount_of_money','theAmountOfMoney','数字','int'),
	(75,NULL,NULL,'科研课题','research_subject','ResearchSubject','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(76,NULL,NULL,'科研课题','research_subject','ResearchSubject','项目性质','nature_of_the_project_id','natureOfTheProject','字典','bigint'),
	(77,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','ISBN号','isbn','isbn','文本','varchar'),
	(78,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','出版物名称','name','name','文本','varchar'),
	(79,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','出版社','press','press','文本','varchar'),
	(80,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','出版日期','publication_date','publicationDate','日期时间','datetime'),
	(81,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','备注','remark','remark','文本','varchar'),
	(82,NULL,NULL,'出版书籍教材','publishing_books','PublishingBooks','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(83,NULL,NULL,'论文','paper','Paper','刊号','issue_number','issueNumber','文本','varchar'),
	(84,NULL,NULL,'论文','paper','Paper','刊物学报名称','journal_of_publications','journalOfPublications','文本','varchar'),
	(85,NULL,NULL,'论文','paper','Paper','论文名称','name','name','文本','varchar'),
	(86,NULL,NULL,'论文','paper','Paper','发表日期','publication_date','publicationDate','日期时间','datetime'),
	(87,NULL,NULL,'论文','paper','Paper','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(88,NULL,NULL,'论文','paper','Paper','刊物类别','publication_category_id','publicationCategory','字典','bigint'),
	(89,NULL,NULL,'课程建设项目','course_build','CourseBuild','课程名称','name','name','文本','varchar'),
	(90,NULL,NULL,'课程建设项目','course_build','CourseBuild','级别','level_id','level','字典','bigint'),
	(91,NULL,NULL,'课程建设项目','course_build','CourseBuild','相关文件名称','related_file_name','relatedFileName','文本','varchar'),
	(92,NULL,NULL,'课程建设项目','course_build','CourseBuild','备注','remark','remark','文本','varchar'),
	(93,NULL,NULL,'实训基地建设','train_build','TrainBuild','实训基地名称','name','name','文本','varchar'),
	(94,NULL,NULL,'实训基地建设','train_build','TrainBuild','相关文件名称','related_file_name','relatedFileName','文本','varchar'),
	(95,NULL,NULL,'实训基地建设','train_build','TrainBuild','备注','remark','remark','文本','varchar'),
	(96,NULL,NULL,'实训基地建设','train_build','TrainBuild','级别','level_id','level','字典','bigint'),
	(97,NULL,NULL,'专业建设','subject_build','SubjectBuild','建设项目名称','name','name','文本','varchar'),
	(98,NULL,NULL,'专业建设','subject_build','SubjectBuild','相关文件名称','related_file_name','relatedFileName','文本','varchar'),
	(99,NULL,NULL,'专业建设','subject_build','SubjectBuild','备注','remark','remark','文本','varchar'),
	(100,NULL,NULL,'学生获奖','student_award','StudentAward','获奖年度','award_year','awardYear','数字','int'),
	(101,NULL,NULL,'学生获奖','student_award','StudentAward','颁奖单位','awarding_unit','awardingUnit','文本','varchar'),
	(102,NULL,NULL,'学生获奖','student_award','StudentAward','获奖名称','name','name','文本','varchar'),
	(103,NULL,NULL,'学生获奖','student_award','StudentAward','备注','remark','remark','文本','varchar'),
	(104,NULL,NULL,'学生获奖','student_award','StudentAward','获奖学生','student','student','文本','varchar'),
	(105,NULL,NULL,'学生获奖','student_award','StudentAward','获奖级别','level_id','level','字典','bigint'),
	(106,NULL,NULL,'学生获奖','student_award','StudentAward','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(107,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','项目名称','project_name','projectName','文本','varchar'),
	(108,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','承担单位或部门','project_institution','projectInstitution','文本','varchar'),
	(109,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','依托机构或团队','project_team','projectTeam','文本','varchar'),
	(110,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','本人排名','my_ranking_id','myRanking','字典','bigint'),
	(111,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','其他成员','other_member','otherMember','文本','varchar'),
	(112,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','合作单位','cooperation_institution','cooperationInstitution','文本','varchar'),
	(113,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','项目内容','project_content','projectContent','文本','varchar'),
	(114,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','项目相关文件','project_official_document','projectOfficialDocument','文本','varchar'),
	(115,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','合同金额','contract_money','contractMoney','数字','int'),
	(116,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果名称','achievement_name','achievementName','文本','varchar'),
	(117,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果类型','achievement_type','achievementType','字典','bigint'),
	(118,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果权利人','achievement_owner','achievementOwner','文本','varchar'),
	(119,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果内容','achievement_content','achievementContent','文本','varchar'),
	(120,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果归属','achievement_adscription','achievementAdscription','文本','varchar'),
	(121,NULL,NULL,'社会技术服务项目','service_project','ServiceProject','成果相关文件','achievement_official_document','achievementOfficialDocument','文本','varchar');

/*!40000 ALTER TABLE `teacher_field` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table technical_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `technical_posts`;

CREATE TABLE `technical_posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `fzdw` varchar(255) NOT NULL,
  `get_date` datetime NOT NULL,
  `level` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhxccmo908va6jmu1ilm7f2twj` (`teacher_id`),
  CONSTRAINT `FKhxccmo908va6jmu1ilm7f2twj` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `technical_posts` WRITE;
/*!40000 ALTER TABLE `technical_posts` DISABLE KEYS */;

INSERT INTO `technical_posts` (`id`, `created_time`, `updated_time`, `annex`, `fzdw`, `get_date`, `level`, `name`, `teacher_id`, `remark`)
VALUES
	(1,'2018-04-09 04:54:47','2018-05-07 12:01:12','[{\"fileName\":\"7f1da3ce7193349b2a954684a8ed4c9f.jpg\",\"code\":200,\"file\":{\"id\":59,\"createdTime\":\"2018-04-10 06:04:47\",\"updatedTime\":\"2018-04-10 06:04:47\",\"fileName\":\"20180104134309.jpg\",\"hash\":\"7f1da3ce7193349b2a954684a8ed4c9f\",\"size\":86498}}]','123','2018-04-09 00:00:00','134123','12312',5,'123');

/*!40000 ALTER TABLE `technical_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table technology_patent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `technology_patent`;

CREATE TABLE `technology_patent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `get_date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `my_ranking_id` bigint(20) NOT NULL,
  `patent_type_id` bigint(20) NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhlotechdqm6u61f5tl8m2s5a4` (`my_ranking_id`),
  KEY `FKamvxcyefrdl5pxhoqls7jbpqc` (`patent_type_id`),
  KEY `FK2es2plxd2asvsbm97umis2gru` (`teacher_id`),
  CONSTRAINT `FK2es2plxd2asvsbm97umis2gru` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKamvxcyefrdl5pxhoqls7jbpqc` FOREIGN KEY (`patent_type_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKhlotechdqm6u61f5tl8m2s5a4` FOREIGN KEY (`my_ranking_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `technology_patent` WRITE;
/*!40000 ALTER TABLE `technology_patent` DISABLE KEYS */;

INSERT INTO `technology_patent` (`id`, `created_time`, `updated_time`, `annex`, `get_date`, `name`, `number`, `remark`, `my_ranking_id`, `patent_type_id`, `teacher_id`)
VALUES
	(1,'2018-04-01 04:57:37',NULL,NULL,'2018-04-01 00:00:00','1231','12341','',57,62,6),
	(2,'2018-04-09 04:54:55','2018-04-10 06:05:04','[{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":60,\"createdTime\":\"2018-04-10 06:05:01\",\"updatedTime\":\"2018-04-10 06:05:01\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}}]','2018-04-09 00:00:00','12312','12312','',59,64,5);

/*!40000 ALTER TABLE `technology_patent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table train_build
# ------------------------------------------------------------

DROP TABLE IF EXISTS `train_build`;

CREATE TABLE `train_build` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `name` varchar(255) NOT NULL,
  `related_file_name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo7gplg0o78kggnabjhjnva5lv` (`level_id`),
  KEY `FKg43ajykodooqfd452g82gc57j` (`teacher_id`),
  CONSTRAINT `FKg43ajykodooqfd452g82gc57j` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `FKo7gplg0o78kggnabjhjnva5lv` FOREIGN KEY (`level_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table training
# ------------------------------------------------------------

DROP TABLE IF EXISTS `training`;

CREATE TABLE `training` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `annex` text,
  `complete_time` datetime NOT NULL,
  `getacertificate` varchar(255) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `training_name` varchar(255) NOT NULL,
  `training_period` datetime NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2y1iov710xnq3hxcsedg9kgoy` (`teacher_id`),
  CONSTRAINT `FK2y1iov710xnq3hxcsedg9kgoy` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;

INSERT INTO `training` (`id`, `created_time`, `updated_time`, `annex`, `complete_time`, `getacertificate`, `remark`, `training_name`, `training_period`, `teacher_id`)
VALUES
	(1,'2018-04-01 04:57:28','2018-04-15 14:07:44','[{\"fileName\":\"366172235361f14ee06d91383a56c572.jpg\",\"code\":200,\"file\":{\"id\":61,\"createdTime\":\"2018-04-10 06:05:12\",\"updatedTime\":\"2018-04-10 06:05:12\",\"fileName\":\"12320180104134508.jpg\",\"hash\":\"366172235361f14ee06d91383a56c572\",\"size\":94552}},{\"fileName\":\"08457a58e9ecec6a543a9b3d07be9b5a.js\",\"code\":200,\"file\":{\"id\":71,\"createdTime\":\"2018-04-15 14:07:42\",\"updatedTime\":\"2018-04-15 14:07:42\",\"fileName\":\"百度网盘直接下载助手.user.js\",\"hash\":\"08457a58e9ecec6a543a9b3d07be9b5a\",\"size\":90510}}]','2018-04-01 00:00:00','1231','','123','2018-04-01 00:00:00',6),
	(2,'2018-04-09 04:55:59','2018-04-09 04:56:08','','2018-04-09 00:00:00','12312','','1231','2018-04-09 00:00:00',5);

/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `state` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `created_time`, `updated_time`, `last_login_time`, `password`, `state`, `username`)
VALUES
	(1,'2018-03-11 12:23:27','2018-05-07 14:41:19','2018-05-07 14:41:19','$2a$10$N7Ws5GyACowKSFVSUQMX5.G6tEVuukexgAEtcdr3vYPL.L/zlhUwq',2,'admin'),
	(3,'2018-03-11 12:34:10','2018-04-18 10:06:08','2018-04-18 10:06:08','$2a$10$qQ2rZFmQ/OzAFhMdpR4JEu0mJLMTLJwKA1BFkRE39DFpRiV.TRwc.',2,'test123'),
	(4,'2018-04-01 04:53:06','2018-04-18 11:52:22','2018-04-18 11:52:22','$2a$10$/opgE1aCvpl.nHWWtFtsNevFKtb9z0FVa9RRxgWP0450yj/AwfmkK',2,'test333'),
	(24,'2018-04-18 16:32:06','2018-04-18 16:32:19','2018-04-18 16:32:19','$2a$10$yCpVJDvJgoTINscMkNaaHeFuBkm4QNPBzSNMgJ9fK1Mkh5YOxWV2u',2,'chen'),
	(26,'2018-04-18 18:32:25',NULL,NULL,'$2a$10$GBINQhJjM/tXli1wPmCKTu.sCGvXstLr1h.2.VuyUgVBKlNRIDZSu',2,'chenad');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;

INSERT INTO `user_roles` (`user_id`, `role_id`)
VALUES
	(1,1),
	(3,2),
	(4,2),
	(24,2),
	(26,2);

/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
