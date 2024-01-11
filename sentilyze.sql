-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: bncvtqcu1euh3z7jxvsu-mysql.services.clever-cloud.com:3306
-- Generation Time: Jan 11, 2024 at 02:29 AM
-- Server version: 8.0.22-13
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bncvtqcu1euh3z7jxvsu`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add account', 1, 'add_account'),
(2, 'Can change account', 1, 'change_account'),
(3, 'Can delete account', 1, 'delete_account'),
(4, 'Can view account', 1, 'view_account'),
(5, 'Can add profile', 2, 'add_profile'),
(6, 'Can change profile', 2, 'change_profile'),
(7, 'Can delete profile', 2, 'delete_profile'),
(8, 'Can view profile', 2, 'view_profile'),
(9, 'Can add log entry', 3, 'add_logentry'),
(10, 'Can change log entry', 3, 'change_logentry'),
(11, 'Can delete log entry', 3, 'delete_logentry'),
(12, 'Can view log entry', 3, 'view_logentry'),
(13, 'Can add permission', 4, 'add_permission'),
(14, 'Can change permission', 4, 'change_permission'),
(15, 'Can delete permission', 4, 'delete_permission'),
(16, 'Can view permission', 4, 'view_permission'),
(17, 'Can add group', 5, 'add_group'),
(18, 'Can change group', 5, 'change_group'),
(19, 'Can delete group', 5, 'delete_group'),
(20, 'Can view group', 5, 'view_group'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add product_ review', 10, 'add_product_review'),
(38, 'Can change product_ review', 10, 'change_product_review'),
(39, 'Can delete product_ review', 10, 'delete_product_review'),
(40, 'Can view product_ review', 10, 'view_product_review'),
(41, 'Can add category', 11, 'add_category'),
(42, 'Can change category', 11, 'change_category'),
(43, 'Can delete category', 11, 'delete_category'),
(44, 'Can view category', 11, 'view_category');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'argon2$argon2id$v=19$m=102400,t=2,p=8$eEcxbDVCNGpCWmRtRmFPN1c2UHZTcw$dV5G9FClWKEBUrHD0mMSoKq4HbSjBSFtKRule7CNWSw', '2023-03-09 21:13:37.520913', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2023-03-09 21:13:30.337261');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-09 21:13:59.084811', '1', 'Others', 1, '[{\"added\": {}}]', 11, 1),
(2, '2023-03-09 21:14:07.088123', '2', 'Clothing', 1, '[{\"added\": {}}]', 11, 1),
(3, '2023-03-09 21:14:15.387236', '3', 'Footwear', 1, '[{\"added\": {}}]', 11, 1),
(4, '2023-03-09 21:14:27.086599', '4', 'Gadgets', 1, '[{\"added\": {}}]', 11, 1),
(5, '2023-03-09 21:14:35.939744', '5', 'Kitchen Utensils', 1, '[{\"added\": {}}]', 11, 1),
(6, '2023-03-09 21:16:37.945992', '6', 'Fashion', 1, '[{\"added\": {}}]', 11, 1),
(7, '2023-03-09 21:17:00.410703', '7', 'Skincare', 1, '[{\"added\": {}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(3, 'admin', 'logentry'),
(5, 'auth', 'group'),
(4, 'auth', 'permission'),
(6, 'auth', 'user'),
(7, 'contenttypes', 'contenttype'),
(1, 'merchants', 'account'),
(2, 'merchants', 'profile'),
(11, 'product_posts', 'category'),
(9, 'product_posts', 'product'),
(10, 'product_posts', 'product_review'),
(8, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-09 20:41:12.456625'),
(2, 'auth', '0001_initial', '2023-03-09 20:41:17.285924'),
(3, 'admin', '0001_initial', '2023-03-09 20:41:18.613401'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-09 20:41:18.985720'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-09 20:41:19.364793'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-09 20:41:20.694733'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-09 20:41:21.503990'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-09 20:41:22.058982'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-09 20:41:22.393554'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-09 20:41:22.946733'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-09 20:41:23.266644'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-09 20:41:23.593659'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-09 20:41:24.211786'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-09 20:41:24.784348'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-09 20:41:25.351431'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-09 20:41:26.404045'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-09 20:41:26.976027'),
(18, 'merchants', '0001_initial', '2023-03-09 20:41:28.137000'),
(19, 'merchants', '0002_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:28.474477'),
(20, 'merchants', '0003_profile_map_url_alter_account_created_at_and_more', '2023-03-09 20:41:28.992921'),
(21, 'merchants', '0004_profile_company_address_alter_account_created_at_and_more', '2023-03-09 20:41:29.516767'),
(22, 'merchants', '0005_profile_company_desc_alter_account_created_at_and_more', '2023-03-09 20:41:30.063464'),
(23, 'merchants', '0006_alter_account_created_at_alter_account_updated_at_and_more', '2023-03-09 20:41:30.664550'),
(24, 'merchants', '0007_alter_account_created_at_alter_account_updated_at_and_more', '2023-03-09 20:41:31.403321'),
(25, 'merchants', '0008_alter_account_created_at_alter_account_updated_at_and_more', '2023-03-09 20:41:31.764435'),
(26, 'merchants', '0009_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:32.131735'),
(27, 'merchants', '0010_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:32.518023'),
(28, 'merchants', '0011_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:32.891412'),
(29, 'merchants', '0012_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:33.312521'),
(30, 'merchants', '0013_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:33.702756'),
(31, 'merchants', '0014_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:34.076017'),
(32, 'merchants', '0015_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:34.421860'),
(33, 'merchants', '0016_alter_account_created_at_alter_account_updated_at_and_more', '2023-03-09 20:41:35.125278'),
(34, 'merchants', '0017_alter_account_created_at_alter_account_updated_at', '2023-03-09 20:41:35.472716'),
(35, 'product_posts', '0001_initial', '2023-03-09 20:41:37.507899'),
(36, 'product_posts', '0002_alter_product_uploaded_at', '2023-03-09 20:41:37.841760'),
(37, 'product_posts', '0003_alter_product_uploaded_at', '2023-03-09 20:41:38.178494'),
(38, 'product_posts', '0004_remove_category_product_alter_product_uploaded_at', '2023-03-09 20:41:39.854013'),
(39, 'product_posts', '0005_product_category_id_alter_product_uploaded_at', '2023-03-09 20:41:40.552457'),
(40, 'product_posts', '0006_product_review_review_alter_product_uploaded_at', '2023-03-09 20:41:41.103424'),
(41, 'product_posts', '0007_alter_product_uploaded_at', '2023-03-09 20:41:41.462545'),
(42, 'product_posts', '0008_alter_product_uploaded_at', '2023-03-09 20:41:42.008190'),
(43, 'product_posts', '0009_alter_product_uploaded_at', '2023-03-09 20:41:42.375343'),
(44, 'product_posts', '0010_alter_product_uploaded_at', '2023-03-09 20:41:42.743349'),
(45, 'sessions', '0001_initial', '2023-03-09 20:41:43.633639'),
(46, 'merchants', '0017_alter_account_created_at_alter_account_updated_at_and_more', '2023-03-10 19:33:07.645713');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('32alrkhjn8sswb0qkj5rlrk8dslonbf1', 'e30:1puCBQ:Khspb-sBJpMnj4dreWAmF4Z2eLio0z5iVYZm_-K0vSE', '2023-05-17 18:51:12.538514'),
('3ecudmdjuqi7ht4jftr7f00ufx5ruusd', 'eyJjb21wYW55X3BrIjoxfQ:1pad7E:f2imuRDCh0NwkVDkF547-hKT6GNKMBISAPxNLLXzB54', '2023-03-24 19:34:00.743250'),
('3kpsv0s5l1btf3lo6ugups9wz1n80r8f', 'eyJjb21wYW55X3BrIjozfQ:1paIyd:qFJwWp5YC84ZtdCEPJIRFswQoLfvqnyX79Z5wyuo4Bw', '2023-03-23 22:03:47.938670'),
('47eodyto4vtcwy7z1q77an162s3kbxgp', '.eJxVjjsOwjAQRO_iGlmsk43llPScwVrbuyQE7CifAiHuTiKlgHbem9G8lad16fw68-T7pFoF6vSbBYoD5x2kO-Vb0bHkZeqD3hV90FlfS-LH5XD_Bjqau62N5AwG5GgrZrSNOJPAuBrOwRAKA0apBBqxAMY2FbgUQGoUSpsq-6tYniPllx8H1cLnC0lHPOI:1paTj0:vFASvnvlXnS4qjg8Dqlm3oYw1zykogljIs5v47htSok', '2023-03-24 09:32:22.354931'),
('4hxmv2r9qf5ego98bmbqjkw4j7sgttez', 'eyJjb21wYW55X3BrIjoyfQ:1pg7nB:HjX9-Gf1B4mr5ezqFQDTfRniwGaXIzw3EQLvowWFRqc', '2023-04-08 23:20:01.750482'),
('7qlds72ttclglh181qnla29brgyr23t0', 'eyJjb21wYW55X3BrIjoyfQ:1pg6Cf:T74Jom54qt1PQdQ8NlVYTioVgZj5l13tfGAL2FATL7M', '2023-04-08 21:38:13.199441'),
('8cnzbn0sv5cswc62uvkkeioahvvuq3r7', 'eyJjb21wYW55X3BrIjoxfQ:1pg0Ju:6dZawRPCj9WQEEl7ZGRoY_OTFdrcAbxu0XBCnuvGEEI', '2023-04-08 15:21:18.157466'),
('d3ioz2m3hi0yytnngnm2fs6d8zwav45r', 'e30:1pbAI2:Tzw01WyYIxxI3OulUg-7EslyjabFIKucPHyLWHxcYOM', '2023-03-26 06:59:22.028331'),
('ew9qt1u40reaiv59az0tgllx1zvpnkn2', 'eyJjb21wYW55X3BrIjoxfQ:1pb0W2:3d0Ye-2CFj-Udr9VtMDoJLBTPsTeR3JGjLD_5T4WXqk', '2023-03-25 20:33:10.859078'),
('h9glhbart3t9sqbjyrevcp49yamson0i', 'eyJjb21wYW55X3BrIjoyfQ:1pg0qL:wypNZ6WhhZNWXm52tMnkbx_YsT-eDQQX4ZQ29MmCrvg', '2023-04-08 15:54:49.080474'),
('jsq0a2b913xbtu05urb0l72auwa5cyls', 'eyJjb21wYW55X3BrIjoyfQ:1paIDf:atl7ZyOGjTMvmtDcO2z2Jo-ot1icTHrKy6QouDvlWTQ', '2023-03-23 21:15:15.183402'),
('kzfz8qave08n1e87m4s6ghk9ay09vveu', 'e30:1rNkhx:wVftWSdY-BVLrlYINrLhUUYH4xUjn9guY5tFWxzl0kU', '2024-01-25 08:07:13.404975'),
('lnyyxu8m1snypty2abjiwjmafjg6850w', 'eyJjb21wYW55X3BrIjoxfQ:1qGDqO:f1HDFQdUSbiX5nthOWMKqu7yLUsail5BmqgYSUYIjTc', '2023-07-17 13:04:32.677654'),
('lte4o2xpx302tzi19wamc5e8r48x25rq', 'e30:1pflwA:crQklayTP8zXh67CcyP4g3MlZoHFbPZXUNpOg-1Q_to', '2023-04-07 23:59:50.746027'),
('lyk1xbz08hyfnwei2ixyscsulxez94h6', 'e30:1pg87A:a62bzMI7Zd6zXwuqLynf6iJoOcw9LLUgyhhnKF950j4', '2023-04-08 23:40:40.832421'),
('mk05oe28l4eyl4l381td8ltkzakquoht', 'eyJjb21wYW55X3BrIjoxfQ:1padcP:4MhJ7O3bR3gN4nblqbeQCoVKy9OdxL_qIi5rdFrA2v4', '2023-03-24 20:06:13.453675'),
('rgzs4xwy52gj03gilhutvwyd4ofgtfjg', 'eyJjb21wYW55X3BrIjo0fQ:1paJbN:A_bcMVyhrGbkNQdbedCcI18JNeuoA39rsF9PPVFfeoo', '2023-03-23 22:43:49.067937'),
('s3bxbzu895d94fruqonzuirpsqhjjcvy', 'e30:1pg77I:nXqGXwBddZFcMCa-crV7KFsJ-La_001aBikfcoSpRwA', '2023-04-08 22:36:44.473162'),
('sbpaj4nasgpujne2hsmhib7ryr5ixn39', 'eyJjb21wYW55X3BrIjoyfQ:1qZ841:99Y3lzN9wD32TgsRMaPvsLu1pFNBGq00__tGlv0g9sA', '2023-09-07 16:44:45.608115'),
('ug7nv4yl63u8gupwifvmssm1wv7ei2j9', 'eyJjb21wYW55X3BrIjoyfQ:1pg2R2:4MqpjIKF-JW0HXXXxDJ5rsdJRa7NUwgYwt8UyG1R-3k', '2023-04-08 17:36:48.369439'),
('y9mxp7lzpwzhctt61f79sreioucej2nq', 'eyJjb21wYW55X3BrIjoxfQ:1pg0Zf:TlWA4jddp6cImn7aT0KhUXySkB5pc10YBXnuhCzkTSM', '2023-04-08 15:37:35.269227');

-- --------------------------------------------------------

--
-- Table structure for table `merchants_account`
--

CREATE TABLE `merchants_account` (
  `id` bigint NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchants_account`
