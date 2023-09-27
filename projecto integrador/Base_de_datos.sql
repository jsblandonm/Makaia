-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_Mensajeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_Mensajeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_Mensajeria` DEFAULT CHARACTER SET utf8 ;
USE `db_Mensajeria` ;

-- -----------------------------------------------------
-- Table `db_Mensajeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`cliente` (
  `cedula_cliente` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NULL,
  `direcion` VARCHAR(150) NOT NULL,
  `ciudad` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`cedula_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`tipo_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`tipo_empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`estado_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`estado_envio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`tipo_paquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`tipo_paquete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`paquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`paquete` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_paquete` INT NOT NULL,
  `peso` VARCHAR(45) NOT NULL,
  `valor_declarado` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_tipo_paquete`
    FOREIGN KEY (`id`)
    REFERENCES `db_Mensajeria`.`tipo_paquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`envio` (
  `numero_guia` VARCHAR(10) NOT NULL,
  `cedula_cliente` INT NOT NULL,
  `ciudad_origen` VARCHAR(100) NOT NULL,
  `ciudad_destino` VARCHAR(100) NOT NULL,
  `direccion_destino` VARCHAR(100) NOT NULL,
  `nombre_persona_recibe` VARCHAR(100) NOT NULL,
  `numero_celular_recibe` VARCHAR(50) NOT NULL,
  `hora_entrega` DATETIME NOT NULL,
  `id_estad_envio` INT NOT NULL,
  `valor_envio` DOUBLE NOT NULL,
  `id_paquete` INT NOT NULL,
  PRIMARY KEY (`numero_guia`),
  INDEX `id_estado_envio_idx` (`id_estad_envio` ASC) VISIBLE,
  INDEX `cedula_cliente_idx` (`cedula_cliente` ASC) VISIBLE,
  INDEX `id_paquete_idx` (`id_paquete` ASC) VISIBLE,
  CONSTRAINT `id_estado_envio`
    FOREIGN KEY (`id_estad_envio`)
    REFERENCES `db_Mensajeria`.`estado_envio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula_cliente`
    FOREIGN KEY (`cedula_cliente`)
    REFERENCES `db_Mensajeria`.`cliente` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_paquete`
    FOREIGN KEY (`id_paquete`)
    REFERENCES `db_Mensajeria`.`paquete` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_Mensajeria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_Mensajeria`.`empleado` (
  `cedula_empleado` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `ciudad` VARCHAR(100) NOT NULL,
  `antiguedad_empresa` INT NOT NULL,
  `tipo_sangre` VARCHAR(10) NOT NULL,
  `id_tipo_de_empleado` INT NOT NULL,
  INDEX `id_tipo_empleado_idx` (`id_tipo_de_empleado` ASC) VISIBLE,
  PRIMARY KEY (`cedula_empleado`),
  CONSTRAINT `id_tipo_empleado`
    FOREIGN KEY (`id_tipo_de_empleado`)
    REFERENCES `db_Mensajeria`.`tipo_empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cedula`
    FOREIGN KEY (`cedula_empleado`)
    REFERENCES `db_Mensajeria`.`envio` (`cedula_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
