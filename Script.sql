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
-- Table `mydb`.`nivel_paga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nivel_paga` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `hash_contraseña` VARCHAR(45) NOT NULL,
  `teléfono` VARCHAR(45) NOT NULL,
  `fk_nivel_paga` INT NOT NULL,
  `pago_vigente` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_nivel_paga_idx` (`fk_nivel_paga` ASC) ,
  CONSTRAINT `fk_cliente_nivel_paga`
    FOREIGN KEY (`fk_nivel_paga`)
    REFERENCES `mydb`.`nivel_paga` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`red_social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`red_social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`redes_marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`redes_marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fk_marca` INT NOT NULL,
  `fk_red_social` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `fecha_unión` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_det_redes_cliente_cliente1_idx` (`fk_marca` ASC) ,
  INDEX `fk_det_redes_cliente_red_social1_idx` (`fk_red_social` ASC) ,
  CONSTRAINT `fk_det_redes_cliente_cliente1`
    FOREIGN KEY (`fk_marca`)
    REFERENCES `mydb`.`marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_det_redes_cliente_red_social1`
    FOREIGN KEY (`fk_red_social`)
    REFERENCES `mydb`.`red_social` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
