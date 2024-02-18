-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: account_conquer
-- ------------------------------------------------------
-- Server version	5.7.39-log
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!50503 SET NAMES utf8 */;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;

/*!40103 SET TIME_ZONE='+00:00' */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_ban`
--
DROP TABLE IF EXISTS `account_ban`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_ban` (
    `Id` varchar(36) NOT NULL,
    `GameAccountId` int (11) DEFAULT NULL COMMENT 'Data should be used for secondary Identities. Example: Conquer account ID ban.',
    `AccountId` varchar(36) NOT NULL DEFAULT '' COMMENT 'FTW Account Identity.',
    `BanTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ExpireTime` datetime NOT NULL DEFAULT '2199-12-31 23:59:59',
    `BannedBy` varchar(36) NOT NULL DEFAULT '',
    `ReasonId` int (11) NOT NULL DEFAULT '0' COMMENT 'Predefined reason for fixed ban settings. Moderators or whoever is doing the ban should not choose the ban time.',
    `Reason` text NOT NULL,
    `Flags` int (11) NOT NULL DEFAULT '0',
    `UpdatedAt` datetime DEFAULT NULL,
    `DeletedAt` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`) USING BTREE,
    KEY `fk_account_ban_user_idx` (`AccountId`),
    KEY `fk_account_ban_reason_idx` (`ReasonId`),
    KEY `fk_account_ban_admin_fkx_idx` (`BannedBy`),
    KEY `FKGameAccountBanned_idx` (`GameAccountId`),
    CONSTRAINT `FKGameAccountBanned` FOREIGN KEY (`GameAccountId`) REFERENCES `conquer_account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FKSystemAccountBanned` FOREIGN KEY (`AccountId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FKSystemBanReasonId` FOREIGN KEY (`ReasonId`) REFERENCES `account_ban_reason_factor` (`ReasonId`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 ROW_FORMAT = DYNAMIC;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_ban_reason`
--
DROP TABLE IF EXISTS `account_ban_reason`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_ban_reason` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(64) NOT NULL DEFAULT 'NoReason',
    `Type` int (11) NOT NULL DEFAULT '0' COMMENT '0 for FTW Account\n1 for Game Account',
    `GameType` int (11) DEFAULT '0' COMMENT 'Specify game type if it''s game relative.',
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_ban_reason_factor`
--
DROP TABLE IF EXISTS `account_ban_reason_factor`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_ban_reason_factor` (
    `ReasonId` int (11) NOT NULL,
    `Ocurrences` int (11) NOT NULL DEFAULT '0',
    `Minutes` int (11) NOT NULL DEFAULT '1440',
    `Permanent` tinyint (1) NOT NULL DEFAULT '0',
    `AllowCancel` tinyint (1) NOT NULL DEFAULT '0',
    `CanBeForgiven` tinyint (1) NOT NULL DEFAULT '0',
    UNIQUE KEY `UQ_UniqueOcurrence` (`ReasonId`, `Ocurrences`),
    CONSTRAINT `fk_breason_ban_reason_factor` FOREIGN KEY (`ReasonId`) REFERENCES `account_ban_reason` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_device_codes`
--
DROP TABLE IF EXISTS `account_device_codes`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_device_codes` (
    `UserCode` varchar(256) NOT NULL,
    `DeviceCode` varchar(45) NOT NULL,
    `SubjectId` varchar(45) DEFAULT NULL,
    `SessionId` varchar(45) DEFAULT NULL,
    `ClientId` varchar(45) NOT NULL,
    `Description` varchar(45) DEFAULT NULL,
    `CreationTime` varchar(45) NOT NULL,
    `Expiration` varchar(45) NOT NULL,
    `Data` text NOT NULL,
    PRIMARY KEY (`UserCode`),
    UNIQUE KEY `IX_DeviceCodes_DeviceCode` (`DeviceCode`),
    KEY `IX_DeviceCodes_Expiration` (`Expiration`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_logins`
--
DROP TABLE IF EXISTS `account_logins`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_logins` (
    `LoginProvider` varchar(128) NOT NULL,
    `ProviderKey` varchar(128) NOT NULL,
    `ProviderDisplayName` varchar(256) DEFAULT NULL,
    `UserId` varchar(36) NOT NULL,
    PRIMARY KEY (`LoginProvider`, `ProviderKey`),
    KEY `PK_AspNetUserLogins` (`LoginProvider`, `ProviderKey`),
    KEY `FK_AspNetUserLogins_AspNetUsers_UserId_idx` (`UserId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_password_history`
--
DROP TABLE IF EXISTS `account_password_history`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_password_history` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `AccountId` varchar(36) NOT NULL,
    `Password` varchar(256) NOT NULL,
    `Salt` varchar(36) NOT NULL,
    `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`),
    KEY `FK_PWHistory_Owner_ID_idx` (`AccountId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_persisted_grants`
--
DROP TABLE IF EXISTS `account_persisted_grants`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_persisted_grants` (
    `Id` bigint (20) NOT NULL AUTO_INCREMENT,
    `Key` varchar(200) NOT NULL,
    `Type` varchar(64) NOT NULL,
    `SubjectId` varchar(256) DEFAULT NULL,
    `SessionId` varchar(128) DEFAULT NULL,
    `ClientId` varchar(256) NOT NULL,
    `Description` varchar(256) DEFAULT NULL,
    `CreationTime` datetime NOT NULL,
    `Expiration` datetime DEFAULT NULL,
    `ConsumedTime` datetime DEFAULT NULL,
    `Data` text NOT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Key_UNIQUE` (`Key`),
    KEY `IX_PersistedGrants_Expiration` (`Expiration`),
    KEY `IX_PersistedGrants_SubjectId_ClientId_Type` (`SubjectId`, `ClientId`, `Type`),
    KEY `IX_PersistedGrants_SubjectId_SessionId_Type` (`SubjectId`, `SessionId`, `Type`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_role_claims`
--
DROP TABLE IF EXISTS `account_role_claims`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_role_claims` (
    `Id` varchar(36) NOT NULL,
    `RoleId` varchar(36) NOT NULL,
    `ClaimType` varchar(256) DEFAULT NULL,
    `ClaimValue` varchar(256) DEFAULT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_AspNetRoleClaims_AspNetRoles_RoleId_idx` (`RoleId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_role_claims_BEFORE_INSERT` BEFORE INSERT ON `account_role_claims` FOR EACH ROW BEGIN
if NEW.Id IS NULL THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `account_roles`
--
DROP TABLE IF EXISTS `account_roles`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_roles` (
    `Id` varchar(36) NOT NULL,
    `Name` varchar(256) NOT NULL,
    `NormalizedName` varchar(256) NOT NULL,
    `ConcurrencyStamp` varchar(256) DEFAULT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Id_UNIQUE` (`Id`),
    UNIQUE KEY `NormalizedName_UNIQUE` (`NormalizedName`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_roles_BEFORE_INSERT` BEFORE INSERT ON `account_roles` FOR EACH ROW BEGIN
SET NEW.Id = UUID();
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `account_tokens`
--
DROP TABLE IF EXISTS `account_tokens`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_tokens` (
    `UserId` varchar(36) NOT NULL,
    `LoginProvider` varchar(128) NOT NULL,
    `Name` varchar(128) NOT NULL,
    `Value` varchar(256) DEFAULT NULL,
    PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
    CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_user`
--
DROP TABLE IF EXISTS `account_user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_user` (
    `Id` varchar(36) NOT NULL,
    `UserName` varchar(128) NOT NULL DEFAULT '',
    `NormalizedUserName` varchar(128) NOT NULL,
    `PasswordHash` varchar(256) DEFAULT NULL,
    `Salt` varchar(128) DEFAULT NULL,
    `Type` tinyint (4) DEFAULT '0',
    `Flag` bigint (20) DEFAULT '0',
    `Email` varchar(128) NOT NULL DEFAULT '',
    `NormalizedEmail` varchar(128) NOT NULL,
    `EmailConfirmed` tinyint (1) unsigned NOT NULL DEFAULT '1',
    `PhoneNumber` varchar(20) NOT NULL DEFAULT '',
    `PhoneNumberConfirmed` tinyint (1) unsigned NOT NULL DEFAULT '0',
    `ConcurrencyStamp` varchar(128) DEFAULT NULL,
    `SecurityStamp` varchar(128) DEFAULT NULL,
    `LockoutEnabled` tinyint (1) unsigned NOT NULL DEFAULT '0',
    `LockoutEnd` datetime DEFAULT NULL,
    `AccessFailedCount` int (11) NOT NULL DEFAULT '0',
    `TwoFactorEnabled` tinyint (1) unsigned NOT NULL DEFAULT '0',
    `Lock` int (11) DEFAULT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Id_UNIQUE` (`Id`),
    UNIQUE KEY `Email_UNIQUE` (`Email`),
    UNIQUE KEY `UserName_UNIQUE` (`UserName`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'This table stores the account_user related to website stuff.';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_user_claims`
--
DROP TABLE IF EXISTS `account_user_claims`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_user_claims` (
    `Id` varchar(36) NOT NULL,
    `UserId` varchar(36) NOT NULL,
    `ClaimType` varchar(128) DEFAULT NULL,
    `ClaimValue` varchar(256) DEFAULT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_AspNetUserClaims_AspNetUsers_UserId_idx` (`UserId`),
    CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_user_claims_BEFORE_INSERT` BEFORE INSERT ON `account_user_claims` FOR EACH ROW BEGIN
if NEW.Id IS NULL THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `account_user_roles`
--
DROP TABLE IF EXISTS `account_user_roles`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `account_user_roles` (
    `UserId` varchar(36) NOT NULL,
    `RoleId` varchar(36) NOT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`UserId`, `RoleId`),
    KEY `FK_AspNetUserRoles_AspNetRoles_RoleId_idx` (`RoleId`),
    CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `account_roles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = '	';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--
DROP TABLE IF EXISTS `article`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article` (
    `Id` int (11) unsigned NOT NULL AUTO_INCREMENT,
    `CategoryId` int (11) NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `Flags` bigint (16) unsigned NOT NULL DEFAULT '1',
    `ThumbId` int (11) DEFAULT NULL,
    `BackgroundId` int (11) DEFAULT NULL,
    `Views` int (11) NOT NULL DEFAULT '0',
    `Order` int (11) NOT NULL DEFAULT '0',
    `PublishDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `DeletedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`) USING BTREE,
    KEY `FK_Article_Category_idx` (`CategoryId`),
    KEY `FK_Article_Creator_Identifier_idx` (`UserId`),
    KEY `FK_Article_Background_ID_idx` (`BackgroundId`),
    KEY `FK_Article_Thumb_ID_idx` (`ThumbId`),
    CONSTRAINT `FK_Article_Background_ID` FOREIGN KEY (`BackgroundId`) REFERENCES `images` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Article_Category` FOREIGN KEY (`CategoryId`) REFERENCES `article_category` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Article_Creator_Identifier` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Article_Thumb_ID` FOREIGN KEY (`ThumbId`) REFERENCES `images` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 81 DEFAULT CHARSET = latin1 ROW_FORMAT = DYNAMIC;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_category`
--
DROP TABLE IF EXISTS `article_category`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_category` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(45) NOT NULL DEFAULT '',
    `CategoryTypeId` int (11) NOT NULL DEFAULT '1',
    `Order` int (11) NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `Flags` int (11) NOT NULL DEFAULT '0',
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    `DeletedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_Article_Category_Type_idx` (`CategoryTypeId`),
    CONSTRAINT `FK_Article_Category_Type` FOREIGN KEY (`CategoryTypeId`) REFERENCES `article_category_type` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_category_type`
--
DROP TABLE IF EXISTS `article_category_type`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_category_type` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(45) NOT NULL DEFAULT '',
    `Flags` int (11) NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL,
    `DeletedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_comment`
--
DROP TABLE IF EXISTS `article_comment`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_comment` (
    `Id` int (11) unsigned NOT NULL AUTO_INCREMENT,
    `ArticleId` int (11) unsigned NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `TokenId` varchar(128) NOT NULL DEFAULT '',
    `IpAddress` varchar(15) NOT NULL DEFAULT '0.0.0.0',
    `Message` text NOT NULL,
    `Flag` int (11) NOT NULL DEFAULT '0',
    `Likes` int (11) NOT NULL DEFAULT '0',
    `Dislikes` int (11) NOT NULL DEFAULT '0',
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `UpdateDate` timestamp NULL DEFAULT NULL,
    `DeleteDate` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Identity_UNIQUE` (`Id`),
    KEY `FK_Comment_User_Author_ID_0_idx` (`UserId`),
    KEY `FK_Comment_Article_ID_0_idx` (`ArticleId`),
    CONSTRAINT `FK_Comment_Article_ID_0` FOREIGN KEY (`ArticleId`) REFERENCES `article` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Comment_User_Author_ID_0` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'Stores the comments done in an article or guide.';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_comment_reaction`
--
DROP TABLE IF EXISTS `article_comment_reaction`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_comment_reaction` (
    `Id` int (11) unsigned NOT NULL AUTO_INCREMENT,
    `CommentId` int (11) unsigned NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `Reaction` int (11) unsigned NOT NULL DEFAULT '0',
    `Rating` int (11) unsigned NOT NULL DEFAULT '0',
    `Timestamp` int (11) DEFAULT '0',
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Identity_UNIQUE` (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_content`
--
DROP TABLE IF EXISTS `article_content`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_content` (
    `Id` int (11) unsigned NOT NULL AUTO_INCREMENT,
    `ArticleId` int (11) unsigned NOT NULL,
    `WriterId` varchar(36) NOT NULL DEFAULT '',
    `Locale` varchar(8) NOT NULL,
    `Title` varchar(255) NOT NULL,
    `Content` longtext NOT NULL,
    `LastEditorId` varchar(36) DEFAULT NULL,
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `DeletedDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`) USING BTREE,
    KEY `FK_Article_Initial_Creator_idx` (`WriterId`),
    KEY `FK_Article_Last_Editor_idx` (`LastEditorId`),
    KEY `FK_Article_Identifier_idx1` (`ArticleId`, `WriterId`),
    CONSTRAINT `FK_Article_Identifier` FOREIGN KEY (`ArticleId`) REFERENCES `article` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Article_Initial_Creator` FOREIGN KEY (`WriterId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Article_Last_Editor` FOREIGN KEY (`LastEditorId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 86 DEFAULT CHARSET = latin1 ROW_FORMAT = DYNAMIC;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_reaction`
--
DROP TABLE IF EXISTS `article_reaction`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_reaction` (
    `Id` int (11) unsigned NOT NULL AUTO_INCREMENT,
    `ArticleId` int (11) unsigned NOT NULL DEFAULT '0',
    `UserId` varchar(36) NOT NULL,
    `Reaction` int (11) unsigned NOT NULL DEFAULT '0',
    `Rating` int (11) unsigned NOT NULL DEFAULT '0',
    `Timestamp` int (11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Identity_UNIQUE` (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_read_token`
--
DROP TABLE IF EXISTS `article_read_token`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `article_read_token` (
    `Id` bigint (20) NOT NULL AUTO_INCREMENT,
    `ArticleId` int (11) unsigned NOT NULL,
    `Referer` varchar(256) NOT NULL DEFAULT '/',
    `TokenId` varchar(128) NOT NULL,
    `UserId` varchar(36) DEFAULT NULL,
    `IpAddress` varchar(64) NOT NULL,
    `UserAgent` varchar(256) NOT NULL DEFAULT '',
    `CreationDate` int (11) NOT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_User_Read_Token_0_idx` (`UserId`),
    KEY `FK_Article_Read_Token_0_idx` (`ArticleId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auto_updater_bundles`
--
DROP TABLE IF EXISTS `auto_updater_bundles`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `auto_updater_bundles` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `From` int (11) NOT NULL,
    `To` int (11) NOT NULL,
    `FileName` varchar(32) NOT NULL,
    `Hash` varchar(256) NOT NULL,
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Id_UNIQUE` (`Id`),
    UNIQUE KEY `From_to_IDX` (`From`, `To`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account`
--
DROP TABLE IF EXISTS `conquer_account`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_account` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `UserName` varchar(32) NOT NULL,
    `Password` varchar(256) NOT NULL,
    `Salt` varchar(36) NOT NULL,
    `AuthorityId` int (11) NOT NULL DEFAULT '1',
    `Flag` int (11) NOT NULL DEFAULT '0',
    `IpAddress` varchar(45) NOT NULL DEFAULT '',
    `MacAddress` varchar(45) NOT NULL DEFAULT '',
    `ParentId` varchar(36) NOT NULL,
    `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `Modified` timestamp NULL DEFAULT NULL,
    `Deleted` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `UserName_UNIQUE` (`UserName`),
    KEY `FK_Authority_ID_Account_idx` (`AuthorityId`),
    CONSTRAINT `FK_Authority_ID_Account` FOREIGN KEY (`AuthorityId`) REFERENCES `conquer_account_authority` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 10671 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_address_history`
--
DROP TABLE IF EXISTS `conquer_account_address_history`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_account_address_history` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `AccountId` int (11) NOT NULL,
    `IpAddress` varchar(64) NOT NULL,
    `MacAddress` varchar(32) NOT NULL,
    `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`),
    KEY `FK_AddrInfoHistory_AccountID_idx` (`AccountId`),
    CONSTRAINT `FK_AddrInfoHistory_AccountID` FOREIGN KEY (`AccountId`) REFERENCES `conquer_account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = '	';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_authority`
--
DROP TABLE IF EXISTS `conquer_account_authority`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_account_authority` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(64) NOT NULL,
    `NormalizedName` varchar(64) NOT NULL,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = latin1 COMMENT = '	';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_credit_awaiting`
--
DROP TABLE IF EXISTS `conquer_account_credit_awaiting`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_account_credit_awaiting` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `CreditCardId` int (11) NOT NULL,
    `ConquerAccountId` int (11) NOT NULL,
    `RealmId` varchar(36) NOT NULL,
    `CreatedBy` varchar(36) NOT NULL,
    `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `SynchronizedAt` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_CreditCardAwait_CardID_idx` (`CreditCardId`),
    KEY `FK_CreditCardAwait_TargetId_idx` (`ConquerAccountId`),
    KEY `FK_CreditCardAwait_TargetRealm_idx` (`RealmId`),
    KEY `FK_CreditCardAwait_CreatorID_idx` (`CreatedBy`),
    CONSTRAINT `FK_CreditCardAwait_CardID` FOREIGN KEY (`CreditCardId`) REFERENCES `credit_card` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCardAwait_CreatorID` FOREIGN KEY (`CreatedBy`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCardAwait_TargetId` FOREIGN KEY (`ConquerAccountId`) REFERENCES `conquer_account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCardAwait_TargetRealm` FOREIGN KEY (`RealmId`) REFERENCES `realm` (`RealmID`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_account_vip`
--
DROP TABLE IF EXISTS `conquer_account_vip`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_account_vip` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `ConquerAccountId` int (11) NOT NULL,
    `VipLevel` tinyint (4) unsigned NOT NULL,
    `DurationMinutes` int (11) unsigned NOT NULL,
    `StartDate` timestamp NULL DEFAULT NULL,
    `EndDate` timestamp NULL DEFAULT NULL,
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`),
    KEY `FK_ConquerAccount_VIP_UserID_idx` (`ConquerAccountId`),
    CONSTRAINT `FK_ConquerAccount_VIP_UserID` FOREIGN KEY (`ConquerAccountId`) REFERENCES `conquer_account` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_rank_brush`
--
DROP TABLE IF EXISTS `conquer_rank_brush`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_rank_brush` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `ServerId` varchar(36) NOT NULL,
    `Start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `End` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    `Ticks` bigint (20) NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_rank_family`
--
DROP TABLE IF EXISTS `conquer_rank_family`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_rank_family` (
    `Id` int (10) unsigned NOT NULL,
    `Name` varchar(32) NOT NULL DEFAULT '',
    `LeaderId` int (10) unsigned NOT NULL DEFAULT '0',
    `Amount` int (10) unsigned NOT NULL DEFAULT '1',
    `Money` bigint (20) unsigned NOT NULL DEFAULT '0',
    `Level` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `StarTower` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `FamilyMap` int (10) unsigned NOT NULL DEFAULT '0',
    `FamilyMapName` varchar(32) DEFAULT NULL,
    `OccupyDate` int (10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_rank_syndicate`
--
DROP TABLE IF EXISTS `conquer_rank_syndicate`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_rank_syndicate` (
    `Id` int (10) unsigned NOT NULL,
    `Name` varchar(32) NOT NULL DEFAULT '',
    `LeaderId` int (10) unsigned NOT NULL DEFAULT '0',
    `Amount` int (10) unsigned NOT NULL DEFAULT '1',
    `Money` bigint (20) NOT NULL DEFAULT '0',
    `ConquerPoints` int (10) unsigned NOT NULL DEFAULT '0',
    `Level` int (11) NOT NULL DEFAULT '1',
    `DelFlag` tinyint (4) NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Id_UNIQUE` (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conquer_rank_user`
--
DROP TABLE IF EXISTS `conquer_rank_user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `conquer_rank_user` (
    `Id` int (10) unsigned NOT NULL,
    `Name` varchar(32) NOT NULL DEFAULT '',
    `Mate` int (10) unsigned NOT NULL DEFAULT '0',
    `Money` int (10) unsigned NOT NULL DEFAULT '0',
    `StorageMoney` int (10) unsigned NOT NULL DEFAULT '0',
    `ConquerPoints` int (10) unsigned NOT NULL DEFAULT '0',
    `ConquerPointsBound` int (10) unsigned NOT NULL DEFAULT '0',
    `Level` tinyint (3) unsigned NOT NULL DEFAULT '70',
    `Experience` bigint (20) unsigned NOT NULL DEFAULT '0',
    `Metempsychosis` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `Profession` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `PreviousProfession` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `FirstProfession` tinyint (3) unsigned NOT NULL DEFAULT '0',
    `Strength` smallint (5) unsigned NOT NULL DEFAULT '0',
    `Agility` smallint (5) unsigned NOT NULL DEFAULT '0',
    `Health` smallint (5) unsigned NOT NULL DEFAULT '0',
    `Soul` smallint (5) unsigned NOT NULL DEFAULT '0',
    `AttributePoints` smallint (5) unsigned NOT NULL DEFAULT '0',
    `Gift1` int (10) unsigned NOT NULL DEFAULT '0',
    `Gift2` int (10) unsigned NOT NULL DEFAULT '0',
    `Gift3` int (10) unsigned NOT NULL DEFAULT '0',
    `Gift4` int (10) unsigned NOT NULL DEFAULT '0',
    `SyndicateId` int (10) unsigned DEFAULT NULL,
    `FamilyId` int (10) unsigned DEFAULT NULL,
    `SupermanCount` int (10) unsigned NOT NULL DEFAULT '0',
    `PeerageDonation` int (10) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`),
    UNIQUE KEY `Id_UNIQUE` (`Id`),
    UNIQUE KEY `Name_UNIQUE` (`Name`),
    KEY `Rank_User_Syndicate` (`SyndicateId`),
    KEY `Rank_User_Family` (`FamilyId`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_card`
--
DROP TABLE IF EXISTS `credit_card`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `credit_card` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `CardTypeId` int (11) NOT NULL,
    `TransactionId` varchar(36) DEFAULT NULL,
    `CardUUID` varchar(36) NOT NULL,
    `UsedBy` varchar(36) DEFAULT NULL,
    `CreatedBy` varchar(36) NOT NULL,
    `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `UpdatedAt` timestamp NULL DEFAULT NULL,
    `CancelledAt` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_CreditCard_PaymentsOrderId_idx` (`TransactionId`),
    KEY `FK_CreditCard_TypeId_idx` (`CardTypeId`),
    KEY `FK_CreditCard_OwnerUserId_idx` (`CreatedBy`),
    KEY `FK_CreditCard_UserUsedBy_idx` (`UsedBy`),
    CONSTRAINT `FK_CreditCard_OwnerUserId` FOREIGN KEY (`CreatedBy`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCard_PaymentsOrderId` FOREIGN KEY (`TransactionId`) REFERENCES `payments_order` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCard_TypeId` FOREIGN KEY (`CardTypeId`) REFERENCES `credit_card_type` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_CreditCard_UserUsedBy` FOREIGN KEY (`UsedBy`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `credit_card_type`
--
DROP TABLE IF EXISTS `credit_card_type`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `credit_card_type` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `VipLevel` tinyint (4) NOT NULL DEFAULT '0',
    `VipLevelDuration` int (11) NOT NULL DEFAULT '0',
    `Silvers` bigint (20) NOT NULL DEFAULT '0',
    `ConquerPoints` int (11) NOT NULL DEFAULT '0',
    `ConquerPointsMono` tinyint (4) NOT NULL DEFAULT '0',
    `ItemType` int (11) NOT NULL DEFAULT '0',
    `ActionId` int (11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--
DROP TABLE IF EXISTS `images`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `images` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `FileName` varchar(128) NOT NULL COMMENT 'Original name of the file.',
    `FileDescription` varchar(255) NOT NULL COMMENT 'File description writen by the user.',
    `MimeType` varchar(128) NOT NULL COMMENT 'File mime type.',
    `StoragePath` varchar(128) NOT NULL COMMENT 'Server storage path.',
    `StorageName` varchar(128) NOT NULL COMMENT 'Random generated name of the file in the server storage.',
    `UserId` varchar(36) NOT NULL COMMENT 'ID of the Uploader.',
    `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `DeleteDate` datetime DEFAULT NULL,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 COMMENT = 'Stores images used in articles and other data.';

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_general`
--
DROP TABLE IF EXISTS `log_general`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `log_general` (
    `Id` bigint (20) NOT NULL AUTO_INCREMENT,
    `LogType` int (11) NOT NULL,
    `AccountId` varchar(36) DEFAULT NULL,
    `IpAddress` varchar(15) NOT NULL DEFAULT '0.0.0.0',
    `Message` varchar(128) NOT NULL,
    `Data` text NOT NULL,
    `Success` tinyint (4) NOT NULL DEFAULT '1',
    `Timestamp` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openid_api_client_allowed_scope`
--
DROP TABLE IF EXISTS `openid_api_client_allowed_scope`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `openid_api_client_allowed_scope` (
    `ClientId` varchar(36) NOT NULL,
    `ScopeId` varchar(36) NOT NULL,
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`ClientId`, `ScopeId`),
    KEY `FK_Client_Scope_ScopeID_idx` (`ScopeId`),
    CONSTRAINT `FK_Client_Scope_ClientID` FOREIGN KEY (`ClientId`) REFERENCES `openid_client` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Client_Scope_ScopeID` FOREIGN KEY (`ScopeId`) REFERENCES `openid_api_scope` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openid_api_resource`
--
DROP TABLE IF EXISTS `openid_api_resource`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `openid_api_resource` (
    `Id` varchar(36) NOT NULL,
    `Name` varchar(64) NOT NULL DEFAULT '',
    `DisplayName` varchar(64) NOT NULL DEFAULT '',
    `Description` varchar(255) NOT NULL DEFAULT '',
    `UserClaims` varchar(255) NOT NULL DEFAULT '',
    `Scopes` varchar(255) NOT NULL DEFAULT '',
    `Enabled` tinyint (1) NOT NULL DEFAULT '1' COMMENT 'Specifies if client is enabled (defaults to true)',
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifyDate` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `openid_resource_BEFORE_INSERT` BEFORE INSERT ON `openid_api_resource` FOR EACH ROW BEGIN
if NEW.Id IS NULL OR NEW.Id = '' THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `openid_api_scope`
--
DROP TABLE IF EXISTS `openid_api_scope`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `openid_api_scope` (
    `Id` varchar(36) NOT NULL,
    `Name` varchar(64) NOT NULL DEFAULT '',
    `DisplayName` varchar(64) NOT NULL DEFAULT '',
    `Description` text NOT NULL,
    `UserClaims` varchar(255) NOT NULL DEFAULT '',
    `Required` tinyint (1) NOT NULL DEFAULT '0',
    `Emphasize` tinyint (1) NOT NULL DEFAULT '0',
    `Enabled` tinyint (1) NOT NULL DEFAULT '1' COMMENT 'Specifies if client is enabled (defaults to true)',
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifyDate` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `openid_scope_BEFORE_INSERT` BEFORE INSERT ON `openid_api_scope` FOR EACH ROW BEGIN
if NEW.Id IS NULL OR NEW.Id = '' THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `openid_client`
--
DROP TABLE IF EXISTS `openid_client`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `openid_client` (
    `Id` varchar(36) NOT NULL,
    `Description` varchar(256) DEFAULT NULL COMMENT 'Description of the client.',
    `ClientName` varchar(40) NOT NULL COMMENT 'Client display name (used for logging and consent screen)',
    `ClientId` varchar(40) NOT NULL DEFAULT 'uuid()' COMMENT 'Unique ID of the client',
    `ClientSecret` varchar(40) NOT NULL COMMENT 'Client secrets - only relevant for flows that require a secret',
    `AllowedGrantTypes` varchar(128) NOT NULL DEFAULT 'CodeAndClientCredentials' COMMENT 'Specifies the allowed grant types (legal combinations of AuthorizationCode, Implicit, Hybrid, ResourceOwner, ClientCredentials).',
    `AccessTokenLifetime` int (11) NOT NULL DEFAULT '3600' COMMENT 'Lifetime of access token in seconds (defaults to 3600 seconds / 1 hour)',
    `AbsoluteRefreshTokenLifetime` int (11) NOT NULL DEFAULT '2592000' COMMENT 'Maximum lifetime of a refresh token in seconds. Defaults to 2592000 seconds / 30 days',
    `AuthorizationCodeLifetime` int (11) NOT NULL DEFAULT '300' COMMENT 'Lifetime of authorization code in seconds (defaults to 300 seconds / 5 minutes)',
    `RedirectUrl` varchar(256) DEFAULT NULL,
    `Enabled` tinyint (1) NOT NULL DEFAULT '1' COMMENT 'Specifies if client is enabled (defaults to true)',
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifyDate` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    UNIQUE KEY `ClientId_UNIQUE` (`Id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `openid_client_BEFORE_INSERT` BEFORE INSERT ON `openid_client` FOR EACH ROW BEGIN
if NEW.Id IS NULL OR New.Id = '' THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `payments_mercadopago`
--
DROP TABLE IF EXISTS `payments_mercadopago`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `payments_mercadopago` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `OrderId` varchar(36) NOT NULL,
    `PaymentId` bigint (20) NOT NULL COMMENT 'Returned from MercadoPago API to query payment information.',
    `LastStatus` int (11) NOT NULL DEFAULT '0',
    `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `UpdatedAt` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_Payment_MercadoPago_OrderIDX_idx` (`OrderId`),
    CONSTRAINT `FK_Payment_MercadoPago_OrderIDX` FOREIGN KEY (`OrderId`) REFERENCES `payments_order` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments_method`
--
DROP TABLE IF EXISTS `payments_method`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `payments_method` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `Name` varchar(64) NOT NULL,
    `Enabled` tinyint (4) NOT NULL DEFAULT '1',
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments_order`
--
DROP TABLE IF EXISTS `payments_order`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `payments_order` (
    `Id` varchar(36) NOT NULL,
    `MethodId` int (11) NOT NULL,
    `MethodData` text NOT NULL,
    `UserId` varchar(36) NOT NULL DEFAULT '',
    `Price` decimal(20, 2) NOT NULL,
    `Comment` varchar(256) DEFAULT NULL,
    `Status` int (11) NOT NULL DEFAULT '0',
    `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `UpdatedAt` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_Order_PaymentMethod_id_idx` (`MethodId`),
    KEY `FK_OrderUserId_Owner_idx` (`UserId`),
    CONSTRAINT `FK_OrderUserId_Owner` FOREIGN KEY (`UserId`) REFERENCES `account_user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Order_PaymentMethod_id` FOREIGN KEY (`MethodId`) REFERENCES `payments_method` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_conquer`.`payments_order_BEFORE_INSERT` BEFORE INSERT ON `payments_order` FOR EACH ROW
BEGIN
if NEW.Id IS NULL OR New.Id = '' THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_conquer`.`payments_order_BEFORE_UPDATE` BEFORE UPDATE ON `payments_order` FOR EACH ROW
BEGIN
SET NEW.UpdatedAt = current_timestamp();
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `payments_order_item`
--
DROP TABLE IF EXISTS `payments_order_item`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `payments_order_item` (
    `Id` int (11) NOT NULL AUTO_INCREMENT,
    `PaymentOrderId` varchar(36) NOT NULL,
    `ProductId` varchar(36) NOT NULL,
    `Amount` int (11) NOT NULL DEFAULT '1',
    `Price` decimal(20, 2) NOT NULL,
    `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`),
    KEY `FK_PaymentsItem_OrderId_idx` (`PaymentOrderId`),
    KEY `FK_PaymentsItem_ProductId_idx` (`ProductId`),
    CONSTRAINT `FK_PaymentsItem_OrderId` FOREIGN KEY (`PaymentOrderId`) REFERENCES `payments_order` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_PaymentsItem_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--
DROP TABLE IF EXISTS `product`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `product` (
    `Id` varchar(36) NOT NULL,
    `Name` varchar(64) NOT NULL DEFAULT '',
    `Description` text NOT NULL,
    `ImageId` int (11) DEFAULT NULL,
    `Price` decimal(20, 2) NOT NULL,
    `CardTypeId` int (11) NOT NULL,
    PRIMARY KEY (`Id`),
    KEY `FK_Product_Image_IDX_idx` (`ImageId`),
    KEY `FK_Product_CreditCardType_IDX_idx` (`CardTypeId`),
    CONSTRAINT `FK_Product_CreditCardType_IDX` FOREIGN KEY (`CardTypeId`) REFERENCES `credit_card_type` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Product_Image_IDX` FOREIGN KEY (`ImageId`) REFERENCES `images` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `account_conquer`.`product_BEFORE_INSERT` BEFORE INSERT ON `product` FOR EACH ROW
BEGIN
if NEW.Id IS NULL OR NEW.Id = '' THEN
SET NEW.Id = UUID();
END IF;
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `realm`
--
DROP TABLE IF EXISTS `realm`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `realm` (
    `RealmID` varchar(36) NOT NULL,
    `Name` varchar(16) NOT NULL,
    `GameIPAddress` varchar(45) NOT NULL DEFAULT '127.0.0.1',
    `RpcIPAddress` varchar(45) NOT NULL DEFAULT '127.0.0.1',
    `GamePort` int (10) unsigned NOT NULL DEFAULT '5816',
    `RpcPort` int (10) unsigned NOT NULL DEFAULT '5817',
    `Status` tinyint (1) unsigned NOT NULL DEFAULT '0',
    `Username` varchar(255) NOT NULL DEFAULT 'test',
    `Password` varchar(255) NOT NULL DEFAULT 'test',
    `LastPing` datetime DEFAULT NULL,
    `DatabaseHost` varchar(255) NOT NULL DEFAULT '',
    `DatabaseUser` varchar(255) NOT NULL DEFAULT '',
    `DatabasePass` varchar(255) NOT NULL DEFAULT '',
    `DatabaseSchema` varchar(255) NOT NULL DEFAULT '',
    `DatabasePort` varchar(255) NOT NULL DEFAULT '',
    `Active` tinyint (1) NOT NULL DEFAULT '1',
    `ProductionRealm` tinyint (1) NOT NULL DEFAULT '0',
    `GmToolsHost` varchar(255) NOT NULL DEFAULT '127.0.0.1',
    `GmToolsPort` int (11) NOT NULL DEFAULT '4350',
    `GmToolsUsername` varchar(255) NOT NULL DEFAULT 'test',
    `GmToolsPassword` varchar(255) NOT NULL DEFAULT 'test',
    PRIMARY KEY (`RealmID`) USING BTREE,
    UNIQUE KEY `RealmID_UNIQUE` (`RealmID`) USING BTREE,
    UNIQUE KEY `Name_UNIQUE` (`Name`) USING BTREE
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 ROW_FORMAT = DYNAMIC;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!50003 SET @saved_cs_client      = @@character_set_client */;

/*!50003 SET @saved_cs_results     = @@character_set_results */;

/*!50003 SET @saved_col_connection = @@collation_connection */;

/*!50003 SET character_set_client  = utf8mb4 */;

/*!50003 SET character_set_results = utf8mb4 */;

/*!50003 SET collation_connection  = utf8mb4_general_ci */;

/*!50003 SET @saved_sql_mode       = @@sql_mode */;

/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */;

DELIMITER;

;

/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`localhost`*/
/*!50003 TRIGGER `realm_BEFORE_INSERT` BEFORE INSERT ON `realm` FOR EACH ROW BEGIN
SET NEW.RealmID = UUID();
END */;

;

DELIMITER;

/*!50003 SET sql_mode              = @saved_sql_mode */;

/*!50003 SET character_set_client  = @saved_cs_client */;

/*!50003 SET character_set_results = @saved_cs_results */;

/*!50003 SET collation_connection  = @saved_col_connection */;

--
-- Table structure for table `realm_status`
--
DROP TABLE IF EXISTS `realm_status`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `realm_status` (
    `Id` bigint (20) unsigned NOT NULL AUTO_INCREMENT,
    `RealmID` varchar(36) NOT NULL,
    `Status` tinyint (1) unsigned NOT NULL,
    `PlayersOnline` int (4) unsigned NOT NULL DEFAULT '0',
    `MaxPlayersOnline` int (4) unsigned NOT NULL DEFAULT '0',
    `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Id`) USING BTREE,
    KEY `Realms` (`RealmID`) USING BTREE,
    CONSTRAINT `Realms` FOREIGN KEY (`RealmID`) REFERENCES `realm` (`RealmID`) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1 ROW_FORMAT = DYNAMIC;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_settings`
--
DROP TABLE IF EXISTS `system_settings`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `system_settings` (
    `Key` varchar(64) NOT NULL,
    `StrData0` varchar(128) DEFAULT NULL,
    `StrData1` varchar(128) DEFAULT NULL,
    `StrData2` varchar(128) DEFAULT NULL,
    `StrData3` varchar(128) DEFAULT NULL,
    `Text` text,
    `Data0` bigint (20) DEFAULT NULL,
    `Data1` bigint (20) DEFAULT NULL,
    `Data2` bigint (20) DEFAULT NULL,
    `Data3` bigint (20) DEFAULT NULL,
    `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ModifiedDate` timestamp NULL DEFAULT NULL,
    `DeleteDate` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`Key`),
    UNIQUE KEY `Key_UNIQUE` (`Key`)
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'account_conquer'
--
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

-- Dump completed on 2023-08-15  1:42:33