SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema marius
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marius` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `marius` ;

-- -----------------------------------------------------
-- Table `marius`.`discipline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marius`.`discipline` ;

CREATE TABLE IF NOT EXISTS `marius`.`discipline` (
  `discipline_id` INT NOT NULL AUTO_INCREMENT,
  `discipline` VARCHAR(45) NULL,
  PRIMARY KEY (`discipline_id`))
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marius`.`shedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marius`.`shedule` ;

CREATE TABLE IF NOT EXISTS `marius`.`shedule` (
  `shedule_id` INT NOT NULL,
  `discipline_id` INT NOT NULL,
  PRIMARY KEY (`shedule_id`),
  INDEX `fk_shedule_discipline_idx` (`discipline_id` ASC),
  CONSTRAINT `fk_shedule_discipline`
  FOREIGN KEY (`discipline_id`)
  REFERENCES `marius`.`discipline` (`discipline_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marius`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marius`.`user` ;

CREATE TABLE IF NOT EXISTS `marius`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `role` VARCHAR(45) NOT NULL DEFAULT 'ROLE_USER',
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(100) NULL,
  `full_name_p1` VARCHAR(45) NULL,
  `full_name_p2` VARCHAR(45) NULL,
  `phone` INT(20) NULL,
  PRIMARY KEY (`id`))
   ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marius`.`notes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marius`.`homework` ;

CREATE TABLE IF NOT EXISTS `marius`.`homework` (
  `homework_id` INT NOT NULL AUTO_INCREMENT,
  `homework` VARCHAR(45) NULL,
  `homework_date` DATE NULL,
  `discipline_id` INT NOT NULL,
  PRIMARY KEY (`homework_id`),
  INDEX `fk_homework_discipline1_idx` (`discipline_id` ASC),
  CONSTRAINT `fk_homework_discipline1`
  FOREIGN KEY (`discipline_id`)
  REFERENCES `marius`.`discipline` (`discipline_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marius`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marius`.`rating` ;

CREATE TABLE IF NOT EXISTS `marius`.`rating` (
  `rating_id` INT NOT NULL AUTO_INCREMENT,
  `rating_date` DATE NULL,
  `rating` INT NULL,
  `user_id` INT NOT NULL,
  `discipline_id` INT NOT NULL,
  PRIMARY KEY (`rating_id`),
  INDEX `fk_rating_user1_idx` (`user_id` ASC),
  INDEX `fk_rating_discipline1_idx` (`discipline_id` ASC),
  CONSTRAINT `fk_rating_user1`
  FOREIGN KEY (`user_id`)
  REFERENCES `marius`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rating_discipline1`
  FOREIGN KEY (`discipline_id`)
  REFERENCES `marius`.`discipline` (`discipline_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
