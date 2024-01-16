-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 06:17 PM
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
-- Database: `lab_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `username` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `username`, `name`, `details`, `date`, `status`) VALUES
(1, 'tanim001', 'Tanim Ahmed', 'DJGBHG [JHGJHGHJG@JJJJ.HH] user deleted by Tanim Ahmed.', '2022-12-17 18:46:14', 1),
(2, 'tanim002', 'Tanim Ahmed', 'jyghfg [jhgjhgjh7678] doctor deleted by Tanim Ahmed.', '2022-12-17 20:07:06', 1),
(3, 'tanim001', 'Tanim Ahmed', 'jhfghfhg [hgfhgfh] location deleted by Tanim Ahmed.', '2022-12-17 21:31:58', NULL),
(4, 'tanim001', 'Tanim Ahmed', 'Gulshan VIP Area [hgfhgfh] location deleted by Tanim Ahmed.', '2022-12-17 22:26:17', NULL),
(5, 'tanim001', 'Tanim Ahmed', 'Product Main Head deleted by Tanim Ahmed.', '2022-12-17 22:57:08', NULL),
(6, 'tanim001', 'Tanim Ahmed', ' subscribers deleted by Tanim Ahmed.', '2022-12-17 23:48:57', NULL),
(7, 'tanim001', 'Tanim Ahmed', 'saklayen@gmail.com subscribers deleted by Tanim Ahmed.', '2022-12-17 23:50:51', NULL),
(8, 'tanim001', 'Tanim Ahmed', ' [] FAQs deleted by Tanim Ahmed.', '2022-12-18 11:22:46', NULL),
(9, 'tanim001', 'Tanim Ahmed', 'Questions 2 FAQs deleted by Tanim Ahmed.', '2022-12-18 11:23:38', NULL),
(10, 'tanim001', 'Tanim Ahmed', 'Get 5% Discount promotion deleted by Tanim Ahmed.', '2022-12-18 11:23:53', NULL),
(11, 'tanim001', 'Tanim Ahmed', 'Title 1 blog deleted by Tanim Ahmed.', '2022-12-18 11:25:00', NULL),
(12, 'tanim001', 'Tanim Ahmed', 'Product 02 product deleted by Tanim Ahmed.', '2022-12-18 12:50:11', NULL),
(13, 'tanim001', 'Tanim Ahmed', 'jhghjgfhj slider deleted by Tanim Ahmed.', '2022-12-18 13:55:16', 0),
(14, 'tanim001', 'Tanim Ahmed', 'Tanim Ahmed [01727268458] appointment deleted by Tanim Ahmed.', '2022-12-18 22:29:41', NULL),
(15, 'tanim001', 'Ahmed Saklayen', ' patient deleted by Ahmed Saklayen.', '2022-12-19 11:58:31', NULL),
(16, 'tanim001', 'Ahmed Saklayen', 'Tanim patient deleted by Ahmed Saklayen.', '2022-12-19 12:04:12', NULL),
(17, 'tanim001', 'Ahmed Saklayen', ' report deleted by Ahmed Saklayen.', '2022-12-19 13:05:01', NULL),
(18, 'tanim001', 'Ahmed Saklayen', 'Saklayen report deleted by Ahmed Saklayen.', '2022-12-19 13:07:13', NULL),
(19, 'tanim001', 'Ahmed Saklayen', 'Saklayen[01727268458] report deleted by Ahmed Saklayen.', '2022-12-19 13:07:48', NULL),
(20, 'tanim001', 'Ahmed Saklayen', 'Saklayen patient deleted by Ahmed Saklayen.', '2022-12-19 13:10:19', NULL),
(21, 'tanim001', 'Ahmed Saklayen', '[] report deleted by Ahmed Saklayen.', '2022-12-19 13:12:23', NULL),
(22, 'tanim001', 'Ahmed Saklayen', 'Tanim[0172] report deleted by Ahmed Saklayen.', '2022-12-19 13:16:51', NULL),
(23, 'tanim001', 'Ahmed Saklayen', 'Tanim[0172] report deleted by Ahmed Saklayen.', '2022-12-19 13:17:24', NULL),
(24, 'tanim001', 'Ahmed Saklayen', 'Cardiology Plus department deleted by Ahmed Saklayen.', '2022-12-19 14:41:09', NULL),
(25, 'tanim001', 'Ahmed Saklayen', ' partner deleted by Ahmed Saklayen.', '2022-12-21 00:49:20', NULL),
(26, 'tanim001', 'Ahmed Saklayen', 'sdfghjk partner deleted by Ahmed Saklayen.', '2022-12-21 00:54:01', NULL),
(27, 'tanim001', 'Ahmed Saklayen', 'ertyuio testimonial deleted by Ahmed Saklayen.', '2022-12-21 00:55:10', NULL),
(28, 'tanim001', 'Ahmed Saklayen', 'asdfgbn [sdfgbhnjm] doctor deleted by Ahmed Saklayen.', '2022-12-21 19:35:44', NULL),
(29, 'tanim001', 'Ahmed Saklayen', ' [] Message deleted by Ahmed Saklayen.', '2022-12-21 21:29:01', NULL),
(30, 'tanim001', 'Ahmed Saklayen', 'dfghjkl [dfghj@sdfghjk.wertyui] Message deleted by Ahmed Saklayen.', '2022-12-21 21:29:57', NULL),
(31, 'tanim001', 'Ahmed Saklayen', 'Reply message send to [myicche@gmail.com] by Ahmed Saklayen.', '2022-12-21 22:58:41', NULL),
(32, 'tanim001', 'Ahmed Saklayen', 'sdfjik [wsdetyhuj@wsdfghjk.sdfghj] Message deleted by Ahmed Saklayen.', '2022-12-21 23:12:48', NULL),
(33, 'tanim001', 'Ahmed Saklayen', 'Questions FAQs deleted by Ahmed Saklayen.', '2022-12-22 10:21:47', NULL),
(34, 'tanim001', 'Ahmed Saklayen', 'Your Most Trusted Health Partner slider deleted by Ahmed Saklayen.', '2022-12-22 22:47:23', NULL),
(35, 'tanim001', 'Ahmed Saklayen', 'no-reply@aisfamilyru.com [mail.aisfamilyru.com] System Mail deleted by Ahmed Saklayen.', '2022-12-23 04:37:17', NULL),
(36, 'tanim001', 'Ahmed Saklayen', 'Mail (myicche@gmail.com) activated by Ahmed Saklayen.', '2022-12-23 04:49:53', NULL),
(37, 'tanim001', 'Ahmed Saklayen', 'Mail (myicche@gmail.com) activated by Ahmed Saklayen.', '2022-12-23 04:50:47', NULL),
(38, 'tanim001', 'Ahmed Saklayen', 'Mail (myicche@gmail.com) activated by Ahmed Saklayen.', '2022-12-23 04:51:10', NULL),
(39, 'tanim001', 'Ahmed Saklayen', 'dfghj@SDFGHJ.DFGHJ [2345678] System Mail deleted by Ahmed Saklayen.', '2022-12-23 23:20:18', NULL),
(40, 'tanim001', 'Ahmed Saklayen', ' patient deleted by Ahmed Saklayen.', '2022-12-27 19:40:31', NULL),
(41, 'tanim001', 'Ahmed Saklayen', 'Tanim Saklayen[01623211729] report deleted by Ahmed Saklayen.', '2022-12-27 19:53:23', NULL),
(42, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2022-12-30 22:46:48', NULL),
(43, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Saklayen Ahmed by Ahmed Saklayen.', '2023-01-02 21:54:22', NULL),
(44, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 21:54:28', NULL),
(45, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 21:55:53', NULL),
(46, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 21:56:00', NULL),
(47, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 22:13:48', NULL),
(48, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 22:36:34', NULL),
(49, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 22:37:00', NULL),
(50, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-02 23:35:38', NULL),
(51, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-03 00:12:37', NULL),
(52, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-03 00:23:32', NULL),
(53, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-03 00:36:35', NULL),
(54, 'tanim001', 'Ahmed Saklayen', 'Site administration access updated successfully for Ahmed Saklayen by Ahmed Saklayen.', '2023-01-10 16:44:27', NULL),
(55, 'saklayen', 'Saklayen Ahmed', 'Site administration access updated successfully for Ahmed Saklayen by Saklayen Ahmed.', '2023-07-29 21:55:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `p_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consultant_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_day` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `p_id`, `name`, `mobile`, `date`, `update_date`, `added_by`, `edited_by`, `appointment_date`, `consultant_name`, `appointment_day`, `status`, `department`, `appointment_time`, `serial_no`) VALUES
(51, '93295182', 'Ahmed', '017272684858', '23-12-2022 22:22:48', '', 'self', '', '2022-12-24', 'Saklayen Ahmed', 'Saturday', 1, 'Cardiology', '20:00', 1),
(52, '948278327', 'Tanim Ahmed', '017272684859', '23-12-2022 22:24:41', '', 'self', '', '2022-12-24', 'Saklayen Ahmed', 'Saturday', 1, 'Cardiology', '20:15', 2),
(53, '844656519', 'Ranti Shaha', '017272768224', '23-12-2022 22:27:05', '', 'self', '', '2022-12-24', 'Saklayen Ahmed', 'Saturday', 1, 'Cardiology', '20:30', 3);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_limit`
--

CREATE TABLE `appointment_limit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_day` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patients_limit` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointment_limit`
--

