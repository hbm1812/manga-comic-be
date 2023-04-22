-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 22, 2023 lúc 08:35 AM
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
(1, NULL, 'not found name', 'Asato Asato', 'https://cdn.anime-planet.com/people/primary/asato-asato-1-190x267.jpg?t=1625790596', 'Asato Asato (安里アサト, born 1985) is a female Japanese novelist. The pen name Asato Asato is a combination of her real name (Toru Asakura) and eighty-eight.', '2023-04-12 13:19:55', NULL),
(2, NULL, 'Shinichi Fukuda', NULL, 'https://media.zenfs.com/es/levelup_525/42fac2aa5fdd822efc4e64f6e2964a9f', NULL, '2023-04-12 13:19:55', NULL),
(3, 'Code:000', 'Code:000', 'Code:000', '', 'khong ro', '2023-04-12 13:19:55', '2023-04-17 07:42:25'),
(4, 'Torako', 'Torako', 'Torako', '', 'khong co', '2023-04-17 06:41:48', '2023-04-17 07:18:11'),
(7, 'Baba Okina ', 'Baba Okina ', 'Baba Okina ', 'https://static.wikia.nocookie.net/kumo-desu-ga-nani-ka/images/4/41/Okina-Baba-V-CRX.png/revision/latest?cb=20210323091755', 'Tôi là nhện đấy, có sao không? (Nhật: 蜘蛛ですが、なにか？ Hepburn: Kumo desu ga, Nani ka??) là một bộ light novel isekai của Nhật Bản do Baba Okina viết và do Kiryuu Tsukasa minh họa. Light novel được Kadokawa Shoten xuất bản dưới ấn hiệu Kadokawa Books trong nước', '2023-04-17 07:19:08', '2023-04-17 07:19:27');

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
(1, 'mới nhất', 'lastest', '2023-04-12 13:19:55', NULL),
(2, 'anime', 'anime', '2023-04-12 13:19:55', NULL),
(3, 'truyện tranh', 'comic', '2023-04-12 13:19:55', NULL),
(4, 'thông tin', 'info', '2023-04-12 13:19:55', NULL);

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
(1, '86', 'Eighty Six, Chapter 1', NULL, 1, 'JP', 'EN', '2023-04-12 13:19:55', NULL),
(2, '86', 'Eighty Six, Chapter 2', NULL, 1, 'JP', 'EN', '2023-04-12 13:19:55', NULL),
(3, 'my-dress-up-darling', 'My Dress-Up Darling, Chapter 1', NULL, 2, 'JP', 'EN', '2023-04-12 13:19:55', NULL),
(4, 'darling-in-the-franxx', 'Darling in the franxx, Chapter 1', NULL, 3, 'JP', 'Vi', '2023-04-12 13:19:55', NULL),
(5, 'kumo', 'Kumo desu ga, nani ka?, chapter 1', NULL, 4, 'JP', 'Vi', '2023-04-22 04:56:12', '2023-04-22 05:09:00'),
(6, 'kumo', 'Kumo desu ga, nani ka?, chapter 2', NULL, 4, 'JP', 'Vi', '2023-04-22 04:58:42', '2023-04-22 05:09:11');

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
(1, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/001.jpg', 1, '2023-04-12 13:19:55', NULL),
(2, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/002.jpg', 1, '2023-04-12 13:19:55', NULL),
(3, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/003.jpg', 1, '2023-04-12 13:19:55', NULL),
(4, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/004.jpg', 1, '2023-04-12 13:19:55', NULL),
(5, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/005.jpg', 1, '2023-04-12 13:19:55', NULL),
(6, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/006.jpg', 1, '2023-04-12 13:19:55', NULL),
(7, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/007.jpg', 1, '2023-04-12 13:19:55', NULL),
(8, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/008.jpg', 1, '2023-04-12 13:19:55', NULL),
(9, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/009.jpg', 1, '2023-04-12 13:19:55', NULL),
(10, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/010.jpg', 1, '2023-04-12 13:19:55', NULL),
(11, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/001.jpg', 2, '2023-04-12 13:19:55', NULL),
(12, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/002.jpg', 2, '2023-04-12 13:19:55', NULL),
(13, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/003.jpg', 2, '2023-04-12 13:19:55', NULL),
(14, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/004.jpg', 2, '2023-04-12 13:19:55', NULL),
(15, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/005.jpg', 2, '2023-04-12 13:19:55', NULL),
(16, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/006.jpg', 2, '2023-04-12 13:19:55', NULL),
(17, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/007.jpg', 2, '2023-04-12 13:19:55', NULL),
(18, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/008.jpg', 2, '2023-04-12 13:19:55', NULL),
(19, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/009.jpg', 2, '2023-04-12 13:19:55', NULL),
(20, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/010.jpg', 2, '2023-04-12 13:19:55', NULL),
(21, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/1.jpg', 3, '2023-04-12 13:19:55', NULL),
(22, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/2.jpg', 3, '2023-04-12 13:19:55', NULL),
(23, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/3.jpg', 3, '2023-04-12 13:19:55', NULL),
(24, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/4.jpg', 3, '2023-04-12 13:19:55', NULL),
(25, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/5.jpg', 3, '2023-04-12 13:19:55', NULL),
(26, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/6.jpg', 3, '2023-04-12 13:19:55', NULL),
(27, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/7.jpg', 3, '2023-04-12 13:19:55', NULL),
(28, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/8.jpg', 3, '2023-04-12 13:19:55', NULL),
(29, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/9.jpg', 3, '2023-04-12 13:19:55', NULL),
(30, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/10.jpg', 3, '2023-04-12 13:19:55', NULL),
(31, 'https://i3.truyen-hay.com/289/289218/000.jpg', 4, '2023-04-12 13:19:55', NULL),
(32, 'https://i3.truyen-hay.com/289/289218/000a.jpg', 4, '2023-04-12 13:19:55', NULL),
(33, 'https://i3.truyen-hay.com/289/289218/001.jpg', 4, '2023-04-12 13:19:55', NULL),
(34, 'https://i3.truyen-hay.com/289/289218/002.jpg', 4, '2023-04-12 13:19:55', NULL),
(35, 'https://i3.truyen-hay.com/289/289218/003-004.jpg', 4, '2023-04-12 13:19:55', NULL),
(36, 'https://i3.truyen-hay.com/289/289218/005.jpg', 4, '2023-04-12 13:19:55', NULL),
(37, 'https://i3.truyen-hay.com/289/289218/006.jpg', 4, '2023-04-12 13:19:55', NULL),
(38, 'https://i3.truyen-hay.com/289/289218/007.jpg', 4, '2023-04-12 13:19:55', NULL),
(39, 'https://i3.truyen-hay.com/289/289218/008.jpg', 4, '2023-04-12 13:19:55', NULL),
(40, 'https://i3.truyen-hay.com/289/289218/009.jpg', 4, '2023-04-12 13:19:55', NULL),
(42, 'https://mangaqq.com/4381/1/1.jpg?r=r8645456', 5, '2023-04-22 06:08:42', '2023-04-22 06:10:20'),
(43, 'https://mangaqq.com/4381/1/2.jpg?r=r8645456', 5, '2023-04-22 06:10:45', NULL),
(44, 'https://mangaqq.com/4381/1/3.jpg?r=r8645456', 5, '2023-04-22 06:11:00', NULL),
(45, 'https://truyenqqmoi.com/truyen-tranh/tai-sinh-thanh-nhen-4381-chap-1.html', 5, '2023-04-22 06:11:15', NULL),
(46, 'https://mangaqq.com/4381/1/5.jpg?r=r8645456', 5, '2023-04-22 06:11:35', NULL),
(47, 'https://mangaqq.com/4381/1/6.jpg?r=r8645456', 5, '2023-04-22 06:11:53', NULL),
(48, 'https://mangaqq.com/4381/1/7.jpg?r=r8645456', 5, '2023-04-22 06:12:04', NULL),
(49, 'https://mangaqq.com/4381/1/8.jpg?r=r8645456', 5, '2023-04-22 06:12:19', NULL),
(50, 'https://mangaqq.com/4381/1/9.jpg?r=r8645456', 5, '2023-04-22 06:12:31', NULL),
(51, 'https://mangaqq.com/4381/1/10.jpg?r=r8645456', 5, '2023-04-22 06:12:45', NULL),
(52, 'https://mangaqq.com/4381/1/11.jpg?r=r8645456', 5, '2023-04-22 06:12:58', NULL),
(53, 'https://mangaqq.com/4381/1/12.jpg?r=r8645456', 5, '2023-04-22 06:13:21', NULL),
(54, 'https://mangaqq.com/4381/1/13.jpg?r=r8645456', 5, '2023-04-22 06:13:44', NULL),
(55, 'https://mangaqq.com/4381/1/14.jpg?r=r8645456', 5, '2023-04-22 06:14:01', NULL),
(56, 'https://mangaqq.com/4381/1/15.jpg?r=r8645456', 5, '2023-04-22 06:14:24', NULL),
(57, 'https://mangaqq.com/4381/1/16.jpg?r=r8645456', 5, '2023-04-22 06:15:36', NULL);

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
(1, 'action', 'Action', 'http://localhost/manga-comic-be/assets/images/base/genres/action.jpg', '2023-04-12 13:19:55', NULL),
(2, 'adventure', 'Adventure', 'http://localhost/manga-comic-be/assets/images/base/genres/adventure.jpg', '2023-04-12 13:19:55', NULL),
(3, 'comedy', 'Comedy', 'http://localhost/manga-comic-be/assets/images/base/genres/comedy.jpg', '2023-04-12 13:19:55', NULL),
(4, 'romance', 'romance', 'http://localhost/manga-comic-be/assets/images/base/genres/romance.jpg', '2023-04-12 13:19:55', NULL),
(5, 'drama', 'Drama', 'http://localhost/manga-comic-be/assets/images/base/genres/drama.jpg', '2023-04-12 13:19:55', NULL),
(6, 'mecha', 'Mecha', 'http://localhost/manga-comic-be/assets/images/base/genres/mecha.jpg', '2023-04-12 13:19:55', NULL),
(7, 'slice-of-life', 'Slice of life', 'http://localhost/manga-comic-be/assets/images/base/genres/sliceoflife.jpg', '2023-04-12 13:19:55', NULL),
(8, 'supernatural', 'Super natural', 'http://localhost/manga-comic-be/assets/images/base/genres/supernatual.jpg', '2023-04-12 13:19:55', NULL),
(9, 'magic', 'Magic', 'http://localhost/manga-comic-be/assets/images/base/genres/magic.jpg', '2023-04-12 13:19:55', NULL),
(10, 'fantasy', 'Fantasy', 'http://localhost/manga-comic-be/assets/images/base/genres/fantasy.jpg', '2023-04-12 13:19:55', NULL),
(11, 'psychological', 'Psychological', 'http://localhost/manga-comic-be/assets/images/base/genres/psy.jpg', '2023-04-12 13:19:55', NULL),
(12, 'school', 'School', 'http://localhost/manga-comic-be/assets/images/base/genres/school.jpg', '2023-04-12 13:19:55', NULL),
(13, 'sport', 'Sport', 'http://localhost/manga-comic-be/assets/images/base/genres/sport.jpg', '2023-04-12 13:19:55', NULL),
(14, 'music', 'Music', 'http://localhost/manga-comic-be/assets/images/base/genres/music.jpg', '2023-04-12 13:19:55', NULL),
(15, 'shonen', 'Shonen', 'http://localhost/manga-comic-be/assets/images/base/genres/shonen.jpg', '2023-04-12 13:19:55', NULL),
(16, 'yuri', 'Yuri', 'http://localhost/manga-comic-be/assets/images/base/genres/yuri.jpg', '2023-04-12 13:19:55', NULL),
(17, 'josei', 'Josei', 'http://localhost/manga-comic-be/assets/images/base/genres/josei.jpg', '2023-04-12 13:19:55', NULL),
(18, 'harem', 'Harem', 'http://localhost/manga-comic-be/assets/images/base/genres/harem.jpg', '2023-04-12 13:19:55', NULL);

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
(11, 2, 'Chūnibyō demo Koi ga Shitai!', NULL, 'Rikka', 'Togashi Yūta, cậu bé từng mắc hội chứng \"Trung Nhị Bệnh\" (中二病 Chūnibyō?, cũng gọi là \"Hoang tưởng tuổi trẻ\") trong những năm học sơ trung, tin rằng mình sở hữu năng lực siêu nhiên và tự phong bản thân là \"Dark Flame Master\". Kết quả cậu bị bạn bè xa lánh. Kết thúc quãng thời gian đầy xấu hổ này, Yūta bước vào cao trung xa nhà, nơi không có ai quen cậu, và nhờ đó dần quên đi những ám ảnh về quá khứ xấu hổ. Tuy nhiên, mọi việc lại trở nên khó khăn khi Takanashi Rikka - cô bạn gái cùng lớp cũng mắc Trung Nhị Bệnh, biết được quá khứ của Yūta và muốn làm bạn với cậu. Với Yūta, Rikka là mối hiểm họa đối với cuộc sống hiện tại của cậu. Yūta có thể bị lộ quá khứ bị hội chứng và cậu bắt cô không được tiết lộ với bất kì ai.\nNgày đầu khai giảng, cậu phải đưa Rikka về nhà khi biết nhà của cô nằm trong khu phố mà cậu đang ở. Nhưng không ngờ, nhà Rikka là căn hộ của chị hàng xóm nằm trên căn hộ gia đình cậu ở. Cậu bị kéo vào vấn đề chị em giữa hai chị em Rikka và Toka. Chị Toka đã kì vọng Yūta sẽ thay đổi được em của mình và làm hội chứng thuyên giảm. Cô cũng biết được bí mật của Yūta hồi cấp 2 và bất đắc dĩ, Yūta phải đồng ý yêu cầu của Toka.\nỞ trường, Yūta giống bao đứa con trai trong lớp, yêu quý Nibutani. Trong khi đó, Rikka và Kumin đã tạo ra CLB và Dekomori gia nhập. Yūta bất đắc dĩ trở thành hội phó của hội và Nibutani bất ngờ gia nhập. Tưởng chừng cô ấy thích mình, Yūta chợt nhận ra Nibutani muốn tìm Dekomori và xóa sổ mọi bằng chứng và tung tích về \"Mori Summer\". Giống Yūta, cô luôn bị ám ảnh về quá khứ ảo tưởng của mình và luôn cố gắng thay đổi bản thân. Nibutani trở thành thành viên chính thức của CLB và thường là người quản lý hoạt động của hội.\n', 'https://images2.alphacoders.com/514/thumbbig-514128.webp', NULL, 'Vi', 'Japan', '2023-04-12 14:12:17', '2023-04-17 06:31:39');

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
(1, 'Admin', '2023-04-12 13:19:55', NULL),
(2, 'User', '2023-04-12 13:19:55', NULL);

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
(1, '0', 'Đang tiến hành', '2023-04-12 13:19:55', NULL),
(2, '1', 'Sắp chiếu', '2023-04-12 13:19:55', NULL),
(3, '2', 'Hoàn thành', '2023-04-12 13:19:55', NULL);

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
  `alias` varchar(255) DEFAULT NULL,
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

INSERT INTO `stories` (`id`, `keyword`, `name`, `name_romanji`, `name_english`, `name_japan`, `alias`, `thumbnail`, `background`, `descr`, `status_id`, `author_id`, `view_count`, `favorite_count`, `created_at`, `updated_at`) VALUES
(1, '86', '82 - Eighty Six', '86-エイティシックス-', '86 - Eighty Sixddd', 'エイティシックス-', NULL, 'https://st.nettruyenup.com/data/comics/144/86-eighty-six.jpg', 'https://www.slashfilm.com/img/gallery/86-eighty-six-is-one-of-the-best-war-anime-ever-made/intro-1638465386.jpg', 'The Republic of San Magnolia has been at war with the Empire of Giad for nine years. Though it initially suffered devastating losses to the Empire\'s autonomous mechanized Legions, the Republic has since developed its own autonomous units, called Juggernauts, which are directed remotely by a Handler. While on the surface, the public believes the war is being fought between machines, in reality, the Juggernauts are being piloted by humans, all of whom are \"86\"—the designation given to the Colorata minority of San Magnolia. The 86 originally had equal rights, but were persecuted and scapegoated by the dominant Alba race and the Alba-supremacist Republic government to the point where Colorata were both officially designated and popularly considered subhuman. The 86 were not permitted to have personal names and were immured in internment camps in the 86th District (their namesake), all the while being forced to fight in the Republic\'s war with the Empire to receive better treatment.', 1, 1, 0, 0, '2023-04-12 13:19:55', '2023-04-17 02:58:24'),
(2, 'my-dress-up-darling', 'Sono Bisque Doll wa Koi wo suru', 'Sono Bisque Doll wa Koi wo suru', 'MY DRESS-UP DARLING', 'その着せ替え人形ビスク・ドールは恋をする', NULL, 'https://upload.wikimedia.org/wikipedia/en/thumb/2/2f/Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg/220px-Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg', 'https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2021/10/My-Dress-up-Darling-1-Cropped-scaled.jpg', 'Wakana Gojo is a high school student with a secret admiration for hina dolls and aspires to become a craftsman like his grandfather. Having been socially traumatized for his passion, he had closed himself off from everyone. One day at school, his classmate Marin Kitagawa runs into him using a sewing machine for making a dolls costume. After admiring Wakanas doll and praising his work, Marin asks if Wakana could help her create cosplays. Initially, Wakana is nervous about his ability to create cosplay costumes for Marin because of his experience being limited to Hina dolls. However, he agrees to do it.', 3, 2, 0, 0, '2023-04-12 13:19:55', NULL),
(3, 'darling-in-the-franxx', 'Darling in the Franxx', '', 'Darling in the Franxx', 'ダーリン・イン・ザ・フランキス', NULL, 'https://upload.wikimedia.org/wikipedia/en/d/dc/DARLING_in_the_FRANXX%2C_second_key_visual.jpg', 'https://images.alphacoders.com/901/thumb-1920-901811.png', 'Darling in the Franxx is set in a dystopian future where children are artificially created and indoctrinated solely to defend the remnants of civilization. The story follows a squad of ten pilots, particularly focusing on the partnership between Hiro, a former prodigy, and Zero Two, a hybrid human and elite pilot who aspires to become entirely human.', 2, 3, 0, 0, '2023-04-12 13:19:55', NULL),
(4, 'Nhện', 'Tôi là nhện đấy, có sao không?', 'Kumo desu ga, Nani ka?', 'So i\'m a spider, So What?', '蜘蛛ですが、なにか？', NULL, 'https://upload.wikimedia.org/wikipedia/vi/4/42/Toi_la_nhen_day%2C_co_sao_khong_tap_1.jpg', 'https://upload.wikimedia.org/wikipedia/vi/4/42/Toi_la_nhen_day%2C_co_sao_khong_tap_1.jpg', 'Tại một thế giới nơi dũng giả và quỷ vương chiến đấu, ma pháp khốc liệt của dũng giả và quỷ vương khiến một lớp học nơi thế giới khác phát nổ. Những học sinh trong lớp học bị chết vì vụ nổ ấy chuyển sinh sang thế giới đó. Nhân vật chính, một học sinh ngồi ở cuối lớp bị tái sinh thành một con quái vật nhện. Thế nhưng với ý chí mạnh mẽ bất thường, cô đã dần dần chấp nhận và học cách thích nghi hơn với thế giới.', 1, 7, 0, 0, '2023-04-12 15:41:52', '2023-04-17 07:40:44');

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
(1, 1, 1, '2023-04-12 13:19:55', NULL),
(2, 5, 1, '2023-04-12 13:19:55', NULL),
(3, 6, 1, '2023-04-12 13:19:55', NULL),
(4, 3, 2, '2023-04-12 13:19:55', NULL),
(5, 5, 2, '2023-04-12 13:19:55', NULL),
(6, 4, 2, '2023-04-12 13:19:55', NULL),
(7, 7, 2, '2023-04-12 13:19:55', NULL),
(8, 5, 3, '2023-04-12 13:19:55', NULL),
(9, 6, 3, '2023-04-12 13:19:55', NULL),
(10, 11, 3, '2023-04-12 13:19:55', NULL);

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
(1, 'huyAdmin', 'huy12@gmail.com', 'huy12', '123', '0123', 1, 'https://i.pinimg.com/236x/37/d0/89/37d08973c1ea8efcf0660f45192c3ef5.jpg', '2023-04-12 13:19:55', NULL),
(2, 'minh', 'minh@gmail.com', 'minh', '134', '0961655258', 1, 'https://i.pinimg.com/236x/57/7b/6d/577b6d780ad0702d27d53f53b7f2f7e5.jpg', '2023-04-17 03:57:59', '2023-04-17 04:07:13');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `category_news`
--
ALTER TABLE `category_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `chapter`
--
ALTER TABLE `chapter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `chapter_images`
--
ALTER TABLE `chapter_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `character`
--
ALTER TABLE `character`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `status`
--
ALTER TABLE `status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `story_genres`
--
ALTER TABLE `story_genres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `view`
--
ALTER TABLE `view`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
