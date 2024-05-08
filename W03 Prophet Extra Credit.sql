use `studentdb`;

-- Remove table before creating it again.
DROP TABLE IF EXISTS prophet;

-- Create table.
CREATE TABLE prophet
( prophet_id    int unsigned primary key auto_increment
, prophet_number	int unsigned not null
, first_name    varchar(12)  not null
, middle_name   varchar(12)
, last_name     varchar(12)  not null )
AUTO_INCREMENT=1001;

-- Insert data into table.
INSERT INTO prophet
( 
  prophet_number
, last_name
, first_name
, middle_name )
VALUES
(1, 'Smith', 'Joseph', ''), 
(2, 'Young', 'Brigham', ''), 
(3, 'Taylor', 'John', ''), 
(4, 'Woodruff', 'Wilford', ''), 
(5, 'Snow', 'Lorenzo', ''), 
(6, 'Smith', 'Joseph', 'F'), 
(7, 'Grant', 'Heber', 'J'), 
(8, 'Smith', 'George', 'Albert'), 
(9, 'Mckay', 'David', 'O'), 
(10, 'Smith', 'Joseph', 'Feilding'),
(11, 'Lee', 'Halold', 'B'), 
(12, 'Kimball', 'Spencer', 'W'), 
(13, 'Benson', 'Ezra', 'Taft'), 
(14, 'Hunter', 'Howard', 'W'), 
(15, 'Hinkley', 'Gordon', 'B'), 
(16, 'Monson', 'Thomas', 'S'),
(17, 'Nelson', 'Russell', 'M');
-- Lets verify the data.
SELECT prophet_id
,		prophet_number
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
 FROM prophet;
 
 -- Lets verify the data.
SELECT prophet_id
,		prophet_number
,      last_name
,      first_name
,      IFNULL(middle_name,'') AS middle_name
 FROM prophet
 WHERE middle_name IS NOT NULL;