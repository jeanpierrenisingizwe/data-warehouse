-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:53 PM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:54 PM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2026 at 05:54 PM
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
