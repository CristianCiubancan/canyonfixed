-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: account_conquer
-- ------------------------------------------------------
-- Server version	11.2.3-MariaDB-1:11.2.3+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conquer_account`
--

DROP TABLE IF EXISTS `conquer_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Salt` varchar(255) NOT NULL,
  `AuthorityId` int(11) NOT NULL,
  `Flag` int(11) NOT NULL,
  `IpAddress` varchar(255) DEFAULT NULL,
  `MacAddress` varchar(255) DEFAULT NULL,
  `ParentId` char(36) DEFAULT NULL,
  `Created` datetime NOT NULL,
  `Modified` datetime DEFAULT NULL,
  `Deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_AuthorityId_AccountAuthority` (`AuthorityId`),
  CONSTRAINT `FK_AuthorityId_AccountAuthority` FOREIGN KEY (`AuthorityId`) REFERENCES `conquer_account_authority` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_authority`
--

DROP TABLE IF EXISTS `conquer_account_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account_authority` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `NormalizedName` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_vip`
--

DROP TABLE IF EXISTS `conquer_account_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conquer_account_vip` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `GameAccountId` int(11) NOT NULL,
  `VipLevel` tinyint(4) NOT NULL,
  `DurationMinutes` int(10) unsigned NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `CreationDate` datetime NOT NULL,
  `ConquerAccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_GameAccountVip_GameAccount` (`GameAccountId`),
  CONSTRAINT `FK_GameAccountVip_GameAccount` FOREIGN KEY (`GameAccountId`) REFERENCES `conquer_account` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realm` (
  `RealmID` char(36) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `GameIPAddress` varchar(255) NOT NULL,
  `RpcIPAddress` varchar(255) NOT NULL,
  `GamePort` int(10) unsigned NOT NULL,
  `RpcPort` int(10) unsigned NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `LastPing` datetime DEFAULT NULL,
  `DatabaseHost` varchar(255) NOT NULL,
  `DatabaseUser` varchar(255) NOT NULL,
  `DatabasePass` varchar(255) NOT NULL,
  `DatabaseSchema` varchar(255) NOT NULL,
  `DatabasePort` varchar(255) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `ProductionRealm` tinyint(1) NOT NULL,
  PRIMARY KEY (`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'account_conquer'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 16:41:13
