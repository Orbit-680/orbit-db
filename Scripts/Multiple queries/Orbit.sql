CREATE DATABASE IF NOT EXISTS `orbit`;
USE `orbit`;

DROP TABLE IF EXISTS `school_student`;
DROP TABLE IF EXISTS `account_link_student`;
DROP TABLE IF EXISTS `account_link_teacher`;
DROP TABLE IF EXISTS `grade`;
DROP TABLE IF EXISTS `assignment`;
DROP TABLE IF EXISTS `attendance`;
DROP TABLE IF EXISTS `conduct`;
DROP TABLE IF EXISTS `tickets`;
DROP TABLE IF EXISTS `course`;
DROP TABLE IF EXISTS `message`;
DROP TABLE IF EXISTS `schedule`;
DROP TABLE IF EXISTS `school`;
DROP TABLE IF EXISTS `student`;
DROP TABLE IF EXISTS `teacher`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `picture`;
DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `school` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address_1` varchar(45) NOT NULL,
  `Address_2` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Zip_Code` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
);

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
);

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
);

CREATE TABLE `school_student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `School_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `School_ID` (`School_ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `school_student_ibfk_1` FOREIGN KEY (`School_ID`) REFERENCES `school` (`ID`),
  CONSTRAINT `school_student_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
);

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
);

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
);

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
);

CREATE TABLE `course` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Teacher_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `course_ibfk_1` (`Teacher_ID`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`ID`)
);

CREATE TABLE `message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Message` varchar(100) NOT NULL,
  `Date_Sent` date NOT NULL,
  `Sent_To` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
);

CREATE TABLE `picture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Picture` blob NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`)
);

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
);

CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` longtext NOT NULL,
  `Priority` varchar(45) NOT NULL,
  `User_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`)
);

CREATE TABLE `attendance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Status` varchar(1) NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `Course_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`)
);

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
);

CREATE TABLE `conduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Score` int(11) NOT NULL,
  `Comment` longtext DEFAULT NULL,
  `Course_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Course_ID` (`Course_ID`),
  CONSTRAINT `conduct_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`),
  CONSTRAINT `conduct_ibfk_2` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`ID`)
);

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
);