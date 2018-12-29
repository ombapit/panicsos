-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 29, 2018 at 11:53 AM
-- Server version: 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 5.6.31-4+ubuntu16.04.1+deb.sury.org+4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tutor_panicbutton`
--

-- --------------------------------------------------------

--
-- Table structure for table `alarm`
--

CREATE TABLE `alarm` (
  `id_alarm` int(11) NOT NULL,
  `unik_id` varchar(30) NOT NULL,
  `jenis_laporan` varchar(30) NOT NULL,
  `lat` varchar(30) NOT NULL,
  `lon` varchar(30) NOT NULL,
  `tombol_status` varchar(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alarm`
--

INSERT INTO `alarm` (`id_alarm`, `unik_id`, `jenis_laporan`, `lat`, `lon`, `tombol_status`, `status`, `created_date`) VALUES
(1, '133524163453656', 'DARURAT', '-6.17539', '106.8270017', 'mati', 0, '2017-07-13 10:37:54'),
(2, '133524163453656', 'DARURAT', '-6.17539', '106.8270017', 'mati', 0, '2017-07-13 10:39:29'),
(3, '133524163453656', 'DARURAT', '-6.17539', '106.8270017', 'mati', 0, '2017-07-13 10:41:01'),
(4, '133524163453656', 'DARURAT', '-6.17539', '106.8270017', 'mati', 0, '2017-07-13 10:54:23'),
(5, '133524163453656', 'DARURAT', '-6.17539', '106.8270017', 'mati', 0, '2017-07-13 10:55:56'),
(6, '133524163453656', 'DARURAT', '-6.1940583', '106.8763717', 'mati', 0, '2017-07-13 10:56:59'),
(7, '133524163453656', 'DARURAT', '-6.1940583', '106.8763717', 'mati', 0, '2017-07-13 11:01:40'),
(8, '133524163453656', 'DARURAT', '-6.1940583', '106.8763717', 'mati', 0, '2017-07-15 11:42:04'),
(9, '133524163453656', 'DARURAT', '-6.2347583', '106.99585', 'mati', 0, '2017-07-15 11:44:18'),
(10, '351691061549268', 'DARURAT', '1.1447586', '104.0147067', 'mati', 0, '2017-10-02 09:12:38'),
(11, '352973071422853', 'DARURAT', '-10.1816107', '123.5996047', 'mati', 0, '2017-10-10 18:37:59'),
(12, '352973071422853', 'RAMPOK', '-10.1816848', '123.5996537', 'mati', 0, '2017-10-10 18:41:46'),
(13, '352973071422853', 'DARURAT', '-10.1936663', '123.6086588', 'mati', 0, '2017-10-10 19:28:02'),
(14, '352973071422853', 'RANMOR', '-10.2031748', '123.6043429', 'mati', 0, '2017-10-10 19:28:18'),
(15, '352973071422853', 'DARURAT', '-10.2035684', '123.6045789', 'mati', 0, '2017-10-10 20:25:54'),
(16, '352973071422853', 'KEBAKARAN', '-10.2035053', '123.6045792', 'mati', 0, '2017-10-10 20:26:46'),
(17, '352973071422853', 'KEBAKARAN', '-10.1556524', '123.6279662', 'mati', 0, '2017-10-30 11:42:19'),
(18, '352414062937468', 'DARURAT', '-6.9964078', '110.4177145', 'mati', 0, '2018-01-09 08:07:49'),
(19, '352414062937468', 'TERSESAT', '-6.9964078', '110.4177145', 'mati', 0, '2018-01-09 08:07:58'),
(20, '359031061301810', 'KEBAKARAN', '-10.2268927', '123.6340116', 'mati', 0, '2018-01-16 00:43:22'),
(21, '359031061301810', 'DARURAT', '-10.2268927', '123.6340116', 'mati', 0, '2018-01-16 00:45:30'),
(22, '359031061301810', 'RANMOR', '-10.2268927', '123.6340116', 'mati', 0, '2018-01-16 00:53:08'),
(23, '867013040909272', 'DARURAT', '-6.2227616', '106.8231603', 'mati', 0, '2018-12-27 17:57:06'),
(24, '867013040909272', 'DARURAT', '-6.2227517', '106.8231271', 'mati', 0, '2018-12-27 18:06:16'),
(25, '355090089263869', 'DARURAT', '1.0645909', '104.2289998', 'mati', 0, '2018-12-27 20:20:42'),
(26, '355090089263869', 'DARURAT', '1.064305', '104.2303288', 'mati', 0, '2018-12-27 20:53:14'),
(27, '355090089263869', 'RAMPOK', '1.0646461', '104.2293864', 'mati', 0, '2018-12-27 20:54:19'),
(28, '355090089263869', 'RAMPOK', '1.064305', '104.2303288', 'mati', 0, '2018-12-27 20:58:24'),
(29, '355090089263869', 'DARURAT', '1.0660765', '104.2241522', 'mati', 0, '2018-12-27 22:12:50'),
(30, '867013040909272', 'DARURAT', '-6.450289', '107.0378181', 'mati', 0, '2018-12-28 08:05:53'),
(31, '353613074265268', 'DARURAT', '-0.4782215', '104.5771383', 'mati', 0, '2018-12-28 08:55:04'),
(32, '353613074265268', 'DARURAT', '-0.4782828', '104.5770484', 'mati', 0, '2018-12-28 11:26:27'),
(33, '353613074265268', 'DARURAT', '-0.5010268', '104.5656587', 'mati', 0, '2018-12-28 13:16:06'),
(34, '353613074265268', 'DARURAT', '-0.4900713', '104.5674581', 'mati', 0, '2018-12-28 16:48:53');

