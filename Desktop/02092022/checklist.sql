-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 08:19 PM
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
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(6) NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(3) NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklist`
--

INSERT INTO `checklist` (`id`, `name`, `param`, `value`, `permission`) VALUES
(1, 'personal-info', 'update', 1, 'on'),
(2, 'personal-info', 'delete', 3, 'on'),
(3, 'role-change', 'update', 2, 'on'),
(4, 'private-personal-info', 'update', 1, 'on'),
(5, 'photo', 'update', 1, 'on'),
(6, 'photo', 'delete', 3, 'on'),
(7, 'password', 'update', 1, 'on'),
(8, 'teacher-staff', 'delete', 3, 'on'),
(9, 'teacher-staff', 'update', 1, 'on'),
(11, 'teacher-staff', 'add', 0, 'on'),
(13, 'notice ', 'update', 1, 'on'),
(14, 'notice ', 'delete', 3, 'on'),
(15, 'notice ', 'add', 0, 'on'),
(16, 'new-batch', 'add', 0, 'on'),
(17, 'new-batch', 'delete', 3, 'on'),
(18, 'new-batch', 'update', 1, 'on'),
(19, 'hall-blood-district', 'delete', 3, 'on'),
(20, 'hall-blood-district', 'update', 1, 'on'),
(21, 'hall-blood-district', 'add', 0, 'on'),
(22, 'important-link', 'update', 1, 'on'),
(23, 'important-link', 'delete', 3, 'on'),
(24, 'important-link', 'add', 0, 'on'),
(25, 'faqs', 'add', 0, 'on'),
(26, 'faqs', 'update', 1, 'on'),
(27, 'faqs', 'delete', 3, 'on'),
(28, 'new-student', 'add', 0, 'on'),
(29, 'activity-log', 'view', 4, 'on'),
(30, 'search-history', 'view', 4, 'on'),
(31, 'login-info', 'view', 4, 'on'),
(32, 'file-gallery', 'delete', 3, 'on'),
(33, 'file-gallery', 'update', 1, 'on'),
(34, 'maintenance', 'update', 1, 'on'),
(35, 'login-credentials', 'view', 4, 'on'),
(36, 'login-credentials', 'update', 1, 'on'),
(37, 'custom-mail', 'mail', 5, 'on'),
(38, 'send-password', 'mail', 5, 'on'),
(39, 'system-mail', 'add', 0, 'on'),
(40, 'system-mail', 'update', 1, 'on'),
(41, 'system-mail', 'delete', 3, 'on'),
(42, 'report', 'view', 4, 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
