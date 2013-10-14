SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Expert`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Expert` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExpertiseArea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ExpertiseArea` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `originator` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ExpertArea_Expert1_idx` (`originator` ASC),
  CONSTRAINT `fk_ExpertArea_Expert1`
    FOREIGN KEY (`originator`)
    REFERENCES `mydb`.`Expert` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recommendation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recommendation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `justification` TEXT NOT NULL,
  `authorExpert` INT NOT NULL,
  `recommendedExpert` INT NOT NULL,
  PRIMARY KEY (`id`, `authorExpert`, `recommendedExpert`),
  INDEX `fk_Recommendation_Expert1_idx` (`authorExpert` ASC),
  INDEX `fk_Recommendation_Expert2_idx` (`recommendedExpert` ASC),
  CONSTRAINT `fk_Recommendation_Expert1`
    FOREIGN KEY (`authorExpert`)
    REFERENCES `mydb`.`Expert` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recommendation_Expert2`
    FOREIGN KEY (`recommendedExpert`)
    REFERENCES `mydb`.`Expert` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Expertise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Expertise` (
  `expert` INT NOT NULL AUTO_INCREMENT,
  `expertArea` INT NOT NULL,
  PRIMARY KEY (`expert`, `expertArea`),
  INDEX `fk_Expert_has_ExpertArea_ExpertArea1_idx` (`expertArea` ASC),
  INDEX `fk_Expert_has_ExpertArea_Expert1_idx` (`expert` ASC),
  CONSTRAINT `fk_Expert_has_ExpertArea_Expert1`
    FOREIGN KEY (`expert`)
    REFERENCES `mydb`.`Expert` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Expert_has_ExpertArea_ExpertArea1`
    FOREIGN KEY (`expertArea`)
    REFERENCES `mydb`.`ExpertiseArea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TopicRelation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TopicRelation` (
  `parent` INT NOT NULL,
  `child` INT NOT NULL,
  PRIMARY KEY (`parent`, `child`),
  INDEX `fk_TopicRelations_ExpertiseArea1_idx` (`parent` ASC),
  INDEX `fk_TopicRelations_ExpertiseArea2_idx` (`child` ASC),
  CONSTRAINT `fk_TopicRelations_ExpertiseArea1`
    FOREIGN KEY (`parent`)
    REFERENCES `mydb`.`ExpertiseArea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TopicRelations_ExpertiseArea2`
    FOREIGN KEY (`child`)
    REFERENCES `mydb`.`ExpertiseArea` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
