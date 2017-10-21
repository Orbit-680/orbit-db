-- --------------------------------------------------------------------------------
-- Routine for adding courses to 'course' table
-- --------------------------------------------------------------------------------
DELIMITER $$

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

END