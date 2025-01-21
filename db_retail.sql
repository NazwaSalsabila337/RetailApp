-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table db_retail.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `id_pemasok` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `ukuran` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `id_kategori` int NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `deskripsi_barang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_barang`),
  KEY `FK_barang_pemasok` (`id_pemasok`),
  KEY `FK_barang_kategori` (`id_kategori`),
  CONSTRAINT `FK_barang_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `FK_barang_pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id_pemasok`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.barang: ~6 rows (approximately)
INSERT INTO `barang` (`id_barang`, `id_pemasok`, `nama_barang`, `merk`, `ukuran`, `satuan`, `id_kategori`, `harga_beli`, `harga_jual`, `deskripsi_barang`) VALUES
	(1, 2, 'Air Mineral', 'Lee Mineral', 'Kecil', 'Botol', 3, 3000, 5000, 'Baru'),
	(4, 4, 'Buku', 'Joyko', 'Kecil', 'pcs', 4, 50000, 100000, 'Barang Baru'),
	(6, 5, 'Minyak', 'Sunco', 'Sedang', 'pcs', 5, 20000, 30000, 'Baru'),
	(7, 3, 'Sabun Mandi', 'Detol', 'Besar', 'Botol', 6, 10000, 15000, 'Baru'),
	(8, 5, 'Gula', 'Gulaku', 'Sedang', 'pcs', 5, 10000, 17000, 'Barang Baru'),
	(9, 7, 'Sunscreen', 'Skinaqua', 'Kecil', 'pcs', 7, 40000, 50000, 'Baru');

-- Dumping structure for table db_retail.detail_penjualan
CREATE TABLE IF NOT EXISTS `detail_penjualan` (
  `id_detailpenjualan` int NOT NULL AUTO_INCREMENT,
  `id_penjualan` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah` int NOT NULL,
  `harga` int NOT NULL,
  `totalharga` int NOT NULL,
  PRIMARY KEY (`id_detailpenjualan`),
  KEY `FK_detail_penjualan_penjualan` (`id_penjualan`),
  KEY `FK_detail_penjualan_barang` (`id_barang`),
  CONSTRAINT `FK_detail_penjualan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  CONSTRAINT `FK_detail_penjualan_penjualan` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.detail_penjualan: ~0 rows (approximately)

-- Dumping structure for table db_retail.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` char(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.kategori: ~5 rows (approximately)
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `status`) VALUES
	(2, 'Makanan', 1),
	(3, 'Minuman', 1),
	(4, 'ATK', 1),
	(5, 'Keperluan Masak', 1),
	(6, 'Keperluan Mandi', 1),
	(7, 'Skincare', 1);

-- Dumping structure for table db_retail.pemasok
CREATE TABLE IF NOT EXISTS `pemasok` (
  `id_pemasok` int NOT NULL AUTO_INCREMENT,
  `nama_pemasok` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telepon` char(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_pemasok`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.pemasok: ~4 rows (approximately)
INSERT INTO `pemasok` (`id_pemasok`, `nama_pemasok`, `alamat`, `telepon`, `status`) VALUES
	(2, 'PT.ABC', 'Binjai', '09874625', 1),
	(3, 'PT.SUKA', 'Medan', '763256436278', 1),
	(4, 'PT.AMAN', 'Jakarta', '63524162789', 1),
	(5, 'PT.CINTA', 'Palembang', '7632472346', 1),
	(7, 'PT.SENTOSA', 'Surabaya', '09876354234', 1);

-- Dumping structure for table db_retail.penjualan
CREATE TABLE IF NOT EXISTS `penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `tanggal_penjualan` date NOT NULL,
  `totalbayar` int NOT NULL,
  `bayar` int NOT NULL,
  `kembalian` int NOT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.penjualan: ~6 rows (approximately)
INSERT INTO `penjualan` (`id_penjualan`, `tanggal_penjualan`, `totalbayar`, `bayar`, `kembalian`) VALUES
	(1, '2025-01-09', 200000, 200000, 0),
	(2, '2025-01-09', 90000, 20000, -70000),
	(3, '2025-01-16', 34000, 50000, 16000),
	(4, '2025-01-16', 30000, 50000, 20000),
	(5, '2025-01-16', 10000, 20000, 10000),
	(6, '2025-01-16', 60000, 100000, 40000);

-- Dumping structure for table db_retail.persediaan
CREATE TABLE IF NOT EXISTS `persediaan` (
  `id_persediaan` int NOT NULL AUTO_INCREMENT,
  `id_barang` int NOT NULL,
  `stok_awal` int NOT NULL,
  `stok_masuk` int NOT NULL,
  `stok_keluar` int NOT NULL,
  `stok_akhir` int NOT NULL,
  `deskripsi_persediaan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_persediaan`),
  KEY `FK_persediaan_barang` (`id_barang`),
  CONSTRAINT `FK_persediaan_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.persediaan: ~6 rows (approximately)
INSERT INTO `persediaan` (`id_persediaan`, `id_barang`, `stok_awal`, `stok_masuk`, `stok_keluar`, `stok_akhir`, `deskripsi_persediaan`) VALUES
	(2, 4, 15, 0, 2, 13, 'rusak'),
	(3, 1, 15, 2, 0, 17, 'masuk lagi'),
	(4, 6, 20, 0, 0, 20, 'Baru'),
	(5, 7, 15, 0, 0, 15, 'Baru'),
	(6, 8, 20, 0, 0, 20, 'Barang Baru'),
	(7, 9, 50, 0, 0, 50, 'Baru Masuk');

-- Dumping structure for table db_retail.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_retail.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `username`, `nama_lengkap`, `password`, `level`) VALUES
	(1, 'admin', 'Administrator Web', '202cb962ac59075b964b07152d234b70', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