--

INSERT INTO `merchants_account` (`id`, `company_email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'support@optic.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$Z1hHNktSQnlhOHcyRTh3M09idkoyNA$LVjbFlcQtFm2Jaz2/TXAMW9pfBkv/CAQ00NHPcDnEaw', '2023-03-09 20:58:25.991847', '2023-03-23 20:12:24.068347'),
(2, 'fashion123@gmail.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$TW9TQTZWNVpVVUVXbzdQdFdIR1BiaQ$KWTZC44cKHAXX96FhL8SrVWIEw9yDcAVF/F6jrqCGao', '2023-03-09 21:13:39.580935', '2023-03-25 23:21:41.851663'),
(3, 'Technepal@gmail.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$UEhQNHAxTGIybklaTFdJemZRb05TdQ$RSExW6aF6iE1Gt3ZuCvmAwVWS9/N/UjvHG+7Aq2G2PU', '2023-03-09 21:59:02.431099', '2023-03-10 21:18:46.700198'),
(4, 'furniture@gmail.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$aG5xYUFjSG1CWkJISUZYUDNmNUR3Tg$5FjzdpX4qt1+XTk/7gtnpDKaQxuTeDOTJNYDj8NLUtQ', '2023-03-09 22:43:19.267990', '2023-03-10 19:57:12.149671'),
(5, '', 'argon2$argon2id$v=19$m=102400,t=2,p=8$RjZwM3BzOW9SdUUzYW1oT1V4TnJrRw$HX0tws+BArdYZ0ctMQpXcTnPCHgcVadYjT4yVTywW84', '2023-03-25 15:13:25.365107', '2023-03-25 15:13:25.365147'),
(6, 'newcompltd@gmail.com', 'argon2$argon2id$v=19$m=102400,t=2,p=8$ZlpmMVBHZFpzYTBEOG96VThCSlRjNg$HalW1jQsSEM1aGDgpVJsoBxSKiS05rQP37h0FAYc6GA', '2023-08-24 16:33:21.246656', '2023-08-24 16:33:21.246693');

-- --------------------------------------------------------

--
-- Table structure for table `merchants_profile`
--

CREATE TABLE `merchants_profile` (
  `id` bigint NOT NULL,
  `company_logo` varchar(100) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_reg_id` varchar(50) NOT NULL,
  `account_id` bigint NOT NULL,
  `map_url` longtext,
  `company_address` varchar(100) DEFAULT NULL,
  `company_desc` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchants_profile`
--

INSERT INTO `merchants_profile` (`id`, `company_logo`, `company_name`, `company_reg_id`, `account_id`, `map_url`, `company_address`, `company_desc`) VALUES
(1, 'eyeglass.webp', 'Optic Nepal', '1001', 1, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d56535.127295168226!2d85.24812153125005!3d27.672623900000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19ca5c08f275%3A0x2286f0b2005d0297!2sOptic%20Nepal!5e0!3m2!1sen!2snp!4v1678456996233!5m2!1sen!2snp', 'M8F7+2JV, Lalitpur 44600', 'Foreign products,  quality products, keep up with the new trends. '),
(2, 'images.png', 'Fashion Hub', '0112', 2, '', 'kalanki, kathmandu', 'Find what you love here '),
(3, 'technepal_DEqLlDo.webp', 'Tech Nepal', '12386', 3, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1766.2427365511323!2d85.30903365807922!3d27.702293295698524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19b2f6b80205%3A0x95652f68260a2f72!2sTamrakar%20Complex!5e0!3m2!1sen!2snp!4v1678459595044!5m2!1sen!2snp', 'Pako,New road', 'Discover the latest and greatest tech products !'),
(4, 'Oakwood Please.png', 'OakWood Furniture', 'ee123', 4, 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14124.636236074333!2d85.31351580781251!3d27.7432396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb1937eeb9d9cd%3A0x402bde83a1c73126!2sSajha%20Bus%20Stop!5e0!3m2!1sen!2snp!4v1678457233194!5m2!1sen!2snp', 'Basundhara Chowk', 'Renovate your home at the best prices available !'),
(5, 'False', '', '', 5, NULL, NULL, NULL),
(6, 'False', 'New Comp Ltd', '78964', 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_posts_category`
--

CREATE TABLE `product_posts_category` (
  `id` bigint NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_posts_category`
--

INSERT INTO `product_posts_category` (`id`, `category`) VALUES
(1, 'Others'),
(2, 'Clothing'),
(3, 'Footwear'),
(4, 'Gadgets'),
(5, 'Kitchen Utensils'),
(6, 'Fashion'),
(7, 'Skincare');

-- --------------------------------------------------------

--
-- Table structure for table `product_posts_product`
--

CREATE TABLE `product_posts_product` (
  `id` bigint NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_price` double NOT NULL,
  `account_id` bigint NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_posts_product`
--

INSERT INTO `product_posts_product` (`id`, `product_image`, `product_name`, `uploaded_at`, `product_desc`, `product_price`, `account_id`, `category_id`) VALUES
(2, 'levitating-product-display-with-eyeglasses.jpg', 'Sun Glasses', '2023-03-09 20:58:26.060797', 'Discover the perfect blend of style. Not for poor guys.', 30000, 1, 6),
(4, 'table.png', 'Table', '2023-03-09 22:43:19.319073', 'Product to change your living ways!', 5000, 4, 1),
(7, 'headphone.webp', 'Gaming headset', '2023-03-10 21:12:27.694922', 'Top notch comfort with awesome sound quality', 4000, 3, 4),
(8, 'levitating-product-display-with-scarf.jpg', 'Shirt', '2023-03-11 20:12:43.653723', 'Extreme comfort wear for you!', 1100, 2, 2),
(10, 'shoes1.webp', 'Shoes', '2023-03-25 15:45:57.102962', 'Best running shoes for you.', 2000, 2, 3),
(11, 'jack.jfif', 'Jacket', '2023-03-25 15:45:57.102962', 'Wind cheater will give you warmth.', 2200, 2, 2),
(12, 'watch.jfif', 'Watch', '2023-03-25 15:45:57.102962', 'Always be on time with a watch.', 7000, 2, 4),
(13, 'nike-6.jpg', 'Nike - Blue theme', '2023-05-03 18:46:35.795576', 'Comfort for your leg', 4500, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_posts_product_review`
--

CREATE TABLE `product_posts_product_review` (
  `id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  `product_id` bigint NOT NULL,
  `review` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_posts_product_review`
--

INSERT INTO `product_posts_product_review` (`id`, `status`, `product_id`, `review`) VALUES
(1, 'Positive', 2, 'really good '),
(4, 'Positive', 7, 'i love it'),
(5, 'Positive', 8, 'what is this product absolute masterpiece'),
(6, 'Positive', 7, 'very good..'),
(7, 'Positive', 7, 'wow absolute shit'),
(10, 'Negative', 7, 'so bad product'),
(11, 'Negative', 7, 'cheap quality'),
(12, 'Positive', 7, 'faulty product'),
(13, 'Negative', 7, 'so uncomfortable '),
(14, 'Positive', 11, 'Best for winter, is really warm '),
(15, 'Positive', 10, 'best feeling and so comfortable to wear'),
(16, 'Positive', 12, 'stylish and light very satisfying'),
(17, 'Negative', 8, 'The quality is very bad. It did not lasted 6 months.'),
(18, 'Positive', 7, 'great sound'),
(19, 'Positive', 10, 'best for my sister'),
(20, 'Negative', 12, 'bad leather quality'),
(21, 'Positive', 10, 'very comfortable'),
(23, 'Positive', 8, 'Texture feels very good while wearing '),
(24, 'Negative', 11, 'Bad material quality '),
(25, 'Negative', 7, 'The sound quality is amazing !!'),
(26, 'Positive', 4, 'love the design '),
(27, 'Negative', 4, 'cheap quality'),
(28, 'Positive', 2, 'stylish looks'),
(29, 'Negative', 2, 'very old for me'),
(30, 'Positive', 8, 'looks stylish'),
(31, 'Negative', 8, 'quality is bad'),
(32, 'Positive', 11, 'Best for the winters'),
(33, 'Negative', 2, 'breaks easily'),
(34, 'Negative', 2, 'this glass is flying in the glass'),
(35, 'Positive', 2, 'looks nice'),
(36, 'Positive', 2, 'looks good');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `merchants_account`
--
ALTER TABLE `merchants_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_email` (`company_email`);

--
-- Indexes for table `merchants_profile`
--
ALTER TABLE `merchants_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_reg_id` (`company_reg_id`),
  ADD KEY `merchants_profile_account_id_103ba542_fk_merchants_account_id` (`account_id`);

--
-- Indexes for table `product_posts_category`
--
ALTER TABLE `product_posts_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_posts_product`
--
ALTER TABLE `product_posts_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_posts_produc_account_id_23db3bdc_fk_merchants` (`account_id`);

--
-- Indexes for table `product_posts_product_review`
--
ALTER TABLE `product_posts_product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_posts_produc_product_id_2e5733be_fk_product_p` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `merchants_account`
--
ALTER TABLE `merchants_account`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `merchants_profile`
--
ALTER TABLE `merchants_profile`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_posts_category`
--
ALTER TABLE `product_posts_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_posts_product`
--
ALTER TABLE `product_posts_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_posts_product_review`
--
ALTER TABLE `product_posts_product_review`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `merchants_profile`
--
ALTER TABLE `merchants_profile`
  ADD CONSTRAINT `merchants_profile_account_id_103ba542_fk_merchants_account_id` FOREIGN KEY (`account_id`) REFERENCES `merchants_account` (`id`);

--
-- Constraints for table `product_posts_product`
--
ALTER TABLE `product_posts_product`
  ADD CONSTRAINT `product_posts_produc_account_id_23db3bdc_fk_merchants` FOREIGN KEY (`account_id`) REFERENCES `merchants_account` (`id`);

--
-- Constraints for table `product_posts_product_review`
--
ALTER TABLE `product_posts_product_review`
  ADD CONSTRAINT `product_posts_produc_product_id_2e5733be_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_posts_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
