-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 08:14 PM
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
-- Database: `saklayen`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutme`
--

CREATE TABLE `aboutme` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `aboutme`
--

INSERT INTO `aboutme` (`id`, `title`, `rank`, `description`, `visibility`) VALUES
(1, 'About Me', 5, '8989Experienced Audit and Assurance Professional | Expertise in External Audit, Account Reconciliation, and Accounting', 1),
(2, 'Education', 4, 'Graduate and Post-graduate degrees from the University of Rajshahi, Department of Accounting and Information Systems', 1),
(3, 'Technical Skills', 3, 'SAP S/4HANA Finance, Microsoft Office, Microsoft SQL Server, Power BI, Python for Data Science and Software Development, Microsoft Azure (Azure Virtual Machines, Azure Storage, Azure Functions)', 1),
(4, 'Industry Experience', 2, 'Non-Banking Financial Institutions, Insurance, Service, Manufacturing', 1),
(5, 'Additional Description', 1, '<p>I am a results-driven professional with a strong background in audit and assurance services across diverse industries. My areas of expertise include external audit, account reconciliation, and accounting, where I consistently deliver exceptional outcomes.&nbsp;</p><p>&nbsp;</p><p>Beyond my core skills, I possess advanced proficiency in Microsoft Office, Microsoft SQL Server, Power BI, Python, and Microsoft Azure. I am experienced in managing and deploying cloud solutions, and proficient in Azure Virtual Machines, Azure Storage, and Azure Functions. This enables me to leverage technology for data analysis, visualization, software development, and cloud-based solutions. I hold a graduate and post-graduate degree from the esteemed University of Rajshahi, specializing in Accounting and Information Systems. Currently, I am leveraging my expertise as an Audit Professional at Deloitte Bangladesh, contributing to the success of our clients through meticulous auditing and delivering superior results. Let\'s connect to explore how my skills and experience can add value to your organization or project.</p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `title` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `rank`, `title`, `description`, `visibility`) VALUES
(1, 1, 'Interact with people ', 'Ability to interact effectively with people at all levels with patience, tact and diplomacy.', 1),
(2, 2, 'Learn fast', 'Ability to learn fast and adapt well to new situations and opportunities.', 1),
(3, 3, 'Attitude', 'Perform proactively with friendly and supportive attitude.', 1),
(4, 4, 'Time Management', 'Highly organized and methodical with excellent time management and prioritization.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `audit_type`
--

CREATE TABLE `audit_type` (
  `id` int(11) NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT 1,
  `for_cv` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_type`
--

