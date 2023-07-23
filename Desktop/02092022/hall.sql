-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 04:51 AM
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
-- Table structure for table `hall`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `hall`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `blood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/* INSERT QUERY NO: 1 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (1, 'O+', 'O Positive', 'Positive');

/* INSERT QUERY NO: 2 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (2, 'AB+', 'AB Positive', 'Positive');

/* INSERT QUERY NO: 3 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (3, 'B+', 'B Positive', 'Positive');

/* INSERT QUERY NO: 4 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (4, 'A+', 'A Positive', 'Positive');

/* INSERT QUERY NO: 5 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (5, 'O-', 'O Negetive', 'Negetive');

/* INSERT QUERY NO: 6 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (6, 'AB-', 'AB Negetive', 'Negetive');

/* INSERT QUERY NO: 7 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (7, 'B-', 'B Negetive', 'Negetive');

/* INSERT QUERY NO: 8 */
INSERT INTO blood(`id`, `short_text`, `long_text`, `pos_neg`)
VALUES (8, 'A-', 'A Negetive', 'Negetive');




COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
