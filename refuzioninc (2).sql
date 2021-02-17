-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2021 at 10:09 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `refuzioninc`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `scale` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`id`, `name`, `filename`, `scale`) VALUES
(0, 'Boodschappen doen', 'boodschappendoen.svg', 1),
(1, 'Fietsen', 'fietsen.svg', 1),
(2, 'Hardlopen', 'hardlopen.svg', 1),
(3, 'Hond uitlaten', 'honduitlaten.svg', 1),
(4, 'Wandelen', 'wandelen.svg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `poi`
--

CREATE TABLE `poi` (
  `id` int(10) NOT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `description` text NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `action_id` int(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `poi`
--

INSERT INTO `poi` (`id`, `sender_id`, `description`, `lat`, `lng`, `action_id`, `date`) VALUES
(0, 0, 'Ik zit thuis in quarantaine en kan de deur niet uit. Wie wil mij helpen met de boodschappen?', 52.0729, 5.09806, 0, '2021-02-15 14:20:54'),
(1, 1, 'Ik zou graag met iemand willen wandelen.', 52.0739, 5.10137, 4, '2021-02-15 14:21:50'),
(2, 2, 'Wie zou (tegen betaling) voor mij boodschappen willen doen?', 52.078, 5.10153, 0, '2021-02-15 14:22:18'),
(3, 3, 'Ik heb eergisteren een nieuwe kunstheup gekregen. Zou iemand mij kunnen helpen met boodschappen doen?', 52.0809, 5.14666, 0, '2021-02-15 14:22:48'),
(4, 4, 'Alleen de hond uitlaten is saai. Wie loopt met ons mee?', 52.0653, 5.13368, 3, '2021-02-15 14:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `sender`
--

CREATE TABLE `sender` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sender`
--

INSERT INTO `sender` (`id`, `name`) VALUES
(0, 'Gerard van de burg'),
(1, 'Angela van grinsven'),
(2, 'Ella verhoeven'),
(3, 'Corrie van der tak'),
(4, 'Heino fels\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poi`
--
ALTER TABLE `poi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `poi`
--
ALTER TABLE `poi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sender`
--
ALTER TABLE `sender`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
