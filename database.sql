-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2026 at 03:18 PM
-- Server version: 10.11.18-MariaDB
-- PHP Version: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database name`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'super_admin',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'ThyNobles', 'aondonakato@gmail.com', '$2y$12$KpfJ66yR1kivoeTgjE4ql.fh6FvCHgTryV1isOVe82lI2LCznx/jG', 'super_admin', '2025-12-24 14:25:25');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `user_id`, `message`, `created_at`) VALUES
(1, 3, 'Hello!', '2025-12-24 21:15:32'),
(2, 4, 'Great!', '2025-12-24 21:15:51'),
(3, 3, 'Nice!', '2025-12-24 21:29:09'),
(4, 3, 'Secured innit!', '2025-12-24 22:19:58'),
(5, 4, 'Testing!', '2026-02-10 11:07:22');
-- Messaging not end to end encrypted
-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(11) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `nickname`, `amount`, `status`, `reference`, `created_at`) VALUES
(1, 'Thy Nobles', 500, 'success', '437218836', '2025-07-24 14:03:39'),

-- --------------------------------------------------------

--
-- Table structure for table `donation_items`
--

CREATE TABLE `donation_items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `target_amount` decimal(15,2) NOT NULL,
  `raised_amount` decimal(15,2) DEFAULT 0.00,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('active','completed') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL,
  `color` varchar(20) DEFAULT '#1e40af',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `flyer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_event`, `end_event`, `color`, `created_at`, `flyer`) VALUES
(1, 'New Year Day', '2026-01-01 01:00:00', '2026-01-01 22:00:00', '#16a34a', '2025-12-24 19:35:53', NULL),
(2, 'Sports Team Trial', '2026-02-04 09:00:00', '2026-02-27 10:00:00', '#9333ea', '2025-12-26 21:09:47', '1766783387_694ef99b390d1.png');

-- --------------------------------------------------------

--
-- Table structure for table `excos`
--

CREATE TABLE `excos` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `admin_year` varchar(20) NOT NULL,
  `bio` text DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `excos`
--

INSERT INTO `excos` (`id`, `fullname`, `position`, `admin_year`, `bio`, `image`, `created_at`) VALUES
(2, 'Comr. Tester', 'President', '2025/2026', '', '17667e.jpg', '2025-12-26 11:38:59'),

-- --------------------------------------------------------

--
-- Table structure for table `fixtures`
--

