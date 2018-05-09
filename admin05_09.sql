/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : admin
Target Host     : localhost:3306
Target Database : admin
Date: 2018-05-09 11:11:57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for audit_results
-- ----------------------------
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

-- ----------------------------
-- Records of audit_results
-- ----------------------------

-- ----------------------------
-- Table structure for awards
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of awards
-- ----------------------------
INSERT INTO `awards` VALUES ('1', '2018-03-30 13:47:50', '2018-05-08 16:58:29', '[{\"fileName\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"code\":200,\"file\":{\"id\":37,\"createdTime\":\"2018-04-10 05:57:15\",\"updatedTime\":\"2018-04-10 05:57:15\",\"fileName\":\"123.jpg\",\"hash\":\"6254422dcf2cec7ca9911dbd1ed8a5a8\",\"size\":181100}},{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":44,\"createdTime\":\"2018-04-10 06:03:03\",\"updatedTime\":\"2018-04-10 06:03:03\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}},{\"fileName\":\"d8285913021cf333a1fb1904fcb512d6.jpg\",\"code\":200,\"file\":{\"id\":46,\"createdTime\":\"2018-04-10 06:03:03\",\"updatedTime\":\"2018-04-10 06:03:03\",\"fileName\":\"20180104133327.jpg\",\"hash\":\"d8285913021cf333a1fb1904fcb512d6\",\"size\":135870}}]', '1', '231', '12312', '2018-03-30 00:00:00', '215215', '53', '59', '5');

-- ----------------------------
-- Table structure for class
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '2018-03-28 07:09:45', null, '2017', '123', '1');

-- ----------------------------
-- Table structure for course
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '2018-04-01 04:49:20', null, '1123', '', '1');

-- ----------------------------
-- Table structure for course_build
-- ----------------------------
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

