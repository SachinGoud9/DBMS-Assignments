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
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `Order No` INT NOT NULL,
  `Order Date and Time` DATETIME NOT NULL,
  PRIMARY KEY (`Order No`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Customer ID` INT NOT NULL,
  `Customer Name` VARCHAR(45) NOT NULL,
  `Customer Address` VARCHAR(45) NOT NULL,
  `Customer Phone Number` INT NOT NULL,
  `Order_Order No` INT NOT NULL,
  PRIMARY KEY (`Customer ID`, `Order_Order No`),
  INDEX `fk_Customer_Order1_idx` (`Order_Order No` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Order1`
    FOREIGN KEY (`Order_Order No`)
    REFERENCES `mydb`.`Order` (`Order No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Supplier` (
  `Supplier ID` INT NOT NULL,
  `Suppliercol` VARCHAR(45) NULL,
  PRIMARY KEY (`Supplier ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Items` (
  `Item ID` INT NOT NULL,
  `Item Name` VARCHAR(45) NOT NULL,
  `Item Type` VARCHAR(45) NOT NULL,
  `Item Cost` VARCHAR(45) NOT NULL,
  `Supplier_Supplier ID` INT NOT NULL,
  `Order_Order No` INT NOT NULL,
  PRIMARY KEY (`Item ID`, `Supplier_Supplier ID`, `Order_Order No`),
  INDEX `fk_Items_Supplier_idx` (`Supplier_Supplier ID` ASC) VISIBLE,
  INDEX `fk_Items_Order1_idx` (`Order_Order No` ASC) VISIBLE,
  CONSTRAINT `fk_Items_Supplier`
    FOREIGN KEY (`Supplier_Supplier ID`)
    REFERENCES `mydb`.`Supplier` (`Supplier ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_Order1`
    FOREIGN KEY (`Order_Order No`)
    REFERENCES `mydb`.`Order` (`Order No`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
