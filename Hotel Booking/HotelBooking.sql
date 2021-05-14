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
-- Table `mydb`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hotel` (
  `Hotel No` INT NOT NULL,
  `Hotel Name` VARCHAR(45) NOT NULL,
  `Hotel Address` VARCHAR(45) NOT NULL,
  `Hotel Phone Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Hotel No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Customer ID` INT NOT NULL,
  `Customer Name` VARCHAR(45) NOT NULL,
  `Customer Phone Number` VARCHAR(45) NOT NULL,
  `Hotel_Hotel No` INT NOT NULL,
  PRIMARY KEY (`Customer ID`, `Hotel_Hotel No`),
  INDEX `fk_Customer_Hotel_idx` (`Hotel_Hotel No` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Hotel`
    FOREIGN KEY (`Hotel_Hotel No`)
    REFERENCES `mydb`.`Hotel` (`Hotel No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Room` (
  `Room No` INT NOT NULL,
  `Floor No` VARCHAR(45) NOT NULL,
  `Hotel_Hotel No` INT NOT NULL,
  PRIMARY KEY (`Room No`),
  INDEX `fk_Room_Hotel1_idx` (`Hotel_Hotel No` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Hotel1`
    FOREIGN KEY (`Hotel_Hotel No`)
    REFERENCES `mydb`.`Hotel` (`Hotel No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
