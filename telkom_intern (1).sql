-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Feb 2026 pada 08.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telkom_intern`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status_kehadiran` enum('Hadir','Izin','Sakit') NOT NULL,
  `bukti_foto` varchar(255) DEFAULT NULL,
  `waktu_absen` time DEFAULT curtime(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `absensi`
--

INSERT INTO `absensi` (`id`, `user_id`, `tanggal`, `status_kehadiran`, `bukti_foto`, `waktu_absen`, `created_at`) VALUES
(4, 15, '2026-01-23', 'Hadir', 'Absensi_15_20260123_101732.png', '10:17:32', '2026-01-23 09:17:32'),
(5, 15, '2026-01-26', 'Sakit', 'Absensi_15_20260126_073442.png', '07:34:42', '2026-01-26 06:34:42'),
(6, 19, '2026-01-28', 'Hadir', 'Absensi_19_20260128_052136.png', '05:21:36', '2026-01-28 04:21:36'),
(7, 20, '2026-01-28', 'Izin', 'Absensi_20_20260128_054836.jpg', '05:48:36', '2026-01-28 04:48:36'),
(8, 24, '2026-01-31', 'Hadir', 'Absensi_24_20260131_101038.png', '10:10:38', '2026-01-31 09:10:38'),
(9, 15, '2026-01-31', 'Hadir', 'Absensi_15_20260131_123722.png', '12:37:22', '2026-01-31 11:37:22'),
(10, 15, '2026-02-01', 'Hadir', 'Absensi_15_20260201_110345.png', '11:03:45', '2026-02-01 10:03:45'),
(11, 15, '2026-02-02', 'Hadir', 'Absensi_15_20260202_042332.png', '04:23:32', '2026-02-02 03:23:32'),
(12, 17, '2026-02-02', 'Hadir', 'Absensi_17_20260202_042659.png', '04:26:59', '2026-02-02 03:26:59'),
(13, 27, '2026-02-02', 'Hadir', 'Absensi_27_20260202_075647.png', '07:56:47', '2026-02-02 06:56:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluhan`
--

CREATE TABLE `keluhan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subjek` varchar(200) NOT NULL,
  `detail` text NOT NULL,
  `status` enum('Menunggu','Diproses','Selesai') DEFAULT 'Menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keluhan`
--

INSERT INTO `keluhan` (`id`, `user_id`, `subjek`, `detail`, `status`, `created_at`) VALUES
(2, 15, 'cape', 'banget', '', '2026-01-22 15:43:11'),
(3, 15, 'JARINGAN', 'jaringan nya jelek jadi aku susah ngakses internet nya', '', '2026-01-23 09:29:29'),
(4, 20, 'APA', 'apaan dah', '', '2026-01-28 04:49:39'),
(5, 15, 'dih', 'dih ga bnget', '', '2026-01-30 03:53:48'),
(6, 24, 'JARINGAN', 'jelek', '', '2026-01-31 09:11:20'),
(7, 24, 'JARINGAN', 'jelek', '', '2026-01-31 09:11:25'),
(8, 15, 'AKu', 'aku udah males magang', '', '2026-01-31 11:18:50'),
(9, 15, 'haaa?', 'ohh haa haa', '', '2026-01-31 11:38:24'),
(10, 15, 'spontan', 'uhuy', '', '2026-01-31 11:50:12'),
(11, 15, 'ini', 'juga udah kan', '', '2026-01-31 12:00:21'),
(12, 15, 'ha', 'yayayyayya', '', '2026-01-31 06:26:22'),
(13, 15, '...', '..................', '', '2026-01-31 06:36:43'),
(14, 15, 'apa yaaa', 'adalah pokoknya', '', '2026-02-01 04:06:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `logbook`
--

CREATE TABLE `logbook` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `aktivitas` text NOT NULL,
  `bukti_file` varchar(255) DEFAULT NULL,
  `status` enum('Menunggu Review','Direview') DEFAULT 'Menunggu Review',
  `komentar_mentor` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `logbook`
--

INSERT INTO `logbook` (`id`, `user_id`, `tanggal`, `aktivitas`, `bukti_file`, `status`, `komentar_mentor`, `created_at`) VALUES
(4, 15, '2026-01-22', 'bikin website', NULL, '', 'mantap, udah sampai mana?<3', '2026-01-22 14:55:03'),
(5, 15, '2026-01-23', 'hari ini aku bikin fitur absensi', NULL, '', 'lanjutkan', '2026-01-23 09:28:39'),
(6, 19, '2026-01-28', 'hari ni aku bikin 3 fitur', NULL, '', 'y', '2026-01-28 04:23:06'),
(7, 19, '2026-01-28', 'hari ni aku bikin 3 fitur', NULL, '', 'y', '2026-01-28 04:23:29'),
(8, 19, '2026-01-28', 'hari ni aku bikin 3 fitur', NULL, '', 'y', '2026-01-28 04:23:30'),
(9, 19, '2026-01-28', 'hari ni aku bikin 3 fitur', NULL, '', 'y', '2026-01-28 04:23:30'),
(10, 20, '2026-01-28', 'ngerjain di rumah aja', NULL, '', 'y', '2026-01-28 04:48:51'),
(11, 20, '2026-01-28', 'adalah pokoknya', NULL, '', 'y', '2026-01-28 04:55:07'),
(12, 17, '2026-01-29', 'iypp ko aa', NULL, '', 'y', '2026-01-29 07:32:02'),
(13, 15, '2026-01-29', 'hari ko', NULL, '', 'y', '2026-01-29 07:33:47'),
(14, 15, '2026-01-29', 'hari ko', NULL, '', 'ok', '2026-01-29 07:33:55'),
(15, 15, '2026-01-29', 'jadhiuwa', NULL, '', 'y', '2026-01-29 07:38:29'),
(16, 15, '2026-01-29', 'jksdckj', NULL, '', 'u', '2026-01-29 07:44:40'),
(17, 15, '2026-01-29', 'takut', NULL, '', 'y', '2026-01-29 07:46:10'),
(18, 15, '2026-01-29', 'jkdhsakk', NULL, '', 'ntaps', '2026-01-29 07:52:56'),
(19, 15, '2026-01-29', 'hahahha', NULL, '', 'y', '2026-01-29 08:11:38'),
(20, 15, '2026-01-29', 'ehey', 'uploads/logbook/1769674552_2.jpg', '', 'y', '2026-01-29 08:15:52'),
(21, 19, '2026-01-29', 'uhut', 'uploads/logbook/1769674887_4.png', '', 'mntap', '2026-01-29 08:21:27'),
(22, 15, '2026-01-29', 'banyak lai', 'uploads/logbook/1769674936_[BG] ONLINE MEETING.png', '', 'baa lai', '2026-01-29 08:22:16'),
(23, 22, '2026-01-30', 'halo', NULL, '', 'gus', '2026-01-30 07:46:57'),
(24, 22, '2026-01-30', 'halo', NULL, '', 'iy\'', '2026-01-30 07:46:59'),
(25, 24, '2026-01-31', 'ok', NULL, '', 'ha?', '2026-01-31 09:10:53'),
(26, 24, '2026-01-31', 'ok', NULL, '', NULL, '2026-01-31 09:10:57'),
(27, 24, '2026-01-31', 'ok', NULL, '', 'okok mulu ni anak', '2026-01-31 09:10:58'),
(30, 24, '2026-01-31', 'ok', NULL, '', 'yo', '2026-01-31 09:10:59'),
(31, 24, '2026-01-31', 'ok', NULL, '', 'apaan si', '2026-01-31 09:10:59'),
(32, 15, '2026-01-31', 'yap mari', NULL, '', NULL, '2026-01-31 11:37:37'),
(33, 15, '2026-01-31', 'udah kah', NULL, '', NULL, '2026-01-31 12:00:04'),
(34, 15, '2026-01-31', 'jshduhiwuhjqoiwjq', NULL, 'Menunggu Review', NULL, '2026-01-31 12:31:12'),
(35, 15, '2026-01-31', 'ha', NULL, '', NULL, '2026-01-31 12:36:09'),
(36, 15, '2026-01-31', 'HASIJHOI', NULL, '', NULL, '2026-01-31 12:49:36'),
(37, 15, '2026-01-31', 'aku', NULL, '', NULL, '2026-01-31 13:32:54'),
(38, 15, '2026-02-01', 'udah bisa?', NULL, '', NULL, '2026-02-01 10:04:02'),
(39, 15, '2026-02-01', 'ai lov u', NULL, '', NULL, '2026-02-01 10:19:25'),
(40, 15, '2026-02-01', 'apa iya', NULL, '', NULL, '2026-02-01 10:26:20'),
(41, 15, '2026-02-01', 'hahahhhaha', NULL, '', NULL, '2026-02-01 10:28:35'),
(42, 15, '2026-02-01', 'hahahhhaha', NULL, '', NULL, '2026-02-01 10:28:52'),
(43, 15, '2026-02-01', 'hahahha', NULL, '', NULL, '2026-02-01 10:31:58'),
(44, 15, '2026-02-01', 'nori dwi yulianti', NULL, '', NULL, '2026-02-01 10:32:14'),
(45, 15, '2026-02-01', 'shaza', NULL, '', NULL, '2026-02-01 10:37:00'),
(46, 15, '2026-02-01', 'IYOOO U', NULL, '', NULL, '2026-02-01 11:30:34'),
(47, 15, '2026-02-02', 'ngopi', NULL, '', NULL, '2026-02-02 03:18:49'),
(48, 27, '2026-02-02', 'presentasi', NULL, '', NULL, '2026-02-02 06:58:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mentor_intern`
--

CREATE TABLE `mentor_intern` (
  `id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `intern_id` int(11) NOT NULL,
  `division` varchar(100) DEFAULT NULL,
  `campus` varchar(100) DEFAULT NULL,
  `status` enum('aktif','warning','danger') NOT NULL DEFAULT 'aktif',
  `progress_percent` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `tasks_done` int(11) NOT NULL DEFAULT 0,
  `tasks_total` int(11) NOT NULL DEFAULT 0,
  `ind_task` tinyint(1) NOT NULL DEFAULT 0,
  `ind_logbook` tinyint(1) NOT NULL DEFAULT 0,
  `ind_absen` tinyint(1) NOT NULL DEFAULT 0,
  `ind_issue` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mentor_intern`
--

INSERT INTO `mentor_intern` (`id`, `mentor_id`, `intern_id`, `division`, `campus`, `status`, `progress_percent`, `tasks_done`, `tasks_total`, `ind_task`, `ind_logbook`, `ind_absen`, `ind_issue`, `created_at`, `updated_at`) VALUES
(1, 17, 15, 'Digital produk', 'Universitas Andalas', 'aktif', 0, 1, 1, 1, 2, 2, 2, '2026-01-26 09:12:43', '2026-01-26 09:12:43'),
(2, 17, 24, 'Data Analyst', 'unand', 'aktif', 0, 0, 0, 0, 0, 0, 0, '2026-01-30 08:34:46', '2026-01-30 08:34:46'),
(3, 17, 25, 'Data Analyst', 'unand', 'aktif', 0, 0, 0, 0, 0, 0, 0, '2026-01-30 08:37:06', '2026-01-30 08:37:06'),
(4, 17, 26, 'Marketing', 'Universitas Andalas', 'aktif', 0, 0, 0, 0, 0, 0, 0, '2026-01-31 09:00:49', '2026-01-31 09:00:49'),
(5, 17, 27, 'IT Development', 'universitas Andalas', 'aktif', 0, 0, 0, 0, 0, 0, 0, '2026-02-02 06:53:32', '2026-02-02 06:53:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `title` varchar(120) NOT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `is_read`, `created_at`) VALUES
(2, 17, 'task', 'Task dikirim ke Shaza Zulfiani', 'Judul: kjsdhcn | Divisi: Digital Produk | Deadline: 29 Jan 2026 17:15', 1, '2026-01-29 14:15:13'),
(4, 17, 'task', 'Menerima Hasil Task Shaza Zulfiani', 'Judul: kjasc | Divisi: Digital Produk | Deadline: 29 Jan 2026 19:22', 1, '2026-01-29 14:22:55'),
(5, 17, 'task', 'Tugas Baru / Aktivitas Intern', 'Intern melakukan aktivitas...', 1, '2026-01-29 14:22:55'),
(6, 17, 'task', 'Menerima Hasil Task aditya marwan', 'Judul: iji | Divisi: IT Development | Deadline: 30 Jan 2026 14:20', 1, '2026-01-30 09:20:22'),
(7, 17, 'task', 'Menerima Hasil Task aditya marwan', 'Judul: iji | Divisi: IT Development | Deadline: 30 Jan 2026 14:20', 1, '2026-01-30 09:22:42'),
(8, 17, 'task', 'Menerima Hasil Task aditya marwan', 'Judul: iji | Divisi: IT Development | Deadline: 30 Jan 2026 14:20', 1, '2026-01-30 09:24:58'),
(9, 17, 'task', 'Menerima Hasil Task Shaza Zulfiani', 'Judul: iji | Divisi: Digital Produk | Deadline: 30 Jan 2026 14:20', 1, '2026-01-30 09:25:09'),
(10, 17, 'task', 'Menerima Hasil Task Shaza Zulfiani', 'Judul: iji | Divisi: Digital Produk | Deadline: 30 Jan 2026 14:20', 1, '2026-01-30 09:25:13'),
(11, 17, 'task', 'Menerima Hasil Task Shaza Zulfiani', 'Judul: jkagdkuga | Divisi: Digital Produk | Deadline: 30 Jan 2026 09:25', 1, '2026-01-30 09:26:04'),
(12, 21, 'task', 'Task Baru dari Mentor', 'Task: kjahsggd | Divisi: IT Development | Deadline: 30 Jan 2026 09:31 | ID Task: #17', 0, '2026-01-30 09:32:01'),
(13, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: aditya marwan | Divisi: IT Development | Task: kjahsggd | Deadline: 30 Jan 2026 09:31 | ID Task: #17', 1, '2026-01-30 09:32:01'),
(14, 15, 'task', 'Task Baru dari Mentor', 'Task: apppppppppp | Divisi: Digital Produk | Deadline: 30 Jan 2026 14:52 | ID Task: #18', 0, '2026-01-30 14:52:25'),
(15, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: Shaza Zulfiani | Divisi: Digital Produk | Task: apppppppppp | Deadline: 30 Jan 2026 14:52 | ID Task: #18', 1, '2026-01-30 14:52:25'),
(16, 24, 'task', 'Task Baru dari Mentor', 'Task: website | Divisi: Data Analyst | Deadline: 31 Jan 2026 16:08 | ID Task: #19', 0, '2026-01-31 16:08:21'),
(17, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: asal khasanah | Divisi: Data Analyst | Task: website | Deadline: 31 Jan 2026 16:08 | ID Task: #19', 1, '2026-01-31 16:08:21'),
(18, 15, 'task', 'Task Baru dari Mentor', 'Task: revisi website | Divisi: Digital Produk | Deadline: 03 Feb 2026 17:52 | ID Task: #20', 0, '2026-02-01 17:52:37'),
(19, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: Shaza Zulfiani | Divisi: Digital Produk | Task: revisi website | Deadline: 03 Feb 2026 17:52 | ID Task: #20', 1, '2026-02-01 17:52:37'),
(20, 15, 'task', 'Task Baru dari Mentor', 'Task: perbaiki data | Divisi: Digital Produk | Deadline: 03 Oct 2025 12:00 | ID Task: #21', 0, '2026-02-02 13:12:17'),
(21, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: Shaza Zulfiani | Divisi: Digital Produk | Task: perbaiki data | Deadline: 03 Oct 2025 12:00 | ID Task: #21', 0, '2026-02-02 13:12:17'),
(22, 15, 'task', 'Task Baru dari Mentor', 'Task: lanjutkan backend | Divisi: Digital Produk | Deadline: 03 Nov 2026 23:00 | ID Task: #22', 0, '2026-02-02 13:15:01'),
(23, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: Shaza Zulfiani | Divisi: Digital Produk | Task: lanjutkan backend | Deadline: 03 Nov 2026 23:00 | ID Task: #22', 0, '2026-02-02 13:15:01'),
(24, 15, 'task', 'Task Baru dari Mentor', 'Task: keren untuk semua | Divisi: Digital Produk | Deadline: 03 Nov 2026 00:00 | ID Task: #23', 0, '2026-02-02 13:35:08'),
(25, 15, 'task', 'Task berhasil dikirim', 'Terkirim ke: Shaza Zulfiani | Divisi: Digital Produk | Task: keren untuk semua | Deadline: 03 Nov 2026 00:00 | ID Task: #23', 0, '2026-02-02 13:35:08'),
(26, 27, 'task', 'Task Baru dari Mentor', 'Task: perbaiki data | Divisi: IT Development | Deadline: 01 Mar 2026 13:59 | ID Task: #24', 0, '2026-02-02 13:59:30'),
(27, 17, 'task', 'Task berhasil dikirim', 'Terkirim ke: NORI DWI YULIANTY | Divisi: IT Development | Task: perbaiki data | Deadline: 01 Mar 2026 13:59 | ID Task: #24', 0, '2026-02-02 13:59:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `icon` varchar(50) DEFAULT 'bullhorn',
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `isi`, `kategori`, `icon`, `tanggal`) VALUES
(1, 'Rapat Evaluasi Mingguan', 'Diharapkan seluruh intern divisi IT Development untuk berkumpul di Ruang Meeting 2 pada pukul 14:00 WIB untuk evaluasi progress mingguan.', 'Meeting', 'users', '2026-01-22 10:00:00'),
(2, 'Maintenance Server', 'Server development akan mengalami downtime pada hari Sabtu pukul 22:00 - 24:00 WIB untuk pemeliharaan rutin. Harap simpan pekerjaan Anda sebelum waktu tersebut.', 'Info Penting', 'circle-info', '2026-01-21 09:00:00'),
(3, 'Libur Cuti Bersama', 'Sehubungan dengan hari raya, maka kegiatan magang diliburkan pada tanggal 25-26 Januari 2026. Masuk kembali pada tanggal 27 Januari.', 'Libur', 'calendar-check', '2026-01-19 15:00:00'),
(4, 'LIBUR BERSAMA', 'karna badai semuanya libur', 'Libur', 'calendar-check', '2026-01-26 18:46:16'),
(5, 'Rapat', 'lt 7 bsok', 'Meeting', 'circle-info', '2026-01-26 19:06:16'),
(6, 'jahsdiuew', 'oiewqduwegd', 'Info Umum', 'circle-info', '2026-01-28 09:47:22'),
(7, 'kita rapat minguan', 'tentng intern', 'Rapat / Meeting', 'users', '2026-01-31 16:05:30'),
(8, 'RAPAT OCR', 'kita fokus ke data ocr', 'Rapat / Meeting', 'users', '2026-02-01 21:39:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kehadiran` int(11) DEFAULT 0,
  `kedisiplinan` int(11) DEFAULT 0,
  `logbook` int(11) DEFAULT 0,
  `komunikasi` int(11) DEFAULT 0,
  `teamwork` int(11) DEFAULT 0,
  `rata_rata` decimal(5,2) DEFAULT 0.00,
  `grade` varchar(5) DEFAULT 'E',
  `sebutan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id`, `mentor_id`, `user_id`, `kehadiran`, `kedisiplinan`, `logbook`, `komunikasi`, `teamwork`, `rata_rata`, `grade`, `sebutan`, `created_at`, `updated_at`) VALUES
(1, 17, 15, 92, 90, 77, 80, 89, 85.60, 'A', 'Sangat Cemerlang', '2026-01-30 04:04:38', '2026-02-01 14:22:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `performance`
--

CREATE TABLE `performance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `hari_ke` int(11) NOT NULL,
  `skor` int(11) DEFAULT 0,
  `tugas_selesai` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mentor_id` int(11) DEFAULT NULL,
  `nama_task` varchar(200) NOT NULL,
  `file_instruksi` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `deadline` date NOT NULL,
  `status` enum('Belum Dikumpulkan','Sudah Dikumpulkan') DEFAULT 'Belum Dikumpulkan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `mentor_id`, `nama_task`, `file_instruksi`, `description`, `attachment_path`, `attachment_name`, `deadline`, `status`, `created_at`) VALUES
(4, 15, NULL, 'Bikin Data OCR', NULL, NULL, NULL, NULL, '2026-01-31', 'Sudah Dikumpulkan', '2026-01-22 15:08:48'),
(5, 15, 17, 'website', NULL, 'buat bagus\"', 'uploads/tasks/task_1769662739_e615e847.pdf', 'Nilai_Intern_Telkom.pdf', '2026-02-07', 'Sudah Dikumpulkan', '2026-01-29 04:58:59'),
(6, 13, 17, 'website', NULL, 'baligsuid', 'uploads/tasks/task_1769667000_fa07dcea.pdf', 'CV_Nori Dwi Yulianti_Teknik Komputer Unand.pdf', '2026-01-29', '', '2026-01-29 06:10:00'),
(7, 15, 17, 'buek iko aa', NULL, 'jan mangango jo', 'uploads/tasks/task_1769669029_ccbcc5f3.docx', '5018d8d8-91ee-42e3-9a36-7a246ca97d7e.docx', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-29 06:43:49'),
(8, 15, 17, 'kjsudiuqw', NULL, 'deguwie', 'uploads/tasks/task_1769670368_4a162b01.png', '[BG] ONLINE MEETING.png', '2026-01-29', 'Sudah Dikumpulkan', '2026-01-29 07:06:08'),
(9, 15, 17, 'kjsdhcn', NULL, 'kjahdiuwqhcscoiaubc;', 'uploads/tasks/task_1769670913_684fe1c1.jpg', '1.jpg', '2026-01-29', '', '2026-01-29 07:15:13'),
(10, 15, 17, 'kjasc', NULL, 'iuweyd8iwq', 'uploads/tasks/task_1769671375_4af249cf.png', '1.png', '2026-01-29', '', '2026-01-29 07:22:55'),
(11, 21, 17, 'iji', NULL, 'iuqweyfdiuqhywdiqaudq', 'uploads/tasks/task_1769739622_959ba7c8.jpeg', 'download (1).jpeg', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-30 02:20:22'),
(12, 21, 17, 'iji', NULL, 'iuqweyfdiuqhywdiqaudq', 'uploads/tasks/task_1769739762_7f06fa00.jpeg', 'download (1).jpeg', '2026-01-30', '', '2026-01-30 02:22:42'),
(13, 21, 17, 'iji', NULL, 'iuqweyfdiuqhywdiqaudq', 'uploads/tasks/task_1769739898_58a1c358.jpeg', 'download (1).jpeg', '2026-01-30', '', '2026-01-30 02:24:58'),
(14, 15, 17, 'iji', NULL, 'iuqweyfdiuqhywdiqaudq', 'uploads/tasks/task_1769739908_e707b43a.jpeg', 'download (1).jpeg', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-30 02:25:09'),
(15, 15, 17, 'iji', NULL, 'iuqweyfdiuqhywdiqaudq', 'uploads/tasks/task_1769739913_34f33ff2.jpeg', 'download (1).jpeg', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-30 02:25:13'),
(16, 15, 17, 'jkagdkuga', NULL, 'kahsiuguqiwc', 'uploads/tasks/task_1769739964_6d1a1185.png', '1.png', '2026-01-30', '', '2026-01-30 02:26:04'),
(17, 21, 17, 'kjahsggd', NULL, 'kjahsudw', 'uploads/tasks/task_1769740321_4e52c7e7.PNG', 'Capture.PNG', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-30 02:32:01'),
(18, 15, 17, 'apppppppppp', NULL, 'aiiiiiiiiiiiiiiiiiiii', 'uploads/tasks/task_1769759545_2e3abe04.png', '[BG] ONLINE MEETING.png', '2026-01-30', 'Sudah Dikumpulkan', '2026-01-30 07:52:25'),
(19, 24, 17, 'website', NULL, 'yyyyyyyyyyyyy', 'uploads/tasks/task_1769850501_2d7773bd.jpg', '0.jpg', '2026-01-31', 'Sudah Dikumpulkan', '2026-01-31 09:08:21'),
(20, 15, 17, 'revisi website', NULL, 'jangan kayak gitu kayak gini aja', 'uploads/tasks/task_1769943157_a68de6a8.png', '222.png', '2026-02-03', 'Sudah Dikumpulkan', '2026-02-01 10:52:37'),
(21, 15, 17, 'perbaiki data', NULL, 'seperti pada file lampiran', 'uploads/tasks/task_1770012737_fe3aa016.pdf', 'kartu uas fa.pdf', '2025-10-03', '', '2026-02-02 06:12:17'),
(22, 15, 17, 'lanjutkan backend', NULL, 'lanjutkan', 'uploads/tasks/task_1770012901_a3db723b.docx', 'cover laprak sister 2[1].docx', '2026-11-03', 'Sudah Dikumpulkan', '2026-02-02 06:15:01'),
(23, 15, 15, 'keren untuk semua', NULL, 'mantap', 'uploads/tasks/task_1770014108_9dbed3d6.jpeg', 'WhatsApp Image 2025-12-12 at 13.01.34.jpeg', '2026-11-03', '', '2026-02-02 06:35:08'),
(24, 27, 17, 'perbaiki data', NULL, 'mantap', 'uploads/tasks/task_1770015570_87579e34.png', '1.png', '2026-03-01', 'Sudah Dikumpulkan', '2026-02-02 06:59:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_submissions`
--

CREATE TABLE `task_submissions` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `link_hasil` text DEFAULT NULL,
  `file_instruksi` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tanggal_submit` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `task_submissions`
--

INSERT INTO `task_submissions` (`id`, `task_id`, `user_id`, `link_hasil`, `file_instruksi`, `catatan`, `tanggal_submit`) VALUES
(2, 4, 15, 'File: Screenshot (8).png', NULL, '', '2026-01-22 22:18:21'),
(3, 4, 15, 'File: Screenshot (8).png', NULL, '', '2026-01-22 22:18:21'),
(4, 5, 15, 'File: Nilai_Intern_Telkom.pdf', 'task5_user15_20260129_060030_Nilai_Intern_Telkom.pdf', 'oke3', '2026-01-29 12:00:30'),
(5, 5, 15, 'File: Nilai_Intern_Telkom.pdf', 'task5_user15_20260129_060030_Nilai_Intern_Telkom.pdf', 'oke3', '2026-01-29 12:00:30'),
(6, 7, 15, 'File: Screenshot (8).png', NULL, 'adih adih', '2026-01-29 13:44:58'),
(7, 7, 15, 'File: Screenshot (8).png', NULL, 'adih adih', '2026-01-29 13:44:58'),
(8, 7, 15, 'File: 0.jpg', 'task7_user15_20260129_080400_0.jpg', '', '2026-01-29 14:04:00'),
(9, 7, 15, 'File: 0.jpg', 'task7_user15_20260129_080400_0.jpg', '', '2026-01-29 14:04:00'),
(10, 8, 15, 'File: 0.jpg', NULL, 'uewqhdiufqew', '2026-01-29 14:06:46'),
(11, 8, 15, 'File: 0.jpg', NULL, 'uewqhdiufqew', '2026-01-29 14:06:46'),
(12, 8, 15, 'File: 4.png', 'task8_user15_20260129_081554_4.png', 'yoyo', '2026-01-29 14:15:54'),
(13, 8, 15, 'File: 4.png', 'task8_user15_20260129_081554_4.png', 'yoyo', '2026-01-29 14:15:54'),
(14, 8, 15, 'File: 3.png', 'task8_user15_20260129_082336_3.png', 'oke', '2026-01-29 14:23:36'),
(15, 8, 15, 'File: 3.png', 'task8_user15_20260129_082336_3.png', 'oke', '2026-01-29 14:23:36'),
(16, 17, 21, 'File: Screenshot (8).png', NULL, '', '2026-01-30 09:32:54'),
(17, 17, 21, 'File: Screenshot (8).png', NULL, '', '2026-01-30 09:32:54'),
(18, 11, 21, 'File: 0.jpg', NULL, '', '2026-01-30 09:33:05'),
(19, 11, 21, 'File: 0.jpg', NULL, '', '2026-01-30 09:33:05'),
(20, 14, 15, 'File: Screenshot (8).png', NULL, 'ini', '2026-01-30 10:29:03'),
(21, 14, 15, 'File: Screenshot (8).png', NULL, 'ini', '2026-01-30 10:29:03'),
(22, 19, 24, 'File: 0.jpg', NULL, '', '2026-01-31 16:14:31'),
(23, 19, 24, 'File: 0.jpg', NULL, '', '2026-01-31 16:14:31'),
(24, 8, 15, 'File: 0.jpg', NULL, 'op', '2026-01-31 18:38:01'),
(25, 8, 15, 'File: 0.jpg', NULL, 'op', '2026-01-31 18:38:01'),
(26, 18, 15, 'File: 1.png', 'task18_user15_20260201_110505_1.png', 'sip', '2026-02-01 17:05:05'),
(27, 18, 15, 'File: 1.png', 'task18_user15_20260201_110505_1.png', 'sip', '2026-02-01 17:05:05'),
(28, 22, 15, 'https://docs.google.com/spreadsheets/d/1MKsUxvQkmmZ7TxyqC8xfIuEFVzUsGWodRf3hoC3qBrU/edit?gid=2146056675#gid=2146056675', NULL, 'mantap', '2026-02-02 13:32:42'),
(29, 20, 15, 'https://docs.google.com/spreadsheets/d/1MKsUxvQkmmZ7TxyqC8xfIuEFVzUsGWodRf3hoC3qBrU/edit?gid=2146056675#gid=2146056675', NULL, 'mantap', '2026-02-02 13:33:21'),
(30, 15, 15, 'https://docs.google.com/spreadsheets/d/1MKsUxvQkmmZ7TxyqC8xfIuEFVzUsGWodRf3hoC3qBrU/edit?gid=2146056675#gid=2146056675', NULL, 'oke', '2026-02-02 13:33:49'),
(31, 24, 27, 'https://docs.google.com/spreadsheets/d/1MKsUxvQkmmZ7TxyqC8xfIuEFVzUsGWodRf3hoC3qBrU/edit?gid=2146056675#gid=2146056675', NULL, 'udah siap bu', '2026-02-02 14:00:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `universitas` varchar(100) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `divisi` varchar(100) DEFAULT 'IT Development',
  `nama_mentor` varchar(100) DEFAULT 'Heru Wijaya',
  `lama_magang` int(11) DEFAULT 6,
  `tanggal_mulai` date DEFAULT '2026-01-01',
  `tanggal_akhir` date DEFAULT '2026-06-30',
  `telepon` varchar(20) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('Mentor','Internship') NOT NULL,
  `first_login` tinyint(1) NOT NULL DEFAULT 1,
  `mentor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `universitas`, `nim`, `divisi`, `nama_mentor`, `lama_magang`, `tanggal_mulai`, `tanggal_akhir`, `telepon`, `foto`, `created_at`, `role`, `first_login`, `mentor_id`) VALUES
(11, 'reza', 'reza9@gmail.com', '$2y$10$GZbwuG4xnpvdFBLepNymJe4B.jgUEet/Fobh..q.GzTeQj.Dxx5yO', 'UI', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-22 07:48:38', 'Internship', 1, NULL),
(12, 'ai', 'neza@gmail.com', '$2y$10$Vu3OGpVdMekHsG1W5bduBu5bCvz3CnqwpU70jd9m5GFPl4WuA.aWi', 'ui', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-22 07:53:34', 'Internship', 1, NULL),
(13, 'dwi', 'dwi@gmail.com', '$2y$10$GgGn.OMnian2MXZy7JxRL.uWsThCB4z/k8xjdp9Oy0Phqm7FXA4GG', 'ui', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-22 07:57:45', 'Internship', 1, NULL),
(14, 'reza', 'reza5@gmail.com', '$2y$10$1kZN8ve2Pfw0dkr/VEMbH.37uFy8pnTf4MDeziedlIRPc1.vnH5Sy', 'Universitas Andalas', '2311513024', 'Digital Produk', 'Nenden Fadhillah Putri', NULL, '2026-01-05', '2026-02-05', NULL, NULL, '2026-01-22 08:40:05', 'Internship', 1, NULL),
(15, 'Shaza Zulfiani', 'caja@gmail.com', '$2y$10$uSq7PKl8mulNqwL90onwBuGFZwuZQFM4M5A4MdCC2kGwntiggsY6y', 'universitas Andalas', '2311511018', 'Digital Produk', 'Nenden Fadhillah', 6, '2026-01-01', '2026-06-30', NULL, 'profil_15_20260202_052747.jpeg', '2026-01-22 13:51:51', 'Internship', 1, NULL),
(17, 'Nenden', 'nenden123@gmail.com', '$2y$10$Bu8cTi5ShbElfcIFoPNCJ.8ZFi2kal8u81mnl2jHxoyb2t.IJmTVe', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-26 06:38:41', 'Mentor', 1, NULL),
(18, 'Vito Tri Sandy', 'vito12@gmail.com', '$2y$10$XU0wj1ZSt/J2JNIMt7HdWOfbxLBxZ8175.FZcZdm0ot3mMbRGoUMu', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-28 02:57:14', '', 1, NULL),
(19, 'Nori Dwi Yulianti', 'ai@gmail.com', '$2y$10$4gWc3U5O82Wfq8SYg38F7.E6NhBAH.8qYFsjB0aVgepj3UqhzTFiO', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-28 04:10:26', 'Internship', 1, NULL),
(20, 'hana putri', 'hana@gmail.com', '$2y$10$QPgertfou53Ccq5JP.d7u.DPcJu/1d7DpKsM.Vud3m8Fa/p3ewBMu', 'universitas Andalas', '1111', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-28 04:45:20', 'Internship', 1, NULL),
(21, 'aditya marwan', 'adit@gmail.com', '$2y$10$jQ/bjt/MYQia3Om/hmXIZ.tLRTayEfggrJOQc9cNkhfKqBb6EuK9.', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, 'profil_21_20260128_060100.jpg', '2026-01-28 04:56:45', 'Internship', 1, NULL),
(22, 'abdi', 'asd@gmail.com', '$2y$10$vkboaIIpstHIq6wHd9sgMuYsuy2hg9Nw1nhOXfMo9qrG951Nw9zyu', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-30 07:43:27', 'Internship', 1, NULL),
(23, 'asa khasanah', 'asa@telkom.id', '$2y$10$DtGy/rt0lGCH85wbeqw/2eTsSYgSVVU29FBKAj3e80MMUsr2OcrLS', '', '', 'IT Development', 'Heru Wijaya', 6, '2026-01-01', '2026-06-30', NULL, NULL, '2026-01-30 08:24:11', 'Internship', 1, NULL),
(24, 'asal khasanah', 'asal@telkom.id', '$2y$10$hUNA2qERxpXVL2NaqgT3TOsPNdnEd2zlczZ1Jn8OlzRRaMaj7lXne', 'unand', '12345', 'Data Analyst', 'Heru Wijaya', 6, '2026-01-30', '2026-02-28', NULL, NULL, '2026-01-30 08:34:46', 'Internship', 1, NULL),
(25, 'zaza sasa', 'zaza@telkom.id', '$2y$10$VosXkgeVp/g.skwclOFfAe45tnv6GcCGxju7OfyIlxIe2TEPUQBR6', 'unand', '12345', 'Data Analyst', 'Nenden', 6, '2026-01-30', '2026-02-28', NULL, NULL, '2026-01-30 08:37:06', 'Internship', 1, NULL),
(26, 'saza', 'saza@gmail.com', '$2y$10$XoxNeKFSr4JzDIqAcIaf7uOxmuXbnYIsX0RBDOWv.dNjQ28jfgVf6', 'Universitas Andalas', '2311511018', 'Marketing', 'Nenden', 6, '2026-01-05', '2026-02-05', NULL, NULL, '2026-01-31 09:00:49', 'Internship', 1, NULL),
(27, 'NORI DWI YULIANTY', 'nori123@gmail.com', '$2y$10$519gIMHugxjslzauR3PN.ew14mFeFerxuHpr3C9WbxyEcD71W68RG', 'universitas Andalas', '2311512005', 'IT Development', 'Nenden', 6, '2026-02-01', '2026-03-02', NULL, NULL, '2026-02-02 06:53:32', 'Internship', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_absensi_user` (`user_id`,`tanggal`);

--
-- Indeks untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_logbook_user` (`user_id`,`tanggal`);

--
-- Indeks untuk tabel `mentor_intern`
--
ALTER TABLE `mentor_intern`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_mentor_intern` (`mentor_id`,`intern_id`),
  ADD KEY `fk_mi_intern` (`intern_id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mentor_user` (`mentor_id`,`user_id`);

--
-- Indeks untuk tabel `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_date` (`user_id`,`tanggal`);

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tasks_user` (`user_id`,`deadline`),
  ADD KEY `idx_tasks_mentor` (`mentor_id`);

--
-- Indeks untuk tabel `task_submissions`
--
ALTER TABLE `task_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ts_task` (`task_id`),
  ADD KEY `fk_ts_user` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `uniq_email` (`email`),
  ADD KEY `idx_user_email` (`email`),
  ADD KEY `mentor_id` (`mentor_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `logbook`
--
ALTER TABLE `logbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `mentor_intern`
--
ALTER TABLE `mentor_intern`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `performance`
--
ALTER TABLE `performance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `task_submissions`
--
ALTER TABLE `task_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keluhan`
--
ALTER TABLE `keluhan`
  ADD CONSTRAINT `keluhan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `logbook`
--
ALTER TABLE `logbook`
  ADD CONSTRAINT `logbook_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mentor_intern`
--
ALTER TABLE `mentor_intern`
  ADD CONSTRAINT `fk_mi_intern` FOREIGN KEY (`intern_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mi_mentor` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mentor_intern_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mentor_intern_ibfk_2` FOREIGN KEY (`intern_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_mentor` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tasks_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `task_submissions`
--
ALTER TABLE `task_submissions`
  ADD CONSTRAINT `fk_ts_task` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_submissions_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `task_submissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