-- ----------------------------
-- Records of course_build
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1t68827l97cwyxo9r1u6t4p7d` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '2018-03-28 07:09:29', '2018-04-18 15:22:08', '计算机系');

-- ----------------------------
-- Table structure for departments
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES ('1', '2018-03-29 13:57:33', null, '123', '1');
INSERT INTO `departments` VALUES ('2', '2018-04-18 15:22:17', null, '系部领导', '1');

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', '2018-02-09 14:45:55', null, '用户状态', '0', '0');
INSERT INTO `dictionary` VALUES ('2', '2018-02-09 14:46:06', '2018-03-22 19:41:43', '正常', '1', '0');
INSERT INTO `dictionary` VALUES ('3', '2018-02-09 14:46:21', null, '冻结', '1', '1');
INSERT INTO `dictionary` VALUES ('4', '2018-02-09 15:17:09', null, '性别', '0', '0');
INSERT INTO `dictionary` VALUES ('5', '2018-02-09 15:17:17', null, '男', '4', '0');
INSERT INTO `dictionary` VALUES ('6', '2018-02-09 15:17:31', null, '女', '4', '1');
INSERT INTO `dictionary` VALUES ('7', '2018-02-09 15:19:14', null, '学历', '0', '0');
INSERT INTO `dictionary` VALUES ('14', '2018-02-09 15:21:36', null, '授课状态', '0', '0');
INSERT INTO `dictionary` VALUES ('15', '2018-02-09 15:22:05', null, '在授', '14', '0');
INSERT INTO `dictionary` VALUES ('16', '2018-02-09 15:22:29', null, '已结束', '14', '1');
INSERT INTO `dictionary` VALUES ('17', '2018-02-09 15:22:44', null, '职称', '0', '0');
INSERT INTO `dictionary` VALUES ('18', '2018-02-09 15:23:04', null, '教授', '17', '0');
INSERT INTO `dictionary` VALUES ('19', '2018-02-09 15:23:23', null, '副教授', '17', '1');
INSERT INTO `dictionary` VALUES ('20', '2018-02-09 15:23:37', null, '讲师', '17', '2');
INSERT INTO `dictionary` VALUES ('21', '2018-02-09 15:24:00', null, '助讲', '17', '3');
INSERT INTO `dictionary` VALUES ('22', '2018-03-21 12:28:56', null, '聘用性质', '0', '0');
INSERT INTO `dictionary` VALUES ('23', '2018-03-21 12:29:08', null, '在编', '22', '1');
INSERT INTO `dictionary` VALUES ('24', '2018-03-21 12:29:16', null, '聘用', '22', '2');
INSERT INTO `dictionary` VALUES ('25', '2018-03-21 12:29:25', null, '外聘', '22', '3');
INSERT INTO `dictionary` VALUES ('26', '2018-03-21 12:32:06', null, '博士研究生', '7', '1');
INSERT INTO `dictionary` VALUES ('27', '2018-03-21 12:32:21', null, '硕士研究生', '7', '2');
INSERT INTO `dictionary` VALUES ('28', '2018-03-21 12:32:33', null, '大学本科', '7', '3');
INSERT INTO `dictionary` VALUES ('29', '2018-03-21 12:32:42', null, '专科', '7', '4');
INSERT INTO `dictionary` VALUES ('30', '2018-03-21 12:33:09', null, '专科以下', '7', '5');
INSERT INTO `dictionary` VALUES ('31', '2018-03-21 12:35:26', null, '专业领域', '0', '0');
INSERT INTO `dictionary` VALUES ('32', '2018-03-21 12:35:35', null, '哲学', '31', '1');
INSERT INTO `dictionary` VALUES ('33', '2018-03-21 12:35:46', null, '经济学', '31', '2');
INSERT INTO `dictionary` VALUES ('34', '2018-03-21 13:00:08', null, '学位', '0', '0');
INSERT INTO `dictionary` VALUES ('35', '2018-03-21 13:00:16', null, '博士', '34', '1');
INSERT INTO `dictionary` VALUES ('36', '2018-03-21 13:00:24', null, '硕士', '34', '2');
INSERT INTO `dictionary` VALUES ('37', '2018-03-21 13:00:32', null, '学士', '34', '3');
INSERT INTO `dictionary` VALUES ('38', '2018-03-21 13:00:48', null, '专业领域', '0', '0');
INSERT INTO `dictionary` VALUES ('39', '2018-03-21 13:00:59', null, '哲学', '38', '1');
INSERT INTO `dictionary` VALUES ('40', '2018-03-21 13:01:09', null, '经济学', '38', '2');
INSERT INTO `dictionary` VALUES ('41', '2018-03-21 13:01:17', null, '法学', '38', '3');
INSERT INTO `dictionary` VALUES ('42', '2018-03-21 13:01:30', null, '教育学', '38', '4');
INSERT INTO `dictionary` VALUES ('43', '2018-03-21 13:01:38', null, '文学', '38', '5');
INSERT INTO `dictionary` VALUES ('44', '2018-03-21 13:01:51', null, '历史学', '38', '6');
INSERT INTO `dictionary` VALUES ('45', '2018-03-21 13:02:06', null, '理学', '38', '7');
INSERT INTO `dictionary` VALUES ('46', '2018-03-21 13:02:18', null, '工学', '38', '8');
INSERT INTO `dictionary` VALUES ('47', '2018-03-21 13:02:27', null, '农学', '38', '9');
INSERT INTO `dictionary` VALUES ('48', '2018-03-21 13:02:41', null, '医学', '38', '10');
INSERT INTO `dictionary` VALUES ('49', '2018-03-21 13:02:54', null, '管理学', '38', '11');
INSERT INTO `dictionary` VALUES ('50', '2018-03-21 13:03:49', null, '行政单位级别', '0', '0');
INSERT INTO `dictionary` VALUES ('51', '2018-03-21 13:04:04', null, '国家级', '50', '1');
INSERT INTO `dictionary` VALUES ('52', '2018-03-21 13:04:15', null, '省部级', '50', '2');
INSERT INTO `dictionary` VALUES ('53', '2018-03-21 13:04:24', null, '地市级', '50', '3');
INSERT INTO `dictionary` VALUES ('54', '2018-03-21 13:04:42', null, '院校级', '50', '4');
INSERT INTO `dictionary` VALUES ('55', '2018-03-21 13:04:51', null, '无', '50', '5');
INSERT INTO `dictionary` VALUES ('56', '2018-03-21 13:06:01', null, '本人排名', '0', '0');
INSERT INTO `dictionary` VALUES ('57', '2018-03-21 13:06:11', null, '主持', '56', '1');
INSERT INTO `dictionary` VALUES ('58', '2018-03-21 13:06:36', null, '第二', '56', '2');
INSERT INTO `dictionary` VALUES ('59', '2018-03-21 13:06:47', null, '第三', '56', '3');
INSERT INTO `dictionary` VALUES ('60', '2018-03-21 13:07:08', null, '参与', '56', '4');
INSERT INTO `dictionary` VALUES ('61', '2018-03-21 13:39:14', null, '专利类型', '0', '0');
INSERT INTO `dictionary` VALUES ('62', '2018-03-21 13:39:30', null, '发明专利', '61', '1');
INSERT INTO `dictionary` VALUES ('63', '2018-03-21 13:39:50', null, '实用新型专利', '61', '2');
INSERT INTO `dictionary` VALUES ('64', '2018-03-21 13:40:12', null, '外观专利', '61', '3');
INSERT INTO `dictionary` VALUES ('65', '2018-03-21 13:40:23', null, '著作权', '61', '4');
INSERT INTO `dictionary` VALUES ('66', '2018-03-21 13:40:32', null, '课题性质', '0', '0');
INSERT INTO `dictionary` VALUES ('67', '2018-03-21 13:40:44', null, '教学改革', '66', '1');
INSERT INTO `dictionary` VALUES ('68', '2018-03-21 13:40:56', null, '技术开发', '66', '2');
INSERT INTO `dictionary` VALUES ('69', '2018-03-21 13:41:09', null, '社会科学', '66', '3');
INSERT INTO `dictionary` VALUES ('70', '2018-03-21 13:41:18', null, '其他', '66', '4');
INSERT INTO `dictionary` VALUES ('71', '2018-03-21 13:41:31', null, '主编参编', '0', '0');
INSERT INTO `dictionary` VALUES ('72', '2018-03-21 13:41:42', null, '主编', '71', '1');
INSERT INTO `dictionary` VALUES ('73', '2018-03-21 13:43:24', null, '参编', '71', '2');
INSERT INTO `dictionary` VALUES ('74', '2018-03-21 13:43:42', null, '刊物类别', '0', '0');
INSERT INTO `dictionary` VALUES ('75', '2018-03-21 13:43:50', null, 'SCI', '74', '1');
INSERT INTO `dictionary` VALUES ('76', '2018-03-21 13:44:43', null, 'EI', '74', '2');
INSERT INTO `dictionary` VALUES ('77', '2018-03-21 13:44:57', null, '核心期刊', '74', '3');
INSERT INTO `dictionary` VALUES ('78', '2018-03-21 13:45:08', null, '本科学报', '74', '4');
INSERT INTO `dictionary` VALUES ('79', '2018-03-21 13:45:16', null, 'CN刊物', '74', '5');
INSERT INTO `dictionary` VALUES ('80', '2018-04-15 17:29:09', null, '成果类型', '0', '0');
INSERT INTO `dictionary` VALUES ('81', '2018-04-15 17:29:35', null, '著作', '80', '0');
INSERT INTO `dictionary` VALUES ('82', '2018-04-15 17:29:44', null, '科研课题', '80', '1');
INSERT INTO `dictionary` VALUES ('83', '2018-05-09 02:05:02', null, '项目级别', '0', '0');
INSERT INTO `dictionary` VALUES ('84', '2018-05-09 02:06:06', null, '国家级', '83', '1');
INSERT INTO `dictionary` VALUES ('85', '2018-05-09 02:06:06', null, '省级', '83', '2');
INSERT INTO `dictionary` VALUES ('86', '2018-05-09 02:06:06', null, '厅级', '83', '3');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '2018-04-10 01:26:30', null, '20180104134309.jpg', '7f1da3ce7193349b2a954684a8ed4c9f', '86498');
INSERT INTO `file` VALUES ('2', '2018-04-10 01:26:30', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('3', '2018-04-10 01:57:25', null, '20180104134309.jpg', '7f1da3ce7193349b2a954684a8ed4c9f', '86498');
INSERT INTO `file` VALUES ('4', '2018-04-10 02:04:28', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('5', '2018-04-10 02:04:28', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('6', '2018-04-10 02:04:28', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('7', '2018-04-10 03:28:32', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('8', '2018-04-10 04:29:07', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('9', '2018-04-10 04:29:07', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('10', '2018-04-10 04:29:07', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('11', '2018-04-10 04:42:32', null, '53D237C24932712A43ED5F5A304D37A5.png', '53d237c24932712a43ed5f5a304d37a5', '92025');
INSERT INTO `file` VALUES ('12', '2018-04-10 04:42:32', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('13', '2018-04-10 04:42:32', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('14', '2018-04-10 04:42:32', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('15', '2018-04-10 04:42:32', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('16', '2018-04-10 04:43:40', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('17', '2018-04-10 04:43:40', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('18', '2018-04-10 04:48:03', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('19', '2018-04-10 04:48:03', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('20', '2018-04-10 04:48:03', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('21', '2018-04-10 05:08:15', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('22', '2018-04-10 05:11:37', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('23', '2018-04-10 05:11:52', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('24', '2018-04-10 05:13:01', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('25', '2018-04-10 05:13:31', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('26', '2018-04-10 05:31:46', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('27', '2018-04-10 05:31:46', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('28', '2018-04-10 05:31:46', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('29', '2018-04-10 05:32:03', null, '53D237C24932712A43ED5F5A304D37A5.png', '53d237c24932712a43ed5f5a304d37a5', '92025');
INSERT INTO `file` VALUES ('30', '2018-04-10 05:37:24', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('31', '2018-04-10 05:37:29', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('32', '2018-04-10 05:38:00', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('33', '2018-04-10 05:38:43', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('34', '2018-04-10 05:38:46', null, '53D237C24932712A43ED5F5A304D37A5.png', '53d237c24932712a43ed5f5a304d37a5', '92025');
INSERT INTO `file` VALUES ('35', '2018-04-10 05:38:49', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('36', '2018-04-10 05:47:52', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('37', '2018-04-10 05:57:15', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('38', '2018-04-10 05:57:26', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('39', '2018-04-10 05:57:26', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('40', '2018-04-10 05:57:26', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('41', '2018-04-10 05:59:38', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('42', '2018-04-10 05:59:38', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('43', '2018-04-10 06:01:02', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('44', '2018-04-10 06:03:03', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('45', '2018-04-10 06:03:03', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('46', '2018-04-10 06:03:03', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('47', '2018-04-10 06:03:28', null, 'desktop.ini', '29eae335b77f438e05594d86a6ca22ff', '504');
INSERT INTO `file` VALUES ('48', '2018-04-10 06:03:28', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('49', '2018-04-10 06:03:28', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('50', '2018-04-10 06:03:43', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('51', '2018-04-10 06:03:44', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('52', '2018-04-10 06:03:44', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('53', '2018-04-10 06:04:03', null, 'desktop.ini', '29eae335b77f438e05594d86a6ca22ff', '504');
INSERT INTO `file` VALUES ('54', '2018-04-10 06:04:03', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('55', '2018-04-10 06:04:21', null, 'desktop.ini', '29eae335b77f438e05594d86a6ca22ff', '504');
INSERT INTO `file` VALUES ('56', '2018-04-10 06:04:21', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('57', '2018-04-10 06:04:31', null, 'desktop.ini', '29eae335b77f438e05594d86a6ca22ff', '504');
INSERT INTO `file` VALUES ('58', '2018-04-10 06:04:40', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('59', '2018-04-10 06:04:47', null, '20180104134309.jpg', '7f1da3ce7193349b2a954684a8ed4c9f', '86498');
INSERT INTO `file` VALUES ('60', '2018-04-10 06:05:01', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('61', '2018-04-10 06:05:12', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('62', '2018-04-10 06:12:44', null, '53D237C24932712A43ED5F5A304D37A5.png', '53d237c24932712a43ed5f5a304d37a5', '92025');
INSERT INTO `file` VALUES ('63', '2018-04-10 06:12:44', null, '3112.jpg', 'b7f883846d21418fe0af632bf2a84019', '79997');
INSERT INTO `file` VALUES ('64', '2018-04-10 06:12:44', null, 'desktop.ini', '29eae335b77f438e05594d86a6ca22ff', '504');
INSERT INTO `file` VALUES ('65', '2018-04-10 06:12:44', null, '20180104133327.jpg', 'd8285913021cf333a1fb1904fcb512d6', '135870');
INSERT INTO `file` VALUES ('66', '2018-04-10 06:12:44', null, '12320180104134508.jpg', '366172235361f14ee06d91383a56c572', '94552');
INSERT INTO `file` VALUES ('67', '2018-04-10 06:12:44', null, '20180104134309.jpg', '7f1da3ce7193349b2a954684a8ed4c9f', '86498');
INSERT INTO `file` VALUES ('68', '2018-04-10 06:12:44', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('69', '2018-04-10 06:12:44', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('70', '2018-04-11 11:59:11', null, '鱼刺类_HTTPv5.0_版本17.zip', '5dddf73b12ce990dcfe8dac34a498844', '217831');
INSERT INTO `file` VALUES ('71', '2018-04-15 14:07:42', null, '百度网盘直接下载助手.user.js', '08457a58e9ecec6a543a9b3d07be9b5a', '90510');
INSERT INTO `file` VALUES ('72', '2018-04-15 17:00:41', null, '百度网盘直接下载助手.user.js', '08457a58e9ecec6a543a9b3d07be9b5a', '90510');
INSERT INTO `file` VALUES ('73', '2018-04-15 17:55:17', null, '百度网盘直接下载助手.user.js', '08457a58e9ecec6a543a9b3d07be9b5a', '90510');
INSERT INTO `file` VALUES ('74', '2018-04-16 20:43:07', null, '123.jpg', '6254422dcf2cec7ca9911dbd1ed8a5a8', '181100');
INSERT INTO `file` VALUES ('75', '2018-04-18 08:10:55', null, 'lab.obj', '94080de5257ecebe22f2f692495441fc', '40042');
INSERT INTO `file` VALUES ('76', '2018-04-18 08:11:45', null, '下载.png', '5f326d7a02cb34a17be639d02b383ad2', '2751');
INSERT INTO `file` VALUES ('77', '2018-04-18 08:14:06', null, '改密.bak', '02336114be714a6e8db039f78267e235', '6026');
INSERT INTO `file` VALUES ('78', '2018-04-18 08:23:52', null, 'TIM截图20180403164815.png', '21df0fb8e09d44d8186ae4e2f28be673', '54915');
INSERT INTO `file` VALUES ('79', '2018-05-06 09:38:34', null, 'Snipaste_2018-05-06_09-38-09.png', '6734d36dce588f84261a179830fb03e4', '13231');
INSERT INTO `file` VALUES ('80', '2018-05-06 09:38:46', null, 'Snipaste_2018-05-06_09-38-09.png', '6734d36dce588f84261a179830fb03e4', '13231');
INSERT INTO `file` VALUES ('81', '2018-05-07 13:21:36', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('82', '2018-05-07 13:26:05', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('83', '2018-05-07 13:28:30', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('84', '2018-05-07 13:28:44', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('85', '2018-05-07 14:04:13', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('86', '2018-05-07 14:06:16', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('87', '2018-05-07 14:23:07', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('88', '2018-05-07 14:35:15', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('89', '2018-05-07 14:39:39', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');
INSERT INTO `file` VALUES ('90', '2018-05-07 14:43:42', null, 'Snipaste_2018-05-07_13-21-01.png', '13ec40c70d15634ad72763cf02aebce6', '17243');

-- ----------------------------
-- Table structure for further_study
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of further_study
-- ----------------------------
INSERT INTO `further_study` VALUES ('1', '2018-04-06 05:36:09', '2018-05-07 14:41:28', '1231', '[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":47,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}},{\"fileName\":\"366172235361f14ee06d91383a56c572.jpg\",\"code\":200,\"file\":{\"id\":48,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"12320180104134508.jpg\",\"hash\":\"366172235361f14ee06d91383a56c572\",\"size\":94552}},{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":49,\"createdTime\":\"2018-04-10 06:03:28\",\"updatedTime\":\"2018-04-10 06:03:28\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}}]', '2018-04-06 00:00:00', '12312', '123126', '123', '12312', '2018-04-06 00:00:00', '5');

-- ----------------------------
-- Table structure for job_certificate
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_certificate
-- ----------------------------
INSERT INTO `job_certificate` VALUES ('1', '2018-04-09 04:20:14', '2018-05-07 11:54:21', '[{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":50,\"createdTime\":\"2018-04-10 06:03:43\",\"updatedTime\":\"2018-04-10 06:03:43\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}},{\"fileName\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"code\":200,\"file\":{\"id\":51,\"createdTime\":\"2018-04-10 06:03:44\",\"updatedTime\":\"2018-04-10 06:03:44\",\"fileName\":\"123.jpg\",\"hash\":\"6254422dcf2cec7ca9911dbd1ed8a5a8\",\"size\":181100}},{\"fileName\":\"d8285913021cf333a1fb1904fcb512d6.jpg\",\"code\":200,\"file\":{\"id\":52,\"createdTime\":\"2018-04-10 06:03:44\",\"updatedTime\":\"2018-04-10 06:03:44\",\"fileName\":\"20180104133327.jpg\",\"hash\":\"d8285913021cf333a1fb1904fcb512d6\",\"size\":135870}}]', '1231', '2018-04-09 00:00:00', '123', '12321', '5', '12321312666\n');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '2018-03-23 12:37:32', null, '123', '0', null, null);
INSERT INTO `menu` VALUES ('2', '2018-03-23 12:38:11', null, '1231', '0', null, null);
INSERT INTO `menu` VALUES ('3', '2018-03-23 14:26:49', null, '12312', '0', null, null);
INSERT INTO `menu` VALUES ('4', '2018-03-23 16:05:19', null, '123', '0', null, null);

-- ----------------------------
-- Table structure for menu_roles
-- ----------------------------
DROP TABLE IF EXISTS `menu_roles`;
CREATE TABLE `menu_roles` (
  `menu_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`roles_id`),
  UNIQUE KEY `UK_fytpsxrm17hws6r46eunc0csd` (`roles_id`),
  CONSTRAINT `FKauv6mbpeo296vhbm7avtoi3o8` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKq7k54hb6f3ngdbfpblwj68bhg` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_roles
-- ----------------------------

-- ----------------------------
-- Table structure for paper
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES ('6', '2018-04-01 05:02:41', '2018-05-07 13:21:39', '1312', '1231', '123', '2018-04-01 00:00:00', '57', '77', '6', '[{\"fileName\":\"13ec40c70d15634ad72763cf02aebce6.png\",\"code\":200,\"file\":{\"id\":81,\"createdTime\":\"2018-05-07 13:21:35\",\"updatedTime\":\"2018-05-07 13:21:35\",\"fileName\":\"Snipaste_2018-05-07_13-21-01.png\",\"hash\":\"13ec40c70d15634ad72763cf02aebce6\",\"size\":17243}}]', '123');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('2', '2018-04-01 03:30:17', null, '用户', '0', null, '/user/**');
INSERT INTO `permission` VALUES ('3', '2018-04-01 03:30:30', '2018-04-01 04:15:27', '权限', '0', null, '/permission/**');
INSERT INTO `permission` VALUES ('4', '2018-04-01 03:30:43', null, '角色', '0', null, '/role/**');
INSERT INTO `permission` VALUES ('5', '2018-04-01 03:31:12', '2018-04-01 04:59:24', '字典', '0', null, '/dictionary');
INSERT INTO `permission` VALUES ('6', '2018-04-01 03:31:27', null, '系部', '0', null, '/department/**');
INSERT INTO `permission` VALUES ('7', '2018-04-01 03:31:39', null, '班级', '0', null, '/class/**');
INSERT INTO `permission` VALUES ('14', '2018-04-01 04:22:34', '2018-04-01 04:48:28', '教师', '0', null, '/teacher');
INSERT INTO `permission` VALUES ('15', '2018-04-01 04:23:13', null, '保存', '14', null, '/teacher/save');
INSERT INTO `permission` VALUES ('16', '2018-04-01 04:24:09', null, '数据审核', '14', null, '/teacher/');
INSERT INTO `permission` VALUES ('17', '2018-04-01 04:24:31', null, '读取', '14', null, '/teacher/list');
INSERT INTO `permission` VALUES ('18', '2018-04-01 04:59:50', null, '保存', '5', null, '/dictionary/save');
INSERT INTO `permission` VALUES ('19', '2018-04-01 05:00:13', null, '读取', '5', null, '/dictionary/list');
INSERT INTO `permission` VALUES ('20', '2018-04-01 05:00:39', null, '浏览页', '5', null, '/dictionary/');

-- ----------------------------
-- Table structure for post_workout
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_workout
-- ----------------------------
INSERT INTO `post_workout` VALUES ('1', '2018-04-09 04:49:29', '2018-05-08 22:15:00', '[{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":54,\"createdTime\":\"2018-04-10 06:04:03\",\"updatedTime\":\"2018-04-10 06:04:03\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}},{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":53,\"createdTime\":\"2018-04-10 06:04:03\",\"updatedTime\":\"2018-04-10 06:04:03\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}}]', '1231', '2018-04-11 00:00:00', '2312', '', '2018-04-09 00:00:00', '52', '5');
INSERT INTO `post_workout` VALUES ('2', '2018-04-09 04:54:03', null, '[]', '123', '2018-04-09 00:00:00', '1231', '', '2018-04-09 00:00:00', '53', '5');

-- ----------------------------
-- Table structure for publishing_books
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publishing_books
-- ----------------------------
INSERT INTO `publishing_books` VALUES ('1', '2018-04-09 04:54:18', '2018-05-09 09:18:35', '12312', '[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":55,\"createdTime\":\"2018-04-10 06:04:21\",\"updatedTime\":\"2018-04-10 06:04:21\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}},{\"fileName\":\"21df0fb8e09d44d8186ae4e2f28be673.png\",\"code\":200,\"file\":{\"id\":56,\"createdTime\":\"2018-04-10 06:04:21\",\"updatedTime\":\"2018-04-10 06:04:21\",\"fileName\":\"TIM截图20180403164815.png\",\"hash\":\"21df0fb8e09d44d8186ae4e2f28be673\",\"size\":54915}}]', '123', '12312', '2018-04-09 00:00:00', '123', '59', '5');

-- ----------------------------
-- Table structure for report_data
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report_data
-- ----------------------------
INSERT INTO `report_data` VALUES ('5', '2018-04-28 09:19:52', '2018-04-28 09:19:52', '10', '0', '{\"birthday\":\"2018-03-29\",\"qq\":\"12312\",\"education\":\"博士研究生\",\"sex\":\"男\",\"mobile\":\"17683912590\",\"degree\":\"博士\",\"fullName\":\"中文\",\"zc\":\"讲师\",\"gxzg\":true,\"zyly\":\"哲学\",\"zytc\":\"\",\"ggjs\":false,\"verify\":true,\"departments\":\"123\",\"job\":\"1231\",\"department\":\"计算机系\",\"user\":{\"accountNonExpired\":true,\"accountNonLocked\":true,\"authorities\":[{\"authority\":\"管理员\"}],\"createdTime\":1520742207000,\"credentialsNonExpired\":true,\"enabled\":true,\"id\":1,\"lastLoginTime\":1524878372000,\"password\":\"$2a$10$N7Ws5GyACowKSFVSUQMX5.G6tEVuukexgAEtcdr3vYPL.L/zlhUwq\",\"roles\":[{\"createdTime\":1518158705000,\"id\":1,\"name\":\"管理员\",\"permissions\":[{\"createdTime\":1522524643000,\"id\":4,\"name\":\"角色\",\"pid\":0,\"url\":\"/role/**\"},{\"createdTime\":1522530039000,\"id\":20,\"name\":\"浏览页\",\"pid\":5,\"url\":\"/dictionary/\"},{\"createdTime\":1522524687000,\"id\":6,\"name\":\"系部\",\"pid\":0,\"url\":\"/department/**\"},{\"createdTime\":1522530013000,\"id\":19,\"name\":\"读取\",\"pid\":5,\"url\":\"/dictionary/list\"},{\"createdTime\":1522527793000,\"id\":15,\"name\":\"保存\",\"pid\":14,\"url\":\"/teacher/save\"},{\"createdTime\":1522527849000,\"id\":16,\"name\":\"数据审核\",\"pid\":14,\"url\":\"/teacher/\"},{\"createdTime\":1522524617000,\"id\":2,\"name\":\"用户\",\"pid\":0,\"url\":\"/user/**\"},{\"createdTime\":1522524672000,\"id\":5,\"name\":\"字典\",\"pid\":0,\"updatedTime\":1522529964000,\"url\":\"/dictionary\"},{\"createdTime\":1522524630000,\"id\":3,\"name\":\"权限\",\"pid\":0,\"updatedTime\":1522527327000,\"url\":\"/permission/**\"},{\"createdTime\":1522529990000,\"id\":18,\"name\":\"保存\",\"pid\":5,\"url\":\"/dictionary/save\"},{\"createdTime\":1522527871000,\"id\":17,\"name\":\"读取\",\"pid\":14,\"url\":\"/teacher/list\"},{\"createdTime\":1522524699000,\"id\":7,\"name\":\"班级\",\"pid\":0,\"url\":\"/class/**\"},{\"createdTime\":1522527754000,\"id\":14,\"name\":\"教师\",\"pid\":0,\"updatedTime\":1522529308000,\"url\":\"/teacher\"}]}],\"state\":2,\"teacher\":{\"annex\":\"6254422dcf2cec7ca9911dbd1ed8a5a8.jpg\",\"birthday\":1522252800000,\"createdTime\":1522325571000,\"degree\":{\"createdTime\":1521608416000,\"id\":35,\"name\":\"博士\",\"parentName\":\"学位\",\"pid\":34,\"value\":1},\"department\":{\"createdTime\":1522192169000,\"id\":1,\"name\":\"计算机系\",\"updatedTime\":1524036128000},\"departments\":{\"createdTime\":1522303053000,\"department\":{\"$ref\":\"$.user.teacher.department\"},\"id\":1,\"name\":\"123\"},\"education\":{\"createdTime\":1521606726000,\"id\":26,\"name\":\"博士研究生\",\"parentName\":\"学历\",\"pid\":7,\"value\":1},\"email\":\"1231@qq.com\",\"fullName\":\"中文\",\"ggjs\":false,\"gxzg\":true,\"id\":5,\"job\":\"1231\",\"jobNumber\":\"123\",\"mobile\":\"17683912590\",\"pyxz\":{\"createdTime\":1521606548000,\"id\":23,\"name\":\"在编\",\"parentName\":\"聘用性质\",\"pid\":22,\"value\":1},\"qq\":\"12312\",\"sex\":{\"createdTime\":1518160637000,\"id\":5,\"name\":\"男\",\"parentName\":\"性别\",\"pid\":4,\"value\":0},\"ssjs\":false,\"updatedTime\":1523882590000,\"user\":{\"$ref\":\"..\"},\"verify\":true,\"zc\":{\"createdTime\":1518161017000,\"id\":20,\"name\":\"讲师\",\"parentName\":\"职称\",\"pid\":17,\"value\":2},\"zyly\":{\"createdTime\":1521606935000,\"id\":32,\"name\":\"哲学\",\"parentName\":\"专业领域\",\"pid\":31,\"value\":1},\"zytc\":\"\"},\"updatedTime\":1524878372000,\"userState\":\"正常\",\"username\":\"admin\"},\"email\":\"1231@qq.com\",\"jobNumber\":\"123\",\"ssjs\":false,\"pyxz\":\"在编\"}', '{\"name\":\"12321\",\"getDate\":\"2018-04-09\",\"level\":\"123\",\"fzdw\":\"1231\"}', null);

-- ----------------------------
-- Table structure for report_form
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report_form
-- ----------------------------
INSERT INTO `report_form` VALUES ('10', '2018-04-26 18:53:51', '2018-04-28 09:15:37', '1231', '555333', '[\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', 'JobCertificate', '[\"29\",\"30\",\"31\",\"32\"]', '', '0', '0', null);
INSERT INTO `report_form` VALUES ('11', '2018-04-27 17:12:44', '2018-04-27 23:00:03', '888', '8888', '[\"4\",\"5\",\"6\",\"10\",\"11\"]', 'ServiceProject', '[\"107\",\"108\",\"109\",\"110\",\"111\",\"112\",\"113\",\"114\",\"115\",\"116\",\"117\",\"118\",\"119\",\"120\",\"121\"]', '', '0', '0', null);

-- ----------------------------
-- Table structure for research_subject
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of research_subject
-- ----------------------------
INSERT INTO `research_subject` VALUES ('1', '2018-04-09 04:54:29', '2018-05-08 15:40:52', '[{\"fileName\":\"29eae335b77f438e05594d86a6ca22ff.ini\",\"code\":200,\"file\":{\"id\":57,\"createdTime\":\"2018-04-10 06:04:31\",\"updatedTime\":\"2018-04-10 06:04:31\",\"fileName\":\"desktop.ini\",\"hash\":\"29eae335b77f438e05594d86a6ca22ff\",\"size\":504}}]', '2018-04-09 00:00:00', '123', '123412', '1231', '21', '12312', '59', '68', '5');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '2018-02-09 14:45:05', null, '管理员');
INSERT INTO `role` VALUES ('2', '2018-02-09 14:45:06', null, '教师');
INSERT INTO `role` VALUES ('3', '2018-02-09 14:45:06', null, '学生');

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL,
  `permissions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permissions_id`),
  KEY `FKa1duuqu7fiw2v9r5va5esghd5` (`permissions_id`),
  CONSTRAINT `FK4hrolwj4ned5i7qe8kyiaak6m` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKa1duuqu7fiw2v9r5va5esghd5` FOREIGN KEY (`permissions_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES ('1', '2');
INSERT INTO `roles_permissions` VALUES ('1', '3');
INSERT INTO `roles_permissions` VALUES ('1', '4');
INSERT INTO `roles_permissions` VALUES ('1', '5');
INSERT INTO `roles_permissions` VALUES ('2', '5');
INSERT INTO `roles_permissions` VALUES ('3', '5');
INSERT INTO `roles_permissions` VALUES ('1', '6');
INSERT INTO `roles_permissions` VALUES ('2', '6');
INSERT INTO `roles_permissions` VALUES ('3', '6');
INSERT INTO `roles_permissions` VALUES ('1', '7');
INSERT INTO `roles_permissions` VALUES ('2', '7');
INSERT INTO `roles_permissions` VALUES ('3', '7');
INSERT INTO `roles_permissions` VALUES ('1', '14');
INSERT INTO `roles_permissions` VALUES ('2', '14');
INSERT INTO `roles_permissions` VALUES ('1', '15');
INSERT INTO `roles_permissions` VALUES ('2', '15');
INSERT INTO `roles_permissions` VALUES ('1', '16');
INSERT INTO `roles_permissions` VALUES ('1', '17');
INSERT INTO `roles_permissions` VALUES ('2', '17');
INSERT INTO `roles_permissions` VALUES ('1', '18');
INSERT INTO `roles_permissions` VALUES ('1', '19');
INSERT INTO `roles_permissions` VALUES ('2', '19');
INSERT INTO `roles_permissions` VALUES ('1', '20');

-- ----------------------------
-- Table structure for service_project
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_project
-- ----------------------------
INSERT INTO `service_project` VALUES ('1', '2018-04-18 08:05:50', '2018-05-07 12:29:25', '213', '1231', '123', '123', '123', '[{\"fileName\":\"94080de5257ecebe22f2f692495441fc.obj\",\"code\":200,\"file\":{\"id\":75,\"createdTime\":\"2018-04-18 08:10:55\",\"updatedTime\":\"2018-04-18 08:10:55\",\"fileName\":\"lab.obj\",\"hash\":\"94080de5257ecebe22f2f692495441fc\",\"size\":40042}},{\"fileName\":\"5f326d7a02cb34a17be639d02b383ad2.png\",\"code\":200,\"file\":{\"id\":76,\"createdTime\":\"2018-04-18 08:11:45\",\"updatedTime\":\"2018-04-18 08:11:45\",\"fileName\":\"下载.png\",\"hash\":\"5f326d7a02cb34a17be639d02b383ad2\",\"size\":2751}}]', '111', '123', '123', '123', '12312', '123', '123111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '123', '123', '81', '57', '6');

-- ----------------------------
-- Table structure for social_work
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of social_work
-- ----------------------------
INSERT INTO `social_work` VALUES ('1', '2018-04-09 04:54:38', '2018-05-08 22:09:57', '[]', '12312', '2018-04-01 00:00:00', '1231', '214124', '2018-04-13 00:00:00', '5');

-- ----------------------------
-- Table structure for student_award
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_award
-- ----------------------------
INSERT INTO `student_award` VALUES ('1', '2018-04-18 08:13:29', '2018-04-18 08:14:07', '[{\"fileName\":\"02336114be714a6e8db039f78267e235.bak\",\"code\":200,\"file\":{\"id\":77,\"createdTime\":\"2018-04-18 08:14:06\",\"updatedTime\":\"2018-04-18 08:14:06\",\"fileName\":\"改密.bak\",\"hash\":\"02336114be714a6e8db039f78267e235\",\"size\":6026}}]', 'qweqw', '1231', '12312', null, '123', '12312', '53', '59', '5');

-- ----------------------------
-- Table structure for subject_build
-- ----------------------------
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

-- ----------------------------
-- Records of subject_build
-- ----------------------------

-- ----------------------------
-- Table structure for tclass
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tclass
-- ----------------------------
INSERT INTO `tclass` VALUES ('1', '2018-03-29 13:59:19', null, '2010', '112312', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('5', '2018-03-29 20:12:51', '2018-05-09 09:22:31', '2018-05-25 00:00:00', '1231@qq.com', '中文', '\0', '', '1231', '123', '17683912590', '12312', '\0', '', '35', '26', null, '23', '5', '32', null, '1', '1', '\0', '', '20');
INSERT INTO `teacher` VALUES ('6', '2018-04-01 04:57:13', null, '2018-04-01 00:00:00', '22113@qq.com', '胡了了', '\0', '\0', '12312', '12313', '18986324133', '1231231', '\0', '', '37', '28', null, '24', '6', '41', '4', '1', '1', '', null, '18');
INSERT INTO `teacher` VALUES ('7', '2018-04-18 08:24:28', null, '2018-04-18 00:00:00', '12312@qq.com', '小甜瓜', '', '', '12312', '12313', '17683912590', '1021515457', '', '12312', '36', '27', null, '25', '5', '43', '3', '1', '1', '\0', '21df0fb8e09d44d8186ae4e2f28be673.png', '20');
INSERT INTO `teacher` VALUES ('17', '2018-04-18 16:32:06', null, '2017-01-02 00:00:00', 'chen@163.com', '陈', '', '', '无', '110110', '13960', '123456', '', '软件', '37', '28', null, '23', '5', '46', '24', '1', '2', '\0', null, '20');
INSERT INTO `teacher` VALUES ('18', '2018-04-18 18:32:25', '2018-04-19 15:18:51', '2017-01-02 00:00:00', 'chen@163.com', '陈', '', '', '无', '110110', '18972254546', '123456', '', '软件', '37', '28', null, '23', '5', '46', null, '1', '2', '\0', '', '18');

-- ----------------------------
-- Table structure for teacher_field
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_field
-- ----------------------------
INSERT INTO `teacher_field` VALUES ('3', null, null, '基本资料', 'teacher', 'Teacher', '出生年月', 'birthday', 'birthday', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('4', null, null, '基本资料', 'teacher', 'Teacher', '邮箱', 'email', 'email', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('5', null, null, '基本资料', 'teacher', 'Teacher', '姓名', 'full_name', 'fullName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('6', null, null, '基本资料', 'teacher', 'Teacher', '骨干教师', 'ggjs', 'ggjs', '是否', 'bit');
INSERT INTO `teacher_field` VALUES ('7', null, null, '基本资料', 'teacher', 'Teacher', '高校资格', 'gxzg', 'gxzg', '是否', 'bit');
INSERT INTO `teacher_field` VALUES ('8', null, null, '基本资料', 'teacher', 'Teacher', '职务', 'job', 'job', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('9', null, null, '基本资料', 'teacher', 'Teacher', '工号', 'job_number', 'jobNumber', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('10', null, null, '基本资料', 'teacher', 'Teacher', '手机号', 'mobile', 'mobile', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('11', null, null, '基本资料', 'teacher', 'Teacher', 'QQ号', 'qq', 'qq', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('12', null, null, '基本资料', 'teacher', 'Teacher', '双师教师', 'ssjs', 'ssjs', '是否', 'bit');
INSERT INTO `teacher_field` VALUES ('13', null, null, '基本资料', 'teacher', 'Teacher', '专业特长', 'zytc', 'zytc', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('14', null, null, '基本资料', 'teacher', 'Teacher', '学位', 'degree_id', 'degree', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('15', null, null, '基本资料', 'teacher', 'Teacher', '学历', 'education_id', 'education', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('16', null, null, '基本资料', 'teacher', 'Teacher', '教学名师', 'jxms_id', 'jxms_id', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('17', null, null, '基本资料', 'teacher', 'Teacher', '聘用性质', 'pyxz_id', 'pyxz', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('18', null, null, '基本资料', 'teacher', 'Teacher', '性别', 'sex_id', 'sex', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('19', null, null, '基本资料', 'teacher', 'Teacher', '专业领域', 'zyly_id', 'zyly', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('20', null, null, '基本资料', 'teacher', 'Teacher', '用户编号', 'user_id', 'user', '对象', 'bigint');
INSERT INTO `teacher_field` VALUES ('21', null, null, '基本资料', 'teacher', 'Teacher', '所属系部', 'department_id', 'department', '对象', 'bigint');
INSERT INTO `teacher_field` VALUES ('22', null, null, '基本资料', 'teacher', 'Teacher', '所属部门', 'departments_id', 'departments', '对象', 'bigint');
INSERT INTO `teacher_field` VALUES ('23', null, null, '基本资料', 'teacher', 'Teacher', '启用', 'verify', 'verify', '是否', 'bit');
INSERT INTO `teacher_field` VALUES ('24', null, null, '基本资料', 'teacher', 'Teacher', '职称', 'zc_id', 'zc', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('25', null, null, '专业技术职务', 'technical_posts', 'TechnicalPosts', '发证单位', 'fzdw', 'fzdw', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('26', null, null, '专业技术职务', 'technical_posts', 'TechnicalPosts', '获取日期', 'get_date', 'getDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('27', null, null, '专业技术职务', 'technical_posts', 'TechnicalPosts', '等级', 'level', 'level', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('28', null, null, '专业技术职务', 'technical_posts', 'TechnicalPosts', '名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('29', null, null, '职业资格证书', 'job_certificate', 'JobCertificate', '发证单位', 'fzdw', 'fzdw', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('30', null, null, '职业资格证书', 'job_certificate', 'JobCertificate', '获取日期', 'get_date', 'getDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('31', null, null, '职业资格证书', 'job_certificate', 'JobCertificate', '等级', 'level', 'level', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('32', null, null, '职业资格证书', 'job_certificate', 'JobCertificate', '名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('33', null, null, '进修学习', 'further_study', 'FurtherStudy', '进修学历', 'advanced_degree', 'advancedDegree', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('34', null, null, '进修学习', 'further_study', 'FurtherStudy', '完成时间', 'complete_time', 'completeTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('35', null, null, '进修学习', 'further_study', 'FurtherStudy', '进修学位', 'further_education', 'furtherEducation', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('36', null, null, '进修学习', 'further_study', 'FurtherStudy', '专业名称', 'professional_title', 'professionalTitle', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('37', null, null, '进修学习', 'further_study', 'FurtherStudy', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('38', null, null, '进修学习', 'further_study', 'FurtherStudy', '进修学校', 'study_school', 'studySchool', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('39', null, null, '进修学习', 'further_study', 'FurtherStudy', '进修时间', 'training_time', 'trainingTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('40', null, null, '培训学习', 'training', 'Training', '完成时间', 'complete_time', 'completeTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('41', null, null, '培训学习', 'training', 'Training', '获取证书', 'getacertificate', 'getACertificate', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('42', null, null, '培训学习', 'training', 'Training', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('43', null, null, '培训学习', 'training', 'Training', '培训名称', 'training_name', 'trainingName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('44', null, null, '培训学习', 'training', 'Training', '培训时间', 'training_period', 'trainingPeriod', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('45', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '单位名称', 'company_name', 'companyName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('46', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '结束时间', 'end_time', 'endTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('47', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '岗位', 'job', 'job', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('48', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('49', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '开始时间', 'starting_time', 'startingTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('50', null, null, '挂职锻炼', 'post_workout', 'PostWorkout', '派出部门', 'dispatch_department_id', 'dispatchDepartment', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('51', null, null, '社会兼职', 'social_work', 'SocialWork', '公司名称', 'company_name', 'companyName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('52', null, null, '社会兼职', 'social_work', 'SocialWork', '结束时间', 'end_time', 'endTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('53', null, null, '社会兼职', 'social_work', 'SocialWork', '岗位', 'job', 'job', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('54', null, null, '社会兼职', 'social_work', 'SocialWork', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('55', null, null, '社会兼职', 'social_work', 'SocialWork', '开始时间', 'starting_time', 'startingTime', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('56', null, null, '获奖荣誉', 'awards', 'Awards', '获奖金额', 'award_amount', 'awardAmount', '数字', 'int');
INSERT INTO `teacher_field` VALUES ('57', null, null, '获奖荣誉', 'awards', 'Awards', '获奖名称', 'awarded_name', 'awardedName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('58', null, null, '获奖荣誉', 'awards', 'Awards', '颁奖单位', 'awarding_unit', 'awardingUnit', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('59', null, null, '获奖荣誉', 'awards', 'Awards', '获奖日期', 'get_date', 'getDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('60', null, null, '获奖荣誉', 'awards', 'Awards', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('61', null, null, '获奖荣誉', 'awards', 'Awards', '获奖级别', 'award_level_id', 'awardLevel', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('62', null, null, '获奖荣誉', 'awards', 'Awards', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('63', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '获取日期', 'get_date', 'getDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('64', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('65', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '专利编号', 'number', 'number', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('66', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('67', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('68', null, null, '技术专利', 'technology_patent', 'TechnologyPatent', '专利类型', 'patent_type_id', 'patentType', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('69', null, null, '科研课题', 'research_subject', 'ResearchSubject', '立项日期', 'date_of_establishment', 'dateOfEstablishment', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('70', null, null, '科研课题', 'research_subject', 'ResearchSubject', '名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('71', null, null, '科研课题', 'research_subject', 'ResearchSubject', '立项编号', 'project_number', 'projectNumber', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('72', null, null, '科研课题', 'research_subject', 'ResearchSubject', '项目来源', 'project_source', 'projectSource', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('73', null, null, '科研课题', 'research_subject', 'ResearchSubject', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('74', null, null, '科研课题', 'research_subject', 'ResearchSubject', '到款金额', 'the_amount_of_money', 'theAmountOfMoney', '数字', 'int');
INSERT INTO `teacher_field` VALUES ('75', null, null, '科研课题', 'research_subject', 'ResearchSubject', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('76', null, null, '科研课题', 'research_subject', 'ResearchSubject', '项目性质', 'nature_of_the_project_id', 'natureOfTheProject', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('77', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', 'ISBN号', 'isbn', 'isbn', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('78', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', '出版物名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('79', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', '出版社', 'press', 'press', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('80', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', '出版日期', 'publication_date', 'publicationDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('81', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('82', null, null, '出版书籍教材', 'publishing_books', 'PublishingBooks', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('83', null, null, '论文', 'paper', 'Paper', '刊号', 'issue_number', 'issueNumber', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('84', null, null, '论文', 'paper', 'Paper', '刊物学报名称', 'journal_of_publications', 'journalOfPublications', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('85', null, null, '论文', 'paper', 'Paper', '论文名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('86', null, null, '论文', 'paper', 'Paper', '发表日期', 'publication_date', 'publicationDate', '日期时间', 'datetime');
INSERT INTO `teacher_field` VALUES ('87', null, null, '论文', 'paper', 'Paper', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('88', null, null, '论文', 'paper', 'Paper', '刊物类别', 'publication_category_id', 'publicationCategory', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('89', null, null, '课程建设项目', 'course_build', 'CourseBuild', '课程名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('90', null, null, '课程建设项目', 'course_build', 'CourseBuild', '级别', 'level_id', 'level', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('91', null, null, '课程建设项目', 'course_build', 'CourseBuild', '相关文件名称', 'related_file_name', 'relatedFileName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('92', null, null, '课程建设项目', 'course_build', 'CourseBuild', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('93', null, null, '实训基地建设', 'train_build', 'TrainBuild', '实训基地名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('94', null, null, '实训基地建设', 'train_build', 'TrainBuild', '相关文件名称', 'related_file_name', 'relatedFileName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('95', null, null, '实训基地建设', 'train_build', 'TrainBuild', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('96', null, null, '实训基地建设', 'train_build', 'TrainBuild', '级别', 'level_id', 'level', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('97', null, null, '专业建设', 'subject_build', 'SubjectBuild', '建设项目名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('98', null, null, '专业建设', 'subject_build', 'SubjectBuild', '相关文件名称', 'related_file_name', 'relatedFileName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('99', null, null, '专业建设', 'subject_build', 'SubjectBuild', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('100', null, null, '学生获奖', 'student_award', 'StudentAward', '获奖年度', 'award_year', 'awardYear', '数字', 'int');
INSERT INTO `teacher_field` VALUES ('101', null, null, '学生获奖', 'student_award', 'StudentAward', '颁奖单位', 'awarding_unit', 'awardingUnit', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('102', null, null, '学生获奖', 'student_award', 'StudentAward', '获奖名称', 'name', 'name', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('103', null, null, '学生获奖', 'student_award', 'StudentAward', '备注', 'remark', 'remark', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('104', null, null, '学生获奖', 'student_award', 'StudentAward', '获奖学生', 'student', 'student', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('105', null, null, '学生获奖', 'student_award', 'StudentAward', '获奖级别', 'level_id', 'level', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('106', null, null, '学生获奖', 'student_award', 'StudentAward', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('107', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '项目名称', 'project_name', 'projectName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('108', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '承担单位或部门', 'project_institution', 'projectInstitution', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('109', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '依托机构或团队', 'project_team', 'projectTeam', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('110', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '本人排名', 'my_ranking_id', 'myRanking', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('111', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '其他成员', 'other_member', 'otherMember', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('112', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '合作单位', 'cooperation_institution', 'cooperationInstitution', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('113', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '项目内容', 'project_content', 'projectContent', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('114', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '项目相关文件', 'project_official_document', 'projectOfficialDocument', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('115', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '合同金额', 'contract_money', 'contractMoney', '数字', 'int');
INSERT INTO `teacher_field` VALUES ('116', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果名称', 'achievement_name', 'achievementName', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('117', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果类型', 'achievement_type', 'achievementType', '字典', 'bigint');
INSERT INTO `teacher_field` VALUES ('118', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果权利人', 'achievement_owner', 'achievementOwner', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('119', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果内容', 'achievement_content', 'achievementContent', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('120', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果归属', 'achievement_adscription', 'achievementAdscription', '文本', 'varchar');
INSERT INTO `teacher_field` VALUES ('121', null, null, '社会技术服务项目', 'service_project', 'ServiceProject', '成果相关文件', 'achievement_official_document', 'achievementOfficialDocument', '文本', 'varchar');

-- ----------------------------
-- Table structure for technical_posts
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technical_posts
-- ----------------------------
INSERT INTO `technical_posts` VALUES ('1', '2018-04-09 04:54:47', '2018-05-07 12:01:12', '[{\"fileName\":\"7f1da3ce7193349b2a954684a8ed4c9f.jpg\",\"code\":200,\"file\":{\"id\":59,\"createdTime\":\"2018-04-10 06:04:47\",\"updatedTime\":\"2018-04-10 06:04:47\",\"fileName\":\"20180104134309.jpg\",\"hash\":\"7f1da3ce7193349b2a954684a8ed4c9f\",\"size\":86498}}]', '123', '2018-04-09 00:00:00', '134123', '12312', '5', '123');

-- ----------------------------
-- Table structure for technology_patent
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology_patent
-- ----------------------------
INSERT INTO `technology_patent` VALUES ('1', '2018-04-01 04:57:37', null, null, '2018-04-01 00:00:00', '1231', '12341', '', '57', '62', '6');
INSERT INTO `technology_patent` VALUES ('2', '2018-04-09 04:54:55', '2018-04-10 06:05:04', '[{\"fileName\":\"b7f883846d21418fe0af632bf2a84019.jpg\",\"code\":200,\"file\":{\"id\":60,\"createdTime\":\"2018-04-10 06:05:01\",\"updatedTime\":\"2018-04-10 06:05:01\",\"fileName\":\"3112.jpg\",\"hash\":\"b7f883846d21418fe0af632bf2a84019\",\"size\":79997}}]', '2018-04-09 00:00:00', '12312', '12312', '', '59', '64', '5');

-- ----------------------------
-- Table structure for train_build
-- ----------------------------
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

-- ----------------------------
-- Records of train_build
-- ----------------------------

-- ----------------------------
-- Table structure for training
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of training
-- ----------------------------
INSERT INTO `training` VALUES ('1', '2018-04-01 04:57:28', '2018-05-09 09:18:47', '[{\"fileName\":\"366172235361f14ee06d91383a56c572.jpg\",\"code\":200,\"file\":{\"id\":61,\"createdTime\":\"2018-04-10 06:05:12\",\"updatedTime\":\"2018-04-10 06:05:12\",\"fileName\":\"12320180104134508.jpg\",\"hash\":\"366172235361f14ee06d91383a56c572\",\"size\":94552}},{\"fileName\":\"08457a58e9ecec6a543a9b3d07be9b5a.js\",\"code\":200,\"file\":{\"id\":71,\"createdTime\":\"2018-04-15 14:07:42\",\"updatedTime\":\"2018-04-15 14:07:42\",\"fileName\":\"百度网盘直接下载助手.user.js\",\"hash\":\"08457a58e9ecec6a543a9b3d07be9b5a\",\"size\":90510}}]', '2018-04-01 00:00:00', '1231', '123', '123', '2018-04-01 00:00:00', '6');
INSERT INTO `training` VALUES ('2', '2018-04-09 04:55:59', '2018-04-09 04:56:08', '', '2018-04-09 00:00:00', '12312', '', '1231', '2018-04-09 00:00:00', '5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2018-03-11 12:23:27', '2018-05-09 11:11:17', '2018-05-09 11:11:17', '$2a$10$N7Ws5GyACowKSFVSUQMX5.G6tEVuukexgAEtcdr3vYPL.L/zlhUwq', '2', 'admin');
INSERT INTO `user` VALUES ('3', '2018-03-11 12:34:10', '2018-04-18 10:06:08', '2018-04-18 10:06:08', '$2a$10$qQ2rZFmQ/OzAFhMdpR4JEu0mJLMTLJwKA1BFkRE39DFpRiV.TRwc.', '2', 'test123');
INSERT INTO `user` VALUES ('4', '2018-04-01 04:53:06', '2018-04-18 11:52:22', '2018-04-18 11:52:22', '$2a$10$/opgE1aCvpl.nHWWtFtsNevFKtb9z0FVa9RRxgWP0450yj/AwfmkK', '2', 'test333');
INSERT INTO `user` VALUES ('24', '2018-04-18 16:32:06', '2018-04-18 16:32:19', '2018-04-18 16:32:19', '$2a$10$yCpVJDvJgoTINscMkNaaHeFuBkm4QNPBzSNMgJ9fK1Mkh5YOxWV2u', '2', 'chen');
INSERT INTO `user` VALUES ('26', '2018-04-18 18:32:25', null, null, '$2a$10$GBINQhJjM/tXli1wPmCKTu.sCGvXstLr1h.2.VuyUgVBKlNRIDZSu', '2', 'chenad');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', '1');
INSERT INTO `user_roles` VALUES ('3', '2');
INSERT INTO `user_roles` VALUES ('4', '2');
INSERT INTO `user_roles` VALUES ('24', '2');
INSERT INTO `user_roles` VALUES ('26', '2');
