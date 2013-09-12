# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.27)
# Database: lab1
# Generation Time: 2013-09-09 11:49:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Expert
# ------------------------------------------------------------

LOCK TABLES `Expert` WRITE;
/*!40000 ALTER TABLE `Expert` DISABLE KEYS */;

INSERT INTO `Expert` (`id`, `name`, `email`)
VALUES
	(1,'Niclas Olofsson','nicol271@student.liu.se'),
	(2,'Holger Grenquist','holger@grenquist.se');

/*!40000 ALTER TABLE `Expert` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ExpertArea
# ------------------------------------------------------------

LOCK TABLES `ExpertArea` WRITE;
/*!40000 ALTER TABLE `ExpertArea` DISABLE KEYS */;

INSERT INTO `ExpertArea` (`id`, `description`, `parent`)
VALUES
	(1,'Computer Science',NULL),
	(2,'Databases',1),
	(3,'SQL',2),
	(4,'Programming',1);

/*!40000 ALTER TABLE `ExpertArea` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Expertise
# ------------------------------------------------------------

LOCK TABLES `Expertise` WRITE;
/*!40000 ALTER TABLE `Expertise` DISABLE KEYS */;

INSERT INTO `Expertise` (`expert`, `expertArea`)
VALUES
	(1,3),
	(2,4);

/*!40000 ALTER TABLE `Expertise` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Recommendation
# ------------------------------------------------------------

LOCK TABLES `Recommendation` WRITE;
/*!40000 ALTER TABLE `Recommendation` DISABLE KEYS */;

INSERT INTO `Recommendation` (`id`, `justification`, `authorExpert`, `recommendedExpert`)
VALUES
	(1,'He has completed the TDDD43 LAB 1',2,1);

/*!40000 ALTER TABLE `Recommendation` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
