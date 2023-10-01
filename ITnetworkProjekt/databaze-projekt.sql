-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 01. říj 2023, 13:28
-- Verze serveru: 10.4.28-MariaDB
-- Verze PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `databaze-projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `pojištěnci`
--

CREATE TABLE `pojištěnci` (
  `id_pojištěnce` int(11) NOT NULL,
  `e-mail` varchar(255) DEFAULT NULL,
  `jméno` varchar(255) DEFAULT NULL,
  `město` varchar(255) DEFAULT NULL,
  `příjmení` varchar(255) DEFAULT NULL,
  `psč` int(11) DEFAULT NULL,
  `tel_číslo` int(11) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `pojištěnci`
--

INSERT INTO `pojištěnci` (`id_pojištěnce`, `e-mail`, `jméno`, `město`, `příjmení`, `psč`, `tel_číslo`, `adresa`) VALUES
(1, 'jan.zemos@gmail.com', 'Jan', 'Pardubice', 'Zemánek', 53002, 774481037, 'Lexova 2164');

-- --------------------------------------------------------

--
-- Struktura tabulky `pojištění`
--

CREATE TABLE `pojištění` (
  `id_pojištění` int(11) NOT NULL,
  `částka` int(11) DEFAULT NULL,
  `platnost_do` date DEFAULT NULL,
  `platnost_od` date DEFAULT NULL,
  `předmět_pojištění` varchar(255) DEFAULT NULL,
  `typ_pojištění` varchar(255) DEFAULT NULL,
  `id_pojištěnce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `pojištění`
--

INSERT INTO `pojištění` (`id_pojištění`, `částka`, `platnost_do`, `platnost_od`, `předmět_pojištění`, `typ_pojištění`, `id_pojištěnce`) VALUES
(1, 2500000, '2025-01-10', '2023-01-10', 'Dům', 'Pojištění nemovitost', 1),
(2, 500000, '2027-02-13', '2022-06-27', 'Kolo', 'Pojištění majetku', 1),
(3, 853000, '2030-11-11', '2000-11-11', 'Odpovědnost', 'Pojištění odpovědnosti', 1),
(4, 40000, '2024-10-02', '2023-10-01', 'Osoba', 'Úrazové pojištění', 1);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `pojištěnci`
--
ALTER TABLE `pojištěnci`
  ADD PRIMARY KEY (`id_pojištěnce`);

--
-- Indexy pro tabulku `pojištění`
--
ALTER TABLE `pojištění`
  ADD PRIMARY KEY (`id_pojištění`),
  ADD KEY `FK66bc4bbrysw0e95x21gs3eyny` (`id_pojištěnce`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `pojištěnci`
--
ALTER TABLE `pojištěnci`
  MODIFY `id_pojištěnce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `pojištění`
--
ALTER TABLE `pojištění`
  MODIFY `id_pojištění` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `pojištění`
--
ALTER TABLE `pojištění`
  ADD CONSTRAINT `FK66bc4bbrysw0e95x21gs3eyny` FOREIGN KEY (`id_pojištěnce`) REFERENCES `pojištěnci` (`id_pojištěnce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
