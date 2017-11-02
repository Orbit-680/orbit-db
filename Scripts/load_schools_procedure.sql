-- --------------------------------------------------------------------------------
-- Routine for adding teachers to 'school' table
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`srdjan.ristic`@`%` PROCEDURE `load_schools`()
BEGIN

DELETE FROM `orbit`.`school` WHERE ID > 0; # Deleting all records from table
ALTER TABLE `orbit`.`school` AUTO_INCREMENT = 1; # Reseting ID count

INSERT INTO `orbit`.`school` 
(`Name`, `Address_1`, `Address_2`, `City`, `State`, `Zip_Code`) 
VALUES
('Captain Shreve High', '6115 E. Kings Highway', '6115 E. Kings Highway', 'Shreveport', 'LA', '71105');

END