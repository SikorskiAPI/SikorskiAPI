-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cotacaoGrao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cotacaoGrao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cotacaoGrao` ;
USE `cotacaoGrao` ;

-- -----------------------------------------------------
-- Table `cotacaoGrao`.`Val_Milho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cotacaoGrao`.`Val_Milho` (
  `idVal_Milho` INT NOT NULL AUTO_INCREMENT,
  `Val_Milhocol` VARCHAR(45) NOT NULL,
  `DATA_cotacao` DATE NOT NULL,
  PRIMARY KEY (`idVal_Milho`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cotacaoGrao`.`Val_Algodao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cotacaoGrao`.`Val_Algodao` (
  `idVal_Algodao` INT NOT NULL AUTO_INCREMENT,
  `Val_Algodaocol` VARCHAR(45) NOT NULL,
  `DATA_cotacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVal_Algodao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cotacaoGrao`.`Val_Soja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cotacaoGrao`.`Val_Soja` (
  `idVal_Soja` INT NOT NULL AUTO_INCREMENT,
  `Val_Sojacol` VARCHAR(45) NOT NULL,
  `DATA_cotacao` DATE NOT NULL,
  PRIMARY KEY (`idVal_Soja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cotacaoGrao`.`ValorGrao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cotacaoGrao`.`ValorGrao` (
  `idVal` INT NOT NULL AUTO_INCREMENT,
  `Val_Milho_idVal_Milho` INT NOT NULL,
  `Val_Algodao_idVal_Algodao` INT NOT NULL,
  `Val_Soja_idVal_Soja` INT NOT NULL,
  PRIMARY KEY (`idVal`),
  INDEX `fk_ValorGrao_Val_Milho_idx` (`Val_Milho_idVal_Milho` ASC) VISIBLE,
  INDEX `fk_ValorGrao_Val_Algodao1_idx` (`Val_Algodao_idVal_Algodao` ASC) VISIBLE,
  INDEX `fk_ValorGrao_Val_Soja1_idx` (`Val_Soja_idVal_Soja` ASC) VISIBLE,
  CONSTRAINT `fk_ValorGrao_Val_Milho`
    FOREIGN KEY (`Val_Milho_idVal_Milho`)
    REFERENCES `cotacaoGrao`.`Val_Milho` (`idVal_Milho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ValorGrao_Val_Algodao1`
    FOREIGN KEY (`Val_Algodao_idVal_Algodao`)
    REFERENCES `cotacaoGrao`.`Val_Algodao` (`idVal_Algodao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ValorGrao_Val_Soja1`
    FOREIGN KEY (`Val_Soja_idVal_Soja`)
    REFERENCES `cotacaoGrao`.`Val_Soja` (`idVal_Soja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
