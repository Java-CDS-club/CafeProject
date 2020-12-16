-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2020 at 11:31 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kaficseminarski`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikal`
--

CREATE TABLE `artikal` (
  `ArtikalID` int(11) UNSIGNED NOT NULL,
  `NazivArtikla` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `CenaArtiklaSaPdvom` double DEFAULT NULL,
  `CenaArtiklaBezPdva` double DEFAULT NULL,
  `JedinicaMere` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `KorisnikID` int(11) UNSIGNED NOT NULL,
  `PdvStopaID` int(11) UNSIGNED NOT NULL
) ;

--
-- Dumping data for table `artikal`
--

INSERT INTO `artikal` (`ArtikalID`, `NazivArtikla`, `CenaArtiklaSaPdvom`, `CenaArtiklaBezPdva`, `JedinicaMere`, `KorisnikID`, `PdvStopaID`) VALUES
(2, 'Cedevita', 264, 220, 'ml', 1, 1),
(4, 'Fanta', 206.41500000000002, 187.65, 'ml', 1, 2),
(6, 'Espreso', 108, 90, 'ml', 1, 1),
(7, 'Nescafe', 154, 140, 'ml', 1, 2),
(28, 'Tost sendvic', 300, 250, 'kom', 1, 1),
(29, 'Somersby', 308, 280, 'ml', 2, 2),
(30, 'Sladoled', 72, 60, 'kom', 2, 1),
(31, 'Caffe macchiato', 258, 215, 'ml', 1, 1),
(32, 'Koktel', 384, 320, 'ml', 1, 1),
(33, 'Coca Cola', 211.716, 176.43, 'ml', 1, 1),
(34, 'Plazma sejk', 389.85119999999995, 324.876, 'ml', 1, 1),
(37, 'Smoothie', 245.47199999999998, 204.56, 'ml', 1, 1),
(38, 'Zajecarsko pivo', 276, 230, 'ml', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `KorisnikID` int(11) UNSIGNED NOT NULL,
  `Ime` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Prezime` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Username` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`KorisnikID`, `Ime`, `Prezime`, `Username`, `Password`) VALUES
(1, 'Marija', 'Bjelopetrovic', 'marija', 'marija123'),
(2, 'Stefan', 'Jovanovic', 'stefan', 'stefan123'),
(3, 'Masa', 'Novakovic', 'masa', 'masa123'),
(4, 'Milos', 'Vojvodic', 'milos', 'milos123'),
(5, 'Olja', 'Radivojevic', 'olja', 'olja123');

-- --------------------------------------------------------

--
-- Table structure for table `pdvstopa`
--

