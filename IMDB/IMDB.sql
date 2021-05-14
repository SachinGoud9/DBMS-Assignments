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
-- Table `mydb`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Movie` (
  `Movie No` INT NOT NULL,
  `Movie Name` VARCHAR(45) NOT NULL,
  `Movie Release Date` DATE NOT NULL,
  `Movie Length` INT NOT NULL,
  PRIMARY KEY (`Movie No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TVSeries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TVSeries` (
  `TVSeries No` INT NOT NULL,
  `TVSeries Name` VARCHAR(45) NOT NULL,
  `TVSeries Channel` VARCHAR(45) NOT NULL,
  `TVSeries Timings` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TVSeries No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cast` (
  `Movie_Movie No` INT NOT NULL,
  `TVSeries_TVSeries No` INT NOT NULL,
  PRIMARY KEY (`Movie_Movie No`, `TVSeries_TVSeries No`),
  INDEX `fk_Cast_TVSeries1_idx` (`TVSeries_TVSeries No` ASC) VISIBLE,
  CONSTRAINT `fk_Cast_Movie`
    FOREIGN KEY (`Movie_Movie No`)
    REFERENCES `mydb`.`Movie` (`Movie No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cast_TVSeries1`
    FOREIGN KEY (`TVSeries_TVSeries No`)
    REFERENCES `mydb`.`TVSeries` (`TVSeries No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Actor` (
  `Actor Name` INT NOT NULL,
  `Actor Address` VARCHAR(45) NOT NULL,
  `Actor Phone Number` INT NOT NULL,
  `Actor Gender` VARCHAR(45) NOT NULL,
  `Actor Age` INT NOT NULL,
  `Cast_Movie_Movie No` INT NOT NULL,
  PRIMARY KEY (`Actor Name`, `Cast_Movie_Movie No`),
  INDEX `fk_Actor_Cast1_idx` (`Cast_Movie_Movie No` ASC) VISIBLE,
  CONSTRAINT `fk_Actor_Cast1`
    FOREIGN KEY (`Cast_Movie_Movie No`)
    REFERENCES `mydb`.`Cast` (`Movie_Movie No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Customer ID` INT NOT NULL,
  `Customer Name` VARCHAR(45) NOT NULL,
  `Customer Address` VARCHAR(45) NOT NULL,
  `Customer Age` INT NOT NULL,
  `Customer Aadhar Number` INT NOT NULL,
  `Customer Gender` VARCHAR(45) NOT NULL,
  `Accounts_Account No` INT NOT NULL,
  `Accounts_Branch_Branch No` INT NOT NULL,
  PRIMARY KEY (`Customer ID`, `Accounts_Account No`, `Accounts_Branch_Branch No`),
  INDEX `fk_Customer_Accounts1_idx` (`Accounts_Account No` ASC, `Accounts_Branch_Branch No` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Accounts1`
    FOREIGN KEY (`Accounts_Account No` , `Accounts_Branch_Branch No`)
    REFERENCES `mydb`.`Accounts` (`Account No` , `Branch_Branch No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Branch` (
  `Branch No` INT NOT NULL,
  `Branch Name` VARCHAR(45) NOT NULL,
  `IFSC Code` VARCHAR(45) NOT NULL,
  `Customer_Customer ID` INT NOT NULL,
  `Customer_Accounts_Account No` INT NOT NULL,
  `Customer_Accounts_Branch_Branch No` INT NOT NULL,
  PRIMARY KEY (`Branch No`, `Customer_Customer ID`, `Customer_Accounts_Account No`, `Customer_Accounts_Branch_Branch No`),
  INDEX `fk_Branch_Customer1_idx` (`Customer_Customer ID` ASC, `Customer_Accounts_Account No` ASC, `Customer_Accounts_Branch_Branch No` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_Customer1`
    FOREIGN KEY (`Customer_Customer ID` , `Customer_Accounts_Account No` , `Customer_Accounts_Branch_Branch No`)
    REFERENCES `mydb`.`Customer` (`Customer ID` , `Accounts_Account No` , `Accounts_Branch_Branch No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Accounts` (
  `Account No` INT NOT NULL,
  `Account Holder Name` VARCHAR(45) NOT NULL,
  `Account Branch` VARCHAR(45) NOT NULL,
  `Accountcol` VARCHAR(45) NULL,
  `Branch_Branch No` INT NOT NULL,
  PRIMARY KEY (`Account No`, `Branch_Branch No`),
  INDEX `fk_Accounts_Branch1_idx` (`Branch_Branch No` ASC) VISIBLE,
  CONSTRAINT `fk_Accounts_Branch1`
    FOREIGN KEY (`Branch_Branch No`)
    REFERENCES `mydb`.`Branch` (`Branch No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
