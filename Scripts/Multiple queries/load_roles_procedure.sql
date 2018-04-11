-- --------------------------------------------------------------------------------
-- Routine for adding teachers to 'role' table
-- --------------------------------------------------------------------------------
DELIMITER $$

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
END