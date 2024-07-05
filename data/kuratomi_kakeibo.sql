-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2024-07-05 03:26:56
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `kuratomi_kakeibo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `balance_tmpl`
--

CREATE TABLE `balance_tmpl` (
  `id` int(3) NOT NULL,
  `term` date NOT NULL,
  `item` varchar(16) NOT NULL,
  `amount` int(8) NOT NULL,
  `income_expense` varchar(8) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_`
--

CREATE TABLE `expenses_` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202201`
--

CREATE TABLE `expenses_202201` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202306`
--

CREATE TABLE `expenses_202306` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202406`
--

CREATE TABLE `expenses_202406` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `expenses_202406`
--

INSERT INTO `expenses_202406` (`id`, `term`, `item`, `amount`, `fix_or_var`, `category`, `beneficiary`, `deadline`, `already_paid`, `paid_on`, `paid_from`, `paid_by`, `note`, `last_updated_on`) VALUES
(1, '2024-06-01', 'ガス代', 5680, '固定費', '光熱費', 'みんな', '2024-06-10', 1, '2024-06-08', '口座引き落とし', 'たみお', NULL, '2024-07-04 22:53:47'),
(2, '2024-06-01', '電気代', 6780, '固定費', '光熱費', 'みんな', '2024-06-10', 1, '2024-06-08', '生活費', 'オリガ', NULL, '2024-07-04 22:57:22'),
(3, '2024-06-01', 'ピアノレッスン', 5000, '変動費', '教育費', 'まりや', '2024-06-25', 0, '2024-06-08', '生活費', 'オリガ', NULL, '2024-07-04 23:00:55'),
(4, '2024-06-01', 'ピアノレッスン', 5000, '変動費', '教育費', 'あんな', '2024-06-30', 0, '2024-06-22', '生活費', 'オリガ', NULL, '2024-07-04 23:01:56'),
(5, '2024-06-01', '家庭教師', 15000, '変動費', '教育費', 'まりや', '2024-06-25', 0, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:03:08'),
(6, '2024-06-01', '公文（塾）', 15000, '変動費', '教育費', 'まりや', '2024-06-25', 1, '2024-06-23', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:03:46'),
(7, '2024-06-01', 'プール教室', 3000, '変動費', '教育費', 'あんな', '2024-06-26', 1, '2024-06-27', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:04:54'),
(8, '2024-06-01', '那珂川合唱団', 2200, '変動費', '教育費', 'あんな', '2024-06-30', 1, '2024-06-28', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:05:46'),
(9, '2024-06-01', '水道代', 4670, '固定費', '光熱費', 'みんな', '2024-06-28', 1, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:06:46'),
(10, '2024-06-01', 'ネット代', 4980, '変動費', '通信費', 'みんな', '2024-06-25', 0, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:08:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202407`
--

CREATE TABLE `expenses_202407` (
  `id` int(3) NOT NULL DEFAULT 0,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `expenses_202407`
--

INSERT INTO `expenses_202407` (`id`, `term`, `item`, `amount`, `fix_or_var`, `category`, `beneficiary`, `deadline`, `already_paid`, `paid_on`, `paid_from`, `paid_by`, `note`, `last_updated_on`) VALUES
(1, '2024-06-01', 'ガス代', 5680, '固定費', '光熱費', 'みんな', '2024-06-10', 1, '2024-06-08', '口座引き落とし', 'たみお', NULL, '2024-07-04 22:53:47'),
(2, '2024-06-01', '電気代', 6780, '固定費', '光熱費', 'みんな', '2024-06-10', 1, '2024-06-08', '生活費', 'オリガ', NULL, '2024-07-04 22:57:22'),
(3, '2024-06-01', 'ピアノレッスン', 5000, '変動費', '教育費', 'まりや', '2024-06-25', 0, '2024-06-08', '生活費', 'オリガ', NULL, '2024-07-04 23:00:55'),
(4, '2024-06-01', 'ピアノレッスン', 5000, '変動費', '教育費', 'あんな', '2024-06-30', 0, '2024-06-22', '生活費', 'オリガ', NULL, '2024-07-04 23:01:56'),
(5, '2024-06-01', '家庭教師', 15000, '変動費', '教育費', 'まりや', '2024-06-25', 0, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:03:08'),
(6, '2024-06-01', '公文（塾）', 15000, '変動費', '教育費', 'まりや', '2024-06-25', 1, '2024-06-23', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:03:46'),
(7, '2024-06-01', 'プール教室', 3000, '変動費', '教育費', 'あんな', '2024-06-26', 1, '2024-06-27', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:04:54'),
(8, '2024-06-01', '那珂川合唱団', 2200, '変動費', '教育費', 'あんな', '2024-06-30', 1, '2024-06-28', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:05:46'),
(9, '2024-06-01', '水道代', 4670, '固定費', '光熱費', 'みんな', '2024-06-28', 1, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:06:46'),
(10, '2024-06-01', 'ネット代', 4980, '変動費', '通信費', 'みんな', '2024-06-25', 0, '2024-06-25', '口座引き落とし', 'たみお', NULL, '2024-07-04 23:08:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202506`
--

CREATE TABLE `expenses_202506` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_202606`
--

CREATE TABLE `expenses_202606` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `expenses_tmpl`
--

CREATE TABLE `expenses_tmpl` (
  `id` int(3) NOT NULL,
  `term` date DEFAULT NULL,
  `item` varchar(32) DEFAULT NULL,
  `amount` int(7) NOT NULL,
  `fix_or_var` varchar(16) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `beneficiary` varchar(16) NOT NULL DEFAULT 'みんな',
  `deadline` date DEFAULT NULL,
  `already_paid` tinyint(1) DEFAULT NULL,
  `paid_on` date DEFAULT NULL,
  `paid_from` varchar(16) NOT NULL DEFAULT '生活費',
  `paid_by` varchar(16) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `last_updated_on` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `periodical_tmpl`
--

CREATE TABLE `periodical_tmpl` (
  `id` int(4) NOT NULL,
  `category` varchar(323) NOT NULL,
  `terms` int(2) NOT NULL,
  `installment` int(8) NOT NULL,
  `withdrawal_date` date NOT NULL,
  `who_in_charge` varchar(16) NOT NULL,
  `note` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `balance_tmpl`
--
ALTER TABLE `balance_tmpl`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_`
--
ALTER TABLE `expenses_`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_202201`
--
ALTER TABLE `expenses_202201`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_202306`
--
ALTER TABLE `expenses_202306`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_202406`
--
ALTER TABLE `expenses_202406`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_202506`
--
ALTER TABLE `expenses_202506`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_202606`
--
ALTER TABLE `expenses_202606`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `expenses_tmpl`
--
ALTER TABLE `expenses_tmpl`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `periodical_tmpl`
--
ALTER TABLE `periodical_tmpl`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `balance_tmpl`
--
ALTER TABLE `balance_tmpl`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_`
--
ALTER TABLE `expenses_`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_202201`
--
ALTER TABLE `expenses_202201`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_202306`
--
ALTER TABLE `expenses_202306`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_202406`
--
ALTER TABLE `expenses_202406`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルの AUTO_INCREMENT `expenses_202506`
--
ALTER TABLE `expenses_202506`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_202606`
--
ALTER TABLE `expenses_202606`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `expenses_tmpl`
--
ALTER TABLE `expenses_tmpl`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `periodical_tmpl`
--
ALTER TABLE `periodical_tmpl`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
