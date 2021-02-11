/*
Navicat MySQL Data Transfer

Source Server         : Casa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ordinazionebar

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-02-11 15:23:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cameriere`
-- ----------------------------
DROP TABLE IF EXISTS `cameriere`;
CREATE TABLE `cameriere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nickname` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cameriere
-- ----------------------------
INSERT INTO `cameriere` VALUES ('1', 'Fabio', 'Ronaldo', 'RonaldoC');

-- ----------------------------
-- Table structure for `ordinazione`
-- ----------------------------
DROP TABLE IF EXISTS `ordinazione`;
CREATE TABLE `ordinazione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(50) NOT NULL,
  `cameriere` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cameriere` (`cameriere`),
  CONSTRAINT `ordinazione_ibfk_1` FOREIGN KEY (`cameriere`) REFERENCES `cameriere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ordinazione
-- ----------------------------
INSERT INTO `ordinazione` VALUES ('1', 'Mi stanno stressando', '1');

-- ----------------------------
-- Table structure for `ordinazione_prodotto`
-- ----------------------------
DROP TABLE IF EXISTS `ordinazione_prodotto`;
CREATE TABLE `ordinazione_prodotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrdinazione` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProdotto` (`idProdotto`),
  KEY `idOrdinazione` (`idOrdinazione`),
  CONSTRAINT `ordinazione_prodotto_ibfk_1` FOREIGN KEY (`idProdotto`) REFERENCES `prodotto` (`id`),
  CONSTRAINT `ordinazione_prodotto_ibfk_2` FOREIGN KEY (`idOrdinazione`) REFERENCES `ordinazione` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ordinazione_prodotto
-- ----------------------------

-- ----------------------------
-- Table structure for `prodotto`
-- ----------------------------
DROP TABLE IF EXISTS `prodotto`;
CREATE TABLE `prodotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `costo` double NOT NULL,
  `note` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of prodotto
-- ----------------------------
INSERT INTO `prodotto` VALUES ('1', 'coca Cola', '2', 'Ciao');

-- ----------------------------
-- Table structure for `prodotto_tavolo`
-- ----------------------------
DROP TABLE IF EXISTS `prodotto_tavolo`;
CREATE TABLE `prodotto_tavolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idTavolo` int(11) NOT NULL,
  `idProdotto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProdotto` (`idProdotto`),
  KEY `idTavolo` (`idTavolo`),
  CONSTRAINT `prodotto_tavolo_ibfk_1` FOREIGN KEY (`idProdotto`) REFERENCES `prodotto` (`id`),
  CONSTRAINT `prodotto_tavolo_ibfk_2` FOREIGN KEY (`idTavolo`) REFERENCES `tavolo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of prodotto_tavolo
-- ----------------------------
INSERT INTO `prodotto_tavolo` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `tavolo`
-- ----------------------------
DROP TABLE IF EXISTS `tavolo`;
CREATE TABLE `tavolo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `posti` int(11) NOT NULL,
  `cameriere` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cameriere` (`cameriere`),
  CONSTRAINT `tavolo_ibfk_1` FOREIGN KEY (`cameriere`) REFERENCES `cameriere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tavolo
-- ----------------------------
INSERT INTO `tavolo` VALUES ('0', '7', '10', '1');
INSERT INTO `tavolo` VALUES ('1', '2', '2', '1');

-- ----------------------------
-- Table structure for `tavolo_cameriere`
-- ----------------------------
DROP TABLE IF EXISTS `tavolo_cameriere`;
CREATE TABLE `tavolo_cameriere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCameriere` int(11) NOT NULL,
  `idTavolo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCameriere` (`idCameriere`),
  KEY `idTavolo` (`idTavolo`),
  CONSTRAINT `tavolo_cameriere_ibfk_1` FOREIGN KEY (`idCameriere`) REFERENCES `cameriere` (`id`),
  CONSTRAINT `tavolo_cameriere_ibfk_2` FOREIGN KEY (`idTavolo`) REFERENCES `tavolo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tavolo_cameriere
-- ----------------------------
