-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_events
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_events
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_events` DEFAULT CHARACTER SET utf8mb3 ;
USE `db_events` ;

-- -----------------------------------------------------
-- Table `db_events`.`tbl_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_event` (
                                                       `event_id` INT NOT NULL AUTO_INCREMENT,
                                                       `title` VARCHAR(255) NOT NULL,
    `pretty_name` VARCHAR(50) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `start_date` DATE NULL DEFAULT NULL,
    `end_date` DATE NULL DEFAULT NULL,
    `start_time` TIME NULL DEFAULT NULL,
    `end_time` TIME NULL DEFAULT NULL,
    PRIMARY KEY (`event_id`),
    UNIQUE INDEX `pretty_name_UNIQUE` (`pretty_name` ASC) VISIBLE)
    ENGINE = InnoDB
    AUTO_INCREMENT = 5
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_events`.`tbl_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_user` (
                                                      `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                      `user_name` VARCHAR(255) NULL DEFAULT NULL,
    `user_email` VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (`user_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_events`.`tbl_subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_events`.`tbl_subscription` (
                                                              `subscription_number` INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                                              `subscribed_user_id` INT UNSIGNED NOT NULL,
                                                              `indication_user_id` INT UNSIGNED NULL DEFAULT NULL,
                                                              `event_id` INT NOT NULL,
                                                              PRIMARY KEY (`subscription_number`),
    INDEX `fk_tbl_subscription_tbl_user_idx` (`subscribed_user_id` ASC) VISIBLE,
    INDEX `fk_tbl_subscription_tbl_user1_idx` (`indication_user_id` ASC) VISIBLE,
    INDEX `fk_tbl_subscription_tbl_event1_idx` (`event_id` ASC) VISIBLE,
    CONSTRAINT `fk_tbl_subscription_tbl_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `db_events`.`tbl_event` (`event_id`),
    CONSTRAINT `fk_tbl_subscription_tbl_user`
    FOREIGN KEY (`subscribed_user_id`)
    REFERENCES `db_events`.`tbl_user` (`user_id`),
    CONSTRAINT `fk_tbl_subscription_tbl_user1`
    FOREIGN KEY (`indication_user_id`)
    REFERENCES `db_events`.`tbl_user` (`user_id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;