CREATE TABLE `fixtures` (
  `id` int(11) NOT NULL,
  `team_a` varchar(100) NOT NULL,
  `team_b` varchar(100) NOT NULL,
  `match_date` datetime NOT NULL,
  `score_a` int(11) DEFAULT 0,
  `score_b` int(11) DEFAULT 0,
  `status` enum('Upcoming','Live','Ended') DEFAULT 'Upcoming',
  `sport_type` varchar(50) DEFAULT 'Football',
  `logo_a` varchar(255) DEFAULT NULL,
  `logo_b` varchar(255) DEFAULT NULL,
  `category` enum('Intra-Departmental','Inter-Departmental') DEFAULT 'Intra-Departmental'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fixtures`
--

INSERT INTO `fixtures` (`id`, `team_a`, `team_b`, `match_date`, `score_a`, `score_b`, `status`, `sport_type`, `logo_a`, `logo_b`, `category`) VALUES
(1, 'English Dept', 'Law Dept', '2025-12-10 16:00:00', 3, 1, 'Ended', 'Football', '1766768444_logo_a_OgqF1eUc_400x400.jpg', '1766768444_logo_b_lol.jfif', 'Inter-Departmental'),
(2, 'Level 100', 'Level 400', '2025-12-12 14:00:00', 1, 4, 'Ended', 'Basketball', '', '', 'Intra-Departmental'),
(3, '100L', '200L', '2026-01-08 10:00:00', 0, 0, 'Upcoming', 'Chess', '', '', 'Intra-Departmental');

-- --------------------------------------------------------

--
-- Table structure for table `library_files`
--

CREATE TABLE `library_files` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opinions`
--

CREATE TABLE `opinions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT 'Anonymous',
  `email` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `opinions`
--

INSERT INTO `opinions` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Tester', 'tester@test.com', 'Test 1', '2025-12-27 01:32:31'),
-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `payment_type_id`, `amount_paid`, `reference`, `status`, `payment_date`) VALUES
(1, 3, 2, 200.00, 'PAY-694c42645374d', 'success', '2025-12-24 19:43:32'),
(2, 3, 1, 5000.00, 'PAY-694c5b83efce2', 'success', '2025-12-24 21:30:43'),
(3, 4, 3, 10000.00, 'PAY-698b0c0a15c56', 'success', '2026-02-10 10:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `payment_types`
--

CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_types`
--

INSERT INTO `payment_types` (`id`, `title`, `amount`, `description`, `created_at`) VALUES
(1, 'Christmas Party', 5000.00, 'For the Christmas Party', '2025-12-24 19:42:39'),
(2, 'Game Registration', 200.00, 'For the game tickets', '2025-12-24 19:43:08'),
(3, 'March 14th', 10000.00, 'Birthday Party', '2026-02-10 10:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('active','closed','upcoming') DEFAULT 'upcoming',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `type` enum('poll','election') DEFAULT 'poll'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `title`, `description`, `start_date`, `end_date`, `status`, `created_at`, `type`) VALUES
(3, 'Who should be President', 'Vote your President', '2025-12-26 23:38:00', '2025-12-26 23:42:00', 'upcoming', '2025-12-26 22:36:45', 'election'),

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `poll_id`, `name`, `image_url`, `image`) VALUES
(5, 3, 'Thy Nobles', NULL, '1766788605_cand_0.jpg'),

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `user_ip` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poll_votes`
--

INSERT INTO `poll_votes` (`id`, `poll_id`, `user_id`, `option_id`, `user_ip`, `created_at`) VALUES
(1, 3, 3, 5, '', '2025-12-26 22:39:01'),
(2, 4, 3, 7, '', '2025-12-26 23:48:43'),
(3, 4, 4, 7, '', '2025-12-26 23:49:17'),
(4, 5, 3, 11, '', '2025-12-26 23:50:45'),
(5, 5, 4, 10, '', '2025-12-26 23:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `contributor` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT current_timestamp(),
  `is_downloadable` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `contributor`, `title`, `department`, `course`, `filename`, `uploaded_at`, `is_downloadable`) VALUES
(1, 'Thy Nobles', 'EPS Past Questions', 'English', 'ENT211 Entrepreneurship and Innovation', '1753964989_EPS201PASTQUESTIONS2.pdf', '2025-07-31 12:29:49', 1),

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `name`) VALUES
(2, 'Basketball'),
(5, 'Chess'),
(1, 'Football'),
(3, 'Volleyball');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `type` enum('deposit','payment') NOT NULL,
  `status` enum('pending','success','failed') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `reference`, `amount`, `type`, `status`, `created_at`) VALUES
(1, 3, '678898993', 1020.00, 'deposit', 'success', '2025-12-24 19:18:21'),

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('student','editor','admin') DEFAULT 'student',
  `status` enum('pending','approved','suspended') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `verify_code` varchar(10) DEFAULT NULL,
  `verify_expiry` datetime DEFAULT NULL,
  `resend_count` int(11) DEFAULT 0,
  `resend_lockout` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `role`, `status`, `created_at`, `verify_code`, `verify_expiry`, `resend_count`, `resend_lockout`) VALUES
(3, 'Tester', 'tester@test.com', '$2y$10$nQ1a7tGZesoDNORNmvaOv.hEnl8xOcD28moFtKWBCOkfRNEsCeCwW', NULL, 'student', 'suspended', '2025-12-24 16:49:37', NULL, NULL, 0, NULL),

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` decimal(15,2) DEFAULT 0.00,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `updated_at`) VALUES
(1, 3, 28460.00, '2025-12-25 06:21:05'),
(2, 4, 194510.00, '2026-02-10 10:44:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- Indexes for table `donation_items`
--
ALTER TABLE `donation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `excos`
--
ALTER TABLE `excos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixtures`
--
ALTER TABLE `fixtures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_files`
--
ALTER TABLE `library_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opinions`
--
ALTER TABLE `opinions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_types`
--
ALTER TABLE `payment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_id` (`poll_id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `donation_items`
--
ALTER TABLE `donation_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `excos`
--
ALTER TABLE `excos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fixtures`
--
ALTER TABLE `fixtures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `library_files`
--
ALTER TABLE `library_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `opinions`
--
ALTER TABLE `opinions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_types`
--
ALTER TABLE `payment_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
