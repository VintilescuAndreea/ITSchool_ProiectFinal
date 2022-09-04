-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for magazin_online
CREATE DATABASE IF NOT EXISTS `magazin_online` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `magazin_online`;

-- Dumping structure for table magazin_online.categorie_laptopuri
CREATE TABLE IF NOT EXISTS `categorie_laptopuri` (
  `CategorieID` int NOT NULL,
  `Tip` varchar(50) NOT NULL,
  PRIMARY KEY (`CategorieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table magazin_online.categorie_laptopuri: ~3 rows (approximately)
INSERT INTO `categorie_laptopuri` (`CategorieID`, `Tip`) VALUES
	(12, 'gaming'),
	(134, 'office'),
	(1225, 'gaming');

-- Dumping structure for table magazin_online.clienti
CREATE TABLE IF NOT EXISTS `clienti` (
  `ClientID` int NOT NULL,
  `Username_Client` varchar(50) NOT NULL,
  `Password_Client` varchar(32) NOT NULL,
  `Nume` varchar(50) NOT NULL,
  `Prenume` varchar(50) NOT NULL,
  `Adresa` varchar(50) NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table magazin_online.clienti: ~3 rows (approximately)
INSERT INTO `clienti` (`ClientID`, `Username_Client`, `Password_Client`, `Nume`, `Prenume`, `Adresa`) VALUES
	(1000, 'Bob01', 'bobpassword01', 'Bob', 'John', 'Adresa01'),
	(1001, 'Anne02', 'annepassword02', 'Anne', 'Mey', 'Adresa02'),
	(1002, 'Rose01', 'rosepassword02', 'Rose', 'Dane', 'Adresa03');

-- Dumping structure for table magazin_online.comenzi
CREATE TABLE IF NOT EXISTS `comenzi` (
  `ComandaID` int NOT NULL,
  `ClientID` int NOT NULL,
  `Plata` double(10,2) NOT NULL,
  PRIMARY KEY (`ComandaID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `comenzi_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clienti` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table magazin_online.comenzi: ~2 rows (approximately)
INSERT INTO `comenzi` (`ComandaID`, `ClientID`, `Plata`) VALUES
	(9857, 1002, 6523.00),
	(12546, 1000, 7890.00);

-- Dumping structure for table magazin_online.comenzi_produse
CREATE TABLE IF NOT EXISTS `comenzi_produse` (
  `ProdusID` int NOT NULL,
  `ComandaID` int NOT NULL,
  `NumarProduse` int NOT NULL,
  KEY `ProdusID` (`ProdusID`),
  KEY `ComandaID` (`ComandaID`),
  CONSTRAINT `comenzi_produse_ibfk_1` FOREIGN KEY (`ProdusID`) REFERENCES `laptopuri` (`ProdusID`),
  CONSTRAINT `comenzi_produse_ibfk_2` FOREIGN KEY (`ComandaID`) REFERENCES `comenzi` (`ComandaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table magazin_online.comenzi_produse: ~2 rows (approximately)
INSERT INTO `comenzi_produse` (`ProdusID`, `ComandaID`, `NumarProduse`) VALUES
	(47, 9857, 1),
	(100, 12546, 2);

-- Dumping structure for table magazin_online.laptopuri
CREATE TABLE IF NOT EXISTS `laptopuri` (
  `ProdusID` int NOT NULL,
  `Firma` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Pret` double(10,2) NOT NULL,
  `CategorieID` int NOT NULL,
  PRIMARY KEY (`ProdusID`),
  KEY `CategorieID` (`CategorieID`),
  CONSTRAINT `laptopuri_ibfk_1` FOREIGN KEY (`CategorieID`) REFERENCES `categorie_laptopuri` (`CategorieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table magazin_online.laptopuri: ~3 rows (approximately)
INSERT INTO `laptopuri` (`ProdusID`, `Firma`, `Model`, `Pret`, `CategorieID`) VALUES
	(45, 'Asus', '45Y7', 3200.00, 12),
	(47, 'Hp', '13ASD6', 4500.00, 1225),
	(100, 'Lenovo', 'PRO20', 1200.00, 134);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
