-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2013 at 06:46 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invent`
--

-- --------------------------------------------------------

--
-- Table structure for table `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authassignment`
--


-- --------------------------------------------------------

--
-- Table structure for table `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('adminCabang', 0, 'manage a Cabang', NULL, 'N;'),
('adminMesin', 0, 'manage an Mesin from a project', NULL, 'N;'),
('adminUser', 0, 'manage user from a project', NULL, 'N;'),
('createCabang', 0, 'create a new Cabang', NULL, 'N;'),
('createMesin', 0, 'create a new Mesin', NULL, 'N;'),
('createUser', 0, 'create a new user', NULL, 'N;'),
('deleteCabang', 0, 'delete a Cabang', NULL, 'N;'),
('deleteMesin', 0, 'delete an Mesin from a project', NULL, 'N;'),
('deleteUser', 0, 'remove a user from a project', NULL, 'N;'),
('member', 2, '', NULL, 'N;'),
('owner', 2, '', NULL, 'N;'),
('readCabang', 0, 'read Cabang information', NULL, 'N;'),
('reader', 2, '', NULL, 'N;'),
('readMesin', 0, 'read Mesin information', NULL, 'N;'),
('readUser', 0, 'read user profile information', NULL, 'N;'),
('updateCabang', 0, 'up date Cabang information', NULL, 'N;'),
('updateMesin', 0, 'update Mesin information', NULL, 'N;'),
('updateUser', 0, 'update a users information', NULL, 'N;'),
('uploadSIWMesin', 0, 'Upload SIW File to database', NULL, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('owner', 'adminCabang'),
('owner', 'adminMesin'),
('owner', 'adminUser'),
('owner', 'createCabang'),
('member', 'createMesin'),
('owner', 'createMesin'),
('owner', 'createUser'),
('owner', 'deleteCabang'),
('member', 'deleteMesin'),
('owner', 'deleteMesin'),
('owner', 'deleteUser'),
('owner', 'member'),
('reader', 'readCabang'),
('member', 'reader'),
('owner', 'reader'),
('reader', 'readMesin'),
('reader', 'readUser'),
('owner', 'updateCabang'),
('member', 'updateMesin'),
('owner', 'updateMesin'),
('owner', 'updateUser'),
('owner', 'uploadSIWMesin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cabang`
--

CREATE TABLE IF NOT EXISTS `tbl_cabang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `alamat` varchar(128) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_cabang`
--

INSERT INTO `tbl_cabang` (`id`, `nama`, `description`, `alamat`, `parent_id`, `last_visit`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'FBBDG', 'FB Bandung', 'This is test cabang Bandung', 5, '2013-02-12 00:00:00', '0000-00-00 00:00:00', NULL, '2013-02-17 18:28:03', 1),
(2, 'SPBJR', 'SP Banjaran', 'This is test cabang 2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2013-02-22 03:12:11', 1),
(3, 'FBCMR', 'FB Cimareme', 'This is test cabang 3', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2013-02-17 17:28:12', 1),
(4, 'FBSKB', 'FB Sukabumi', 'This is test cabang 3', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2013-02-17 17:28:25', 1),
(5, 'FBPST', 'FB Pusat', 'This is test Pusat', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '2013-02-17 18:28:15', 1),
(10, 'FBSBG', 'FB Subang', 'Subang', 5, '2012-12-11 00:00:00', '2013-02-22 03:20:11', 1, '2013-02-22 03:20:11', 1),
(11, 'FBSMD', 'FB Sumedang', 'Sumedang', 5, '2012-12-20 00:00:00', '2013-02-22 03:20:49', 1, '2013-02-22 03:21:50', 1),
(12, 'FBTMY', 'FB Tasikmalaya', 'Tasikmalaya', 5, '2012-12-24 00:00:00', '2013-02-22 03:21:20', 1, '2013-02-22 03:21:20', 1),
(13, 'SPRCK', 'SP Rancaekek', 'Rancaekek', 11, '2012-12-26 00:00:00', '2013-02-22 03:22:36', 1, '2013-02-22 03:22:36', 1),
(14, 'SPCMS', 'SP Ciamis', 'Ciamis', 12, '2012-12-27 00:00:00', '2013-02-22 03:23:11', 1, '2013-02-22 03:23:11', 1),
(15, 'SPCJR', 'SP Cianjur', 'Cianjur', 4, '2012-11-28 00:00:00', '2013-02-22 03:23:46', 1, '2013-02-22 03:23:46', 1),
(16, 'FBMMJABAR', 'MM Jabar Cimareme ', 'Cimareme', 5, '2013-02-15 00:00:00', '2013-02-25 00:04:28', 1, '2013-02-25 00:04:48', 1),
(17, 'FBSMG', '', 'Jl. Raya Randu Garut Km 10 Walisongo, Semarang', 17, '2013-03-13 00:00:00', '2013-03-12 20:21:25', 2, '2013-03-12 20:41:53', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cabang_user_assignment`
--

CREATE TABLE IF NOT EXISTS `tbl_cabang_user_assignment` (
  `cabang_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cabang_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cabang_user_assignment`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_cabang_user_role`
--

CREATE TABLE IF NOT EXISTS `tbl_cabang_user_role` (
  `cabang_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`cabang_id`,`user_id`,`role`),
  KEY `user_id` (`user_id`),
  KEY `role` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cabang_user_role`
--

INSERT INTO `tbl_cabang_user_role` (`cabang_id`, `user_id`, `role`) VALUES
(1, 1, 'owner'),
(1, 2, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE IF NOT EXISTS `tbl_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`id`, `level`) VALUES
(1, 'Admin'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_license`
--

CREATE TABLE IF NOT EXISTS `tbl_license` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(128) DEFAULT NULL,
  `coa` varchar(128) DEFAULT NULL,
  `jenis` varchar(128) DEFAULT NULL,
  `mesin_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mesin_id` (`mesin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=384 ;

--
-- Dumping data for table `tbl_license`
--

INSERT INTO `tbl_license` (`id`, `Description`, `coa`, `jenis`, `mesin_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'Microsoft Office Single Image 2010', 'P9FQ6-MR8DC-Y9YCK-PFC6Q-VF7XJ', 'taken from SIW File', 4, '2013-02-20 00:13:25', 1, '2013-02-20 00:13:25', 1),
(2, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'PXTKQ-WC3GW-JY42B-866HW-J7FF2', 'taken from SIW File', 4, '2013-02-20 00:13:25', 1, '2013-02-20 00:13:25', 1),
(3, 'Microsoft Office Standard Edition 2003', 'M6FH3-WTQWH-YYBD2-P6TWG-G9MQ8', 'taken from SIW File', 5, '2013-02-20 00:13:56', 1, '2013-02-20 00:13:56', 1),
(4, '<TD>Windows XP Personal Service Pack 2</TD>', 'PTH9D-C74BC-DTPPP-X9CMX-CRH8T', 'taken from SIW File', 5, '2013-02-20 00:13:58', 1, '2013-02-20 00:13:58', 1),
(5, '<TD>Windows XP Professional Service Pack 3</TD>', 'TT7P7-Y3VWF-YJ2JP-CDW9B-D6888', 'taken from SIW File', 6, '2013-02-20 00:14:39', 1, '2013-02-20 00:14:39', 1),
(6, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 7, '2013-02-20 00:17:14', 1, '2013-02-20 00:17:14', 1),
(7, '<TD>Windows XP Personal Service Pack 3</TD>', 'TBMPF-FRDDR-PYXMB-C4QTQ-7QY9D', 'taken from SIW File', 7, '2013-02-20 00:17:14', 1, '2013-02-20 00:17:14', 1),
(9, '<TD>Windows XP Personal Service Pack 3</TD>', 'MDCQJ-2FJJW-M9RM4-YGCHP-DRDKB', 'taken from SIW File', 9, '2013-02-20 00:18:43', 1, '2013-02-20 00:18:43', 1),
(13, 'Microsoft Office Professional Enterprise Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 11, '2013-02-20 00:19:20', 1, '2013-02-20 00:19:20', 1),
(14, '<TD>Windows XP Personal Service Pack 2</TD>', 'RCGFR-WRRVR-B4KXJ-HQCBV-4JD8Q', 'taken from SIW File', 11, '2013-02-20 00:19:20', 1, '2013-02-20 00:19:20', 1),
(15, 'Microsoft Office Single Image 2010', 'BD82R-PB4J4-82YHW-G3HC6-PBDFM', 'taken from SIW File', 12, '2013-02-20 00:19:31', 1, '2013-02-20 00:19:31', 1),
(16, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'TT3PR-K6WKR-YT9QV-6QTYX-XWGQD', 'taken from SIW File', 12, '2013-02-20 00:19:31', 1, '2013-02-20 00:19:31', 1),
(17, 'Microsoft Office Single Image 2010', 'VTJTH-4TCRJ-VTPCG-XYHWQ-8P8YY', 'taken from SIW File', 13, '2013-02-20 00:19:49', 1, '2013-02-20 00:19:49', 1),
(18, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'Q6TFF-W62XF-9M6K3-YFK7F-J8CKB', 'taken from SIW File', 13, '2013-02-20 00:19:49', 1, '2013-02-20 00:19:49', 1),
(19, 'Microsoft Office Standard Edition 2003', 'B8RH3-GQPWW-6J82M-GPWQV-2PFD6', 'taken from SIW File', 14, '2013-02-20 00:20:18', 1, '2013-02-20 00:20:18', 1),
(20, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 14, '2013-02-20 00:20:18', 1, '2013-02-20 00:20:18', 1),
(21, 'Microsoft Office Standard Edition 2003', 'V9684-FYHKG-VHPFC-DX6M3-D9MQ8', 'taken from SIW File', 15, '2013-02-20 00:20:44', 1, '2013-02-20 00:20:44', 1),
(22, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 15, '2013-02-20 00:20:44', 1, '2013-02-20 00:20:44', 1),
(23, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 16, '2013-02-20 00:21:04', 1, '2013-02-20 00:21:04', 1),
(24, '<TD>Windows XP Professional Service Pack 2</TD>', 'PWX44-WGRMP-C9GYR-GQC3M-TMMXQ', 'taken from SIW File', 17, '2013-02-20 00:21:29', 1, '2013-02-20 00:21:29', 1),
(25, '<TD>Windows XP Personal Service Pack 2</TD>', 'M7YMF-GK2PF-CCTHC-H3BR9-7T6KB', 'taken from SIW File', 18, '2013-02-20 00:21:46', 1, '2013-02-20 00:21:46', 1),
(26, 'Microsoft Office Standard Edition 2003', 'QTMWR-69B7M-XG7FC-MXJYH-3RMQ6', 'taken from SIW File', 19, '2013-02-20 00:22:02', 1, '2013-02-20 00:22:02', 1),
(27, '<TD>Windows XP Personal Service Pack 2</TD>', 'KVFXP-FQBYF-HTWR9-XT2RD-XPYP8', 'taken from SIW File', 19, '2013-02-20 00:22:02', 1, '2013-02-20 00:22:02', 1),
(28, '<TD>Windows XP Personal Service Pack 2</TD>', 'WDCG4-7CDCP-FVCHH-JQYMX-6PXHW', 'taken from SIW File', 20, '2013-02-20 00:22:20', 1, '2013-02-20 00:22:20', 1),
(29, '<TD>Windows XP Personal Service Pack 2</TD>', 'TBMPF-FRDDR-PYXMB-C4QTQ-7QY9D', 'taken from SIW File', 21, '2013-02-20 00:22:36', 1, '2013-02-20 00:22:36', 1),
(30, '<TD>Windows XP Personal Service Pack 2</TD>', 'XJ728-PRHH4-7BC4P-R6H4X-RJQHY', 'taken from SIW File', 22, '2013-02-20 00:22:51', 1, '2013-02-20 00:22:51', 1),
(31, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 24, '2013-02-20 00:23:21', 1, '2013-02-20 00:23:21', 1),
(32, '<TD>Windows XP Personal Service Pack 3</TD>', 'JH282-D9CHB-DGJP7-PM38V-649MB', 'taken from SIW File', 24, '2013-02-20 00:23:21', 1, '2013-02-20 00:23:21', 1),
(37, '<TD>Windows XP Personal Service Pack 2</TD>', 'BW7GG-GFKH2-BJGWQ-2THVK-XQCQ8', 'taken from SIW File', 27, '2013-02-20 00:24:09', 1, '2013-02-20 00:24:09', 1),
(38, 'Microsoft Office Standard Edition 2003', 'HD9T3-JYWCV-227HW-3TWC3-4XMQ8', 'taken from SIW File', 28, '2013-02-20 00:24:28', 1, '2013-02-20 00:24:28', 1),
(39, '<TD>Windows XP Professional Service Pack 3</TD>', 'BWG2K-WX8F4-YJVJQ-FQMT7-DHH4T', 'taken from SIW File', 28, '2013-02-20 00:24:28', 1, '2013-02-20 00:24:28', 1),
(40, 'Microsoft Office Standard Edition 2003', 'T7KJH-VVYWH-8WWMH-M9GTQ-2TDHY', 'taken from SIW File', 29, '2013-02-20 00:24:47', 1, '2013-02-20 00:24:47', 1),
(41, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'J9DXP-9TX4V-KX9KH-9TKQT-FWP3X', 'taken from SIW File', 29, '2013-02-20 00:24:47', 1, '2013-02-20 00:24:47', 1),
(42, '<TD>Windows XP Personal Service Pack 2</TD>', 'F4J98-TY9J9-WTRW7-82VGG-X386J', 'taken from SIW File', 30, '2013-02-20 00:25:04', 1, '2013-02-20 00:25:04', 1),
(43, '<TD>Windows XP Professional Service Pack 3</TD>', 'CGQQQ-Q7B3H-PQR34-X6QPC-W7BRG', 'taken from SIW File', 31, '2013-02-20 00:25:21', 1, '2013-02-20 00:25:21', 1),
(44, '<TD>Windows XP Personal Service Pack 2</TD>', 'MH948-7F84F-9MX72-JCV43-TTT63', 'taken from SIW File', 33, '2013-02-20 00:25:47', 1, '2013-02-20 00:25:47', 1),
(49, '<TD>Windows XP Personal Service Pack 2</TD>', 'D78JR-7773D-DD9KB-26XMW-Y4V9Q', 'taken from SIW File', 36, '2013-02-20 00:26:41', 1, '2013-02-20 00:26:41', 1),
(50, 'Microsoft Office Small Business Edition 2003', 'TGFCX-CQHDB-PQPG3-G37BF-VVW7B', 'taken from SIW File', 35, '2013-02-20 00:28:04', 1, '2013-02-20 00:28:04', 1),
(51, '<TD>Windows XP Personal Service Pack 2</TD>', 'D3MM6-F9MWC-DGB89-89869-HTFWW', 'taken from SIW File', 35, '2013-02-20 00:28:04', 1, '2013-02-20 00:28:04', 1),
(54, '<TD>Windows XP Personal Service Pack 2</TD>', 'CVW6G-9WDF3-4VXTG-GVJHT-CKMFD', 'taken from SIW File', 38, '2013-02-20 00:29:01', 1, '2013-02-20 00:29:01', 1),
(55, 'Microsoft Office Standard Edition 2003', 'G4WDX-XHV6H-2GDMG-K7XGX-MD738', 'taken from SIW File', 39, '2013-02-20 00:29:19', 1, '2013-02-20 00:29:19', 1),
(56, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'C3DRH-M79JP-4HDX6-DBDTP-6VMT2', 'taken from SIW File', 39, '2013-02-20 00:29:19', 1, '2013-02-20 00:29:19', 1),
(57, '<TD>Windows XP Personal Service Pack 2</TD>', 'PRWDW-W3TXC-TBXFX-BMDFT-CV3KG', 'taken from SIW File', 40, '2013-02-20 00:29:36', 1, '2013-02-20 00:29:36', 1),
(58, '<TD>Windows XP Professional Service Pack 2</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 41, '2013-02-20 00:29:57', 1, '2013-02-20 00:29:57', 1),
(59, 'Microsoft Office Single Image 2010', 'XBFBX-9QJWY-X3X7F-3YKFQ-C2MC3', 'taken from SIW File', 42, '2013-02-20 00:30:28', 1, '2013-02-20 00:30:28', 1),
(60, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'GM3PC-V6VH9-CD67B-GPGRB-29FGY', 'taken from SIW File', 42, '2013-02-20 00:30:28', 1, '2013-02-20 00:30:28', 1),
(61, '<TD>Windows XP Personal Service Pack 2</TD>', 'TYM98-QTJ4Y-D7QD9-4B7V6-QHRFJ', 'taken from SIW File', 43, '2013-02-20 00:30:47', 1, '2013-02-20 00:30:47', 1),
(62, 'Microsoft Office Standard Edition 2003', 'CYFG2-RHHDC-P72WD-CFFHW-9B6BJ', 'taken from SIW File', 44, '2013-02-20 00:31:12', 1, '2013-02-20 00:31:12', 1),
(63, '<TD>Windows XP Personal Service Pack 2</TD>', 'WQVKY-HC6PG-JRQ8W-G74X3-JDXKW', 'taken from SIW File', 44, '2013-02-20 00:31:12', 1, '2013-02-20 00:31:12', 1),
(64, '<TD>Windows XP Personal Service Pack 2</TD>', 'WJ8FT-V2W48-WYHPP-H6V87-2G6TJ', 'taken from SIW File', 45, '2013-02-20 00:31:41', 1, '2013-02-20 00:31:41', 1),
(66, 'Microsoft Office Standard Edition 2003', 'FVKTQ-CDTCH-BVBFB-CYFBH-DP67W', 'taken from SIW File', 34, '2013-02-20 00:32:51', 1, '2013-02-20 00:32:51', 1),
(67, '<TD>Windows XP Personal Service Pack 2</TD>', 'MXWWT-GGRXQ-WPWKC-QVCWQ-D86QG', 'taken from SIW File', 34, '2013-02-20 00:32:51', 1, '2013-02-20 00:32:51', 1),
(74, 'Microsoft Office Standard Edition 2003', 'D8GDR-K6W8W-RG87B-2Y4W2-Q44D3', 'taken from SIW File', 26, '2013-02-20 17:54:24', 1, '2013-02-20 17:54:24', 1),
(75, '<TD>Windows XP Personal Service Pack 2</TD>', 'RX3MD-6WGB3-4DKX4-XDT39-J2T2J', 'taken from SIW File', 26, '2013-02-20 17:54:24', 1, '2013-02-20 17:54:24', 1),
(76, '<TD>Windows XP Personal Service Pack 2</TD>', 'V8DD8-VRQQ9-CH3FK-TBWMP-KQHCJ', 'taken from SIW File', 25, '2013-02-20 17:55:29', 1, '2013-02-20 17:55:29', 1),
(77, '<TD>Windows XP Personal Service Pack 2</TD>', 'MDDPD-F3H7Y-F8DGV-J6YDF-8P7R3', 'taken from SIW File', 46, '2013-02-20 18:03:03', 1, '2013-02-20 18:03:03', 1),
(78, '<TD>Windows XP Personal Service Pack 2</TD>', 'CVW6G-9WDF3-4VXTG-GVJHT-CKMFD', 'taken from SIW File', 37, '2013-02-20 19:05:56', 1, '2013-02-20 19:05:56', 1),
(79, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 32, '2013-02-20 19:06:47', 1, '2013-02-20 19:06:47', 1),
(80, '<TD>Windows XP Professional Service Pack 3</TD>', 'XP8BF-F8HPF-PY6BX-K24PJ-TWT6M', 'taken from SIW File', 8, '2013-02-20 19:35:47', 1, '2013-02-20 19:35:47', 1),
(81, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 10, '2013-02-20 19:36:32', 1, '2013-02-20 19:36:32', 1),
(82, 'Microsoft Office Standard Edition 2003', 'FW9RD-MXBPT-VVCDQ-M679W-J8RD8', 'taken from SIW File', 10, '2013-02-20 19:36:32', 1, '2013-02-20 19:36:32', 1),
(83, '<TD>Windows XP Personal Service Pack 2</TD>', 'C3GKK-3MM4F-WXFCY-2CWBY-FCDCW', 'taken from SIW File', 10, '2013-02-20 19:36:32', 1, '2013-02-20 19:36:32', 1),
(87, 'Microsoft Office Outlook Connector 1.0', '95140000-007A-0409-0000-0000000FF1CE', 'taken from SIW File', 47, '2013-02-22 19:01:28', 1, '2013-02-22 19:01:28', 1),
(88, 'Microsoft Office Single Image 2010', 'C4GYH-GD22M-YV2JR-2XTYB-H7YG6', 'taken from SIW File', 47, '2013-02-22 19:01:28', 1, '2013-02-22 19:01:28', 1),
(89, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'FBR9R-K7GHK-PX6R7-7KPFQ-MW3YR', 'taken from SIW File', 47, '2013-02-22 19:01:28', 1, '2013-02-22 19:01:28', 1),
(90, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 48, '2013-02-22 19:01:43', 1, '2013-02-22 19:01:43', 1),
(91, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 48, '2013-02-22 19:01:43', 1, '2013-02-22 19:01:43', 1),
(92, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 49, '2013-02-22 19:02:24', 1, '2013-02-22 19:02:24', 1),
(93, '<TD>Windows XP Personal Service Pack 3</TD>', 'MYVG2-YQ36V-X4TVW-M47QC-46GQM', 'taken from SIW File', 49, '2013-02-22 19:02:24', 1, '2013-02-22 19:02:24', 1),
(94, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 50, '2013-02-22 19:02:47', 1, '2013-02-22 19:02:47', 1),
(95, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 50, '2013-02-22 19:02:47', 1, '2013-02-22 19:02:47', 1),
(96, 'Microsoft Office Standard Edition 2003', 'HD9T3-JYWCV-227HW-3TWC3-4XMQ8', 'taken from SIW File', 51, '2013-02-22 19:03:11', 1, '2013-02-22 19:03:11', 1),
(97, '<TD>Windows XP Personal Service Pack 2</TD>', 'HJVG8-Q7BJG-8D8G9-BW4HF-KM27Y', 'taken from SIW File', 51, '2013-02-22 19:03:11', 1, '2013-02-22 19:03:11', 1),
(98, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 52, '2013-02-22 19:03:31', 1, '2013-02-22 19:03:31', 1),
(99, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 52, '2013-02-22 19:03:31', 1, '2013-02-22 19:03:31', 1),
(100, 'Microsoft Office Professional Plus 2010', 'VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB', 'taken from SIW File', 53, '2013-02-22 19:03:55', 1, '2013-02-22 19:03:55', 1),
(101, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 53, '2013-02-22 19:03:55', 1, '2013-02-22 19:03:55', 1),
(102, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 53, '2013-02-22 19:03:55', 1, '2013-02-22 19:03:55', 1),
(103, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 54, '2013-02-22 19:04:22', 1, '2013-02-22 19:04:22', 1),
(104, 'Microsoft Office Professional Plus 2010', 'BDD3G-XM7FB-BD2HM-YK63V-VQFDK', 'taken from SIW File', 55, '2013-02-22 19:04:48', 1, '2013-02-22 19:04:48', 1),
(105, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 55, '2013-02-22 19:04:48', 1, '2013-02-22 19:04:48', 1),
(106, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 56, '2013-02-22 19:05:10', 1, '2013-02-22 19:05:10', 1),
(107, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 56, '2013-02-22 19:05:10', 1, '2013-02-22 19:05:10', 1),
(108, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'KHDHP-3CXP7-7FCVJ-BDWVH-JPR7X', 'taken from SIW File', 57, '2013-02-22 19:05:33', 1, '2013-02-22 19:05:33', 1),
(109, 'Microsoft Office Professional Plus 2012 Trial', 'VTXJ3-893R6-2RP8K-Q6X7H-XD3GT', 'taken from SIW File', 58, '2013-02-22 19:06:02', 1, '2013-02-22 19:06:02', 1),
(110, 'Microsoft Office Single Image 2010', '9FY33-QFK4C-MWXFC-93YHY-VQKVC', 'taken from SIW File', 58, '2013-02-22 19:06:02', 1, '2013-02-22 19:06:02', 1),
(111, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'CQ438-QYCVY-68QVV-THQCY-6JX9K', 'taken from SIW File', 58, '2013-02-22 19:06:02', 1, '2013-02-22 19:06:02', 1),
(112, 'Microsoft Office Professional Plus 2010', 'BDD3G-XM7FB-BD2HM-YK63V-VQFDK', 'taken from SIW File', 59, '2013-02-22 19:06:16', 1, '2013-02-22 19:06:16', 1),
(113, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 59, '2013-02-22 19:06:16', 1, '2013-02-22 19:06:16', 1),
(114, '<TD>Windows 7 Ultimate Service Pack 1 (OEM:SLP)</TD>', '2Y4WT-DHTBF-Q6MMK-KYK6X-VKM6G', 'taken from SIW File', 59, '2013-02-22 19:06:16', 1, '2013-02-22 19:06:16', 1),
(115, '<TD>Windows XP Professional Service Pack 2</TD>', 'CT27D-M77R9-GRF3K-V7CQ3-J9XQ3', 'taken from SIW File', 60, '2013-02-24 22:57:52', 1, '2013-02-24 22:57:52', 1),
(116, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 61, '2013-02-24 23:01:50', 1, '2013-02-24 23:01:50', 1),
(117, '<TD>Windows XP Personal Service Pack 3</TD>', 'WGCH2-MJMR7-KRWDY-PH8YD-XTW3Y', 'taken from SIW File', 61, '2013-02-24 23:01:50', 1, '2013-02-24 23:01:50', 1),
(118, '<TD>Windows XP Professional Service Pack 2</TD>', 'G4TWX-MJHFC-JX47K-WP7T7-77VR6', 'taken from SIW File', 62, '2013-02-24 23:05:03', 1, '2013-02-24 23:05:03', 1),
(119, '<TD>Windows XP Professional Service Pack 2</TD>', 'KGMFH-6GVBR-HY4V9-43T92-62D33', 'taken from SIW File', 63, '2013-02-24 23:07:51', 1, '2013-02-24 23:07:51', 1),
(120, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 64, '2013-02-24 23:10:16', 1, '2013-02-24 23:10:16', 1),
(121, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 64, '2013-02-24 23:10:16', 1, '2013-02-24 23:10:16', 1),
(122, 'Microsoft Office Standard Edition 2003', 'JK86Y-X3KKT-QXDXP-7P9YC-TY6BM', 'taken from SIW File', 65, '2013-02-24 23:11:09', 1, '2013-02-24 23:11:09', 1),
(123, '<TD>Windows XP Professional Service Pack 2</TD>', 'D3JWK-WJFF2-YBJWV-HKTJQ-36CPQ', 'taken from SIW File', 65, '2013-02-24 23:11:09', 1, '2013-02-24 23:11:09', 1),
(124, '<TD>Windows XP Professional Service Pack 2</TD>', 'CT27D-M77R9-GRF3K-V7CQ3-J9XQ3', 'taken from SIW File', 66, '2013-02-24 23:24:01', 1, '2013-02-24 23:24:01', 1),
(125, '<TD>Windows XP Personal Service Pack 2</TD>', 'VB4D6-KTVJ3-CGQPH-XB33V-J7TC3', 'taken from SIW File', 67, '2013-02-24 23:30:45', 1, '2013-02-24 23:30:45', 1),
(126, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 68, '2013-02-24 23:32:01', 1, '2013-02-24 23:32:01', 1),
(127, '<TD>Windows XP Personal Service Pack 2</TD>', 'H9R3V-YT7KC-38K2Q-8B3PK-PR8YM', 'taken from SIW File', 68, '2013-02-24 23:32:01', 1, '2013-02-24 23:32:01', 1),
(128, '<TD>Windows XP Professional Service Pack 2</TD>', 'F3JBB-FVJKM-9692Y-9YJDG-CXWK3', 'taken from SIW File', 69, '2013-02-24 23:32:26', 1, '2013-02-24 23:32:26', 1),
(129, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 70, '2013-02-24 23:32:59', 1, '2013-02-24 23:32:59', 1),
(130, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 70, '2013-02-24 23:32:59', 1, '2013-02-24 23:32:59', 1),
(131, 'Microsoft Office Standard 2007', 'HRQ6C-6YW49-RB329-J2W37-9WTBT', 'taken from SIW File', 70, '2013-02-24 23:32:59', 1, '2013-02-24 23:32:59', 1),
(132, 'Microsoft Office Standard Edition 2003', 'PFHCK-8WRW6-VPHVW-J4KB8-4BH4B', 'taken from SIW File', 70, '2013-02-24 23:32:59', 1, '2013-02-24 23:32:59', 1),
(133, '<TD>Windows XP Personal Service Pack 2</TD>', 'M8KVH-MD2HP-MPFVF-HF8VW-GR74J', 'taken from SIW File', 70, '2013-02-24 23:32:59', 1, '2013-02-24 23:32:59', 1),
(134, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 71, '2013-02-24 23:33:24', 1, '2013-02-24 23:33:24', 1),
(135, '<TD>Windows XP Personal Service Pack 2</TD>', 'QBQMJ-XVR32-TTK8M-TJR93-8DDWG', 'taken from SIW File', 71, '2013-02-24 23:33:24', 1, '2013-02-24 23:33:24', 1),
(136, 'Microsoft Office Single Image 2010', 'P8XGG-472F8-D3V3J-G92GD-TKJFD', 'taken from SIW File', 72, '2013-02-24 23:33:53', 1, '2013-02-24 23:33:53', 1),
(137, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'GFH7D-TX6TT-3DYV6-YQCTK-J7DX8', 'taken from SIW File', 72, '2013-02-24 23:33:53', 1, '2013-02-24 23:33:53', 1),
(138, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 73, '2013-02-24 23:34:17', 1, '2013-02-24 23:34:17', 1),
(139, '<TD>Windows XP Professional Service Pack 2</TD>', 'XP8BF-F8HPF-PY6BX-K24PJ-TWT6M', 'taken from SIW File', 73, '2013-02-24 23:34:17', 1, '2013-02-24 23:34:17', 1),
(140, '<TD>Windows XP Professional Service Pack 2</TD>', 'BWFTJ-KXYBG-36WKH-TGBJ2-QQTBD', 'taken from SIW File', 74, '2013-02-24 23:34:44', 1, '2013-02-24 23:34:44', 1),
(141, 'Microsoft Office Single Image 2010', 'Q6YJ7-P3TM7-M7BWC-GHGYJ-B9HF3', 'taken from SIW File', 75, '2013-02-24 23:35:30', 1, '2013-02-24 23:35:30', 1),
(142, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'HMMFK-YHDPQ-CQMT7-BCCV2-F242Y', 'taken from SIW File', 75, '2013-02-24 23:35:30', 1, '2013-02-24 23:35:30', 1),
(143, 'Microsoft Office Standard Edition 2003', 'FYGC8-7KBGJ-F7PBB-8WCTC-KM9VY', 'taken from SIW File', 76, '2013-02-24 23:35:56', 1, '2013-02-24 23:35:56', 1),
(144, '<TD>Windows XP Personal Service Pack 3</TD>', 'R7833-K7DWP-K64MH-8RKFJ-FQQD6', 'taken from SIW File', 76, '2013-02-24 23:35:56', 1, '2013-02-24 23:35:56', 1),
(145, 'Microsoft Office Single Image 2010', 'D9WMD-Q3WBX-VH3VJ-9RXVX-G2GC4', 'taken from SIW File', 77, '2013-02-24 23:36:06', 1, '2013-02-24 23:36:06', 1),
(146, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '773TD-732Y7-87DKT-4HRFD-6QR27', 'taken from SIW File', 77, '2013-02-24 23:36:06', 1, '2013-02-24 23:36:06', 1),
(147, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 78, '2013-02-24 23:36:25', 1, '2013-02-24 23:36:25', 1),
(148, '<TD>Windows XP Professional Service Pack 2</TD>', 'GCXQB-843YB-QCFM6-BT36Y-9PBJG', 'taken from SIW File', 78, '2013-02-24 23:36:25', 1, '2013-02-24 23:36:25', 1),
(149, 'Microsoft Office Standard Edition 2003', 'VV9GG-3G82Y-84WP9-M483B-KJ3HW', 'taken from SIW File', 80, '2013-02-24 23:36:53', 1, '2013-02-24 23:36:53', 1),
(150, '<TD>Windows XP Professional Service Pack 3</TD>', 'HCQF2-DKK8R-KQT26-Q6T8K-J3M2B', 'taken from SIW File', 80, '2013-02-24 23:36:53', 1, '2013-02-24 23:36:53', 1),
(151, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 81, '2013-02-24 23:37:03', 1, '2013-02-24 23:37:03', 1),
(152, '<TD>Windows XP Personal Service Pack 2</TD>', 'RVHF4-T86YK-4WK3M-P7DBJ-R7GMD', 'taken from SIW File', 81, '2013-02-24 23:37:03', 1, '2013-02-24 23:37:03', 1),
(153, '<TD>Windows XP Professional Service Pack 2</TD>', 'FWP9R-DTD3T-XC2YG-T6QP7-YCFCJ', 'taken from SIW File', 82, '2013-02-24 23:48:10', 1, '2013-02-24 23:48:10', 1),
(154, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 83, '2013-02-24 23:48:25', 1, '2013-02-24 23:48:25', 1),
(155, '<TD>Windows XP Professional Service Pack 2</TD>', 'XM3MQ-F33JF-JT62H-G74TY-3QRMD', 'taken from SIW File', 84, '2013-02-24 23:48:38', 1, '2013-02-24 23:48:38', 1),
(156, '<TD>Windows XP Professional Service Pack 2</TD>', 'PFQ26-3R34B-W79RW-G2HKC-DJ4YB', 'taken from SIW File', 85, '2013-02-24 23:48:49', 1, '2013-02-24 23:48:49', 1),
(157, '<TD>Windows XP Professional Service Pack 2</TD>', 'V3JG7-FF9Y8-2FJCW-DDBJF-3J49Y', 'taken from SIW File', 86, '2013-02-24 23:49:03', 1, '2013-02-24 23:49:03', 1),
(158, 'Microsoft Office Small Business Edition 2003', 'XDWXM-D44RP-FXJC6-43WVT-3QMYJ', 'taken from SIW File', 87, '2013-02-24 23:49:17', 1, '2013-02-24 23:49:17', 1),
(159, '<TD>Windows XP Personal Service Pack 3</TD>', 'GB4XY-X6CYK-MCB22-68384-7JGM6', 'taken from SIW File', 87, '2013-02-24 23:49:17', 1, '2013-02-24 23:49:17', 1),
(160, 'Microsoft Office Professional Hybrid 2007', 'MX476-JG77M-3WV68-77H97-M9KYG', 'taken from SIW File', 88, '2013-02-24 23:49:28', 1, '2013-02-24 23:49:28', 1),
(161, 'Microsoft Office Small Business Edition 2003', 'XDWXM-D44RP-FXJC6-43WVT-3QMYJ', 'taken from SIW File', 88, '2013-02-24 23:49:28', 1, '2013-02-24 23:49:28', 1),
(162, '<TD>Windows XP Professional Service Pack 2</TD>', 'CPK62-FM8KD-8GJVC-BP8K9-TFPXB', 'taken from SIW File', 88, '2013-02-24 23:49:28', 1, '2013-02-24 23:49:28', 1),
(163, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 90, '2013-02-24 23:50:05', 1, '2013-02-24 23:50:05', 1),
(164, 'Microsoft Office Professional Hybrid 2007', 'TD3MQ-WK6Y6-G6K4W-6T6JQ-RCVBG', 'taken from SIW File', 91, '2013-02-24 23:50:19', 1, '2013-02-24 23:50:19', 1),
(165, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 91, '2013-02-24 23:50:19', 1, '2013-02-24 23:50:19', 1),
(166, '<TD>Windows XP Personal Service Pack 2</TD>', 'RPD37-YV33Q-H8J8K-24DJC-PTB4D', 'taken from SIW File', 92, '2013-02-24 23:50:27', 1, '2013-02-24 23:50:27', 1),
(167, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 93, '2013-02-24 23:54:29', 1, '2013-02-24 23:54:29', 1),
(168, '<TD>Windows XP Professional Service Pack 2</TD>', 'Q2JFD-MMBRH-T8V49-JPW27-V24DJ', 'taken from SIW File', 93, '2013-02-24 23:54:29', 1, '2013-02-24 23:54:29', 1),
(169, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '22GY2-WF9XP-4K86T-GQ3MW-333KM', 'taken from SIW File', 94, '2013-02-24 23:54:41', 1, '2013-02-24 23:54:41', 1),
(170, '<TD>Windows XP Personal Service Pack 2</TD>', 'GTD9R-K3TG6-72326-G8CT6-K9QBG', 'taken from SIW File', 95, '2013-02-24 23:54:53', 1, '2013-02-24 23:54:53', 1),
(171, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 96, '2013-02-24 23:55:09', 1, '2013-02-24 23:55:09', 1),
(172, '<TD>Windows XP Personal Service Pack 2</TD>', 'XKV39-HPW8Y-BQBKW-BGJWW-WP8BD', 'taken from SIW File', 96, '2013-02-24 23:55:09', 1, '2013-02-24 23:55:09', 1),
(174, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 97, '2013-02-24 23:56:37', 1, '2013-02-24 23:56:37', 1),
(175, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 98, '2013-02-24 23:59:31', 1, '2013-02-24 23:59:31', 1),
(176, '<TD>Windows XP Professional Service Pack 2</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 98, '2013-02-24 23:59:31', 1, '2013-02-24 23:59:31', 1),
(177, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 99, '2013-02-25 00:00:39', 1, '2013-02-25 00:00:39', 1),
(178, '<TD>Windows XP Professional Service Pack 2</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 99, '2013-02-25 00:00:39', 1, '2013-02-25 00:00:39', 1),
(179, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 100, '2013-02-25 00:00:51', 1, '2013-02-25 00:00:51', 1),
(180, '<TD>Windows XP Professional Service Pack 3</TD>', 'MR49R-DRJXX-M6PX2-V96BF-8CKBJ', 'taken from SIW File', 100, '2013-02-25 00:00:51', 1, '2013-02-25 00:00:51', 1),
(181, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 101, '2013-02-25 00:01:04', 1, '2013-02-25 00:01:04', 1),
(182, '<TD>Windows XP Professional Service Pack 2</TD>', 'XP8BF-F8HPF-PY6BX-K24PJ-TWT6M', 'taken from SIW File', 101, '2013-02-25 00:01:04', 1, '2013-02-25 00:01:04', 1),
(183, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 102, '2013-02-25 00:01:24', 1, '2013-02-25 00:01:24', 1),
(184, '<TD>Windows XP Professional Service Pack 3</TD>', 'GMCQ7-XWVY3-PWRCB-69B22-7MKBW', 'taken from SIW File', 102, '2013-02-25 00:01:24', 1, '2013-02-25 00:01:24', 1),
(185, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 103, '2013-02-25 00:01:34', 1, '2013-02-25 00:01:34', 1),
(186, '<TD>Windows XP Personal Service Pack 2</TD>', 'QRBGK-Q2CMG-MH6H6-936YW-T494J', 'taken from SIW File', 103, '2013-02-25 00:01:34', 1, '2013-02-25 00:01:34', 1),
(187, 'Microsoft Office Standard Edition 2003', 'G4WDX-XHV6H-2GDMG-K7XGX-MD738', 'taken from SIW File', 104, '2013-02-25 00:01:48', 1, '2013-02-25 00:01:48', 1),
(188, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'W4HJV-F9BT4-B3FPM-YRGHQ-RGH3V', 'taken from SIW File', 104, '2013-02-25 00:01:48', 1, '2013-02-25 00:01:48', 1),
(189, '<TD>Windows XP Personal Service Pack 2</TD>', 'K9CPR-D7B2H-8MD4C-RK97V-FHC8M', 'taken from SIW File', 105, '2013-02-25 00:01:58', 1, '2013-02-25 00:01:58', 1),
(190, 'Microsoft Office Small Business Edition 2003', 'XDWXM-D44RP-FXJC6-43WVT-3QMYJ', 'taken from SIW File', 106, '2013-02-25 00:02:17', 1, '2013-02-25 00:02:17', 1),
(191, '<TD>Windows XP Professional Service Pack 2</TD>', 'BX447-X6CYT-YF93Q-4CQ2D-36F38', 'taken from SIW File', 106, '2013-02-25 00:02:17', 1, '2013-02-25 00:02:17', 1),
(192, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 107, '2013-02-25 00:02:28', 1, '2013-02-25 00:02:28', 1),
(193, '<TD>Windows XP Personal Service Pack 2</TD>', 'G4RH8-3PV9K-MHPPX-KTRRK-2MYDT', 'taken from SIW File', 107, '2013-02-25 00:02:28', 1, '2013-02-25 00:02:28', 1),
(194, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 108, '2013-02-25 00:02:43', 1, '2013-02-25 00:02:43', 1),
(195, 'Microsoft Office Standard Edition 2003', 'QWGH3-43TDJ-D4VMT-6P2CK-Q2QHW', 'taken from SIW File', 108, '2013-02-25 00:02:43', 1, '2013-02-25 00:02:43', 1),
(196, '<TD>Windows XP Professional Service Pack 3</TD>', 'BP49G-BGXCD-VYHM7-R9XPR-4YGGT', 'taken from SIW File', 108, '2013-02-25 00:02:43', 1, '2013-02-25 00:02:43', 1),
(197, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 109, '2013-02-25 00:02:55', 1, '2013-02-25 00:02:55', 1),
(198, 'Microsoft Office Standard Edition 2003', 'FW9RD-MXBPT-VVCDQ-M679W-J8RD8', 'taken from SIW File', 109, '2013-02-25 00:02:55', 1, '2013-02-25 00:02:55', 1),
(199, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '24GRT-PHVVW-6PRGX-D4D7C-P6W94', 'taken from SIW File', 109, '2013-02-25 00:02:55', 1, '2013-02-25 00:02:55', 1),
(205, 'Microsoft Office Professional Hybrid 2007', 'H3GGK-YK33R-K2GQX-7YQ7D-QJV7W', 'taken from SIW File', 112, '2013-02-25 00:18:52', 1, '2013-02-25 00:18:52', 1),
(206, '<TD>Windows 7 Home Premium Service Pack 1 (OEM:SLP)</TD>', '6B88K-KCCWY-4F8HK-M4P73-W8DQG', 'taken from SIW File', 112, '2013-02-25 00:18:52', 1, '2013-02-25 00:18:52', 1),
(207, 'Microsoft Office Small Business Edition 2003', 'WK39D-BD4W9-XBJ3V-BWJHF-8DCVT', 'taken from SIW File', 113, '2013-02-25 00:19:16', 1, '2013-02-25 00:19:16', 1),
(208, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 113, '2013-02-25 00:19:16', 1, '2013-02-25 00:19:16', 1),
(209, '<TD>Windows XP Professional Service Pack 2</TD>', 'B3J2H-87CFD-B8THQ-JYB7M-XDT9B', 'taken from SIW File', 113, '2013-02-25 00:19:16', 1, '2013-02-25 00:19:16', 1),
(210, 'Microsoft Office Small Business Edition 2003', 'TJCMY-9QK27-76TMF-BK9XK-X9938', 'taken from SIW File', 114, '2013-02-25 00:19:26', 1, '2013-02-25 00:19:26', 1),
(211, '<TD>Windows XP Personal Service Pack 2</TD>', 'WM82X-YFDGD-GKYBQ-6PKTX-QRP93', 'taken from SIW File', 114, '2013-02-25 00:19:26', 1, '2013-02-25 00:19:26', 1),
(212, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 115, '2013-02-25 00:20:01', 1, '2013-02-25 00:20:01', 1),
(213, 'Microsoft Office Small Business Edition 2003', 'P4CG7-8H63M-2K7Q9-88RF4-MRDQ8', 'taken from SIW File', 115, '2013-02-25 00:20:01', 1, '2013-02-25 00:20:01', 1),
(214, 'Microsoft Office Standard Edition 2003', 'RC2C4-3B9WM-7QK4X-R7GTY-294D8', 'taken from SIW File', 115, '2013-02-25 00:20:01', 1, '2013-02-25 00:20:01', 1),
(215, '<TD>Windows XP Personal Service Pack 3</TD>', 'PY7QG-3H7BX-BJ2Y9-HV63Q-YDFYT', 'taken from SIW File', 115, '2013-02-25 00:20:01', 1, '2013-02-25 00:20:01', 1),
(216, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 116, '2013-02-25 00:20:06', 1, '2013-02-25 00:20:06', 1),
(217, '<TD>Windows XP Professional Service Pack 2</TD>', 'JYJKR-2CHF4-HH3Q9-DFCJW-6PJBD', 'taken from SIW File', 117, '2013-02-25 00:20:24', 1, '2013-02-25 00:20:24', 1),
(218, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 118, '2013-02-25 00:20:44', 1, '2013-02-25 00:20:44', 1),
(219, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 118, '2013-02-25 00:20:44', 1, '2013-02-25 00:20:44', 1),
(220, '<TD>Windows XP Professional Service Pack 2</TD>', 'XTMTB-BJBM3-Y94XQ-KY7C7-7F9H8', 'taken from SIW File', 118, '2013-02-25 00:20:44', 1, '2013-02-25 00:20:44', 1),
(221, '<TD>Windows XP Personal Service Pack 2</TD>', 'F7KPX-44F4C-6CK4H-RHRPB-BPGGG', 'taken from SIW File', 119, '2013-02-25 00:20:54', 1, '2013-02-25 00:20:54', 1),
(222, 'Microsoft Office Single Image 2010', 'RGPQY-QPCXM-7JHKF-DGHTX-KJR8Q', 'taken from SIW File', 120, '2013-02-25 00:21:08', 1, '2013-02-25 00:21:08', 1),
(223, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '8XPDG-PJKYM-BKM9R-Q43PT-H9YWH', 'taken from SIW File', 120, '2013-02-25 00:21:08', 1, '2013-02-25 00:21:08', 1),
(224, 'Microsoft Office Standard Edition 2003', 'W7K6B-7M7WJ-BGT2Y-43XVW-FWGBM', 'taken from SIW File', 121, '2013-02-25 00:21:15', 1, '2013-02-25 00:21:15', 1),
(225, '<TD>Windows XP Professional Service Pack 2</TD>', 'GC9KM-GT22K-HWJ68-Y79QH-D8QR6', 'taken from SIW File', 121, '2013-02-25 00:21:15', 1, '2013-02-25 00:21:15', 1),
(226, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 122, '2013-02-25 00:21:33', 1, '2013-02-25 00:21:33', 1),
(227, '<TD>Windows XP Professional Service Pack 2</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 122, '2013-02-25 00:21:33', 1, '2013-02-25 00:21:33', 1),
(228, 'Microsoft Office Standard Edition 2003', 'T7KJH-VVYWH-8WWMH-M9GTQ-2TDHY', 'taken from SIW File', 123, '2013-02-25 00:21:46', 1, '2013-02-25 00:21:46', 1),
(229, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 123, '2013-02-25 00:21:46', 1, '2013-02-25 00:21:46', 1),
(230, 'Microsoft Office Small Business Edition 2003', 'RCCKK-MBGM6-9TV6P-4R4QV-JKPVW', 'taken from SIW File', 124, '2013-02-25 00:22:04', 1, '2013-02-25 00:22:04', 1),
(231, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 124, '2013-02-25 00:22:04', 1, '2013-02-25 00:22:04', 1),
(232, '<TD>Windows XP Professional Service Pack 3</TD>', 'K7XRK-C4MQ7-TJCVT-W6BXC-WQR4T', 'taken from SIW File', 124, '2013-02-25 00:22:04', 1, '2013-02-25 00:22:04', 1),
(233, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 125, '2013-02-25 00:22:12', 1, '2013-02-25 00:22:12', 1),
(234, 'Microsoft Office Small Business Edition 2003', 'J9XG8-G4BJM-28F9R-9633T-84DQ8', 'taken from SIW File', 126, '2013-02-25 00:22:33', 1, '2013-02-25 00:22:33', 1),
(235, '<TD>Windows XP Professional Service Pack 2</TD>', 'XJPKD-K24MP-XMMR3-QBMDF-G2XYB', 'taken from SIW File', 126, '2013-02-25 00:22:33', 1, '2013-02-25 00:22:33', 1),
(236, 'Microsoft Office Small Business Edition 2003', 'MCKVM-9KTXH-CWXBJ-THR9P-QX6HW', 'taken from SIW File', 127, '2013-02-25 00:22:44', 1, '2013-02-25 00:22:44', 1),
(237, '<TD>Windows XP Professional Service Pack 2</TD>', 'J6D93-GHKRB-WYFWH-D6XTG-GQVRJ', 'taken from SIW File', 127, '2013-02-25 00:22:44', 1, '2013-02-25 00:22:44', 1),
(239, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 130, '2013-02-25 00:23:21', 1, '2013-02-25 00:23:21', 1),
(240, '<TD>Windows XP Personal Service Pack 2</TD>', 'CRJ4W-MK73W-W96TR-MGWHH-QPQ6T', 'taken from SIW File', 130, '2013-02-25 00:23:21', 1, '2013-02-25 00:23:21', 1),
(241, '<TD>Windows XP Professional Service Pack 2</TD>', 'WRW8R-DD67Y-CV76Q-FY74P-C6X7D', 'taken from SIW File', 129, '2013-02-25 00:24:05', 1, '2013-02-25 00:24:05', 1),
(242, 'Microsoft Office Small Business Edition 2003', 'QJPXD-RPVMY-CWC8Q-DB44W-DF938', 'taken from SIW File', 131, '2013-02-25 00:24:19', 1, '2013-02-25 00:24:19', 1),
(243, '<TD>Windows XP Professional Service Pack 2</TD>', 'T6PCV-C2F8D-43C2K-2XMJ8-PC3GW', 'taken from SIW File', 131, '2013-02-25 00:24:19', 1, '2013-02-25 00:24:19', 1),
(244, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 132, '2013-02-25 00:24:33', 1, '2013-02-25 00:24:33', 1),
(245, 'Microsoft Office Small Business Edition 2003', 'P4CG7-8H63M-2K7Q9-88RF4-MRDQ8', 'taken from SIW File', 132, '2013-02-25 00:24:33', 1, '2013-02-25 00:24:33', 1),
(246, '<TD>Windows XP Personal Service Pack 2</TD>', 'QQKBK-J7TVP-2PF9K-YDFQ8-XW8DW', 'taken from SIW File', 132, '2013-02-25 00:24:33', 1, '2013-02-25 00:24:33', 1),
(247, 'Microsoft Office Standard Edition 2003', 'KT6QW-J2629-GCT36-RDRF2-K3GBJ', 'taken from SIW File', 134, '2013-02-25 00:24:55', 1, '2013-02-25 00:24:55', 1),
(248, '<TD>Windows XP Personal Service Pack 3</TD>', 'DVCGG-XVP6C-YH6RP-9QKPC-CGVGQ', 'taken from SIW File', 134, '2013-02-25 00:24:55', 1, '2013-02-25 00:24:55', 1),
(249, 'Microsoft Office Standard Edition 2003', 'FW9RD-MXBPT-VVCDQ-M679W-J8RD8', 'taken from SIW File', 135, '2013-02-25 00:25:11', 1, '2013-02-25 00:25:11', 1),
(250, '<TD>Windows XP Personal Service Pack 2</TD>', 'MVD6W-2GDCM-PXHHD-FDBW8-KX27W', 'taken from SIW File', 135, '2013-02-25 00:25:11', 1, '2013-02-25 00:25:11', 1),
(251, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 137, '2013-02-25 00:25:39', 1, '2013-02-25 00:25:39', 1),
(252, '<TD>Windows XP Personal Service Pack 2</TD>', 'C6VRR-473WW-9BGVB-VGDQQ-7WMF8', 'taken from SIW File', 137, '2013-02-25 00:25:39', 1, '2013-02-25 00:25:39', 1),
(253, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '6WJHY-G2XGT-CWJ3X-4CD8G-6DJM6', 'taken from SIW File', 138, '2013-02-25 00:25:51', 1, '2013-02-25 00:25:51', 1),
(254, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 139, '2013-02-25 00:29:21', 1, '2013-02-25 00:29:21', 1),
(255, '<TD>Windows XP Professional Service Pack 1</TD>', 'K4BYB-CDP9M-4MKG7-MM4Q2-VKFHB', 'taken from SIW File', 140, '2013-02-25 00:30:21', 1, '2013-02-25 00:30:21', 1),
(256, '<TD>Windows XP Personal Service Pack 2</TD>', 'MWHTK-4V8JV-93VGD-DTFKW-HH8KM', 'taken from SIW File', 141, '2013-02-25 00:30:41', 1, '2013-02-25 00:30:41', 1),
(257, '<TD>Windows XP Personal Service Pack 2</TD>', 'D78JR-7773D-DD9KB-26XMW-Y4V9Q', 'taken from SIW File', 142, '2013-02-25 00:48:49', 1, '2013-02-25 00:48:49', 1),
(258, '<TD>Windows XP Professional Service Pack 1</TD>', 'K4BYB-CDP9M-4MKG7-MM4Q2-VKFHB', 'taken from SIW File', 143, '2013-02-25 00:49:11', 1, '2013-02-25 00:49:11', 1),
(259, '<TD>Windows XP Personal Service Pack 2</TD>', 'QRQCD-74PM9-YT2QR-MJRCG-R6J8B', 'taken from SIW File', 144, '2013-02-25 00:49:19', 1, '2013-02-25 00:49:19', 1),
(260, '<TD>Windows XP Personal Service Pack 2</TD>', 'W9CRM-JPDBM-MWY7Q-XWKMY-XPWDJ', 'taken from SIW File', 145, '2013-02-25 00:49:39', 1, '2013-02-25 00:49:39', 1),
(261, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 146, '2013-02-25 00:49:47', 1, '2013-02-25 00:49:47', 1),
(262, '<TD>Windows XP Personal Service Pack 2</TD>', 'RHX82-44433-2JJ7H-6TW7M-6FPCB', 'taken from SIW File', 146, '2013-02-25 00:49:47', 1, '2013-02-25 00:49:47', 1),
(263, '<TD>Windows XP Professional Service Pack 3</TD>', 'JYX87-64V6T-WXCQT-6B8PW-6MBR6', 'taken from SIW File', 147, '2013-02-25 00:50:06', 1, '2013-02-25 00:50:06', 1),
(264, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 148, '2013-02-25 00:50:16', 1, '2013-02-25 00:50:16', 1),
(265, '<TD>Windows XP Personal Service Pack 2</TD>', 'D79GW-9MR97-24CPT-8466P-CGXBB', 'taken from SIW File', 148, '2013-02-25 00:50:16', 1, '2013-02-25 00:50:16', 1),
(266, 'Microsoft Office Standard Edition 2003', 'VVM22-XWFT9-C67V2-WF4QR-M22MJ', 'taken from SIW File', 149, '2013-02-25 00:50:27', 1, '2013-02-25 00:50:27', 1),
(267, '<TD>Windows XP Personal Service Pack 2</TD>', 'QM3T2-MBJH6-TB6BT-GHMD9-MYFJ6', 'taken from SIW File', 149, '2013-02-25 00:50:27', 1, '2013-02-25 00:50:27', 1),
(268, '<TD>Windows XP Personal Service Pack 2</TD>', 'BQTGB-DWQ3J-D9B6H-3VWG3-T3FCY', 'taken from SIW File', 150, '2013-02-25 00:50:39', 1, '2013-02-25 00:50:39', 1),
(269, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 151, '2013-02-25 00:51:12', 1, '2013-02-25 00:51:12', 1),
(274, 'Microsoft Office Single Image 2010', 'FFYCV-8CXP4-MXMDY-HGV67-K4PBH', 'taken from SIW File', 153, '2013-02-25 00:52:20', 1, '2013-02-25 00:52:20', 1),
(275, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'YRPMR-PMKGM-34YWV-6Q8DH-J8Q9F', 'taken from SIW File', 153, '2013-02-25 00:52:20', 1, '2013-02-25 00:52:20', 1),
(276, 'Microsoft Office Single Image 2010', 'YFTJR-3G2DG-3GX4B-PH8JD-C6YGD', 'taken from SIW File', 152, '2013-02-25 00:52:51', 1, '2013-02-25 00:52:51', 1),
(277, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'TC3RJ-RPJ7V-FXVX3-XJ2KX-729WJ', 'taken from SIW File', 152, '2013-02-25 00:52:51', 1, '2013-02-25 00:52:51', 1),
(278, 'Microsoft Office Single Image 2010', '76M7B-H7CCT-K4G6C-99G4M-XX9D9', 'taken from SIW File', 154, '2013-02-25 00:53:02', 1, '2013-02-25 00:53:02', 1),
(279, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '7XCTQ-9HR4F-BV8DW-CQRKC-MBGDR', 'taken from SIW File', 154, '2013-02-25 00:53:02', 1, '2013-02-25 00:53:02', 1),
(280, '<TD>Windows XP Professional Service Pack 3</TD>', 'HFB98-R8C4B-QQPM2-2BYKP-J4PWQ', 'taken from SIW File', 155, '2013-02-25 00:53:13', 1, '2013-02-25 00:53:13', 1),
(281, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 156, '2013-02-25 00:53:27', 1, '2013-02-25 00:53:27', 1),
(282, 'Microsoft Office Single Image 2010', 'P4YCC-4B74W-9RRPT-6TB66-RCRPR', 'taken from SIW File', 157, '2013-02-25 00:53:44', 1, '2013-02-25 00:53:44', 1),
(283, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '36PMJ-QV26D-JXMJV-WJTBQ-RXYRG', 'taken from SIW File', 157, '2013-02-25 00:53:44', 1, '2013-02-25 00:53:44', 1),
(284, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 158, '2013-02-25 00:54:00', 1, '2013-02-25 00:54:00', 1),
(285, '<TD>Windows XP Professional Service Pack 2</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 158, '2013-02-25 00:54:00', 1, '2013-02-25 00:54:00', 1),
(286, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 159, '2013-02-25 00:54:07', 1, '2013-02-25 00:54:07', 1),
(287, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'CX97Q-MFTVH-XQBPQ-D2H6G-DPJBX', 'taken from SIW File', 159, '2013-02-25 00:54:07', 1, '2013-02-25 00:54:07', 1),
(288, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '32F6B-TF66D-7R7CM-Y4GBP-D3H88', 'taken from SIW File', 160, '2013-02-25 00:54:19', 1, '2013-02-25 00:54:19', 1),
(289, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 161, '2013-02-25 00:54:37', 1, '2013-02-25 00:54:37', 1),
(290, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 163, '2013-02-25 00:55:02', 1, '2013-02-25 00:55:02', 1),
(291, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 164, '2013-02-25 00:55:16', 1, '2013-02-25 00:55:16', 1),
(292, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 165, '2013-02-25 00:55:27', 1, '2013-02-25 00:55:27', 1),
(293, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 166, '2013-02-25 00:55:41', 1, '2013-02-25 00:55:41', 1),
(294, 'Microsoft Office Single Image 2010', '6F3VT-7FGVD-Q7PHV-9GHWT-PCXB8', 'taken from SIW File', 167, '2013-02-25 00:55:54', 1, '2013-02-25 00:55:54', 1),
(295, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 167, '2013-02-25 00:55:54', 1, '2013-02-25 00:55:54', 1),
(296, '<TD>Windows XP Professional Service Pack 3</TD>', 'HFB98-R8C4B-QQPM2-2BYKP-J4PWQ', 'taken from SIW File', 168, '2013-02-25 00:56:20', 1, '2013-02-25 00:56:20', 1),
(297, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 169, '2013-02-25 00:56:34', 1, '2013-02-25 00:56:34', 1),
(298, 'Microsoft Office Single Image 2010', 'TRDMC-MYG97-FG7FK-PDC9K-79RGT', 'taken from SIW File', 170, '2013-02-25 00:56:43', 1, '2013-02-25 00:56:43', 1),
(299, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'TR2W8-KYHRH-FKRVK-VG94J-6QCB2', 'taken from SIW File', 170, '2013-02-25 00:56:43', 1, '2013-02-25 00:56:43', 1),
(300, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 171, '2013-02-25 00:57:04', 1, '2013-02-25 00:57:04', 1),
(301, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 172, '2013-02-25 00:57:34', 1, '2013-02-25 00:57:34', 1),
(302, '<TD>Windows XP Professional Service Pack 2</TD>', 'XP8BF-F8HPF-PY6BX-K24PJ-TWT6M', 'taken from SIW File', 172, '2013-02-25 00:57:34', 1, '2013-02-25 00:57:34', 1),
(303, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'MCC6D-CFHBW-6DVRT-3Y2FJ-WMCCF', 'taken from SIW File', 173, '2013-02-25 00:57:47', 1, '2013-02-25 00:57:47', 1),
(304, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 174, '2013-02-25 00:58:06', 1, '2013-02-25 00:58:06', 1),
(305, 'Microsoft Office Single Image 2010', 'FC6W3-GK8V3-4XXY7-Q228R-3TMK6', 'taken from SIW File', 175, '2013-02-25 00:58:22', 1, '2013-02-25 00:58:22', 1),
(306, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'FCB2W-3CRTH-Y9892-Q3DQ7-7W89W', 'taken from SIW File', 175, '2013-02-25 00:58:22', 1, '2013-02-25 00:58:22', 1),
(307, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'YM7Q2-3PFR3-KXQYC-J3TR6-X3JBB', 'taken from SIW File', 176, '2013-02-25 00:58:33', 1, '2013-02-25 00:58:33', 1),
(308, 'Microsoft Office Single Image 2010', 'YTDJC-D3YWR-QXBJK-KJFW3-724HY', 'taken from SIW File', 177, '2013-02-25 00:58:50', 1, '2013-02-25 00:58:50', 1),
(309, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', '48WPF-XQV4K-VJYTW-WJ6GW-C7KDG', 'taken from SIW File', 177, '2013-02-25 00:58:50', 1, '2013-02-25 00:58:50', 1),
(310, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 178, '2013-02-25 00:59:51', 1, '2013-02-25 00:59:51', 1),
(311, '<TD>Windows XP Professional Service Pack 2</TD>', 'GCXQB-843YB-QCFM6-BT36Y-9PBJG', 'taken from SIW File', 178, '2013-02-25 00:59:51', 1, '2013-02-25 00:59:51', 1),
(312, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'HY6BT-H2RV7-H62VB-2PHGX-V49XY', 'taken from SIW File', 179, '2013-02-25 01:00:08', 1, '2013-02-25 01:00:08', 1),
(313, 'Microsoft Office Single Image 2010', 'CM2HB-K4KHY-BPVMJ-YX3PD-JK388', 'taken from SIW File', 180, '2013-02-25 01:00:35', 1, '2013-02-25 01:00:35', 1),
(314, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'KJBHV-9W46J-WQVXK-RJWVB-F6H73', 'taken from SIW File', 180, '2013-02-25 01:00:35', 1, '2013-02-25 01:00:35', 1),
(315, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'TD734-YHPDM-K9BRG-V4KWC-QX2RV', 'taken from SIW File', 181, '2013-02-25 01:00:46', 1, '2013-02-25 01:00:46', 1),
(316, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 182, '2013-02-28 19:05:03', 1, '2013-02-28 19:05:03', 1),
(317, '<TD>Windows XP Personal Service Pack 2</TD>', 'Q28PV-G6VR8-4FR4W-BK8XH-MPHF3', 'taken from SIW File', 182, '2013-02-28 19:05:03', 1, '2013-02-28 19:05:03', 1),
(318, '<TD>Windows XP Personal Service Pack 2</TD>', 'M67HK-2P4JJ-6FCHQ-674KM-HCQQ6', 'taken from SIW File', 183, '2013-02-28 19:09:05', 1, '2013-02-28 19:09:05', 1),
(319, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 184, '2013-02-28 19:12:07', 1, '2013-02-28 19:12:07', 1),
(320, '<TD>Windows XP Personal Service Pack 2</TD>', 'JP7YM-DJFQH-RG69V-P66XB-6CXWD', 'taken from SIW File', 184, '2013-02-28 19:12:07', 1, '2013-02-28 19:12:07', 1),
(321, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 185, '2013-02-28 19:12:40', 1, '2013-02-28 19:12:40', 1),
(322, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 185, '2013-02-28 19:12:40', 1, '2013-02-28 19:12:40', 1),
(323, '<TD>Windows XP Professional Service Pack 3</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 185, '2013-02-28 19:12:40', 1, '2013-02-28 19:12:40', 1),
(324, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 186, '2013-02-28 19:13:08', 1, '2013-02-28 19:13:08', 1),
(325, 'Microsoft Office Single Image 2010', 'WYCVT-WBFR9-44WDT-PF962-7JCMG', 'taken from SIW File', 186, '2013-02-28 19:13:08', 1, '2013-02-28 19:13:08', 1),
(326, '<TD>Windows 7 Professional (OEM:NONSLP)</TD>', '2MJG6-TQF2P-C8XTF-DP64X-8RWXC', 'taken from SIW File', 186, '2013-02-28 19:13:08', 1, '2013-02-28 19:13:08', 1),
(327, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 187, '2013-02-28 19:18:24', 1, '2013-02-28 19:18:24', 1),
(328, '<TD>Windows XP Personal Service Pack 2</TD>', 'R8MM2-3MD8B-7VCHF-RMRRV-D6PMJ', 'taken from SIW File', 187, '2013-02-28 19:18:24', 1, '2013-02-28 19:18:24', 1),
(329, 'Microsoft Office Standard Edition 2003', 'J9JTY-QQWHJ-2T97B-GXXP6-2RTBJ', 'taken from SIW File', 188, '2013-02-28 19:47:56', 1, '2013-02-28 19:47:56', 1),
(330, '<TD>Windows XP Personal Service Pack 2</TD>', 'T4X4Q-378KR-CB6C8-7WXPF-PY6HY', 'taken from SIW File', 188, '2013-02-28 19:47:56', 1, '2013-02-28 19:47:56', 1),
(331, 'Microsoft Office Professional Enterprise Edition 2003', 'R6GVC-TX42Y-BBDP7-BJW2R-R94D8', 'taken from SIW File', 189, '2013-02-28 23:15:14', 1, '2013-02-28 23:15:14', 1),
(332, '<TD>Windows XP Personal Service Pack 2</TD>', 'TW8FF-JCK4Q-WCBBG-W7DCB-Y89FB', 'taken from SIW File', 189, '2013-02-28 23:15:14', 1, '2013-02-28 23:15:14', 1),
(333, 'Microsoft Office Standard Edition 2003', 'R6GVC-TX42Y-BBDP7-BJW2R-R94D8', 'taken from SIW File', 190, '2013-02-28 23:15:45', 1, '2013-02-28 23:15:45', 1),
(334, '<TD>Windows XP Professional Service Pack 3</TD>', 'HTVYD-4RPYX-JF7K6-QBXMH-7V646', 'taken from SIW File', 190, '2013-02-28 23:15:45', 1, '2013-02-28 23:15:45', 1),
(335, 'Microsoft Office Professional Enterprise Edition 2003', 'C86GH-M49MC-88MVT-8G87Q-HYYQ8', 'taken from SIW File', 191, '2013-02-28 23:16:44', 1, '2013-02-28 23:16:44', 1),
(336, '<TD>Windows 7 Professional (OEM:SLP)</TD>', 'YKHFT-KW986-GK4PY-FDWYH-7TP9F', 'taken from SIW File', 191, '2013-02-28 23:16:44', 1, '2013-02-28 23:16:44', 1);
INSERT INTO `tbl_license` (`id`, `Description`, `coa`, `jenis`, `mesin_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(337, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 192, '2013-02-28 23:17:32', 1, '2013-02-28 23:17:32', 1),
(338, 'Microsoft Office Enterprise 2007', 'FBMVG-86W3W-DJQ4P-X2W4M-HJGHW', 'taken from SIW File', 193, '2013-02-28 23:18:20', 1, '2013-02-28 23:18:20', 1),
(339, 'Microsoft Office Standard Edition 2003', 'TT4WM-WQ83C-Y9TXD-RG2V7-XYYQ8', 'taken from SIW File', 193, '2013-02-28 23:18:20', 1, '2013-02-28 23:18:20', 1),
(340, '<TD>Windows XP Professional Service Pack 2</TD>', 'T3RQF-2FC2Q-73RH4-2BPMB-WJ6DJ', 'taken from SIW File', 193, '2013-02-28 23:18:20', 1, '2013-02-28 23:18:20', 1),
(341, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 194, '2013-02-28 23:18:59', 1, '2013-02-28 23:18:59', 1),
(342, 'Microsoft Office Professional Enterprise Edition 2003', 'JCMJ2-HXWP8-P226X-FHB2Y-4YH38', 'taken from SIW File', 195, '2013-02-28 23:19:32', 1, '2013-02-28 23:19:32', 1),
(343, '<TD>Windows XP Professional Service Pack 2</TD>', 'VJ8MM-3BFJQ-WCKPH-7CX3Q-3XG6G', 'taken from SIW File', 195, '2013-02-28 23:19:32', 1, '2013-02-28 23:19:32', 1),
(344, 'Microsoft Office Standard Edition 2003', 'KY634-GBQX9-8TYV7-TPQRJ-RJ736', 'taken from SIW File', 196, '2013-02-28 23:20:14', 1, '2013-02-28 23:20:14', 1),
(345, '<TD>Windows XP Personal Service Pack 2</TD>', 'C228B-Y32XR-CHDD4-692VP-X4H6B', 'taken from SIW File', 196, '2013-02-28 23:20:14', 1, '2013-02-28 23:20:14', 1),
(346, '<TD>Windows XP Personal Service Pack 2</TD>', 'D2BJ6-8H9FX-G48FD-XVC62-YP4RW', 'taken from SIW File', 197, '2013-02-28 23:28:58', 1, '2013-02-28 23:28:58', 1),
(347, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 198, '2013-02-28 23:31:20', 1, '2013-02-28 23:31:20', 1),
(348, 'Microsoft Office Professional Enterprise Edition 2003', 'CHMPJ-XW493-8YW4G-CKG9J-Y9XVW', 'taken from SIW File', 199, '2013-02-28 23:38:17', 1, '2013-02-28 23:38:17', 1),
(349, '<TD>Windows XP Personal Service Pack 2</TD>', 'M4XM8-8DKMX-HHCFY-4649W-BD6BW', 'taken from SIW File', 199, '2013-02-28 23:38:17', 1, '2013-02-28 23:38:17', 1),
(350, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 201, '2013-02-28 23:39:06', 1, '2013-02-28 23:39:06', 1),
(351, '<TD>Windows XP Personal Service Pack 2</TD>', 'DDJ4J-D676X-P7T2M-F8KVW-6X68B', 'taken from SIW File', 203, '2013-02-28 23:40:10', 1, '2013-02-28 23:40:10', 1),
(352, '<TD>Windows XP Personal Service Pack 2</TD>', 'H27GM-6986V-MY3G2-3FGDK-K2MVQ', 'taken from SIW File', 204, '2013-02-28 23:40:23', 1, '2013-02-28 23:40:23', 1),
(353, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 205, '2013-02-28 23:40:49', 1, '2013-02-28 23:40:49', 1),
(354, '<TD>Windows XP Personal Service Pack 2</TD>', 'D7982-BVMYK-RDT86-FT3JT-TVBTG', 'taken from SIW File', 206, '2013-02-28 23:41:16', 1, '2013-02-28 23:41:16', 1),
(355, '<TD>Windows XP Professional Service Pack 2</TD>', 'CHFYT-WRRFJ-PC89T-WD6KQ-MDHBT', 'taken from SIW File', 207, '2013-02-28 23:41:52', 1, '2013-02-28 23:41:52', 1),
(356, '<TD>Windows XP Professional Service Pack 3</TD>', 'BQWQD-Y484J-YQ6B9-99YHH-CD9XW', 'taken from SIW File', 208, '2013-02-28 23:42:21', 1, '2013-02-28 23:42:21', 1),
(357, '<TD>Windows XP Professional Service Pack 3</TD>', 'BQWQD-Y484J-YQ6B9-99YHH-CD9XW', 'taken from SIW File', 209, '2013-02-28 23:42:48', 1, '2013-02-28 23:42:48', 1),
(358, 'Microsoft Office Single Image 2010', 'D63WW-CGGGR-3YQC3-MKPMM-W9RHD', 'taken from SIW File', 210, '2013-02-28 23:43:44', 1, '2013-02-28 23:43:44', 1),
(359, '<TD>Windows 7 Professional (OEM:NONSLP)</TD>', 'XG8GG-J88TM-B7MTX-J399B-KGFT3', 'taken from SIW File', 210, '2013-02-28 23:43:44', 1, '2013-02-28 23:43:44', 1),
(360, 'Microsoft Office Enterprise 2007', 'KGFVY-7733B-8WCK9-KTG64-BC7D8', 'taken from SIW File', 211, '2013-02-28 23:44:11', 1, '2013-02-28 23:44:11', 1),
(361, '<TD>Windows XP Professional Service Pack 2</TD>', 'BR89Q-4B9GB-9DPFD-M2PY3-R3F83', 'taken from SIW File', 211, '2013-02-28 23:44:11', 1, '2013-02-28 23:44:11', 1),
(362, '<TD>Windows XP Personal Service Pack 2</TD>', 'W8KMP-2XW8F-6D9BH-Q83QG-QGYYJ', 'taken from SIW File', 212, '2013-02-28 23:44:39', 1, '2013-02-28 23:44:39', 1),
(363, '<TD>Windows XP Personal Service Pack 2</TD>', 'F7F3X-9F39D-TWYM4-QWMXB-RW6RM', 'taken from SIW File', 213, '2013-02-28 23:45:03', 1, '2013-02-28 23:45:03', 1),
(364, 'Microsoft Office Professional Enterprise Edition 2003', 'DFVM3-WCVYD-GMJ32-9WC46-CRMQ3', 'taken from SIW File', 214, '2013-02-28 23:45:31', 1, '2013-02-28 23:45:31', 1),
(365, '<TD>Windows XP Personal Service Pack 2</TD>', 'F7F3X-9F39D-TWYM4-QWMXB-RW6RM', 'taken from SIW File', 214, '2013-02-28 23:45:31', 1, '2013-02-28 23:45:31', 1),
(366, 'Microsoft Office Standard Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 215, '2013-02-28 23:46:10', 1, '2013-02-28 23:46:10', 1),
(367, '<TD>Windows 7 Professional Service Pack 1 (OEM:NONSLP)</TD>', 'PYCPW-WC86X-DHJJV-GHXYT-8FBHX', 'taken from SIW File', 215, '2013-02-28 23:46:10', 1, '2013-02-28 23:46:10', 1),
(368, 'Microsoft Office Standard Edition 2003', 'DFVM3-WCVYD-GMJ32-9WC46-CRMQ3', 'taken from SIW File', 216, '2013-02-28 23:46:42', 1, '2013-02-28 23:46:42', 1),
(369, '<TD>Windows XP Professional Service Pack 3</TD>', 'QW4P2-3K9GB-MWY4X-JYVMP-Y2QD8', 'taken from SIW File', 216, '2013-02-28 23:46:42', 1, '2013-02-28 23:46:42', 1),
(370, 'Microsoft Office Professional Enterprise Edition 2003', 'BD2DW-9DT4Q-BJ2XH-QJ9Y8-FTDHW', 'taken from SIW File', 217, '2013-02-28 23:49:45', 1, '2013-02-28 23:49:45', 1),
(371, '<TD>Windows XP Professional Service Pack 3</TD>', 'GDHD2-2G92W-M4PGT-6D7H8-WGDGB', 'taken from SIW File', 217, '2013-02-28 23:49:45', 1, '2013-02-28 23:49:45', 1),
(372, 'Microsoft Office Professional Enterprise Edition 2003', 'GWH28-DGCMP-P6RC4-6J4MT-3HFDY', 'taken from SIW File', 218, '2013-02-28 23:51:19', 1, '2013-02-28 23:51:19', 1),
(373, '<TD>Windows XP Personal Service Pack 2</TD>', 'K6FKT-WTFXP-BMF49-YHG6P-FH673', 'taken from SIW File', 218, '2013-02-28 23:51:19', 1, '2013-02-28 23:51:19', 1),
(374, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 220, '2013-03-12 20:26:28', 2, '2013-03-12 20:26:28', 2),
(375, '<TD>Windows XP Professional Service Pack 3</TD>', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'taken from SIW File', 221, '2013-03-12 20:31:13', 2, '2013-03-12 20:31:13', 2),
(376, '', '', '', 221, '2013-03-12 20:32:35', 2, '2013-03-12 20:32:35', 2),
(382, '<TD>Windows XP Professional Service Pack 3</TD>', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', 'taken from SIW File', 223, '2013-03-12 20:53:27', 2, '2013-03-12 20:53:27', 2),
(383, '', 'KYKVX-86GQG-2MDY9-F6J9M-K42BQ', '', 223, '2013-03-12 20:54:12', 2, '2013-03-12 20:54:12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mesin`
--

CREATE TABLE IF NOT EXISTS `tbl_mesin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` int(11) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `divisi` varchar(128) DEFAULT NULL,
  `jenis` varchar(128) DEFAULT NULL,
  `ram` varchar(128) DEFAULT NULL,
  `hdd` varchar(128) DEFAULT NULL,
  `os` varchar(128) DEFAULT NULL,
  `office` varchar(128) DEFAULT NULL,
  `label_coa` varchar(128) DEFAULT NULL,
  `file_name` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `cabang_id` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cabang_id` (`cabang_id`),
  KEY `cabang_id_2` (`cabang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=224 ;

--
-- Dumping data for table `tbl_mesin`
--

INSERT INTO `tbl_mesin` (`id`, `barcode`, `user`, `divisi`, `jenis`, `ram`, `hdd`, `os`, `office`, `label_coa`, `file_name`, `create_time`, `create_user_id`, `update_time`, `update_user_id`, `cabang_id`, `ip`) VALUES
(4, NULL, 'FIRMAN', 'DA', '1', '2048 MBytes', '250.0 GB', '', '', '', '1SIW_PC_FBBDG_DA_FIRMAN_20121108_105230.html', '2013-02-20 00:13:32', 1, '2013-02-20 00:13:32', 1, 1, '172.16.16.208 [da-3]'),
(5, NULL, 'ROBBI', 'ADM-HOL', '1', '256 MBytes', '40.0 GB', '', '', '', '2SIW_PC_FBBDG_ADM-HOL_ROBBI_20121108_111854.html', '2013-02-20 00:14:03', 1, '2013-02-20 00:14:03', 1, 1, 'Not Supported'),
(6, NULL, 'SCANNER', 'LOGISTIK', '1', '1024 MBytes', '40.0 GB', '', '', '', '3SIW_PC_FBBDG_LOGISTIK_SCANNER_20121108_111638.html', '2013-02-20 00:14:45', 1, '2013-02-20 00:14:45', 1, 1, '172.16.16.42 [undang-16-42]'),
(7, NULL, 'ADITYA', 'LOGISTIK', '1', '1024 MBytes', '250.0 GB', '', '', '', '4SIW_PC_FBBDG_LOGISTIK_ADITYA_20121108_111051.html', '2013-02-20 00:17:20', 1, '2013-02-20 00:17:20', 1, 1, '172.16.16.207 [aditya]'),
(8, NULL, 'PDA', 'LOGISTIK', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBBDG_LOGISTIK_PDA_-C3755AEF5A8C_20130221_102104.html', '2013-02-20 00:18:31', 1, '2013-02-20 19:35:51', 1, 1, '172.16.16.45 [pc-c3755aef5a8c]'),
(9, NULL, 'ARIS', 'LOGISTIK', '1', '256 MBytes', '80.0 GB', '', '', '', '6SIW_PC_FBBDG_LOGISTIK_ARIS_20121108_113548.html', '2013-02-20 00:18:48', 1, '2013-02-20 00:18:48', 1, 1, '172.16.16.41 [bdg_16_41]'),
(10, NULL, 'YUNI', 'LOGISTIK', '1', '512 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBBDG_LOGISTIK_YUNI_20130221_102823.html', '2013-02-20 00:18:57', 1, '2013-02-20 19:36:38', 1, 1, '172.16.16.235 [logistik-d0633e]'),
(11, NULL, 'TONI', 'LOGISTIK', '1', '1024 MBytes', '81.9 GB', '', '', '', '8SIW_PC_FBBDG_LOGISTIK_TONI_20121108_114605.html', '2013-02-20 00:19:25', 1, '2013-02-20 00:19:25', 1, 1, '172.16.16.206 [toni]'),
(12, NULL, 'TAUFIK', 'DA', '1', '2048 MBytes', '250.0 GB', '', '', '', '9SIW_PC_FBBDG_DA_TAUFIK_20121108_165745.html', '2013-02-20 00:19:37', 1, '2013-02-20 00:19:37', 1, 1, '172.16.16.209 [da-1]'),
(13, NULL, 'JAKA', 'DA', '1', '2048 MBytes', '250.0 GB', '', '', '', '10SIW_PC_FBBDG_DA_JAKA_20121108.html', '2013-02-20 00:19:55', 1, '2013-02-20 00:19:55', 1, 1, '172.16.16.210 [da-2]'),
(14, NULL, 'DEFI', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '11SIW_PC_FBBDG_FAA_DEFI_20121110_131750.html', '2013-02-20 00:20:24', 1, '2013-02-20 00:20:24', 1, 1, '172.16.16.33 [santo-16-33]'),
(15, NULL, 'ROFIK', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '12SIW_PC_FBBDG_FAA_ROFIK_20121110_133251.html', '2013-02-20 00:20:50', 1, '2013-02-20 00:20:50', 1, 1, '172.16.16.34 [ku-gl-16-34]'),
(16, NULL, 'IMANOEDIN', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '13SIW_PC_FBBDG_FAA_IMANOEDIN_20121110_133750.html', '2013-02-20 00:21:10', 1, '2013-02-20 00:21:10', 1, 1, '172.16.16.236 [imanoedin-16-36]'),
(17, NULL, 'YUDI', 'FAA', '1', '128 MBytes', '20.0 GB', '', '', '', '14SIW_PC_FBBDG_FAA_YUDI_20121110_135553.html', '2013-02-20 00:21:34', 1, '2013-02-20 00:21:34', 1, 1, '172.16.16.62 [userrck-17-16-31]'),
(18, NULL, 'RULLY', 'FAA', '1', '1024 MBytes', '250.0 GB', '', '', '', '15SIW_PC_FBBDG_FAA_RULLY_20121109_135629.html', '2013-02-20 00:21:50', 1, '2013-02-20 00:21:50', 1, 1, '172.16.16.22 [rofik-16-22]'),
(19, NULL, 'SITI', 'FAA', '1', '256 MBytes', '81.9 GB', '', '', '', '16SIW_PC_FBBDG_FAA_SITI_20121110_140658.html', '2013-02-20 00:22:06', 1, '2013-02-20 00:22:06', 1, 1, '172.16.16.44 [fbbandung]'),
(20, NULL, 'DINI', 'FAA', '1', '1024 MBytes', '20.8 GB', '', '', '', '17SIW_PC_FBBDG_FAA_DINI_20121112_224815.html', '2013-02-20 00:22:25', 1, '2013-02-20 00:22:25', 1, 1, '172.16.16.40 [fbbandun-5fab8e]'),
(21, NULL, 'FAA1', 'FAA', '1', '1024 MBytes', '20.0 GB', '', '', '', '18SIW_PC_FBBDG_FAA_FAA1_20121112_104956.html', '2013-02-20 00:22:41', 1, '2013-02-20 00:22:41', 1, 1, '172.16.16.23 [tri-16-23]'),
(22, NULL, 'TRIMURTI', 'FAA', '1', '512 MBytes', '20.8 GB', '', '', '', '19SIW_PC_FBBDG_FAA_TRIMURTI_20121112_113029.html', '2013-02-20 00:22:56', 1, '2013-02-20 00:22:56', 1, 1, '172.16.16.27 [yuli-16-27]'),
(23, NULL, 'ARISANDI', 'FAA', '1', '', '', '', '', '', '20SIW_PC_FBBDG_FAA_ARISANDI_20121112_111140.html', '2013-02-20 00:23:05', 1, '2013-02-20 00:23:05', 1, 1, ''),
(24, NULL, 'YUDI', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', '21SIW_PC_FBBDG_FAA_YUDI_20121112_113234.html', '2013-02-20 00:23:26', 1, '2013-02-20 00:23:26', 1, 1, '172.16.16.29 [fastrata]'),
(25, NULL, 'NOVI', 'FAA', '1', '512 MBytes', '20.8 GB', '', '', '', 'SIW_PC_FBBDG_FAA_NOVI_20130115_083743.html', '2013-02-20 00:23:43', 1, '2013-02-20 17:55:34', 1, 1, '172.16.16.30'),
(26, NULL, 'YULI', 'FAA', '1', '2048 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBBDG_FAA_YULI_20130115_083953.html', '2013-02-20 00:23:53', 1, '2013-02-20 17:54:29', 1, 1, '172.16.16.204 [faa-yuli]'),
(27, NULL, 'WIJEY', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', '25SIW_PC_FBBDG_FAA_WIJEY_20121114_081751.html', '2013-02-20 00:24:15', 1, '2013-02-20 00:24:15', 1, 1, '172.16.16.92 [firman]'),
(28, NULL, 'ABSEN', 'PGA', '1', '256 MBytes', '80.0 GB', '', '', '', '26SIW_PC_FBBDG_PGA_ABSEN_20121114_090936.html', '2013-02-20 00:24:33', 1, '2013-02-20 00:24:33', 1, 1, '172.16.16.90 [fb-e8fe2497ff60]'),
(29, NULL, 'DONI', 'PGA', '1', '2048 MBytes', '250.0 GB', '', '', '', '27SIW_PC_FBBDG_PGA_DONI_20121114_095129.html', '2013-02-20 00:24:53', 1, '2013-02-20 00:24:53', 1, 1, '172.16.16.227 [user-pc]'),
(30, NULL, 'RANI', 'PGA', '1', '512 MBytes', '40.0 GB', '', '', '', '28SIW_PC_FBBDG_PGA_RANI_20121114_100824.html', '2013-02-20 00:25:09', 1, '2013-02-20 00:25:09', 1, 1, '172.16.16.175 [rani]'),
(31, NULL, 'YEYE', 'ADM-SLS', '1', '1024 MBytes', '80.0 GB', '', '', '', '29SIW_PC_FBBDG_ADM-SLS_YEYE_20121113_131053.html', '2013-02-20 00:25:27', 1, '2013-02-20 00:25:27', 1, 1, '172.16.16.98 [admsls-16-98]'),
(32, NULL, 'WARTI', 'ADMSLS', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBBDG_ADMSLS_WARTI_32-50_20130221_095819.html', '2013-02-20 00:25:35', 1, '2013-02-20 19:06:52', 1, 1, '172.16.16.75 [admsls-32-50]'),
(33, NULL, 'BETTY', 'PC', '1', '1024 MBytes', '80.0 GB', '', '', '', '31SIW_PC_FBBDG_PC_BETTY_20121114_134607.html', '2013-02-20 00:25:52', 1, '2013-02-20 00:25:52', 1, 1, '172.16.16.218 [pcbdg]'),
(34, NULL, 'JESSICA', 'ADM-SANTOS', '1', '256 MBytes', '40.0 GB', '', '', '', '32SIW_PC_FBBDG_ADM-SANTOS_JESSICA_20121117_131555.html', '2013-02-20 00:26:12', 1, '2013-02-20 00:32:56', 1, 1, 'Not Supported'),
(35, NULL, 'JUNI', 'ADM-TBK', '1', '1024 MBytes', '80.0 GB', '', '', '', '33SIW_PC_FBBDG_ADM-TBK_JUNI_20121116_133508.html', '2013-02-20 00:26:31', 1, '2013-02-20 00:28:10', 1, 1, 'Not Supported'),
(36, NULL, 'HERYANA', 'ADM-KASIR', '1', '512 MBytes', '40.0 GB', '', '', '', '34SIW_PC_FBBDG_ADM-KASIR_HERYANA_20121117_135207.html', '2013-02-20 00:26:46', 1, '2013-02-20 00:26:46', 1, 1, '172.16.16.26 [rulie-16-26]'),
(37, NULL, 'MEGA', 'KASIR', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBBDG_KASIR_MEGA_16-38_20130221_100223.html', '2013-02-20 00:28:49', 1, '2013-02-20 19:06:01', 1, 1, '172.16.16.38 [mega-16-38]'),
(38, NULL, 'HERDIAN', 'ADM-TBK', '1', '1024 MBytes', '80.0 GB', '', '', '', '36SIW_PC_FBBDG_ADM-TBK_HERDIAN_20121116_145048.html', '2013-02-20 00:29:06', 1, '2013-02-20 00:29:06', 1, 1, '172.16.16.38 [mega-16-38]'),
(39, NULL, 'TIKA', 'ADM-BM', '1', '2048 MBytes', '250.0 GB', '', '', '', '37SIW_PC_FBBDG_ADM-BM_TIKA_20120811.html', '2013-02-20 00:29:25', 1, '2013-02-20 00:29:25', 1, 1, '172.16.16.219 [user-pc]'),
(40, NULL, 'ORACLE', 'ADM', '1', '512 MBytes', '40.0 GB', '', '', '', '38SIW_PC_FBBDG_ADM_ORACLE_20121117_084353.html', '2013-02-20 00:29:41', 1, '2013-02-20 00:29:41', 1, 1, '172.16.16.31 [admsals-16-31]'),
(41, NULL, 'ORACLE2', 'ADM', '1', '1024 MBytes', '80.0 GB', '', '', '', '39SIW_PC_FBBDG_ADM_ORACLE2_20121117_092922.html', '2013-02-20 00:30:02', 1, '2013-02-20 00:30:02', 1, 1, '172.16.16.39 [admrgm1-16-39]'),
(42, NULL, 'LUSI', 'ADM-RGM', '1', '2048 MBytes', '250.0 GB', '', '', '', '40SIW_PC_FBBDG_ADM-RGM_LUSI_20121117_091707.html', '2013-02-20 00:30:34', 1, '2013-02-20 00:30:34', 1, 1, '172.16.16.211 [jabarpc-pc]'),
(43, NULL, 'YUSMAN', 'SALES', '1', '256 MBytes', '40.0 GB', '', '', '', '41SIW_PC_FBBDG_SALES_YUSMAN_20121116_190048.html', '2013-02-20 00:30:52', 1, '2013-02-20 00:30:52', 1, 1, 'Not Supported'),
(44, NULL, 'ASEP', 'SALES', '1', '512 MBytes', '80.0 GB', '', '', '', '42SIW_PC_FBBDG_SALES_ASEP_20121117_221732.html', '2013-02-20 00:31:18', 1, '2013-02-20 00:31:18', 1, 1, 'Not Supported'),
(45, NULL, 'NURUL', 'FAKTURIS', '1', '1024 MBytes', '80.0 GB', '', '', '', '43SIW_PC_FBBDG_FAKTURIS_NURUL_20121117_104331.html', '2013-02-20 00:31:46', 1, '2013-02-20 00:31:46', 1, 1, '172.16.16.51 [ikah-16-49]'),
(46, NULL, 'DEDE', 'FAKTURIS', '1', '512 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBBDG_FAKTURIS_DEDE_20130115_083706.html', '2013-02-20 00:32:02', 1, '2013-02-20 18:03:07', 1, 1, '172.16.16.46 [bdgfakturis]'),
(47, NULL, 'UDIN', 'ASM', '0', '2048 MBytes', '500.1 GB', 'Win 7 Pro', 'ada', 'ada', '', '2013-02-22 18:59:49', 1, '2013-02-22 19:43:08', 1, 2, '10.18.16.64 [asm-bjr-pc]'),
(48, NULL, 'ADITYA', 'ADMSLS', '1', '1024 MBytes', '80.0 GB', 'XP Pro', '', 'XP Pro', '', '2013-02-22 19:01:49', 1, '2013-02-22 19:44:07', 1, 2, '10.18.16.69 [admsls-77]'),
(49, NULL, 'IRVAN', 'DA', '1', '1024 MBytes', '81.9 GB', 'XP Home', '', 'XP Home', '', '2013-02-22 19:02:29', 1, '2013-02-22 19:55:19', 1, 2, '10.18.16.61 [fastrata]'),
(50, NULL, 'ASEP', 'FAA', '1', '1024 MBytes', '320.0 GB', 'XP Pro', '', 'Win 7 Pro', '', '2013-02-22 19:02:53', 1, '2013-02-22 19:45:15', 1, 2, '172.18.16.20 [kubjr-18-16-20]'),
(51, NULL, 'DINI', 'FAA', '1', '256 MBytes', '160.0 GB', 'XP Home', '', 'XP Home', '', '2013-02-22 19:03:16', 1, '2013-02-22 19:52:04', 1, 2, '172.18.16.23'),
(52, NULL, 'INDRI', 'FAA', '1', '1024 MBytes', '320.0 GB', 'XP Pro', '', 'Win 7 Pro', '', '2013-02-22 19:03:37', 1, '2013-02-22 19:45:43', 1, 2, '172.18.16.24'),
(53, NULL, 'GANJAR', 'FAA', '1', '1024 MBytes', '320.0 GB', 'xp pRO', '', 'Win 7 Pro', '', '2013-02-22 19:04:01', 1, '2013-02-22 19:51:24', 1, 2, '172.18.16.25'),
(54, NULL, 'KOMAR', 'FAA', '1', '1024 MBytes', '320.0 GB', 'XP Pro', '', 'Win 7 Pro', '', '2013-02-22 19:04:27', 1, '2013-02-22 19:54:20', 1, 2, '172.18.16.30'),
(55, NULL, 'RIZA', 'FAA', '1', '1024 MBytes', '320.0 GB', 'XP Pro', 'Office 10', 'Win 7 Pro', '', '2013-02-22 19:04:54', 1, '2013-02-22 19:53:02', 1, 2, '172.18.16.21 [ombjr-18-16-21]'),
(56, NULL, 'RIZAL', 'FAA', '1', '1024 MBytes', '320.0 GB', 'XP Pro', '', 'Win 7 Pro', '', '2013-02-22 19:05:16', 1, '2013-02-22 19:53:42', 1, 2, '172.18.16.22'),
(57, NULL, 'FEBRIN', 'KASIR', '1', '2048 MBytes', '250.0 GB', 'Win 7 Pro', '', 'Win 7 Pro', '', '2013-02-22 19:05:39', 1, '2013-02-22 19:56:02', 1, 2, '172.18.16.26 [user-pc]'),
(58, NULL, 'GALIH', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', 'Win 7 Pro', 'Office 10', 'Win 7 Pro', '', '2013-02-22 19:06:08', 1, '2013-02-22 19:54:53', 1, 2, '172.18.16.40 [banjaran]'),
(59, NULL, 'TEGUH', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', 'Win 7 Pro', '', 'Win 7 Pro', '', '2013-02-22 19:06:22', 1, '2013-02-22 19:55:40', 1, 2, '10.18.16.56 [bjr-pc]'),
(60, NULL, 'SANI', 'ADM-SALES', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_ADM-SALES_SANI_011112.html', '2013-02-24 22:57:58', 1, '2013-02-24 22:57:58', 1, 15, '172.17.17.23 [kaccep-17-17-23]'),
(61, NULL, 'DEDE', 'DA', '1', '1024 MBytes', '40.0 GB', '', '', '', 'SIW_PC_SPCJR_DA_DEDE_011112.html', '2013-02-24 23:01:55', 1, '2013-02-24 23:01:55', 1, 15, '172.17.17.204 [da-4ab87ceaf415]'),
(62, NULL, 'ACEP', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_FAA_ACEP_011112.html', '2013-02-24 23:05:09', 1, '2013-02-24 23:05:09', 1, 15, '172.17.17.25 [kasir-17-17-25]'),
(63, NULL, 'DESI', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_FAA_DESI_011112.html', '2013-02-24 23:07:58', 1, '2013-02-24 23:07:58', 1, 15, '172.17.17.22 [deasy-17-17-22]'),
(64, NULL, 'EVI', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_SPCJR_FAA_EVI_011112.html', '2013-02-24 23:10:23', 1, '2013-02-24 23:10:23', 1, 15, '172.17.17.24 [ina-24]'),
(65, NULL, 'LINA', 'FAA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_FAA_LINA_011112.html', '2013-02-24 23:11:15', 1, '2013-02-24 23:11:15', 1, 15, '172.17.17.20 [lina-17-17-20]'),
(66, NULL, 'RIZAL', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_FAA_RIZAL_011112.html', '2013-02-24 23:24:08', 1, '2013-02-24 23:24:08', 1, 15, '172.17.17.23 [kaccep-17-17-23]'),
(67, NULL, 'INDRI', 'FAKTURIS', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_FAKTURIS_INDRI_011112.html', '2013-02-24 23:30:50', 1, '2013-02-24 23:30:50', 1, 15, '172.17.17.56'),
(68, NULL, 'RAMDAN', 'GUDANG', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_GUDANG_RAMDAN_011112.html', '2013-02-24 23:32:06', 1, '2013-02-24 23:32:06', 1, 15, 'Not Supported'),
(69, NULL, 'HAFID', 'KASIR', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_KASIR_HAFID_011112.html', '2013-02-24 23:32:33', 1, '2013-02-24 23:32:33', 1, 15, '172.17.17.21 [fb-sukabumi2]'),
(70, NULL, 'ENGKOS', 'LOGISTIK', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPCJR_LOGISTIK_ENGKOS_011112.html', '2013-02-24 23:33:06', 1, '2013-02-24 23:33:06', 1, 15, '172.17.17.203 [logistik_gilang]'),
(71, NULL, 'GILANG', 'LOGISTTIK', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_SPCJR_LOGISTTIK_GILANG_011112.html', '2013-02-24 23:33:30', 1, '2013-02-24 23:33:30', 1, 15, '172.17.17.41 [robben--17-41]'),
(72, NULL, 'FITRI', 'ADM-BM', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_ADM-BM_FITRI_201112.html', '2013-02-24 23:34:00', 1, '2013-02-24 23:34:00', 1, 3, '10.16.28.77 [user-pc]'),
(73, NULL, 'ECEP', 'ADM-HOLOGRAM', '1', '512 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBCMR_ADM-HOLOGRAM_ECEP_211112.html', '2013-02-24 23:34:23', 1, '2013-02-24 23:34:23', 1, 3, 'Not Supported'),
(74, NULL, 'DEDI', 'ADM-PDA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_ADM-PDA_DEDI_201112.html', '2013-02-24 23:34:49', 1, '2013-02-24 23:34:49', 1, 3, '172.16.28.32'),
(75, NULL, 'DEBI', 'ADM-RJM', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_ADM-RJM_DEBI_201112.html', '2013-02-24 23:35:36', 1, '2013-02-24 23:35:36', 1, 3, '10.16.28.69 [admrgm]'),
(76, NULL, 'RONY', 'ADM-SLS', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_ADM-SLS_RONY_201112.html', '2013-02-24 23:36:04', 1, '2013-02-24 23:36:04', 1, 3, 'Not Supported'),
(77, NULL, 'ILA', 'DA', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_DA_ILA_201112.html', '2013-02-24 23:36:12', 1, '2013-02-24 23:36:12', 1, 3, '10.16.28.67 [fbcimareme]'),
(78, NULL, 'ORACLE', 'DA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_DA_ORACLE_201112.html', '2013-02-24 23:36:31', 1, '2013-02-24 23:36:31', 1, 3, '172.16.28.31 [oracle]'),
(79, NULL, 'RICKY', 'DA', '1', '', '', '', '', '', 'SIW_PC_FBCMR_DA_RICKY_201112.html', '2013-02-24 23:36:33', 1, '2013-02-24 23:36:33', 1, 3, ''),
(80, NULL, 'SCANNER-ALL', 'DA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_DA_SCANNER-ALL_201112.html', '2013-02-24 23:37:01', 1, '2013-02-24 23:37:01', 1, 3, '10.16.28.65 [extract]'),
(81, NULL, 'WISNU', 'DA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_DA_WISNU_191112.html', '2013-02-24 23:37:09', 1, '2013-02-24 23:37:09', 1, 3, '10.16.28.70 [da2]'),
(82, NULL, 'FAA1', 'FAA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_FAA1_191112.html', '2013-02-24 23:48:18', 1, '2013-02-24 23:48:18', 1, 3, 'Not Supported'),
(83, NULL, 'FAA2', 'FAA', '1', '2048 MBytes', '500.1 GB', '', '', '', 'SIW_PC_FBCMR_FAA_FAA2_191112.html', '2013-02-24 23:48:32', 1, '2013-02-24 23:48:32', 1, 3, '172.16.28.158'),
(84, NULL, 'FAA3', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_FAA3_191112.html', '2013-02-24 23:48:45', 1, '2013-02-24 23:48:45', 1, 3, '172.16.28.66'),
(85, NULL, 'FAHRUL', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_FAHRUL_201112.html', '2013-02-24 23:48:54', 1, '2013-02-24 23:48:54', 1, 3, '172.16.28.25 [linda-28-25]'),
(86, NULL, 'GHITA', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_GHITA_201112.html', '2013-02-24 23:49:10', 1, '2013-02-24 23:49:10', 1, 3, '172.16.28.24'),
(87, NULL, 'INGE', 'FAA', '1', '2048 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_INGE_201112.html', '2013-02-24 23:49:25', 1, '2013-02-24 23:49:25', 1, 3, '10.16.28.73 [fb-cmr]'),
(88, NULL, 'INGE2', 'FAA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_INGE2_201112.html', '2013-02-24 23:49:35', 1, '2013-02-24 23:49:35', 1, 3, '172.16.28.15 [imelda-28-15]'),
(89, NULL, 'LINDA', 'FAA', '1', '', '', '', '', '', 'SIW_PC_FBCMR_FAA_LINDA_201112.html', '2013-02-24 23:49:37', 1, '2013-02-24 23:49:37', 1, 3, ''),
(90, NULL, 'NUGROHO', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_NUGROHO_201112.html', '2013-02-24 23:50:10', 1, '2013-02-24 23:50:10', 1, 3, '172.16.28.57'),
(91, NULL, 'PUTU', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_PUTU_201112.html', '2013-02-24 23:50:27', 1, '2013-02-24 23:50:27', 1, 3, '172.16.28.55'),
(92, NULL, 'SEPTY', 'FAA', '1', '512 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_SEPTY_201112.html', '2013-02-24 23:50:32', 1, '2013-02-24 23:50:32', 1, 3, 'Not Supported'),
(93, NULL, 'SYAFITRI', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_SYAFITRI_201112.html', '2013-02-24 23:54:34', 1, '2013-02-24 23:54:34', 1, 3, '172.16.28.22'),
(94, NULL, 'ZAMZAM', 'FAA', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_FAA_ZAMZAM_201112.html', '2013-02-24 23:54:48', 1, '2013-02-24 23:54:48', 1, 3, '172.16.28.113 [zamzam]'),
(95, NULL, 'ALIT', 'FAKTURIS', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FAKTURIS_ALIT_201112.html', '2013-02-24 23:54:59', 1, '2013-02-24 23:54:59', 1, 3, '172.16.28.49'),
(96, NULL, 'FAKTURIS1', 'FAKTURIS', '1', '128 MBytes', '20.8 GB', '', '', '', 'SIW_PC_FBCMR_FAKTURIS_FAKTURIS1_201112.html', '2013-02-24 23:55:15', 1, '2013-02-24 23:55:15', 1, 3, 'Not Supported'),
(97, NULL, 'FWDP1', 'FWDP', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FWDP_FWDP1_211112.html', '2013-02-24 23:55:34', 1, '2013-02-24 23:56:30', 1, 3, '172.16.28.59 [admsls-32-50]'),
(98, NULL, 'FWDP2', 'FWDP', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FWDP_FWDP2_211112.html', '2013-02-24 23:59:36', 1, '2013-02-24 23:59:36', 1, 3, '172.16.28.50'),
(99, NULL, 'FWDP3', 'FWDP', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_FWDP_FWDP3_211112.html', '2013-02-25 00:00:44', 1, '2013-02-25 00:00:44', 1, 3, '172.16.28.51'),
(100, NULL, 'ACEP', 'GUDANG', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_GUDANG_ACEP_211112.html', '2013-02-25 00:00:56', 1, '2013-02-25 00:00:56', 1, 3, 'Not Supported'),
(101, NULL, 'HANI', 'GUDANG', '1', '2048 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_GUDANG_HANI_211112.html', '2013-02-25 00:01:09', 1, '2013-02-25 00:01:09', 1, 3, 'Not Supported'),
(102, NULL, 'LILI', 'GUDANG', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_GUDANG_LILI_211112.html', '2013-02-25 00:01:31', 1, '2013-02-25 00:01:31', 1, 3, 'Not Supported'),
(103, NULL, 'DADAN', 'LOGISTIK', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBCMR_LOGISTIK_DADAN_211112.html', '2013-02-25 00:01:40', 1, '2013-02-25 00:01:40', 1, 3, '10.16.28.59 [logistic-ef75c6]'),
(104, NULL, 'EVA', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_LOGISTIK_EVA_211112.html', '2013-02-25 00:01:57', 1, '2013-02-25 00:01:57', 1, 3, '172.16.28.42 [user-pc]'),
(105, NULL, 'LUKMAN', 'LOGISTIK', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_LOGISTIK_LUKMAN_211112.html', '2013-02-25 00:02:06', 1, '2013-02-25 00:02:06', 1, 3, '172.16.28.41'),
(106, NULL, 'SYAM', 'LOGISTIK', '1', '128 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBCMR_LOGISTIK_SYAM_211112.html', '2013-02-25 00:02:23', 1, '2013-02-25 00:02:23', 1, 3, '10.16.28.54 [pt-a6fce866ac4b]'),
(107, NULL, 'CUNCUN', 'PGA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBCMR_PGA_CUNCUN_191112.html', '2013-02-25 00:02:36', 1, '2013-02-25 00:02:36', 1, 3, '192.168.29.87 [staffumumcmr]'),
(108, NULL, 'HERI', 'PGA', '1', '512 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_PGA_HERI_191112.html', '2013-02-25 00:02:49', 1, '2013-02-25 00:02:49', 1, 3, '172.16.28.81 [useer-a2c7ef3f9]'),
(109, NULL, 'RENI', 'PGA', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBCMR_PGA_RENI_191112.html', '2013-02-25 00:03:01', 1, '2013-02-25 00:03:01', 1, 3, '172.16.28.38 [user-pc]'),
(112, NULL, 'CRISTINA', 'BM', '0', '2048 MBytes', '500.1 GB', '', '', '', 'SIW_NOTEBOOK_FBMMJABAR_BM_CRISTINA_211112.html', '2013-02-25 00:19:00', 1, '2013-02-25 00:19:00', 1, 16, '192.168.29.55 [mbd-pc]'),
(113, NULL, 'DEFI', 'ADM', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_ADM_DEFI_211112.html', '2013-02-25 00:19:24', 1, '2013-02-25 00:19:24', 1, 16, '192.168.29.69 [mmbdg-28-101]'),
(114, NULL, 'TRYPUTRI', 'ADM-BM', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_ADM-BM_TRYPUTRI_211112.html', '2013-02-25 00:19:32', 1, '2013-02-25 00:19:32', 1, 16, '192.168.29.62 [admbm]'),
(115, NULL, 'LINDA', 'ADM-MD', '1', '2048 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_ADM-MD_LINDA_211112.html', '2013-02-25 00:20:08', 1, '2013-02-25 00:20:08', 1, 16, '192.168.29.66 [mds]'),
(116, NULL, 'AGUNG', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_AGUNG_211112.html', '2013-02-25 00:20:13', 1, '2013-02-25 00:20:13', 1, 16, '172.16.28.103 [inda_28-103]'),
(117, NULL, 'BRIGITA', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_BRIGITA_211112.html', '2013-02-25 00:20:29', 1, '2013-02-25 00:20:29', 1, 16, '172.16.28.107'),
(118, NULL, 'DENDI', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_DENDI_211112.html', '2013-02-25 00:20:50', 1, '2013-02-25 00:20:50', 1, 16, '172.16.28.105'),
(119, NULL, 'EVA', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_EVA_211112.html', '2013-02-25 00:21:00', 1, '2013-02-25 00:21:00', 1, 16, '172.16.28.130'),
(120, NULL, 'FAA1', 'FAA', '1', '2048 MBytes', '500.1 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_FAA1_211112.html', '2013-02-25 00:21:19', 1, '2013-02-25 00:21:19', 1, 16, '192.168.29.73 [user-pc]'),
(121, NULL, 'GHAMA', 'FAA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_GHAMA_211112.html', '2013-02-25 00:21:21', 1, '2013-02-25 00:21:21', 1, 16, '172.16.28.108'),
(122, NULL, 'HANNY', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_HANNY_211112.html', '2013-02-25 00:21:41', 1, '2013-02-25 00:21:41', 1, 16, '172.16.28.131'),
(123, NULL, 'KOSRAMDANI', 'FAA', '1', '2048 MBytes', '500.1 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_KOSRAMDANI_211112.html', '2013-02-25 00:21:51', 1, '2013-02-25 00:21:51', 1, 16, '172.16.28.220 [hp11697207662]'),
(124, NULL, 'KOSRAMDANI2', 'FAA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_KOSRAMDANI2_211112.html', '2013-02-25 00:22:11', 1, '2013-02-25 00:22:11', 1, 16, '192.168.29.70 [fbpdl]'),
(125, NULL, 'UUN', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_UUN_211112.html', '2013-02-25 00:22:17', 1, '2013-02-25 00:22:17', 1, 16, '172.16.28.118 [ghama118]'),
(126, NULL, 'YANTI', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_YANTI_211112.html', '2013-02-25 00:22:39', 1, '2013-02-25 00:22:39', 1, 16, ''),
(127, NULL, 'YETTI', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FAA_YETTI_211112.html', '2013-02-25 00:22:49', 1, '2013-02-25 00:22:49', 1, 16, '172.16.28.102 [fetra-28-115]'),
(128, NULL, 'YOSIKA', 'FAA', '1', '', '', '', '', '', 'SIW_PC_FBMMJABAR_FAA_YOSIKA_211112.html', '2013-02-25 00:23:01', 1, '2013-02-25 00:23:01', 1, 16, ''),
(129, NULL, 'FWDP', 'FWDP', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_FWDP_FWDP_211112.html', '2013-02-25 00:23:13', 1, '2013-02-25 00:24:10', 1, 16, '172.16.28.117 [anna-28-117]'),
(130, NULL, 'DANNY', 'GUDANG', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_GUDANG_DANNY_211112.html', '2013-02-25 00:23:26', 1, '2013-02-25 00:23:26', 1, 16, 'Not Supported'),
(131, NULL, 'ERDOM', 'LOGISTIK', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_LOGISTIK_ERDOM_211112.html', '2013-02-25 00:24:25', 1, '2013-02-25 00:24:25', 1, 16, '172.16.28.142 [log_mbd-28-142]'),
(132, NULL, 'FENDI', 'LOGISTIK', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_LOGISTIK_FENDI_211112.html', '2013-02-25 00:24:38', 1, '2013-02-25 00:24:38', 1, 16, '172.16.28.141'),
(133, NULL, 'RIESWARA', 'LOGISTIK', '1', '', '', '', '', '', 'SIW_PC_FBMMJABAR_LOGISTIK_RIESWARA_211112.html', '2013-02-25 00:24:49', 1, '2013-02-25 00:24:49', 1, 16, ''),
(134, NULL, 'SATRIA', 'PGA', '1', '2048 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_PGA_SATRIA_211112.html', '2013-02-25 00:25:01', 1, '2013-02-25 00:25:01', 1, 16, '172.16.28.210 [mbd]'),
(135, NULL, 'SATRIA2', 'PGA', '1', '2048 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_PGA_SATRIA2_211112.html', '2013-02-25 00:25:18', 1, '2013-02-25 00:25:18', 1, 16, '192.168.29.64 [user-b051787c4d]'),
(136, NULL, 'YOGA', 'PGA', '1', '', '', '', '', '', 'SIW_PC_FBMMJABAR_PGA_YOGA_211112.html', '2013-02-25 00:25:20', 1, '2013-02-25 00:25:20', 1, 16, ''),
(137, NULL, 'HANY', 'SALES', '1', '256 MBytes', '20.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_SALES_HANY_211112.html', '2013-02-25 00:25:43', 1, '2013-02-25 00:25:43', 1, 16, '192.168.29.59 [itfb]'),
(138, NULL, 'EMBU', 'SALES-SPV', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBMMJABAR_SALES-SPV_EMBU_211112.html', '2013-02-25 00:25:57', 1, '2013-02-25 00:25:57', 1, 16, 'Not Supported'),
(139, NULL, 'IRFAN', 'ADM-SLS', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPRCK_ADM-SLS_IRFAN_20121129_170514.html', '2013-02-25 00:29:26', 1, '2013-02-25 00:29:26', 1, 13, '172.17.16.77 [admsls-32-50]'),
(140, NULL, 'CICIH', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_SPRCK_FAA_CICIH_291112.html', '2013-02-25 00:30:26', 1, '2013-02-25 00:30:26', 1, 13, '172.17.16.22 [rck-17-16-22]'),
(141, NULL, 'HERI', 'FAA', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_SPRCK_FAA_HERI_291112.html', '2013-02-25 00:30:48', 1, '2013-02-25 00:30:48', 1, 13, '172.17.16.221 [invrck-17-16-21]'),
(142, NULL, 'IRFAN', 'FAA', '1', '128 MBytes', '40.0 GB', '', '', '', 'SIW_PC_SPRCK_FAA_IRFAN_291112.html', '2013-02-25 00:48:53', 1, '2013-02-25 00:48:53', 1, 13, '172.17.16.29 [fb-rancaekek-17-16-29]'),
(143, NULL, 'LEVI', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_SPRCK_FAA_LEVI_291112.html', '2013-02-25 00:49:17', 1, '2013-02-25 00:49:17', 1, 13, '172.17.16.20 [rck-17-16-20]'),
(144, NULL, 'SENO', 'FAA', '1', '512 MBytes', '81.9 GB', '', '', '', 'SIW_PC_SPRCK_FAA_SENO_291112.html', '2013-02-25 00:49:24', 1, '2013-02-25 00:49:24', 1, 13, '172.17.16.69 [how]'),
(145, NULL, 'BAGUS', 'GUDANG', '1', '512 MBytes', '250.0 GB', '', '', '', 'SIW_PC_SPRCK_GUDANG_BAGUS_291112.html', '2013-02-25 00:49:44', 1, '2013-02-25 00:49:44', 1, 13, 'Not Supported'),
(146, NULL, 'DENI', 'KASIR', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_SPRCK_KASIR_DENI_291112.html', '2013-02-25 00:49:53', 1, '2013-02-25 00:49:53', 1, 13, '172.17.16.25 [kasir-9c7a02065]'),
(147, NULL, 'FWDP', 'FWDP-GUDANG', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_SPRCK_FWDP-GUDANG_FWDP_20121129_135003.html', '2013-02-25 00:50:14', 1, '2013-02-25 00:50:14', 1, 13, '172.17.16.28 [user-226849f404]'),
(148, NULL, 'DENI', 'LOGISTIK', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_SPRCK_LOGISTIK_DENI_291112.html', '2013-02-25 00:50:24', 1, '2013-02-25 00:50:24', 1, 13, '172.17.16.42 [rck-16-42]'),
(149, NULL, 'DENI2', 'LOGISTIK', '1', '128 MBytes', '20.0 GB', '', '', '', 'SIW_PC_SPRCK_LOGISTIK_DENI2_291112.html', '2013-02-25 00:50:31', 1, '2013-02-25 00:50:31', 1, 13, '172.17.16.203 [logisrck-3a8458]'),
(150, NULL, 'TRISNA', 'LOGISTIK', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_SPRCK_LOGISTIK_TRISNA_291112.html', '2013-02-25 00:50:45', 1, '2013-02-25 00:50:45', 1, 13, '172.17.16.41 [rck-16-41]'),
(151, NULL, 'ORACLE', 'DA', '1', '1024 MBytes', '320.0 GB', '', '', '', '01SIW_PC_FBSBG_DA_ORACLE_HP11697207662_20121127_081500.html', '2013-02-25 00:51:19', 1, '2013-02-25 00:51:19', 1, 10, '172.16.44.86 [hp11697207662]'),
(152, NULL, 'LADI', 'ADMBM', '1', '2048 MBytes', '250.0 GB', '', '', '', '02SIW_PC_FBSBG_ADMBM_LADI_20121127_082531.html', '2013-02-25 00:51:31', 1, '2013-02-25 00:52:59', 1, 10, '172.16.44.210 [admbm]'),
(153, NULL, 'GIGIN', 'DA3', '1', '2048 MBytes', '250.0 GB', '', '', '', '03SIW_PC_FBSBG_DA3_GIGIN_20121127_081012.html', '2013-02-25 00:51:43', 1, '2013-02-25 00:52:27', 1, 10, '172.16.44.209 [da3-pc]'),
(154, NULL, 'ASEP', 'DA2', '1', '2048 MBytes', '250.0 GB', '', '', '', '04SIW_PC_FBSBG_DA2_ASEP_A20121127_081631.html', '2013-02-25 00:53:08', 1, '2013-02-25 00:53:08', 1, 10, '172.16.44.208 [da2_subang]'),
(155, NULL, 'GINA', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '06SIW_PC_FBSBG_FAA_GINA_20121127_083533.html', '2013-02-25 00:53:18', 1, '2013-02-25 00:53:18', 1, 10, '172.16.44.20'),
(156, NULL, 'BERKA', 'ADM-SLS', '1', '1024 MBytes', '320.0 GB', '', '', '', '07SIW_PC_FBSBG_ADM-SLS_BERKA_20121127_095926.html', '2013-02-25 00:53:35', 1, '2013-02-25 00:53:35', 1, 10, '172.16.44.28'),
(157, NULL, 'DUDI', 'DA-1', '1', '2048 MBytes', '250.0 GB', '', '', '', '05SIW_PC_FBSBG_DA-1_DUDI_20121127_082103.html', '2013-02-25 00:53:50', 1, '2013-02-25 00:53:50', 1, 10, '172.16.44.207 [da-1]'),
(158, NULL, 'MEI', 'ADMSALES-17', '1', '512 MBytes', '80.0 GB', '', '', '', '08SIW_PC_FBSBG_ADMSALES-17_MEI__20120326_224844.html', '2013-02-25 00:54:07', 1, '2013-02-25 00:54:07', 1, 10, '172.16.44.49'),
(159, NULL, 'WINDA', 'ADM-TF', '1', '2048 MBytes', '250.0 GB', '', '', '', '09SIW_PC_FBSBG_ADM-TF_WINDA_20121127_085348.html', '2013-02-25 00:54:14', 1, '2013-02-25 00:54:14', 1, 10, 'Not Supported'),
(160, NULL, 'VINA', 'ADM-HOLOGRAM', '1', '2048 MBytes', '250.0 GB', '', '', '', '10SIW_PC_FBSBG_ADM-HOLOGRAM_VINA_20121127_090248.html', '2013-02-25 00:54:26', 1, '2013-02-25 00:54:26', 1, 10, 'Not Supported'),
(161, NULL, 'ROFI', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', '11SIW_PC_FBSBG_FAA_ROFI_20121127_090756.html', '2013-02-25 00:54:44', 1, '2013-02-25 00:54:44', 1, 10, '172.16.44.22'),
(162, NULL, 'KAMAL-FAA1', 'FAA', '1', '', '', '', '', '', '12SIW_PC_FBSBG_FAA_KAMAL-FAA1_20121126_135619.html', '2013-02-25 00:54:44', 1, '2013-02-25 00:54:44', 1, 10, ''),
(163, NULL, 'ENANG', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '13SIW_PC_FBSBG_FAA_ENANG_20121127_092505.html', '2013-02-25 00:55:09', 1, '2013-02-25 00:55:09', 1, 10, '172.16.44.26'),
(164, NULL, 'TANTAN', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '14SIW_PC_FBSBG_FAA_TANTAN_20121127_092932.html', '2013-02-25 00:55:22', 1, '2013-02-25 00:55:22', 1, 10, '172.16.44.23'),
(165, NULL, 'LISDA', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', '15SIW_PC_FBSBG_FAA_LISDA_44_25_20121127_092712.html', '2013-02-25 00:55:32', 1, '2013-02-25 00:55:32', 1, 10, '172.16.44.25 [sbg_lisda_44_25]'),
(166, NULL, 'YULIA', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', '16SIW_PC_FBSBG_FAA_YULIA_44_57_20121127_094609.html', '2013-02-25 00:55:49', 1, '2013-02-25 00:55:49', 1, 10, '172.16.44.24'),
(167, NULL, 'USEP', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', '17SIW_PC_FBSBG_FAA_USEP_44_55_20121127_095350.html', '2013-02-25 00:56:02', 1, '2013-02-25 00:56:02', 1, 10, '172.16.44.55 [sbg_ruri_44_55]'),
(168, NULL, 'DINIE', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', '18SIW_PC_FBSBG_FAA_DINIE_16-44-29_20121127_095323.html', '2013-02-25 00:56:26', 1, '2013-02-25 00:56:26', 1, 10, '172.16.44.29'),
(169, NULL, 'PANJI', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', '19SIW_PC_FBSBG_FAA_PANJI_44_57_20121127_100439.html', '2013-02-25 00:56:43', 1, '2013-02-25 00:56:43', 1, 10, '172.16.44.57'),
(170, NULL, 'FAA1', 'FAA', '1', '2048 MBytes', '250.0 GB', '', '', '', '20SIW_PC_FBSBG_FAA_FAA1_20121127_100242.html', '2013-02-25 00:56:49', 1, '2013-02-25 00:56:49', 1, 10, '172.16.44.224 [user-pc]'),
(171, NULL, 'SITI', 'FAKTURIS', '1', '1024 MBytes', '160.0 GB', '', '', '', '21SIW_PC_FBSBG_FAKTURIS_SITI_44_33_20121127_101750.html', '2013-02-25 00:57:10', 1, '2013-02-25 00:57:10', 1, 10, '172.16.44.31'),
(172, NULL, 'RENI', 'FAKTURIS', '1', '256 MBytes', '80.0 GB', '', '', '', '22SIW_PC_FBSBG_FAKTURIS_RENI_20121127_101414.html', '2013-02-25 00:57:39', 1, '2013-02-25 00:57:39', 1, 10, '172.16.44.15'),
(173, NULL, 'WIDI', 'KASIR', '1', '2048 MBytes', '250.0 GB', '', '', '', '23SIW_PC_FBSBG_KASIR_WIDI_20121127_112237.html', '2013-02-25 00:57:53', 1, '2013-02-25 00:57:53', 1, 10, '172.16.44.70 [sbg]'),
(174, NULL, 'LUKMAN', 'KASIR', '1', '1024 MBytes', '160.0 GB', '', '', '', '24SIW_PC_FBSBG_KASIR_LUKMAN_17-28-30_20121127_102910.html', '2013-02-25 00:58:13', 1, '2013-02-25 00:58:13', 1, 10, '172.16.44.30'),
(175, NULL, 'NUGRA', 'BOM', '0', '2048 MBytes', '500.1 GB', '', '', '', '25SIW_NOTEBOOK_FBSBG_BOM_NUGRA_L745_20121127_103946.html', '2013-02-25 00:58:30', 1, '2013-02-25 00:58:30', 1, 10, '172.16.44.202 [l745]'),
(176, NULL, 'ERIK', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', '', '', '', '26SIW_PC_FBSBG_LOGISTIK_ERIK__44_42_20121127_110502.html', '2013-02-25 00:58:39', 1, '2013-02-25 00:58:39', 1, 10, '172.16.44.42 [sbg_dani_44_42]'),
(177, NULL, 'DANI', 'SPVLOG', '1', '2048 MBytes', '250.0 GB', '', '', '', '26SIW_PC_FBSBG_SPVLOG_DANI_20121127_105733.html', '2013-02-25 00:58:57', 1, '2013-02-25 00:58:57', 1, 10, '172.16.44.204 [spvlog-pc]'),
(178, NULL, 'PRIHATIN', 'LOGISTIK', '1', '1024 MBytes', '40.0 GB', '', '', '', '27SIW_PC_FBSBG_LOGISTIK_PRIHATIN_20121127_111523.html', '2013-02-25 00:59:57', 1, '2013-02-25 00:59:57', 1, 10, '172.16.44.41'),
(179, NULL, 'RAHMAT', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', '', '', '', '28SIW_PC_FBSBG_LOGISTIK_RAHMAT_20121127_112732.html', '2013-02-25 01:00:15', 1, '2013-02-25 01:00:15', 1, 10, 'Not Supported'),
(180, NULL, 'NIZAR', 'SPVPGA', '1', '2048 MBytes', '250.0 GB', '', '', '', '29SIW_PC_FBSBG_SPVPGA_NIZAR_20121127_113648.html', '2013-02-25 01:00:41', 1, '2013-02-25 01:00:41', 1, 10, '172.16.44.203'),
(181, NULL, 'ANGGI', 'PGA', '1', '2048 MBytes', '250.0 GB', '', '', '', '30SIW_PC_FBSBG_PGA_ANGGI_20121127_114039.html', '2013-02-25 01:00:53', 1, '2013-02-25 01:00:53', 1, 10, '172.16.44.240 [user-pc]'),
(182, NULL, 'GUGUN', 'ADM-FBK', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_ADM-FBK_GUGUN_301012.html', '2013-02-28 19:05:08', 1, '2013-02-28 19:05:08', 1, 4, 'Not Supported'),
(183, NULL, 'TINA', 'ADM-KASIR', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_ADM-KASIR_TINA_301012.html', '2013-02-28 19:09:10', 1, '2013-02-28 19:09:10', 1, 4, '172.16.17.55'),
(184, NULL, 'TAMI', 'ADM-OUTSOURCE', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_ADM-OUTSOURCE_TAMI_301012.html', '2013-02-28 19:12:11', 1, '2013-02-28 19:12:11', 1, 4, 'Not Supported'),
(185, NULL, 'IRDA', 'ADM-SALES', '1', '1024 MBytes', '82.3 GB', '', '', '', 'SIW_PC_FBSKB_ADM-SALES_IRDA_301012.html', '2013-02-28 19:12:45', 1, '2013-02-28 19:12:45', 1, 4, '172.16.17.52'),
(186, NULL, 'CARLA', 'DA', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBSKB_DA_CARLA_301012.html', '2013-02-28 19:13:15', 1, '2013-02-28 19:13:15', 1, 4, '192.168.17.15 [da-skb]'),
(187, NULL, 'ORACLE-ALL', 'DA', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_DA_ORACLE-ALL_301012.html', '2013-02-28 19:18:29', 1, '2013-02-28 19:18:29', 1, 4, '172.16.17.27 [adm_bm]'),
(188, NULL, 'RENA', 'DA', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_DA_RENA_301012.html', '2013-02-28 19:48:02', 1, '2013-02-28 19:48:02', 1, 4, '192.168.17.20 [fb-skb-4]'),
(189, NULL, 'SCANNER-ALL', 'DA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBSKB_DA_SCANNER-ALL_301012.html', '2013-02-28 23:15:20', 1, '2013-02-28 23:15:20', 1, 4, 'Not Supported'),
(190, NULL, 'TEGUH', 'DA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_DA_TEGUH_301012.html', '2013-02-28 23:15:51', 1, '2013-02-28 23:15:51', 1, 4, '192.168.17.10 [office-d44]'),
(191, NULL, 'YANNE', 'DA', '1', '2048 MBytes', '69.2 GB', '', '', '', 'SIW_PC_FBSKB_DA_YANNE_301012.html', '2013-02-28 23:16:50', 1, '2013-02-28 23:16:50', 1, 4, '192.168.17.14 [admbm-pc]'),
(192, NULL, 'ANDRI', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_ANDRI_301012.html', '2013-02-28 23:17:38', 1, '2013-02-28 23:17:38', 1, 4, '172.16.17.20'),
(193, NULL, 'DANIEL', 'FAA', '1', '512 MBytes', '60.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_DANIEL_301012.html', '2013-02-28 23:18:27', 1, '2013-02-28 23:18:27', 1, 4, 'Not Supported'),
(194, NULL, 'ELVIN', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_ELVIN_301012.html', '2013-02-28 23:19:04', 1, '2013-02-28 23:19:04', 1, 4, '172.16.17.35'),
(195, NULL, 'EVA', 'FAA', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_EVA_301012.html', '2013-02-28 23:19:39', 1, '2013-02-28 23:19:39', 1, 4, '172.16.17.30'),
(196, NULL, 'FAA1', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_FAA1_301012.html', '2013-02-28 23:20:19', 1, '2013-02-28 23:20:19', 1, 4, '172.16.17.26'),
(197, NULL, 'FAA2', 'FAA', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_FAA2_301012.html', '2013-02-28 23:29:03', 1, '2013-02-28 23:29:03', 1, 4, '172.16.17.32'),
(198, NULL, 'FAA3', 'FAA', '1', '1024 MBytes', '320.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_FAA3__301012.html', '2013-02-28 23:31:26', 1, '2013-02-28 23:31:26', 1, 4, '172.16.17.28'),
(199, NULL, 'FAA4', 'FAA', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_FAA4_4_301012.html', '2013-02-28 23:38:22', 1, '2013-02-28 23:38:22', 1, 4, '192.168.17.9 [hendra_skb-22]'),
(200, NULL, 'HENDRA', 'FAA', '1', '', '', '', '', '', 'SIW_PC_FBSKB_FAA_HENDRA_301012.html', '2013-02-28 23:38:43', 1, '2013-02-28 23:38:43', 1, 4, ''),
(201, NULL, 'LESTI', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_LESTI_301012.html', '2013-02-28 23:39:11', 1, '2013-02-28 23:39:11', 1, 4, '172.16.17.24'),
(202, NULL, 'MIRNA', 'FAA', '1', '', '', '', '', '', 'SIW_PC_FBSKB_FAA_MIRNA_301012.html', '2013-02-28 23:39:29', 1, '2013-02-28 23:39:29', 1, 4, ''),
(203, NULL, 'NENG-PRATIWI', 'FAA', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_NENG-PRATIWI_301012.html', '2013-02-28 23:40:14', 1, '2013-02-28 23:40:14', 1, 4, '172.16.17.23'),
(204, NULL, 'NITA', 'FAA', '1', '128 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_NITA_301012.html', '2013-02-28 23:40:29', 1, '2013-02-28 23:40:29', 1, 4, '172.16.17.25'),
(205, NULL, 'VERA', 'FAA', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_FBSKB_FAA_VERA_301012.html', '2013-02-28 23:40:55', 1, '2013-02-28 23:40:55', 1, 4, '172.16.17.21'),
(206, NULL, 'FUJI', 'FAKTURIS', '1', '256 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FAKTURIS_FUJI_301012.html', '2013-02-28 23:41:21', 1, '2013-02-28 23:41:21', 1, 4, '172.16.17.15'),
(207, NULL, 'INES', 'FAKTURIS', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FAKTURIS_INES_301012.html', '2013-02-28 23:41:59', 1, '2013-02-28 23:41:59', 1, 4, '172.16.17.33'),
(208, NULL, 'GUDANG', 'FWDP', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FWDP_GUDANG_301012.html', '2013-02-28 23:42:27', 1, '2013-02-28 23:42:27', 1, 4, '172.16.17.29 [fwdp06]'),
(209, NULL, 'SECURITY', 'FWDP', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_FWDP_SECURITY_301012.html', '2013-02-28 23:42:53', 1, '2013-02-28 23:42:53', 1, 4, '172.16.17.30 [fdwd19]'),
(210, NULL, 'FAUZI', 'GUDANG', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBSKB_GUDANG_FAUZI_301012.html', '2013-02-28 23:43:51', 1, '2013-02-28 23:43:51', 1, 4, 'Not Supported'),
(211, NULL, 'HAMDAN', 'GUDANG', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBSKB_GUDANG_HAMDAN_301012.html', '2013-02-28 23:44:16', 1, '2013-02-28 23:44:16', 1, 4, 'Not Supported'),
(212, NULL, 'NIAR', 'KASIR', '1', '256 MBytes', '40.0 GB', '', '', '', 'SIW_PC_FBSKB_KASIR_NIAR_301012.html', '2013-02-28 23:44:43', 1, '2013-02-28 23:44:43', 1, 4, '172.16.17.34'),
(213, NULL, 'ASEP', 'LOGISTIK', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_LOGISTIK_ASEP_301012.html', '2013-02-28 23:45:10', 1, '2013-02-28 23:45:10', 1, 4, '172.16.17.41'),
(214, NULL, 'EVI', 'LOGISTIK', '1', '1024 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_LOGISTIK_EVI_301012.html', '2013-02-28 23:45:37', 1, '2013-02-28 23:45:37', 1, 4, '192.168.17.22 [fb_log]'),
(215, NULL, 'DIAN', 'LOGISTIK', '1', '2048 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBSKB_LOGISTIK_DIAN_301012.html', '2013-02-28 23:46:17', 1, '2013-02-28 23:46:17', 1, 4, 'Not Supported'),
(216, NULL, 'DESSY', 'PGA', '1', '1024 MBytes', '250.0 GB', '', '', '', 'SIW_PC_FBSKB_PGA_DESSY_301012.html', '2013-02-28 23:46:47', 1, '2013-02-28 23:46:47', 1, 4, '192.168.17.52 [skb-pga]'),
(217, NULL, 'GHISA', 'PGA', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_PGA_GHISA_301012.html', '2013-02-28 23:49:50', 1, '2013-02-28 23:49:50', 1, 4, '192.168.17.55 [user-ec97840b49]'),
(218, NULL, 'GUGUN', 'SALES-PROGRAM', '1', '512 MBytes', '80.0 GB', '', '', '', 'SIW_PC_FBSKB_SALES-PROGRAM_GUGUN_301012.html', '2013-02-28 23:51:26', 1, '2013-02-28 23:51:26', 1, 4, 'Not Supported'),
(219, NULL, '', '', '0', '', '', 'Xp Proff 3', 'Open Office', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', NULL, '2013-03-12 19:32:46', 2, '2013-03-12 19:32:46', 2, 1, ''),
(220, NULL, 'ADMSLS', 'WANGON', '3', '1024 MBytes', '80.0 GB', 'Xp Proff 3', 'Open Office', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'SIW__PC_WANGON_ADMSLS_ADM_125535.html', '2013-03-12 20:26:33', 2, '2013-03-12 20:26:33', 2, 9999, '172.17.32.52'),
(221, NULL, 'ADMSLS', 'WANGON', '3', '1024 MBytes', '80.0 GB', 'Xp Proff 3', 'Open Office', 'T2RM8-MRV4M-YKKKC-RX7DC-H7CVJ', 'SIW__PC_WANGON_ADMSLS_ADM_125535.html', '2013-03-12 20:31:19', 2, '2013-03-12 20:31:19', 2, 9999, '172.17.32.52'),
(223, NULL, '20130131', 'FAKTURIS', '1', '1024 MBytes', '160.0 GB', '', '', '', 'SIW_PC_AMY_FAKTURIS_20130131_130200.html', '2013-03-12 20:51:47', 2, '2013-03-12 20:53:32', 2, 9999, '172.17.32.39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mesin_user_role`
--

CREATE TABLE IF NOT EXISTS `tbl_mesin_user_role` (
  `mesin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`mesin_id`,`user_id`,`role`),
  KEY `user_id` (`user_id`),
  KEY `role` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mesin_user_role`
--

INSERT INTO `tbl_mesin_user_role` (`mesin_id`, `user_id`, `role`) VALUES
(1, 1, 'member');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project`
--

CREATE TABLE IF NOT EXISTS `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_project`
--

INSERT INTO `tbl_project` (`id`, `name`, `description`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'Test Project 1', 'This is test project 1', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(2, 'Test Project 2', 'This is test project 2', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(3, 'Test Project 3', 'This is test project 3', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_assignment`
--

CREATE TABLE IF NOT EXISTS `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project_user_assignment`
--

INSERT INTO `tbl_project_user_assignment` (`project_id`, `user_id`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 1, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(1, 2, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_project_user_role`
--

CREATE TABLE IF NOT EXISTS `tbl_project_user_role` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(64) NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`,`role`),
  KEY `user_id` (`user_id`),
  KEY `role` (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_project_user_role`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `email`, `username`, `password`, `level`, `last_login_time`, `create_time`, `create_user_id`, `update_time`, `update_user_id`) VALUES
(1, 'test1@notanaddress.com', 'test1', 'a5cc7bfa28081852627385fc54723366', 1, '2013-03-13 18:12:42', '0000-00-00 00:00:00', NULL, '2013-02-14 18:12:47', 1),
(2, 'test2@notanaddress.com', 'test2', 'ad0234829205b9033196ba818f7a872b', 1, '2013-03-12 20:15:42', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL),
(3, 'test3@notanaddress.com', 'test3', '8ad8757baa8564dc136c1e07507f4a98', 2, '2013-03-11 01:00:41', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_cabang_user_assignment`
--
ALTER TABLE `tbl_cabang_user_assignment`
  ADD CONSTRAINT `tbl_cabang_user_assignment_ibfk_3` FOREIGN KEY (`cabang_id`) REFERENCES `tbl_cabang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_cabang_user_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_license`
--
ALTER TABLE `tbl_license`
  ADD CONSTRAINT `tbl_license_ibfk_1` FOREIGN KEY (`mesin_id`) REFERENCES `tbl_mesin` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_project_user_assignment`
--
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `tbl_project_user_assignment_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_project_user_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `tbl_level` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
