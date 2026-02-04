-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2026 at 08:50 AM
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
-- Table structure for table `book_transactions`
--

CREATE TABLE `book_transactions` (
  `TransactionID` int(11) NOT NULL,
  `StudentID` varchar(20) NOT NULL,
  `BookISBN` varchar(20) NOT NULL,
  `CheckoutDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  `Department` varchar(50) NOT NULL,
  `BookCategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_transactions`
--

INSERT INTO `book_transactions` (`TransactionID`, `StudentID`, `BookISBN`, `CheckoutDate`, `ReturnDate`, `Department`, `BookCategory`) VALUES
(1001, 'STU-2024-001', '978-0134685991', '2024-01-15', '2024-02-10', 'CS', 'Textbook'),
(1002, 'STU-2024-002', '978-0134685992', '2024-01-16', NULL, 'Computer Science', 'Fiction'),
(1003, 'STU-2024-003', '978-0134685993', '2024-01-17', '2024-02-20', 'CompSci', 'Reference'),
(1004, 'STU-2024-004', '978-0134685994', '2024-01-18', '2024-02-15', 'CS', 'Textbook'),
(1005, 'STU-2024-005', '978-0134685995', '2024-01-20', NULL, 'Engineering', 'Reference'),
(1006, 'STU-2024-006', '978-0134685996', '2024-01-22', '2024-02-25', 'ENG', 'Textbook'),
(1007, 'STU-2024-001', '978-0134685997', '2024-01-25', '2024-02-28', 'Computer Science', 'Fiction'),
(1008, 'STU-2024-007', '978-0134685998', '2024-02-01', NULL, 'Engr', 'Reference'),
(1009, 'STU-2024-008', '978-0134685999', '2024-02-05', '2024-03-01', 'CS', 'Fiction'),
(1010, 'STU-2024-009', '978-0134686000', '2024-02-10', '2024-03-05', 'CompSci', 'Textbook');

-- --------------------------------------------------------

--
-- Table structure for table `dim_book`
--

CREATE TABLE `dim_book` (
  `book_key` int(11) NOT NULL,
  `book_isbn` varchar(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_book`
--

INSERT INTO `dim_book` (`book_key`, `book_isbn`, `category`) VALUES
(1, '978-0134685991', 'Textbook'),
(2, '978-0134685992', 'Fiction'),
(3, '978-0134685993', 'Reference'),
(4, '978-0134685994', 'Textbook'),
(5, '978-0134685995', 'Reference'),
(6, '978-0134685996', 'Textbook'),
(7, '978-0134685997', 'Fiction'),
(8, '978-0134685998', 'Reference'),
(9, '978-0134685999', 'Fiction'),
(10, '978-0134686000', 'Textbook');

-- --------------------------------------------------------

--
-- Table structure for table `dim_date`
--

CREATE TABLE `dim_date` (
  `date_key` int(11) NOT NULL,
  `full_date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_date`
--

INSERT INTO `dim_date` (`date_key`, `full_date`, `year`, `month`, `day`) VALUES
(1, '2024-01-15', 2024, 1, 15),
(2, '2024-01-16', 2024, 1, 16),
(3, '2024-01-17', 2024, 1, 17),
(4, '2024-01-18', 2024, 1, 18),
(5, '2024-01-20', 2024, 1, 20),
(6, '2024-01-22', 2024, 1, 22),
(7, '2024-01-25', 2024, 1, 25),
(8, '2024-02-01', 2024, 2, 1),
(9, '2024-02-05', 2024, 2, 5),
(10, '2024-02-10', 2024, 2, 10),
(11, '2024-03-15', 2024, 3, 15),
(12, '2024-03-16', 2024, 3, 16),
(13, '2024-03-17', 2024, 3, 17),
(14, '2024-03-18', 2024, 3, 18),
(15, '2024-03-19', 2024, 3, 19),
(16, '2024-03-20', 2024, 3, 20),
(17, '2024-03-21', 2024, 3, 21),
(18, '2024-03-22', 2024, 3, 22);

-- --------------------------------------------------------

--
-- Table structure for table `dim_faculty`
--

CREATE TABLE `dim_faculty` (
  `faculty_key` int(11) NOT NULL,
  `faculty_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_faculty`
--

INSERT INTO `dim_faculty` (`faculty_key`, `faculty_name`) VALUES
(1, 'Engineering'),
(2, 'Computer Science'),
(3, 'Computer Science'),
(4, 'Computer Science');

-- --------------------------------------------------------

--
-- Table structure for table `dim_room`
--

CREATE TABLE `dim_room` (
  `room_key` int(11) NOT NULL,
  `room_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_room`
--

INSERT INTO `dim_room` (`room_key`, `room_number`) VALUES
(1, 'R101'),
(2, 'R101'),
(3, 'R102'),
(4, 'R102'),
(5, 'R103'),
(6, 'R103');

-- --------------------------------------------------------

--
-- Table structure for table `dim_student`
--

CREATE TABLE `dim_student` (
  `student_key` int(11) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dim_student`
--

INSERT INTO `dim_student` (`student_key`, `student_id`, `department`) VALUES
(1, 'STU-2024-001', 'Computer Science'),
(2, 'STU-2024-002', 'Computer Science'),
(3, 'STU-2024-003', 'Computer Science'),
(4, 'STU-2024-004', 'Computer Science'),
(5, 'STU-2024-005', 'Engineering'),
(6, 'STU-2024-006', 'Engineering'),
(7, 'STU-2024-007', 'Engineering'),
(8, 'STU-2024-008', 'Computer Science'),
(9, 'STU-2024-009', 'Computer Science');

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

-- --------------------------------------------------------

--
-- Table structure for table `stg_book_transactions`
--

CREATE TABLE `stg_book_transactions` (
  `TransactionID` int(11) DEFAULT NULL,
  `StudentID` varchar(20) DEFAULT NULL,
  `BookISBN` varchar(20) DEFAULT NULL,
  `CheckoutDate` varchar(50) DEFAULT NULL,
  `ReturnDate` varchar(50) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `BookCategory` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stg_book_transactions`
--

INSERT INTO `stg_book_transactions` (`TransactionID`, `StudentID`, `BookISBN`, `CheckoutDate`, `ReturnDate`, `Department`, `BookCategory`) VALUES
(1001, 'STU-2024-001', '978-0134685991', '2024-01-15', '2024-02-10', 'Computer Science', 'Textbook'),
(1002, 'STU-2024-002', '978-0134685992', '2024-01-16', NULL, 'Computer Science', 'Fiction'),
(1003, 'STU-2024-003', '978-0134685993', '2024-01-17', '2024-02-20', 'Computer Science', 'Reference'),
(1004, 'STU-2024-004', '978-0134685994', '2024-01-18', '2024-02-15', 'Computer Science', 'Textbook'),
(1005, 'STU-2024-005', '978-0134685995', '2024-01-20', NULL, 'Engineering', 'Reference'),
(1006, 'STU-2024-006', '978-0134685996', '2024-01-22', '2024-02-25', 'Eng', 'Textbook'),
(1007, 'STU-2024-001', '978-0134685997', '2024-01-25', '2024-02-28', 'Computer Science', 'Fiction'),
(1008, 'STU-2024-007', '978-0134685998', '2024-02-01', NULL, 'Engr', 'Reference'),
(1009, 'STU-2024-008', '978-0134685999', '2024-02-05', '2024-03-01', 'Computer Science', 'Fiction'),
(1010, 'STU-2024-009', '978-0134686000', '2024-02-10', '2024-03-05', 'Computer Science', 'Textbook');

-- --------------------------------------------------------

--
-- Table structure for table `stg_digital_usage`
--

CREATE TABLE `stg_digital_usage` (
  `UsageDate` varchar(50) DEFAULT NULL,
  `UserType` varchar(50) DEFAULT NULL,
  `ResourceType` varchar(50) DEFAULT NULL,
  `Faculty` varchar(50) DEFAULT NULL,
  `DownloadCount` int(11) DEFAULT NULL,
  `Duration_Minutes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stg_digital_usage`
--

INSERT INTO `stg_digital_usage` (`UsageDate`, `UserType`, `ResourceType`, `Faculty`, `DownloadCount`, `Duration_Minutes`) VALUES
('2024-01-15', 'Student', 'E-Book', 'Engineering', 1, 45),
('2024-01-15', 'Grad Student', 'E-Book', 'Engineering', 5, 0),
('2024-01-15', 'Faculty', 'Journal', 'Engineering', 3, 120),
('2024-01-16', 'Student', 'Article', 'Cs', 2, 30),
('2024-01-16', 'Staff', 'E-Book', 'Computer Science', 1, 0),
('2024-01-16', 'Grad Student', 'E-Book', 'Compsci', 4, 90),
('2024-01-17', 'Student', 'Journal', 'Engineering', 1, 60),
('2024-01-17', 'Faculty', 'Article', 'Engineering', 2, 45),
('2024-01-17', 'Student', 'E-Book', 'Engineering', 6, 0),
('2024-01-18', 'Grad Student', 'E-Book', 'Cs', 3, 75),
('2024-01-18', 'Staff', 'Journal', 'Computer Science', 1, 40),
('2024-01-18', 'Student', 'Article', 'Compsci', 2, 0),
('2024-01-20', 'Faculty', 'E-Book', 'Engineering', 5, 150),
('2024-01-20', 'Student', 'E-Book', 'Engineering', 1, 35),
('2024-01-20', 'Grad Student', 'Journal', 'Engineering', 23, 20);

-- --------------------------------------------------------

--
-- Table structure for table `stg_room_bookings`
--

CREATE TABLE `stg_room_bookings` (
  `BookingID` int(11) DEFAULT NULL,
  `RoomNumber` varchar(50) DEFAULT NULL,
  `BookingDate` varchar(50) DEFAULT NULL,
  `TimeSlot` varchar(50) DEFAULT NULL,
  `StudentID` varchar(20) DEFAULT NULL,
  `DurationHours` decimal(5,2) DEFAULT NULL,
  `Purpose` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stg_room_bookings`
--

INSERT INTO `stg_room_bookings` (`BookingID`, `RoomNumber`, `BookingDate`, `TimeSlot`, `StudentID`, `DurationHours`, `Purpose`) VALUES
(5001, 'R101', '2024-03-15', 'Morning', 'STU-2024-001', 2.00, 'Study'),
(5002, 'R101', '2024-03-15', '8AM-10AM', NULL, 3.50, 'Group Project'),
(5003, '101', '2024-03-16', 'AM', 'STU-2024-002', 1.00, 'Meeting'),
(5004, 'R102', '2024-03-16', 'Afternoon', 'STU-2024-003', 2.50, 'Study'),
(5005, 'R102', '2024-03-17', '2PM-4PM', NULL, 2.00, 'Group Project'),
(5006, '102', '2024-03-17', 'PM', 'STU-2024-004', 3.00, 'Study'),
(5007, 'R103', '2024-03-18', 'Morning', 'STU-2024-005', 1.50, 'Meeting'),
(5008, 'R103', '2024-03-18', '10AM-12PM', 'STU-2024-001', 2.00, 'Study'),
(5009, '103', '2024-03-19', 'Evening', NULL, 4.00, 'Group Project'),
(5010, 'R101', '2024-03-19', '6PM-9PM', 'STU-2024-006', 3.00, 'Study'),
(5011, 'R101', '2024-03-20', 'Morning', 'STU-2024-007', 2.00, 'Meeting'),
(5012, '101', '2024-03-20', 'AM', NULL, 1.50, 'Study'),
(5013, 'R102', '2024-03-20', 'Morning', 'STU-2024-008', 2.00, 'Study'),
(5014, 'R102', '2024-03-20', 'Morning', 'STU-2024-008', 2.00, 'Study'),
(5015, 'R102', '2024-03-21', 'Afternoon', 'STU-2024-009', 3.50, 'Group Project'),
(5016, '102', '2024-03-22', '3PM-5PM', NULL, 2.00, 'Meeting');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_cs_fact`
-- (See below for the actual view)
--
CREATE TABLE `vw_cs_fact` (
`fact_id` int(11)
,`date_key` int(11)
,`student_key` int(11)
,`book_key` int(11)
,`faculty_key` int(11)
,`room_key` int(11)
,`downloads` int(11)
,`duration_minutes` int(11)
,`booking_hours` decimal(5,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_dept_category_pivot`
-- (See below for the actual view)
--
CREATE TABLE `vw_dept_category_pivot` (
`department` varchar(50)
,`Science` decimal(32,0)
,`Math` decimal(32,0)
,`Arts` decimal(32,0)
,`Total_Downloads` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_dim_student_masked`
-- (See below for the actual view)
--
CREATE TABLE `vw_dim_student_masked` (
`student_key` int(11)
,`student_id_masked` varchar(12)
,`department` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_exec_downloads_by_faculty`
-- (See below for the actual view)
--
CREATE TABLE `vw_exec_downloads_by_faculty` (
`faculty_name` varchar(50)
,`total_downloads` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_exec_top_categories`
-- (See below for the actual view)
--
CREATE TABLE `vw_exec_top_categories` (
`category` varchar(50)
,`total_downloads` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_exec_usage_trend`
-- (See below for the actual view)
--
CREATE TABLE `vw_exec_usage_trend` (
`year` int(11)
,`month` int(11)
,`total_downloads` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_ops_daily_activity`
-- (See below for the actual view)
--
CREATE TABLE `vw_ops_daily_activity` (
`full_date` date
,`transactions` bigint(21)
,`downloads` decimal(32,0)
,`total_minutes` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_ops_room_usage`
-- (See below for the actual view)
--
CREATE TABLE `vw_ops_room_usage` (
`room_number` varchar(20)
,`total_hours` decimal(27,2)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_cs_fact`
--
DROP TABLE IF EXISTS `vw_cs_fact`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_cs_fact`  AS SELECT `fl`.`fact_id` AS `fact_id`, `fl`.`date_key` AS `date_key`, `fl`.`student_key` AS `student_key`, `fl`.`book_key` AS `book_key`, `fl`.`faculty_key` AS `faculty_key`, `fl`.`room_key` AS `room_key`, `fl`.`downloads` AS `downloads`, `fl`.`duration_minutes` AS `duration_minutes`, `fl`.`booking_hours` AS `booking_hours` FROM (`fact_library_usage` `fl` join `dim_student` `s` on(`fl`.`student_key` = `s`.`student_key`)) WHERE `s`.`department` = 'Computer Science' ;

-- --------------------------------------------------------

--
-- Structure for view `vw_dept_category_pivot`
--
DROP TABLE IF EXISTS `vw_dept_category_pivot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dept_category_pivot`  AS SELECT `s`.`department` AS `department`, sum(case when `b`.`category` = 'Science' then `fl`.`downloads` else 0 end) AS `Science`, sum(case when `b`.`category` = 'Math' then `fl`.`downloads` else 0 end) AS `Math`, sum(case when `b`.`category` = 'Arts' then `fl`.`downloads` else 0 end) AS `Arts`, sum(`fl`.`downloads`) AS `Total_Downloads` FROM ((`fact_library_usage` `fl` join `dim_student` `s` on(`fl`.`student_key` = `s`.`student_key`)) join `dim_book` `b` on(`fl`.`book_key` = `b`.`book_key`)) GROUP BY `s`.`department` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_dim_student_masked`
--
DROP TABLE IF EXISTS `vw_dim_student_masked`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_dim_student_masked`  AS SELECT `dim_student`.`student_key` AS `student_key`, 'STU-XXXX-XXX' AS `student_id_masked`, `dim_student`.`department` AS `department` FROM `dim_student` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_exec_downloads_by_faculty`
--
DROP TABLE IF EXISTS `vw_exec_downloads_by_faculty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_exec_downloads_by_faculty`  AS SELECT `f`.`faculty_name` AS `faculty_name`, sum(`fl`.`downloads`) AS `total_downloads` FROM (`fact_library_usage` `fl` join `dim_faculty` `f` on(`fl`.`faculty_key` = `f`.`faculty_key`)) GROUP BY `f`.`faculty_name` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_exec_top_categories`
--
DROP TABLE IF EXISTS `vw_exec_top_categories`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_exec_top_categories`  AS SELECT `b`.`category` AS `category`, sum(`fl`.`downloads`) AS `total_downloads` FROM (`fact_library_usage` `fl` join `dim_book` `b` on(`fl`.`book_key` = `b`.`book_key`)) GROUP BY `b`.`category` ORDER BY sum(`fl`.`downloads`) DESC LIMIT 0, 5 ;

-- --------------------------------------------------------

--
-- Structure for view `vw_exec_usage_trend`
--
DROP TABLE IF EXISTS `vw_exec_usage_trend`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_exec_usage_trend`  AS SELECT `d`.`year` AS `year`, `d`.`month` AS `month`, sum(`fl`.`downloads`) AS `total_downloads` FROM (`fact_library_usage` `fl` join `dim_date` `d` on(`fl`.`date_key` = `d`.`date_key`)) GROUP BY `d`.`year`, `d`.`month` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_ops_daily_activity`
--
DROP TABLE IF EXISTS `vw_ops_daily_activity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ops_daily_activity`  AS SELECT `d`.`full_date` AS `full_date`, count(`fl`.`fact_id`) AS `transactions`, sum(`fl`.`downloads`) AS `downloads`, sum(`fl`.`duration_minutes`) AS `total_minutes` FROM (`fact_library_usage` `fl` join `dim_date` `d` on(`fl`.`date_key` = `d`.`date_key`)) GROUP BY `d`.`full_date` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_ops_room_usage`
--
DROP TABLE IF EXISTS `vw_ops_room_usage`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_ops_room_usage`  AS SELECT `r`.`room_number` AS `room_number`, sum(`fl`.`booking_hours`) AS `total_hours` FROM (`fact_library_usage` `fl` join `dim_room` `r` on(`fl`.`room_key` = `r`.`room_key`)) GROUP BY `r`.`room_number` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_transactions`
--
ALTER TABLE `book_transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `idx_student` (`StudentID`),
  ADD KEY `idx_checkout_date` (`CheckoutDate`),
  ADD KEY `idx_department` (`Department`);

--
-- Indexes for table `dim_book`
--
ALTER TABLE `dim_book`
  ADD PRIMARY KEY (`book_key`);

--
-- Indexes for table `dim_date`
--
ALTER TABLE `dim_date`
  ADD PRIMARY KEY (`date_key`);

--
-- Indexes for table `dim_faculty`
--
ALTER TABLE `dim_faculty`
  ADD PRIMARY KEY (`faculty_key`);

--
-- Indexes for table `dim_room`
--
ALTER TABLE `dim_room`
  ADD PRIMARY KEY (`room_key`);

--
-- Indexes for table `dim_student`
--
ALTER TABLE `dim_student`
  ADD PRIMARY KEY (`student_key`);

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
-- AUTO_INCREMENT for table `dim_book`
--
ALTER TABLE `dim_book`
  MODIFY `book_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dim_date`
--
ALTER TABLE `dim_date`
  MODIFY `date_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dim_faculty`
--
ALTER TABLE `dim_faculty`
  MODIFY `faculty_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dim_room`
--
ALTER TABLE `dim_room`
  MODIFY `room_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dim_student`
--
ALTER TABLE `dim_student`
  MODIFY `student_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
