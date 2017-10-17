-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2017 at 09:48 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `searchandgo`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_ID` tinyint(11) NOT NULL,
  `store_ID` tinyint(11) NOT NULL,
  `product_ID` tinyint(11) NOT NULL,
  `price` double NOT NULL,
  `inSTOCK?` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemtype`
--

CREATE TABLE `itemtype` (
  `type_ID` tinyint(11) NOT NULL,
  `type_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` tinyint(11) NOT NULL,
  `store_ID` tinyint(11) NOT NULL,
  `product_ID` tinyint(11) NOT NULL,
  `items_ID` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` tinyint(11) NOT NULL,
  `Name` varchar(35) NOT NULL,
  `Description` mediumtext NOT NULL,
  `type_ID` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_ID` tinyint(11) NOT NULL,
  `store_Name` varchar(55) NOT NULL,
  `store_Contact` varchar(55) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_ID`),
  ADD UNIQUE KEY `store_ID` (`store_ID`),
  ADD UNIQUE KEY `product_ID` (`product_ID`),
  ADD KEY `item_ID` (`item_ID`);

--
-- Indexes for table `itemtype`
--
ALTER TABLE `itemtype`
  ADD PRIMARY KEY (`type_ID`),
  ADD KEY `type_ID` (`type_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD UNIQUE KEY `order_ID` (`order_ID`),
  ADD UNIQUE KEY `store_ID` (`store_ID`),
  ADD UNIQUE KEY `product_ID` (`product_ID`),
  ADD UNIQUE KEY `items_ID` (`items_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`),
  ADD UNIQUE KEY `type_ID` (`type_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_ID`),
  ADD KEY `store_ID` (`store_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`store_ID`) REFERENCES `stores` (`store_ID`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `products` (`product_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`store_ID`) REFERENCES `stores` (`store_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `products` (`product_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type_ID`) REFERENCES `itemtype` (`type_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
