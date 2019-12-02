-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 02, 2019 at 12:00 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `neuro`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'memory', 'active', '2019-12-01 23:00:00', NULL),
(2, 'reasoning', 'active', '2019-12-01 23:00:00', NULL),
(3, 'perception', 'active', '2019-11-30 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
CREATE TABLE IF NOT EXISTS `exercise` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exercise_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `session_id` int(11) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `execercise_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `exercise_name`, `category_id`, `session_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'exer_1', 1, 1, 'active', '2019-11-30 23:00:00', NULL),
(2, 'exer_2', 1, 1, 'active', '2019-11-30 23:00:00', NULL),
(3, 'exer_3', 1, 2, 'active', '2019-11-30 23:00:00', NULL),
(4, 'exer_4', 2, 3, 'active', '2019-11-30 23:00:00', NULL),
(5, 'exer_5', 2, 1, 'active', '2019-11-30 23:00:00', NULL),
(6, 'exer_6', 2, 2, 'active', '2019-11-30 23:00:00', NULL),
(7, 'exer_7', 2, 3, 'active', '2019-11-30 23:00:00', NULL),
(8, 'exer_8', 3, 3, 'active', '2019-11-30 23:00:00', NULL),
(9, 'exer_9', 3, 3, 'active', '2019-11-30 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exercise_history`
--

DROP TABLE IF EXISTS `exercise_history`;
CREATE TABLE IF NOT EXISTS `exercise_history` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `points` bigint(20) NOT NULL,
  `exercise_id` int(10) UNSIGNED NOT NULL,
  `session_history_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_history_exercise_id_foreign` (`exercise_id`),
  KEY `exercise_history_session_history_id_foreign` (`session_history_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercise_history`
--

INSERT INTO `exercise_history` (`id`, `points`, `exercise_id`, `session_history_id`, `created_at`, `updated_at`) VALUES
(1, 25, 1, 1, '2019-11-30 23:00:00', NULL),
(2, 35, 2, 1, '2019-11-30 23:00:00', NULL),
(3, 56, 3, 2, '2019-12-01 23:00:00', NULL),
(4, 34, 4, 1, '2019-11-30 23:00:00', NULL),
(5, 78, 4, 3, '2019-11-30 23:00:00', NULL),
(6, 34, 5, 5, '2019-11-30 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_11_24_143629_create_categories_table', 1),
(19, '2019_11_24_143824_create_execercise_table', 1),
(20, '2019_11_24_232956_create_session_table', 1),
(21, '2019_11_25_000254_create_exercise_history_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `session_name`, `date`, `created_at`, `updated_at`) VALUES
(1, 'session_1', '2019-12-02 23:00:00', '2019-11-30 23:00:00', NULL),
(2, 'session_2', '2019-11-30 23:00:00', '2019-11-30 23:00:00', NULL),
(3, 'session_3', '2019-12-02 23:00:00', '2019-11-30 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_history`
--

DROP TABLE IF EXISTS `session_history`;
CREATE TABLE IF NOT EXISTS `session_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `session_history`
--

INSERT INTO `session_history` (`id`, `date`, `session_id`, `user_id`, `created_at`) VALUES
(1, '2019-12-02 23:00:00', 2, 1, '2019-12-01 00:00:00'),
(2, '2019-11-30 23:00:00', 1, 2, '2019-12-01 00:00:00'),
(3, '2019-12-02 23:00:00', 1, 3, '2019-12-01 00:00:00'),
(4, '2019-11-30 23:00:00', 1, 1, '2019-12-01 00:00:00'),
(5, '2019-12-02 23:00:00', 2, 2, '2019-12-01 00:00:00'),
(6, '2019-11-30 23:00:00', 2, 3, '2019-12-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lavan', 'lavan@gmail.com', 'active', '2019-11-30 23:00:00', NULL),
(2, 'varun', 'varun@gmail.com', 'active', '2019-11-30 23:00:00', NULL),
(3, 'mary', 'mary@gmail.com', 'active', '2019-11-30 23:00:00', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
