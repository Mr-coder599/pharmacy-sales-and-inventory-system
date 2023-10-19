-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 04, 2022 at 08:18 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pharmacy_db`
--
CREATE DATABASE IF NOT EXISTS `pharmacy_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pharmacy_db`;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE IF NOT EXISTS `category_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Vitamins'),
(2, 'Antipyretics'),
(3, 'Analgesics'),
(4, 'Antibiotics'),
(5, 'Antiseptics'),
(6, 'Mood stabilizers'),
(7, 'CNS'),
(8, 'Sample Category');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE IF NOT EXISTS `customer_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `name`, `contact`, `address`) VALUES
(1, 'Customer', '+123456789', 'Sample address'),
(2, 'ASIMIYU HAMMED', '08144509192', 'No. 2 Osogbo ');

-- --------------------------------------------------------

--
-- Table structure for table `expired_product`
--

CREATE TABLE IF NOT EXISTS `expired_product` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `date_expired` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `expired_product`
--

INSERT INTO `expired_product` (`id`, `product_id`, `qty`, `date_expired`, `date_created`) VALUES
(3, 6, 5, '2020-10-05', '2020-10-09 08:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1= stockin , 2 = stockout',
  `stock_from` varchar(100) NOT NULL COMMENT 'sales/receiving',
  `form_id` int(30) NOT NULL,
  `expiry_date` date NOT NULL,
  `expired_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `other_details` text NOT NULL,
  `remarks` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `qty`, `type`, `stock_from`, `form_id`, `expiry_date`, `expired_confirmed`, `other_details`, `remarks`, `date_updated`) VALUES
