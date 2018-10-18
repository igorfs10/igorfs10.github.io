-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NULL,
  `nomeDaMae` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idProfessor`),
  UNIQUE INDEX `idprofessor_UNIQUE` (`idProfessor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma` (
  `idTurma` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `serie` INT NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTurma`),
  UNIQUE INDEX `idDisciplina_UNIQUE` (`idTurma` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NULL,
  `nomeDaMae` VARCHAR(100) NOT NULL,
  `idTurma` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
  UNIQUE INDEX `idprofessor_UNIQUE` (`idAluno` ASC),
  INDEX `fk_aluno_turma_idx` (`idTurma` ASC),
  CONSTRAINT `fk_aluno_turma`
    FOREIGN KEY (`idTurma`)
    REFERENCES `mydb`.`turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`disciplina` (
  `idDisciplina` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idDisciplina`),
  UNIQUE INDEX `idDisciplina_UNIQUE` (`idDisciplina` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`atividade` (
  `idAtividade` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idAtividade`),
  UNIQUE INDEX `idDisciplina_UNIQUE` (`idAtividade` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aluno_atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno_atividade` (
  `idAluno_atividade` INT NOT NULL AUTO_INCREMENT,
  `idAluno` INT NOT NULL,
  `idAtividade` INT NOT NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`idAluno_atividade`),
  INDEX `fk_alunoatividade_aluno_idx` (`idAluno` ASC),
  INDEX `fk_alunoatividade_atividade_idx` (`idAtividade` ASC),
  CONSTRAINT `fk_alunoatividade_aluno`
    FOREIGN KEY (`idAluno`)
    REFERENCES `mydb`.`aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alunoatividade_atividade`
    FOREIGN KEY (`idAtividade`)
    REFERENCES `mydb`.`atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma_atividade_professor_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma_atividade_professor_disciplina` (
  `idTurma_atividade_professor_disciplina` INT NOT NULL AUTO_INCREMENT,
  `idProfessor` INT NOT NULL,
  `idTurma` INT NOT NULL,
  `idAtividade` INT NOT NULL,
  `idDisciplina` INT NOT NULL,
  `horario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTurma_atividade_professor_disciplina`),
  INDEX `fk_professor_idx` (`idProfessor` ASC),
  INDEX `fk_turma_idx` (`idTurma` ASC),
  INDEX `fk_disciplina_idx` (`idDisciplina` ASC),
  INDEX `fk_atividade_idx` (`idAtividade` ASC),
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_professor`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `mydb`.`professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_turma`
    FOREIGN KEY (`idTurma`)
    REFERENCES `mydb`.`turma` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_disciplina`
    FOREIGN KEY (`idDisciplina`)
    REFERENCES `mydb`.`disciplina` (`idDisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_atividade`
    FOREIGN KEY (`idAtividade`)
    REFERENCES `mydb`.`atividade` (`idAtividade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
