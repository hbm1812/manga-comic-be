-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 23, 2023 lúc 08:44 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `manga_comic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `keyword`, `name`, `alias`, `avatar`, `descr`, `created_at`, `updated_at`) VALUES
(1, 'Asato-Asato', 'Asato Asato', 'Asato Asato', 'https://cdn.anime-planet.com/people/primary/asato-asato-1-190x267.jpg?t=1625790596', 'Asato Asato (安里アサト, born 1985) is a female Japanese novelist. The pen name Asato Asato is a combination of her real name (Toru Asakura) and eighty-eight.', '2023-05-19 03:02:18', '2023-05-22 16:42:09'),
(2, NULL, 'Shinichi Fukuda', NULL, 'https://media.zenfs.com/es/levelup_525/42fac2aa5fdd822efc4e64f6e2964a9f', NULL, '2023-05-19 03:02:18', NULL),
(3, '', 'Code:000', 'Code:000', 'https://upload.wikimedia.org/wikipedia/en/d/dc/DARLING_in_the_FRANXX%2C_second_key_visual.jpg?20200726083303', '', '2023-05-19 03:02:18', '2023-05-22 07:45:45'),
(4, 'Baba-Okina ', 'Baba Okina', 'Baba Okina ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs5HLt-KIxowCPro95jchI2zdI57U8Y8eTAg&usqp=CAU', 'Chưa có thông tin', '2023-05-19 03:18:44', NULL),
(5, ' Sōichirō-Yamamoto', ' Sōichirō Yamamoto', ' Sōichirō Yamamoto', 'https://tuvanduhocmap.com/wp-content/uploads/2021/08/Yamamoto-Souichirou-Hoa-si-truyen-tranh-Nhat-Ban-noi-tieng.jpg', '', '2023-05-22 07:48:46', NULL),
(6, 'Haruba-Negi.', 'Haruba Negi', 'Haruba Negi.', '', 'Sinh ngày 27 tháng 7 năm 1991 ở Aichi. là một tác giả manga Nhật Bản. Anh tốt nghiệp bằng Trident College of Design năm 2013. Bắt đầu sự nghiệp với tác phẩm đầu tay Coward Cross World được xuất bản trên tạp chí Kodansha năm 2013. Sau đó cùng với Hirose Sh', '2023-05-22 08:20:20', NULL),
(7, 'Yuusuke-Shiba', 'Yuusuke Shiba', 'Yuusuke Shiba', '', '', '2023-05-22 14:47:14', NULL),
(8, ' Miyama-Hugin', ' Miyama Hugin', ' Miyama Hugin', '', 'Overlord (オーバーロード Ōbārōdo?) là một bộ light novel Nhật Bản được viết bởi Maruyama Kugane và minh họa bởi so-bin. Nó bắt đầu được đăng nhiều kỳ trực tuyến vào năm 2010, trước khi được hãng Enterbrain mua lại. Mười sáu tập đã được xuất bản kể từ ngày 30 thá', '2023-05-22 16:43:11', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_news`
--

CREATE TABLE `category_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category_news`
--

