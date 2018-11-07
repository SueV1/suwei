/*
Navicat MySQL Data Transfer

Source Server         : school
Source Server Version : 50638
Source Host           : localhost:3306
Source Database       : membership

Target Server Type    : MYSQL
Target Server Version : 50638
File Encoding         : 65001

Date: 2018-11-06 08:48:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accelerator`
-- ----------------------------
DROP TABLE IF EXISTS `accelerator`;
CREATE TABLE `accelerator` (
  `id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `platform_name` varchar(30) NOT NULL,
  `hour_rent` decimal(5,2) DEFAULT '0.00',
  `day_rent` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `accelerator_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accelerator
-- ----------------------------

-- ----------------------------
-- Table structure for `accelerator_account`
-- ----------------------------
DROP TABLE IF EXISTS `accelerator_account`;
CREATE TABLE `accelerator_account` (
  `id` int(10) NOT NULL,
  `accelerator_id` int(10) NOT NULL,
  `account` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `service` int(1) DEFAULT '0',
  `date_buy` date DEFAULT '0000-00-00',
  `date_expire` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `accelerator_id` (`accelerator_id`),
  CONSTRAINT `accelerator_account_ibfk_1` FOREIGN KEY (`accelerator_id`) REFERENCES `accelerator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accelerator_account
-- ----------------------------

-- ----------------------------
-- Table structure for `download`
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `platform_name` varchar(30) NOT NULL,
  `hour_rent` decimal(5,2) DEFAULT '0.00',
  `day_rent` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `download_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for `download_account`
-- ----------------------------
DROP TABLE IF EXISTS `download_account`;
CREATE TABLE `download_account` (
  `id` int(10) NOT NULL,
  `down_id` int(10) NOT NULL,
  `account` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `service` int(1) DEFAULT '0',
  `date_buy` date DEFAULT '0000-00-00',
  `date_expire` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `down_id` (`down_id`),
  CONSTRAINT `download_account_ibfk_1` FOREIGN KEY (`down_id`) REFERENCES `download` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of download_account
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `photo_path` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_name` (`manager_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) NOT NULL,
  `platform_name` varchar(30) NOT NULL,
  `hour_rent` decimal(5,2) DEFAULT '0.00',
  `day_rent` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_plat_name` (`platform_name`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------

-- ----------------------------
-- Table structure for `movie_account`
-- ----------------------------
DROP TABLE IF EXISTS `movie_account`;
CREATE TABLE `movie_account` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) NOT NULL,
  `account` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `service` int(1) DEFAULT '0',
  `date_buy` date DEFAULT '0000-00-00',
  `date_expire` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identity_name` (`account`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_account_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie_account
-- ----------------------------

-- ----------------------------
-- Table structure for `music`
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) NOT NULL,
  `platform_name` varchar(30) NOT NULL,
  `hour_rent` decimal(5,2) DEFAULT '0.00',
  `day_rent` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music
-- ----------------------------

-- ----------------------------
-- Table structure for `music_account`
-- ----------------------------
DROP TABLE IF EXISTS `music_account`;
CREATE TABLE `music_account` (
  `id` int(10) NOT NULL,
  `music_id` int(10) NOT NULL,
  `account` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `service` int(1) DEFAULT '0',
  `date_buy` date DEFAULT '0000-00-00',
  `date_expire` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`),
  KEY `mid` (`music_id`),
  CONSTRAINT `music_account_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of music_account
-- ----------------------------

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `session_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `telephone` varchar(11) DEFAULT '',
  `email` varchar(50) DEFAULT '',
  `integral` int(10) DEFAULT '0',
  `balance` decimal(8,2) DEFAULT '0.00',
  `photo_path` varchar(255) DEFAULT '',
  `power` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'suwei', '11121222211', 'suge@163.com', '0', '0.00', null, '0');

-- ----------------------------
-- Table structure for `users_login`
-- ----------------------------
DROP TABLE IF EXISTS `users_login`;
CREATE TABLE `users_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `user_name` varchar(20) NOT NULL COMMENT '\r\n',
  `pass` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `uid` (`user_id`) USING BTREE,
  CONSTRAINT `users_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_login
-- ----------------------------
