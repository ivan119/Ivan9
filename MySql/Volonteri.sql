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
-- Table `mydb`.`Volonteri`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Volonteri` (
  `ID_Volontera` INT NOT NULL AUTO_INCREMENT,
  `Ime_Volontera` VARCHAR(45) NULL,
  `Prezime_Volontera` VARCHAR(45) NULL,
  `Spol_Volontera` VARCHAR(2) NULL,
  PRIMARY KEY (`ID_Volontera`),
  UNIQUE INDEX `ID_Volontera_UNIQUE` (`ID_Volontera` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Adresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Adresa` (
  `ID_Adrese` INT NOT NULL AUTO_INCREMENT,
  `Naziv_Adrese` VARCHAR(45) NULL,
  `Poštanski_Broj` VARCHAR(45) NULL,
  `Grad_Mjesto` VARCHAR(45) NULL,
  `Kucni_Broj` VARCHAR(45) NULL,
  `Volonteri_ID_Volontera` INT NULL,
  PRIMARY KEY (`ID_Adrese`),
  INDEX `fk_Adresa_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC) VISIBLE,
  CONSTRAINT `fk_Adresa_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Email` (
  `ID_Email` INT NOT NULL AUTO_INCREMENT,
  `Gmail` VARCHAR(45) NULL,
  `Hotmail` VARCHAR(45) NULL,
  `Volonteri_ID_Volontera` INT NULL,
  PRIMARY KEY (`ID_Email`),
  INDEX `fk_Email_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC) VISIBLE,
  UNIQUE INDEX `ID_Email_UNIQUE` (`ID_Email` ASC) VISIBLE,
  CONSTRAINT `fk_Email_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Brojevi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Brojevi` (
  `ID_Brojevi` INT NOT NULL AUTO_INCREMENT,
  `Broj_Moba` INT NULL,
  `Broj_Telefona` INT NULL,
  `Volonteri_ID_Volontera` INT NULL,
  `Volonteri_Nagradjivanja_ID_Nagradjivanja` INT NULL,
  PRIMARY KEY (`ID_Brojevi`),
  INDEX `fk_Brojevi_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC, `Volonteri_Nagradjivanja_ID_Nagradjivanja` ASC) VISIBLE,
  CONSTRAINT `fk_Brojevi_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zanimanje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zanimanje` (
  `Zanimanje` DECIMAL(20) NULL,
  `Status` VARCHAR(45) NULL,
  `Iskustovo_Volontiranja` VARCHAR(45) NULL,
  `Volonteri_ID_Volontera` INT NULL,
  `Volonteri_Nagradjivanja_ID_Nagradjivanja` INT NULL,
  INDEX `fk_Zanimanje_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC, `Volonteri_Nagradjivanja_ID_Nagradjivanja` ASC) VISIBLE,
  CONSTRAINT `fk_Zanimanje_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projekti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projekti` (
  `ID_Projekta` INT NOT NULL AUTO_INCREMENT,
  `Naziv_Projekta` VARCHAR(45) NULL,
  `Datum_Pocetka` DATETIME NULL,
  `Datum_Zavrsetka` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Projekta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Volonteri_has_Projekti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Volonteri_has_Projekti` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Volonteri_ID_Volontera` INT NULL,
  `Projekti_ID_Projekta` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Volonteri_has_Projekti_Projekti1_idx` (`Projekti_ID_Projekta` ASC) VISIBLE,
  INDEX `fk_Volonteri_has_Projekti_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC) VISIBLE,
  CONSTRAINT `fk_Volonteri_has_Projekti_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Volonteri_has_Projekti_Projekti1`
    FOREIGN KEY (`Projekti_ID_Projekta`)
    REFERENCES `mydb`.`Projekti` (`ID_Projekta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zaduzenja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zaduzenja` (
  `ID_Zaduzenja` INT NOT NULL AUTO_INCREMENT,
  `Opis_Posla` VARCHAR(45) NULL,
  `Sati_Volontiranja` INT NULL,
  `Datum_Pocetka_Zad` VARCHAR(45) NULL,
  `Datum_Zavrsetka_Zad` VARCHAR(45) NULL,
  `Volonteri_has_Projekti_id` INT NOT NULL,
  PRIMARY KEY (`ID_Zaduzenja`),
  INDEX `fk_Zaduzenja_Volonteri_has_Projekti1_idx` (`Volonteri_has_Projekti_id` ASC) VISIBLE,
  CONSTRAINT `fk_Zaduzenja_Volonteri_has_Projekti1`
    FOREIGN KEY (`Volonteri_has_Projekti_id`)
    REFERENCES `mydb`.`Volonteri_has_Projekti` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Izvjesca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Izvjesca` (
  `ID_Izvjesca` INT NOT NULL AUTO_INCREMENT,
  `Opis_Izvjesca` VARCHAR(45) NULL,
  `Datum_Predavanja` DATE NULL,
  `Datum_Od_Predavanja` DATE NULL,
  `Datum_Do_Predavanja` DATE NULL,
  `Zaduzenja_ID_Zaduzenja` INT NULL,
  PRIMARY KEY (`ID_Izvjesca`),
  INDEX `fk_Izvjesca_Zaduzenja1_idx` (`Zaduzenja_ID_Zaduzenja` ASC) VISIBLE,
  UNIQUE INDEX `Zaduzenja_ID_Zaduzenja_UNIQUE` (`Zaduzenja_ID_Zaduzenja` ASC) VISIBLE,
  CONSTRAINT `fk_Izvjesca_Zaduzenja1`
    FOREIGN KEY (`Zaduzenja_ID_Zaduzenja`)
    REFERENCES `mydb`.`Zaduzenja` (`ID_Zaduzenja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Troskovi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Troskovi` (
  `ID_Troskova` INT NOT NULL AUTO_INCREMENT,
  `Svrha_Troskova` VARCHAR(45) NULL,
  `Vrsta_Naknade` VARCHAR(45) NULL,
  `Iznos_Troskova` DECIMAL(6,2) NULL,
  `Datum_Isplate_Troskova` VARCHAR(45) NULL,
  `Volonteri_ID_Volontera` INT NULL,
  `Volonteri_Nagradjivanja_ID_Nagradjivanja` INT NULL,
  PRIMARY KEY (`ID_Troskova`),
  INDEX `fk_Troskovi_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC, `Volonteri_Nagradjivanja_ID_Nagradjivanja` ASC) VISIBLE,
  UNIQUE INDEX `ID_Troskova_UNIQUE` (`ID_Troskova` ASC) VISIBLE,
  UNIQUE INDEX `Volonteri_Nagradjivanja_ID_Nagradjivanja_UNIQUE` (`Volonteri_Nagradjivanja_ID_Nagradjivanja` ASC) VISIBLE,
  UNIQUE INDEX `Volonteri_ID_Volontera_UNIQUE` (`Volonteri_ID_Volontera` ASC) VISIBLE,
  CONSTRAINT `fk_Troskovi_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nagradjivanja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nagradjivanja` (
  `ID_Nagradjivanja` INT NOT NULL AUTO_INCREMENT,
  `Naziv_Ustanove` VARCHAR(45) NULL,
  `Naziv_Tecaja` VARCHAR(45) NULL,
  `Datum_Pocetka_Nagradjivanja` DATE NULL,
  `Datum_Zavrsetka_Nagradjivanja` DATE NULL,
  `Broj_Sati` INT NULL,
  `Iznos_Vrijednosti` DECIMAL NULL,
  `Opis_Nagradjivanja` VARCHAR(45) NULL,
  `Volonteri_ID_Volontera` INT NOT NULL,
  PRIMARY KEY (`ID_Nagradjivanja`),
  INDEX `fk_Nagradjivanja_Volonteri1_idx` (`Volonteri_ID_Volontera` ASC) VISIBLE,
  CONSTRAINT `fk_Nagradjivanja_Volonteri1`
    FOREIGN KEY (`Volonteri_ID_Volontera`)
    REFERENCES `mydb`.`Volonteri` (`ID_Volontera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
