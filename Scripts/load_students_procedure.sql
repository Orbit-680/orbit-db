-- --------------------------------------------------------------------------------
-- Routine DDL
-- --------------------------------------------------------------------------------
DELIMITER $$

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
'123-46-7890',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'8',
'Liz',
'Smith',
'654-85-8745',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-635-5478',
'318-632-5487',
'liz@aol.com',
'Bob',
'Smith',
'654-85-8742',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-635-5478',
'318-965-6224',
'bob@aol.com'),
('Lucas',
'Smith',
'12/26/2000',
'654-88-5555',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'12',
'Liz',
'Smith',
'654-85-8745',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-635-5478',
'318-632-5487',
'liz@aol.com',
'Bob',
'Smith',
'654-85-8742',
'123 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-635-5478',
'318-965-6224',
'bob@aol.com'),
('Jackson',
'Williams',
'05/12/2012',
'458-63-6201',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71115',
'5',
'Beth',
'Williams',
'852-00-3214',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71112',
'318-555-8900',
'318-234-4246',
'beth@gmail.com',
'Josh',
'Williams',
'632-21-8755',
'4959 Barksdale Blvd',
'Apt 215',
'Bossier City',
'LA',
'71112',
'318-632-2100',
'318-548-7778',
'josh@gmail.com'),
('Emma',
'Johnson',
'12/05/2011',
'458-87-9999',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'6',
'Myesha',
'Johnson',
'654-62-0025',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'318-002-6547',
'318-321-9630',
'myesha@gmail.com',
'Jacob',
'Johnson',
'111-21-8878',
'4567 Airline Dr',
'Apt 5555',
'Bossier City',
'LA',
'71113',
'318-548-2222',
'318-000-2225',
'jacob@gmail.com'),
('Alyssa',
'Stanley',
'03/15/2012',
'654-55-5585',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'K',
'Stephanie',
'Stanley',
'548-22-6345',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'318-458-9969',
'318-336-3333',
'stephanie@gmail.com',
'Kevin',
'Stanley',
'458-99-3321',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'318-254-9999',
'318-001-0002',
'kevin@gmail.com'),
('Aiden',
'Stanley',
'08/21/2010',
'654-88-8888',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'5',
'Stephanie',
'Stanley',
'548-22-6345',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'318-458-9969',
'318-336-3333',
'stephanie@gmail.com',
'Kevin',
'Stanley',
'458-99-3321',
'4919 General Rusk Dr',
'',
'Bossier City',
'LA',
'71112',
'318-254-9999',
'318-001-0002',
'kevin@gmail.com'),
('Olivia',
'Wilson',
'05/22/2010',
'123-33-1101',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Samantha',
'Wilson',
'548-88-8888',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-799-9999',
'318-888-8888',
'samantha@gmail.com',
'Ryan',
'Wilson',
'548-88-5210',
'767 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-222-2222',
'318-333-3333',
'ryan@gmail.com'),
('Ethan',
'Davis',
'07/02/2010',
'111-11-1111',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Stacy',
'Davis',
'887-88-8888',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-878-2222',
'318-211-0002',
'stacy@gmail.com',
'Brad',
'Davis',
'555-55-5555',
'8788 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-555-5555',
'318-548-5521',
'brad@gmail.com'),
('Emily',
'Carter',
'06/03/2010',
'222-22-2222',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Pam',
'Carter',
'878-999-9999',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-215-5478',
'318-302-2000',
'pam@gmail.com',
'Chuck',
'Davis',
'888-88-0012',
'25 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-887-9999',
'318-548-2000',
'chuck@gmail.com'),
('Michael',
'Anderson',
'04/04/2010',
'444-44-4444',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Trinity',
'Anderson',
'878-88-5500',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-548-5555',
'318-212-2222',
'trinity@gmail.com',
'Neo',
'Anderson',
'854-55-5200',
'85 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-888-8888',
'318-888-8889',
'the_one@gmail.com'),
('Frodo',
'Baggins',
'07/07/2010',
'777-77-777',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mary',
'Baggins',
'555-55-0000',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-878-7777',
'318-222-1111',
'mary@gmail.com',
'Bilbo',
'Baggins',
'888-77-2215',
'10 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-000-0000',
'318-999-9999',
'bilbo@gmail.com'),
('Spider',
'Man',
'09/09/2010',
'555-45-4444',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545-21-1113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-000-0030',
'318-000-0020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111-12-1212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-878-8778',
'318-959-5529',
'mr_man@gmail.com'),
('Ant',
'Man',
'10/10/2010',
'151-55-5123',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545-21-1113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-000-0030',
'318-000-0020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111-12-1212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-878-8778',
'318-959-5529',
'mr_man@gmail.com'),
('Iron',
'Man',
'11/11/2010',
'00-11-4444',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'5',
'Mrs',
'Man',
'545-21-1113',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-000-0030',
'318-000-0020',
'mrs_man@gmail.com',
'Mr',
'Man',
'111-12-1212',
'99 Main St',
'',
'Bossier City',
'LA',
'71112',
'318-878-8778',
'318-959-5529',
'mr_man@gmail.com'),
('Dean',
'Winchester',
'12/12/2004',
'448-88-9512',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'11',
'Mary',
'Winchester',
'878-55-5542',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'318-111-2112',
'318-222-3353',
'mary@gmail.com',
'John',
'Winchester',
'878-55-5544',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'318-002-2235',
'318-002-2234',
'john@gmail.com'),
('Sam',
'Winchester',
'01/12/2005',
'414-11-4123',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'8',
'Mary',
'Winchester',
'878-55-5542',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'318-111-2112',
'318-222-3353',
'mary@gmail.com',
'John',
'Winchester',
'878-55-5544',
'44 Buzz Blvd',
'',
'Shreveport',
'LA',
'70025',
'318-002-2235',
'318-002-2234',
'john@gmail.com');


END