-- --------------------------------------------------------------------------------
-- Routine for adding teachers to 'teacher' table
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_teachers`()
BEGIN

DELETE FROM `orbit`.`teacher` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`teacher` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`teacher` 
(`First_Name`, `Last_Name`, `Date_Of_Birth`, `SSN`, `Address_1`, `Address_2`, `City`, `State`, `Zip_Code`) 
VALUES
('Kelsey', 'Anderson', '10/20/1980', '123456789', '123 6th Street', '123 6th Street', 'Melbourne', 'Florida', '32904');

END