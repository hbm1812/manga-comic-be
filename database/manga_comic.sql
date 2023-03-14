-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2023 at 03:36 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manga_comic`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`) VALUES
(1, 'huy12', 'huy.student@gmail.com', 'Admin', '123456'),
(2, 'minh12', 'minh.teacher@gmail.com', 'Teacher', '123'),
(3, 'caobui', 'cao.student@gmail.com', 'student', '123'),
(4, 'huyPostman', 'huy.Postman@gmail.com', 'AdminPostman', '123456Postman'),
(8, 'huyadmin', '123@gmail.com', 'Admin', '123'),
(9, 'huyadmin2', 'huy123@gmail.com', 'Admin', '123'),
(10, 'huyadmin2', 'huy123@gmail.com', 'Admin', '123'),
(11, 'huyadmin123', 'huy12@gmail.com', 'Admin', '123'),
(12, 'huyadmin123', 'huy12@gmail.com', 'Admin', '123'),
(13, 'huytestModal', 'huy12@gmail.com', 'Admin', '123'),
(62, 'huytestusername', '123@gmail.com', 'Admin', '123'),
(63, 'huytestToastify', 'huy12@gmail.com', 'Admin', '123'),
(64, 'huyToastify1', 'huy12@gmail.com', 'Admin', '123'),
(65, 'huy12Toast', 'huy12@gmail.com', 'Admin', '123'),
(66, 'huy12Toast1', 'huy12@gmail.com', 'Admin', '123'),
(67, 'huy12aa', 'huy12@gmail.com', 'Admin', '123'),
(68, 'huy12testupdate', 'huy12@gmail.com', 'user', '123'),
(69, 'huyupdate2edit', 'huy12@gmail.com', 'Admin', '123'),
(70, 'huytestvalue', 'huy12@gmail.com', 'Admin', '123'),
(71, 'huyclearcreate', 'huy12@gmail.com', 'Admin', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
