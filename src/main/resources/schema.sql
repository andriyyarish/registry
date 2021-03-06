-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema register
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `register` ;

-- -----------------------------------------------------
-- Schema register
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `register` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `register` ;

-- -----------------------------------------------------
-- Table `register`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`user` ;

CREATE TABLE IF NOT EXISTS `register`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `telegram_id` VARCHAR(45) NULL,
  `date_created` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`authority` ;

CREATE TABLE IF NOT EXISTS `register`.`authority` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`customer` ;

CREATE TABLE IF NOT EXISTS `register`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `org_name` VARCHAR(45) NULL,
  `email` VARCHAR(30) NULL,
  `phone` VARCHAR(10) NULL,
  `region` VARCHAR(15) NULL,
  `district` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `first_name` VARCHAR(40) NULL,
  `last_name` VARCHAR(40) NULL,
  `comment` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`contract` ;

CREATE TABLE IF NOT EXISTS `register`.`contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contract_identifier` VARCHAR(45) NULL,
  `customer_id` INT NULL,
  `region` VARCHAR(45) NULL,
  `district` VARCHAR(45) NULL,
  `village_council` VARCHAR(45) NULL,
  `square` DOUBLE NULL,
  `order_type` VARCHAR(45) NULL,
  `order_status` VARCHAR(45) NULL,
  `is_finished` TINYINT NULL,
  `stage` VARCHAR(45) NULL,
  `total_price` DOUBLE NULL,
  `payed_amount` DOUBLE NULL,
  `registered` DATE NULL,
  `updated` DATE NULL,
  `created_by` INT NULL,
  `assigned_to` INT NULL,
  `comment` VARCHAR(300) NULL,
  `total_costs` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `register`.`post_contract_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`post_contract_info` ;

CREATE TABLE IF NOT EXISTS `register`.`post_contract_info` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `contract_id` INT(11) NOT NULL,
  `is_paid_to_performer` TINYINT(4) NULL DEFAULT '0',
  `is_paid_to_geodez` TINYINT(4) NULL DEFAULT '0',
  `is_measurement_done` TINYINT(4) NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `contract_idx` (`contract_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------
-- Table `register`.`stage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`stage` ;

CREATE TABLE IF NOT EXISTS `register`.`stage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NULL,
  `comment` VARCHAR(45) NULL,
  `max_in_progress` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`status` ;

CREATE TABLE IF NOT EXISTS `register`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NULL,
  `comment` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`contract_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`contract_type` ;

CREATE TABLE IF NOT EXISTS `register`.`contract_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(45) NULL,
  `comment` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`user_authority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`user_authority` ;

CREATE TABLE IF NOT EXISTS `register`.`user_authority` (
  `user_id` INT NOT NULL,
  `authority_id` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`contract_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`contract_log` ;

CREATE TABLE IF NOT EXISTS `register`.`contract_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contract_id` INT NULL,
  `message` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `register`.`contract_attachments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `register`.`contract_attachments` ;

CREATE TABLE IF NOT EXISTS `register`.`contract_attachments` (
  `contract_id` INT NOT NULL,
  `file_path` VARCHAR(100) NULL,
  `file_category` VARCHAR(20) NULL,
  PRIMARY KEY (`contract_id`))
ENGINE = InnoDB;