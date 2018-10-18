-- MySQL dump 10.13  Distrib 5.7.23, for Win32 (AMD64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomeDaMae` varchar(100) NOT NULL,
  `idTurma` int(11) NOT NULL,
  PRIMARY KEY (`idAluno`),
  UNIQUE KEY `idprofessor_UNIQUE` (`idAluno`),
  KEY `fk_aluno_turma_idx` (`idTurma`),
  CONSTRAINT `fk_aluno_turma` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (2,'Igor','Rua Castelo Branco, 300','98745-8120','igor@gmail.com','Rosa',2),(3,'Ana','Rua Limeira, 400','9898-2220','ana@gmail.com','Rosa',2),(4,'Valter','Rua Laranja, 400','9814-3160','valt@gmail.com','Maria',2),(5,'Ulisses','Rua Laranja, 400','9812-3860','ulilis@gmail.com','Maria',2),(6,'João','Rua Laranja, 15','93402-0060','joao@gmail.com','Paula',3),(7,'Joaquim','Rua Laranja, 827','96502-1030','joaquim@gmail.com','Helena',3),(8,'Larissa','Avenida Itaquera, 1827','92002-1030','larissa@gmail.com','Lena',3),(9,'Ariana','Avenida Itaquera, 200','93572-1880','ariana@gmail.com','Gisele',6),(10,'Douglas','Avenida Itapeti, 122','93558-164','doug@gmail.com','Bruna',6),(11,'Jacinto','Avenida Cotia, 357','99152-1724','jaci@gmail.com','Joana',6);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_atividade`
--

DROP TABLE IF EXISTS `aluno_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno_atividade` (
  `idAluno_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `idAluno` int(11) NOT NULL,
  `idAtividade` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  PRIMARY KEY (`idAluno_atividade`),
  KEY `fk_alunoatividade_aluno_idx` (`idAluno`),
  KEY `fk_alunoatividade_atividade_idx` (`idAtividade`),
  CONSTRAINT `fk_alunoatividade_aluno` FOREIGN KEY (`idAluno`) REFERENCES `aluno` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alunoatividade_atividade` FOREIGN KEY (`idAtividade`) REFERENCES `atividade` (`idAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_atividade`
--

LOCK TABLES `aluno_atividade` WRITE;
/*!40000 ALTER TABLE `aluno_atividade` DISABLE KEYS */;
INSERT INTO `aluno_atividade` VALUES (2,2,2,3),(3,3,2,4),(4,4,2,4),(5,5,2,5),(6,6,2,2),(7,7,2,3),(8,8,2,4),(9,9,3,2),(10,10,3,3),(11,11,3,4),(13,2,1,1),(14,3,1,3),(15,4,1,5);
/*!40000 ALTER TABLE `aluno_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `idAtividade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idAtividade`),
  UNIQUE KEY `idDisciplina_UNIQUE` (`idAtividade`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` VALUES (1,'Prova'),(2,'Trabalho'),(3,'Seminário');
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idDisciplina`),
  UNIQUE KEY `idDisciplina_UNIQUE` (`idDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Hardware'),(2,'Rede'),(3,'Programação'),(4,'Software');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `idProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomeDaMae` varchar(100) NOT NULL,
  PRIMARY KEY (`idProfessor`),
  UNIQUE KEY `idprofessor_UNIQUE` (`idProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Celso','Rua Moreira, 151','98765-4321','celso@senai.com','Maria'),(2,'Rogerio','Avenida Itaquera, 220','93546-9852','rogerio@senai.com','Ana'),(3,'Adriana','Rua Jandira, 3828','93158-2164','adriana@senai.com','Claudia'),(4,'Marcel','Rua Castelo Branco, 9200','93164-8520','marcel@senai.com','Claudia');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `serie` int(11) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  PRIMARY KEY (`idTurma`),
  UNIQUE KEY `idDisciplina_UNIQUE` (`idTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (2,'A',1,'Manhã'),(3,'B',2,'Manhã'),(4,'C',3,'Manhã'),(5,'D',1,'Tarde'),(6,'E',2,'Tarde'),(7,'F',3,'Tarde');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_atividade_professor_disciplina`
--

DROP TABLE IF EXISTS `turma_atividade_professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma_atividade_professor_disciplina` (
  `idTurma_atividade_professor_disciplina` int(11) NOT NULL AUTO_INCREMENT,
  `idProfessor` int(11) NOT NULL,
  `idTurma` int(11) NOT NULL,
  `idAtividade` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `horario` varchar(45) NOT NULL,
  PRIMARY KEY (`idTurma_atividade_professor_disciplina`),
  KEY `fk_professor_idx` (`idProfessor`),
  KEY `fk_turma_idx` (`idTurma`),
  KEY `fk_disciplina_idx` (`idDisciplina`),
  KEY `fk_atividade_idx` (`idAtividade`),
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_atividade` FOREIGN KEY (`idAtividade`) REFERENCES `atividade` (`idAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_disciplina` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_professor` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idProfessor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmaatividadeprofessordisciplina_turma` FOREIGN KEY (`idTurma`) REFERENCES `turma` (`idTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_atividade_professor_disciplina`
--

LOCK TABLES `turma_atividade_professor_disciplina` WRITE;
/*!40000 ALTER TABLE `turma_atividade_professor_disciplina` DISABLE KEYS */;
INSERT INTO `turma_atividade_professor_disciplina` VALUES (1,1,2,1,2,'7:00'),(2,4,2,2,4,'9:00'),(3,1,3,2,1,'8:00'),(4,3,6,3,4,'15:00');
/*!40000 ALTER TABLE `turma_atividade_professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-18 16:22:10
