-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 08, 2026 at 10:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ds_assignment_art_prices`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(30) NOT NULL,
  `artist_country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `artist_country`) VALUES
(1, 'Kimberley Chen', 'France'),
(2, 'Freya Murray', 'United Kingdom'),
(3, 'Amy the Angel', 'Finland'),
(4, 'Violet', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `buyer_name`) VALUES
(1, 'Emily'),
(2, 'Preston'),
(3, 'Sheila'),
(4, 'Thanh Tu'),
(5, 'Thanh Tu'),
(6, 'Phuong Linh'),
(7, 'Phuong Linh'),
(8, 'Phuong Linh'),
(9, 'Phuong Linh'),
(10, 'Phuong Linh'),
(11, 'Phuong Linh'),
(12, 'Phuong Linh'),
(13, 'Phuong Linh'),
(14, 'Phuong Linh'),
(15, 'Phuong Linh'),
(16, 'Phuong Linh'),
(17, 'Phuong Linh'),
(18, 'Phuong Linh'),
(19, 'Phuong Linh'),
(20, 'Phuong Linh');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp(),
  `price` int(11) NOT NULL,
  `ref_artist` int(11) NOT NULL,
  `ref_buyer` int(11) NOT NULL,
  `ref_work_of_art` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_date`, `price`, `ref_artist`, `ref_buyer`, `ref_work_of_art`) VALUES
(1, '2023-01-01 10:10:00', 1204, 4, 1, 1),
(2, '2023-01-01 10:20:00', 1439, 4, 1, 1),
(3, '2023-01-01 10:30:00', 1964, 4, 1, 1),
(4, '2023-01-01 10:40:00', 2128, 4, 2, 1),
(5, '2023-01-01 10:50:00', 2252, 4, 3, 1),
(6, '2023-01-01 11:00:00', 2055, 2, 2, 2),
(7, '2023-01-01 11:10:00', 2429, 2, 3, 2),
(8, '2023-01-01 11:20:00', 2581, 2, 2, 2),
(9, '2023-01-01 11:30:00', 3009, 2, 3, 2),
(10, '2023-01-01 11:40:00', 3927, 2, 1, 2),
(11, '2023-01-01 11:50:00', 2598, 3, 1, 3),
(12, '2023-01-01 12:00:00', 3001, 3, 3, 3),
(13, '2023-01-01 12:10:00', 3328, 3, 1, 3),
(14, '2023-01-01 12:20:00', 3927, 3, 1, 3),
(15, '2023-01-01 12:30:00', 4522, 3, 2, 3),
(16, '2023-01-01 12:40:00', 1827, 4, 1, 4),
(17, '2023-01-01 12:50:00', 2063, 4, 3, 4),
(18, '2023-01-01 13:00:00', 2227, 4, 2, 4),
(19, '2023-01-01 13:10:00', 2622, 4, 3, 4),
(20, '2023-01-01 13:20:00', 3815, 4, 3, 4),
(21, '2023-01-01 13:30:00', 1871, 1, 1, 5),
(22, '2023-01-01 13:40:00', 2138, 1, 2, 5),
(23, '2023-01-01 13:50:00', 2477, 1, 3, 5),
(24, '2023-01-01 14:00:00', 3215, 1, 3, 5),
(25, '2023-01-01 14:10:00', 3227, 1, 2, 5),
(26, '2023-01-01 14:20:00', 1032, 2, 2, 6),
(27, '2023-01-01 14:30:00', 1441, 2, 2, 6),
(28, '2023-01-01 14:40:00', 1466, 2, 3, 6),
(29, '2023-01-01 14:50:00', 1917, 2, 3, 6),
(30, '2023-01-01 15:00:00', 2764, 2, 3, 6),
(31, '2023-01-01 15:10:00', 1445, 2, 3, 7),
(32, '2023-01-01 15:20:00', 1881, 2, 3, 7),
(33, '2023-01-01 15:30:00', 2179, 2, 1, 7),
(34, '2023-01-01 15:40:00', 2342, 2, 1, 7),
(35, '2023-01-01 15:50:00', 2721, 2, 2, 7),
(36, '2023-01-01 16:00:00', 1151, 3, 1, 8),
(37, '2023-01-01 16:10:00', 1383, 3, 1, 8),
(38, '2023-01-01 16:20:00', 2103, 3, 2, 8),
(39, '2023-01-01 16:30:00', 1946, 3, 1, 8),
(40, '2023-01-01 16:40:00', 2383, 3, 3, 8),
(41, '2023-01-01 16:50:00', 2381, 1, 1, 9),
(42, '2023-01-01 17:00:00', 2625, 1, 2, 9),
(43, '2023-01-01 17:10:00', 3025, 1, 2, 9),
(44, '2023-01-01 17:20:00', 3710, 1, 2, 9),
(45, '2023-01-01 17:30:00', 3529, 1, 3, 9),
(46, '2023-01-01 17:40:00', 1499, 4, 1, 10),
(47, '2023-01-01 17:50:00', 1933, 4, 3, 10),
(48, '2023-01-01 18:00:00', 2409, 4, 1, 10),
(49, '2023-01-01 18:10:00', 2732, 4, 1, 10),
(50, '2023-01-01 18:20:00', 3375, 4, 1, 10),
(51, '2023-01-01 18:30:00', 1660, 1, 1, 11),
(52, '2023-01-01 18:40:00', 2113, 1, 3, 11),
(53, '2023-01-01 18:50:00', 2470, 1, 3, 11),
(54, '2023-01-01 19:00:00', 2269, 1, 3, 11),
(55, '2023-01-01 19:10:00', 3044, 1, 3, 11),
(56, '2023-01-01 19:20:00', 1159, 1, 3, 12),
(57, '2023-01-01 19:30:00', 1449, 1, 2, 12),
(58, '2023-01-01 19:40:00', 1857, 1, 3, 12),
(59, '2023-01-01 19:50:00', 2047, 1, 1, 12),
(60, '2023-01-01 20:00:00', 2595, 1, 1, 12),
(61, '2023-01-01 20:10:00', 2623, 2, 3, 13),
(62, '2023-01-01 20:20:00', 2939, 2, 2, 13),
(63, '2023-01-01 20:30:00', 3117, 2, 3, 13),
(64, '2023-01-01 20:40:00', 3598, 2, 1, 13),
(65, '2023-01-01 20:50:00', 3619, 2, 1, 13),
(66, '2023-01-01 21:00:00', 2584, 2, 3, 14),
(67, '2023-01-01 21:10:00', 2847, 2, 3, 14),
(68, '2023-01-01 21:20:00', 3494, 2, 3, 14),
(69, '2023-01-01 21:30:00', 3787, 2, 2, 14),
(70, '2023-01-01 21:40:00', 4132, 2, 1, 14),
(71, '2023-01-01 21:50:00', 2394, 3, 1, 15),
(72, '2023-01-01 22:00:00', 2680, 3, 1, 15),
(73, '2023-01-01 22:10:00', 3388, 3, 3, 15),
(74, '2023-01-01 22:20:00', 3171, 3, 1, 15),
(75, '2023-01-01 22:30:00', 4358, 3, 1, 15),
(76, '2023-01-01 22:40:00', 1850, 2, 2, 16),
(77, '2023-01-01 22:50:00', 2322, 2, 1, 16),
(78, '2023-01-01 23:00:00', 2750, 2, 1, 16),
(79, '2023-01-01 23:10:00', 3104, 2, 3, 16),
(80, '2023-01-01 23:20:00', 3494, 2, 3, 16),
(81, '2023-01-01 23:30:00', 2248, 4, 3, 17),
(82, '2023-01-01 23:40:00', 2658, 4, 3, 17),
(83, '2023-01-01 23:50:00', 3088, 4, 2, 17),
(84, '2023-01-02 00:00:00', 3370, 4, 3, 17),
(85, '2023-01-02 00:10:00', 4012, 4, 1, 17),
(86, '2023-01-02 00:20:00', 2585, 4, 2, 18),
(87, '2023-01-02 00:30:00', 2873, 4, 2, 18),
(88, '2023-01-02 00:40:00', 3009, 4, 2, 18),
(89, '2023-01-02 00:50:00', 3824, 4, 2, 18),
(90, '2023-01-02 01:00:00', 4001, 4, 1, 18),
(91, '2023-01-02 01:10:00', 1975, 4, 2, 19),
(92, '2023-01-02 01:20:00', 2341, 4, 2, 19),
(93, '2023-01-02 01:30:00', 2615, 4, 1, 19),
(94, '2023-01-02 01:40:00', 2731, 4, 2, 19),
(95, '2023-01-02 01:50:00', 2971, 4, 2, 19),
(96, '2023-01-02 02:00:00', 2693, 2, 1, 20),
(97, '2023-01-02 02:10:00', 3017, 3, 2, 20),
(98, '2023-01-02 02:20:00', 3201, 4, 2, 20),
(99, '2023-01-02 02:30:00', 3677, 3, 2, 20),
(100, '2023-01-02 02:40:00', 4117, 2, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `work_of_art`
--

CREATE TABLE `work_of_art` (
  `work_id` int(11) NOT NULL,
  `work_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `style` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work_of_art`
--

INSERT INTO `work_of_art` (`work_id`, `work_name`, `description`, `style`) VALUES
(1, 'The Savage Eye', NULL, NULL),
(2, 'Unnamed #15', NULL, NULL),
(3, 'Wings', NULL, NULL),
(4, 'The Book of Violet', NULL, NULL),
(5, 'Walking', NULL, NULL),
(6, 'She Loves Bats', NULL, NULL),
(7, 'Sadness', NULL, NULL),
(8, 'Halo', NULL, NULL),
(9, 'The History of Chocolate', NULL, NULL),
(10, 'A Field Back Home', NULL, NULL),
(11, 'Emptiness Versus As Least Some', NULL, NULL),
(12, 'Hounds', NULL, NULL),
(13, 'Heavy Water', NULL, NULL),
(14, 'From Edinburgh to London', NULL, NULL),
(15, 'The Fall', NULL, NULL),
(16, 'Burning', NULL, NULL),
(17, 'Campfires', NULL, NULL),
(18, 'Radioactive Isotope', NULL, NULL),
(19, 'The Missing Painting', NULL, NULL),
(20, 'Artwork_20', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `work_of_art`
--
ALTER TABLE `work_of_art`
  ADD PRIMARY KEY (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `work_of_art`
--
ALTER TABLE `work_of_art`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
