-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2022 at 05:15 PM
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
-- Table structure for table `sys_mail_setup`
--

CREATE TABLE `sys_mail_setup` (
  `id` int(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `host` varchar(300) NOT NULL,
  `smtp` varchar(100) NOT NULL,
  `port` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_mail_setup`
--

INSERT INTO `sys_mail_setup` (`id`, `email`, `password`, `host`, `smtp`, `port`, `status`, `date_added`) VALUES
(8, 'aisfamilyru@gmail.com', 'aisfamily_ru_19', 'tls://smtp.gmail.com', 'TLS', 587, 0, '2022-04-15 21:00:24'),
(9, 'myicche@gmail.com', 'tanim1996', 'tls://smtp.gmail.com', 'TLS', 587, 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_mail_setup`
--
ALTER TABLE `sys_mail_setup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sys_mail_setup`
--
ALTER TABLE `sys_mail_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
