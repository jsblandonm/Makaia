-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jardinera_MAKAIA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jardinera_MAKAIA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jardinera_MAKAIA` DEFAULT CHARACTER SET utf8 ;
USE `jardinera_MAKAIA` ;

-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`jefe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`jefe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`oficina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`oficina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `region` VARCHAR(50) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido1` VARCHAR(100) NOT NULL,
  `apelldio2` VARCHAR(100) NULL,
  `extension` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `id_oficina` INT NOT NULL,
  `id_jefe` INT NOT NULL,
  `puesto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_jefe_idx` (`id_jefe` ASC) VISIBLE,
  INDEX `id_oficina_idx` (`id_oficina` ASC) VISIBLE,
  CONSTRAINT `id_jefe`
    FOREIGN KEY (`id_jefe`)
    REFERENCES `jardinera_MAKAIA`.`jefe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_oficina`
    FOREIGN KEY (`id_oficina`)
    REFERENCES `jardinera_MAKAIA`.`oficina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `nombre_contacto` VARCHAR(100) NOT NULL,
  `apellido_contacto` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(30) NOT NULL,
  `fax` VARCHAR(30) NOT NULL,
  `direccion1` VARCHAR(100) NOT NULL,
  `direccion2` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  `region` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `codigo_postal` VARCHAR(10) NOT NULL,
  `id_empleado` INT NOT NULL,
  `limite_credito` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `jardinera_MAKAIA`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATETIME NOT NULL,
  `fecha_espera` DATETIME NOT NULL,
  `fecha_entrega` DATETIME NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `comentarios` TEXT(200) NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `jardinera_MAKAIA`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`pago` (
  `id_transaccion` VARCHAR(45) NOT NULL,
  `fk_pago_cliente` INT NOT NULL,
  `forma_pago` VARCHAR(50) NOT NULL,
  `fecha_pago` DATETIME NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  INDEX `fk_pago_cliente_idx` (`fk_pago_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_pago_cliente`
    FOREIGN KEY (`fk_pago_cliente`)
    REFERENCES `jardinera_MAKAIA`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`gama_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`gama_producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gama` VARCHAR(50) NOT NULL,
  `descripcion` TEXT(200) NOT NULL,
  `imagen` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `gama` INT NOT NULL,
  `dimensiones` VARCHAR(50) NOT NULL,
  `proveedor` VARCHAR(100) NOT NULL,
  `descripcion` TEXT(200) NOT NULL,
  `cantidad_stock` INT NOT NULL,
  `precio_venta` DOUBLE NOT NULL,
  `precio_porveedor` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `gama_idx` (`gama` ASC) VISIBLE,
  CONSTRAINT `gama`
    FOREIGN KEY (`gama`)
    REFERENCES `jardinera_MAKAIA`.`gama_producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jardinera_MAKAIA`.`detalle_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `jardinera_MAKAIA`.`detalle_pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_unidad` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_pedido_idx` (`id_pedido` ASC) VISIBLE,
  INDEX `id_producto_idx` (`id_producto` ASC) VISIBLE,
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `jardinera_MAKAIA`.`pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `jardinera_MAKAIA`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
