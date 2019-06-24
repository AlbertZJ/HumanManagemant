/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.49-community : Database - humanresources
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`humanresources` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `humanresources`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作部门种类',
  PRIMARY KEY (`id`),
  KEY `department` (`department`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `department` */

insert  into `department`(`id`,`department`) values (30,'军部'),(32,'医疗部'),(33,'后勤部'),(1,'技术部'),(31,'生活部'),(29,'管理部'),(28,'行政部'),(2,'销售部');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `e_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `e_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '员工的姓名',
  `sex` enum('男','女') COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `age` int(20) NOT NULL COMMENT '年龄',
  `edu_background` enum('本科','专科','博士','其他','硕士') COLLATE utf8_unicode_ci NOT NULL COMMENT '学历',
  `speciality` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业',
  `foreign_language` enum('英语','法语','西班牙语','俄语') COLLATE utf8_unicode_ci NOT NULL COMMENT '外语情况',
  `grad_time` date NOT NULL COMMENT '毕业时间',
  `marriage` enum('未婚','已婚') COLLATE utf8_unicode_ci NOT NULL COMMENT '婚姻状况',
  `post` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作岗位',
  `department` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '所在部门',
  `technical_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '职称',
  `state` enum('转出','辞职','辞退','退休','在职') COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  PRIMARY KEY (`e_id`),
  KEY `technical_title` (`technical_title`),
  KEY `department` (`department`),
  KEY `post` (`post`),
  KEY `speciality` (`speciality`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`speciality`) REFERENCES `think` (`speciality`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`department`) REFERENCES `department` (`department`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`technical_title`) REFERENCES `technical_title` (`technical_title`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`post`) REFERENCES `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `employee` */

insert  into `employee`(`e_id`,`e_name`,`sex`,`age`,`edu_background`,`speciality`,`foreign_language`,`grad_time`,`marriage`,`post`,`department`,`technical_title`,`state`) values (2,'王五','女',25,'本科','软件工程','英语','2019-06-06','未婚','开发','技术部','初级程序员','在职'),(3,'李四','男',23,'专科','计算机科学与技术','英语','2019-06-19','未婚','开发','技术部','初级程序员','在职'),(4,'李华','男',24,'本科','计算机科学与技术','英语','2019-06-19','未婚','开发','技术部','初级程序员','在职'),(5,'小红','女',28,'硕士','汉语言文学','英语','2019-06-19','已婚','前台','销售部','销售类','在职'),(6,'小明','女',29,'本科','汉语言文学','法语','2019-06-14','已婚','前台','销售部','销售类','转出'),(9,'刘强','男',29,'专科','汉语言文学','英语','2019-06-01','已婚','前台','技术部','中级程序员','在职'),(10,'刘欢','男',30,'专科','汉语言文学','英语','2019-06-14','已婚','前台','技术部','中级程序员','在职'),(13,'李刚','男',24,'专科','汉语言文学','英语','2019-06-08','已婚','前台','技术部','中级程序员','在职'),(14,'宋三','男',22,'本科','汉语言文学','英语','2019-06-07','已婚','前台','技术部','中级程序员','在职'),(16,'刘强东','男',40,'本科','英语','英语','2013-08-17','已婚','前台','技术部','中级程序员','在职'),(17,'小李','男',20,'专科','俄语','英语','2019-06-01','未婚','护士','军部','中级程序员','在职');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `p_accounts` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员账号',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员姓名',
  PRIMARY KEY (`id`),
  KEY `p_accounts` (`p_accounts`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `manager` */

insert  into `manager`(`id`,`p_accounts`,`password`,`name`) values (1,'20161080','123456','李明'),(2,'20161081','qwer','李华');

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `post` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '工作岗位',
  PRIMARY KEY (`id`),
  KEY `post` (`post`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `post` */

insert  into `post`(`id`,`post`) values (42,'仓库管理员'),(1,'前台'),(45,'后勤主任'),(2,'开发'),(40,'打杂'),(44,'护士'),(38,'护士长'),(43,'生活委员'),(41,'经理');

/*Table structure for table `technical_title` */

DROP TABLE IF EXISTS `technical_title`;

CREATE TABLE `technical_title` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `technical_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '职称种类',
  PRIMARY KEY (`id`),
  KEY `technical_title` (`technical_title`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `technical_title` */

insert  into `technical_title`(`id`,`technical_title`) values (2,'中级程序员'),(1,'初级程序员'),(7,'后厨'),(5,'管理员'),(3,'销售类'),(9,'项目经理'),(8,'高级程序员');

/*Table structure for table `think` */

DROP TABLE IF EXISTS `think`;

CREATE TABLE `think` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `speciality` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '专业种类',
  PRIMARY KEY (`id`),
  KEY `speciality` (`speciality`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `think` */

insert  into `think`(`id`,`speciality`) values (7,'俄语'),(9,'德语'),(3,'汉语言文学'),(6,'法语'),(5,'英语'),(10,'西班牙语'),(2,'计算机科学与技术'),(1,'软件工程');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
