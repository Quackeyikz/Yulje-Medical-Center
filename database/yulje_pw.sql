-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2025 at 04:37 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yulje_pw`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `kontak` varchar(30) DEFAULT NULL,
  `id_praktik` int(11) NOT NULL,
  `id_spesialis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `kontak`, `id_praktik`, `id_spesialis`) VALUES
(1, 'dr. maya kartika', '081234567820', 1, 1),
(2, 'dr. rizal anwar', '081234567821', 2, 2),
(3, 'dr. sari wulandari', '081234567822', 3, 3),
(4, 'dr. andhika satria', '081234567823', 4, 4),
(5, 'dr. putri aulia', '081234567824', 5, 5),
(6, 'dr. yudha mardika', '081234567825', 6, 6),
(7, 'dr. lestari handayani', '081234567826', 7, 7),
(8, 'dr. farhan dwi', '081234567827', 8, 8),
(9, 'dr. ayu ramadhani', '081234567828', 9, 9),
(10, 'dr. zainul arifin', '081234567829', 10, 10),
(11, 'dr. fitriani', '081234567830', 11, 11),
(12, 'dr. hafidz syaiful', '081234567831', 12, 12),
(13, 'dr. widya sari', '081234567832', 13, 13),
(14, 'dr. reza mahendra', '081234567833', 14, 1),
(15, 'dr. intan amelia', '081234567834', 15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_konsultasi`
--

CREATE TABLE `jadwal_konsultasi` (
  `id_konsultasi` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `keluhan` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_konsultasi`
--

INSERT INTO `jadwal_konsultasi` (`id_konsultasi`, `id_pasien`, `id_dokter`, `tanggal`, `waktu`, `keluhan`, `status`) VALUES
(1, 1, 1, '2025-06-01', '08:30:00', 'batuk', 'terjadwal'),
(2, 2, 2, '2025-06-01', '09:00:00', 'flu', 'terjadwal'),
(3, 3, 3, '2025-06-01', '10:00:00', 'sakit tenggorokan', 'selesai'),
(4, 4, 4, '2025-06-02', '08:00:00', 'sariawan', 'selesai'),
(5, 5, 5, '2025-06-02', '09:30:00', 'demam', 'selesai'),
(6, 6, 6, '2025-06-02', '10:30:00', 'alergi', 'terjadwal'),
(7, 7, 7, '2025-06-03', '08:15:00', 'mimisan', 'terjadwal'),
(8, 8, 8, '2025-06-03', '09:45:00', 'gigi ngilu', 'terjadwal'),
(9, 9, 9, '2025-06-03', '10:00:00', 'nyeri otot', 'selesai'),
(10, 10, 10, '2025-06-04', '08:00:00', 'diare', 'terjadwal'),
(11, 11, 11, '2025-06-04', '09:30:00', 'sakit kepala', 'terjadwal'),
(12, 12, 12, '2025-06-04', '10:00:00', 'masuk angin', 'selesai'),
(13, 13, 13, '2025-06-05', '08:30:00', 'kembung', 'selesai'),
(14, 14, 14, '2025-06-05', '09:30:00', 'mual', 'terjadwal'),
(15, 15, 15, '2025-06-05', '10:30:00', 'gatal', 'terjadwal');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_praktik`
--

CREATE TABLE `jadwal_praktik` (
  `id_praktik` int(11) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_praktik`
--

INSERT INTO `jadwal_praktik` (`id_praktik`, `hari`, `waktu_mulai`, `waktu_selesai`) VALUES
(1, 'senin', '08:00:00', '12:00:00'),
(2, 'selasa', '08:00:00', '12:00:00'),
(3, 'rabu', '08:00:00', '12:00:00'),
(4, 'kamis', '08:00:00', '12:00:00'),
(5, 'jumat', '08:00:00', '12:00:00'),
(6, 'sabtu', '08:00:00', '12:00:00'),
(7, 'minggu', '08:00:00', '12:00:00'),
(8, 'senin', '13:00:00', '17:00:00'),
(9, 'selasa', '13:00:00', '17:00:00'),
(10, 'rabu', '13:00:00', '17:00:00'),
(11, 'kamis', '13:00:00', '17:00:00'),
(12, 'jumat', '13:00:00', '17:00:00'),
(13, 'sabtu', '13:00:00', '17:00:00'),
(14, 'minggu', '13:00:00', '17:00:00'),
(15, 'senin', '18:00:00', '21:00:00'),
(16, 'senin', '08:00:00', '12:00:00'),
(17, 'selasa', '08:00:00', '12:00:00'),
(18, 'rabu', '08:00:00', '12:00:00'),
(19, 'kamis', '08:00:00', '12:00:00'),
(20, 'jumat', '08:00:00', '12:00:00'),
(21, 'sabtu', '08:00:00', '12:00:00'),
(22, 'minggu', '08:00:00', '12:00:00'),
(23, 'senin', '13:00:00', '17:00:00'),
(24, 'selasa', '13:00:00', '17:00:00'),
(25, 'rabu', '13:00:00', '17:00:00'),
(26, 'kamis', '13:00:00', '17:00:00'),
(27, 'jumat', '13:00:00', '17:00:00'),
(28, 'sabtu', '13:00:00', '17:00:00'),
(29, 'minggu', '13:00:00', '17:00:00'),
(30, 'senin', '18:00:00', '21:00:00'),
(31, 'senin', '08:00:00', '12:00:00'),
(32, 'selasa', '08:00:00', '12:00:00'),
(33, 'rabu', '08:00:00', '12:00:00'),
(34, 'kamis', '08:00:00', '12:00:00'),
(35, 'jumat', '08:00:00', '12:00:00'),
(36, 'sabtu', '08:00:00', '12:00:00'),
(37, 'minggu', '08:00:00', '12:00:00'),
(38, 'senin', '13:00:00', '17:00:00'),
(39, 'selasa', '13:00:00', '17:00:00'),
(40, 'rabu', '13:00:00', '17:00:00'),
(41, 'kamis', '13:00:00', '17:00:00'),
(42, 'jumat', '13:00:00', '17:00:00'),
(43, 'sabtu', '13:00:00', '17:00:00'),
(44, 'minggu', '13:00:00', '17:00:00'),
(45, 'senin', '18:00:00', '21:00:00'),
(46, 'senin', '08:00:00', '12:00:00'),
(47, 'selasa', '08:00:00', '12:00:00'),
(48, 'rabu', '08:00:00', '12:00:00'),
(49, 'kamis', '08:00:00', '12:00:00'),
(50, 'jumat', '08:00:00', '12:00:00'),
(51, 'sabtu', '08:00:00', '12:00:00'),
(52, 'minggu', '08:00:00', '12:00:00'),
(53, 'senin', '13:00:00', '17:00:00'),
(54, 'selasa', '13:00:00', '17:00:00'),
(55, 'rabu', '13:00:00', '17:00:00'),
(56, 'kamis', '13:00:00', '17:00:00'),
(57, 'jumat', '13:00:00', '17:00:00'),
(58, 'sabtu', '13:00:00', '17:00:00'),
(59, 'minggu', '13:00:00', '17:00:00'),
(60, 'senin', '18:00:00', '21:00:00'),
(61, 'senin', '08:00:00', '12:00:00'),
(62, 'selasa', '08:00:00', '12:00:00'),
(63, 'rabu', '08:00:00', '12:00:00'),
(64, 'kamis', '08:00:00', '12:00:00'),
(65, 'jumat', '08:00:00', '12:00:00'),
(66, 'sabtu', '08:00:00', '12:00:00'),
(67, 'minggu', '08:00:00', '12:00:00'),
(68, 'senin', '13:00:00', '17:00:00'),
(69, 'selasa', '13:00:00', '17:00:00'),
(70, 'rabu', '13:00:00', '17:00:00'),
(71, 'kamis', '13:00:00', '17:00:00'),
(72, 'jumat', '13:00:00', '17:00:00'),
(73, 'sabtu', '13:00:00', '17:00:00'),
(74, 'minggu', '13:00:00', '17:00:00'),
(75, 'senin', '18:00:00', '21:00:00'),
(76, 'senin', '08:00:00', '12:00:00'),
(77, 'selasa', '08:00:00', '12:00:00'),
(78, 'rabu', '08:00:00', '12:00:00'),
(79, 'kamis', '08:00:00', '12:00:00'),
(80, 'jumat', '08:00:00', '12:00:00'),
(81, 'sabtu', '08:00:00', '12:00:00'),
(82, 'minggu', '08:00:00', '12:00:00'),
(83, 'senin', '13:00:00', '17:00:00'),
(84, 'selasa', '13:00:00', '17:00:00'),
(85, 'rabu', '13:00:00', '17:00:00'),
(86, 'kamis', '13:00:00', '17:00:00'),
(87, 'jumat', '13:00:00', '17:00:00'),
(88, 'sabtu', '13:00:00', '17:00:00'),
(89, 'minggu', '13:00:00', '17:00:00'),
(90, 'senin', '18:00:00', '21:00:00'),
(91, 'senin', '08:00:00', '12:00:00'),
(92, 'selasa', '08:00:00', '12:00:00'),
(93, 'rabu', '08:00:00', '12:00:00'),
(94, 'kamis', '08:00:00', '12:00:00'),
(95, 'jumat', '08:00:00', '12:00:00'),
(96, 'sabtu', '08:00:00', '12:00:00'),
(97, 'minggu', '08:00:00', '12:00:00'),
(98, 'senin', '13:00:00', '17:00:00'),
(99, 'selasa', '13:00:00', '17:00:00'),
(100, 'rabu', '13:00:00', '17:00:00'),
(101, 'kamis', '13:00:00', '17:00:00'),
(102, 'jumat', '13:00:00', '17:00:00'),
(103, 'sabtu', '13:00:00', '17:00:00'),
(104, 'minggu', '13:00:00', '17:00:00'),
(105, 'senin', '18:00:00', '21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `kontak` varchar(30) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `kontak`, `alamat`) VALUES
(1, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(2, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(3, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(4, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(5, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(6, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(7, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(8, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(9, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(10, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(11, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(12, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(13, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(14, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(15, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(16, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(17, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(18, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(19, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(20, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(21, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(22, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(23, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(24, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(25, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(26, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(27, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(28, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(29, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(30, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(31, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(32, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(33, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(34, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(35, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(36, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(37, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(38, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(39, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(40, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(41, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(42, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(43, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(44, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(45, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(46, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(47, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(48, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(49, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(50, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(51, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(52, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(53, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(54, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(55, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(56, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(57, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(58, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(59, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(60, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(61, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(62, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(63, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(64, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(65, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(66, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(67, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(68, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(69, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(70, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(71, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(72, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(73, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(74, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(75, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(76, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(77, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(78, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(79, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(80, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(81, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(82, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(83, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(84, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(85, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(86, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(87, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(88, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(89, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(90, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15'),
(91, 'alya', 'perempuan', '2001-03-12', '081234567800', 'jl. merdeka no. 1'),
(92, 'zahra', 'perempuan', '2002-07-24', '081234567801', 'jl. kenanga no. 2'),
(93, 'naufal', 'laki-laki', '2003-11-10', '081234567802', 'jl. melati no. 3'),
(94, 'aurel', 'perempuan', '2000-05-30', '081234567803', 'jl. mawar no. 4'),
(95, 'raka', 'laki-laki', '2004-12-01', '081234567804', 'jl. anggrek no. 5'),
(96, 'nadia', 'perempuan', '2005-04-22', '081234567805', 'jl. cemara no. 6'),
(97, 'daffa', 'laki-laki', '2001-09-19', '081234567806', 'jl. flamboyan no. 7'),
(98, 'shafa', 'perempuan', '2002-02-14', '081234567807', 'jl. dahlia no. 8'),
(99, 'zidan', 'laki-laki', '2003-08-08', '081234567808', 'jl. sakura no. 9'),
(100, 'naura', 'perempuan', '2000-10-12', '081234567809', 'jl. teratai no. 10'),
(101, 'iqbal', 'laki-laki', '2004-01-20', '081234567810', 'jl. angsana no. 11'),
(102, 'keisha', 'perempuan', '2005-06-17', '081234567811', 'jl. jambu no. 12'),
(103, 'raihan', 'laki-laki', '2001-03-05', '081234567812', 'jl. rambutan no. 13'),
(104, 'hana', 'perempuan', '2002-07-07', '081234567813', 'jl. pepaya no. 14'),
(105, 'farel', 'laki-laki', '2003-11-25', '081234567814', 'jl. pisang no. 15');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_konsultasi`
--

CREATE TABLE `riwayat_konsultasi` (
  `id_riwayat` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `keluhan` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `tindakan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_konsultasi`
--

INSERT INTO `riwayat_konsultasi` (`id_riwayat`, `id_pasien`, `id_dokter`, `tanggal`, `waktu`, `keluhan`, `status`, `diagnosis`, `tindakan`) VALUES
(1, 1, 1, '2025-05-28', '08:30:00', 'batuk', 'selesai', 'infeksi saluran pernapasan', 'sirup batuk'),
(2, 2, 2, '2025-05-28', '09:00:00', 'flu', 'selesai', 'influenza ringan', 'istirahat & vitamin'),
(3, 3, 3, '2025-06-01', '10:00:00', 'sakit tenggorokan', 'selesai', 'faringitis', 'obat kumur'),
(4, 4, 4, '2025-06-02', '08:00:00', 'sariawan', 'selesai', 'stomatitis', 'salep mulut'),
(5, 5, 5, '2025-06-02', '09:30:00', 'demam', 'selesai', 'infeksi virus', 'paracetamol'),
(6, 6, 6, '2025-05-29', '10:30:00', 'alergi', 'selesai', 'dermatitis', 'salep antihistamin'),
(7, 7, 7, '2025-05-29', '08:15:00', 'mimisan', 'selesai', 'iritasi hidung', 'obat hidung'),
(8, 8, 8, '2025-05-30', '09:45:00', 'gigi ngilu', 'selesai', 'sensitivitas gigi', 'obat pereda nyeri'),
(9, 9, 9, '2025-06-03', '10:00:00', 'nyeri otot', 'selesai', 'ketegangan otot', 'kompres hangat'),
(10, 10, 10, '2025-05-30', '08:00:00', 'diare', 'selesai', 'infeksi usus', 'oralit'),
(11, 11, 11, '2025-05-30', '09:30:00', 'sakit kepala', 'selesai', 'tekanan darah tinggi', 'obat tekanan darah'),
(12, 12, 12, '2025-06-04', '10:00:00', 'masuk angin', 'selesai', 'gastritis ringan', 'teh jahe'),
(13, 13, 13, '2025-06-05', '08:30:00', 'kembung', 'selesai', 'dispepsia', 'obat lambung'),
(14, 14, 14, '2025-06-05', '09:30:00', 'mual', 'selesai', 'migrain', 'obat migrain'),
(15, 15, 15, '2025-06-05', '10:30:00', 'gatal', 'selesai', 'dermatitis kontak', 'salep antihistamin');

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id_spesialis` int(11) NOT NULL,
  `nama_spesialis` varchar(30) NOT NULL,
  `biaya` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id_spesialis`, `nama_spesialis`, `biaya`) VALUES
(1, 'Umum', 57000),
(2, 'Gigi', 105000),
(3, 'Anak', 121000),
(4, 'Kulit', 578000),
(5, 'THT', 245000),
(6, 'Gizi', 137000),
(7, 'Saraf', 4150000),
(8, 'Psikiater', 367000),
(9, 'Kandungan', 6050000),
(10, 'Mata', 250000),
(11, 'Jantung', 2740000),
(12, 'Bedah', 2100000),
(13, 'Paru', 512000),
(14, 'Umum', 57000),
(15, 'Gigi', 105000),
(16, 'Anak', 121000),
(17, 'Kulit', 578000),
(18, 'THT', 245000),
(19, 'Gizi', 137000),
(20, 'Saraf', 4150000),
(21, 'Psikiater', 367000),
(22, 'Kandungan', 6050000),
(23, 'Mata', 250000),
(24, 'Jantung', 2740000),
(25, 'Bedah', 2100000),
(26, 'Paru', 512000),
(27, 'Umum', 57000),
(28, 'Gigi', 105000),
(29, 'Anak', 121000),
(30, 'Kulit', 578000),
(31, 'THT', 245000),
(32, 'Gizi', 137000),
(33, 'Saraf', 4150000),
(34, 'Psikiater', 367000),
(35, 'Kandungan', 6050000),
(36, 'Mata', 250000),
(37, 'Jantung', 2740000),
(38, 'Bedah', 2100000),
(39, 'Paru', 512000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_konsultasi` int(11) NOT NULL,
  `nominal` int(11) DEFAULT NULL,
  `metode_bayar` varchar(30) DEFAULT NULL,
  `tanggal_transaksi` date NOT NULL,
  `waktu_transaksi` time NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_konsultasi`, `nominal`, `metode_bayar`, `tanggal_transaksi`, `waktu_transaksi`, `status`) VALUES
(1, 1, 150000, 'tunai', '2025-06-01', '08:45:00', 'lunas'),
(2, 2, 200000, 'transfer', '2025-06-01', '09:10:00', 'lunas'),
(3, 3, 150000, 'tunai', '2025-06-01', '10:15:00', 'lunas'),
(4, 4, 180000, 'e-wallet', '2025-06-02', '08:20:00', 'lunas'),
(5, 5, 150000, 'tunai', '2025-06-02', '09:40:00', 'lunas'),
(6, 6, 170000, 'transfer', '2025-06-02', '10:45:00', 'pending'),
(7, 7, 160000, 'tunai', '2025-06-03', '08:30:00', 'lunas'),
(8, 8, 150000, 'e-wallet', '2025-06-03', '10:00:00', 'lunas'),
(9, 9, 150000, 'tunai', '2025-06-03', '10:15:00', 'lunas'),
(10, 10, 150000, 'transfer', '2025-06-04', '08:20:00', 'lunas'),
(11, 11, 150000, 'tunai', '2025-06-04', '09:50:00', 'lunas'),
(12, 12, 150000, 'e-wallet', '2025-06-04', '10:10:00', 'lunas'),
(13, 13, 150000, 'tunai', '2025-06-05', '08:40:00', 'lunas'),
(14, 14, 150000, 'transfer', '2025-06-05', '09:40:00', 'lunas'),
(15, 15, 150000, 'tunai', '2025-06-05', '10:50:00', 'lunas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `fk_praktik` (`id_praktik`),
  ADD KEY `fk_spesialis` (`id_spesialis`);

--
-- Indexes for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  ADD PRIMARY KEY (`id_konsultasi`),
  ADD KEY `fk_pasien` (`id_pasien`),
  ADD KEY `fk_dokter` (`id_dokter`);

--
-- Indexes for table `jadwal_praktik`
--
ALTER TABLE `jadwal_praktik`
  ADD PRIMARY KEY (`id_praktik`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `riwayat_konsultasi`
--
ALTER TABLE `riwayat_konsultasi`
  ADD PRIMARY KEY (`id_riwayat`),
  ADD KEY `fk_pasien_riwayat` (`id_pasien`),
  ADD KEY `fk_dokter_riwayat` (`id_dokter`);

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id_spesialis`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `fk_konsul` (`id_konsultasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  MODIFY `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jadwal_praktik`
--
ALTER TABLE `jadwal_praktik`
  MODIFY `id_praktik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `riwayat_konsultasi`
--
ALTER TABLE `riwayat_konsultasi`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id_spesialis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_praktik` FOREIGN KEY (`id_praktik`) REFERENCES `jadwal_praktik` (`id_praktik`),
  ADD CONSTRAINT `fk_spesialis` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id_spesialis`);

--
-- Constraints for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  ADD CONSTRAINT `fk_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `riwayat_konsultasi`
--
ALTER TABLE `riwayat_konsultasi`
  ADD CONSTRAINT `fk_dokter_riwayat` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_pasien_riwayat` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_konsul` FOREIGN KEY (`id_konsultasi`) REFERENCES `jadwal_konsultasi` (`id_konsultasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
