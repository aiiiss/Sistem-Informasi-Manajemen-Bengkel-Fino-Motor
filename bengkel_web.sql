-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Nov 2025 pada 09.48
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
-- Database: `bengkel_web`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(50) DEFAULT NULL COMMENT 'Kode unik barang (SKU)',
  `nama_barang` varchar(255) NOT NULL,
  `jumlah_stok` int(11) NOT NULL DEFAULT 0,
  `stok_minimum` int(11) NOT NULL DEFAULT 5 COMMENT 'Alert jika stok di bawah ini',
  `tipe_stok` enum('pcs','box','set','botol','liter','meter','kg','-') NOT NULL DEFAULT 'pcs',
  `harga_beli` decimal(15,2) NOT NULL DEFAULT 0.00,
  `harga_jual` decimal(15,2) NOT NULL DEFAULT 0.00,
  `gambar` varchar(255) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL COMMENT 'User yang menambahkan barang',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `jumlah_stok`, `stok_minimum`, `tipe_stok`, `harga_beli`, `harga_jual`, `gambar`, `kategori_id`, `users_id`, `is_active`, `created_at`, `updated_at`) VALUES
(0, 'BRG-ODQBX7', 'tes aki', 50, 5, 'pcs', 1000.00, 100.00, NULL, 3, 0, 1, '2025-11-17 22:03:40', '2025-11-18 05:04:01'),
(1, 'BRG-001', 'Ban Motor IRC 90/90-14', 10, 5, 'pcs', 200000.00, 250000.00, 'http://localhost:1023/images/ban_motor_irc_90_90_14.jpg', 1, 1, 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(2, 'BRG-002', 'Oli Mesin Pertamina Enduro 1L', 20, 10, 'botol', 40000.00, 60000.00, 'http://localhost:1023/images/oli_pertamina_enduro_1l.jpg', 2, 1, 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(3, 'BRG-003', 'Aki GS Astra GTZ5S', 5, 3, 'pcs', 120000.00, 170000.00, 'http://localhost:1023/images/aki_gs_astra_gtz5s.jpg', 3, 1, 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(4, 'BRG-004', 'Kampas Rem Bendix Set', 28, 10, 'set', 50000.00, 75000.00, 'http://localhost:1023/images/kampas_rem_bendix_set.jpg', 4, 1, 1, '2025-11-02 03:00:00', '2025-11-03 17:43:34'),
(5, 'BRG-005', 'Busi NGK Iridium', 40, 15, 'pcs', 15000.00, 22000.00, 'http://localhost:1023/images/busi_ngk_iridium.jpg', 5, 1, 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(381, 'BRG-006', 'Ban Depan IRC 70/90-14 Tubeless', 15, 5, 'pcs', 180000.00, 240000.00, 'http://localhost:1023/images/ban_irc_70_90_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(382, 'BRG-007', 'Ban Depan FDR 80/80-14 Tubeless', 18, 5, 'pcs', 165000.00, 220000.00, 'http://localhost:1023/images/ban_fdr_80_80_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(383, 'BRG-008', 'Ban Depan Michelin 70/90-14', 12, 5, 'pcs', 220000.00, 290000.00, 'http://localhost:1023/images/ban_michelin_70_90_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(384, 'BRG-009', 'Ban Depan Dunlop 80/90-14 TT900', 10, 4, 'pcs', 175000.00, 235000.00, 'http://localhost:1023/images/ban_dunlop_80_90_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(385, 'BRG-010', 'Ban Belakang IRC 90/90-14 Tubeless', 14, 5, 'pcs', 200000.00, 265000.00, 'http://localhost:1023/images/ban_irc_90_90_14_blk.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(386, 'BRG-011', 'Ban Belakang FDR 90/80-14 Sport XR', 16, 5, 'pcs', 195000.00, 260000.00, 'http://localhost:1023/images/ban_fdr_90_80_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(387, 'BRG-012', 'Ban Belakang Michelin 90/90-14 City Grip', 10, 4, 'pcs', 245000.00, 325000.00, 'http://localhost:1023/images/ban_michelin_90_90_14.jpg', 1, 1, 1, '2025-11-02 16:14:54', '2025-11-02 16:14:54'),
(388, 'BRG-013', 'Ban Depan IRC 60/80-17 Tubeless', 20, 8, 'pcs', 140000.00, 190000.00, 'http://localhost:1023/images/ban_irc_60_80_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(389, 'BRG-014', 'Ban Depan FDR 70/90-17 Sport MP27', 18, 8, 'pcs', 155000.00, 210000.00, 'http://localhost:1023/images/ban_fdr_70_90_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(390, 'BRG-015', 'Ban Depan Dunlop 70/90-17 D102', 15, 7, 'pcs', 160000.00, 215000.00, 'http://localhost:1023/images/ban_dunlop_70_90_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(391, 'BRG-016', 'Ban Belakang IRC 80/90-17 NF53', 16, 8, 'pcs', 175000.00, 235000.00, 'http://localhost:1023/images/ban_irc_80_90_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(392, 'BRG-017', 'Ban Belakang FDR 80/90-17 Blaze', 15, 7, 'pcs', 170000.00, 230000.00, 'http://localhost:1023/images/ban_fdr_80_90_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(393, 'BRG-018', 'Ban Belakang Dunlop 80/90-17 D180', 14, 7, 'pcs', 180000.00, 240000.00, 'http://localhost:1023/images/ban_dunlop_80_90_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(394, 'BRG-019', 'Ban Depan Michelin 100/80-17 Pilot Street', 8, 3, 'pcs', 320000.00, 425000.00, 'http://localhost:1023/images/ban_michelin_100_80_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(395, 'BRG-020', 'Ban Depan IRC 110/70-17 RX01', 7, 3, 'pcs', 295000.00, 390000.00, 'http://localhost:1023/images/ban_irc_110_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(396, 'BRG-021', 'Ban Belakang IRC 130/70-17 RX01', 7, 3, 'pcs', 335000.00, 445000.00, 'http://localhost:1023/images/ban_irc_130_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(397, 'BRG-022', 'Ban Belakang Dunlop 140/70-17 TT93GP', 6, 3, 'pcs', 380000.00, 500000.00, 'http://localhost:1023/images/ban_dunlop_140_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(398, 'BRG-023', 'Ban Belakang FDR 110/70-17 Sport XR Evo', 10, 4, 'pcs', 265000.00, 350000.00, 'http://localhost:1023/images/ban_fdr_110_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(399, 'BRG-024', 'Ban Belakang Michelin 130/70-17 Pilot Street', 5, 2, 'pcs', 395000.00, 520000.00, 'http://localhost:1023/images/ban_michelin_130_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(400, 'BRG-025', 'Ban Depan 90/80-14 FDR Flemmo', 12, 5, 'pcs', 185000.00, 245000.00, 'http://localhost:1023/images/ban_fdr_90_80_14_dpn.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(401, 'BRG-026', 'Ban Belakang 100/80-14 IRC Tubeless', 8, 4, 'pcs', 215000.00, 285000.00, 'http://localhost:1023/images/ban_irc_100_80_14.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(402, 'BRG-027', 'Ban Belakang 120/70-14 Michelin City Grip Pro', 6, 3, 'pcs', 295000.00, 390000.00, 'http://localhost:1023/images/ban_michelin_120_70_14.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(403, 'BRG-028', 'Ban Depan 80/90-17 IRC NF67', 18, 8, 'pcs', 165000.00, 220000.00, 'http://localhost:1023/images/ban_irc_80_90_17_dpn.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(404, 'BRG-029', 'Ban Belakang 90/80-17 FDR Genzi Pro', 16, 7, 'pcs', 185000.00, 245000.00, 'http://localhost:1023/images/ban_fdr_90_80_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(405, 'BRG-030', 'Ban Belakang 100/80-17 Dunlop Arrowmax', 12, 5, 'pcs', 220000.00, 290000.00, 'http://localhost:1023/images/ban_dunlop_100_80_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(406, 'BRG-031', 'Ban Belakang 110/80-17 IRC Road Winner', 9, 4, 'pcs', 245000.00, 325000.00, 'http://localhost:1023/images/ban_irc_110_80_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(407, 'BRG-032', 'Ban Belakang 120/70-17 FDR Sport XR Evo', 7, 3, 'pcs', 285000.00, 380000.00, 'http://localhost:1023/images/ban_fdr_120_70_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(408, 'BRG-033', 'Ban Belakang 150/60-17 Michelin Pilot Street Radial', 4, 2, 'pcs', 485000.00, 640000.00, 'http://localhost:1023/images/ban_michelin_150_60_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(409, 'BRG-034', 'Ban Belakang 140/60-17 IRC RX02', 5, 2, 'pcs', 395000.00, 520000.00, 'http://localhost:1023/images/ban_irc_140_60_17.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(410, 'BRG-035', 'Ban Racing Dunlop 120/70-17 Alpha 14', 3, 1, 'pcs', 525000.00, 690000.00, 'http://localhost:1023/images/ban_dunlop_racing.jpg', 1, 1, 1, '2025-11-02 16:16:33', '2025-11-02 16:16:33'),
(411, 'BRG-036', 'Pertamina Enduro Matic 800ml', 50, 20, 'botol', 35000.00, 50000.00, 'http://localhost:1023/images/oli_enduro_matic_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(412, 'BRG-037', 'Shell Advance AX7 Matic 800ml', 45, 20, 'botol', 42000.00, 60000.00, 'http://localhost:1023/images/oli_shell_ax7_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(413, 'BRG-038', 'Federal Matic 800ml', 55, 25, 'botol', 33000.00, 47000.00, 'http://localhost:1023/images/oli_federal_matic_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(414, 'BRG-039', 'Top 1 Action Matic 800ml', 48, 20, 'botol', 38000.00, 54000.00, 'http://localhost:1023/images/oli_top1_matic_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(415, 'BRG-040', 'Castrol Activ Matic 800ml', 40, 18, 'botol', 46000.00, 65000.00, 'http://localhost:1023/images/oli_castrol_matic_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(416, 'BRG-041', 'Pertamina Enduro Matic 1L', 35, 15, 'botol', 45000.00, 65000.00, 'http://localhost:1023/images/oli_enduro_matic_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(417, 'BRG-042', 'Shell Advance Ultra Matic 1L', 30, 15, 'botol', 68000.00, 95000.00, 'http://localhost:1023/images/oli_shell_ultra_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(418, 'BRG-043', 'Federal Matic Premium 1L', 38, 18, 'botol', 48000.00, 68000.00, 'http://localhost:1023/images/oli_federal_premium_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(419, 'BRG-044', 'Top 1 Super Action Matic 1L', 32, 15, 'botol', 52000.00, 73000.00, 'http://localhost:1023/images/oli_top1_super_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(420, 'BRG-045', 'Pertamina Enduro Racing 800ml 10W-40', 42, 18, 'botol', 36000.00, 52000.00, 'http://localhost:1023/images/oli_enduro_racing_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(421, 'BRG-046', 'Shell Advance AX7 10W-40 800ml', 38, 18, 'botol', 43000.00, 62000.00, 'http://localhost:1023/images/oli_shell_ax7_10w40_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(422, 'BRG-047', 'Federal Supreme XX 800ml 10W-30', 45, 20, 'botol', 35000.00, 50000.00, 'http://localhost:1023/images/oli_federal_xx_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(423, 'BRG-048', 'Top 1 Super Bike 800ml 10W-40', 40, 18, 'botol', 39000.00, 56000.00, 'http://localhost:1023/images/oli_top1_superbike_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(424, 'BRG-049', 'Castrol Power 1 4T 800ml 10W-40', 35, 15, 'botol', 58000.00, 82000.00, 'http://localhost:1023/images/oli_castrol_power1_800.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(425, 'BRG-050', 'Pertamina Enduro Racing 1L 10W-40', 30, 12, 'botol', 48000.00, 68000.00, 'http://localhost:1023/images/oli_enduro_racing_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(426, 'BRG-051', 'Shell Advance Ultra 1L 10W-40', 25, 12, 'botol', 72000.00, 100000.00, 'http://localhost:1023/images/oli_shell_ultra_10w40_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(427, 'BRG-052', 'Federal Ultratec 1L 10W-40', 32, 15, 'botol', 52000.00, 73000.00, 'http://localhost:1023/images/oli_federal_ultratec_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(428, 'BRG-053', 'Top 1 Racing 1L 10W-40', 28, 12, 'botol', 56000.00, 79000.00, 'http://localhost:1023/images/oli_top1_racing_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(429, 'BRG-054', 'Castrol Power 1 4T 1L 10W-40', 22, 10, 'botol', 85000.00, 118000.00, 'http://localhost:1023/images/oli_castrol_power1_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(430, 'BRG-055', 'Shell Advance Ultra 4 Fully Synthetic 1L', 15, 8, 'botol', 110000.00, 150000.00, 'http://localhost:1023/images/oli_shell_ultra4_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(431, 'BRG-056', 'Castrol Power 1 Racing 4T Fully Synthetic 1L', 12, 6, 'botol', 125000.00, 170000.00, 'http://localhost:1023/images/oli_castrol_racing_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(432, 'BRG-057', 'Federal Nitro Fully Synthetic 1L', 18, 8, 'botol', 95000.00, 135000.00, 'http://localhost:1023/images/oli_federal_nitro_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(433, 'BRG-058', 'Top 1 Platinum Fully Synthetic 1L', 14, 7, 'botol', 105000.00, 145000.00, 'http://localhost:1023/images/oli_top1_platinum_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(434, 'BRG-059', 'Pertamina Prima XP Fully Synthetic 1L', 16, 8, 'botol', 98000.00, 138000.00, 'http://localhost:1023/images/oli_prima_xp_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(435, 'BRG-060', 'Shell Advance AX5 Semi Synthetic 1L', 25, 12, 'botol', 55000.00, 78000.00, 'http://localhost:1023/images/oli_shell_ax5_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(436, 'BRG-061', 'Castrol Activ Semi Synthetic 1L', 22, 10, 'botol', 62000.00, 87000.00, 'http://localhost:1023/images/oli_castrol_activ_semi_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(437, 'BRG-062', 'Federal Sport Semi Synthetic 1L', 28, 12, 'botol', 48000.00, 68000.00, 'http://localhost:1023/images/oli_federal_sport_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(438, 'BRG-063', 'Top 1 Synthetic 1L', 24, 10, 'botol', 52000.00, 73000.00, 'http://localhost:1023/images/oli_top1_synthetic_1l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(439, 'BRG-064', 'Pertamina Enduro 4T 2L 20W-50', 15, 8, 'botol', 78000.00, 110000.00, 'http://localhost:1023/images/oli_enduro_2l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(440, 'BRG-065', 'Federal Matic 2L', 18, 8, 'botol', 72000.00, 102000.00, 'http://localhost:1023/images/oli_federal_matic_2l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(441, 'BRG-066', 'Pertamina Enduro 4T 4L 20W-50', 8, 4, 'botol', 145000.00, 200000.00, 'http://localhost:1023/images/oli_enduro_4l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(442, 'BRG-067', 'Shell Advance AX7 4L', 6, 3, 'botol', 185000.00, 255000.00, 'http://localhost:1023/images/oli_shell_ax7_4l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(443, 'BRG-068', 'Federal Supreme 4L', 10, 5, 'botol', 155000.00, 215000.00, 'http://localhost:1023/images/oli_federal_4l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(444, 'BRG-069', 'Top 1 Action Matic 4L', 7, 4, 'botol', 165000.00, 228000.00, 'http://localhost:1023/images/oli_top1_4l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(445, 'BRG-070', 'Castrol Activ 4L', 5, 3, 'botol', 195000.00, 270000.00, 'http://localhost:1023/images/oli_castrol_4l.jpg', 2, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(446, 'BRG-071', 'Pertamina SAE 90 Oli Gardan 1L', 28, 15, 'botol', 32000.00, 46000.00, 'http://localhost:1023/images/oli_gardan_pertamina_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-10 14:16:59'),
(447, 'BRG-072', 'Shell Spirax S2 A 90 Oli Gardan 1L', 23, 12, 'botol', 48000.00, 68000.00, 'http://localhost:1023/images/oli_gardan_shell_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-10 13:50:18'),
(448, 'BRG-073', 'Federal Gear Oil SAE 90 1L', 35, 15, 'botol', 35000.00, 50000.00, 'http://localhost:1023/images/oli_gardan_federal_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(449, 'BRG-074', 'Top 1 Gear Oil SAE 90 1L', 28, 12, 'botol', 38000.00, 54000.00, 'http://localhost:1023/images/oli_gardan_top1_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(450, 'BRG-075', 'Castrol Gear Oil SAE 90 1L', 22, 10, 'botol', 52000.00, 73000.00, 'http://localhost:1023/images/oli_gardan_castrol_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(451, 'BRG-076', 'Pertamina SAE 140 Oli Gardan 1L', 20, 10, 'botol', 35000.00, 50000.00, 'http://localhost:1023/images/oli_gardan_pertamina_140_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(452, 'BRG-077', 'Federal Gear Oil SAE 140 1L', 23, 12, 'botol', 38000.00, 54000.00, 'http://localhost:1023/images/oli_gardan_federal_140_1l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-12 11:10:27'),
(453, 'BRG-078', 'Pertamina SAE 90 Oli Gardan 4L', 6, 4, 'botol', 118000.00, 165000.00, 'http://localhost:1023/images/oli_gardan_pertamina_4l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-10 19:06:06'),
(454, 'BRG-079', 'Shell Spirax Oli Gardan 4L', 6, 3, 'botol', 175000.00, 240000.00, 'http://localhost:1023/images/oli_gardan_shell_4l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-02 16:17:22'),
(455, 'BRG-080', 'Federal Gear Oil 4L Ekonomis', 8, 5, 'botol', 128000.00, 178000.00, 'http://localhost:1023/images/oli_gardan_federal_4l.jpg', 9, 1, 1, '2025-11-02 16:17:22', '2025-11-10 14:50:32'),
(456, 'BRG-081', 'Aki GS Astra GTZ5S 12V 3.5Ah MF', 6, 5, 'pcs', 140000.00, 190000.00, 'http://localhost:1023/images/aki_gs_gtz5s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-13 02:55:49'),
(457, 'BRG-082', 'Aki GS Astra GTZ6V 12V 5Ah MF', 10, 4, 'pcs', 165000.00, 220000.00, 'http://localhost:1023/images/aki_gs_gtz6v.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(458, 'BRG-083', 'Aki GS Astra GTZ7V 12V 6Ah MF', 8, 3, 'pcs', 185000.00, 245000.00, 'http://localhost:1023/images/aki_gs_gtz7v.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(459, 'BRG-084', 'Aki GS Astra GTZ10V 12V 8.6Ah MF', 10, 3, 'pcs', 245000.00, 325000.00, 'http://localhost:1023/images/aki_gs_gtz10v.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-18 12:23:13'),
(460, 'BRG-085', 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 56, 4, 'pcs', 135000.00, 185000.00, 'http://localhost:1023/images/aki_bosch_rbtz5s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-18 12:22:37'),
(461, 'BRG-086', 'Aki Bosch RBTZ-6S 12V 5Ah MF', 4, 3, 'pcs', 158000.00, 215000.00, 'http://localhost:1023/images/aki_bosch_rbtz6s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-12 18:10:14'),
(462, 'BRG-087', 'Aki Bosch RBTZ-7S 12V 6Ah MF', 3, 3, 'pcs', 178000.00, 238000.00, 'http://localhost:1023/images/aki_bosch_rbtz7s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-12 18:22:07'),
(463, 'BRG-088', 'Aki Yuasa YTZ5S 12V 3.5Ah MF', 9, 4, 'pcs', 145000.00, 195000.00, 'http://localhost:1023/images/aki_yuasa_ytz5s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(464, 'BRG-089', 'Aki Yuasa YTZ7V 12V 6Ah MF', 7, 3, 'pcs', 188000.00, 250000.00, 'http://localhost:1023/images/aki_yuasa_ytz7v.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(465, 'BRG-090', 'Aki Motobatt MTZ5S 12V 4Ah MF', 8, 3, 'pcs', 165000.00, 220000.00, 'http://localhost:1023/images/aki_motobatt_mtz5s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(466, 'BRG-091', 'Aki Motobatt MTZ7S 12V 6Ah MF', 6, 3, 'pcs', 195000.00, 260000.00, 'http://localhost:1023/images/aki_motobatt_mtz7s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-02 16:17:52'),
(467, 'BRG-092', 'Aki Aspira GTZ5S Maintenance Free', 0, 4, 'pcs', 125000.00, 175000.00, 'http://localhost:1023/images/aki_aspira_gtz5s.jpg', 3, 1, 0, '2025-11-02 16:17:52', '2025-11-17 00:37:22'),
(468, 'BRG-093', 'Aki Aspira GTZ6V Maintenance Free', 0, 3, 'pcs', 148000.00, 205000.00, 'http://localhost:1023/images/aki_aspira_gtz6v.jpg', 3, 1, 0, '2025-11-02 16:17:52', '2025-11-17 00:41:06'),
(469, 'BRG-094', 'Aki Incoe GTZ5S Kering MF', 8, 5, 'pcs', 118000.00, 168000.00, 'http://localhost:1023/images/aki_incoe_gtz5s.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-12 15:19:37'),
(470, 'BRG-095', 'Aki GS Astra GM5Z-3B Basah Konvensional', 4, 3, 'pcs', 95000.00, 140000.00, 'http://localhost:1023/images/aki_gs_gm5z3b.jpg', 3, 1, 1, '2025-11-02 16:17:52', '2025-11-13 01:20:38'),
(471, 'BRG-096', 'Kampas Rem Depan Honda Beat FI Original', 30, 12, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/kampas_beat_depan.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(472, 'BRG-097', 'Kampas Rem Belakang Honda Beat FI Original', 28, 12, 'set', 35000.00, 52000.00, 'http://localhost:1023/images/kampas_beat_belakang.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(473, 'BRG-098', 'Kampas Rem Depan Honda Vario 125/150 Original', 25, 10, 'set', 48000.00, 70000.00, 'http://localhost:1023/images/kampas_vario_depan.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(474, 'BRG-099', 'Kampas Rem Belakang Honda Vario Original', 24, 10, 'set', 38000.00, 56000.00, 'http://localhost:1023/images/kampas_vario_belakang.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(475, 'BRG-100', 'Kampas Rem Honda Scoopy Original', 20, 10, 'set', 45000.00, 66000.00, 'http://localhost:1023/images/kampas_scoopy.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(476, 'BRG-101', 'Kampas Rem Honda PCX 150 Original', 15, 8, 'set', 65000.00, 92000.00, 'http://localhost:1023/images/kampas_pcx.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(477, 'BRG-102', 'Kampas Rem Honda CB150R Original', 12, 6, 'set', 72000.00, 102000.00, 'http://localhost:1023/images/kampas_cb150r.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(478, 'BRG-103', 'Kampas Rem Honda CBR150R Original', 10, 5, 'set', 78000.00, 110000.00, 'http://localhost:1023/images/kampas_cbr150r.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(479, 'BRG-104', 'Kampas Rem Depan Yamaha Mio Original', 28, 12, 'set', 40000.00, 60000.00, 'http://localhost:1023/images/kampas_mio_depan.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(480, 'BRG-105', 'Kampas Rem Belakang Yamaha Mio Original', 26, 12, 'set', 33000.00, 50000.00, 'http://localhost:1023/images/kampas_mio_belakang.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(481, 'BRG-106', 'Kampas Rem Yamaha Aerox 155 Original', 18, 8, 'set', 55000.00, 80000.00, 'http://localhost:1023/images/kampas_aerox.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(482, 'BRG-107', 'Kampas Rem Yamaha Nmax Original', 20, 10, 'set', 62000.00, 88000.00, 'http://localhost:1023/images/kampas_nmax.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(483, 'BRG-108', 'Kampas Rem Yamaha R15 Original', 12, 6, 'set', 75000.00, 105000.00, 'http://localhost:1023/images/kampas_r15.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(484, 'BRG-109', 'Kampas Rem Yamaha Vixion Original', 15, 8, 'set', 68000.00, 96000.00, 'http://localhost:1023/images/kampas_vixion.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(485, 'BRG-110', 'Kampas Rem TDR Racing Matic Universal', 35, 15, 'set', 55000.00, 80000.00, 'http://localhost:1023/images/kampas_tdr_matic.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(486, 'BRG-111', 'Kampas Rem TDR Racing Sport Universal', 30, 12, 'set', 68000.00, 98000.00, 'http://localhost:1023/images/kampas_tdr_sport.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(487, 'BRG-112', 'Kampas Rem Bendix Beat/Vario', 40, 15, 'set', 38000.00, 56000.00, 'http://localhost:1023/images/kampas_bendix_beat.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(488, 'BRG-113', 'Kampas Rem Bendix Mio/Soul', 38, 15, 'set', 36000.00, 54000.00, 'http://localhost:1023/images/kampas_bendix_mio.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(489, 'BRG-114', 'Kampas Rem Daytona Matic Universal', 32, 12, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/kampas_daytona_matic.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(490, 'BRG-115', 'Kampas Rem Daytona Sport Universal', 28, 12, 'set', 58000.00, 84000.00, 'http://localhost:1023/images/kampas_daytona_sport.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(491, 'BRG-116', 'Kampas Rem Racing Boy Matic', 25, 10, 'set', 72000.00, 102000.00, 'http://localhost:1023/images/kampas_rcb_matic.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(492, 'BRG-117', 'Kampas Rem Racing Boy Sport', 20, 10, 'set', 88000.00, 125000.00, 'http://localhost:1023/images/kampas_rcb_sport.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(493, 'BRG-118', 'Kampas Rem Uma Racing Matic', 22, 10, 'set', 65000.00, 92000.00, 'http://localhost:1023/images/kampas_uma_matic.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(494, 'BRG-119', 'Kampas Rem Uma Racing Sport', 18, 8, 'set', 78000.00, 110000.00, 'http://localhost:1023/images/kampas_uma_sport.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(495, 'BRG-120', 'Kampas Rem Nissin Universal Premium', 15, 8, 'set', 95000.00, 135000.00, 'http://localhost:1023/images/kampas_nissin.jpg', 4, 1, 1, '2025-11-02 16:18:27', '2025-11-02 16:18:27'),
(496, 'BRG-121', 'Busi NGK C7HSA Standard', 60, 25, 'pcs', 11000.00, 17000.00, 'http://localhost:1023/images/busi_ngk_c7hsa.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(497, 'BRG-122', 'Busi NGK CR7HSA Resistor', 55, 25, 'pcs', 12500.00, 18500.00, 'http://localhost:1023/images/busi_ngk_cr7hsa.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(498, 'BRG-123', 'Busi NGK CR8HSA Resistor', 50, 20, 'pcs', 13000.00, 19000.00, 'http://localhost:1023/images/busi_ngk_cr8hsa.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(499, 'BRG-124', 'Busi NGK CR9EK Resistor', 45, 20, 'pcs', 14000.00, 20500.00, 'http://localhost:1023/images/busi_ngk_cr9ek.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(500, 'BRG-125', 'Busi NGK CPR8EA-9 Resistor', 48, 20, 'pcs', 13500.00, 19500.00, 'http://localhost:1023/images/busi_ngk_cpr8ea9.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(501, 'BRG-126', 'Busi NGK CPR9EA-9 Resistor', 42, 18, 'pcs', 14500.00, 21000.00, 'http://localhost:1023/images/busi_ngk_cpr9ea9.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(502, 'BRG-127', 'Busi NGK CR7HIX Iridium IX', 35, 15, 'pcs', 32000.00, 47000.00, 'http://localhost:1023/images/busi_ngk_cr7hix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(503, 'BRG-128', 'Busi NGK CR8EIX Iridium IX', 32, 15, 'pcs', 34000.00, 49000.00, 'http://localhost:1023/images/busi_ngk_cr8eix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(504, 'BRG-129', 'Busi NGK CR9EIX Iridium IX', 30, 12, 'pcs', 36000.00, 52000.00, 'http://localhost:1023/images/busi_ngk_cr9eix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(505, 'BRG-130', 'Busi NGK CPR8EAIX-9 Iridium IX', 28, 12, 'pcs', 38000.00, 55000.00, 'http://localhost:1023/images/busi_ngk_cpr8eaix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(506, 'BRG-131', 'Busi NGK CPR9EAIX-9 Iridium IX', 25, 10, 'pcs', 40000.00, 58000.00, 'http://localhost:1023/images/busi_ngk_cpr9eaix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(507, 'BRG-132', 'Busi Denso U20EPR9 Standard', 50, 20, 'pcs', 11500.00, 17500.00, 'http://localhost:1023/images/busi_denso_u20epr9.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(508, 'BRG-133', 'Busi Denso U22EPR9 Standard', 48, 20, 'pcs', 12000.00, 18000.00, 'http://localhost:1023/images/busi_denso_u22epr9.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(509, 'BRG-134', 'Busi Denso U24EPR9 Standard', 45, 18, 'pcs', 12500.00, 18500.00, 'http://localhost:1023/images/busi_denso_u24epr9.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(510, 'BRG-135', 'Busi Denso U24ESR-N Standard', 42, 18, 'pcs', 13000.00, 19000.00, 'http://localhost:1023/images/busi_denso_u24esrn.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(511, 'BRG-136', 'Busi Denso U27ESR-N Standard', 40, 18, 'pcs', 13500.00, 19500.00, 'http://localhost:1023/images/busi_denso_u27esrn.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(512, 'BRG-137', 'Busi Denso IU22 Iridium Power', 28, 12, 'pcs', 35000.00, 50000.00, 'http://localhost:1023/images/busi_denso_iu22.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-12 13:26:37'),
(513, 'BRG-138', 'Busi Denso IU24 Iridium Power', 28, 12, 'pcs', 37000.00, 53000.00, 'http://localhost:1023/images/busi_denso_iu24.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(514, 'BRG-139', 'Busi Denso IU27 Iridium Power', 25, 10, 'pcs', 39000.00, 56000.00, 'http://localhost:1023/images/busi_denso_iu27.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(515, 'BRG-140', 'Busi Denso IUH22 Iridium TT', 22, 10, 'pcs', 42000.00, 60000.00, 'http://localhost:1023/images/busi_denso_iuh22.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(516, 'BRG-141', 'Busi Brisk AR12YS Premium', 40, 15, 'pcs', 16000.00, 24000.00, 'http://localhost:1023/images/busi_brisk_ar12ys.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(517, 'BRG-142', 'Busi Brisk AR15YC Premium', 38, 15, 'pcs', 17000.00, 25000.00, 'http://localhost:1023/images/busi_brisk_ar15yc.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(518, 'BRG-143', 'Busi Brisk LR15YC Premium', 35, 15, 'pcs', 18000.00, 26500.00, 'http://localhost:1023/images/busi_brisk_lr15yc.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(519, 'BRG-144', 'Busi Brisk DR15YC Super', 32, 12, 'pcs', 22000.00, 32000.00, 'http://localhost:1023/images/busi_brisk_dr15yc.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(520, 'BRG-145', 'Busi Racing NGK Platinum CR9E', 20, 8, 'pcs', 65000.00, 92000.00, 'http://localhost:1023/images/busi_ngk_platinum.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(521, 'BRG-146', 'Busi Racing Denso Platinum U27ESR', 18, 8, 'pcs', 62000.00, 88000.00, 'http://localhost:1023/images/busi_denso_platinum.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(522, 'BRG-147', 'Busi Racing Iridium Power IX', 15, 6, 'pcs', 85000.00, 120000.00, 'http://localhost:1023/images/busi_iridium_power.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(523, 'BRG-148', 'Busi Racing NGK Iridium CR10EIX', 12, 5, 'pcs', 95000.00, 135000.00, 'http://localhost:1023/images/busi_ngk_cr10eix.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(524, 'BRG-149', 'Busi Racing Double Iridium', 10, 5, 'pcs', 125000.00, 175000.00, 'http://localhost:1023/images/busi_double_iridium.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(525, 'BRG-150', 'Busi Racing Bosch Iridium FR7DI', 14, 6, 'pcs', 78000.00, 110000.00, 'http://localhost:1023/images/busi_bosch_iridium.jpg', 5, 1, 1, '2025-11-02 16:19:05', '2025-11-02 16:19:05'),
(526, 'BRG-151', 'Rantai KTC 415 Gold Series', 25, 10, 'set', 165000.00, 225000.00, 'http://localhost:1023/images/rantai_ktc_415.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(527, 'BRG-152', 'Rantai KTC 420 Standard', 28, 12, 'set', 145000.00, 200000.00, 'http://localhost:1023/images/rantai_ktc_420.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(528, 'BRG-153', 'Rantai KTC 428 Gold Series', 22, 10, 'set', 175000.00, 240000.00, 'http://localhost:1023/images/rantai_ktc_428.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(529, 'BRG-154', 'Rantai RCB 415 Gold', 20, 8, 'set', 185000.00, 250000.00, 'http://localhost:1023/images/rantai_rcb_415.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(530, 'BRG-155', 'Rantai RCB 420 Standard', 24, 10, 'set', 165000.00, 225000.00, 'http://localhost:1023/images/rantai_rcb_420.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(531, 'BRG-156', 'Rantai RCB 428 Gold Series', 18, 8, 'set', 195000.00, 265000.00, 'http://localhost:1023/images/rantai_rcb_428.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(532, 'BRG-157', 'Rantai SSS 415 Standard', 30, 12, 'set', 125000.00, 175000.00, 'http://localhost:1023/images/rantai_sss_415.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(533, 'BRG-158', 'Rantai SSS 420 Standard', 28, 12, 'set', 135000.00, 185000.00, 'http://localhost:1023/images/rantai_sss_420.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(534, 'BRG-159', 'Rantai Federal 415 Gold', 26, 10, 'set', 155000.00, 215000.00, 'http://localhost:1023/images/rantai_federal_415.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(535, 'BRG-160', 'Rantai Federal 428 Premium', 20, 8, 'set', 185000.00, 252000.00, 'http://localhost:1023/images/rantai_federal_428.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(536, 'BRG-161', 'Gear Set KTC 415 Supra/Karisma', 18, 8, 'set', 185000.00, 255000.00, 'http://localhost:1023/images/gear_ktc_415_supra.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(537, 'BRG-162', 'Gear Set KTC 428 CB150/Vixion', 13, 7, 'set', 245000.00, 335000.00, 'http://localhost:1023/images/gear_ktc_428_cb.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-10 13:42:02'),
(538, 'BRG-163', 'Gear Set RCB 415 Supra/Revo', 20, 8, 'set', 195000.00, 268000.00, 'http://localhost:1023/images/gear_rcb_415_supra.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(539, 'BRG-164', 'Gear Set RCB 428 Tiger/Scorpio', 12, 6, 'set', 265000.00, 365000.00, 'http://localhost:1023/images/gear_rcb_428_tiger.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(540, 'BRG-165', 'Gear Set TDR 415 Racing', 16, 7, 'set', 225000.00, 310000.00, 'http://localhost:1023/images/gear_tdr_415.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(541, 'BRG-166', 'Gear Set Honda Genuine Supra X 125', 14, 6, 'set', 285000.00, 390000.00, 'http://localhost:1023/images/gear_honda_supra.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(542, 'BRG-167', 'Gear Set Yamaha Genuine Jupiter Z', 12, 6, 'set', 275000.00, 378000.00, 'http://localhost:1023/images/gear_yamaha_jupiter.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(543, 'BRG-168', 'Vbelt Honda Beat FI Original', 35, 15, 'pcs', 95000.00, 135000.00, 'http://localhost:1023/images/vbelt_beat_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(544, 'BRG-169', 'Vbelt Honda Vario 110 Original', 32, 15, 'pcs', 105000.00, 148000.00, 'http://localhost:1023/images/vbelt_vario110_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(545, 'BRG-170', 'Vbelt Honda Vario 125/150 Original', 30, 12, 'pcs', 115000.00, 162000.00, 'http://localhost:1023/images/vbelt_vario125_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(546, 'BRG-171', 'Vbelt Honda Scoopy Original', 28, 12, 'pcs', 110000.00, 155000.00, 'http://localhost:1023/images/vbelt_scoopy_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(547, 'BRG-172', 'Vbelt Honda PCX 150 Original', 20, 10, 'pcs', 145000.00, 200000.00, 'http://localhost:1023/images/vbelt_pcx_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(548, 'BRG-173', 'Vbelt Yamaha Mio Original', 40, 18, 'pcs', 92000.00, 130000.00, 'http://localhost:1023/images/vbelt_mio_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(549, 'BRG-174', 'Vbelt Yamaha Nmax Original', 25, 12, 'pcs', 135000.00, 188000.00, 'http://localhost:1023/images/vbelt_nmax_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(550, 'BRG-175', 'Vbelt Yamaha Aerox 155 Original', 22, 10, 'pcs', 128000.00, 178000.00, 'http://localhost:1023/images/vbelt_aerox_ori.jpg', 6, 1, 1, '2025-11-02 16:20:05', '2025-11-02 16:20:05'),
(551, 'BRG-176', 'Lampu LED H4 Hi/Lo 6000K 20W', 30, 12, 'pcs', 65000.00, 95000.00, 'http://localhost:1023/images/lampu_led_h4_20w.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(552, 'BRG-177', 'Lampu LED H4 Hi/Lo 8000K 30W Super Bright', 25, 10, 'pcs', 95000.00, 135000.00, 'http://localhost:1023/images/lampu_led_h4_30w.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(553, 'BRG-178', 'Lampu LED H4 Hi/Lo Cree 40W Racing', 18, 8, 'pcs', 145000.00, 200000.00, 'http://localhost:1023/images/lampu_led_h4_cree.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(554, 'BRG-179', 'Lampu LED H6 Bebek 6000K 20W', 28, 12, 'pcs', 68000.00, 98000.00, 'http://localhost:1023/images/lampu_led_h6_20w.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(555, 'BRG-180', 'Lampu LED HS1 6000K 18W', 26, 10, 'pcs', 72000.00, 102000.00, 'http://localhost:1023/images/lampu_led_hs1.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(556, 'BRG-181', 'Lampu Halogen H4 12V 35/35W Stanley', 35, 15, 'pcs', 22000.00, 35000.00, 'http://localhost:1023/images/lampu_halogen_h4.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(557, 'BRG-182', 'Lampu Halogen H6 12V 35/35W Bosch', 32, 12, 'pcs', 24000.00, 38000.00, 'http://localhost:1023/images/lampu_halogen_h6.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(558, 'BRG-183', 'Lampu Sein Bulat Universal Kuning', 50, 20, 'pcs', 18000.00, 28000.00, 'http://localhost:1023/images/lampu_sein_bulat.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(559, 'BRG-184', 'Lampu Sein LED Universal Smoke', 40, 18, 'pcs', 32000.00, 48000.00, 'http://localhost:1023/images/lampu_sein_led_smoke.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(560, 'BRG-185', 'Lampu Sein LED Kotak Universal', 38, 15, 'pcs', 35000.00, 52000.00, 'http://localhost:1023/images/lampu_sein_kotak.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(561, 'BRG-186', 'Lampu Sein TDR Racing Model Lancip', 30, 12, 'pcs', 48000.00, 70000.00, 'http://localhost:1023/images/lampu_sein_tdr.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(562, 'BRG-187', 'Lampu Stop LED Beat/Vario', 25, 10, 'pcs', 55000.00, 80000.00, 'http://localhost:1023/images/lampu_stop_beat.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(563, 'BRG-188', 'Lampu Stop LED Mio/Soul', 24, 10, 'pcs', 52000.00, 76000.00, 'http://localhost:1023/images/lampu_stop_mio.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(564, 'BRG-189', 'Lampu Stop LED Universal Smoke', 35, 15, 'pcs', 65000.00, 92000.00, 'http://localhost:1023/images/lampu_stop_universal.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(565, 'BRG-190', 'Lampu Stop LED Racing TDR', 18, 10, 'pcs', 85000.00, 120000.00, 'http://localhost:1023/images/lampu_stop_tdr.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-12 13:26:37'),
(566, 'BRG-191', 'Bohlam Sein 12V 10W Kuning', 80, 30, 'pcs', 3000.00, 5000.00, 'http://localhost:1023/images/bohlam_sein.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(567, 'BRG-192', 'Bohlam Stop 12V 21/5W', 75, 30, 'pcs', 3500.00, 6000.00, 'http://localhost:1023/images/bohlam_stop.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(568, 'BRG-193', 'Bohlam Speedometer T5 12V', 60, 25, 'pcs', 2500.00, 4500.00, 'http://localhost:1023/images/bohlam_speedo.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(569, 'BRG-194', 'Bohlam LED Speedometer T10 SMD', 50, 20, 'pcs', 8000.00, 13000.00, 'http://localhost:1023/images/bohlam_led_speedo.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(570, 'BRG-195', 'Lampu LED Strip Kolong Motor 12V', 25, 10, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/led_strip_kolong.jpg', 10, 1, 1, '2025-11-02 16:20:26', '2025-11-02 16:20:26'),
(571, 'BRG-196', 'CDI BRT Hyperband Beat/Vario', 12, 5, 'pcs', 325000.00, 450000.00, 'http://localhost:1023/images/cdi_brt_beat.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(572, 'BRG-197', 'CDI BRT Hyperband Mio/Soul', 10, 5, 'pcs', 320000.00, 445000.00, 'http://localhost:1023/images/cdi_brt_mio.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(573, 'BRG-198', 'CDI BRT Hyperband Supra/Revo', 6, 4, 'pcs', 315000.00, 440000.00, 'http://localhost:1023/images/cdi_brt_supra.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-12 13:26:37'),
(574, 'BRG-199', 'CDI BRT Dualband Jupiter Z', 9, 4, 'pcs', 350000.00, 485000.00, 'http://localhost:1023/images/cdi_brt_jupiter.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(575, 'BRG-200', 'CDI Racing Rextor Beat/Vario', 15, 6, 'pcs', 285000.00, 395000.00, 'http://localhost:1023/images/cdi_rextor_beat.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(576, 'BRG-201', 'CDI Racing Rextor Mio Unlimited', 14, 6, 'pcs', 295000.00, 410000.00, 'http://localhost:1023/images/cdi_rextor_mio.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(577, 'BRG-202', 'CDI Original Honda Beat', 10, 5, 'pcs', 195000.00, 275000.00, 'http://localhost:1023/images/cdi_ori_beat.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(578, 'BRG-203', 'CDI Original Yamaha Mio', 9, 4, 'pcs', 185000.00, 265000.00, 'http://localhost:1023/images/cdi_ori_mio.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(579, 'BRG-204', 'Koil Racing Uma Universal', 20, 8, 'pcs', 165000.00, 230000.00, 'http://localhost:1023/images/koil_uma_universal.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(580, 'BRG-205', 'Koil Racing TDR High Performance', 18, 8, 'pcs', 185000.00, 258000.00, 'http://localhost:1023/images/koil_tdr_racing.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(581, 'BRG-206', 'Koil Racing BRT High Voltage', 15, 6, 'pcs', 225000.00, 310000.00, 'http://localhost:1023/images/koil_brt_racing.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(582, 'BRG-207', 'Koil Original Honda Beat/Vario', 16, 7, 'pcs', 145000.00, 205000.00, 'http://localhost:1023/images/koil_ori_honda.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(583, 'BRG-208', 'Koil Original Yamaha Mio', 14, 6, 'pcs', 138000.00, 195000.00, 'http://localhost:1023/images/koil_ori_yamaha.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(584, 'BRG-209', 'Koil Bosch Universal', 22, 10, 'pcs', 125000.00, 178000.00, 'http://localhost:1023/images/koil_bosch.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(585, 'BRG-210', 'Kabel Busi NGK Racing 7mm', 25, 10, 'set', 68000.00, 98000.00, 'http://localhost:1023/images/kabel_busi_ngk_7mm.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(586, 'BRG-211', 'Kabel Busi NGK Racing 8.5mm Premium', 20, 8, 'set', 95000.00, 135000.00, 'http://localhost:1023/images/kabel_busi_ngk_85mm.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(587, 'BRG-212', 'Kabel Busi Racing TDR 7mm', 22, 10, 'set', 58000.00, 85000.00, 'http://localhost:1023/images/kabel_busi_tdr.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(588, 'BRG-213', 'Kabel Busi Racing Uma 7mm', 24, 10, 'set', 55000.00, 80000.00, 'http://localhost:1023/images/kabel_busi_uma.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(589, 'BRG-214', 'Kabel Busi Standard Universal', 35, 15, 'set', 35000.00, 52000.00, 'http://localhost:1023/images/kabel_busi_standard.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(590, 'BRG-215', 'Kiprok Honda Beat/Vario Original', 12, 6, 'pcs', 125000.00, 178000.00, 'http://localhost:1023/images/kiprok_beat_ori.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(591, 'BRG-216', 'Kiprok Yamaha Mio Original', 10, 5, 'pcs', 118000.00, 168000.00, 'http://localhost:1023/images/kiprok_mio_ori.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(592, 'BRG-217', 'Kiprok Honda Supra/Revo Original', 14, 6, 'pcs', 98000.00, 142000.00, 'http://localhost:1023/images/kiprok_supra_ori.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(593, 'BRG-218', 'Kiprok Racing Shogun/Smash', 15, 7, 'pcs', 88000.00, 128000.00, 'http://localhost:1023/images/kiprok_shogun_ori.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(594, 'BRG-219', 'Kiprok Universal Matic', 20, 8, 'pcs', 78000.00, 115000.00, 'http://localhost:1023/images/kiprok_universal_matic.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(595, 'BRG-220', 'Sekring Blade 10A Isi 5pcs', 60, 25, 'pcs', 8000.00, 13000.00, 'http://localhost:1023/images/sekring_10a.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(596, 'BRG-221', 'Sekring Blade 15A Isi 5pcs', 55, 25, 'pcs', 8500.00, 14000.00, 'http://localhost:1023/images/sekring_15a.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(597, 'BRG-222', 'Sekring Blade 20A Isi 5pcs', 50, 20, 'pcs', 9000.00, 14500.00, 'http://localhost:1023/images/sekring_20a.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(598, 'BRG-223', 'Socket Lampu H4 Keramik', 45, 18, 'pcs', 12000.00, 19000.00, 'http://localhost:1023/images/socket_h4.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(599, 'BRG-224', 'Socket Lampu H6 Keramik', 42, 18, 'pcs', 11000.00, 18000.00, 'http://localhost:1023/images/socket_h6.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(600, 'BRG-225', 'Relay Bosch 12V 30A Universal', 35, 15, 'pcs', 18000.00, 28000.00, 'http://localhost:1023/images/relay_bosch_30a.jpg', 12, 1, 1, '2025-11-02 16:21:08', '2025-11-02 16:21:08'),
(601, 'BRG-226', 'Shock YSS G-Plus 300mm Matic', 10, 4, 'pcs', 695000.00, 950000.00, 'http://localhost:1023/images/shock_yss_300.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(602, 'BRG-227', 'Shock YSS G-Plus 330mm Bebek', 8, 3, 'pcs', 785000.00, 1050000.00, 'http://localhost:1023/images/shock_yss_330.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(603, 'BRG-228', 'Shock YSS G-Racing 340mm Sport', 6, 2, 'pcs', 1250000.00, 1650000.00, 'http://localhost:1023/images/shock_yss_340_racing.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(604, 'BRG-229', 'Shock KYB Zeto 300mm Beat/Vario', 12, 5, 'pcs', 625000.00, 850000.00, 'http://localhost:1023/images/shock_kyb_300.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(605, 'BRG-230', 'Shock KYB 330mm Jupiter/Vega', 10, 4, 'pcs', 685000.00, 925000.00, 'http://localhost:1023/images/shock_kyb_330.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(606, 'BRG-231', 'Shock Ride It 300mm Matic Universal', 18, 8, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/shock_rideit_300.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(607, 'BRG-232', 'Shock Ride It 330mm Bebek Universal', 15, 7, 'pcs', 425000.00, 580000.00, 'http://localhost:1023/images/shock_rideit_330.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(608, 'BRG-233', 'Shock Daytona 310mm Matic Sport', 12, 6, 'pcs', 465000.00, 635000.00, 'http://localhost:1023/images/shock_daytona_310.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-10 13:31:09'),
(609, 'BRG-234', 'Shock Honda Original Beat', 8, 4, 'pcs', 345000.00, 485000.00, 'http://localhost:1023/images/shock_ori_beat.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(610, 'BRG-235', 'Shock Yamaha Original Mio', 7, 3, 'pcs', 335000.00, 475000.00, 'http://localhost:1023/images/shock_ori_mio.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(611, 'BRG-236', 'Per CVT Beat/Vario 1000rpm TDR', 25, 10, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/per_cvt_tdr_1000.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(612, 'BRG-237', 'Per CVT Beat/Vario 1500rpm TDR', 22, 10, 'set', 48000.00, 72000.00, 'http://localhost:1023/images/per_cvt_tdr_1500.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(613, 'BRG-238', 'Per CVT Beat/Vario 2000rpm Racing', 20, 8, 'set', 52000.00, 78000.00, 'http://localhost:1023/images/per_cvt_racing_2000.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(614, 'BRG-239', 'Per Shock Belakang Racing Variasi', 30, 12, 'pcs', 35000.00, 52000.00, 'http://localhost:1023/images/per_shock_racing.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(615, 'BRG-240', 'Per Kopling Racing Beat/Vario', 28, 12, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/per_kopling_racing.jpg', 13, 1, 1, '2025-11-02 16:21:30', '2025-11-02 16:21:30'),
(616, 'BRG-241', 'Kampas Kopling Honda Supra X 125 Original', 20, 8, 'set', 85000.00, 125000.00, 'http://localhost:1023/images/kopling_supra_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(617, 'BRG-242', 'Kampas Kopling Honda CB150R Original', 15, 6, 'set', 145000.00, 205000.00, 'http://localhost:1023/images/kopling_cb150_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(618, 'BRG-243', 'Kampas Kopling Yamaha Vixion Original', 18, 8, 'set', 135000.00, 195000.00, 'http://localhost:1023/images/kopling_vixion_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(619, 'BRG-244', 'Kampas Kopling Yamaha Jupiter Z Original', 22, 10, 'set', 75000.00, 112000.00, 'http://localhost:1023/images/kopling_jupiter_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(620, 'BRG-245', 'Kampas Kopling Suzuki Satria FU Original', 16, 7, 'set', 125000.00, 180000.00, 'http://localhost:1023/images/kopling_satria_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(621, 'BRG-246', 'Kampas Kopling Racing TDR Universal', 25, 10, 'set', 95000.00, 138000.00, 'http://localhost:1023/images/kopling_tdr_racing.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(622, 'BRG-247', 'Kampas Kopling Racing Uma Universal', 24, 10, 'set', 88000.00, 130000.00, 'http://localhost:1023/images/kopling_uma_racing.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(623, 'BRG-248', 'Per Kopling Honda Supra X 125 Orii', 30, 12, 'set', 35000.00, 52000.00, 'http://localhost:1023/images/per_kopling_supra.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(624, 'BRG-249', 'Per Kopling Yamaha Vixion Original', 25, 10, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/per_kopling_vixion.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(625, 'BRG-250', 'Per Kopling Racing Supra/Karisma', 28, 12, 'set', 38000.00, 56000.00, 'http://localhost:1023/images/per_kopling_racing_supra.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(626, 'BRG-251', 'Per Kopling Racing CB/Vixion', 22, 10, 'set', 48000.00, 70000.00, 'http://localhost:1023/images/per_kopling_racing_cb.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(627, 'BRG-252', 'Kanvas Kopling Beat/Vario Honda Original', 25, 10, 'set', 55000.00, 82000.00, 'http://localhost:1023/images/kanvas_kopling_beat_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(628, 'BRG-253', 'Kanvas Kopling Mio Honda Original', 24, 10, 'set', 52000.00, 78000.00, 'http://localhost:1023/images/kanvas_kopling_mio_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(629, 'BRG-254', 'Kanvas Kopling TDR Beat/Vario Racing', 30, 12, 'set', 48000.00, 72000.00, 'http://localhost:1023/images/kanvas_kopling_tdr_beat.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(630, 'BRG-255', 'Kanvas Kopling TDR Mio/Soul Racing', 28, 12, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/kanvas_kopling_tdr_mio.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34');
INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `jumlah_stok`, `stok_minimum`, `tipe_stok`, `harga_beli`, `harga_jual`, `gambar`, `kategori_id`, `users_id`, `is_active`, `created_at`, `updated_at`) VALUES
(631, 'BRG-256', 'Roller CVT Beat/Vario 9 gram Original', 35, 15, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/roller_beat_9g.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(632, 'BRG-257', 'Roller CVT Mio 9 gram Original', 32, 15, 'set', 38000.00, 58000.00, 'http://localhost:1023/images/roller_mio_9g.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(633, 'BRG-258', 'Roller CVT TDR Beat/Vario 10 gram', 30, 12, 'set', 35000.00, 52000.00, 'http://localhost:1023/images/roller_tdr_10g.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(634, 'BRG-259', 'Roller CVT TDR Mio 8.5 gram Racing', 28, 12, 'set', 36000.00, 54000.00, 'http://localhost:1023/images/roller_tdr_mio_85g.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(635, 'BRG-260', 'Slider CVT Beat/Vario Original', 24, 10, 'pcs', 32000.00, 48000.00, 'http://localhost:1023/images/slider_beat_ori.jpg', 14, 1, 1, '2025-11-02 16:22:34', '2025-11-02 16:22:34'),
(636, 'BRG-261', 'Filter Udara Honda Beat Original', 30, 12, 'pcs', 35000.00, 52000.00, 'http://localhost:1023/images/filter_udara_beat_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(637, 'BRG-262', 'Filter Udara Honda Vario 125 Original', 28, 12, 'pcs', 38000.00, 56000.00, 'http://localhost:1023/images/filter_udara_vario_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(638, 'BRG-263', 'Filter Udara Honda Scoopy Original', 25, 10, 'pcs', 36000.00, 54000.00, 'http://localhost:1023/images/filter_udara_scoopy_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(639, 'BRG-264', 'Filter Udara Yamaha Mio Original', 32, 15, 'pcs', 33000.00, 50000.00, 'http://localhost:1023/images/filter_udara_mio_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(640, 'BRG-265', 'Filter Udara Yamaha Aerox Original', 20, 10, 'pcs', 42000.00, 62000.00, 'http://localhost:1023/images/filter_udara_aerox_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(641, 'BRG-266', 'Filter Udara Yamaha Nmax Original', 22, 10, 'pcs', 45000.00, 66000.00, 'http://localhost:1023/images/filter_udara_nmax_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(642, 'BRG-267', 'Filter Udara Sakura Beat/Vario', 35, 15, 'pcs', 28000.00, 42000.00, 'http://localhost:1023/images/filter_sakura_beat.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(643, 'BRG-268', 'Filter Udara Sakura Mio/Soul', 33, 15, 'pcs', 26000.00, 40000.00, 'http://localhost:1023/images/filter_sakura_mio.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(644, 'BRG-269', 'Filter Udara Racing TDR Open Air', 18, 8, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/filter_tdr_open.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(645, 'BRG-270', 'Filter Udara Racing Uma Mushroom', 20, 8, 'pcs', 75000.00, 110000.00, 'http://localhost:1023/images/filter_uma_mushroom.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(646, 'BRG-271', 'Filter Oli Honda CB150R Original', 18, 8, 'pcs', 28000.00, 42000.00, 'http://localhost:1023/images/filter_oli_cb150_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(647, 'BRG-272', 'Filter Oli Honda CBR150R Original', 16, 7, 'pcs', 32000.00, 48000.00, 'http://localhost:1023/images/filter_oli_cbr150_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(648, 'BRG-273', 'Filter Oli Yamaha R15 Original', 15, 7, 'pcs', 30000.00, 45000.00, 'http://localhost:1023/images/filter_oli_r15_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(649, 'BRG-274', 'Filter Oli Yamaha Vixion Original', 20, 8, 'pcs', 26000.00, 40000.00, 'http://localhost:1023/images/filter_oli_vixion_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(650, 'BRG-275', 'Filter Oli Suzuki Satria FU Original', 17, 7, 'pcs', 24000.00, 38000.00, 'http://localhost:1023/images/filter_oli_satria_ori.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(651, 'BRG-276', 'Saringan Bensin Universal Inline', 50, 20, 'pcs', 8000.00, 13000.00, 'http://localhost:1023/images/saringan_bensin_inline.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(652, 'BRG-277', 'Saringan Bensin Honda Original', 40, 18, 'pcs', 12000.00, 19000.00, 'http://localhost:1023/images/saringan_bensin_honda.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(653, 'BRG-278', 'Saringan Bensin Yamaha Original', 38, 18, 'pcs', 11000.00, 18000.00, 'http://localhost:1023/images/saringan_bensin_yamaha.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(654, 'BRG-279', 'Saringan Bensin Racing Besar', 30, 12, 'pcs', 15000.00, 23000.00, 'http://localhost:1023/images/saringan_bensin_racing.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(655, 'BRG-280', 'Filter Udara Racing K&N Style', 12, 5, 'pcs', 125000.00, 180000.00, 'http://localhost:1023/images/filter_kn_style.jpg', 15, 1, 1, '2025-11-02 16:23:15', '2025-11-02 16:23:15'),
(656, 'BRG-281', 'Spion Honda Beat/Vario Original Kanan', 20, 10, 'pcs', 45000.00, 68000.00, 'http://localhost:1023/images/spion_beat_ori_kanan.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(657, 'BRG-282', 'Spion Honda Beat/Vario Original Kiri', 20, 10, 'pcs', 45000.00, 68000.00, 'http://localhost:1023/images/spion_beat_ori_kiri.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(658, 'BRG-283', 'Spion Yamaha Mio/Soul Original Kanan', 18, 8, 'pcs', 42000.00, 64000.00, 'http://localhost:1023/images/spion_mio_ori_kanan.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(659, 'BRG-284', 'Spion Yamaha Mio/Soul Original Kiri', 18, 8, 'pcs', 42000.00, 64000.00, 'http://localhost:1023/images/spion_mio_ori_kiri.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(660, 'BRG-285', 'Spion TDR Tomok Universal', 30, 12, 'pcs', 38000.00, 58000.00, 'http://localhost:1023/images/spion_tdr_tomok.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(661, 'BRG-286', 'Spion Racing CNC Universal', 25, 10, 'pcs', 65000.00, 95000.00, 'http://localhost:1023/images/spion_cnc_racing.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(662, 'BRG-287', 'Spion Japstyle Bulat Universal', 28, 12, 'pcs', 42000.00, 62000.00, 'http://localhost:1023/images/spion_japstyle.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(663, 'BRG-288', 'Cover Jok Beat Hitam Polos', 20, 10, 'pcs', 35000.00, 55000.00, 'http://localhost:1023/images/cover_jok_beat_hitam.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(664, 'BRG-289', 'Cover Jok Vario Kombinasi', 18, 8, 'pcs', 42000.00, 65000.00, 'http://localhost:1023/images/cover_jok_vario_kombi.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(665, 'BRG-290', 'Cover Jok Mio/Soul Sporty', 20, 10, 'pcs', 38000.00, 60000.00, 'http://localhost:1023/images/cover_jok_mio_sporty.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-12 15:33:06'),
(666, 'BRG-291', 'Busa Jok Beat/Vario', 13, 7, 'pcs', 55000.00, 82000.00, 'http://localhost:1023/images/busa_jok_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-12 15:10:27'),
(667, 'BRG-292', 'Busa Jok Mio/Soul', 14, 7, 'pcs', 52000.00, 78000.00, 'http://localhost:1023/images/busa_jok_mio.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(668, 'BRG-293', 'Cover Body Depan Beat Hitam', 12, 5, 'pcs', 125000.00, 180000.00, 'http://localhost:1023/images/cover_depan_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(669, 'BRG-294', 'Cover Body Samping Beat Kanan', 10, 5, 'pcs', 95000.00, 140000.00, 'http://localhost:1023/images/cover_samping_beat_kanan.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(670, 'BRG-295', 'Cover Body Samping Beat Kiri', 10, 5, 'pcs', 95000.00, 140000.00, 'http://localhost:1023/images/cover_samping_beat_kiri.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(671, 'BRG-296', 'Cover Knalpot Beat/Vario', 18, 8, 'pcs', 45000.00, 68000.00, 'http://localhost:1023/images/cover_knalpot_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(672, 'BRG-297', 'Undertail Universal Smoke', 15, 7, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/undertail_smoke.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(673, 'BRG-298', 'Gantungan Helm Universal', 40, 18, 'pcs', 12000.00, 20000.00, 'http://localhost:1023/images/gantungan_helm.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(674, 'BRG-299', 'Kunci Kontak Honda Beat Original', 8, 4, 'set', 125000.00, 180000.00, 'http://localhost:1023/images/kunci_kontak_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(675, 'BRG-300', 'Kunci Kontak Yamaha Mio Original', 7, 3, 'set', 118000.00, 170000.00, 'http://localhost:1023/images/kunci_kontak_mio.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(676, 'BRG-301', 'Karpet Motor Universal', 30, 15, 'pcs', 18000.00, 28000.00, 'http://localhost:1023/images/karpet_universal.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(677, 'BRG-302', 'Standar Samping Beat/Vario', 16, 8, 'pcs', 35000.00, 53000.00, 'http://localhost:1023/images/standar_samping_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(678, 'BRG-303', 'Standar Tengah Beat/Vario', 14, 7, 'pcs', 42000.00, 62000.00, 'http://localhost:1023/images/standar_tengah_beat.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(679, 'BRG-304', 'Footstep Racing CNC Universal', 20, 10, 'pcs', 95000.00, 138000.00, 'http://localhost:1023/images/footstep_cnc.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(680, 'BRG-305', 'Windshield Universal Smoke', 18, 8, 'pcs', 75000.00, 110000.00, 'http://localhost:1023/images/windshield_smoke.jpg', 16, 1, 1, '2025-11-02 16:23:57', '2025-11-02 16:23:57'),
(681, 'BRG-306', 'Alarm Motor Remote 2 Way', 15, 7, 'set', 125000.00, 180000.00, 'http://localhost:1023/images/alarm_2way.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(682, 'BRG-307', 'Alarm Motor Remote 1 Way', 20, 10, 'set', 75000.00, 110000.00, 'http://localhost:1023/images/alarm_1way.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(683, 'BRG-308', 'Gembok Cakram Disc Lock', 25, 12, 'pcs', 55000.00, 82000.00, 'http://localhost:1023/images/gembok_cakram.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(684, 'BRG-309', 'Rantai Gembok Panjang 120cm', 18, 8, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/rantai_gembok.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(685, 'BRG-310', 'Sarung Jok Anti Slip', 35, 15, 'pcs', 22000.00, 35000.00, 'http://localhost:1023/images/sarung_jok_antislip.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(686, 'BRG-311', 'Sarung Motor Size L', 40, 18, 'pcs', 45000.00, 68000.00, 'http://localhost:1023/images/sarung_motor_l.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(687, 'BRG-312', 'Sarung Motor Size XL Premium', 35, 15, 'pcs', 55000.00, 82000.00, 'http://localhost:1023/images/sarung_motor_xl.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(688, 'BRG-313', 'Tas Tangki Magnetic', 18, 8, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/tas_tangki_magnetic.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(689, 'BRG-314', 'Tas Jok Belakang Multifungsi', 22, 10, 'pcs', 75000.00, 110000.00, 'http://localhost:1023/images/tas_jok_belakang.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(690, 'BRG-315', 'Box Belakang Universal 32L', 12, 6, 'pcs', 185000.00, 265000.00, 'http://localhost:1023/images/box_belakang_32l.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(691, 'BRG-316', 'USB Charger Motor 2 Port', 30, 15, 'pcs', 35000.00, 53000.00, 'http://localhost:1023/images/usb_charger_2port.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(692, 'BRG-317', 'USB Charger Fast Charging QC3.0', 25, 12, 'pcs', 55000.00, 82000.00, 'http://localhost:1023/images/usb_qc3.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(693, 'BRG-318', 'Holder HP Motor Spion', 28, 12, 'pcs', 25000.00, 40000.00, 'http://localhost:1023/images/holder_hp_spion.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(694, 'BRG-319', 'Holder HP Motor Stang', 32, 15, 'pcs', 28000.00, 43000.00, 'http://localhost:1023/images/holder_hp_stang.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(695, 'BRG-320', 'Voltmeter Digital LED', 40, 18, 'pcs', 22000.00, 35000.00, 'http://localhost:1023/images/voltmeter_digital.jpg', 7, 1, 1, '2025-11-02 16:24:37', '2025-11-02 16:24:37'),
(696, 'BRG-321', 'Stiker Cutting Sticker Custom', 50, 20, 'pcs', 15000.00, 25000.00, 'http://localhost:1023/images/stiker_cutting.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(697, 'BRG-322', 'Emblem Carbon 3D Universal', 45, 20, 'pcs', 18000.00, 28000.00, 'http://localhost:1023/images/emblem_carbon.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(698, 'BRG-323', 'Knalpot Racing Yoshimura Replica', 10, 5, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/knalpot_yoshimura.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(699, 'BRG-324', 'Knalpot Racing Akrapovic Replica', 8, 4, 'pcs', 425000.00, 585000.00, 'http://localhost:1023/images/knalpot_akrapovic.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(700, 'BRG-325', 'Knalpot Racing TDR', 12, 6, 'pcs', 295000.00, 410000.00, 'http://localhost:1023/images/knalpot_tdr.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(701, 'BRG-326', 'Grip Stang Racing TDR', 30, 15, 'set', 35000.00, 53000.00, 'http://localhost:1023/images/grip_tdr.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(702, 'BRG-327', 'Handle Rem Racing CNC', 20, 10, 'set', 125000.00, 180000.00, 'http://localhost:1023/images/handle_rem_cnc.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(703, 'BRG-328', 'Stang Jepit Racing CNC', 15, 7, 'set', 185000.00, 265000.00, 'http://localhost:1023/images/stang_jepit_cnc.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(704, 'BRG-329', 'Cover Radiator Aksesoris', 18, 8, 'pcs', 65000.00, 95000.00, 'http://localhost:1023/images/cover_radiator.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(705, 'BRG-330', 'Tutup Radiator D1 Spec 1.3 Bar', 25, 12, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/tutup_radiator_d1.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(706, 'BRG-331', 'Tutup Oli Racing CNC', 28, 12, 'pcs', 55000.00, 82000.00, 'http://localhost:1023/images/tutup_oli_cnc.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(707, 'BRG-332', 'Jalu Stang Racing CNC', 32, 15, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/jalu_stang_cnc.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(708, 'BRG-333', 'Jarum Skep Karburator Racing', 35, 15, 'pcs', 12000.00, 20000.00, 'http://localhost:1023/images/jarum_skep.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(709, 'BRG-334', 'Sensor Speedometer Digital Universal', 20, 10, 'set', 165000.00, 235000.00, 'http://localhost:1023/images/speedometer_digital.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(710, 'BRG-335', 'Braket Plat Nomor Adjustable', 25, 12, 'pcs', 48000.00, 72000.00, 'http://localhost:1023/images/braket_plat_adjustable.jpg', 7, 1, 1, '2025-11-02 16:30:39', '2025-11-02 16:30:39'),
(711, 'BRG-336', 'Pulley Racing Variasi Beat/Vario', 15, 7, 'pcs', 185000.00, 265000.00, 'http://localhost:1023/images/pulley_racing_beat.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(712, 'BRG-337', 'Pulley Racing TDR Mio/Soul', 14, 7, 'pcs', 195000.00, 275000.00, 'http://localhost:1023/images/pulley_racing_mio.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(713, 'BRG-338', 'Rumah Roller BRT Beat/Vario', 12, 6, 'pcs', 285000.00, 395000.00, 'http://localhost:1023/images/rumah_roller_brt.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(714, 'BRG-339', 'Rumah Roller BRT Mio/Soul', 11, 5, 'pcs', 295000.00, 410000.00, 'http://localhost:1023/images/rumah_roller_brt_mio.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(715, 'BRG-340', 'Per CVT Racing 1000rpm TDR', 20, 10, 'set', 42000.00, 62000.00, 'http://localhost:1023/images/per_cvt_1000.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(716, 'BRG-341', 'Per CVT Racing 1500rpm TDR', 18, 8, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/per_cvt_1500.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(717, 'BRG-342', 'Per CVT Racing 2000rpm Racing', 16, 8, 'set', 48000.00, 72000.00, 'http://localhost:1023/images/per_cvt_2000.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(718, 'BRG-343', 'Face Pulley Racing CNC', 14, 7, 'pcs', 165000.00, 235000.00, 'http://localhost:1023/images/face_pulley_cnc.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(719, 'BRG-344', 'Kopling Manual Racing Uma Beat/Vario', 10, 5, 'set', 485000.00, 670000.00, 'http://localhost:1023/images/kopling_manual_uma_beat.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(720, 'BRG-345', 'Kopling Manual Racing Uma Mio', 9, 4, 'set', 495000.00, 685000.00, 'http://localhost:1023/images/kopling_manual_uma_mio.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(721, 'BRG-346', 'Kampas Kopling Racing Uma Set', 15, 7, 'set', 125000.00, 180000.00, 'http://localhost:1023/images/kampas_kopling_uma_racing.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(722, 'BRG-347', 'Per Kopling Racing TDR', 18, 8, 'set', 65000.00, 95000.00, 'http://localhost:1023/images/per_kopling_tdr_racing.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(723, 'BRG-348', 'Noken As Racing TDR Beat/Vario', 8, 4, 'pcs', 585000.00, 810000.00, 'http://localhost:1023/images/noken_as_tdr_beat.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(724, 'BRG-349', 'Noken As Racing TDR Mio/Soul', 7, 3, 'pcs', 595000.00, 825000.00, 'http://localhost:1023/images/noken_as_tdr_mio.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(725, 'BRG-350', 'Noken As Racing Uma Jupiter Z', 6, 3, 'pcs', 625000.00, 865000.00, 'http://localhost:1023/images/noken_as_uma_jupiter.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(726, 'BRG-351', 'Noken As Racing Kitaco Supra', 5, 2, 'pcs', 885000.00, 1200000.00, 'http://localhost:1023/images/noken_as_kitaco_supra.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(727, 'BRG-352', 'Piston Kit Racing 58mm Beat/Vario', 10, 5, 'set', 385000.00, 535000.00, 'http://localhost:1023/images/piston_58mm_beat.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(728, 'BRG-353', 'Piston Kit Racing 62mm Mio Bore Up', 8, 4, 'set', 485000.00, 670000.00, 'http://localhost:1023/images/piston_62mm_mio.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(729, 'BRG-354', 'Piston Kit Racing 58mm Jupiter Z', 9, 4, 'set', 395000.00, 550000.00, 'http://localhost:1023/images/piston_58mm_jupiter.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(730, 'BRG-355', 'Piston Kit Forged Racing 58mm', 6, 3, 'set', 685000.00, 945000.00, 'http://localhost:1023/images/piston_forged_58mm.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(731, 'BRG-356', 'Karburator PE28 Racing Universal', 8, 4, 'pcs', 485000.00, 670000.00, 'http://localhost:1023/images/karbu_pe28.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(732, 'BRG-357', 'Karburator PE24 Racing Universal', 10, 5, 'pcs', 425000.00, 585000.00, 'http://localhost:1023/images/karbu_pe24.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(733, 'BRG-358', 'Karburator PWK 28 Racing', 7, 3, 'pcs', 585000.00, 810000.00, 'http://localhost:1023/images/karbu_pwk28.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(734, 'BRG-359', 'Manifold Racing Universal 28mm', 15, 7, 'pcs', 125000.00, 180000.00, 'http://localhost:1023/images/manifold_28mm.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(735, 'BRG-360', 'CDI Rextor Unlimited Racing', 12, 6, 'pcs', 295000.00, 410000.00, 'http://localhost:1023/images/cdi_rextor_unlimited.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(736, 'BRG-361', 'CDI Racing Adjustable RPM', 10, 5, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/cdi_adjustable.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(737, 'BRG-362', 'Koil Racing High Voltage 50KV', 14, 7, 'pcs', 195000.00, 275000.00, 'http://localhost:1023/images/koil_50kv.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(738, 'BRG-363', 'Throttle Body Racing 32mm', 6, 3, 'pcs', 1250000.00, 1700000.00, 'http://localhost:1023/images/throttle_body_32mm.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(739, 'BRG-364', 'Intake Manifold Racing CNC', 10, 5, 'pcs', 285000.00, 395000.00, 'http://localhost:1023/images/intake_manifold_cnc.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-02 16:31:01'),
(740, 'BRG-365', 'Filter Udara Racing K&N Universal', 10, 6, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/filter_kn_universal.jpg', 17, 1, 1, '2025-11-02 16:31:01', '2025-11-10 14:38:20'),
(741, 'BRG-366', 'Karburator Honda Supra X 125 Original', 8, 4, 'pcs', 325000.00, 450000.00, 'http://localhost:1023/images/karbu_supra_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(742, 'BRG-367', 'Karburator Honda Revo Original', 7, 3, 'pcs', 295000.00, 410000.00, 'http://localhost:1023/images/karbu_revo_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(743, 'BRG-368', 'Karburator Yamaha Jupiter Z Original', 9, 4, 'pcs', 285000.00, 395000.00, 'http://localhost:1023/images/karbu_jupiter_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(744, 'BRG-369', 'Karburator Yamaha Vega ZR Original', 8, 4, 'pcs', 275000.00, 385000.00, 'http://localhost:1023/images/karbu_vega_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(745, 'BRG-370', 'Karburator Suzuki Shogun Original', 7, 3, 'pcs', 265000.00, 375000.00, 'http://localhost:1023/images/karbu_shogun_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(746, 'BRG-371', 'Karburator PE28 Mikuni Thailand', 6, 3, 'pcs', 425000.00, 585000.00, 'http://localhost:1023/images/karbu_pe28_mikuni.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(747, 'BRG-372', 'Karburator PE24 Mikuni Thailand', 8, 4, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/karbu_pe24_mikuni.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(748, 'BRG-373', 'Karburator PWK 26 Racing', 5, 2, 'pcs', 485000.00, 670000.00, 'http://localhost:1023/images/karbu_pwk26.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(749, 'BRG-374', 'Karburator Keihin PE 28', 6, 3, 'pcs', 525000.00, 725000.00, 'http://localhost:1023/images/karbu_keihin_pe28.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(750, 'BRG-375', 'Repair Kit Karburator Supra/Jupiter', 20, 10, 'set', 35000.00, 53000.00, 'http://localhost:1023/images/repair_kit_karbu.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(751, 'BRG-376', 'Jarum Skep Karburator PE28', 25, 12, 'pcs', 15000.00, 23000.00, 'http://localhost:1023/images/jarum_skep_pe28.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(752, 'BRG-377', 'Main Jet Karburator Size 90-120', 30, 15, 'pcs', 8000.00, 13000.00, 'http://localhost:1023/images/main_jet_karbu.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(753, 'BRG-378', 'Pilot Jet Karburator Size 15-35', 28, 12, 'pcs', 7000.00, 12000.00, 'http://localhost:1023/images/pilot_jet_karbu.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(754, 'BRG-379', 'Skep Karburator PE28 Universal', 15, 7, 'pcs', 85000.00, 125000.00, 'http://localhost:1023/images/skep_pe28.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(755, 'BRG-380', 'Per Skep Karburator', 35, 15, 'pcs', 5000.00, 9000.00, 'http://localhost:1023/images/per_skep.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(756, 'BRG-381', 'Selang Bensin 6mm Per Meter', 50, 20, 'meter', 4000.00, 7000.00, 'http://localhost:1023/images/selang_bensin_6mm.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(757, 'BRG-382', 'Selang Bensin 8mm Per Meter', 45, 20, 'meter', 5000.00, 8500.00, 'http://localhost:1023/images/selang_bensin_8mm.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(758, 'BRG-383', 'Selang Bensin Transparan 6mm Per Meter', 40, 18, 'meter', 6000.00, 10000.00, 'http://localhost:1023/images/selang_bensin_trans_6mm.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(759, 'BRG-384', 'Klem Selang Bensin Set Isi 10pcs', 58, 25, 'set', 8000.00, 13000.00, 'http://localhost:1023/images/klem_selang.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-10 14:50:32'),
(760, 'BRG-385', 'Kran Bensin Manual Universal', 25, 12, 'pcs', 22000.00, 35000.00, 'http://localhost:1023/images/kran_bensin_manual.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(761, 'BRG-386', 'Kran Bensin Vakum Supra/Jupiter', 18, 8, 'pcs', 45000.00, 68000.00, 'http://localhost:1023/images/kran_bensin_vakum.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(762, 'BRG-387', 'Pompa Bensin Manual Universal', 20, 10, 'pcs', 35000.00, 53000.00, 'http://localhost:1023/images/pompa_bensin_manual.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(763, 'BRG-388', 'Pompa Bensin Elektrik Universal', 12, 6, 'pcs', 125000.00, 180000.00, 'http://localhost:1023/images/pompa_bensin_elektrik.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(764, 'BRG-389', 'Injektor Honda Beat FI Original', 6, 3, 'pcs', 385000.00, 535000.00, 'http://localhost:1023/images/injektor_beat_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(765, 'BRG-390', 'Injektor Yamaha Mio FI Original', 5, 2, 'pcs', 365000.00, 510000.00, 'http://localhost:1023/images/injektor_mio_ori.jpg', 18, 1, 1, '2025-11-02 16:31:33', '2025-11-02 16:31:33'),
(766, 'BRG-391', 'Piston Kit Honda Beat STD Original', 10, 5, 'set', 185000.00, 265000.00, 'http://localhost:1023/images/piston_beat_std_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(767, 'BRG-392', 'Piston Kit Honda Beat OS 25 Original', 8, 4, 'set', 195000.00, 275000.00, 'http://localhost:1023/images/piston_beat_os25_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(768, 'BRG-393', 'Piston Kit Honda Beat OS 50 Original', 7, 3, 'set', 205000.00, 290000.00, 'http://localhost:1023/images/piston_beat_os50_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(769, 'BRG-394', 'Piston Kit Honda Vario 125 STD Original', 9, 4, 'set', 225000.00, 315000.00, 'http://localhost:1023/images/piston_vario125_std_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(770, 'BRG-395', 'Piston Kit Yamaha Mio STD Original', 10, 5, 'set', 175000.00, 250000.00, 'http://localhost:1023/images/piston_mio_std_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(771, 'BRG-396', 'Piston Kit Yamaha Mio OS 25 Original', 8, 4, 'set', 185000.00, 265000.00, 'http://localhost:1023/images/piston_mio_os25_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(772, 'BRG-397', 'Piston Kit Yamaha Mio OS 50 Original', 7, 3, 'set', 195000.00, 275000.00, 'http://localhost:1023/images/piston_mio_os50_ori.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(773, 'BRG-398', 'Piston Kit Honda Supra X 125 STD', 12, 6, 'set', 165000.00, 235000.00, 'http://localhost:1023/images/piston_supra_std.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(774, 'BRG-399', 'Piston Kit Yamaha Jupiter Z STD', 11, 5, 'set', 155000.00, 225000.00, 'http://localhost:1023/images/piston_jupiter_std.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(775, 'BRG-400', 'Ring Piston Honda Beat STD', 20, 10, 'set', 45000.00, 68000.00, 'http://localhost:1023/images/ring_piston_beat.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(776, 'BRG-401', 'Ring Piston Yamaha Mio STD', 18, 8, 'set', 42000.00, 64000.00, 'http://localhost:1023/images/ring_piston_mio.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(777, 'BRG-402', 'Ring Piston Honda Supra X 125', 22, 10, 'set', 38000.00, 58000.00, 'http://localhost:1023/images/ring_piston_supra.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(778, 'BRG-403', 'Ring Piston Yamaha Jupiter Z', 20, 10, 'set', 36000.00, 55000.00, 'http://localhost:1023/images/ring_piston_jupiter.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(779, 'BRG-404', 'Seher Honda Beat STD Original', 6, 4, 'pcs', 125000.00, 180000.00, 'http://localhost:1023/images/seher_beat_std.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 14:35:56'),
(780, 'BRG-405', 'Seher Yamaha Mio STD Original', 1, 3, 'pcs', 118000.00, 170000.00, 'http://localhost:1023/images/seher_mio_std.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 14:42:19'),
(781, 'BRG-406', 'Blok Seher Honda Beat Original', 5, 2, 'pcs', 485000.00, 670000.00, 'http://localhost:1023/images/blok_seher_beat.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(782, 'BRG-407', 'Blok Seher Yamaha Mio Original', 4, 2, 'pcs', 465000.00, 645000.00, 'http://localhost:1023/images/blok_seher_mio.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(783, 'BRG-408', 'Bearing Kruk As Honda Beat Original', 8, 5, 'set', 185000.00, 265000.00, 'http://localhost:1023/images/bearing_krukas_beat.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 14:46:55'),
(784, 'BRG-409', 'Bearing Kruk As Yamaha Mio Original', 9, 4, 'set', 175000.00, 250000.00, 'http://localhost:1023/images/bearing_krukas_mio.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-02 16:32:30'),
(785, 'BRG-410', 'Bearing Roda Depan Honda Beat', 13, 7, 'set', 55000.00, 82000.00, 'http://localhost:1023/images/bearing_roda_depan_beat.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-06 08:38:45'),
(786, 'BRG-411', 'Bearing Roda Belakang Honda Beat', 6, 7, 'set', 62000.00, 92000.00, 'http://localhost:1023/images/bearing_roda_belakang_beat.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 13:31:09'),
(787, 'BRG-412', 'Bearing Roda Depan Yamaha Mio', 14, 8, 'set', 52000.00, 78000.00, 'http://localhost:1023/images/bearing_roda_depan_mio.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 14:50:32'),
(788, 'BRG-413', 'Bearing Roda Belakang Yamaha Mio', 5, 7, 'set', 58000.00, 85000.00, 'http://localhost:1023/images/bearing_roda_belakang_mio.jpg', 19, 1, 1, '2025-11-02 16:32:30', '2025-11-10 14:34:07'),
(792, NULL, 'tess tambah barang', 11, 5, 'pcs', 0.00, 11000.00, NULL, 15, NULL, 1, '2025-11-10 19:02:44', '2025-11-10 19:02:44'),
(793, NULL, 'bearing test', 3, 5, 'pcs', 0.00, 10000.00, NULL, 19, NULL, 1, '2025-11-12 11:29:16', '2025-11-12 11:29:16'),
(794, NULL, 'tess harga beli', 5, 5, 'pcs', 0.00, 13000.00, NULL, 19, NULL, 1, '2025-11-12 12:11:07', '2025-11-12 12:11:07'),
(795, NULL, 'tess harga beli', 5, 5, 'pcs', 0.00, 13000.00, NULL, 19, NULL, 1, '2025-11-12 12:19:48', '2025-11-12 12:19:48'),
(796, NULL, 'tess harga beliiiii', 11, 5, 'pcs', 11000.00, 140000.00, NULL, 19, NULL, 1, '2025-11-12 12:31:35', '2025-11-12 12:31:35'),
(797, NULL, 'tess harga beli 2 kalii', 15, 5, 'pcs', 12000.00, 14000.00, NULL, 19, NULL, 1, '2025-11-12 12:36:24', '2025-11-12 12:36:24'),
(798, NULL, 'tess harga beli 3 kalii', 6, 5, 'pcs', 14000.00, 17000.00, NULL, 18, NULL, 1, '2025-11-12 12:44:22', '2025-11-12 12:44:22'),
(799, NULL, 'tess harga beli 4 kalii', 7, 5, 'pcs', 15000.00, 18000.00, NULL, 15, NULL, 1, '2025-11-12 12:46:51', '2025-11-12 12:46:51'),
(800, NULL, 'tess harga beli 4 kalii', 7, 5, 'pcs', 15000.00, 18000.00, NULL, 15, NULL, 1, '2025-11-12 12:50:21', '2025-11-12 12:50:21'),
(801, NULL, 'tess harga beli 4 kalii', 7, 5, 'pcs', 15000.00, 18000.00, NULL, 15, NULL, 1, '2025-11-12 12:50:26', '2025-11-12 12:50:26'),
(802, NULL, 'tess harga beli 4 kalii', 7, 5, 'pcs', 15000.00, 18000.00, NULL, 15, NULL, 1, '2025-11-12 12:50:53', '2025-11-12 12:50:53'),
(803, NULL, 'tess harga beli 6 kalii', 13, 5, 'pcs', 12300.00, 15000.00, NULL, 13, NULL, 1, '2025-11-12 12:51:45', '2025-11-12 12:51:45'),
(804, NULL, 'tess harga beli 8 kalii', 10, 5, 'pcs', 18000.00, 12000.00, NULL, 14, NULL, 1, '2025-11-12 12:57:20', '2025-11-12 12:57:20');

--
-- Trigger `barang`
--
DELIMITER $$
CREATE TRIGGER `tr_after_update_barang_harga` AFTER UPDATE ON `barang` FOR EACH ROW BEGIN
  IF OLD.harga_beli != NEW.harga_beli OR OLD.harga_jual != NEW.harga_jual THEN
    INSERT INTO log_perubahan_harga (
      barang_id, 
      harga_beli_lama, harga_beli_baru,
      harga_jual_lama, harga_jual_baru,
      users_id
    ) VALUES (
      NEW.id,
      OLD.harga_beli, NEW.harga_beli,
      OLD.harga_jual, NEW.harga_jual,
      NEW.users_id
    );
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_before_update_barang_stok` BEFORE UPDATE ON `barang` FOR EACH ROW BEGIN
  IF NEW.jumlah_stok < 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Error: Stok tidak boleh negatif!';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL COMMENT 'Snapshot nama barang saat transaksi',
  `jumlah` int(11) NOT NULL,
  `harga_satuan` decimal(15,2) NOT NULL COMMENT 'Harga per unit saat transaksi',
  `subtotal` decimal(15,2) NOT NULL COMMENT 'jumlah × harga_satuan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `transaksi_id`, `barang_id`, `nama_barang`, `jumlah`, `harga_satuan`, `subtotal`, `created_at`) VALUES
(1, 1, 1, 'Ban Motor IRC 90/90-14', 10, 200000.00, 2000000.00, '2025-11-02 15:44:54'),
(2, 2, 1, 'Ban Motor IRC 90/90-14', 2, 250000.00, 500000.00, '2025-11-02 15:44:54'),
(3, 3, 4, 'Kampas Rem Bendix Set', 1, 75000.00, 75000.00, '2025-11-03 17:43:34'),
(4, 3, 786, 'Bearing Roda Belakang Honda Beat', 1, 92000.00, 92000.00, '2025-11-03 17:43:34'),
(5, 5, 788, 'Bearing Roda Belakang Yamaha Mio', 1, 85000.00, 85000.00, '2025-11-04 10:45:20'),
(6, 5, 786, 'Bearing Roda Belakang Honda Beat', 1, 92000.00, 92000.00, '2025-11-04 10:45:21'),
(7, 6, 785, 'Bearing Roda Depan Honda Beat', 1, 82000.00, 82000.00, '2025-11-06 08:38:45'),
(8, 6, 780, 'Seher Yamaha Mio STD Original', 1, 170000.00, 170000.00, '2025-11-06 08:38:45'),
(9, 7, 786, 'Bearing Roda Belakang Honda Beat', 2, 92000.00, 184000.00, '2025-11-10 13:31:09'),
(10, 7, 608, 'Shock Daytona 310mm Matic Sport', 1, 635000.00, 635000.00, '2025-11-10 13:31:09'),
(11, 9, 788, 'Bearing Roda Belakang Yamaha Mio', 1, 85000.00, 85000.00, '2025-11-10 13:42:02'),
(12, 9, 537, 'Gear Set KTC 428 CB150/Vixion', 1, 335000.00, 335000.00, '2025-11-10 13:42:02'),
(13, 10, 788, 'Bearing Roda Belakang Yamaha Mio', 1, 85000.00, 85000.00, '2025-11-10 13:50:18'),
(14, 10, 447, 'Shell Spirax S2 A 90 Oli Gardan 1L', 1, 68000.00, 68000.00, '2025-11-10 13:50:18'),
(15, 11, 788, 'Bearing Roda Belakang Yamaha Mio', 1, 85000.00, 85000.00, '2025-11-10 14:16:59'),
(16, 11, 446, 'Pertamina SAE 90 Oli Gardan 1L', 1, 46000.00, 46000.00, '2025-11-10 14:16:59'),
(17, 12, 788, 'Bearing Roda Belakang Yamaha Mio', 1, 85000.00, 85000.00, '2025-11-10 14:34:07'),
(18, 13, 779, 'Seher Honda Beat STD Original', 1, 180000.00, 180000.00, '2025-11-10 14:35:56'),
(19, 14, 740, 'Filter Udara Racing K&N Universal', 1, 535000.00, 535000.00, '2025-11-10 14:38:20'),
(20, 15, 780, 'Seher Yamaha Mio STD Original', 1, 170000.00, 170000.00, '2025-11-10 14:41:15'),
(21, 16, 780, 'Seher Yamaha Mio STD Original', 1, 170000.00, 170000.00, '2025-11-10 14:42:19'),
(22, 17, 783, 'Bearing Kruk As Honda Beat Original', 1, 265000.00, 265000.00, '2025-11-10 14:46:55'),
(23, 18, 787, 'Bearing Roda Depan Yamaha Mio', 1, 78000.00, 78000.00, '2025-11-10 14:50:32'),
(24, 18, 759, 'Klem Selang Bensin Set Isi 10pcs', 1, 13000.00, 13000.00, '2025-11-10 14:50:32'),
(25, 18, 455, 'Federal Gear Oil 4L Ekonomis', 1, 178000.00, 178000.00, '2025-11-10 14:50:32'),
(26, 19, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-10 19:06:06'),
(27, 19, 453, 'Pertamina SAE 90 Oli Gardan 4L', 1, 165000.00, 165000.00, '2025-11-10 19:06:06'),
(28, 20, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-12 11:10:27'),
(29, 20, 452, 'Federal Gear Oil SAE 140 1L', 1, 54000.00, 54000.00, '2025-11-12 11:10:27'),
(30, 21, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-12 11:22:01'),
(31, 22, 512, 'Busi Denso IU22 Iridium Power', 1, 50000.00, 50000.00, '2025-11-12 13:26:37'),
(32, 22, 573, 'CDI BRT Hyperband Supra/Revo', 1, 440000.00, 440000.00, '2025-11-12 13:26:37'),
(33, 22, 469, 'Aki Incoe GTZ5S Kering MF', 1, 168000.00, 168000.00, '2025-11-12 13:26:37'),
(34, 22, 565, 'Lampu Stop LED Racing TDR', 1, 120000.00, 120000.00, '2025-11-12 13:26:37'),
(35, 23, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-12 14:51:30'),
(36, 24, 461, 'Aki Bosch RBTZ-6S 12V 5Ah MF', 1, 215000.00, 215000.00, '2025-11-12 15:02:47'),
(37, 25, 666, 'Busa Jok Beat/Vario', 1, 82000.00, 82000.00, '2025-11-12 15:10:27'),
(38, 26, 469, 'Aki Incoe GTZ5S Kering MF', 1, 168000.00, 168000.00, '2025-11-12 15:19:37'),
(39, 27, 665, 'Cover Jok Mio/Soul Sporty', 1, 60000.00, 60000.00, '2025-11-12 15:33:06'),
(40, 28, 468, 'Aki Aspira GTZ6V Maintenance Free', 1, 205000.00, 205000.00, '2025-11-12 15:34:47'),
(41, 29, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 185000.00, 185000.00, '2025-11-12 15:35:33'),
(42, 30, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 185000.00, 185000.00, '2025-11-12 15:52:08'),
(43, 31, 468, 'Aki Aspira GTZ6V Maintenance Free', 1, 205000.00, 205000.00, '2025-11-12 17:49:51'),
(44, 32, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 185000.00, 185000.00, '2025-11-12 17:57:07'),
(45, 33, 462, 'Aki Bosch RBTZ-7S 12V 6Ah MF', 1, 238000.00, 238000.00, '2025-11-12 18:09:41'),
(46, 34, 461, 'Aki Bosch RBTZ-6S 12V 5Ah MF', 1, 215000.00, 215000.00, '2025-11-12 18:10:14'),
(47, 35, 462, 'Aki Bosch RBTZ-7S 12V 6Ah MF', 1, 238000.00, 238000.00, '2025-11-12 18:22:07'),
(48, 36, 456, 'Aki GS Astra GTZ5S 12V 3.5Ah MF', 1, 190000.00, 190000.00, '2025-11-12 18:23:00'),
(49, 37, 470, 'Aki GS Astra GM5Z-3B Basah Konvensional', 1, 140000.00, 140000.00, '2025-11-13 01:20:38'),
(50, 38, 456, 'Aki GS Astra GTZ5S 12V 3.5Ah MF', 2, 190000.00, 380000.00, '2025-11-13 02:55:49'),
(51, 40, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-17 06:53:01'),
(52, 41, 468, 'Aki Aspira GTZ6V Maintenance Free', 1, 205000.00, 205000.00, '2025-11-17 06:53:28'),
(53, 42, 467, 'Aki Aspira GTZ5S Maintenance Free', 1, 175000.00, 175000.00, '2025-11-17 07:36:03'),
(54, 43, 468, 'Aki Aspira GTZ6V Maintenance Free', 3, 205000.00, 615000.00, '2025-11-17 07:40:50'),
(55, 44, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 135000.00, 135000.00, '2025-11-17 08:10:44'),
(56, 45, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 2, 135000.00, 270000.00, '2025-11-17 08:11:02'),
(57, 46, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 50, 135000.00, 6750000.00, '2025-11-17 08:18:57'),
(58, 47, 0, 'tes aki', 50, 1000.00, 50000.00, '2025-11-18 05:04:01'),
(59, 48, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 185000.00, 185000.00, '2025-11-18 12:22:37'),
(60, 49, 459, 'Aki GS Astra GTZ10V 12V 8.6Ah MF', 4, 245000.00, 980000.00, '2025-11-18 12:23:13');

--
-- Trigger `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `tr_after_delete_detail_transaksi` AFTER DELETE ON `detail_transaksi` FOR EACH ROW BEGIN
  DECLARE v_tipe VARCHAR(10);
  
  -- Ambil tipe transaksi
  SELECT tipe_transaksi INTO v_tipe 
  FROM transaksi 
  WHERE id = OLD.transaksi_id;
  
  -- Kembalikan stok barang
  IF v_tipe = 'masuk' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok - OLD.jumlah 
    WHERE id = OLD.barang_id;
  ELSEIF v_tipe = 'keluar' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok + OLD.jumlah 
    WHERE id = OLD.barang_id;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_after_insert_detail_transaksi` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
  DECLARE v_tipe VARCHAR(10);
  
  SELECT tipe_transaksi INTO v_tipe 
  FROM transaksi 
  WHERE id = NEW.transaksi_id;
  
  IF v_tipe = 'masuk' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok + NEW.jumlah 
    WHERE id = NEW.barang_id;
  ELSEIF v_tipe = 'keluar' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok - NEW.jumlah 
    WHERE id = NEW.barang_id;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_after_update_detail_transaksi` AFTER UPDATE ON `detail_transaksi` FOR EACH ROW BEGIN
  DECLARE v_tipe VARCHAR(10);
  DECLARE v_selisih INT;
  
  -- Hitung selisih jumlah
  SET v_selisih = NEW.jumlah - OLD.jumlah;
  
  -- Ambil tipe transaksi
  SELECT tipe_transaksi INTO v_tipe 
  FROM transaksi 
  WHERE id = NEW.transaksi_id;
  
  -- Update stok barang berdasarkan selisih
  IF v_tipe = 'masuk' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok + v_selisih 
    WHERE id = NEW.barang_id;
  ELSEIF v_tipe = 'keluar' THEN
    UPDATE barang 
    SET jumlah_stok = jumlah_stok - v_selisih 
    WHERE id = NEW.barang_id;
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kas`
--

CREATE TABLE `kas` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `jenis` enum('masuk','keluar') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `jumlah` decimal(15,2) NOT NULL DEFAULT 0.00,
  `users_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kas`
--

INSERT INTO `kas` (`id`, `tanggal`, `jenis`, `keterangan`, `jumlah`, `users_id`, `created_at`) VALUES
(1, '2025-11-06 15:38:45', 'masuk', 'Penjualan Barang - ', 252000.00, 1, '2025-11-06 08:38:45'),
(2, '2025-11-10 20:31:09', 'masuk', 'Penjualan Barang - ', 819000.00, 1, '2025-11-10 13:31:09'),
(3, '2025-11-10 20:31:27', 'masuk', 'Penjualan Barang - ', 0.00, 1, '2025-11-10 13:31:27'),
(4, '2025-11-10 20:42:02', 'masuk', 'Penjualan Barang - ', 420000.00, 1, '2025-11-10 13:42:02'),
(5, '2025-11-10 20:50:18', 'masuk', 'Penjualan Barang - ', 153000.00, 1, '2025-11-10 13:50:18'),
(6, '2025-11-10 21:16:59', 'masuk', 'Penjualan Barang - ', 131000.00, 1, '2025-11-10 14:16:59'),
(7, '2025-11-10 21:34:07', 'masuk', 'Penjualan Barang - ', 85000.00, 1, '2025-11-10 14:34:07'),
(8, '2025-11-10 21:35:56', 'masuk', 'Penjualan Barang - ', 180000.00, 1, '2025-11-10 14:35:56'),
(9, '2025-11-10 21:38:20', 'masuk', 'Penjualan Barang - ', 535000.00, 1, '2025-11-10 14:38:20'),
(10, '2025-11-10 21:41:15', 'masuk', 'Penjualan Barang - ', 170000.00, 1, '2025-11-10 14:41:15'),
(11, '2025-11-10 21:42:19', 'masuk', 'Penjualan Barang - ', 170000.00, 1, '2025-11-10 14:42:19'),
(12, '2025-11-10 21:46:55', 'masuk', 'Penjualan Barang - ', 265000.00, 1, '2025-11-10 14:46:55'),
(13, '2025-11-10 21:50:32', 'masuk', 'Penjualan Barang - ', 269000.00, 1, '2025-11-10 14:50:32'),
(14, '2025-11-11 02:06:06', 'masuk', 'Penjualan Barang - ', 340000.00, 1, '2025-11-10 19:06:06'),
(15, '2025-11-12 18:10:27', 'masuk', 'Penjualan Barang - ', 229000.00, 1, '2025-11-12 11:10:27'),
(16, '2025-11-12 18:22:01', 'masuk', 'Penjualan Barang - ', 175000.00, 1, '2025-11-12 11:22:01'),
(17, '2025-11-12 19:11:07', 'keluar', 'Pembelian barang baru: tess harga beli', 50000.00, 1, '2025-11-12 12:11:07'),
(18, '2025-11-12 19:19:48', 'keluar', 'Pembelian barang baru: tess harga beli', 50000.00, 1, '2025-11-12 12:19:48'),
(19, '2025-11-12 19:31:35', 'keluar', 'Pembelian Barang - tess harga beliiiii', 121000.00, 1, '2025-11-12 12:31:35'),
(20, '2025-11-12 19:31:35', 'keluar', 'Pembelian barang baru: tess harga beliiiii', 121000.00, 1, '2025-11-12 12:31:35'),
(21, '2025-11-12 19:36:24', 'keluar', 'Pembelian Barang - tess harga beli 2 kalii', 180000.00, 1, '2025-11-12 12:36:24'),
(22, '2025-11-12 19:36:24', 'keluar', 'Pembelian barang baru: tess harga beli 2 kalii', 180000.00, 1, '2025-11-12 12:36:24'),
(23, '2025-11-12 19:44:22', 'keluar', 'Pembelian Barang - tess harga beli 3 kalii', 84000.00, 1, '2025-11-12 12:44:22'),
(24, '2025-11-12 19:44:22', 'keluar', 'Pembelian barang baru: tess harga beli 3 kalii', 84000.00, 1, '2025-11-12 12:44:22'),
(25, '2025-11-12 19:46:51', 'keluar', 'Pembelian Barang - tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:46:51'),
(26, '2025-11-12 19:50:21', 'keluar', 'Pembelian Barang - tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:21'),
(27, '2025-11-12 19:50:21', 'keluar', 'Pembelian barang baru: tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:21'),
(28, '2025-11-12 19:50:26', 'keluar', 'Pembelian Barang - tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:26'),
(29, '2025-11-12 19:50:26', 'keluar', 'Pembelian barang baru: tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:26'),
(30, '2025-11-12 19:50:53', 'keluar', 'Pembelian Barang - tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:53'),
(31, '2025-11-12 19:50:53', 'keluar', 'Pembelian barang baru: tess harga beli 4 kalii', 105000.00, 1, '2025-11-12 12:50:53'),
(32, '2025-11-12 19:51:45', 'keluar', 'Pembelian Barang - tess harga beli 6 kalii', 159900.00, 1, '2025-11-12 12:51:45'),
(33, '2025-11-12 19:51:45', 'keluar', 'Pembelian barang baru: tess harga beli 6 kalii', 159900.00, 1, '2025-11-12 12:51:45'),
(34, '2025-11-12 19:57:20', 'keluar', 'Pembelian Barang - tess harga beli 8 kalii', 180000.00, 1, '2025-11-12 12:57:20'),
(35, '2025-11-12 20:26:37', 'masuk', 'Penjualan Barang - ', 778000.00, 1, '2025-11-12 13:26:37'),
(36, '2025-11-12 21:51:30', 'masuk', 'Penjualan Barang - ', 175000.00, 1, '2025-11-12 14:51:30'),
(37, '2025-11-12 22:02:47', 'masuk', 'Penjualan Barang - ', 215000.00, 1, '2025-11-12 15:02:47'),
(38, '2025-11-12 22:10:27', 'masuk', 'Penjualan Barang - TRX-20251112-00025', 82000.00, 1, '2025-11-12 15:10:27'),
(39, '2025-11-12 22:19:37', 'masuk', 'Penjualan Barang - TRX-20251112-00026', 168000.00, 1, '2025-11-12 15:19:37'),
(40, '2025-11-12 22:33:06', 'masuk', 'Penjualan Barang - TRX-20251112-00027', 60000.00, 1, '2025-11-12 15:33:06'),
(41, '2025-11-12 22:34:47', 'masuk', 'Penjualan Barang - TRX-20251112-00028', 205000.00, 1, '2025-11-12 15:34:47'),
(42, '2025-11-12 22:35:33', 'masuk', 'Penjualan Barang - TRX-20251112-00029', 185000.00, 1, '2025-11-12 15:35:33'),
(43, '2025-11-12 22:52:08', 'masuk', 'Penjualan Barang - TRX-20251112-00030', 185000.00, 1, '2025-11-12 15:52:08'),
(44, '2025-11-13 00:49:51', 'masuk', 'Penjualan Barang - TRX-20251112-00031', 205000.00, 1, '2025-11-12 17:49:51'),
(45, '2025-11-13 00:57:07', 'masuk', 'Penjualan Barang - TRX-20251112-00032', 185000.00, 1, '2025-11-12 17:57:07'),
(46, '2025-11-13 01:09:41', 'masuk', 'Penjualan Barang - TRX-20251112-00033', 238000.00, 1, '2025-11-12 18:09:41'),
(47, '2025-11-13 01:10:14', 'masuk', 'Penjualan Barang - TRX-20251112-00034', 215000.00, 1, '2025-11-12 18:10:14'),
(48, '2025-11-13 01:22:07', 'masuk', 'Penjualan Barang - TRX-20251112-00035', 238000.00, 1, '2025-11-12 18:22:07'),
(49, '2025-11-13 01:23:00', 'masuk', 'Penjualan Barang - TRX-20251112-00036', 190000.00, 1, '2025-11-12 18:23:00'),
(50, '2025-11-13 08:20:38', 'masuk', 'Penjualan Barang - TRX-20251113-00037', 140000.00, 1, '2025-11-13 01:20:38'),
(51, '2025-11-13 09:55:49', 'masuk', 'Penjualan Barang - TRX-20251113-00038', 380000.00, 1, '2025-11-13 02:55:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `catatan` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`, `catatan`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ban Motor', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(2, 'Oli Mesin', 'Oli Motor', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(3, 'Aki', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(4, 'Kampas Rem', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(5, 'Busi', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(6, 'Rantai/Gear/Vbelt', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(7, 'Aksesoris', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(8, 'Spare Part', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(9, 'Oli Gardan', 'Oli Motor', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(10, 'Lampu Motor', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(11, 'Lainnya', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(12, 'Kelistrikan', 'Komponen sistem listrik: CDI, koil, sekring, kabel', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(13, 'Suspensi', 'Shock, spring, peredam', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(14, 'Kopling & Transmisi', 'Kampas kopling, per kopling, gear', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(15, 'Filter', 'Filter udara, filter oli, saringan', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(16, 'Body Part', 'Spion, cover, fairing, jok', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(17, 'Aksesoris Racing', 'Performa & aksesoris aftermarket', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(18, 'Karburator & Fuel System', 'Karburator, injektor, selang bahan bakar', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(19, 'Mesin (komponen)', 'Piston, ring, seal, bearing', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_perubahan_harga`
--

CREATE TABLE `log_perubahan_harga` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `harga_beli_lama` decimal(15,2) DEFAULT NULL,
  `harga_beli_baru` decimal(15,2) DEFAULT NULL,
  `harga_jual_lama` decimal(15,2) DEFAULT NULL,
  `harga_jual_baru` decimal(15,2) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `merk`
--

CREATE TABLE `merk` (
  `id` int(11) NOT NULL,
  `nama_merk` varchar(100) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `merk`
--

INSERT INTO `merk` (`id`, `nama_merk`, `logo`, `catatan`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'IRC', 'http://localhost:1023/Logo/irc.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(2, 'Michelin', 'http://localhost:1023/Logo/michelin.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(3, 'Dunlop', 'http://localhost:1023/Logo/dunlop.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(4, 'FDR', 'http://localhost:1023/Logo/fdr.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(5, 'Pertamina Enduro', 'http://localhost:1023/Logo/pertamina_enduro.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(6, 'Shell', 'http://localhost:1023/Logo/shell.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(7, 'Castrol', 'http://localhost:1023/Logo/castrol.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(8, 'Federal Oil', 'http://localhost:1023/Logo/federal_oil.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(9, 'Top 1', 'http://localhost:1023/Logo/top_1.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(10, 'GS Astra', 'http://localhost:1023/Logo/gs_astra.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(11, 'Bosch', 'http://localhost:1023/Logo/bosch.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(12, 'TDR', 'http://localhost:1023/Logo/tdr.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(13, 'Daytona', 'http://localhost:1023/Logo/daytona.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(14, 'NGK', 'http://localhost:1023/Logo/ngk.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(15, 'Brisk', 'http://localhost:1023/Logo/brisk.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(16, 'KTC (Kawahara)', 'http://localhost:1023/Logo/ktc_kawahara.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(17, 'YSS', 'http://localhost:1023/Logo/yss.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(18, 'Kitaco', 'http://localhost:1023/Logo/kitaco.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(19, 'Lainnya', 'http://localhost:1023/Logo/lainnya.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(20, 'Yamaha Genuine Parts', 'http://localhost:1023/Logo/yamaha_genuine_parts.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(21, 'Honda Genuine Parts', 'http://localhost:1023/Logo/honda_genuine_parts.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(22, 'RCB', 'http://localhost:1023/Logo/rcb.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(23, 'UMA Racing', 'http://localhost:1023/Logo/uma_racing.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(24, 'BRT', 'http://localhost:1023/Logo/brt.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(25, 'KYB', 'http://localhost:1023/Logo/kyb.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(26, 'Denso', 'http://localhost:1023/Logo/denso.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(27, 'AKS', 'http://localhost:1023/Logo/aks.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(28, 'NHK', 'http://localhost:1023/Logo/nhk.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(29, 'Sakura', 'http://localhost:1023/Logo/sakura.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(30, 'Kawasaki Genuine', 'http://localhost:1023/Logo/kawasaki_genuine.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(31, 'Suzuki Genuine', 'http://localhost:1023/Logo/suzuki_genuine.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(32, 'MioParts', 'http://localhost:1023/Logo/mioparts.jpg', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_stok`
--

CREATE TABLE `riwayat_stok` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tipe` enum('masuk','keluar') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_stok`
--

INSERT INTO `riwayat_stok` (`id`, `barang_id`, `nama_barang`, `jumlah`, `tipe`, `keterangan`, `tanggal`) VALUES
(1, 794, 'tess harga beli', 5, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:19:48'),
(2, 796, 'tess harga beliiiii', 11, 'masuk', 'Pembelian barang baru (Kategori ID: 19)', '2025-11-12 19:31:35'),
(3, 796, 'tess harga beliiiii', 11, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:31:35'),
(4, 797, 'tess harga beli 2 kalii', 15, 'masuk', 'Pembelian barang baru (Kategori ID: 19)', '2025-11-12 19:36:24'),
(5, 797, 'tess harga beli 2 kalii', 15, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:36:24'),
(6, 798, 'tess harga beli 3 kalii', 6, 'masuk', 'Pembelian barang baru (Kategori ID: 18)', '2025-11-12 19:44:22'),
(7, 798, 'tess harga beli 3 kalii', 6, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:44:22'),
(9, 800, 'tess harga beli 4 kalii', 7, 'masuk', 'Stok masuk dari pembelian barang baru (Kategori ID: 15)', '2025-11-12 19:50:21'),
(11, 801, 'tess harga beli 4 kalii', 7, 'masuk', 'Stok masuk dari pembelian barang baru (Kategori ID: 15)', '2025-11-12 19:50:26'),
(13, 802, 'tess harga beli 4 kalii', 7, 'masuk', 'Stok masuk dari pembelian barang baru (Kategori ID: 15)', '2025-11-12 19:50:53'),
(14, 799, 'tess harga beli 4 kalii', 7, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:50:53'),
(15, 803, 'tess harga beli 6 kalii', 13, 'masuk', 'Stok masuk dari pembelian barang baru (Kategori ID: 13)', '2025-11-12 19:51:45'),
(16, 803, 'tess harga beli 6 kalii', 13, 'masuk', 'Stok masuk dari pembelian barang baru', '2025-11-12 19:51:45'),
(17, 804, 'tess harga beli 8 kalii', 10, 'masuk', 'Stok masuk dari pembelian barang baru (Kategori ID: 14)', '2025-11-12 19:57:20'),
(18, 666, 'Busa Jok Beat/Vario', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00025)', '2025-11-12 22:10:27'),
(19, 469, 'Aki Incoe GTZ5S Kering MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00026)', '2025-11-12 22:19:37'),
(20, 665, 'Cover Jok Mio/Soul Sporty', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00027)', '2025-11-12 22:33:06'),
(21, 468, 'Aki Aspira GTZ6V Maintenance Free', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00028)', '2025-11-12 22:34:47'),
(22, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00029)', '2025-11-12 22:35:33'),
(23, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00030)', '2025-11-12 22:52:08'),
(24, 468, 'Aki Aspira GTZ6V Maintenance Free', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00031)', '2025-11-13 00:49:51'),
(25, 460, 'Aki Bosch RBTZ-5S 12V 3.5Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00032)', '2025-11-13 00:57:07'),
(26, 462, 'Aki Bosch RBTZ-7S 12V 6Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00033)', '2025-11-13 01:09:41'),
(27, 461, 'Aki Bosch RBTZ-6S 12V 5Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00034)', '2025-11-13 01:10:14'),
(28, 462, 'Aki Bosch RBTZ-7S 12V 6Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00035)', '2025-11-13 01:22:07'),
(29, 456, 'Aki GS Astra GTZ5S 12V 3.5Ah MF', 1, 'keluar', 'Transaksi Penjualan (TRX-20251112-00036)', '2025-11-13 01:23:00'),
(30, 470, 'Aki GS Astra GM5Z-3B Basah Konvensional', 1, 'keluar', 'Transaksi Penjualan (TRX-20251113-00037)', '2025-11-13 08:20:38'),
(31, 456, 'Aki GS Astra GTZ5S 12V 3.5Ah MF', 2, 'keluar', 'Transaksi Penjualan (TRX-20251113-00038)', '2025-11-13 09:55:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL COMMENT 'Format: TRX-YYYYMMDD-XXXXX',
  `tanggal_transaksi` datetime NOT NULL,
  `tipe_transaksi` enum('masuk','keluar') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `total_nilai` decimal(15,2) NOT NULL DEFAULT 0.00,
  `users_id` int(11) NOT NULL COMMENT 'User yang melakukan transaksi',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_transaksi`, `tanggal_transaksi`, `tipe_transaksi`, `keterangan`, `total_nilai`, `users_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'TRX-20251102-00001', '2025-11-02 09:00:00', 'masuk', 'Pembelian stok awal', 2000000.00, 1, 0, '2025-11-02 15:44:54', '2025-11-02 15:44:54'),
(2, 'TRX-20251102-00002', '2025-11-02 10:30:00', 'keluar', 'Penjualan ke pelanggan', 500000.00, 2, 0, '2025-11-02 15:44:54', '2025-11-02 15:44:54'),
(3, '9e97536f-b8dc-11f0-afa9-047c1631ddfe', '2025-11-04 00:43:34', 'keluar', '', 167000.00, 1, 0, '2025-11-03 17:43:34', '2025-11-03 17:43:34'),
(5, '5c50b864-b96b-11f0-a1bc-047c1631ddfe', '2025-11-04 17:45:20', 'keluar', '', 177000.00, 1, 0, '2025-11-04 10:45:20', '2025-11-04 10:45:20'),
(6, 'TRX-20251106-00006', '2025-11-06 15:38:45', 'keluar', '', 252000.00, 1, 0, '2025-11-06 08:38:45', '2025-11-06 08:38:45'),
(7, 'TRX-20251110-00007', '2025-11-10 20:31:09', 'keluar', '', 819000.00, 1, 0, '2025-11-10 13:31:09', '2025-11-10 13:31:09'),
(8, 'TRX-20251110-00008', '2025-11-10 20:31:27', 'keluar', '', 0.00, 1, 0, '2025-11-10 13:31:27', '2025-11-10 13:31:27'),
(9, 'TRX-20251110-00009', '2025-11-10 20:42:02', 'keluar', '', 420000.00, 1, 0, '2025-11-10 13:42:02', '2025-11-10 13:42:02'),
(10, 'TRX-20251110-00010', '2025-11-10 20:50:18', 'keluar', '', 153000.00, 1, 0, '2025-11-10 13:50:18', '2025-11-10 13:50:18'),
(11, 'TRX-20251110-00011', '2025-11-10 21:16:59', 'keluar', '', 131000.00, 1, 0, '2025-11-10 14:16:59', '2025-11-10 14:16:59'),
(12, 'TRX-20251110-00012', '2025-11-10 21:34:07', 'keluar', '', 85000.00, 1, 0, '2025-11-10 14:34:07', '2025-11-10 14:34:07'),
(13, 'TRX-20251110-00013', '2025-11-10 21:35:56', 'keluar', '', 180000.00, 1, 0, '2025-11-10 14:35:56', '2025-11-10 14:35:56'),
(14, 'TRX-20251110-00014', '2025-11-10 21:38:20', 'keluar', '', 535000.00, 1, 0, '2025-11-10 14:38:20', '2025-11-10 14:38:20'),
(15, 'TRX-20251110-00015', '2025-11-10 21:41:15', 'keluar', '', 170000.00, 1, 0, '2025-11-10 14:41:15', '2025-11-10 14:41:15'),
(16, 'TRX-20251110-00016', '2025-11-10 21:42:19', 'keluar', '', 170000.00, 1, 0, '2025-11-10 14:42:19', '2025-11-10 14:42:19'),
(17, 'TRX-20251110-00017', '2025-11-10 21:46:55', 'keluar', '', 265000.00, 1, 0, '2025-11-10 14:46:55', '2025-11-10 14:46:55'),
(18, 'TRX-20251110-00018', '2025-11-10 21:50:32', 'keluar', '', 269000.00, 1, 0, '2025-11-10 14:50:32', '2025-11-10 14:50:32'),
(19, 'TRX-20251110-00019', '2025-11-11 02:06:06', 'keluar', '', 340000.00, 1, 0, '2025-11-10 19:06:06', '2025-11-10 19:06:06'),
(20, 'TRX-20251112-00020', '2025-11-12 18:10:27', 'keluar', '', 229000.00, 1, 0, '2025-11-12 11:10:27', '2025-11-12 11:10:27'),
(21, 'TRX-20251112-00021', '2025-11-12 18:22:01', 'keluar', '', 175000.00, 1, 0, '2025-11-12 11:22:01', '2025-11-12 11:22:01'),
(22, 'TRX-20251112-00022', '2025-11-12 20:26:37', 'keluar', '', 778000.00, 1, 0, '2025-11-12 13:26:37', '2025-11-12 13:26:37'),
(23, 'TRX-20251112-00023', '2025-11-12 21:51:30', 'keluar', '', 175000.00, 1, 0, '2025-11-12 14:51:30', '2025-11-12 14:51:30'),
(24, 'TRX-20251112-00024', '2025-11-12 22:02:47', 'keluar', '', 215000.00, 1, 0, '2025-11-12 15:02:47', '2025-11-12 15:02:47'),
(25, 'TRX-20251112-00025', '2025-11-12 22:10:27', 'keluar', '', 82000.00, 1, 0, '2025-11-12 15:10:27', '2025-11-12 15:10:27'),
(26, 'TRX-20251112-00026', '2025-11-12 22:19:37', 'keluar', '', 168000.00, 1, 0, '2025-11-12 15:19:37', '2025-11-12 15:19:37'),
(27, 'TRX-20251112-00027', '2025-11-12 22:33:06', 'keluar', '', 60000.00, 1, 0, '2025-11-12 15:33:06', '2025-11-12 15:33:06'),
(28, 'TRX-20251112-00028', '2025-11-12 22:34:47', 'keluar', '', 205000.00, 1, 0, '2025-11-12 15:34:47', '2025-11-12 15:34:47'),
(29, 'TRX-20251112-00029', '2025-11-12 22:35:33', 'keluar', '', 185000.00, 1, 0, '2025-11-12 15:35:33', '2025-11-12 15:35:33'),
(30, 'TRX-20251112-00030', '2025-11-12 22:52:08', 'keluar', '', 185000.00, 1, 0, '2025-11-12 15:52:08', '2025-11-12 15:52:08'),
(31, 'TRX-20251112-00031', '2025-11-13 00:49:51', 'keluar', '', 205000.00, 1, 0, '2025-11-12 17:49:51', '2025-11-12 17:49:51'),
(32, 'TRX-20251112-00032', '2025-11-13 00:57:07', 'keluar', '', 185000.00, 1, 0, '2025-11-12 17:57:07', '2025-11-12 17:57:07'),
(33, 'TRX-20251112-00033', '2025-11-13 01:09:41', 'keluar', '', 238000.00, 1, 0, '2025-11-12 18:09:41', '2025-11-12 18:09:41'),
(34, 'TRX-20251112-00034', '2025-11-13 01:10:14', 'keluar', '', 215000.00, 1, 0, '2025-11-12 18:10:14', '2025-11-12 18:10:14'),
(35, 'TRX-20251112-00035', '2025-11-13 01:22:07', 'keluar', '', 238000.00, 1, 0, '2025-11-12 18:22:07', '2025-11-12 18:22:07'),
(36, 'TRX-20251112-00036', '2025-11-13 01:23:00', 'keluar', '', 190000.00, 1, 0, '2025-11-12 18:23:00', '2025-11-12 18:23:00'),
(37, 'TRX-20251113-00037', '2025-11-13 08:20:38', 'keluar', '', 140000.00, 1, 0, '2025-11-13 01:20:38', '2025-11-13 01:20:38'),
(38, 'TRX-20251113-00038', '2025-11-13 09:55:49', 'keluar', '', 380000.00, 1, 0, '2025-11-13 02:55:49', '2025-11-13 02:55:49'),
(40, 'TRX-20251117-065301-0', '2025-11-17 06:53:01', 'keluar', 'Penjualan POS', 175000.00, 0, 0, '2025-11-16 23:53:01', '2025-11-16 23:53:01'),
(41, 'TRX-20251117-065328-0', '2025-11-17 06:53:28', 'keluar', 'Penjualan POS', 205000.00, 0, 0, '2025-11-16 23:53:28', '2025-11-16 23:53:28'),
(42, 'TRX-20251117-073603-0', '2025-11-17 07:36:03', 'keluar', 'Penjualan POS', 175000.00, 0, 0, '2025-11-17 00:36:03', '2025-11-17 00:36:03'),
(43, 'TRX-20251117-074050-0', '2025-11-17 07:40:50', 'keluar', 'Penjualan POS', 615000.00, 0, 0, '2025-11-17 00:40:50', '2025-11-17 00:40:50'),
(44, 'PEMBELIAN-20251117-081044-0', '2025-11-17 08:10:44', 'masuk', 'Pembelian Stok (Barang Masuk)', 135000.00, 0, 0, '2025-11-17 01:10:44', '2025-11-17 01:10:44'),
(45, 'PEMBELIAN-20251117-081102-0', '2025-11-17 08:11:02', 'masuk', 'Pembelian Stok (Barang Masuk)', 270000.00, 0, 0, '2025-11-17 01:11:02', '2025-11-17 01:11:02'),
(46, 'PEMBELIAN-20251117-081857-0', '2025-11-17 08:18:57', 'masuk', 'Pembelian Stok (Barang Masuk)', 6750000.00, 0, 0, '2025-11-17 01:18:57', '2025-11-17 01:18:57'),
(47, 'PEMBELIAN-20251118-050401-0', '2025-11-18 05:04:01', 'masuk', 'Pembelian Stok (Barang Masuk)', 50000.00, 0, 0, '2025-11-17 22:04:01', '2025-11-17 22:04:01'),
(48, 'TRX-20251118-122236-0', '2025-11-18 12:22:36', 'keluar', 'Penjualan POS', 185000.00, 0, 0, '2025-11-18 05:22:36', '2025-11-18 05:22:36'),
(49, 'PEMBELIAN-20251118-122313-0', '2025-11-18 12:23:13', 'masuk', 'Pembelian Stok (Barang Masuk)', 980000.00, 0, 0, '2025-11-18 05:23:13', '2025-11-18 05:23:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukuran`
--

CREATE TABLE `ukuran` (
  `id` int(11) NOT NULL,
  `nama_ukuran` varchar(100) NOT NULL,
  `catatan` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ukuran`
--

INSERT INTO `ukuran` (`id`, `nama_ukuran`, `catatan`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Lainnya', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(2, 'Universal', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(3, '-', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(4, '90/90-14', 'untuk ban motor', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(5, '1 Liter', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(6, '2 Liter', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(7, '+3 Liter', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(8, 'Standard', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(9, '5W-30', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(10, '10W-40', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(11, '140/70-17', 'ban belakang umum', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(12, '12V', 'aki 12V', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(13, '150cc', 'kapasitas mesin', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(14, '0.5 Liter', '', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(15, '17', 'velg 17 inch', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT '',
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL COMMENT 'Gunakan bcrypt/argon2, bukan MD5!',
  `gender` enum('L','P') NOT NULL DEFAULT 'L',
  `role` enum('admin','karyawan','pemilik') NOT NULL DEFAULT 'karyawan',
  `phone_number` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `password`, `gender`, `role`, `phone_number`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '11111111-1111-1111-1111-111111111111', 'admin_bengkel', '', 'admin@gmail.com', 'admin123', 'L', 'admin', '6281122233344', 1, '2025-11-02 03:00:00', '2025-11-03 15:27:29'),
(2, '22222222-2222-2222-2222-222222222222', 'Dimas', 'Amanda Putra', 'dimas@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'karyawan', '6288847523411', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(3, '33333333-3333-3333-3333-333333333333', 'Yudi', '', 'yudi@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'L', 'karyawan', '6289680009203', 1, '2025-11-02 03:00:00', '2025-11-02 03:00:00'),
(10, '44444444-4444-4444-4444-444444444444', 'Budi', 'Santoso', 'budi.santoso@example.com', '$2y$10$gUmvPODVLUfA8gYG9hV2Xe3JYaFBb4NsKqch7GNjgKv2N4ZimItey', 'L', 'admin', '628112345678', 1, '2025-11-03 10:17:38', '2025-11-03 10:17:38'),
(0, '', '', '', 'ais@gmail.com', '$2y$12$CWnkNAMf62iDhM93/Y3QnOo5PeRM3HsQRUGlnN/D1zaNoCkwe2j8u', 'L', 'karyawan', NULL, 1, '2025-11-16 23:52:51', '2025-11-16 23:52:51');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang_UNIQUE` (`kode_barang`),
  ADD KEY `idx_nama_barang` (`nama_barang`),
  ADD KEY `idx_jumlah_stok` (`jumlah_stok`),
  ADD KEY `fk_barang_kategori` (`kategori_id`),
  ADD KEY `fk_barang_users` (`users_id`),
  ADD KEY `idx_nama_kategori` (`nama_barang`,`kategori_id`),
  ADD KEY `idx_stok_status` (`jumlah_stok`,`stok_minimum`,`is_active`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
