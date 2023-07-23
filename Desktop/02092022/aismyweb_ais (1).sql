-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2022 at 11:47 AM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aismyweb_ais`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) NOT NULL,
  `batch` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(750) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `add_info_key`
--

CREATE TABLE IF NOT EXISTS `add_info_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(100) NOT NULL,
  `student_id` varchar(100) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checklist` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE IF NOT EXISTS `blood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pos_neg` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `long_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_by` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE IF NOT EXISTS `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logged_student_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logged_batch` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE IF NOT EXISTS `checklist` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(3) NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

CREATE TABLE IF NOT EXISTS `course_list` (
  `id` double NOT NULL AUTO_INCREMENT,
  `course_code` double DEFAULT NULL,
  `course_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_by` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `date_upated` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `semester` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `name_bn` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `division` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_upated` varchar(300) NOT NULL,
  `person_update` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `for_whom` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_name` varchar(160) CHARACTER SET utf8 NOT NULL,
  `image_place` varchar(600) CHARACTER SET utf8 NOT NULL,
  `image_date` varchar(150) CHARACTER SET utf8 NOT NULL,
  `image_url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `album` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `image_description` varchar(1500) CHARACTER SET utf8mb4 NOT NULL,
  `student_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `hide` int(1) NOT NULL,
  `pinned` int(1) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE IF NOT EXISTS `hall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_bn` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_by` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iconic19`
--

CREATE TABLE IF NOT EXISTS `iconic19` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LastUpdateTime` varchar(300) NOT NULL,
  `father_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prefer` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning`
--

CREATE TABLE IF NOT EXISTS `learning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `refer_link` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `link` int(1) NOT NULL,
  `date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cat` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `recommanded_year` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `hide` int(1) NOT NULL,
  `pinned` int(1) NOT NULL,
  `approve` int(1) NOT NULL,
  `download` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `ext` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suggest` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device` varchar(300) NOT NULL,
  `http` varchar(150) NOT NULL,
  `ip` varchar(300) NOT NULL,
  `capital` varchar(300) NOT NULL,
  `city` varchar(300) NOT NULL,
  `region` varchar(300) NOT NULL,
  `country` varchar(300) NOT NULL,
  `calling_code` varchar(300) NOT NULL,
  `country_flag` varchar(300) NOT NULL,
  `country_code` varchar(300) NOT NULL,
  `continent` varchar(300) NOT NULL,
  `latitude` varchar(300) NOT NULL,
  `longitude` varchar(300) NOT NULL,
  `isp` varchar(300) NOT NULL,
  `student_id` varchar(150) NOT NULL,
  `batch` varchar(300) NOT NULL,
  `time` varchar(150) NOT NULL,
  `details` varchar(1500) NOT NULL,
  `action` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE IF NOT EXISTS `maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiry_date` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_start` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_end` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_history`
--

CREATE TABLE IF NOT EXISTS `maintenance_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `expiry_date` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_start` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT current_timestamp(),
  `date_end` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT current_timestamp(),
  `made_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mega_menu`
--

CREATE TABLE IF NOT EXISTS `mega_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(750) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office_stuff`
--

CREATE TABLE IF NOT EXISTS `office_stuff` (
  `id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `fb_id` varchar(500) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LastUpdateTime` varchar(300) DEFAULT NULL,
  `update_by` varchar(300) DEFAULT NULL,
  `added_by` varchar(300) NOT NULL,
  `per_addr` longtext NOT NULL,
  `added_time` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE IF NOT EXISTS `password_reset_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_issue`
--

CREATE TABLE IF NOT EXISTS `report_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_to` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calling_code` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_flag` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `continent` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isp` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(1500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resolve` int(11) NOT NULL DEFAULT 0,
  `re_date` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE IF NOT EXISTS `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `key_cat` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `show_log` int(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sqlvalue`
--

CREATE TABLE IF NOT EXISTS `sqlvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statement`
--

CREATE TABLE IF NOT EXISTS `statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `narration` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_trnx` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_trnx` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `date_added` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sys_mail_setup`
--

CREATE TABLE IF NOT EXISTS `sys_mail_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `host` varchar(300) NOT NULL,
  `smtp` varchar(100) NOT NULL,
  `port` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `fb_id` varchar(500) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `edu` varchar(500) NOT NULL,
  `designation` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(300) NOT NULL,
  `LastUpdateTime` varchar(300) NOT NULL,
  `update_by` varchar(300) NOT NULL,
  `per_addr` longtext NOT NULL,
  `added_by` varchar(300) NOT NULL,
  `added_time` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
