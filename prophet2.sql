-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema studentdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema studentdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prophet` DEFAULT CHARACTER SET utf8 ;
USE `prophet` ;

-- -----------------------------------------------------
-- Table `mydb`.`lookup`
-- -----------------------------------------------------
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
-- Table `mydb`.`member`
-- -----------------------------------------------------
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
    REFERENCES `mydb`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;


-- -----------------------------------------------------
-- Table `mydb`.`apostle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prophet`.`apostle` (
  `apostle_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` INT UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`apostle_id`),
  INDEX `apostle_id_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `apostle_fk1`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;


-- -----------------------------------------------------
-- Table `mydb`.`prophet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS prophet;
CREATE TABLE IF NOT EXISTS `prophet`.`prophet` (
  `prophet_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `apostle_id` INT UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`prophet_id`),
  INDEX `prophet_fk1_idx` (`apostle_id` ASC) VISIBLE,
  CONSTRAINT `prophet_fk1`
    FOREIGN KEY (`apostle_id`)
    REFERENCES `mydb`.`apostle` (`apostle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB AUTO_INCREMENT=1001;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


