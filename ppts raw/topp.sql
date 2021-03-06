-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2014 at 08:50 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `topp`
--
CREATE DATABASE IF NOT EXISTS `topp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `topp`;

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `ptt` int(6) NOT NULL,
  `species` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`ptt`, `species`) VALUES
(1388, 'Blue Whale'),
(49101, 'Hawksbill Turtle'),
(67553, 'Laysan Albatross'),
(126318, 'Silky Shark'),
(126347, 'Blue Marlin'),
(135902, 'Silvertip Shark');

-- --------------------------------------------------------

--
-- Table structure for table `buoy`
--

DROP TABLE IF EXISTS `buoy`;
CREATE TABLE IF NOT EXISTS `buoy` (
  `buoy_id` int(8) NOT NULL,
  `Location` char(20) CHARACTER SET ascii NOT NULL,
  `longitude` float(4,1) NOT NULL,
  `latitude` float(3,1) NOT NULL,
  `station_id` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buoy`
--

INSERT INTO `buoy` (`buoy_id`, `Location`, `longitude`, `latitude`, `station_id`) VALUES
(200050, 'Tomalos', -123.0, 38.2, 1),
(200075, 'Avo Nuevo', -122.3, 37.1, 2),
(200076, 'Farallones', -123.0, 37.1, 3);

--
-- Triggers `buoy`
--
DROP TRIGGER IF EXISTS `Trigger 3`;
DELIMITER //
CREATE TRIGGER `Trigger 3` BEFORE INSERT ON `buoy`
 FOR EACH ROW BEGIN
DECLARE dummy,baddata INT; SET baddata = 0;
IF (NEW.latitude > 90) or (New.latitude < -90) or (New.longitude > 0) or (New.longitude < -360) THEN SET baddata = 1;
End if;
IF baddata = 1 THEN
signal sqlstate '45000' set message_text = " Invalid insert!";
End if;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reading`
--

DROP TABLE IF EXISTS `reading`;
CREATE TABLE IF NOT EXISTS `reading` (
  `date` date NOT NULL,
  `time` char(6) NOT NULL,
  `buoy_id` int(6) NOT NULL,
  `ptt` int(6) NOT NULL,
  `depth` decimal(5,0) NOT NULL,
  `int_temp` decimal(3,0) NOT NULL,
  `ext_temp` decimal(3,0) NOT NULL,
  `light` decimal(8,0) NOT NULL,
  `latitude` float(4,3) NOT NULL,
  `longitude` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reading`
--

