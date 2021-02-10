/*
Navicat MySQL Data Transfer

Source Server         : Casa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : officina

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-02-10 19:43:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lista_auto`
-- ----------------------------
DROP TABLE IF EXISTS `lista_auto`;
CREATE TABLE `lista_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVeicolo` int(11) NOT NULL,
  `idProprietario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVeicolo` (`idVeicolo`),
  KEY `idProprietario` (`idProprietario`),
  CONSTRAINT `lista_auto_ibfk_1` FOREIGN KEY (`idVeicolo`) REFERENCES `veicolo` (`id`),
  CONSTRAINT `lista_auto_ibfk_2` FOREIGN KEY (`idProprietario`) REFERENCES `proprietario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of lista_auto
-- ----------------------------

-- ----------------------------
-- Table structure for `manutenzione`
-- ----------------------------
DROP TABLE IF EXISTS `manutenzione`;
CREATE TABLE `manutenzione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(20) NOT NULL,
  `riparato` tinyint(1) NOT NULL,
  `idVei` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVei` (`idVei`),
  CONSTRAINT `idVei` FOREIGN KEY (`idVei`) REFERENCES `veicolo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manutenzione
-- ----------------------------

-- ----------------------------
-- Table structure for `manutenzione_ricambio`
-- ----------------------------
DROP TABLE IF EXISTS `manutenzione_ricambio`;
CREATE TABLE `manutenzione_ricambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRicambio` int(11) DEFAULT NULL,
  `idManutenzione` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idRicambio` (`idRicambio`),
  KEY `idManutenzione` (`idManutenzione`),
  CONSTRAINT `idManutenzione` FOREIGN KEY (`idManutenzione`) REFERENCES `manutenzione` (`id`),
  CONSTRAINT `idRicambio` FOREIGN KEY (`idRicambio`) REFERENCES `ricambio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manutenzione_ricambio
-- ----------------------------

-- ----------------------------
-- Table structure for `manutenzione_tecnico`
-- ----------------------------
DROP TABLE IF EXISTS `manutenzione_tecnico`;
CREATE TABLE `manutenzione_tecnico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orario` date DEFAULT NULL,
  `descr` varchar(20) DEFAULT NULL,
  `idManutenziones` int(11) NOT NULL,
  `idTecnicos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idManutenziones` (`idManutenziones`),
  KEY `idTecnicos` (`idTecnicos`),
  CONSTRAINT `idManutenziones` FOREIGN KEY (`idManutenziones`) REFERENCES `manutenzione` (`id`),
  CONSTRAINT `idTecnicos` FOREIGN KEY (`idTecnicos`) REFERENCES `tecnico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of manutenzione_tecnico
-- ----------------------------

-- ----------------------------
-- Table structure for `proprietario`
-- ----------------------------
DROP TABLE IF EXISTS `proprietario`;
CREATE TABLE `proprietario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `cdf` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of proprietario
-- ----------------------------

-- ----------------------------
-- Table structure for `ricambio`
-- ----------------------------
DROP TABLE IF EXISTS `ricambio`;
CREATE TABLE `ricambio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `descr` varchar(20) NOT NULL,
  `prezzo` double(4,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ricambio
-- ----------------------------

-- ----------------------------
-- Table structure for `tecnico`
-- ----------------------------
DROP TABLE IF EXISTS `tecnico`;
CREATE TABLE `tecnico` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tecnico
-- ----------------------------

-- ----------------------------
-- Table structure for `tipologia`
-- ----------------------------
DROP TABLE IF EXISTS `tipologia`;
CREATE TABLE `tipologia` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tipologia
-- ----------------------------

-- ----------------------------
-- Table structure for `veicolo`
-- ----------------------------
DROP TABLE IF EXISTS `veicolo`;
CREATE TABLE `veicolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modello` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `tipo` FOREIGN KEY (`tipo`) REFERENCES `tipologia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of veicolo
-- ----------------------------

-- ----------------------------
-- Table structure for `veicolo_proprietario`
-- ----------------------------
DROP TABLE IF EXISTS `veicolo_proprietario`;
CREATE TABLE `veicolo_proprietario` (
  `id` int(11) NOT NULL,
  `idVeicolo` int(11) NOT NULL,
  `idProprietario` int(11) NOT NULL,
  KEY `idPro` (`idProprietario`),
  KEY `idVeic` (`idVeicolo`),
  CONSTRAINT `idPro` FOREIGN KEY (`idProprietario`) REFERENCES `proprietario` (`id`),
  CONSTRAINT `idVeic` FOREIGN KEY (`idVeicolo`) REFERENCES `veicolo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of veicolo_proprietario
-- ----------------------------
