-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`kevin.stanley`@`%` PROCEDURE `default_data_load`()
BEGIN

call orbit.load_students();
call orbit.load_teachers();
call orbit.load_courses();

END