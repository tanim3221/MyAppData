-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 06:16 PM
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
-- Database: `deloitte`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(750) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `student_id`, `name`, `category`, `details`, `date`) VALUES
(1, '90203', 'Saklayen Ahmed', 'student', 'View details information of <b>Saklayen Ahmed (student)</b>', '2022-03-16 15:58:55'),
(2, '90203', 'Saklayen Ahmed', 'student', 'Department (Audit and Assurance) added by Saklayen Ahmed.', '2022-03-16 16:09:35'),
(3, '90203', 'Saklayen Ahmed', 'student', 'Designation () added by Saklayen Ahmed.', '2022-03-16 16:09:43'),
(4, '90203', 'Saklayen Ahmed', 'student', 'New category (Executive) added in database by Saklayen Ahmed.', '2022-03-16 16:10:30'),
(5, '90203', 'Saklayen Ahmed', 'student', 'Profile info of <b>(Saklayen Ahmed-90203-student)</b> updated by Saklayen Ahmed.', '2022-03-16 16:11:32'),
(6, '90203', 'Saklayen Ahmed', 'student', 'View details information of <b>Saklayen Ahmed (student)</b>', '2022-03-16 16:15:57'),
(7, '90203', 'Saklayen Ahmed', 'student', 'View details information of <b>Saklayen Ahmed (student)</b>', '2022-03-16 17:17:09'),
(8, '90203', 'Saklayen Ahmed', 'student', 'Searching with keywords - <b><i><u>saklayen (any_category)</u></i></b>.', '2022-03-16 17:18:18'),
(9, '90203', 'Saklayen Ahmed', 'student', 'View details information of <b>Saklayen Ahmed (student)</b>', '2022-03-16 17:18:26');

-- --------------------------------------------------------

--
-- Table structure for table `add_info_key`
--

CREATE TABLE `add_info_key` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `student_id` varchar(300) NOT NULL,
  `category` varchar(300) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `id` int(11) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `fb_id` varchar(500) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `edu` varchar(500) NOT NULL,
  `designation` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dept` varchar(300) NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(300) NOT NULL,
  `LastUpdateTime` varchar(300) NOT NULL,
  `update_by` varchar(300) NOT NULL,
  `added_by` varchar(300) NOT NULL,
  `per_addr` longtext NOT NULL,
  `added_time` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `session` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `session`, `title`, `active`, `date`) VALUES
(232, 'student', '', 'Student', 1, ''),
(233, 'executive', '', 'Executive', 1, '16-03-2022 16:10:30');

-- --------------------------------------------------------

--
-- Table structure for table `deloitte_info`
--

CREATE TABLE `deloitte_info` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `details` longtext NOT NULL,
  `logo` varchar(300) NOT NULL,
  `estd` varchar(150) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(750) NOT NULL,
  `slogan` varchar(300) NOT NULL,
  `sign` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `person_update` varchar(300) NOT NULL,
  `date_upated` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`id`, `name`, `person_update`, `date_upated`) VALUES
(1, 'Audit and Assurance', 'Saklayen Ahmed', '16-03-2022 16:09:35');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `date_upated` varchar(300) NOT NULL,
  `person_update` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `for_whom` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `image_id` int(11) UNSIGNED NOT NULL,
  `image_name` varchar(160) CHARACTER SET utf8 NOT NULL,
  `image_place` varchar(600) CHARACTER SET utf8 NOT NULL,
  `image_date` varchar(150) CHARACTER SET utf8 NOT NULL,
  `image_description` varchar(1500) CHARACTER SET utf8 NOT NULL,
  `album` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `hide` int(1) NOT NULL,
  `pinned` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `learning`
--

CREATE TABLE `learning` (
  `id` int(11) NOT NULL,
  `student_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `course_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `refer_link` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `link` int(1) NOT NULL,
  `date` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cat` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `recommanded_year` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `hide` int(1) NOT NULL,
  `pinned` int(1) NOT NULL,
  `approve` int(1) NOT NULL,
  `download` varchar(150) CHARACTER SET utf8 NOT NULL,
  `ext` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `suggest` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
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
  `category` varchar(300) NOT NULL,
  `time` varchar(150) NOT NULL,
  `details` varchar(1500) NOT NULL,
  `action` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `device`, `http`, `ip`, `capital`, `city`, `region`, `country`, `calling_code`, `country_flag`, `country_code`, `continent`, `latitude`, `longitude`, `isp`, `student_id`, `category`, `time`, `details`, `action`) VALUES
