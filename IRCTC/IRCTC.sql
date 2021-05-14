-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `Ticket ID` INT NOT NULL,
  `Date and TIme` DATETIME NULL,
  `Starting Station` VARCHAR(45) NULL,
  `Destination Station` VARCHAR(45) NULL,
  `Cost` DECIMAL NULL,
  `Ticket Status` VARCHAR(45) NULL,
  PRIMARY KEY (`Ticket ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Customer ID` INT NOT NULL,
  `Customer Name` VARCHAR(45) NULL,
  `Customer Age` VARCHAR(45) NULL,
  `Customer Gender` INT NOT NULL,
  `Ticket_Ticket ID` INT NOT NULL,
  PRIMARY KEY (`Customer ID`, `Ticket_Ticket ID`),
  INDEX `fk_Customer_Ticket1_idx` (`Ticket_Ticket ID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Ticket1`
    FOREIGN KEY (`Ticket_Ticket ID`)
    REFERENCES `mydb`.`Ticket` (`Ticket ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Train`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Train` (
  `Train No` INT NOT NULL,
  `Starting Station` VARCHAR(45) NULL,
  `Destination Station` VARCHAR(45) NULL,
  `Train Name` VARCHAR(45) NULL,
  `Train Timing` VARCHAR(45) NULL,
  PRIMARY KEY (`Train No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Unreserved Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Unreserved Ticket` (
  `Coach Number` INT NOT NULL,
  `Seat Number` VARCHAR(45) NULL,
  `Ticket_Ticket ID` INT NOT NULL,
  `Train_Train No` INT NOT NULL,
  PRIMARY KEY (`Coach Number`, `Ticket_Ticket ID`, `Train_Train No`),
  INDEX `fk_Unreserved Ticket_Ticket1_idx` (`Ticket_Ticket ID` ASC) VISIBLE,
  INDEX `fk_Unreserved Ticket_Train1_idx` (`Train_Train No` ASC) VISIBLE,
  CONSTRAINT `fk_Unreserved Ticket_Ticket1`
    FOREIGN KEY (`Ticket_Ticket ID`)
    REFERENCES `mydb`.`Ticket` (`Ticket ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Unreserved Ticket_Train1`
    FOREIGN KEY (`Train_Train No`)
    REFERENCES `mydb`.`Train` (`Train No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserved Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserved Ticket` (
  `Ticket_Ticket ID` INT NOT NULL,
  PRIMARY KEY (`Ticket_Ticket ID`),
  CONSTRAINT `fk_Reserved Ticket_Ticket`
    FOREIGN KEY (`Ticket_Ticket ID`)
    REFERENCES `mydb`.`Ticket` (`Ticket ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
