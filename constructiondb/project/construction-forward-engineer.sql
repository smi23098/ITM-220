-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema constructiondb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `constructiondb` ;

-- -----------------------------------------------------
-- Schema constructiondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `constructiondb` ;
USE `constructiondb` ;

-- -----------------------------------------------------
-- Table `constructiondb`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`state` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`state` (
  `state_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `state_name` VARCHAR(45) NOT NULL,
  `state_code` CHAR(2) NOT NULL,
  PRIMARY KEY (`state_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`city` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`city` (
  `city_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`zip_code`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`zip_code` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`zip_code` (
  `zip_code_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `zip_code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`zip_code_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`address` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`address` (
  `address_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city_id` INT UNSIGNED NOT NULL,
  `street_num` INT UNSIGNED NOT NULL,
  `street_name` VARCHAR(45) NOT NULL,
  `unit_num` VARCHAR(15) NULL,
  `zip_code_id` INT UNSIGNED NOT NULL,
  `state_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `fk_address_city1_idx` (`city_id` ASC) VISIBLE,
  INDEX `fk_address_zip_code1_idx` (`zip_code_id` ASC) VISIBLE,
  INDEX `fk_address_state1_idx` (`state_id` ASC) VISIBLE,
  CONSTRAINT `address_fk1`
    FOREIGN KEY (`city_id`)
    REFERENCES `constructiondb`.`city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `address_fk2`
    FOREIGN KEY (`zip_code_id`)
    REFERENCES `constructiondb`.`zip_code` (`zip_code_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `address_fk3`
    FOREIGN KEY (`state_id`)
    REFERENCES `constructiondb`.`state` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`subcontractor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`subcontractor` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`subcontractor` (
  `subcontractor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `subcontractor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subcontractor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`template`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`template` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`template` (
  `template_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_cost` DECIMAL(8,2) UNSIGNED NOT NULL,
  `unit_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `end_date` DATE NOT NULL,
  `start_date` DATE NOT NULL,
  PRIMARY KEY (`template_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`project` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`project` (
  `project_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`project_id`),
  INDEX `fk_project_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `project_fk1`
    FOREIGN KEY (`address_id`)
    REFERENCES `constructiondb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`task` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`task` (
  `task_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_type` VARCHAR(45) NOT NULL,
  `template_id` INT UNSIGNED NOT NULL,
  `project_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`task_id`),
  INDEX `fk_work_template1_idx` (`template_id` ASC) VISIBLE,
  INDEX `fk_task_project1_idx` (`project_id` ASC) VISIBLE,
  CONSTRAINT `task_fk1`
    FOREIGN KEY (`template_id`)
    REFERENCES `constructiondb`.`template` (`template_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `task_fk2`
    FOREIGN KEY (`project_id`)
    REFERENCES `constructiondb`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`subcontractor_task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`subcontractor_task` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`subcontractor_task` (
  `task_id` INT UNSIGNED NOT NULL,
  `subcontractor_id` INT UNSIGNED NOT NULL,
  `contract_cost` DECIMAL(8,2) UNSIGNED NOT NULL,
  `estimated_cost` DECIMAL(8,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`task_id`, `subcontractor_id`),
  INDEX `fk_subcontractor_work_subcontractor1_idx` (`subcontractor_id` ASC) VISIBLE,
  CONSTRAINT `subcontractor_task_fk1`
    FOREIGN KEY (`task_id`)
    REFERENCES `constructiondb`.`task` (`task_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subcontractor_task_fk2`
    FOREIGN KEY (`subcontractor_id`)
    REFERENCES `constructiondb`.`subcontractor` (`subcontractor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`subcontractor_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`subcontractor_address` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`subcontractor_address` (
  `subcontractor_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `addr_start` DATE NOT NULL,
  `addr_end` DATE NOT NULL,
  PRIMARY KEY (`subcontractor_id`, `address_id`),
  INDEX `fk_subcontractor_has_address_address1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_subcontractor_has_address_subcontractor1_idx` (`subcontractor_id` ASC) VISIBLE,
  CONSTRAINT `subcontractor_address_fk1`
    FOREIGN KEY (`subcontractor_id`)
    REFERENCES `constructiondb`.`subcontractor` (`subcontractor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subcontractor_address_fk2`
    FOREIGN KEY (`address_id`)
    REFERENCES `constructiondb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`insurance_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`insurance_company` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`insurance_company` (
  `insurance_company_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`insurance_company_id`),
  INDEX `fk_insurance_company_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `insurance_company_fk1`
    FOREIGN KEY (`address_id`)
    REFERENCES `constructiondb`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`insurance_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`insurance_type` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`insurance_type` (
  `insurance_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`insurance_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `constructiondb`.`insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `constructiondb`.`insurance` ;

CREATE TABLE IF NOT EXISTS `constructiondb`.`insurance` (
  `insurance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `exp_date` DATE NOT NULL,
  `subcontractor_id` INT UNSIGNED NOT NULL,
  `insurance_company_id` INT UNSIGNED NOT NULL,
  `insurance_type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`insurance_id`),
  INDEX `fk_insurance_subcontractor1_idx` (`subcontractor_id` ASC) VISIBLE,
  INDEX `fk_insurance_insurance_company1_idx` (`insurance_company_id` ASC) VISIBLE,
  INDEX `fk_insurance_insurance_type1_idx` (`insurance_type_id` ASC) VISIBLE,
  CONSTRAINT `insurance_fk1`
    FOREIGN KEY (`subcontractor_id`)
    REFERENCES `constructiondb`.`subcontractor` (`subcontractor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `insurance_fk2`
    FOREIGN KEY (`insurance_company_id`)
    REFERENCES `constructiondb`.`insurance_company` (`insurance_company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `insurance_fk3`
    FOREIGN KEY (`insurance_type_id`)
    REFERENCES `constructiondb`.`insurance_type` (`insurance_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
