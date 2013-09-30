
CREATE DATABASE IF NOT EXISTS `lab1`;
USE `lab1`;


CREATE TABLE IF NOT EXISTS `lab1`.`Expert` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));


CREATE TABLE IF NOT EXISTS `lab1`.`ExpertArea` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NOT NULL,
  `parent` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ExpertArea_ExpertArea_idx` (`parent` ASC),
  CONSTRAINT `fk_ExpertArea_ExpertArea`
    FOREIGN KEY (`parent`)
    REFERENCES `lab1`.`ExpertArea` (`id`));


CREATE TABLE IF NOT EXISTS `lab1`.`Recommendation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `justification` TEXT NOT NULL,
  `authorExpert` INT NOT NULL,
  `recommendedExpert` INT NOT NULL,
  PRIMARY KEY (`id`, `authorExpert`, `recommendedExpert`),
  INDEX `fk_Recommendation_Expert1_idx` (`authorExpert` ASC),
  INDEX `fk_Recommendation_Expert2_idx` (`recommendedExpert` ASC),
  CONSTRAINT `fk_Recommendation_Expert1`
    FOREIGN KEY (`authorExpert`)
    REFERENCES `lab1`.`Expert` (`id`),
  CONSTRAINT `fk_Recommendation_Expert2`
    FOREIGN KEY (`recommendedExpert`)
    REFERENCES `lab1`.`Expert` (`id`));


CREATE TABLE IF NOT EXISTS `lab1`.`Expertise` (
  `expert` INT NOT NULL AUTO_INCREMENT,
  `expertArea` INT NOT NULL,
  PRIMARY KEY (`expert`, `expertArea`),
  INDEX `fk_Expert_has_ExpertArea_ExpertArea1_idx` (`expertArea` ASC),
  INDEX `fk_Expert_has_ExpertArea_Expert1_idx` (`expert` ASC),
  CONSTRAINT `fk_Expert_has_ExpertArea_Expert1`
    FOREIGN KEY (`expert`)
    REFERENCES `lab1`.`Expert` (`id`),
  CONSTRAINT `fk_Expert_has_ExpertArea_ExpertArea1`
    FOREIGN KEY (`expertArea`)
    REFERENCES `lab1`.`ExpertArea` (`id`));

