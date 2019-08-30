-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2017 at 01:28 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcms38`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `categoryId`) VALUES
(1, 'Politics', 'Ganjam, Kondol, Maramari, Katakati', 0),
(2, 'Media', 'Gujob vedio shoho', 0),
(3, 'Dhaliwood', 'NA', 2),
(4, 'Boliwood', 'na', 2),
(5, 'National Politics', 'NA', 1),
(6, 'International Politics', 'NA', 1),
(7, 'Sports', 'NA', 0),
(8, 'Football', 'NA', 7),
(9, 'Cricket', 'NA', 7),
(10, 'T20', 'NA', 9),
(11, 'OneDay', '', 7),
(12, 'Test', 'NA', 9),
(13, 'Women', 'NA', 10),
(14, 'Men', 'NA', 10),
(15, 'Taliwood', 'NA', 2),
(16, 'Saifur\'s', 'NA\r\n', 0),
(17, '<b>Injection HTML</b>', 'NA', 1),
(18, '<b>Injection HTML and JS</b>', '<script>\r\nwindow.location = \'http://somebadsite.com\'\r\n</script>', 1),
(19, 'Chanchal', ' window.location = \'http://somebadsite.com\' ', 1),
(20, 'Nai ba dilam', 'kisu na', 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `countryId` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `countryId`) VALUES
(1, 'Dhaka', 1),
(2, 'Rangpur', 1),
(3, 'Noakhali', 1),
(4, 'Kolkatta', 2),
(5, 'New Delhi', 2),
(6, 'Lahore', 3),
(7, 'Bungdish', NULL),
(8, 'Tish tish', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `pageId` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `comments` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `pageId`, `datetime`, `userId`, `comments`) VALUES
(1, 8, '2017-11-19 00:00:00', 1, 'vua news, thik news'),
(2, 8, '2017-11-21 00:00:00', 1, 'Ki at comments korbo'),
(3, 8, '2017-11-21 00:00:00', 2, 'Tui vua, tor bap ma vua'),
(4, 5, '2017-11-28 00:00:00', 5, 'News correction needed');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Bangladesh'),
(2, 'India'),
(3, 'Pakistan'),
(4, 'BSri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `newsimages`
--

CREATE TABLE `newsimages` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `newsId` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsimages`
--

INSERT INTO `newsimages` (`id`, `title`, `newsId`, `image`, `dateTime`) VALUES
(13, 'ABC', 5, 'images8D3ILETJ.jpg', '2017-11-28 19:14:19'),
(12, 'ABC', 5, 'AAEAAQAAAAAAAAWHAAAAJDg4ZGUyZTliLTBiNjItNDY4OC1iZjAwLWEzMGEwMDAyNmNjMg.jpg', '2017-11-28 19:14:06'),
(11, 'ABC', 5, 'imagesTUAW0O1K.jpg', '2017-11-28 19:13:57'),
(5, 'Amazon workers on strike in Italy ', 5, 'unasdsddtitled.png', '2017-11-28 18:54:35'),
(6, 'ABC', 4, 'imagesR5FM13TG.jpg', '2017-11-28 18:56:58'),
(7, 'Asia Basketball ', 4, 'untitledsd.png', '2017-11-28 18:57:25'),
(8, 'abc see and discover only', 8, 'imagesR5FM13TG.jpg', '2017-11-28 18:57:46'),
(9, 'biral er golpo', 9, 'unasdsddtitled.png', '2017-11-28 18:58:06'),
(10, 'abc see and discover only', 10, 'asdfasuntitled.png', '2017-11-28 18:58:34'),
(14, 'ABC', 5, 'AAEAAQAAAAAAAAtIAAAAJDQ0YTdkN2IzLWZkMjMtNDZiYy1iNGM2LWM4ZWEwZTY1YTM4Nw.jpg', '2017-11-28 19:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `tag` varchar(200) NOT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL DEFAULT '1',
  `categoryId` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `tag`, `createDate`, `userId`, `categoryId`, `count`) VALUES
(7, '11th veto by Russia regarding Syria', 'veto, nato', '2017-11-19 18:51:12', 1, 6, 0),
(6, 'T20 Sample News', 't20', '2017-11-19 18:49:08', 1, 10, 0),
(5, 'Only Me is Real', 'me, only', '2017-11-19 18:39:59', 1, 1, 0),
(4, 'Russia casts latest UN veto', 'cnn, news', '2017-11-19 18:34:20', 1, 6, 0),
(8, 'They would frame them', 'ghgh', '2017-11-19 18:54:13', 1, 1, 0),
(9, 'New NASA tool can tell you which glacier may flood your ', 'news', '2017-11-19 18:54:58', 1, 4, 0),
(10, 'waste your time trying to ', 'latest', '2017-11-19 18:55:57', 1, 8, 0),
(11, 'Would Rupert Murdoch break up his ', 'business', '2017-11-19 18:57:30', 1, 11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pageslike`
--

CREATE TABLE `pageslike` (
  `userId` int(11) NOT NULL,
  `pageId` int(11) NOT NULL,
  `dateTime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pageslike`
--

INSERT INTO `pageslike` (`userId`, `pageId`, `dateTime`) VALUES
(1, 5, '2017-11-30 00:00:00'),
(1, 8, '2017-11-30 00:00:00'),
(5, 5, '2017-11-30 00:00:00'),
(5, 8, '2017-11-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(2000) NOT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createIP` varchar(200) DEFAULT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'A'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `createDate`, `createIP`, `type`) VALUES
(1, 'Md Abdul Mannan Charkhar', 'admin@system.com', '*81769230A51C2B8D285AB33644E414C212BDC6EE', '2017-11-23 18:42:44', NULL, 'A'),
(2, 'Mr Admin Two', 'admin2@system.com', '*81769230A51C2B8D285AB33644E414C212BDC6EE', '2017-11-23 18:42:44', NULL, 'A'),
(3, 'Mr Info Ali', 'info@abc.com', '*81769230A51C2B8D285AB33644E414C212BDC6EE', '2017-11-23 18:58:00', '', 'A'),
(4, 'MD Contact Mahmud', 'contact@abc.com', '*81769230A51C2B8D285AB33644E414C212BDC6EE', '2017-11-23 18:59:54', '::1', 'A'),
(5, 'Mr Awal Miah', 'awal@gmail.com', '*81769230A51C2B8D285AB33644E414C212BDC6EE', '2017-11-23 19:31:49', '::1', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `usersactive`
--

CREATE TABLE `usersactive` (
  `userId` int(11) NOT NULL,
  `dateTIme` datetime DEFAULT CURRENT_TIMESTAMP,
  `IP` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersactive`
--

INSERT INTO `usersactive` (`userId`, `dateTIme`, `IP`) VALUES
(5, '2017-11-23 19:41:16', '::1'),
(1, '2017-11-30 18:31:52', 'na');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `countryId` (`countryId`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `newsimages`
--
ALTER TABLE `newsimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pageslike`
--
ALTER TABLE `pageslike`
  ADD PRIMARY KEY (`userId`,`pageId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usersactive`
--
ALTER TABLE `usersactive`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `newsimages`
--
ALTER TABLE `newsimages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
