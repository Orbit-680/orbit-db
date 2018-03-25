CREATE DATABASE  IF NOT EXISTS `orbit`;
USE `orbit`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 18.220.78.140    Database: orbit
-- ------------------------------------------------------
-- Server version	5.6.37

--
-- Table structure for table `account_link_student`
--

DROP TABLE IF EXISTS `account_link_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_link_student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Linked` date NOT NULL,
  `Active` varchar(45) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `account_link_student_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `account_link_student_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_link_student`
--

INSERT INTO `account_link_student` VALUES (1,'2018-02-23','Y',4,1),(2,'2018-02-23','Y',3,5),(3,'2018-03-02','Y',3,1),(4,'2018-03-05','Y',6,17),(5,'2018-03-17','Y',7,18),(6,'2018-03-17','Y',8,20),(7,'2018-03-17','Y',8,19),(8,'2018-03-17','Y',9,21),(9,'2018-03-17','Y',10,19),(10,'2018-03-17','Y',11,20);

--
-- Table structure for table `account_link_teacher`
--

DROP TABLE IF EXISTS `account_link_teacher`;
CREATE TABLE `account_link_teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Linked` date NOT NULL,
  `Active` varchar(45) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Teacher_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `account_link_user_ibfk_1` (`User_ID`),
  KEY `account_link_teacher_ibfk_2` (`Teacher_ID`),
  CONSTRAINT `account_link_teacher_ibfk_2` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `account_link_user_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_link_teacher`
--

INSERT INTO `account_link_teacher` VALUES (1,'2018-02-13','Y',2,1),(2,'2018-02-06','Y',5,2),(3,'2018-03-05','Y',6,4),(4,'2018-03-17','Y',7,5);

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
CREATE TABLE `assignment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Max_Points` varchar(45) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Description` longtext NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` VALUES (1,'1718','Homework 1','Homework','100',1,''),(2,'1718','Kevin\'s New','Homework','100',1,'Make sure to read the book \"The Chocolate War\" for this assignment.'),(3,'1718','Homework #3','Homework','100',1,''),(4,'1718','Test 1','Homework','100',2,''),(5,'1718','Test 2','Homework','100',2,''),(7,'1718','Srdjan Test','Homework','100',3,''),(8,'1718','Test5','Homework','100',88,''),(9,'1718','TEST','Homework','100',91,''),(10,'1718','TEST','Homework','100',90,''),(11,'1718','David Test','Homework','100',3,''),(12,'1718','Test67','Homework','100',3,''),(13,'1718','Test 1','Homework','100',93,''),(14,'1718','Homework 1','Homework','50',93,''),(15,'1718','Homework 2','Homework','50',93,''),(16,'1718','Test 1','Homework','100',94,''),(17,'1718','TEST1','Homework','100',95,''),(18,'1718','TEST1','Homework','100',96,''),(19,'1718','test567','Homework','300',3,''),(20,'1718','Testing Fresh','Homework','150',92,''),(21,'1718','Test Srdjan','Homework','100',3,'Test Description');

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Teacher_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `course_ibfk_1` (`Teacher_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` VALUES (1,'1718','English I',2),(2,'1718','English II',2),(3,'1718','Speech',1),(4,'1718','U.S. Literature',NULL),(5,'1718','World Literature',NULL),(6,'1718','Algebra I',NULL),(7,'1718','Algebra II',NULL),(8,'1718','Geometry',NULL),(9,'1718','Trigonometry',NULL),(10,'1718','Calculus',NULL),(11,'1718','Statistics',NULL),(12,'1718','Biology I',NULL),(13,'1718','Biology II',NULL),(14,'1718','Chemistry I',NULL),(15,'1718','Chemistry II',NULL),(16,'1718','Organic Chemistry',NULL),(17,'1718','Physics I',NULL),(18,'1718','Physics II',NULL),(19,'1718','Earth Science',NULL),(20,'1718','Astronomy',NULL),(21,'1718','U.S. History',NULL),(22,'1718','U.S. Government',NULL),(23,'1718','World History',NULL),(24,'1718','European History',NULL),(25,'1718','Economics',NULL),(26,'1718','Psychology',NULL),(27,'1718','Geography',NULL),(28,'1718','Sociology',NULL),(29,'1718','Anthropology',NULL),(30,'1718','Political Science',NULL),(31,'1718','Global Studies',NULL),(32,'1718','Spanish I',NULL),(33,'1718','Spanish II',NULL),(34,'1718','French I',NULL),(35,'1718','French II',NULL),(36,'1718','German I',NULL),(37,'1718','German II',NULL),(38,'1718','Art I',NULL),(39,'1718','Art II',NULL),(40,'1718','Computer Applications',NULL),(41,'1718','Physical Education',NULL),(42,'1718','Health Education',NULL),(43,'1718','Resource Management',NULL),(44,'1718','Driver\'s Education',NULL),(45,'1819','English I',NULL),(46,'1819','English II',NULL),(47,'1819','Speech',NULL),(48,'1819','U.S. Literature',NULL),(49,'1819','World Literature',NULL),(50,'1819','Algebra I',NULL),(51,'1819','Algebra II',NULL),(52,'1819','Geometry',NULL),(53,'1819','Trigonometry',NULL),(54,'1819','Calculus',NULL),(55,'1819','Statistics',NULL),(56,'1819','Biology I',NULL),(57,'1819','Biology II',NULL),(58,'1819','Chemistry I',NULL),(59,'1819','Chemistry II',NULL),(60,'1819','Organic Chemistry',NULL),(61,'1819','Physics I',NULL),(62,'1819','Physics II',NULL),(63,'1819','Earth Science',NULL),(64,'1819','Astronomy',NULL),(65,'1819','U.S. History',NULL),(66,'1819','U.S. Government',NULL),(67,'1819','World History',NULL),(68,'1819','European History',NULL),(69,'1819','Economics',NULL),(70,'1819','Psychology',NULL),(71,'1819','Geography',NULL),(72,'1819','Sociology',NULL),(73,'1819','Anthropology',NULL),(74,'1819','Political Science',NULL),(75,'1819','Global Studies',NULL),(76,'1819','Spanish I',NULL),(77,'1819','Spanish II',NULL),(78,'1819','French I',NULL),(79,'1819','French II',NULL),(80,'1819','German I',NULL),(81,'1819','German II',NULL),(82,'1819','Art I',NULL),(83,'1819','Art II',NULL),(84,'1819','Computer Applications',NULL),(85,'1819','Physical Education',NULL),(86,'1819','Health Education',NULL),(87,'1819','Resource Management',NULL),(88,'1819','Driver\'s Education',1),(89,'1718','Kevin\'s New Course',1),(90,'1718','Algebra',1),(91,'1718','Algebra II',1),(92,'1718','Algebra III',1),(93,'1718','Algebra',5),(94,'1718','Calculus',5),(95,'1718','Trig',5),(96,'1718','TEST COURSE',5);

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Grade` varchar(45) NOT NULL,
  `Year` varchar(45) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Assignment_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Course_ID` (`Course_ID`),
  KEY `Assignment_ID` (`Assignment_ID`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`),
  CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`Assignment_ID`) REFERENCES `assignment` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` VALUES (1,'100','1718',1,1,2),(4,'90','1718',2,1,2),(5,'95','1718',4,1,2),(6,'45','1718',6,1,2),(7,'80','1718',7,1,2),(8,'40','1718',3,1,2),(9,'30','1718',5,1,2),(10,'50','1718',9,1,2),(11,'100','1718',1,1,1),(12,'100','1718',2,1,1),(13,'100','1718',4,1,1),(18,'50','1718',1,1,3),(19,'60','1718',2,1,3),(20,'30','1718',4,1,3),(26,'88','1718',1,2,4),(28,'95','1718',1,2,5),(29,'60','1718',1,3,7),(30,'88','1718',3,3,7),(31,'63','1718',2,3,7),(32,'69','1718',4,3,7),(33,'70','1718',5,3,7),(34,'60','1718',6,3,7),(35,'96','1718',7,3,7),(36,'60','1718',8,3,7),(37,'100','1718',9,3,7),(38,'85','1718',1,3,11),(39,'63','1718',3,3,11),(40,'75','1718',2,3,11),(41,'56','1718',4,3,11),(42,'36','1718',5,3,11),(43,'96','1718',6,3,11),(44,'96','1718',7,3,11),(45,'36','1718',8,3,11),(46,'36','1718',9,3,11),(47,'36','1718',10,3,11),(48,'85','1718',1,3,12),(49,'85','1718',7,88,8),(50,'92','1718',19,93,13),(51,'85','1718',20,93,13),(52,'80','1718',19,93,14),(53,'80','1718',20,93,14),(54,'100','1718',19,93,15),(55,'100','1718',20,93,15),(56,'95','1718',20,94,16),(57,'69','1718',1,3,19),(58,'69','1718',3,3,19),(59,'85','1718',18,92,20),(60,'96','1718',19,92,20),(61,'125','1718',20,92,20),(62,'150','1718',21,92,20),(63,'63','1718',2,3,19),(64,'63','1718',2,3,19),(65,'96','1718',4,3,19),(66,'50','1718',5,3,19),(67,'900','1718',6,3,19);

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Message` varchar(100) NOT NULL,
  `Date_Sent` date NOT NULL,
  `Sent_To` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Picture` blob NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` VALUES (1,'Admin'),(2,'Teacher'),(3,'Parent'),(4,'Student');

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` VALUES (1,'1718',1,1),(2,'1718',2,1),(3,'1718',4,1),(4,'1718',6,1),(5,'1718',7,1),(6,'1718',1,2),(7,'1718',3,1),(8,'1718',5,1),(9,'1718',7,2),(10,'1718',9,1),(11,'1718',1,3),(12,'1718',3,3),(13,'1718',2,88),(14,'1718',5,88),(15,'1718',7,88),(16,'1718',10,88),(17,'1718',17,88),(18,'1718',2,3),(19,'1718',3,3),(20,'1718',4,3),(21,'1718',5,3),(22,'1718',6,3),(23,'1718',7,3),(24,'1718',8,3),(25,'1718',9,3),(26,'1718',10,3),(27,'1718',19,93),(28,'1718',20,93),(29,'1718',20,94),(30,'1718',21,95),(31,'1718',21,95),(32,'1718',1,96),(33,'1718',2,96),(34,'1718',3,96),(35,'1718',4,96),(36,'1718',6,96),(37,'1718',7,96),(38,'1718',8,96),(39,'1718',9,96),(40,'1718',10,96),(41,'1718',11,96),(42,'1718',12,96),(43,'1718',13,96),(44,'1718',14,96),(45,'1718',15,96),(46,'1718',16,96),(47,'1718',18,92),(48,'1718',19,92),(49,'1718',20,92),(50,'1718',21,92),(51,'1718',1,91),(52,'1718',3,91),(53,'1718',5,91),(54,'1718',8,91),(55,'1718',10,91);

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address_1` varchar(45) NOT NULL,
  `Address_2` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zip_Code` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` VALUES (1,'Captain Shreve High','6115 E. Kings Highway','6115 E. Kings Highway','Shreveport','LA','71105');