INSERT INTO `reading` (`date`, `time`, `buoy_id`, `ptt`, `depth`, `int_temp`, `ext_temp`, `light`, `latitude`, `longitude`) VALUES
('2008-01-12', '10:53', 200075, 1388, '2', '31', '33', '4854', 8.891, '-96.59'),
('2008-01-14', '8:55', 200076, 1388, '8', '30', '34', '4863', 8.794, '-96.698'),
('2008-01-15', '10:03', 200076, 1388, '24', '31', '33', '4621', 9.110, '-96.712'),
('2008-01-15', '8:50', 200075, 1388, '1', '31', '30', '4921', 9.087, '-96.623'),
('2008-01-16', '11:54', 200075, 1388, '110', '30', '24', '699', 8.952, '-96.841'),
('2008-01-16', '8:38', 200076, 1388, '61', '31', '28', '4277', 8.989, '-96.81'),
('2008-01-17', '10:39', 200050, 1388, '2', '31', '32', '4931', 9.228, '-97.389'),
('2008-01-17', '11:32', 200075, 1388, '21', '31', '26', '4258', 9.182, '-97.144'),
('2008-01-17', '7:37', 200050, 1388, '36', '31', '26', '4011', 9.253, '-97.291'),
('2008-01-17', '8:29', 200075, 1388, '243', '30', '21', '112', 9.130, '-96.995'),
('2008-01-18', '11:11', 200075, 1388, '47', '31', '29', '4113', 9.055, '-97.348'),
('2008-01-18', '7:24', 200050, 1388, '69', '31', '27', '4323', 9.163, '-97.393'),
('2008-01-18', '8:17', 200050, 1388, '1', '30', '33', '4871', 9.032, '-97.311'),
('2008-01-19', '10:53', 200050, 1388, '170', '31', '19', '310', 9.459, '-97.294'),
('2008-01-19', '11:46', 200050, 1388, '124', '31', '21', '463', 9.386, '-97.382'),
('2008-01-19', '7:15', 200076, 1388, '101', '31', '23', '580', 9.376, '-97.367'),
('2008-01-19', '8:06', 200050, 1388, '70', '30', '26', '3999', 9.298, '-97.332'),
('2008-01-20', '10:42', 200076, 1388, '127', '31', '19', '596', 9.984, '-97.898'),
('2008-01-20', '11:39', 200075, 1388, '239', '31', '17', '103', 9.792, '-97.462'),
('2008-01-21', '10:35', 200050, 1388, '49', '30', '23', '3644', 9.669, '-98.278'),
('2008-01-21', '11:23', 200075, 1388, '130', '30', '19', '440', 9.877, '-98.207'),
('2008-01-21', '11:39', 200075, 1388, '78', '29', '21', '2467', 9.877, '-98.228'),
('2008-01-22', '10:21', 200076, 1388, '1', '31', '33', '4993', 9.364, '-98.133'),
('2008-01-22', '11:11', 200050, 1388, '21', '30', '25', '4360', 9.445, '-98.218'),
('2008-01-22', '11:16', 200075, 1388, '3', '31', '29', '4870', 9.419, '-98.119'),
('2008-01-23', '10:09', 200076, 1388, '7', '30', '32', '4882', 9.284, '-97.988'),
('2008-01-23', '11:01', 200075, 1388, '1', '30', '31', '4876', 9.258, '-98.005'),
('2008-01-24', '10:01', 200075, 1388, '14', '32', '30', '4676', 9.231, '-98.233'),
('2008-01-24', '8:54', 200076, 1388, '17', '31', '29', '4610', 9.237, '-98.103'),
('2008-01-25', '11:43', 200075, 1388, '30', '31', '29', '4503', 9.195, '-98.341'),
('2008-01-25', '8:46', 200075, 1388, '34', '31', '28', '4555', 9.231, '-98.356'),
('2009-12-10', '11:16', 200050, 67553, '0', '29', '31', '6097', 9.999, '-166.29'),
('2009-12-10', '11:42', 200076, 67553, '0', '29', '34', '6112', 9.999, '-166.304'),
('2009-12-10', '12:57', 200076, 67553, '0', '29', '23', '6179', 9.999, '-166.303'),
('2009-12-10', '1:22', 200050, 67553, '0', '28', '28', '6521', 9.999, '-166.283'),
('2009-12-10', '1:22', 200076, 67553, '0', '28', '26', '6339', 9.999, '-166.283'),
('2009-12-10', '2:37', 200075, 67553, '0', '29', '28', '6127', 9.999, '-166.314'),
('2009-12-10', '3:10', 200075, 67553, '0', '29', '31', '6647', 9.999, '-166.281'),
('2009-12-10', '4:24', 200075, 67553, '0', '29', '31', '6128', 9.999, '-166.287'),
('2009-12-10', '4:47', 200076, 67553, '0', '29', '30', '6106', 9.999, '-166.292'),
('2009-12-10', '4:49', 200076, 67553, '0', '29', '29', '6331', 9.999, '-166.287'),
('2009-12-10', '5:56', 200076, 67553, '0', '29', '30', '6412', 9.999, '-166.287'),
('2009-12-10', '6:27', 200076, 67553, '0', '28', '27', '6268', 9.999, '-166.296'),
('2009-12-10', '7:22', 200075, 67553, '0', '29', '26', '6160', 9.999, '-166.265'),
('2009-12-10', '8:34', 200050, 67553, '0', '29', '26', '6710', 9.999, '-166.286'),
('2009-12-10', '8:48', 200050, 67553, '0', '28', '24', '5432', 9.999, '-166.286'),
('2009-12-10', '8:49', 200076, 67553, '0', '29', '28', '5407', 9.999, '-166.286'),
('2009-12-10', '9:01', 200075, 67553, '0', '29', '28', '6387', 9.999, '-166.284'),
('2009-12-11', '12:46', 200076, 67553, '0', '28', '34', '6167', 9.999, '-166.29'),
('2009-12-11', '2:28', 200075, 67553, '0', '29', '32', '6374', 9.999, '-166.291'),
('2009-12-11', '2:44', 200050, 67553, '0', '29', '31', '6141', 9.999, '-166.28'),
('2009-12-11', '2:45', 200050, 67553, '0', '29', '24', '5472', 9.999, '-166.286'),
('2009-12-11', '2:52', 200076, 67553, '0', '29', '26', '5777', 9.999, '-166.296'),
('2009-12-11', '4:00', 200076, 67553, '0', '29', '31', '6110', 9.999, '-166.273'),
('2009-12-11', '4:04', 200076, 67553, '0', '29', '27', '6824', 9.999, '-166.3'),
('2009-12-11', '4:27', 200075, 67553, '0', '29', '21', '5669', 9.999, '-166.278'),
('2009-12-11', '5:43', 200075, 67553, '0', '29', '21', '5762', 9.999, '-166.282'),
('2009-12-11', '6:32', 200075, 67553, '0', '29', '24', '5403', 9.999, '-166.286'),
('2009-12-11', '6:49', 200050, 67553, '0', '29', '28', '5564', 9.999, '-166.289'),
('2009-12-11', '8:11', 200076, 67553, '0', '28', '27', '6671', 9.999, '-166.295'),
('2009-12-11', '8:27', 200076, 67553, '0', '29', '30', '6772', 9.999, '-166.3'),
('2009-12-11', '8:28', 200050, 67553, '0', '28', '31', '6933', 9.999, '-166.299'),
('2010-09-24', '4:43', 200050, 49101, '12', '28', '30', '4725', 9.999, '-61.084'),
('2010-09-24', '5:38', 200076, 49101, '12', '28', '30', '4101', 9.999, '-61.141'),
('2010-09-24', '7:03', 200076, 49101, '46', '28', '30', '4503', 9.999, '-61.159'),
('2010-09-24', '9:45', 200076, 49101, '2', '27', '29', '4845', 9.999, '-61.016'),
('2010-09-25', '5:12', 200050, 49101, '45', '28', '30', '4810', 9.999, '-61.097'),
('2010-09-25', '7:43', 200076, 49101, '67', '29', '31', '4058', 9.999, '-61.069'),
('2010-09-26', '4:32', 200076, 49101, '32', '28', '30', '4120', 9.999, '-61.079'),
('2010-09-26', '9:42', 200050, 49101, '12', '28', '30', '4752', 9.999, '-61.17'),
('2010-09-27', '11:17', 200076, 49101, '11', '27', '29', '4394', 9.999, '-61.114'),
('2010-09-27', '2:12', 200076, 49101, '10', '27', '29', '4452', 9.999, '-60.961'),
('2010-09-27', '6:35', 200076, 49101, '42', '28', '30', '4485', 9.999, '-61.085'),
('2010-09-28', '12:09', 200050, 49101, '14', '28', '30', '4158', 9.999, '-61.058'),
('2010-09-28', '1:45', 200050, 49101, '23', '28', '30', '4078', 9.999, '-61.065'),
('2010-09-28', '9:07', 200050, 49101, '28', '28', '30', '4442', 9.999, '-61.085'),
('2010-09-29', '1:26', 200050, 49101, '31', '28', '30', '4727', 9.999, '-61.092'),
('2010-09-29', '6:12', 200076, 49101, '63', '29', '31', '4997', 9.999, '-61.193'),
('2010-09-30', '6:02', 200076, 49101, '12', '28', '30', '4308', 9.999, '-61.091'),
('2010-10-01', '10:33', 200076, 49101, '20', '28', '30', '4422', 9.999, '-61.277'),
('2010-10-01', '2:03', 200076, 49101, '51', '27', '29', '4977', 9.999, '-61.082'),
('2010-10-01', '4:27', 200076, 49101, '17', '28', '30', '4521', 9.999, '-61.074'),
('2010-10-01', '5:04', 200050, 49101, '23', '29', '31', '4073', 9.999, '-61.087'),
('2010-10-02', '11:55', 200050, 49101, '60', '27', '29', '4476', 9.999, '-61.122'),
('2010-10-02', '6:49', 200050, 49101, '17', '28', '30', '4040', 9.999, '-61.087'),
('2010-10-03', '12:07', 200076, 49101, '19', '28', '30', '4394', 9.999, '-61.102'),
('2010-10-03', '1:13', 200050, 49101, '41', '27', '29', '4167', 9.999, '-61.108'),
('2010-10-03', '6:29', 200076, 49101, '28', '28', '30', '4387', 9.999, '-61.067'),
('2010-10-03', '8:41', 200050, 49101, '22', '28', '30', '4223', 9.999, '-61.098'),
('2010-10-04', '11:43', 200076, 49101, '34', '29', '31', '4287', 9.999, '-61.034'),
('2010-10-04', '4:57', 200050, 49101, '13', '28', '30', '4136', 9.999, '-61.092'),
('2010-10-04', '5:34', 200076, 49101, '36', '28', '30', '4164', 9.999, '-61.093'),
('2010-10-04', '6:13', 200076, 49101, '77', '28', '30', '4400', 9.999, '-61.095'),
('2013-05-09', '11:20', 200050, 126318, '25', '23', '21', '4290', -5.285, '-277.522'),
('2013-05-09', '11:32', 200050, 126318, '1', '22', '20', '4871', -5.288, '-277.516'),
('2013-05-09', '5:26', 200075, 126318, '45', '22', '20', '4210', -5.350, '-277.6'),
('2013-05-09', '8:12', 200075, 126318, '85', '22', '20', '3746', -5.324, '-277.56'),
('2013-05-10', '10:22', 200050, 126318, '72', '23', '20', '2587', -5.207, '-277.328'),
('2013-05-10', '10:26', 200075, 126318, '10', '23', '21', '4068', -5.205, '-277.329'),
('2013-05-10', '11:09', 200050, 126318, '12', '22', '20', '4251', -5.138, '-277.101'),
('2013-05-10', '12:07', 200075, 126318, '5', '22', '24', '4576', -5.197, '-277.296'),
('2013-05-10', '3:45', 200050, 126318, '5', '21', '19', '4864', -5.246, '-277.458'),
('2013-05-10', '4:18', 200075, 126318, '9', '21', '19', '4013', -5.168, '-277.211'),
('2013-05-10', '4:28', 200075, 126318, '54', '22', '20', '4079', -5.244, '-277.435'),
('2013-05-10', '4:38', 200076, 126318, '108', '22', '18', '620', -5.243, '-277.439'),
('2013-05-10', '5:03', 200050, 126318, '94', '21', '19', '3284', -5.165, '-277.199'),
('2013-05-10', '7:12', 200050, 126318, '220', '22', '16', '145', -5.234, '-277.389'),
('2013-05-10', '8:53', 200075, 126318, '140', '22', '17', '286', -5.213, '-277.357'),
('2013-05-10', '9:29', 200050, 126318, '14', '22', '20', '4012', -5.152, '-277.129'),
('2013-05-11', '10:10', 200075, 126318, '41', '22', '20', '3780', -5.069, '-276.873'),
('2013-05-11', '10:44', 200050, 126318, '86', '22', '20', '4163', -4.951, '-276.645'),
('2013-05-11', '11:42', 200075, 126318, '39', '22', '20', '3910', -5.056, '-276.845'),
('2013-05-11', '2:28', 200050, 126318, '71', '22', '20', '4053', -5.116, '-277.021'),
('2013-05-11', '2:43', 200075, 126318, '63', '23', '21', '3870', -5.116, '-277.024'),
('2013-05-11', '3:03', 200075, 126318, '17', '22', '20', '4400', -5.033, '-276.781'),
('2013-05-11', '3:19', 200050, 126318, '110', '22', '20', '350', -5.110, '-277.011'),
('2013-05-11', '3:22', 200075, 126318, '77', '21', '19', '3416', -5.033, '-276.789'),
('2013-05-11', '4:07', 200075, 126318, '128', '23', '21', '312', -5.111, '-276.993'),
('2013-05-11', '4:23', 200050, 126318, '40', '21', '19', '4130', -5.109, '-276.992'),
('2013-05-11', '7:50', 200050, 126318, '46', '22', '20', '3852', -4.989, '-276.696'),
('2013-05-11', '8:29', 200050, 126318, '12', '24', '22', '4176', -5.083, '-276.911'),
('2013-05-11', '8:43', 200050, 126318, '49', '23', '21', '3761', -5.082, '-276.901'),
('2013-05-11', '9:17', 200050, 126318, '106', '22', '20', '264', -4.971, '-276.674'),
('2013-05-11', '9:31', 200076, 126318, '28', '23', '21', '4287', -4.963, '-276.674'),
('2013-10-19', '11:35', 200075, 126347, '5', '27', '25', '4000', 2.134, '-166.532'),
('2013-10-20', '11:24', 200076, 126347, '69', '24', '22', '4111', 2.472, '-167.272'),
('2013-10-20', '12:19', 200050, 126347, '70', '23', '21', '4213', 2.272, '-166.925'),
('2013-10-20', '1:58', 200050, 126347, '212', '19', '17', '120', 2.300, '-166.975'),
('2013-10-20', '2:34', 200050, 126347, '140', '20', '18', '189', 2.312, '-166.993'),
('2013-10-20', '2:57', 200076, 126347, '14', '25', '23', '4258', 2.325, '-166.999'),
('2013-10-20', '3:30', 200076, 126347, '10', '26', '24', '4120', 2.176, '-166.65'),
('2013-10-20', '3:55', 200050, 126347, '22', '25', '23', '4789', 2.328, '-167.036'),
('2013-10-20', '4:13', 200075, 126347, '54', '24', '22', '4123', 2.336, '-167.048'),
('2013-10-20', '4:36', 200075, 126347, '78', '23', '21', '4400', 2.349, '-167.055'),
('2013-10-20', '4:59', 200075, 126347, '30', '25', '23', '4130', 2.183, '-166.699'),
('2013-10-20', '5:33', 200075, 126347, '21', '25', '23', '4128', 2.364, '-167.085'),
('2013-10-20', '6:37', 200076, 126347, '92', '22', '20', '4500', 2.193, '-166.753'),
('2013-10-20', '8:22', 200076, 126347, '14', '25', '23', '4847', 2.213, '-166.818'),
('2013-10-20', '9:04', 200050, 126347, '77', '22', '20', '4782', 2.418, '-167.198'),
('2013-10-20', '9:10', 200075, 126347, '2', '27', '25', '4875', 2.228, '-166.831'),
('2013-10-20', '9:47', 200050, 126347, '4', '26', '24', '4222', 2.429, '-167.223'),
('2013-10-21', '12:08', 200075, 126347, '48', '23', '21', '4802', 2.761, '-167.591'),
('2013-10-21', '1:48', 200075, 126347, '70', '23', '21', '4170', 2.799, '-167.621'),
('2013-10-21', '4:27', 200050, 126347, '12', '25', '23', '4628', 2.576, '-167.402'),
('2013-10-21', '5:02', 200076, 126347, '14', '25', '23', '4880', 2.866, '-167.693'),
('2013-10-21', '5:15', 200076, 126347, '8', '26', '24', '4790', 2.595, '-167.418'),
('2013-10-21', '6:07', 200076, 126347, '178', '20', '18', '146', 2.611, '-167.446'),
('2013-10-21', '6:41', 200076, 126347, '91', '22', '20', '4891', 2.902, '-167.707'),
('2013-10-21', '7:23', 200076, 126347, '30', '24', '22', '4110', 2.644, '-167.486'),
('2013-10-21', '7:46', 200076, 126347, '16', '25', '23', '4197', 2.928, '-167.741'),
('2013-10-21', '8:01', 200050, 126347, '33', '24', '22', '4001', 2.658, '-167.5'),
('2014-07-23', '10:30', 200050, 135902, '11', '27', '24', '4693', -5.164, '-286.996'),
('2014-07-23', '10:32', 200050, 135902, '123', '24', '21', '423', -5.074, '-287.038'),
('2014-07-23', '11:05', 200076, 135902, '45', '26', '23', '3698', -5.078, '-287.029'),
('2014-07-23', '11:46', 200076, 135902, '14', '27', '24', '4336', -5.179, '-286.977'),
('2014-07-23', '12:08', 200076, 135902, '65', '27', '24', '4125', -5.093, '-287.041'),
('2014-07-23', '12:12', 200050, 135902, '82', '26', '23', '4710', -5.096, '-287.04'),
('2014-07-23', '12:46', 200076, 135902, '11', '26', '23', '4716', -5.100, '-287.039'),
('2014-07-23', '1:11', 200075, 135902, '45', '28', '25', '4123', -5.039, '-286.983'),
('2014-07-23', '1:49', 200076, 135902, '14', '26', '23', '4020', -5.112, '-287.039'),
('2014-07-23', '3:06', 200075, 135902, '87', '27', '24', '4154', -5.043, '-286.982'),
('2014-07-23', '3:43', 200050, 135902, '14', '24', '21', '4150', -5.127, '-287.041'),
('2014-07-23', '3:57', 200076, 135902, '4', '28', '25', '4128', -5.048, '-286.979'),
('2014-07-23', '4:45', 200076, 135902, '13', '26', '23', '4214', -5.043, '-286.989'),
('2014-07-23', '5:21', 200075, 135902, '3', '28', '25', '4159', -5.140, '-287.044'),
('2014-07-23', '8:02', 200075, 135902, '9', '25', '22', '4987', -5.055, '-287.017'),
('2014-07-23', '8:49', 200050, 135902, '30', '29', '26', '4110', -5.161, '-287.016'),
('2014-07-23', '9:43', 200075, 135902, '97', '28', '25', '2154', -5.067, '-287.027'),
('2014-07-24', '10:20', 200076, 135902, '189', '25', '22', '110', -5.201, '-286.868'),
('2014-07-24', '11:38', 200076, 135902, '77', '25', '22', '4097', -5.210, '-286.864'),
('2014-07-24', '12:41', 200075, 135902, '43', '24', '21', '4710', -5.182, '-286.969'),
('2014-07-24', '1:17', 200075, 135902, '31', '27', '24', '4664', -5.186, '-286.853'),
('2014-07-24', '1:26', 200075, 135902, '12', '24', '21', '4421', -5.187, '-286.961'),
('2014-07-24', '2:18', 200050, 135902, '74', '26', '23', '4917', -5.194, '-286.954'),
('2014-07-24', '4:26', 200050, 135902, '46', '29', '26', '4330', -5.202, '-286.94'),
('2014-07-24', '5:19', 200075, 135902, '61', '29', '26', '4148', -5.197, '-286.916'),
('2014-07-24', '7:51', 200076, 135902, '14', '29', '26', '4428', -5.214, '-286.89'),
('2014-07-24', '9:30', 200075, 135902, '100', '24', '21', '560', -5.201, '-286.873');

