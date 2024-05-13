-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prophet 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prophet` DEFAULT CHARACTER SET utf8 ;
USE `prophet` ;

-- -----------------------------------------------------
-- Table `prophet`.`lookup`
-- -----------------------------------------------------
SELECT 'CREATE lookup';
CREATE TABLE IF NOT EXISTS `prophet`.`lookup` (
  `lookup_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` VARCHAR(45) NOT NULL,
  `column_name` VARCHAR(45) NOT NULL,
  `lang` CHAR(2) NOT NULL,
  `type_name` VARCHAR(45) NOT NULL,
  `meaning` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`lookup_id`),
  INDEX `lookup_nk` (`table_name` ASC, `column_name` ASC, `lang` ASC, `type_name` ASC) VISIBLE)
ENGINE = InnoDB AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `prophet`.`member`
-- -----------------------------------------------------
SELECT 'CREATE member';
CREATE TABLE IF NOT EXISTS `prophet`.`member` (
  `member_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lookup_id` INT UNSIGNED NOT NULL,
  `member_number` VARCHAR(13) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `member_number_UNIQUE` (`member_number` ASC) VISIBLE,
  INDEX `member_fk1_idx` (`lookup_id` ASC) VISIBLE,
  CONSTRAINT `member_fk1`
    FOREIGN KEY (`lookup_id`)
    REFERENCES `prophet`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `prophet`.`apostle`
-- -----------------------------------------------------
SELECT 'CREATE apostle';
CREATE TABLE IF NOT EXISTS `prophet`.`apostle` (
  `apostle_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` INT UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`apostle_id`),
  INDEX `apostle_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `apostle_fk1`
    FOREIGN KEY (`member_id`)
    REFERENCES `prophet`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;

-- -----------------------------------------------------
-- Table `prophet`.`prophet`
-- -----------------------------------------------------
SELECT 'CREATE prophet';
CREATE TABLE IF NOT EXISTS `prophet`.`prophet` (
  `prophet_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apostle_id` INT UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`prophet_id`),
  INDEX `prophet_fk1_idx` (`apostle_id` ASC) VISIBLE,
  CONSTRAINT `prophet_fk1`
    FOREIGN KEY (`apostle_id`)
    REFERENCES `prophet`.`apostle` (`apostle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;

-- Cleanup environment.
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Show tables.
SHOW TABLES;

-- Modify the member table by changing the lookup_id 
-- column name to gender.
ALTER TABLE member
RENAME COLUMN lookup_id TO gender;

-- Modify the member table by changing the lookup_id 
-- column name to gender.
ALTER TABLE member
ADD COLUMN (priesthood int unsigned);

-- Insert gender column value.
INSERT INTO lookup
( table_name
, column_name
, lang
, type_name
, meaning )
VALUES
 ('MEMBER','GENDER','EN','MALE','Male')
,('MEMBER','GENDER','EN','FEMALE','Female')
,('MEMBER','PRIESTHOOD','EN','DEACON','Deacon')
,('MEMBER','PRIESTHOOD','EN','TEACHER','Teacher')
,('MEMBER','PRIESTHOOD','EN','PRIEST','Priest')
,('MEMBER','PRIESTHOOD','EN','ELDER','Elder')
,('MEMBER','PRIESTHOOD','EN','SEVENTY','Seventy')
,('MEMBER','PRIESTHOOD','EN','HIGH PRIEST','High Priest')
,('MEMBER','PRIESTHOOD','EN','APOSTLE','Apostle');

-- Add to the member table.
INSERT INTO member
( gender
, member_number
, priesthood 
, last_name
, first_name
, middle_name )
SELECT   g.lookup_id
,        CASE
           WHEN p.prophet_number < 10 THEN
             CONCAT('000-0000-000',p.prophet_number)
           ELSE
             CONCAT('000-0000-00',p.prophet_number)
         END
,        op.lookup_id
,        p.last_name
,        p.first_name
,        p.middle_name
FROM     prophet p CROSS JOIN 
          (SELECT   l.lookup_id
           FROM     lookup l
           WHERE    l.table_name = 'MEMBER'
           AND      l.column_name = 'GENDER'
           AND      l.lang = 'EN'
           AND      l.type_name = 'MALE') g CROSS JOIN
          (SELECT   l.lookup_id
           FROM     lookup l
           WHERE    l.table_name = 'MEMBER'
           AND      l.column_name = 'PRIESTHOOD'
           AND      l.lang = 'EN'
           AND      l.type_name = 'APOSTLE') op;

-- Verify the inserts into the member table.
SELECT * FROM member;

-- Format and substitute lookup meaning for foreign key value.
SELECT  CONCAT(last_name,', ',first_name,' ',IFNULL(middle_name,'')) AS full_name
,       member_number
,      (SELECT meaning FROM lookup WHERE lookup_id = priesthood)
FROM    member;

-- Sample insert statement to apostle table.
INSERT INTO apostle
( member_id
, start_date
, end_date )
VALUES
((SELECT m.member_id
  FROM   member m
  WHERE  m.last_name = 'Smith'
  AND    m.first_name = 'Joseph'
  AND    m.middle_name IS NULL)
,'1830-04-06'
,'1844-06-27');

-- Enter the rest apostle entries here.

-- Sample insert statement to prophet table.
INSERT INTO prophet
( apostle_id
, start_date
, end_date )
VALUES
((SELECT a.apostle_id
  FROM   apostle a
  WHERE  a.last_name = 'Smith'
  AND    a.first_name = 'Joseph'
  AND    a.middle_name IS NULL)
,'1830-04-06'
,'1844-06-27');

-- Enter the rest prophet entries here.