-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 08:29 AM
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
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `id` int(11) NOT NULL,
  `short_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pos_neg` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `long_text` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `modified` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_by` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`id`, `short_text`, `pos_neg`, `long_text`, `modified`, `update_by`) VALUES
(1, 'O+', 'Positive', 'O Positive', '', ''),
(2, 'AB+', 'Positive', 'AB Positive', '', ''),
(3, 'B+', 'Positive', 'B Positive', '', ''),
(4, 'A+', 'Positive', 'A Positive', '', ''),
(5, 'O-', 'Negetive', 'O Negetive', '', ''),
(6, 'AB-', 'Negetive', 'AB Negetive', '', ''),
(7, 'B-', 'Negetive', 'B Negetive', '', ''),
(8, 'A-', 'Negetive', 'A Negetive', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood`
--
ALTER TABLE `blood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
