-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2023 lúc 05:02 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dbdoan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `adminid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`adminid`, `username`, `password`) VALUES
('ad01', 'admin1', '$2y$10$ozdUcnIYQ/gNwHxkFP/MKebDuvCZthD/MTC1cPC8a2QSc2mrOw.q.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `blogid` varchar(20) NOT NULL,
  `tieude` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogct`
--

CREATE TABLE `blogct` (
  `blogctid` varchar(20) NOT NULL,
  `blogid` varchar(20) NOT NULL,
  `paragraph` text NOT NULL,
  `img1` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `colorid` varchar(20) NOT NULL,
  `colorname` varchar(255) NOT NULL,
  `colorhex` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`colorid`, `colorname`, `colorhex`) VALUES
('color1', 'Offwhite/Gum', '#FEFBEF'),
('color2', 'Rustic', '#EBD0A2'),
('color3', 'Real Teal', '#1C487C'),
('color4', 'White', '#FFFFFF'),
('color5', 'Evergreen', '#6D9951'),
('color6', 'Black/Gum', '#464646'),
('color7', 'Corluray Mix', '#F5D255'),
('color8', 'Monk\"s Robe', '#77553D');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongsp`
--

CREATE TABLE `dongsp` (
  `dongspid` varchar(20) NOT NULL,
  `tendongsp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dongsp`
--

INSERT INTO `dongsp` (`dongspid`, `tendongsp`) VALUES
('dongsp1', 'Basas'),
('dongsp2', 'Vintas'),
('dongsp3', 'Urbas'),
('dongsp4', 'Pattas'),
('dongsp5', 'Creas'),
('dongsp6', 'Track 6');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `khachhangid` varchar(20) NOT NULL,
  `hoten` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `tinhthanh` varchar(255) NOT NULL,
  `quanhuyen` varchar(255) NOT NULL,
  `phuongxa` varchar(255) NOT NULL,
  `sodt` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gioitinh` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`khachhangid`, `hoten`, `diachi`, `tinhthanh`, `quanhuyen`, `phuongxa`, `sodt`, `email`, `gioitinh`) VALUES
