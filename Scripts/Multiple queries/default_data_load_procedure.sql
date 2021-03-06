-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`kevin.stanley`@`%` PROCEDURE `default_data_load`()
BEGIN

call orbit.load_students();
call orbit.load_teachers();
call orbit.load_courses();
call orbit.load_schools();
call orbit.load_roles();

END