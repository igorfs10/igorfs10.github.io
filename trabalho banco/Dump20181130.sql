-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: db_somativa
-- ------------------------------------------------------
-- Server version	5.6.10-log

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
-- Table structure for table `tbl_cliente`
--

DROP TABLE IF EXISTS `tbl_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cliente` (
  `n_numeclien` int(11) NOT NULL AUTO_INCREMENT,
  `c_codiclien` varchar(10) DEFAULT NULL,
  `c_nomeclien` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`n_numeclien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cliente`
--

LOCK TABLES `tbl_cliente` WRITE;
/*!40000 ALTER TABLE `tbl_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comissao_mensal`
--

DROP TABLE IF EXISTS `tbl_comissao_mensal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comissao_mensal` (
  `n_numecomis` int(11) NOT NULL AUTO_INCREMENT,
  `n_numevende` int(11) NOT NULL,
  `d_datapagam` date NOT NULL,
  `n_valorcomi` float(9,2) NOT NULL,
  PRIMARY KEY (`n_numecomis`),
  KEY `fk_tbl_vendedor_tbl_comissao_mensal_idx` (`n_numevende`),
  CONSTRAINT `fk_tbl_vendedor_tbl_comissao_mensal` FOREIGN KEY (`n_numevende`) REFERENCES `tbl_vendedor` (`n_numevende`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comissao_mensal`
--

LOCK TABLES `tbl_comissao_mensal` WRITE;
/*!40000 ALTER TABLE `tbl_comissao_mensal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comissao_mensal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_itens_venda`
--

DROP TABLE IF EXISTS `tbl_itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_itens_venda` (
  `n_numeivenda` int(11) NOT NULL AUTO_INCREMENT,
  `n_numevenda` int(11) NOT NULL,
  `n_numeprodu` int(11) NOT NULL,
  `n_valoivenda` float(10,2) DEFAULT NULL,
  `n_qtdeivenda` int(11) DEFAULT NULL,
  `n_descivenda` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numeivenda`),
  KEY `fk_tbl_venda_tbl_itens_venda_idx` (`n_numevenda`),
  KEY `fk_tbl_produto_tbl_itens_venda_idx` (`n_numeprodu`),
  CONSTRAINT `fk_tbl_venda_tbl_itens_venda` FOREIGN KEY (`n_numevenda`) REFERENCES `tbl_venda` (`n_numevenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_produto_tbl_itens_venda` FOREIGN KEY (`n_numeprodu`) REFERENCES `tbl_produto` (`n_numeprodu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_itens_venda`
--

LOCK TABLES `tbl_itens_venda` WRITE;
/*!40000 ALTER TABLE `tbl_itens_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_produto`
--

DROP TABLE IF EXISTS `tbl_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_produto` (
  `n_numeprodu` int(11) NOT NULL AUTO_INCREMENT,
  `c_codiprodu` varchar(20) DEFAULT NULL,
  `c_descprodu` varchar(100) DEFAULT NULL,
  `n_valoprodu` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`n_numeprodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_produto`
--

LOCK TABLES `tbl_produto` WRITE;
/*!40000 ALTER TABLE `tbl_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_venda`
--

DROP TABLE IF EXISTS `tbl_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_venda` (
  `n_numevenda` int(11) NOT NULL AUTO_INCREMENT,
  `c_codivenda` varchar(10) DEFAULT NULL,
  `n_numeclien` int(11) NOT NULL,
  `n_numevende` int(11) NOT NULL,
  `n_valovenda` float(10,2) DEFAULT NULL,
  `n_descvenda` float(10,2) DEFAULT NULL,
  `n_totavenda` float(10,2) DEFAULT NULL,
  `d_datavenda` date DEFAULT NULL,
  PRIMARY KEY (`n_numevenda`),
  KEY `fk_tbl_vendedor_tbl_venda_idx` (`n_numevende`),
  KEY `fk_tbl_cliente_tbl_venda_idx` (`n_numeclien`),
  CONSTRAINT `fk_tbl_vendedor_tbl_venda` FOREIGN KEY (`n_numevende`) REFERENCES `tbl_vendedor` (`n_numevende`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cliente_tbl_venda` FOREIGN KEY (`n_numeclien`) REFERENCES `tbl_cliente` (`n_numeclien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_venda`
--

LOCK TABLES `tbl_venda` WRITE;
/*!40000 ALTER TABLE `tbl_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vendedor`
--

DROP TABLE IF EXISTS `tbl_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_vendedor` (
  `n_numevende` int(11) NOT NULL AUTO_INCREMENT,
  `c_codivende` varchar(10) DEFAULT NULL,
  `c_nomevende` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`n_numevende`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vendedor`
--

LOCK TABLES `tbl_vendedor` WRITE;
/*!40000 ALTER TABLE `tbl_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-30  9:37:38
