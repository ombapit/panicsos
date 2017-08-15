-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2017 at 02:09 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `panicbutton`
--
CREATE DATABASE IF NOT EXISTS `panicbutton` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `panicbutton`;

-- --------------------------------------------------------

--
-- Table structure for table `alarm`
--

CREATE TABLE IF NOT EXISTS `alarm` (
`id_alarm` int(11) NOT NULL,
  `unik_id` varchar(30) NOT NULL,
  `jenis_laporan` varchar(30) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `lon` varchar(30) NOT NULL,
  `tombol_status` varchar(10) NOT NULL,
  `status` int(1) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_penduduk`
--

CREATE TABLE IF NOT EXISTS `data_penduduk` (
`p_id` int(11) NOT NULL,
  `unik_id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `ktpsim` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'Super Admin', 'Administrator'),
(17, 'Public', 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `param`
--

CREATE TABLE IF NOT EXISTS `param` (
  `param_name` varchar(20) NOT NULL,
  `param_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `param`
--

INSERT INTO `param` (`param_name`, `param_value`) VALUES
('smsc', '085959584514');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_type` varchar(10) NOT NULL,
  `user_type_expiration` int(11) DEFAULT NULL,
  `user_type_set_date` int(11) DEFAULT NULL,
  `user_type_request` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `user_type`, `user_type_expiration`, `user_type_set_date`, `user_type_request`) VALUES
(1, '127.0.0.1', 'super_admin', 'b98af4c2f41747d26f23214abebe59231f6d63db', 'c789377284', 'admin@admin.com', '', NULL, NULL, '4b49c3499c206f2d5a07e9efe6c8b58acd9e8fb3', 1268889823, 1502780825, 1, 'Admin', 'istrator', 'ADMIN', '0', 'Free', 0, 0, 0),
(11, '::1', 'abc', 'd2f50b0e0e738490e72ba3ac25b08bbdf83b6e8f', 'c5a64d7fef', 'omba@y.com', NULL, NULL, NULL, NULL, 1449497333, 1475807279, 1, 'Testing frontend', '', '', '1213', 'Premium', 3, 1457496619, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(64, 1, 1),
(83, 11, 17);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_groups`
--
CREATE TABLE IF NOT EXISTS `v_user_groups` (
`user_id` int(11) unsigned
,`group_name` text
);
-- --------------------------------------------------------

--
-- Structure for view `v_user_groups`
--
DROP TABLE IF EXISTS `v_user_groups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_groups` AS select `aaa`.`user_id` AS `user_id`,group_concat(`bbb`.`name` order by `bbb`.`name` ASC separator ', ') AS `group_name` from (`users_groups` `aaa` join `groups` `bbb` on((`aaa`.`group_id` = `bbb`.`id`))) group by `aaa`.`user_id`;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarm`
--
ALTER TABLE `alarm`
 ADD PRIMARY KEY (`id_alarm`);

--
-- Indexes for table `data_penduduk`
--
ALTER TABLE `data_penduduk`
 ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`), ADD KEY `fk_users_groups_users1_idx` (`user_id`), ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alarm`
--
ALTER TABLE `alarm`
MODIFY `id_alarm` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_penduduk`
--
ALTER TABLE `data_penduduk`
MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
