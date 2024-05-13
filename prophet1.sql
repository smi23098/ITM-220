-- ------------------------------------------------------------
--  This conditionally drops all tables from only the prophet
--  database to avoid conflicts with the studentdb database.
-- ------------------------------------------------------------

-- Conditionally remove tables before creating them again.
DROP TABLE IF EXISTS prophet.lookup, prophet.member, prophet.apostle, prophet.prophet;

-- ------------------------------------------------------------
--  Original Extra Credit Problem:
--  =============================
--   This original problem has no conflict with the sakila or
--   studentdb database; however, the next phase will have a
--   conflict with the member table in the studentdb database.
--   You also want to avoid changing the sakila database to
--   avoid having to rebuild it.
--
--   The script is modified by adding a prefacing database 
--   name of prophet before the table name. The generic create
--   statement is:
-- 
--     database_name.table_name
--
--   The modified script will only run once you've created a
--   a prophet database and granted privileges to the student
--   user on all objects within the prophet database.
-- ------------------------------------------------------------

-- Create table.
CREATE TABLE prophet.prophet
( prophet_id    int unsigned primary key auto_increment
, first_name    varchar(12)  not null
, middle_name   varchar(12)
, last_name     varchar(12)  not null )
AUTO_INCREMENT=1001;

-- Insert data into table.
INSERT INTO prophet.prophet
( last_name
, first_name )
VALUES
('Smith'
,'Joseph');

INSERT INTO prophet.prophet
( last_name
, first_name
, middle_name )
VALUES
('Smith'
,'Joseph'
,'F');

INSERT INTO prophet.prophet
( last_name
, first_name
, middle_name )
VALUES
('Smith'
,'Joseph'
,'Fielding');

-- ------------------------------------------------------------
--  This alters the prophet table without having to drop
--  and recreate it; and is likely a modification to your 
--  original script..
-- ------------------------------------------------------------
ALTER TABLE prophet.prophet
ADD COLUMN (prophet_number int);

-- ------------------------------------------------------------
--  This inserts the remaining prophets into the prophet table.
--  It uses a comma-delimited set of rows. Each row is
--  separated by parentheses.
--  
--  This INSERT statement uses NULL values for those without
--  middle names, which lets one override signature work for
--  all entries.
-- ------------------------------------------------------------
INSERT INTO prophet.prophet
( last_name
, first_name
, middle_name
, prophet_number )
VALUES
 ('Young','Brigham',NULL,2)
,('Taylor','John',NULL,3)
,('Woodruff','Wilford',NULL,4)
,('Snow','Lorenzo',NULL,5)
,('Grant','Heber','J',7)
,('Smith','George','Albert',8)
,('McKay','David','O',9)
,('Lee','Harold','B',11)
,('Kimball','Spencer','W',12)
,('Benson','Ezra','Taft',13)
,('Hunter','Howard','W',14)
,('Hinckley','Gordon','B',15)
,('Monson','Thomas','S',16)
,('Nelson','Russell','M',17);

-- ------------------------------------------------------------
--  These update satements let you add the prophet_number
--  value to the three rows originally entered for the first
--  extra credit assignment.
-- ------------------------------------------------------------

-- Update the prophet table for Joseph Smith.
UPDATE prophet
SET    prophet_number = 1
WHERE  last_name = 'Smith'
AND    first_name = 'Joseph'
AND    middle_name IS NULL;

-- Update the prophet table for Joseph F Smith.
UPDATE prophet
SET    prophet_number = 6
WHERE  last_name = 'Smith'
AND    first_name = 'Joseph'
AND    middle_name = 'F';

-- Update the prophet table for Joseph Fielding Smith.
UPDATE prophet
SET    prophet_number = 10
WHERE  last_name = 'Smith'
AND    first_name = 'Joseph'
AND    middle_name = 'Fielding';

-- Lets verify the data with a query against the prophet table.
SELECT prophet_id
,      prophet_number
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
 FROM prophet.prophet
 ORDER BY prophet_number;
 
-- ------------------------------------------------------------
--  This is beyond the original extra credit project.
-- ------------------------------------------------------------

-- Create a backup table.
 CREATE TABLE prophet.prophet_bu AS
 SELECT * FROM prophet.prophet;
 
-- Lets verify the data.
SELECT prophet_id
,      prophet_number
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
FROM prophet.prophet_bu
ORDER BY prophet_number;
 
-- Delete one row from the table.
DELETE FROM prophet.prophet_bu
WHERE  prophet_id = 1001;
 
-- ------------------------------------------------------------
--  This verifies whether the contents of the backup table
--  are the same as the primary table. It should return
--  one row because the foregoing script removed one row.
-- ------------------------------------------------------------
SELECT *
FROM    prophet.prophet
WHERE   (prophet_id, last_name, first_name, middle_name, prophet_number) NOT IN
 (SELECT prophet_id, last_name, first_name, middle_name, prophet_number
  FROM    prophet.prophet_bu);

-- ------------------------------------------------------------
--  This inserts the missing row from the backup table by 
--  querying the contents of the base table. It is considered
--  an incremental backup.
-- ------------------------------------------------------------
INSERT INTO prophet.prophet_bu
(SELECT *
 FROM    prophet.prophet
 WHERE   (prophet_id, last_name, first_name, middle_name, prophet_number) NOT IN
  (SELECT prophet_id, last_name, first_name, middle_name, prophet_number
  FROM    prophet.prophet_bu));
                                                     
-- ------------------------------------------------------------
--  This verifies whether the contents of the backup table
--  are the same as the primary table. It should return
--  an empty set after the incremental backup of the INSERT
--  statement.
-- ------------------------------------------------------------
SELECT *
FROM    prophet.prophet
WHERE   (prophet_id, last_name, first_name, middle_name, prophet_number) NOT IN
 (SELECT prophet_id, last_name, first_name, middle_name, prophet_number
  FROM    prophet.prophet_bu);