INSERT INTO `audit_type` (`id`, `name`, `key_name`, `rank`, `visibility`, `for_cv`) VALUES
(4, 'External Audit 3', NULL, NULL, 0, 0),
(5, 'Operational Audit', NULL, NULL, 0, 0),
(6, 'IT Audit', 'it_audit', NULL, 0, 0),
(7, 'Statutory Audit', 'statutory_audit', NULL, 0, 0),
(8, 'Tax Audit', 'tax_audit', NULL, 1, 1),
(9, 'Forensic Audit', 'forensic_audit', NULL, 1, 0),
(10, 'Environmental Audit', 'environmental_audit', NULL, 0, 0),
(11, 'Quality Audit', 'quality_audit', NULL, 0, 0),
(12, 'Occupational Health and Safety Audit', 'occupational_health_and_safety_audit', NULL, 0, 0),
(13, 'Social Compliance Audit', 'social_compliance_audit', NULL, 1, 0),
(14, 'Construction Audit', 'construction_audit', NULL, 1, 0),
(15, 'Enterprise Risk Audit', 'enterprise_risk_audit', NULL, 0, 0),
(16, 'Energy Audit', 'energy_audit', NULL, 0, 0),
(17, 'Retail Audit', 'retail_audit', NULL, 0, 0),
(18, 'Marketing Audit', 'marketing_audit', NULL, 0, 0),
(19, 'Human Capital Audit', 'human_capital_audit', NULL, 0, 0),
(20, 'Cybersecurity Audit', 'cybersecurity_audit', NULL, 0, 0),
(111, 'Financial Audit', 'financial_audit', NULL, 1, 0),
(223, 'Compliance Audit', 'compliance_audit', NULL, 0, 0),
(333, 'Internal Audit', 'internal_audit', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `category` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `added_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_updated` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `rank`, `visibility`, `category`, `title`, `image`, `description`, `date_added`, `added_by`, `date_updated`, `updated_by`) VALUES
(1, 1, 1, 'me', 'Best Practices for Animated Progress Indicators', 'bg-01.jpg', '<p>Nulla nulla nisl, sodales ac nulla ac, consequat vulputate purus. Curabitur tincidunt ipsum vel nibh rutrum accumsan. Nunc ullamcorper posuere leo, vitae aliquet risus pharetra in. Integer turpis eros, iaculis et mi non, pulvinar egestas leo. Etiam sagittis ex turpis, vitae cursus tortor interdum eu. Quisque ultrices nunc eget erat vestibulum euismod. Ut mauris nisi, facilisis at arcu nec, facilisis porttitor lorem.</p><p>Vivamus vitae neque molestie, porta libero sed, tincidunt leo. In nec posuere odio, id rhoncus lorem. Proin id erat ut dolor condimentum viverra. Praesent viverra sed dolor ac luctus. Praesent placerat id lorem quis lacinia.</p><blockquote class=\"quote\">\r\n		    Maecenas id finibus felis. Etiam vitae nibh et felis efficitur pellentesque. Mauris suscipit sapien nunc, a lacinia nibh feugiat ut. In hac habitasse platea dictumst.							<footer class=\"quote-author\">\r\n					<span>\r\n													Larry L. Johnson											</span>\r\n				</footer>\r\n					</blockquote>', 'June 22, 2020', 'LMPixels', NULL, NULL),
(2, 1, 1, 'ui', '02 Best Practices for Animated Progress Indicators', 'bg-01.jpg', '<p>Nulla nulla nisl, sodales ac nulla ac, consequat vulputate purus. Curabitur tincidunt ipsum vel nibh rutrum accumsan. Nunc ullamcorper posuere leo, vitae aliquet risus pharetra in. Integer turpis eros, iaculis et mi non, pulvinar egestas leo. Etiam sagittis ex turpis, vitae cursus tortor interdum eu. Quisque ultrices nunc eget erat vestibulum euismod. Ut mauris nisi, facilisis at arcu nec, facilisis porttitor lorem.</p><p>Vivamus vitae neque molestie, porta libero sed, tincidunt leo. In nec posuere odio, id rhoncus lorem. Proin id erat ut dolor condimentum viverra. Praesent viverra sed dolor ac luctus. Praesent placerat id lorem quis lacinia.</p><blockquote class=\"quote\">\r\n		    Maecenas id finibus felis. Etiam vitae nibh et felis efficitur pellentesque. Mauris suscipit sapien nunc, a lacinia nibh feugiat ut. In hac habitasse platea dictumst.							<footer class=\"quote-author\">\r\n					<span>\r\n													Larry L. Johnson											</span>\r\n				</footer>\r\n					</blockquote>', 'June 22, 2020', 'LMPixels', NULL, NULL),
(3, 1, 1, 'ui', '03 Best Practices for Animated Progress Indicators', 'bg-01.jpg', '<p>Nulla nulla nisl, sodales ac nulla ac, consequat vulputate purus. Curabitur tincidunt ipsum vel nibh rutrum accumsan. Nunc ullamcorper posuere leo, vitae aliquet risus pharetra in. Integer turpis eros, iaculis et mi non, pulvinar egestas leo. Etiam sagittis ex turpis, vitae cursus tortor interdum eu. Quisque ultrices nunc eget erat vestibulum euismod. Ut mauris nisi, facilisis at arcu nec, facilisis porttitor lorem.</p><p>Vivamus vitae neque molestie, porta libero sed, tincidunt leo. In nec posuere odio, id rhoncus lorem. Proin id erat ut dolor condimentum viverra. Praesent viverra sed dolor ac luctus. Praesent placerat id lorem quis lacinia.</p><blockquote class=\"quote\">\r\n		    Maecenas id finibus felis. Etiam vitae nibh et felis efficitur pellentesque. Mauris suscipit sapien nunc, a lacinia nibh feugiat ut. In hac habitasse platea dictumst.							<footer class=\"quote-author\">\r\n					<span>\r\n													Larry L. Johnson											</span>\r\n				</footer>\r\n					</blockquote>', 'June 22, 2020', 'LMPixels', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_filter`
--

CREATE TABLE `blog_filter` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_filter`
--

INSERT INTO `blog_filter` (`id`, `rank`, `category`, `text`, `visibility`) VALUES
(2, NULL, 'ui', 'UI', 1),
(3, NULL, 'me', 'Me', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `visibility`) VALUES
(1, 'Enterprise Software & Productivity Tools', 1),
(2, 'Programming, Data Analysis & Development', 1),
(3, 'Database Management & Cloud Platforms', 1),
(4, 'Data Visualization & Social Tools', 1);

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `for_cv` int(11) NOT NULL DEFAULT 0,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skills` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_category` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `rank`, `for_cv`, `title`, `skills`, `course_category`, `issuer`, `date`, `link`, `icon`, `visibility`) VALUES
(1, 14, 1, 'SAP S/4HANA Finance & Controlling - Configuration & End User', '[\"SAP S/4HANA Finance\",\"Financial Accounting\"]', 'SAP', 'Udemy', '2023-07-01', 'https://www.udemy.com/certificate/UC-54844afe-25b9-452a-8045-0aad39be0d4b/', 'udemy.png', 1),
(2, 13, 1, 'SAP S/4HANA Training with SAP HANA, S4 HANA Finance & FIORI', NULL, NULL, 'Udemy', '2023-06-01', 'https://www.udemy.com/certificate/UC-25b7d479-f37c-43b9-9d30-7c95d2b3eb17/', 'udemy.png', 1),
(3, 12, 0, 'The Ultimate SAP S/4HANA Course', NULL, NULL, 'Udemy', '2023-05-01', 'https://www.udemy.com/certificate/UC-e49e2a13-d72e-4415-a747-88c0bf0f6ae4/', 'udemy.png', 1),
(4, NULL, 0, 'SAP S/4HANA Finance (vs SAP FICO)', NULL, NULL, 'Udemy', '2023-06-01', 'https://www.udemy.com/certificate/UC-ba65dbad-16bc-4e94-a7ff-011883ddcfbc/', 'udemy.png', 1),
(5, NULL, 1, 'SAP Financials Essential Training', NULL, NULL, 'LinkedIn', '2023-06-01', 'https://www.linkedin.com/learning/certificates/662dbcade8ef5fa1a91cb58a7e2fae55f9dcc60e00a468680701f2f025c9f0a7', 'linkedin.png', 1),
(6, NULL, 1, 'SAP S/4HANA: Beyond the Basics', NULL, NULL, 'LinkedIn', '2023-06-01', 'https://www.linkedin.com/learning/certificates/67e209c9045501caaafc034007b4b5624d044db3ca10256265b951ea86ff447c', 'linkedin.png', 1),
(7, NULL, 0, 'Excel for Accountants', NULL, NULL, 'Linkedin Learning', '2021-06-01', '', 'linkedin.png', 1),
(8, NULL, 0, 'Creating Process Flow Diagrams (Microsoft Visio)', NULL, NULL, 'Deloitte', '2021-06-01', '', 'deloitte.png', 1),
(9, NULL, 1, 'Power BI for the audit', NULL, NULL, 'Deloitte', '2021-06-01', '', 'deloitte.png', 1),
(10, NULL, 0, 'Introduction to Excel VBA and Macros', NULL, NULL, 'Linkedin Learning', '2021-07-01', '', 'linkedin.png', 1),
(11, NULL, 0, 'Data Analytics for Business Professionals', NULL, NULL, 'Linkedin Learning', '2021-07-01', '', 'linkedin.png', 1),
(12, NULL, 1, 'Using Python with Excel', NULL, NULL, 'Linkedin Learning', '2021-07-01', '', 'linkedin.png', 1),
(13, NULL, 1, 'Using Python for Automation', NULL, NULL, 'LinkedIn', '2021-07-01', '', 'deloitte.png', 1),
(14, NULL, 0, 'Accounting Research Skills - IFRS Standards Fundamentals', NULL, NULL, 'Deloitte', '2022-08-01', '', 'deloitte.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_types`
--

CREATE TABLE `client_types` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_types`
--

INSERT INTO `client_types` (`id`, `key_name`, `rank`, `visibility`, `name`) VALUES
(1, 'financial_services', NULL, 0, 'Financial Services'),
(2, 'healthcare', NULL, 0, 'Healthcare'),
(3, 'manufacturing', NULL, 0, 'Manufacturing'),
(4, 'retail', NULL, 0, 'Retail'),
(5, 'information_technology', NULL, 0, 'Information Technology'),
(6, 'energy_utilities', NULL, 0, 'Energy & Utilities'),
(7, 'telecommunications', NULL, 0, 'Telecommunications'),
(8, 'pharmaceuticals', NULL, 0, 'Pharmaceuticals'),
(9, 'agriculture', NULL, 0, 'Agriculture'),
(10, 'automotive', NULL, 0, 'Automotive'),
(11, 'education', NULL, 0, 'Education'),
(12, 'construction', NULL, 0, 'Construction'),
(13, 'real_estate', NULL, 0, 'Real Estate'),
(14, 'transportation_logistics', NULL, 0, 'Transportation & Logistics'),
(15, 'hospitality_tourism', NULL, 0, 'Hospitality & Tourism'),
(16, 'aerospace_defense', NULL, 0, 'Aerospace & Defense'),
(17, 'media_entertainment', NULL, 0, 'Media & Entertainment'),
(18, 'food_beverages', NULL, 0, 'Food & Beverages'),
(19, 'legal_services', NULL, 0, 'Legal Services'),
(20, 'non_profit_organizations', NULL, 0, 'Non-Profit Organizations');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `visibility` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `rank`, `name`, `email`, `mobile`, `subject`, `message`, `date_added`, `status`, `visibility`) VALUES
(139, NULL, 'Saklayen', 'astanim.3221@gmail.com', '0172768458', 'Test', 'Tes', '10-03-2023 23:57:30', NULL, NULL),
(140, NULL, 'dfgh', 'dfgh@dfghj.dfgh', '34564', 'dfghj', 'dfghj', '10-04-2023 00:01:30', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `rank` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stream` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `rank`, `period`, `passing`, `title`, `department`, `institution`, `grade`, `stream`, `visibility`) VALUES
(1, '1', '2021-Current', NULL, 'Chartered Accountancy (CA)', '', 'Institute of Chartered Accountants of Bangladesh (ICAB)', 'Professional Level', '', 1),
(2, '2', '2019-2021', '2018', 'Master\'s of Business Administration (MBA)', 'Department of Accounting and Information systems', 'University of Rajshahi', '3.29 out of 4.00', NULL, 1),
(3, '5', '2015-2018', NULL, 'Bachelor of Business Administration (BBA)', 'Department of Accounting and Information systems', 'University of Rajshahi', '3.37 out of 4.00', NULL, 1),
(4, '4', '2012-2014', NULL, 'Higher Secondary Certificate (HSC)', '', 'Gazipur Cantonment College', '5.00 out of 5.00', 'Business Studies', 1),
(5, '3', '2010-2012', NULL, 'Secondary School Certificate (SSC)', NULL, 'Rajendrapur Cantonment Public School and College', '4.88 out of 5.00', 'Business Studies', 1);

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_res` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`id`, `rank`, `period`, `address`, `job_res`, `department`, `position`, `company`, `description`, `visibility`) VALUES
(1, 4, '2021-Current', 'Vertex Prominent (1st Floor), GA-16/1 Mohakhali, Dhaka-1212, Bangladesh', 'Working as Audit Professional to enhance audit and finance knowledge.', 'Audit and Assurance', 'Audit Professional', 'Deloitte Bangladesh Ltd.', '<p><strong>[Refer to Annexure A for detailed job responsibilities]</strong></p>', 1),
(3, 2, '2019 Feb-Apr', '', 'Three months Internship titled \'General Banking Activities\' of EXIM Bank of Bangladesh Limited.', NULL, 'Intern', 'EXIM Bank Bangladesh Ltd.', 'Three months Internship titled \'General Banking Activities\' of EXIM Bank of Bangladesh Limited.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `extra_curr`
--

CREATE TABLE `extra_curr` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `period` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_res` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_curr`
--

INSERT INTO `extra_curr` (`id`, `rank`, `period`, `address`, `job_res`, `department`, `position`, `company`, `description`, `visibility`) VALUES
(2, 3, '2019-2020', NULL, 'Involved as a Research Assistant with Prof. Dr. Rukshana Begum for the research project titled \'Liquidity Management of Several Banking Corporation in Bangladesh\'.', 'Department of Accounting and Information Systems', 'Research Assistant', 'University of Rajshahi', 'Involved as a Research Assistant with Prof. Dr. Rukshana Begum for the research project titled \'Liquidity Management of Several Banking Corporation in Bangladesh\'.', 1),
(4, 1, '2017-2018', NULL, 'Worked as Director of Program Management.', NULL, 'Executive Member', 'Rajshahi University Business Club (RUBC)', 'Worked as Director of Program Management.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `funfacts`
--

CREATE TABLE `funfacts` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funfacts`
--

