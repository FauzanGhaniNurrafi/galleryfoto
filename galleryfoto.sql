-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Apr 2024 pada 04.20
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galleryfoto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `albumid` int(11) NOT NULL,
  `namaalbum` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggalbuat` date NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`albumid`, `namaalbum`, `deskripsi`, `tanggalbuat`, `userid`) VALUES
(1, 'Gunung', '                                                    Gunung-Gunung Indah                                              ', '2024-04-15', 1),
(3, 'Pantai', 'Pantai-Pantai Indah', '2024-04-15', 1),
(4, 'Langit', 'Langit-Langit Indah', '2024-04-15', 1),
(5, 'Hewan', 'Hewan-Hewan Lucu', '2024-04-15', 1),
(7, 'Danau', 'Danau indah indonesia', '2024-04-17', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `foto`
--

CREATE TABLE `foto` (
  `fotoid` int(11) NOT NULL,
  `judulfoto` varchar(255) NOT NULL,
  `deskripsifoto` text NOT NULL,
  `tanggalunggah` date NOT NULL,
  `lokasifile` varchar(255) NOT NULL,
  `albumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `foto`
--

INSERT INTO `foto` (`fotoid`, `judulfoto`, `deskripsifoto`, `tanggalunggah`, `lokasifile`, `albumid`, `userid`) VALUES
(3, 'Kucing', 'Kucing adalah Mamalia Lucu', '2024-04-15', '1551083067-kucing.jpg', 5, 1),
(4, 'Gunung Sumbing', 'Gunung Estetik', '2024-04-15', '755800260-Mt_ Sumbing.jpg', 1, 1),
(5, 'Danau Toba', 'Danau Sejarah yang indah', '2024-04-17', '1000411614-alam.jpeg', 7, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentarfoto`
--

CREATE TABLE `komentarfoto` (
  `komentarid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `isikomentar` text NOT NULL,
  `tanggalkomentar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `komentarfoto`
--

INSERT INTO `komentarfoto` (`komentarid`, `fotoid`, `userid`, `isikomentar`, `tanggalkomentar`) VALUES
(1, 3, 1, 'lucu banget', '2024-04-17'),
(2, 4, 1, 'gunung nya ko sumbing ya kak? :))', '2024-04-17'),
(3, 3, 1, 'pengen adop', '2024-04-17'),
(4, 4, 1, 'estetik ya, jadi pengen kesana', '2024-04-17'),
(5, 3, 2, 'kocheng ini sangat imuttt', '2024-04-17'),
(6, 4, 2, 'bejir, dulu saya pernah kesitu sekarang jadi beda banget', '2024-04-17'),
(7, 4, 2, 'kapan kapan ke sana lagi ah, lebih estetik sekarang', '2024-04-17'),
(8, 5, 2, 'danau ini indah loh kawan kawan, dan mempunyai sejarah juga', '2024-04-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likefoto`
--

CREATE TABLE `likefoto` (
  `likeid` int(11) NOT NULL,
  `fotoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tanggallike` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `likefoto`
--

INSERT INTO `likefoto` (`likeid`, `fotoid`, `userid`, `tanggallike`) VALUES
(2, 4, 1, '2024-04-16'),
(3, 3, 1, '2024-04-16'),
(5, 4, 2, '2024-04-17'),
(6, 3, 2, '2024-04-17'),
(7, 5, 2, '2024-04-17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `namalengkap` varchar(255) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `email`, `namalengkap`, `alamat`) VALUES
(1, 'zondi', '3f5cb656224bcb500841fd8b06625ccb', 'zondi@gmail.com', 'zondi', 'katapang, bandung'),
(2, 'fauzan', 'eacaf53cb2b533a68baa765faedf7e59', 'fauzan@gmail.com', 'fauzan', 'katapang, bandung');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`fotoid`),
  ADD KEY `albumid` (`albumid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD PRIMARY KEY (`komentarid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD PRIMARY KEY (`likeid`),
  ADD KEY `fotoid` (`fotoid`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `albumid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `foto`
--
ALTER TABLE `foto`
  MODIFY `fotoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  MODIFY `komentarid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  MODIFY `likeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foto_ibfk_2` FOREIGN KEY (`albumid`) REFERENCES `album` (`albumid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentarfoto`
--
ALTER TABLE `komentarfoto`
  ADD CONSTRAINT `komentarfoto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `komentarfoto_ibfk_2` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `likefoto`
--
ALTER TABLE `likefoto`
  ADD CONSTRAINT `likefoto_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likefoto_ibfk_2` FOREIGN KEY (`fotoid`) REFERENCES `foto` (`fotoid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
