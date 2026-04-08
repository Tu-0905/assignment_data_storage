-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16.09.2025 klo 21:52
-- Palvelimen versio: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Rakenne taululle `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(30) NOT NULL,
  `artist_country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `artist_country`) VALUES
(1, 'Kimberley Chen', 'France'),
(2, 'Freya Murray', 'United Kingdom'),
(3, 'Amy the Angel', 'Finland'),
(4, 'Violet', 'United States');

-- --------------------------------------------------------

--
-- Rakenne taululle `buyer`
--

CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL,
  `buyer_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `buyer`
--

INSERT INTO `buyer` (`buyer_id`, `buyer_name`) VALUES
(1, 'Emily'),
(2, 'Preston'),
(3, 'Sheila');

-- --------------------------------------------------------

--
-- Rakenne taululle `sale`
--

CREATE TABLE `sale` (
  `sale_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp(),
  `name_of_work` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `ref_artist` int(11) NOT NULL,
  `ref_buyer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Vedos taulusta `sale`
--

INSERT INTO `sale` (`sale_id`, `sale_date`, `name_of_work`, `price`, `ref_artist`, `ref_buyer`) VALUES
(1, '2023-01-01 10:10:00', 'The Savage Eye', 1204, 4, 1),
(2, '2023-01-01 10:20:00', 'The Savage Eye', 1439, 4, 1),
(3, '2023-01-01 10:30:00', 'The Savage Eye', 1964, 4, 1),
(4, '2023-01-01 10:40:00', 'The Savage Eye', 2128, 4, 2),
(5, '2023-01-01 10:50:00', 'The Savage Eye', 2252, 4, 3),
(6, '2023-01-01 11:00:00', 'Unnamed #15', 2055, 2, 2),
(7, '2023-01-01 11:10:00', 'Unnamed #15', 2429, 2, 3),
(8, '2023-01-01 11:20:00', 'Unnamed #15', 2581, 2, 2),
(9, '2023-01-01 11:30:00', 'Unnamed #15', 3009, 2, 3),
(10, '2023-01-01 11:40:00', 'Unnamed #15', 3927, 2, 1),
(11, '2023-01-01 11:50:00', 'Wings', 2598, 3, 1),
(12, '2023-01-01 12:00:00', 'Wings', 3001, 3, 3),
(13, '2023-01-01 12:10:00', 'Wings', 3328, 3, 1),
(14, '2023-01-01 12:20:00', 'Wings', 3927, 3, 1),
(15, '2023-01-01 12:30:00', 'Wings', 4522, 3, 2),
(16, '2023-01-01 12:40:00', 'The Book of Violet', 1827, 4, 1),
(17, '2023-01-01 12:50:00', 'The Book of Violet', 2063, 4, 3),
(18, '2023-01-01 13:00:00', 'The Book of Violet', 2227, 4, 2),
(19, '2023-01-01 13:10:00', 'The Book of Violet', 2622, 4, 3),
(20, '2023-01-01 13:20:00', 'The Book of Violet', 3815, 4, 3),
(21, '2023-01-01 13:30:00', 'Walking', 1871, 1, 1),
(22, '2023-01-01 13:40:00', 'Walking', 2138, 1, 2),
(23, '2023-01-01 13:50:00', 'Walking', 2477, 1, 3),
(24, '2023-01-01 14:00:00', 'Walking', 3215, 1, 3),
(25, '2023-01-01 14:10:00', 'Walking', 3227, 1, 2),
(26, '2023-01-01 14:20:00', 'She Loves Bats', 1032, 2, 2),
(27, '2023-01-01 14:30:00', 'She Loves Bats', 1441, 2, 2),
(28, '2023-01-01 14:40:00', 'She Loves Bats', 1466, 2, 3),
(29, '2023-01-01 14:50:00', 'She Loves Bats', 1917, 2, 3),
(30, '2023-01-01 15:00:00', 'She Loves Bats', 2764, 2, 3),
(31, '2023-01-01 15:10:00', 'Sadness', 1445, 2, 3),
(32, '2023-01-01 15:20:00', 'Sadness', 1881, 2, 3),
(33, '2023-01-01 15:30:00', 'Sadness', 2179, 2, 1),
(34, '2023-01-01 15:40:00', 'Sadness', 2342, 2, 1),
(35, '2023-01-01 15:50:00', 'Sadness', 2721, 2, 2),
(36, '2023-01-01 16:00:00', 'Halo', 1151, 3, 1),
(37, '2023-01-01 16:10:00', 'Halo', 1383, 3, 1),
(38, '2023-01-01 16:20:00', 'Halo', 2103, 3, 2),
(39, '2023-01-01 16:30:00', 'Halo', 1946, 3, 1),
(40, '2023-01-01 16:40:00', 'Halo', 2383, 3, 3),
(41, '2023-01-01 16:50:00', 'The History of Chocolate', 2381, 1, 1),
(42, '2023-01-01 17:00:00', 'The History of Chocolate', 2625, 1, 2),
(43, '2023-01-01 17:10:00', 'The History of Chocolate', 3025, 1, 2),
(44, '2023-01-01 17:20:00', 'The History of Chocolate', 3710, 1, 2),
(45, '2023-01-01 17:30:00', 'The History of Chocolate', 3529, 1, 3),
(46, '2023-01-01 17:40:00', 'A Field Back Home', 1499, 4, 1),
(47, '2023-01-01 17:50:00', 'A Field Back Home', 1933, 4, 3),
(48, '2023-01-01 18:00:00', 'A Field Back Home', 2409, 4, 1),
(49, '2023-01-01 18:10:00', 'A Field Back Home', 2732, 4, 1),
(50, '2023-01-01 18:20:00', 'A Field Back Home', 3375, 4, 1),
(51, '2023-01-01 18:30:00', 'Emptiness Versus As Least Some', 1660, 1, 1),
(52, '2023-01-01 18:40:00', 'Emptiness Versus As Least Some', 2113, 1, 3),
(53, '2023-01-01 18:50:00', 'Emptiness Versus As Least Some', 2470, 1, 3),
(54, '2023-01-01 19:00:00', 'Emptiness Versus As Least Some', 2269, 1, 3),
(55, '2023-01-01 19:10:00', 'Emptiness Versus As Least Some', 3044, 1, 3),
(56, '2023-01-01 19:20:00', 'Hounds', 1159, 1, 3),
(57, '2023-01-01 19:30:00', 'Hounds', 1449, 1, 2),
(58, '2023-01-01 19:40:00', 'Hounds', 1857, 1, 3),
(59, '2023-01-01 19:50:00', 'Hounds', 2047, 1, 1),
(60, '2023-01-01 20:00:00', 'Hounds', 2595, 1, 1),
(61, '2023-01-01 20:10:00', 'Heavy Water', 2623, 2, 3),
(62, '2023-01-01 20:20:00', 'Heavy Water', 2939, 2, 2),
(63, '2023-01-01 20:30:00', 'Heavy Water', 3117, 2, 3),
(64, '2023-01-01 20:40:00', 'Heavy Water', 3598, 2, 1),
(65, '2023-01-01 20:50:00', 'Heavy Water', 3619, 2, 1),
(66, '2023-01-01 21:00:00', 'From Edinburgh to London', 2584, 2, 3),
(67, '2023-01-01 21:10:00', 'From Edinburgh to London', 2847, 2, 3),
(68, '2023-01-01 21:20:00', 'From Edinburgh to London', 3494, 2, 3),
(69, '2023-01-01 21:30:00', 'From Edinburgh to London', 3787, 2, 2),
(70, '2023-01-01 21:40:00', 'From Edinburgh to London', 4132, 2, 1),
(71, '2023-01-01 21:50:00', 'The Fall', 2394, 3, 1),
(72, '2023-01-01 22:00:00', 'The Fall', 2680, 3, 1),
(73, '2023-01-01 22:10:00', 'The Fall', 3388, 3, 3),
(74, '2023-01-01 22:20:00', 'The Fall', 3171, 3, 1),
(75, '2023-01-01 22:30:00', 'The Fall', 4358, 3, 1),
(76, '2023-01-01 22:40:00', 'Burning', 1850, 2, 2),
(77, '2023-01-01 22:50:00', 'Burning', 2322, 2, 1),
(78, '2023-01-01 23:00:00', 'Burning', 2750, 2, 1),
(79, '2023-01-01 23:10:00', 'Burning', 3104, 2, 3),
(80, '2023-01-01 23:20:00', 'Burning', 3494, 2, 3),
(81, '2023-01-01 23:30:00', 'Campfires', 2248, 4, 3),
(82, '2023-01-01 23:40:00', 'Campfires', 2658, 4, 3),
(83, '2023-01-01 23:50:00', 'Campfires', 3088, 4, 2),
(84, '2023-01-02 00:00:00', 'Campfires', 3370, 4, 3),
(85, '2023-01-02 00:10:00', 'Campfires', 4012, 4, 1),
(86, '2023-01-02 00:20:00', 'Radioactive Isotope', 2585, 4, 2),
(87, '2023-01-02 00:30:00', 'Radioactive Isotope', 2873, 4, 2),
(88, '2023-01-02 00:40:00', 'Radioactive Isotope', 3009, 4, 2),
(89, '2023-01-02 00:50:00', 'Radioactive Isotope', 3824, 4, 2),
(90, '2023-01-02 01:00:00', 'Radioactive Isotope', 4001, 4, 1),
(91, '2023-01-02 01:10:00', 'The Missing Painting', 1975, 4, 2),
(92, '2023-01-02 01:20:00', 'The Missing Painting', 2341, 4, 2),
(93, '2023-01-02 01:30:00', 'The Missing Painting', 2615, 4, 1),
(94, '2023-01-02 01:40:00', 'The Missing Painting', 2731, 4, 2),
(95, '2023-01-02 01:50:00', 'The Missing Painting', 2971, 4, 2),
(96, '2023-01-02 02:00:00', 'Artwork_20', 2693, 2, 1),
(97, '2023-01-02 02:10:00', 'Artwork_20', 3017, 3, 2),
(98, '2023-01-02 02:20:00', 'Artwork_20', 3201, 4, 2),
(99, '2023-01-02 02:30:00', 'Artwork_20', 3677, 3, 2),
(100, '2023-01-02 02:40:00', 'Artwork_20', 4117, 2, 3);

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
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
