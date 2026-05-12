-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 03, 2026 at 05:35 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
USE music;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `0nf`
--

CREATE TABLE `0nf` (
  `author` varchar(255) NOT NULL,
  `album` varchar(255) NOT NULL,
  `song` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `0nf`
--

INSERT INTO `0nf` (`author`, `album`, `song`) VALUES
('Lisa', 'Lalisa', 'Lalisa, Money'),
('Pink Floyd', 'The Dark Side of the Moon', 'Time, Money'),
('Pink Floyd', 'The Division Bell', 'Lost for Words, High Hopes');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `1nf`
--

CREATE TABLE `1nf` (
  `author` varchar(255) NOT NULL,
  `album` varchar(255) NOT NULL,
  `track` varchar(255) NOT NULL,
  `length` time NOT NULL,
  `release_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `1nf`
--

INSERT INTO `1nf` (`author`, `album`, `track`, `length`, `release_year`) VALUES
('Slipknot', 'All Hope Is Gone', 'Gehenna', '00:06:53', '2008'),
('Slipknot', 'All Hope Is Gone', 'Psychosocial', '00:04:44', '2008'),
('Lisa', 'Lalisa', 'Lalisa', '00:03:27', '2021'),
('Lisa', 'Lalisa', 'Money', '00:02:48', '2021'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'A National Acrobat', '00:06:16', '1973'),
('Black Sabbath', 'Sabbath Bloody Sabbath', 'Sabbath Bloody Sabbath', '00:05:45', '1973'),
('Pink Floyd', 'The Dark Side of the Moon', 'Money', '00:06:22', '1973'),
('Pink Floyd', 'The Dark Side of the Moon', 'Time', '00:06:53', '1973'),
('Pink Floyd', 'The Division Bell', 'High Hopes', '00:08:31', '1994'),
('Pink Floyd', 'The Division Bell', 'Lost for Words', '00:05:15', '1994');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `2nf`
--

CREATE TABLE `2nf` (
  `artist` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `capital` varchar(255) NOT NULL,
  `continent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2nf`
--

INSERT INTO `2nf` (`artist`, `country`, `capital`, `continent`) VALUES
('Behemoth', 'Poland', 'Warsaw', 'Europe'),
('Black Sabbath', 'England', 'London', 'Europe'),
('Pink Floyd', 'England', 'London', 'Europe'),
('Slipknot', 'USA', 'Washington D.C.', 'North America');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `2nf`
--
ALTER TABLE `2nf`
  ADD UNIQUE KEY `artist` (`artist`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
