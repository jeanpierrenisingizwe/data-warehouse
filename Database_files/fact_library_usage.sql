-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_dw`
--

-- --------------------------------------------------------

--
-- Table structure for table `fact_library_usage`
--

CREATE TABLE `fact_library_usage` (
  `fact_id` int(11) NOT NULL,
  `date_key` int(11) DEFAULT NULL,
  `student_key` int(11) DEFAULT NULL,
  `book_key` int(11) DEFAULT NULL,
  `faculty_key` int(11) DEFAULT NULL,
  `room_key` int(11) DEFAULT NULL,
  `downloads` int(11) DEFAULT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `booking_hours` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fact_library_usage`
--

INSERT INTO `fact_library_usage` (`fact_id`, `date_key`, `student_key`, `book_key`, `faculty_key`, `room_key`, `downloads`, `duration_minutes`, `booking_hours`) VALUES
(1, 1, 1, 1, NULL, 1, 0, 0, 0.00),
(2, 2, 2, 2, NULL, 1, 0, 0, 0.00),
(3, 3, 3, 3, NULL, 1, 0, 0, 0.00),
(4, 4, 4, 4, NULL, NULL, 0, 0, 0.00),
(5, 5, 5, 5, NULL, NULL, 0, 0, 0.00),
(6, 6, 6, 6, NULL, NULL, 0, 0, 0.00),
(7, 7, 1, 7, NULL, NULL, 0, 0, 0.00),
(8, 8, 7, 8, NULL, NULL, 0, 0, 0.00),
(9, 9, 8, 9, NULL, NULL, 0, 0, 0.00),
(10, 10, 9, 10, NULL, NULL, 0, 0, 0.00),
(16, 1, NULL, NULL, 1, NULL, 1, 45, 0.00),
(17, 1, NULL, NULL, 1, NULL, 5, 0, 0.00),
(18, 1, NULL, NULL, 1, NULL, 3, 120, 0.00),
(19, 2, NULL, NULL, 2, NULL, 2, 30, 0.00),
(20, 2, NULL, NULL, 3, NULL, 1, 0, 0.00),
(21, 2, NULL, NULL, 4, NULL, 4, 90, 0.00),
(22, 3, NULL, NULL, 1, NULL, 1, 60, 0.00),
(23, 3, NULL, NULL, 1, NULL, 2, 45, 0.00),
(24, 3, NULL, NULL, 1, NULL, 6, 0, 0.00),
(25, 4, NULL, NULL, 2, NULL, 3, 75, 0.00),
(26, 4, NULL, NULL, 3, NULL, 1, 40, 0.00),
(27, 4, NULL, NULL, 4, NULL, 2, 0, 0.00),
(28, 5, NULL, NULL, 1, NULL, 5, 150, 0.00),
(29, 5, NULL, NULL, 1, NULL, 1, 35, 0.00),
(30, 5, NULL, NULL, 1, NULL, 23, 20, 0.00),
(31, 11, 1, NULL, NULL, 1, 0, 0, 2.00),
(32, 11, NULL, NULL, NULL, 1, 0, 0, 3.50),
(33, 12, 2, NULL, NULL, 2, 0, 0, 1.00),
(34, 12, 3, NULL, NULL, 3, 0, 0, 2.50),
(35, 13, 4, NULL, NULL, 4, 0, 0, 3.00),
(36, 13, NULL, NULL, NULL, 3, 0, 0, 2.00),
(37, 14, 1, NULL, NULL, 5, 0, 0, 2.00),
(38, 14, 5, NULL, NULL, 5, 0, 0, 1.50),
(39, 15, 6, NULL, NULL, 1, 0, 0, 3.00),
(40, 15, NULL, NULL, NULL, 6, 0, 0, 4.00),
(41, 16, 7, NULL, NULL, 1, 0, 0, 2.00),
(42, 16, 8, NULL, NULL, 3, 0, 0, 2.00),
(43, 16, 8, NULL, NULL, 3, 0, 0, 2.00),
(44, 16, NULL, NULL, NULL, 2, 0, 0, 1.50),
(45, 17, 9, NULL, NULL, 3, 0, 0, 3.50),
(46, 18, NULL, NULL, NULL, 4, 0, 0, 2.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fact_library_usage`
--
ALTER TABLE `fact_library_usage`
  ADD PRIMARY KEY (`fact_id`),
  ADD KEY `idx_fact_student` (`student_key`),
  ADD KEY `idx_fact_book` (`book_key`),
  ADD KEY `idx_fact_faculty` (`faculty_key`),
  ADD KEY `idx_fact_room` (`room_key`),
  ADD KEY `idx_fact_date` (`date_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fact_library_usage`
--
ALTER TABLE `fact_library_usage`
  MODIFY `fact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fact_library_usage`
--
ALTER TABLE `fact_library_usage`
  ADD CONSTRAINT `fact_library_usage_ibfk_1` FOREIGN KEY (`date_key`) REFERENCES `dim_date` (`date_key`),
  ADD CONSTRAINT `fact_library_usage_ibfk_2` FOREIGN KEY (`student_key`) REFERENCES `dim_student` (`student_key`),
  ADD CONSTRAINT `fact_library_usage_ibfk_3` FOREIGN KEY (`book_key`) REFERENCES `dim_book` (`book_key`),
  ADD CONSTRAINT `fact_library_usage_ibfk_4` FOREIGN KEY (`faculty_key`) REFERENCES `dim_faculty` (`faculty_key`),
  ADD CONSTRAINT `fact_library_usage_ibfk_5` FOREIGN KEY (`room_key`) REFERENCES `dim_room` (`room_key`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
