-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2022 at 08:47 PM
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
-- Table structure for table `report_issue`
--

CREATE TABLE `report_issue` (
  `id` int(11) NOT NULL,
  `email_from` varchar(100) NOT NULL,
  `email_to` varchar(100) NOT NULL,
  `messages` longtext NOT NULL,
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
  `details` varchar(1500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `report_issue`
--
ALTER TABLE `report_issue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `report_issue`
--
ALTER TABLE `report_issue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