(1, 3, 500, 1, 'receiving', 1, '2021-12-03', 0, '{"price":"5","qty":"500"}', 'Stock from Receiving-83386962\r\n', '2020-10-08 10:55:21'),
(2, 2, 500, 1, 'receiving', 1, '2021-11-11', 0, '{"price":"5","qty":"500"}', 'Stock from Receiving-83386962\r\n', '2020-10-08 10:55:21'),
(3, 6, 300, 1, 'receiving', 1, '2021-10-06', 0, '{"price":"20","qty":"300"}', 'Stock from Receiving-83386962\r\n', '2020-10-08 10:55:21'),
(4, 5, 300, 1, 'receiving', 1, '2021-11-09', 0, '{"price":"10","qty":"300"}', 'Stock from Receiving-83386962\r\n', '2020-10-08 10:55:21'),
(5, 4, 500, 1, 'receiving', 2, '2022-10-14', 0, '{"price":"8","qty":"500"}', 'Stock from Receiving-00000000\n', '2020-10-08 11:03:36'),
(6, 6, 10, 1, 'receiving', 2, '2020-10-05', 1, '{"price":"18","qty":"10"}', 'Stock from Receiving-00000000\n', '2020-10-09 08:20:00'),
(8, 3, 1, 2, 'Sales', 2, '0000-00-00', 0, '{"price":"10","qty":"1"}', 'Stock out from Sales-00000000\n', '2020-10-08 13:23:13'),
(9, 5, 20, 2, 'Sales', 2, '0000-00-00', 0, '{"price":"15","qty":"20"}', 'Stock out from Sales-00000000\n', '2020-10-08 13:23:13'),
(10, 3, 20, 2, 'Sales', 3, '0000-00-00', 0, '{"price":"10","qty":"20"}', 'Stock out from Sales-74800422\n', '2020-10-08 13:42:29'),
(11, 3, 10, 2, 'Sales', 4, '0000-00-00', 0, '{"price":"10","qty":"10"}', 'Stock out from Sales-01966403\n', '2020-10-08 13:43:08'),
(12, 8, 500, 1, 'receiving', 3, '2021-04-29', 0, '{"price":"10","qty":"500"}', 'Stock from Receiving-95300488\n', '2020-10-09 08:17:29'),
(13, 8, 10, 2, 'Sales', 5, '0000-00-00', 1, '{"price":"15","qty":"10"}', 'Stock out from Sales-16232790\n', '2022-09-30 13:28:56'),
(14, 3, 10, 2, 'Sales', 5, '0000-00-00', 0, '{"price":"10","qty":"10"}', 'Stock out from Sales-16232790\n', '2020-10-09 08:19:04'),
(15, 4, 3, 2, 'Sales', 6, '0000-00-00', 0, '{"price":"10","qty":"3"}', 'Stock out from Sales-38183748\n', '2022-09-30 12:52:38'),
(16, 3, 5, 2, 'Sales', 7, '0000-00-00', 0, '{"price":"10","qty":"5"}', 'Stock out from Sales-94998032\n', '2022-09-30 15:01:39'),
(17, 4, 3, 2, 'Sales', 7, '0000-00-00', 0, '{"price":"10","qty":"3"}', 'Stock out from Sales-94998032\n', '2022-09-30 15:01:39'),
(18, 8, 80, 2, 'Sales', 8, '0000-00-00', 0, '{"price":"15","qty":"80"}', 'Stock out from Sales-57726161\n', '2022-10-01 10:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE IF NOT EXISTS `product_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` text NOT NULL,
  `type_id` int(30) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `name` varchar(150) NOT NULL,
  `measurement` text NOT NULL,
  `description` text NOT NULL,
  `prescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `type_id`, `sku`, `price`, `name`, `measurement`, `description`, `prescription`) VALUES
(2, '4', 2, '32563070', 7, 'Amoxicillin 250', '250mg', 'sample', 1),
(3, '4', 2, '59118534', 10, 'Cephalexin 250', '250mg', 'Sample', 0),
(4, '3', 5, '89612125', 10, 'Hydromorphone 2', '2mg', 'Sample', 0),
(5, '3', 5, '90433847', 15, 'Demerol 50', '50mg', 'Sample', 0),
(6, '3', 5, '30410592', 30, 'Demerol 100', '100mg', 'Sample', 1),
(7, '1', 5, '15196587\n', 50, 'Pyridoxine 50', '50mg', 'Sample', 0),
(8, '8', 6, '57429604', 15, 'Sample Med', '500mg', 'Sample only', 1);

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list`
--

CREATE TABLE IF NOT EXISTS `receiving_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(100) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `receiving_list`
--

INSERT INTO `receiving_list` (`id`, `ref_no`, `supplier_id`, `total_amount`, `date_added`) VALUES
(1, '83386962\n', 1, 14000, '2020-10-08 10:52:05'),
(2, '00000000\n', 3, 4180, '2020-10-08 11:03:36'),
(3, '95300488\n', 3, 5000, '2020-10-09 08:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `sales_list`
--

CREATE TABLE IF NOT EXISTS `sales_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `amount_tendered` double NOT NULL,
  `amount_change` double NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sales_list`
--

INSERT INTO `sales_list` (`id`, `ref_no`, `customer_id`, `total_amount`, `amount_tendered`, `amount_change`, `date_updated`) VALUES
(2, '00000000\n', 0, 310, 400, 90, '2020-10-08 13:23:13'),
(3, '74800422\n', 0, 200, 200, 0, '2020-10-08 13:42:29'),
(4, '01966403\n', 0, 100, 100, 0, '2020-10-08 13:43:08'),
(5, '16232790\n', 1, 250, 300, 50, '2020-10-09 08:19:04'),
(6, '38183748\n', 1, 30, 30, 0, '2022-09-30 12:52:38'),
(7, '94998032\n', 1, 80, 80, 0, '2022-09-30 15:01:39'),
(8, '57726161\n', 2, 1200, 1200, 0, '2022-10-01 10:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE IF NOT EXISTS `supplier_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `supplier_name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `supplier_name`, `contact`, `address`) VALUES
(1, 'Supplier 1', '65524556', 'Sample Address'),
(3, 'Supplier 2', '6546531', 'Supplier2 Address'),
(4, 'Supplier 3', '85655466', 'Sample supplier address');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Computerized Inventory Management System', 'hibertechsolution@gmail.com', '+2348144509192', 'fountain-university.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;ABOUT US&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Fountain University , Osogbo Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp; \r\n Welcome to the Department of Mathematical and Computer Sciences. The Department is one the Departments in the College of Natural and Applied Sciences that the University started with in January 14th, 2008 at the inception of the University academics activities\r\n \r\n&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Where does it come from?&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `type_list`
--

CREATE TABLE IF NOT EXISTS `type_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `type_list`
--

INSERT INTO `type_list` (`id`, `name`) VALUES
(1, 'Liquid'),
(2, 'Capsule'),
(3, 'Drops'),
(4, 'Inhalers'),
(5, 'Tablet'),
(6, 'Sample Type');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=admin , 2 = cashier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1),
(4, 'Munirat', 'Oyeniran', 'Munirat123', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