(1, 'Desktop', 'localhost:8080', '::1', '', '', '', '', '', '', '', '', '', '', '', '90203', 'student', '16-03-2022 03:58:22pm', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'Login');

-- --------------------------------------------------------

--
-- Table structure for table `mega_menu`
--

CREATE TABLE `mega_menu` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(750) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `photo` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fb_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name_bangla` varchar(500) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(300) NOT NULL,
  `dept` varchar(300) NOT NULL,
  `position` varchar(300) NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donate` varchar(300) NOT NULL,
  `donate_type` varchar(150) NOT NULL,
  `o_mail` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(1000) NOT NULL,
  `Password` varchar(300) NOT NULL,
  `LastUpdateTime` varchar(300) NOT NULL,
  `role` varchar(300) NOT NULL,
  `birth` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `period` varchar(300) NOT NULL,
  `institution` varchar(600) NOT NULL,
  `w_position` varchar(300) NOT NULL,
  `active` int(1) NOT NULL,
  `showing` int(1) NOT NULL,
  `last_login` varchar(150) NOT NULL,
  `otp` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `photo`, `fb_id`, `name_bangla`, `name`, `student_id`, `category`, `dept`, `position`, `phone`, `email`, `blood`, `last_donate`, `donate_type`, `o_mail`, `address`, `district`, `address_2`, `Password`, `LastUpdateTime`, `role`, `birth`, `father_name`, `period`, `institution`, `w_position`, `active`, `showing`, `last_login`, `otp`) VALUES
(345345, '', '', 'Saklayen Ahmed', 'Saklayen Ahmed', '90203', 'student', 'Audit and Assurance', '1', '0172768458', 'astanim.3221@gmail.com', 'AB-', '2022-03-14', 'Active', '', '', '', 'Gazipur', 'tanim1996', '16-03-2022 16:11:32', 'dev', '', '', '', '', '', 1, 1, '16-03-2022 15:58:22', 986327);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `month` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_pay` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL,
  `student_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `jan` int(11) NOT NULL DEFAULT 0,
  `feb` int(11) NOT NULL DEFAULT 0,
  `mar` int(11) NOT NULL DEFAULT 0,
  `apr` int(11) NOT NULL DEFAULT 0,
  `may` int(11) NOT NULL DEFAULT 0,
  `jun` int(11) NOT NULL DEFAULT 0,
  `jul` int(11) NOT NULL DEFAULT 0,
  `aug` int(11) NOT NULL DEFAULT 0,
  `sep` int(11) NOT NULL DEFAULT 0,
  `oct` int(11) NOT NULL DEFAULT 0,
  `nov` int(11) NOT NULL DEFAULT 0,
  `dec` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `orderby` int(11) NOT NULL,
  `update_by` varchar(300) NOT NULL,
  `date_upated` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position_name`, `orderby`, `update_by`, `date_upated`) VALUES
(1, 'Executive', 3, 'Saklayen Ahmed', '16-03-2022 16:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `student_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `post_cat` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `id` int(11) NOT NULL,
  `keywords` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `key_cat` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `student_id` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`id`, `keywords`, `key_cat`, `category`, `name`, `student_id`, `date`) VALUES
(1, 'saklayen', 'any_category', 'student', 'Saklayen Ahmed', '90203', '2022-03-16 17:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `sqlvalue`
--

CREATE TABLE `sqlvalue` (
  `id` int(11) NOT NULL,
  `text` varchar(1500) COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_info_key`
--
ALTER TABLE `add_info_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deloitte_info`
--
ALTER TABLE `deloitte_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `learning`
--
ALTER TABLE `learning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mega_menu`
--
ALTER TABLE `mega_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_temp`
--
ALTER TABLE `password_reset_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sqlvalue`
--
ALTER TABLE `sqlvalue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `add_info_key`
--
ALTER TABLE `add_info_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `deloitte_info`
--
ALTER TABLE `deloitte_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dept`
--
ALTER TABLE `dept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `image_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `learning`
--
ALTER TABLE `learning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mega_menu`
--
ALTER TABLE `mega_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset_temp`
--
ALTER TABLE `password_reset_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sqlvalue`
--
ALTER TABLE `sqlvalue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