INSERT INTO `funfacts` (`id`, `rank`, `icon`, `title`, `value`, `description`, `visibility`) VALUES
(1, 1, 'lnr lnr-laptop-phone', 'Projects', 6, 'PHP, MySQL, JavaScript', 1),
(2, 2, 'lnr lnr-heart', 'Happy Clients', 6, 'Delighted with my Design', 1),
(3, 3, 'lnr lnr-star', 'Awards Won', 0, 'Not yet', 1),
(4, 4, 'lnr lnr-clock', 'Working Hours', 8, 'Daily', 1);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `rank`, `icon`, `title`, `description`, `visibility`) VALUES
(1, 1, 'lnr lnr-briefcase', 'Accounting Profession', 'Would like to enhance my passionate knowledge in audit and assurance.', 1),
(2, 2, 'lnr lnr-code', 'Coding', 'I am a self thought coder and I love it because it makes life easier.', 1),
(3, 3, 'lnr lnr-laptop-phone', 'Web Design & Development', 'Making the web easier to surf with Frontend Languages - JavaScript, CSS, HTML and Backend Languages - PHP, MySQL, Python (Django).', 1),
(4, 4, 'lnr lnr-camera', 'Photography', 'I love to capture a moment that\'s gone forever and impossible to reproduce.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `issuer_list`
--

CREATE TABLE `issuer_list` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issuer_list`
--

INSERT INTO `issuer_list` (`id`, `name`, `rank`, `visibility`) VALUES
(1, 'Coursera', 1, 1),
(2, 'Udemy', 2, 1),
(3, 'LinkedIn', 3, 1),
(4, 'Udacity', 4, 1),
(5, 'Google', 5, 1),
(6, 'Microsoft', 6, 1),
(7, 'IBM', 7, 1),
(8, 'Amazon', 8, 1),
(9, 'Oracle', 9, 1),
(10, 'Cisco', 10, 1),
(11, 'Red Hat', 11, 1),
(12, 'VMware', 12, 1),
(13, 'Salesforce', 13, 1),
(14, 'SAP', 14, 1),
(15, 'Dell', 15, 1),
(16, 'CompTIA', 16, 1),
(17, 'Juniper Networks', 17, 1),
(18, 'Huawei', 18, 1),
(19, 'Cloudera', 19, 1),
(20, 'MongoDB', 20, 1),
(21, 'Alibaba Cloud', 21, 1),
(22, 'Palo Alto Networks', 22, 1),
(23, 'Fortinet', 23, 1),
(24, 'Adobe', 24, 1),
(25, 'Autodesk', 25, 1),
(26, 'Unity', 26, 1),
(27, 'Splunk', 27, 1),
(28, 'Databricks', 28, 1),
(29, 'HashiCorp', 29, 1),
(30, 'SAS', 30, 1),
(31, 'Alteryx', 31, 1),
(32, 'DataCamp', 32, 1),
(33, 'DataStax', 33, 1),
(34, 'DataRobot', 34, 1),
(35, 'Dataiku', 35, 1),
(36, 'Looker', 36, 1),
(37, 'Qlik', 37, 1),
(38, 'MicroStrategy', 38, 1),
(39, 'ThoughtSpot', 39, 1),
(40, 'Tableau', 40, 1),
(41, 'Teradata', 41, 1),
(42, 'Sisense', 42, 1),
(43, 'Domo', 43, 1),
(44, 'Yellowfin', 44, 1),
(45, 'TIBCO', 45, 1),
(46, 'Informatica', 46, 1),
(47, 'Deloitte', 47, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_res`
--

CREATE TABLE `job_res` (
  `id` int(11) NOT NULL,
  `client_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audit_type` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_role` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `res_details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_type` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_res`
--

INSERT INTO `job_res` (`id`, `client_name`, `audit_type`, `task_role`, `res_details`, `client_type`, `rank`, `visibility`) VALUES
(1, 'United Finance Ltd', 'Quality Audit', 'Team Member', '                - Conducted meticulous financial and operational audits, aligning operations with banking regulations.<br>\r\n                - Utilized Python for predictive financial analysis, validating reports, and early risk identification.<br>', 'Pharmaceuticals', 1, 1),
(2, 'Epic Garments Ltd', 'Occupational Health and Safety Audit', 'Team Member', '- Ensured the integrity of financial statements and manufacturing cost reports through comprehensive audits.<br>\r\n                - Employed Excel for in-depth cost analysis, assisting in the optimal allocation of manufacturing budgets.<br><br>', 'Manufacturing', 2, 1),
(4, 'Project Audit Inc', 'Project Audit', 'Team Member', '                - Led audits, ensuring procedural and financial compliance with project and grant requirements.<br>\r\n                - Applied Python for detailed financial data analysis, offering transparent financial reporting to stakeholders.<br><br>', 'Manufacturing', 2, 1),
(5, 'IT Audit Inc', 'IT Audit', 'Team Member', '                - Spearheaded IT audits, validating tech practices, and data management against regulatory and internal guidelines.<br>\r\n                - Implemented Python for automating data analysis, enhancing audit efficiency and data reliability.<br><br>', 'Manufacturing', 2, 1),
(6, 'MetLife Insurance', 'Statutory Audit', 'Team Member', '- Conducted a detailed audit of insurance financial statements, ensuring compliance with relevant regulatory standards.<br>\r\n                - Examined risk management and policy procedures, validating the efficacy of underwriting and claims management.<br>\r\n                - Utilized Excel to scrutinize premium revenue streams and operational expenses, verifying financial stability and regulatory compliance.<br>', 'Manufacturing', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `rank`, `icon`, `title`, `description`, `visibility`) VALUES
(1, NULL, 'lnr lnr-text-size', 'Bangla', 'Fluent in Bengali (Mother tongue)', 1),
(2, NULL, 'lnr lnr-text-size', 'English', 'Good Professional Proficiency and Full Working Knowledge in English', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lnr_icon`
--

CREATE TABLE `lnr_icon` (
  `id` int(11) NOT NULL,
  `icon_code` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lnr_icon`
--

INSERT INTO `lnr_icon` (`id`, `icon_code`, `icon_name`, `visibility`) VALUES
(1, 'lnr lnr-home', 'Home', 1),
(2, 'lnr lnr-apartment', 'Apartment', 1),
(3, 'lnr lnr-pencil', 'Pencil', 1),
(4, 'lnr lnr-magic-wand', 'Magic Wand', 1),
(5, 'lnr lnr-drop', 'Drop', 1),
(6, 'lnr lnr-lighter', 'Lighter', 1),
(7, 'lnr lnr-poop', 'Poop', 1),
(8, 'lnr lnr-sun', 'Sun', 1),
(9, 'lnr lnr-moon', 'Moon', 1),
(10, 'lnr lnr-cloud', 'Cloud', 1),
(11, 'lnr lnr-cloud-upload', 'Cloud Upload', 1),
(12, 'lnr lnr-cloud-download', 'Cloud Download', 1),
(13, 'lnr lnr-cloud-sync', 'Cloud Sync', 1),
(14, 'lnr lnr-cloud-check', 'Cloud Check', 1),
(15, 'lnr lnr-database', 'Database', 1),
(16, 'lnr lnr-lock', 'Lock', 1),
(17, 'lnr lnr-cog', 'Cog', 1),
(18, 'lnr lnr-trash', 'Trash', 1),
(19, 'lnr lnr-dice', 'Dice', 1),
(20, 'lnr lnr-heart', 'Heart', 1),
(21, 'lnr lnr-star', 'Star', 1),
(22, 'lnr lnr-star-half', 'Star Half', 1),
(23, 'lnr lnr-star-empty', 'Star Empty', 1),
(24, 'lnr lnr-flag', 'Flag', 1),
(25, 'lnr lnr-envelope', 'Envelope', 1),
(26, 'lnr lnr-paperclip', 'Paperclip', 1),
(27, 'lnr lnr-inbox', 'Inbox', 1),
(28, 'lnr lnr-eye', 'Eye', 1),
(29, 'lnr lnr-printer', 'Printer', 1),
(30, 'lnr lnr-file-empty', 'File Empty', 1),
(31, 'lnr lnr-file-add', 'File Add', 1),
(32, 'lnr lnr-enter', 'Enter', 1),
(33, 'lnr lnr-exit', 'Exit', 1),
(34, 'lnr lnr-graduation-hat', 'Graduation Hat', 1),
(35, 'lnr lnr-license', 'License', 1),
(36, 'lnr lnr-music-note', 'Music Note', 1),
(37, 'lnr lnr-film-play', 'Film Play', 1),
(38, 'lnr lnr-camera-video', 'Camera Video', 1),
(39, 'lnr lnr-camera', 'Camera', 1),
(40, 'lnr lnr-picture', 'Picture', 1),
(41, 'lnr lnr-book', 'Book', 1),
(42, 'lnr lnr-bookmark', 'Bookmark', 1),
(43, 'lnr lnr-user', 'User', 1),
(44, 'lnr lnr-users', 'Users', 1),
(45, 'lnr lnr-shirt', 'Shirt', 1),
(46, 'lnr lnr-store', 'Store', 1),
(47, 'lnr lnr-cart', 'Cart', 1),
(48, 'lnr lnr-tag', 'Tag', 1),
(49, 'lnr lnr-phone-handset', 'Phone Handset', 1),
(50, 'lnr lnr-phone', 'Phone', 1),
(51, 'lnr lnr-pushpin', 'Pushpin', 1),
(52, 'lnr lnr-map-marker', 'Map Marker', 1),
(53, 'lnr lnr-map', 'Map', 1),
(54, 'lnr lnr-location', 'Location', 1),
(55, 'lnr lnr-calendar-full', 'Calendar Full', 1),
(56, 'lnr lnr-keyboard', 'Keyboard', 1),
(57, 'lnr lnr-spell-check', 'Spell Check', 1),
(58, 'lnr lnr-screen', 'Screen', 1),
(59, 'lnr lnr-smartphone', 'Smartphone', 1),
(60, 'lnr lnr-tablet', 'Tablet', 1),
(61, 'lnr lnr-laptop', 'Laptop', 1),
(62, 'lnr lnr-laptop-phone', 'Laptop Phone', 1),
(63, 'lnr lnr-power-switch', 'Power Switch', 1),
(64, 'lnr lnr-bubble', 'Bubble', 1),
(65, 'lnr lnr-heart-pulse', 'Heart Pulse', 1),
(66, 'lnr lnr-construction', 'Construction', 1),
(67, 'lnr lnr-pie-chart', 'Pie Chart', 1),
(68, 'lnr lnr-chart-bars', 'Chart Bars', 1),
(69, 'lnr lnr-gift', 'Gift', 1),
(70, 'lnr lnr-diamond', 'Diamond', 1),
(71, 'lnr lnr-linearicons', 'Linearicons', 1),
(72, 'lnr lnr-dinner', 'Dinner', 1),
(73, 'lnr lnr-coffee-cup', 'Coffee Cup', 1),
(74, 'lnr lnr-leaf', 'Leaf', 1),
(75, 'lnr lnr-paw', 'Paw', 1),
(76, 'lnr lnr-rocket', 'Rocket', 1),
(77, 'lnr lnr-briefcase', 'Briefcase', 1),
(78, 'lnr lnr-bus', 'Bus', 1),
(79, 'lnr lnr-car', 'Car', 1),
(80, 'lnr lnr-train', 'Train', 1),
(81, 'lnr lnr-bicycle', 'Bicycle', 1),
(82, 'lnr lnr-wheelchair', 'Wheelchair', 1),
(83, 'lnr lnr-select', 'Select', 1),
(84, 'lnr lnr-earth', 'Earth', 1),
(85, 'lnr lnr-smile', 'Smile', 1),
(86, 'lnr lnr-sad', 'Sad', 1),
(87, 'lnr lnr-neutral', 'Neutral', 1),
(88, 'lnr lnr-mustache', 'Mustache', 1),
(89, 'lnr lnr-alarm', 'Alarm', 1),
(90, 'lnr lnr-bullhorn', 'Bullhorn', 1),
(91, 'lnr lnr-volume-high', 'Volume High', 1),
(92, 'lnr lnr-volume-medium', 'Volume Medium', 1),
(93, 'lnr lnr-volume-low', 'Volume Low', 1),
(94, 'lnr lnr-volume', 'Volume', 1),
(95, 'lnr lnr-mic', 'Mic', 1),
(96, 'lnr lnr-hourglass', 'Hourglass', 1),
(97, 'lnr lnr-undo', 'Undo', 1),
(98, 'lnr lnr-redo', 'Redo', 1),
(99, 'lnr lnr-sync', 'Sync', 1),
(100, 'lnr lnr-history', 'History', 1),
(101, 'lnr lnr-clock', 'Clock', 1),
(102, 'lnr lnr-download', 'Download', 1),
(103, 'lnr lnr-upload', 'Upload', 1),
(104, 'lnr lnr-enter-down', 'Enter Down', 1),
(105, 'lnr lnr-exit-up', 'Exit Up', 1),
(106, 'lnr lnr-bug', 'Bug', 1),
(107, 'lnr lnr-code', 'Code', 1),
(108, 'lnr lnr-link', 'Link', 1),
(109, 'lnr lnr-unlink', 'Unlink', 1),
(110, 'lnr lnr-thumbs-up', 'Thumbs Up', 1),
(111, 'lnr lnr-thumbs-down', 'Thumbs Down', 1),
(112, 'lnr lnr-magnifier', 'Magnifier', 1),
(113, 'lnr lnr-cross', 'Cross', 1),
(114, 'lnr lnr-menu', 'Menu', 1),
(115, 'lnr lnr-list', 'List', 1),
(116, 'lnr lnr-chevron-up', 'Chevron Up', 1),
(117, 'lnr lnr-chevron-down', 'Chevron Down', 1),
(118, 'lnr lnr-chevron-left', 'Chevron Left', 1),
(119, 'lnr lnr-chevron-right', 'Chevron Right', 1),
(120, 'lnr lnr-arrow-up', 'Arrow Up', 1),
(121, 'lnr lnr-arrow-down', 'Arrow Down', 1),
(122, 'lnr lnr-arrow-left', 'Arrow Left', 1),
(123, 'lnr lnr-arrow-right', 'Arrow Right', 1),
(124, 'lnr lnr-move', 'Move', 1),
(125, 'lnr lnr-warning', 'Warning', 1),
(126, 'lnr lnr-question-circle', 'Question Circle', 1),
(127, 'lnr lnr-menu-circle', 'Menu Circle', 1),
(128, 'lnr lnr-checkmark-circle', 'Checkmark Circle', 1),
(129, 'lnr lnr-cross-circle', 'Cross Circle', 1),
(130, 'lnr lnr-plus-circle', 'Plus Circle', 1),
(131, 'lnr lnr-circle-minus', 'Circle Minus', 1),
(132, 'lnr lnr-arrow-up-circle', 'Arrow Up Circle', 1),
(133, 'lnr lnr-arrow-down-circle', 'Arrow Down Circle', 1),
(134, 'lnr lnr-arrow-left-circle', 'Arrow Left Circle', 1),
(135, 'lnr lnr-arrow-right-circle', 'Arrow Right Circle', 1),
(136, 'lnr lnr-chevron-up-circle', 'Chevron Up Circle', 1),
(137, 'lnr lnr-chevron-down-circle', 'Chevron Down Circle', 1),
(138, 'lnr lnr-chevron-left-circle', 'Chevron Left Circle', 1),
(139, 'lnr lnr-chevron-right-circle', 'Chevron Right Circle', 1),
(140, 'lnr lnr-crop', 'Crop', 1),
(141, 'lnr lnr-frame-expand', 'Frame Expand', 1),
(142, 'lnr lnr-frame-contract', 'Frame Contract', 1),
(143, 'lnr lnr-layers', 'Layers', 1),
(144, 'lnr lnr-funnel', 'Funnel', 1),
(145, 'lnr lnr-text-format', 'Text Format', 1),
(146, 'lnr lnr-text-format-remove', 'Text Format Remove', 1),
(147, 'lnr lnr-text-size', 'Text Size', 1),
(148, 'lnr lnr-bold', 'Bold', 1),
(149, 'lnr lnr-italic', 'Italic', 1),
(150, 'lnr lnr-underline', 'Underline', 1),
(151, 'lnr lnr-strikethrough', 'Strikethrough', 1),
(152, 'lnr lnr-highlight', 'Highlight', 1),
(153, 'lnr lnr-text-align-left', 'Text Align Left', 1),
(154, 'lnr lnr-text-align-center', 'Text Align Center', 1),
(155, 'lnr lnr-text-align-right', 'Text Align Right', 1),
(156, 'lnr lnr-text-align-justify', 'Text Align Justify', 1),
(157, 'lnr lnr-line-spacing', 'Line Spacing', 1),
(158, 'lnr lnr-indent-increase', 'Indent Increase', 1),
(159, 'lnr lnr-indent-decrease', 'Indent Decrease', 1),
(160, 'lnr lnr-pilcrow', 'Pilcrow', 1),
(161, 'lnr lnr-direction-ltr', 'Direction Ltr', 1),
(162, 'lnr lnr-direction-rtl', 'Direction Rtl', 1),
(163, 'lnr lnr-page-break', 'Page Break', 1),
(164, 'lnr lnr-sort-alpha-asc', 'Sort Alpha Asc', 1),
(165, 'lnr lnr-sort-amount-asc', 'Sort Amount Asc', 1),
(166, 'lnr lnr-hand', 'Hand', 1),
(167, 'lnr lnr-pointer-up', 'Pointer Up', 1),
(168, 'lnr lnr-pointer-right', 'Pointer Right', 1),
(169, 'lnr lnr-pointer-down', 'Pointer Down', 1),
(170, 'lnr lnr-pointer-left', 'Pointer Left', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_login` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_status` int(11) DEFAULT NULL,
  `picture` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `name`, `username`, `email`, `date_login`, `login_type`, `login_status`, `picture`) VALUES
(30, 'Saklayen Ahmed', 'saklayen', 'astanim.3221@gmail.com', '2023-12-20 21:51:01', 'google', 1, 'https://lh3.googleusercontent.com/a/ACg8ocL6xWhMuk8EKqsDEZC6KUx2yCBtAcPbu6wwOXGXIDW32w=s96-c'),
(31, 'Saklayen', 'saklayen', 'astanim.3221@gmail.com', '2023-12-20 21:51:46', 'main', 1, ''),
(32, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:35:04', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(33, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:35:17', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(34, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:39:00', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(35, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:39:37', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(36, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:42:58', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(37, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:43:47', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(38, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:44:03', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(39, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:45:03', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(40, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:46:05', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(41, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:46:49', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(42, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:55:42', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(43, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:59:17', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(44, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-21 23:59:26', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(45, 'Saklayen Ahmed', 'saklayen', 'astanim.3221@gmail.com', '2023-12-21 23:59:42', 'google', 1, 'https://lh3.googleusercontent.com/a/ACg8ocL6xWhMuk8EKqsDEZC6KUx2yCBtAcPbu6wwOXGXIDW32w=s96-c'),
(46, 'Saklayen Ahmed', '', 'saklayen.3221@gmail.com', '2023-12-22 00:00:08', 'google', 0, 'https://lh3.googleusercontent.com/a/ACg8ocL4ruiIXMmQ3Xc0-Dgn380t7C9XW-DAYNIWjmehtKt1vg=s96-c'),
(47, 'Saklayen Ahmed', 'saklayen', 'astanim.3221@gmail.com', '2023-12-22 00:00:14', 'google', 1, 'https://lh3.googleusercontent.com/a/ACg8ocL6xWhMuk8EKqsDEZC6KUx2yCBtAcPbu6wwOXGXIDW32w=s96-c'),
(48, 'Saklayen Ahmed', 'saklayen', 'astanim.3221@gmail.com', '2023-12-28 12:12:45', 'google', 1, 'https://lh3.googleusercontent.com/a/ACg8ocL6xWhMuk8EKqsDEZC6KUx2yCBtAcPbu6wwOXGXIDW32w=s96-c');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_ext` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_added` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_category`, `file_url`, `file_text`, `file_type`, `file_size`, `file_ext`, `date_added`, `visibility`) VALUES
(14, '2e28a9a1cb5594d89e9328c8f9f428c4.pdf', 'profile', 'http://localhost:8080/saklayen/assets/img/2e28a9a1cb5594d89e9328c8f9f428c4.pdf', 'SAP S4HANA Certificates', 'application/pdf', '221806', 'pdf', '2023-08-24 23:29:27', 1),
(15, 'd1e7dd507a633465f9a128ac5aeb4474.jpg', 'profile', 'http://localhost:8080/saklayen/assets/img/d1e7dd507a633465f9a128ac5aeb4474.jpg', 'My Profile Photo', 'image/jpeg', '82517', 'jpg', '2023-08-25 00:56:49', 1),
(17, 'f16bab25a8ab255afed2686e5496fb52.png', 'portfolio', 'http://localhost:8080/saklayen/assets/img/f16bab25a8ab255afed2686e5496fb52.png', 'NMC logo', 'image/png', '212240', 'png', '2023-08-25 16:17:17', 1),
(18, 'pro.png', 'profile', 'http://localhost:8080/saklayen/assets/img/f16bab25a8ab255afed2686e5496fb52.png', 'Pro Img', 'image/png', '212240', 'png', '2023-08-25 16:17:17', 1),
(19, 'bc0ebb2d7c2ff21541ba266e09487216.jpg', 'profile', 'http://localhost:8080/saklayen/assets/img/bc0ebb2d7c2ff21541ba266e09487216.jpg', 'My Formal Img', 'image/jpeg', '200675', 'jpg', '2023-09-20 19:43:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `my_tags`
--

CREATE TABLE `my_tags` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `tag_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_tags`
--

INSERT INTO `my_tags` (`id`, `rank`, `tag_name`, `tag_description`, `visibility`) VALUES
(1, 1, 'Software Developer', 'Software Developer', 1),
(2, 3, 'Tech Enthusiast', NULL, 1),
(3, 2, 'Audit Professional', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personalinfo`
--

CREATE TABLE `personalinfo` (
  `id` int(11) NOT NULL,
  `shutdown` int(11) NOT NULL,
  `per_web` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv_pass` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv_download` int(11) DEFAULT NULL,
  `expiry_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_thumbnail` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_obj` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `present_address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personalinfo`
--

INSERT INTO `personalinfo` (`id`, `shutdown`, `per_web`, `cv_pass`, `cv_download`, `expiry_date`, `birthday`, `photo`, `photo_thumbnail`, `father_name`, `mother_name`, `gender`, `name`, `marital`, `car_obj`, `nationality`, `permanent_address`, `present_address`, `religion`, `email`, `mobile`, `linkedin_profile`, `tag`, `visibility`) VALUES
(1, 0, 'https://saklayen.cf', 'saklayen8989', 1, '2023-11-29 23:45:00', '25 April, 1997', 'bc0ebb2d7c2ff21541ba266e09487216.jpg', NULL, 'Taz Uddin Ahmed', 'Manwara Begum', 'Male', 'Saklayen Ahmed', 'Single', 'Experienced Audit and Assurance Professional with a deep understanding of External Audit, Account Reconciliation, and diverse industry exposure, including Financial Institutions and Manufacturing. Advanced technical acumen with proficiency in Python, Microsoft Azure, and data analytics tools. A proud alumnus of the University of Rajshahi with degrees in Accounting and Information Systems. Seeking to leverage my audit expertise and technological skills to drive excellence and innovation in a forward-thinking organization.', 'Bangladeshi', 'Village: Kewa Pashchim Khanda; Post: Mowna; Post Code: 1740; Upazilla: Sreepur; District: Gazipur.', 'Village: Kewa Pashchim Khanda; Post: Mowna; Post Code: 1740; Upazilla: Sreepur; District: Gazipur.', 'Islam', 'saklayen.3221@gmail.com', '+8801727-268458', '[\"https://www.github.com/saklayenahmed/\",\"https://www.linkedin.com/in/saklayen\"]', '[\"Software Developer\",\"Tech Enthusiast\",\"Audit Professional\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageLink` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `rank`, `name`, `category`, `link`, `imageLink`, `visibility`) VALUES
(1, 1, 'Nayan Mia & Co. (NMC)', 'website', 'https://nmc.com.bd', 'nmc01.png', 1),
(2, NULL, 'RUAAA Database - RU', 'website', 'https://ruaaa.org/member', 'ruaaa.jpg', 1),
(3, NULL, 'AIS Family - RU', 'website', 'https://aisfamily.cf', 'ais.png', 1),
(4, NULL, 'ইচ্ছে eCommerce', 'website', 'https://icche.cf', 'icche.png', 1),
(5, NULL, 'ইচ্ছে Blog', 'website', 'https://aamaricche.blogspot.com/', 'icche.png', 1),
(6, NULL, 'ইচ্ছে Question Bank (MCQ)', 'website', 'https://studywiki.cf', 'icche.png', 1),
(7, NULL, 'ইচ্ছে Online Exam (MCQ)', 'website', 'https://exam.studywiki.cf', 'icche.png', 1),
(8, NULL, 'ইচ্ছে Excel Learning', 'mobile_app', 'https://github.com/tanim3221/Excel/raw/master/app/release/app-release.apk', 'excel.png', 1),
(9, NULL, 'ইচ্ছে Newspaper', 'mobile_app', 'https://github.com/tanim3221/IccheNewspaper/raw/master/app/release/app-release.apk', 'news.png', 1),
(10, NULL, 'ইচ্ছে নামাজ শিক্ষা', 'mobile_app', 'https://github.com/tanim3221/NamazApp/raw/master/app/release/app-release.apk', 'namaz.png', 1),
(11, 4, 'ইচ্ছে Online Exam (MCQ)', 'mobile_app', 'https://github.com/tanim3221/IccheExam/raw/master/app/release/app-release.apk', 'exam.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_filter`
--

CREATE TABLE `portfolio_filter` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolio_filter`
--

INSERT INTO `portfolio_filter` (`id`, `rank`, `category`, `text`, `visibility`) VALUES
(2, 1, 'website', 'Website Development', 1),
(3, 3, 'Mobile_App', 'Mobile App', 0),
(4, NULL, 'desktop_app', 'Desktop App Development', 1),
(5, 4, 'python_data_science', 'Python Data Science', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reference_cv`
--

CREATE TABLE `reference_cv` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_cv`
--

INSERT INTO `reference_cv` (`id`, `rank`, `name`, `institution`, `position`, `department`, `address`, `mobile`, `email`, `visibility`) VALUES
(1, 2, 'Md. Nayan Mia FCA', 'Nayan Mia & Co., (NMC) Chartered Accountants', 'CEO & Proprietor<br>(Ex-Senior Manager, Deloitte)', 'Audit and Assurance', 'Lily Pond Center (Level-8), Motijheel, Dhaka-1203 ', '+8801911950634', 'nayan@nmc.com.bd', 1),
(2, 1, 'Dr. Md. Sayaduzzaman', 'University of Rajshahi', 'Professor ', 'Accounting and Information Systems', 'Department of Accounting and Information Systems, University of Rajshahi, Rajshahi- 6205.', '+8801912827857', 'milons66@yahoo.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `rank`, `icon`, `title`, `description`, `visibility`) VALUES
(1, 1, 'lnr lnr-laptop-phone', 'Software Development', 'Experienced in Python, Dart, PHP and some other frameworks.', 1),
(2, 2, 'lnr lnr-briefcase', 'Audit and Assurance', 'Working in Audit and Assurance Department at Deloitte Bangladesh as Audit Professional.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `cat_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `rank`, `cat_id`, `category`, `skill`, `level`, `visibility`) VALUES
(1, NULL, NULL, 'finance_accounting', 'Statutory Audit', NULL, 1),
(2, NULL, NULL, 'finance_accounting', 'Investigation Audit', NULL, 1),
(3, NULL, NULL, 'finance_accounting', 'Financial Reporting', NULL, 1),
(4, NULL, NULL, 'finance_accounting', 'VAT & TAX', NULL, 1),
(5, NULL, NULL, 'finance_accounting', 'IFRS & ISAs', NULL, 1),
(6, NULL, NULL, 'finance_accounting', 'Financial Accounting', NULL, 1),
(7, 10, NULL, 'coding', 'Python', 'Intermediate', 1),
(8, NULL, NULL, 'coding', 'PHP', 'Advanced', 1),
(9, NULL, NULL, 'coding', 'SQL', 'Intermediate', 1),
(10, NULL, NULL, 'coding', 'HTML & CSS', 'Advanced', 1),
(11, NULL, NULL, 'coding', 'JavaScript & Jquery', 'Advanced', 1),
(12, 15, NULL, 'coding', 'ReactJS', 'Intermediate', 1),
(13, NULL, NULL, 'coding', 'NodeJS', 'Beginner', 1),
(14, NULL, NULL, 'coding', 'Java', 'Beginner', 1),
(15, NULL, '1', 'technology', 'SAP S/4HANA Finance', NULL, 1),
(16, NULL, '1', 'technology', 'Microsoft Office & Excel VBA', NULL, 1),
(17, NULL, '1', 'technology', 'SPSS Analysis', NULL, 1),
(18, NULL, '2', 'technology', 'Python Data Analysis', NULL, 1),
(19, NULL, '3', 'technology', 'Microsoft SQL Server', NULL, 1),
(20, NULL, '3', 'technology', 'Microsoft Azure', NULL, 1),
(21, NULL, '3', 'technology', 'PostgreSQL', NULL, 1),
(22, NULL, '4', 'technology', 'Microsoft Power BI', NULL, 1),
(23, NULL, '2', 'technology', 'Software Development', NULL, 1),
(24, NULL, '4', 'technology', 'Social Networking', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `rank`, `link`, `name`, `icon`, `visibility`) VALUES
(1, 1, 'https://www.linkedin.com/in/saklayen', 'LinkedIn', 'fab fa-linkedin', 1),
(2, 2, 'https://www.github.com/saklayenahmed/', 'GitHub', 'fab fa-github', 1);

-- --------------------------------------------------------

--
-- Table structure for table `token_log`
--

CREATE TABLE `token_log` (
  `id` int(11) NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token_log`
--

INSERT INTO `token_log` (`id`, `token`, `token_date`, `visibility`) VALUES
(9795, '6998c08945ec51368c87e815797fb1b2', '2023-10-19 20:32:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `login_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photo`, `password`, `name`, `email`, `status`, `login_token`, `token_number`, `last_login`, `visibility`) VALUES
(1, 'saklayen', 'd1e7dd507a633465f9a128ac5aeb4474.jpg', '$2y$10$MtD6lD14Ozcyjp/is2Foi.0TkObKZtNERNGdhqQ6YkJ6TEempE7tS', 'Saklayen', 'astanim.3221@gmail.com', 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImFzdGFuaW0uMzIyMUBnbWFpbC5jb20ifQ.XRfA2y0ZYOba3stIz3LkRMzRUbh9mbxsL8hL7Fw8qMk', '63321', '2023-12-28 12:12:45', 1),
(2, 'tanim', 'pro.png', '$2y$10$MtD6lD14Ozcyjp/is2Foi.0TkObKZtNERNGdhqQ6YkJ6TEempE7tS', 'Tanim Ahmed', 'astanim.3221@outlook.com', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isp` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regionName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `combined_array` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `ip`, `isp`, `timezone`, `visit_time`, `city`, `country`, `language`, `zip`, `regionName`, `lat`, `lon`, `agent`, `visit_date`, `combined_array`, `visibility`) VALUES
(83, '119.30.41.157', 'Grameenphone Limited', 'Bangladesh Standard Time', '2023-10-24 13:07:51', 'Sylhet', 'Bangladesh', 'Bangla', '3107', 'Sylhet', '24.89667', '91.87173', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36 Edg/118.0.2088.61', '2023-10-24', '{\"ip\":\"119.30.41.157\",\"type\":\"IPv4\",\"hostname\":null,\"carrier\":{\"name\":\"GrameenPhone\",\"mcc\":\"470\",\"mnc\":\"1\"},\"company\":{\"domain\":\"grameenphone.com\",\"name\":\"Grameenphone Limited\",\"type\":\"isp\"},\"connection\":{\"asn\":24389,\"domain\":\"grameenphone.com\",\"organization\":\"Grameenphone Limited\",\"route\":\"119.30.41.0\\/24\",\"type\":\"isp\"},\"currency\":{\"code\":\"BDT\",\"name\":\"Bangladeshi Taka\",\"name_native\":\"বাংলাদেশী টাকা\",\"plural\":\"Bangladeshi takas\",\"plural_native\":\"বাংলাদেশী টাকা\",\"symbol\":\"BDT\",\"symbol_native\":\"৳\",\"format\":{\"negative\":{\"prefix\":\"-\",\"suffix\":\"৳\"},\"positive\":{\"prefix\":\"\",\"suffix\":\"৳\"}}},\"location\":{\"continent\":{\"code\":\"AS\",\"name\":\"Asia\"},\"country\":{\"area\":144000,\"borders\":[\"IN\",\"MM\"],\"calling_code\":\"880\",\"capital\":\"Dhaka\",\"code\":\"BD\",\"name\":\"Bangladesh\",\"population\":171186372,\"population_density\":1188.79,\"flag\":{\"emoji\":\"🇧🇩\",\"emoji_unicode\":\"U+1F1E7 U+1F1E9\",\"emojitwo\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/emojitwo\\/bd.svg\",\"noto\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/noto\\/bd.png\",\"twemoji\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/twemoji\\/bd.svg\",\"wikimedia\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/wikimedia\\/bd.svg\"},\"languages\":[{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},{\"code\":\"en\",\"name\":\"English\",\"native\":\"English\"}],\"tld\":\".bd\"},\"region\":{\"code\":\"BD-G\",\"name\":\"Sylhet\"},\"city\":\"Sylhet\",\"postal\":\"3107\",\"latitude\":24.89667,\"longitude\":91.87173,\"language\":{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},\"in_eu\":false},\"security\":{\"is_abuser\":false,\"is_attacker\":false,\"is_bogon\":false,\"is_cloud_provider\":false,\"is_proxy\":false,\"is_relay\":false,\"is_tor\":false,\"is_tor_exit\":false,\"is_vpn\":false,\"is_anonymous\":false,\"is_threat\":false},\"time_zone\":{\"id\":\"Asia\\/Dhaka\",\"abbreviation\":\"BDT\",\"current_time\":\"2023-10-24T13:07:54+06:00\",\"name\":\"Bangladesh Standard Time\",\"offset\":21600,\"in_daylight_saving\":false},\"user_agent\":{\"header\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/118.0.0.0 Safari\\/537.36 Edg\\/118.0.2088.61\",\"name\":\"Edge\",\"type\":\"browser\",\"version\":\"118\",\"version_major\":\"118\",\"device\":{\"brand\":null,\"name\":\"Desktop\",\"type\":\"desktop\"},\"engine\":{\"name\":\"Blink\",\"type\":\"browser\",\"version\":\"118\",\"version_major\":\"118\"},\"os\":{\"name\":\"Windows NT\",\"type\":\"desktop\",\"version\":\">=10\"}}}', 0),
(84, '103.58.73.36', 'Business Network', 'Bangladesh Standard Time', '2024-01-16 00:01:06', 'Dhaka', 'Bangladesh', 'Bangla', '1000', 'Dhaka', '23.71045', '90.40709', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '2024-01-16', '{\"ip\":\"103.58.73.36\",\"type\":\"IPv4\",\"hostname\":null,\"carrier\":{\"name\":null,\"mcc\":null,\"mnc\":null},\"company\":{\"domain\":\"bnet-bd.com\",\"name\":\"Business Network\",\"type\":\"isp\"},\"connection\":{\"asn\":134204,\"domain\":\"bnet-bd.com\",\"organization\":\"Business Network\",\"route\":\"103.58.73.0\\/24\",\"type\":\"isp\"},\"currency\":{\"code\":\"BDT\",\"name\":\"Bangladeshi Taka\",\"name_native\":\"বাংলাদেশী টাকা\",\"plural\":\"Bangladeshi takas\",\"plural_native\":\"বাংলাদেশী টাকা\",\"symbol\":\"BDT\",\"symbol_native\":\"৳\",\"format\":{\"negative\":{\"prefix\":\"-\",\"suffix\":\"৳\"},\"positive\":{\"prefix\":\"\",\"suffix\":\"৳\"}}},\"location\":{\"continent\":{\"code\":\"AS\",\"name\":\"Asia\"},\"country\":{\"area\":144000,\"borders\":[\"IN\",\"MM\"],\"calling_code\":\"880\",\"capital\":\"Dhaka\",\"code\":\"BD\",\"name\":\"Bangladesh\",\"population\":171186372,\"population_density\":1188.79,\"flag\":{\"emoji\":\"🇧🇩\",\"emoji_unicode\":\"U+1F1E7 U+1F1E9\",\"emojitwo\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/emojitwo\\/bd.svg\",\"noto\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/noto\\/bd.png\",\"twemoji\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/twemoji\\/bd.svg\",\"wikimedia\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/wikimedia\\/bd.svg\"},\"languages\":[{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},{\"code\":\"en\",\"name\":\"English\",\"native\":\"English\"}],\"tld\":\".bd\"},\"region\":{\"code\":\"BD-C\",\"name\":\"Dhaka\"},\"city\":\"Dhaka\",\"postal\":\"1000\",\"latitude\":23.71045,\"longitude\":90.40709,\"language\":{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},\"in_eu\":false},\"security\":{\"is_abuser\":false,\"is_attacker\":false,\"is_bogon\":false,\"is_cloud_provider\":false,\"is_proxy\":false,\"is_relay\":false,\"is_tor\":false,\"is_tor_exit\":false,\"is_vpn\":false,\"is_anonymous\":false,\"is_threat\":false},\"time_zone\":{\"id\":\"Asia\\/Dhaka\",\"abbreviation\":\"BDT\",\"current_time\":\"2024-01-16T00:01:08+06:00\",\"name\":\"Bangladesh Standard Time\",\"offset\":21600,\"in_daylight_saving\":false},\"user_agent\":{\"header\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Edg\\/120.0.0.0\",\"name\":\"Edge\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\",\"device\":{\"brand\":null,\"name\":\"Desktop\",\"type\":\"desktop\"},\"engine\":{\"name\":\"Blink\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\"},\"os\":{\"name\":\"Windows NT\",\"type\":\"desktop\",\"version\":\">=10\"}}}', 0),
(85, '103.189.246.27', 'Minju Online', 'Bangladesh Standard Time', '2024-01-19 16:49:38', 'Dhaka', 'Bangladesh', 'Bangla', '1000', 'Dhaka', '23.72726', '90.4093', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '2024-01-19', '{\"ip\":\"103.189.246.27\",\"type\":\"IPv4\",\"hostname\":null,\"carrier\":{\"name\":null,\"mcc\":null,\"mnc\":null},\"company\":{\"domain\":\"minjuonline.com\",\"name\":\"Minju Online\",\"type\":\"isp\"},\"connection\":{\"asn\":149983,\"domain\":\"minjuonline.com\",\"organization\":\"Minju Online\",\"route\":\"103.189.246.0\\/24\",\"type\":\"business\"},\"currency\":{\"code\":\"BDT\",\"name\":\"Bangladeshi Taka\",\"name_native\":\"বাংলাদেশী টাকা\",\"plural\":\"Bangladeshi takas\",\"plural_native\":\"বাংলাদেশী টাকা\",\"symbol\":\"BDT\",\"symbol_native\":\"৳\",\"format\":{\"negative\":{\"prefix\":\"-\",\"suffix\":\"৳\"},\"positive\":{\"prefix\":\"\",\"suffix\":\"৳\"}}},\"location\":{\"continent\":{\"code\":\"AS\",\"name\":\"Asia\"},\"country\":{\"area\":144000,\"borders\":[\"IN\",\"MM\"],\"calling_code\":\"880\",\"capital\":\"Dhaka\",\"code\":\"BD\",\"name\":\"Bangladesh\",\"population\":171186372,\"population_density\":1188.79,\"flag\":{\"emoji\":\"🇧🇩\",\"emoji_unicode\":\"U+1F1E7 U+1F1E9\",\"emojitwo\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/emojitwo\\/bd.svg\",\"noto\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/noto\\/bd.png\",\"twemoji\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/twemoji\\/bd.svg\",\"wikimedia\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/wikimedia\\/bd.svg\"},\"languages\":[{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},{\"code\":\"en\",\"name\":\"English\",\"native\":\"English\"}],\"tld\":\".bd\"},\"region\":{\"code\":\"BD-C\",\"name\":\"Dhaka\"},\"city\":\"Dhaka\",\"postal\":\"1000\",\"latitude\":23.72726,\"longitude\":90.4093,\"language\":{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},\"in_eu\":false},\"security\":{\"is_abuser\":false,\"is_attacker\":false,\"is_bogon\":false,\"is_cloud_provider\":false,\"is_proxy\":false,\"is_relay\":false,\"is_tor\":false,\"is_tor_exit\":false,\"is_vpn\":true,\"is_anonymous\":true,\"is_threat\":false},\"time_zone\":{\"id\":\"Asia\\/Dhaka\",\"abbreviation\":\"BDT\",\"current_time\":\"2024-01-19T16:49:42+06:00\",\"name\":\"Bangladesh Standard Time\",\"offset\":21600,\"in_daylight_saving\":false},\"user_agent\":{\"header\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Edg\\/120.0.0.0\",\"name\":\"Edge\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\",\"device\":{\"brand\":null,\"name\":\"Desktop\",\"type\":\"desktop\"},\"engine\":{\"name\":\"Blink\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\"},\"os\":{\"name\":\"Windows NT\",\"type\":\"desktop\",\"version\":\">=10\"}}}', 0),
(86, '103.189.246.27', 'Minju Online', 'Bangladesh Standard Time', '2024-01-19 18:17:24', 'Dhaka', 'Bangladesh', 'Bangla', '1000', 'Dhaka', '23.72726', '90.4093', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0', '2024-01-19', '{\"ip\":\"103.189.246.27\",\"type\":\"IPv4\",\"hostname\":null,\"carrier\":{\"name\":null,\"mcc\":null,\"mnc\":null},\"company\":{\"domain\":\"minjuonline.com\",\"name\":\"Minju Online\",\"type\":\"isp\"},\"connection\":{\"asn\":149983,\"domain\":\"minjuonline.com\",\"organization\":\"Minju Online\",\"route\":\"103.189.246.0\\/24\",\"type\":\"business\"},\"currency\":{\"code\":\"BDT\",\"name\":\"Bangladeshi Taka\",\"name_native\":\"বাংলাদেশী টাকা\",\"plural\":\"Bangladeshi takas\",\"plural_native\":\"বাংলাদেশী টাকা\",\"symbol\":\"BDT\",\"symbol_native\":\"৳\",\"format\":{\"negative\":{\"prefix\":\"-\",\"suffix\":\"৳\"},\"positive\":{\"prefix\":\"\",\"suffix\":\"৳\"}}},\"location\":{\"continent\":{\"code\":\"AS\",\"name\":\"Asia\"},\"country\":{\"area\":144000,\"borders\":[\"IN\",\"MM\"],\"calling_code\":\"880\",\"capital\":\"Dhaka\",\"code\":\"BD\",\"name\":\"Bangladesh\",\"population\":171186372,\"population_density\":1188.79,\"flag\":{\"emoji\":\"🇧🇩\",\"emoji_unicode\":\"U+1F1E7 U+1F1E9\",\"emojitwo\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/emojitwo\\/bd.svg\",\"noto\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/noto\\/bd.png\",\"twemoji\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/twemoji\\/bd.svg\",\"wikimedia\":\"https:\\/\\/cdn.ipregistry.co\\/flags\\/wikimedia\\/bd.svg\"},\"languages\":[{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},{\"code\":\"en\",\"name\":\"English\",\"native\":\"English\"}],\"tld\":\".bd\"},\"region\":{\"code\":\"BD-C\",\"name\":\"Dhaka\"},\"city\":\"Dhaka\",\"postal\":\"1000\",\"latitude\":23.72726,\"longitude\":90.4093,\"language\":{\"code\":\"bn\",\"name\":\"Bangla\",\"native\":\"বাংলা\"},\"in_eu\":false},\"security\":{\"is_abuser\":false,\"is_attacker\":false,\"is_bogon\":false,\"is_cloud_provider\":false,\"is_proxy\":false,\"is_relay\":false,\"is_tor\":false,\"is_tor_exit\":false,\"is_vpn\":true,\"is_anonymous\":true,\"is_threat\":false},\"time_zone\":{\"id\":\"Asia\\/Dhaka\",\"abbreviation\":\"BDT\",\"current_time\":\"2024-01-19T18:17:28+06:00\",\"name\":\"Bangladesh Standard Time\",\"offset\":21600,\"in_daylight_saving\":false},\"user_agent\":{\"header\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/120.0.0.0 Safari\\/537.36 Edg\\/120.0.0.0\",\"name\":\"Edge\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\",\"device\":{\"brand\":null,\"name\":\"Desktop\",\"type\":\"desktop\"},\"engine\":{\"name\":\"Blink\",\"type\":\"browser\",\"version\":\"120\",\"version_major\":\"120\"},\"os\":{\"name\":\"Windows NT\",\"type\":\"desktop\",\"version\":\">=10\"}}}', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aboutme`
--
ALTER TABLE `aboutme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_type`
--
ALTER TABLE `audit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_filter`
--
ALTER TABLE `blog_filter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_types`
--
ALTER TABLE `client_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extra_curr`
--
ALTER TABLE `extra_curr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funfacts`
--
ALTER TABLE `funfacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issuer_list`
--
ALTER TABLE `issuer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_res`
--
ALTER TABLE `job_res`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lnr_icon`
--
ALTER TABLE `lnr_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_tags`
--
ALTER TABLE `my_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalinfo`
--
ALTER TABLE `personalinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio_filter`
--
ALTER TABLE `portfolio_filter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reference_cv`
--
ALTER TABLE `reference_cv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_log`
--
ALTER TABLE `token_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aboutme`
--
ALTER TABLE `aboutme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `audit_type`
--
ALTER TABLE `audit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_filter`
--
ALTER TABLE `blog_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extra_curr`
--
ALTER TABLE `extra_curr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `funfacts`
--
ALTER TABLE `funfacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `issuer_list`
--
ALTER TABLE `issuer_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `job_res`
--
ALTER TABLE `job_res`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lnr_icon`
--
ALTER TABLE `lnr_icon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `my_tags`
--
ALTER TABLE `my_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personalinfo`
--
ALTER TABLE `personalinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `portfolio_filter`
--
ALTER TABLE `portfolio_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reference_cv`
--
ALTER TABLE `reference_cv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `token_log`
--
ALTER TABLE `token_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9796;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