--
-- Triggers `reading`
--
DROP TRIGGER IF EXISTS `Trigger 1`;
DELIMITER //
CREATE TRIGGER `Trigger 1` BEFORE INSERT ON `reading`
 FOR EACH ROW BEGIN
DECLARE dummy,baddata INT; SET baddata = 0;
IF (NEW.light < 0) or (New.light > 100000 ) THEN SET baddata = 1;
End if;
IF baddata = 1 THEN
signal sqlstate '45000' set message_text = " Invalid insert!";
End if;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `station_id` int(1) NOT NULL,
  `name` char(15) NOT NULL,
  `location` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`station_id`, `name`, `location`) VALUES
(1, 'Alpha', 'Monterey CA'),
(2, 'Beta', 'Victoria BC'),
(3, 'Omega', 'Honolulu HI');

--
-- Triggers `station`
--
DROP TRIGGER IF EXISTS `Trigger 2`;
DELIMITER //
CREATE TRIGGER `Trigger 2` BEFORE INSERT ON `station`
 FOR EACH ROW BEGIN
DECLARE dummy,baddata INT; SET baddata = 0;
IF (NEW.location != 'Monterey CA') or (New.location != 'Victoria BC') or (New.location != 'Honolulu HI') THEN SET baddata = 1;
End if;
IF baddata = 1 THEN
signal sqlstate '45000' set message_text = " Invalid insert!";
End if;
END
//
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
 ADD PRIMARY KEY (`ptt`), ADD UNIQUE KEY `ptt` (`ptt`);

--
-- Indexes for table `buoy`
--
ALTER TABLE `buoy`
 ADD PRIMARY KEY (`buoy_id`), ADD UNIQUE KEY `station_id` (`station_id`);

--
-- Indexes for table `reading`
--
ALTER TABLE `reading`
 ADD PRIMARY KEY (`date`,`time`,`buoy_id`), ADD KEY `buoy_id` (`buoy_id`), ADD KEY `ptt` (`ptt`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
 ADD PRIMARY KEY (`station_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buoy`
--
ALTER TABLE `buoy`
ADD CONSTRAINT `buoy_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`);

--
-- Constraints for table `reading`
--
ALTER TABLE `reading`
ADD CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`buoy_id`) REFERENCES `buoy` (`buoy_id`),
ADD CONSTRAINT `reading_ibfk_2` FOREIGN KEY (`ptt`) REFERENCES `animal` (`ptt`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
