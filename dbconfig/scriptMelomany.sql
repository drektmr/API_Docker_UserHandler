-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema melomany
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `melomany`;
CREATE SCHEMA IF NOT EXISTS `melomany` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `melomany` ;

-- -----------------------------------------------------
-- Table `melomany`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`roles` ;

CREATE TABLE IF NOT EXISTS `melomany`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `melomany`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`user` ;

CREATE TABLE IF NOT EXISTS `melomany`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(250) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(150) NOT NULL,
  `creditCard` INT NULL,
  `direction` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_1_idx` (`rol` ASC) VISIBLE,
  CONSTRAINT `fk_user_1`
    FOREIGN KEY (`rol`)
    REFERENCES `melomany`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `melomany`.`playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`playlist` ;

CREATE TABLE IF NOT EXISTS `melomany`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idOwner` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_idOwner_idx` (`idOwner` ASC) VISIBLE,
  CONSTRAINT `fk_idOwner`
    FOREIGN KEY (`idOwner`)
    REFERENCES `melomany`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `melomany`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`genre` ;

CREATE TABLE IF NOT EXISTS `melomany`.`genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `melomany`.`songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`songs` ;

CREATE TABLE IF NOT EXISTS `melomany`.`songs` (
  `id` INT NOT NULL,
  `ownerID` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `artist` VARCHAR(150) NOT NULL,
  `genre_ID` INT NOT NULL,
  `featuring` VARCHAR(250) NULL,
  `score` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ownerKey_idx` (`ownerID` ASC, `genre_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ownerKey`
    FOREIGN KEY (`ownerID`)
    REFERENCES `melomany`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_genre1`
    FOREIGN KEY (`genre_ID`)
    REFERENCES `melomany`.`genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `melomany`.`playlist_has_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `melomany`.`playlist_has_songs` (
  `playlist_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `song_id`),
  INDEX `fk_playlist_has_songs_song1_idx` (`song_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_songs_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_songs_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `melomany`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_songs_song1`
    FOREIGN KEY (`song_id`)
    REFERENCES `melomany`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `melomany`.`user_plays_playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`user_plays_playlist` ;

CREATE TABLE IF NOT EXISTS `melomany`.`user_plays_playlist` (
  `user_id` INT NOT NULL,
  `playlist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `playlist_id`),
  INDEX `fk_user_has_playlist_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_user_has_playlist_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_playlist_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `melomany`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_plays_playlist_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `melomany`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `melomany`.`user_has_songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `melomany`.`user_has_songs` ;

CREATE TABLE IF NOT EXISTS `melomany`.`user_has_songs` (
  `user_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `songs_id`),
  INDEX `fk_user_has_songs_songs1_idx` (`songs_id` ASC) VISIBLE,
  INDEX `fk_user_has_songs_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_songs_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `melomany`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_songs_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES `melomany`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `melomany`.`incidences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `melomany`.`incidences` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `message` VARCHAR(250) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_incidences_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_incidences_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `melomany`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