-- --------------------------------------------------------

--
-- Table structure for table `data_penduduk`
--

CREATE TABLE `data_penduduk` (
  `p_id` int(11) NOT NULL,
  `unik_id` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `ktpsim` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `hp` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_penduduk`
--

INSERT INTO `data_penduduk` (`p_id`, `unik_id`, `nama`, `ktpsim`, `alamat`, `hp`, `created_date`, `updated_date`) VALUES
(1, '133524163453656', 'David Suwandi', '12345', 'Jakarta, Indonesia', '085959584514', '2017-07-13 10:31:35', '2017-07-15 11:35:22'),
(2, '351691061549268', 'faisal', '1718', 'batam', '01819191', '2017-10-02 09:12:30', '2017-10-02 09:12:30'),
(3, '352973071422853', 'riko', '73737363738', 'bzbsbdbsb', '8387373737373', '2017-10-10 18:37:53', '2017-10-30 11:42:04'),
(4, '357926078201527', 'hshshshgs', '277273663', 'ggggggg', '87666555', '2017-12-04 18:48:50', '2017-12-04 18:48:50'),
(5, '352414062937468', 'nurinda', '21120115120021', 'kendal', '081234568930', '2018-01-09 08:07:42', '2018-01-09 08:07:42'),
(6, '359031061301810', '13345', '7tgig', 'igiguf', '05586966', '2018-01-16 00:45:25', '2018-01-16 00:45:25'),
(10, '867013040909272', 'David Suwandi', '7474757575755', 'Citra indah\nCluster Bukit Cendana', '0824678457888', '2018-12-27 17:56:44', '2018-12-29 10:35:30'),
(11, '355090089263869', 'royenk', '210848585758', 'jl lekir', '081321047878', '2018-12-27 20:20:32', '2018-12-27 20:20:32'),
(12, '353613074265268', 'wisuda', '000000', 'lingga', '08117042557', '2018-12-28 08:54:30', '2018-12-28 08:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `param`
--

CREATE TABLE `param` (
  `param_name` varchar(20) NOT NULL,
  `param_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `param`
--

INSERT INTO `param` (`param_name`, `param_value`) VALUES
('smsc', '081321047878');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `unik_id` varchar(30) NOT NULL,
  `pesan` text NOT NULL,
  `image` longblob NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_type` varchar(10) NOT NULL,
  `user_type_expiration` int(11) DEFAULT NULL,
  `user_type_set_date` int(11) DEFAULT NULL,
  `user_type_request` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `user_type`, `user_type_expiration`, `user_type_set_date`, `user_type_request`) VALUES
(1, '127.0.0.1', 'super_admin', 'b98af4c2f41747d26f23214abebe59231f6d63db', 'c789377284', 'admin@admin.com', '', NULL, NULL, '4b49c3499c206f2d5a07e9efe6c8b58acd9e8fb3', 1268889823, 1546054586, 1, 'Admin', 'istrator', 'ADMIN', '0', 'Free', 0, 0, 0),
(13, '112.215.170.103', 'demo', '8188fe12648a4908729f57247e52225e8e121a0a', '325e31e2f6', 'demo@demo.com', NULL, NULL, NULL, NULL, 1499919141, 1507713548, 1, 'Demo', 'Aplikasi', NULL, '123123', '', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(64, 1, 1),
(93, 11, 17),
(94, 13, 17);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_groups`
--
CREATE TABLE `v_user_groups` (
`user_id` int(11) unsigned
,`group_name` text
);

-- --------------------------------------------------------

--
-- Structure for view `v_user_groups`
--
DROP TABLE IF EXISTS `v_user_groups`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_groups`  AS  select `aaa`.`user_id` AS `user_id`,group_concat(`bbb`.`name` order by `bbb`.`name` ASC separator ', ') AS `group_name` from (`users_groups` `aaa` join `groups` `bbb` on((`aaa`.`group_id` = `bbb`.`id`))) group by `aaa`.`user_id` ;

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
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alarm`
--
ALTER TABLE `alarm`
  MODIFY `id_alarm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `data_penduduk`
--
ALTER TABLE `data_penduduk`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;