('kh1', 'cxv', 'werter', 'Tỉnh Bắc Giang', 'Huyện Yên Thế', 'Xã Hương Vĩ', '0841456789', 'email2@example.com', 'Nam'),
('kh10', 'Nguyễn Nguyên', '1200 tổ 4 khu phố 10', 'Thành phố Hồ Chí Minh', 'Quận 9', 'Long Bình', '0912356789', 'email@example.com', 'Nam'),
('kh11', 'Nguyễn Minh Minh', ' 456AC tổ 6 khu phố 1', 'Thành phố Hồ Chí Minh', 'Thủ Đức', 'Linh Xuân', '0847456789', 'email@example.com', 'Nữ'),
('kh2', 'Nguyễn Minh Nhựt', '188 Nguyễn Văn Tăng ', 'Thành phố Hồ Chí Minh', 'Quận 9', 'Long Thạnh Mỹ', '0834456789', 'email@example.com', 'Nam'),
('kh3', 'Nguyễn Trần Minh Ngọc', '12A tổ 45', 'Long An', 'Thủ Thừa', 'Thủ Thừa', '0914563789', 'email@example.com', 'Nữ'),
('kh4', 'Trần Ngọc Ánh', '23C, tổ 6 khu phố 3', 'Thái Bình', 'Hàm Thuận Nam', 'Hàm Cần', '0918156789', 'email@example.com', 'Nữ'),
('kh5', 'Lê Khánh Ngân', '45Ac tổ 2 khu phố 10', 'Kiên Giang', 'Rạch Giá', 'An Bình', '0839456789', 'email@example.com', 'Nữ'),
('kh6', 'Võ An An', '45  tổ 1 khu phố 5', 'Thành phố Hồ Chí Minh', 'Quận 1', ' Bến Nghé', '088956789', 'email@example.com', 'Nam'),
('kh7', 'Nguyễn Minh Anh', '789 tổ 5 khu phố 10', 'Thành phố Biên Hòa', 'Đồng Nai', 'Long Bình Tân', '0890856789', 'email@example.com', 'Nữ'),
('kh8', 'Võ Anh Minh', '123 tổ 10 kp 8a ', 'Thành phố Biên Hòa', 'Đồng Nai', 'Long Bình', '0837856789', 'email@example.com', 'Nam'),
('kh9', 'Lê Ngọc Ánh', 'a23c 45 tổ 36 khu phố 10', 'Thành phố Hồ Chí Minh', 'Thủ Đức', 'Hiệp Bình', '0854560789', 'email@example.com', 'Nữ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magiamgia`
--

CREATE TABLE `magiamgia` (
  `magiamgiaid` varchar(20) NOT NULL,
  `codemagiamgia` varchar(255) NOT NULL,
  `giatrigiam` float NOT NULL,
  `ngaybd` datetime DEFAULT NULL,
  `ngaykt` datetime DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `magiamgia`
--

INSERT INTO `magiamgia` (`magiamgiaid`, `codemagiamgia`, `giatrigiam`, `ngaybd`, `ngaykt`, `soluong`) VALUES
('mgg01', 'D1111', 0.3, '2023-11-11 00:00:00', '2023-11-12 00:00:00', 97),
('mgg02', 'XM23', 0.2, '2023-12-20 00:00:00', '2023-12-27 00:00:00', 200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `magiamgiact`
--

CREATE TABLE `magiamgiact` (
  `magiamgiactid` varchar(20) NOT NULL,
  `magiamgiaid` varchar(20) NOT NULL,
  `khachhangid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `procolorsize`
--

CREATE TABLE `procolorsize` (
  `procolorsizeid` int(11) NOT NULL,
  `procolorid` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `sl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `procolorsize`
--

INSERT INTO `procolorsize` (`procolorsizeid`, `procolorid`, `size`, `sl`) VALUES
(1, 29, 35, 15),
(2, 29, 36, 13),
(3, 29, 37, 12),
(4, 29, 38, 20),
(5, 29, 39, 20),
(6, 29, 40, 20),
(7, 29, 41, 20),
(8, 29, 42, 20),
(9, 29, 43, 15),
(10, 29, 44, 20),
(11, 29, 45, 20),
(12, 30, 35, 19),
(13, 30, 36, 20),
(14, 30, 37, 23),
(15, 30, 38, 20),
(16, 30, 39, 20),
(17, 30, 40, 20),
(18, 30, 41, 20),
(19, 30, 42, 19),
(20, 30, 43, 20),
(21, 30, 44, 20),
(22, 30, 45, 20),
(23, 31, 35, 20),
(24, 31, 36, 17),
(25, 31, 37, 20),
(26, 31, 38, 18),
(27, 31, 39, 20),
(28, 31, 40, 18),
(29, 31, 41, 20),
(30, 31, 42, 20),
(31, 31, 43, 20),
(32, 31, 44, 20),
(33, 31, 45, 20),
(34, 32, 35, 20),
(35, 32, 36, 20),
(36, 32, 37, 20),
(37, 32, 38, 20),
(38, 32, 39, 20),
(39, 32, 40, 20),
(40, 32, 41, 20),
(41, 32, 42, 20),
(42, 32, 43, 20),
(43, 32, 44, 20),
(44, 32, 45, 20),
(45, 33, 35, 20),
(46, 33, 36, 20),
(47, 33, 37, 20),
(48, 33, 38, 20),
(49, 33, 39, 20),
(50, 33, 40, 20),
(51, 33, 41, 20),
(52, 33, 42, 20),
(53, 33, 43, 20),
(54, 33, 44, 20),
(55, 33, 45, 20),
(56, 34, 35, 20),
(57, 34, 36, 20),
(58, 34, 37, 20),
(59, 34, 38, 20),
(60, 34, 39, 20),
(61, 34, 40, 20),
(62, 34, 41, 20),
(63, 34, 42, 20),
(64, 34, 43, 20),
(65, 34, 44, 20),
(66, 34, 45, 20),
(250, 56, 36, 4),
(251, 56, 37, 4),
(252, 56, 38, 1),
(253, 56, 39, 0),
(254, 56, 40, 0),
(255, 56, 41, 0),
(256, 56, 42, 0),
(257, 56, 43, 0),
(258, 56, 44, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productcolor`
--

CREATE TABLE `productcolor` (
  `productcolorid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `colorid` varchar(20) NOT NULL,
  `img1` text DEFAULT NULL,
  `img2` text DEFAULT NULL,
  `img3` text DEFAULT NULL,
  `img4` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productcolor`
--

INSERT INTO `productcolor` (`productcolorid`, `productid`, `colorid`, `img1`, `img2`, `img3`, `img4`) VALUES
(29, 1, 'color7', 'Pro_AV00167_1.jpeg', 'Pro_AV00165_2.jpeg', 'Pro_AV00165_3.jpeg', 'Pro_AV00165_4.jpeg'),
(30, 2, 'color7', 'Pro_AV00165_1.jpeg', 'Pro_AV00165_2.jpeg', 'Pro_AV00165_3.jpeg', 'Pro_AV00165_4.jpeg'),
(31, 3, 'color8', 'Pro_AV00204_1.jpeg', 'Pro_AV00204_2.jpeg', 'Pro_AV00204_3.jpeg', 'Pro_AV00204_4.jpeg'),
(32, 4, 'color8', 'Pro_AV00203_1.jpeg', 'Pro_AV00203_2.jpeg', 'Pro_AV00203_3.jpeg', 'Pro_AV00203_4.jpeg'),
(33, 5, 'color4', 'pro_track6_A6T002_1.jpg', 'pro_track6_A6T002_2.jpg', 'pro_track6_A6T002_7.jpg', 'pro_track6_A6T002_1.jpg'),
(34, 5, 'color4', 'pro_track6_A6T003_1.jpg', 'pro_track6_A6T003_2.jpg', 'pro_track6_A6T003_3.jpg', 'pro_track6_A6T003_4.jpg'),
(56, 25, 'color1', 'Pro_AV00205_1.jpeg', 'Pro_AV00205_2.jpeg', 'Pro_AV00205_3.jpeg', 'Pro_AV00205_4.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `saleoff`
--

CREATE TABLE `saleoff` (
  `saleoffid` int(11) NOT NULL,
  `ngaybd` datetime DEFAULT NULL,
  `ngaykt` datetime DEFAULT NULL,
  `giatrigiam` float NOT NULL,
  `loaisp` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `saleoff`
--

INSERT INTO `saleoff` (`saleoffid`, `ngaybd`, `ngaykt`, `giatrigiam`, `loaisp`) VALUES
(1, '2023-12-13 00:00:00', '2023-12-14 00:00:00', 23, ''),
(2, '2023-12-13 00:00:00', '2023-12-20 00:00:00', 45, 'Vintas'),
(3, '2023-12-16 00:00:00', '2023-12-17 00:00:00', 2, ''),
(4, '2023-12-15 00:00:00', '2023-12-21 00:00:00', 20, ''),
(15, '2023-12-16 00:00:00', '2023-12-19 00:00:00', 30, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `saleoffct`
--

CREATE TABLE `saleoffct` (
  `saleoffctid` int(11) NOT NULL,
  `saleoffid` int(11) NOT NULL,
  `procolorid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `saleoffct`
--

INSERT INTO `saleoffct` (`saleoffctid`, `saleoffid`, `procolorid`) VALUES
(1, 1, 31),
(2, 1, 30),
(3, 2, 31),
(4, 2, 32),
(8, 3, 33),
(9, 4, 29),
(47, 15, 29);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `sanphamid` int(11) NOT NULL,
  `tensp` varchar(255) NOT NULL,
  `giasp` int(20) NOT NULL,
  `danhmuc` varchar(255) NOT NULL,
  `dongspid` varchar(20) DEFAULT NULL,
  `styleid` varchar(20) DEFAULT NULL,
  `thongtinsp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`sanphamid`, `tensp`, `giasp`, `danhmuc`, `dongspid`, `styleid`, `thongtinsp`) VALUES
(1, 'Urbas Corluray Mix - High Top', 650000, 'Nam', 'dongsp3', 'style2', 'Được làm từ chất liệu cao cấp, Urbas Corluray Pack \r\nmang đến sự thoải mái và phong cách cho người dùng. Bộ sưu tập có 5 màu sắc khác nhau, phù hợp với nhiều phong cách thời trang.'),
(2, 'Urbas Corluray Mix - Low Top', 610000, 'Nam', 'dongsp3', 'style1', 'Được làm từ chất liệu cao cấp, Urbas Corluray Pack \r\nmang đến sự thoải mái và phong cách cho người dùng. Bộ sưu tập có 5 màu sắc khác nhau, phù hợp với nhiều phong cách thời trang.'),
(3, 'Vintas Nauda - High Top', 720000, 'Nữ', 'dongsp2', 'style2', 'Được làm từ chất liệu cao cấp, Ananas Nauda mang đến sự thoải mái \nvà phong cách cho người dùng. Mẫu giày có 3 màu sắc khác nhau, phù hợp với nhiều phong cách thời trang.'),
(4, 'Vintas Nauda - Low Top', 650000, 'Nữ', 'dongsp2', 'style1', 'Được làm từ chất liệu cao cấp, Ananas Nauda mang đến sự thoải mái \r\nvà phong cách cho người dùng. Mẫu giày có 3 màu sắc khác nhau, phù hợp với nhiều phong cách thời trang.'),
(5, 'Track 6 OG - Low Top', 990000, 'Nam', 'dongsp6', 'style1', 'Được làm từ chất liệu cao cấp, Track 6 mang đến sự thoải mái \r\nvà phong cách cho người dùng. Mẫu giày có 5 màu sắc khác nhau, phù hợp với nhiều phong cách thời trang.'),
(25, 'VINTAS VIVU - LOW TOP - WARM SAND', 620000, 'Nam', 'dongsp2', 'style1', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size`
--

CREATE TABLE `size` (
  `sizeid` varchar(20) NOT NULL,
  `sizenumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size`
--

INSERT INTO `size` (`sizeid`, `sizenumber`) VALUES
('size 36', 36),
('size 37', 37),
('size 38', 38),
('size 39', 39),
('size 40', 40),
('size 41', 41),
('size 42', 42),
('size 43', 43),
('size 44', 44);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `style`
--

CREATE TABLE `style` (
  `styleid` varchar(20) NOT NULL,
  `stylename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `style`
--

INSERT INTO `style` (`styleid`, `stylename`) VALUES
('style1', 'Low Top'),
('style2', 'High Top'),
('style3', 'Mid Top'),
('style4', 'Mule');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoankh`
--

CREATE TABLE `taikhoankh` (
  `taikhoanid` int(11) NOT NULL,
  `khachhangid` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoankh`
--

INSERT INTO `taikhoankh` (`taikhoanid`, `khachhangid`, `password`) VALUES
(1, 'kh1', '$2y$10$lOLmfT24uTTCifzI3TUH5el9jU/ECuXg7dqk.7Nz884F7LqyV.07K'),
(2, 'kh2', '$2y$10$v8c.4vUsJWNShfgIHU2n8.3OV9O2/9ZXzqtAoFZowl1tEiZ9PNXta'),
(3, 'kh3', '$2y$10$f/k1K1bYzQ3cCaUT.2/ux.ZOBglkHrPakE6g3aJ7GMCQPkmJqZmuy'),
(4, 'kh4', '$2y$10$b1MIQyzvgP.PbBCjUUgi6OfIOcDrMq7lobxisxtngmL15DQjQ2.wu'),
(5, 'kh5', '$2y$10$/1s7JtReHvJHUmDuOO89muFcfACwdIFArC26Kvt0op/t3ovIP72Ca'),
(14, 'kh6', '$2y$10$YfwKIsa2E3Xlu8xjZEQQM.aqhIcA8iBFDUsPrlWCQVoo3pqRVkdLq'),
(15, 'kh7', '$2y$10$.Yh47ZShIZ3/YEr9uY6iMuXoZdnVH5YQABDWJvSl4Z1bw5YpJIW2a'),
(16, 'kh8', '$2y$10$h0.SC/IPS2InS4AdtNHre.Q3ZmZwa9CPWN5vwUPGb59KEqE8J0.T2'),
(17, 'kh9', '$2y$10$U1l8uubp/2w1EjVQw0VrRuJCDWfAMs.SU4zv1PLxz6sVqHqSuLXdu'),
(18, 'kh10', '$2y$10$Rvk2ozOAshnqEuhyoUxkROVBiZ0DeL1o8IbOHQZ8ttC1PHWGBODvi'),
(19, 'kh11', '$2y$10$EY5rffs1sk/ShXE.SXDPwePQ9.WtUJL1.mUyd2jA9aXqVp5azYFvu');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `thanhtoanid` int(11) NOT NULL,
  `khachhangid` varchar(20) NOT NULL,
  `ngayorder` date NOT NULL DEFAULT current_timestamp(),
  `magiamgiaid` varchar(20) NOT NULL,
  `tongtien` int(20) NOT NULL,
  `hinhthucthanhtoan` varchar(255) NOT NULL,
  `tienhang` int(11) NOT NULL,
  `phiship` int(11) NOT NULL,
  `trangthai` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoan`
--

INSERT INTO `thanhtoan` (`thanhtoanid`, `khachhangid`, `ngayorder`, `magiamgiaid`, `tongtien`, `hinhthucthanhtoan`, `tienhang`, `phiship`, `trangthai`) VALUES
(66, 'kh1', '2023-12-01', '', 650000, 'trực tiếp', 610000, 40000, 'Đã xác nhận'),
(67, 'kh1', '2023-12-01', '', 690000, 'trực tiếp', 650000, 40000, 'Đã xác nhận'),
(68, 'kh1', '2023-12-01', '', 650000, 'thẻ ngân hàng', 650000, 0, 'Chờ xác nhận'),
(69, 'kh1', '2023-12-01', '', 1680000, 'trực tiếp', 1640000, 40000, 'Đã xác nhận'),
(76, 'kh1', '2023-12-07', '', 610000, 'trực tiếp', 610000, 0, 'Chờ xác nhận'),
(78, 'kh1', '2023-12-07', 'mgg01', 467000, 'trực tiếp', 610000, 40000, 'Chờ xác nhận'),
(79, 'kh1', '2023-12-07', '', 650000, 'trực tiếp', 610000, 40000, 'Chờ xác nhận'),
(80, 'kh1', '2023-12-08', '', 650000, 'trực tiếp', 610000, 40000, 'Chờ xác nhận'),
(81, 'kh1', '2023-12-08', '', 3290000, 'trực tiếp', 3250000, 40000, 'Chờ xác nhận'),
(83, 'kh1', '2023-12-08', '', 650000, 'trực tiếp', 610000, 40000, 'Chờ xác nhận'),
(84, 'kh1', '2023-12-12', '', 3820000, 'trực tiếp', 3780000, 40000, 'Chờ xác nhận');

--
-- Bẫy `thanhtoan`
--
DELIMITER $$
CREATE TRIGGER `so_luong_magiamgia` AFTER INSERT ON `thanhtoan` FOR EACH ROW BEGIN
    IF NEW.magiamgiaid IS NOT NULL THEN
        UPDATE magiamgia
        SET soluong = soluong - 1
        WHERE magiamgiaid = NEW.magiamgiaid;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thanhtoanct`
--

CREATE TABLE `thanhtoanct` (
  `thanhtoanctid` int(11) NOT NULL,
  `thanhtoanid` int(11) NOT NULL,
  `productcolorsizeid` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thanhtoanct`
--

INSERT INTO `thanhtoanct` (`thanhtoanctid`, `thanhtoanid`, `productcolorsizeid`, `soluong`) VALUES
(47, 66, 12, 1),
(48, 67, 1, 1),
(49, 68, 12, 1),
(50, 69, 1, 1),
(51, 69, 56, 1),
(57, 76, 12, 1),
(59, 78, 12, 1),
(60, 79, 12, 1),
(61, 80, 12, 1),
(62, 81, 1, 5),
(63, 83, 14, 1),
(64, 84, 252, 4),
(65, 84, 2, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogid`);

--
-- Chỉ mục cho bảng `blogct`
--
ALTER TABLE `blogct`
  ADD PRIMARY KEY (`blogctid`),
  ADD KEY `fk_blogct_blogid` (`blogid`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`colorid`);

--
-- Chỉ mục cho bảng `dongsp`
--
ALTER TABLE `dongsp`
  ADD PRIMARY KEY (`dongspid`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`khachhangid`);

--
-- Chỉ mục cho bảng `magiamgia`
--
ALTER TABLE `magiamgia`
  ADD PRIMARY KEY (`magiamgiaid`);

--
-- Chỉ mục cho bảng `magiamgiact`
--
ALTER TABLE `magiamgiact`
  ADD PRIMARY KEY (`magiamgiactid`),
  ADD KEY `fk_magiamgiact_magiamgiaid` (`magiamgiaid`),
  ADD KEY `fk_magiamgiact_khachhangid` (`khachhangid`);

--
-- Chỉ mục cho bảng `procolorsize`
--
ALTER TABLE `procolorsize`
  ADD PRIMARY KEY (`procolorsizeid`),
  ADD KEY `fk_procolorsize_procolorid` (`procolorid`);

--
-- Chỉ mục cho bảng `productcolor`
--
ALTER TABLE `productcolor`
  ADD PRIMARY KEY (`productcolorid`),
  ADD KEY `fk_productcolor_productid` (`productid`),
  ADD KEY `fk_productcolor_colorid` (`colorid`);

--
-- Chỉ mục cho bảng `saleoff`
--
ALTER TABLE `saleoff`
  ADD PRIMARY KEY (`saleoffid`);

--
-- Chỉ mục cho bảng `saleoffct`
--
ALTER TABLE `saleoffct`
  ADD PRIMARY KEY (`saleoffctid`),
  ADD KEY `fk_saleoffct_saleoffid` (`saleoffid`),
  ADD KEY `fk_saleoffct_procolorid` (`procolorid`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`sanphamid`),
  ADD KEY `fk_sanpham_dongspid` (`dongspid`),
  ADD KEY `fk_sanpham_styleid` (`styleid`);

--
-- Chỉ mục cho bảng `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`sizeid`);

--
-- Chỉ mục cho bảng `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`styleid`);

--
-- Chỉ mục cho bảng `taikhoankh`
--
ALTER TABLE `taikhoankh`
  ADD PRIMARY KEY (`taikhoanid`),
  ADD KEY `fk_taikhoankh` (`khachhangid`);

--
-- Chỉ mục cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`thanhtoanid`),
  ADD KEY `fk_thanhtoan_khachhangid` (`khachhangid`),
  ADD KEY `fk_thanhtoanct_magiamgiaid` (`magiamgiaid`);

--
-- Chỉ mục cho bảng `thanhtoanct`
--
ALTER TABLE `thanhtoanct`
  ADD PRIMARY KEY (`thanhtoanctid`),
  ADD KEY `fk_thanhtoanct_thanhtoanid` (`thanhtoanid`),
  ADD KEY `fk_thanhtoanct_procolorsizeid` (`productcolorsizeid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `procolorsize`
--
ALTER TABLE `procolorsize`
  MODIFY `procolorsizeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT cho bảng `productcolor`
--
ALTER TABLE `productcolor`
  MODIFY `productcolorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `saleoff`
--
ALTER TABLE `saleoff`
  MODIFY `saleoffid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `saleoffct`
--
ALTER TABLE `saleoffct`
  MODIFY `saleoffctid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `sanphamid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `taikhoankh`
--
ALTER TABLE `taikhoankh`
  MODIFY `taikhoanid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `thanhtoanid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `thanhtoanct`
--
ALTER TABLE `thanhtoanct`
  MODIFY `thanhtoanctid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `magiamgiact`
--
ALTER TABLE `magiamgiact`
  ADD CONSTRAINT `fk_magiamgiact_khachhangid` FOREIGN KEY (`khachhangid`) REFERENCES `khachhang` (`khachhangid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_magiamgiact_magiamgiaid` FOREIGN KEY (`magiamgiaid`) REFERENCES `magiamgia` (`magiamgiaid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `procolorsize`
--
ALTER TABLE `procolorsize`
  ADD CONSTRAINT `fk_procolorsize_procolorid` FOREIGN KEY (`procolorid`) REFERENCES `productcolor` (`productcolorid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `productcolor`
--
ALTER TABLE `productcolor`
  ADD CONSTRAINT `fk_productcolor_colorid` FOREIGN KEY (`colorid`) REFERENCES `color` (`colorid`),
  ADD CONSTRAINT `fk_productcolor_productid` FOREIGN KEY (`productid`) REFERENCES `sanpham` (`sanphamid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `saleoffct`
--
ALTER TABLE `saleoffct`
  ADD CONSTRAINT `fk_saleoffct_procolorid` FOREIGN KEY (`procolorid`) REFERENCES `productcolor` (`productcolorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_saleoffct_saleoffid` FOREIGN KEY (`saleoffid`) REFERENCES `saleoff` (`saleoffid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_sanpham_dongspid` FOREIGN KEY (`dongspid`) REFERENCES `dongsp` (`dongspid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sanpham_styleid` FOREIGN KEY (`styleid`) REFERENCES `style` (`styleid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `taikhoankh`
--
ALTER TABLE `taikhoankh`
  ADD CONSTRAINT `fk_taikhoankh` FOREIGN KEY (`khachhangid`) REFERENCES `khachhang` (`khachhangid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD CONSTRAINT `fk_thanhtoan_khachhangid` FOREIGN KEY (`khachhangid`) REFERENCES `khachhang` (`khachhangid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `thanhtoanct`
--
ALTER TABLE `thanhtoanct`
  ADD CONSTRAINT `fk_thanhtoanct_procolorsizeid` FOREIGN KEY (`productcolorsizeid`) REFERENCES `procolorsize` (`procolorsizeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_thanhtoanct_thanhtoanid` FOREIGN KEY (`thanhtoanid`) REFERENCES `thanhtoan` (`thanhtoanid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
