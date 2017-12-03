-- -----------------------------------------------------
-- This `main.sql` script represents skeleton of `orbit`
-- database. It includes raw tables and relationships
-- between them. This script does not include any data.
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Set default parameters
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Create database `orbit`
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `orbit`;
CREATE DATABASE IF NOT EXISTS `orbit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `orbit` ;

-- -----------------------------------------------------
-- Drop all tables if they exist
-- -----------------------------------------------------
DROP TABLE IF EXISTS `orbit`.`Role`;
DROP TABLE IF EXISTS `orbit`.`Message`;
DROP TABLE IF EXISTS `orbit`.`Account_Link`;
DROP TABLE IF EXISTS `orbit`.`User`;
DROP TABLE IF EXISTS `orbit`.`Picture`;
DROP TABLE IF EXISTS `orbit`.`Schedule`;
DROP TABLE IF EXISTS `orbit`.`Grade`;
DROP TABLE IF EXISTS `orbit`.`Student`;
DROP TABLE IF EXISTS `orbit`.`Assignment`;
DROP TABLE IF EXISTS `orbit`.`Course`;
DROP TABLE IF EXISTS `orbit`.`Teacher`;

-- -----------------------------------------------------
-- Table `orbit`.`Roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Role` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  CONSTRAINT `allowedRoles` CHECK (`Name` IN ('Admin', 'Teacher', 'Parent', 'Student')),
  PRIMARY KEY (`ID`)) 
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `orbit`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`User` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Username` VARCHAR(45) NOT NULL ,
  `UID` VARCHAR(45) NOT NULL ,
  `Last_Login` DATE NOT NULL ,
  `Invalid_Attempts` INT NOT NULL ,
  `Active` VARCHAR(45) NOT NULL ,
  `Role_ID` INT NOT NULL ,
  UNIQUE (`Username`),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Role_ID` )
  REFERENCES `orbit`.`Role` (`ID` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Student` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `First_Name` VARCHAR(45) NOT NULL ,
  `Last_Name` VARCHAR(45) NOT NULL ,
  `Date_Of_Birth` VARCHAR(45) NOT NULL ,
  `SSN` VARCHAR(45) NOT NULL ,
  `Address_1` VARCHAR(45) NOT NULL ,
  `Address_2` VARCHAR(45) NOT NULL ,
  `City` VARCHAR(45) NOT NULL ,
  `State` VARCHAR(45) NOT NULL ,
  `Zip_Code` VARCHAR(45) NOT NULL ,
  `Grade` VARCHAR(45) NOT NULL ,
  `Mother_First_Name` VARCHAR(45) NOT NULL ,
  `Mother_Last_Name` VARCHAR(45) NOT NULL ,
  `Mother_SSN` VARCHAR(45) NOT NULL ,
  `Mother_Address_1` VARCHAR(45) NOT NULL ,
  `Mother_Address_2` VARCHAR(45) NOT NULL ,
  `Mother_City` VARCHAR(45) NOT NULL ,
  `Mother_State` VARCHAR(45) NOT NULL ,
  `Mother_Zip_Code` VARCHAR(45) NOT NULL ,
  `Mother_Home_Phone` VARCHAR(45) NOT NULL ,
  `Mother_Cell_Phone` VARCHAR(45) NOT NULL ,
  `Mother_Email` VARCHAR(45) NOT NULL ,
  `Father_First_Name` VARCHAR(45) NOT NULL ,
  `Father_Last_Name` VARCHAR(45) NOT NULL ,
  `Father_SSN` VARCHAR(45) NOT NULL ,
  `Father_Address_1` VARCHAR(45) NOT NULL ,
  `Father_Address_2` VARCHAR(45) NOT NULL ,
  `Father_City` VARCHAR(45) NOT NULL ,
  `Father_State` VARCHAR(45) NOT NULL ,
  `Father_Zip_Code` VARCHAR(45) NOT NULL ,
  `Father_Home_Phone` VARCHAR(45) NOT NULL ,
  `Father_Cell_Phone` VARCHAR(45) NOT NULL ,
  `Father_Email` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Account_Link`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Account_Link` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Date_Linked` DATE NOT NULL ,
  `Active` VARCHAR(45) NOT NULL ,
  `User_ID` INT NOT NULL ,
  `Student_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`User_ID` )
  REFERENCES `orbit`.`User` (`ID` )
  ON DELETE CASCADE,
  FOREIGN KEY (`Student_ID` )
  REFERENCES `orbit`.`Student` (`ID` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Message`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Message` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Message` VARCHAR(100) NOT NULL ,
  `Date_Sent` DATE NOT NULL ,
  `Sent_To` INT NOT NULL ,
  `User_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`User_ID` )
  REFERENCES `orbit`.`User` (`ID` ))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `orbit`.`Picture`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Picture` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Year` VARCHAR(45) NOT NULL ,
  `Picture` BLOB NOT NULL ,
  `Student_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`Student_ID` )
  REFERENCES `orbit`.`Student` (`ID` ))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `orbit`.`Teacher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Teacher` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `First_Name` VARCHAR(45) NOT NULL ,
  `Last_Name` VARCHAR(45) NOT NULL ,
  `Date_Of_Birth` VARCHAR(45) NOT NULL ,
  `SSN` VARCHAR(45) NOT NULL ,
  `Address_1` VARCHAR(45) NOT NULL ,
  `Address_2` VARCHAR(45) NOT NULL ,
  `City` VARCHAR(45) NOT NULL ,
  `State` VARCHAR(45) NOT NULL ,
  `Zip_Code` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `orbit`.`Course`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Course` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Year` VARCHAR(45) NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  `Teacher_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`Teacher_ID` )
  REFERENCES `orbit`.`Teacher` (`ID` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Schedule`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Schedule` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Year` VARCHAR(45) NOT NULL ,
  `Student_ID` INT NOT NULL ,
  `Course_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`Student_ID` )
  REFERENCES `orbit`.`Student` (`ID` ),
  FOREIGN KEY (`Course_ID` )
  REFERENCES `orbit`.`Course` (`ID` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Grade`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Grade` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Grade` VARCHAR(45) NOT NULL ,
  `Year` VARCHAR(45) NOT NULL ,
  `Student_ID` INT NOT NULL ,
  `Course_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`Student_ID` )
  REFERENCES `orbit`.`Student` (`ID` ),
  FOREIGN KEY (`Course_ID` )
  REFERENCES `orbit`.`Course` (`ID` ))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`Assignment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`Assignment` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Year` VARCHAR(45) NOT NULL ,
  `Name` VARCHAR(45) NOT NULL ,
  `Type` VARCHAR(45) NOT NULL ,
  `Max_Points` VARCHAR(45) NOT NULL ,
  `Course_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`Course_ID` )
  REFERENCES `orbit`.`Course` (`ID` ))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `orbit`.`School`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`School` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Address_1` VARCHAR(45) NOT NULL ,
  `Address_2` VARCHAR(45) NOT NULL ,
  `City` VARCHAR(45) NOT NULL ,
  `State` VARCHAR(45) NOT NULL ,
  `Zip_Code` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `orbit`.`School_Student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `orbit`.`School_Student` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `School_ID` int(11) NOT NULL ,
  `Student_ID` int (11) NOT NULL ,
  PRIMARY KEY (`ID`) ,
  FOREIGN KEY (`School_ID` )
  REFERENCES `orbit`.`School` (`ID` ),
  FOREIGN KEY (`Student_ID` )
  REFERENCES `orbit`.`Student` (`ID` ))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Set default parameters
-- -----------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
