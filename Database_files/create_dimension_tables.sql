-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:49 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_date`
--
ALTER TABLE `dim_date`
  ADD PRIMARY KEY (`date_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_date`
--
ALTER TABLE `dim_date`
  MODIFY `date_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:51 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_room`
--
ALTER TABLE `dim_room`
  ADD PRIMARY KEY (`room_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_room`
--
ALTER TABLE `dim_room`
  MODIFY `room_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:52 PM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_student`
--
ALTER TABLE `dim_student`
  ADD PRIMARY KEY (`student_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_student`
--
ALTER TABLE `dim_student`
  MODIFY `student_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_faculty`
--
ALTER TABLE `dim_faculty`
  ADD PRIMARY KEY (`faculty_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_faculty`
--
ALTER TABLE `dim_faculty`
  MODIFY `faculty_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