INSERT INTO `appointment_limit` (`id`, `name`, `appointment_day`, `appointment_date`, `patients_limit`, `added_by`, `edited_by`, `date`, `update_date`, `status`, `doctor_id`, `appointment_time`) VALUES
(5, 'Saklayen Ahmed', 'Friday', '2022-12-24', '3', 'tanim001', 'tanim001', '23-12-2022 15:01:00', '23-12-2022 22:38:45', '1', '5788', '20:00');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `description`, `date`, `update_date`, `added_by`, `edited_by`, `category`, `img`, `status`) VALUES
(7, 'Title 2', 'description 2', '14-12-2022 14:13:32', NULL, 'session_add', NULL, '', '6304bf5e226e36f73292a58bc3111ad3.jpg', 1),
(8, 'Title', 'Desc', '14-12-2022 14:27:54', NULL, 'session_add', NULL, NULL, 'f16911c809603ab0d1098a542423033e.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(6) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `param` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checklist`
--

INSERT INTO `checklist` (`id`, `name`, `param`) VALUES
(86, 'user', 'delete'),
(87, 'user', 'update'),
(88, 'org', 'update'),
(89, 'cover-img', 'update'),
(90, 'cover-img', 'delete'),
(91, 'system-mail', 'update'),
(92, 'system-mail', 'delete'),
(93, 'system-mail', 'add'),
(94, 'cover-img', 'add'),
(95, 'partner', 'add'),
(96, 'partner', 'update'),
(97, 'partner', 'delete'),
(98, 'testimonial', 'add'),
(99, 'testimonial', 'update'),
(100, 'testimonial', 'delete'),
(101, 'menu', 'add'),
(102, 'menu', 'update'),
(103, 'menu', 'delete'),
(104, 'user', 'add'),
(105, 'patient', 'add'),
(106, 'patient', 'update'),
(107, 'patient', 'delete'),
(108, 'report', 'add'),
(109, 'report', 'update'),
(110, 'report', 'delete'),
(111, 'appointment', 'add'),
(112, 'appointment', 'update'),
(113, 'appointment', 'delete'),
(114, 'department', 'add'),
(115, 'department', 'update'),
(116, 'department', 'delete'),
(117, 'doctors', 'add'),
(118, 'doctors', 'update'),
(119, 'doctors', 'delete'),
(120, 'location', 'add'),
(121, 'location', 'update'),
(122, 'location', 'delete'),
(123, 'product', 'add'),
(124, 'product', 'update'),
(125, 'product', 'delete'),
(126, 'service', 'add'),
(127, 'service', 'delete'),
(128, 'service', 'update'),
(129, 'promotion', 'add'),
(130, 'promotion', 'update'),
(131, 'promotion', 'delete'),
(132, 'blog', 'add'),
(133, 'blog', 'update'),
(134, 'blog', 'delete'),
(135, 'subscriber', 'add'),
(136, 'subscriber', 'update'),
(137, 'subscriber', 'delete'),
(138, 'faq', 'add'),
(139, 'faq', 'update'),
(140, 'faq', 'delete'),
(141, 'org', 'add'),
(142, 'contact', 'reply'),
(143, 'contact', 'delete'),
(144, 'report', 'download'),
(145, 'prescription', 'add'),
(146, 'prescription', 'update'),
(147, 'prescription', 'delete');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `subject`, `message`, `date`, `update_date`, `status`, `added_by`, `edited_by`) VALUES
(3, 'Saklayen\r\n', 'myicche@gmail.com', '01727268458', 'Query', 'contactDelete contactDeletecontactDe \r\n letecontactDeletecontactDeletecontactDe letecontactDeletecontactDeletecontactDeletecontactDeletecontactDeletecontactDeletecontactDeletecontactDeletecontactDeletecontactDelete', '21-12-2022 21:36:03', NULL, '1', 'self', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `title`, `date`, `feature`, `update_date`, `description`, `added_by`, `edited_by`, `status`, `img`) VALUES
(2, 'Cardiology', '19-12-2022 14:41:19', '', '19-12-2022 14:41:19', '<p>Hello Its Car</p>', 'tanim001', 'tanim001', 1, NULL),
(3, 'Diabetics', '20-12-2022 22:30:42', '<div>\r\n<div>\r\n<ul>\r\n<li style=\"text-align: justify;\">Cushions and Mattresses</li>\r\n<li style=\"text-align: justify;\">Stretchers and Stretcher</li>\r\n<li style=\"text-align: justify;\">International Drug Database</li>\r\n<li style=\"text-align: justify;\">International Drug Database</li>\r\n</ul>\r\n</div>\r\n</div>', '20-12-2022 22:30:42', 'Hello Its', 'tanim001', 'tanim001', 1, '2b333f57493a59eccbfa359a98e03122.jpg');

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

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `name`, `date_upated`, `person_update`) VALUES
(1, 'Bagerhat', '2020-10-08 16:54:20', 'Saklayen Ahmed Tanim'),
(2, 'Bandarban', '', ''),
(3, 'Barguna', '', ''),
(4, 'Barishal', '', ''),
(5, 'Bhola', '2020-09-24 02:02:39', 'Saklayen Ahmed'),
(6, 'Bogura', '', ''),
(7, 'Brahmanbaria', '', ''),
(8, 'Chandpur', '', ''),
(9, 'Chattogram', '', ''),
(10, 'Chuadanga', '', ''),
(11, 'Cumilla', '', ''),
(12, 'Cox`s Bazar', '', ''),
(13, 'Dhaka', '', ''),
(14, 'Dinajpur', '', ''),
(15, 'Faridpur', '', ''),
(16, 'Feni', '', ''),
(17, 'Gaibandha', '', ''),
(18, 'Gazipur', '2020-09-24 02:04:36', 'Saklayen Ahmed'),
(19, 'Gopalganj', '', ''),
(20, 'Habiganj', '', ''),
(21, 'Jamalpur', '', ''),
(22, 'Jashore', '', ''),
(23, 'Jhalokati', '', ''),
(24, 'Jhenaidah', '', ''),
(25, 'Joypurhat', '', ''),
(26, 'Khagrachhari', '', ''),
(27, 'Khulna', '', ''),
(28, 'Kishoreganj', '', ''),
(29, 'Kurigram', '', ''),
(30, 'Kushtia', '', ''),
(31, 'Lakshmipur', '', ''),
(32, 'Lalmonirhat', '', ''),
(33, 'Madaripur', '', ''),
(34, 'Magura', '', ''),
(35, 'Manikganj', '', ''),
(36, 'Meherpur', '', ''),
(37, 'Moulvibazar', '', ''),
(38, 'Munshiganj', '', ''),
(39, 'Mymensingh', '', ''),
(40, 'Naogaon', '', ''),
(41, 'Narail', '', ''),
(42, 'Narayanganj', '', ''),
(43, 'Narsingdi', '', ''),
(44, 'Natore', '', ''),
(45, 'Nawabganj', '', ''),
(46, 'Netrakona', '', ''),
(47, 'Nilphamari', '', ''),
(48, 'Noakhali', '', ''),
(49, 'Pabna', '', ''),
(50, 'Panchagarh', '', ''),
(51, 'Patuakhali', '', ''),
(52, 'Pirojpur', '', ''),
(53, 'Rajbari', '', ''),
(54, 'Rajshahi', '', ''),
(55, 'Rangamati', '', ''),
(56, 'Rangpur', '', ''),
(57, 'Satkhira', '', ''),
(58, 'Shariatpur', '', ''),
(59, 'Sherpur', '', ''),
(60, 'Sirajganj', '', ''),
(61, 'Sunamganj', '', ''),
(62, 'Sylhet', '', ''),
(63, 'Tangail', '', ''),
(64, 'Thakurgaon', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `close_day` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hospital` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `myself` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `img`, `qualification`, `department`, `appointment`, `status`, `close_day`, `date`, `update_date`, `added_by`, `edited_by`, `mobile`, `email`, `hospital`, `experience`, `skills`, `myself`, `social_media`, `doctor_id`) VALUES
(2, 'Saklayen Ahmed', '84b73cccb50e19b2821ddb5a7cdcd0c3.jpg', 'jhgjhgjh7678', 'Cardiology', 'JHG', 1, 'JGHJ', '22-12-2022 23:50:41', NULL, 'tanim001', 'tanim001', '876', 'kjgjhgjh@kjhkj.jhgjh', 'jgjhG', '  ', '  ', '  ', '  https://labaid.com.bd/en/hospitals, https://labaid.com.bd/en/hospitals, https://labaid.com.bd/en/hospitals', '5788'),
(3, 'Tanim', 'b7c47a7972004cea7b97bd9807a8fef8.jpg', '', 'Diabetics', '', 1, '', '20-12-2022 22:31:32', NULL, 'tanim001', '', '', '', '', NULL, NULL, NULL, NULL, '123456'),
(4, 'Ahmed', '45428f11126472e53ac19cfd1d7a1cf1.jpg', '', 'Diabetics', '', 1, '', '20-12-2022 22:46:53', NULL, 'tanim001', '', '', '', '', NULL, NULL, NULL, NULL, '4567');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `added_by`, `edited_by`, `date`, `update_date`, `status`) VALUES
(1, 'Questions 01', 'Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer ', 'session_add', NULL, '14-12-2022 00:47:th', NULL, 1),
(5, 'Questions 02', 'Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer Answer ', 'session_add', NULL, '14-12-2022 00:47:th', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `icon_set`
--

CREATE TABLE `icon_set` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `icon_set`
--

INSERT INTO `icon_set` (`id`, `icon`, `name`) VALUES
(1, '<i class=\"icofont-angry-monster\"></i>', '<span> angry-monster </span>'),
(2, '<i class=\"icofont-bathtub\"></i>', '<span> bathtub </span>'),
(3, '<i class=\"icofont-bird-wings\"></i>', '<span> bird-wings </span>'),
(4, '<i class=\"icofont-bow\"></i>', '<span> bow </span>'),
(5, '<i class=\"icofont-castle\"></i>', '<span> castle </span>'),
(6, '<i class=\"icofont-circuit\"></i>', '<span> circuit </span>'),
(7, '<i class=\"icofont-crown-king\"></i>', '<span> crown-king </span>'),
(8, '<i class=\"icofont-crown-queen\"></i>', '<span> crown-queen </span>'),
(9, '<i class=\"icofont-dart\"></i>', '<span> dart </span>'),
(10, '<i class=\"icofont-disability-race\"></i>', '<span> disability-race </span>'),
(11, '<i class=\"icofont-diving-goggle\"></i>', '<span> diving-goggle </span>'),
(12, '<i class=\"icofont-eye-open\"></i>', '<span> eye-open </span>'),
(13, '<i class=\"icofont-flora-flower\"></i>', '<span> flora-flower </span>'),
(14, '<i class=\"icofont-flora\"></i>', '<span> flora </span>'),
(15, '<i class=\"icofont-gift-box\"></i>', '<span> gift-box </span>'),
(16, '<i class=\"icofont-halloween-pumpkin\"></i>', '<span> halloween-pumpkin </span>'),
(17, '<i class=\"icofont-hand-power\"></i>', '<span> hand-power </span>'),
(18, '<i class=\"icofont-hand-thunder\"></i>', '<span> hand-thunder </span>'),
(19, '<i class=\"icofont-king-monster\"></i>', '<span> king-monster </span>'),
(20, '<i class=\"icofont-love\"></i>', '<span> love </span>'),
(21, '<i class=\"icofont-magician-hat\"></i>', '<span> magician-hat </span>'),
(22, '<i class=\"icofont-native-american\"></i>', '<span> native-american </span>'),
(23, '<i class=\"icofont-owl-look\"></i>', '<span> owl-look </span>'),
(24, '<i class=\"icofont-phoenix\"></i>', '<span> phoenix </span>'),
(25, '<i class=\"icofont-robot-face\"></i>', '<span> robot-face </span>'),
(26, '<i class=\"icofont-sand-clock\"></i>', '<span> sand-clock </span>'),
(27, '<i class=\"icofont-shield-alt\"></i>', '<span> shield-alt </span>'),
(28, '<i class=\"icofont-ship-wheel\"></i>', '<span> ship-wheel </span>'),
(29, '<i class=\"icofont-skull-danger\"></i>', '<span> skull-danger </span>'),
(30, '<i class=\"icofont-skull-face\"></i>', '<span> skull-face </span>'),
(31, '<i class=\"icofont-snowmobile\"></i>', '<span> snowmobile </span>'),
(32, '<i class=\"icofont-space-shuttle\"></i>', '<span> space-shuttle </span>'),
(33, '<i class=\"icofont-star-shape\"></i>', '<span> star-shape </span>'),
(34, '<i class=\"icofont-swirl\"></i>', '<span> swirl </span>'),
(35, '<i class=\"icofont-tattoo-wing\"></i>', '<span> tattoo-wing </span>'),
(36, '<i class=\"icofont-throne\"></i>', '<span> throne </span>'),
(37, '<i class=\"icofont-tree-alt\"></i>', '<span> tree-alt </span>'),
(38, '<i class=\"icofont-triangle\"></i>', '<span> triangle </span>'),
(39, '<i class=\"icofont-unity-hand\"></i>', '<span> unity-hand </span>'),
(40, '<i class=\"icofont-weed\"></i>', '<span> weed </span>'),
(41, '<i class=\"icofont-woman-bird\"></i>', '<span> woman-bird </span>'),
(42, '<i class=\"icofont-bat\"></i>', '<span> bat </span>'),
(43, '<i class=\"icofont-bear-face\"></i>', '<span> bear-face </span>'),
(44, '<i class=\"icofont-bear-tracks\"></i>', '<span> bear-tracks </span>'),
(45, '<i class=\"icofont-bear\"></i>', '<span> bear </span>'),
(46, '<i class=\"icofont-bird-alt\"></i>', '<span> bird-alt </span>'),
(47, '<i class=\"icofont-bird-flying\"></i>', '<span> bird-flying </span>'),
(48, '<i class=\"icofont-bird\"></i>', '<span> bird </span>'),
(49, '<i class=\"icofont-birds\"></i>', '<span> birds </span>'),
(50, '<i class=\"icofont-bone\"></i>', '<span> bone </span>'),
(51, '<i class=\"icofont-bull\"></i>', '<span> bull </span>'),
(52, '<i class=\"icofont-butterfly-alt\"></i>', '<span> butterfly-alt </span>'),
(53, '<i class=\"icofont-butterfly\"></i>', '<span> butterfly </span>'),
(54, '<i class=\"icofont-camel-alt\"></i>', '<span> camel-alt </span>'),
(55, '<i class=\"icofont-camel-head\"></i>', '<span> camel-head </span>'),
(56, '<i class=\"icofont-camel\"></i>', '<span> camel </span>'),
(57, '<i class=\"icofont-cat-alt-1\"></i>', '<span> cat-alt-1 </span>'),
(58, '<i class=\"icofont-cat-alt-2\"></i>', '<span> cat-alt-2 </span>'),
(59, '<i class=\"icofont-cat-alt-3\"></i>', '<span> cat-alt-3 </span>'),
(60, '<i class=\"icofont-cat-dog\"></i>', '<span> cat-dog </span>'),
(61, '<i class=\"icofont-cat-face\"></i>', '<span> cat-face </span>'),
(62, '<i class=\"icofont-cat\"></i>', '<span> cat </span>'),
(63, '<i class=\"icofont-cow-head\"></i>', '<span> cow-head </span>'),
(64, '<i class=\"icofont-cow\"></i>', '<span> cow </span>'),
(65, '<i class=\"icofont-crab\"></i>', '<span> crab </span>'),
(66, '<i class=\"icofont-crocodile\"></i>', '<span> crocodile </span>'),
(67, '<i class=\"icofont-deer-head\"></i>', '<span> deer-head </span>'),
(68, '<i class=\"icofont-dog-alt\"></i>', '<span> dog-alt </span>'),
(69, '<i class=\"icofont-dog-barking\"></i>', '<span> dog-barking </span>'),
(70, '<i class=\"icofont-dog\"></i>', '<span> dog </span>'),
(71, '<i class=\"icofont-dolphin\"></i>', '<span> dolphin </span>'),
(72, '<i class=\"icofont-duck-tracks\"></i>', '<span> duck-tracks </span>'),
(73, '<i class=\"icofont-eagle-head\"></i>', '<span> eagle-head </span>'),
(74, '<i class=\"icofont-eaten-fish\"></i>', '<span> eaten-fish </span>'),
(75, '<i class=\"icofont-elephant-alt\"></i>', '<span> elephant-alt </span>'),
(76, '<i class=\"icofont-elephant-head-alt\"></i>', '<span> elephant-head-alt </span>'),
(77, '<i class=\"icofont-elephant-head\"></i>', '<span> elephant-head </span>'),
(78, '<i class=\"icofont-elephant\"></i>', '<span> elephant </span>'),
(79, '<i class=\"icofont-elk\"></i>', '<span> elk </span>'),
(80, '<i class=\"icofont-fish-1\"></i>', '<span> fish-1 </span>'),
(81, '<i class=\"icofont-fish-2\"></i>', '<span> fish-2 </span>'),
(82, '<i class=\"icofont-fish-3\"></i>', '<span> fish-3 </span>'),
(83, '<i class=\"icofont-fish-4\"></i>', '<span> fish-4 </span>'),
(84, '<i class=\"icofont-fish-5\"></i>', '<span> fish-5 </span>'),
(85, '<i class=\"icofont-fish\"></i>', '<span> fish </span>'),
(86, '<i class=\"icofont-fox-alt\"></i>', '<span> fox-alt </span>'),
(87, '<i class=\"icofont-fox\"></i>', '<span> fox </span>'),
(88, '<i class=\"icofont-frog-tracks\"></i>', '<span> frog-tracks </span>'),
(89, '<i class=\"icofont-frog\"></i>', '<span> frog </span>'),
(90, '<i class=\"icofont-froggy\"></i>', '<span> froggy </span>'),
(91, '<i class=\"icofont-giraffe-head-1\"></i>', '<span> giraffe-head-1 </span>'),
(92, '<i class=\"icofont-giraffe-head-2\"></i>', '<span> giraffe-head-2 </span>'),
(93, '<i class=\"icofont-giraffe-head\"></i>', '<span> giraffe-head </span>'),
(94, '<i class=\"icofont-giraffe\"></i>', '<span> giraffe </span>'),
(95, '<i class=\"icofont-goat-head\"></i>', '<span> goat-head </span>'),
(96, '<i class=\"icofont-gorilla\"></i>', '<span> gorilla </span>'),
(97, '<i class=\"icofont-hen-tracks\"></i>', '<span> hen-tracks </span>'),
(98, '<i class=\"icofont-horse-head-1\"></i>', '<span> horse-head-1 </span>'),
(99, '<i class=\"icofont-horse-head-2\"></i>', '<span> horse-head-2 </span>'),
(100, '<i class=\"icofont-horse-head\"></i>', '<span> horse-head </span>'),
(101, '<i class=\"icofont-horse-tracks\"></i>', '<span> horse-tracks </span>'),
(102, '<i class=\"icofont-jellyfish\"></i>', '<span> jellyfish </span>'),
(103, '<i class=\"icofont-kangaroo\"></i>', '<span> kangaroo </span>'),
(104, '<i class=\"icofont-lemur\"></i>', '<span> lemur </span>'),
(105, '<i class=\"icofont-lion-head-1\"></i>', '<span> lion-head-1 </span>'),
(106, '<i class=\"icofont-lion-head-2\"></i>', '<span> lion-head-2 </span>'),
(107, '<i class=\"icofont-lion-head\"></i>', '<span> lion-head </span>'),
(108, '<i class=\"icofont-lion\"></i>', '<span> lion </span>'),
(109, '<i class=\"icofont-monkey-2\"></i>', '<span> monkey-2 </span>'),
(110, '<i class=\"icofont-monkey-3\"></i>', '<span> monkey-3 </span>'),
(111, '<i class=\"icofont-monkey-face\"></i>', '<span> monkey-face </span>'),
(112, '<i class=\"icofont-monkey\"></i>', '<span> monkey </span>'),
(113, '<i class=\"icofont-octopus-alt\"></i>', '<span> octopus-alt </span>'),
(114, '<i class=\"icofont-octopus\"></i>', '<span> octopus </span>'),
(115, '<i class=\"icofont-owl\"></i>', '<span> owl </span>'),
(116, '<i class=\"icofont-panda-face\"></i>', '<span> panda-face </span>'),
(117, '<i class=\"icofont-panda\"></i>', '<span> panda </span>'),
(118, '<i class=\"icofont-panther\"></i>', '<span> panther </span>'),
(119, '<i class=\"icofont-parrot-lip\"></i>', '<span> parrot-lip </span>'),
(120, '<i class=\"icofont-parrot\"></i>', '<span> parrot </span>'),
(121, '<i class=\"icofont-paw\"></i>', '<span> paw </span>'),
(122, '<i class=\"icofont-pelican\"></i>', '<span> pelican </span>'),
(123, '<i class=\"icofont-penguin\"></i>', '<span> penguin </span>'),
(124, '<i class=\"icofont-pig-face\"></i>', '<span> pig-face </span>'),
(125, '<i class=\"icofont-pig\"></i>', '<span> pig </span>'),
(126, '<i class=\"icofont-pigeon-1\"></i>', '<span> pigeon-1 </span>'),
(127, '<i class=\"icofont-pigeon-2\"></i>', '<span> pigeon-2 </span>'),
(128, '<i class=\"icofont-pigeon\"></i>', '<span> pigeon </span>'),
(129, '<i class=\"icofont-rabbit\"></i>', '<span> rabbit </span>'),
(130, '<i class=\"icofont-rat\"></i>', '<span> rat </span>'),
(131, '<i class=\"icofont-rhino-head\"></i>', '<span> rhino-head </span>'),
(132, '<i class=\"icofont-rhino\"></i>', '<span> rhino </span>'),
(133, '<i class=\"icofont-rooster\"></i>', '<span> rooster </span>'),
(134, '<i class=\"icofont-seahorse\"></i>', '<span> seahorse </span>'),
(135, '<i class=\"icofont-seal\"></i>', '<span> seal </span>'),
(136, '<i class=\"icofont-shrimp-alt\"></i>', '<span> shrimp-alt </span>'),
(137, '<i class=\"icofont-shrimp\"></i>', '<span> shrimp </span>'),
(138, '<i class=\"icofont-snail-1\"></i>', '<span> snail-1 </span>'),
(139, '<i class=\"icofont-snail-2\"></i>', '<span> snail-2 </span>'),
(140, '<i class=\"icofont-snail-3\"></i>', '<span> snail-3 </span>'),
(141, '<i class=\"icofont-snail\"></i>', '<span> snail </span>'),
(142, '<i class=\"icofont-snake\"></i>', '<span> snake </span>'),
(143, '<i class=\"icofont-squid\"></i>', '<span> squid </span>'),
(144, '<i class=\"icofont-squirrel\"></i>', '<span> squirrel </span>'),
(145, '<i class=\"icofont-tiger-face\"></i>', '<span> tiger-face </span>'),
(146, '<i class=\"icofont-tiger\"></i>', '<span> tiger </span>'),
(147, '<i class=\"icofont-turtle\"></i>', '<span> turtle </span>'),
(148, '<i class=\"icofont-whale\"></i>', '<span> whale </span>'),
(149, '<i class=\"icofont-woodpecker\"></i>', '<span> woodpecker </span>'),
(150, '<i class=\"icofont-zebra\"></i>', '<span> zebra </span>'),
(151, '<i class=\"icofont-brand-acer\"></i>', '<span> brand-acer </span>'),
(152, '<i class=\"icofont-brand-adidas\"></i>', '<span> brand-adidas </span>'),
(153, '<i class=\"icofont-brand-adobe\"></i>', '<span> brand-adobe </span>'),
(154, '<i class=\"icofont-brand-air-new-zealand\"></i>', '<span> brand-air-new-zealand </span>'),
(155, '<i class=\"icofont-brand-airbnb\"></i>', '<span> brand-airbnb </span>'),
(156, '<i class=\"icofont-brand-aircell\"></i>', '<span> brand-aircell </span>'),
(157, '<i class=\"icofont-brand-airtel\"></i>', '<span> brand-airtel </span>'),
(158, '<i class=\"icofont-brand-alcatel\"></i>', '<span> brand-alcatel </span>'),
(159, '<i class=\"icofont-brand-alibaba\"></i>', '<span> brand-alibaba </span>'),
(160, '<i class=\"icofont-brand-aliexpress\"></i>', '<span> brand-aliexpress </span>'),
(161, '<i class=\"icofont-brand-alipay\"></i>', '<span> brand-alipay </span>'),
(162, '<i class=\"icofont-brand-amazon\"></i>', '<span> brand-amazon </span>'),
(163, '<i class=\"icofont-brand-amd\"></i>', '<span> brand-amd </span>'),
(164, '<i class=\"icofont-brand-american-airlines\"></i>', '<span> brand-american-airlines </span>'),
(165, '<i class=\"icofont-brand-android-robot\"></i>', '<span> brand-android-robot </span>'),
(166, '<i class=\"icofont-brand-android\"></i>', '<span> brand-android </span>'),
(167, '<i class=\"icofont-brand-aol\"></i>', '<span> brand-aol </span>'),
(168, '<i class=\"icofont-brand-apple\"></i>', '<span> brand-apple </span>'),
(169, '<i class=\"icofont-brand-appstore\"></i>', '<span> brand-appstore </span>'),
(170, '<i class=\"icofont-brand-asus\"></i>', '<span> brand-asus </span>'),
(171, '<i class=\"icofont-brand-ati\"></i>', '<span> brand-ati </span>'),
(172, '<i class=\"icofont-brand-att\"></i>', '<span> brand-att </span>'),
(173, '<i class=\"icofont-brand-audi\"></i>', '<span> brand-audi </span>'),
(174, '<i class=\"icofont-brand-axiata\"></i>', '<span> brand-axiata </span>'),
(175, '<i class=\"icofont-brand-bada\"></i>', '<span> brand-bada </span>'),
(176, '<i class=\"icofont-brand-bbc\"></i>', '<span> brand-bbc </span>'),
(177, '<i class=\"icofont-brand-bing\"></i>', '<span> brand-bing </span>'),
(178, '<i class=\"icofont-brand-blackberry\"></i>', '<span> brand-blackberry </span>'),
(179, '<i class=\"icofont-brand-bmw\"></i>', '<span> brand-bmw </span>'),
(180, '<i class=\"icofont-brand-box\"></i>', '<span> brand-box </span>'),
(181, '<i class=\"icofont-brand-burger-king\"></i>', '<span> brand-burger-king </span>'),
(182, '<i class=\"icofont-brand-business-insider\"></i>', '<span> brand-business-insider </span>'),
(183, '<i class=\"icofont-brand-buzzfeed\"></i>', '<span> brand-buzzfeed </span>'),
(184, '<i class=\"icofont-brand-cannon\"></i>', '<span> brand-cannon </span>'),
(185, '<i class=\"icofont-brand-casio\"></i>', '<span> brand-casio </span>'),
(186, '<i class=\"icofont-brand-china-mobile\"></i>', '<span> brand-china-mobile </span>'),
(187, '<i class=\"icofont-brand-china-telecom\"></i>', '<span> brand-china-telecom </span>'),
(188, '<i class=\"icofont-brand-china-unicom\"></i>', '<span> brand-china-unicom </span>'),
(189, '<i class=\"icofont-brand-cisco\"></i>', '<span> brand-cisco </span>'),
(190, '<i class=\"icofont-brand-citibank\"></i>', '<span> brand-citibank </span>'),
(191, '<i class=\"icofont-brand-cnet\"></i>', '<span> brand-cnet </span>'),
(192, '<i class=\"icofont-brand-cnn\"></i>', '<span> brand-cnn </span>'),
(193, '<i class=\"icofont-brand-cocal-cola\"></i>', '<span> brand-cocal-cola </span>'),
(194, '<i class=\"icofont-brand-compaq\"></i>', '<span> brand-compaq </span>'),
(195, '<i class=\"icofont-brand-debian\"></i>', '<span> brand-debian </span>'),
(196, '<i class=\"icofont-brand-delicious\"></i>', '<span> brand-delicious </span>'),
(197, '<i class=\"icofont-brand-dell\"></i>', '<span> brand-dell </span>'),
(198, '<i class=\"icofont-brand-designbump\"></i>', '<span> brand-designbump </span>'),
(199, '<i class=\"icofont-brand-designfloat\"></i>', '<span> brand-designfloat </span>'),
(200, '<i class=\"icofont-brand-disney\"></i>', '<span> brand-disney </span>'),
(201, '<i class=\"icofont-brand-dodge\"></i>', '<span> brand-dodge </span>'),
(202, '<i class=\"icofont-brand-dove\"></i>', '<span> brand-dove </span>'),
(203, '<i class=\"icofont-brand-drupal\"></i>', '<span> brand-drupal </span>'),
(204, '<i class=\"icofont-brand-ebay\"></i>', '<span> brand-ebay </span>'),
(205, '<i class=\"icofont-brand-eleven\"></i>', '<span> brand-eleven </span>'),
(206, '<i class=\"icofont-brand-emirates\"></i>', '<span> brand-emirates </span>'),
(207, '<i class=\"icofont-brand-espn\"></i>', '<span> brand-espn </span>'),
(208, '<i class=\"icofont-brand-etihad-airways\"></i>', '<span> brand-etihad-airways </span>'),
(209, '<i class=\"icofont-brand-etisalat\"></i>', '<span> brand-etisalat </span>'),
(210, '<i class=\"icofont-brand-etsy\"></i>', '<span> brand-etsy </span>'),
(211, '<i class=\"icofont-brand-fastrack\"></i>', '<span> brand-fastrack </span>'),
(212, '<i class=\"icofont-brand-fedex\"></i>', '<span> brand-fedex </span>'),
(213, '<i class=\"icofont-brand-ferrari\"></i>', '<span> brand-ferrari </span>'),
(214, '<i class=\"icofont-brand-fitbit\"></i>', '<span> brand-fitbit </span>'),
(215, '<i class=\"icofont-brand-flikr\"></i>', '<span> brand-flikr </span>'),
(216, '<i class=\"icofont-brand-forbes\"></i>', '<span> brand-forbes </span>'),
(217, '<i class=\"icofont-brand-foursquare\"></i>', '<span> brand-foursquare </span>'),
(218, '<i class=\"icofont-brand-foxconn\"></i>', '<span> brand-foxconn </span>'),
(219, '<i class=\"icofont-brand-fujitsu\"></i>', '<span> brand-fujitsu </span>'),
(220, '<i class=\"icofont-brand-general-electric\"></i>', '<span> brand-general-electric </span>'),
(221, '<i class=\"icofont-brand-gillette\"></i>', '<span> brand-gillette </span>'),
(222, '<i class=\"icofont-brand-gizmodo\"></i>', '<span> brand-gizmodo </span>'),
(223, '<i class=\"icofont-brand-gnome\"></i>', '<span> brand-gnome </span>'),
(224, '<i class=\"icofont-brand-google\"></i>', '<span> brand-google </span>'),
(225, '<i class=\"icofont-brand-gopro\"></i>', '<span> brand-gopro </span>'),
(226, '<i class=\"icofont-brand-gucci\"></i>', '<span> brand-gucci </span>'),
(227, '<i class=\"icofont-brand-hallmark\"></i>', '<span> brand-hallmark </span>'),
(228, '<i class=\"icofont-brand-hi5\"></i>', '<span> brand-hi5 </span>'),
(229, '<i class=\"icofont-brand-honda\"></i>', '<span> brand-honda </span>'),
(230, '<i class=\"icofont-brand-hp\"></i>', '<span> brand-hp </span>'),
(231, '<i class=\"icofont-brand-hsbc\"></i>', '<span> brand-hsbc </span>'),
(232, '<i class=\"icofont-brand-htc\"></i>', '<span> brand-htc </span>'),
(233, '<i class=\"icofont-brand-huawei\"></i>', '<span> brand-huawei </span>'),
(234, '<i class=\"icofont-brand-hulu\"></i>', '<span> brand-hulu </span>'),
(235, '<i class=\"icofont-brand-hyundai\"></i>', '<span> brand-hyundai </span>'),
(236, '<i class=\"icofont-brand-ibm\"></i>', '<span> brand-ibm </span>'),
(237, '<i class=\"icofont-brand-icofont\"></i>', '<span> brand-icofont </span>'),
(238, '<i class=\"icofont-brand-icq\"></i>', '<span> brand-icq </span>'),
(239, '<i class=\"icofont-brand-ikea\"></i>', '<span> brand-ikea </span>'),
(240, '<i class=\"icofont-brand-imdb\"></i>', '<span> brand-imdb </span>'),
(241, '<i class=\"icofont-brand-indiegogo\"></i>', '<span> brand-indiegogo </span>'),
(242, '<i class=\"icofont-brand-intel\"></i>', '<span> brand-intel </span>'),
(243, '<i class=\"icofont-brand-ipair\"></i>', '<span> brand-ipair </span>'),
(244, '<i class=\"icofont-brand-jaguar\"></i>', '<span> brand-jaguar </span>'),
(245, '<i class=\"icofont-brand-java\"></i>', '<span> brand-java </span>'),
(246, '<i class=\"icofont-brand-joomla\"></i>', '<span> brand-joomla </span>'),
(247, '<i class=\"icofont-brand-kickstarter\"></i>', '<span> brand-kickstarter </span>'),
(248, '<i class=\"icofont-brand-kik\"></i>', '<span> brand-kik </span>'),
(249, '<i class=\"icofont-brand-lastfm\"></i>', '<span> brand-lastfm </span>'),
(250, '<i class=\"icofont-brand-lego\"></i>', '<span> brand-lego </span>'),
(251, '<i class=\"icofont-brand-lenovo\"></i>', '<span> brand-lenovo </span>'),
(252, '<i class=\"icofont-brand-levis\"></i>', '<span> brand-levis </span>'),
(253, '<i class=\"icofont-brand-lexus\"></i>', '<span> brand-lexus </span>'),
(254, '<i class=\"icofont-brand-lg\"></i>', '<span> brand-lg </span>'),
(255, '<i class=\"icofont-brand-life-hacker\"></i>', '<span> brand-life-hacker </span>'),
(256, '<i class=\"icofont-brand-linux-mint\"></i>', '<span> brand-linux-mint </span>'),
(257, '<i class=\"icofont-brand-linux\"></i>', '<span> brand-linux </span>'),
(258, '<i class=\"icofont-brand-lionix\"></i>', '<span> brand-lionix </span>'),
(259, '<i class=\"icofont-brand-loreal\"></i>', '<span> brand-loreal </span>'),
(260, '<i class=\"icofont-brand-louis-vuitton\"></i>', '<span> brand-louis-vuitton </span>'),
(261, '<i class=\"icofont-brand-mac-os\"></i>', '<span> brand-mac-os </span>'),
(262, '<i class=\"icofont-brand-marvel-app\"></i>', '<span> brand-marvel-app </span>'),
(263, '<i class=\"icofont-brand-mashable\"></i>', '<span> brand-mashable </span>'),
(264, '<i class=\"icofont-brand-mazda\"></i>', '<span> brand-mazda </span>'),
(265, '<i class=\"icofont-brand-mcdonals\"></i>', '<span> brand-mcdonals </span>'),
(266, '<i class=\"icofont-brand-mercedes\"></i>', '<span> brand-mercedes </span>'),
(267, '<i class=\"icofont-brand-micromax\"></i>', '<span> brand-micromax </span>'),
(268, '<i class=\"icofont-brand-microsoft\"></i>', '<span> brand-microsoft </span>'),
(269, '<i class=\"icofont-brand-mobileme\"></i>', '<span> brand-mobileme </span>'),
(270, '<i class=\"icofont-brand-mobily\"></i>', '<span> brand-mobily </span>'),
(271, '<i class=\"icofont-brand-motorola\"></i>', '<span> brand-motorola </span>'),
(272, '<i class=\"icofont-brand-msi\"></i>', '<span> brand-msi </span>'),
(273, '<i class=\"icofont-brand-mts\"></i>', '<span> brand-mts </span>'),
(274, '<i class=\"icofont-brand-myspace\"></i>', '<span> brand-myspace </span>'),
(275, '<i class=\"icofont-brand-mytv\"></i>', '<span> brand-mytv </span>'),
(276, '<i class=\"icofont-brand-nasa\"></i>', '<span> brand-nasa </span>'),
(277, '<i class=\"icofont-brand-natgeo\"></i>', '<span> brand-natgeo </span>'),
(278, '<i class=\"icofont-brand-nbc\"></i>', '<span> brand-nbc </span>'),
(279, '<i class=\"icofont-brand-nescafe\"></i>', '<span> brand-nescafe </span>'),
(280, '<i class=\"icofont-brand-nestle\"></i>', '<span> brand-nestle </span>'),
(281, '<i class=\"icofont-brand-netflix\"></i>', '<span> brand-netflix </span>'),
(282, '<i class=\"icofont-brand-nexus\"></i>', '<span> brand-nexus </span>'),
(283, '<i class=\"icofont-brand-nike\"></i>', '<span> brand-nike </span>'),
(284, '<i class=\"icofont-brand-nokia\"></i>', '<span> brand-nokia </span>'),
(285, '<i class=\"icofont-brand-nvidia\"></i>', '<span> brand-nvidia </span>'),
(286, '<i class=\"icofont-brand-omega\"></i>', '<span> brand-omega </span>'),
(287, '<i class=\"icofont-brand-opensuse\"></i>', '<span> brand-opensuse </span>'),
(288, '<i class=\"icofont-brand-oracle\"></i>', '<span> brand-oracle </span>'),
(289, '<i class=\"icofont-brand-panasonic\"></i>', '<span> brand-panasonic </span>'),
(290, '<i class=\"icofont-brand-paypal\"></i>', '<span> brand-paypal </span>'),
(291, '<i class=\"icofont-brand-pepsi\"></i>', '<span> brand-pepsi </span>'),
(292, '<i class=\"icofont-brand-philips\"></i>', '<span> brand-philips </span>'),
(293, '<i class=\"icofont-brand-pizza-hut\"></i>', '<span> brand-pizza-hut </span>'),
(294, '<i class=\"icofont-brand-playstation\"></i>', '<span> brand-playstation </span>'),
(295, '<i class=\"icofont-brand-puma\"></i>', '<span> brand-puma </span>'),
(296, '<i class=\"icofont-brand-qatar-air\"></i>', '<span> brand-qatar-air </span>'),
(297, '<i class=\"icofont-brand-qvc\"></i>', '<span> brand-qvc </span>'),
(298, '<i class=\"icofont-brand-readernaut\"></i>', '<span> brand-readernaut </span>'),
(299, '<i class=\"icofont-brand-redbull\"></i>', '<span> brand-redbull </span>'),
(300, '<i class=\"icofont-brand-reebok\"></i>', '<span> brand-reebok </span>'),
(301, '<i class=\"icofont-brand-reuters\"></i>', '<span> brand-reuters </span>'),
(302, '<i class=\"icofont-brand-samsung\"></i>', '<span> brand-samsung </span>'),
(303, '<i class=\"icofont-brand-sap\"></i>', '<span> brand-sap </span>'),
(304, '<i class=\"icofont-brand-saudia-airlines\"></i>', '<span> brand-saudia-airlines </span>'),
(305, '<i class=\"icofont-brand-scribd\"></i>', '<span> brand-scribd </span>'),
(306, '<i class=\"icofont-brand-shell\"></i>', '<span> brand-shell </span>'),
(307, '<i class=\"icofont-brand-siemens\"></i>', '<span> brand-siemens </span>'),
(308, '<i class=\"icofont-brand-sk-telecom\"></i>', '<span> brand-sk-telecom </span>'),
(309, '<i class=\"icofont-brand-slideshare\"></i>', '<span> brand-slideshare </span>'),
(310, '<i class=\"icofont-brand-smashing-magazine\"></i>', '<span> brand-smashing-magazine </span>'),
(311, '<i class=\"icofont-brand-snapchat\"></i>', '<span> brand-snapchat </span>'),
(312, '<i class=\"icofont-brand-sony-ericsson\"></i>', '<span> brand-sony-ericsson </span>'),
(313, '<i class=\"icofont-brand-sony\"></i>', '<span> brand-sony </span>'),
(314, '<i class=\"icofont-brand-soundcloud\"></i>', '<span> brand-soundcloud </span>'),
(315, '<i class=\"icofont-brand-sprint\"></i>', '<span> brand-sprint </span>'),
(316, '<i class=\"icofont-brand-squidoo\"></i>', '<span> brand-squidoo </span>'),
(317, '<i class=\"icofont-brand-starbucks\"></i>', '<span> brand-starbucks </span>'),
(318, '<i class=\"icofont-brand-stc\"></i>', '<span> brand-stc </span>'),
(319, '<i class=\"icofont-brand-steam\"></i>', '<span> brand-steam </span>'),
(320, '<i class=\"icofont-brand-suzuki\"></i>', '<span> brand-suzuki </span>'),
(321, '<i class=\"icofont-brand-symbian\"></i>', '<span> brand-symbian </span>'),
(322, '<i class=\"icofont-brand-t-mobile\"></i>', '<span> brand-t-mobile </span>'),
(323, '<i class=\"icofont-brand-tango\"></i>', '<span> brand-tango </span>'),
(324, '<i class=\"icofont-brand-target\"></i>', '<span> brand-target </span>'),
(325, '<i class=\"icofont-brand-tata-indicom\"></i>', '<span> brand-tata-indicom </span>'),
(326, '<i class=\"icofont-brand-techcrunch\"></i>', '<span> brand-techcrunch </span>'),
(327, '<i class=\"icofont-brand-telenor\"></i>', '<span> brand-telenor </span>'),
(328, '<i class=\"icofont-brand-teliasonera\"></i>', '<span> brand-teliasonera </span>'),
(329, '<i class=\"icofont-brand-tesla\"></i>', '<span> brand-tesla </span>'),
(330, '<i class=\"icofont-brand-the-verge\"></i>', '<span> brand-the-verge </span>'),
(331, '<i class=\"icofont-brand-thenextweb\"></i>', '<span> brand-thenextweb </span>'),
(332, '<i class=\"icofont-brand-toshiba\"></i>', '<span> brand-toshiba </span>'),
(333, '<i class=\"icofont-brand-toyota\"></i>', '<span> brand-toyota </span>'),
(334, '<i class=\"icofont-brand-tribenet\"></i>', '<span> brand-tribenet </span>'),
(335, '<i class=\"icofont-brand-ubuntu\"></i>', '<span> brand-ubuntu </span>'),
(336, '<i class=\"icofont-brand-unilever\"></i>', '<span> brand-unilever </span>'),
(337, '<i class=\"icofont-brand-vaio\"></i>', '<span> brand-vaio </span>'),
(338, '<i class=\"icofont-brand-verizon\"></i>', '<span> brand-verizon </span>'),
(339, '<i class=\"icofont-brand-viber\"></i>', '<span> brand-viber </span>'),
(340, '<i class=\"icofont-brand-vodafone\"></i>', '<span> brand-vodafone </span>'),
(341, '<i class=\"icofont-brand-volkswagen\"></i>', '<span> brand-volkswagen </span>'),
(342, '<i class=\"icofont-brand-walmart\"></i>', '<span> brand-walmart </span>'),
(343, '<i class=\"icofont-brand-warnerbros\"></i>', '<span> brand-warnerbros </span>'),
(344, '<i class=\"icofont-brand-whatsapp\"></i>', '<span> brand-whatsapp </span>'),
(345, '<i class=\"icofont-brand-wikipedia\"></i>', '<span> brand-wikipedia </span>'),
(346, '<i class=\"icofont-brand-windows\"></i>', '<span> brand-windows </span>'),
(347, '<i class=\"icofont-brand-wire\"></i>', '<span> brand-wire </span>'),
(348, '<i class=\"icofont-brand-wordpress\"></i>', '<span> brand-wordpress </span>'),
(349, '<i class=\"icofont-brand-xiaomi\"></i>', '<span> brand-xiaomi </span>'),
(350, '<i class=\"icofont-brand-yahoobuzz\"></i>', '<span> brand-yahoobuzz </span>'),
(351, '<i class=\"icofont-brand-yamaha\"></i>', '<span> brand-yamaha </span>'),
(352, '<i class=\"icofont-brand-youtube\"></i>', '<span> brand-youtube </span>'),
(353, '<i class=\"icofont-brand-zain\"></i>', '<span> brand-zain </span>'),
(354, '<i class=\"icofont-bank-alt\"></i>', '<span> bank-alt </span>'),
(355, '<i class=\"icofont-bank\"></i>', '<span> bank </span>'),
(356, '<i class=\"icofont-barcode\"></i>', '<span> barcode </span>'),
(357, '<i class=\"icofont-bill-alt\"></i>', '<span> bill-alt </span>'),
(358, '<i class=\"icofont-billboard\"></i>', '<span> billboard </span>'),
(359, '<i class=\"icofont-briefcase-1\"></i>', '<span> briefcase-1 </span>'),
(360, '<i class=\"icofont-briefcase-2\"></i>', '<span> briefcase-2 </span>'),
(361, '<i class=\"icofont-businessman\"></i>', '<span> businessman </span>'),
(362, '<i class=\"icofont-businesswoman\"></i>', '<span> businesswoman </span>'),
(363, '<i class=\"icofont-chair\"></i>', '<span> chair </span>'),
(364, '<i class=\"icofont-coins\"></i>', '<span> coins </span>'),
(365, '<i class=\"icofont-company\"></i>', '<span> company </span>'),
(366, '<i class=\"icofont-contact-add\"></i>', '<span> contact-add </span>'),
(367, '<i class=\"icofont-files-stack\"></i>', '<span> files-stack </span>'),
(368, '<i class=\"icofont-handshake-deal\"></i>', '<span> handshake-deal </span>'),
(369, '<i class=\"icofont-id-card\"></i>', '<span> id-card </span>'),
(370, '<i class=\"icofont-meeting-add\"></i>', '<span> meeting-add </span>'),
(371, '<i class=\"icofont-money-bag\"></i>', '<span> money-bag </span>'),
(372, '<i class=\"icofont-pie-chart\"></i>', '<span> pie-chart </span>'),
(373, '<i class=\"icofont-presentation-alt\"></i>', '<span> presentation-alt </span>'),
(374, '<i class=\"icofont-presentation\"></i>', '<span> presentation </span>'),
(375, '<i class=\"icofont-stamp\"></i>', '<span> stamp </span>'),
(376, '<i class=\"icofont-stock-mobile\"></i>', '<span> stock-mobile </span>'),
(377, '<i class=\"icofont-chart-arrows-axis\"></i>', '<span> chart-arrows-axis </span>'),
(378, '<i class=\"icofont-chart-bar-graph\"></i>', '<span> chart-bar-graph </span>'),
(379, '<i class=\"icofont-chart-flow-1\"></i>', '<span> chart-flow-1 </span>'),
(380, '<i class=\"icofont-chart-flow-2\"></i>', '<span> chart-flow-2 </span>'),
(381, '<i class=\"icofont-chart-flow\"></i>', '<span> chart-flow </span>'),
(382, '<i class=\"icofont-chart-growth\"></i>', '<span> chart-growth </span>'),
(383, '<i class=\"icofont-chart-histogram-alt\"></i>', '<span> chart-histogram-alt </span>'),
(384, '<i class=\"icofont-chart-histogram\"></i>', '<span> chart-histogram </span>'),
(385, '<i class=\"icofont-chart-line-alt\"></i>', '<span> chart-line-alt </span>'),
(386, '<i class=\"icofont-chart-line\"></i>', '<span> chart-line </span>'),
(387, '<i class=\"icofont-chart-pie-alt\"></i>', '<span> chart-pie-alt </span>'),
(388, '<i class=\"icofont-chart-pie\"></i>', '<span> chart-pie </span>'),
(389, '<i class=\"icofont-chart-radar-graph\"></i>', '<span> chart-radar-graph </span>'),
(390, '<i class=\"icofont-architecture-alt\"></i>', '<span> architecture-alt </span>'),
(391, '<i class=\"icofont-architecture\"></i>', '<span> architecture </span>'),
(392, '<i class=\"icofont-barricade\"></i>', '<span> barricade </span>'),
(393, '<i class=\"icofont-bolt\"></i>', '<span> bolt </span>'),
(394, '<i class=\"icofont-bricks\"></i>', '<span> bricks </span>'),
(395, '<i class=\"icofont-building-alt\"></i>', '<span> building-alt </span>'),
(396, '<i class=\"icofont-bull-dozer\"></i>', '<span> bull-dozer </span>'),
(397, '<i class=\"icofont-calculations\"></i>', '<span> calculations </span>'),
(398, '<i class=\"icofont-cement-mix\"></i>', '<span> cement-mix </span>'),
(399, '<i class=\"icofont-cement-mixer\"></i>', '<span> cement-mixer </span>'),
(400, '<i class=\"icofont-concrete-mixer\"></i>', '<span> concrete-mixer </span>'),
(401, '<i class=\"icofont-danger-zone\"></i>', '<span> danger-zone </span>'),
(402, '<i class=\"icofont-drill\"></i>', '<span> drill </span>'),
(403, '<i class=\"icofont-eco-energy\"></i>', '<span> eco-energy </span>'),
(404, '<i class=\"icofont-eco-environmen\"></i>', '<span> eco-environmen </span>'),
(405, '<i class=\"icofont-energy-air\"></i>', '<span> energy-air </span>'),
(406, '<i class=\"icofont-energy-oil\"></i>', '<span> energy-oil </span>'),
(407, '<i class=\"icofont-energy-savings\"></i>', '<span> energy-savings </span>'),
(408, '<i class=\"icofont-energy-solar\"></i>', '<span> energy-solar </span>'),
(409, '<i class=\"icofont-energy-water\"></i>', '<span> energy-water </span>'),
(410, '<i class=\"icofont-engineer\"></i>', '<span> engineer </span>'),
(411, '<i class=\"icofont-fire-extinguisher-alt\"></i>', '<span> fire-extinguisher-alt </span>'),
(412, '<i class=\"icofont-fire-extinguisher\"></i>', '<span> fire-extinguisher </span>'),
(413, '<i class=\"icofont-fix-tools\"></i>', '<span> fix-tools </span>'),
(414, '<i class=\"icofont-fork-lift\"></i>', '<span> fork-lift </span>'),
(415, '<i class=\"icofont-glue-oil\"></i>', '<span> glue-oil </span>'),
(416, '<i class=\"icofont-hammer-alt\"></i>', '<span> hammer-alt </span>'),
(417, '<i class=\"icofont-hammer\"></i>', '<span> hammer </span>'),
(418, '<i class=\"icofont-help-robot\"></i>', '<span> help-robot </span>'),
(419, '<i class=\"icofont-industries-1\"></i>', '<span> industries-1 </span>'),
(420, '<i class=\"icofont-industries-2\"></i>', '<span> industries-2 </span>'),
(421, '<i class=\"icofont-industries-3\"></i>', '<span> industries-3 </span>'),
(422, '<i class=\"icofont-industries-4\"></i>', '<span> industries-4 </span>'),
(423, '<i class=\"icofont-industries-5\"></i>', '<span> industries-5 </span>'),
(424, '<i class=\"icofont-industries\"></i>', '<span> industries </span>'),
(425, '<i class=\"icofont-labour\"></i>', '<span> labour </span>'),
(426, '<i class=\"icofont-mining\"></i>', '<span> mining </span>'),
(427, '<i class=\"icofont-paint-brush\"></i>', '<span> paint-brush </span>'),
(428, '<i class=\"icofont-pollution\"></i>', '<span> pollution </span>'),
(429, '<i class=\"icofont-power-zone\"></i>', '<span> power-zone </span>'),
(430, '<i class=\"icofont-radio-active\"></i>', '<span> radio-active </span>'),
(431, '<i class=\"icofont-recycle-alt\"></i>', '<span> recycle-alt </span>'),
(432, '<i class=\"icofont-recycling-man\"></i>', '<span> recycling-man </span>'),
(433, '<i class=\"icofont-safety-hat-light\"></i>', '<span> safety-hat-light </span>'),
(434, '<i class=\"icofont-safety-hat\"></i>', '<span> safety-hat </span>'),
(435, '<i class=\"icofont-saw\"></i>', '<span> saw </span>'),
(436, '<i class=\"icofont-screw-driver\"></i>', '<span> screw-driver </span>'),
(437, '<i class=\"icofont-tools-1\"></i>', '<span> tools-1 </span>'),
(438, '<i class=\"icofont-tools-bag\"></i>', '<span> tools-bag </span>'),
(439, '<i class=\"icofont-tow-truck\"></i>', '<span> tow-truck </span>'),
(440, '<i class=\"icofont-trolley\"></i>', '<span> trolley </span>'),
(441, '<i class=\"icofont-trowel\"></i>', '<span> trowel </span>'),
(442, '<i class=\"icofont-under-construction-alt\"></i>', '<span> under-construction-alt </span>'),
(443, '<i class=\"icofont-under-construction\"></i>', '<span> under-construction </span>'),
(444, '<i class=\"icofont-vehicle-cement\"></i>', '<span> vehicle-cement </span>'),
(445, '<i class=\"icofont-vehicle-crane\"></i>', '<span> vehicle-crane </span>'),
(446, '<i class=\"icofont-vehicle-delivery-van\"></i>', '<span> vehicle-delivery-van </span>'),
(447, '<i class=\"icofont-vehicle-dozer\"></i>', '<span> vehicle-dozer </span>'),
(448, '<i class=\"icofont-vehicle-excavator\"></i>', '<span> vehicle-excavator </span>'),
(449, '<i class=\"icofont-vehicle-trucktor\"></i>', '<span> vehicle-trucktor </span>'),
(450, '<i class=\"icofont-vehicle-wrecking\"></i>', '<span> vehicle-wrecking </span>'),
(451, '<i class=\"icofont-worker\"></i>', '<span> worker </span>'),
(452, '<i class=\"icofont-workers-group\"></i>', '<span> workers-group </span>'),
(453, '<i class=\"icofont-wrench\"></i>', '<span> wrench </span>'),
(454, '<i class=\"icofont-afghani-false\"></i>', '<span> afghani-false </span>'),
(455, '<i class=\"icofont-afghani-minus\"></i>', '<span> afghani-minus </span>'),
(456, '<i class=\"icofont-afghani-plus\"></i>', '<span> afghani-plus </span>'),
(457, '<i class=\"icofont-afghani-true\"></i>', '<span> afghani-true </span>'),
(458, '<i class=\"icofont-afghani\"></i>', '<span> afghani </span>'),
(459, '<i class=\"icofont-baht-false\"></i>', '<span> baht-false </span>'),
(460, '<i class=\"icofont-baht-minus\"></i>', '<span> baht-minus </span>'),
(461, '<i class=\"icofont-baht-plus\"></i>', '<span> baht-plus </span>'),
(462, '<i class=\"icofont-baht-true\"></i>', '<span> baht-true </span>'),
(463, '<i class=\"icofont-baht\"></i>', '<span> baht </span>'),
(464, '<i class=\"icofont-bitcoin-false\"></i>', '<span> bitcoin-false </span>'),
(465, '<i class=\"icofont-bitcoin-minus\"></i>', '<span> bitcoin-minus </span>'),
(466, '<i class=\"icofont-bitcoin-plus\"></i>', '<span> bitcoin-plus </span>'),
(467, '<i class=\"icofont-bitcoin-true\"></i>', '<span> bitcoin-true </span>'),
(468, '<i class=\"icofont-bitcoin\"></i>', '<span> bitcoin </span>'),
(469, '<i class=\"icofont-dollar-flase\"></i>', '<span> dollar-flase </span>'),
(470, '<i class=\"icofont-dollar-minus\"></i>', '<span> dollar-minus </span>'),
(471, '<i class=\"icofont-dollar-plus\"></i>', '<span> dollar-plus </span>'),
(472, '<i class=\"icofont-dollar-true\"></i>', '<span> dollar-true </span>'),
(473, '<i class=\"icofont-dollar\"></i>', '<span> dollar </span>'),
(474, '<i class=\"icofont-dong-false\"></i>', '<span> dong-false </span>'),
(475, '<i class=\"icofont-dong-minus\"></i>', '<span> dong-minus </span>'),
(476, '<i class=\"icofont-dong-plus\"></i>', '<span> dong-plus </span>'),
(477, '<i class=\"icofont-dong-true\"></i>', '<span> dong-true </span>'),
(478, '<i class=\"icofont-dong\"></i>', '<span> dong </span>'),
(479, '<i class=\"icofont-euro-false\"></i>', '<span> euro-false </span>'),
(480, '<i class=\"icofont-euro-minus\"></i>', '<span> euro-minus </span>'),
(481, '<i class=\"icofont-euro-plus\"></i>', '<span> euro-plus </span>'),
(482, '<i class=\"icofont-euro-true\"></i>', '<span> euro-true </span>'),
(483, '<i class=\"icofont-euro\"></i>', '<span> euro </span>'),
(484, '<i class=\"icofont-frank-false\"></i>', '<span> frank-false </span>'),
(485, '<i class=\"icofont-frank-minus\"></i>', '<span> frank-minus </span>'),
(486, '<i class=\"icofont-frank-plus\"></i>', '<span> frank-plus </span>'),
(487, '<i class=\"icofont-frank-true\"></i>', '<span> frank-true </span>'),
(488, '<i class=\"icofont-frank\"></i>', '<span> frank </span>'),
(489, '<i class=\"icofont-hryvnia-false\"></i>', '<span> hryvnia-false </span>'),
(490, '<i class=\"icofont-hryvnia-minus\"></i>', '<span> hryvnia-minus </span>'),
(491, '<i class=\"icofont-hryvnia-plus\"></i>', '<span> hryvnia-plus </span>'),
(492, '<i class=\"icofont-hryvnia-true\"></i>', '<span> hryvnia-true </span>'),
(493, '<i class=\"icofont-hryvnia\"></i>', '<span> hryvnia </span>'),
(494, '<i class=\"icofont-lira-false\"></i>', '<span> lira-false </span>'),
(495, '<i class=\"icofont-lira-minus\"></i>', '<span> lira-minus </span>'),
(496, '<i class=\"icofont-lira-plus\"></i>', '<span> lira-plus </span>'),
(497, '<i class=\"icofont-lira-true\"></i>', '<span> lira-true </span>'),
(498, '<i class=\"icofont-lira\"></i>', '<span> lira </span>'),
(499, '<i class=\"icofont-peseta-false\"></i>', '<span> peseta-false </span>'),
(500, '<i class=\"icofont-peseta-minus\"></i>', '<span> peseta-minus </span>'),
(501, '<i class=\"icofont-peseta-plus\"></i>', '<span> peseta-plus </span>'),
(502, '<i class=\"icofont-peseta-true\"></i>', '<span> peseta-true </span>'),
(503, '<i class=\"icofont-peseta\"></i>', '<span> peseta </span>'),
(504, '<i class=\"icofont-peso-false\"></i>', '<span> peso-false </span>'),
(505, '<i class=\"icofont-peso-minus\"></i>', '<span> peso-minus </span>'),
(506, '<i class=\"icofont-peso-plus\"></i>', '<span> peso-plus </span>'),
(507, '<i class=\"icofont-peso-true\"></i>', '<span> peso-true </span>'),
(508, '<i class=\"icofont-peso\"></i>', '<span> peso </span>'),
(509, '<i class=\"icofont-pound-false\"></i>', '<span> pound-false </span>'),
(510, '<i class=\"icofont-pound-minus\"></i>', '<span> pound-minus </span>'),
(511, '<i class=\"icofont-pound-plus\"></i>', '<span> pound-plus </span>'),
(512, '<i class=\"icofont-pound-true\"></i>', '<span> pound-true </span>'),
(513, '<i class=\"icofont-pound\"></i>', '<span> pound </span>'),
(514, '<i class=\"icofont-renminbi-false\"></i>', '<span> renminbi-false </span>'),
(515, '<i class=\"icofont-renminbi-minus\"></i>', '<span> renminbi-minus </span>'),
(516, '<i class=\"icofont-renminbi-plus\"></i>', '<span> renminbi-plus </span>'),
(517, '<i class=\"icofont-renminbi-true\"></i>', '<span> renminbi-true </span>'),
(518, '<i class=\"icofont-renminbi\"></i>', '<span> renminbi </span>'),
(519, '<i class=\"icofont-riyal-false\"></i>', '<span> riyal-false </span>'),
(520, '<i class=\"icofont-riyal-minus\"></i>', '<span> riyal-minus </span>'),
(521, '<i class=\"icofont-riyal-plus\"></i>', '<span> riyal-plus </span>'),
(522, '<i class=\"icofont-riyal-true\"></i>', '<span> riyal-true </span>'),
(523, '<i class=\"icofont-riyal\"></i>', '<span> riyal </span>'),
(524, '<i class=\"icofont-rouble-false\"></i>', '<span> rouble-false </span>'),
(525, '<i class=\"icofont-rouble-minus\"></i>', '<span> rouble-minus </span>'),
(526, '<i class=\"icofont-rouble-plus\"></i>', '<span> rouble-plus </span>'),
(527, '<i class=\"icofont-rouble-true\"></i>', '<span> rouble-true </span>'),
(528, '<i class=\"icofont-rouble\"></i>', '<span> rouble </span>'),
(529, '<i class=\"icofont-rupee-false\"></i>', '<span> rupee-false </span>'),
(530, '<i class=\"icofont-rupee-minus\"></i>', '<span> rupee-minus </span>'),
(531, '<i class=\"icofont-rupee-plus\"></i>', '<span> rupee-plus </span>'),
(532, '<i class=\"icofont-rupee-true\"></i>', '<span> rupee-true </span>'),
(533, '<i class=\"icofont-rupee\"></i>', '<span> rupee </span>'),
(534, '<i class=\"icofont-taka-false\"></i>', '<span> taka-false </span>'),
(535, '<i class=\"icofont-taka-minus\"></i>', '<span> taka-minus </span>'),
(536, '<i class=\"icofont-taka-plus\"></i>', '<span> taka-plus </span>'),
(537, '<i class=\"icofont-taka-true\"></i>', '<span> taka-true </span>'),
(538, '<i class=\"icofont-taka\"></i>', '<span> taka </span>'),
(539, '<i class=\"icofont-turkish-lira-false\"></i>', '<span> turkish-lira-false </span>'),
(540, '<i class=\"icofont-turkish-lira-minus\"></i>', '<span> turkish-lira-minus </span>'),
(541, '<i class=\"icofont-turkish-lira-plus\"></i>', '<span> turkish-lira-plus </span>'),
(542, '<i class=\"icofont-turkish-lira-true\"></i>', '<span> turkish-lira-true </span>'),
(543, '<i class=\"icofont-turkish-lira\"></i>', '<span> turkish-lira </span>'),
(544, '<i class=\"icofont-won-false\"></i>', '<span> won-false </span>'),
(545, '<i class=\"icofont-won-minus\"></i>', '<span> won-minus </span>'),
(546, '<i class=\"icofont-won-plus\"></i>', '<span> won-plus </span>'),
(547, '<i class=\"icofont-won-true\"></i>', '<span> won-true </span>'),
(548, '<i class=\"icofont-won\"></i>', '<span> won </span>'),
(549, '<i class=\"icofont-yen-false\"></i>', '<span> yen-false </span>'),
(550, '<i class=\"icofont-yen-minus\"></i>', '<span> yen-minus </span>'),
(551, '<i class=\"icofont-yen-plus\"></i>', '<span> yen-plus </span>'),
(552, '<i class=\"icofont-yen-true\"></i>', '<span> yen-true </span>'),
(553, '<i class=\"icofont-yen\"></i>', '<span> yen </span>'),
(554, '<i class=\"icofont-android-nexus\"></i>', '<span> android-nexus </span>'),
(555, '<i class=\"icofont-android-tablet\"></i>', '<span> android-tablet </span>'),
(556, '<i class=\"icofont-apple-watch\"></i>', '<span> apple-watch </span>'),
(557, '<i class=\"icofont-drawing-tablet\"></i>', '<span> drawing-tablet </span>'),
(558, '<i class=\"icofont-earphone\"></i>', '<span> earphone </span>'),
(559, '<i class=\"icofont-flash-drive\"></i>', '<span> flash-drive </span>'),
(560, '<i class=\"icofont-game-console\"></i>', '<span> game-console </span>'),
(561, '<i class=\"icofont-game-controller\"></i>', '<span> game-controller </span>'),
(562, '<i class=\"icofont-game-pad\"></i>', '<span> game-pad </span>'),
(563, '<i class=\"icofont-game\"></i>', '<span> game </span>'),
(564, '<i class=\"icofont-headphone-alt-1\"></i>', '<span> headphone-alt-1 </span>'),
(565, '<i class=\"icofont-headphone-alt-2\"></i>', '<span> headphone-alt-2 </span>'),
(566, '<i class=\"icofont-headphone-alt-3\"></i>', '<span> headphone-alt-3 </span>'),
(567, '<i class=\"icofont-headphone-alt\"></i>', '<span> headphone-alt </span>'),
(568, '<i class=\"icofont-headphone\"></i>', '<span> headphone </span>'),
(569, '<i class=\"icofont-htc-one\"></i>', '<span> htc-one </span>'),
(570, '<i class=\"icofont-imac\"></i>', '<span> imac </span>'),
(571, '<i class=\"icofont-ipad\"></i>', '<span> ipad </span>'),
(572, '<i class=\"icofont-iphone\"></i>', '<span> iphone </span>'),
(573, '<i class=\"icofont-ipod-nano\"></i>', '<span> ipod-nano </span>'),
(574, '<i class=\"icofont-ipod-touch\"></i>', '<span> ipod-touch </span>'),
(575, '<i class=\"icofont-keyboard-alt\"></i>', '<span> keyboard-alt </span>'),
(576, '<i class=\"icofont-keyboard-wireless\"></i>', '<span> keyboard-wireless </span>'),
(577, '<i class=\"icofont-keyboard\"></i>', '<span> keyboard </span>'),
(578, '<i class=\"icofont-laptop-alt\"></i>', '<span> laptop-alt </span>'),
(579, '<i class=\"icofont-laptop\"></i>', '<span> laptop </span>'),
(580, '<i class=\"icofont-macbook\"></i>', '<span> macbook </span>'),
(581, '<i class=\"icofont-magic-mouse\"></i>', '<span> magic-mouse </span>'),
(582, '<i class=\"icofont-micro-chip\"></i>', '<span> micro-chip </span>'),
(583, '<i class=\"icofont-microphone-alt\"></i>', '<span> microphone-alt </span>'),
(584, '<i class=\"icofont-microphone\"></i>', '<span> microphone </span>'),
(585, '<i class=\"icofont-monitor\"></i>', '<span> monitor </span>'),
(586, '<i class=\"icofont-mouse\"></i>', '<span> mouse </span>'),
(587, '<i class=\"icofont-mp3-player\"></i>', '<span> mp3-player </span>'),
(588, '<i class=\"icofont-nintendo\"></i>', '<span> nintendo </span>'),
(589, '<i class=\"icofont-playstation-alt\"></i>', '<span> playstation-alt </span>'),
(590, '<i class=\"icofont-psvita\"></i>', '<span> psvita </span>'),
(591, '<i class=\"icofont-radio-mic\"></i>', '<span> radio-mic </span>'),
(592, '<i class=\"icofont-radio\"></i>', '<span> radio </span>'),
(593, '<i class=\"icofont-refrigerator\"></i>', '<span> refrigerator </span>'),
(594, '<i class=\"icofont-samsung-galaxy\"></i>', '<span> samsung-galaxy </span>'),
(595, '<i class=\"icofont-surface-tablet\"></i>', '<span> surface-tablet </span>'),
(596, '<i class=\"icofont-ui-head-phone\"></i>', '<span> ui-head-phone </span>'),
(597, '<i class=\"icofont-ui-keyboard\"></i>', '<span> ui-keyboard </span>'),
(598, '<i class=\"icofont-washing-machine\"></i>', '<span> washing-machine </span>'),
(599, '<i class=\"icofont-wifi-router\"></i>', '<span> wifi-router </span>'),
(600, '<i class=\"icofont-wii-u\"></i>', '<span> wii-u </span>'),
(601, '<i class=\"icofont-windows-lumia\"></i>', '<span> windows-lumia </span>'),
(602, '<i class=\"icofont-wireless-mouse\"></i>', '<span> wireless-mouse </span>'),
(603, '<i class=\"icofont-xbox-360\"></i>', '<span> xbox-360 </span>'),
(604, '<i class=\"icofont-arrow-down\"></i>', '<span> arrow-down </span>'),
(605, '<i class=\"icofont-arrow-left\"></i>', '<span> arrow-left </span>'),
(606, '<i class=\"icofont-arrow-right\"></i>', '<span> arrow-right </span>'),
(607, '<i class=\"icofont-arrow-up\"></i>', '<span> arrow-up </span>'),
(608, '<i class=\"icofont-block-down\"></i>', '<span> block-down </span>'),
(609, '<i class=\"icofont-block-left\"></i>', '<span> block-left </span>'),
(610, '<i class=\"icofont-block-right\"></i>', '<span> block-right </span>'),
(611, '<i class=\"icofont-block-up\"></i>', '<span> block-up </span>'),
(612, '<i class=\"icofont-bubble-down\"></i>', '<span> bubble-down </span>'),
(613, '<i class=\"icofont-bubble-left\"></i>', '<span> bubble-left </span>'),
(614, '<i class=\"icofont-bubble-right\"></i>', '<span> bubble-right </span>'),
(615, '<i class=\"icofont-bubble-up\"></i>', '<span> bubble-up </span>'),
(616, '<i class=\"icofont-caret-down\"></i>', '<span> caret-down </span>'),
(617, '<i class=\"icofont-caret-left\"></i>', '<span> caret-left </span>'),
(618, '<i class=\"icofont-caret-right\"></i>', '<span> caret-right </span>'),
(619, '<i class=\"icofont-caret-up\"></i>', '<span> caret-up </span>'),
(620, '<i class=\"icofont-circled-down\"></i>', '<span> circled-down </span>'),
(621, '<i class=\"icofont-circled-left\"></i>', '<span> circled-left </span>'),
(622, '<i class=\"icofont-circled-right\"></i>', '<span> circled-right </span>'),
(623, '<i class=\"icofont-circled-up\"></i>', '<span> circled-up </span>'),
(624, '<i class=\"icofont-collapse\"></i>', '<span> collapse </span>'),
(625, '<i class=\"icofont-cursor-drag\"></i>', '<span> cursor-drag </span>'),
(626, '<i class=\"icofont-curved-double-left\"></i>', '<span> curved-double-left </span>'),
(627, '<i class=\"icofont-curved-double-right\"></i>', '<span> curved-double-right </span>'),
(628, '<i class=\"icofont-curved-down\"></i>', '<span> curved-down </span>'),
(629, '<i class=\"icofont-curved-left\"></i>', '<span> curved-left </span>'),
(630, '<i class=\"icofont-curved-right\"></i>', '<span> curved-right </span>'),
(631, '<i class=\"icofont-curved-up\"></i>', '<span> curved-up </span>'),
(632, '<i class=\"icofont-dotted-down\"></i>', '<span> dotted-down </span>'),
(633, '<i class=\"icofont-dotted-left\"></i>', '<span> dotted-left </span>'),
(634, '<i class=\"icofont-dotted-right\"></i>', '<span> dotted-right </span>'),
(635, '<i class=\"icofont-dotted-up\"></i>', '<span> dotted-up </span>'),
(636, '<i class=\"icofont-double-left\"></i>', '<span> double-left </span>'),
(637, '<i class=\"icofont-double-right\"></i>', '<span> double-right </span>'),
(638, '<i class=\"icofont-expand-alt\"></i>', '<span> expand-alt </span>'),
(639, '<i class=\"icofont-hand-down\"></i>', '<span> hand-down </span>'),
(640, '<i class=\"icofont-hand-drag\"></i>', '<span> hand-drag </span>'),
(641, '<i class=\"icofont-hand-drag1\"></i>', '<span> hand-drag1 </span>'),
(642, '<i class=\"icofont-hand-drag2\"></i>', '<span> hand-drag2 </span>'),
(643, '<i class=\"icofont-hand-drawn-alt-down\"></i>', '<span> hand-drawn-alt-down </span>'),
(644, '<i class=\"icofont-hand-drawn-alt-left\"></i>', '<span> hand-drawn-alt-left </span>'),
(645, '<i class=\"icofont-hand-drawn-alt-right\"></i>', '<span> hand-drawn-alt-right </span>'),
(646, '<i class=\"icofont-hand-drawn-alt-up\"></i>', '<span> hand-drawn-alt-up </span>'),
(647, '<i class=\"icofont-hand-drawn-down\"></i>', '<span> hand-drawn-down </span>'),
(648, '<i class=\"icofont-hand-drawn-left\"></i>', '<span> hand-drawn-left </span>'),
(649, '<i class=\"icofont-hand-drawn-right\"></i>', '<span> hand-drawn-right </span>'),
(650, '<i class=\"icofont-hand-drawn-up\"></i>', '<span> hand-drawn-up </span>'),
(651, '<i class=\"icofont-hand-grippers\"></i>', '<span> hand-grippers </span>'),
(652, '<i class=\"icofont-hand-left\"></i>', '<span> hand-left </span>'),
(653, '<i class=\"icofont-hand-right\"></i>', '<span> hand-right </span>'),
(654, '<i class=\"icofont-hand-up\"></i>', '<span> hand-up </span>'),
(655, '<i class=\"icofont-line-block-down\"></i>', '<span> line-block-down </span>'),
(656, '<i class=\"icofont-line-block-left\"></i>', '<span> line-block-left </span>'),
(657, '<i class=\"icofont-line-block-right\"></i>', '<span> line-block-right </span>'),
(658, '<i class=\"icofont-line-block-up\"></i>', '<span> line-block-up </span>'),
(659, '<i class=\"icofont-long-arrow-down\"></i>', '<span> long-arrow-down </span>'),
(660, '<i class=\"icofont-long-arrow-left\"></i>', '<span> long-arrow-left </span>'),
(661, '<i class=\"icofont-long-arrow-right\"></i>', '<span> long-arrow-right </span>'),
(662, '<i class=\"icofont-long-arrow-up\"></i>', '<span> long-arrow-up </span>');
INSERT INTO `icon_set` (`id`, `icon`, `name`) VALUES
(663, '<i class=\"icofont-rounded-collapse\"></i>', '<span> rounded-collapse </span>'),
(664, '<i class=\"icofont-rounded-double-left\"></i>', '<span> rounded-double-left </span>'),
(665, '<i class=\"icofont-rounded-double-right\"></i>', '<span> rounded-double-right </span>'),
(666, '<i class=\"icofont-rounded-down\"></i>', '<span> rounded-down </span>'),
(667, '<i class=\"icofont-rounded-expand\"></i>', '<span> rounded-expand </span>'),
(668, '<i class=\"icofont-rounded-left-down\"></i>', '<span> rounded-left-down </span>'),
(669, '<i class=\"icofont-rounded-left-up\"></i>', '<span> rounded-left-up </span>'),
(670, '<i class=\"icofont-rounded-left\"></i>', '<span> rounded-left </span>'),
(671, '<i class=\"icofont-rounded-right-down\"></i>', '<span> rounded-right-down </span>'),
(672, '<i class=\"icofont-rounded-right-up\"></i>', '<span> rounded-right-up </span>'),
(673, '<i class=\"icofont-rounded-right\"></i>', '<span> rounded-right </span>'),
(674, '<i class=\"icofont-rounded-up\"></i>', '<span> rounded-up </span>'),
(675, '<i class=\"icofont-scroll-bubble-down\"></i>', '<span> scroll-bubble-down </span>'),
(676, '<i class=\"icofont-scroll-bubble-left\"></i>', '<span> scroll-bubble-left </span>'),
(677, '<i class=\"icofont-scroll-bubble-right\"></i>', '<span> scroll-bubble-right </span>'),
(678, '<i class=\"icofont-scroll-bubble-up\"></i>', '<span> scroll-bubble-up </span>'),
(679, '<i class=\"icofont-scroll-double-down\"></i>', '<span> scroll-double-down </span>'),
(680, '<i class=\"icofont-scroll-double-left\"></i>', '<span> scroll-double-left </span>'),
(681, '<i class=\"icofont-scroll-double-right\"></i>', '<span> scroll-double-right </span>'),
(682, '<i class=\"icofont-scroll-double-up\"></i>', '<span> scroll-double-up </span>'),
(683, '<i class=\"icofont-scroll-down\"></i>', '<span> scroll-down </span>'),
(684, '<i class=\"icofont-scroll-left\"></i>', '<span> scroll-left </span>'),
(685, '<i class=\"icofont-scroll-long-down\"></i>', '<span> scroll-long-down </span>'),
(686, '<i class=\"icofont-scroll-long-left\"></i>', '<span> scroll-long-left </span>'),
(687, '<i class=\"icofont-scroll-long-right\"></i>', '<span> scroll-long-right </span>'),
(688, '<i class=\"icofont-scroll-long-up\"></i>', '<span> scroll-long-up </span>'),
(689, '<i class=\"icofont-scroll-right\"></i>', '<span> scroll-right </span>'),
(690, '<i class=\"icofont-scroll-up\"></i>', '<span> scroll-up </span>'),
(691, '<i class=\"icofont-simple-down\"></i>', '<span> simple-down </span>'),
(692, '<i class=\"icofont-simple-left-down\"></i>', '<span> simple-left-down </span>'),
(693, '<i class=\"icofont-simple-left-up\"></i>', '<span> simple-left-up </span>'),
(694, '<i class=\"icofont-simple-left\"></i>', '<span> simple-left </span>'),
(695, '<i class=\"icofont-simple-right-down\"></i>', '<span> simple-right-down </span>'),
(696, '<i class=\"icofont-simple-right-up\"></i>', '<span> simple-right-up </span>'),
(697, '<i class=\"icofont-simple-right\"></i>', '<span> simple-right </span>'),
(698, '<i class=\"icofont-simple-up\"></i>', '<span> simple-up </span>'),
(699, '<i class=\"icofont-square-down\"></i>', '<span> square-down </span>'),
(700, '<i class=\"icofont-square-left\"></i>', '<span> square-left </span>'),
(701, '<i class=\"icofont-square-right\"></i>', '<span> square-right </span>'),
(702, '<i class=\"icofont-square-up\"></i>', '<span> square-up </span>'),
(703, '<i class=\"icofont-stylish-down\"></i>', '<span> stylish-down </span>'),
(704, '<i class=\"icofont-stylish-left\"></i>', '<span> stylish-left </span>'),
(705, '<i class=\"icofont-stylish-right\"></i>', '<span> stylish-right </span>'),
(706, '<i class=\"icofont-stylish-up\"></i>', '<span> stylish-up </span>'),
(707, '<i class=\"icofont-swoosh-down\"></i>', '<span> swoosh-down </span>'),
(708, '<i class=\"icofont-swoosh-left\"></i>', '<span> swoosh-left </span>'),
(709, '<i class=\"icofont-swoosh-right\"></i>', '<span> swoosh-right </span>'),
(710, '<i class=\"icofont-swoosh-up\"></i>', '<span> swoosh-up </span>'),
(711, '<i class=\"icofont-thin-double-left\"></i>', '<span> thin-double-left </span>'),
(712, '<i class=\"icofont-thin-double-right\"></i>', '<span> thin-double-right </span>'),
(713, '<i class=\"icofont-thin-down\"></i>', '<span> thin-down </span>'),
(714, '<i class=\"icofont-thin-left\"></i>', '<span> thin-left </span>'),
(715, '<i class=\"icofont-thin-right\"></i>', '<span> thin-right </span>'),
(716, '<i class=\"icofont-thin-up\"></i>', '<span> thin-up </span>'),
(717, '<i class=\"icofont-abc\"></i>', '<span> abc </span>'),
(718, '<i class=\"icofont-atom\"></i>', '<span> atom </span>'),
(719, '<i class=\"icofont-award\"></i>', '<span> award </span>'),
(720, '<i class=\"icofont-bell-alt\"></i>', '<span> bell-alt </span>'),
(721, '<i class=\"icofont-black-board\"></i>', '<span> black-board </span>'),
(722, '<i class=\"icofont-book-alt\"></i>', '<span> book-alt </span>'),
(723, '<i class=\"icofont-book\"></i>', '<span> book </span>'),
(724, '<i class=\"icofont-brainstorming\"></i>', '<span> brainstorming </span>'),
(725, '<i class=\"icofont-certificate-alt-1\"></i>', '<span> certificate-alt-1 </span>'),
(726, '<i class=\"icofont-certificate-alt-2\"></i>', '<span> certificate-alt-2 </span>'),
(727, '<i class=\"icofont-certificate\"></i>', '<span> certificate </span>'),
(728, '<i class=\"icofont-education\"></i>', '<span> education </span>'),
(729, '<i class=\"icofont-electron\"></i>', '<span> electron </span>'),
(730, '<i class=\"icofont-fountain-pen\"></i>', '<span> fountain-pen </span>'),
(731, '<i class=\"icofont-globe-alt\"></i>', '<span> globe-alt </span>'),
(732, '<i class=\"icofont-graduate-alt\"></i>', '<span> graduate-alt </span>'),
(733, '<i class=\"icofont-graduate\"></i>', '<span> graduate </span>'),
(734, '<i class=\"icofont-group-students\"></i>', '<span> group-students </span>'),
(735, '<i class=\"icofont-hat-alt\"></i>', '<span> hat-alt </span>'),
(736, '<i class=\"icofont-hat\"></i>', '<span> hat </span>'),
(737, '<i class=\"icofont-instrument\"></i>', '<span> instrument </span>'),
(738, '<i class=\"icofont-lamp-light\"></i>', '<span> lamp-light </span>'),
(739, '<i class=\"icofont-medal\"></i>', '<span> medal </span>'),
(740, '<i class=\"icofont-microscope-alt\"></i>', '<span> microscope-alt </span>'),
(741, '<i class=\"icofont-microscope\"></i>', '<span> microscope </span>'),
(742, '<i class=\"icofont-paper\"></i>', '<span> paper </span>'),
(743, '<i class=\"icofont-pen-alt-4\"></i>', '<span> pen-alt-4 </span>'),
(744, '<i class=\"icofont-pen-nib\"></i>', '<span> pen-nib </span>'),
(745, '<i class=\"icofont-pencil-alt-5\"></i>', '<span> pencil-alt-5 </span>'),
(746, '<i class=\"icofont-quill-pen\"></i>', '<span> quill-pen </span>'),
(747, '<i class=\"icofont-read-book-alt\"></i>', '<span> read-book-alt </span>'),
(748, '<i class=\"icofont-read-book\"></i>', '<span> read-book </span>'),
(749, '<i class=\"icofont-school-bag\"></i>', '<span> school-bag </span>'),
(750, '<i class=\"icofont-school-bus\"></i>', '<span> school-bus </span>'),
(751, '<i class=\"icofont-student-alt\"></i>', '<span> student-alt </span>'),
(752, '<i class=\"icofont-student\"></i>', '<span> student </span>'),
(753, '<i class=\"icofont-teacher\"></i>', '<span> teacher </span>'),
(754, '<i class=\"icofont-test-bulb\"></i>', '<span> test-bulb </span>'),
(755, '<i class=\"icofont-test-tube-alt\"></i>', '<span> test-tube-alt </span>'),
(756, '<i class=\"icofont-university\"></i>', '<span> university </span>'),
(757, '<i class=\"icofont-angry\"></i>', '<span> angry </span>'),
(758, '<i class=\"icofont-astonished\"></i>', '<span> astonished </span>'),
(759, '<i class=\"icofont-confounded\"></i>', '<span> confounded </span>'),
(760, '<i class=\"icofont-confused\"></i>', '<span> confused </span>'),
(761, '<i class=\"icofont-crying\"></i>', '<span> crying </span>'),
(762, '<i class=\"icofont-dizzy\"></i>', '<span> dizzy </span>'),
(763, '<i class=\"icofont-expressionless\"></i>', '<span> expressionless </span>'),
(764, '<i class=\"icofont-heart-eyes\"></i>', '<span> heart-eyes </span>'),
(765, '<i class=\"icofont-laughing\"></i>', '<span> laughing </span>'),
(766, '<i class=\"icofont-nerd-smile\"></i>', '<span> nerd-smile </span>'),
(767, '<i class=\"icofont-open-mouth\"></i>', '<span> open-mouth </span>'),
(768, '<i class=\"icofont-rage\"></i>', '<span> rage </span>'),
(769, '<i class=\"icofont-rolling-eyes\"></i>', '<span> rolling-eyes </span>'),
(770, '<i class=\"icofont-sad\"></i>', '<span> sad </span>'),
(771, '<i class=\"icofont-simple-smile\"></i>', '<span> simple-smile </span>'),
(772, '<i class=\"icofont-slightly-smile\"></i>', '<span> slightly-smile </span>'),
(773, '<i class=\"icofont-smirk\"></i>', '<span> smirk </span>'),
(774, '<i class=\"icofont-stuck-out-tongue\"></i>', '<span> stuck-out-tongue </span>'),
(775, '<i class=\"icofont-wink-smile\"></i>', '<span> wink-smile </span>'),
(776, '<i class=\"icofont-worried\"></i>', '<span> worried </span>'),
(777, '<i class=\"icofont-file-alt\"></i>', '<span> file-alt </span>'),
(778, '<i class=\"icofont-file-audio\"></i>', '<span> file-audio </span>'),
(779, '<i class=\"icofont-file-avi-mp4\"></i>', '<span> file-avi-mp4 </span>'),
(780, '<i class=\"icofont-file-bmp\"></i>', '<span> file-bmp </span>'),
(781, '<i class=\"icofont-file-code\"></i>', '<span> file-code </span>'),
(782, '<i class=\"icofont-file-css\"></i>', '<span> file-css </span>'),
(783, '<i class=\"icofont-file-document\"></i>', '<span> file-document </span>'),
(784, '<i class=\"icofont-file-eps\"></i>', '<span> file-eps </span>'),
(785, '<i class=\"icofont-file-excel\"></i>', '<span> file-excel </span>'),
(786, '<i class=\"icofont-file-exe\"></i>', '<span> file-exe </span>'),
(787, '<i class=\"icofont-file-file\"></i>', '<span> file-file </span>'),
(788, '<i class=\"icofont-file-flv\"></i>', '<span> file-flv </span>'),
(789, '<i class=\"icofont-file-gif\"></i>', '<span> file-gif </span>'),
(790, '<i class=\"icofont-file-html5\"></i>', '<span> file-html5 </span>'),
(791, '<i class=\"icofont-file-image\"></i>', '<span> file-image </span>'),
(792, '<i class=\"icofont-file-iso\"></i>', '<span> file-iso </span>'),
(793, '<i class=\"icofont-file-java\"></i>', '<span> file-java </span>'),
(794, '<i class=\"icofont-file-javascript\"></i>', '<span> file-javascript </span>'),
(795, '<i class=\"icofont-file-jpg\"></i>', '<span> file-jpg </span>'),
(796, '<i class=\"icofont-file-midi\"></i>', '<span> file-midi </span>'),
(797, '<i class=\"icofont-file-mov\"></i>', '<span> file-mov </span>'),
(798, '<i class=\"icofont-file-mp3\"></i>', '<span> file-mp3 </span>'),
(799, '<i class=\"icofont-file-pdf\"></i>', '<span> file-pdf </span>'),
(800, '<i class=\"icofont-file-php\"></i>', '<span> file-php </span>'),
(801, '<i class=\"icofont-file-png\"></i>', '<span> file-png </span>'),
(802, '<i class=\"icofont-file-powerpoint\"></i>', '<span> file-powerpoint </span>'),
(803, '<i class=\"icofont-file-presentation\"></i>', '<span> file-presentation </span>'),
(804, '<i class=\"icofont-file-psb\"></i>', '<span> file-psb </span>'),
(805, '<i class=\"icofont-file-psd\"></i>', '<span> file-psd </span>'),
(806, '<i class=\"icofont-file-python\"></i>', '<span> file-python </span>'),
(807, '<i class=\"icofont-file-ruby\"></i>', '<span> file-ruby </span>'),
(808, '<i class=\"icofont-file-spreadsheet\"></i>', '<span> file-spreadsheet </span>'),
(809, '<i class=\"icofont-file-sql\"></i>', '<span> file-sql </span>'),
(810, '<i class=\"icofont-file-svg\"></i>', '<span> file-svg </span>'),
(811, '<i class=\"icofont-file-text\"></i>', '<span> file-text </span>'),
(812, '<i class=\"icofont-file-tiff\"></i>', '<span> file-tiff </span>'),
(813, '<i class=\"icofont-file-video\"></i>', '<span> file-video </span>'),
(814, '<i class=\"icofont-file-wave\"></i>', '<span> file-wave </span>'),
(815, '<i class=\"icofont-file-wmv\"></i>', '<span> file-wmv </span>'),
(816, '<i class=\"icofont-file-word\"></i>', '<span> file-word </span>'),
(817, '<i class=\"icofont-file-zip\"></i>', '<span> file-zip </span>'),
(818, '<i class=\"icofont-cycling-alt\"></i>', '<span> cycling-alt </span>'),
(819, '<i class=\"icofont-cycling\"></i>', '<span> cycling </span>'),
(820, '<i class=\"icofont-dumbbell\"></i>', '<span> dumbbell </span>'),
(821, '<i class=\"icofont-dumbbells\"></i>', '<span> dumbbells </span>'),
(822, '<i class=\"icofont-gym-alt-1\"></i>', '<span> gym-alt-1 </span>'),
(823, '<i class=\"icofont-gym-alt-2\"></i>', '<span> gym-alt-2 </span>'),
(824, '<i class=\"icofont-gym-alt-3\"></i>', '<span> gym-alt-3 </span>'),
(825, '<i class=\"icofont-gym\"></i>', '<span> gym </span>'),
(826, '<i class=\"icofont-muscle-weight\"></i>', '<span> muscle-weight </span>'),
(827, '<i class=\"icofont-muscle\"></i>', '<span> muscle </span>'),
(828, '<i class=\"icofont-apple\"></i>', '<span> apple </span>'),
(829, '<i class=\"icofont-arabian-coffee\"></i>', '<span> arabian-coffee </span>'),
(830, '<i class=\"icofont-artichoke\"></i>', '<span> artichoke </span>'),
(831, '<i class=\"icofont-asparagus\"></i>', '<span> asparagus </span>'),
(832, '<i class=\"icofont-avocado\"></i>', '<span> avocado </span>'),
(833, '<i class=\"icofont-baby-food\"></i>', '<span> baby-food </span>'),
(834, '<i class=\"icofont-banana\"></i>', '<span> banana </span>'),
(835, '<i class=\"icofont-bbq\"></i>', '<span> bbq </span>'),
(836, '<i class=\"icofont-beans\"></i>', '<span> beans </span>'),
(837, '<i class=\"icofont-beer\"></i>', '<span> beer </span>'),
(838, '<i class=\"icofont-bell-pepper-capsicum\"></i>', '<span> bell-pepper-capsicum </span>'),
(839, '<i class=\"icofont-birthday-cake\"></i>', '<span> birthday-cake </span>'),
(840, '<i class=\"icofont-bread\"></i>', '<span> bread </span>'),
(841, '<i class=\"icofont-broccoli\"></i>', '<span> broccoli </span>'),
(842, '<i class=\"icofont-burger\"></i>', '<span> burger </span>'),
(843, '<i class=\"icofont-cabbage\"></i>', '<span> cabbage </span>'),
(844, '<i class=\"icofont-carrot\"></i>', '<span> carrot </span>'),
(845, '<i class=\"icofont-cauli-flower\"></i>', '<span> cauli-flower </span>'),
(846, '<i class=\"icofont-cheese\"></i>', '<span> cheese </span>'),
(847, '<i class=\"icofont-chef\"></i>', '<span> chef </span>'),
(848, '<i class=\"icofont-cherry\"></i>', '<span> cherry </span>'),
(849, '<i class=\"icofont-chicken-fry\"></i>', '<span> chicken-fry </span>'),
(850, '<i class=\"icofont-chicken\"></i>', '<span> chicken </span>'),
(851, '<i class=\"icofont-cocktail\"></i>', '<span> cocktail </span>'),
(852, '<i class=\"icofont-coconut-water\"></i>', '<span> coconut-water </span>'),
(853, '<i class=\"icofont-coconut\"></i>', '<span> coconut </span>'),
(854, '<i class=\"icofont-coffee-alt\"></i>', '<span> coffee-alt </span>'),
(855, '<i class=\"icofont-coffee-cup\"></i>', '<span> coffee-cup </span>'),
(856, '<i class=\"icofont-coffee-mug\"></i>', '<span> coffee-mug </span>'),
(857, '<i class=\"icofont-coffee-pot\"></i>', '<span> coffee-pot </span>'),
(858, '<i class=\"icofont-cola\"></i>', '<span> cola </span>'),
(859, '<i class=\"icofont-corn\"></i>', '<span> corn </span>'),
(860, '<i class=\"icofont-croissant\"></i>', '<span> croissant </span>'),
(861, '<i class=\"icofont-crop-plant\"></i>', '<span> crop-plant </span>'),
(862, '<i class=\"icofont-cucumber\"></i>', '<span> cucumber </span>'),
(863, '<i class=\"icofont-culinary\"></i>', '<span> culinary </span>'),
(864, '<i class=\"icofont-cup-cake\"></i>', '<span> cup-cake </span>'),
(865, '<i class=\"icofont-dining-table\"></i>', '<span> dining-table </span>'),
(866, '<i class=\"icofont-donut\"></i>', '<span> donut </span>'),
(867, '<i class=\"icofont-egg-plant\"></i>', '<span> egg-plant </span>'),
(868, '<i class=\"icofont-egg-poached\"></i>', '<span> egg-poached </span>'),
(869, '<i class=\"icofont-farmer-alt\"></i>', '<span> farmer-alt </span>'),
(870, '<i class=\"icofont-farmer\"></i>', '<span> farmer </span>'),
(871, '<i class=\"icofont-fast-food\"></i>', '<span> fast-food </span>'),
(872, '<i class=\"icofont-food-basket\"></i>', '<span> food-basket </span>'),
(873, '<i class=\"icofont-food-cart\"></i>', '<span> food-cart </span>'),
(874, '<i class=\"icofont-fork-and-knife\"></i>', '<span> fork-and-knife </span>'),
(875, '<i class=\"icofont-french-fries\"></i>', '<span> french-fries </span>'),
(876, '<i class=\"icofont-fruits\"></i>', '<span> fruits </span>'),
(877, '<i class=\"icofont-grapes\"></i>', '<span> grapes </span>'),
(878, '<i class=\"icofont-honey\"></i>', '<span> honey </span>'),
(879, '<i class=\"icofont-hot-dog\"></i>', '<span> hot-dog </span>'),
(880, '<i class=\"icofont-ice-cream-alt\"></i>', '<span> ice-cream-alt </span>'),
(881, '<i class=\"icofont-ice-cream\"></i>', '<span> ice-cream </span>'),
(882, '<i class=\"icofont-juice\"></i>', '<span> juice </span>'),
(883, '<i class=\"icofont-ketchup\"></i>', '<span> ketchup </span>'),
(884, '<i class=\"icofont-kiwi\"></i>', '<span> kiwi </span>'),
(885, '<i class=\"icofont-layered-cake\"></i>', '<span> layered-cake </span>'),
(886, '<i class=\"icofont-lemon-alt\"></i>', '<span> lemon-alt </span>'),
(887, '<i class=\"icofont-lemon\"></i>', '<span> lemon </span>'),
(888, '<i class=\"icofont-lobster\"></i>', '<span> lobster </span>'),
(889, '<i class=\"icofont-mango\"></i>', '<span> mango </span>'),
(890, '<i class=\"icofont-milk\"></i>', '<span> milk </span>'),
(891, '<i class=\"icofont-mushroom\"></i>', '<span> mushroom </span>'),
(892, '<i class=\"icofont-noodles\"></i>', '<span> noodles </span>'),
(893, '<i class=\"icofont-onion\"></i>', '<span> onion </span>'),
(894, '<i class=\"icofont-orange\"></i>', '<span> orange </span>'),
(895, '<i class=\"icofont-pear\"></i>', '<span> pear </span>'),
(896, '<i class=\"icofont-peas\"></i>', '<span> peas </span>'),
(897, '<i class=\"icofont-pepper\"></i>', '<span> pepper </span>'),
(898, '<i class=\"icofont-pie-alt\"></i>', '<span> pie-alt </span>'),
(899, '<i class=\"icofont-pie\"></i>', '<span> pie </span>'),
(900, '<i class=\"icofont-pineapple\"></i>', '<span> pineapple </span>'),
(901, '<i class=\"icofont-pizza-slice\"></i>', '<span> pizza-slice </span>'),
(902, '<i class=\"icofont-pizza\"></i>', '<span> pizza </span>'),
(903, '<i class=\"icofont-plant\"></i>', '<span> plant </span>'),
(904, '<i class=\"icofont-popcorn\"></i>', '<span> popcorn </span>'),
(905, '<i class=\"icofont-potato\"></i>', '<span> potato </span>'),
(906, '<i class=\"icofont-pumpkin\"></i>', '<span> pumpkin </span>'),
(907, '<i class=\"icofont-raddish\"></i>', '<span> raddish </span>'),
(908, '<i class=\"icofont-restaurant-menu\"></i>', '<span> restaurant-menu </span>'),
(909, '<i class=\"icofont-restaurant\"></i>', '<span> restaurant </span>'),
(910, '<i class=\"icofont-salt-and-pepper\"></i>', '<span> salt-and-pepper </span>'),
(911, '<i class=\"icofont-sandwich\"></i>', '<span> sandwich </span>'),
(912, '<i class=\"icofont-sausage\"></i>', '<span> sausage </span>'),
(913, '<i class=\"icofont-soft-drinks\"></i>', '<span> soft-drinks </span>'),
(914, '<i class=\"icofont-soup-bowl\"></i>', '<span> soup-bowl </span>'),
(915, '<i class=\"icofont-spoon-and-fork\"></i>', '<span> spoon-and-fork </span>'),
(916, '<i class=\"icofont-steak\"></i>', '<span> steak </span>'),
(917, '<i class=\"icofont-strawberry\"></i>', '<span> strawberry </span>'),
(918, '<i class=\"icofont-sub-sandwich\"></i>', '<span> sub-sandwich </span>'),
(919, '<i class=\"icofont-sushi\"></i>', '<span> sushi </span>'),
(920, '<i class=\"icofont-taco\"></i>', '<span> taco </span>'),
(921, '<i class=\"icofont-tea-pot\"></i>', '<span> tea-pot </span>'),
(922, '<i class=\"icofont-tea\"></i>', '<span> tea </span>'),
(923, '<i class=\"icofont-tomato\"></i>', '<span> tomato </span>'),
(924, '<i class=\"icofont-watermelon\"></i>', '<span> watermelon </span>'),
(925, '<i class=\"icofont-wheat\"></i>', '<span> wheat </span>'),
(926, '<i class=\"icofont-baby-backpack\"></i>', '<span> baby-backpack </span>'),
(927, '<i class=\"icofont-baby-cloth\"></i>', '<span> baby-cloth </span>'),
(928, '<i class=\"icofont-baby-milk-bottle\"></i>', '<span> baby-milk-bottle </span>'),
(929, '<i class=\"icofont-baby-trolley\"></i>', '<span> baby-trolley </span>'),
(930, '<i class=\"icofont-baby\"></i>', '<span> baby </span>'),
(931, '<i class=\"icofont-candy\"></i>', '<span> candy </span>'),
(932, '<i class=\"icofont-holding-hands\"></i>', '<span> holding-hands </span>'),
(933, '<i class=\"icofont-infant-nipple\"></i>', '<span> infant-nipple </span>'),
(934, '<i class=\"icofont-kids-scooter\"></i>', '<span> kids-scooter </span>'),
(935, '<i class=\"icofont-safety-pin\"></i>', '<span> safety-pin </span>'),
(936, '<i class=\"icofont-teddy-bear\"></i>', '<span> teddy-bear </span>'),
(937, '<i class=\"icofont-toy-ball\"></i>', '<span> toy-ball </span>'),
(938, '<i class=\"icofont-toy-cat\"></i>', '<span> toy-cat </span>'),
(939, '<i class=\"icofont-toy-duck\"></i>', '<span> toy-duck </span>'),
(940, '<i class=\"icofont-toy-elephant\"></i>', '<span> toy-elephant </span>'),
(941, '<i class=\"icofont-toy-hand\"></i>', '<span> toy-hand </span>'),
(942, '<i class=\"icofont-toy-horse\"></i>', '<span> toy-horse </span>'),
(943, '<i class=\"icofont-toy-lattu\"></i>', '<span> toy-lattu </span>'),
(944, '<i class=\"icofont-toy-train\"></i>', '<span> toy-train </span>'),
(945, '<i class=\"icofont-burglar\"></i>', '<span> burglar </span>'),
(946, '<i class=\"icofont-cannon-firing\"></i>', '<span> cannon-firing </span>'),
(947, '<i class=\"icofont-cc-camera\"></i>', '<span> cc-camera </span>'),
(948, '<i class=\"icofont-cop-badge\"></i>', '<span> cop-badge </span>'),
(949, '<i class=\"icofont-cop\"></i>', '<span> cop </span>'),
(950, '<i class=\"icofont-court-hammer\"></i>', '<span> court-hammer </span>'),
(951, '<i class=\"icofont-court\"></i>', '<span> court </span>'),
(952, '<i class=\"icofont-finger-print\"></i>', '<span> finger-print </span>'),
(953, '<i class=\"icofont-gavel\"></i>', '<span> gavel </span>'),
(954, '<i class=\"icofont-handcuff-alt\"></i>', '<span> handcuff-alt </span>'),
(955, '<i class=\"icofont-handcuff\"></i>', '<span> handcuff </span>'),
(956, '<i class=\"icofont-investigation\"></i>', '<span> investigation </span>'),
(957, '<i class=\"icofont-investigator\"></i>', '<span> investigator </span>'),
(958, '<i class=\"icofont-jail\"></i>', '<span> jail </span>'),
(959, '<i class=\"icofont-judge\"></i>', '<span> judge </span>'),
(960, '<i class=\"icofont-law-alt-1\"></i>', '<span> law-alt-1 </span>'),
(961, '<i class=\"icofont-law-alt-2\"></i>', '<span> law-alt-2 </span>'),
(962, '<i class=\"icofont-law-alt-3\"></i>', '<span> law-alt-3 </span>'),
(963, '<i class=\"icofont-law-book\"></i>', '<span> law-book </span>'),
(964, '<i class=\"icofont-law-document\"></i>', '<span> law-document </span>'),
(965, '<i class=\"icofont-law-order\"></i>', '<span> law-order </span>'),
(966, '<i class=\"icofont-law-protect\"></i>', '<span> law-protect </span>'),
(967, '<i class=\"icofont-law-scales\"></i>', '<span> law-scales </span>'),
(968, '<i class=\"icofont-law\"></i>', '<span> law </span>'),
(969, '<i class=\"icofont-lawyer-alt-1\"></i>', '<span> lawyer-alt-1 </span>'),
(970, '<i class=\"icofont-lawyer-alt-2\"></i>', '<span> lawyer-alt-2 </span>'),
(971, '<i class=\"icofont-lawyer\"></i>', '<span> lawyer </span>'),
(972, '<i class=\"icofont-legal\"></i>', '<span> legal </span>'),
(973, '<i class=\"icofont-pistol\"></i>', '<span> pistol </span>'),
(974, '<i class=\"icofont-police-badge\"></i>', '<span> police-badge </span>'),
(975, '<i class=\"icofont-police-cap\"></i>', '<span> police-cap </span>'),
(976, '<i class=\"icofont-police-car-alt-1\"></i>', '<span> police-car-alt-1 </span>'),
(977, '<i class=\"icofont-police-car-alt-2\"></i>', '<span> police-car-alt-2 </span>'),
(978, '<i class=\"icofont-police-car\"></i>', '<span> police-car </span>'),
(979, '<i class=\"icofont-police-hat\"></i>', '<span> police-hat </span>'),
(980, '<i class=\"icofont-police-van\"></i>', '<span> police-van </span>'),
(981, '<i class=\"icofont-police\"></i>', '<span> police </span>'),
(982, '<i class=\"icofont-thief-alt\"></i>', '<span> thief-alt </span>'),
(983, '<i class=\"icofont-thief\"></i>', '<span> thief </span>'),
(984, '<i class=\"icofont-abacus-alt\"></i>', '<span> abacus-alt </span>'),
(985, '<i class=\"icofont-abacus\"></i>', '<span> abacus </span>'),
(986, '<i class=\"icofont-angle-180\"></i>', '<span> angle-180 </span>'),
(987, '<i class=\"icofont-angle-45\"></i>', '<span> angle-45 </span>'),
(988, '<i class=\"icofont-angle-90\"></i>', '<span> angle-90 </span>'),
(989, '<i class=\"icofont-angle\"></i>', '<span> angle </span>'),
(990, '<i class=\"icofont-calculator-alt-1\"></i>', '<span> calculator-alt-1 </span>'),
(991, '<i class=\"icofont-calculator-alt-2\"></i>', '<span> calculator-alt-2 </span>'),
(992, '<i class=\"icofont-calculator\"></i>', '<span> calculator </span>'),
(993, '<i class=\"icofont-circle-ruler-alt\"></i>', '<span> circle-ruler-alt </span>'),
(994, '<i class=\"icofont-circle-ruler\"></i>', '<span> circle-ruler </span>'),
(995, '<i class=\"icofont-compass-alt-1\"></i>', '<span> compass-alt-1 </span>'),
(996, '<i class=\"icofont-compass-alt-2\"></i>', '<span> compass-alt-2 </span>'),
(997, '<i class=\"icofont-compass-alt-3\"></i>', '<span> compass-alt-3 </span>'),
(998, '<i class=\"icofont-compass-alt-4\"></i>', '<span> compass-alt-4 </span>'),
(999, '<i class=\"icofont-golden-ratio\"></i>', '<span> golden-ratio </span>'),
(1000, '<i class=\"icofont-marker-alt-1\"></i>', '<span> marker-alt-1 </span>'),
(1001, '<i class=\"icofont-marker-alt-2\"></i>', '<span> marker-alt-2 </span>'),
(1002, '<i class=\"icofont-marker-alt-3\"></i>', '<span> marker-alt-3 </span>'),
(1003, '<i class=\"icofont-marker\"></i>', '<span> marker </span>'),
(1004, '<i class=\"icofont-math\"></i>', '<span> math </span>'),
(1005, '<i class=\"icofont-mathematical-alt-1\"></i>', '<span> mathematical-alt-1 </span>'),
(1006, '<i class=\"icofont-mathematical-alt-2\"></i>', '<span> mathematical-alt-2 </span>'),
(1007, '<i class=\"icofont-mathematical\"></i>', '<span> mathematical </span>'),
(1008, '<i class=\"icofont-pen-alt-1\"></i>', '<span> pen-alt-1 </span>'),
(1009, '<i class=\"icofont-pen-alt-2\"></i>', '<span> pen-alt-2 </span>'),
(1010, '<i class=\"icofont-pen-alt-3\"></i>', '<span> pen-alt-3 </span>'),
(1011, '<i class=\"icofont-pen-holder-alt-1\"></i>', '<span> pen-holder-alt-1 </span>'),
(1012, '<i class=\"icofont-pen-holder\"></i>', '<span> pen-holder </span>'),
(1013, '<i class=\"icofont-pen\"></i>', '<span> pen </span>'),
(1014, '<i class=\"icofont-pencil-alt-1\"></i>', '<span> pencil-alt-1 </span>'),
(1015, '<i class=\"icofont-pencil-alt-2\"></i>', '<span> pencil-alt-2 </span>'),
(1016, '<i class=\"icofont-pencil-alt-3\"></i>', '<span> pencil-alt-3 </span>'),
(1017, '<i class=\"icofont-pencil-alt-4\"></i>', '<span> pencil-alt-4 </span>'),
(1018, '<i class=\"icofont-pencil\"></i>', '<span> pencil </span>'),
(1019, '<i class=\"icofont-ruler-alt-1\"></i>', '<span> ruler-alt-1 </span>'),
(1020, '<i class=\"icofont-ruler-alt-2\"></i>', '<span> ruler-alt-2 </span>'),
(1021, '<i class=\"icofont-ruler-compass-alt\"></i>', '<span> ruler-compass-alt </span>'),
(1022, '<i class=\"icofont-ruler-compass\"></i>', '<span> ruler-compass </span>'),
(1023, '<i class=\"icofont-ruler-pencil-alt-1\"></i>', '<span> ruler-pencil-alt-1 </span>'),
(1024, '<i class=\"icofont-ruler-pencil-alt-2\"></i>', '<span> ruler-pencil-alt-2 </span>'),
(1025, '<i class=\"icofont-ruler-pencil\"></i>', '<span> ruler-pencil </span>'),
(1026, '<i class=\"icofont-ruler\"></i>', '<span> ruler </span>'),
(1027, '<i class=\"icofont-rulers-alt\"></i>', '<span> rulers-alt </span>'),
(1028, '<i class=\"icofont-rulers\"></i>', '<span> rulers </span>'),
(1029, '<i class=\"icofont-square-root\"></i>', '<span> square-root </span>'),
(1030, '<i class=\"icofont-ui-calculator\"></i>', '<span> ui-calculator </span>'),
(1031, '<i class=\"icofont-aids\"></i>', '<span> aids </span>'),
(1032, '<i class=\"icofont-ambulance-crescent\"></i>', '<span> ambulance-crescent </span>'),
(1033, '<i class=\"icofont-ambulance-cross\"></i>', '<span> ambulance-cross </span>'),
(1034, '<i class=\"icofont-ambulance\"></i>', '<span> ambulance </span>'),
(1035, '<i class=\"icofont-autism\"></i>', '<span> autism </span>'),
(1036, '<i class=\"icofont-bandage\"></i>', '<span> bandage </span>'),
(1037, '<i class=\"icofont-blind\"></i>', '<span> blind </span>'),
(1038, '<i class=\"icofont-blood-drop\"></i>', '<span> blood-drop </span>'),
(1039, '<i class=\"icofont-blood-test\"></i>', '<span> blood-test </span>'),
(1040, '<i class=\"icofont-blood\"></i>', '<span> blood </span>'),
(1041, '<i class=\"icofont-brain-alt\"></i>', '<span> brain-alt </span>'),
(1042, '<i class=\"icofont-brain\"></i>', '<span> brain </span>'),
(1043, '<i class=\"icofont-capsule\"></i>', '<span> capsule </span>'),
(1044, '<i class=\"icofont-crutch\"></i>', '<span> crutch </span>'),
(1045, '<i class=\"icofont-disabled\"></i>', '<span> disabled </span>'),
(1046, '<i class=\"icofont-dna-alt-1\"></i>', '<span> dna-alt-1 </span>'),
(1047, '<i class=\"icofont-dna-alt-2\"></i>', '<span> dna-alt-2 </span>'),
(1048, '<i class=\"icofont-dna\"></i>', '<span> dna </span>'),
(1049, '<i class=\"icofont-doctor-alt\"></i>', '<span> doctor-alt </span>'),
(1050, '<i class=\"icofont-doctor\"></i>', '<span> doctor </span>'),
(1051, '<i class=\"icofont-drug-pack\"></i>', '<span> drug-pack </span>'),
(1052, '<i class=\"icofont-drug\"></i>', '<span> drug </span>'),
(1053, '<i class=\"icofont-first-aid-alt\"></i>', '<span> first-aid-alt </span>'),
(1054, '<i class=\"icofont-first-aid\"></i>', '<span> first-aid </span>'),
(1055, '<i class=\"icofont-heart-beat-alt\"></i>', '<span> heart-beat-alt </span>'),
(1056, '<i class=\"icofont-heart-beat\"></i>', '<span> heart-beat </span>'),
(1057, '<i class=\"icofont-heartbeat\"></i>', '<span> heartbeat </span>'),
(1058, '<i class=\"icofont-herbal\"></i>', '<span> herbal </span>'),
(1059, '<i class=\"icofont-hospital\"></i>', '<span> hospital </span>'),
(1060, '<i class=\"icofont-icu\"></i>', '<span> icu </span>'),
(1061, '<i class=\"icofont-injection-syringe\"></i>', '<span> injection-syringe </span>'),
(1062, '<i class=\"icofont-laboratory\"></i>', '<span> laboratory </span>'),
(1063, '<i class=\"icofont-medical-sign-alt\"></i>', '<span> medical-sign-alt </span>'),
(1064, '<i class=\"icofont-medical-sign\"></i>', '<span> medical-sign </span>'),
(1065, '<i class=\"icofont-nurse-alt\"></i>', '<span> nurse-alt </span>'),
(1066, '<i class=\"icofont-nurse\"></i>', '<span> nurse </span>'),
(1067, '<i class=\"icofont-nursing-home\"></i>', '<span> nursing-home </span>'),
(1068, '<i class=\"icofont-operation-theater\"></i>', '<span> operation-theater </span>'),
(1069, '<i class=\"icofont-paralysis-disability\"></i>', '<span> paralysis-disability </span>'),
(1070, '<i class=\"icofont-patient-bed\"></i>', '<span> patient-bed </span>'),
(1071, '<i class=\"icofont-patient-file\"></i>', '<span> patient-file </span>'),
(1072, '<i class=\"icofont-pills\"></i>', '<span> pills </span>'),
(1073, '<i class=\"icofont-prescription\"></i>', '<span> prescription </span>'),
(1074, '<i class=\"icofont-pulse\"></i>', '<span> pulse </span>'),
(1075, '<i class=\"icofont-stethoscope-alt\"></i>', '<span> stethoscope-alt </span>'),
(1076, '<i class=\"icofont-stethoscope\"></i>', '<span> stethoscope </span>'),
(1077, '<i class=\"icofont-stretcher\"></i>', '<span> stretcher </span>'),
(1078, '<i class=\"icofont-surgeon-alt\"></i>', '<span> surgeon-alt </span>'),
(1079, '<i class=\"icofont-surgeon\"></i>', '<span> surgeon </span>'),
(1080, '<i class=\"icofont-tablets\"></i>', '<span> tablets </span>'),
(1081, '<i class=\"icofont-test-bottle\"></i>', '<span> test-bottle </span>'),
(1082, '<i class=\"icofont-test-tube\"></i>', '<span> test-tube </span>'),
(1083, '<i class=\"icofont-thermometer-alt\"></i>', '<span> thermometer-alt </span>'),
(1084, '<i class=\"icofont-thermometer\"></i>', '<span> thermometer </span>'),
(1085, '<i class=\"icofont-tooth\"></i>', '<span> tooth </span>'),
(1086, '<i class=\"icofont-xray\"></i>', '<span> xray </span>'),
(1087, '<i class=\"icofont-ui-add\"></i>', '<span> ui-add </span>'),
(1088, '<i class=\"icofont-ui-alarm\"></i>', '<span> ui-alarm </span>'),
(1089, '<i class=\"icofont-ui-battery\"></i>', '<span> ui-battery </span>'),
(1090, '<i class=\"icofont-ui-block\"></i>', '<span> ui-block </span>'),
(1091, '<i class=\"icofont-ui-bluetooth\"></i>', '<span> ui-bluetooth </span>'),
(1092, '<i class=\"icofont-ui-brightness\"></i>', '<span> ui-brightness </span>'),
(1093, '<i class=\"icofont-ui-browser\"></i>', '<span> ui-browser </span>'),
(1094, '<i class=\"icofont-ui-calendar\"></i>', '<span> ui-calendar </span>'),
(1095, '<i class=\"icofont-ui-call\"></i>', '<span> ui-call </span>'),
(1096, '<i class=\"icofont-ui-camera\"></i>', '<span> ui-camera </span>'),
(1097, '<i class=\"icofont-ui-cart\"></i>', '<span> ui-cart </span>'),
(1098, '<i class=\"icofont-ui-cell-phone\"></i>', '<span> ui-cell-phone </span>'),
(1099, '<i class=\"icofont-ui-chat\"></i>', '<span> ui-chat </span>'),
(1100, '<i class=\"icofont-ui-check\"></i>', '<span> ui-check </span>'),
(1101, '<i class=\"icofont-ui-clip-board\"></i>', '<span> ui-clip-board </span>'),
(1102, '<i class=\"icofont-ui-clip\"></i>', '<span> ui-clip </span>'),
(1103, '<i class=\"icofont-ui-clock\"></i>', '<span> ui-clock </span>'),
(1104, '<i class=\"icofont-ui-close\"></i>', '<span> ui-close </span>'),
(1105, '<i class=\"icofont-ui-contact-list\"></i>', '<span> ui-contact-list </span>'),
(1106, '<i class=\"icofont-ui-copy\"></i>', '<span> ui-copy </span>'),
(1107, '<i class=\"icofont-ui-cut\"></i>', '<span> ui-cut </span>'),
(1108, '<i class=\"icofont-ui-delete\"></i>', '<span> ui-delete </span>'),
(1109, '<i class=\"icofont-ui-dial-phone\"></i>', '<span> ui-dial-phone </span>'),
(1110, '<i class=\"icofont-ui-edit\"></i>', '<span> ui-edit </span>'),
(1111, '<i class=\"icofont-ui-email\"></i>', '<span> ui-email </span>'),
(1112, '<i class=\"icofont-ui-file\"></i>', '<span> ui-file </span>'),
(1113, '<i class=\"icofont-ui-fire-wall\"></i>', '<span> ui-fire-wall </span>'),
(1114, '<i class=\"icofont-ui-flash-light\"></i>', '<span> ui-flash-light </span>'),
(1115, '<i class=\"icofont-ui-flight\"></i>', '<span> ui-flight </span>'),
(1116, '<i class=\"icofont-ui-folder\"></i>', '<span> ui-folder </span>'),
(1117, '<i class=\"icofont-ui-game\"></i>', '<span> ui-game </span>'),
(1118, '<i class=\"icofont-ui-handicapped\"></i>', '<span> ui-handicapped </span>'),
(1119, '<i class=\"icofont-ui-home\"></i>', '<span> ui-home </span>'),
(1120, '<i class=\"icofont-ui-image\"></i>', '<span> ui-image </span>'),
(1121, '<i class=\"icofont-ui-laoding\"></i>', '<span> ui-laoding </span>'),
(1122, '<i class=\"icofont-ui-lock\"></i>', '<span> ui-lock </span>'),
(1123, '<i class=\"icofont-ui-love-add\"></i>', '<span> ui-love-add </span>'),
(1124, '<i class=\"icofont-ui-love-broken\"></i>', '<span> ui-love-broken </span>'),
(1125, '<i class=\"icofont-ui-love-remove\"></i>', '<span> ui-love-remove </span>'),
(1126, '<i class=\"icofont-ui-love\"></i>', '<span> ui-love </span>'),
(1127, '<i class=\"icofont-ui-map\"></i>', '<span> ui-map </span>'),
(1128, '<i class=\"icofont-ui-message\"></i>', '<span> ui-message </span>'),
(1129, '<i class=\"icofont-ui-messaging\"></i>', '<span> ui-messaging </span>'),
(1130, '<i class=\"icofont-ui-movie\"></i>', '<span> ui-movie </span>'),
(1131, '<i class=\"icofont-ui-music-player\"></i>', '<span> ui-music-player </span>'),
(1132, '<i class=\"icofont-ui-music\"></i>', '<span> ui-music </span>'),
(1133, '<i class=\"icofont-ui-mute\"></i>', '<span> ui-mute </span>'),
(1134, '<i class=\"icofont-ui-network\"></i>', '<span> ui-network </span>'),
(1135, '<i class=\"icofont-ui-next\"></i>', '<span> ui-next </span>'),
(1136, '<i class=\"icofont-ui-note\"></i>', '<span> ui-note </span>'),
(1137, '<i class=\"icofont-ui-office\"></i>', '<span> ui-office </span>'),
(1138, '<i class=\"icofont-ui-password\"></i>', '<span> ui-password </span>'),
(1139, '<i class=\"icofont-ui-pause\"></i>', '<span> ui-pause </span>'),
(1140, '<i class=\"icofont-ui-play-stop\"></i>', '<span> ui-play-stop </span>'),
(1141, '<i class=\"icofont-ui-play\"></i>', '<span> ui-play </span>'),
(1142, '<i class=\"icofont-ui-pointer\"></i>', '<span> ui-pointer </span>'),
(1143, '<i class=\"icofont-ui-power\"></i>', '<span> ui-power </span>'),
(1144, '<i class=\"icofont-ui-press\"></i>', '<span> ui-press </span>'),
(1145, '<i class=\"icofont-ui-previous\"></i>', '<span> ui-previous </span>'),
(1146, '<i class=\"icofont-ui-rate-add\"></i>', '<span> ui-rate-add </span>'),
(1147, '<i class=\"icofont-ui-rate-blank\"></i>', '<span> ui-rate-blank </span>'),
(1148, '<i class=\"icofont-ui-rate-remove\"></i>', '<span> ui-rate-remove </span>'),
(1149, '<i class=\"icofont-ui-rating\"></i>', '<span> ui-rating </span>'),
(1150, '<i class=\"icofont-ui-record\"></i>', '<span> ui-record </span>'),
(1151, '<i class=\"icofont-ui-remove\"></i>', '<span> ui-remove </span>'),
(1152, '<i class=\"icofont-ui-reply\"></i>', '<span> ui-reply </span>'),
(1153, '<i class=\"icofont-ui-rotation\"></i>', '<span> ui-rotation </span>'),
(1154, '<i class=\"icofont-ui-rss\"></i>', '<span> ui-rss </span>'),
(1155, '<i class=\"icofont-ui-search\"></i>', '<span> ui-search </span>'),
(1156, '<i class=\"icofont-ui-settings\"></i>', '<span> ui-settings </span>'),
(1157, '<i class=\"icofont-ui-social-link\"></i>', '<span> ui-social-link </span>'),
(1158, '<i class=\"icofont-ui-tag\"></i>', '<span> ui-tag </span>'),
(1159, '<i class=\"icofont-ui-text-chat\"></i>', '<span> ui-text-chat </span>'),
(1160, '<i class=\"icofont-ui-text-loading\"></i>', '<span> ui-text-loading </span>'),
(1161, '<i class=\"icofont-ui-theme\"></i>', '<span> ui-theme </span>'),
(1162, '<i class=\"icofont-ui-timer\"></i>', '<span> ui-timer </span>'),
(1163, '<i class=\"icofont-ui-touch-phone\"></i>', '<span> ui-touch-phone </span>'),
(1164, '<i class=\"icofont-ui-travel\"></i>', '<span> ui-travel </span>'),
(1165, '<i class=\"icofont-ui-unlock\"></i>', '<span> ui-unlock </span>'),
(1166, '<i class=\"icofont-ui-user-group\"></i>', '<span> ui-user-group </span>'),
(1167, '<i class=\"icofont-ui-user\"></i>', '<span> ui-user </span>'),
(1168, '<i class=\"icofont-ui-v-card\"></i>', '<span> ui-v-card </span>'),
(1169, '<i class=\"icofont-ui-video-chat\"></i>', '<span> ui-video-chat </span>'),
(1170, '<i class=\"icofont-ui-video-message\"></i>', '<span> ui-video-message </span>'),
(1171, '<i class=\"icofont-ui-video-play\"></i>', '<span> ui-video-play </span>'),
(1172, '<i class=\"icofont-ui-video\"></i>', '<span> ui-video </span>'),
(1173, '<i class=\"icofont-ui-volume\"></i>', '<span> ui-volume </span>'),
(1174, '<i class=\"icofont-ui-weather\"></i>', '<span> ui-weather </span>'),
(1175, '<i class=\"icofont-ui-wifi\"></i>', '<span> ui-wifi </span>'),
(1176, '<i class=\"icofont-ui-zoom-in\"></i>', '<span> ui-zoom-in </span>'),
(1177, '<i class=\"icofont-ui-zoom-out\"></i>', '<span> ui-zoom-out </span>'),
(1178, '<i class=\"icofont-cassette-player\"></i>', '<span> cassette-player </span>'),
(1179, '<i class=\"icofont-cassette\"></i>', '<span> cassette </span>'),
(1180, '<i class=\"icofont-forward\"></i>', '<span> forward </span>'),
(1181, '<i class=\"icofont-guiter\"></i>', '<span> guiter </span>'),
(1182, '<i class=\"icofont-movie\"></i>', '<span> movie </span>'),
(1183, '<i class=\"icofont-multimedia\"></i>', '<span> multimedia </span>'),
(1184, '<i class=\"icofont-music-alt\"></i>', '<span> music-alt </span>'),
(1185, '<i class=\"icofont-music-disk\"></i>', '<span> music-disk </span>'),
(1186, '<i class=\"icofont-music-note\"></i>', '<span> music-note </span>'),
(1187, '<i class=\"icofont-music-notes\"></i>', '<span> music-notes </span>'),
(1188, '<i class=\"icofont-music\"></i>', '<span> music </span>'),
(1189, '<i class=\"icofont-mute-volume\"></i>', '<span> mute-volume </span>'),
(1190, '<i class=\"icofont-pause\"></i>', '<span> pause </span>'),
(1191, '<i class=\"icofont-play-alt-1\"></i>', '<span> play-alt-1 </span>'),
(1192, '<i class=\"icofont-play-alt-2\"></i>', '<span> play-alt-2 </span>'),
(1193, '<i class=\"icofont-play-alt-3\"></i>', '<span> play-alt-3 </span>'),
(1194, '<i class=\"icofont-play-pause\"></i>', '<span> play-pause </span>'),
(1195, '<i class=\"icofont-play\"></i>', '<span> play </span>'),
(1196, '<i class=\"icofont-record\"></i>', '<span> record </span>'),
(1197, '<i class=\"icofont-retro-music-disk\"></i>', '<span> retro-music-disk </span>'),
(1198, '<i class=\"icofont-rewind\"></i>', '<span> rewind </span>'),
(1199, '<i class=\"icofont-song-notes\"></i>', '<span> song-notes </span>'),
(1200, '<i class=\"icofont-sound-wave-alt\"></i>', '<span> sound-wave-alt </span>'),
(1201, '<i class=\"icofont-sound-wave\"></i>', '<span> sound-wave </span>'),
(1202, '<i class=\"icofont-stop\"></i>', '<span> stop </span>'),
(1203, '<i class=\"icofont-video-alt\"></i>', '<span> video-alt </span>'),
(1204, '<i class=\"icofont-video-cam\"></i>', '<span> video-cam </span>'),
(1205, '<i class=\"icofont-video-clapper\"></i>', '<span> video-clapper </span>'),
(1206, '<i class=\"icofont-video\"></i>', '<span> video </span>'),
(1207, '<i class=\"icofont-volume-bar\"></i>', '<span> volume-bar </span>'),
(1208, '<i class=\"icofont-volume-down\"></i>', '<span> volume-down </span>'),
(1209, '<i class=\"icofont-volume-mute\"></i>', '<span> volume-mute </span>'),
(1210, '<i class=\"icofont-volume-off\"></i>', '<span> volume-off </span>'),
(1211, '<i class=\"icofont-volume-up\"></i>', '<span> volume-up </span>'),
(1212, '<i class=\"icofont-youtube-play\"></i>', '<span> youtube-play </span>'),
(1213, '<i class=\"icofont-2checkout-alt\"></i>', '<span> 2checkout-alt </span>'),
(1214, '<i class=\"icofont-2checkout\"></i>', '<span> 2checkout </span>'),
(1215, '<i class=\"icofont-amazon-alt\"></i>', '<span> amazon-alt </span>'),
(1216, '<i class=\"icofont-amazon\"></i>', '<span> amazon </span>'),
(1217, '<i class=\"icofont-american-express-alt\"></i>', '<span> american-express-alt </span>'),
(1218, '<i class=\"icofont-american-express\"></i>', '<span> american-express </span>'),
(1219, '<i class=\"icofont-apple-pay-alt\"></i>', '<span> apple-pay-alt </span>'),
(1220, '<i class=\"icofont-apple-pay\"></i>', '<span> apple-pay </span>'),
(1221, '<i class=\"icofont-bank-transfer-alt\"></i>', '<span> bank-transfer-alt </span>'),
(1222, '<i class=\"icofont-bank-transfer\"></i>', '<span> bank-transfer </span>'),
(1223, '<i class=\"icofont-braintree-alt\"></i>', '<span> braintree-alt </span>'),
(1224, '<i class=\"icofont-braintree\"></i>', '<span> braintree </span>'),
(1225, '<i class=\"icofont-cash-on-delivery-alt\"></i>', '<span> cash-on-delivery-alt </span>'),
(1226, '<i class=\"icofont-cash-on-delivery\"></i>', '<span> cash-on-delivery </span>'),
(1227, '<i class=\"icofont-diners-club-alt-1\"></i>', '<span> diners-club-alt-1 </span>'),
(1228, '<i class=\"icofont-diners-club-alt-2\"></i>', '<span> diners-club-alt-2 </span>'),
(1229, '<i class=\"icofont-diners-club-alt-3\"></i>', '<span> diners-club-alt-3 </span>'),
(1230, '<i class=\"icofont-diners-club\"></i>', '<span> diners-club </span>'),
(1231, '<i class=\"icofont-discover-alt\"></i>', '<span> discover-alt </span>'),
(1232, '<i class=\"icofont-discover\"></i>', '<span> discover </span>'),
(1233, '<i class=\"icofont-eway-alt\"></i>', '<span> eway-alt </span>'),
(1234, '<i class=\"icofont-eway\"></i>', '<span> eway </span>'),
(1235, '<i class=\"icofont-google-wallet-alt-1\"></i>', '<span> google-wallet-alt-1 </span>'),
(1236, '<i class=\"icofont-google-wallet-alt-2\"></i>', '<span> google-wallet-alt-2 </span>'),
(1237, '<i class=\"icofont-google-wallet-alt-3\"></i>', '<span> google-wallet-alt-3 </span>'),
(1238, '<i class=\"icofont-google-wallet\"></i>', '<span> google-wallet </span>'),
(1239, '<i class=\"icofont-jcb-alt\"></i>', '<span> jcb-alt </span>'),
(1240, '<i class=\"icofont-jcb\"></i>', '<span> jcb </span>'),
(1241, '<i class=\"icofont-maestro-alt\"></i>', '<span> maestro-alt </span>'),
(1242, '<i class=\"icofont-maestro\"></i>', '<span> maestro </span>'),
(1243, '<i class=\"icofont-mastercard-alt\"></i>', '<span> mastercard-alt </span>'),
(1244, '<i class=\"icofont-mastercard\"></i>', '<span> mastercard </span>'),
(1245, '<i class=\"icofont-payoneer-alt\"></i>', '<span> payoneer-alt </span>'),
(1246, '<i class=\"icofont-payoneer\"></i>', '<span> payoneer </span>'),
(1247, '<i class=\"icofont-paypal-alt\"></i>', '<span> paypal-alt </span>'),
(1248, '<i class=\"icofont-paypal\"></i>', '<span> paypal </span>'),
(1249, '<i class=\"icofont-sage-alt\"></i>', '<span> sage-alt </span>'),
(1250, '<i class=\"icofont-sage\"></i>', '<span> sage </span>'),
(1251, '<i class=\"icofont-skrill-alt\"></i>', '<span> skrill-alt </span>'),
(1252, '<i class=\"icofont-skrill\"></i>', '<span> skrill </span>'),
(1253, '<i class=\"icofont-stripe-alt\"></i>', '<span> stripe-alt </span>'),
(1254, '<i class=\"icofont-stripe\"></i>', '<span> stripe </span>'),
(1255, '<i class=\"icofont-visa-alt\"></i>', '<span> visa-alt </span>'),
(1256, '<i class=\"icofont-visa-electron\"></i>', '<span> visa-electron </span>'),
(1257, '<i class=\"icofont-visa\"></i>', '<span> visa </span>'),
(1258, '<i class=\"icofont-western-union-alt\"></i>', '<span> western-union-alt </span>'),
(1259, '<i class=\"icofont-western-union\"></i>', '<span> western-union </span>'),
(1260, '<i class=\"icofont-boy\"></i>', '<span> boy </span>'),
(1261, '<i class=\"icofont-business-man-alt-1\"></i>', '<span> business-man-alt-1 </span>'),
(1262, '<i class=\"icofont-business-man-alt-2\"></i>', '<span> business-man-alt-2 </span>'),
(1263, '<i class=\"icofont-business-man-alt-3\"></i>', '<span> business-man-alt-3 </span>'),
(1264, '<i class=\"icofont-business-man\"></i>', '<span> business-man </span>'),
(1265, '<i class=\"icofont-female\"></i>', '<span> female </span>'),
(1266, '<i class=\"icofont-funky-man\"></i>', '<span> funky-man </span>'),
(1267, '<i class=\"icofont-girl-alt\"></i>', '<span> girl-alt </span>'),
(1268, '<i class=\"icofont-girl\"></i>', '<span> girl </span>'),
(1269, '<i class=\"icofont-group\"></i>', '<span> group </span>'),
(1270, '<i class=\"icofont-hotel-boy-alt\"></i>', '<span> hotel-boy-alt </span>'),
(1271, '<i class=\"icofont-hotel-boy\"></i>', '<span> hotel-boy </span>'),
(1272, '<i class=\"icofont-kid\"></i>', '<span> kid </span>'),
(1273, '<i class=\"icofont-man-in-glasses\"></i>', '<span> man-in-glasses </span>'),
(1274, '<i class=\"icofont-people\"></i>', '<span> people </span>'),
(1275, '<i class=\"icofont-support\"></i>', '<span> support </span>'),
(1276, '<i class=\"icofont-user-alt-1\"></i>', '<span> user-alt-1 </span>'),
(1277, '<i class=\"icofont-user-alt-2\"></i>', '<span> user-alt-2 </span>'),
(1278, '<i class=\"icofont-user-alt-3\"></i>', '<span> user-alt-3 </span>'),
(1279, '<i class=\"icofont-user-alt-4\"></i>', '<span> user-alt-4 </span>'),
(1280, '<i class=\"icofont-user-alt-5\"></i>', '<span> user-alt-5 </span>'),
(1281, '<i class=\"icofont-user-alt-6\"></i>', '<span> user-alt-6 </span>'),
(1282, '<i class=\"icofont-user-alt-7\"></i>', '<span> user-alt-7 </span>'),
(1283, '<i class=\"icofont-user-female\"></i>', '<span> user-female </span>'),
(1284, '<i class=\"icofont-user-male\"></i>', '<span> user-male </span>'),
(1285, '<i class=\"icofont-user-suited\"></i>', '<span> user-suited </span>'),
(1286, '<i class=\"icofont-user\"></i>', '<span> user </span>'),
(1287, '<i class=\"icofont-users-alt-1\"></i>', '<span> users-alt-1 </span>'),
(1288, '<i class=\"icofont-users-alt-2\"></i>', '<span> users-alt-2 </span>'),
(1289, '<i class=\"icofont-users-alt-3\"></i>', '<span> users-alt-3 </span>'),
(1290, '<i class=\"icofont-users-alt-4\"></i>', '<span> users-alt-4 </span>'),
(1291, '<i class=\"icofont-users-alt-5\"></i>', '<span> users-alt-5 </span>'),
(1292, '<i class=\"icofont-users-alt-6\"></i>', '<span> users-alt-6 </span>'),
(1293, '<i class=\"icofont-users-social\"></i>', '<span> users-social </span>'),
(1294, '<i class=\"icofont-users\"></i>', '<span> users </span>'),
(1295, '<i class=\"icofont-waiter-alt\"></i>', '<span> waiter-alt </span>'),
(1296, '<i class=\"icofont-waiter\"></i>', '<span> waiter </span>'),
(1297, '<i class=\"icofont-woman-in-glasses\"></i>', '<span> woman-in-glasses </span>'),
(1298, '<i class=\"icofont-search-1\"></i>', '<span> search-1 </span>'),
(1299, '<i class=\"icofont-search-2\"></i>', '<span> search-2 </span>'),
(1300, '<i class=\"icofont-search-document\"></i>', '<span> search-document </span>'),
(1301, '<i class=\"icofont-search-folder\"></i>', '<span> search-folder </span>'),
(1302, '<i class=\"icofont-search-job\"></i>', '<span> search-job </span>'),
(1303, '<i class=\"icofont-search-map\"></i>', '<span> search-map </span>'),
(1304, '<i class=\"icofont-search-property\"></i>', '<span> search-property </span>'),
(1305, '<i class=\"icofont-search-restaurant\"></i>', '<span> search-restaurant </span>'),
(1306, '<i class=\"icofont-search-stock\"></i>', '<span> search-stock </span>'),
(1307, '<i class=\"icofont-search-user\"></i>', '<span> search-user </span>'),
(1308, '<i class=\"icofont-search\"></i>', '<span> search </span>'),
(1309, '<i class=\"icofont-500px\"></i>', '<span> 500px </span>'),
(1310, '<i class=\"icofont-aim\"></i>', '<span> aim </span>'),
(1311, '<i class=\"icofont-badoo\"></i>', '<span> badoo </span>'),
(1312, '<i class=\"icofont-baidu-tieba\"></i>', '<span> baidu-tieba </span>'),
(1313, '<i class=\"icofont-bbm-messenger\"></i>', '<span> bbm-messenger </span>'),
(1314, '<i class=\"icofont-bebo\"></i>', '<span> bebo </span>'),
(1315, '<i class=\"icofont-behance\"></i>', '<span> behance </span>'),
(1316, '<i class=\"icofont-blogger\"></i>', '<span> blogger </span>'),
(1317, '<i class=\"icofont-bootstrap\"></i>', '<span> bootstrap </span>'),
(1318, '<i class=\"icofont-brightkite\"></i>', '<span> brightkite </span>'),
(1319, '<i class=\"icofont-cloudapp\"></i>', '<span> cloudapp </span>'),
(1320, '<i class=\"icofont-concrete5\"></i>', '<span> concrete5 </span>'),
(1321, '<i class=\"icofont-delicious\"></i>', '<span> delicious </span>'),
(1322, '<i class=\"icofont-designbump\"></i>', '<span> designbump </span>'),
(1323, '<i class=\"icofont-designfloat\"></i>', '<span> designfloat </span>'),
(1324, '<i class=\"icofont-deviantart\"></i>', '<span> deviantart </span>'),
(1325, '<i class=\"icofont-digg\"></i>', '<span> digg </span>'),
(1326, '<i class=\"icofont-dotcms\"></i>', '<span> dotcms </span>'),
(1327, '<i class=\"icofont-dribbble\"></i>', '<span> dribbble </span>'),
(1328, '<i class=\"icofont-dribble\"></i>', '<span> dribble </span>'),
(1329, '<i class=\"icofont-dropbox\"></i>', '<span> dropbox </span>'),
(1330, '<i class=\"icofont-ebuddy\"></i>', '<span> ebuddy </span>'),
(1331, '<i class=\"icofont-ello\"></i>', '<span> ello </span>'),
(1332, '<i class=\"icofont-ember\"></i>', '<span> ember </span>'),
(1333, '<i class=\"icofont-envato\"></i>', '<span> envato </span>'),
(1334, '<i class=\"icofont-evernote\"></i>', '<span> evernote </span>'),
(1335, '<i class=\"icofont-facebook-messenger\"></i>', '<span> facebook-messenger </span>'),
(1336, '<i class=\"icofont-facebook\"></i>', '<span> facebook </span>');
INSERT INTO `icon_set` (`id`, `icon`, `name`) VALUES
(1337, '<i class=\"icofont-feedburner\"></i>', '<span> feedburner </span>'),
(1338, '<i class=\"icofont-flikr\"></i>', '<span> flikr </span>'),
(1339, '<i class=\"icofont-folkd\"></i>', '<span> folkd </span>'),
(1340, '<i class=\"icofont-foursquare\"></i>', '<span> foursquare </span>'),
(1341, '<i class=\"icofont-friendfeed\"></i>', '<span> friendfeed </span>'),
(1342, '<i class=\"icofont-ghost\"></i>', '<span> ghost </span>'),
(1343, '<i class=\"icofont-github\"></i>', '<span> github </span>'),
(1344, '<i class=\"icofont-gnome\"></i>', '<span> gnome </span>'),
(1345, '<i class=\"icofont-google-buzz\"></i>', '<span> google-buzz </span>'),
(1346, '<i class=\"icofont-google-hangouts\"></i>', '<span> google-hangouts </span>'),
(1347, '<i class=\"icofont-google-map\"></i>', '<span> google-map </span>'),
(1348, '<i class=\"icofont-google-plus\"></i>', '<span> google-plus </span>'),
(1349, '<i class=\"icofont-google-talk\"></i>', '<span> google-talk </span>'),
(1350, '<i class=\"icofont-hype-machine\"></i>', '<span> hype-machine </span>'),
(1351, '<i class=\"icofont-instagram\"></i>', '<span> instagram </span>'),
(1352, '<i class=\"icofont-kakaotalk\"></i>', '<span> kakaotalk </span>'),
(1353, '<i class=\"icofont-kickstarter\"></i>', '<span> kickstarter </span>'),
(1354, '<i class=\"icofont-kik\"></i>', '<span> kik </span>'),
(1355, '<i class=\"icofont-kiwibox\"></i>', '<span> kiwibox </span>'),
(1356, '<i class=\"icofont-line-messenger\"></i>', '<span> line-messenger </span>'),
(1357, '<i class=\"icofont-line\"></i>', '<span> line </span>'),
(1358, '<i class=\"icofont-linkedin\"></i>', '<span> linkedin </span>'),
(1359, '<i class=\"icofont-linux-mint\"></i>', '<span> linux-mint </span>'),
(1360, '<i class=\"icofont-live-messenger\"></i>', '<span> live-messenger </span>'),
(1361, '<i class=\"icofont-livejournal\"></i>', '<span> livejournal </span>'),
(1362, '<i class=\"icofont-magento\"></i>', '<span> magento </span>'),
(1363, '<i class=\"icofont-meetme\"></i>', '<span> meetme </span>'),
(1364, '<i class=\"icofont-meetup\"></i>', '<span> meetup </span>'),
(1365, '<i class=\"icofont-mixx\"></i>', '<span> mixx </span>'),
(1366, '<i class=\"icofont-newsvine\"></i>', '<span> newsvine </span>'),
(1367, '<i class=\"icofont-nimbuss\"></i>', '<span> nimbuss </span>'),
(1368, '<i class=\"icofont-odnoklassniki\"></i>', '<span> odnoklassniki </span>'),
(1369, '<i class=\"icofont-opencart\"></i>', '<span> opencart </span>'),
(1370, '<i class=\"icofont-oscommerce\"></i>', '<span> oscommerce </span>'),
(1371, '<i class=\"icofont-pandora\"></i>', '<span> pandora </span>'),
(1372, '<i class=\"icofont-photobucket\"></i>', '<span> photobucket </span>'),
(1373, '<i class=\"icofont-picasa\"></i>', '<span> picasa </span>'),
(1374, '<i class=\"icofont-pinterest\"></i>', '<span> pinterest </span>'),
(1375, '<i class=\"icofont-prestashop\"></i>', '<span> prestashop </span>'),
(1376, '<i class=\"icofont-qik\"></i>', '<span> qik </span>'),
(1377, '<i class=\"icofont-qq\"></i>', '<span> qq </span>'),
(1378, '<i class=\"icofont-readernaut\"></i>', '<span> readernaut </span>'),
(1379, '<i class=\"icofont-reddit\"></i>', '<span> reddit </span>'),
(1380, '<i class=\"icofont-renren\"></i>', '<span> renren </span>'),
(1381, '<i class=\"icofont-rss\"></i>', '<span> rss </span>'),
(1382, '<i class=\"icofont-shopify\"></i>', '<span> shopify </span>'),
(1383, '<i class=\"icofont-silverstripe\"></i>', '<span> silverstripe </span>'),
(1384, '<i class=\"icofont-skype\"></i>', '<span> skype </span>'),
(1385, '<i class=\"icofont-slack\"></i>', '<span> slack </span>'),
(1386, '<i class=\"icofont-slashdot\"></i>', '<span> slashdot </span>'),
(1387, '<i class=\"icofont-slidshare\"></i>', '<span> slidshare </span>'),
(1388, '<i class=\"icofont-smugmug\"></i>', '<span> smugmug </span>'),
(1389, '<i class=\"icofont-snapchat\"></i>', '<span> snapchat </span>'),
(1390, '<i class=\"icofont-soundcloud\"></i>', '<span> soundcloud </span>'),
(1391, '<i class=\"icofont-spotify\"></i>', '<span> spotify </span>'),
(1392, '<i class=\"icofont-stack-exchange\"></i>', '<span> stack-exchange </span>'),
(1393, '<i class=\"icofont-stack-overflow\"></i>', '<span> stack-overflow </span>'),
(1394, '<i class=\"icofont-steam\"></i>', '<span> steam </span>'),
(1395, '<i class=\"icofont-stumbleupon\"></i>', '<span> stumbleupon </span>'),
(1396, '<i class=\"icofont-tagged\"></i>', '<span> tagged </span>'),
(1397, '<i class=\"icofont-technorati\"></i>', '<span> technorati </span>'),
(1398, '<i class=\"icofont-telegram\"></i>', '<span> telegram </span>'),
(1399, '<i class=\"icofont-tinder\"></i>', '<span> tinder </span>'),
(1400, '<i class=\"icofont-trello\"></i>', '<span> trello </span>'),
(1401, '<i class=\"icofont-tumblr\"></i>', '<span> tumblr </span>'),
(1402, '<i class=\"icofont-twitch\"></i>', '<span> twitch </span>'),
(1403, '<i class=\"icofont-twitter\"></i>', '<span> twitter </span>'),
(1404, '<i class=\"icofont-typo3\"></i>', '<span> typo3 </span>'),
(1405, '<i class=\"icofont-ubercart\"></i>', '<span> ubercart </span>'),
(1406, '<i class=\"icofont-viber\"></i>', '<span> viber </span>'),
(1407, '<i class=\"icofont-viddler\"></i>', '<span> viddler </span>'),
(1408, '<i class=\"icofont-vimeo\"></i>', '<span> vimeo </span>'),
(1409, '<i class=\"icofont-vine\"></i>', '<span> vine </span>'),
(1410, '<i class=\"icofont-virb\"></i>', '<span> virb </span>'),
(1411, '<i class=\"icofont-virtuemart\"></i>', '<span> virtuemart </span>'),
(1412, '<i class=\"icofont-vk\"></i>', '<span> vk </span>'),
(1413, '<i class=\"icofont-wechat\"></i>', '<span> wechat </span>'),
(1414, '<i class=\"icofont-weibo\"></i>', '<span> weibo </span>'),
(1415, '<i class=\"icofont-whatsapp\"></i>', '<span> whatsapp </span>'),
(1416, '<i class=\"icofont-xing\"></i>', '<span> xing </span>'),
(1417, '<i class=\"icofont-yahoo\"></i>', '<span> yahoo </span>'),
(1418, '<i class=\"icofont-yelp\"></i>', '<span> yelp </span>'),
(1419, '<i class=\"icofont-youku\"></i>', '<span> youku </span>'),
(1420, '<i class=\"icofont-youtube\"></i>', '<span> youtube </span>'),
(1421, '<i class=\"icofont-zencart\"></i>', '<span> zencart </span>'),
(1422, '<i class=\"icofont-badminton-birdie\"></i>', '<span> badminton-birdie </span>'),
(1423, '<i class=\"icofont-baseball\"></i>', '<span> baseball </span>'),
(1424, '<i class=\"icofont-baseballer\"></i>', '<span> baseballer </span>'),
(1425, '<i class=\"icofont-basketball-hoop\"></i>', '<span> basketball-hoop </span>'),
(1426, '<i class=\"icofont-basketball\"></i>', '<span> basketball </span>'),
(1427, '<i class=\"icofont-billiard-ball\"></i>', '<span> billiard-ball </span>'),
(1428, '<i class=\"icofont-boot-alt-1\"></i>', '<span> boot-alt-1 </span>'),
(1429, '<i class=\"icofont-boot-alt-2\"></i>', '<span> boot-alt-2 </span>'),
(1430, '<i class=\"icofont-boot\"></i>', '<span> boot </span>'),
(1431, '<i class=\"icofont-bowling-alt\"></i>', '<span> bowling-alt </span>'),
(1432, '<i class=\"icofont-bowling\"></i>', '<span> bowling </span>'),
(1433, '<i class=\"icofont-canoe\"></i>', '<span> canoe </span>'),
(1434, '<i class=\"icofont-cheer-leader\"></i>', '<span> cheer-leader </span>'),
(1435, '<i class=\"icofont-climbing\"></i>', '<span> climbing </span>'),
(1436, '<i class=\"icofont-corner\"></i>', '<span> corner </span>'),
(1437, '<i class=\"icofont-field-alt\"></i>', '<span> field-alt </span>'),
(1438, '<i class=\"icofont-field\"></i>', '<span> field </span>'),
(1439, '<i class=\"icofont-football-alt\"></i>', '<span> football-alt </span>'),
(1440, '<i class=\"icofont-football-american\"></i>', '<span> football-american </span>'),
(1441, '<i class=\"icofont-football\"></i>', '<span> football </span>'),
(1442, '<i class=\"icofont-foul\"></i>', '<span> foul </span>'),
(1443, '<i class=\"icofont-goal-keeper\"></i>', '<span> goal-keeper </span>'),
(1444, '<i class=\"icofont-goal\"></i>', '<span> goal </span>'),
(1445, '<i class=\"icofont-golf-alt\"></i>', '<span> golf-alt </span>'),
(1446, '<i class=\"icofont-golf-bag\"></i>', '<span> golf-bag </span>'),
(1447, '<i class=\"icofont-golf-cart\"></i>', '<span> golf-cart </span>'),
(1448, '<i class=\"icofont-golf-field\"></i>', '<span> golf-field </span>'),
(1449, '<i class=\"icofont-golf\"></i>', '<span> golf </span>'),
(1450, '<i class=\"icofont-golfer\"></i>', '<span> golfer </span>'),
(1451, '<i class=\"icofont-helmet\"></i>', '<span> helmet </span>'),
(1452, '<i class=\"icofont-hockey-alt\"></i>', '<span> hockey-alt </span>'),
(1453, '<i class=\"icofont-hockey\"></i>', '<span> hockey </span>'),
(1454, '<i class=\"icofont-ice-skate\"></i>', '<span> ice-skate </span>'),
(1455, '<i class=\"icofont-jersey-alt\"></i>', '<span> jersey-alt </span>'),
(1456, '<i class=\"icofont-jersey\"></i>', '<span> jersey </span>'),
(1457, '<i class=\"icofont-jumping\"></i>', '<span> jumping </span>'),
(1458, '<i class=\"icofont-kick\"></i>', '<span> kick </span>'),
(1459, '<i class=\"icofont-leg\"></i>', '<span> leg </span>'),
(1460, '<i class=\"icofont-match-review\"></i>', '<span> match-review </span>'),
(1461, '<i class=\"icofont-medal-sport\"></i>', '<span> medal-sport </span>'),
(1462, '<i class=\"icofont-offside\"></i>', '<span> offside </span>'),
(1463, '<i class=\"icofont-olympic-logo\"></i>', '<span> olympic-logo </span>'),
(1464, '<i class=\"icofont-olympic\"></i>', '<span> olympic </span>'),
(1465, '<i class=\"icofont-padding\"></i>', '<span> padding </span>'),
(1466, '<i class=\"icofont-penalty-card\"></i>', '<span> penalty-card </span>'),
(1467, '<i class=\"icofont-racer\"></i>', '<span> racer </span>'),
(1468, '<i class=\"icofont-racing-car\"></i>', '<span> racing-car </span>'),
(1469, '<i class=\"icofont-racing-flag-alt\"></i>', '<span> racing-flag-alt </span>'),
(1470, '<i class=\"icofont-racing-flag\"></i>', '<span> racing-flag </span>'),
(1471, '<i class=\"icofont-racings-wheel\"></i>', '<span> racings-wheel </span>'),
(1472, '<i class=\"icofont-referee\"></i>', '<span> referee </span>'),
(1473, '<i class=\"icofont-refree-jersey\"></i>', '<span> refree-jersey </span>'),
(1474, '<i class=\"icofont-result-sport\"></i>', '<span> result-sport </span>'),
(1475, '<i class=\"icofont-rugby-ball\"></i>', '<span> rugby-ball </span>'),
(1476, '<i class=\"icofont-rugby-player\"></i>', '<span> rugby-player </span>'),
(1477, '<i class=\"icofont-rugby\"></i>', '<span> rugby </span>'),
(1478, '<i class=\"icofont-runner-alt-1\"></i>', '<span> runner-alt-1 </span>'),
(1479, '<i class=\"icofont-runner-alt-2\"></i>', '<span> runner-alt-2 </span>'),
(1480, '<i class=\"icofont-runner\"></i>', '<span> runner </span>'),
(1481, '<i class=\"icofont-score-board\"></i>', '<span> score-board </span>'),
(1482, '<i class=\"icofont-skiing-man\"></i>', '<span> skiing-man </span>'),
(1483, '<i class=\"icofont-skydiving-goggles\"></i>', '<span> skydiving-goggles </span>'),
(1484, '<i class=\"icofont-snow-mobile\"></i>', '<span> snow-mobile </span>'),
(1485, '<i class=\"icofont-steering\"></i>', '<span> steering </span>'),
(1486, '<i class=\"icofont-stopwatch\"></i>', '<span> stopwatch </span>'),
(1487, '<i class=\"icofont-substitute\"></i>', '<span> substitute </span>'),
(1488, '<i class=\"icofont-swimmer\"></i>', '<span> swimmer </span>'),
(1489, '<i class=\"icofont-table-tennis\"></i>', '<span> table-tennis </span>'),
(1490, '<i class=\"icofont-team-alt\"></i>', '<span> team-alt </span>'),
(1491, '<i class=\"icofont-team\"></i>', '<span> team </span>'),
(1492, '<i class=\"icofont-tennis-player\"></i>', '<span> tennis-player </span>'),
(1493, '<i class=\"icofont-tennis\"></i>', '<span> tennis </span>'),
(1494, '<i class=\"icofont-tracking\"></i>', '<span> tracking </span>'),
(1495, '<i class=\"icofont-trophy-alt\"></i>', '<span> trophy-alt </span>'),
(1496, '<i class=\"icofont-trophy\"></i>', '<span> trophy </span>'),
(1497, '<i class=\"icofont-volleyball-alt\"></i>', '<span> volleyball-alt </span>'),
(1498, '<i class=\"icofont-volleyball-fire\"></i>', '<span> volleyball-fire </span>'),
(1499, '<i class=\"icofont-volleyball\"></i>', '<span> volleyball </span>'),
(1500, '<i class=\"icofont-water-bottle\"></i>', '<span> water-bottle </span>'),
(1501, '<i class=\"icofont-whistle-alt\"></i>', '<span> whistle-alt </span>'),
(1502, '<i class=\"icofont-whistle\"></i>', '<span> whistle </span>'),
(1503, '<i class=\"icofont-win-trophy\"></i>', '<span> win-trophy </span>'),
(1504, '<i class=\"icofont-align-center\"></i>', '<span> align-center </span>'),
(1505, '<i class=\"icofont-align-left\"></i>', '<span> align-left </span>'),
(1506, '<i class=\"icofont-align-right\"></i>', '<span> align-right </span>'),
(1507, '<i class=\"icofont-all-caps\"></i>', '<span> all-caps </span>'),
(1508, '<i class=\"icofont-bold\"></i>', '<span> bold </span>'),
(1509, '<i class=\"icofont-brush\"></i>', '<span> brush </span>'),
(1510, '<i class=\"icofont-clip-board\"></i>', '<span> clip-board </span>'),
(1511, '<i class=\"icofont-code-alt\"></i>', '<span> code-alt </span>'),
(1512, '<i class=\"icofont-color-bucket\"></i>', '<span> color-bucket </span>'),
(1513, '<i class=\"icofont-color-picker\"></i>', '<span> color-picker </span>'),
(1514, '<i class=\"icofont-copy-invert\"></i>', '<span> copy-invert </span>'),
(1515, '<i class=\"icofont-copy\"></i>', '<span> copy </span>'),
(1516, '<i class=\"icofont-cut\"></i>', '<span> cut </span>'),
(1517, '<i class=\"icofont-delete-alt\"></i>', '<span> delete-alt </span>'),
(1518, '<i class=\"icofont-edit-alt\"></i>', '<span> edit-alt </span>'),
(1519, '<i class=\"icofont-eraser-alt\"></i>', '<span> eraser-alt </span>'),
(1520, '<i class=\"icofont-font\"></i>', '<span> font </span>'),
(1521, '<i class=\"icofont-heading\"></i>', '<span> heading </span>'),
(1522, '<i class=\"icofont-indent\"></i>', '<span> indent </span>'),
(1523, '<i class=\"icofont-italic-alt\"></i>', '<span> italic-alt </span>'),
(1524, '<i class=\"icofont-italic\"></i>', '<span> italic </span>'),
(1525, '<i class=\"icofont-justify-all\"></i>', '<span> justify-all </span>'),
(1526, '<i class=\"icofont-justify-center\"></i>', '<span> justify-center </span>'),
(1527, '<i class=\"icofont-justify-left\"></i>', '<span> justify-left </span>'),
(1528, '<i class=\"icofont-justify-right\"></i>', '<span> justify-right </span>'),
(1529, '<i class=\"icofont-link-broken\"></i>', '<span> link-broken </span>'),
(1530, '<i class=\"icofont-outdent\"></i>', '<span> outdent </span>'),
(1531, '<i class=\"icofont-paper-clip\"></i>', '<span> paper-clip </span>'),
(1532, '<i class=\"icofont-paragraph\"></i>', '<span> paragraph </span>'),
(1533, '<i class=\"icofont-pin\"></i>', '<span> pin </span>'),
(1534, '<i class=\"icofont-printer\"></i>', '<span> printer </span>'),
(1535, '<i class=\"icofont-redo\"></i>', '<span> redo </span>'),
(1536, '<i class=\"icofont-rotation\"></i>', '<span> rotation </span>'),
(1537, '<i class=\"icofont-save\"></i>', '<span> save </span>'),
(1538, '<i class=\"icofont-small-cap\"></i>', '<span> small-cap </span>'),
(1539, '<i class=\"icofont-strike-through\"></i>', '<span> strike-through </span>'),
(1540, '<i class=\"icofont-sub-listing\"></i>', '<span> sub-listing </span>'),
(1541, '<i class=\"icofont-subscript\"></i>', '<span> subscript </span>'),
(1542, '<i class=\"icofont-superscript\"></i>', '<span> superscript </span>'),
(1543, '<i class=\"icofont-table\"></i>', '<span> table </span>'),
(1544, '<i class=\"icofont-text-height\"></i>', '<span> text-height </span>'),
(1545, '<i class=\"icofont-text-width\"></i>', '<span> text-width </span>'),
(1546, '<i class=\"icofont-trash\"></i>', '<span> trash </span>'),
(1547, '<i class=\"icofont-underline\"></i>', '<span> underline </span>'),
(1548, '<i class=\"icofont-undo\"></i>', '<span> undo </span>'),
(1549, '<i class=\"icofont-air-balloon\"></i>', '<span> air-balloon </span>'),
(1550, '<i class=\"icofont-airplane-alt\"></i>', '<span> airplane-alt </span>'),
(1551, '<i class=\"icofont-airplane\"></i>', '<span> airplane </span>'),
(1552, '<i class=\"icofont-articulated-truck\"></i>', '<span> articulated-truck </span>'),
(1553, '<i class=\"icofont-auto-mobile\"></i>', '<span> auto-mobile </span>'),
(1554, '<i class=\"icofont-auto-rickshaw\"></i>', '<span> auto-rickshaw </span>'),
(1555, '<i class=\"icofont-bicycle-alt-1\"></i>', '<span> bicycle-alt-1 </span>'),
(1556, '<i class=\"icofont-bicycle-alt-2\"></i>', '<span> bicycle-alt-2 </span>'),
(1557, '<i class=\"icofont-bicycle\"></i>', '<span> bicycle </span>'),
(1558, '<i class=\"icofont-bus-alt-1\"></i>', '<span> bus-alt-1 </span>'),
(1559, '<i class=\"icofont-bus-alt-2\"></i>', '<span> bus-alt-2 </span>'),
(1560, '<i class=\"icofont-bus-alt-3\"></i>', '<span> bus-alt-3 </span>'),
(1561, '<i class=\"icofont-bus\"></i>', '<span> bus </span>'),
(1562, '<i class=\"icofont-cab\"></i>', '<span> cab </span>'),
(1563, '<i class=\"icofont-cable-car\"></i>', '<span> cable-car </span>'),
(1564, '<i class=\"icofont-car-alt-1\"></i>', '<span> car-alt-1 </span>'),
(1565, '<i class=\"icofont-car-alt-2\"></i>', '<span> car-alt-2 </span>'),
(1566, '<i class=\"icofont-car-alt-3\"></i>', '<span> car-alt-3 </span>'),
(1567, '<i class=\"icofont-car-alt-4\"></i>', '<span> car-alt-4 </span>'),
(1568, '<i class=\"icofont-car\"></i>', '<span> car </span>'),
(1569, '<i class=\"icofont-delivery-time\"></i>', '<span> delivery-time </span>'),
(1570, '<i class=\"icofont-fast-delivery\"></i>', '<span> fast-delivery </span>'),
(1571, '<i class=\"icofont-fire-truck-alt\"></i>', '<span> fire-truck-alt </span>'),
(1572, '<i class=\"icofont-fire-truck\"></i>', '<span> fire-truck </span>'),
(1573, '<i class=\"icofont-free-delivery\"></i>', '<span> free-delivery </span>'),
(1574, '<i class=\"icofont-helicopter\"></i>', '<span> helicopter </span>'),
(1575, '<i class=\"icofont-motor-bike-alt\"></i>', '<span> motor-bike-alt </span>'),
(1576, '<i class=\"icofont-motor-bike\"></i>', '<span> motor-bike </span>'),
(1577, '<i class=\"icofont-motor-biker\"></i>', '<span> motor-biker </span>'),
(1578, '<i class=\"icofont-oil-truck\"></i>', '<span> oil-truck </span>'),
(1579, '<i class=\"icofont-rickshaw\"></i>', '<span> rickshaw </span>'),
(1580, '<i class=\"icofont-rocket-alt-1\"></i>', '<span> rocket-alt-1 </span>'),
(1581, '<i class=\"icofont-rocket-alt-2\"></i>', '<span> rocket-alt-2 </span>'),
(1582, '<i class=\"icofont-rocket\"></i>', '<span> rocket </span>'),
(1583, '<i class=\"icofont-sail-boat-alt-1\"></i>', '<span> sail-boat-alt-1 </span>'),
(1584, '<i class=\"icofont-sail-boat-alt-2\"></i>', '<span> sail-boat-alt-2 </span>'),
(1585, '<i class=\"icofont-sail-boat\"></i>', '<span> sail-boat </span>'),
(1586, '<i class=\"icofont-scooter\"></i>', '<span> scooter </span>'),
(1587, '<i class=\"icofont-sea-plane\"></i>', '<span> sea-plane </span>'),
(1588, '<i class=\"icofont-ship-alt\"></i>', '<span> ship-alt </span>'),
(1589, '<i class=\"icofont-ship\"></i>', '<span> ship </span>'),
(1590, '<i class=\"icofont-speed-boat\"></i>', '<span> speed-boat </span>'),
(1591, '<i class=\"icofont-taxi\"></i>', '<span> taxi </span>'),
(1592, '<i class=\"icofont-tractor\"></i>', '<span> tractor </span>'),
(1593, '<i class=\"icofont-train-line\"></i>', '<span> train-line </span>'),
(1594, '<i class=\"icofont-train-steam\"></i>', '<span> train-steam </span>'),
(1595, '<i class=\"icofont-tram\"></i>', '<span> tram </span>'),
(1596, '<i class=\"icofont-truck-alt\"></i>', '<span> truck-alt </span>'),
(1597, '<i class=\"icofont-truck-loaded\"></i>', '<span> truck-loaded </span>'),
(1598, '<i class=\"icofont-truck\"></i>', '<span> truck </span>'),
(1599, '<i class=\"icofont-van-alt\"></i>', '<span> van-alt </span>'),
(1600, '<i class=\"icofont-van\"></i>', '<span> van </span>'),
(1601, '<i class=\"icofont-yacht\"></i>', '<span> yacht </span>'),
(1602, '<i class=\"icofont-5-star-hotel\"></i>', '<span> 5-star-hotel </span>'),
(1603, '<i class=\"icofont-air-ticket\"></i>', '<span> air-ticket </span>'),
(1604, '<i class=\"icofont-beach-bed\"></i>', '<span> beach-bed </span>'),
(1605, '<i class=\"icofont-beach\"></i>', '<span> beach </span>'),
(1606, '<i class=\"icofont-camping-vest\"></i>', '<span> camping-vest </span>'),
(1607, '<i class=\"icofont-direction-sign\"></i>', '<span> direction-sign </span>'),
(1608, '<i class=\"icofont-hill-side\"></i>', '<span> hill-side </span>'),
(1609, '<i class=\"icofont-hill\"></i>', '<span> hill </span>'),
(1610, '<i class=\"icofont-hotel\"></i>', '<span> hotel </span>'),
(1611, '<i class=\"icofont-island-alt\"></i>', '<span> island-alt </span>'),
(1612, '<i class=\"icofont-island\"></i>', '<span> island </span>'),
(1613, '<i class=\"icofont-sandals-female\"></i>', '<span> sandals-female </span>'),
(1614, '<i class=\"icofont-sandals-male\"></i>', '<span> sandals-male </span>'),
(1615, '<i class=\"icofont-travelling\"></i>', '<span> travelling </span>'),
(1616, '<i class=\"icofont-breakdown\"></i>', '<span> breakdown </span>'),
(1617, '<i class=\"icofont-celsius\"></i>', '<span> celsius </span>'),
(1618, '<i class=\"icofont-clouds\"></i>', '<span> clouds </span>'),
(1619, '<i class=\"icofont-cloudy\"></i>', '<span> cloudy </span>'),
(1620, '<i class=\"icofont-dust\"></i>', '<span> dust </span>'),
(1621, '<i class=\"icofont-eclipse\"></i>', '<span> eclipse </span>'),
(1622, '<i class=\"icofont-fahrenheit\"></i>', '<span> fahrenheit </span>'),
(1623, '<i class=\"icofont-forest-fire\"></i>', '<span> forest-fire </span>'),
(1624, '<i class=\"icofont-full-night\"></i>', '<span> full-night </span>'),
(1625, '<i class=\"icofont-full-sunny\"></i>', '<span> full-sunny </span>'),
(1626, '<i class=\"icofont-hail-night\"></i>', '<span> hail-night </span>'),
(1627, '<i class=\"icofont-hail-rainy-night\"></i>', '<span> hail-rainy-night </span>'),
(1628, '<i class=\"icofont-hail-rainy-sunny\"></i>', '<span> hail-rainy-sunny </span>'),
(1629, '<i class=\"icofont-hail-rainy\"></i>', '<span> hail-rainy </span>'),
(1630, '<i class=\"icofont-hail-sunny\"></i>', '<span> hail-sunny </span>'),
(1631, '<i class=\"icofont-hail-thunder-night\"></i>', '<span> hail-thunder-night </span>'),
(1632, '<i class=\"icofont-hail-thunder-sunny\"></i>', '<span> hail-thunder-sunny </span>'),
(1633, '<i class=\"icofont-hail-thunder\"></i>', '<span> hail-thunder </span>'),
(1634, '<i class=\"icofont-hail\"></i>', '<span> hail </span>'),
(1635, '<i class=\"icofont-hill-night\"></i>', '<span> hill-night </span>'),
(1636, '<i class=\"icofont-hill-sunny\"></i>', '<span> hill-sunny </span>'),
(1637, '<i class=\"icofont-hurricane\"></i>', '<span> hurricane </span>'),
(1638, '<i class=\"icofont-meteor\"></i>', '<span> meteor </span>'),
(1639, '<i class=\"icofont-night\"></i>', '<span> night </span>'),
(1640, '<i class=\"icofont-rainy-night\"></i>', '<span> rainy-night </span>'),
(1641, '<i class=\"icofont-rainy-sunny\"></i>', '<span> rainy-sunny </span>'),
(1642, '<i class=\"icofont-rainy-thunder\"></i>', '<span> rainy-thunder </span>'),
(1643, '<i class=\"icofont-rainy\"></i>', '<span> rainy </span>'),
(1644, '<i class=\"icofont-snow-alt\"></i>', '<span> snow-alt </span>'),
(1645, '<i class=\"icofont-snow-flake\"></i>', '<span> snow-flake </span>'),
(1646, '<i class=\"icofont-snow-temp\"></i>', '<span> snow-temp </span>'),
(1647, '<i class=\"icofont-snow\"></i>', '<span> snow </span>'),
(1648, '<i class=\"icofont-snowy-hail\"></i>', '<span> snowy-hail </span>'),
(1649, '<i class=\"icofont-snowy-night-hail\"></i>', '<span> snowy-night-hail </span>'),
(1650, '<i class=\"icofont-snowy-night-rainy\"></i>', '<span> snowy-night-rainy </span>'),
(1651, '<i class=\"icofont-snowy-night\"></i>', '<span> snowy-night </span>'),
(1652, '<i class=\"icofont-snowy-rainy\"></i>', '<span> snowy-rainy </span>'),
(1653, '<i class=\"icofont-snowy-sunny-hail\"></i>', '<span> snowy-sunny-hail </span>'),
(1654, '<i class=\"icofont-snowy-sunny-rainy\"></i>', '<span> snowy-sunny-rainy </span>'),
(1655, '<i class=\"icofont-snowy-sunny\"></i>', '<span> snowy-sunny </span>'),
(1656, '<i class=\"icofont-snowy-thunder-night\"></i>', '<span> snowy-thunder-night </span>'),
(1657, '<i class=\"icofont-snowy-thunder-sunny\"></i>', '<span> snowy-thunder-sunny </span>'),
(1658, '<i class=\"icofont-snowy-thunder\"></i>', '<span> snowy-thunder </span>'),
(1659, '<i class=\"icofont-snowy-windy-night\"></i>', '<span> snowy-windy-night </span>'),
(1660, '<i class=\"icofont-snowy-windy-sunny\"></i>', '<span> snowy-windy-sunny </span>'),
(1661, '<i class=\"icofont-snowy-windy\"></i>', '<span> snowy-windy </span>'),
(1662, '<i class=\"icofont-snowy\"></i>', '<span> snowy </span>'),
(1663, '<i class=\"icofont-sun-alt\"></i>', '<span> sun-alt </span>'),
(1664, '<i class=\"icofont-sun-rise\"></i>', '<span> sun-rise </span>'),
(1665, '<i class=\"icofont-sun-set\"></i>', '<span> sun-set </span>'),
(1666, '<i class=\"icofont-sun\"></i>', '<span> sun </span>'),
(1667, '<i class=\"icofont-sunny-day-temp\"></i>', '<span> sunny-day-temp </span>'),
(1668, '<i class=\"icofont-sunny\"></i>', '<span> sunny </span>'),
(1669, '<i class=\"icofont-thunder-light\"></i>', '<span> thunder-light </span>'),
(1670, '<i class=\"icofont-tornado\"></i>', '<span> tornado </span>'),
(1671, '<i class=\"icofont-umbrella-alt\"></i>', '<span> umbrella-alt </span>'),
(1672, '<i class=\"icofont-umbrella\"></i>', '<span> umbrella </span>'),
(1673, '<i class=\"icofont-volcano\"></i>', '<span> volcano </span>'),
(1674, '<i class=\"icofont-wave\"></i>', '<span> wave </span>'),
(1675, '<i class=\"icofont-wind-scale-0\"></i>', '<span> wind-scale-0 </span>'),
(1676, '<i class=\"icofont-wind-scale-1\"></i>', '<span> wind-scale-1 </span>'),
(1677, '<i class=\"icofont-wind-scale-10\"></i>', '<span> wind-scale-10 </span>'),
(1678, '<i class=\"icofont-wind-scale-11\"></i>', '<span> wind-scale-11 </span>'),
(1679, '<i class=\"icofont-wind-scale-12\"></i>', '<span> wind-scale-12 </span>'),
(1680, '<i class=\"icofont-wind-scale-2\"></i>', '<span> wind-scale-2 </span>'),
(1681, '<i class=\"icofont-wind-scale-3\"></i>', '<span> wind-scale-3 </span>'),
(1682, '<i class=\"icofont-wind-scale-4\"></i>', '<span> wind-scale-4 </span>'),
(1683, '<i class=\"icofont-wind-scale-5\"></i>', '<span> wind-scale-5 </span>'),
(1684, '<i class=\"icofont-wind-scale-6\"></i>', '<span> wind-scale-6 </span>'),
(1685, '<i class=\"icofont-wind-scale-7\"></i>', '<span> wind-scale-7 </span>'),
(1686, '<i class=\"icofont-wind-scale-8\"></i>', '<span> wind-scale-8 </span>'),
(1687, '<i class=\"icofont-wind-scale-9\"></i>', '<span> wind-scale-9 </span>'),
(1688, '<i class=\"icofont-wind-waves\"></i>', '<span> wind-waves </span>'),
(1689, '<i class=\"icofont-wind\"></i>', '<span> wind </span>'),
(1690, '<i class=\"icofont-windy-hail\"></i>', '<span> windy-hail </span>'),
(1691, '<i class=\"icofont-windy-night\"></i>', '<span> windy-night </span>'),
(1692, '<i class=\"icofont-windy-raining\"></i>', '<span> windy-raining </span>'),
(1693, '<i class=\"icofont-windy-sunny\"></i>', '<span> windy-sunny </span>'),
(1694, '<i class=\"icofont-windy-thunder-raining\"></i>', '<span> windy-thunder-raining </span>'),
(1695, '<i class=\"icofont-windy-thunder\"></i>', '<span> windy-thunder </span>'),
(1696, '<i class=\"icofont-windy\"></i>', '<span> windy </span>'),
(1697, '<i class=\"icofont-addons\"></i>', '<span> addons </span>'),
(1698, '<i class=\"icofont-address-book\"></i>', '<span> address-book </span>'),
(1699, '<i class=\"icofont-adjust\"></i>', '<span> adjust </span>'),
(1700, '<i class=\"icofont-alarm\"></i>', '<span> alarm </span>'),
(1701, '<i class=\"icofont-anchor\"></i>', '<span> anchor </span>'),
(1702, '<i class=\"icofont-archive\"></i>', '<span> archive </span>'),
(1703, '<i class=\"icofont-at\"></i>', '<span> at </span>'),
(1704, '<i class=\"icofont-attachment\"></i>', '<span> attachment </span>'),
(1705, '<i class=\"icofont-audio\"></i>', '<span> audio </span>'),
(1706, '<i class=\"icofont-automation\"></i>', '<span> automation </span>'),
(1707, '<i class=\"icofont-badge\"></i>', '<span> badge </span>'),
(1708, '<i class=\"icofont-bag-alt\"></i>', '<span> bag-alt </span>'),
(1709, '<i class=\"icofont-bag\"></i>', '<span> bag </span>'),
(1710, '<i class=\"icofont-ban\"></i>', '<span> ban </span>'),
(1711, '<i class=\"icofont-bar-code\"></i>', '<span> bar-code </span>'),
(1712, '<i class=\"icofont-bars\"></i>', '<span> bars </span>'),
(1713, '<i class=\"icofont-basket\"></i>', '<span> basket </span>'),
(1714, '<i class=\"icofont-battery-empty\"></i>', '<span> battery-empty </span>'),
(1715, '<i class=\"icofont-battery-full\"></i>', '<span> battery-full </span>'),
(1716, '<i class=\"icofont-battery-half\"></i>', '<span> battery-half </span>'),
(1717, '<i class=\"icofont-battery-low\"></i>', '<span> battery-low </span>'),
(1718, '<i class=\"icofont-beaker\"></i>', '<span> beaker </span>'),
(1719, '<i class=\"icofont-beard\"></i>', '<span> beard </span>'),
(1720, '<i class=\"icofont-bed\"></i>', '<span> bed </span>'),
(1721, '<i class=\"icofont-bell\"></i>', '<span> bell </span>'),
(1722, '<i class=\"icofont-beverage\"></i>', '<span> beverage </span>'),
(1723, '<i class=\"icofont-bill\"></i>', '<span> bill </span>'),
(1724, '<i class=\"icofont-bin\"></i>', '<span> bin </span>'),
(1725, '<i class=\"icofont-binary\"></i>', '<span> binary </span>'),
(1726, '<i class=\"icofont-binoculars\"></i>', '<span> binoculars </span>'),
(1727, '<i class=\"icofont-bluetooth\"></i>', '<span> bluetooth </span>'),
(1728, '<i class=\"icofont-bomb\"></i>', '<span> bomb </span>'),
(1729, '<i class=\"icofont-book-mark\"></i>', '<span> book-mark </span>'),
(1730, '<i class=\"icofont-box\"></i>', '<span> box </span>'),
(1731, '<i class=\"icofont-briefcase\"></i>', '<span> briefcase </span>'),
(1732, '<i class=\"icofont-broken\"></i>', '<span> broken </span>'),
(1733, '<i class=\"icofont-bucket\"></i>', '<span> bucket </span>'),
(1734, '<i class=\"icofont-bucket1\"></i>', '<span> bucket1 </span>'),
(1735, '<i class=\"icofont-bucket2\"></i>', '<span> bucket2 </span>'),
(1736, '<i class=\"icofont-bug\"></i>', '<span> bug </span>'),
(1737, '<i class=\"icofont-building\"></i>', '<span> building </span>'),
(1738, '<i class=\"icofont-bulb-alt\"></i>', '<span> bulb-alt </span>'),
(1739, '<i class=\"icofont-bullet\"></i>', '<span> bullet </span>'),
(1740, '<i class=\"icofont-bullhorn\"></i>', '<span> bullhorn </span>'),
(1741, '<i class=\"icofont-bullseye\"></i>', '<span> bullseye </span>'),
(1742, '<i class=\"icofont-calendar\"></i>', '<span> calendar </span>'),
(1743, '<i class=\"icofont-camera-alt\"></i>', '<span> camera-alt </span>'),
(1744, '<i class=\"icofont-camera\"></i>', '<span> camera </span>'),
(1745, '<i class=\"icofont-card\"></i>', '<span> card </span>'),
(1746, '<i class=\"icofont-cart-alt\"></i>', '<span> cart-alt </span>'),
(1747, '<i class=\"icofont-cart\"></i>', '<span> cart </span>'),
(1748, '<i class=\"icofont-cc\"></i>', '<span> cc </span>'),
(1749, '<i class=\"icofont-charging\"></i>', '<span> charging </span>'),
(1750, '<i class=\"icofont-chat\"></i>', '<span> chat </span>'),
(1751, '<i class=\"icofont-check-alt\"></i>', '<span> check-alt </span>'),
(1752, '<i class=\"icofont-check-circled\"></i>', '<span> check-circled </span>'),
(1753, '<i class=\"icofont-check\"></i>', '<span> check </span>'),
(1754, '<i class=\"icofont-checked\"></i>', '<span> checked </span>'),
(1755, '<i class=\"icofont-children-care\"></i>', '<span> children-care </span>'),
(1756, '<i class=\"icofont-clip\"></i>', '<span> clip </span>'),
(1757, '<i class=\"icofont-clock-time\"></i>', '<span> clock-time </span>'),
(1758, '<i class=\"icofont-close-circled\"></i>', '<span> close-circled </span>'),
(1759, '<i class=\"icofont-close-line-circled\"></i>', '<span> close-line-circled </span>'),
(1760, '<i class=\"icofont-close-line-squared-alt\"></i>', '<span> close-line-squared-alt </span>'),
(1761, '<i class=\"icofont-close-line-squared\"></i>', '<span> close-line-squared </span>'),
(1762, '<i class=\"icofont-close-line\"></i>', '<span> close-line </span>'),
(1763, '<i class=\"icofont-close-squared-alt\"></i>', '<span> close-squared-alt </span>'),
(1764, '<i class=\"icofont-close-squared\"></i>', '<span> close-squared </span>'),
(1765, '<i class=\"icofont-close\"></i>', '<span> close </span>'),
(1766, '<i class=\"icofont-cloud-download\"></i>', '<span> cloud-download </span>'),
(1767, '<i class=\"icofont-cloud-refresh\"></i>', '<span> cloud-refresh </span>'),
(1768, '<i class=\"icofont-cloud-upload\"></i>', '<span> cloud-upload </span>'),
(1769, '<i class=\"icofont-cloud\"></i>', '<span> cloud </span>'),
(1770, '<i class=\"icofont-code-not-allowed\"></i>', '<span> code-not-allowed </span>'),
(1771, '<i class=\"icofont-code\"></i>', '<span> code </span>'),
(1772, '<i class=\"icofont-comment\"></i>', '<span> comment </span>'),
(1773, '<i class=\"icofont-compass-alt\"></i>', '<span> compass-alt </span>'),
(1774, '<i class=\"icofont-compass\"></i>', '<span> compass </span>'),
(1775, '<i class=\"icofont-computer\"></i>', '<span> computer </span>'),
(1776, '<i class=\"icofont-connection\"></i>', '<span> connection </span>'),
(1777, '<i class=\"icofont-console\"></i>', '<span> console </span>'),
(1778, '<i class=\"icofont-contacts\"></i>', '<span> contacts </span>'),
(1779, '<i class=\"icofont-contrast\"></i>', '<span> contrast </span>'),
(1780, '<i class=\"icofont-copyright\"></i>', '<span> copyright </span>'),
(1781, '<i class=\"icofont-credit-card\"></i>', '<span> credit-card </span>'),
(1782, '<i class=\"icofont-crop\"></i>', '<span> crop </span>'),
(1783, '<i class=\"icofont-crown\"></i>', '<span> crown </span>'),
(1784, '<i class=\"icofont-cube\"></i>', '<span> cube </span>'),
(1785, '<i class=\"icofont-cubes\"></i>', '<span> cubes </span>'),
(1786, '<i class=\"icofont-dashboard-web\"></i>', '<span> dashboard-web </span>'),
(1787, '<i class=\"icofont-dashboard\"></i>', '<span> dashboard </span>'),
(1788, '<i class=\"icofont-data\"></i>', '<span> data </span>'),
(1789, '<i class=\"icofont-database-add\"></i>', '<span> database-add </span>'),
(1790, '<i class=\"icofont-database-locked\"></i>', '<span> database-locked </span>'),
(1791, '<i class=\"icofont-database-remove\"></i>', '<span> database-remove </span>'),
(1792, '<i class=\"icofont-database\"></i>', '<span> database </span>'),
(1793, '<i class=\"icofont-delete\"></i>', '<span> delete </span>'),
(1794, '<i class=\"icofont-diamond\"></i>', '<span> diamond </span>'),
(1795, '<i class=\"icofont-dice-multiple\"></i>', '<span> dice-multiple </span>'),
(1796, '<i class=\"icofont-dice\"></i>', '<span> dice </span>'),
(1797, '<i class=\"icofont-disc\"></i>', '<span> disc </span>'),
(1798, '<i class=\"icofont-diskette\"></i>', '<span> diskette </span>'),
(1799, '<i class=\"icofont-document-folder\"></i>', '<span> document-folder </span>'),
(1800, '<i class=\"icofont-download-alt\"></i>', '<span> download-alt </span>'),
(1801, '<i class=\"icofont-download\"></i>', '<span> download </span>'),
(1802, '<i class=\"icofont-downloaded\"></i>', '<span> downloaded </span>'),
(1803, '<i class=\"icofont-drag\"></i>', '<span> drag </span>'),
(1804, '<i class=\"icofont-drag1\"></i>', '<span> drag1 </span>'),
(1805, '<i class=\"icofont-drag2\"></i>', '<span> drag2 </span>'),
(1806, '<i class=\"icofont-drag3\"></i>', '<span> drag3 </span>'),
(1807, '<i class=\"icofont-earth\"></i>', '<span> earth </span>'),
(1808, '<i class=\"icofont-ebook\"></i>', '<span> ebook </span>'),
(1809, '<i class=\"icofont-edit\"></i>', '<span> edit </span>'),
(1810, '<i class=\"icofont-eject\"></i>', '<span> eject </span>'),
(1811, '<i class=\"icofont-email\"></i>', '<span> email </span>'),
(1812, '<i class=\"icofont-envelope-open\"></i>', '<span> envelope-open </span>'),
(1813, '<i class=\"icofont-envelope\"></i>', '<span> envelope </span>'),
(1814, '<i class=\"icofont-eraser\"></i>', '<span> eraser </span>'),
(1815, '<i class=\"icofont-error\"></i>', '<span> error </span>'),
(1816, '<i class=\"icofont-excavator\"></i>', '<span> excavator </span>'),
(1817, '<i class=\"icofont-exchange\"></i>', '<span> exchange </span>'),
(1818, '<i class=\"icofont-exclamation-circle\"></i>', '<span> exclamation-circle </span>'),
(1819, '<i class=\"icofont-exclamation-square\"></i>', '<span> exclamation-square </span>'),
(1820, '<i class=\"icofont-exclamation-tringle\"></i>', '<span> exclamation-tringle </span>'),
(1821, '<i class=\"icofont-exclamation\"></i>', '<span> exclamation </span>'),
(1822, '<i class=\"icofont-exit\"></i>', '<span> exit </span>'),
(1823, '<i class=\"icofont-expand\"></i>', '<span> expand </span>'),
(1824, '<i class=\"icofont-external-link\"></i>', '<span> external-link </span>'),
(1825, '<i class=\"icofont-external\"></i>', '<span> external </span>'),
(1826, '<i class=\"icofont-eye-alt\"></i>', '<span> eye-alt </span>'),
(1827, '<i class=\"icofont-eye-blocked\"></i>', '<span> eye-blocked </span>'),
(1828, '<i class=\"icofont-eye-dropper\"></i>', '<span> eye-dropper </span>'),
(1829, '<i class=\"icofont-eye\"></i>', '<span> eye </span>'),
(1830, '<i class=\"icofont-favourite\"></i>', '<span> favourite </span>'),
(1831, '<i class=\"icofont-fax\"></i>', '<span> fax </span>'),
(1832, '<i class=\"icofont-file-fill\"></i>', '<span> file-fill </span>'),
(1833, '<i class=\"icofont-film\"></i>', '<span> film </span>'),
(1834, '<i class=\"icofont-filter\"></i>', '<span> filter </span>'),
(1835, '<i class=\"icofont-fire-alt\"></i>', '<span> fire-alt </span>'),
(1836, '<i class=\"icofont-fire-burn\"></i>', '<span> fire-burn </span>'),
(1837, '<i class=\"icofont-fire\"></i>', '<span> fire </span>'),
(1838, '<i class=\"icofont-flag-alt-1\"></i>', '<span> flag-alt-1 </span>'),
(1839, '<i class=\"icofont-flag-alt-2\"></i>', '<span> flag-alt-2 </span>'),
(1840, '<i class=\"icofont-flag\"></i>', '<span> flag </span>'),
(1841, '<i class=\"icofont-flame-torch\"></i>', '<span> flame-torch </span>'),
(1842, '<i class=\"icofont-flash-light\"></i>', '<span> flash-light </span>'),
(1843, '<i class=\"icofont-flash\"></i>', '<span> flash </span>'),
(1844, '<i class=\"icofont-flask\"></i>', '<span> flask </span>'),
(1845, '<i class=\"icofont-focus\"></i>', '<span> focus </span>'),
(1846, '<i class=\"icofont-folder-open\"></i>', '<span> folder-open </span>'),
(1847, '<i class=\"icofont-folder\"></i>', '<span> folder </span>'),
(1848, '<i class=\"icofont-foot-print\"></i>', '<span> foot-print </span>'),
(1849, '<i class=\"icofont-garbage\"></i>', '<span> garbage </span>'),
(1850, '<i class=\"icofont-gear-alt\"></i>', '<span> gear-alt </span>'),
(1851, '<i class=\"icofont-gear\"></i>', '<span> gear </span>'),
(1852, '<i class=\"icofont-gears\"></i>', '<span> gears </span>'),
(1853, '<i class=\"icofont-gift\"></i>', '<span> gift </span>'),
(1854, '<i class=\"icofont-glass\"></i>', '<span> glass </span>'),
(1855, '<i class=\"icofont-globe\"></i>', '<span> globe </span>'),
(1856, '<i class=\"icofont-graffiti\"></i>', '<span> graffiti </span>'),
(1857, '<i class=\"icofont-grocery\"></i>', '<span> grocery </span>'),
(1858, '<i class=\"icofont-hand\"></i>', '<span> hand </span>'),
(1859, '<i class=\"icofont-hanger\"></i>', '<span> hanger </span>'),
(1860, '<i class=\"icofont-hard-disk\"></i>', '<span> hard-disk </span>'),
(1861, '<i class=\"icofont-heart-alt\"></i>', '<span> heart-alt </span>'),
(1862, '<i class=\"icofont-heart\"></i>', '<span> heart </span>'),
(1863, '<i class=\"icofont-history\"></i>', '<span> history </span>'),
(1864, '<i class=\"icofont-home\"></i>', '<span> home </span>'),
(1865, '<i class=\"icofont-horn\"></i>', '<span> horn </span>'),
(1866, '<i class=\"icofont-hour-glass\"></i>', '<span> hour-glass </span>'),
(1867, '<i class=\"icofont-id\"></i>', '<span> id </span>'),
(1868, '<i class=\"icofont-image\"></i>', '<span> image </span>'),
(1869, '<i class=\"icofont-inbox\"></i>', '<span> inbox </span>'),
(1870, '<i class=\"icofont-infinite\"></i>', '<span> infinite </span>'),
(1871, '<i class=\"icofont-info-circle\"></i>', '<span> info-circle </span>'),
(1872, '<i class=\"icofont-info-square\"></i>', '<span> info-square </span>'),
(1873, '<i class=\"icofont-info\"></i>', '<span> info </span>'),
(1874, '<i class=\"icofont-institution\"></i>', '<span> institution </span>'),
(1875, '<i class=\"icofont-interface\"></i>', '<span> interface </span>'),
(1876, '<i class=\"icofont-invisible\"></i>', '<span> invisible </span>'),
(1877, '<i class=\"icofont-jacket\"></i>', '<span> jacket </span>'),
(1878, '<i class=\"icofont-jar\"></i>', '<span> jar </span>'),
(1879, '<i class=\"icofont-jewlery\"></i>', '<span> jewlery </span>'),
(1880, '<i class=\"icofont-karate\"></i>', '<span> karate </span>'),
(1881, '<i class=\"icofont-key-hole\"></i>', '<span> key-hole </span>'),
(1882, '<i class=\"icofont-key\"></i>', '<span> key </span>'),
(1883, '<i class=\"icofont-label\"></i>', '<span> label </span>'),
(1884, '<i class=\"icofont-lamp\"></i>', '<span> lamp </span>'),
(1885, '<i class=\"icofont-layers\"></i>', '<span> layers </span>'),
(1886, '<i class=\"icofont-layout\"></i>', '<span> layout </span>'),
(1887, '<i class=\"icofont-leaf\"></i>', '<span> leaf </span>'),
(1888, '<i class=\"icofont-leaflet\"></i>', '<span> leaflet </span>'),
(1889, '<i class=\"icofont-learn\"></i>', '<span> learn </span>'),
(1890, '<i class=\"icofont-lego\"></i>', '<span> lego </span>'),
(1891, '<i class=\"icofont-lens\"></i>', '<span> lens </span>'),
(1892, '<i class=\"icofont-letter\"></i>', '<span> letter </span>'),
(1893, '<i class=\"icofont-letterbox\"></i>', '<span> letterbox </span>'),
(1894, '<i class=\"icofont-library\"></i>', '<span> library </span>'),
(1895, '<i class=\"icofont-license\"></i>', '<span> license </span>'),
(1896, '<i class=\"icofont-life-bouy\"></i>', '<span> life-bouy </span>'),
(1897, '<i class=\"icofont-life-buoy\"></i>', '<span> life-buoy </span>'),
(1898, '<i class=\"icofont-life-jacket\"></i>', '<span> life-jacket </span>'),
(1899, '<i class=\"icofont-life-ring\"></i>', '<span> life-ring </span>'),
(1900, '<i class=\"icofont-light-bulb\"></i>', '<span> light-bulb </span>'),
(1901, '<i class=\"icofont-lighter\"></i>', '<span> lighter </span>'),
(1902, '<i class=\"icofont-lightning-ray\"></i>', '<span> lightning-ray </span>'),
(1903, '<i class=\"icofont-like\"></i>', '<span> like </span>'),
(1904, '<i class=\"icofont-line-height\"></i>', '<span> line-height </span>'),
(1905, '<i class=\"icofont-link-alt\"></i>', '<span> link-alt </span>'),
(1906, '<i class=\"icofont-link\"></i>', '<span> link </span>'),
(1907, '<i class=\"icofont-list\"></i>', '<span> list </span>'),
(1908, '<i class=\"icofont-listening\"></i>', '<span> listening </span>'),
(1909, '<i class=\"icofont-listine-dots\"></i>', '<span> listine-dots </span>'),
(1910, '<i class=\"icofont-listing-box\"></i>', '<span> listing-box </span>'),
(1911, '<i class=\"icofont-listing-number\"></i>', '<span> listing-number </span>'),
(1912, '<i class=\"icofont-live-support\"></i>', '<span> live-support </span>'),
(1913, '<i class=\"icofont-location-arrow\"></i>', '<span> location-arrow </span>'),
(1914, '<i class=\"icofont-location-pin\"></i>', '<span> location-pin </span>'),
(1915, '<i class=\"icofont-lock\"></i>', '<span> lock </span>'),
(1916, '<i class=\"icofont-login\"></i>', '<span> login </span>'),
(1917, '<i class=\"icofont-logout\"></i>', '<span> logout </span>'),
(1918, '<i class=\"icofont-lollipop\"></i>', '<span> lollipop </span>'),
(1919, '<i class=\"icofont-long-drive\"></i>', '<span> long-drive </span>'),
(1920, '<i class=\"icofont-look\"></i>', '<span> look </span>'),
(1921, '<i class=\"icofont-loop\"></i>', '<span> loop </span>'),
(1922, '<i class=\"icofont-luggage\"></i>', '<span> luggage </span>'),
(1923, '<i class=\"icofont-lunch\"></i>', '<span> lunch </span>'),
(1924, '<i class=\"icofont-lungs\"></i>', '<span> lungs </span>'),
(1925, '<i class=\"icofont-magic-alt\"></i>', '<span> magic-alt </span>'),
(1926, '<i class=\"icofont-magic\"></i>', '<span> magic </span>'),
(1927, '<i class=\"icofont-magnet\"></i>', '<span> magnet </span>'),
(1928, '<i class=\"icofont-mail-box\"></i>', '<span> mail-box </span>'),
(1929, '<i class=\"icofont-mail\"></i>', '<span> mail </span>'),
(1930, '<i class=\"icofont-male\"></i>', '<span> male </span>'),
(1931, '<i class=\"icofont-map-pins\"></i>', '<span> map-pins </span>'),
(1932, '<i class=\"icofont-map\"></i>', '<span> map </span>'),
(1933, '<i class=\"icofont-maximize\"></i>', '<span> maximize </span>'),
(1934, '<i class=\"icofont-measure\"></i>', '<span> measure </span>'),
(1935, '<i class=\"icofont-medicine\"></i>', '<span> medicine </span>'),
(1936, '<i class=\"icofont-mega-phone\"></i>', '<span> mega-phone </span>'),
(1937, '<i class=\"icofont-megaphone-alt\"></i>', '<span> megaphone-alt </span>'),
(1938, '<i class=\"icofont-megaphone\"></i>', '<span> megaphone </span>'),
(1939, '<i class=\"icofont-memorial\"></i>', '<span> memorial </span>'),
(1940, '<i class=\"icofont-memory-card\"></i>', '<span> memory-card </span>'),
(1941, '<i class=\"icofont-mic-mute\"></i>', '<span> mic-mute </span>'),
(1942, '<i class=\"icofont-mic\"></i>', '<span> mic </span>'),
(1943, '<i class=\"icofont-military\"></i>', '<span> military </span>'),
(1944, '<i class=\"icofont-mill\"></i>', '<span> mill </span>'),
(1945, '<i class=\"icofont-minus-circle\"></i>', '<span> minus-circle </span>'),
(1946, '<i class=\"icofont-minus-square\"></i>', '<span> minus-square </span>'),
(1947, '<i class=\"icofont-minus\"></i>', '<span> minus </span>'),
(1948, '<i class=\"icofont-mobile-phone\"></i>', '<span> mobile-phone </span>'),
(1949, '<i class=\"icofont-molecule\"></i>', '<span> molecule </span>'),
(1950, '<i class=\"icofont-money\"></i>', '<span> money </span>'),
(1951, '<i class=\"icofont-moon\"></i>', '<span> moon </span>'),
(1952, '<i class=\"icofont-mop\"></i>', '<span> mop </span>'),
(1953, '<i class=\"icofont-muffin\"></i>', '<span> muffin </span>'),
(1954, '<i class=\"icofont-mustache\"></i>', '<span> mustache </span>'),
(1955, '<i class=\"icofont-navigation-menu\"></i>', '<span> navigation-menu </span>'),
(1956, '<i class=\"icofont-navigation\"></i>', '<span> navigation </span>'),
(1957, '<i class=\"icofont-network-tower\"></i>', '<span> network-tower </span>'),
(1958, '<i class=\"icofont-network\"></i>', '<span> network </span>'),
(1959, '<i class=\"icofont-news\"></i>', '<span> news </span>'),
(1960, '<i class=\"icofont-newspaper\"></i>', '<span> newspaper </span>'),
(1961, '<i class=\"icofont-no-smoking\"></i>', '<span> no-smoking </span>'),
(1962, '<i class=\"icofont-not-allowed\"></i>', '<span> not-allowed </span>'),
(1963, '<i class=\"icofont-notebook\"></i>', '<span> notebook </span>'),
(1964, '<i class=\"icofont-notepad\"></i>', '<span> notepad </span>'),
(1965, '<i class=\"icofont-notification\"></i>', '<span> notification </span>'),
(1966, '<i class=\"icofont-numbered\"></i>', '<span> numbered </span>'),
(1967, '<i class=\"icofont-opposite\"></i>', '<span> opposite </span>'),
(1968, '<i class=\"icofont-optic\"></i>', '<span> optic </span>'),
(1969, '<i class=\"icofont-options\"></i>', '<span> options </span>'),
(1970, '<i class=\"icofont-package\"></i>', '<span> package </span>'),
(1971, '<i class=\"icofont-page\"></i>', '<span> page </span>'),
(1972, '<i class=\"icofont-paint\"></i>', '<span> paint </span>'),
(1973, '<i class=\"icofont-paper-plane\"></i>', '<span> paper-plane </span>'),
(1974, '<i class=\"icofont-paperclip\"></i>', '<span> paperclip </span>'),
(1975, '<i class=\"icofont-papers\"></i>', '<span> papers </span>'),
(1976, '<i class=\"icofont-pay\"></i>', '<span> pay </span>'),
(1977, '<i class=\"icofont-penguin-linux\"></i>', '<span> penguin-linux </span>'),
(1978, '<i class=\"icofont-pestle\"></i>', '<span> pestle </span>'),
(1979, '<i class=\"icofont-phone-circle\"></i>', '<span> phone-circle </span>'),
(1980, '<i class=\"icofont-phone\"></i>', '<span> phone </span>'),
(1981, '<i class=\"icofont-picture\"></i>', '<span> picture </span>'),
(1982, '<i class=\"icofont-pine\"></i>', '<span> pine </span>'),
(1983, '<i class=\"icofont-pixels\"></i>', '<span> pixels </span>'),
(1984, '<i class=\"icofont-plugin\"></i>', '<span> plugin </span>'),
(1985, '<i class=\"icofont-plus-circle\"></i>', '<span> plus-circle </span>'),
(1986, '<i class=\"icofont-plus-square\"></i>', '<span> plus-square </span>'),
(1987, '<i class=\"icofont-plus\"></i>', '<span> plus </span>'),
(1988, '<i class=\"icofont-polygonal\"></i>', '<span> polygonal </span>'),
(1989, '<i class=\"icofont-power\"></i>', '<span> power </span>'),
(1990, '<i class=\"icofont-price\"></i>', '<span> price </span>'),
(1991, '<i class=\"icofont-print\"></i>', '<span> print </span>'),
(1992, '<i class=\"icofont-puzzle\"></i>', '<span> puzzle </span>'),
(1993, '<i class=\"icofont-qr-code\"></i>', '<span> qr-code </span>'),
(1994, '<i class=\"icofont-queen\"></i>', '<span> queen </span>'),
(1995, '<i class=\"icofont-question-circle\"></i>', '<span> question-circle </span>'),
(1996, '<i class=\"icofont-question-square\"></i>', '<span> question-square </span>'),
(1997, '<i class=\"icofont-question\"></i>', '<span> question </span>'),
(1998, '<i class=\"icofont-quote-left\"></i>', '<span> quote-left </span>'),
(1999, '<i class=\"icofont-quote-right\"></i>', '<span> quote-right </span>'),
(2000, '<i class=\"icofont-random\"></i>', '<span> random </span>'),
(2001, '<i class=\"icofont-recycle\"></i>', '<span> recycle </span>'),
(2002, '<i class=\"icofont-refresh\"></i>', '<span> refresh </span>'),
(2003, '<i class=\"icofont-repair\"></i>', '<span> repair </span>'),
(2004, '<i class=\"icofont-reply-all\"></i>', '<span> reply-all </span>'),
(2005, '<i class=\"icofont-reply\"></i>', '<span> reply </span>'),
(2006, '<i class=\"icofont-resize\"></i>', '<span> resize </span>'),
(2007, '<i class=\"icofont-responsive\"></i>', '<span> responsive </span>'),
(2008, '<i class=\"icofont-retweet\"></i>', '<span> retweet </span>'),
(2009, '<i class=\"icofont-road\"></i>', '<span> road </span>'),
(2010, '<i class=\"icofont-robot\"></i>', '<span> robot </span>'),
(2011, '<i class=\"icofont-royal\"></i>', '<span> royal </span>'),
(2012, '<i class=\"icofont-rss-feed\"></i>', '<span> rss-feed </span>'),
(2013, '<i class=\"icofont-safety\"></i>', '<span> safety </span>'),
(2014, '<i class=\"icofont-sale-discount\"></i>', '<span> sale-discount </span>'),
(2015, '<i class=\"icofont-satellite\"></i>', '<span> satellite </span>'),
(2016, '<i class=\"icofont-send-mail\"></i>', '<span> send-mail </span>'),
(2017, '<i class=\"icofont-server\"></i>', '<span> server </span>'),
(2018, '<i class=\"icofont-settings-alt\"></i>', '<span> settings-alt </span>'),
(2019, '<i class=\"icofont-settings\"></i>', '<span> settings </span>'),
(2020, '<i class=\"icofont-share-alt\"></i>', '<span> share-alt </span>'),
(2021, '<i class=\"icofont-share-boxed\"></i>', '<span> share-boxed </span>'),
(2022, '<i class=\"icofont-share\"></i>', '<span> share </span>'),
(2023, '<i class=\"icofont-shield\"></i>', '<span> shield </span>'),
(2024, '<i class=\"icofont-shopping-cart\"></i>', '<span> shopping-cart </span>'),
(2025, '<i class=\"icofont-sign-in\"></i>', '<span> sign-in </span>'),
(2026, '<i class=\"icofont-sign-out\"></i>', '<span> sign-out </span>'),
(2027, '<i class=\"icofont-signal\"></i>', '<span> signal </span>'),
(2028, '<i class=\"icofont-site-map\"></i>', '<span> site-map </span>'),
(2029, '<i class=\"icofont-smart-phone\"></i>', '<span> smart-phone </span>'),
(2030, '<i class=\"icofont-soccer\"></i>', '<span> soccer </span>');
INSERT INTO `icon_set` (`id`, `icon`, `name`) VALUES
(2031, '<i class=\"icofont-sort-alt\"></i>', '<span> sort-alt </span>'),
(2032, '<i class=\"icofont-sort\"></i>', '<span> sort </span>'),
(2033, '<i class=\"icofont-space\"></i>', '<span> space </span>'),
(2034, '<i class=\"icofont-spanner\"></i>', '<span> spanner </span>'),
(2035, '<i class=\"icofont-speech-comments\"></i>', '<span> speech-comments </span>'),
(2036, '<i class=\"icofont-speed-meter\"></i>', '<span> speed-meter </span>'),
(2037, '<i class=\"icofont-spinner-alt-1\"></i>', '<span> spinner-alt-1 </span>'),
(2038, '<i class=\"icofont-spinner-alt-2\"></i>', '<span> spinner-alt-2 </span>'),
(2039, '<i class=\"icofont-spinner-alt-3\"></i>', '<span> spinner-alt-3 </span>'),
(2040, '<i class=\"icofont-spinner-alt-4\"></i>', '<span> spinner-alt-4 </span>'),
(2041, '<i class=\"icofont-spinner-alt-5\"></i>', '<span> spinner-alt-5 </span>'),
(2042, '<i class=\"icofont-spinner-alt-6\"></i>', '<span> spinner-alt-6 </span>'),
(2043, '<i class=\"icofont-spinner\"></i>', '<span> spinner </span>'),
(2044, '<i class=\"icofont-spreadsheet\"></i>', '<span> spreadsheet </span>'),
(2045, '<i class=\"icofont-square\"></i>', '<span> square </span>'),
(2046, '<i class=\"icofont-ssl-security\"></i>', '<span> ssl-security </span>'),
(2047, '<i class=\"icofont-star-alt-1\"></i>', '<span> star-alt-1 </span>'),
(2048, '<i class=\"icofont-star-alt-2\"></i>', '<span> star-alt-2 </span>'),
(2049, '<i class=\"icofont-star\"></i>', '<span> star </span>'),
(2050, '<i class=\"icofont-street-view\"></i>', '<span> street-view </span>'),
(2051, '<i class=\"icofont-support-faq\"></i>', '<span> support-faq </span>'),
(2052, '<i class=\"icofont-tack-pin\"></i>', '<span> tack-pin </span>'),
(2053, '<i class=\"icofont-tag\"></i>', '<span> tag </span>'),
(2054, '<i class=\"icofont-tags\"></i>', '<span> tags </span>'),
(2055, '<i class=\"icofont-tasks-alt\"></i>', '<span> tasks-alt </span>'),
(2056, '<i class=\"icofont-tasks\"></i>', '<span> tasks </span>'),
(2057, '<i class=\"icofont-telephone\"></i>', '<span> telephone </span>'),
(2058, '<i class=\"icofont-telescope\"></i>', '<span> telescope </span>'),
(2059, '<i class=\"icofont-terminal\"></i>', '<span> terminal </span>'),
(2060, '<i class=\"icofont-thumbs-down\"></i>', '<span> thumbs-down </span>'),
(2061, '<i class=\"icofont-thumbs-up\"></i>', '<span> thumbs-up </span>'),
(2062, '<i class=\"icofont-tick-boxed\"></i>', '<span> tick-boxed </span>'),
(2063, '<i class=\"icofont-tick-mark\"></i>', '<span> tick-mark </span>'),
(2064, '<i class=\"icofont-ticket\"></i>', '<span> ticket </span>'),
(2065, '<i class=\"icofont-tie\"></i>', '<span> tie </span>'),
(2066, '<i class=\"icofont-toggle-off\"></i>', '<span> toggle-off </span>'),
(2067, '<i class=\"icofont-toggle-on\"></i>', '<span> toggle-on </span>'),
(2068, '<i class=\"icofont-tools-alt-2\"></i>', '<span> tools-alt-2 </span>'),
(2069, '<i class=\"icofont-tools\"></i>', '<span> tools </span>'),
(2070, '<i class=\"icofont-touch\"></i>', '<span> touch </span>'),
(2071, '<i class=\"icofont-traffic-light\"></i>', '<span> traffic-light </span>'),
(2072, '<i class=\"icofont-transparent\"></i>', '<span> transparent </span>'),
(2073, '<i class=\"icofont-tree\"></i>', '<span> tree </span>'),
(2074, '<i class=\"icofont-unique-idea\"></i>', '<span> unique-idea </span>'),
(2075, '<i class=\"icofont-unlock\"></i>', '<span> unlock </span>'),
(2076, '<i class=\"icofont-unlocked\"></i>', '<span> unlocked </span>'),
(2077, '<i class=\"icofont-upload-alt\"></i>', '<span> upload-alt </span>'),
(2078, '<i class=\"icofont-upload\"></i>', '<span> upload </span>'),
(2079, '<i class=\"icofont-usb-drive\"></i>', '<span> usb-drive </span>'),
(2080, '<i class=\"icofont-usb\"></i>', '<span> usb </span>'),
(2081, '<i class=\"icofont-vector-path\"></i>', '<span> vector-path </span>'),
(2082, '<i class=\"icofont-verification-check\"></i>', '<span> verification-check </span>'),
(2083, '<i class=\"icofont-wall-clock\"></i>', '<span> wall-clock </span>'),
(2084, '<i class=\"icofont-wall\"></i>', '<span> wall </span>'),
(2085, '<i class=\"icofont-wallet\"></i>', '<span> wallet </span>'),
(2086, '<i class=\"icofont-warning-alt\"></i>', '<span> warning-alt </span>'),
(2087, '<i class=\"icofont-warning\"></i>', '<span> warning </span>'),
(2088, '<i class=\"icofont-water-drop\"></i>', '<span> water-drop </span>'),
(2089, '<i class=\"icofont-web\"></i>', '<span> web </span>'),
(2090, '<i class=\"icofont-wheelchair\"></i>', '<span> wheelchair </span>'),
(2091, '<i class=\"icofont-wifi-alt\"></i>', '<span> wifi-alt </span>'),
(2092, '<i class=\"icofont-wifi\"></i>', '<span> wifi </span>'),
(2093, '<i class=\"icofont-world\"></i>', '<span> world </span>'),
(2094, '<i class=\"icofont-zigzag\"></i>', '<span> zigzag </span>'),
(2095, '<i class=\"icofont-zipped\"></i>', '<span> zipped </span>');

-- --------------------------------------------------------

--
-- Table structure for table `info_key_code`
--

CREATE TABLE `info_key_code` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `expDate` datetime NOT NULL,
  `verify_key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `office` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_time` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `office`, `address`, `mobile`, `email`, `open_time`, `date`, `update_date`, `added_by`, `edited_by`, `type`, `img`, `status`) VALUES
(3, 'Baridhara VIP Area', 'hgfhgfh', '8768687', 'jhghfhg@jhgfhg.jhgh', 'hgfhgfhg', '17-12-2022 22:25:49', NULL, 'session_add', 'tanim001', 'head-office', '30b80fa55a7303fd81781a5266a2fd6a.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `details` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `type`, `date`, `activity_by`, `status`, `details`, `ip`, `user_agent`, `device`) VALUES
(1, 'Admin Login', '24-12-2022 01:37:23', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(2, 'Admin Login', '26-12-2022 00:12:50', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(3, 'Admin Login', '26-12-2022 15:31:26', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(4, 'Admin Login', '27-12-2022 14:11:40', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(5, 'Admin Login', '27-12-2022 19:18:44', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(6, 'Admin Login', '29-12-2022 01:37:04', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(7, 'Admin Login', '30-12-2022 21:12:38', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as general-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(8, 'Admin Login', '02-01-2023 21:35:53', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as super-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Desktop'),
(9, 'Admin Login', '10-01-2023 16:42:20', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as super-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.76', 'Desktop'),
(10, 'Admin Login', '16-01-2023 20:35:22', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as super-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.52', 'Desktop'),
(11, 'Admin Login', '29-07-2023 21:53:30', 'saklayen', 1, 'Saklayen Ahmed loggedin admin panel as super-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188', 'Desktop'),
(12, 'Admin Login', '29-07-2023 22:02:34', 'tanim001', 1, 'Ahmed Saklayen loggedin admin panel as super-user.', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36 Edg/115.0.1901.188', 'Desktop');

-- --------------------------------------------------------

--
-- Table structure for table `main_head`
--

CREATE TABLE `main_head` (
  `id` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_array` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_head`
--

INSERT INTO `main_head` (`id`, `title`, `description`, `img_array`, `url`, `date`, `update_date`, `added_by`, `edited_by`, `status`, `rank`) VALUES
(2, 'Home', '<p>Home Page</p>', NULL, 'index.php', '22-12-2022 20:48:29', NULL, 'session_add', 'tanim001', 1, 1),
(3, 'About', '<p>About Page</p>', NULL, '?p=aboutUs', '22-12-2022 20:48:55', NULL, 'tanim001', '', 1, 2),
(4, 'Services', '<p>Service Page</p>', NULL, '?p=ourServices', '22-12-2022 20:49:17', NULL, 'tanim001', '', 1, 3),
(5, 'Department', '<p>Department Page</p>', NULL, '?p=ourDepartment', '22-12-2022 20:49:40', NULL, 'tanim001', '', 1, 4),
(6, 'Doctors', '<p>Doctors Page</p>', NULL, '?p=enlistedDoctors', '22-12-2022 20:50:23', NULL, 'tanim001', '', 1, 5),
(7, 'Appointment', '<p>Appointment Page</p>', NULL, '?p=getAppointment', '22-12-2022 20:50:55', NULL, 'tanim001', '', 1, 6),
(8, 'Contact', '<p>Contact Page</p>', NULL, '?p=contactUs', '22-12-2022 20:51:21', NULL, 'tanim001', '', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generic` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `power` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `med_brand`
--

CREATE TABLE `med_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_date` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edited_by` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `portfolio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_area` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `description`, `img`, `added_by`, `edited_by`, `date`, `update_date`, `portfolio`, `business_area`, `status`) VALUES
(7, 'sdfgh', '<p>dfghj</p>', 'ed36c1d20ecd0e15c68d6358a7dde612.jpg', 'tanim001', '', '21-12-2022 00:53:11', '', '<p>dfghj</p>', '<p>ertyu</p>', 1),
(8, '', '', 'b0754dad64aeb12a1f3a017b7df55119.jpg', 'tanim001', '', '22-12-2022 22:42:53', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `p_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upazila` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_office` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `village` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consultant` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_test` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_downloaded` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_download` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `p_id`, `name`, `mobile`, `email`, `age`, `gender`, `address`, `upazila`, `district`, `post_office`, `village`, `department`, `consultant`, `added_by`, `edited_by`, `date`, `update_date`, `last_test`, `last_downloaded`, `total_download`, `status`) VALUES
(8, '421444049', 'Tanim Saklayen', '01623211729', 'myicche@gmail.com', '20', 'male', '<p>Chalia Gope, Chairman Bari</p>', 'Pakundia ', 'Kishoreganj', '1303', 'Chaliagope', 'Cardiology', 'Saklayen Ahmed', 'tanim001', 'tanim001', '19-12-2022 12:03:34', '', NULL, '29-07-2023 22:03:26', '57', 1),
(10, '216058370', 'Saklayen Ahmed', '01727268458', 'astanim.3221@gmail.com', '25', 'male', '<p>Kewa Pashchim Khanda</p>', 'Sreepur ', 'Gazipur', '1740', 'Kewa Pashchim Khanda', 'Diabetics', 'Tanim', 'tanim001', 'tanim001', '27-12-2022 14:28:27', '', NULL, '29-07-2023 22:02:46', '23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `discount` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_head` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition_apply` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `description`, `added_by`, `edited_by`, `date`, `status`, `discount`, `service`, `main_head`, `condition_apply`) VALUES
(1, 'Product 01', ' Product 01 Details ', 'session_add', 'tanim001', '19-12-2022 16:21:42', 1, 'ghhjgjh', 'Tite 01', 'Services', 'hjgj');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `com_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_address` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_slogan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_social_media` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `com_mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `com_summary` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `com_name`, `com_email`, `com_time`, `com_logo`, `com_description`, `com_address`, `com_slogan`, `com_social_media`, `added_by`, `date`, `edited_by`, `terms`, `policy`, `com_mobile`, `status`, `com_summary`) VALUES
(10, 'ORG name 01', 'mail@mail.com', 'Open Time', 'd6885594e3504dcded2ed7f2cc0f5257.jpg', '<p>Organization Description</p>', NULL, 'ORG Slogan', 'Organization Social Media', 'session_add', '18-12-2022 15:44:50', 'tanim001', '<p>Terms and Conditions</p>', '<p>Privacy Policy Tiny</p>', '01720000000', 0, NULL),
(11, 'সদর দক্ষিণ ডায়াবেটিক সমিতি, কুমিল্লা', 'email@mail.com', '10:00 AM to 5:00 PM', '66f4bdac3c7d47f5820c7f48aac9dadb.png', '<h3 style=\"text-align: justify;\">Your Mission</h3>\r\n<p style=\"text-align: justify;\"><br>You don&rsquo;t need to outright say, &ldquo;our mission is ____,&rdquo; but you should convey the mission of your business in your About Us copy. This is key for attracting talent, as well as leads that have Corporate Social Responsibility (CSR) goals.</p>\r\n<h3 style=\"text-align: justify;\"><img src=\"http://localhost:8080/lab/admin/inc/../images/tinyImg/api-2019-certificate_0-1.jpg\" alt=\"\" width=\"185\" height=\"120\"></h3>\r\n<h3 style=\"text-align: justify;\">Your Story (History)</h3>\r\n<p style=\"text-align: justify;\"><br>Every business has an origin story worth telling, and usually, one that justifies why you even do business and have clients.&nbsp;Some centennial enterprises have pages of content that can fit in this section, while startups can tell the story of how the company was born, its challenges, and its vision for the future.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h3 style=\"text-align: justify;\">Your Services (And Benefits)</h3>\r\n<p style=\"text-align: justify;\"><br>Of course, you have a homepage and dedicated pages for your products, but summarizing your offerings on the About Us page is crucial to tie them in with brand values in your messaging.&nbsp;Highlight the benefits and showcase what you do (and why it is unique).</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h3 style=\"text-align: justify;\">Your Social Proof</h3>\r\n<p style=\"text-align: justify;\"><br>Reviews, client logos, case studies, and results bring consistency to your About Us page. It&rsquo;s what really proves what you are saying is real and the impact you can bring to future clients.&nbsp;With these components in mind, you will have a framework from which to build an engaging and unique About Us page.</p>', 'Dhaka -1212, Mohakhali, gazipur', 'Best place to get fit', 'Social Media separated by comma', 'tanim001', '30-12-2022 23:15:29', 'tanim001', '<p><strong>Privacy Policy</strong></p>\r\n<p>This privacy policy has been compiled to better serve those who are concerned with how their &lsquo;Personally identifiable information is being used online. as used in privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.</p>\r\n<p><strong>What personal information do we collect from the people that visit our website or app?</strong></p>\r\n<p>When ordering or registering on our site, as appropriate, you will be asked to enter your Name, Email address, Mailing address, Phone number or other details to help you with your experience.</p>\r\n<p><strong>When do we collect information?</strong></p>\r\n<p>We collect information from you when you register on our site, place an order or enter information on our site.&nbsp;</p>\r\n<p>To personalize user&rsquo;s experience and to allow us to deliver the type of content and product offerings in which you are most interested</p>\r\n<ul>\r\n<li>To improve our website in order to better serve you.</li>\r\n<li>To allow us to better service you in responding to your customer service requests.</li>\r\n<li>To quickly process your transactions.</li>\r\n</ul>\r\n<p><strong>How do we protect visitor information?</strong></p>\r\n<p>Our website is scanned on a regular basis for security holes and known vulnerabilities in order to make your visit to our site as safe as possible.</p>\r\n<p>Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems, and are required to keep the information confidential. In addition, all sensitive/financial information you supply is encrypted via Secure Socket Layer (SSL) technology. We do not share your personal information with any other organization or party.</p>\r\n<p>We implement a variety of security measures when a user places an order. All transactions are processed through a gateway provider and are not stored or processed on our servers. We do not save or store your financial or credit card information.</p>\r\n<p><strong>Do we use &lsquo;cookies&rsquo;?</strong></p>\r\n<p>Yes. Cookies are small files that a site or its service provider transfers to your computer&rsquo;s hard drive through your Web browser (if you allow) that enables the site&rsquo;s or service provider&rsquo;s systems to recognize your browser and capture and remember certain information. For instance, we use cookies to help us remember the user\'s login status. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services.</p>\r\n<p>We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.</p>\r\n<p>We use cookies to:</p>\r\n<ul>\r\n<li>Understand and save user preferences for future visits.</li>\r\n<li>Compile aggregate data about site traffic and site interactions in order to offer better site experiences and tools in the future. We may also use trusted third party services that track this information on our behalf.</li>\r\n<li>Cookies also speed up page load times to make your experience on our website more efficient.</li>\r\n</ul>\r\n<p>You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser&rsquo;s Help menu to learn the correct way to modify your cookies.</p>\r\n<p>If you disable cookies, some features will be disabled It won&rsquo;t affect the user\'s experience which makes your site experience more efficient and some of our services will not function properly.</p>\r\n<p><strong>Third Party Disclosure</strong></p>\r\n<p>No, we do not sell, trade, or otherwise transfer to outside parties your personally identifiable information.</p>\r\n<p><strong>Third party links</strong></p>\r\n<p>We do not include or offer third-party products or services on our website.</p>\r\n<p><strong>User Information</strong></p>\r\n<p>Users are able to change their personal information:&nbsp;By logging in to their account</p>\r\n<p><strong>How does our site handle do not track signals?</strong></p>\r\n<p>We honor do not track signals and do not track plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism is in place.</p>\r\n<p><strong>Does our site allow third-party behavioural tracking?</strong></p>\r\n<p>It&rsquo;s also important to note that we do not allow third-party behavioural tracking.&nbsp;In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach occur:&nbsp;<strong>We will notify the users via email</strong></p>\r\n<p>We collect your email address in order to:</p>\r\n<ul>\r\n<li>Send information, and respond to inquiries, and/or other requests or questions.</li>\r\n<li>Process orders and to send information and updates pertaining to orders. We may also send you additional information related to your product and/or service.</li>\r\n</ul>\r\n<p><strong>Contact Us</strong></p>\r\n<p>If there are any questions regarding this privacy policy you may contact us using website chat option any time.</p>', '<h1 style=\"text-align: justify;\"><span style=\"color: rgb(45, 194, 107);\"><strong>Privacy Policy</strong></span></h1>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: justify;\">This privacy policy has been compiled to better serve those who are concerned with how their &lsquo;Personally identifiable information is being used online. as used in privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website.</p>\r\n<p style=\"text-align: justify;\"><strong>What personal information do we collect from the people that visit our website or app?</strong></p>\r\n<p style=\"text-align: justify;\">When ordering or registering on our site, as appropriate, you will be asked to enter your Name, Email address, Mailing address, Phone number or other details to help you with your experience.</p>\r\n<p style=\"text-align: justify;\"><strong>When do we collect information?</strong></p>\r\n<p style=\"text-align: justify;\">We collect information from you when you register on our site, place an order or enter information on our site.&nbsp;</p>\r\n<p style=\"text-align: justify;\">To personalize user&rsquo;s experience and to allow us to deliver the type of content and product offerings in which you are most interested</p>\r\n<ul style=\"text-align: justify;\">\r\n<li>To improve our website in order to better serve you.</li>\r\n<li>To allow us to better service you in responding to your customer service requests.</li>\r\n<li>To quickly process your transactions.</li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><strong>How do we protect visitor information?</strong></p>\r\n<p style=\"text-align: justify;\">Our website is scanned on a regular basis for security holes and known vulnerabilities in order to make your visit to our site as safe as possible.</p>\r\n<p style=\"text-align: justify;\">Your personal information is contained behind secured networks and is only accessible by a limited number of persons who have special access rights to such systems, and are required to keep the information confidential. In addition, all sensitive/financial information you supply is encrypted via Secure Socket Layer (SSL) technology. We do not share your personal information with any other organization or party.</p>\r\n<p style=\"text-align: justify;\">We implement a variety of security measures when a user places an order. All transactions are processed through a gateway provider and are not stored or processed on our servers. We do not save or store your financial or credit card information.</p>\r\n<p style=\"text-align: justify;\"><strong>Do we use &lsquo;cookies&rsquo;?</strong></p>\r\n<p style=\"text-align: justify;\">Yes. Cookies are small files that a site or its service provider transfers to your computer&rsquo;s hard drive through your Web browser (if you allow) that enables the site&rsquo;s or service provider&rsquo;s systems to recognize your browser and capture and remember certain information. For instance, we use cookies to help us remember the user\'s login status. They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services.</p>\r\n<p style=\"text-align: justify;\">We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site experiences and tools in the future.</p>\r\n<p style=\"text-align: justify;\">We use cookies to:</p>\r\n<ul style=\"text-align: justify;\">\r\n<li>Understand and save user preferences for future visits.</li>\r\n<li>Compile aggregate data about site traffic and site interactions in order to offer better site experiences and tools in the future. We may also use trusted third party services that track this information on our behalf.</li>\r\n<li>Cookies also speed up page load times to make your experience on our website more efficient.</li>\r\n</ul>\r\n<p style=\"text-align: justify;\">You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser&rsquo;s Help menu to learn the correct way to modify your cookies.</p>\r\n<p style=\"text-align: justify;\">If you disable cookies, some features will be disabled It won&rsquo;t affect the user\'s experience which makes your site experience more efficient and some of our services will not function properly.</p>\r\n<p style=\"text-align: justify;\"><strong>Third Party Disclosure</strong></p>\r\n<p style=\"text-align: justify;\">No, we do not sell, trade, or otherwise transfer to outside parties your personally identifiable information.</p>\r\n<p style=\"text-align: justify;\"><strong>Third party links</strong></p>\r\n<p style=\"text-align: justify;\">We do not include or offer third-party products or services on our website.</p>\r\n<p style=\"text-align: justify;\"><strong>User Information</strong></p>\r\n<p style=\"text-align: justify;\">Users are able to change their personal information:&nbsp;By logging in to their account</p>\r\n<p style=\"text-align: justify;\"><strong>How does our site handle do not track signals?</strong></p>\r\n<p style=\"text-align: justify;\">We honor do not track signals and do not track plant cookies, or use advertising when a Do Not Track (DNT) browser mechanism is in place.</p>\r\n<p style=\"text-align: justify;\"><strong>Does our site allow third-party behavioural tracking?</strong></p>\r\n<p style=\"text-align: justify;\">It&rsquo;s also important to note that we do not allow third-party behavioural tracking.&nbsp;In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach occur:&nbsp;<strong>We will notify the users via email</strong></p>\r\n<p style=\"text-align: justify;\">We collect your email address in order to:</p>\r\n<ul style=\"text-align: justify;\">\r\n<li>Send information, and respond to inquiries, and/or other requests or questions.</li>\r\n<li>Process orders and to send information and updates pertaining to orders. We may also send you additional information related to your product and/or service.</li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><strong>Contact Us</strong></p>\r\n<p style=\"text-align: justify;\">If there are any questions regarding this privacy policy you may contact us using website chat option any time.</p>\r\n<p>&nbsp;</p>', '88000000000000', 1, '<p>Organization Summary</p>');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`id`, `title`, `description`, `discount`, `offer`, `added_by`, `edited_by`, `expire`, `date`, `category`, `status`) VALUES
(2, 'Get 5% Discount', 'Get 5% Discount', '5%', 'yutuytuy', 'session_add', 'tanim001', '2022-12-16', '18-12-2022 10:58:27', 'Tite', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `p_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `results` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_hospital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloaded_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_downloaded` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_download` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `p_id`, `r_id`, `invoice`, `status`, `type`, `results`, `date`, `department`, `ref_by`, `ref_hospital`, `added_by`, `edited_by`, `downloaded_by`, `last_downloaded`, `total_download`, `verify`) VALUES
(13, '216058370', '27122022210476345', '67567456', '1', 'CT Scan', '<ul class=\"bulleted\" data-mmanualobjecttype=\"List\">\r\n<li class=\"topic__listitem\">\r\n<div class=\"para\">\r\n<p>Nose: To examine the voice box (laryngoscopy) or the lungs (bronchoscopy)</p>\r\n</div>\r\n</li>\r\n<li class=\"topic__listitem\"><span id=\"v849563\" class=\"anchor\"></span>\r\n<div class=\"para\">\r\n<p>Mouth: To examine the esophagus (esophagoscopy), stomach (gastroscopy), and small intestine (upper gastrointestinal endoscopy)</p>\r\n</div>\r\n</li>\r\n<li class=\"topic__listitem\"><span id=\"v849565\" class=\"anchor\"></span>\r\n<div class=\"para\">\r\n<p>Anus: To examine the large intestine, rectum, and anus (coloscopy)</p>\r\n</div>\r\n</li>\r\n<li class=\"topic__listitem\"><span id=\"v849567\" class=\"anchor\"></span>\r\n<div class=\"para\">\r\n<p>Urethra: To examine the bladder (cystoscopy)</p>\r\n</div>\r\n</li>\r\n<li class=\"topic__listitem\"><span id=\"v849569\" class=\"anchor\"></span>\r\n<div class=\"para\">\r\n<p>Vagina: To examine the uterus (hysteroscopy)</p>\r\n</div>\r\n</li>\r\n</ul>', '26-12-2022 00:19:13', 'Cardiology', 'Saklayen Ahmed, jhgjhgjh7678', 'Labaid Specialized Hospital', 'tanim001', 'tanim001', '216058370', '29-07-2023 22:02:46', '25', '50b6d6d0fa75679671831407di7ewgkj643who6'),
(14, '421444049', NULL, '1234890', '1', 'Blood Test', '<p><strong>Positive and negative tests are typically used for diagnostic purposes to ascertain whether a disease or condition is present (positive) or not (negative). In layperson\'s terms:</strong></p>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Positive means that whatever the test was looking for was found</li>\r\n<li>Negative means that whatever the test was looking for was not found.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Other tests have low specificity. What this means is that they may be able to detect certain organisms, but are less able to tell one strain of the organism from another.</p>', '27-12-2022 19:52:18', 'Diabetics', 'Tanim, ', '', 'tanim001', 'tanim001', '421444049', '29-07-2023 22:03:26', '32', '50b6d6d0fa7567967183140748b3ca3e'),
(15, '421444049', '10012023164583', '123456', '1', 'Blood Test', '<p>kisu hoy nai</p>', '10-01-2023 16:45:35', 'Cardiology', 'Saklayen Ahmed', 'Nai', 'tanim001', '', '421444049', '16-01-2023 20:37:53', '4', '9f784ea2f8665b45e7f71195d7fba5cf');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `title`, `description`, `added_by`, `edited_by`, `date`, `img`, `status`, `icon`) VALUES
(1, 'Blood Test', '<p>Its Blood Test</p>', 'session_add', 'tanim001', '27-12-2022 19:53:00', 'a253c9334f82baafa9cda9efa2c1da85.jpg', 1, '<i class=\"icofont-blood-test\"></i>'),
(2, 'CT Scan', '<p>CT Scan</p>', 'session_add', 'tanim001', '27-12-2022 19:54:12', 'a253c9334f82baafa9cda9efa2c1da85.jpg', 1, '<i class=\"icofont-brain\"></i>'),
(3, 'X-Ray', '<p>X-Ray</p>', 'tanim001', 'tanim001', '27-12-2022 19:54:34', '8b3497dfcfe2e3482537029452b66efa.jpg', 1, '<i class=\"icofont-xray\"></i>');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_btn` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `added_by`, `edited_by`, `date`, `img`, `title`, `description`, `status`, `tag`, `slider_btn`, `slider_url`) VALUES
(4, 'session_add', 'tanim001', '22-12-2022 21:00:54', '096708f4d7b1cfd8b92a8addf9fc26d2.jpg', 'Your Most Trusted Health Partner', '<p>A repudiandae ipsam labore ipsa voluptatum quidem quae laudantium quisquam aperiam maiores sunt fugit, deserunt rem suscipit placeat. A repudiandae ipsam labore ipsa voluptatum quidem quae laudantium quisquam aperiam maiores sunt fugit, deserunt rem suscipit placeat.</p>', 1, '', 'Services', '?p=ourServices'),
(5, 'session_add', 'tanim001', '23-12-2022 02:35:54', '38e4de33b0f9e368252665fa845f78ae.jpg', 'Your Most Trusted Health Partner', '<p>A repudiandae ipsam labore ipsa voluptatum quidem quae laudantium quisquam aperiam maiores sunt fugit, deserunt rem suscipit placeat. A repudiandae ipsam labore ipsa voluptatum quidem quae laudantium quisquam aperiam maiores sunt fugit, deserunt rem suscipit placeat.</p>', 1, '', 'Doctors', '?p=enlistedDoctors');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `mobile`, `status`, `added_by`, `edited_by`, `date`) VALUES
(1, 'astanim.3221@gmail.com', '0172768458', 1, 'session_add', 'tanim001', '17-12-2022 23:50:32'),
(4, 'astanim.3221@gmail.com', NULL, NULL, 'tanim001', '', '20-12-2022 23:50:05'),
(5, 'saklye@gmaiulcom.com', '1235265', 1, 'tanim001', '', '20-12-2022 23:52:41'),
(6, 'myicche@gmail.com', NULL, 1, 'self', '', '20-12-2022 23:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `sub_head`
--

CREATE TABLE `sub_head` (
  `id` int(11) NOT NULL,
  `main_head_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sys_mail_setup`
--

CREATE TABLE `sys_mail_setup` (
  `id` int(11) NOT NULL,
  `email` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `host` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sys_mail_setup`
--

INSERT INTO `sys_mail_setup` (`id`, `email`, `password`, `host`, `smtp`, `port`, `status`, `added_by`, `edited_by`, `date`, `update_date`) VALUES
(17, 'myicche@gmail.com', 'vltwzqjiwczsiuaq', 'tls://smtp.gmail.com', ' TLS', 587, 1, NULL, 'tanim001', '23-12-2022 05:14:56', '23-12-2022 05:14:56'),
(18, 'myicche@gmail.com', 'vltwzqjiwczsiuaq', 'tls://smtp.gmail.com', ' TLS', 587, 0, NULL, NULL, NULL, NULL),
(19, 'myicche@gmail.com', 'vltwzqjiwczsiuaq', 'tls://smtp.gmail.com', ' TLS', 587, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `img`, `title`, `description`, `date`, `update_date`, `qualification`, `institution`, `added_by`, `edited_by`, `status`) VALUES
(3, 'Mita Sarker', '956b63e0aa13f133fe2ddb49286576a0.jpg', 'Its a great Org', '<p>I recpmmand yourseflt to admit ad get servoice fro this org. I recpmmand yourseflt to admit ad get servoice fro this org.</p>', '22-12-2022 22:39:33', '', 'MBBS, DMC', 'Dhaka Medical Collage', 'tanim001', '', 1),
(4, 'sdfgh', '956b63e0aa13f133fe2ddb49286576a0.jpg', 'Its a great Org', '<p>I recpmmand yourseflt to admit ad get servoice fro this org.</p>', '22-12-2022 22:39:33', '', 'MBBS, DMC', 'Dhaka Medical Collage', 'tanim001', '', 1),
(5, 'sdfgh', '956b63e0aa13f133fe2ddb49286576a0.jpg', 'Its a great Org', '<p>I recpmmand yourseflt to admit ad get servoice fro this org.</p>', '22-12-2022 22:39:33', '', 'MBBS, DMC', 'Dhaka Medical Collage', 'tanim001', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `upazila`
--

CREATE TABLE `upazila` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `district_name` varchar(300) NOT NULL,
  `name` varchar(200) NOT NULL,
  `date_added` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upazila`
--

INSERT INTO `upazila` (`id`, `district_id`, `district_name`, `name`, `date_added`) VALUES
(2, 1, 'Bagerhat', 'Chitalmari ', '2020-08-21 16:47:11'),
(3, 1, 'Bagerhat', 'Fakirhat ', '2020-08-20 02:10:18'),
(4, 1, 'Bagerhat', 'Kachua ', '2020-08-20 02:10:18'),
(5, 1, 'Bagerhat', 'Mollahat ', '2020-08-20 02:10:18'),
(6, 1, 'Bagerhat', 'Mongla ', '2020-08-20 02:10:18'),
(7, 1, 'Bagerhat', 'Morrelganj ', '2020-08-20 02:10:18'),
(8, 1, 'Bagerhat', 'Rampal ', '2020-08-20 02:10:18'),
(9, 1, 'Bagerhat', 'Sarankhola ', '2020-08-20 02:10:18'),
(10, 2, 'Bandarban ', 'Ali Kadam ', '3/8/2020'),
(11, 2, 'Bandarban ', 'Bandarban Sadar ', '3/8/2020'),
(12, 2, 'Bandarban ', 'Lama ', '3/8/2020'),
(13, 2, 'Bandarban ', 'Naikhongchhari ', '3/8/2020'),
(14, 2, 'Bandarban ', 'Rowangchhari ', '3/8/2020'),
(15, 2, 'Bandarban ', 'Ruma ', '3/8/2020'),
(16, 2, 'Bandarban ', 'Thanchi ', '3/8/2020'),
(17, 3, 'Barguna ', 'Amtali ', '3/8/2020'),
(18, 3, 'Barguna ', 'Bamna ', '3/8/2020'),
(19, 3, 'Barguna ', 'Barguna Sadar ', '3/8/2020'),
(20, 3, 'Barguna ', 'Betagi ', '3/8/2020'),
(21, 3, 'Barguna ', 'Patharghata ', '3/8/2020'),
(22, 3, 'Barguna ', 'Taltoli ', '3/8/2020'),
(23, 4, 'Barishal', 'Agailjhara ', '3/8/2020'),
(24, 4, 'Barishal', 'Babuganj ', '3/8/2020'),
(25, 4, 'Barishal', 'Bakerganj ', '3/8/2020'),
(26, 4, 'Barishal', 'Banaripara ', '3/8/2020'),
(27, 4, 'Barishal', 'Gaurnadi ', '3/8/2020'),
(28, 4, 'Barishal', 'Hizla ', '3/8/2020'),
(29, 4, 'Barishal', 'Barisal Sadar ', '3/8/2020'),
(30, 4, 'Barishal', 'Mehendiganj ', '3/8/2020'),
(31, 4, 'Barishal', 'Muladi ', '3/8/2020'),
(32, 4, 'Barishal', 'Wazirpur ', '3/8/2020'),
(33, 5, 'Bhola ', 'Bhola Sadar ', '3/8/2020'),
(34, 5, 'Bhola ', 'Burhanuddin ', '3/8/2020'),
(35, 5, 'Bhola ', 'Char Fasson ', '3/8/2020'),
(36, 5, 'Bhola ', 'Daulatkhan ', '3/8/2020'),
(37, 5, 'Bhola ', 'Lalmohan ', '3/8/2020'),
(38, 5, 'Bhola ', 'Manpura ', '3/8/2020'),
(39, 5, 'Bhola ', 'Tazumuddin ', '3/8/2020'),
(40, 6, 'Bogra ', 'Adamdighi ', '3/8/2020'),
(41, 6, 'Bogra ', 'Bogra Sadar ', '3/8/2020'),
(42, 6, 'Bogra ', 'Dhunat ', '3/8/2020'),
(43, 6, 'Bogra ', 'Dhupchanchia ', '3/8/2020'),
(44, 6, 'Bogra ', 'Gabtali ', '3/8/2020'),
(45, 6, 'Bogra ', 'Kahaloo ', '3/8/2020'),
(46, 6, 'Bogra ', 'Nandigram ', '3/8/2020'),
(47, 6, 'Bogra ', 'Sariakandi ', '3/8/2020'),
(48, 6, 'Bogra ', 'Shajahanpur ', '3/8/2020'),
(49, 6, 'Bogra ', 'Sherpur ', '3/8/2020'),
(50, 6, 'Bogra ', 'Shibganj ', '3/8/2020'),
(51, 6, 'Bogra ', 'Sonatola ', '3/8/2020'),
(52, 7, 'Brahmanbaria ', 'Akhaura ', '3/8/2020'),
(53, 7, 'Brahmanbaria ', 'Bancharampur ', '3/8/2020'),
(54, 7, 'Brahmanbaria ', 'Brahmanbaria Sadar ', '3/8/2020'),
(55, 7, 'Brahmanbaria ', 'Kasba ', '3/8/2020'),
(56, 7, 'Brahmanbaria ', 'Nabinagar ', '3/8/2020'),
(57, 7, 'Brahmanbaria ', 'Nasirnagar ', '3/8/2020'),
(58, 7, 'Brahmanbaria ', 'Sarail ', '3/8/2020'),
(59, 7, 'Brahmanbaria ', 'Ashuganj ', '3/8/2020'),
(60, 7, 'Brahmanbaria ', 'Bijoynagar ', '3/8/2020'),
(61, 8, 'Chandpur ', 'Chandpur Sadar ', '3/8/2020'),
(62, 8, 'Chandpur ', 'Faridganj ', '3/8/2020'),
(63, 8, 'Chandpur ', 'Haimchar ', '3/8/2020'),
(64, 8, 'Chandpur ', 'Haziganj ', '3/8/2020'),
(65, 8, 'Chandpur ', 'Kachua ', '3/8/2020'),
(66, 8, 'Chandpur ', 'Matlab Dakshin ', '3/8/2020'),
(67, 8, 'Chandpur ', 'Matlab Uttar ', '3/8/2020'),
(68, 8, 'Chandpur ', 'Shahrasti ', '3/8/2020'),
(69, 9, 'Chittagong ', 'Anwara ', '3/8/2020'),
(70, 9, 'Chittagong ', 'Banshkhali ', '3/8/2020'),
(71, 9, 'Chittagong ', 'Boalkhali ', '3/8/2020'),
(72, 9, 'Chittagong ', 'Chandanaish ', '3/8/2020'),
(73, 9, 'Chittagong ', 'Fatikchhari ', '3/8/2020'),
(74, 9, 'Chittagong ', 'Hathazari ', '3/8/2020'),
(75, 9, 'Chittagong ', 'Lohagara ', '3/8/2020'),
(76, 9, 'Chittagong ', 'Mirsharai ', '3/8/2020'),
(77, 9, 'Chittagong ', 'Patiya ', '3/8/2020'),
(78, 9, 'Chittagong ', 'Rangunia ', '3/8/2020'),
(79, 9, 'Chittagong ', 'Raozan ', '3/8/2020'),
(80, 9, 'Chittagong ', 'Sandwip ', '3/8/2020'),
(81, 9, 'Chittagong ', 'Satkania ', '3/8/2020'),
(82, 9, 'Chittagong ', 'Sitakunda ', '3/8/2020'),
(83, 9, 'Chittagong ', 'Bandor (Chittagong Port) Thana', '3/8/2020'),
(84, 9, 'Chittagong ', 'Chandgaon Thana', '3/8/2020'),
(85, 9, 'Chittagong ', 'Double Mooring Thana', '3/8/2020'),
(86, 9, 'Chittagong ', 'Kotwali Thana', '3/8/2020'),
(87, 9, 'Chittagong ', 'Pahartali Thana', '3/8/2020'),
(88, 9, 'Chittagong ', 'Panchlaish Thana', '3/8/2020'),
(89, 10, 'Chuadanga ', 'Alamdanga ', '3/8/2020'),
(90, 10, 'Chuadanga ', 'Chuadanga Sadar ', '3/8/2020'),
(91, 10, 'Chuadanga ', 'Damurhuda ', '3/8/2020'),
(92, 10, 'Chuadanga ', 'Jibannagar ', '3/8/2020'),
(93, 11, 'Comilla ', 'Barura ', '3/8/2020'),
(94, 11, 'Comilla ', 'Brahmanpara ', '3/8/2020'),
(95, 11, 'Comilla ', 'Burichang ', '3/8/2020'),
(96, 11, 'Comilla ', 'Chandina ', '3/8/2020'),
(97, 11, 'Comilla ', 'Chauddagram ', '3/8/2020'),
(98, 11, 'Comilla ', 'Daudkandi ', '3/8/2020'),
(99, 11, 'Comilla ', 'Debidwar ', '3/8/2020'),
(100, 11, 'Comilla ', 'Homna ', '3/8/2020'),
(101, 11, 'Comilla ', 'Laksam ', '3/8/2020'),
(102, 11, 'Comilla ', 'Muradnagar ', '3/8/2020'),
(103, 11, 'Comilla ', 'Nangalkot ', '3/8/2020'),
(104, 11, 'Comilla ', 'Comilla Adarsha Sadar ', '3/8/2020'),
(105, 11, 'Comilla ', 'Meghna ', '3/8/2020'),
(106, 11, 'Comilla ', 'Titas ', '3/8/2020'),
(107, 11, 'Comilla ', 'Monohargonj ', '3/8/2020'),
(108, 11, 'Comilla ', 'Comilla Sadar Dakshin ', '3/8/2020'),
(109, 12, 'Cox`s Bazar', 'Chakaria ', '3/8/2020'),
(110, 12, 'Cox`s Bazar', 'Cox\'s Bazar Sadar ', '3/8/2020'),
(111, 12, 'Cox`s Bazar', 'Kutubdia ', '3/8/2020'),
(112, 12, 'Cox`s Bazar', 'Maheshkhali ', '3/8/2020'),
(113, 12, 'Cox`s Bazar', 'Ramu ', '3/8/2020'),
(114, 12, 'Cox`s Bazar', 'Teknaf ', '3/8/2020'),
(115, 12, 'Cox`s Bazar', 'Ukhia ', '3/8/2020'),
(116, 12, 'Cox`s Bazar', 'Pekua ', '3/8/2020'),
(122, 14, 'Dinajpur ', 'Birampur ', '3/8/2020'),
(123, 14, 'Dinajpur ', 'Birganj ', '3/8/2020'),
(124, 14, 'Dinajpur ', 'Biral ', '3/8/2020'),
(125, 14, 'Dinajpur ', 'Bochaganj ', '3/8/2020'),
(126, 14, 'Dinajpur ', 'Chirirbandar ', '3/8/2020'),
(127, 14, 'Dinajpur ', 'Phulbari ', '3/8/2020'),
(128, 14, 'Dinajpur ', 'Ghoraghat ', '3/8/2020'),
(129, 14, 'Dinajpur ', 'Hakimpur ', '3/8/2020'),
(130, 14, 'Dinajpur ', 'Kaharole ', '3/8/2020'),
(131, 14, 'Dinajpur ', 'Khansama ', '3/8/2020'),
(132, 14, 'Dinajpur ', 'Dinajpur Sadar ', '3/8/2020'),
(133, 14, 'Dinajpur ', 'Nawabganj ', '3/8/2020'),
(134, 14, 'Dinajpur ', 'Parbatipur ', '3/8/2020'),
(135, 15, 'Faridpur ', 'Alfadanga ', '3/8/2020'),
(136, 15, 'Faridpur ', 'Bhanga ', '3/8/2020'),
(137, 15, 'Faridpur ', 'Boalmari ', '3/8/2020'),
(138, 15, 'Faridpur ', 'Charbhadrasan ', '3/8/2020'),
(139, 15, 'Faridpur ', 'Faridpur Sadar ', '3/8/2020'),
(140, 15, 'Faridpur ', 'Madhukhali ', '3/8/2020'),
(141, 15, 'Faridpur ', 'Nagarkanda ', '3/8/2020'),
(142, 15, 'Faridpur ', 'Sadarpur ', '3/8/2020'),
(143, 15, 'Faridpur ', 'Saltha ', '3/8/2020'),
(144, 16, 'Feni ', 'Chhagalnaiya ', '3/8/2020'),
(145, 16, 'Feni ', 'Daganbhuiyan ', '3/8/2020'),
(146, 16, 'Feni ', 'Feni Sadar ', '3/8/2020'),
(147, 16, 'Feni ', 'Parshuram ', '3/8/2020'),
(148, 16, 'Feni ', 'Sonagazi ', '3/8/2020'),
(149, 16, 'Feni ', 'Fulgazi ', '3/8/2020'),
(150, 17, 'Gaibandha ', 'Phulchhari ', '3/8/2020'),
(151, 17, 'Gaibandha ', 'Gaibandha Sadar ', '3/8/2020'),
(152, 17, 'Gaibandha ', 'Gobindaganj ', '3/8/2020'),
(153, 17, 'Gaibandha ', 'Palashbari ', '3/8/2020'),
(154, 17, 'Gaibandha ', 'Sadullapur ', '3/8/2020'),
(155, 17, 'Gaibandha ', 'Sughatta ', '3/8/2020'),
(156, 17, 'Gaibandha ', 'Sundarganj ', '3/8/2020'),
(157, 18, 'Gazipur', 'Gazipur Sadar ', '2020-08-20 02:15:23'),
(158, 18, 'Gazipur', 'Kaliakair ', '2020-08-20 02:15:23'),
(159, 18, 'Gazipur', 'Kaliganj ', '2020-08-20 02:15:23'),
(160, 18, 'Gazipur', 'Kapasia ', '2020-08-20 02:15:23'),
(161, 18, 'Gazipur', 'Sreepur ', '2020-08-20 02:15:23'),
(162, 19, 'Gopalganj ', 'Gopalganj Sadar ', '3/8/2020'),
(163, 19, 'Gopalganj ', 'Kashiani ', '3/8/2020'),
(164, 19, 'Gopalganj ', 'Kotalipara ', '3/8/2020'),
(165, 19, 'Gopalganj ', 'Muksudpur ', '3/8/2020'),
(166, 19, 'Gopalganj ', 'Tungipara ', '3/8/2020'),
(167, 20, 'Habiganj ', 'Ajmiriganj ', '3/8/2020'),
(168, 20, 'Habiganj ', 'Bahubal ', '3/8/2020'),
(169, 20, 'Habiganj ', 'Baniyachong ', '3/8/2020'),
(170, 20, 'Habiganj ', 'Chunarughat ', '3/8/2020'),
(171, 20, 'Habiganj ', 'Habiganj Sadar ', '3/8/2020'),
(172, 20, 'Habiganj ', 'Lakhai ', '3/8/2020'),
(173, 20, 'Habiganj ', 'Madhabpur ', '3/8/2020'),
(174, 20, 'Habiganj ', 'Nabiganj ', '3/8/2020'),
(175, 21, 'Jamalpur ', 'Baksiganj ', '3/8/2020'),
(176, 21, 'Jamalpur ', 'Dewanganj ', '3/8/2020'),
(177, 21, 'Jamalpur ', 'Islampur ', '3/8/2020'),
(178, 21, 'Jamalpur ', 'Jamalpur Sadar ', '3/8/2020'),
(179, 21, 'Jamalpur ', 'Madarganj ', '3/8/2020'),
(180, 21, 'Jamalpur ', 'Melandaha ', '3/8/2020'),
(181, 21, 'Jamalpur ', 'Sarishabari ', '3/8/2020'),
(182, 22, 'Jessore ', 'Abhaynagar ', '3/8/2020'),
(183, 22, 'Jessore ', 'Bagherpara ', '3/8/2020'),
(184, 22, 'Jessore ', 'Chaugachha ', '3/8/2020'),
(185, 22, 'Jessore ', 'Jhikargachha ', '3/8/2020'),
(186, 22, 'Jessore ', 'Keshabpur ', '3/8/2020'),
(187, 22, 'Jessore ', 'Jessore Sadar ', '3/8/2020'),
(188, 22, 'Jessore ', 'Manirampur ', '3/8/2020'),
(189, 22, 'Jessore ', 'Sharsha ', '3/8/2020'),
(190, 23, 'Jhalokati ', 'Jhalokati Sadar ', '3/8/2020'),
(191, 23, 'Jhalokati ', 'Kathalia ', '3/8/2020'),
(192, 23, 'Jhalokati ', 'Nalchity ', '3/8/2020'),
(193, 23, 'Jhalokati ', 'Rajapur ', '3/8/2020'),
(194, 24, 'Jhenaidah ', 'Harinakunda ', '3/8/2020'),
(195, 24, 'Jhenaidah ', 'Jhenaidah Sadar ', '3/8/2020'),
(196, 24, 'Jhenaidah ', 'Kaliganj ', '3/8/2020'),
(197, 24, 'Jhenaidah ', 'Kotchandpur ', '3/8/2020'),
(198, 24, 'Jhenaidah ', 'Maheshpur ', '3/8/2020'),
(199, 24, 'Jhenaidah ', 'Shailkupa ', '3/8/2020'),
(200, 25, 'Joypurhat ', 'Akkelpur ', '3/8/2020'),
(201, 25, 'Joypurhat ', 'Joypurhat Sadar ', '3/8/2020'),
(202, 25, 'Joypurhat ', 'Kalai ', '3/8/2020'),
(203, 25, 'Joypurhat ', 'Khetlal ', '3/8/2020'),
(204, 25, 'Joypurhat ', 'Panchbibi ', '3/8/2020'),
(205, 26, 'Khagrachhari ', 'Dighinala ', '3/8/2020'),
(206, 26, 'Khagrachhari ', 'Khagrachhari ', '3/8/2020'),
(207, 26, 'Khagrachhari ', 'Lakshmichhari ', '3/8/2020'),
(208, 26, 'Khagrachhari ', 'Mahalchhari ', '3/8/2020'),
(209, 26, 'Khagrachhari ', 'Manikchhari ', '3/8/2020'),
(210, 26, 'Khagrachhari ', 'Matiranga ', '3/8/2020'),
(211, 26, 'Khagrachhari ', 'Panchhari ', '3/8/2020'),
(212, 26, 'Khagrachhari ', 'Ramgarh ', '3/8/2020'),
(213, 27, 'Khulna ', 'Batiaghata ', '3/8/2020'),
(214, 27, 'Khulna ', 'Dacope ', '3/8/2020'),
(215, 27, 'Khulna ', 'Dumuria ', '3/8/2020'),
(216, 27, 'Khulna ', 'Dighalia ', '3/8/2020'),
(217, 27, 'Khulna ', 'Koyra ', '3/8/2020'),
(218, 27, 'Khulna ', 'Paikgachha ', '3/8/2020'),
(219, 27, 'Khulna ', 'Phultala ', '3/8/2020'),
(220, 27, 'Khulna ', 'Rupsha ', '3/8/2020'),
(221, 27, 'Khulna ', 'Terokhada ', '3/8/2020'),
(222, 27, 'Khulna ', 'Daulatpur Thana', '3/8/2020'),
(223, 27, 'Khulna ', 'Khalishpur Thana', '3/8/2020'),
(224, 27, 'Khulna ', 'Khan Jahan Ali Thana', '3/8/2020'),
(225, 27, 'Khulna ', 'Kotwali Thana', '3/8/2020'),
(226, 27, 'Khulna ', 'Sonadanga Thana', '3/8/2020'),
(227, 27, 'Khulna ', 'Harintana Thana', '3/8/2020'),
(228, 28, 'Kishoreganj ', 'Astagram ', '3/8/2020'),
(229, 28, 'Kishoreganj ', 'Bajitpur ', '3/8/2020'),
(230, 28, 'Kishoreganj ', 'Bhairab ', '3/8/2020'),
(231, 28, 'Kishoreganj ', 'Hossainpur ', '3/8/2020'),
(232, 28, 'Kishoreganj ', 'Itna ', '3/8/2020'),
(233, 28, 'Kishoreganj ', 'Karimganj ', '3/8/2020'),
(234, 28, 'Kishoreganj ', 'Katiadi ', '3/8/2020'),
(235, 28, 'Kishoreganj ', 'Kishoreganj Sadar ', '3/8/2020'),
(236, 28, 'Kishoreganj ', 'Kuliarchar ', '3/8/2020'),
(237, 28, 'Kishoreganj ', 'Mithamain ', '3/8/2020'),
(238, 28, 'Kishoreganj ', 'Nikli ', '3/8/2020'),
(239, 28, 'Kishoreganj ', 'Pakundia ', '3/8/2020'),
(240, 28, 'Kishoreganj ', 'Tarail ', '3/8/2020'),
(241, 29, 'Kurigram ', 'Bhurungamari ', '3/8/2020'),
(242, 29, 'Kurigram ', 'Char Rajibpur ', '3/8/2020'),
(243, 29, 'Kurigram ', 'Chilmari ', '3/8/2020'),
(244, 29, 'Kurigram ', 'Phulbari ', '3/8/2020'),
(245, 29, 'Kurigram ', 'Kurigram Sadar ', '3/8/2020'),
(246, 29, 'Kurigram ', 'Nageshwari ', '3/8/2020'),
(247, 29, 'Kurigram ', 'Rajarhat ', '3/8/2020'),
(248, 29, 'Kurigram ', 'Raomari ', '3/8/2020'),
(249, 29, 'Kurigram ', 'Ulipur ', '3/8/2020'),
(250, 30, 'Kushtia ', 'Bheramara ', '3/8/2020'),
(251, 30, 'Kushtia ', 'Daulatpur ', '3/8/2020'),
(252, 30, 'Kushtia ', 'Khoksa ', '3/8/2020'),
(253, 30, 'Kushtia ', 'Kumarkhali ', '3/8/2020'),
(254, 30, 'Kushtia ', 'Kushtia Sadar ', '3/8/2020'),
(255, 30, 'Kushtia ', 'Mirpur ', '3/8/2020'),
(256, 30, 'Kushtia ', 'Shekhpara ', '3/8/2020'),
(257, 31, 'Lakshmipur ', 'Lakshmipur Sadar ', '3/8/2020'),
(258, 31, 'Lakshmipur ', 'Raipur ', '3/8/2020'),
(259, 31, 'Lakshmipur ', 'Ramganj ', '3/8/2020'),
(260, 31, 'Lakshmipur ', 'Ramgati ', '3/8/2020'),
(261, 31, 'Lakshmipur ', 'Kamalnagar ', '3/8/2020'),
(262, 32, 'Lalmonirhat ', 'Aditmari ', '3/8/2020'),
(263, 32, 'Lalmonirhat ', 'Hatibandha ', '3/8/2020'),
(264, 32, 'Lalmonirhat ', 'Kaliganj ', '3/8/2020'),
(265, 32, 'Lalmonirhat ', 'Lalmonirhat Sadar ', '3/8/2020'),
(266, 32, 'Lalmonirhat ', 'Patgram ', '3/8/2020'),
(267, 33, 'Madaripur ', 'Rajoir ', '3/8/2020'),
(268, 33, 'Madaripur ', 'Madaripur Sadar ', '3/8/2020'),
(269, 33, 'Madaripur ', 'Kalkini ', '3/8/2020'),
(270, 33, 'Madaripur ', 'Shibchar ', '3/8/2020'),
(271, 34, 'Magura ', 'Magura Sadar ', '3/8/2020'),
(272, 34, 'Magura ', 'Mohammadpur ', '3/8/2020'),
(273, 34, 'Magura ', 'Shalikha ', '3/8/2020'),
(274, 34, 'Magura ', 'Sreepur ', '3/8/2020'),
(275, 35, 'Manikganj ', 'Daulatpur ', '3/8/2020'),
(276, 35, 'Manikganj ', 'Ghior ', '3/8/2020'),
(277, 35, 'Manikganj ', 'Harirampur ', '3/8/2020'),
(278, 35, 'Manikganj ', 'Manikgonj Sadar ', '3/8/2020'),
(279, 35, 'Manikganj ', 'Saturia ', '3/8/2020'),
(280, 35, 'Manikganj ', 'Shivalaya ', '3/8/2020'),
(281, 35, 'Manikganj ', 'Singair ', '3/8/2020'),
(282, 36, 'Meherpur ', 'Gangni ', '3/8/2020'),
(283, 36, 'Meherpur ', 'Meherpur Sadar ', '3/8/2020'),
(284, 36, 'Meherpur ', 'Mujibnagar ', '3/8/2020'),
(285, 37, 'Moulvibazar ', 'Barlekha ', '3/8/2020'),
(286, 37, 'Moulvibazar ', 'Kamalganj ', '3/8/2020'),
(287, 37, 'Moulvibazar ', 'Kulaura ', '3/8/2020'),
(288, 37, 'Moulvibazar ', 'Moulvibazar Sadar ', '3/8/2020'),
(289, 37, 'Moulvibazar ', 'Rajnagar ', '3/8/2020'),
(290, 37, 'Moulvibazar ', 'Sreemangal ', '3/8/2020'),
(291, 37, 'Moulvibazar ', 'Juri ', '3/8/2020'),
(292, 38, 'Munshiganj ', 'Gazaria ', '3/8/2020'),
(293, 38, 'Munshiganj ', 'Lohajang ', '3/8/2020'),
(294, 38, 'Munshiganj ', 'Munshiganj Sadar ', '3/8/2020'),
(295, 38, 'Munshiganj ', 'Sirajdikhan ', '3/8/2020'),
(296, 38, 'Munshiganj ', 'Sreenagar ', '3/8/2020'),
(297, 38, 'Munshiganj ', 'Tongibari ', '3/8/2020'),
(298, 39, 'Mymensingh ', 'Bhaluka ', '3/8/2020'),
(299, 39, 'Mymensingh ', 'Dhobaura ', '3/8/2020'),
(300, 39, 'Mymensingh ', 'Fulbaria ', '3/8/2020'),
(301, 39, 'Mymensingh ', 'Gaffargaon ', '3/8/2020'),
(302, 39, 'Mymensingh ', 'Gauripur ', '3/8/2020'),
(303, 39, 'Mymensingh ', 'Haluaghat ', '3/8/2020'),
(304, 39, 'Mymensingh ', 'Ishwarganj ', '3/8/2020'),
(305, 39, 'Mymensingh ', 'Mymensingh Sadar ', '3/8/2020'),
(306, 39, 'Mymensingh ', 'Muktagachha ', '3/8/2020'),
(307, 39, 'Mymensingh ', 'Nandail ', '3/8/2020'),
(308, 39, 'Mymensingh ', 'Phulpur ', '3/8/2020'),
(309, 39, 'Mymensingh ', 'Trishal ', '3/8/2020'),
(310, 39, 'Mymensingh ', 'Tara Khanda ', '3/8/2020'),
(311, 40, 'Naogaon ', 'Atrai ', '3/8/2020'),
(312, 40, 'Naogaon ', 'Badalgachhi ', '3/8/2020'),
(313, 40, 'Naogaon ', 'Manda ', '3/8/2020'),
(314, 40, 'Naogaon ', 'Dhamoirhat ', '3/8/2020'),
(315, 40, 'Naogaon ', 'Mohadevpur ', '3/8/2020'),
(316, 40, 'Naogaon ', 'Naogaon Sadar ', '3/8/2020'),
(317, 40, 'Naogaon ', 'Niamatpur ', '3/8/2020'),
(318, 40, 'Naogaon ', 'Patnitala ', '3/8/2020'),
(319, 40, 'Naogaon ', 'Porsha ', '3/8/2020'),
(320, 40, 'Naogaon ', 'Raninagar ', '3/8/2020'),
(321, 40, 'Naogaon ', 'Sapahar ', '3/8/2020'),
(322, 41, 'Narail ', 'Kalia ', '3/8/2020'),
(323, 41, 'Narail ', 'Lohagara ', '3/8/2020'),
(324, 41, 'Narail ', 'Narail Sadar ', '3/8/2020'),
(325, 41, 'Narail ', 'Naragati Thana', '3/8/2020'),
(326, 42, 'Narayanganj ', 'Araihazar ', '3/8/2020'),
(327, 42, 'Narayanganj ', 'Bandar ', '3/8/2020'),
(328, 42, 'Narayanganj ', 'Narayanganj Sadar ', '3/8/2020'),
(329, 42, 'Narayanganj ', 'Rupganj ', '3/8/2020'),
(330, 42, 'Narayanganj ', 'Sonargaon ', '3/8/2020'),
(331, 43, 'Narsingdi ', 'Narsingdi Sadar ', '3/8/2020'),
(332, 43, 'Narsingdi ', 'Belabo ', '3/8/2020'),
(333, 43, 'Narsingdi ', 'Monohardi ', '3/8/2020'),
(334, 43, 'Narsingdi ', 'Palash ', '3/8/2020'),
(335, 43, 'Narsingdi ', 'Raipura ', '3/8/2020'),
(336, 43, 'Narsingdi ', 'Shibpur ', '3/8/2020'),
(337, 44, 'Natore ', 'Bagatipara ', '3/8/2020'),
(338, 44, 'Natore ', 'Baraigram ', '3/8/2020'),
(339, 44, 'Natore ', 'Gurudaspur ', '3/8/2020'),
(340, 44, 'Natore ', 'Lalpur ', '3/8/2020'),
(341, 44, 'Natore ', 'Natore Sadar ', '3/8/2020'),
(342, 44, 'Natore ', 'Singra ', '3/8/2020'),
(343, 44, 'Natore ', 'Naldanga ', '3/8/2020'),
(344, 45, 'Nawabganj ', 'Bholahat ', '3/8/2020'),
(345, 45, 'Nawabganj ', 'Gomastapur ', '3/8/2020'),
(346, 45, 'Nawabganj ', 'Nachole ', '3/8/2020'),
(347, 45, 'Nawabganj ', 'Nawabganj Sadar ', '3/8/2020'),
(348, 45, 'Nawabganj ', 'Shibganj ', '3/8/2020'),
(349, 46, 'Netrakona ', 'Atpara ', '3/8/2020'),
(350, 46, 'Netrakona ', 'Barhatta ', '3/8/2020'),
(351, 46, 'Netrakona ', 'Durgapur ', '3/8/2020'),
(352, 46, 'Netrakona ', 'Khaliajuri ', '3/8/2020'),
(353, 46, 'Netrakona ', 'Kalmakanda ', '3/8/2020'),
(354, 46, 'Netrakona ', 'Kendua ', '3/8/2020'),
(355, 46, 'Netrakona ', 'Madan ', '3/8/2020'),
(356, 46, 'Netrakona ', 'Mohanganj ', '3/8/2020'),
(357, 46, 'Netrakona ', 'Netrokona Sadar ', '3/8/2020'),
(358, 46, 'Netrakona ', 'Purbadhala ', '3/8/2020'),
(359, 47, 'Nilphamari ', 'Dimla ', '3/8/2020'),
(360, 47, 'Nilphamari ', 'Domar ', '3/8/2020'),
(361, 47, 'Nilphamari ', 'Jaldhaka ', '3/8/2020'),
(362, 47, 'Nilphamari ', 'Kishoreganj ', '3/8/2020'),
(363, 47, 'Nilphamari ', 'Nilphamari Sadar ', '3/8/2020'),
(364, 47, 'Nilphamari ', 'Saidpur ', '3/8/2020'),
(365, 48, 'Noakhali ', 'Begumganj ', '3/8/2020'),
(366, 48, 'Noakhali ', 'Noakhali Sadar ', '3/8/2020'),
(367, 48, 'Noakhali ', 'Chatkhil ', '3/8/2020'),
(368, 48, 'Noakhali ', 'Companiganj ', '3/8/2020'),
(369, 48, 'Noakhali ', 'Hatiya ', '3/8/2020'),
(370, 48, 'Noakhali ', 'Senbagh ', '3/8/2020'),
(371, 48, 'Noakhali ', 'Sonaimuri ', '3/8/2020'),
(372, 48, 'Noakhali ', 'Subarnachar ', '3/8/2020'),
(373, 48, 'Noakhali ', 'Kabirhat ', '3/8/2020'),
(374, 49, 'Pabna ', 'Ataikula ', '3/8/2020'),
(375, 49, 'Pabna ', 'Atgharia ', '3/8/2020'),
(376, 49, 'Pabna ', 'Bera ', '3/8/2020'),
(377, 49, 'Pabna ', 'Bhangura ', '3/8/2020'),
(378, 49, 'Pabna ', 'Chatmohar ', '3/8/2020'),
(379, 49, 'Pabna ', 'Faridpur ', '3/8/2020'),
(380, 49, 'Pabna ', 'Ishwardi ', '3/8/2020'),
(381, 49, 'Pabna ', 'Pabna Sadar ', '3/8/2020'),
(382, 49, 'Pabna ', 'Santhia ', '3/8/2020'),
(383, 49, 'Pabna ', 'Sujanagar ', '3/8/2020'),
(384, 50, 'Panchagarh ', 'Atwari ', '3/8/2020'),
(385, 50, 'Panchagarh ', 'Boda ', '3/8/2020'),
(386, 50, 'Panchagarh ', 'Debiganj ', '3/8/2020'),
(387, 50, 'Panchagarh ', 'Panchagarh Sadar ', '3/8/2020'),
(388, 50, 'Panchagarh ', 'Tetulia ', '3/8/2020'),
(389, 51, 'Patuakhali ', 'Bauphal ', '3/8/2020'),
(390, 51, 'Patuakhali ', 'Dashmina ', '3/8/2020'),
(391, 51, 'Patuakhali ', 'Galachipa ', '3/8/2020'),
(392, 51, 'Patuakhali ', 'Kalapara ', '3/8/2020'),
(393, 51, 'Patuakhali ', 'Mirzaganj ', '3/8/2020'),
(394, 51, 'Patuakhali ', 'Patuakhali Sadar ', '3/8/2020'),
(395, 51, 'Patuakhali ', 'Rangabali ', '3/8/2020'),
(396, 51, 'Patuakhali ', 'Dumki ', '3/8/2020'),
(397, 52, 'Pirojpur ', 'Bhandaria ', '3/8/2020'),
(398, 52, 'Pirojpur ', 'Kawkhali ', '3/8/2020'),
(399, 52, 'Pirojpur ', 'Mathbaria ', '3/8/2020'),
(400, 52, 'Pirojpur ', 'Nazirpur ', '3/8/2020'),
(401, 52, 'Pirojpur ', 'Pirojpur Sadar ', '3/8/2020'),
(402, 52, 'Pirojpur ', 'Nesarabad (Swarupkati) ', '3/8/2020'),
(403, 52, 'Pirojpur ', 'Zianagor ', '3/8/2020'),
(404, 53, 'Rajbari ', 'Baliakandi ', '3/8/2020'),
(405, 53, 'Rajbari ', 'Goalandaghat ', '3/8/2020'),
(406, 53, 'Rajbari ', 'Pangsha ', '3/8/2020'),
(407, 53, 'Rajbari ', 'Rajbari Sadar ', '3/8/2020'),
(408, 53, 'Rajbari ', 'Kalukhali ', '3/8/2020'),
(409, 54, 'Rajshahi ', 'Bagha ', '3/8/2020'),
(410, 54, 'Rajshahi ', 'Bagmara ', '3/8/2020'),
(411, 54, 'Rajshahi ', 'Charghat ', '3/8/2020'),
(412, 54, 'Rajshahi ', 'Durgapur ', '3/8/2020'),
(413, 54, 'Rajshahi ', 'Godagari ', '3/8/2020'),
(414, 54, 'Rajshahi ', 'Mohanpur ', '3/8/2020'),
(415, 54, 'Rajshahi ', 'Paba ', '3/8/2020'),
(416, 54, 'Rajshahi ', 'Puthia ', '3/8/2020'),
(417, 54, 'Rajshahi ', 'Tanore ', '3/8/2020'),
(418, 54, 'Rajshahi ', 'Boalia Thana', '3/8/2020'),
(419, 54, 'Rajshahi ', 'Matihar Thana', '3/8/2020'),
(420, 54, 'Rajshahi ', 'Rajpara Thana', '3/8/2020'),
(421, 54, 'Rajshahi ', 'Shah Mokdum Thana', '3/8/2020'),
(422, 55, 'Rangamati ', 'Bagaichhari ', '3/8/2020'),
(423, 55, 'Rangamati ', 'Barkal ', '3/8/2020'),
(424, 55, 'Rangamati ', 'Kawkhali (Betbunia) ', '3/8/2020'),
(425, 55, 'Rangamati ', 'Belaichhari ', '3/8/2020'),
(426, 55, 'Rangamati ', 'Kaptai ', '3/8/2020'),
(427, 55, 'Rangamati ', 'Juraichhari ', '3/8/2020'),
(428, 55, 'Rangamati ', 'Langadu ', '3/8/2020'),
(429, 55, 'Rangamati ', 'Naniyachar ', '3/8/2020'),
(430, 55, 'Rangamati ', 'Rajasthali ', '3/8/2020'),
(431, 55, 'Rangamati ', 'Rangamati Sadar ', '3/8/2020'),
(432, 56, 'Rangpur ', 'Badarganj ', '3/8/2020'),
(433, 56, 'Rangpur ', 'Gangachhara ', '3/8/2020'),
(434, 56, 'Rangpur ', 'Kaunia ', '3/8/2020'),
(435, 56, 'Rangpur ', 'Rangpur Sadar ', '3/8/2020'),
(436, 56, 'Rangpur ', 'Mithapukur ', '3/8/2020'),
(437, 56, 'Rangpur ', 'Pirgachha ', '3/8/2020'),
(438, 56, 'Rangpur ', 'Pirganj ', '3/8/2020'),
(439, 56, 'Rangpur ', 'Taraganj ', '3/8/2020'),
(440, 57, 'Satkhira ', 'Assasuni ', '3/8/2020'),
(441, 57, 'Satkhira ', 'Debhata ', '3/8/2020'),
(442, 57, 'Satkhira ', 'Kalaroa ', '3/8/2020'),
(443, 57, 'Satkhira ', 'Kaliganj ', '3/8/2020'),
(444, 57, 'Satkhira ', 'Satkhira Sadar ', '3/8/2020'),
(445, 57, 'Satkhira ', 'Shyamnagar ', '3/8/2020'),
(446, 57, 'Satkhira ', 'Tala ', '3/8/2020'),
(447, 58, 'Shariatpur ', 'Bhedarganj ', '3/8/2020'),
(448, 58, 'Shariatpur ', 'Damudya ', '3/8/2020'),
(449, 58, 'Shariatpur ', 'Gosairhat ', '3/8/2020'),
(450, 58, 'Shariatpur ', 'Naria ', '3/8/2020'),
(451, 58, 'Shariatpur ', 'Shariatpur Sadar ', '3/8/2020'),
(452, 58, 'Shariatpur ', 'Zanjira ', '3/8/2020'),
(453, 58, 'Shariatpur ', 'Shakhipur ', '3/8/2020'),
(454, 59, 'Sherpur ', 'Jhenaigati ', '3/8/2020'),
(455, 59, 'Sherpur ', 'Nakla ', '3/8/2020'),
(456, 59, 'Sherpur ', 'Nalitabari ', '3/8/2020'),
(457, 59, 'Sherpur ', 'Sherpur Sadar ', '3/8/2020'),
(458, 59, 'Sherpur ', 'Sreebardi ', '3/8/2020'),
(459, 60, 'Sirajganj ', 'Belkuchi ', '3/8/2020'),
(460, 60, 'Sirajganj ', 'Chauhali ', '3/8/2020'),
(461, 60, 'Sirajganj ', 'Kamarkhanda ', '3/8/2020'),
(462, 60, 'Sirajganj ', 'Kazipur ', '3/8/2020'),
(463, 60, 'Sirajganj ', 'Raiganj ', '3/8/2020'),
(464, 60, 'Sirajganj ', 'Shahjadpur ', '3/8/2020'),
(465, 60, 'Sirajganj ', 'Sirajganj Sadar ', '3/8/2020'),
(466, 60, 'Sirajganj ', 'Tarash ', '3/8/2020'),
(467, 60, 'Sirajganj ', 'Ullahpara ', '3/8/2020'),
(468, 61, 'Sunamganj ', 'Bishwamvarpur ', '3/8/2020'),
(469, 61, 'Sunamganj ', 'Chhatak ', '3/8/2020'),
(470, 61, 'Sunamganj ', 'Derai ', '3/8/2020'),
(471, 61, 'Sunamganj ', 'Dharampasha ', '3/8/2020'),
(472, 61, 'Sunamganj ', 'Dowarabazar ', '3/8/2020'),
(473, 61, 'Sunamganj ', 'Jagannathpur ', '3/8/2020'),
(474, 61, 'Sunamganj ', 'Jamalganj ', '3/8/2020'),
(475, 61, 'Sunamganj ', 'Sullah ', '3/8/2020'),
(476, 61, 'Sunamganj ', 'Sunamganj Sadar ', '3/8/2020'),
(477, 61, 'Sunamganj ', 'Tahirpur ', '3/8/2020'),
(478, 61, 'Sunamganj ', 'South Sunamganj ', '3/8/2020'),
(479, 62, 'Sylhet ', 'Balaganj ', '3/8/2020'),
(480, 62, 'Sylhet ', 'Beanibazar ', '3/8/2020'),
(481, 62, 'Sylhet ', 'Bishwanath ', '3/8/2020'),
(482, 62, 'Sylhet ', 'Companigonj ', '3/8/2020'),
(483, 62, 'Sylhet ', 'Fenchuganj ', '3/8/2020'),
(484, 62, 'Sylhet ', 'Golapganj ', '3/8/2020'),
(485, 62, 'Sylhet ', 'Gowainghat ', '3/8/2020'),
(486, 62, 'Sylhet ', 'Jaintiapur ', '3/8/2020'),
(487, 62, 'Sylhet ', 'Kanaighat ', '3/8/2020'),
(488, 62, 'Sylhet ', 'Sylhet Sadar ', '3/8/2020'),
(489, 62, 'Sylhet ', 'Zakiganj ', '3/8/2020'),
(490, 62, 'Sylhet ', 'South Shurma ', '3/8/2020'),
(491, 63, 'Tangail ', 'Gopalpur ', '3/8/2020'),
(492, 63, 'Tangail ', 'Basail ', '3/8/2020'),
(493, 63, 'Tangail ', 'Bhuapur ', '3/8/2020'),
(494, 63, 'Tangail ', 'Delduar ', '3/8/2020'),
(495, 63, 'Tangail ', 'Ghatail ', '3/8/2020'),
(496, 63, 'Tangail ', 'Kalihati ', '3/8/2020'),
(497, 63, 'Tangail ', 'Madhupur ', '3/8/2020'),
(498, 63, 'Tangail ', 'Mirzapur ', '3/8/2020'),
(499, 63, 'Tangail ', 'Nagarpur ', '3/8/2020'),
(500, 63, 'Tangail ', 'Sakhipur ', '3/8/2020'),
(501, 63, 'Tangail ', 'Dhanbari ', '3/8/2020'),
(502, 63, 'Tangail ', 'Tangail Sadar ', '3/8/2020'),
(503, 64, 'Thakurgaon ', 'Baliadangi ', '3/8/2020'),
(504, 64, 'Thakurgaon ', 'Haripur ', '3/8/2020'),
(505, 64, 'Thakurgaon ', 'Pirganj ', '3/8/2020'),
(506, 64, 'Thakurgaon ', 'Ranisankail ', '3/8/2020'),
(507, 64, 'Thakurgaon ', 'Thakurgaon Sadar ', '3/8/2020'),
(508, 13, 'Dhaka', 'Adabor', '3/8/2020'),
(4543, 13, 'Dhaka', 'Agargaon', '3/9/2020'),
(4544, 13, 'Dhaka', 'Azimpur', '3/10/2020'),
(4545, 13, 'Dhaka', 'Badda', '3/11/2020'),
(4546, 13, 'Dhaka', 'Bakshi Bazar', '3/12/2020'),
(4547, 13, 'Dhaka', 'Banani', '3/13/2020'),
(4548, 13, 'Dhaka', 'Banani DOHS', '3/14/2020'),
(4549, 13, 'Dhaka', 'Banasree', '3/15/2020'),
(4550, 13, 'Dhaka', 'Bangla Bazar', '3/16/2020'),
(4551, 13, 'Dhaka', 'Bangla Motor', '3/17/2020'),
(4552, 13, 'Dhaka', 'Baridhara', '3/18/2020'),
(4553, 13, 'Dhaka', 'Baridhara DOHS', '3/19/2020'),
(4554, 13, 'Dhaka', 'Basabo', '3/20/2020'),
(4555, 13, 'Dhaka', 'Basundhara', '3/21/2020'),
(4556, 13, 'Dhaka', 'Bimanbondor Thana', '3/22/2020'),
(4557, 13, 'Dhaka', 'Bongshal', '3/23/2020'),
(4558, 13, 'Dhaka', 'Buet Campus', '3/24/2020'),
(4559, 13, 'Dhaka', 'Cantonment', '3/25/2020'),
(4560, 13, 'Dhaka', 'Chowk Bazaar', '3/26/2020'),
(4561, 13, 'Dhaka', 'Dakshin Khan', '3/27/2020'),
(4562, 13, 'Dhaka', 'Demra', '3/28/2020'),
(4563, 13, 'Dhaka', 'Dhamrai', '3/29/2020'),
(4564, 13, 'Dhaka', 'Dhanmondi', '3/30/2020'),
(4565, 13, 'Dhaka', 'Dohar', '3/31/2020'),
(4566, 13, 'Dhaka', 'Doyagonj', '4/1/2020'),
(4567, 13, 'Dhaka', 'Du Campus', '4/2/2020'),
(4568, 13, 'Dhaka', 'Elephant Road', '4/3/2020'),
(4569, 13, 'Dhaka', 'Eskaton', '4/4/2020'),
(4570, 13, 'Dhaka', 'Farmgate', '4/5/2020'),
(4571, 13, 'Dhaka', 'Gabtoli', '4/6/2020'),
(4572, 13, 'Dhaka', 'Gendaria', '4/7/2020'),
(4573, 13, 'Dhaka', 'Green Road', '4/8/2020'),
(4574, 13, 'Dhaka', 'Gulistan', '4/9/2020'),
(4575, 13, 'Dhaka', 'Gulshan 1', '4/10/2020'),
(4576, 13, 'Dhaka', 'Gulshan 2', '4/11/2020'),
(4577, 13, 'Dhaka', 'Hatirpool', '4/12/2020'),
(4578, 13, 'Dhaka', 'Hazaribag', '4/13/2020'),
(4579, 13, 'Dhaka', 'Hemayetpur', '4/14/2020'),
(4580, 13, 'Dhaka', 'Ibrahimpur', '4/15/2020'),
(4581, 13, 'Dhaka', 'Islampur', '4/16/2020'),
(4582, 13, 'Dhaka', 'Jatrabari', '4/17/2020'),
(4583, 13, 'Dhaka', 'Jurain', '4/18/2020'),
(4584, 13, 'Dhaka', 'Kafrul', '4/19/2020'),
(4585, 13, 'Dhaka', 'Kakrail', '4/20/2020'),
(4586, 13, 'Dhaka', 'Kalabagan', '4/21/2020'),
(4587, 13, 'Dhaka', 'Kallyanpur', '4/22/2020'),
(4588, 13, 'Dhaka', 'Kamalapur', '4/23/2020'),
(4589, 13, 'Dhaka', 'Kamrangirchar', '4/24/2020'),
(4590, 13, 'Dhaka', 'Kathalbagan', '4/25/2020'),
(4591, 13, 'Dhaka', 'Kawran Bazar', '4/26/2020'),
(4592, 13, 'Dhaka', 'Kazipara', '4/27/2020'),
(4593, 13, 'Dhaka', 'Keraniganj', '4/28/2020'),
(4594, 13, 'Dhaka', 'Khilgaon', '4/29/2020'),
(4595, 13, 'Dhaka', 'Khilkhet', '4/30/2020'),
(4596, 13, 'Dhaka', 'Kodomtoli', '5/1/2020'),
(4597, 13, 'Dhaka', 'Kotwali', '5/2/2020'),
(4598, 13, 'Dhaka', 'Lalbagh', '5/3/2020'),
(4599, 13, 'Dhaka', 'Lalmatia', '5/4/2020'),
(4600, 13, 'Dhaka', 'Maghbazar', '5/5/2020'),
(4601, 13, 'Dhaka', 'Malibagh', '5/6/2020'),
(4602, 13, 'Dhaka', 'Mirpur', '5/7/2020'),
(4603, 13, 'Dhaka', 'Mirpur 1', '5/8/2020'),
(4604, 13, 'Dhaka', 'Mirpur 10', '5/9/2020'),
(4605, 13, 'Dhaka', 'Mirpur 11', '5/10/2020'),
(4606, 13, 'Dhaka', 'Mirpur 12', '5/11/2020'),
(4607, 13, 'Dhaka', 'Mirpur 2', '5/12/2020'),
(4608, 13, 'Dhaka', 'Mirpur DOHS', '5/13/2020'),
(4609, 13, 'Dhaka', 'Moddho Badda', '5/14/2020'),
(4610, 13, 'Dhaka', 'Moddho Vatara', '5/15/2020'),
(4611, 13, 'Dhaka', 'Mohakhali', '5/16/2020'),
(4612, 13, 'Dhaka', 'Mohakhali DOHS', '5/17/2020'),
(4613, 13, 'Dhaka', 'Mohammadpur', '5/18/2020'),
(4614, 13, 'Dhaka', 'Motijheel', '5/19/2020'),
(4615, 13, 'Dhaka', 'Mugda', '5/20/2020'),
(4616, 13, 'Dhaka', 'Nakhalpara', '5/21/2020'),
(4617, 13, 'Dhaka', 'Narinda', '5/22/2020'),
(4618, 13, 'Dhaka', 'Nawabganj', '5/23/2020'),
(4619, 13, 'Dhaka', 'New Eskaton', '5/24/2020'),
(4620, 13, 'Dhaka', 'New Market', '5/25/2020'),
(4621, 13, 'Dhaka', 'Niketon', '5/26/2020'),
(4622, 13, 'Dhaka', 'Nikunja', '5/27/2020'),
(4623, 13, 'Dhaka', 'Nilkhet', '5/28/2020'),
(4624, 13, 'Dhaka', 'Noya Polton', '5/29/2020'),
(4625, 13, 'Dhaka', 'Palashi', '5/30/2020'),
(4626, 13, 'Dhaka', 'Pallabi', '5/31/2020'),
(4627, 13, 'Dhaka', 'Panthapath', '6/1/2020'),
(4628, 13, 'Dhaka', 'Postogola', '6/2/2020'),
(4629, 13, 'Dhaka', 'Purana Paltan', '6/3/2020'),
(4630, 13, 'Dhaka', 'Purbachal', '6/4/2020'),
(4631, 13, 'Dhaka', 'Raja Bazar', '6/5/2020'),
(4632, 13, 'Dhaka', 'Rajarbag', '6/6/2020'),
(4633, 13, 'Dhaka', 'Ramna', '6/7/2020'),
(4634, 13, 'Dhaka', 'Rampura', '6/8/2020'),
(4635, 13, 'Dhaka', 'Rayer Bazaar', '6/9/2020'),
(4636, 13, 'Dhaka', 'Rupnagar', '6/10/2020'),
(4637, 13, 'Dhaka', 'Sabujbagh', '6/11/2020'),
(4638, 13, 'Dhaka', 'Sadarghat', '6/12/2020'),
(4639, 13, 'Dhaka', 'Savar', '6/13/2020'),
(4640, 13, 'Dhaka', 'Segun Bagicha', '6/14/2020'),
(4641, 13, 'Dhaka', 'Shahbag', '6/15/2020'),
(4642, 13, 'Dhaka', 'Shahjadpur', '6/16/2020'),
(4643, 13, 'Dhaka', 'Shahjahanpur', '6/17/2020'),
(4644, 13, 'Dhaka', 'Shampur', '6/18/2020'),
(4645, 13, 'Dhaka', 'Shantinagar', '6/19/2020'),
(4646, 13, 'Dhaka', 'Sher-e-bangla Nagar', '6/20/2020'),
(4647, 13, 'Dhaka', 'Shimrail', '6/21/2020'),
(4648, 13, 'Dhaka', 'Shukrabad', '6/22/2020'),
(4649, 13, 'Dhaka', 'Shyamoli', '6/23/2020'),
(4650, 13, 'Dhaka', 'Siddheshwari', '6/24/2020'),
(4651, 13, 'Dhaka', 'Sutrapur', '6/25/2020'),
(4652, 13, 'Dhaka', 'Tejgaon', '6/26/2020'),
(4653, 13, 'Dhaka', 'Tejkunipara', '6/27/2020'),
(4654, 13, 'Dhaka', 'Tikatuli', '6/28/2020'),
(4655, 13, 'Dhaka', 'Turag', '6/29/2020'),
(4656, 13, 'Dhaka', 'Uttar Khan', '6/30/2020'),
(4657, 13, 'Dhaka', 'Uttora', '7/1/2020'),
(4658, 13, 'Dhaka', 'Wari', '7/2/2020'),
(4659, 13, 'Dhaka', 'Zigatola', '7/3/2020');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `img` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checklist` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `email`, `mobile`, `username`, `password`, `added_by`, `edited_by`, `date`, `last_login`, `status`, `img`, `checklist`) VALUES
(2, 'super-user', 'Ahmed Saklayen', 'myicche@gmail.com', '01623211729', 'tanim001', '0b805c08a9dd8fd187e5d77b75d3cc42', NULL, 'tanim001', '2023-07-29 22:02:13', '29-07-2023 22:02:34', 1, '384b4c29350be534db96c6050c3dff18.jpg', '{\"user-delete\":\"on\",\"cover-img-delete\":\"on\",\"system-mail-delete\":\"on\",\"partner-delete\":\"on\",\"testimonial-delete\":\"on\",\"menu-delete\":\"on\",\"patient-delete\":\"on\",\"report-delete\":\"on\",\"appointment-delete\":\"on\",\"department-delete\":\"on\",\"doctors-delete\":\"on\",\"location-delete\":\"on\",\"product-delete\":\"on\",\"service-delete\":\"on\",\"promotion-delete\":\"on\",\"blog-delete\":\"on\",\"subscriber-delete\":\"on\",\"faq-delete\":\"on\",\"contact-delete\":\"on\",\"prescription-delete\":\"on\",\"user-update\":\"on\",\"org-update\":\"on\",\"cover-img-update\":\"on\",\"system-mail-update\":\"on\",\"partner-update\":\"on\",\"testimonial-update\":\"on\",\"menu-update\":\"on\",\"patient-update\":\"on\",\"report-update\":\"on\",\"appointment-update\":\"on\",\"department-update\":\"on\",\"doctors-update\":\"on\",\"location-update\":\"on\",\"product-update\":\"on\",\"service-update\":\"on\",\"promotion-update\":\"on\",\"blog-update\":\"on\",\"subscriber-update\":\"on\",\"faq-update\":\"on\",\"prescription-update\":\"on\",\"system-mail-add\":\"on\",\"cover-img-add\":\"on\",\"partner-add\":\"on\",\"testimonial-add\":\"on\",\"menu-add\":\"on\",\"user-add\":\"on\",\"patient-add\":\"on\",\"report-add\":\"on\",\"appointment-add\":\"on\",\"department-add\":\"on\",\"doctors-add\":\"on\",\"location-add\":\"on\",\"product-add\":\"on\",\"service-add\":\"on\",\"promotion-add\":\"on\",\"blog-add\":\"on\",\"subscriber-add\":\"on\",\"faq-add\":\"on\",\"org-add\":\"on\",\"prescription-add\":\"on\",\"contact-reply\":\"on\",\"report-download\":\"on\",\"checkListUpdate\":\"true\",\"id\":\"2\"}'),
(3, 'super-user', 'Saklayen Ahmed', 'astanim.3221@gmail.com', '01727268458', 'saklayen', '0b805c08a9dd8fd187e5d77b75d3cc42', 'session_add', 'tanim001', '2023-07-29 21:51:11', '29-07-2023 21:53:30', 1, 'd44fb7192b76414561ff9e0abdad4416.jpg', '{\"checkListUpdate\":\"true\",\"id\":\"3\"}');

-- --------------------------------------------------------

--
-- Table structure for table `visitor`
--

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL,
  `device` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor`
--

INSERT INTO `visitor` (`id`, `device`, `http`, `ip`, `city`, `country`, `username`, `time`, `details`) VALUES
(8, 'Desktop', 'localhost:8080', '119.30.32.188', 'Dhaka', 'Bangladesh', 'tanim001', '2022-12-24 01:26:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(7, 'Desktop', 'localhost:8080', '119.30.32.182', 'Dhaka', 'Bangladesh', 'tanim001', '2022-12-24 01:26:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(6, 'Desktop', 'localhost:8080', '119.30.32.182', 'Dhaka', 'Bangladesh', 'tanim001', '2022-12-24 01:26:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(5, 'Desktop', 'localhost:8080', '119.30.32.182', 'Dhaka', 'Bangladesh', 'tanim001', '2022-12-24 01:26:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(9, 'Desktop', 'localhost:8080', '119.30.32.188', 'Dhaka', 'Bangladesh', NULL, '2022-12-24 01:37:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(10, 'Desktop', 'localhost:8080', '::1', NULL, NULL, 'tanim001', '2022-12-24 01:38:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(11, 'Desktop', 'localhost:8080', '::1', NULL, NULL, 'tanim001', '2022-12-24 01:39:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'),
(12, 'Mobile', 'localhost:8080', '::1', NULL, NULL, 'tanim001', '2023-01-02 21:57:25', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36'),
(13, 'Mobile', 'localhost:8080', '::1', NULL, NULL, 'tanim001', '2023-01-02 21:57:32', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_limit`
--
ALTER TABLE `appointment_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icon_set`
--
ALTER TABLE `icon_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_key_code`
--
ALTER TABLE `info_key_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_head`
--
ALTER TABLE `main_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `med_brand`
--
ALTER TABLE `med_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice` (`invoice`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_head`
--
ALTER TABLE `sub_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_mail_setup`
--
ALTER TABLE `sys_mail_setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazila`
--
ALTER TABLE `upazila`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `visitor`
--
ALTER TABLE `visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `appointment_limit`
--
ALTER TABLE `appointment_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `icon_set`
--
ALTER TABLE `icon_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT for table `info_key_code`
--
ALTER TABLE `info_key_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `main_head`
--
ALTER TABLE `main_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `med_brand`
--
ALTER TABLE `med_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_head`
--
ALTER TABLE `sub_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sys_mail_setup`
--
ALTER TABLE `sys_mail_setup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `upazila`
--
ALTER TABLE `upazila`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4660;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visitor`
--
ALTER TABLE `visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
