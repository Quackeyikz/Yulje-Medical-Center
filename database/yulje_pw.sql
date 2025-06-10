-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 07:04 PM
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
(1, 'Dr. Maya Kartika', '081234567820', 1, 1),
(2, 'Dr. Rizal Anwar', '081234567821', 2, 2),
(3, 'Dr. Sari Wulandari', '081234567822', 3, 3),
(4, 'Dr. Andhika Satria', '081234567823', 4, 4),
(5, 'Dr. Putri Aulia', '081234567824', 5, 5),
(6, 'Dr. Yudha Mardika', '081234567825', 6, 6),
(7, 'Dr. Lestari Handayani', '081234567826', 7, 7),
(8, 'Dr. Farhan Dwi', '081234567827', 8, 8),
(9, 'Dr. Ayu Ramadhani', '081234567828', 9, 9),
(10, 'Dr. Zainul Arifin', '081234567829', 10, 10),
(11, 'Dr. Fitriani', '081234567830', 11, 11),
(12, 'Dr. Hafidz Syaiful', '081234567831', 12, 12),
(13, 'Dr. Widya Aari', '081234567832', 13, 13),
(14, 'Dr. Reza Mahendra', '081234567833', 14, 1),
(15, 'Dr. Intan Amelia', '081234567834', 15, 2);

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
(4, 4, 1, '2025-06-11', '00:00:00', 'Sariawan', 'on'),
(5, 5, 6, '2025-06-10', '10:30:00', 'Demam', 'Terjadwal'),
(7, 7, 7, '2025-06-02', '08:15:00', 'Mimisan', 'Selesai'),
(10, 10, 10, '2025-06-03', '08:00:00', 'Diare', 'Selesai'),
(11, 11, 11, '2025-06-04', '09:30:00', 'Sakit Kepala', 'Terjadwal'),
(12, 12, 12, '2025-06-04', '10:00:00', 'Masuk Angin', 'Selesai');

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
(1, 'Senin', '08:00:00', '12:00:00'),
(2, 'Selasa', '08:00:00', '12:00:00'),
(3, 'Rabu', '08:00:00', '12:00:00'),
(4, 'Kamis', '08:00:00', '12:00:00'),
(5, 'Jumat', '08:00:00', '12:00:00'),
(6, 'Sabtu', '08:00:00', '12:00:00'),
(7, 'Minggu', '08:00:00', '12:00:00'),
(8, 'Senin', '13:00:00', '17:00:00'),
(9, 'Selasa', '13:00:00', '17:00:00'),
(10, 'Rabu', '13:00:00', '17:00:00'),
(11, 'Kamis', '13:00:00', '17:00:00'),
(12, 'Jumat', '13:00:00', '17:00:00'),
(13, 'Sabtu', '13:00:00', '17:00:00'),
(14, 'Minggu', '13:00:00', '17:00:00'),
(15, 'Senin', '18:00:00', '21:00:00');

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
(1, 'Alya', 'Wanita', '2001-03-12', '081234567800', 'Jl. Merdeka No. 1'),
(2, 'Zahra', 'Wanita', '2002-07-24', '081234567801', 'Jl. Kenanga No. 2'),
(3, 'Naufal', 'Pria', '2003-11-10', '081234567802', 'Jl. Melati No. 3'),
(4, 'Aurel', 'Wanita', '2000-05-30', '081234567803', 'Jl. Mawar No. 4'),
(5, 'Raka', 'Pria', '2004-12-01', '081234567804', 'Jl. Anggrek No. 5'),
(6, 'Nadia', 'Wanita', '2005-04-22', '081234567805', 'Jl. Cemara No. 6'),
(7, 'Daffa', 'Pria', '2001-09-19', '081234567806', 'Jl. Flamboyan No. 7'),
(8, 'Shafa', 'Wanita', '2002-02-14', '081234567807', 'Jl. Dahlia No. 8'),
(9, 'Zidan', 'Pria', '2003-08-08', '081234567808', 'Jl. Sakura No. 9'),
(10, 'Naura', 'Wanita', '2000-10-12', '081234567809', 'Jl. Teratai No. 10'),
(11, 'Iqbal', 'Pria', '2004-01-20', '081234567810', 'Jl. Angsana No. 11'),
(12, 'Keisha', 'Wanita', '2005-06-17', '081234567811', 'Jl. Jambu No. 12'),
(13, 'Raihan', 'Pria', '2001-03-05', '081234567812', 'Jl. Rambutan No. 13'),
(14, 'Hana', 'Wanita', '2002-07-07', '081234567813', 'Jl. Pepaya No. 14'),
(15, 'Farel', 'Pria', '2003-11-25', '081234567814', 'Jl. Pisang No. 15'),
(106, '', 'Pria', '2025-06-12', '+6281359813906', NULL),
(107, '', 'Pria', '2025-06-12', '+6281359813906', NULL),
(108, '', 'Pria', '2025-06-03', '+6281359813906', NULL),
(109, '', 'Pria', '2025-07-10', '+6281359813906', NULL),
(110, '', 'Pria', '2025-06-08', '+6281359813906', NULL),
(111, 'Raphael', 'Wanita', '2025-06-10', '+6281359813906', 'Ingrassia');

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
(1, 1, 1, '2025-05-28', '08:30:00', 'Batuk', 'Selesai', 'Infeksi Saluran Pernapasan', 'Sirup Batuk'),
(2, 2, 2, '2025-05-28', '09:00:00', 'Flu', 'Selesai', 'Influenza Ringan', 'Istirahat & Vitamin'),
(3, 3, 3, '2025-06-01', '10:00:00', 'Sakit Tenggorokan', 'Selesai', 'Faringitis', 'Obat Kumur'),
(4, 4, 4, '2025-06-02', '08:00:00', 'Sariawan', 'Selesai', 'Stomatitis', 'Salep Mulut'),
(5, 5, 5, '2025-06-02', '09:30:00', 'Demam', 'Selesai', 'Infeksi Virus', 'Paracetamol'),
(6, 6, 6, '2025-05-29', '10:30:00', 'Alergi', 'Selesai', 'Dermatitis', 'Salep Antihistamin'),
(7, 7, 7, '2025-05-29', '08:15:00', 'Mimisan', 'Selesai', 'Iritasi Hidung', 'Obat Hidung'),
(8, 8, 8, '2025-05-30', '09:45:00', 'Gigi Ngilu', 'Selesai', 'Sensitivitas Gigi', 'Obat Pereda Nyeri'),
(9, 9, 9, '2025-06-03', '10:00:00', 'Nyeri Otot', 'Selesai', 'Ketegangan Otot', 'Kompres Hangat'),
(10, 10, 10, '2025-05-30', '08:00:00', 'Diare', 'Selesai', 'Infeksi Usus', 'Oralit'),
(11, 11, 11, '2025-05-30', '09:30:00', 'Sakit Kepala', 'Selesai', 'Tekanan Darah Tinggi', 'Obat Tekanan Darah'),
(12, 12, 12, '2025-06-04', '10:00:00', 'Masuk Angin', 'Selesai', 'Gastritis Ringan', 'Teh Jahe'),
(13, 13, 13, '2025-06-05', '08:30:00', 'Kembung', 'Selesai', 'Dispepsia', 'Obat Lambung'),
(14, 14, 14, '2025-06-05', '09:30:00', 'Mual', 'Selesai', 'Migrain', 'Obat Migrain'),
(15, 15, 15, '2025-06-05', '10:30:00', 'Gatal', 'Selesai', 'Dermatitis Kontak', 'Salep Antihistamin'),
(16, 1, 1, '2025-06-01', '08:30:00', 'Batuk', 'Selesai', '', ''),
(17, 1, 1, '2025-06-01', '08:30:00', 'Batuk', 'Selesai', '', ''),
(18, 6, 6, '2025-06-02', '10:30:00', 'Alergi', 'Selesai', '', ''),
(19, 14, 14, '2025-06-05', '09:30:00', 'Mual', 'Selesai', '', ''),
(20, 111, 4, '2025-06-12', '10:00:00', 'Kulit melepuh yang menghasilkan rasa gatal', 'Selesai', '', ''),
(21, 13, 13, '2025-06-05', '08:30:00', 'Kembung', 'Selesai', '', '');

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
(13, 'Paru', 512000);

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
(4, 4, 180000, 'E-wallet', '2025-06-02', '08:20:00', 'Lunas'),
(5, 5, 150000, 'Tunai', '2025-06-02', '09:40:00', 'Lunas'),
(7, 7, 160000, 'Tunai', '2025-06-03', '08:30:00', 'Lunas'),
(10, 10, 150000, 'Transfer', '2025-06-04', '08:20:00', 'Lunas'),
(11, 11, 150000, 'Tunai', '2025-06-04', '09:50:00', 'Lunas'),
(12, 12, 150000, 'E-wallet', '2025-06-04', '10:10:00', 'Lunas');

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
  MODIFY `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jadwal_praktik`
--
ALTER TABLE `jadwal_praktik`
  MODIFY `id_praktik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `riwayat_konsultasi`
--
ALTER TABLE `riwayat_konsultasi`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id_spesialis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