INSERT INTO `category_news` (`id`, `name`, `keyword`, `created_at`, `updated_at`) VALUES
(1, 'mới nhất', 'lastest', '2023-05-19 03:02:18', NULL),
(2, 'anime', 'anime', '2023-05-19 03:02:18', NULL),
(3, 'truyện tranh', 'comic', '2023-05-19 03:02:18', NULL),
(4, 'thông tin', 'info', '2023-05-19 03:02:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapter`
--

CREATE TABLE `chapter` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subname` varchar(255) DEFAULT NULL,
  `story_id` int(10) UNSIGNED DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chapter`
--

INSERT INTO `chapter` (`id`, `keyword`, `name`, `subname`, `story_id`, `country`, `languages`, `created_at`, `updated_at`) VALUES
(1, '86', 'Eighty Six, Chapter 1', NULL, 1, 'JP', 'EN', '2023-05-19 03:02:19', NULL),
(2, '86', 'Eighty Six, Chapter 2', NULL, 1, 'JP', 'EN', '2023-05-19 03:02:19', NULL),
(3, 'my-dress-up-darling', 'My Dress-Up Darling, Chapter 1', NULL, 2, 'JP', 'EN', '2023-05-19 03:02:19', NULL),
(4, 'darling-in-the-franxx', 'Darling in the franxx, Chapter 1', NULL, 3, 'JP', 'Vi', '2023-05-19 03:02:19', NULL),
(5, 'kumo-desu-ga-nani-ka', 'kumo desu ga nani ka ?, Chapter 1', NULL, 4, 'JP', 'Vi', '2023-05-19 03:30:18', '2023-05-22 08:02:00'),
(6, 'Soredemo-Ayumu-wa-Yosetekuru', 'Soredemo Ayumu wa Yosetekuru, chapter 1', NULL, 5, 'JP', 'Vi', '2023-05-22 08:02:47', NULL),
(7, 'Gotōbun-no-Hanayome ', 'Gotōbun no Hanayome, chapter 1', NULL, 6, 'JP', 'Vi', '2023-05-22 08:21:52', NULL),
(8, 'SLIME-TAOSHITE-300-NEN', 'SLIME TAOSHITE 300-NEN, chapter 1', NULL, 7, 'JP', 'Vi', '2023-05-22 14:51:06', NULL),
(9, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 2', NULL, 4, 'JP', 'Vi', '2023-05-22 15:44:53', NULL),
(10, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 3', NULL, 4, 'JP', 'Vi', '2023-05-22 16:16:42', NULL),
(11, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 1', NULL, 4, 'JP', 'JP', '2023-05-22 16:21:17', NULL),
(12, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka? chapter 1', NULL, 4, 'JP', 'EN', '2023-05-22 16:23:30', NULL),
(13, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 2', NULL, 4, 'JP', 'EN', '2023-05-22 16:25:13', NULL),
(14, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 4', NULL, 4, 'JP', 'Vi', '2023-05-23 02:26:45', NULL),
(15, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka? chapter 5', NULL, 4, 'JP', 'Vi', '2023-05-23 02:29:28', NULL),
(16, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 6', NULL, 4, 'JP', 'Vi', '2023-05-23 02:33:46', NULL),
(17, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 7', NULL, 4, 'JP', 'Vi', '2023-05-23 02:36:17', NULL),
(18, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 8', NULL, 4, 'JP', 'Vi', '2023-05-23 02:38:50', NULL),
(19, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 9', NULL, 4, 'JP', 'Vi', '2023-05-23 02:40:19', NULL),
(20, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 10', NULL, 4, 'JP', 'Vi', '2023-05-23 02:44:44', NULL),
(21, 'kumo-desu-ga-nani-ka', 'kumo desu ga, nani ka?, chapter 11', NULL, 4, 'JP', 'Vi', '2023-05-23 02:45:41', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapter_images`
--

CREATE TABLE `chapter_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `chapter_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chapter_images`
--

INSERT INTO `chapter_images` (`id`, `thumbnail`, `chapter_id`, `created_at`, `updated_at`) VALUES
(1, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/001.jpg', 1, '2023-05-19 03:02:19', NULL),
(2, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/002.jpg', 1, '2023-05-19 03:02:19', NULL),
(3, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/003.jpg', 1, '2023-05-19 03:02:19', NULL),
(4, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/004.jpg', 1, '2023-05-19 03:02:19', NULL),
(5, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/005.jpg', 1, '2023-05-19 03:02:19', NULL),
(6, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/006.jpg', 1, '2023-05-19 03:02:19', NULL),
(7, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/007.jpg', 1, '2023-05-19 03:02:19', NULL),
(8, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/008.jpg', 1, '2023-05-19 03:02:19', NULL),
(9, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/009.jpg', 1, '2023-05-19 03:02:19', NULL),
(10, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/010.jpg', 1, '2023-05-19 03:02:19', NULL),
(11, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/001.jpg', 2, '2023-05-19 03:02:19', NULL),
(12, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/002.jpg', 2, '2023-05-19 03:02:19', NULL),
(13, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/003.jpg', 2, '2023-05-19 03:02:19', NULL),
(14, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/004.jpg', 2, '2023-05-19 03:02:19', NULL),
(15, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/005.jpg', 2, '2023-05-19 03:02:19', NULL),
(16, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/006.jpg', 2, '2023-05-19 03:02:19', NULL),
(17, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/007.jpg', 2, '2023-05-19 03:02:19', NULL),
(18, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/008.jpg', 2, '2023-05-19 03:02:19', NULL),
(19, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/009.jpg', 2, '2023-05-19 03:02:19', NULL),
(20, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/010.jpg', 2, '2023-05-19 03:02:19', NULL),
(21, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/1.jpg', 3, '2023-05-19 03:02:19', NULL),
(22, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/2.jpg', 3, '2023-05-19 03:02:19', NULL),
(23, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/3.jpg', 3, '2023-05-19 03:02:19', NULL),
(24, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/4.jpg', 3, '2023-05-19 03:02:19', NULL),
(25, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/5.jpg', 3, '2023-05-19 03:02:19', NULL),
(26, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/6.jpg', 3, '2023-05-19 03:02:19', NULL),
(27, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/7.jpg', 3, '2023-05-19 03:02:19', NULL),
(28, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/8.jpg', 3, '2023-05-19 03:02:19', NULL),
(29, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/9.jpg', 3, '2023-05-19 03:02:19', NULL),
(30, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/10.jpg', 3, '2023-05-19 03:02:19', NULL),
(31, 'https://i3.truyen-hay.com/289/289218/000.jpg', 4, '2023-05-19 03:02:19', NULL),
(32, 'https://i3.truyen-hay.com/289/289218/000a.jpg', 4, '2023-05-19 03:02:19', NULL),
(33, 'https://i3.truyen-hay.com/289/289218/001.jpg', 4, '2023-05-19 03:02:19', NULL),
(34, 'https://i3.truyen-hay.com/289/289218/002.jpg', 4, '2023-05-19 03:02:19', NULL),
(35, 'https://i3.truyen-hay.com/289/289218/003-004.jpg', 4, '2023-05-19 03:02:19', NULL),
(36, 'https://i3.truyen-hay.com/289/289218/005.jpg', 4, '2023-05-19 03:02:19', NULL),
(37, 'https://i3.truyen-hay.com/289/289218/006.jpg', 4, '2023-05-19 03:02:19', NULL),
(38, 'https://i3.truyen-hay.com/289/289218/007.jpg', 4, '2023-05-19 03:02:19', NULL),
(39, 'https://i3.truyen-hay.com/289/289218/008.jpg', 4, '2023-05-19 03:02:19', NULL),
(40, 'https://i3.truyen-hay.com/289/289218/009.jpg', 4, '2023-05-19 03:02:19', NULL),
(41, 'https://i441.ntcdntempv26.com/data/images/11658/229541/001-fix.jpg?data=net', 5, '2023-05-19 03:30:28', NULL),
(42, 'https://i441.ntcdntempv26.com/data/images/11658/229541/002-fix.jpg?data=net', 5, '2023-05-22 03:28:12', NULL),
(43, 'https://i441.ntcdntempv26.com/data/images/11658/229541/003-fix.jpg?data=net', 5, '2023-05-22 03:51:36', NULL),
(44, 'https://i441.ntcdntempv26.com/data/images/11658/229541/004-fix.jpg?data=net', 5, '2023-05-22 04:06:10', NULL),
(45, 'https://i441.ntcdntempv26.com/data/images/11658/229541/006-fix.jpg?data=net', 5, '2023-05-22 04:08:59', NULL),
(46, 'https://i441.ntcdntempv26.com/data/images/11658/229541/007-fix.jpg?data=net', 5, '2023-05-22 04:11:56', NULL),
(54, 'https://i441.ntcdntempv26.com/data/images/11658/229541/008-fix.jpg?data=net', 5, '2023-05-22 07:01:52', NULL),
(55, 'https://i115.ntcdntempv3.com/data/images/11658/236383/001-fix.jpg?data=net', 5, '2023-05-22 07:06:01', '2023-05-22 08:13:34'),
(56, 'https://i115.ntcdntempv3.com/data/images/11658/236383/002-fix.jpg?data=net', 5, '2023-05-22 07:39:51', '2023-05-22 08:13:45'),
(57, 'https://i115.ntcdntempv3.com/data/images/21381/449768/003-fix.jpg?data=net', 6, '2023-05-22 08:03:23', '2023-05-22 08:12:30'),
(58, 'https://i115.ntcdntempv3.com/data/images/21381/449768/004-fix.jpg?data=net', 6, '2023-05-22 08:05:04', '2023-05-22 08:12:39'),
(59, 'https://i115.ntcdntempv3.com/data/images/21381/449768/005-fix.jpg?data=net', 6, '2023-05-22 08:05:20', '2023-05-22 08:12:47'),
(60, 'https://i115.ntcdntempv3.com/data/images/21381/449768/006-fix.jpg?data=net', 6, '2023-05-22 08:05:34', '2023-05-22 08:12:57'),
(61, 'https://i115.ntcdntempv3.com/data/images/21381/449768/007-fix.jpg?data=net', 6, '2023-05-22 08:10:00', NULL),
(62, 'https://i115.ntcdntempv3.com/data/images/15678/310117/002-fix.jpg?data=net', 7, '2023-05-22 08:22:18', NULL),
(63, 'https://i115.ntcdntempv3.com/data/images/15678/310117/003-fix.jpg?data=net', 7, '2023-05-22 08:22:31', NULL),
(64, 'https://i115.ntcdntempv3.com/data/images/15678/310117/004-fix.jpg?data=net', 7, '2023-05-22 08:22:38', NULL),
(65, 'https://i115.ntcdntempv3.com/data/images/15678/310117/005-fix.jpg?data=net', 7, '2023-05-22 08:22:50', NULL),
(66, 'https://i115.ntcdntempv3.com/data/images/15678/310117/006-fix.jpg?data=net', 7, '2023-05-22 08:23:05', NULL),
(67, 'https://i115.ntcdntempv3.com/data/images/15678/310117/007-fix.jpg?data=net', 7, '2023-05-22 08:23:23', NULL),
(68, 'https://i115.ntcdntempv3.com/data/images/15678/310117/008-fix.jpg?data=net', 7, '2023-05-22 08:23:39', NULL),
(69, 'https://i115.ntcdntempv3.com/data/images/15678/310117/009-fix.jpg?data=net', 7, '2023-05-22 08:24:04', NULL),
(71, 'https://i115.ntcdntempv3.com/data/images/17542/357502/004-fix.jpg?data=net', 8, '2023-05-22 14:51:19', NULL),
(72, 'https://i115.ntcdntempv3.com/data/images/17542/357502/005-fix.jpg?data=net', 8, '2023-05-22 14:51:26', NULL),
(73, 'https://i115.ntcdntempv3.com/data/images/17542/357502/006-fix.jpg?data=net', 8, '2023-05-22 14:51:33', NULL),
(87, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b93bb0c2a5.jpg', 9, '2023-05-22 16:09:31', NULL),
(88, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b93c6802e9.jpg', 9, '2023-05-22 16:09:42', NULL),
(89, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b93d285320.jpg', 9, '2023-05-22 16:09:54', NULL),
(91, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b941ba0e4d.jpg', 9, '2023-05-22 16:11:07', NULL),
(92, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b942652f51.jpg', 9, '2023-05-22 16:11:18', NULL),
(93, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b94309fe7d.jpg', 9, '2023-05-22 16:11:28', NULL),
(94, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b95c282fbf.jpg', 10, '2023-05-22 16:18:10', NULL),
(95, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b95cdbab5c.jpg', 10, '2023-05-22 16:18:21', NULL),
(96, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b95dea3081.jpg', 10, '2023-05-22 16:18:38', NULL),
(97, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646b95f6b9e0f.jpg', 10, '2023-05-22 16:19:02', NULL),
(98, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/1.jpg', 11, '2023-05-22 16:21:43', '2023-05-22 16:22:51'),
(99, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/1.jpg', 12, '2023-05-22 16:23:40', NULL),
(100, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/2.jpg', 12, '2023-05-22 16:23:49', NULL),
(101, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/3.jpg', 12, '2023-05-22 16:23:56', NULL),
(102, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/4.jpg', 12, '2023-05-22 16:24:04', NULL),
(103, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/5.jpg', 12, '2023-05-22 16:24:15', NULL),
(104, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/6.jpg', 12, '2023-05-22 16:24:23', NULL),
(105, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-0/7.jpg', 12, '2023-05-22 16:24:33', NULL),
(106, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-2/1.jpg', 13, '2023-05-22 16:25:27', NULL),
(107, 'https://cdn.readkakegurui.com/file/cdnpog/kumo-desu-ga-nani-ka/chapter-2/2.jpg', 13, '2023-05-22 16:25:34', NULL),
(108, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24ac5e5e5.jpg', 14, '2023-05-23 02:27:56', NULL),
(109, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24b753d56.jpg', 14, '2023-05-23 02:28:07', NULL),
(110, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24c1b0356.jpg', 14, '2023-05-23 02:28:17', NULL),
(111, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24d1bff97.jpg', 14, '2023-05-23 02:28:33', NULL),
(112, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24dee565e.jpg', 14, '2023-05-23 02:28:46', NULL),
(113, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c24e8bd093.jpg', 14, '2023-05-23 02:28:56', NULL),
(114, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c2533b0ba7.jpg', 15, '2023-05-23 02:30:11', NULL),
(115, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c253d5f1ef.jpg', 15, '2023-05-23 02:30:21', NULL),
(116, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c2548c5541.jpg', 15, '2023-05-23 02:30:32', NULL),
(117, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c2557e6300.jpg', 15, '2023-05-23 02:30:47', NULL),
(118, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c262e9d8ff.jpg', 16, '2023-05-23 02:34:22', NULL),
(119, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c264126909.jpg', 16, '2023-05-23 02:34:41', NULL),
(120, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c264c1845e.jpg', 16, '2023-05-23 02:34:52', NULL),
(121, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c265907fb9.jpg', 16, '2023-05-23 02:35:05', NULL),
(122, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c26cf4f81d.jpg', 17, '2023-05-23 02:37:03', NULL),
(123, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c26d83f3bb.jpg', 17, '2023-05-23 02:37:12', NULL),
(124, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c26eaa0db9.jpg', 17, '2023-05-23 02:37:30', NULL),
(125, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c26f47d8e0.jpg', 17, '2023-05-23 02:37:40', NULL),
(126, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c276316752.jpg', 18, '2023-05-23 02:39:31', NULL),
(127, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c276d3db4a.jpg', 18, '2023-05-23 02:39:41', NULL),
(128, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c2778857fc.jpg', 18, '2023-05-23 02:39:52', NULL),
(129, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c27bbb3790.jpg', 19, '2023-05-23 02:40:59', NULL),
(130, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c27c574cef.jpg', 19, '2023-05-23 02:41:09', NULL),
(131, 'http://localhost/manga-comic-be/views/Dashboard/img\\chapter\\646c27e84d5ef.jpg', 19, '2023-05-23 02:41:44', NULL),
(132, 'https://i221.ntcdntempv3.com/data/images/11658/269500/001.jpg?data=net', 20, '2023-05-23 02:44:53', NULL),
(133, 'https://i221.ntcdntempv3.com/data/images/11658/269500/002.jpg?data=net', 20, '2023-05-23 02:45:00', NULL),
(134, 'https://i221.ntcdntempv3.com/data/images/11658/269500/003.jpg?data=net', 20, '2023-05-23 02:45:08', NULL),
(135, 'https://i221.ntcdntempv3.com/data/images/11658/269500/004.jpg?data=net', 20, '2023-05-23 02:45:23', NULL),
(136, 'https://i221.ntcdntempv3.com/data/images/11658/277433/002.jpg?data=net', 21, '2023-05-23 02:45:58', NULL),
(137, 'https://i221.ntcdntempv3.com/data/images/11658/277433/003.jpg?data=net', 21, '2023-05-23 02:46:06', NULL),
(138, 'https://i221.ntcdntempv3.com/data/images/11658/277433/004.jpg?data=net', 21, '2023-05-23 02:46:17', NULL),
(139, 'https://i221.ntcdntempv3.com/data/images/11658/277433/005.jpg?data=net', 21, '2023-05-23 02:46:26', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `character`
--

CREATE TABLE `character` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `char_full` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `story_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `character`
--

INSERT INTO `character` (`id`, `keyword`, `name`, `avatar`, `char_full`, `role`, `desc`, `story_id`, `created_at`, `updated_at`) VALUES
(1, '86', 'Lena', 'https://anime-86.com/assets/img/character-second/chara_thumb_rena.jpg', 'https://anime-86.com/assets/img/character-second/chara_rena.png', 'main', 'She is the commander of Shinei Nouzen and the Spearhead Squadron, whom she communicates with via the long-distance communication device known as the Para-RAID. After the Spearhead Squadron`s departure, she becomes known for demanding orders and highly competent leadership, earning the nickname of Bloody Reina.', 1, '2023-05-19 03:02:19', NULL),
(2, '86', 'Shin', 'https://anime-86.com/assets/img/character-second/chara_thumb_shin.jpg', 'https://anime-86.com/assets/img/character-second/chara_shin.png', 'main', 'He is the leader of the Spearhead Squadron, as well as the default operations commander of the Eighty-Sixth Strike Package. Among the Eighty-Six, he is known as the Reaper (死神, Shinigami?) of the Eastern Front. His ability to hear the voices of the Legion designated him as a high-priority target with the callsign of Báleygr (バーレイグ, Bāreigu?)', 1, '2023-05-19 03:02:19', NULL),
(3, '86', 'Frederica Rosenfort', 'https://anime-86.com/assets/img/character-second/chara_thumb_frederica.jpg', 'https://anime-86.com/assets/img/character-second/chara_frederica.png', 'main', 'She is the Mascot of the Nordlicht Squadron and the last empress of the former Giadian Empire. She has the ability to see the past and present of a person known to her.', 1, '2023-05-19 03:02:19', NULL),
(4, 'my-dress-up-darling', 'Kitagawa Marin', 'https://cdn.shopify.com/s/files/1/1158/2192/products/MyDressUpDarling-MarinKitagawa.png', 'https://animegirlpng.com/wp-content/uploads/2023/03/1680084990216.png', 'main', 'Marin Kitagawa is an above-average height girl with a slim waistline and light skin tone. Her eyes are naturally a dark brown, though she is almost always seen with dark pink color contacts when she isn`t cosplaying.', 2, '2023-05-19 03:02:19', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `news_id` int(10) UNSIGNED DEFAULT NULL,
  `story_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `news_id`, `story_id`, `parent_id`, `thumbnail`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 12, NULL, NULL, NULL, 'Thông tin hữu dụng quá😆😃😁', '2023-05-22 14:43:38', NULL),
(2, 1, 12, NULL, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\646b7fd2787f4.jfif', 'Hình này đẹp không?', '2023-05-22 14:44:34', NULL),
(3, 2, 12, NULL, 2, NULL, 'Không', '2023-05-22 14:45:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite`
--

CREATE TABLE `favorite` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `stories_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `favorite`
--

INSERT INTO `favorite` (`id`, `user_id`, `stories_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-05-22 14:41:36', NULL),
(2, 2, 4, '2023-05-22 16:25:51', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genres`
--

CREATE TABLE `genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `background` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `genres`
--

INSERT INTO `genres` (`id`, `keyword`, `name`, `background`, `created_at`, `updated_at`) VALUES
(1, 'action', 'Action', 'http://localhost/manga-comic-be/assets/images/base/genres/action.jpg', '2023-05-19 03:02:19', NULL),
(2, 'adventure', 'Adventure', 'http://localhost/manga-comic-be/assets/images/base/genres/adventure.jpg', '2023-05-19 03:02:19', NULL),
(3, 'comedy', 'Comedy', 'http://localhost/manga-comic-be/assets/images/base/genres/comedy.jpg', '2023-05-19 03:02:19', NULL),
(4, 'romance', 'romance', 'http://localhost/manga-comic-be/assets/images/base/genres/romance.jpg', '2023-05-19 03:02:19', NULL),
(5, 'drama', 'Drama', 'http://localhost/manga-comic-be/assets/images/base/genres/drama.jpg', '2023-05-19 03:02:19', NULL),
(6, 'mecha', 'Mecha', 'http://localhost/manga-comic-be/assets/images/base/genres/mecha.jpg', '2023-05-19 03:02:19', NULL),
(7, 'slice-of-life', 'Slice of life', 'http://localhost/manga-comic-be/assets/images/base/genres/sliceoflife.jpg', '2023-05-19 03:02:19', NULL),
(8, 'supernatural', 'Super natural', 'http://localhost/manga-comic-be/assets/images/base/genres/supernatual.jpg', '2023-05-19 03:02:19', NULL),
(9, 'magic', 'Magic', 'http://localhost/manga-comic-be/assets/images/base/genres/magic.jpg', '2023-05-19 03:02:19', NULL),
(10, 'fantasy', 'Fantasy', 'http://localhost/manga-comic-be/assets/images/base/genres/fantasy.jpg', '2023-05-19 03:02:19', NULL),
(11, 'psychological', 'Psychological', 'http://localhost/manga-comic-be/assets/images/base/genres/psy.jpg', '2023-05-19 03:02:19', NULL),
(12, 'school', 'School', 'http://localhost/manga-comic-be/assets/images/base/genres/school.jpg', '2023-05-19 03:02:19', NULL),
(13, 'sport', 'Sport', 'http://localhost/manga-comic-be/assets/images/base/genres/sport.jpg', '2023-05-19 03:02:19', NULL),
(14, 'music', 'Music', 'http://localhost/manga-comic-be/assets/images/base/genres/music.jpg', '2023-05-19 03:02:19', NULL),
(15, 'shonen', 'Shonen', 'http://localhost/manga-comic-be/assets/images/base/genres/shonen.jpg', '2023-05-19 03:02:19', NULL),
(16, 'yuri', 'Yuri', 'http://localhost/manga-comic-be/assets/images/base/genres/yuri.jpg', '2023-05-19 03:02:19', NULL),
(17, 'josei', 'Josei', 'http://localhost/manga-comic-be/assets/images/base/genres/josei.jpg', '2023-05-19 03:02:19', NULL),
(18, 'harem', 'Harem', 'http://localhost/manga-comic-be/assets/images/base/genres/harem.jpg', '2023-05-19 03:02:19', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_news_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `views` int(10) DEFAULT NULL,
  `languages` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `category_news_id`, `title`, `keyword`, `author`, `content`, `thumbnail`, `views`, `languages`, `country`, `created_at`, `updated_at`) VALUES
(1, 3, 'Nền Tảng Giao Lưu \"Bài Ca Của Gió\" mở hạn giờ, hãy cùng những Nhà Lữ Hành khác giao lưu và chia sẻ về âm nhạc tuyệt vời nhé!', NULL, 'Huy Nguyễn', 'Chào mừng các Nhà Lữ Hành đến với Lễ Hội Hoa Gió. Thành Mondstadt đang tổ chức một trò chơi nhỏ có tên là \"Bài Ca Của Gió\". Trong trò chơi này, giống như nhà thơ trong Thành Mondstadt, bạn có thể chơi và chỉnh sửa những giai điệu lay động lòng người...\n\nĐồng thời, Nền Tảng Giao Lưu \"Bài Ca Của Gió\" sẽ mở hạn giờ. Nhà Lữ Hành có thể chỉnh sửa và chia sẻ thông tin biên khúc trong trò chơi của bạn trên nền tảng, xem nhạc phổ do Nhà Lữ Hành khác sáng tác và đăng tải khiêu chiến diễn tấu của bạn!\n\nCùng nhau diễn tấu nhạc khúc của riêng bạn trong những cơn gió của Mondstadt!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/03/94c01e0e6d539e6ae98c4a878fffadc7_3687524577907637670.png', 1050, 'English', 'Japan', '2023-03-03 19:20:55', '2023-03-04 19:51:36'),
(2, 2, 'Gợi Ý Cách Chơi \"Bài Ca Của Gió\"\r\n', NULL, 'Huy Nguyễn', 'Nhà Lữ Hành thân mến, sự kiện \"Hơi Thở Hoa Gió\" đã mở, tham gia vào cách chơi \"Bài Ca Của Gió\" trong đó, sẽ có thể diễn tấu ca khúc, biên tập nhạc phổ, và còn có thể giao lưu chia sẻ biên khúc của mình với các Nhà Lữ Hành khác trên Nền Tảng \"Giao Lưu Nhạc Khúc\".\n\nTiếp theo đây sẽ mang tới cho Nhà Lữ Hành một số gợi ý nhỏ về cách chơi \"Bài Ca Của Gió\", hãy cùng xem nhé!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/02/a99dd9f8d39f73fe5d81eb161f0be940_8999277107231385163.jpg', 1000, 'Vi', 'Japan', '2023-03-03 19:33:21', '2023-03-04 19:51:42'),
(3, 3, 'Hướng Dẫn Cách Chơi \"Hơi Thở Hoa Gió\"\r\n', NULL, 'Huy Nguyễn', 'Nhà Lữ Hành thân mến, \"Lễ Hội Hoa Gió\" sắp ra mắt rồi, hãy cùng xem trong sự kiện mới \"Hơi Thở Hoa Gió\" có những cách chơi thú vị nào nhé!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/01/28f7a150c4fa0c9c2ec33e7c7ee393ff_9100836074446455307.png', 900, 'Vi', 'Japan', '2023-03-03 19:55:26', NULL),
(4, 4, '[Genshin Impact] - Dehya: Tấm Lòng Cát Nóng\r\n', NULL, 'Huy Nguyễn', 'Lính đánh thuê luôn làm những công việc đẫm máu, lừa dối và xu nịnh muôn nơi.\r\n\r\nChính vì nguyên nhân này, một lính đánh thuê chính trực như Dehya mới được các chủ thuê yêu thích nhất.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/01/043718769c52a18b9bdafbd412705650_1475157220479221254.jpg', 9000, 'En', 'Japan', '2023-03-03 19:57:05', NULL),
(5, 4, 'Nhận Cánh Tiệc Sao Mới, Để Hành Trình Thêm Thú Vị | Genshin Impact X Prime Gaming\r\n', NULL, 'huy ng', 'Để sự kiện Prime Gaming trở nên thú vị hơn, các Nhà Lữ Hành tham gia sự kiện có thể nhận được phần thưởng đặc biệt của sự kiện hợp tác - 1 cặp Cánh Tiệc Sao.\r\n\r\nTrong thời gian từ 12/2022 đến 05/2023, các thành viên Prime Gaming có thể nhận miễn phí mã đổi quà Genshin Impact để đổi các vật phẩm trong game trên Prime Gaming; Mã đổi thưởng được cập nhật ba tuần một lần. Trong trường hợp người chơi nhận quà từ 4 lần trở lên, thì phần thưởng Cánh Tiệc Sao sẽ được gửi qua hộp thư trong game trong vòng 30 ngày làm việc sau khi kết thúc lần đổi thứ 8 của sự kiện. Một tài khoản chỉ được nhận tối đa 1 Cánh Tiệc Sao.\r\n\r\nLưu ý: Quà game Genshin Impact chỉ dành cho người chơi ở khu vực chỉ định mới được nhận.\r\n\r\nCách tham gia:\r\n\r\n1. Trong thời gian sự kiện, đăng nhập mục Genshin Impact tại Prime Gaming\r\n\r\n>>> Link<<<\r\n\r\n2. Đăng nhập tài khoản Amazon của bạn\r\n\r\n3. Tại thẻ túi quà ấn nút \"Nhận\" sẽ nhận được mã đổi thưởng Genshin Impact để nhận phần thưởng\r\n\r\n*Phải đăng ký tài khoản Amazon Prime mới có thể nhận, mỗi Amazon Prime chỉ được nhận túi quà 1 lần, mỗi UID chỉ được nhận Túi Quà Prime Gaming 1 lần\r\n\r\n**Phần thưởng game hiện tại chỉ có thể nhận trong giai đoạn hiện tại, sau khi quá thời gian sự kiện mỗi kỳ, Nhà Lữ Hành sẽ không thể nhận thưởng nữa. Nhà Lữ Hành hãy chú ý thời gian sự kiện của gói quà mỗi kỳ nhé.\r\n\r\nVề Prime Gaming:\r\n\r\nThành viên Amazon Prime có thể miễn phí tận hưởng các nội dung độc quyền được người chơi yêu thích nhất như game PC, game console hoặc game mobile thông qua Prime Gaming.\r\n\r\nNgoài ra, hàng tháng, thành viên Amazon Prime còn có thể miễn phí nhận nhiều game vĩnh viễn, và có cơ hội miễn phí đăng ký kênh Twitch trong tháng đó. Nội dung trong game và game PC miễn phí của Prime Gaming sẽ liên tục được bổ sung và cập nhật, đồng thời mỗi tháng đều có sản phẩm mới và game miễn phí được thêm vào danh sách để thành viên lựa chọn.\r\n\r\nNgoài ra, Prime còn có nhiều phúc lợi, bao gồm mua sắm và giải trí tốt nhất từ Amazon; Trong đó bao gồm dịch vụ giao hàng nhanh, miễn phí, ưu đãi độc quyền, phúc lợi đặt trước, Prime Day v.v. Thành viên Prime có thể xem các chương trình truyền hình, phim truyện, thể thao v.v. không giới hạn với Prime Video, nghe 2 triệu bài hát, hàng nghìn đài phát thanh và danh sách phát miễn phí với Amazon Music, có thể đọc hơn 1000 cuốn sách và tạp chí không giới hạn với Prime Reading, sở hữu bộ nhớ ảnh miễn phí không giới hạn với Amazon Photos.\r\n\r\nFAQ:\r\n\r\n1. Mã đổi thưởng nhận được trong Prime Gaming có hết hạn không?\r\n\r\nCó, mã đổi thưởng có thời gian kết thúc, thời gian cụ thể vui lòng xem bên dưới:\r\n\r\n- Mã đổi thưởng Túi Quà #1 sẽ hết hạn vào 23:59 04/01 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #2 sẽ hết hạn vào 23:59 25/01 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #3 sẽ hết hạn vào 23:59 15/02 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #4 sẽ hết hạn vào 23:59 08/03 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #5 sẽ hết hạn vào 23:59 29/03 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #6 sẽ hết hạn vào 23:59 19/04 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #7 sẽ hết hạn vào 23:59 10/05 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #8 sẽ hết hạn vào 23:59 31/05 (UTC+8)\r\n\r\n2. Tôi có thể nhận mã đổi thưởng của túi quà đã kết thúc trong sự kiện này không?\r\n\r\nTúi quà trong kỳ chỉ có thể nhận được trong kỳ đó, sau khi kết thúc mỗi kỳ, người chơi sẽ không thể nhận mã đổi thưởng của túi quà đã hết hạn.\r\n\r\n3. Làm sao để nhận được Cánh Tiệc Sao?\r\n\r\nTrong trường hợp người chơi nhận quà từ 4 lần trở lên, thì phần thưởng Cánh Tiệc Sao sẽ được gửi qua hộp thư trong game trong vòng 30 ngày làm việc sau khi kết thúc lần đổi thứ 8 của sự kiện. Nếu chỉ nhận mã đổi sẽ không được tính, chỉ khi sử dụng mã đổi quà mới tính là đổi thành công.\r\n\r\n4. Túi quà có thể đổi ở những server nào của game?\r\n\r\nTúi quà chỉ được đổi ở server Asia, Europe, America, HK/MO/TW. Túi quà này không thể đổi ở Đảo Thiên Không và Cây Thế Giới.\r\n\r\n5. Tôi có thể nhận được túi quà này trên nhiều nền tảng khác nhau không?\r\n\r\nCó thể, chỉ cần bảo đảm tài khoản đăng nhập các nền tảng khác nhau là một, và tài khoản này từng đổi thưởng, là sẽ có thể sử dụng phần thưởng của cùng một tài khoản trên nhiều nền tảng khác nhau.\r\n\r\n6. Nếu tôi có vấn đề mà không được giải quyết ở trên thì sao?\r\n\r\nNếu quyền lợi thành viên Amazon Prime của người chơi gặp vấn đề, xin hãy liên hệ Prime Gaming Support.\r\n\r\nNếu như tài khoản game của người chơi gặp vấn đề, xin hãy tham khảo https://www.hoyolab.com/article/202963', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/28/952b658c21c0e2ace586903fdb8e43dd_2776874369293221033.png', 1999, 'VI', 'Japan', '2023-03-03 20:56:49', NULL),
(6, 4, 'Tuyển tập Genshin Impact - A Handful of Golden Dreams\r\n', NULL, 'huy ng', 'Bốc một nắm cát, mỗi một hạt đều như giấc mộng vàng đẹp đẽ.\r\n\r\nTrong giấc mơ đêm yên tĩnh, mỗi khoảnh khắc đều như dòng cát chảy.\r\n\r\nCho đến khi giấc mơ đưa thế giới trở lại hiện thực, nắng mai vừa hửng, tỏa sáng rạng rỡ.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/27/148beaf6cae051b681dc613d6c00ed48_3579586081830564772.jpg', 1525, 'VI', 'Japan', '2023-03-03 20:56:49', NULL),
(7, 4, 'Giới thiệu nhân vật trong Genshin Impact - [Dehya: Sư Tử Lửa Lấp Lánh]', NULL, 'huyng', 'Bờm và đuôi sư tử, rạng rỡ trong ánh sáng thiêu đốt.\r\n\r\nMàu vàng hay cát đỏ cũng đều giống nhau dưới ánh mặt trời.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/28/99ff9b80982295df3af265471fcbede0_617911984690046410.jpg', 1000, NULL, NULL, '2023-03-04 09:01:39', NULL),
(8, 4, '[Genshin Impact] - Sự kiện web \"Hành Trình Cát Đỏ\" của nhân vật mới Dehya chính thức ra mắt.\r\n', NULL, NULL, '〓Thời Gian Sự Kiện〓\r\n\r\n12:00 24/02/2023 - 23:59 02/03/2023 (UTC+8)\r\n\r\n〓Điều Kiện Tham Gia〓\r\n\r\nHạng mạo hiểm ≥10\r\n\r\n〓Giới Thiệu Sự Kiện〓\r\n\r\nTrong thời gian sự kiện, hoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được phần thưởng đạo cụ trong game nhé!\r\n\r\n〓Hướng Dẫn Cách Chơi〓\r\n\r\n1. Trong thời gian sự kiện, hoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được phần thưởng đạo cụ trong game;\r\n\r\n2. Tương tác với vật phẩm đặc biệt trong khung cảnh để thu thập kiến thúc hành trình.\r\n\r\n〓Thưởng Trò Chơi〓\r\n\r\nHoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được Nguyên Thạch, nguyên liệu đột phá nhân vật và các phần thưởng trong game khác.\r\n\r\n〓Lưu Ý〓\r\n\r\n1. Nhà Lữ Hành vui lòng đăng nhập bằng Thẻ Thông Hành HoYoverse và liên kết nhân vật trong game Genshin Impact để tham gia sự kiện, nhằm đảm bảo cho việc phát và nhận thưởng sự kiện được thuận lợi.\r\n\r\n2. Sau khi sự kiện kết thúc, sẽ không thể nhận hình nền sự kiện, Nhà Lữ Hành hãy kịp thời nhận nhé!\r\n\r\n3. Sau khi thu thập tất cả kiến thức của cuộc hành trình, phần thưởng sẽ được phát qua hòm thư trong game, thư có thời hạn 30 ngày, hãy chú ý nhận nhé.\r\n\r\n4. Trong thời gian bảo trì cập nhật phiên bản sẽ không thể truy cập sự kiện web, sau khi hoàn thành cập nhật phiên bản sẽ có thể truy cập bình thường, Nhà Lữ Hành hãy chú ý nhé.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/24/af288d501a1ea9e14ff99e91e16e35a9_822801420125750324.jpg', NULL, NULL, NULL, '2023-03-04 09:01:39', NULL),
(9, 4, 'Nhà Lữ Hành thân mến, sự kiện cầu nguyện \"Nắng Vàng Rực Rỡ\", \"Tà Dương Phán Quyết\", \"Thân Hình Thần Đúc\" sẽ mở vào 01/03!\r\n', NULL, NULL, 'Trong thời gian sự kiện, Nhà Lữ Hành có thể nhận thêm vũ khí và nhân vật trong sự kiện cầu nguyện để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 5 sao Sư Tử Lửa - Dehya (Hỏa) sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 4 sao Thử Thách Của Vận Mệnh - Bennett (Hỏa), Thần Tượng Tỏa Sáng - Barbara (Thủy), Mầm Non Tái Sinh - Collei (Thảo) sẽ tăng mạnh!\r\n\r\n● Sau khi kết thúc sự kiện, nhân vật 5 sao Sư Tử Lửa - Dehya (Hỏa) sẽ vào cầu nguyện thường Du Hành Thế Gian trong phiên bản tiếp theo.\r\n\r\n※ Lần cầu nguyện này là sự kiện Cầu Nguyện Nhân Vật, số lần đảm bảo của sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2 sẽ được tính chung, đồng thời được tích lũy trong sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2, được tính độc lập với các sự kiện cầu nguyện khác và không ảnh hưởng lẫn nhau.\r\n\r\n※ Trong thời gian mở Cầu Nguyện, sẽ mở sự kiện dùng thử nhân vật \"Thử Thân Thủ\", Nhà Lữ Hành có thể sử dụng đội hình cố định có chứa nhân vật dùng thử để vượt ải chỉ định và thử nghiệm tính năng. Sau khi vượt qua thử thách sẽ nhận được phần thưởng tương ứng!\r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện cầu nguyện để xem.\r\nCầu Nguyện \"Tà Dương Phán Quyết\": UP Xác Suất \"Phán Quyết Ẩn Mật - Cyno (Lôi)\"!\r\n\r\nTrong thời gian sự kiện, Nhà Lữ Hành có thể nhận thêm vũ khí và nhân vật trong sự kiện cầu nguyện để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n \r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 5 sao giới hạn Phán Quyết Ẩn Mật - Cyno (Lôi) sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 4 sao Thử Thách Của Vận Mệnh - Bennett (Hỏa), Thần Tượng Tỏa Sáng - Barbara (Thủy), Mầm Non Tái Sinh - Collei (Thảo) sẽ tăng mạnh!\r\n\r\n※ Trong các nhân vật ở trên, nhân vật giới hạn sẽ không vào Cầu Nguyện Thường \"Du Hành Thế Gian\".\r\n\r\n※ Lần cầu nguyện này là sự kiện Cầu Nguyện Nhân Vật-2, số lần đảm bảo của sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2 sẽ được tính chung, đồng thời được tích lũy trong sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2, được tính độc lập với các sự kiện cầu nguyện khác và không ảnh hưởng lẫn nhau.\r\n\r\n※ Trong thời gian mở Cầu Nguyện, sẽ mở sự kiện dùng thử nhân vật \"Thử Thân Thủ\", Nhà Lữ Hành có thể sử dụng đội hình cố định có chứa nhân vật dùng thử để vượt ải chỉ định và thử nghiệm tính năng. Sau khi vượt qua thử thách sẽ nhận được phần thưởng tương ứng!\r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện để xem.\r\n\r\nCầu Nguyện \"Thân Hình Thần Đúc\": UP Xác Suất \"Trọng Kiếm - Hải Đăng Bờ Biển Lau\", \"Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ\"!\r\n\r\nTrong thời gian sự kiện, Nhà Lữ Hành có thể nhận nhiều vũ khí và nhân vật trong sự kiện cầu nguyện \"Thân Hình Thần Đúc\" để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n \r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận vũ khí 5 sao giới hạn Trọng Kiếm - Hải Đăng Bờ Biển Lau, Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận vũ khí 4 sao giới hạn Kiếm Đơn - Tia Sáng Nơi Hẻm Tối, Cung - Thợ Săn Hẻm Tối, vũ khí 4 sao Trọng Kiếm - Đại Kiếm Tế Lễ, Vũ Khí Cán Dài - Tai Ương Của Rồng, Pháp Khí - Chiêu Tâm sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, có thể sử dụng Định Chuẩn Thần Đúc để tiến hành định chuẩn đối với vũ khí UP 5 sao kỳ này là Trọng Kiếm - Hải Đăng Bờ Biển Lau hoặc Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ, các thông tin khác về \"Định Chuẩn Thần Đúc\" có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện cầu nguyện để xem.\r\n\r\n※ Trong các vũ khí ở trên, vũ khí giới hạn sẽ không vào Cầu Nguyện Thường \"Du Hành Thế Gian\".\r\n\r\n \r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện để xem.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/27/33141d7c2e5be7ec7d3678a69610c446_8072336947262077121.jpg', NULL, NULL, NULL, '2023-03-04 09:01:39', NULL),
(10, NULL, 'Giới Thiệu Thẻ Bài Mới Trong Thất Thánh Triệu Hồi Phiên Bản 3.5\r\n', '', NULL, 'Nhà Lữ Hành thân mến, sau khi cập nhật phiên bản 3.5, cách chơi Thất Thánh Triệu Hồi sẽ có thêm Thẻ Nhân Vật \"Eula\", \"Sangonomiya Kokomi\", \"Kujou Sara\" và Thẻ Thiên Phú tương ứng cùng 2 Thẻ Trang Bị mới. Cùng đến xem nào!\r\n\r\nSau khi cập nhật phiên bản 3.5, đến Quán Rượu Đuôi Mèo để mời nhân vật quyết đấu, đạt mục tiêu khiêu chiến chỉ định sẽ nhận được Thẻ Nhân Vật và Thẻ Thiên Phú tương ứng. Thẻ Trang Bị mới có thể mua trong Cửa Hàng Thẻ Bài.\r\n\r\n*Nhóm phát triển sẽ tiếp tục theo dõi trải nghiệm game của các Nhà Lữ Hành và tiến hành điều chỉnh, ưu hóa tính cân bằng của thẻ bài. Thông tin thẻ bài vui lòng lấy nội dung chính thức trong game làm chuẩn.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/23/278619f8b177c561b43deaf85af7e754_1777221815824703679.png', NULL, NULL, NULL, '2023-03-04 09:02:44', NULL),
(11, 2, 'Attack on Titan nói lời tạm biệt với nghệ thuật chính của phần cuối cùng phần 2 sâu sắc', NULL, 'Minh', 'Tập cuối của Attack on Titan nhận được key visual mới.\n\nTheo Crunchyroll, MAPPA Stage Show 2023 gần đây đã mang đến cho người hâm mộ Attack on Titan cái nhìn đầu tiên về nửa sau của Attack on Titan Final Season The Final Chapters. Sự kiện này chứng kiến ​​hãng phim tiết lộ một áp phích có hình ảnh độc đáo và một đoạn văn bản. Văn bản có thể tạm dịch là “Tạm biệt Eren” kể về nhân vật chính, Eren Jaeger.\n\nTấm áp phích cho thấy một ngôi nhà gỗ đơn độc ở giữa một số cây xanh, với một chiếc ghế gỗ và bàn bên ngoài. Hiện ra lờ mờ ở phía dưới ảnh là hai cái bóng khổng lồ trông như những người khổng lồ. Những cái bóng dường như cũng đang nắm tay nhau và đi về phía tòa nhà. Bay phía trên cabin là một con chim, phản ánh những khoảnh khắc mở đầu từ tập đầu tiên của chap trình.\n\nChap trình sân khấu của MAPPA cũng bao gồm nhiều nội dung khác của Attack on Titan bên cạnh việc tiết lộ hình ảnh. Các diễn viên lồng tiếng Yuki Kaji (Eren Jaeger), Yui Ishikawa (Mikasa Ackerman) và Romi Park (Hange Zoe) đã tham gia buổi đọc trực tiếp một số cảnh nổi tiếng nhất của anime. Đạo diễn của chap trình, Yuichiro Hayashi, cũng tham gia cùng họ. Hayashi cho biết hình ảnh mới này có thể sẽ là hình ảnh cuối cùng được cung cấp cho dự án.\nAttack on Titan, dựa trên truyện tranh của Hajime Isayama, bắt đầu phát sóng tại Nhật Bản vào năm 2013 dưới Wit Studio. Sau đó, Studio MAPPA, người đã phát hành nửa đầu vào tháng 12 năm 2020, tiếp quản sản xuất Phần cuối. Lần chạy cuối cùng cho nhượng quyền thương mại này được chia thành nhiều phần, với hai phần đầu tiên bao gồm hai phần mỗi phần và phần cuối cùng bao gồm hai tập phim dài tập. Phần cuối cùng trong số này có kế hoạch ra mắt vào mùa thu năm 2023.\n\n\nStudio MAPPA Stage Show 2023 đã cung cấp thông tin cập nhật cho nhiều dự án ngoài sử thi hành động-kinh dị. Ví dụ, Jujutsu Kaisen của chap trình, một trong bộ ba nhân vật đen tối của anime và Vinland Saga, được lấy cảm hứng từ truyền thuyết Viking thực tế, cả hai đều nhận được các đoạn giới thiệu, phần trước giới thiệu phần thứ hai sắp tới và phần sau cho thấy phần cuối của Phần 2. Tuy nhiên, những người hâm mộ Chainsaw Man của Tatsuki Fujimoto đã thất vọng sau khi không nhận được thông tin cập nhật mới nào về dự án. Ngoài các tựa phim hiện có, hãng phim đã thông báo rằng họ sẽ sản xuất một anime mới có tựa đề Bucchigiri?!, cũng đã nhận được một đoạn giới thiệu giới thiệu.\n\n\nTất cả bốn phần của Attack on Titan đều có sẵn để xem trên Crunchyroll.\n\nNguồn: Crunchyroll', 'https://otakugo.net/wp-content/uploads/2023/05/Attack-on-Titan-noi-loi-tam-biet-voi-nghe-thuat.jpg', NULL, 'Vi', 'Japan', '2023-05-22 07:34:39', '2023-05-22 07:34:58'),
(12, 2, 'NGƯỜI HÂM MỘ CHAINSAW MAN THẤT VỌNG VỚI VIỆC MAPPA THIẾU CẬP NHẬT PHẦN 2', NULL, 'Minh', 'Buổi giới thiệu anime gần đây MAPPA Stage 2023 đã khiến người hâm mộ Chainsaw Man thất vọng.\n\nNhững người hâm mộ anime đã lên mạng xã hội để bày tỏ sự thất vọng của họ với việc thiếu nội dung mới sau buổi biểu diễn trên sân khấu MAPPA, theo báo cáo của Sportskeeda. Sự kiện này cập nhật và tiết lộ các dự án mà công ty sản xuất đang thực hiện, với loạt phim kinh dị hành động không nhận được tin tức lớn nào. Việc thiếu thông tin này đã gây sốc cho nhiều khán giả đã theo dõi, hy vọng được xem thông báo và đoạn giới thiệu Phần 2.\n\nAnime Chainsaw Man đã kết thúc phần trước của nó trong một sự thất bại thảm hại, khiến nhiều người hâm mộ khao khát phần tiếp theo của bộ truyện. Thật không may, không có xác nhận rằng anime sẽ tiếp tục tại thời điểm viết. Tuy nhiên, một cuộc phỏng vấn gần đây với Giám đốc điều hành của MAPPA (Manabu Otsuka) nói rằng họ vẫn háo hức tìm kiếm thành công cho nó, mặc dù tuyên bố rằng nó hoạt động kém hơn so với mong đợi của họ. “Chúng tôi sẽ khám phá cách tiếp cận đối tượng mục tiêu, những người sẽ trả tiền cho công việc của CSM,” Otsuka nói.\n\nMặc dù MAPPA không đưa ra thông tin cập nhật nào về loạt phim, nhưng chap trình vẫn cung cấp một số nội dung cho người hâm mộ. Điều này bao gồm một phân đoạn mà dàn diễn viên lồng tiếng của bộ ba chính — Kikonusuke Toya (Denji), Ai Fairouz (Power) và Shogo Sakata (Aki) — đã thảo luận về những khoảnh khắc yêu thích của họ trong anime. Tomori Kusunoki, diễn viên lồng tiếng cho Makima, cũng dự kiến ​​sẽ xuất hiện nhưng phải rút khỏi chap trình vì bị ốm. Ngoài ra, một phiên bản linh vật khổng lồ của Quỷ khuyển Pochita cũng xuất hiện.\nChap trình sân khấu của MAPPA đã hiển thị các bản cập nhật cho một số thuộc tính nổi bật nhất của công ty. Ví dụ: một đoạn giới thiệu đã được tiết lộ cho mùa thứ hai sắp tới của thành viên “Bộ ba đen tối” Jujutsu Kaisen của CSM. Ngoài ra, sử thi Viking Vinland Saga hiện đang được phát sóng đã nhận được một đoạn giới thiệu tóm tắt câu chuyện cho đến nay và hé lộ về phần cuối của Phần 2 sắp tới. Attack on Titan cũng nhận được key visual mới. Cuối cùng, một dự án anime gốc mới có tên Bucchigiri?! đã được tiết lộ.\n\nChainsaw Man theo chân một chàng trai trẻ tên Denji, người trở thành anh hùng nổi tiếng sau khi hợp nhất với con chó cưng của anh ta. Anh ta sớm tham gia Public Safety với tư cách là một thợ săn quỷ và sử dụng sức mạnh mới của mình như một người lai giữa người và quỷ để xoa dịu ý chí của Makima bí ẩn. Studio MAPPA đã chuyển thể bộ truyện tranh do Tatsuki Fujimoto viết vào năm 2022 và nhận được những đánh giá chung tích cực.\n\nBộ phim có sẵn để xem trên Crunchyroll. Ngoài ra, người hâm mộ có thể đọc truyện tranh trên trang web truyền thông Viz, với Chap 130 sẽ được phát hành vào ngày 23 tháng 5 năm 2023.\n\nNguồn: Twitter qua Sportskeeda', 'https://otakugo.net/wp-content/uploads/2023/05/Nguoi-ham-mo-Chainsaw-Man-that-vong-voi-viec-MAPPA.jpg', NULL, 'Vi', 'Japan', '2023-05-22 07:38:38', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-05-19 03:02:18', NULL),
(2, 'User', '2023-05-19 03:02:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status`
--

CREATE TABLE `status` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `status`
--

INSERT INTO `status` (`id`, `keyword`, `name`, `created_at`, `updated_at`) VALUES
(1, '0', 'Đang tiến hành', '2023-05-19 03:02:18', NULL),
(2, '1', 'Sắp chiếu', '2023-05-19 03:02:18', NULL),
(3, '2', 'Hoàn thành', '2023-05-19 03:02:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stories`
--

CREATE TABLE `stories` (
  `id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_romanji` varchar(255) DEFAULT NULL,
  `name_english` varchar(255) DEFAULT NULL,
  `name_japan` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `background` varchar(255) DEFAULT NULL,
  `descr` text DEFAULT NULL,
  `status_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(10) UNSIGNED DEFAULT NULL,
  `view_count` int(10) UNSIGNED DEFAULT 0,
  `favorite_count` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `stories`
--

INSERT INTO `stories` (`id`, `keyword`, `name`, `name_romanji`, `name_english`, `name_japan`, `country`, `thumbnail`, `background`, `descr`, `status_id`, `author_id`, `view_count`, `favorite_count`, `created_at`, `updated_at`) VALUES
(1, '86', '86 - Eighty Six', '86-エイティシックス-', '86 - Eighty Six', NULL, 'JP', 'https://m.media-amazon.com/images/M/MV5BOTA5NGVkMzYtODAzYi00YWQyLThhYzctZTQxNTM1NDY2YjU0XkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg', 'https://www.slashfilm.com/img/gallery/86-eighty-six-is-one-of-the-best-war-anime-ever-made/intro-1638465386.jpg', 'The Republic of San Magnolia has been at war with the Empire of Giad for nine years. Though it initially suffered devastating losses to the Empire\'s autonomous mechanized Legions, the Republic has since developed its own autonomous units, called Juggernauts, which are directed remotely by a Handler. While on the surface, the public believes the war is being fought between machines, in reality, the Juggernauts are being piloted by humans, all of whom are \"86\"—the designation given to the Colorata minority of San Magnolia. The 86 originally had equal rights, but were persecuted and scapegoated by the dominant Alba race and the Alba-supremacist Republic government to the point where Colorata were both officially designated and popularly considered subhuman. The 86 were not permitted to have personal names and were immured in internment camps in the 86th District (their namesake), all the while being forced to fight in the Republic\'s war with the Empire to receive better treatment.', 1, 1, 0, 0, '2023-05-19 03:02:18', NULL),
(2, 'my-dress-up-darling', 'Sono Bisque Doll wa Koi wo suru', 'Sono Bisque Doll wa Koi wo suru', 'MY DRESS-UP DARLING', 'その着せ替え人形ビスク・ドールは恋をする', 'JP', 'https://upload.wikimedia.org/wikipedia/en/thumb/2/2f/Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg/220px-Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg', 'https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2021/10/My-Dress-up-Darling-1-Cropped-scaled.jpg', 'Wakana Gojo is a high school student with a secret admiration for hina dolls and aspires to become a craftsman like his grandfather. Having been socially traumatized for his passion, he had closed himself off from everyone. One day at school, his classmate Marin Kitagawa runs into him using a sewing machine for making a dolls costume. After admiring Wakanas doll and praising his work, Marin asks if Wakana could help her create cosplays. Initially, Wakana is nervous about his ability to create cosplay costumes for Marin because of his experience being limited to Hina dolls. However, he agrees to do it.', 3, 2, 0, 0, '2023-05-19 03:02:18', NULL),
(3, 'darling-in-the-franxx', 'Darling in the Franxx', '', 'Darling in the Franxx', 'ダーリン・イン・ザ・フランキス', 'JP', 'https://upload.wikimedia.org/wikipedia/en/d/dc/DARLING_in_the_FRANXX%2C_second_key_visual.jpg', 'https://images.alphacoders.com/901/thumb-1920-901811.png', 'Darling in the Franxx is set in a dystopian future where children are artificially created and indoctrinated solely to defend the remnants of civilization. The story follows a squad of ten pilots, particularly focusing on the partnership between Hiro, a former prodigy, and Zero Two, a hybrid human and elite pilot who aspires to become entirely human.', 2, 3, 0, 0, '2023-05-19 03:02:18', NULL),
(4, 'kumo-desu-ga-nani-ka', 'Tôi là nhện đấy, có sao không?', 'Kumo desu ga, nani ka?', NULL, '蜘蛛ですが、なにか？', NULL, 'https://wallpapercave.com/dwp1x/wp8632188.jpg', 'https://wallpapercave.com/dwp1x/wp8443145.jpg', 'Tại một thế giới nơi dũng giả và quỷ vương chiến đấu, ma pháp khốc liệt của dũng giả và quỷ vương khiến một lớp học nơi thế giới khác phát nổ. Những học sinh trong lớp học bị chết vì vụ nổ ấy chuyển sinh sang thế giới đó. Nhân vật chính, một học sinh ngồi ở cuối lớp bị tái sinh thành một con quái vật nhện. Thế nhưng với ý chí mạnh mẽ bất thường, cô đã dần dần chấp nhận và học cách thích nghi hơn với thế giới.', 2, 4, 0, 0, '2023-05-19 03:21:25', '2023-05-20 15:17:37'),
(5, 'Soredemo-Ayumu-wa-Yosetekuru', 'Dù Vậy Thì Ayumu Vẫn Sẽ Tiếp Cận', 'Soredemo Ayumu wa Yosetekuru', NULL, 'それでも歩は寄せてくる', NULL, 'https://i.pinimg.com/236x/4e/3d/c6/4e3dc6a45b7f1752031ae234e767b16a.jpg', 'https://m.media-amazon.com/images/I/719Eq93Ic3L._AC_SY450_.jpg', 'Một ý thích bất chợt, Ayumu Tanaka năm nhất rời Câu lạc bộ Kendo để gia nhập Câu lạc bộ Shogi bất hợp pháp. Urushi Yaotome, chủ tịch câu lạc bộ và là một bậc thầy về shogi, rất vui mừng khi cuối cùng cũng có một người bạn chơi cùng. Là đàn anh của Ayumu, Urushi cố gắng trở thành người cố vấn shogi và hình mẫu học sinh của mình. Tuy nhiên, quá thường xuyên, cô ấy thấy mình đỏ mặt vì xấu hổ! Khuôn mặt như đá và trung thực, Ayumu không thấy vấn đề gì khi gọi Urushi là \"dễ thương\". Mặc dù Ayumu thích cô ấy, nhưng anh ấy không thể thú nhận và tự hứa với bản thân sẽ đánh bại cô ấy trong một trò chơi shogi.Thông qua cuộc sống học đường và các trò chơi shogi, hai học sinh đã có nhiều cuộc phiêu lưu vui nhộn và ấm lòng. Ayumu tận hưởng từng giây với Urushi, nhưng anh vẫn còn lâu mới đánh bại cô trong shogi. Với những gì đã cam kết với bản thân, liệu Ayumu có bao giờ có cơ hội để thổ lộ tình cảm của mình với Urushi?', 2, 5, 0, 0, '2023-05-22 07:45:26', '2023-05-22 08:07:25'),
(6, 'Gotōbun-no-Hanayome', 'Nhà có 5 nàng dâu', 'Gotōbun no Hanayome', NULL, '五等分の花嫁', NULL, 'https://i.pinimg.com/236x/c1/3a/55/c13a55e3b7fc86796129f9db6efe8df6.jpg', 'https://images2.alphacoders.com/131/thumbbig-1315536.webp', 'Go-Toubun no Hanayome là câu chuyện kể về một \"hot boy nhà nghèo\" mang tên Futaro Uesugi và đang học năm 2 ở cao trung. Để trang trải cuộc sống, cậu quyết định làm gia sư cho một gia đình giàu có. Tuy nhiên, người mà cậu dạy lại chính là bạn học của mình. Và đó là con gái nhưng không chỉ một mà là đến năm cô gái. Nhiệm vụ đầu tiên của cậu là phải \"dạy dỗ\" lại tất cả cô nàng này... Mỗi ngày là một sự kiện!! Liệu anh chàng này phải làm như thế nào đây?', 1, 6, 0, 0, '2023-05-22 08:18:54', '2023-05-22 08:20:38'),
(7, 'slime-taoshite-300-nen', 'Diệt slime suốt 300 năm, tôi lv max lúc nào không hay', 'Suraimu taoshite sanbyaku nen, shiranai uchi ni Reberu Makkusu ni nattemashita', NULL, 'スライム倒して300年、知らないうちにレベルMAXになってました', NULL, 'https://st.nettruyenplus.com/data/comics/134/slime-taoshite-300-nen-shiranai-uchi-ni-6907.jpg', 'https://wallpapercave.com/dwp1x/wp9273743.jpg', 'Azusa Aizawa, một con nghiện làm việc, qua đời do quá tải ngay ở trên công ti. Cổ được tái sinh trở thành một pháp sư ở một thế giới khác, một pháp sư bất tử với ngoại hình luôn luôn ở độ tuổi 17. Hằng ngày cổ được sống một cuộc sống nhẹ nhàng, bình lặng, với thú vui tao nhã là đập Slime kiếm tiền. Tuy vậy, sau 300 năm đằng đẵng farm Slime, cổ đã trở thành pháp sư mạnh nhất thế giới khi đã đạt level MAX mà không hay.', 2, 7, 0, 0, '2023-05-22 14:49:13', '2023-05-22 15:44:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `story_genres`
--

CREATE TABLE `story_genres` (
  `id` int(10) UNSIGNED NOT NULL,
  `genres_id` int(10) UNSIGNED DEFAULT NULL,
  `story_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `story_genres`
--

INSERT INTO `story_genres` (`id`, `genres_id`, `story_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-05-19 03:02:19', NULL),
(2, 5, 1, '2023-05-19 03:02:19', NULL),
(3, 6, 1, '2023-05-19 03:02:19', NULL),
(4, 3, 2, '2023-05-19 03:02:19', NULL),
(5, 5, 2, '2023-05-19 03:02:19', NULL),
(6, 4, 2, '2023-05-19 03:02:19', NULL),
(7, 7, 2, '2023-05-19 03:02:19', NULL),
(8, 5, 3, '2023-05-19 03:02:19', NULL),
(9, 6, 3, '2023-05-19 03:02:19', NULL),
(10, 11, 3, '2023-05-19 03:02:19', NULL),
(11, 1, 4, '2023-05-19 03:22:28', NULL),
(12, 2, 4, '2023-05-19 03:22:33', NULL),
(13, 3, 4, '2023-05-19 03:22:42', NULL),
(14, 10, 4, '2023-05-19 03:22:50', NULL),
(15, 8, 4, '2023-05-19 03:24:12', NULL),
(17, 3, 5, '2023-05-22 08:00:52', NULL),
(18, 4, 5, '2023-05-22 08:00:55', NULL),
(19, 12, 5, '2023-05-22 08:01:07', NULL),
(20, 15, 5, '2023-05-22 08:01:22', NULL),
(21, 7, 5, '2023-05-22 08:01:26', NULL),
(22, 3, 6, '2023-05-22 08:20:49', NULL),
(23, 18, 6, '2023-05-22 08:20:58', NULL),
(24, 4, 6, '2023-05-22 08:21:11', NULL),
(25, 12, 6, '2023-05-22 08:21:18', NULL),
(26, 2, 7, '2023-05-22 14:49:34', NULL),
(27, 3, 7, '2023-05-22 14:49:39', NULL),
(28, 10, 7, '2023-05-22 14:49:46', NULL),
(29, 7, 7, '2023-05-22 14:50:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `phone`, `role_id`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'huyAdmin', 'huy12@gmail.com', 'huy12', '123', '0123', 1, NULL, '2023-05-19 03:02:18', NULL),
(2, 'minhdeptrai', 'minhdeptrai@gmail.com', 'minhdeptrai', '123', '0123456789', 2, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\646b7ee4302b4.jpg', '2023-05-22 14:39:25', '2023-05-22 14:40:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `view`
--

CREATE TABLE `view` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `stories_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `view`
--

INSERT INTO `view` (`id`, `user_id`, `stories_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2023-05-22 07:08:16', NULL),
(2, 1, 5, '2023-05-22 08:07:37', NULL),
(3, 1, 4, '2023-05-22 08:07:49', NULL),
(4, 1, 5, '2023-05-22 08:08:03', NULL),
(5, 1, 5, '2023-05-22 08:09:05', NULL),
(6, 1, 5, '2023-05-22 08:10:09', NULL),
(7, 1, 4, '2023-05-22 08:10:20', NULL),
(8, 1, 5, '2023-05-22 08:14:04', NULL),
(9, 1, 6, '2023-05-22 08:24:32', NULL),
(10, 1, 5, '2023-05-22 14:26:04', NULL),
(11, 1, 5, '2023-05-22 14:27:09', NULL),
(12, 1, 5, '2023-05-22 14:27:16', NULL),
(13, 1, 6, '2023-05-22 14:37:15', NULL),
(14, 2, 2, '2023-05-22 14:41:18', NULL),
(15, 2, 2, '2023-05-22 14:42:21', NULL),
(16, 2, 7, '2023-05-22 15:02:06', NULL),
(17, 2, 4, '2023-05-22 16:07:24', NULL),
(18, 2, 4, '2023-05-22 16:09:10', NULL),
(19, 2, 4, '2023-05-22 16:20:31', NULL),
(20, 2, 4, '2023-05-22 16:21:58', NULL),
(21, 2, 4, '2023-05-22 16:25:59', NULL),
(22, 2, 4, '2023-05-23 02:25:19', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_news`
--
ALTER TABLE `category_news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_id` (`story_id`);

--
-- Chỉ mục cho bảng `chapter_images`
--
ALTER TABLE `chapter_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Chỉ mục cho bảng `character`
--
ALTER TABLE `character`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_id` (`story_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `story_id` (`story_id`);

--
-- Chỉ mục cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stories_id` (`stories_id`);

--
-- Chỉ mục cho bảng `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_news_id` (`category_news_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Chỉ mục cho bảng `story_genres`
--
ALTER TABLE `story_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genres_id` (`genres_id`),
  ADD KEY `story_id` (`story_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `view`
--
ALTER TABLE `view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stories_id` (`stories_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `category_news`
--
ALTER TABLE `category_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `chapter_images`
--
ALTER TABLE `chapter_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT cho bảng `character`
--
ALTER TABLE `character`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `story_genres`
--
ALTER TABLE `story_genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `view`
--
ALTER TABLE `view`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`);

--
-- Các ràng buộc cho bảng `chapter_images`
--
ALTER TABLE `chapter_images`
  ADD CONSTRAINT `chapter_images_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`);

--
-- Các ràng buộc cho bảng `character`
--
ALTER TABLE `character`
  ADD CONSTRAINT `character_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`);

--
-- Các ràng buộc cho bảng `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`stories_id`) REFERENCES `stories` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_news_id`) REFERENCES `category_news` (`id`);

--
-- Các ràng buộc cho bảng `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Các ràng buộc cho bảng `story_genres`
--
ALTER TABLE `story_genres`
  ADD CONSTRAINT `story_genres_ibfk_1` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`),
  ADD CONSTRAINT `story_genres_ibfk_2` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `view`
--
ALTER TABLE `view`
  ADD CONSTRAINT `view_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `view_ibfk_2` FOREIGN KEY (`stories_id`) REFERENCES `stories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
