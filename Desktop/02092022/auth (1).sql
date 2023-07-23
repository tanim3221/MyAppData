-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2022 at 07:33 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ais`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `main_id`, `batch`, `student_id`, `active`, `role`, `Password`, `name`, `email`, `phone`, `checklist`, `date`) VALUES
(2, '867529', '19th', 'controller', 1, 'dev', 'tanim1996', 'Saklayen Ahmed ', 'astanim.3221@gmail.com ', '01727268458', '{\"personal-info-update\":\"on\",\"role-change-update\":\"on\",\"password-update\":\"on\",\"teacher-staff-update\":\"on\",\"notice-update\":\"on\",\"new-batch-update\":\"on\",\"hall-blood-district-update\":\"on\",\"important-link-update\":\"on\",\"faqs-update\":\"on\",\"maintenance-update\":\"on\",\"system-mail-update\":\"on\",\"report-issue-update\":\"on\",\"ais-course-update\":\"on\",\"batch-database-update\":\"on\",\"personal-info-delete\":\"on\",\"teacher-staff-delete\":\"on\",\"notice-delete\":\"on\",\"new-batch-delete\":\"on\",\"hall-blood-district-delete\":\"on\",\"important-link-delete\":\"on\",\"faqs-delete\":\"on\",\"file-gallery-delete\":\"on\",\"system-mail-delete\":\"on\",\"report-issue-delete\":\"on\",\"batch-database-delete\":\"on\",\"sql-backup-delete\":\"on\",\"notice-add\":\"on\",\"new-batch-add\":\"on\",\"hall-blood-district-add\":\"on\",\"important-link-add\":\"on\",\"faqs-add\":\"on\",\"system-mail-add\":\"on\",\"new-batch-student-add\":\"on\",\"multiple-import-add\":\"on\",\"sql-backup-add\":\"on\",\"private-personal-info-view\":\"on\",\"sql-backup-view\":\"on\",\"hall-wise-view\":\"on\",\"district-wise-view\":\"on\",\"blood-wise-view\":\"on\",\"custom-mail-mail\":\"on\",\"send-password-mail\":\"on\",\"hall-wise-download\":\"on\",\"blood-wise-download\":\"on\",\"district-wise-download\":\"on\",\"batch-info-download\":\"on\",\"sql-backup-download\":\"on\",\"notice-notification\":\"on\",\"faqs-notification\":\"on\",\"checkListUpdateBatch\":\"true\",\"batch\":\"19th\",\"id\":\"2\"}', '2022-06-05 11:29:29');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
