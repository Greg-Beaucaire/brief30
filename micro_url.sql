-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2021 at 12:33 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `micro_url`
--

-- --------------------------------------------------------

--
-- Table structure for table `assoc_mc_url`
--

CREATE TABLE `assoc_mc_url` (
  `id` int(11) NOT NULL,
  `mc_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assoc_mc_url`
--

INSERT INTO `assoc_mc_url` (`id`, `mc_id`, `url_id`) VALUES
(1, 11, 7),
(2, 11, 8),
(3, 11, 9),
(4, 11, 10),
(5, 11, 8),
(6, 10, 8),
(7, 9, 8),
(8, 8, 8),
(9, 7, 8),
(10, 6, 8),
(11, 10, 11),
(12, 13, 17);

-- --------------------------------------------------------

--
-- Table structure for table `mc`
--

CREATE TABLE `mc` (
  `id` int(11) NOT NULL,
  `mc` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mc`
--

INSERT INTO `mc` (`id`, `mc`) VALUES
(3, 'sushi'),
(4, 'sushi'),
(5, 'sashimi'),
(6, 'maki'),
(7, 'senpuku'),
(8, 'saucisse'),
(9, 'merguez'),
(10, 'claquette'),
(11, 'chaussette'),
(12, 'courgette'),
(13, 'piratage');

-- --------------------------------------------------------

--
-- Table structure for table `url`
--

CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `shortcut` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `url`
--

INSERT INTO `url` (`id`, `url`, `shortcut`, `datetime`, `description`) VALUES
(7, 'urltropcool.roflcopter.fr', 'url.ug.fr', '2021-01-06 15:11:31', 'première url rentrée'),
(8, 'chouette.roflcopter.fr', 'url.ug.fr', '2021-01-06 15:13:27', 'deuxième url rentrée'),
(9, 'halelujah.roflcopter.fr', 'url.yg.fr', '2021-01-06 15:13:27', 'troisième url rentrée'),
(10, 'jppdewordpress.roflcopter.fr', 'url.tg.fr', '2021-01-06 15:13:28', 'quatrième url rentrée'),
(11, 'jadorelephp.roflcopter.fr', 'url.gg.fr', '2021-01-06 15:13:28', 'cinquième url rentrée'),
(12, 'jaimelescourgettes.roflcopter.fr', 'url.ty.fr', '2021-01-06 15:33:22', 'j\'adore les courgettes à l\'huile d\'olive, c\'est savoureux'),
(17, 'https://www.zataz.com/total-energie-direct-obligee-de-stopper-un-jeu-en-ligne-suite-a-une-fuite-de-donnees/', 'ztz7', '2021-01-15 08:50:39', 'L\'entreprise Total Energie Direct avait lancé un jeu en ligne. Le concours a dû être stoppé. Il était possible d\'accéder aux données des autres joueurs.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assoc_mc_url`
--
ALTER TABLE `assoc_mc_url`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mc_id` (`mc_id`),
  ADD KEY `url_id` (`url_id`);

--
-- Indexes for table `mc`
--
ALTER TABLE `mc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assoc_mc_url`
--
ALTER TABLE `assoc_mc_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mc`
--
ALTER TABLE `mc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `url`
--
ALTER TABLE `url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assoc_mc_url`
--
ALTER TABLE `assoc_mc_url`
  ADD CONSTRAINT `assoc_mc_url_ibfk_1` FOREIGN KEY (`mc_id`) REFERENCES `mc` (`id`),
  ADD CONSTRAINT `assoc_mc_url_ibfk_2` FOREIGN KEY (`url_id`) REFERENCES `url` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