CREATE TABLE `pdvstopa` (
  `PdvStopaID` int(11) UNSIGNED NOT NULL,
  `Naziv` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Iznos` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pdvstopa`
--

INSERT INTO `pdvstopa` (`PdvStopaID`, `Naziv`, `Iznos`) VALUES
(1, 'Opšta stopa', 20),
(2, 'Posebna stopa', 10);

-- --------------------------------------------------------

--
-- Table structure for table `porudzbenica`
--

CREATE TABLE `porudzbenica` (
  `PorudzbenicaID` int(10) UNSIGNED NOT NULL,
  `DatumPorudzbenice` date DEFAULT NULL,
  `UkupnaCenaSaPdvom` double DEFAULT NULL,
  `UkupnaCenaBezPdva` double DEFAULT NULL,
  `StoID` int(10) UNSIGNED NOT NULL,
  `KorisnikID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `porudzbenica`
--

INSERT INTO `porudzbenica` (`PorudzbenicaID`, `DatumPorudzbenice`, `UkupnaCenaSaPdvom`, `UkupnaCenaBezPdva`, `StoID`, `KorisnikID`) VALUES
(25, '2020-07-13', 1418, 1240, 2, 2),
(30, '2020-07-16', 1433.8300000000002, 1295.3, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stavkaporudzbenice`
--

CREATE TABLE `stavkaporudzbenice` (
  `PorudzbenicaID` int(10) UNSIGNED NOT NULL,
  `Rb` int(10) UNSIGNED NOT NULL,
  `Kolicina` int(11) DEFAULT NULL,
  `UkupnaCenaSaPdvom` double DEFAULT NULL,
  `UkupnaCenaBezPdva` double DEFAULT NULL,
  `ArtikalID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stavkaporudzbenice`
--

INSERT INTO `stavkaporudzbenice` (`PorudzbenicaID`, `Rb`, `Kolicina`, `UkupnaCenaSaPdvom`, `UkupnaCenaBezPdva`, `ArtikalID`) VALUES
(16, 1, 2, 216, 180, 21),
(16, 3, 3, 462, 420, 22),
(17, 1, 5, 216, 180, 21),
(19, 1, 2, 216, 180, 21),
(19, 3, 2, 480, 400, 19),
(25, 1, 4, 288, 240, 30),
(25, 3, 5, 770, 700, 7),
(30, 1, 2, 412.83000000000004, 375.3, 4),
(30, 2, 3, 759.0000000000001, 690, 28),
(30, 3, 1, 108, 90, 6),
(30, 4, 1, 154, 140, 7);

-- --------------------------------------------------------

--
-- Table structure for table `sto`
--

CREATE TABLE `sto` (
  `StoID` int(10) UNSIGNED NOT NULL,
  `PozicijaStola` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BrojLjudi` int(11) DEFAULT NULL,
  `Status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sto`
--

INSERT INTO `sto` (`StoID`, `PozicijaStola`, `BrojLjudi`, `Status`) VALUES
(1, '1 Sank', 1, 0),
(2, '2 Sank', 1, 1),
(3, '1 Basta', 4, 0),
(4, '2 Basta', 3, 1),
(5, '1 Sredina', 6, 0),
(6, '2 Sredina', 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikal`
--
ALTER TABLE `artikal`
  ADD PRIMARY KEY (`ArtikalID`),
  ADD KEY `fk1_korisnik` (`KorisnikID`),
  ADD KEY `fk2_pdvstopa` (`PdvStopaID`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`KorisnikID`);

--
-- Indexes for table `pdvstopa`
--
ALTER TABLE `pdvstopa`
  ADD PRIMARY KEY (`PdvStopaID`);

--
-- Indexes for table `porudzbenica`
--
ALTER TABLE `porudzbenica`
  ADD PRIMARY KEY (`PorudzbenicaID`),
  ADD KEY `fk1_sto` (`StoID`),
  ADD KEY `fk3_kori` (`KorisnikID`);

--
-- Indexes for table `stavkaporudzbenice`
--
ALTER TABLE `stavkaporudzbenice`
  ADD PRIMARY KEY (`PorudzbenicaID`,`Rb`),
  ADD KEY `fk_artikal2` (`ArtikalID`);

--
-- Indexes for table `sto`
--
ALTER TABLE `sto`
  ADD PRIMARY KEY (`StoID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikal`
--
ALTER TABLE `artikal`
  MODIFY `ArtikalID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `KorisnikID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pdvstopa`
--
ALTER TABLE `pdvstopa`
  MODIFY `PdvStopaID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `porudzbenica`
--
ALTER TABLE `porudzbenica`
  MODIFY `PorudzbenicaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sto`
--
ALTER TABLE `sto`
  MODIFY `StoID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikal`
--
ALTER TABLE `artikal`
  ADD CONSTRAINT `fk1_korisnik` FOREIGN KEY (`KorisnikID`) REFERENCES `korisnik` (`KorisnikID`),
  ADD CONSTRAINT `fk2_pdvstopa` FOREIGN KEY (`PdvStopaID`) REFERENCES `pdvstopa` (`PdvStopaID`);

--
-- Constraints for table `porudzbenica`
--
ALTER TABLE `porudzbenica`
  ADD CONSTRAINT `fk1_sto` FOREIGN KEY (`StoID`) REFERENCES `sto` (`StoID`),
  ADD CONSTRAINT `fk3_kori` FOREIGN KEY (`KorisnikID`) REFERENCES `korisnik` (`KorisnikID`);

--
-- Constraints for table `stavkaporudzbenice`
--
ALTER TABLE `stavkaporudzbenice`
  ADD CONSTRAINT `fk_artikal` FOREIGN KEY (`ArtikalID`) REFERENCES `artikal` (`ArtikalID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_artikal2` FOREIGN KEY (`ArtikalID`) REFERENCES `artikal` (`ArtikalID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_porudzbenica` FOREIGN KEY (`PorudzbenicaID`) REFERENCES `porudzbenica` (`PorudzbenicaID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_porudzbenica2` FOREIGN KEY (`PorudzbenicaID`) REFERENCES `porudzbenica` (`PorudzbenicaID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
