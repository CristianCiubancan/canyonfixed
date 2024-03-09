-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cq
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
-- Table structure for table `ad_log`
--

DROP TABLE IF EXISTS `ad_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `time` int(4) NOT NULL DEFAULT 0,
  `addition` int(4) unsigned NOT NULL DEFAULT 0,
  `words` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ad_queue`
--

DROP TABLE IF EXISTS `ad_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idnext` int(4) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `addition` smallint(6) unsigned NOT NULL DEFAULT 0,
  `words` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardbalance`
--

DROP TABLE IF EXISTS `cardbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardbalance` (
  `countDate` date NOT NULL DEFAULT '0000-00-00',
  `cardlastbalance` int(11) DEFAULT 0,
  `card2lastbalance` int(11) DEFAULT 0,
  `cardin` int(11) DEFAULT 0,
  `card2in` int(11) DEFAULT 0,
  `cardout` int(11) DEFAULT 0,
  `card2out` int(11) DEFAULT 0,
  `cardbalance` int(11) DEFAULT 0,
  `card2balance` int(11) DEFAULT 0,
  PRIMARY KEY (`countDate`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cardlastid`
--

DROP TABLE IF EXISTS `cardlastid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardlastid` (
  `id` int(4) NOT NULL DEFAULT 0,
  `cardnumber` int(4) DEFAULT 0,
  `card2number` int(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(35) NOT NULL DEFAULT '',
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `District` char(20) NOT NULL DEFAULT '',
  `Population` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4080 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Code` char(3) NOT NULL DEFAULT '',
  `Name` char(52) NOT NULL DEFAULT '',
  `Continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` char(26) NOT NULL DEFAULT '',
  `SurfaceArea` float(10,2) NOT NULL DEFAULT 0.00,
  `IndepYear` smallint(6) DEFAULT NULL,
  `Population` int(11) NOT NULL DEFAULT 0,
  `LifeExpectancy` float(3,1) DEFAULT NULL,
  `GNP` float(10,2) DEFAULT NULL,
  `GNPOld` float(10,2) DEFAULT NULL,
  `LocalName` char(45) NOT NULL DEFAULT '',
  `GovernmentForm` char(45) NOT NULL DEFAULT '',
  `HeadOfState` char(60) DEFAULT NULL,
  `Capital` int(11) DEFAULT NULL,
  `Code2` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countrylanguage`
--

DROP TABLE IF EXISTS `countrylanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countrylanguage` (
  `CountryCode` char(3) NOT NULL DEFAULT '',
  `Language` char(30) NOT NULL DEFAULT '',
  `IsOfficial` enum('T','F') NOT NULL DEFAULT 'F',
  `Percentage` float(4,1) NOT NULL DEFAULT 0.0,
  PRIMARY KEY (`CountryCode`,`Language`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_achievement`
--

DROP TABLE IF EXISTS `cq_achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_achievement` (
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `point` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve1` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve2` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve3` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve4` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve5` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve6` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve7` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve8` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve9` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve10` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve11` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve12` int(4) unsigned NOT NULL DEFAULT 0,
  `achieve13` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_achievementtype`
--

DROP TABLE IF EXISTS `cq_achievementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_achievementtype` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(16) NOT NULL DEFAULT '',
  `position` smallint(4) unsigned NOT NULL DEFAULT 0,
  `point` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `facebook` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_position` (`position`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_action`
--

DROP TABLE IF EXISTS `cq_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_action` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `id_next` int(4) unsigned NOT NULL DEFAULT 0,
  `id_nextfail` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) NOT NULL DEFAULT 0,
  `param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_action_total`
--

DROP TABLE IF EXISTS `cq_action_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_action_total` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `id_next` int(4) unsigned NOT NULL DEFAULT 0,
  `id_nextfail` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) NOT NULL DEFAULT 0,
  `param` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_activity_reward_type`
--

DROP TABLE IF EXISTS `cq_activity_reward_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_activity_reward_type` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `metempsychosis` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_grade` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `activity_req` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward1` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward1_num` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward1_mono` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward2` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward2_num` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward2_mono` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward3` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward3_num` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward3_mono` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_activity_task_type`
--

DROP TABLE IF EXISTS `cq_activity_task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_activity_task_type` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `open_lev` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `close_lev` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `type` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `max_num` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `activity` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_activity_user_task`
--

DROP TABLE IF EXISTS `cq_activity_user_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_activity_user_task` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `activity_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `complete_flag` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `schedule` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_activity` (`user_id`,`activity_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=24758 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_appointment_account`
--

DROP TABLE IF EXISTS `cq_appointment_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_appointment_account` (
  `account` varchar(64) CHARACTER SET gbk COLLATE gbk_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`account`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic`
--

DROP TABLE IF EXISTS `cq_arenic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `date` int(4) unsigned NOT NULL DEFAULT 0,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_point` int(4) unsigned NOT NULL DEFAULT 0,
  `cur_honor` int(4) unsigned NOT NULL DEFAULT 0,
  `history_honor` int(4) unsigned NOT NULL DEFAULT 0,
  `day_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `day_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `asyn` smallint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic_bonus`
--

DROP TABLE IF EXISTS `cq_arenic_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic_bonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `subtype` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `status` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_arenic_honor`
--

DROP TABLE IF EXISTS `cq_arenic_honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_arenic_honor` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `day_prise` int(4) unsigned NOT NULL DEFAULT 0,
  `month_prise` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10101 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_inauguration_condition`
--

DROP TABLE IF EXISTS `cq_ast_prof_inauguration_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_inauguration_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ast_prof_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(3) unsigned DEFAULT 0,
  `user_level` tinyint(3) unsigned DEFAULT 0,
  `itemtype1` int(10) unsigned DEFAULT 0,
  `itemtype1_num` int(10) unsigned DEFAULT 0,
  `itemtype2` int(10) unsigned DEFAULT 0,
  `itemtype2_num` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_level`
--

DROP TABLE IF EXISTS `cq_ast_prof_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_level_timeout`
--

DROP TABLE IF EXISTS `cq_ast_prof_level_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_level_timeout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ast_prof_promote_condition`
--

DROP TABLE IF EXISTS `cq_ast_prof_promote_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ast_prof_promote_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ast_prof_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ast_prof_rank` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(3) unsigned DEFAULT 0,
  `user_level` tinyint(3) unsigned DEFAULT 0,
  `ast_prof_level` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_auction`
--

DROP TABLE IF EXISTS `cq_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_auction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `class` smallint(4) unsigned NOT NULL DEFAULT 0,
  `seller` int(10) unsigned NOT NULL DEFAULT 0,
  `seller_lookface` int(10) unsigned NOT NULL DEFAULT 0,
  `moneytype` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `item_id` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `buyout` int(10) unsigned NOT NULL DEFAULT 0,
  `time_out` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_auction_askbuy`
--

DROP TABLE IF EXISTS `cq_auction_askbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_auction_askbuy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `auctionid` int(10) unsigned NOT NULL DEFAULT 0,
  `buyer` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` int(10) unsigned NOT NULL DEFAULT 0,
  `timeout` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_award_config`
--

DROP TABLE IF EXISTS `cq_award_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_award_config` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `data4` int(4) NOT NULL DEFAULT 0,
  `data5` int(4) NOT NULL DEFAULT 0,
  `describ` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_bonus`
--

DROP TABLE IF EXISTS `cq_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_bonus` (
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `id_account` int(4) unsigned NOT NULL DEFAULT 0,
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned NOT NULL DEFAULT 0,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  `ordernumber` varchar(50) NOT NULL DEFAULT '',
  `bonus_in_time` int(11) NOT NULL DEFAULT 0,
  `number` int(4) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ordernumber` (`ordernumber`) USING BTREE,
  KEY `bonus_in_time` (`bonus_in_time`) USING BTREE,
  KEY `number` (`number`) USING BTREE,
  KEY `index_refid` (`ref_id`) USING BTREE,
  KEY `index_ordernumber` (`ordernumber`) USING BTREE,
  KEY `idx_id_account_flag` (`id_account`,`flag`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_business`
--

DROP TABLE IF EXISTS `cq_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_business` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  `date` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid` (`userid`) USING BTREE,
  KEY `business` (`business`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_campsite_npc`
--

DROP TABLE IF EXISTS `cq_campsite_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_campsite_npc` (
  `campsite_id` int(10) unsigned DEFAULT 0,
  `npc_id` int(10) unsigned DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_card`
--

DROP TABLE IF EXISTS `cq_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_card` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_card2`
--

DROP TABLE IF EXISTS `cq_card2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_card2` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_card3`
--

DROP TABLE IF EXISTS `cq_card3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_card3` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_card4`
--

DROP TABLE IF EXISTS `cq_card4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_card4` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_changename_backup`
--

DROP TABLE IF EXISTS `cq_changename_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_changename_backup` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iduser` int(4) unsigned NOT NULL DEFAULT 0,
  `oldname` varchar(15) NOT NULL DEFAULT '',
  `newname` varchar(15) NOT NULL DEFAULT '',
  `changetime` int(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_client_config`
--

DROP TABLE IF EXISTS `cq_client_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_client_config` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `server_name` varchar(50) NOT NULL DEFAULT '',
  `cross_server` varchar(50) NOT NULL DEFAULT '',
  `map_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `pos_x` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `pos_y` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `range` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `npc_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `attribute` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `server_name` (`server_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_competesponsor`
--

DROP TABLE IF EXISTS `cq_competesponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_competesponsor` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `competetype` tinyint(4) NOT NULL DEFAULT 0,
  `idsponsoruser` int(4) unsigned NOT NULL DEFAULT 0,
  `idtarget` int(4) unsigned NOT NULL DEFAULT 0,
  `idoppnent` int(4) unsigned NOT NULL DEFAULT 0,
  `sponsormoney` int(4) unsigned NOT NULL DEFAULT 0,
  `starttime` int(4) unsigned NOT NULL DEFAULT 0,
  `nomal` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1621 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_config`
--

DROP TABLE IF EXISTS `cq_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_config` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `data4` int(4) NOT NULL DEFAULT 0,
  `data5` int(4) NOT NULL DEFAULT 0,
  `describ` varchar(765) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=80801 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_country_info`
--

DROP TABLE IF EXISTS `cq_country_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_country_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `na` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_cross_merit`
--

DROP TABLE IF EXISTS `cq_cross_merit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_cross_merit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `merit` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_cross_vexillum`
--

DROP TABLE IF EXISTS `cq_cross_vexillum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_cross_vexillum` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank` smallint(4) unsigned NOT NULL DEFAULT 0,
  `synid` int(4) unsigned NOT NULL DEFAULT 0,
  `server_name` varchar(15) DEFAULT '',
  `syn_name` varchar(35) DEFAULT '',
  `is_self` smallint(4) unsigned NOT NULL DEFAULT 0,
  `usercount` smallint(4) unsigned NOT NULL DEFAULT 0,
  `score` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_rank` (`rank`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_db`
--

DROP TABLE IF EXISTS `cq_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_db` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned DEFAULT 0,
  `chk_sum` int(4) unsigned DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_accountid_chksum` (`account_id`,`chk_sum`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_db2`
--

DROP TABLE IF EXISTS `cq_db2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_db2` (
  `id` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned DEFAULT 0,
  `chk_sum` int(4) unsigned DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_accountid_chksum` (`account_id`,`chk_sum`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_deluser`
--

DROP TABLE IF EXISTS `cq_deluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_deluser` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `lastname` varchar(15) NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `hair` smallint(2) unsigned NOT NULL DEFAULT 0,
  `money` bigint(4) unsigned NOT NULL DEFAULT 0,
  `money_saved` bigint(4) unsigned NOT NULL DEFAULT 0,
  `coin_money` int(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `Speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT 0,
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `deed` int(4) NOT NULL DEFAULT 0,
  `pk` smallint(2) NOT NULL DEFAULT 0,
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `medal` int(4) unsigned NOT NULL DEFAULT 0,
  `medal_select` int(4) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT 0,
  `first_login` int(8) unsigned NOT NULL DEFAULT 0,
  `account` varchar(15) NOT NULL DEFAULT 'None',
  `password` varchar(15) NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned NOT NULL DEFAULT 0,
  `time_of_life` int(4) unsigned NOT NULL DEFAULT 0,
  `virtue` int(4) unsigned NOT NULL DEFAULT 0,
  `home_id` int(4) unsigned NOT NULL DEFAULT 0,
  `lock_key` int(10) unsigned NOT NULL DEFAULT 0,
  `lock_cls` int(10) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `god_status` int(4) unsigned NOT NULL DEFAULT 0,
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT 0,
  `online_time` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `mete_lev` int(4) NOT NULL DEFAULT 0,
  `current_layout_type` tinyint(1) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `last_logout2` int(4) unsigned NOT NULL DEFAULT 0,
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_r` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  `quiz_point` int(4) unsigned DEFAULT 0,
  `vip_value` int(4) unsigned NOT NULL DEFAULT 0,
  `flag` int(4) unsigned NOT NULL DEFAULT 0,
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_day` int(4) unsigned NOT NULL DEFAULT 0,
  `title` int(4) unsigned NOT NULL DEFAULT 0,
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `athlete_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_mono` int(4) unsigned NOT NULL DEFAULT 0,
  `ridepet_point` int(4) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT 0,
  `pkprotocol` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `uin` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT 0,
  `strength_value` int(10) unsigned NOT NULL DEFAULT 0,
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nationality` smallint(2) unsigned NOT NULL DEFAULT 0,
  `pk_setting` int(4) unsigned NOT NULL DEFAULT 0,
  `culture_value` int(10) unsigned NOT NULL DEFAULT 0,
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT 0,
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT 0,
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT 0,
  `league_contribution` int(10) unsigned NOT NULL DEFAULT 0,
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT 0,
  `channel_account` varchar(74) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000010 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_deluser_timeout`
--

DROP TABLE IF EXISTS `cq_deluser_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_deluser_timeout` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `lastname` varchar(15) NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `hair` smallint(2) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `money_saved` int(4) unsigned NOT NULL DEFAULT 0,
  `coin_money` int(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `Speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT 0,
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `deed` int(4) NOT NULL DEFAULT 0,
  `pk` smallint(2) NOT NULL DEFAULT 0,
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `medal` int(4) unsigned NOT NULL DEFAULT 0,
  `medal_select` int(4) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT 0,
  `first_login` int(8) unsigned NOT NULL DEFAULT 0,
  `account` varchar(15) NOT NULL DEFAULT 'None',
  `password` varchar(15) NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned NOT NULL DEFAULT 0,
  `time_of_life` int(4) unsigned NOT NULL DEFAULT 0,
  `virtue` int(4) unsigned NOT NULL DEFAULT 0,
  `home_id` int(4) unsigned NOT NULL DEFAULT 0,
  `lock_key` int(10) unsigned NOT NULL DEFAULT 0,
  `lock_cls` int(10) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `god_status` int(4) unsigned NOT NULL DEFAULT 0,
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT 0,
  `online_time` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `mete_lev` int(4) NOT NULL DEFAULT 0,
  `current_layout_type` tinyint(1) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `last_logout2` int(4) unsigned NOT NULL DEFAULT 0,
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_r` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  `quiz_point` int(4) unsigned DEFAULT 0,
  `vip_value` int(4) unsigned NOT NULL DEFAULT 0,
  `flag` int(4) unsigned NOT NULL DEFAULT 0,
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_day` int(4) unsigned NOT NULL DEFAULT 0,
  `title` int(4) unsigned NOT NULL DEFAULT 0,
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `athlete_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_mono` int(4) unsigned NOT NULL DEFAULT 0,
  `ridepet_point` int(4) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT 0,
  `pkprotocol` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `uin` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT 0,
  `strength_value` int(10) unsigned NOT NULL DEFAULT 0,
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nationality` smallint(2) unsigned NOT NULL DEFAULT 0,
  `pk_setting` int(4) unsigned NOT NULL DEFAULT 0,
  `culture_value` int(10) unsigned NOT NULL DEFAULT 0,
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT 0,
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT 0,
  `chestpackage_size` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `league_contribution` int(10) unsigned NOT NULL DEFAULT 0,
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT 0,
  `channel_account` varchar(74) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_depot`
--

DROP TABLE IF EXISTS `cq_depot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_depot` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `playerid` int(4) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `id_2` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_disdain`
--

DROP TABLE IF EXISTS `cq_disdain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_disdain` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `delta_lev` int(4) NOT NULL DEFAULT 0,
  `usr_atk_mst` int(4) NOT NULL DEFAULT 0,
  `mst_atk` int(4) NOT NULL DEFAULT 0,
  `max_atk` int(4) NOT NULL DEFAULT 0,
  `max_xp_atk` int(4) NOT NULL DEFAULT 0,
  `exp_factor` int(4) NOT NULL DEFAULT 0,
  `xp_exp_factor` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usr_min` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usr_max` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usr_overadj` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usrx_min` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usrx_max` int(4) NOT NULL DEFAULT 0,
  `usr_atk_usrx_overadj` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usr_min` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usr_max` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usr_overadj` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usrx_min` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usrx_max` int(4) NOT NULL DEFAULT 0,
  `usrx_atk_usrx_overadj` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dropitemrule`
--

DROP TABLE IF EXISTS `cq_dropitemrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dropitemrule` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `RuleId` int(10) unsigned NOT NULL DEFAULT 0,
  `Chance` int(10) unsigned NOT NULL DEFAULT 0,
  `Item0` int(10) unsigned NOT NULL DEFAULT 0,
  `Item1` int(10) unsigned NOT NULL DEFAULT 0,
  `Item2` int(10) unsigned NOT NULL DEFAULT 0,
  `Item3` int(10) unsigned NOT NULL DEFAULT 0,
  `Item4` int(10) unsigned NOT NULL DEFAULT 0,
  `Item5` int(10) unsigned NOT NULL DEFAULT 0,
  `Item6` int(10) unsigned NOT NULL DEFAULT 0,
  `Item7` int(10) unsigned NOT NULL DEFAULT 0,
  `Item8` int(10) unsigned NOT NULL DEFAULT 0,
  `Item9` int(10) unsigned NOT NULL DEFAULT 0,
  `Item10` int(10) unsigned NOT NULL DEFAULT 0,
  `Item11` int(10) unsigned NOT NULL DEFAULT 0,
  `Item12` int(10) unsigned NOT NULL DEFAULT 0,
  `Item13` int(10) unsigned NOT NULL DEFAULT 0,
  `Item14` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`RuleId`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_global_data`
--

DROP TABLE IF EXISTS `cq_dyna_global_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_global_data` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `data0` bigint(20) NOT NULL DEFAULT 0,
  `data1` bigint(20) NOT NULL DEFAULT 0,
  `data2` bigint(20) NOT NULL DEFAULT 0,
  `data3` bigint(20) NOT NULL DEFAULT 0,
  `data4` bigint(20) NOT NULL DEFAULT 0,
  `data5` bigint(20) NOT NULL DEFAULT 0,
  `datastr0` varchar(35) NOT NULL DEFAULT '',
  `datastr1` varchar(35) NOT NULL DEFAULT '',
  `datastr2` varchar(35) NOT NULL DEFAULT '',
  `datastr3` varchar(35) NOT NULL DEFAULT '',
  `datastr4` varchar(35) NOT NULL DEFAULT '',
  `datastr5` varchar(35) NOT NULL DEFAULT '',
  `time0` int(4) unsigned NOT NULL DEFAULT 0,
  `time1` int(4) unsigned NOT NULL DEFAULT 0,
  `time2` int(4) unsigned NOT NULL DEFAULT 0,
  `time3` int(4) unsigned NOT NULL DEFAULT 0,
  `time4` int(4) unsigned NOT NULL DEFAULT 0,
  `time5` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=100014 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_prize`
--

DROP TABLE IF EXISTS `cq_dyna_rank_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_prize` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(10) unsigned NOT NULL DEFAULT 0,
  `rank_start` int(10) unsigned NOT NULL DEFAULT 0,
  `rank_end` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_rec`
--

DROP TABLE IF EXISTS `cq_dyna_rank_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_rec` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Rank_type` int(4) unsigned NOT NULL DEFAULT 0,
  `Value` bigint(4) NOT NULL DEFAULT 0,
  `Obj_id` int(4) unsigned NOT NULL DEFAULT 0,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `Rank_type` (`Rank_type`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `Obj_id` (`Obj_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dyna_rank_type`
--

DROP TABLE IF EXISTS `cq_dyna_rank_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dyna_rank_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Rank_type` int(4) unsigned NOT NULL DEFAULT 0,
  `Rank_num` smallint(4) unsigned NOT NULL DEFAULT 0,
  `Rank_date_min` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `Rank_type` (`Rank_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dynamap`
--

DROP TABLE IF EXISTS `cq_dynamap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dynamap` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL DEFAULT 'undefined',
  `describe_text` varchar(127) NOT NULL DEFAULT '',
  `mapdoc` int(4) unsigned NOT NULL DEFAULT 0,
  `type` bigint(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `mapgroup` int(4) unsigned NOT NULL DEFAULT 0,
  `idxserver` int(4) NOT NULL DEFAULT -1,
  `weather` int(4) unsigned NOT NULL DEFAULT 0,
  `bgmusic` int(4) unsigned NOT NULL DEFAULT 0,
  `bgmusic_show` int(4) unsigned NOT NULL DEFAULT 0,
  `portal0_x` int(4) unsigned NOT NULL DEFAULT 0,
  `portal0_y` int(4) unsigned NOT NULL DEFAULT 0,
  `reborn_mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `reborn_portal` int(4) unsigned NOT NULL DEFAULT 0,
  `res_lev` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `link_map` int(4) unsigned NOT NULL DEFAULT 0,
  `link_x` smallint(2) unsigned NOT NULL DEFAULT 0,
  `link_y` smallint(2) unsigned NOT NULL DEFAULT 0,
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `color` int(4) unsigned DEFAULT 4294967295,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx` (`idxserver`,`mapgroup`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000001 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_dynanpc`
--

DROP TABLE IF EXISTS `cq_dynanpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_dynanpc` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `ownertype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(35) NOT NULL DEFAULT 'undefined',
  `type` smallint(2) unsigned NOT NULL DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `idxserver` tinyint(3) NOT NULL DEFAULT -1,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `cellx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `celly` smallint(2) unsigned NOT NULL DEFAULT 0,
  `task0` int(4) unsigned NOT NULL DEFAULT 0,
  `task1` int(4) unsigned NOT NULL DEFAULT 0,
  `task2` int(4) unsigned NOT NULL DEFAULT 0,
  `task3` int(4) unsigned NOT NULL DEFAULT 0,
  `task4` int(4) unsigned NOT NULL DEFAULT 0,
  `task5` int(4) unsigned NOT NULL DEFAULT 0,
  `task6` int(4) unsigned NOT NULL DEFAULT 0,
  `task7` int(4) unsigned NOT NULL DEFAULT 0,
  `data0` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `datastr` varchar(255) NOT NULL DEFAULT 'None',
  `linkid` int(4) unsigned NOT NULL DEFAULT 0,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `maxlife` int(4) unsigned NOT NULL DEFAULT 0,
  `base` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` smallint(2) unsigned NOT NULL DEFAULT 0,
  `itemid` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_name` varchar(35) DEFAULT '',
  `default_owner_name` varchar(15) DEFAULT '',
  `defence` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_def` smallint(2) unsigned NOT NULL DEFAULT 0,
  `harvest_date` int(10) unsigned NOT NULL DEFAULT 0,
  `serverid` int(4) unsigned zerofill DEFAULT NULL,
  `new_defence` int(4) unsigned DEFAULT NULL,
  `anti_crit` smallint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_mapid` (`mapid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18554758 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_enemy`
--

DROP TABLE IF EXISTS `cq_enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_enemy` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy` int(4) unsigned NOT NULL DEFAULT 0,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_userid_enemy` (`userid`,`enemy`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_enemy_timeout`
--

DROP TABLE IF EXISTS `cq_enemy_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_enemy_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy` int(4) unsigned NOT NULL DEFAULT 0,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_exchange_buy`
--

DROP TABLE IF EXISTS `cq_exchange_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_exchange_buy` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `price` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=191406 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_facebook`
--

DROP TABLE IF EXISTS `cq_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_facebook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `facebook_id` varchar(32) NOT NULL DEFAULT 'None',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fact`
--

DROP TABLE IF EXISTS `cq_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fact` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `priority` int(4) unsigned NOT NULL DEFAULT 0,
  `datetime` int(4) unsigned NOT NULL DEFAULT 0,
  `durable` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_exp`
--

DROP TABLE IF EXISTS `cq_fate_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_exp` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `lev` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `exp` bigint(10) unsigned NOT NULL DEFAULT 0,
  `attrib1` int(4) unsigned NOT NULL DEFAULT 0,
  `attrib2` int(4) unsigned NOT NULL DEFAULT 0,
  `attrib3` int(4) unsigned NOT NULL DEFAULT 0,
  `attrib4` int(4) unsigned NOT NULL DEFAULT 0,
  `min_score` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `max_score` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `reduce_cost_rate` smallint(2) unsigned NOT NULL DEFAULT 0,
  `luck_rate` smallint(2) unsigned NOT NULL DEFAULT 0,
  `daily_give_inc` smallint(2) unsigned NOT NULL DEFAULT 0,
  `max_value_inc` smallint(2) unsigned NOT NULL DEFAULT 0,
  `prize_itemtype` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=397 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_player`
--

DROP TABLE IF EXISTS `cq_fate_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fate1_attrib1` int(10) unsigned NOT NULL DEFAULT 0,
  `fate1_attrib2` int(10) unsigned NOT NULL DEFAULT 0,
  `fate1_attrib3` int(10) unsigned NOT NULL DEFAULT 0,
  `fate1_attrib4` int(10) unsigned NOT NULL DEFAULT 0,
  `fate2_attrib1` int(10) unsigned NOT NULL DEFAULT 0,
  `fate2_attrib2` int(10) unsigned NOT NULL DEFAULT 0,
  `fate2_attrib3` int(10) unsigned NOT NULL DEFAULT 0,
  `fate2_attrib4` int(10) unsigned NOT NULL DEFAULT 0,
  `fate3_attrib1` int(10) unsigned NOT NULL DEFAULT 0,
  `fate3_attrib2` int(10) unsigned NOT NULL DEFAULT 0,
  `fate3_attrib3` int(10) unsigned NOT NULL DEFAULT 0,
  `fate3_attrib4` int(10) unsigned NOT NULL DEFAULT 0,
  `fate4_attrib1` int(10) unsigned NOT NULL DEFAULT 0,
  `fate4_attrib2` int(10) unsigned NOT NULL DEFAULT 0,
  `fate4_attrib3` int(10) unsigned NOT NULL DEFAULT 0,
  `fate4_attrib4` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_lock_info` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=632 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_protect`
--

DROP TABLE IF EXISTS `cq_fate_protect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_protect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `expiry_date` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_no1` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_no2` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_no3` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_no4` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rand`
--

DROP TABLE IF EXISTS `cq_fate_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rand` (
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `range_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `range_rate` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`fate_no`,`range_no`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rank`
--

DROP TABLE IF EXISTS `cq_fate_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attrib1` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib2` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib3` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib4` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_fate_rank` (`fate_no`,`sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_rule`
--

DROP TABLE IF EXISTS `cq_fate_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fate_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attib_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `appear_weight` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attrib_value_min` int(10) unsigned NOT NULL DEFAULT 0,
  `attrib_value_max` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_fate_rule` (`fate_no`,`attib_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fate_task`
--

DROP TABLE IF EXISTS `cq_fate_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fate_task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `data1` int(10) unsigned NOT NULL DEFAULT 0,
  `data2` int(10) unsigned NOT NULL DEFAULT 0,
  `weight` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_flag_war`
--

DROP TABLE IF EXISTS `cq_flag_war`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_flag_war` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syndicate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `old_syn_id` int(10) unsigned NOT NULL DEFAULT 0,
  `syndicate_name` char(50) NOT NULL DEFAULT '""',
  `server_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(10) unsigned NOT NULL DEFAULT 0,
  `score` int(10) unsigned NOT NULL DEFAULT 0,
  `member_count` int(10) unsigned NOT NULL DEFAULT 0,
  `rank` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED COMMENT='cross flag war';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_flag_war_user`
--

DROP TABLE IF EXISTS `cq_flag_war_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_flag_war_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `server_id` int(10) unsigned NOT NULL DEFAULT 0,
  `syndicate_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `merit` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_forbidname`
--

DROP TABLE IF EXISTS `cq_forbidname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_forbidname` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `check` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_friend`
--

DROP TABLE IF EXISTS `cq_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_friend` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `friend` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_userid_friend` (`userid`,`friend`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_friend_timeout`
--

DROP TABLE IF EXISTS `cq_friend_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_friend_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `friend` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_fuse`
--

DROP TABLE IF EXISTS `cq_fuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_fuse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `lev` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `quality` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `chance` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16779 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_generator`
--

DROP TABLE IF EXISTS `cq_generator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_generator` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_x` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_y` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cx` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cy` int(4) unsigned NOT NULL DEFAULT 0,
  `maxnpc` int(4) unsigned NOT NULL DEFAULT 0,
  `rest_secs` int(4) unsigned NOT NULL DEFAULT 0,
  `max_per_gen` int(4) unsigned NOT NULL DEFAULT 0,
  `npctype` int(4) unsigned NOT NULL DEFAULT 0,
  `timer_begin` int(4) unsigned NOT NULL DEFAULT 0,
  `timer_end` int(4) unsigned NOT NULL DEFAULT 0,
  `born_x` int(4) unsigned NOT NULL DEFAULT 0,
  `born_y` int(4) unsigned NOT NULL DEFAULT 0,
  `mask` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `path` int(10) unsigned NOT NULL DEFAULT 0,
  `return_mode` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `cluster_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attribute` int(3) unsigned NOT NULL DEFAULT 0,
  `data` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mapid` (`mapid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2140016 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_globalvariable`
--

DROP TABLE IF EXISTS `cq_globalvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_globalvariable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `data1` int(10) unsigned NOT NULL DEFAULT 0,
  `data2` int(10) unsigned NOT NULL DEFAULT 0,
  `data3` int(10) unsigned NOT NULL DEFAULT 0,
  `data4` int(10) unsigned NOT NULL DEFAULT 0,
  `data5` int(10) unsigned NOT NULL DEFAULT 0,
  `str` varchar(225) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_golden_league_data`
--

DROP TABLE IF EXISTS `cq_golden_league_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_golden_league_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` tinyint(3) unsigned DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT 0,
  `current_point` int(10) unsigned DEFAULT 0,
  `total_point` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_user_id` (`user_id`) USING BTREE,
  KEY `idx_rank` (`rank`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5130 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_golden_league_limit`
--

DROP TABLE IF EXISTS `cq_golden_league_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_golden_league_limit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` tinyint(3) unsigned DEFAULT 0,
  `additional` tinyint(3) unsigned DEFAULT 0,
  `reduce_damage` tinyint(3) unsigned DEFAULT 0,
  `hole` tinyint(3) unsigned DEFAULT 0,
  `gem` tinyint(3) unsigned DEFAULT 0,
  `quench` tinyint(3) unsigned DEFAULT 0,
  `god_soul` tinyint(3) unsigned DEFAULT 0,
  `enhance` smallint(3) unsigned DEFAULT 0,
  `training_vitality` tinyint(3) unsigned DEFAULT 0,
  `peerager` tinyint(3) unsigned DEFAULT 0,
  `ast_prf` tinyint(3) unsigned DEFAULT 0,
  `gong_fu` tinyint(3) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_golden_league_point`
--

DROP TABLE IF EXISTS `cq_golden_league_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_golden_league_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` tinyint(3) unsigned DEFAULT 0,
  `up_rank` int(10) unsigned DEFAULT 0,
  `lose` int(10) unsigned DEFAULT 0,
  `win` int(10) unsigned DEFAULT 0,
  `wins2` int(10) unsigned DEFAULT 0,
  `wins3` int(10) unsigned DEFAULT 0,
  `wins4` int(10) unsigned DEFAULT 0,
  `wins5` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_goods`
--

DROP TABLE IF EXISTS `cq_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_goods` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `ownerid` int(4) unsigned DEFAULT 0,
  `itemtype` int(4) unsigned DEFAULT 0,
  `moneytype` int(4) unsigned NOT NULL DEFAULT 0,
  `honor_price` int(10) unsigned NOT NULL DEFAULT 0,
  `compete_place` smallint(5) unsigned NOT NULL DEFAULT 0,
  `riding_price` int(4) unsigned NOT NULL DEFAULT 0,
  `goldenleague_price` int(4) unsigned NOT NULL DEFAULT 0,
  `monopoly` tinyint(1) unsigned DEFAULT NULL,
  `server_type_flag` int(4) unsigned DEFAULT NULL,
  `start_date` bigint(10) unsigned DEFAULT NULL,
  `end_date` bigint(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_ownerid` (`ownerid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_greatevent`
--

DROP TABLE IF EXISTS `cq_greatevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_greatevent` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `greateventid` int(4) unsigned NOT NULL DEFAULT 0,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT '',
  `date` int(4) unsigned NOT NULL DEFAULT 0,
  `prize` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `greateventid_userid` (`greateventid`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_greatevent_timeout`
--

DROP TABLE IF EXISTS `cq_greatevent_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_greatevent_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `greateventid` int(4) unsigned NOT NULL DEFAULT 0,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT '',
  `date` int(4) unsigned NOT NULL DEFAULT 0,
  `prize` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `greateventid_userid` (`greateventid`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_greateventprize`
--

DROP TABLE IF EXISTS `cq_greateventprize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_greateventprize` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank` smallint(4) unsigned NOT NULL DEFAULT 0,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_greateventtype`
--

DROP TABLE IF EXISTS `cq_greateventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_greateventtype` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `maxcount` smallint(4) unsigned NOT NULL DEFAULT 0,
  `begin` int(3) unsigned NOT NULL DEFAULT 0,
  `end` int(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_hair_color_type`
--

DROP TABLE IF EXISTS `cq_hair_color_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_hair_color_type` (
  `hair_id` int(4) unsigned NOT NULL DEFAULT 0,
  `color_id` int(4) unsigned NOT NULL DEFAULT 0,
  `cost_type` int(4) unsigned NOT NULL DEFAULT 0,
  `cost_type_id` int(4) unsigned NOT NULL DEFAULT 0,
  `cost_value` bigint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`hair_id`,`color_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_init_fate_attrib`
--

DROP TABLE IF EXISTS `cq_init_fate_attrib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_init_fate_attrib` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prof_sort` int(10) unsigned DEFAULT 0,
  `fate1_attrib1` int(10) DEFAULT 0,
  `fate1_attrib2` int(10) DEFAULT 0,
  `fate1_attrib3` int(10) DEFAULT 0,
  `fate1_attrib4` int(10) DEFAULT 0,
  `fate2_attrib1` int(10) DEFAULT 0,
  `fate2_attrib2` int(10) DEFAULT 0,
  `fate2_attrib3` int(10) DEFAULT 0,
  `fate2_attrib4` int(10) DEFAULT 0,
  `fate3_attrib1` int(10) DEFAULT 0,
  `fate3_attrib2` int(10) DEFAULT 0,
  `fate3_attrib3` int(10) DEFAULT 0,
  `fate3_attrib4` int(10) DEFAULT 0,
  `fate4_attrib1` int(10) DEFAULT 0,
  `fate4_attrib2` int(10) DEFAULT 0,
  `fate4_attrib3` int(10) DEFAULT 0,
  `fate4_attrib4` int(10) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `prof_sort` (`prof_sort`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_player`
--

DROP TABLE IF EXISTS `cq_inner_strength_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `value` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `finish_value` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `abolish_num` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `max_life` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_attack_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_attack` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_defense_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_defense` int(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `physic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `defense_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `smash_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `firm_defense_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_rand`
--

DROP TABLE IF EXISTS `cq_inner_strength_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_rand` (
  `inner_strength_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `range_no` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `range_rate` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_secret`
--

DROP TABLE IF EXISTS `cq_inner_strength_secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_secret` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned NOT NULL DEFAULT 0,
  `secret_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_secret_type`
--

DROP TABLE IF EXISTS `cq_inner_strength_secret_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_secret_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `max_life` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_attack_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_attack` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_defense_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_defense` int(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `physic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `defense_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `smash_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `firm_defense_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_type_info`
--

DROP TABLE IF EXISTS `cq_inner_strength_type_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_type_info` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL DEFAULT '',
  `secret_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `abolish_culture` int(4) unsigned NOT NULL DEFAULT 0,
  `rand_type1` int(4) unsigned NOT NULL DEFAULT 0,
  `rand_type2` int(4) unsigned NOT NULL DEFAULT 0,
  `rand_type3` int(4) unsigned NOT NULL DEFAULT 0,
  `max_life` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_attack_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_attack` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_defense_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_defense` int(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `physic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `defense_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `smash_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `firm_defense_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_inner_strength_type_lev_info`
--

DROP TABLE IF EXISTS `cq_inner_strength_type_lev_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_inner_strength_type_lev_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned DEFAULT 0,
  `level` tinyint(3) unsigned DEFAULT 0,
  `culture_value` int(10) unsigned DEFAULT 0,
  `max_life` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_attack_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_attack` int(4) unsigned NOT NULL DEFAULT 0,
  `physic_defense_new` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_defense` int(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_add` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_physic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `final_magic_reduce` smallint(4) unsigned NOT NULL DEFAULT 0,
  `physic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `defense_crit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `smash_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `firm_defense_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_level` (`type`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_instancetype`
--

DROP TABLE IF EXISTS `cq_instancetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_instancetype` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL DEFAULT '',
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `lev_min` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `lev_max` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `battle_min` smallint(4) unsigned NOT NULL DEFAULT 0,
  `time_limit` smallint(4) unsigned NOT NULL DEFAULT 0,
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `mapid_return` int(4) unsigned NOT NULL DEFAULT 0,
  `posx_return` smallint(4) unsigned NOT NULL DEFAULT 0,
  `posy_return` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ippointrecord`
--

DROP TABLE IF EXISTS `cq_ippointrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ippointrecord` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ip1` int(4) unsigned NOT NULL DEFAULT 0,
  `ipcode1` int(4) unsigned NOT NULL DEFAULT 0,
  `ippoint1` int(4) NOT NULL DEFAULT 0,
  `iplogintime1` int(4) unsigned NOT NULL DEFAULT 0,
  `ip2` int(4) unsigned NOT NULL DEFAULT 0,
  `ipcode2` int(4) unsigned NOT NULL DEFAULT 0,
  `ippoint2` int(4) NOT NULL DEFAULT 0,
  `iplogintime2` int(4) unsigned NOT NULL DEFAULT 0,
  `ip3` int(4) unsigned NOT NULL DEFAULT 0,
  `ipcode3` int(4) unsigned NOT NULL DEFAULT 0,
  `ippoint3` int(4) NOT NULL DEFAULT 0,
  `iplogintime3` int(4) unsigned NOT NULL DEFAULT 0,
  `ip4` int(4) unsigned NOT NULL DEFAULT 0,
  `ipcode4` int(4) unsigned NOT NULL DEFAULT 0,
  `ippoint4` int(4) NOT NULL DEFAULT 0,
  `iplogintime4` int(4) unsigned NOT NULL DEFAULT 0,
  `ip5` int(4) unsigned NOT NULL DEFAULT 0,
  `ipcode5` int(4) unsigned NOT NULL DEFAULT 0,
  `ippoint5` int(4) NOT NULL DEFAULT 0,
  `iplogintime5` int(4) unsigned NOT NULL DEFAULT 0,
  `lastloginip` int(4) unsigned NOT NULL DEFAULT 0,
  `lastlogintime` int(4) unsigned NOT NULL DEFAULT 0,
  `initialip` int(4) unsigned NOT NULL DEFAULT 0,
  `initialipcode` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_iptoaddrconfig`
--

DROP TABLE IF EXISTS `cq_iptoaddrconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_iptoaddrconfig` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ipcode` int(4) unsigned NOT NULL DEFAULT 0,
  `ipbegin` int(4) unsigned NOT NULL DEFAULT 0,
  `ipend` int(4) unsigned NOT NULL DEFAULT 0,
  `country` varchar(24) DEFAULT NULL,
  `city` varchar(82) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item`
--

DROP TABLE IF EXISTS `cq_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `amount` smallint(2) unsigned NOT NULL DEFAULT 100,
  `amount_limit` smallint(2) unsigned NOT NULL DEFAULT 100,
  `ident` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `position` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem1` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic1` int(4) unsigned NOT NULL DEFAULT 0,
  `magic2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic3` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data` int(4) NOT NULL DEFAULT 0,
  `reduce_dmg` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `add_life` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `anti_monster` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `plunder` smallint(2) unsigned NOT NULL DEFAULT 0,
  `SpecialFlag` int(4) unsigned NOT NULL DEFAULT 0,
  `color` tinyint(1) unsigned DEFAULT 0,
  `Addlevel_exp` int(4) unsigned NOT NULL DEFAULT 0,
  `monopoly` tinyint(1) NOT NULL DEFAULT 0,
  `syndicate` int(4) unsigned NOT NULL DEFAULT 0,
  `del_time` bigint(4) NOT NULL DEFAULT 0,
  `save_time` int(4) unsigned NOT NULL DEFAULT 0,
  `accumulate_num` int(4) unsigned NOT NULL DEFAULT 1,
  `refine_lev` tinyint(1) unsigned zerofill DEFAULT NULL,
  `refine_exp` int(4) unsigned zerofill DEFAULT NULL,
  `refine_owner_id` int(4) unsigned zerofill DEFAULT NULL,
  `refine_owner_name` varchar(45) DEFAULT NULL,
  `refine_comment` varchar(96) DEFAULT NULL,
  `rune_exp` int(10) unsigned zerofill DEFAULT NULL,
  `data1` int(10) unsigned zerofill DEFAULT NULL,
  `data2` int(10) unsigned zerofill DEFAULT NULL,
  `data3` int(10) unsigned zerofill DEFAULT NULL,
  `data4` int(10) unsigned zerofill DEFAULT NULL,
  `data5` int(10) unsigned zerofill DEFAULT NULL,
  `spirit` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=59817 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_cross`
--

DROP TABLE IF EXISTS `cq_item_cross`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_cross` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_drop`
--

DROP TABLE IF EXISTS `cq_item_drop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_drop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_type` int(10) unsigned NOT NULL,
  `map` int(10) unsigned NOT NULL,
  `x` smallint(5) unsigned NOT NULL,
  `y` smallint(5) unsigned NOT NULL,
  `addition` tinyint(3) unsigned NOT NULL,
  `gem1` tinyint(3) unsigned NOT NULL,
  `gem2` tinyint(3) unsigned NOT NULL,
  `reduce_dmg` tinyint(3) unsigned NOT NULL,
  `add_life` tinyint(3) unsigned NOT NULL,
  `data` int(10) unsigned NOT NULL,
  `drop_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId_DropIdx` (`user_id`),
  KEY `ItemId_DropIdx` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197781 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_drop_rule`
--

DROP TABLE IF EXISTS `cq_item_drop_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_drop_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` int(10) unsigned NOT NULL DEFAULT 0,
  `drop_rate` smallint(10) unsigned NOT NULL DEFAULT 0,
  `equp_type` smallint(10) unsigned NOT NULL DEFAULT 0,
  `min_lv` tinyint(10) unsigned NOT NULL DEFAULT 0,
  `max_lv` tinyint(10) unsigned NOT NULL DEFAULT 0,
  `rate_hole1` int(10) unsigned NOT NULL DEFAULT 0,
  `rate_hole2` int(10) unsigned NOT NULL DEFAULT 0,
  `rate_hole3` int(10) unsigned NOT NULL DEFAULT 0,
  `min_durability` tinyint(10) unsigned NOT NULL DEFAULT 0,
  `max_durability` tinyint(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_limit`
--

DROP TABLE IF EXISTS `cq_item_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_limit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `limit_level` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_os_limit`
--

DROP TABLE IF EXISTS `cq_item_os_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_os_limit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_pick_up`
--

DROP TABLE IF EXISTS `cq_item_pick_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_pick_up` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `drop_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_type` int(10) unsigned NOT NULL,
  `pickup_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1056139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_timeout`
--

DROP TABLE IF EXISTS `cq_item_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `amount` smallint(2) unsigned NOT NULL DEFAULT 100,
  `amount_limit` smallint(2) unsigned NOT NULL DEFAULT 100,
  `ident` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `position` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem1` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic1` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic3` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data` int(4) NOT NULL DEFAULT 0,
  `reduce_dmg` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `add_life` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `anti_monster` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `plunder` smallint(2) unsigned NOT NULL DEFAULT 0,
  `SpecialFlag` int(4) unsigned NOT NULL DEFAULT 0,
  `color` tinyint(1) unsigned DEFAULT 0,
  `Addlevel_exp` int(4) unsigned NOT NULL DEFAULT 0,
  `monopoly` tinyint(1) NOT NULL DEFAULT 0,
  `syndicate` int(4) unsigned NOT NULL DEFAULT 0,
  `del_time` bigint(4) NOT NULL DEFAULT 0,
  `save_time` int(4) unsigned NOT NULL DEFAULT 0,
  `accumulate_num` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_item_value_type`
--

DROP TABLE IF EXISTS `cq_item_value_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_item_value_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) unsigned NOT NULL DEFAULT 0,
  `value1` int(4) unsigned NOT NULL DEFAULT 0,
  `value2` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3905 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemaddition`
--

DROP TABLE IF EXISTS `cq_itemaddition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemaddition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` int(10) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `life` smallint(6) NOT NULL DEFAULT 0,
  `attack_max` smallint(6) NOT NULL DEFAULT 0,
  `attack_min` smallint(6) NOT NULL DEFAULT 0,
  `defense` smallint(6) NOT NULL DEFAULT 0,
  `magic_atk` smallint(6) NOT NULL DEFAULT 0,
  `magic_def` smallint(6) NOT NULL DEFAULT 0,
  `dexterity` smallint(6) NOT NULL DEFAULT 0,
  `dodge` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `typeid` (`typeid`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17998 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemstatus`
--

DROP TABLE IF EXISTS `cq_itemstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemstatus` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iditem` int(4) unsigned NOT NULL DEFAULT 0,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `statu` int(4) unsigned NOT NULL DEFAULT 0,
  `lev` int(4) unsigned NOT NULL DEFAULT 0,
  `power1` int(4) unsigned NOT NULL DEFAULT 0,
  `power2` int(4) unsigned NOT NULL DEFAULT 0,
  `realsecs` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  `position` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_iditem` (`iditem`) USING BTREE,
  KEY `idx_position_userid` (`position`,`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemstatus_timeout`
--

DROP TABLE IF EXISTS `cq_itemstatus_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemstatus_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `iditem` int(4) unsigned NOT NULL DEFAULT 0,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `statu` int(4) unsigned NOT NULL DEFAULT 0,
  `lev` int(4) unsigned NOT NULL DEFAULT 0,
  `power1` int(4) unsigned NOT NULL DEFAULT 0,
  `power2` int(4) unsigned NOT NULL DEFAULT 0,
  `realsecs` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  `position` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_iditem` (`iditem`) USING BTREE,
  KEY `idx_position_userid` (`position`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_itemtype`
--

DROP TABLE IF EXISTS `cq_itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_itemtype` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(35) NOT NULL DEFAULT '',
  `req_profession` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `req_weaponskill` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `req_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `req_sex` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `req_force` smallint(2) unsigned NOT NULL DEFAULT 0,
  `req_speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `req_health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `req_soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `monopoly` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` smallint(2) unsigned NOT NULL DEFAULT 100,
  `price` int(4) unsigned NOT NULL DEFAULT 0,
  `id_action` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_max` smallint(2) unsigned NOT NULL DEFAULT 0,
  `attack_min` smallint(2) unsigned NOT NULL DEFAULT 0,
  `defense` smallint(2) NOT NULL DEFAULT 0,
  `dexterity` smallint(2) NOT NULL DEFAULT 0,
  `dodge` smallint(2) NOT NULL DEFAULT 0,
  `life` smallint(2) NOT NULL DEFAULT 0,
  `mana` smallint(2) NOT NULL DEFAULT 0,
  `amount` smallint(2) unsigned NOT NULL DEFAULT 1,
  `amount_limit` smallint(2) unsigned NOT NULL DEFAULT 1,
  `ident` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem1` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `gem2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic1` int(4) unsigned NOT NULL DEFAULT 0,
  `magic2` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `magic3` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_atk` smallint(2) unsigned NOT NULL DEFAULT 0,
  `magic_def` smallint(2) unsigned NOT NULL DEFAULT 0,
  `atk_range` smallint(2) unsigned NOT NULL DEFAULT 1,
  `atk_speed` smallint(2) unsigned NOT NULL DEFAULT 800,
  `fray_mode` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `repair_mode` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `type_mask` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `emoney_price` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_mono_price` int(4) unsigned NOT NULL DEFAULT 0,
  `save_time` int(4) NOT NULL DEFAULT 0,
  `critical_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_critical_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `anti_critical_rate` smallint(4) unsigned NOT NULL DEFAULT 0,
  `magic_penetration` smallint(2) unsigned NOT NULL DEFAULT 0,
  `shield_block` int(4) unsigned NOT NULL DEFAULT 0,
  `crash_attack` smallint(4) unsigned NOT NULL DEFAULT 0,
  `stable_defence` smallint(4) unsigned NOT NULL DEFAULT 0,
  `accumulate_limit` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_metal` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_water` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_fire` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_earth` int(4) unsigned NOT NULL DEFAULT 0,
  `type_desc` varchar(50) DEFAULT NULL,
  `item_desc` varchar(200) DEFAULT NULL,
  `color_index` int(4) unsigned NOT NULL DEFAULT 0,
  `godsoullev` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `meteor_count` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `recover_energy` int(10) unsigned NOT NULL DEFAULT 0,
  `auction_class` smallint(4) unsigned NOT NULL DEFAULT 0,
  `auction_deposit` int(10) unsigned NOT NULL DEFAULT 0,
  `final_dmg_add` smallint(5) unsigned NOT NULL DEFAULT 0,
  `final_dmg_add_mgc` smallint(5) unsigned NOT NULL DEFAULT 0,
  `final_dmg_reduce` smallint(5) unsigned NOT NULL DEFAULT 0,
  `final_dmg_reduce_mgc` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sort` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jail_log`
--

DROP TABLE IF EXISTS `cq_jail_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jail_log` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) NOT NULL DEFAULT '',
  `time` int(8) unsigned NOT NULL DEFAULT 0,
  `reason` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_attrib_rand`
--

DROP TABLE IF EXISTS `cq_jianghu_attrib_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_attrib_rand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `power_attrib` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_caltivate_condition`
--

DROP TABLE IF EXISTS `cq_jianghu_caltivate_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_caltivate_condition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(4) unsigned DEFAULT 0,
  `need_power_value` smallint(6) unsigned DEFAULT 0,
  `need_caltivate_value` int(11) unsigned DEFAULT 0,
  `crit_cost` int(11) unsigned DEFAULT 0,
  `high_crit_cost` int(11) unsigned DEFAULT 0,
  `keep_cost` smallint(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_caltivate_times`
--

DROP TABLE IF EXISTS `cq_jianghu_caltivate_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_caltivate_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned DEFAULT 0,
  `free_times` tinyint(4) unsigned DEFAULT 0,
  `paid_times` int(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_player`
--

DROP TABLE IF EXISTS `cq_jianghu_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned DEFAULT 0,
  `enter_jianghu_flag` tinyint(3) unsigned DEFAULT 0,
  `gongfu_name` varchar(50) DEFAULT '0',
  `power_level` tinyint(3) unsigned DEFAULT 0,
  `genuine_qi_level` tinyint(3) unsigned DEFAULT 0,
  `free_caltivate_param` int(10) unsigned DEFAULT 0,
  `total_power_value` int(10) unsigned DEFAULT 0,
  `history_max_total_power_value` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=632 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_player_power`
--

DROP TABLE IF EXISTS `cq_jianghu_player_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_player_power` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned DEFAULT 0,
  `level` tinyint(10) unsigned DEFAULT 0,
  `type1` tinyint(4) unsigned DEFAULT 0,
  `quality1` tinyint(4) unsigned DEFAULT 0,
  `type2` tinyint(4) unsigned DEFAULT 0,
  `quality2` tinyint(4) unsigned DEFAULT 0,
  `type3` tinyint(4) unsigned DEFAULT 0,
  `quality3` tinyint(4) unsigned DEFAULT 0,
  `type4` tinyint(4) unsigned DEFAULT 0,
  `quality4` tinyint(4) unsigned DEFAULT 0,
  `type5` tinyint(4) unsigned DEFAULT 0,
  `quality5` tinyint(4) unsigned DEFAULT 0,
  `type6` tinyint(4) unsigned DEFAULT 0,
  `quality6` tinyint(4) unsigned DEFAULT 0,
  `type7` tinyint(4) unsigned DEFAULT 0,
  `quality7` tinyint(4) unsigned DEFAULT 0,
  `type8` tinyint(4) unsigned DEFAULT 0,
  `quality8` tinyint(4) unsigned DEFAULT 0,
  `type9` tinyint(4) unsigned DEFAULT 0,
  `quality9` tinyint(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_level` (`player_id`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5680 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_power_effect`
--

DROP TABLE IF EXISTS `cq_jianghu_power_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_power_effect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT 0,
  `quality` tinyint(3) unsigned DEFAULT 0,
  `attrib_value` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_jianghu_quality_rand`
--

DROP TABLE IF EXISTS `cq_jianghu_quality_rand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_jianghu_quality_rand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `power_level` tinyint(4) unsigned DEFAULT 0,
  `power_quality` tinyint(4) unsigned DEFAULT 0,
  `common_rate` smallint(6) unsigned DEFAULT 0,
  `crit_rate` smallint(6) unsigned DEFAULT 0,
  `high_crit_rate` smallint(6) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_killmonster`
--

DROP TABLE IF EXISTS `cq_killmonster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_killmonster` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `event_type` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `data_type` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `data` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `timestamp` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_league`
--

DROP TABLE IF EXISTS `cq_league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_league` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `leader_syn` int(10) unsigned DEFAULT 0,
  `country_date` int(10) unsigned DEFAULT 0,
  `title` varchar(10) DEFAULT NULL,
  `money` bigint(10) unsigned DEFAULT 0,
  `announcement` varchar(257) DEFAULT NULL,
  `declaration` varchar(257) DEFAULT NULL,
  `name_flag` tinyint(4) unsigned DEFAULT 0,
  `brick` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_league_contribute`
--

DROP TABLE IF EXISTS `cq_league_contribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_league_contribute` (
  `level` int(4) unsigned NOT NULL,
  `need_contribute` int(4) unsigned NOT NULL DEFAULT 0,
  `official_name` varchar(15) NOT NULL,
  PRIMARY KEY (`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_league_info`
--

DROP TABLE IF EXISTS `cq_league_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_league_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idserver` int(10) NOT NULL DEFAULT 0,
  `idleague` int(10) NOT NULL DEFAULT 0,
  `amount` int(10) NOT NULL DEFAULT 0,
  `country_date` int(10) NOT NULL DEFAULT 0,
  `league_name` varchar(50) DEFAULT NULL,
  `leader_name` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_league_member`
--

DROP TABLE IF EXISTS `cq_league_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_league_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT 0,
  `league_id` int(10) DEFAULT 0,
  `salary_flag` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_league_token`
--

DROP TABLE IF EXISTS `cq_league_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_league_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `league_id` int(10) unsigned DEFAULT 0,
  `token_type` int(10) DEFAULT 0,
  `times` tinyint(4) unsigned DEFAULT 0,
  `last_use_time` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_leaveword`
--

DROP TABLE IF EXISTS `cq_leaveword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_leaveword` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `recv_id` int(4) unsigned DEFAULT 0,
  `send_name` varchar(15) NOT NULL DEFAULT 'unknown',
  `time` varchar(15) NOT NULL DEFAULT '00000000000000',
  `words` varchar(255) NOT NULL DEFAULT 'undefined',
  `lookface` int(6) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_time` (`time`) USING BTREE,
  KEY `idx_recv_id` (`recv_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_levexp`
--

DROP TABLE IF EXISTS `cq_levexp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_levexp` (
  `level` int(4) unsigned NOT NULL DEFAULT 0,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `up_lev_time` int(4) NOT NULL DEFAULT 0,
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_log`
--

DROP TABLE IF EXISTS `cq_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_log` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `task_id` int(4) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_login_rcd`
--

DROP TABLE IF EXISTS `cq_login_rcd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_login_rcd` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(4) unsigned DEFAULT 0,
  `user_id` int(4) unsigned DEFAULT 0,
  `session_secs` int(4) unsigned DEFAULT 0,
  `login_time` datetime NOT NULL,
  `logout_time` datetime NOT NULL,
  `server_version` varchar(64) DEFAULT '1.0.0.0-alpha',
  `mac_addr` varchar(32) DEFAULT NULL,
  `ip_addr` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_lottery`
--

DROP TABLE IF EXISTS `cq_lottery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_lottery` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `rank` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `chance` int(4) unsigned NOT NULL DEFAULT 0,
  `prize_name` char(32) NOT NULL DEFAULT '',
  `prize_item` int(4) unsigned NOT NULL DEFAULT 0,
  `color` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `hole_num` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `addition_lev` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic`
--

DROP TABLE IF EXISTS `cq_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` smallint(4) unsigned NOT NULL DEFAULT 0,
  `level` smallint(4) unsigned NOT NULL DEFAULT 0,
  `exp` int(4) unsigned NOT NULL DEFAULT 0,
  `unlearn` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `old_level` smallint(4) unsigned NOT NULL DEFAULT 0,
  `current_effect_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `available_effect_type` int(10) unsigned NOT NULL DEFAULT 1,
  `effect_monopoly` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  `effect_exorbitant` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_magic` (`ownerid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3037 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic_20030516`
--

DROP TABLE IF EXISTS `cq_magic_20030516`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic_20030516` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` smallint(4) unsigned NOT NULL DEFAULT 0,
  `level` smallint(4) unsigned NOT NULL DEFAULT 0,
  `exp` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_magic` (`ownerid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic_group_rate`
--

DROP TABLE IF EXISTS `cq_magic_group_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic_group_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` int(10) unsigned NOT NULL DEFAULT 0,
  `single_rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  `single_cd` smallint(5) unsigned NOT NULL DEFAULT 0,
  `three_seq_rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  `three_seq_cd` smallint(5) unsigned NOT NULL DEFAULT 0,
  `five_seq_rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  `five_seq_cd` smallint(5) unsigned NOT NULL DEFAULT 0,
  `three_onetime_rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  `three_onetime_cd` smallint(5) unsigned NOT NULL DEFAULT 0,
  `five_onetime_rate` smallint(5) unsigned NOT NULL DEFAULT 0,
  `five_onetime_cd` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `score` (`score`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magic_timeout`
--

DROP TABLE IF EXISTS `cq_magic_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magic_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` smallint(4) unsigned NOT NULL DEFAULT 0,
  `level` smallint(4) unsigned NOT NULL DEFAULT 0,
  `exp` int(4) unsigned NOT NULL DEFAULT 0,
  `unlearn` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `old_level` smallint(4) unsigned NOT NULL DEFAULT 0,
  `current_effect_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `available_effect_type` int(10) unsigned NOT NULL DEFAULT 1,
  `effect_monopoly` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  `effect_exorbitant` int(10) unsigned zerofill NOT NULL DEFAULT 0000000000,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_magic` (`ownerid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictype`
--

DROP TABLE IF EXISTS `cq_magictype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictype` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(35) NOT NULL DEFAULT '',
  `crime` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ground` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `multi` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `target` int(4) unsigned NOT NULL DEFAULT 0,
  `level` int(4) unsigned NOT NULL DEFAULT 0,
  `use_mp` int(4) unsigned NOT NULL DEFAULT 0,
  `power` int(4) NOT NULL DEFAULT 0,
  `intone_speed` int(4) unsigned NOT NULL DEFAULT 0,
  `percent` int(4) unsigned NOT NULL DEFAULT 0,
  `step_secs` int(4) unsigned NOT NULL DEFAULT 0,
  `range` int(4) unsigned NOT NULL DEFAULT 0,
  `distance` int(4) unsigned NOT NULL DEFAULT 0,
  `status` int(4) NOT NULL DEFAULT 0,
  `need_prof` int(4) unsigned NOT NULL DEFAULT 0,
  `need_exp` int(4) NOT NULL DEFAULT 0,
  `need_time` int(10) unsigned NOT NULL DEFAULT 0,
  `need_level` int(4) unsigned NOT NULL DEFAULT 0,
  `use_xp` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weapon_subtype` int(4) unsigned NOT NULL DEFAULT 0,
  `active_times` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `floor_attr` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_learn` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `learn_level` int(4) unsigned NOT NULL DEFAULT 0,
  `drop_weapon` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `use_ep` int(4) unsigned NOT NULL DEFAULT 0,
  `weapon_hit` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `use_item` int(4) unsigned NOT NULL DEFAULT 0,
  `next_magic` int(4) unsigned DEFAULT 0,
  `delay_ms` int(4) unsigned NOT NULL DEFAULT 0,
  `use_item_num` int(4) unsigned NOT NULL DEFAULT 1,
  `status_data0` int(4) unsigned NOT NULL DEFAULT 0,
  `status_data1` int(4) unsigned NOT NULL DEFAULT 0,
  `status_data2` int(4) unsigned NOT NULL DEFAULT 0,
  `attr_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attr_power` int(4) unsigned NOT NULL DEFAULT 0,
  `target_num` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `need_ast_prof` int(4) unsigned NOT NULL DEFAULT 0,
  `need_ast_prof_rank` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `width` int(4) unsigned DEFAULT 0,
  `data` int(10) unsigned NOT NULL DEFAULT 0,
  `dur_time` int(10) unsigned DEFAULT 0,
  `atk_interval` int(10) unsigned DEFAULT 0,
  `coldtime` int(10) unsigned NOT NULL DEFAULT 0,
  `req_uplevtime` int(10) unsigned NOT NULL DEFAULT 0,
  `first_magic` int(10) unsigned NOT NULL DEFAULT 0,
  `combo_delay` int(10) unsigned NOT NULL DEFAULT 0,
  `combo_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `magictypeex_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12481 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictype_ex`
--

DROP TABLE IF EXISTS `cq_magictype_ex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictype_ex` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) unsigned NOT NULL DEFAULT 0,
  `data2` int(4) unsigned NOT NULL DEFAULT 0,
  `data3` int(4) unsigned NOT NULL DEFAULT 0,
  `data4` int(4) unsigned NOT NULL DEFAULT 0,
  `data5` int(4) unsigned NOT NULL DEFAULT 0,
  `data6` int(4) unsigned NOT NULL DEFAULT 0,
  `data7` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_magictypeop`
--

DROP TABLE IF EXISTS `cq_magictypeop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_magictypeop` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `rebirth_time` int(1) NOT NULL DEFAULT 0,
  `profession_ago` int(2) NOT NULL DEFAULT 0,
  `profession_now` int(2) NOT NULL DEFAULT 0,
  `magictype_op` int(1) NOT NULL DEFAULT 0,
  `skill_1` int(4) NOT NULL DEFAULT 0,
  `skill_2` int(4) NOT NULL DEFAULT 0,
  `skill_3` int(4) NOT NULL DEFAULT 0,
  `skill_4` int(4) NOT NULL DEFAULT 0,
  `skill_5` int(4) NOT NULL DEFAULT 0,
  `skill_6` int(4) NOT NULL DEFAULT 0,
  `skill_7` int(4) NOT NULL DEFAULT 0,
  `skill_8` int(4) NOT NULL DEFAULT 0,
  `skill_9` int(4) NOT NULL DEFAULT 0,
  `skill_10` int(4) NOT NULL DEFAULT 0,
  `skill_11` int(4) NOT NULL DEFAULT 0,
  `skill_12` int(4) NOT NULL DEFAULT 0,
  `skill_13` int(4) NOT NULL DEFAULT 0,
  `skill_14` int(4) NOT NULL DEFAULT 0,
  `skill_15` int(4) NOT NULL DEFAULT 0,
  `skill_16` int(4) NOT NULL DEFAULT 0,
  `skill_17` int(4) NOT NULL DEFAULT 0,
  `skill_18` int(4) NOT NULL DEFAULT 0,
  `skill_19` int(4) NOT NULL DEFAULT 0,
  `skill_20` int(4) NOT NULL DEFAULT 0,
  `skill_21` int(4) NOT NULL DEFAULT 0,
  `skill_22` int(4) NOT NULL DEFAULT 0,
  `skill_23` int(4) NOT NULL DEFAULT 0,
  `skill_24` int(4) NOT NULL DEFAULT 0,
  `skill_25` int(4) NOT NULL DEFAULT 0,
  `skill_26` int(4) NOT NULL DEFAULT 0,
  `skill_27` int(4) NOT NULL DEFAULT 0,
  `skill_28` int(4) NOT NULL DEFAULT 0,
  `skill_29` int(4) NOT NULL DEFAULT 0,
  `skill_30` int(4) NOT NULL DEFAULT 0,
  `skill_31` int(4) NOT NULL DEFAULT 0,
  `skill_32` int(4) NOT NULL DEFAULT 0,
  `skill_33` int(4) NOT NULL DEFAULT 0,
  `skill_34` int(4) NOT NULL DEFAULT 0,
  `skill_35` int(4) NOT NULL DEFAULT 0,
  `skill_36` int(4) NOT NULL DEFAULT 0,
  `skill_37` int(4) NOT NULL DEFAULT 0,
  `skill_38` int(4) NOT NULL DEFAULT 0,
  `skill_39` int(4) NOT NULL DEFAULT 0,
  `skill_40` int(4) NOT NULL DEFAULT 0,
  `skill_41` int(4) NOT NULL DEFAULT 0,
  `skill_42` int(4) NOT NULL DEFAULT 0,
  `skill_43` int(4) NOT NULL DEFAULT 0,
  `skill_44` int(4) NOT NULL DEFAULT 0,
  `skill_45` int(4) NOT NULL DEFAULT 0,
  `skill_46` int(4) NOT NULL DEFAULT 0,
  `skill_47` int(4) NOT NULL DEFAULT 0,
  `skill_48` int(4) NOT NULL DEFAULT 0,
  `skill_49` int(4) NOT NULL DEFAULT 0,
  `skill_50` int(4) NOT NULL DEFAULT 0,
  `skill_51` int(4) NOT NULL DEFAULT 0,
  `skill_52` int(4) NOT NULL DEFAULT 0,
  `skill_53` int(4) NOT NULL DEFAULT 0,
  `skill_54` int(4) NOT NULL DEFAULT 0,
  `skill_55` int(4) NOT NULL DEFAULT 0,
  `skill_56` int(4) NOT NULL DEFAULT 0,
  `skill_57` int(4) NOT NULL DEFAULT 0,
  `skill_58` int(4) NOT NULL DEFAULT 0,
  `skill_59` int(4) NOT NULL DEFAULT 0,
  `skill_60` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1032 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_mail`
--

DROP TABLE IF EXISTS `cq_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_mail` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_id` int(4) unsigned NOT NULL DEFAULT 0,
  `Sender_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `expiration_date` int(4) unsigned NOT NULL DEFAULT 0,
  `item_id` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_record_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_receiver_id` (`receiver_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_map`
--

DROP TABLE IF EXISTS `cq_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_map` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(35) DEFAULT 'undefined',
  `describe_text` varchar(127) DEFAULT NULL,
  `mapdoc` int(4) unsigned NOT NULL DEFAULT 0,
  `type` bigint(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned DEFAULT 0,
  `mapgroup` int(4) unsigned NOT NULL DEFAULT 0,
  `idxserver` int(4) DEFAULT -1,
  `weather` int(4) unsigned DEFAULT 0,
  `bgmusic` int(4) unsigned DEFAULT 0,
  `bgmusic_show` int(4) unsigned DEFAULT 0,
  `portal0_x` int(4) unsigned DEFAULT 0,
  `portal0_y` int(4) unsigned DEFAULT 0,
  `reborn_map` int(4) unsigned DEFAULT 0,
  `reborn_portal` int(4) unsigned DEFAULT 0,
  `res_lev` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `owner_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `link_map` int(4) unsigned NOT NULL DEFAULT 0,
  `link_x` smallint(4) unsigned NOT NULL DEFAULT 0,
  `link_y` smallint(4) unsigned NOT NULL DEFAULT 0,
  `del_flag` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `color` int(4) unsigned DEFAULT 4294967295,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_map_backup`
--

DROP TABLE IF EXISTS `cq_map_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_map_backup` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(32) DEFAULT 'None',
  `describe_text` varchar(128) DEFAULT NULL,
  `mapdoc` int(4) unsigned NOT NULL DEFAULT 0,
  `type` bigint(20) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `mapgroup` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `idxserver` int(4) NOT NULL DEFAULT -1,
  `weather` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `bgmusic` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `bgmusic_show` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `portal0_x` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `portal0_y` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reborn_map` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reborn_portal` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `res_lev` tinyint(3) unsigned zerofill NOT NULL DEFAULT 000,
  `owner_type` tinyint(3) unsigned zerofill NOT NULL DEFAULT 000,
  `link_map` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `link_x` smallint(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `link_y` smallint(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `del_flag` tinyint(3) unsigned zerofill NOT NULL DEFAULT 000,
  `color` int(4) unsigned zerofill NOT NULL DEFAULT 4294967295,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `idx` (`idxserver`,`mapgroup`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_meedrecord`
--

DROP TABLE IF EXISTS `cq_meedrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_meedrecord` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned NOT NULL DEFAULT 0,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `point` smallint(4) unsigned DEFAULT 0,
  `money` int(4) unsigned DEFAULT 0,
  `emoney` int(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_synid` (`synid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_message_log`
--

DROP TABLE IF EXISTS `cq_message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_message_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sender_name` varchar(45) NOT NULL DEFAULT '',
  `target_id` int(10) unsigned DEFAULT 0,
  `target_name` varchar(45) DEFAULT 'ALLUSERS',
  `channel` smallint(5) unsigned NOT NULL DEFAULT 0,
  `message` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=774 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_mine_rate`
--

DROP TABLE IF EXISTS `cq_mine_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_mine_rate` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(4) unsigned NOT NULL DEFAULT 0,
  `req_lev` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `req_pro` tinyint(1) unsigned NOT NULL,
  `req_money` int(4) unsigned NOT NULL DEFAULT 0,
  `req_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `req_itemtype` int(4) unsigned NOT NULL DEFAULT 0,
  `req_itemname` varchar(32) DEFAULT NULL,
  `req_task_id` int(4) unsigned NOT NULL DEFAULT 0,
  `req_task_complete` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `chance_x` int(4) unsigned NOT NULL DEFAULT 1,
  `chance_y` int(4) unsigned NOT NULL DEFAULT 100,
  `itemtype_begin` int(4) unsigned NOT NULL DEFAULT 0,
  `itemtype_end` int(4) unsigned NOT NULL DEFAULT 0,
  `timeout` int(4) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_minectrl`
--

DROP TABLE IF EXISTS `cq_minectrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_minectrl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT 0,
  `item_id` int(10) unsigned NOT NULL DEFAULT 0,
  `percent` int(10) unsigned NOT NULL DEFAULT 0,
  `interval` smallint(5) unsigned NOT NULL DEFAULT 0,
  `amount_limit` smallint(5) unsigned NOT NULL DEFAULT 0,
  `req_lev` tinyint(1) unsigned DEFAULT NULL,
  `req_pro` tinyint(1) unsigned DEFAULT NULL,
  `req_money` int(4) unsigned DEFAULT NULL,
  `req_emoney` int(4) unsigned DEFAULT NULL,
  `req_itemtype` int(4) unsigned DEFAULT NULL,
  `req_itemname` varchar(32) DEFAULT NULL,
  `req_task_id` int(4) unsigned DEFAULT NULL,
  `req_task_complete` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=504 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monitor_keyword`
--

DROP TABLE IF EXISTS `cq_monitor_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monitor_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monster_cluster`
--

DROP TABLE IF EXISTS `cq_monster_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monster_cluster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monster0` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio0` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster1` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio1` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster2` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio2` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster3` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio3` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster4` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio4` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster5` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio5` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster6` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio6` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster7` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio7` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster8` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio8` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `monster9` int(10) unsigned NOT NULL DEFAULT 0,
  `ratio9` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monster_kill`
--

DROP TABLE IF EXISTS `cq_monster_kill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monster_kill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `monstertype` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `usrmst` (`user_id`,`monstertype`) USING BTREE,
  KEY `usrid` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monster_type_magic`
--

DROP TABLE IF EXISTS `cq_monster_type_magic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monster_type_magic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `monstertype` int(10) unsigned NOT NULL DEFAULT 0,
  `attack_interval` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `magic_type1` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type1` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param1` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time1` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time1` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type2` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type2` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param2` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time2` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time2` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type3` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type3` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param3` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time3` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time3` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type4` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type4` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param4` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time4` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time4` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type5` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type5` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param5` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time5` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time5` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type6` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type6` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param6` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time6` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time6` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type7` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type7` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param7` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time7` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time7` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type8` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type8` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param8` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time8` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time8` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type9` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type9` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param9` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time9` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time9` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type10` int(10) unsigned NOT NULL DEFAULT 0,
  `trigger_type10` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `trigger_param10` int(10) unsigned NOT NULL DEFAULT 0,
  `cold_time10` int(4) unsigned NOT NULL DEFAULT 0,
  `warning_time10` smallint(5) unsigned NOT NULL DEFAULT 0,
  `magic_type` int(10) unsigned zerofill DEFAULT NULL,
  `magic_lev` int(4) unsigned DEFAULT NULL,
  `cold_time` int(10) unsigned zerofill DEFAULT NULL,
  `warning_time` smallint(5) unsigned zerofill DEFAULT NULL,
  `status_magic_type` int(4) unsigned DEFAULT NULL,
  `status_magic_lev` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5726 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_monstertype`
--

DROP TABLE IF EXISTS `cq_monstertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_monstertype` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` char(35) NOT NULL DEFAULT 'None',
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `attack_max` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_min` int(4) unsigned NOT NULL DEFAULT 0,
  `defence` int(4) unsigned NOT NULL DEFAULT 0,
  `dexterity` int(4) unsigned NOT NULL DEFAULT 0,
  `dodge` int(4) unsigned NOT NULL DEFAULT 0,
  `helmet_type` int(4) unsigned NOT NULL DEFAULT 0,
  `armor_type` int(4) unsigned NOT NULL DEFAULT 0,
  `weaponr_type` int(4) unsigned NOT NULL DEFAULT 0,
  `weaponl_type` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_range` int(4) unsigned NOT NULL DEFAULT 0,
  `view_range` int(4) unsigned NOT NULL DEFAULT 0,
  `escape_life` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_speed` int(4) unsigned NOT NULL DEFAULT 0,
  `move_speed` int(4) unsigned NOT NULL DEFAULT 0,
  `level` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_user` int(1) unsigned NOT NULL DEFAULT 3,
  `drop_money` int(4) unsigned NOT NULL DEFAULT 0,
  `drop_itemtype` int(4) unsigned NOT NULL DEFAULT 0,
  `size_add` int(4) unsigned NOT NULL DEFAULT 0,
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `run_speed` int(4) unsigned NOT NULL DEFAULT 0,
  `drop_armet` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_necklace` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_armor` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_ring` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_weapon` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_shield` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_shoes` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `drop_hp` int(4) unsigned NOT NULL DEFAULT 0,
  `drop_mp` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_type` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_def` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_hitrate` int(4) unsigned NOT NULL DEFAULT 100,
  `ai_type` int(4) unsigned NOT NULL DEFAULT 0,
  `defence2` int(4) unsigned NOT NULL DEFAULT 10000,
  `stc_type` smallint(2) unsigned NOT NULL DEFAULT 0,
  `anti_monster` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `extra_battlelev` smallint(2) unsigned NOT NULL DEFAULT 0,
  `extra_exp` smallint(2) NOT NULL DEFAULT 0,
  `extra_damage` smallint(2) NOT NULL DEFAULT 0,
  `species_type` tinyint(3) unsigned DEFAULT 0,
  `attr_metal` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attr_wood` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attr_water` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attr_fire` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `attr_earth` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `vs_callpet` int(4) unsigned NOT NULL DEFAULT 0,
  `transform_flag` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `transform_condition` int(10) unsigned NOT NULL DEFAULT 0,
  `transform_monster` int(10) unsigned NOT NULL DEFAULT 0,
  `attack_new` int(10) unsigned NOT NULL DEFAULT 0,
  `defence_new` int(10) unsigned NOT NULL DEFAULT 0,
  `stable_defence` smallint(2) unsigned NOT NULL DEFAULT 0,
  `critical_rate` smallint(2) unsigned NOT NULL DEFAULT 0,
  `magic_critical_rate` smallint(2) unsigned NOT NULL DEFAULT 0,
  `anti_critical_rate` smallint(2) unsigned NOT NULL DEFAULT 0,
  `final_dmg_add` smallint(2) unsigned NOT NULL DEFAULT 0,
  `final_dmg_add_mgc` smallint(2) unsigned NOT NULL DEFAULT 0,
  `final_dmg_reduce` smallint(2) unsigned NOT NULL DEFAULT 0,
  `final_dmg_reduce_mgc` smallint(2) unsigned NOT NULL DEFAULT 0,
  `item_drop_rule1` int(10) unsigned NOT NULL DEFAULT 0,
  `item_drop_rule2` int(10) unsigned NOT NULL DEFAULT 0,
  `item_drop_rule3` int(10) unsigned NOT NULL DEFAULT 0,
  `item_drop_rule4` int(10) unsigned NOT NULL DEFAULT 0,
  `extra_magic_injury` int(10) unsigned DEFAULT NULL,
  `attribute` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_ndsdk_account`
--

DROP TABLE IF EXISTS `cq_ndsdk_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_ndsdk_account` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `platform` int(4) unsigned DEFAULT 0,
  `app` varchar(128) NOT NULL DEFAULT '',
  `account` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `platform_app_account` (`platform`,`app`,`account`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_newaction`
--

DROP TABLE IF EXISTS `cq_newaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_newaction` (
  `id` int(4) unsigned NOT NULL DEFAULT 90000000,
  `id_next` int(4) unsigned NOT NULL DEFAULT 0,
  `id_nextfail` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) NOT NULL DEFAULT 0,
  `param` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_newbie_info`
--

DROP TABLE IF EXISTS `cq_newbie_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_newbie_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profession` int(10) unsigned NOT NULL DEFAULT 0,
  `lweapon` int(10) unsigned NOT NULL DEFAULT 0,
  `rweapon` int(10) unsigned NOT NULL DEFAULT 0,
  `head` int(10) unsigned NOT NULL DEFAULT 0,
  `boot` int(10) unsigned NOT NULL DEFAULT 0,
  `neck` int(10) unsigned NOT NULL DEFAULT 0,
  `ring` int(10) unsigned NOT NULL DEFAULT 0,
  `armor` int(10) unsigned NOT NULL DEFAULT 0,
  `item0` int(10) unsigned NOT NULL DEFAULT 0,
  `number0` int(10) unsigned NOT NULL DEFAULT 0,
  `item1` int(10) unsigned NOT NULL DEFAULT 0,
  `number1` int(10) unsigned NOT NULL DEFAULT 0,
  `item2` int(10) unsigned NOT NULL DEFAULT 0,
  `number2` int(10) unsigned NOT NULL DEFAULT 0,
  `item3` int(10) unsigned NOT NULL DEFAULT 0,
  `number3` int(10) unsigned NOT NULL DEFAULT 0,
  `item4` int(10) unsigned NOT NULL DEFAULT 0,
  `number4` int(10) unsigned NOT NULL DEFAULT 0,
  `item5` int(10) unsigned NOT NULL DEFAULT 0,
  `number5` int(10) unsigned NOT NULL DEFAULT 0,
  `item6` int(10) unsigned NOT NULL DEFAULT 0,
  `number6` int(10) unsigned NOT NULL DEFAULT 0,
  `item7` int(10) unsigned NOT NULL DEFAULT 0,
  `number7` int(10) unsigned NOT NULL DEFAULT 0,
  `item8` int(10) unsigned NOT NULL DEFAULT 0,
  `number8` int(10) unsigned NOT NULL DEFAULT 0,
  `item9` int(10) unsigned NOT NULL DEFAULT 0,
  `number9` int(10) unsigned NOT NULL DEFAULT 0,
  `magic0` int(10) unsigned NOT NULL DEFAULT 0,
  `magic1` int(10) unsigned NOT NULL DEFAULT 0,
  `magic2` int(10) unsigned NOT NULL DEFAULT 0,
  `magic3` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_profession` (`profession`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_newbie_rand_reborn`
--

DROP TABLE IF EXISTS `cq_newbie_rand_reborn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_newbie_rand_reborn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pos_x` int(10) unsigned NOT NULL DEFAULT 0,
  `pos_y` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_npc`
--

DROP TABLE IF EXISTS `cq_npc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_npc` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `ownerid` int(4) unsigned DEFAULT 0,
  `playerid` int(4) unsigned DEFAULT 0,
  `name` varchar(35) DEFAULT 'undefined',
  `type` int(4) unsigned DEFAULT 0,
  `lookface` int(4) unsigned DEFAULT 0,
  `idxserver` int(4) DEFAULT -1,
  `mapid` int(4) unsigned DEFAULT 0,
  `cellx` int(4) unsigned DEFAULT 0,
  `celly` int(4) unsigned DEFAULT 0,
  `task0` int(4) unsigned DEFAULT 0,
  `task1` int(4) unsigned DEFAULT 0,
  `task2` int(4) unsigned DEFAULT 0,
  `task3` int(4) unsigned DEFAULT 0,
  `task4` int(4) unsigned DEFAULT 0,
  `task5` int(4) unsigned DEFAULT 0,
  `task6` int(4) unsigned DEFAULT 0,
  `task7` int(4) unsigned DEFAULT 0,
  `data0` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `datastr` char(15) DEFAULT 'None',
  `linkid` int(4) unsigned NOT NULL DEFAULT 0,
  `life` smallint(2) unsigned NOT NULL DEFAULT 0,
  `maxlife` smallint(2) unsigned NOT NULL DEFAULT 0,
  `base` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` smallint(2) unsigned NOT NULL DEFAULT 0,
  `itemid` int(4) unsigned DEFAULT NULL,
  `serverid` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_mapid` (`mapid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_npc_income`
--

DROP TABLE IF EXISTS `cq_npc_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_npc_income` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `npc_id` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(3) unsigned NOT NULL DEFAULT 0,
  `owner_type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `income_money` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_official_position`
--

DROP TABLE IF EXISTS `cq_official_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_official_position` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `league_id` int(4) unsigned NOT NULL DEFAULT 0,
  `official_type` smallint(4) unsigned NOT NULL DEFAULT 0,
  `salary_time` int(10) unsigned NOT NULL DEFAULT 0,
  `official_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_official_type`
--

DROP TABLE IF EXISTS `cq_official_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_official_type` (
  `id` smallint(4) unsigned NOT NULL,
  `setup_num` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `speaker_num` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `official_name` char(32) NOT NULL,
  `official_name_ex` char(32) NOT NULL,
  `fee` int(10) unsigned NOT NULL DEFAULT 0,
  `award_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_online_payments`
--

DROP TABLE IF EXISTS `cq_online_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_online_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `playerid` int(10) unsigned NOT NULL DEFAULT 0,
  `accountid` int(10) unsigned NOT NULL DEFAULT 0,
  `serverid` int(10) unsigned NOT NULL DEFAULT 0,
  `transactionid` varchar(33) NOT NULL DEFAULT '0',
  `paymentsinfo` varchar(1024) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_operating_act`
--

DROP TABLE IF EXISTS `cq_operating_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_operating_act` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `min_demand` smallint(4) unsigned NOT NULL DEFAULT 0,
  `max_demand` smallint(4) unsigned NOT NULL DEFAULT 0,
  `start_time` int(4) unsigned NOT NULL DEFAULT 0,
  `end_time` int(4) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `drop_time` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_operating_mail_record`
--

DROP TABLE IF EXISTS `cq_operating_mail_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_operating_mail_record` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `player_id` int(4) NOT NULL DEFAULT 0,
  `operating_mail_type` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_operating_mail_type`
--

DROP TABLE IF EXISTS `cq_operating_mail_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_operating_mail_type` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `start_time` int(4) unsigned NOT NULL DEFAULT 0,
  `end_time` int(4) unsigned NOT NULL DEFAULT 0,
  `vip_flag` int(4) unsigned NOT NULL DEFAULT 0,
  `min_demand` smallint(4) unsigned NOT NULL DEFAULT 0,
  `max_demand` smallint(4) unsigned NOT NULL DEFAULT 0,
  `first_pay` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `sender_name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(32) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `expiration_date` int(4) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  `item_mono` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_start_end` (`start_time`,`end_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_operating_prize`
--

DROP TABLE IF EXISTS `cq_operating_prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_operating_prize` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(4) unsigned NOT NULL DEFAULT 0,
  `reward_grade` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `progress_value` int(4) unsigned NOT NULL DEFAULT 0,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  `monopoly` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1091 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_operating_user_info`
--

DROP TABLE IF EXISTS `cq_operating_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_operating_user_info` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `activity_id` int(4) unsigned NOT NULL DEFAULT 0,
  `activity_type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `progress_value` int(4) unsigned NOT NULL DEFAULT 0,
  `reward_grade` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `delete_flag` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_player_activity` (`player_id`,`activity_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_order_award`
--

DROP TABLE IF EXISTS `cq_order_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_order_award` (
  `contribution_lev` smallint(10) unsigned NOT NULL DEFAULT 0,
  `order_gift_itemtype` int(10) unsigned DEFAULT 0,
  `order_gift_action` int(10) unsigned DEFAULT 0,
  `order_salary_itemtype` int(10) unsigned DEFAULT 0,
  `order_salary_action` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`contribution_lev`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_passway`
--

DROP TABLE IF EXISTS `cq_passway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_passway` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `passway_idx` int(4) unsigned NOT NULL DEFAULT 0,
  `passway_mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `passway_mapportal` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=172322 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_peerage`
--

DROP TABLE IF EXISTS `cq_peerage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_peerage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(16) NOT NULL DEFAULT 'None',
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `first_donation` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_idx` (`user_id`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='This table stores information about the nobility ranking.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pet`
--

DROP TABLE IF EXISTS `cq_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pet` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `ownertype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `generatorid` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT 'None',
  `typeid` int(4) unsigned NOT NULL DEFAULT 0,
  `life` smallint(2) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_recordmap_id` (`recordmap_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_petpoint`
--

DROP TABLE IF EXISTS `cq_petpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_petpoint` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `rank` smallint(4) unsigned NOT NULL DEFAULT 0,
  `ridepet_point` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_mapid` (`mapid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=801 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_bonus`
--

DROP TABLE IF EXISTS `cq_pk_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_bonus` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `Target` int(4) unsigned NOT NULL DEFAULT 0,
  `Target_name` varchar(15) DEFAULT NULL,
  `Hunter` int(4) unsigned NOT NULL DEFAULT 0,
  `Hunter_name` varchar(15) DEFAULT NULL,
  `B_type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `Bonus` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_target` (`Target`) USING BTREE,
  KEY `index_hunter` (`Hunter`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_info`
--

DROP TABLE IF EXISTS `cq_pk_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `subtype` smallint(5) unsigned NOT NULL DEFAULT 0,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  `pk1` int(4) unsigned NOT NULL DEFAULT 0,
  `pk1_name` varchar(31) NOT NULL DEFAULT '',
  `pk2` int(4) unsigned NOT NULL DEFAULT 0,
  `pk2_name` varchar(31) NOT NULL DEFAULT '',
  `pk3` int(4) unsigned NOT NULL DEFAULT 0,
  `pk3_name` varchar(31) NOT NULL DEFAULT '',
  `pk4` int(4) unsigned NOT NULL DEFAULT 0,
  `pk4_name` varchar(31) NOT NULL DEFAULT '',
  `pk5` int(4) unsigned NOT NULL DEFAULT 0,
  `pk5_name` varchar(31) NOT NULL DEFAULT '',
  `pk6` int(4) unsigned NOT NULL DEFAULT 0,
  `pk6_name` varchar(31) NOT NULL DEFAULT '',
  `pk7` int(4) unsigned NOT NULL DEFAULT 0,
  `pk7_name` varchar(31) NOT NULL DEFAULT '',
  `pk8` int(4) unsigned NOT NULL DEFAULT 0,
  `pk8_name` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_type_subtype` (`type`,`subtype`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_item`
--

DROP TABLE IF EXISTS `cq_pk_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_item` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `item` int(4) unsigned NOT NULL DEFAULT 0,
  `target` int(4) NOT NULL DEFAULT 0,
  `target_name` varchar(15) NOT NULL DEFAULT '',
  `hunter` int(4) NOT NULL DEFAULT 0,
  `hunter_name` varchar(15) NOT NULL DEFAULT '',
  `manhunt_time` int(4) NOT NULL DEFAULT 0,
  `bonus` smallint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hunter_item` (`hunter`,`item`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_item_timeout`
--

DROP TABLE IF EXISTS `cq_pk_item_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_item_timeout` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `item` int(4) unsigned NOT NULL DEFAULT 0,
  `target` int(4) NOT NULL DEFAULT 0,
  `target_name` varchar(15) NOT NULL DEFAULT '',
  `hunter` int(4) NOT NULL DEFAULT 0,
  `hunter_name` varchar(15) NOT NULL DEFAULT '',
  `manhunt_time` int(4) NOT NULL DEFAULT 0,
  `bonus` smallint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_hunter_item` (`hunter`,`item`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_mapgroup`
--

DROP TABLE IF EXISTS `cq_pk_mapgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_mapgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `map_id1` int(10) unsigned DEFAULT 0,
  `map_id2` int(10) unsigned DEFAULT 0,
  `map_id3` int(10) unsigned DEFAULT 0,
  `map_id4` int(10) unsigned DEFAULT 0,
  `map_id5` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pk_statistic`
--

DROP TABLE IF EXISTS `cq_pk_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pk_statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `killer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pk_time` int(10) unsigned NOT NULL DEFAULT 0,
  `map_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_battle_effect` smallint(5) unsigned NOT NULL DEFAULT 0,
  `kill_times` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_killer_id` (`killer_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_player_process_goal`
--

DROP TABLE IF EXISTS `cq_player_process_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_player_process_goal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `goal_id` int(10) unsigned NOT NULL DEFAULT 0,
  `task_complete_state` int(10) unsigned NOT NULL DEFAULT 0,
  `task_award_state` int(10) unsigned NOT NULL DEFAULT 0,
  `process_award` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_goal_id` (`user_id`,`goal_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_player_process_task`
--

DROP TABLE IF EXISTS `cq_player_process_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_player_process_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `task_id` int(10) unsigned NOT NULL DEFAULT 0,
  `schedule` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id_task_id` (`user_id`,`task_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_plunder_war`
--

DROP TABLE IF EXISTS `cq_plunder_war`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_plunder_war` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apply_date` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `apply_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_1` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_2` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_3` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_4` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_5` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_6` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_7` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_8` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_9` int(10) unsigned NOT NULL DEFAULT 0,
  `target_id_10` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_point_allot`
--

DROP TABLE IF EXISTS `cq_point_allot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_point_allot` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `profession` int(4) unsigned NOT NULL DEFAULT 0,
  `level` int(4) unsigned NOT NULL DEFAULT 0,
  `force` int(4) unsigned NOT NULL DEFAULT 0,
  `Speed` int(4) unsigned NOT NULL DEFAULT 0,
  `health` int(4) unsigned NOT NULL DEFAULT 0,
  `soul` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx` (`profession`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pointrecord`
--

DROP TABLE IF EXISTS `cq_pointrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pointrecord` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(4) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_userid` (`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_pool_record_cfg`
--

DROP TABLE IF EXISTS `cq_pool_record_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_pool_record_cfg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) DEFAULT NULL,
  `precreate_num` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table_name` (`table_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_portal`
--

DROP TABLE IF EXISTS `cq_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_portal` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `portal_idx` int(4) unsigned NOT NULL DEFAULT 0,
  `portal_x` int(4) unsigned NOT NULL DEFAULT 0,
  `portal_y` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1056 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_process_goal`
--

DROP TABLE IF EXISTS `cq_process_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_process_goal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_num` smallint(6) unsigned DEFAULT 0,
  `open_lv` int(10) unsigned DEFAULT 0,
  `itemtype1` int(10) unsigned DEFAULT 0,
  `number1` smallint(6) unsigned DEFAULT 0,
  `monoply1` tinyint(4) unsigned DEFAULT 0,
  `itemtype2` int(10) unsigned DEFAULT 0,
  `number2` smallint(6) unsigned DEFAULT 0,
  `monoply2` tinyint(4) unsigned DEFAULT 0,
  `itemtype3` int(10) unsigned DEFAULT 0,
  `number3` smallint(6) unsigned DEFAULT 0,
  `monoply3` tinyint(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_process_task`
--

DROP TABLE IF EXISTS `cq_process_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_process_task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(6) unsigned DEFAULT 0,
  `sort` tinyint(4) unsigned DEFAULT 0,
  `condition` int(10) unsigned DEFAULT 0,
  `schedule` int(10) unsigned DEFAULT 0,
  `itemtype` int(10) unsigned DEFAULT 0,
  `number` smallint(6) unsigned DEFAULT 0,
  `monoply` tinyint(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_promotion_activity`
--

DROP TABLE IF EXISTS `cq_promotion_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_promotion_activity` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `start_time` int(4) unsigned NOT NULL DEFAULT 0,
  `end_time` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_promotion_goods`
--

DROP TABLE IF EXISTS `cq_promotion_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_promotion_goods` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(4) unsigned NOT NULL DEFAULT 0,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  `old_emoney_price` smallint(4) unsigned NOT NULL DEFAULT 0,
  `new_emoney_price` smallint(4) unsigned NOT NULL DEFAULT 0,
  `demand_number` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_promotion_info`
--

DROP TABLE IF EXISTS `cq_promotion_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_promotion_info` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int(4) unsigned NOT NULL DEFAULT 0,
  `goods_id` int(4) unsigned NOT NULL DEFAULT 0,
  `actor_num` smallint(4) unsigned NOT NULL DEFAULT 0,
  `status` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_props`
--

DROP TABLE IF EXISTS `cq_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_props` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `targettype` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `validrange` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `use_range` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `status_id` int(4) unsigned NOT NULL DEFAULT 0,
  `data0` int(4) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) unsigned NOT NULL DEFAULT 0,
  `data2` int(4) unsigned NOT NULL DEFAULT 0,
  `action` int(4) unsigned NOT NULL DEFAULT 0,
  `maxtimes` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_protect_path`
--

DROP TABLE IF EXISTS `cq_protect_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_protect_path` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `next_path` int(10) unsigned NOT NULL DEFAULT 0,
  `destination_x` smallint(6) NOT NULL DEFAULT 0,
  `destination_y` int(11) NOT NULL DEFAULT 0,
  `action` int(11) NOT NULL DEFAULT 0,
  `param` varchar(128) DEFAULT NULL,
  `wait_time` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_quiz`
--

DROP TABLE IF EXISTS `cq_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_quiz` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT NULL,
  `level` tinyint(4) unsigned DEFAULT NULL,
  `term` tinyint(4) unsigned DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer1` varchar(100) DEFAULT NULL,
  `answer2` varchar(100) DEFAULT NULL,
  `answer3` varchar(100) DEFAULT NULL,
  `answer4` varchar(100) DEFAULT NULL,
  `result` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2291 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_rebirth`
--

DROP TABLE IF EXISTS `cq_rebirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_rebirth` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `need_prof` int(4) unsigned NOT NULL DEFAULT 0,
  `new_prof` int(4) unsigned NOT NULL DEFAULT 0,
  `need_level` int(4) unsigned NOT NULL DEFAULT 0,
  `new_level` int(4) unsigned NOT NULL DEFAULT 0,
  `metepsychosis` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_redeem_exp`
--

DROP TABLE IF EXISTS `cq_redeem_exp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_redeem_exp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `killer_id` int(10) unsigned NOT NULL DEFAULT 0,
  `killer_name` varchar(45) NOT NULL DEFAULT ' ',
  `kill_date` int(10) unsigned NOT NULL DEFAULT 0,
  `kill_times` int(10) unsigned NOT NULL DEFAULT 0,
  `lose_exp` bigint(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_region`
--

DROP TABLE IF EXISTS `cq_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_region` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_x` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_y` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cx` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cy` int(4) unsigned NOT NULL DEFAULT 0,
  `datastr` varchar(15) NOT NULL DEFAULT '',
  `data0` int(4) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) unsigned NOT NULL DEFAULT 0,
  `data2` int(4) unsigned NOT NULL DEFAULT 0,
  `data3` int(4) unsigned NOT NULL DEFAULT 0,
  `actionid` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=414 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_roulette_chip_info`
--

DROP TABLE IF EXISTS `cq_roulette_chip_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_roulette_chip_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wager_type` tinyint(3) unsigned DEFAULT 0,
  `chip1` int(10) unsigned DEFAULT 0,
  `chip2` int(10) unsigned DEFAULT 0,
  `chip3` int(10) unsigned DEFAULT 0,
  `chip4` int(10) unsigned DEFAULT 0,
  `chip5` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_rule`
--

DROP TABLE IF EXISTS `cq_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_rule` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `mode` varchar(15) NOT NULL DEFAULT '',
  `condition` varchar(255) NOT NULL DEFAULT '',
  `result` varchar(255) NOT NULL DEFAULT '',
  `possible` tinyint(3) unsigned NOT NULL DEFAULT 50,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_scenarior_screen`
--

DROP TABLE IF EXISTS `cq_scenarior_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_scenarior_screen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scenario_id` int(10) unsigned NOT NULL DEFAULT 0,
  `word` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_serverinfo`
--

DROP TABLE IF EXISTS `cq_serverinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_serverinfo` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `server_name` varchar(31) NOT NULL DEFAULT '',
  `db_name` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_setmeed`
--

DROP TABLE IF EXISTS `cq_setmeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_setmeed` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `synid` int(4) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned DEFAULT 0,
  `emoney` int(4) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_skilled_level_despise`
--

DROP TABLE IF EXISTS `cq_skilled_level_despise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_skilled_level_despise` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `skilled_level_diff` int(4) NOT NULL DEFAULT 0,
  `percentage` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_slot_winning_rule`
--

DROP TABLE IF EXISTS `cq_slot_winning_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_slot_winning_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT 0,
  `pattern` smallint(5) unsigned DEFAULT 0,
  `weight` int(10) unsigned DEFAULT 0,
  `multiple` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=687 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_sponsor`
--

DROP TABLE IF EXISTS `cq_sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_sponsor` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `param` varchar(255) DEFAULT NULL,
  `sponsor` varchar(255) DEFAULT NULL,
  `showtime_begin` int(10) unsigned NOT NULL DEFAULT 0,
  `showtime_over` int(10) unsigned NOT NULL DEFAULT 0,
  `mod` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statistic`
--

DROP TABLE IF EXISTS `cq_statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statistic` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `event_type` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `data_type` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `data` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `timestamp` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68059 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statistic_daily`
--

DROP TABLE IF EXISTS `cq_statistic_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statistic_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(10) unsigned DEFAULT 0,
  `type` int(10) unsigned DEFAULT 0,
  `subtype` int(10) unsigned DEFAULT 0,
  `data` int(10) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statistic_timeout`
--

DROP TABLE IF EXISTS `cq_statistic_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statistic_timeout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `event_type` int(4) unsigned NOT NULL DEFAULT 0,
  `data_type` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  `timestamp` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_status`
--

DROP TABLE IF EXISTS `cq_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_status` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) NOT NULL DEFAULT 0,
  `status` int(4) unsigned NOT NULL DEFAULT 0,
  `power` int(4) NOT NULL DEFAULT 0,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `leave_times` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `remain_time` int(4) unsigned NOT NULL DEFAULT 0,
  `end_time` int(4) unsigned NOT NULL DEFAULT 0,
  `interval_time` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_status_immune`
--

DROP TABLE IF EXISTS `cq_status_immune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_status_immune` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(10) unsigned NOT NULL DEFAULT 0,
  `status_immune` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_status_timeout`
--

DROP TABLE IF EXISTS `cq_status_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_status_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` int(4) NOT NULL DEFAULT 0,
  `status` int(4) unsigned NOT NULL DEFAULT 0,
  `power` int(4) NOT NULL DEFAULT 0,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `leave_times` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `remain_time` int(4) unsigned NOT NULL DEFAULT 0,
  `end_time` int(4) unsigned NOT NULL DEFAULT 0,
  `interval_time` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_statustype`
--

DROP TABLE IF EXISTS `cq_statustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_statustype` (
  `id` int(4) NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT '',
  `type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `priorty` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_student_type`
--

DROP TABLE IF EXISTS `cq_student_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_student_type` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `Student_lev` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `User_lev_min` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `User_lev_max` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Uplevtime` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `God_time` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Addlevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_super_flag`
--

DROP TABLE IF EXISTS `cq_super_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_super_flag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT 0,
  `posindex` int(10) unsigned NOT NULL DEFAULT 0,
  `map_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pos_x` int(10) unsigned NOT NULL DEFAULT 0,
  `pos_y` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(31) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_item_id` (`item_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_superman`
--

DROP TABLE IF EXISTS `cq_superman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_superman` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `number` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_advertising_info`
--

DROP TABLE IF EXISTS `cq_syn_advertising_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_advertising_info` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `idsyn` int(4) unsigned NOT NULL DEFAULT 0,
  `content` varchar(255) DEFAULT NULL,
  `expense` int(4) unsigned NOT NULL DEFAULT 0,
  `end_date` int(10) unsigned NOT NULL DEFAULT 0,
  `auto_recruit` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `condition_level` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `condition_metem` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `condition_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `condition_sex` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `condition_battle` smallint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_ally`
--

DROP TABLE IF EXISTS `cq_syn_ally`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_ally` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `synname` varchar(16) NOT NULL DEFAULT '',
  `allyid` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `allyname` varchar(16) NOT NULL DEFAULT '',
  `stabilish_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_enemy`
--

DROP TABLE IF EXISTS `cq_syn_enemy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_enemy` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `synname` varchar(16) NOT NULL DEFAULT '',
  `enemyid` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `enemyname` varchar(16) NOT NULL DEFAULT '',
  `stabilish_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_his`
--

DROP TABLE IF EXISTS `cq_syn_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_his` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `syn_id` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_emoney_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_edu_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_pk_his` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syn_history`
--

DROP TABLE IF EXISTS `cq_syn_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syn_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `syn_id` int(10) unsigned NOT NULL,
  `join_date` datetime NOT NULL,
  `leave_date` datetime NOT NULL,
  `silver` bigint(20) NOT NULL,
  `emoney` int(10) unsigned NOT NULL,
  `pk` int(10) unsigned NOT NULL,
  `guide` int(10) unsigned NOT NULL,
  `rank` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `USERIDX` (`user_id`) USING BTREE,
  KEY `SYNIDX` (`syn_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synattr`
--

DROP TABLE IF EXISTS `cq_synattr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synattr` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `syn_id` int(4) unsigned NOT NULL DEFAULT 0,
  `rank` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_edu` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_pk` int(4) NOT NULL DEFAULT 0,
  `proffer_totem` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_emoney_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_edu_his` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_pk_his` int(4) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  `duty_time_limit` int(10) unsigned NOT NULL DEFAULT 0,
  `assistant_id` int(10) unsigned NOT NULL DEFAULT 0,
  `master_id` int(10) unsigned NOT NULL DEFAULT 0,
  `proffer_merit` int(4) unsigned NOT NULL DEFAULT 0,
  `join_date` int(10) unsigned NOT NULL DEFAULT 0,
  `proffer_plant` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_cultivation` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_fish` int(4) unsigned NOT NULL DEFAULT 0,
  `proffer_build` int(4) unsigned NOT NULL DEFAULT 0,
  `profession` int(4) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `salary_flag` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_syn_id` (`syn_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syncompeterank`
--

DROP TABLE IF EXISTS `cq_syncompeterank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syncompeterank` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `synid` int(4) unsigned NOT NULL DEFAULT 0,
  `relation` smallint(4) unsigned NOT NULL DEFAULT 0,
  `point` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syndicate`
--

DROP TABLE IF EXISTS `cq_syndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syndicate` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL DEFAULT '',
  `announce` varchar(255) NOT NULL DEFAULT '',
  `leader_title` varchar(15) NOT NULL DEFAULT 'guildleader',
  `member_title` tinyint(1) NOT NULL DEFAULT 0,
  `leader_id` int(4) unsigned NOT NULL DEFAULT 0,
  `money` bigint(4) NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `fealty_syn` int(4) unsigned NOT NULL DEFAULT 0,
  `del_flag` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enemy0` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy1` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy2` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy3` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy4` int(4) unsigned NOT NULL DEFAULT 0,
  `enemy5` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy6` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy7` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy8` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy9` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy10` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy11` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy12` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy13` int(10) unsigned NOT NULL DEFAULT 0,
  `enemy14` int(10) unsigned NOT NULL DEFAULT 0,
  `ally0` int(4) unsigned NOT NULL DEFAULT 0,
  `ally1` int(4) unsigned NOT NULL DEFAULT 0,
  `ally2` int(4) unsigned NOT NULL DEFAULT 0,
  `ally3` int(4) unsigned NOT NULL DEFAULT 0,
  `ally4` int(4) unsigned NOT NULL DEFAULT 0,
  `ally5` int(10) unsigned NOT NULL DEFAULT 0,
  `ally6` int(10) unsigned NOT NULL DEFAULT 0,
  `ally7` int(10) unsigned NOT NULL DEFAULT 0,
  `ally8` int(10) unsigned NOT NULL DEFAULT 0,
  `ally9` int(10) unsigned NOT NULL DEFAULT 0,
  `ally10` int(10) unsigned NOT NULL DEFAULT 0,
  `ally11` int(10) unsigned NOT NULL DEFAULT 0,
  `ally12` int(10) unsigned NOT NULL DEFAULT 0,
  `ally13` int(10) unsigned NOT NULL DEFAULT 0,
  `ally14` int(10) unsigned NOT NULL DEFAULT 0,
  `condition_level` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `condition_metem` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `condition_prof` int(4) unsigned NOT NULL DEFAULT 0,
  `Publish_time` int(10) unsigned NOT NULL DEFAULT 0,
  `totem_pole` int(4) unsigned NOT NULL DEFAULT 0,
  `synrank` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `copper` int(4) unsigned NOT NULL DEFAULT 0,
  `iron` int(4) unsigned NOT NULL DEFAULT 0,
  `silver` int(4) unsigned NOT NULL DEFAULT 0,
  `gold` int(4) unsigned NOT NULL DEFAULT 0,
  `mulberry_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `oak_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `pear_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `league_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_syndomain`
--

DROP TABLE IF EXISTS `cq_syndomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_syndomain` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT 'undefined',
  `map_id` int(4) unsigned NOT NULL DEFAULT 0,
  `enter_x` int(4) NOT NULL DEFAULT 0,
  `enter_y` int(4) NOT NULL DEFAULT 0,
  `enter_cx` int(4) unsigned NOT NULL DEFAULT 0,
  `enter_cy` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synfacility`
--

DROP TABLE IF EXISTS `cq_synfacility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synfacility` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `syn_id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `pos_x` int(4) NOT NULL DEFAULT 0,
  `pos_y` int(4) NOT NULL DEFAULT 0,
  `dir` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `durable` int(4) unsigned NOT NULL DEFAULT 0,
  `data0` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synfacilitybuild`
--

DROP TABLE IF EXISTS `cq_synfacilitybuild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synfacilitybuild` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `copper` int(4) unsigned NOT NULL DEFAULT 0,
  `iron` int(4) unsigned NOT NULL DEFAULT 0,
  `silver` int(4) unsigned NOT NULL DEFAULT 0,
  `gold` int(4) unsigned NOT NULL DEFAULT 0,
  `mulberry_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `oak_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `pear_wood` int(4) unsigned NOT NULL DEFAULT 0,
  `facility_req0` int(4) unsigned NOT NULL DEFAULT 0,
  `facility_req1` int(4) unsigned NOT NULL DEFAULT 0,
  `facility_req2` int(4) unsigned NOT NULL DEFAULT 0,
  `amount` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `region_limit` int(4) unsigned NOT NULL DEFAULT 0,
  `customize` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synfacilitytype`
--

DROP TABLE IF EXISTS `cq_synfacilitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synfacilitytype` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `effect_sort` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `lev` int(4) unsigned NOT NULL DEFAULT 0,
  `effect0` int(4) NOT NULL DEFAULT 0,
  `effect1` int(4) NOT NULL DEFAULT 0,
  `effect2` int(4) NOT NULL DEFAULT 0,
  `task_id` int(4) unsigned NOT NULL DEFAULT 0,
  `durable_req` int(4) unsigned NOT NULL DEFAULT 0,
  `durable_limit` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_synfood`
--

DROP TABLE IF EXISTS `cq_synfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_synfood` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `syn_id` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `itemtype_id` int(4) unsigned NOT NULL DEFAULT 0,
  `amount` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_sys_leaveword`
--

DROP TABLE IF EXISTS `cq_sys_leaveword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_sys_leaveword` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `send_name` varchar(15) NOT NULL DEFAULT 'unknown',
  `time` int(10) unsigned NOT NULL DEFAULT 0,
  `words` varchar(255) NOT NULL DEFAULT 'undefined',
  `item_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `index_userid` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_sysbuyer`
--

DROP TABLE IF EXISTS `cq_sysbuyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_sysbuyer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_type` int(10) unsigned DEFAULT NULL,
  `buy_interval` int(10) unsigned DEFAULT NULL,
  `min_price` bigint(10) unsigned zerofill DEFAULT NULL,
  `max_price` bigint(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_sysnpc`
--

DROP TABLE IF EXISTS `cq_sysnpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_sysnpc` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `ownerid` int(4) unsigned NOT NULL DEFAULT 0,
  `playerid` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(35) NOT NULL DEFAULT 'undefined',
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `idxserver` int(4) unsigned NOT NULL DEFAULT 0,
  `mapid` int(4) unsigned NOT NULL DEFAULT 0,
  `cellx` int(4) unsigned NOT NULL DEFAULT 0,
  `celly` int(4) unsigned NOT NULL DEFAULT 0,
  `task0` int(4) unsigned NOT NULL DEFAULT 0,
  `task1` int(4) unsigned NOT NULL DEFAULT 0,
  `task2` int(4) unsigned NOT NULL DEFAULT 0,
  `task3` int(4) unsigned NOT NULL DEFAULT 0,
  `task4` int(4) unsigned NOT NULL DEFAULT 0,
  `task5` int(4) unsigned NOT NULL DEFAULT 0,
  `task6` int(4) unsigned NOT NULL DEFAULT 0,
  `task7` int(4) unsigned NOT NULL DEFAULT 0,
  `data0` int(4) NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `datastr` varchar(15) DEFAULT 'None',
  `linkid` int(4) unsigned NOT NULL DEFAULT 0,
  `life` smallint(2) unsigned NOT NULL DEFAULT 0,
  `maxlife` smallint(2) unsigned NOT NULL DEFAULT 0,
  `base` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` smallint(2) unsigned NOT NULL DEFAULT 0,
  `itemid` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_talkfromgm`
--

DROP TABLE IF EXISTS `cq_talkfromgm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_talkfromgm` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `content` varchar(512) NOT NULL DEFAULT '',
  `time` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6423 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_talktogm`
--

DROP TABLE IF EXISTS `cq_talktogm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_talktogm` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `vip` int(1) unsigned zerofill NOT NULL DEFAULT 0,
  `content` varchar(512) NOT NULL DEFAULT '',
  `time` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `status` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6340 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_task`
--

DROP TABLE IF EXISTS `cq_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_task` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `id_next` int(4) unsigned DEFAULT 0,
  `id_nextfail` int(4) unsigned DEFAULT 0,
  `itemname1` char(15) DEFAULT 'None',
  `itemname2` char(15) DEFAULT 'None',
  `money` int(4) unsigned DEFAULT 0,
  `profession` int(4) unsigned DEFAULT 0,
  `sex` int(4) unsigned DEFAULT 0,
  `min_pk` int(4) DEFAULT 0,
  `max_pk` int(4) DEFAULT 0,
  `team` int(4) unsigned DEFAULT 0,
  `metempsychosis` int(4) unsigned DEFAULT 0,
  `query` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `marriage` tinyint(4) NOT NULL DEFAULT -1,
  `client_active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `remote_transfer` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_task_reward_type`
--

DROP TABLE IF EXISTS `cq_task_reward_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_task_reward_type` (
  `id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `type` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `attribute` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `value_base` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `value_inc` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `value_limit` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_type1` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type2` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type3` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type4` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type5` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type6` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type7` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_type8` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reward_value1` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value2` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value3` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value4` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value5` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value6` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value7` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_value8` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  `reward_type1_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type2_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type3_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type4_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type5_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type6_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type7_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `reward_type8_rate` smallint(2) unsigned zerofill NOT NULL DEFAULT 00,
  `action_id` int(4) unsigned zerofill NOT NULL DEFAULT 0000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_texas_table`
--

DROP TABLE IF EXISTS `cq_texas_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_texas_table` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `table_type` int(4) unsigned NOT NULL DEFAULT 0,
  `chip_type` int(4) unsigned NOT NULL DEFAULT 0,
  `big_blind` int(4) unsigned NOT NULL DEFAULT 0,
  `min_card` tinyint(2) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `money_limit_blinds` (`chip_type`,`table_type`,`big_blind`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_token_type`
--

DROP TABLE IF EXISTS `cq_token_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_token_type` (
  `token_id` int(10) unsigned NOT NULL DEFAULT 0,
  `day_times` tinyint(4) DEFAULT 0,
  `use_time` int(10) unsigned DEFAULT 0,
  `cd` int(10) unsigned DEFAULT 0,
  `fee` int(10) unsigned DEFAULT 0,
  `user1` int(10) DEFAULT 0,
  `user2` int(10) DEFAULT 0,
  `user3` int(10) DEFAULT 0,
  `clean_cd` tinyint(4) unsigned DEFAULT 0,
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_totem_add`
--

DROP TABLE IF EXISTS `cq_totem_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_totem_add` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `totem_type` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `battle_add` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `time_limit` int(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trade`
--

DROP TABLE IF EXISTS `cq_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trade` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `target_id` int(4) unsigned NOT NULL DEFAULT 0,
  `user_money` int(4) unsigned NOT NULL DEFAULT 0,
  `target_money` int(4) unsigned NOT NULL DEFAULT 0,
  `user_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `target_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `map_id` int(4) unsigned NOT NULL DEFAULT 0,
  `user_x` smallint(2) unsigned NOT NULL DEFAULT 0,
  `user_y` smallint(2) unsigned NOT NULL DEFAULT 0,
  `target_x` smallint(2) unsigned NOT NULL DEFAULT 0,
  `target_y` smallint(2) unsigned NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL,
  `user_ip_addr` varchar(16) NOT NULL DEFAULT '0.0.0.0',
  `user_mac_addr` varchar(32) NOT NULL DEFAULT '000000000000',
  `target_ip_addr` varchar(16) NOT NULL,
  `target_mac_addr` varchar(32) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trade_item`
--

DROP TABLE IF EXISTS `cq_trade_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trade_item` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `trade_id` int(4) unsigned NOT NULL DEFAULT 0,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `item_id` int(4) unsigned NOT NULL DEFAULT 0,
  `itemtype` int(4) unsigned NOT NULL DEFAULT 0,
  `chksum` int(4) unsigned NOT NULL DEFAULT 0,
  `json_data` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_trap`
--

DROP TABLE IF EXISTS `cq_trap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_trap` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `look` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `map_id` int(4) unsigned NOT NULL DEFAULT 0,
  `pos_x` int(4) unsigned NOT NULL DEFAULT 0,
  `pos_y` int(4) unsigned NOT NULL DEFAULT 0,
  `data` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cx` int(4) unsigned NOT NULL DEFAULT 0,
  `bound_cy` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_map_id` (`map_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_traptype`
--

DROP TABLE IF EXISTS `cq_traptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_traptype` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `look` int(4) unsigned NOT NULL DEFAULT 0,
  `action_id` int(4) unsigned NOT NULL DEFAULT 0,
  `level` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_max` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_min` int(4) unsigned NOT NULL DEFAULT 0,
  `dexterity` int(4) unsigned NOT NULL DEFAULT 0,
  `attack_speed` int(4) unsigned NOT NULL DEFAULT 1000,
  `active_times` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_type` int(4) unsigned NOT NULL DEFAULT 0,
  `magic_hitrate` int(4) unsigned NOT NULL DEFAULT 100,
  `size` int(4) unsigned NOT NULL DEFAULT 0,
  `atk_mode` int(3) unsigned NOT NULL DEFAULT 1,
  `life_max` int(4) unsigned NOT NULL DEFAULT 0,
  `name` varchar(15) NOT NULL DEFAULT 'trap',
  `magic_lev` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor`
--

DROP TABLE IF EXISTS `cq_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT 0,
  `Student_id` int(4) unsigned DEFAULT 0,
  `Betrayal_flag` int(4) unsigned DEFAULT 0,
  `Date` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE,
  KEY `index_tutor` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_access`
--

DROP TABLE IF EXISTS `cq_tutor_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT 0,
  `Exp` bigint(4) unsigned DEFAULT 0,
  `God_time` smallint(2) unsigned DEFAULT 0,
  `Addlevel` smallint(2) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_tutor_id` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_access_timeout`
--

DROP TABLE IF EXISTS `cq_tutor_access_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_access_timeout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT 0,
  `Exp` bigint(4) unsigned DEFAULT 0,
  `God_time` smallint(2) unsigned DEFAULT 0,
  `Addlevel` smallint(2) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_tutor` (`tutor_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_battle_limit_type`
--

DROP TABLE IF EXISTS `cq_tutor_battle_limit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_battle_limit_type` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `Battle_lev_limit` smallint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_contributions`
--

DROP TABLE IF EXISTS `cq_tutor_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_contributions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT 0,
  `Student_id` int(4) unsigned DEFAULT 0,
  `God_time` smallint(2) unsigned DEFAULT 0,
  `Exp` bigint(4) unsigned DEFAULT 0,
  `Addlevel` smallint(2) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_contributions2`
--

DROP TABLE IF EXISTS `cq_tutor_contributions2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_contributions2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tutor_id` int(4) unsigned DEFAULT 0,
  `Student_id` int(4) unsigned DEFAULT 0,
  `God_time` smallint(2) unsigned DEFAULT 0,
  `Exp` bigint(4) unsigned DEFAULT 0,
  `Addlevel` smallint(2) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `u_student_id` (`Student_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_tutor_type`
--

DROP TABLE IF EXISTS `cq_tutor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_tutor_type` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `User_lev_min` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `User_lev_max` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Student_num` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Battle_lev_share` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_unlawful`
--

DROP TABLE IF EXISTS `cq_unlawful`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_unlawful` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `word` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_unlawful_name`
--

DROP TABLE IF EXISTS `cq_unlawful_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_unlawful_name` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `word` varchar(48) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user`
--

DROP TABLE IF EXISTS `cq_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `lastname` varchar(15) NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `hair` smallint(2) unsigned NOT NULL DEFAULT 0,
  `money` bigint(4) unsigned NOT NULL DEFAULT 0,
  `money_saved` bigint(4) unsigned NOT NULL DEFAULT 0,
  `coin_money` int(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `Speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT 0,
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `deed` int(4) NOT NULL DEFAULT 0,
  `pk` smallint(2) NOT NULL DEFAULT 0,
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `medal` int(4) unsigned NOT NULL DEFAULT 0,
  `medal_select` int(4) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT 0,
  `first_login` int(8) unsigned NOT NULL DEFAULT 0,
  `account` varchar(15) NOT NULL DEFAULT 'None',
  `password` varchar(15) NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned NOT NULL DEFAULT 0,
  `time_of_life` int(4) unsigned NOT NULL DEFAULT 0,
  `virtue` int(4) unsigned NOT NULL DEFAULT 0,
  `home_id` int(4) unsigned NOT NULL DEFAULT 0,
  `lock_key` int(10) unsigned NOT NULL DEFAULT 0,
  `lock_cls` int(10) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `god_status` int(4) unsigned NOT NULL DEFAULT 0,
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT 0,
  `online_time` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `mete_lev` int(4) NOT NULL DEFAULT 0,
  `current_layout_type` tinyint(1) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `last_logout2` int(4) unsigned NOT NULL DEFAULT 0,
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_r` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  `quiz_point` int(4) unsigned DEFAULT 0,
  `vip_value` int(4) unsigned NOT NULL DEFAULT 0,
  `flag` int(4) unsigned NOT NULL DEFAULT 0,
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_day` int(4) unsigned NOT NULL DEFAULT 0,
  `title` int(4) unsigned NOT NULL DEFAULT 0,
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `athlete_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_mono` int(4) unsigned NOT NULL DEFAULT 0,
  `ridepet_point` int(4) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT 0,
  `pkprotocol` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `uin` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT 0,
  `strength_value` int(10) unsigned NOT NULL DEFAULT 0,
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nationality` smallint(2) unsigned NOT NULL DEFAULT 0,
  `pk_setting` int(4) unsigned NOT NULL DEFAULT 0,
  `culture_value` int(10) unsigned NOT NULL DEFAULT 0,
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT 0,
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT 0,
  `chestpackage_size` int(4) unsigned NOT NULL DEFAULT 0,
  `league_contribution` int(10) unsigned NOT NULL DEFAULT 0,
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT 0,
  `channel_account` varchar(74) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10002033 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_backup`
--

DROP TABLE IF EXISTS `cq_user_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_backup` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `account_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `mateid` int(10) unsigned DEFAULT 0,
  `lookface` int(10) unsigned DEFAULT 0,
  `hair` smallint(5) unsigned DEFAULT 0,
  `money` bigint(20) unsigned DEFAULT 0,
  `emoney` int(10) unsigned DEFAULT 0,
  `money_saved` int(10) unsigned DEFAULT 0,
  `profession` tinyint(3) unsigned DEFAULT 0,
  `old_prof` tinyint(3) unsigned DEFAULT 0,
  `first_prof` tinyint(3) unsigned DEFAULT 0,
  `metempsychosis` tinyint(3) unsigned DEFAULT 0,
  `level` tinyint(3) unsigned DEFAULT 0,
  `exp` bigint(20) unsigned DEFAULT 0,
  `recordmap_id` int(10) unsigned DEFAULT 0,
  `recordx` smallint(5) unsigned DEFAULT 0,
  `recordy` smallint(5) unsigned DEFAULT 0,
  `virtue` int(10) unsigned DEFAULT 0,
  `strength` smallint(5) unsigned DEFAULT 0,
  `speed` smallint(5) unsigned DEFAULT 0,
  `health` smallint(5) unsigned DEFAULT 0,
  `soul` smallint(5) unsigned DEFAULT 0,
  `additional_point` smallint(5) unsigned DEFAULT 0,
  `life` int(10) unsigned DEFAULT 0,
  `mana` smallint(5) unsigned DEFAULT 0,
  `pk` smallint(5) unsigned DEFAULT 0,
  `first_login` int(10) unsigned DEFAULT 0,
  `donation` bigint(20) unsigned DEFAULT 0,
  `last_login` int(10) unsigned DEFAULT 0,
  `last_logout` int(10) unsigned DEFAULT 0,
  `last_logout2` int(10) unsigned DEFAULT 0,
  `online_time` int(11) DEFAULT 0,
  `auto_allot` tinyint(3) unsigned DEFAULT 0,
  `mete_lev` int(10) unsigned DEFAULT 0,
  `mete_lev2` int(10) unsigned DEFAULT 0,
  `exp_ball_usage` int(10) unsigned DEFAULT 0,
  `god_status` int(10) unsigned DEFAULT 0,
  `task_mask` int(10) unsigned DEFAULT 0,
  `home_id` int(10) unsigned DEFAULT 0,
  `lock_key` bigint(20) unsigned DEFAULT 0,
  `auto_exercise` smallint(5) unsigned DEFAULT 0,
  `time_of_life` int(10) unsigned DEFAULT 0,
  `vip_value` int(10) unsigned DEFAULT 0,
  `business` int(10) unsigned DEFAULT 0,
  `send_flower_date` int(10) unsigned DEFAULT 0,
  `flower_r` int(10) unsigned DEFAULT 0,
  `flower_w` int(10) unsigned DEFAULT 0,
  `flower_lily` int(10) unsigned DEFAULT 0,
  `flower_tulip` int(10) unsigned DEFAULT 0,
  `online_god_exptime` int(10) unsigned DEFAULT 0,
  `battle_god_exptime` int(10) unsigned DEFAULT 0,
  `mentor_opportunity` int(10) unsigned DEFAULT 0,
  `mentor_uplev_time` int(10) unsigned DEFAULT 0,
  `mentor_achieve` int(10) unsigned DEFAULT 0,
  `mentor_day` int(10) unsigned DEFAULT 0,
  `title` int(10) unsigned DEFAULT 0,
  `title_select` tinyint(3) unsigned DEFAULT 0,
  `athlete_point` int(10) unsigned DEFAULT 0,
  `athlete_history_wins` int(10) unsigned DEFAULT 0,
  `athlete_history_loses` int(10) unsigned DEFAULT 0,
  `athlete_day_wins` int(10) unsigned DEFAULT 0,
  `athlete_day_loses` int(10) unsigned DEFAULT 0,
  `team_athlete_point` int(10) unsigned DEFAULT 0,
  `team_athlete_win` int(10) unsigned DEFAULT 0,
  `team_athlete_lost` int(10) unsigned DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned DEFAULT 0,
  `athlete_cur_honor_point` int(10) unsigned DEFAULT 0,
  `athlete_hisorty_honor_point` int(10) unsigned DEFAULT 0,
  `emoney_mono` int(10) unsigned DEFAULT 0,
  `quiz_point` int(10) unsigned DEFAULT 0,
  `nationality` smallint(5) unsigned DEFAULT 0,
  `cultivation` int(10) unsigned DEFAULT 0,
  `strength_value` int(10) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned DEFAULT 0,
  `showtype` tinyint(3) unsigned DEFAULT 0,
  `pk_setting` int(10) unsigned DEFAULT 0,
  `ridepet_point` int(10) unsigned DEFAULT 0,
  `chestpackage_size` int(10) unsigned DEFAULT 0,
  `flag` int(10) unsigned DEFAULT 0,
  `culture_value` int(10) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_old`
--

DROP TABLE IF EXISTS `cq_user_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `mateid` int(10) unsigned DEFAULT 0,
  `lookface` int(10) unsigned DEFAULT 0,
  `hair` smallint(5) unsigned DEFAULT 0,
  `money` bigint(20) unsigned DEFAULT 0,
  `emoney` int(10) unsigned DEFAULT 0,
  `money_saved` int(10) unsigned DEFAULT 0,
  `profession` tinyint(3) unsigned DEFAULT 0,
  `old_prof` tinyint(3) unsigned DEFAULT 0,
  `first_prof` tinyint(3) unsigned DEFAULT 0,
  `metempsychosis` tinyint(3) unsigned DEFAULT 0,
  `level` tinyint(3) unsigned DEFAULT 0,
  `exp` bigint(20) unsigned DEFAULT 0,
  `recordmap_id` int(10) unsigned DEFAULT 0,
  `recordx` smallint(5) unsigned DEFAULT 0,
  `recordy` smallint(5) unsigned DEFAULT 0,
  `virtue` int(10) unsigned DEFAULT 0,
  `strength` smallint(5) unsigned DEFAULT 0,
  `speed` smallint(5) unsigned DEFAULT 0,
  `health` smallint(5) unsigned DEFAULT 0,
  `soul` smallint(5) unsigned DEFAULT 0,
  `additional_point` smallint(5) unsigned DEFAULT 0,
  `life` int(10) unsigned DEFAULT 0,
  `mana` smallint(5) unsigned DEFAULT 0,
  `pk` smallint(5) unsigned DEFAULT 0,
  `first_login` int(10) unsigned DEFAULT 0,
  `donation` bigint(20) unsigned DEFAULT 0,
  `last_login` int(10) unsigned DEFAULT 0,
  `last_logout` int(10) unsigned DEFAULT 0,
  `last_logout2` int(10) unsigned DEFAULT 0,
  `online_time` int(11) DEFAULT 0,
  `auto_allot` tinyint(3) unsigned DEFAULT 0,
  `mete_lev` int(10) unsigned DEFAULT 0,
  `mete_lev2` int(10) unsigned DEFAULT 0,
  `exp_ball_usage` int(10) unsigned DEFAULT 0,
  `god_status` int(10) unsigned DEFAULT 0,
  `task_mask` int(10) unsigned DEFAULT 0,
  `home_id` int(10) unsigned DEFAULT 0,
  `lock_key` bigint(20) unsigned DEFAULT 0,
  `auto_exercise` smallint(5) unsigned DEFAULT 0,
  `time_of_life` int(10) unsigned DEFAULT 0,
  `vip_value` int(10) unsigned DEFAULT 0,
  `business` int(10) unsigned DEFAULT 0,
  `send_flower_date` int(10) unsigned DEFAULT 0,
  `flower_r` int(10) unsigned DEFAULT 0,
  `flower_w` int(10) unsigned DEFAULT 0,
  `flower_lily` int(10) unsigned DEFAULT 0,
  `flower_tulip` int(10) unsigned DEFAULT 0,
  `online_god_exptime` int(10) unsigned DEFAULT 0,
  `battle_god_exptime` int(10) unsigned DEFAULT 0,
  `mentor_opportunity` int(10) unsigned DEFAULT 0,
  `mentor_uplev_time` int(10) unsigned DEFAULT 0,
  `mentor_achieve` int(10) unsigned DEFAULT 0,
  `mentor_day` int(10) unsigned DEFAULT 0,
  `title` int(10) unsigned DEFAULT 0,
  `title_select` tinyint(3) unsigned DEFAULT 0,
  `athlete_point` int(10) unsigned DEFAULT 0,
  `athlete_history_wins` int(10) unsigned DEFAULT 0,
  `athlete_history_loses` int(10) unsigned DEFAULT 0,
  `athlete_day_wins` int(10) unsigned DEFAULT 0,
  `athlete_day_loses` int(10) unsigned DEFAULT 0,
  `team_athlete_point` int(10) unsigned DEFAULT 0,
  `team_athlete_win` int(10) unsigned DEFAULT 0,
  `team_athlete_lost` int(10) unsigned DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned DEFAULT 0,
  `athlete_cur_honor_point` int(10) unsigned DEFAULT 0,
  `athlete_hisorty_honor_point` int(10) unsigned DEFAULT 0,
  `emoney_mono` int(10) unsigned DEFAULT 0,
  `quiz_point` int(10) unsigned DEFAULT 0,
  `nationality` smallint(5) unsigned DEFAULT 0,
  `cultivation` int(10) unsigned DEFAULT 0,
  `strength_value` int(10) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned DEFAULT 0,
  `showtype` tinyint(3) unsigned DEFAULT 0,
  `pk_setting` int(10) unsigned DEFAULT 0,
  `ridepet_point` int(10) unsigned DEFAULT 0,
  `chestpackage_size` int(10) unsigned DEFAULT 0,
  `flag` int(10) unsigned DEFAULT 0,
  `culture_value` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_timeout`
--

DROP TABLE IF EXISTS `cq_user_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_timeout` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `lastname` varchar(15) NOT NULL DEFAULT '',
  `mateid` int(4) unsigned DEFAULT 0,
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `hair` smallint(2) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `money_saved` int(4) unsigned NOT NULL DEFAULT 0,
  `coin_money` int(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `old_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `Speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT 0,
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `life` int(4) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `deed` int(4) NOT NULL DEFAULT 0,
  `pk` smallint(2) NOT NULL DEFAULT 0,
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `medal` int(4) unsigned NOT NULL DEFAULT 0,
  `medal_select` int(4) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT 0,
  `first_login` int(8) unsigned NOT NULL DEFAULT 0,
  `account` varchar(15) NOT NULL DEFAULT 'None',
  `password` varchar(15) NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned NOT NULL DEFAULT 0,
  `time_of_life` int(4) unsigned NOT NULL DEFAULT 0,
  `virtue` int(4) unsigned NOT NULL DEFAULT 0,
  `home_id` int(4) unsigned NOT NULL DEFAULT 0,
  `lock_key` int(10) unsigned NOT NULL DEFAULT 0,
  `lock_cls` int(10) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `god_status` int(4) unsigned NOT NULL DEFAULT 0,
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT 0,
  `online_time` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `mete_lev` int(4) NOT NULL DEFAULT 0,
  `current_layout_type` tinyint(1) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `last_logout2` int(4) unsigned NOT NULL DEFAULT 0,
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  `send_flower_date` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_r` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  `quiz_point` int(4) unsigned DEFAULT 0,
  `vip_value` int(4) unsigned NOT NULL DEFAULT 0,
  `flag` int(4) unsigned NOT NULL DEFAULT 0,
  `first_prof` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `online_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `battle_god_exptime` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_opportunity` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_uplev_time` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_achieve` int(4) unsigned NOT NULL DEFAULT 0,
  `mentor_day` int(4) unsigned NOT NULL DEFAULT 0,
  `title` int(4) unsigned NOT NULL DEFAULT 0,
  `title_select` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `athlete_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_history_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_wins` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_day_loses` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_cur_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `athlete_hisorty_honor_point` int(4) unsigned NOT NULL DEFAULT 0,
  `last_logout_3` int(4) unsigned NOT NULL DEFAULT 0,
  `emoney_mono` int(4) unsigned NOT NULL DEFAULT 0,
  `ridepet_point` int(4) unsigned DEFAULT 0,
  `current_ast_prof` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ast_prof_rank` bigint(20) unsigned NOT NULL DEFAULT 0,
  `cultivation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `changenamerecord` int(10) unsigned NOT NULL DEFAULT 0,
  `pkprotocol` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `family_arenic` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `uin` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_point` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_win` int(10) unsigned NOT NULL DEFAULT 0,
  `team_athlete_season_lost` int(10) unsigned NOT NULL DEFAULT 0,
  `mete_lev2` int(4) unsigned NOT NULL DEFAULT 0,
  `strength_value` int(10) unsigned NOT NULL DEFAULT 0,
  `showtype` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `nationality` smallint(2) unsigned NOT NULL DEFAULT 0,
  `pk_setting` int(4) unsigned NOT NULL DEFAULT 0,
  `culture_value` int(10) unsigned NOT NULL DEFAULT 0,
  `texasmatch_win` bigint(20) unsigned NOT NULL DEFAULT 0,
  `texasmatch_lose` bigint(20) unsigned NOT NULL DEFAULT 0,
  `chestpackage_size` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `league_contribution` int(10) unsigned NOT NULL DEFAULT 0,
  `shielded_times` smallint(4) unsigned NOT NULL DEFAULT 0,
  `channel_account` varchar(74) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000000 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_timeout1`
--

DROP TABLE IF EXISTS `cq_user_timeout1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_timeout1` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `mate` varchar(15) NOT NULL DEFAULT 'None',
  `lookface` int(4) unsigned NOT NULL DEFAULT 0,
  `hair` smallint(2) unsigned NOT NULL DEFAULT 0,
  `money` int(4) unsigned NOT NULL DEFAULT 0,
  `money_saved` int(4) unsigned NOT NULL DEFAULT 0,
  `coin_money` int(3) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `exp` bigint(4) NOT NULL DEFAULT 0,
  `strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `old_prof` smallint(2) unsigned NOT NULL DEFAULT 0,
  `Speed` smallint(2) unsigned NOT NULL DEFAULT 0,
  `health` smallint(2) unsigned NOT NULL DEFAULT 0,
  `soul` smallint(2) unsigned NOT NULL DEFAULT 0,
  `additional_point` smallint(2) unsigned NOT NULL DEFAULT 0,
  `auto_allot` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `life` smallint(2) unsigned NOT NULL DEFAULT 0,
  `mana` smallint(2) unsigned NOT NULL DEFAULT 0,
  `profession` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `deed` int(4) NOT NULL DEFAULT 0,
  `pk` smallint(2) NOT NULL DEFAULT 0,
  `nobility` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `medal` int(4) unsigned NOT NULL DEFAULT 0,
  `medal_select` int(4) unsigned NOT NULL DEFAULT 0,
  `metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `syndicate_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordmap_id` int(4) unsigned NOT NULL DEFAULT 0,
  `recordx` smallint(2) unsigned NOT NULL DEFAULT 0,
  `recordy` smallint(2) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `last_login` int(8) unsigned NOT NULL DEFAULT 0,
  `account` varchar(15) NOT NULL DEFAULT 'None',
  `password` varchar(15) NOT NULL DEFAULT 'None',
  `task_mask` int(4) unsigned NOT NULL DEFAULT 0,
  `time_of_life` int(4) unsigned NOT NULL DEFAULT 0,
  `virtue` int(4) unsigned NOT NULL DEFAULT 0,
  `home_id` int(4) unsigned NOT NULL DEFAULT 0,
  `lock_key` int(10) unsigned NOT NULL DEFAULT 0,
  `lock_cls` int(10) unsigned NOT NULL DEFAULT 0,
  `emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `god_status` int(4) unsigned NOT NULL DEFAULT 0,
  `exp_ball_usage` smallint(2) unsigned NOT NULL DEFAULT 0,
  `online_time` int(4) unsigned NOT NULL DEFAULT 0,
  `auto_exercise` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `last_logout` int(4) unsigned NOT NULL DEFAULT 0,
  `big_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `small_prize_fails` int(4) unsigned NOT NULL DEFAULT 0,
  `mete_lev` int(4) NOT NULL DEFAULT 0,
  `current_layout_type` tinyint(1) NOT NULL DEFAULT 0,
  `flower` int(4) unsigned NOT NULL DEFAULT 0,
  `online_time2` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `offline_time` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `last_logout2` int(4) unsigned NOT NULL DEFAULT 0,
  `donation` bigint(20) unsigned NOT NULL DEFAULT 0,
  `business` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_name` (`name`) USING BTREE,
  KEY `index_account` (`account_id`) USING BTREE,
  KEY `index_money` (`money_saved`) USING BTREE,
  KEY `index_pk` (`pk`) USING BTREE,
  KEY `index_level` (`level`,`profession`) USING BTREE,
  KEY `tim` (`last_login`) USING BTREE,
  KEY `index_profession` (`profession`) USING BTREE,
  KEY `index_mate` (`mate`) USING BTREE,
  KEY `idx_mate` (`mate`) USING BTREE,
  KEY `idx_syndicate_id` (`syndicate_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_user_title`
--

DROP TABLE IF EXISTS `cq_user_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_user_title` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `title_id` int(4) unsigned NOT NULL DEFAULT 0,
  `status` int(4) unsigned NOT NULL DEFAULT 0,
  `del_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_valid_user`
--

DROP TABLE IF EXISTS `cq_valid_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_valid_user` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_vexillum`
--

DROP TABLE IF EXISTS `cq_vexillum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_vexillum` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `synid` int(4) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `score` int(4) unsigned NOT NULL DEFAULT 0,
  `usercount` smallint(4) unsigned NOT NULL DEFAULT 0,
  `lastmeedmoney` int(4) unsigned NOT NULL DEFAULT 0,
  `lastmeedemoney` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_vipminetime`
--

DROP TABLE IF EXISTS `cq_vipminetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_vipminetime` (
  `iduser` int(4) unsigned NOT NULL DEFAULT 0,
  `lastentertime` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`iduser`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_viptranspoint`
--

DROP TABLE IF EXISTS `cq_viptranspoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_viptranspoint` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `map_id` int(4) unsigned NOT NULL DEFAULT 0,
  `map_x` smallint(5) unsigned NOT NULL DEFAULT 0,
  `map_y` smallint(5) unsigned NOT NULL DEFAULT 0,
  `point_name` char(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_virtual_gm`
--

DROP TABLE IF EXISTS `cq_virtual_gm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_virtual_gm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_wanted`
--

DROP TABLE IF EXISTS `cq_wanted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_wanted` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `target_name` varchar(15) DEFAULT NULL,
  `target_lev` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `target_pro` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `target_syn` int(4) unsigned NOT NULL DEFAULT 0,
  `payer` varchar(15) DEFAULT NULL,
  `bounty` int(4) unsigned DEFAULT NULL,
  `order_time` int(4) unsigned DEFAULT NULL,
  `hunter` varchar(15) DEFAULT NULL,
  `finish_time` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill`
--

DROP TABLE IF EXISTS `cq_weapon_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill` (
  `type` int(4) unsigned DEFAULT 0,
  `level` tinyint(2) unsigned DEFAULT 0,
  `exp` int(4) unsigned DEFAULT 0,
  `old_level` tinyint(2) unsigned DEFAULT 0,
  `owner_id` int(4) unsigned DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `unlearn` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_ownerid_type` (`owner_id`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1323 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill_timeout`
--

DROP TABLE IF EXISTS `cq_weapon_skill_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill_timeout` (
  `type` int(4) unsigned DEFAULT 0,
  `level` tinyint(2) unsigned DEFAULT 0,
  `exp` int(4) unsigned DEFAULT 0,
  `old_level` tinyint(2) unsigned DEFAULT 0,
  `owner_id` int(4) unsigned DEFAULT 0,
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `unlearn` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cq_weapon_skill_up`
--

DROP TABLE IF EXISTS `cq_weapon_skill_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cq_weapon_skill_up` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `weapontype` int(4) unsigned NOT NULL DEFAULT 0,
  `level` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `req_exp` int(4) unsigned NOT NULL DEFAULT 0,
  `req_uplevtime` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_orderby` (`weapontype`,`level`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=715 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `daily_reset`
--

DROP TABLE IF EXISTS `daily_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_reset` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `run_time` datetime NOT NULL,
  `ms` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbbrushlog`
--

DROP TABLE IF EXISTS `dbbrushlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbbrushlog` (
  `LogID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RecordDate` bigint(20) DEFAULT 0,
  `Module` int(11) DEFAULT 0,
  `GameClass` int(11) DEFAULT 0,
  `GameID` int(11) DEFAULT 0,
  `RunThread` blob DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `LoggerMsg` blob DEFAULT NULL,
  `Sqlsmt` blob DEFAULT NULL,
  `ServerConn` blob DEFAULT NULL,
  `ServerID` int(11) DEFAULT 0,
  `RetryTimes` bigint(20) DEFAULT 0,
  PRIMARY KEY (`LogID`) USING BTREE,
  UNIQUE KEY `LogID` (`LogID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dyna_rank_rec`
--

DROP TABLE IF EXISTS `dyna_rank_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dyna_rank_rec` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(4) unsigned NOT NULL DEFAULT 0,
  `value` bigint(4) NOT NULL DEFAULT 0,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `sort` (`rank_type`,`value`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dyna_rank_type`
--

DROP TABLE IF EXISTS `dyna_rank_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dyna_rank_type` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rank_type` int(4) unsigned NOT NULL DEFAULT 0,
  `rank_num` smallint(2) unsigned NOT NULL DEFAULT 0,
  `rank_data_min` int(4) unsigned NOT NULL DEFAULT 0,
  `reset_time_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `comment` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`,`rank_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_money`
--

DROP TABLE IF EXISTS `e_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_money` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `id_source` int(4) unsigned NOT NULL DEFAULT 0,
  `id_target` int(4) unsigned NOT NULL DEFAULT 0,
  `number` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `source_balance` int(4) unsigned NOT NULL DEFAULT 0,
  `target_balance` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_time_stamp` (`time_stamp`) USING BTREE,
  KEY `idx_id_source` (`id_source`) USING BTREE,
  KEY `idx_id_target` (`id_target`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5623 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_money_mono`
--

DROP TABLE IF EXISTS `e_money_mono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_money_mono` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `id_source` int(4) unsigned NOT NULL DEFAULT 0,
  `id_target` int(4) unsigned NOT NULL DEFAULT 0,
  `number` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `source_balance` int(4) unsigned NOT NULL DEFAULT 0,
  `target_balance` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `e_money_month`
--

DROP TABLE IF EXISTS `e_money_month`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_money_month` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `id_source` int(4) unsigned NOT NULL DEFAULT 0,
  `id_target` int(4) unsigned NOT NULL DEFAULT 0,
  `number` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `source_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  `target_emoney` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE,
  KEY `index_source` (`id_source`) USING BTREE,
  KEY `index_time` (`time_stamp`) USING BTREE,
  KEY `idx_id_source_target` (`id_source`,`id_target`) USING BTREE,
  KEY `idx_target` (`id_target`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card`
--

DROP TABLE IF EXISTS `emoney_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `ordernumber` varchar(50) DEFAULT NULL,
  `flag` tinyint(2) unsigned DEFAULT 0,
  `card_in_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `condition` (`account_id`,`used`,`chk_sum`) USING BTREE,
  KEY `idx_time_stamp` (`time_stamp`) USING BTREE,
  KEY `card_in_time` (`card_in_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card2`
--

DROP TABLE IF EXISTS `emoney_card2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card2` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `ordernumber` varchar(50) DEFAULT NULL,
  `flag` tinyint(2) unsigned DEFAULT 0,
  `card_in_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_id` (`account_id`) USING BTREE,
  KEY `condition` (`account_id`,`used`,`chk_sum`) USING BTREE,
  KEY `idx_time_stamp` (`time_stamp`) USING BTREE,
  KEY `card_in_time` (`card_in_time`) USING BTREE,
  KEY `idx_ordnum` (`ordernumber`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card3`
--

DROP TABLE IF EXISTS `emoney_card3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card3` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `ordernumber` varchar(40) DEFAULT NULL,
  `flag` tinyint(2) unsigned DEFAULT 0,
  `card_in_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card4`
--

DROP TABLE IF EXISTS `emoney_card4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card4` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(4) unsigned NOT NULL DEFAULT 0,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `ref_id` int(4) unsigned NOT NULL DEFAULT 0,
  `chk_sum` int(4) unsigned NOT NULL DEFAULT 0,
  `time_stamp` int(4) unsigned NOT NULL DEFAULT 0,
  `used` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `ordernumber` varchar(40) DEFAULT NULL,
  `flag` tinyint(2) unsigned DEFAULT 0,
  `card_in_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card91`
--

DROP TABLE IF EXISTS `emoney_card91`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card91` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT 0,
  `account_id` int(11) DEFAULT 0,
  `chk_sum` int(11) DEFAULT 0,
  `time_stamp` int(11) DEFAULT 0,
  `used` int(11) DEFAULT 0,
  `ordernumber` varchar(50) DEFAULT '',
  `flag` int(11) DEFAULT 0,
  `card_in_time` int(11) DEFAULT 0,
  `itemcount` int(11) DEFAULT 0,
  `systemtype` int(11) DEFAULT 0,
  `ref_id` int(11) DEFAULT 0,
  `roleid` int(11) DEFAULT 0,
  `producer_order` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card_google`
--

DROP TABLE IF EXISTS `emoney_card_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT 0,
  `account_id` int(11) DEFAULT 0,
  `chk_sum` int(11) DEFAULT 0,
  `time_stamp` int(11) DEFAULT 0,
  `used` int(11) DEFAULT 0,
  `ordernumber` varchar(50) DEFAULT '',
  `flag` int(11) DEFAULT 0,
  `card_in_time` int(11) DEFAULT 0,
  `itemcount` int(11) DEFAULT 0,
  `systemtype` int(11) DEFAULT 0,
  `ref_id` int(11) DEFAULT 0,
  `roleid` int(11) DEFAULT 0,
  `producer_order` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `used` (`used`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoney_card_ndsdk`
--

DROP TABLE IF EXISTS `emoney_card_ndsdk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoney_card_ndsdk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT 0,
  `account_id` varchar(64) NOT NULL DEFAULT '',
  `chk_sum` int(11) DEFAULT 0,
  `time_stamp` int(11) DEFAULT 0,
  `used` int(11) DEFAULT 0,
  `ordernumber` varchar(50) DEFAULT '',
  `flag` int(11) DEFAULT 0,
  `card_in_time` int(11) DEFAULT 0,
  `itemcount` int(11) DEFAULT 0,
  `systemtype` int(11) DEFAULT 0,
  `ref_id` int(11) DEFAULT 0,
  `roleid` int(11) DEFAULT 0,
  `producer_order` varchar(50) DEFAULT '',
  `account_systemtype` int(11) unsigned NOT NULL DEFAULT 0,
  `exchange_type` int(11) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `used` (`used`) USING BTREE,
  KEY `userid_used` (`used`,`roleid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoneybak`
--

DROP TABLE IF EXISTS `emoneybak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoneybak` (
  `number` int(4) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `id_target` int(4) DEFAULT NULL,
  `Id` int(11) NOT NULL DEFAULT 0,
  `id_source` int(4) DEFAULT 0,
  `nationsymbol` int(4) DEFAULT NULL,
  KEY `type` (`type`,`id_target`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoneycount`
--

DROP TABLE IF EXISTS `emoneycount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoneycount` (
  `number` int(4) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  `id_target` int(4) DEFAULT NULL,
  KEY `type` (`type`,`id_target`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoneylastid`
--

DROP TABLE IF EXISTS `emoneylastid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoneylastid` (
  `id` int(4) NOT NULL DEFAULT 0,
  `number` int(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emoneysum`
--

DROP TABLE IF EXISTS `emoneysum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emoneysum` (
  `id` int(4) NOT NULL DEFAULT 0,
  `oldNumber` int(4) DEFAULT 0,
  `newNumber` int(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `family_name` varchar(35) DEFAULT '0',
  `rank` tinyint(1) unsigned DEFAULT 0,
  `lead_id` int(4) unsigned NOT NULL DEFAULT 0,
  `annouce` varchar(255) DEFAULT NULL,
  `money` bigint(4) unsigned DEFAULT 0,
  `repute` int(4) unsigned DEFAULT 0,
  `amount` tinyint(3) unsigned DEFAULT 0,
  `enemy_family_0_id` int(4) unsigned DEFAULT 0,
  `enemy_family_1_id` int(4) unsigned DEFAULT 0,
  `enemy_family_2_id` int(4) unsigned DEFAULT 0,
  `enemy_family_3_id` int(4) unsigned DEFAULT 0,
  `enemy_family_4_id` int(4) unsigned DEFAULT 0,
  `ally_family_0_id` int(4) unsigned DEFAULT 0,
  `ally_family_1_id` int(4) unsigned DEFAULT 0,
  `ally_family_2_id` int(4) unsigned DEFAULT 0,
  `ally_family_3_id` int(4) unsigned DEFAULT 0,
  `ally_family_4_id` int(4) unsigned DEFAULT 0,
  `create_date` int(4) unsigned DEFAULT 0,
  `create_name` varchar(15) DEFAULT '0',
  `challenge_map` int(4) unsigned DEFAULT 0,
  `family_map` int(4) unsigned DEFAULT 0,
  `star_tower` tinyint(1) unsigned DEFAULT 0,
  `challenge` int(4) unsigned NOT NULL DEFAULT 0,
  `occupy` int(4) unsigned NOT NULL DEFAULT 0,
  `del_flag` tinyint(1) unsigned DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`family_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_attr`
--

DROP TABLE IF EXISTS `family_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_attr` (
  `id` int(4) unsigned NOT NULL DEFAULT 0,
  `family_id` int(4) unsigned DEFAULT 0,
  `rank` tinyint(1) unsigned DEFAULT 0,
  `proffer` int(4) unsigned DEFAULT 0,
  `join_date` int(4) unsigned DEFAULT 0,
  `auto_exercise` tinyint(1) unsigned DEFAULT 0,
  `exp_date` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `family_id` (`family_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `family_battle_effect_share_limit`
--

DROP TABLE IF EXISTS `family_battle_effect_share_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_battle_effect_share_limit` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `share_limit` smallint(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flower`
--

DROP TABLE IF EXISTS `flower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flower` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_r` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_w` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_lily` int(4) unsigned NOT NULL DEFAULT 0,
  `flower_tulip` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_player_id` (`player_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_endtime`
--

DROP TABLE IF EXISTS `game_endtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_endtime` (
  `bak_flag` varchar(30) NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ghostcontract`
--

DROP TABLE IF EXISTS `ghostcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ghostcontract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Item_id` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `timeout` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_item_id` (`Item_id`) USING BTREE,
  KEY `idx_owner_id` (`owner_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_log`
--

DROP TABLE IF EXISTS `item_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_log` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(4) unsigned NOT NULL DEFAULT 0,
  `item_id` int(4) unsigned NOT NULL DEFAULT 0,
  `item_type` int(4) unsigned NOT NULL DEFAULT 0,
  `owner_id` int(4) unsigned NOT NULL DEFAULT 0,
  `event` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_rcd`
--

DROP TABLE IF EXISTS `login_rcd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_rcd` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(4) unsigned NOT NULL DEFAULT 0,
  `login_time` bigint(15) unsigned zerofill DEFAULT NULL,
  `online_second` int(4) unsigned NOT NULL DEFAULT 0,
  `mac_adr` char(12) NOT NULL DEFAULT '',
  `ip_adr` char(15) NOT NULL DEFAULT '""',
  `res_src` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_datamonitor`
--

DROP TABLE IF EXISTS `m_datamonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_datamonitor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  `Value` bigint(20) DEFAULT NULL,
  `InnerType` int(11) DEFAULT NULL,
  `ExecDate` datetime DEFAULT NULL,
  `nationsymbol` int(4) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `m_datamonitorbak`
--

DROP TABLE IF EXISTS `m_datamonitorbak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_datamonitorbak` (
  `id` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Value` bigint(20) DEFAULT NULL,
  `InnerType` int(11) DEFAULT NULL,
  `ExecDate` datetime DEFAULT NULL,
  `nationsymbol` int(4) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `points`
--

DROP TABLE IF EXISTS `points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `points` (
  `name` varbinary(240) DEFAULT NULL,
  `point` int(10) unsigned NOT NULL DEFAULT 0,
  `sortType` smallint(5) unsigned DEFAULT NULL,
  `level` smallint(5) unsigned DEFAULT NULL,
  `profession` smallint(5) unsigned DEFAULT NULL,
  `lastlogin` int(10) unsigned DEFAULT NULL,
  `amount` int(11) unsigned DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `leader_name` varbinary(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profession`
--

DROP TABLE IF EXISTS `profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profession` (
  `name` varbinary(240) DEFAULT NULL,
  `level` smallint(5) unsigned DEFAULT NULL,
  `exp` bigint(10) unsigned DEFAULT NULL,
  `mate` varbinary(240) DEFAULT NULL,
  `syndicate` varbinary(240) DEFAULT NULL,
  `sortType` smallint(5) unsigned DEFAULT NULL,
  `pro` smallint(5) unsigned DEFAULT NULL,
  `lastlogin` int(10) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_family`
--

DROP TABLE IF EXISTS `records_family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_family` (
  `Identity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `FamilyIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `LeaderIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `Count` int(10) unsigned NOT NULL DEFAULT 0,
  `Money` bigint(20) unsigned NOT NULL DEFAULT 0,
  `CreatedAt` datetime NOT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  `ChallengeMap` int(10) unsigned NOT NULL DEFAULT 0,
  `DominatedMap` int(10) unsigned NOT NULL DEFAULT 0,
  `Level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `BpTower` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`Identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_guild_war`
--

DROP TABLE IF EXISTS `records_guild_war`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_guild_war` (
  `Identity` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `SyndicateIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `LeaderIdentity` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Identity`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_syndicate`
--

DROP TABLE IF EXISTS `records_syndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_syndicate` (
  `Id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `SyndicateIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `Name` varchar(16) NOT NULL,
  `LeaderIdentity` int(4) unsigned NOT NULL DEFAULT 0,
  `Count` int(4) unsigned NOT NULL DEFAULT 0,
  `CreatedAt` datetime NOT NULL,
  `DeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_user`
--

DROP TABLE IF EXISTS `records_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records_user` (
  `Id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `ServerIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `UserIdentity` int(11) unsigned NOT NULL,
  `AccountIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `Name` varchar(16) NOT NULL,
  `MateId` int(4) unsigned NOT NULL,
  `Level` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `Experience` bigint(16) unsigned NOT NULL DEFAULT 0,
  `Profession` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `OldProfession` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `NewProfession` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `Metempsychosis` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `Strength` smallint(2) unsigned NOT NULL DEFAULT 0,
  `Agility` smallint(2) unsigned NOT NULL DEFAULT 0,
  `Vitality` smallint(2) unsigned NOT NULL DEFAULT 0,
  `Spirit` smallint(2) unsigned NOT NULL DEFAULT 0,
  `AdditionalPoints` smallint(2) unsigned NOT NULL DEFAULT 0,
  `SyndicateIdentity` int(4) unsigned NOT NULL DEFAULT 0,
  `SyndicatePosition` smallint(2) unsigned NOT NULL DEFAULT 0,
  `NobilityDonation` bigint(16) unsigned NOT NULL DEFAULT 0,
  `NobilityRank` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `SupermanCount` int(4) unsigned NOT NULL DEFAULT 0,
  `DeletedAt` datetime DEFAULT NULL,
  `Money` bigint(20) unsigned NOT NULL DEFAULT 0,
  `WarehouseMoney` int(10) unsigned NOT NULL DEFAULT 0,
  `ConquerPoints` int(10) unsigned NOT NULL DEFAULT 0,
  `FamilyIdentity` int(10) unsigned NOT NULL DEFAULT 0,
  `FamilyRank` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `IdIdx` (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `split`
--

DROP TABLE IF EXISTS `split`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `split` (
  `account_id` int(12) DEFAULT NULL,
  `split_date` datetime DEFAULT NULL,
  UNIQUE KEY `index_account` (`account_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_dbbrushtimestamp`
--

DROP TABLE IF EXISTS `st_dbbrushtimestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_dbbrushtimestamp` (
  `timestamp` bigint(20) unsigned DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ko`
--

DROP TABLE IF EXISTS `st_ko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ko` (
  `rowid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) unsigned DEFAULT NULL,
  `name` varbinary(50) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE,
  UNIQUE KEY `rowid` (`rowid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_ko1`
--

DROP TABLE IF EXISTS `st_ko1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_ko1` (
  `sortid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) unsigned DEFAULT NULL,
  `name` varbinary(50) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`sortid`) USING BTREE,
  UNIQUE KEY `sortid` (`sortid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_points`
--

DROP TABLE IF EXISTS `st_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_points` (
  `sortid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varbinary(240) DEFAULT NULL,
  `point` bigint(20) DEFAULT NULL,
  `sortType` smallint(5) unsigned DEFAULT NULL,
  `level` smallint(5) unsigned DEFAULT NULL,
  `profession` smallint(5) unsigned DEFAULT NULL,
  `lastlogin` int(10) unsigned DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `leader_name` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`sortid`) USING BTREE,
  UNIQUE KEY `sortid` (`sortid`) USING BTREE,
  KEY `sortTypeIndex` (`sortType`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_profession`
--

DROP TABLE IF EXISTS `st_profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_profession` (
  `sortid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varbinary(240) DEFAULT NULL,
  `level` smallint(5) unsigned DEFAULT NULL,
  `exp` bigint(10) unsigned DEFAULT NULL,
  `mate` varbinary(240) DEFAULT NULL,
  `syndicate` varbinary(240) DEFAULT NULL,
  `sortType` smallint(5) unsigned DEFAULT NULL,
  `pro` smallint(5) unsigned DEFAULT NULL,
  `lastlogin` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sortid`) USING BTREE,
  UNIQUE KEY `sortid` (`sortid`) USING BTREE,
  KEY `sortTypeIndex` (`sortType`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_winsyn`
--

DROP TABLE IF EXISTS `st_winsyn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_winsyn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(50) DEFAULT NULL,
  `leader_name` varbinary(50) DEFAULT NULL,
  `amount` int(11) unsigned DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `synlevel` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`rowid`) USING BTREE,
  UNIQUE KEY `rowid` (`rowid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_winsyn1`
--

DROP TABLE IF EXISTS `st_winsyn1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_winsyn1` (
  `sortid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varbinary(50) DEFAULT NULL,
  `leader_name` varbinary(50) DEFAULT NULL,
  `amount` int(11) unsigned DEFAULT NULL,
  `money` bigint(20) DEFAULT NULL,
  `synrank` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`sortid`) USING BTREE,
  UNIQUE KEY `rowid` (`sortid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_name`
--

DROP TABLE IF EXISTS `table_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_name` (
  `a` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_detail`
--

DROP TABLE IF EXISTS `task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_detail` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `task_id` int(4) unsigned NOT NULL DEFAULT 0,
  `complete_flag` smallint(1) unsigned NOT NULL DEFAULT 0,
  `notify_flag` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `data4` int(4) NOT NULL DEFAULT 0,
  `data5` int(4) NOT NULL DEFAULT 0,
  `data6` int(4) NOT NULL DEFAULT 0,
  `data7` int(4) NOT NULL DEFAULT 0,
  `task_overtime` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `max_accumulate_times` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1521 DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_detail_timeout`
--

DROP TABLE IF EXISTS `task_detail_timeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_detail_timeout` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(4) unsigned NOT NULL DEFAULT 0,
  `task_id` int(4) unsigned NOT NULL DEFAULT 0,
  `complete_flag` smallint(1) unsigned NOT NULL DEFAULT 0,
  `notify_flag` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `data1` int(4) NOT NULL DEFAULT 0,
  `data2` int(4) NOT NULL DEFAULT 0,
  `data3` int(4) NOT NULL DEFAULT 0,
  `data4` int(4) NOT NULL DEFAULT 0,
  `data5` int(4) NOT NULL DEFAULT 0,
  `data6` int(4) NOT NULL DEFAULT 0,
  `data7` int(4) NOT NULL DEFAULT 0,
  `task_overtime` int(4) unsigned NOT NULL DEFAULT 0,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `max_accumulate_times` int(4) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `winsyndicate`
--

DROP TABLE IF EXISTS `winsyndicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `winsyndicate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `SyndicateID` int(11) DEFAULT NULL,
  `SyndicateName` varchar(50) DEFAULT NULL,
  `LeaderID` int(11) DEFAULT NULL,
  `LeaderName` varchar(50) DEFAULT NULL,
  `MemberCount` int(11) DEFAULT NULL,
  `Fund` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `idx_leadername` (`LeaderName`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'cq'
--
/*!50003 DROP PROCEDURE IF EXISTS `QueryFamilyRankInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryFamilyRankInformation`()
BEGIN
	SELECT 
		fam.id Id,
        fam.family_name `Name`,
        fam.lead_id `LeaderId`,
        fam.amount `Amount`,
        fam.money `Money`,
        fam.repute `Level`,
        fam.star_tower `StarTower`,
        fam.family_map `FamilyMap`,
        map.name `FamilyMapName`,
        fam.occupy `OccupyDate`
    FROM family fam
    LEFT JOIN cq_map map ON map.id = fam.family_map
    WHERE fam.del_flag IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QuerySyndicateRankInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QuerySyndicateRankInformation`()
BEGIN

	SELECT 
		id Id,
        name `Name`,
        leader_id `LeaderId`,
        amount `Amount`,
        money `Money`,
        emoney `ConquerPoints`,
        synrank `Level`,
        IF(del_flag IS NULL, 0, 1) `DelFlag`
    FROM cq_syndicate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryTradeById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryTradeById`(IN tradeId INT)
BEGIN
	SELECT 
		trade.id Id,
        IFNULL(caller.id, 0) CallerId,
        IFNULL(caller.name, 'Error') CallerName,
        trade.user_money CallerMoney,
        trade.user_emoney CallerConquerPoints,
        trade.user_ip_addr CallerIpAddress,
        trade.user_mac_addr CallerMacAddress,
        IFNULL(target.id, 0) TargetId,
        IFNULL(target.name, 'Error') TargetName,
        trade.target_money TargetMoney,
        trade.target_emoney TargetConquerPoints,
        trade.target_ip_addr TargetIpAddress,
        trade.target_mac_addr TargetMacAddress,
        trade.timestamp `Timestamp`
	FROM 
		cq_trade trade
	LEFT JOIN cq_user caller ON caller.id = trade.user_id
    LEFT JOIN cq_user target ON target.id = trade.target_id
    WHERE trade.id = tradeId
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryTradeHistoryById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryTradeHistoryById`(IN idTrade INT)
BEGIN
	SELECT 
		tradeitem.*,
        itemtype.name `ItemName`
	FROM 
		cq_trade_item tradeitem
	LEFT JOIN cq_itemtype itemtype ON itemtype.id = tradeitem.itemtype
	WHERE 
		trade_id=idTrade;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryTradeHistoryByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryTradeHistoryByUserId`(IN idUser INT, IN fromIdx INT, IN ipp INT)
BEGIN
	SELECT 
		trade.id Id,
        IFNULL(caller.id, 0) CallerId,
        IFNULL(caller.name, 'Error') CallerName,
        trade.user_money CallerMoney,
        trade.user_emoney CallerConquerPoints,
        trade.user_ip_addr CallerIpAddress,
        trade.user_mac_addr CallerMacAddress,
        IFNULL(target.id, 0) TargetId,
        IFNULL(target.name, 'Error') TargetName,
        trade.target_money TargetMoney,
        trade.target_emoney TargetConquerPoints,
        trade.target_ip_addr TargetIpAddress,
        trade.target_mac_addr TargetMacAddress,
        trade.timestamp `Timestamp`
	FROM 
		cq_trade trade
	LEFT JOIN cq_user caller ON caller.id = trade.user_id
    LEFT JOIN cq_user target ON target.id = trade.target_id
    WHERE trade.user_id=idUser OR trade.target_id = idUser
    ORDER BY id DESC
    LIMIT fromIdx, ipp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryUserByAccountIDs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryUserByAccountIDs`(IN idList TEXT)
BEGIN
	SELECT
		*
	FROM
		cq_user
	WHERE 
		find_in_set(account_id, idList) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryUserRankInformation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryUserRankInformation`()
BEGIN

	SELECT 
		usr.id `Id`,
        usr.name `Name`,
        usr.mateid `Mate`,
        usr.lookface `Lookface`,
        usr.money `Money`,
        usr.money_saved `StorageMoney`,
        usr.emoney `ConquerPoints`,
        usr.emoney_mono `ConquerPointsBound`,
        usr.level `Level`,
        usr.exp `Experience`,
        usr.metempsychosis `Metempsychosis`,
        usr.profession `Profession`,
        usr.old_prof `PreviousProfession`,
        usr.first_prof `FirstProfession`,
        usr.strength `Strength`,
        usr.Speed `Agility`,
        usr.health `Health`,
        usr.soul `Soul`,
        usr.additional_point `AttributePoints`,
        usr.flower_r `Gift1`,
        usr.flower_w `Gift2`,
        usr.flower_lily `Gift3`,
        usr.flower_tulip `Gift4`,
        syndicate.id `SyndicateId`,
        fam.id `FamilyId`,
        IFNULL(superman.number, 0) `SupermanCount`,
        IFNULL(peerage.donation, 0) `PeerageDonation`
    FROM cq_user usr
		LEFT JOIN cq_synattr syn_attr ON syn_attr.user_id = usr.id
        LEFT JOIN cq_syndicate syndicate ON syndicate.id = syn_attr.syn_id
        LEFT JOIN family_attr fam_attr ON fam_attr.user_id = usr.id
        LEFT JOIN family fam ON fam.id = fam_attr.family_id
        LEFT JOIN cq_superman superman ON superman.user_id=usr.id
        LEFT JOIN cq_peerage peerage ON peerage.user_id=usr.id
	WHERE 
		usr.id > 1000000
        AND usr.name NOT LIKE '%[GM]%' AND usr.name NOT LIKE '%[PM]%'
        AND usr.level >= 70
    ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `QueryUsersByNameLike` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `QueryUsersByNameLike`(IN nameLike TEXT)
BEGIN
	SELECT 
		*
	FROM
		cq_user
	WHERE `name` LIKE CONCAT('%', nameLike, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `WinSyndicateProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `WinSyndicateProc`()
BEGIN
	INSERT INTO winsyndicate SELECT 
		NULL,
		NOW(),
		syndicate.id,
		syndicate.name,
		syndicate.leader_id,
		syndicate.leader_name,
		syndicate.amount,
		syndicate.money
	FROM cq_dynanpc dynanpc
		LEFT JOIN cq_syndicate syndicate ON syndicate.id = dynanpc.ownerid
	WHERE dynanpc.id = 810;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-09  1:51:54
