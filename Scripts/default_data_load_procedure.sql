-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`kevin.stanley`@`%` PROCEDURE `orbit_default_data_load`()
BEGIN

call orbit.load_students();

END