--
-- Table structure for table `school_student`
--

DROP TABLE IF EXISTS `school_student`;
CREATE TABLE `school_student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `School_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `School_ID` (`School_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `school_student_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `school` (`ID`),
  CONSTRAINT `school_student_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_Of_Birth` varchar(45) NOT NULL,
  `SSN` varchar(45) DEFAULT NULL,
  `Address_1` varchar(45) DEFAULT NULL,
  `Address_2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip_Code` varchar(45) DEFAULT NULL,
  `Grade` varchar(45) DEFAULT NULL,
  `Mother_First_Name` varchar(45) DEFAULT NULL,
  `Mother_Last_Name` varchar(45) DEFAULT NULL,
  `Mother_SSN` varchar(45) DEFAULT NULL,
  `Mother_Address_1` varchar(45) DEFAULT NULL,
  `Mother_Address_2` varchar(45) DEFAULT NULL,
  `Mother_City` varchar(45) DEFAULT NULL,
  `Mother_State` varchar(45) DEFAULT NULL,
  `Mother_Zip_Code` varchar(45) DEFAULT NULL,
  `Mother_Home_Phone` varchar(45) DEFAULT NULL,
  `Mother_Cell_Phone` varchar(45) DEFAULT NULL,
  `Mother_Email` varchar(45) DEFAULT NULL,
  `Father_First_Name` varchar(45) DEFAULT NULL,
  `Father_Last_Name` varchar(45) DEFAULT NULL,
  `Father_SSN` varchar(45) DEFAULT NULL,
  `Father_Address_1` varchar(45) DEFAULT NULL,
  `Father_Address_2` varchar(45) DEFAULT NULL,
  `Father_City` varchar(45) DEFAULT NULL,
  `Father_State` varchar(45) DEFAULT NULL,
  `Father_Zip_Code` varchar(45) DEFAULT NULL,
  `Father_Home_Phone` varchar(45) DEFAULT NULL,
  `Father_Cell_Phone` varchar(45) DEFAULT NULL,
  `Father_Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` VALUES (1,'Default','Student','01/01/2005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Lucas','Smith','12/26/2000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Jackson','Williams','05/12/2012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Emma','Johnson','12/05/2011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Alyssa','Stanley','03/15/2012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Aiden','Stanley','08/21/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Olivia','Wilson','05/22/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Ethan','Davis','07/02/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Emily','Carter','06/03/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'Michael','Anderson','04/04/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'Frodo','Baggins','07/07/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Spider','Man','09/09/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'Ant','Man','10/10/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'Iron','Man','11/11/2010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Dean','Winchester','12/12/2004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'Srdjan','Ristic','02/26/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'Test','OR193','03/05/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'Kevin','Stanley','03/17/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'Student','One','03/17/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'Student','Two','03/16/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'Kevin','Student','03/17/2018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_Of_Birth` varchar(45) DEFAULT NULL,
  `SSN` varchar(45) DEFAULT NULL,
  `Address_1` varchar(45) DEFAULT NULL,
  `Address_2` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Zip_Code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` VALUES (1,'Default','Teacher',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Kevin','Teacher',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Srdjan','Ristic','02/26/2018',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Test','OR193','03/05/2018',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Kevin','Stanley','03/17/2018',NULL,NULL,NULL,NULL,NULL,NULL);

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` longtext NOT NULL,
  `Priority` varchar(45) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` VALUES (1,'Test from the app','Nav bar does not work','High',2),(2,'Srdjan','Test','Low',2),(3,'Srdjan','Test 2','Low',2),(4,'Srdjan','Test 3','Low',2),(5,'Kevin Test','testing teacher login','Low',7);

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(45) NOT NULL,
  `UID` varchar(45) NOT NULL,
  `Last_Login` date NOT NULL,
  `Invalid_Attempts` int(11) NOT NULL,
  `Active` varchar(45) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Email`),
  KEY `Role_ID` (`Role_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` VALUES (1,'admin@mail.com','PF0PFuMdZ4h2Apaw4PIB23F9gew1','2018-02-04',0,'True',1,'Administrator','Administrator'),(2,'teacher@mail.com','aeEuFoniGWN1L6W9pBk74xgoN7y1','2018-02-04',0,'True',2,'Teacher','Teacher'),(3,'parent@mail.com','swAEI4Kphffv48bcasmlAlDiz532','2018-02-04',0,'True',3,'Parent','Parent'),(4,'student@mail.com','xeOMSbE61aZ08BJ2eppmlEgPQqz2','2018-02-04',0,'True',4,'Student','Student'),(5,'kevinteacher@gmail.com','sv7eauLuryeDxRf8yqgFNhoJufs1','2018-02-05',0,'True',2,'Kevin','Teacher'),(6,'testor193@email.com','AeLUewMP6fXxsIqQ42TSY9zwKbg1','2018-06-04',0,'True',2,'Test','OR193'),(7,'newteacher@mail.com','dvPLmeno6Me0UL8aLNwg9337TlV2','2019-09-16',0,'True',2,'Kevin','Stanley'),(8,'newparent@mail.com','tXoiISpVX2T3P5ZLT54uZmoVN6S2','2021-03-16',0,'True',3,'Kevin','Parent'),(9,'newstudent@mail.com','rywY5IapseehebA9ea4b2hE0ExO2','2021-12-16',0,'True',4,'Kevin','Student'),(10,'student1@mail.com','jUOhYKO5pwTzDj8wUIDxnn0Po2j1','2022-03-16',0,'True',4,'Student','One'),(11,'student2@mail.com','juP6uQl290Z0lEbjYyVbZ7fGsh72','2022-04-16',0,'True',4,'Student','Two');

--
-- Dumping routines for database 'orbit'
--

DELIMITER ;;
CREATE DEFINER=`kevin.stanley`@`%` PROCEDURE `default_data_load`()
BEGIN

call orbit.load_students();
call orbit.load_teachers();
call orbit.load_courses();
call orbit.load_schools();
call orbit.load_roles();

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_courses`()
BEGIN

DELETE FROM `orbit`.`course` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`course` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`course` 
(`Name`, `Year`, `Teacher_ID`) 
VALUES
######################################
#        COURSES 2017 - 2018         #
######################################
# English
('English I', '1718', 1),
('English II', '1718', 1),
('Speech', '1718', 1),
('U.S. Literature', '1718', 1),
('World Literature', '1718', 1),

# Mathematics
('Algebra I', '1718', 1),
('Algebra II', '1718', 1),
('Geometry', '1718', 1),
('Trigonometry', '1718', 1),
('Calculus', '1718', 1),
('Statistics', '1718', 1),

# Science
('Biology I', '1718', 1),
('Biology II', '1718', 1),
('Chemistry I', '1718', 1),
('Chemistry II', '1718', 1),
('Organic Chemistry', '1718', 1),
('Physics I', '1718', 1),
('Physics II', '1718', 1),
('Earth Science', '1718', 1),
('Astronomy', '1718', 1),

# Social Studies
('U.S. History', '1718', 1),
('U.S. Government', '1718', 1),
('World History', '1718', 1),
('European History', '1718', 1),
('Economics', '1718', 1),
('Psychology', '1718', 1),
('Geography', '1718', 1),
('Sociology', '1718', 1),
('Anthropology', '1718', 1),
('Political Science', '1718', 1),
('Global Studies', '1718', 1),

# Foreign Languages
('Spanish I', '1718', 1),
('Spanish II', '1718', 1),
('French I', '1718', 1),
('French II', '1718', 1),
('German I', '1718', 1),
('German II', '1718', 1),

# Other
('Art I', '1718', 1),
('Art II', '1718', 1),
('Computer Applications', '1718', 1),
('Physical Education', '1718', 1),
('Health Education', '1718', 1),
('Resource Management', '1718', 1),
("Driver's Education", '1718', 1),

######################################
#        COURSES 2018 - 2019         #
######################################
# English
('English I', '1819', 1),
('English II', '1819', 1),
('Speech', '1819', 1),
('U.S. Literature', '1819', 1),
('World Literature', '1819', 1),

# Mathematics
('Algebra I', '1819', 1),
('Algebra II', '1819', 1),
('Geometry', '1819', 1),
('Trigonometry', '1819', 1),
('Calculus', '1819', 1),
('Statistics', '1819', 1),

# Science
('Biology I', '1819', 1),
('Biology II', '1819', 1),
('Chemistry I', '1819', 1),
('Chemistry II', '1819', 1),
('Organic Chemistry', '1819', 1),
('Physics I', '1819', 1),
('Physics II', '1819', 1),
('Earth Science', '1819', 1),
('Astronomy', '1819', 1),

# Social Studies
('U.S. History', '1819', 1),
('U.S. Government', '1819', 1),
('World History', '1819', 1),
('European History', '1819', 1),
('Economics', '1819', 1),
('Psychology', '1819', 1),
('Geography', '1819', 1),
('Sociology', '1819', 1),
('Anthropology', '1819', 1),
('Political Science', '1819', 1),
('Global Studies', '1819', 1),

# Foreign Languages
('Spanish I', '1819', 1),
('Spanish II', '1819', 1),
('French I', '1819', 1),
('French II', '1819', 1),
('German I', '1819', 1),
('German II', '1819', 1),

# Other
('Art I', '1819', 1),
('Art II', '1819', 1),
('Computer Applications', '1819', 1),
('Physical Education', '1819', 1),
('Health Education', '1819', 1),
('Resource Management', '1819', 1),
("Driver's Education", '1819', 1)
;

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_roles`()
BEGIN

DELETE FROM `orbit`.`role` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`role` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`role` 
(`Name`) 
VALUES
('Admin'),
('Teacher'),
('Parent'),
('Student');
END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_schools`()
BEGIN

DELETE FROM `orbit`.`school` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`school` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`school` 
(`Name`, `Address_1`, `Address_2`, `City`, `State`, `Zip_Code`) 
VALUES
('Captain Shreve High', '6115 E. Kings Highway', '6115 E. Kings Highway', 'Shreveport', 'LA', '71105');

END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`kevin.stanley`@`%` PROCEDURE `load_students`()
BEGIN

# Delete all rows from table before loading new records.
# Truncate won't work with tables with a foreign key so delete instead.
# Also reset auto increment.
delete from student where id > 0;
ALTER TABLE student AUTO_INCREMENT = 1;


INSERT INTO `orbit`.`student`
(`First_Name`,
`Last_Name`,
`Date_Of_Birth`,
`SSN`,
`Address_1`,
`Address_2`,
`City`,
`State`,
`Zip_Code`,
`Grade`,
`Mother_First_Name`,
`Mother_Last_Name`,
`Mother_SSN`,
`Mother_Address_1`,
`Mother_Address_2`,
`Mother_City`,
`Mother_State`,
`Mother_Zip_Code`,
`Mother_Home_Phone`,
`Mother_Cell_Phone`,
`Mother_Email`,
`Father_First_Name`,
`Father_Last_Name`,
`Father_SSN`,
`Father_Address_1`,
`Father_Address_2`,
`Father_City`,
`Father_State`,
`Father_Zip_Code`,
`Father_Home_Phone`,
`Father_Cell_Phone`,
`Father_Email`)
VALUES
('Sophia',
'Smith',
'01/01/2010',
'123467890',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'8',
'Liz',
'Smith',
'654858745',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'3186355478',
'3186325487',
'liz@aol.com',
'Bob',
'Smith',
'654858742',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'3186355478',
'3189656224',
'bob@aol.com'),
('Lucas',
'Smith',
'12/26/2000',
'654885555',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'12',
'Liz',
'Smith',
'654858745',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'3186355478',
'3186325487',
'liz@aol.com',
'Bob',
'Smith',
'654858742',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'3186355478',
'3189656224',
'bob@aol.com'),
('Jackson',
'Williams',
'05/12/2012',
'458636201',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71115',
'5',
'Beth',
'Williams',
'852003214',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71112',
'3185558900',
'3182344246',
'beth@gmail.com',
'Josh',
'Williams',
'632218755',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71112',
'3186322100',
'3185487778',
'josh@gmail.com'),
('Emma',
'Johnson',
'12/05/2011',
'458879999',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'6',
'Myesha',
'Johnson',
'654620025',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'3180026547',
'3183219630',
'myesha@gmail.com',
'Jacob',
'Johnson',
'111218878',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'3185482222',
'3180002225',
'jacob@gmail.com'),
('Alyssa',
'Stanley',
'03/15/2012',
'654555585',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'K',
'Stephanie',
'Stanley',
'548226345',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'3184589969',
'3183363333',
'stephanie@gmail.com',
'Kevin',
'Stanley',
'458993321',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'3182549999',
'3180010002',
'kevin@gmail.com'),
('Aiden',
'Stanley',
'08/21/2010',
'654888888',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'5',
'Stephanie',
'Stanley',
'548226345',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'3184589969',
'3183363333',
'stephanie@gmail.com',
'Kevin',
'Stanley',
'458993321',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'3182549999',
'3180010002',
'kevin@gmail.com'),
('Olivia',
'Wilson',
'05/22/2010',
'123331101',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Samantha',
'Wilson',
'548888888',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'3187999999',
'3188888888',
'samantha@gmail.com',
'Ryan',
'Wilson',
'548885210',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'3182222222',
'3183333333',
'ryan@gmail.com'),
('Ethan',
'Davis',
'07/02/2010',
'111111111',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Stacy',
'Davis',
'887888888',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188782222',
'3182110002',
'stacy@gmail.com',
'Brad',
'Davis',
'555555555',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'3185555555',
'3185485521',
'brad@gmail.com'),
('Emily',
'Carter',
'06/03/2010',
'222222222',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Pam',
'Carter',
'8789999999',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'3182155478',
'3183022000',
'pam@gmail.com',
'Chuck',
'Davis',
'888880012',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188879999',
'3185482000',
'chuck@gmail.com'),
('Michael',
'Anderson',
'04/04/2010',
'444444444',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Trinity',
'Anderson',
'878885500',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'3185485555',
'3182122222',
'trinity@gmail.com',
'Neo',
'Anderson',
'854555200',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188888888',
'3188888889',
'the_one@gmail.com'),
('Frodo',
'Baggins',
'07/07/2010',
'77777777',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mary',
'Baggins',
'555550000',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188787777',
'3182221111',
'mary@gmail.com',
'Bilbo',
'Baggins',
'888772215',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'3180000000',
'3189999999',
'bilbo@gmail.com'),
('Spider',
'Man',
'09/09/2010',
'555454444',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545211113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3180000030',
'3180000020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111121212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188788778',
'3189595529',
'mr_man@gmail.com'),
('Ant',
'Man',
'10/10/2010',
'151555123',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545211113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3180000030',
'3180000020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111121212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188788778',
'3189595529',
'mr_man@gmail.com'),
('Iron',
'Man',
'11/11/2010',
'00114444',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545211113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3180000030',
'3180000020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111121212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'3188788778',
'3189595529',
'mr_man@gmail.com'),
('Dean',
'Winchester',
'12/12/2004',
'448889512',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'11',
'Mary',
'Winchester',
'878555542',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'3181112112',
'3182223353',
'mary@gmail.com',
'John',
'Winchester',
'878555544',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'3180022235',
'3180022234',
'john@gmail.com'),
('Sam',
'Winchester',
'01/12/2005',
'414114123',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'8',
'Mary',
'Winchester',
'878555542',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'3181112112',
'3182223353',
'mary@gmail.com',
'John',
'Winchester',
'878555544',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'3180022235',
'3180022234',
'john@gmail.com');


END ;;
DELIMITER ;
DELIMITER ;;
CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_teachers`()
BEGIN

DELETE FROM `orbit`.`teacher` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`teacher` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`teacher` 
(`First_Name`, `Last_Name`, `Date_Of_Birth`, `SSN`, `Address_1`, `Address_2`, `City`, `State`, `Zip_Code`) 
VALUES
('Kelsey', 'Anderson', '10/20/1980', '123456789', '123 6th Street', '123 6th Street', 'Melbourne', 'Florida', '32904');

END ;;
DELIMITER ;

-- Dump completed on 2018-03-25