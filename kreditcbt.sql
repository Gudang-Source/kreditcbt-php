-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 01:09 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kreditcbt`
--

-- --------------------------------------------------------

--
-- Table structure for table `angsuran`
--

CREATE TABLE `angsuran` (
  `nama` text NOT NULL,
  `id` int(10) NOT NULL,
  `cicilan` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `angsuran`
--
DELIMITER $$
CREATE TRIGGER `cicil` AFTER INSERT ON `angsuran` FOR EACH ROW BEGIN
UPDATE bayar 
SET sisa = sisa - NEW.cicilan
WHERE
id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `id` int(10) NOT NULL,
  `plat` int(10) NOT NULL,
  `merk` text NOT NULL,
  `tipe` text NOT NULL,
  `harga` int(15) NOT NULL,
  `tenor` int(50) NOT NULL,
  `bunga` int(50) NOT NULL,
  `hargakredit` int(50) NOT NULL,
  `dp` int(50) NOT NULL,
  `angsuran` int(50) NOT NULL,
  `sisa` int(50) NOT NULL,
  `nama` text NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE `beli` (
  `nik` int(50) NOT NULL,
  `nama` text NOT NULL,
  `umur` int(3) NOT NULL,
  `pekerjaan` text NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `plat` varchar(11) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `tipe` text NOT NULL,
  `harga` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD KEY `id` (`id`);

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD PRIMARY KEY (`plat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bayar`
--
ALTER TABLE `bayar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `angsuran`
--
ALTER TABLE `angsuran`
  ADD CONSTRAINT `angsuran_ibfk_1` FOREIGN KEY (`id`) REFERENCES `bayar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
