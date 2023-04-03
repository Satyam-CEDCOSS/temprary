-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-server
-- Generation Time: Apr 03, 2023 at 11:44 AM
-- Server version: 8.0.19
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total_amount` varchar(20) DEFAULT NULL,
  `shipping_address` varchar(100) DEFAULT NULL,
  `shipping_pincode` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `user_id`, `status`, `total_amount`, `shipping_address`, `shipping_pincode`, `order_date`, `delivery_date`) VALUES
(3101, 3, 'pending', '80000', 'Nagpur', '440001', '2023-04-01 00:00:00', '2023-04-06 00:00:00'),
(3103, 3, 'pending', '18000', 'Nagpur', '440001', '2023-04-01 00:00:00', '2023-04-06 00:00:00'),
(4102, 4, 'pending', '4000', 'Delhi', '110001', '2023-04-01 00:00:00', '2023-04-06 00:00:00'),
(4104, 4, 'pending', '9000', 'Delhi', '110001', '2023-04-01 00:00:00', '2023-04-06 00:00:00'),
(5101, 5, 'pending', '40000', 'Nagpur', '440001', '2023-04-01 00:00:00', '2023-04-06 00:00:00'),
(5105, 5, 'pending', '70000', 'Nagpur', '440001', '2023-04-01 00:00:00', '2023-04-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Items`
--

CREATE TABLE `Order_Items` (
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `discount` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Order_Items`
--

INSERT INTO `Order_Items` (`order_id`, `product_id`, `discount`, `quantity`) VALUES
(3101, 101, '16000', '2'),
(3103, 103, '3000', '6'),
(4102, 102, '2000', '4'),
(4104, 104, '6000', '3'),
(5101, 101, '7000', '1'),
(5105, 105, '3500', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_category` varchar(100) DEFAULT NULL,
  `product_sale_price` varchar(20) DEFAULT NULL,
  `product_list_price` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`product_id`, `product_name`, `product_image`, `product_category`, `product_sale_price`, `product_list_price`) VALUES
(101, 'Smart Phone', 'img', 'electronics', '40000', '32999'),
(102, 'T-Shirt', 'img', 'fashion', '1000', '499'),
(103, 'Utensils', 'img', 'home appliances', '3000', '2499'),
(104, 'Chair', 'img', 'furniture', '3000', '999'),
(105, 'Ring', 'img', 'jewellery', '70000', '66499');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password`, `firstname`, `lastname`, `email`, `role`, `address`, `pincode`) VALUES
(1, 'Satyam', 'sat123', 'satyam', 'bajpai', 'satyam@gmail.com', 'admin', 'Delhi', '110001'),
(2, 'Anuj', 'anuj123', 'anuj', 'maurya', 'anuj@gmail.com', 'manager', 'Nagpur', '440001'),
(3, 'Ayush', 'anuj123', 'ayush', 'gupta', 'ayush@gmail.com', 'customers', 'Nagpur', '440001'),
(4, 'Deeksha', 'dee123', 'deeksha', 'pandey', 'deeksha@gmail.com', 'customers', 'Delhi', '110001'),
(5, 'Mansi', 'man123', 'mansi', 'bisaria', 'mansi@gmail.com', 'customers', 'Nagpur', '440001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `Order_Items` (`order_id`);

--
-- Constraints for table `Order_Items`
--
ALTER TABLE `Order_Items`
  ADD CONSTRAINT `Order_Items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
