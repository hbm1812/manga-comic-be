-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2023 at 09:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manga_comic`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_news`
--

CREATE TABLE `category_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_news`
--

INSERT INTO `category_news` (`id`, `name`, `keyword`, `created_at`, `updated_at`) VALUES
(1, 'mới nhất', 'lastest', '2023-03-04 02:16:10', NULL),
(2, 'anime', 'anime', '2023-03-04 02:16:10', NULL),
(3, 'truyện tranh', 'comic', '2023-03-04 02:16:10', NULL),
(4, 'thông tin', 'info', '2023-03-04 02:16:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `news_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `news_id`, `parent_id`, `thumbnail`, `content`, `created_at`, `updated_at`) VALUES
(9, 2, 6, NULL, '', 'test add comment no parent', '2023-03-06 15:34:56', NULL),
(10, 2, 6, NULL, '', 'test add comment lan 2', '2023-03-06 15:36:21', NULL),
(14, 2, 8, 9, '', 'test reply 1', '2023-03-07 06:56:29', NULL),
(15, 2, 8, NULL, '', 'test add comment 4', '2023-03-07 06:59:56', NULL),
(16, 2, 8, 15, '', 'test reply 2', '2023-03-07 07:02:07', NULL),
(17, 2, 8, 10, '', 'test reply 3', '2023-03-07 07:03:47', NULL),
(18, 2, 8, 9, '', 'test reply 3', '2023-03-07 07:04:30', NULL),
(20, 2, 9, 10, '', 'test update comment :v', '2023-03-07 07:10:07', '2023-03-07 15:10:08'),
(22, 2, 8, 21, '', 'hello ', '2023-03-07 07:12:43', NULL),
(23, 2, 8, 20, '', 'test reply :v', '2023-03-07 07:30:54', NULL),
(24, 2, 9, 20, '', 'test reply 2 :v', '2023-03-07 11:20:13', NULL),
(25, 2, 9, 20, '', 'test reply 3', '2023-03-07 11:20:29', NULL),
(26, 2, 9, 10, '', 'test edit comment', '2023-03-07 15:10:32', '2023-03-07 15:10:45'),
(27, 2, 9, 10, '', 'test edit comment 2222', '2023-03-07 15:11:14', '2023-03-07 15:11:31'),
(28, 2, 9, 10, '', 'test edit comment ', '2023-03-07 15:14:19', '2023-03-07 15:14:41'),
(35, 2, 9, 2, '', 'hello ', '2023-03-07 15:31:52', NULL),
(36, 2, 9, 14, '', 'test rep', '2023-03-07 15:43:17', NULL),
(37, 2, 9, 14, '', 'test reply sub 1', '2023-03-07 15:43:55', NULL),
(38, 2, 9, 14, '', 'test subitem reply 1', '2023-03-07 15:47:22', NULL),
(39, 2, 9, 0, '', 'test subitem reply 2', '2023-03-07 15:49:15', NULL),
(40, 2, 9, 0, '', 'hello test rep', '2023-03-07 15:51:14', NULL),
(41, 2, 9, 0, '', 'test rep ', '2023-03-07 15:53:37', NULL),
(42, 2, 9, 0, '', 'hello', '2023-03-07 15:58:05', NULL),
(43, 2, 9, 0, '', 'hello', '2023-03-07 16:01:10', NULL),
(44, 2, 9, 9, '', 'test subitem edit lan 1', '2023-03-07 16:04:07', '2023-03-07 16:23:06'),
(47, 2, 9, 15, '', 'test reply subitem', '2023-03-07 16:12:16', NULL),
(48, 2, 9, 9, '', '@huyCommentMain hello test subitem reply', '2023-03-07 16:14:06', NULL),
(49, 2, 9, 9, '', '@huyCommentMain test reply 1 :V', '2023-03-07 16:23:47', NULL),
(55, 2, 9, NULL, '', 'hello 🙁 adu vjp vc', '2023-03-07 17:14:46', NULL),
(56, 2, 9, NULL, '', 'hello :3😀', '2023-03-07 17:15:51', NULL),
(57, 2, 9, 56, '', 'test reply icon 😘😘', '2023-03-07 17:16:14', NULL),
(58, 2, 9, NULL, '', 'hello ae 🤣🤣', '2023-03-07 17:21:51', NULL),
(59, 2, 9, NULL, '', 'test close modal icon 👍👍', '2023-03-07 17:22:23', NULL),
(63, 2, 9, NULL, '', 'test edit ', '2023-03-08 01:25:34', '2023-03-08 01:25:53'),
(64, 2, 9, 63, '', 'test edit 123', '2023-03-08 01:26:01', '2023-03-08 01:44:32'),
(66, 2, 9, 63, '', '@huyCommentMain test reply 2', '2023-03-08 01:44:25', NULL),
(67, 2, 5, NULL, '', 'test add comments in page', '2023-03-08 10:10:55', NULL),
(68, 2, 9, NULL, '', 'test comment with emoji 🤣🤣', '2023-03-10 02:55:15', NULL),
(69, 2, 9, NULL, '', 'test cmt with image', '2023-03-10 03:04:27', NULL),
(73, 2, 5, NULL, NULL, '', '2023-03-10 16:01:31', NULL),
(82, 2, 9, 69, '', 'test reply', '2023-03-11 04:11:47', NULL),
(94, 2, 5, NULL, NULL, 'test add comment ', '2023-03-11 05:04:44', NULL),
(95, 2, 5, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0c3c4eaa7.jpg', 'test add image', '2023-03-11 05:06:04', NULL),
(96, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0cd529be6.jpg', 'rep 1', '2023-03-11 05:08:37', NULL),
(97, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0d0a8d36a.jpg', 'rep 123', '2023-03-11 05:09:30', NULL),
(98, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0d58b9c03.png', '', '2023-03-11 05:10:48', NULL),
(99, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0da434917.jpg', '', '2023-03-11 05:12:04', NULL),
(100, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0df24e70c.png', '', '2023-03-11 05:13:22', NULL),
(101, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0e975815c.jpg', 'test text with image', '2023-03-11 05:16:07', NULL),
(102, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0ea71aaf6.jpg', '', '2023-03-11 05:16:23', NULL),
(103, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0fe5b501b.jpg', '', '2023-03-11 05:21:41', NULL),
(104, 2, 5, 95, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c0ff628f02.jpg', 'test image with text', '2023-03-11 05:21:58', NULL),
(105, 2, 5, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c3b094357e.jpg', 'test add comments ', '2023-03-11 08:25:45', NULL),
(106, 2, 5, 105, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c3b261b35a.jpg', '', '2023-03-11 08:26:14', NULL),
(107, 2, 5, 105, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c3b3917ea7.jpg', 'test reply', '2023-03-11 08:26:33', NULL),
(108, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c3dfc9fa5c.jpg', '', '2023-03-11 08:38:20', NULL),
(109, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c3e1832a81.jpg', '', '2023-03-11 08:38:48', NULL),
(110, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c40114da04.jpg', 'add with image', '2023-03-11 08:47:13', NULL),
(111, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c401b3b4c6.png', '', '2023-03-11 08:47:23', NULL),
(112, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c4026002ca.png', 'test only text ', '2023-03-11 08:47:34', NULL),
(113, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c4069800de.jpg', '', '2023-03-11 08:48:41', NULL),
(114, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c409048dbb.jpg', '', '2023-03-11 08:49:20', NULL),
(115, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c40ec7828a.jpg', '', '2023-03-11 08:50:52', NULL),
(116, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c40fc4430d.jpg', 'test with image', '2023-03-11 08:51:08', NULL),
(117, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c41026bedd.jpg', 'test only text', '2023-03-11 08:51:14', NULL),
(118, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c41175232d.jpg', 'test only text 2', '2023-03-11 08:51:35', NULL),
(119, 2, 6, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c417072262.jpg', '', '2023-03-11 08:53:04', NULL),
(121, 2, 2, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c433d10a1a.jpg', 'test text with image', '2023-03-11 09:00:45', NULL),
(122, 2, 2, NULL, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\comments\\640c4346420cf.jpg', '', '2023-03-11 09:00:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `category_news_id`, `title`, `keyword`, `author`, `content`, `thumbnail`, `views`, `languages`, `country`, `created_at`, `updated_at`) VALUES
(1, 3, 'Nền Tảng Giao Lưu \"Bài Ca Của Gió\" mở hạn giờ, hãy cùng những Nhà Lữ Hành khác giao lưu và chia sẻ về âm nhạc tuyệt vời nhé!', NULL, 'Huy Nguyễn', 'Chào mừng các Nhà Lữ Hành đến với Lễ Hội Hoa Gió. Thành Mondstadt đang tổ chức một trò chơi nhỏ có tên là \"Bài Ca Của Gió\". Trong trò chơi này, giống như nhà thơ trong Thành Mondstadt, bạn có thể chơi và chỉnh sửa những giai điệu lay động lòng người...\n\nĐồng thời, Nền Tảng Giao Lưu \"Bài Ca Của Gió\" sẽ mở hạn giờ. Nhà Lữ Hành có thể chỉnh sửa và chia sẻ thông tin biên khúc trong trò chơi của bạn trên nền tảng, xem nhạc phổ do Nhà Lữ Hành khác sáng tác và đăng tải khiêu chiến diễn tấu của bạn!\n\nCùng nhau diễn tấu nhạc khúc của riêng bạn trong những cơn gió của Mondstadt!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/03/94c01e0e6d539e6ae98c4a878fffadc7_3687524577907637670.png', 1050, 'English', 'Japan', '2023-03-04 02:20:55', '2023-03-05 02:51:36'),
(2, 2, 'Gợi Ý Cách Chơi \"Bài Ca Của Gió\"\r\n', NULL, 'Huy Nguyễn', 'Nhà Lữ Hành thân mến, sự kiện \"Hơi Thở Hoa Gió\" đã mở, tham gia vào cách chơi \"Bài Ca Của Gió\" trong đó, sẽ có thể diễn tấu ca khúc, biên tập nhạc phổ, và còn có thể giao lưu chia sẻ biên khúc của mình với các Nhà Lữ Hành khác trên Nền Tảng \"Giao Lưu Nhạc Khúc\".\n\nTiếp theo đây sẽ mang tới cho Nhà Lữ Hành một số gợi ý nhỏ về cách chơi \"Bài Ca Của Gió\", hãy cùng xem nhé!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/02/a99dd9f8d39f73fe5d81eb161f0be940_8999277107231385163.jpg', 1000, 'Vi', 'Japan', '2023-03-04 02:33:21', '2023-03-05 02:51:42'),
(3, 3, 'Hướng Dẫn Cách Chơi \"Hơi Thở Hoa Gió\"\r\n', NULL, 'Huy Nguyễn', 'Nhà Lữ Hành thân mến, \"Lễ Hội Hoa Gió\" sắp ra mắt rồi, hãy cùng xem trong sự kiện mới \"Hơi Thở Hoa Gió\" có những cách chơi thú vị nào nhé!', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/01/28f7a150c4fa0c9c2ec33e7c7ee393ff_9100836074446455307.png', 900, 'Vi', 'Japan', '2023-03-04 02:55:26', NULL),
(4, 4, '[Genshin Impact] - Dehya: Tấm Lòng Cát Nóng\r\n', NULL, 'Huy Nguyễn', 'Lính đánh thuê luôn làm những công việc đẫm máu, lừa dối và xu nịnh muôn nơi.\r\n\r\nChính vì nguyên nhân này, một lính đánh thuê chính trực như Dehya mới được các chủ thuê yêu thích nhất.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/03/01/043718769c52a18b9bdafbd412705650_1475157220479221254.jpg', 9000, 'En', 'Japan', '2023-03-04 02:57:05', NULL),
(5, 4, 'Nhận Cánh Tiệc Sao Mới, Để Hành Trình Thêm Thú Vị | Genshin Impact X Prime Gaming\r\n', NULL, 'huy ng', 'Để sự kiện Prime Gaming trở nên thú vị hơn, các Nhà Lữ Hành tham gia sự kiện có thể nhận được phần thưởng đặc biệt của sự kiện hợp tác - 1 cặp Cánh Tiệc Sao.\r\n\r\nTrong thời gian từ 12/2022 đến 05/2023, các thành viên Prime Gaming có thể nhận miễn phí mã đổi quà Genshin Impact để đổi các vật phẩm trong game trên Prime Gaming; Mã đổi thưởng được cập nhật ba tuần một lần. Trong trường hợp người chơi nhận quà từ 4 lần trở lên, thì phần thưởng Cánh Tiệc Sao sẽ được gửi qua hộp thư trong game trong vòng 30 ngày làm việc sau khi kết thúc lần đổi thứ 8 của sự kiện. Một tài khoản chỉ được nhận tối đa 1 Cánh Tiệc Sao.\r\n\r\nLưu ý: Quà game Genshin Impact chỉ dành cho người chơi ở khu vực chỉ định mới được nhận.\r\n\r\nCách tham gia:\r\n\r\n1. Trong thời gian sự kiện, đăng nhập mục Genshin Impact tại Prime Gaming\r\n\r\n>>> Link<<<\r\n\r\n2. Đăng nhập tài khoản Amazon của bạn\r\n\r\n3. Tại thẻ túi quà ấn nút \"Nhận\" sẽ nhận được mã đổi thưởng Genshin Impact để nhận phần thưởng\r\n\r\n*Phải đăng ký tài khoản Amazon Prime mới có thể nhận, mỗi Amazon Prime chỉ được nhận túi quà 1 lần, mỗi UID chỉ được nhận Túi Quà Prime Gaming 1 lần\r\n\r\n**Phần thưởng game hiện tại chỉ có thể nhận trong giai đoạn hiện tại, sau khi quá thời gian sự kiện mỗi kỳ, Nhà Lữ Hành sẽ không thể nhận thưởng nữa. Nhà Lữ Hành hãy chú ý thời gian sự kiện của gói quà mỗi kỳ nhé.\r\n\r\nVề Prime Gaming:\r\n\r\nThành viên Amazon Prime có thể miễn phí tận hưởng các nội dung độc quyền được người chơi yêu thích nhất như game PC, game console hoặc game mobile thông qua Prime Gaming.\r\n\r\nNgoài ra, hàng tháng, thành viên Amazon Prime còn có thể miễn phí nhận nhiều game vĩnh viễn, và có cơ hội miễn phí đăng ký kênh Twitch trong tháng đó. Nội dung trong game và game PC miễn phí của Prime Gaming sẽ liên tục được bổ sung và cập nhật, đồng thời mỗi tháng đều có sản phẩm mới và game miễn phí được thêm vào danh sách để thành viên lựa chọn.\r\n\r\nNgoài ra, Prime còn có nhiều phúc lợi, bao gồm mua sắm và giải trí tốt nhất từ Amazon; Trong đó bao gồm dịch vụ giao hàng nhanh, miễn phí, ưu đãi độc quyền, phúc lợi đặt trước, Prime Day v.v. Thành viên Prime có thể xem các chương trình truyền hình, phim truyện, thể thao v.v. không giới hạn với Prime Video, nghe 2 triệu bài hát, hàng nghìn đài phát thanh và danh sách phát miễn phí với Amazon Music, có thể đọc hơn 1000 cuốn sách và tạp chí không giới hạn với Prime Reading, sở hữu bộ nhớ ảnh miễn phí không giới hạn với Amazon Photos.\r\n\r\nFAQ:\r\n\r\n1. Mã đổi thưởng nhận được trong Prime Gaming có hết hạn không?\r\n\r\nCó, mã đổi thưởng có thời gian kết thúc, thời gian cụ thể vui lòng xem bên dưới:\r\n\r\n- Mã đổi thưởng Túi Quà #1 sẽ hết hạn vào 23:59 04/01 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #2 sẽ hết hạn vào 23:59 25/01 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #3 sẽ hết hạn vào 23:59 15/02 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #4 sẽ hết hạn vào 23:59 08/03 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #5 sẽ hết hạn vào 23:59 29/03 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #6 sẽ hết hạn vào 23:59 19/04 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #7 sẽ hết hạn vào 23:59 10/05 (UTC+8)\r\n\r\n- Mã đổi thưởng Túi Quà #8 sẽ hết hạn vào 23:59 31/05 (UTC+8)\r\n\r\n2. Tôi có thể nhận mã đổi thưởng của túi quà đã kết thúc trong sự kiện này không?\r\n\r\nTúi quà trong kỳ chỉ có thể nhận được trong kỳ đó, sau khi kết thúc mỗi kỳ, người chơi sẽ không thể nhận mã đổi thưởng của túi quà đã hết hạn.\r\n\r\n3. Làm sao để nhận được Cánh Tiệc Sao?\r\n\r\nTrong trường hợp người chơi nhận quà từ 4 lần trở lên, thì phần thưởng Cánh Tiệc Sao sẽ được gửi qua hộp thư trong game trong vòng 30 ngày làm việc sau khi kết thúc lần đổi thứ 8 của sự kiện. Nếu chỉ nhận mã đổi sẽ không được tính, chỉ khi sử dụng mã đổi quà mới tính là đổi thành công.\r\n\r\n4. Túi quà có thể đổi ở những server nào của game?\r\n\r\nTúi quà chỉ được đổi ở server Asia, Europe, America, HK/MO/TW. Túi quà này không thể đổi ở Đảo Thiên Không và Cây Thế Giới.\r\n\r\n5. Tôi có thể nhận được túi quà này trên nhiều nền tảng khác nhau không?\r\n\r\nCó thể, chỉ cần bảo đảm tài khoản đăng nhập các nền tảng khác nhau là một, và tài khoản này từng đổi thưởng, là sẽ có thể sử dụng phần thưởng của cùng một tài khoản trên nhiều nền tảng khác nhau.\r\n\r\n6. Nếu tôi có vấn đề mà không được giải quyết ở trên thì sao?\r\n\r\nNếu quyền lợi thành viên Amazon Prime của người chơi gặp vấn đề, xin hãy liên hệ Prime Gaming Support.\r\n\r\nNếu như tài khoản game của người chơi gặp vấn đề, xin hãy tham khảo https://www.hoyolab.com/article/202963', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/28/952b658c21c0e2ace586903fdb8e43dd_2776874369293221033.png', 1999, 'VI', 'Japan', '2023-03-04 03:56:49', NULL),
(6, 4, 'Tuyển tập Genshin Impact - A Handful of Golden Dreams\r\n', NULL, 'huy ng', 'Bốc một nắm cát, mỗi một hạt đều như giấc mộng vàng đẹp đẽ.\r\n\r\nTrong giấc mơ đêm yên tĩnh, mỗi khoảnh khắc đều như dòng cát chảy.\r\n\r\nCho đến khi giấc mơ đưa thế giới trở lại hiện thực, nắng mai vừa hửng, tỏa sáng rạng rỡ.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/27/148beaf6cae051b681dc613d6c00ed48_3579586081830564772.jpg', 1525, 'VI', 'Japan', '2023-03-04 03:56:49', NULL),
(7, 4, 'Giới thiệu nhân vật trong Genshin Impact - [Dehya: Sư Tử Lửa Lấp Lánh]', NULL, 'huyng', 'Bờm và đuôi sư tử, rạng rỡ trong ánh sáng thiêu đốt.\r\n\r\nMàu vàng hay cát đỏ cũng đều giống nhau dưới ánh mặt trời.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/28/99ff9b80982295df3af265471fcbede0_617911984690046410.jpg', 1000, NULL, NULL, '2023-03-04 16:01:39', NULL),
(8, 4, '[Genshin Impact] - Sự kiện web \"Hành Trình Cát Đỏ\" của nhân vật mới Dehya chính thức ra mắt.\r\n', NULL, NULL, '〓Thời Gian Sự Kiện〓\r\n\r\n12:00 24/02/2023 - 23:59 02/03/2023 (UTC+8)\r\n\r\n〓Điều Kiện Tham Gia〓\r\n\r\nHạng mạo hiểm ≥10\r\n\r\n〓Giới Thiệu Sự Kiện〓\r\n\r\nTrong thời gian sự kiện, hoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được phần thưởng đạo cụ trong game nhé!\r\n\r\n〓Hướng Dẫn Cách Chơi〓\r\n\r\n1. Trong thời gian sự kiện, hoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được phần thưởng đạo cụ trong game;\r\n\r\n2. Tương tác với vật phẩm đặc biệt trong khung cảnh để thu thập kiến thúc hành trình.\r\n\r\n〓Thưởng Trò Chơi〓\r\n\r\nHoàn thành hành trình sa mạc của Dehya và Dunyarzad, thu thập toàn bộ kiến thức hành trình, để nhận được Nguyên Thạch, nguyên liệu đột phá nhân vật và các phần thưởng trong game khác.\r\n\r\n〓Lưu Ý〓\r\n\r\n1. Nhà Lữ Hành vui lòng đăng nhập bằng Thẻ Thông Hành HoYoverse và liên kết nhân vật trong game Genshin Impact để tham gia sự kiện, nhằm đảm bảo cho việc phát và nhận thưởng sự kiện được thuận lợi.\r\n\r\n2. Sau khi sự kiện kết thúc, sẽ không thể nhận hình nền sự kiện, Nhà Lữ Hành hãy kịp thời nhận nhé!\r\n\r\n3. Sau khi thu thập tất cả kiến thức của cuộc hành trình, phần thưởng sẽ được phát qua hòm thư trong game, thư có thời hạn 30 ngày, hãy chú ý nhận nhé.\r\n\r\n4. Trong thời gian bảo trì cập nhật phiên bản sẽ không thể truy cập sự kiện web, sau khi hoàn thành cập nhật phiên bản sẽ có thể truy cập bình thường, Nhà Lữ Hành hãy chú ý nhé.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/24/af288d501a1ea9e14ff99e91e16e35a9_822801420125750324.jpg', NULL, NULL, NULL, '2023-03-04 16:01:39', NULL),
(9, 4, 'Nhà Lữ Hành thân mến, sự kiện cầu nguyện \"Nắng Vàng Rực Rỡ\", \"Tà Dương Phán Quyết\", \"Thân Hình Thần Đúc\" sẽ mở vào 01/03!\r\n', NULL, NULL, 'Trong thời gian sự kiện, Nhà Lữ Hành có thể nhận thêm vũ khí và nhân vật trong sự kiện cầu nguyện để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 5 sao Sư Tử Lửa - Dehya (Hỏa) sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 4 sao Thử Thách Của Vận Mệnh - Bennett (Hỏa), Thần Tượng Tỏa Sáng - Barbara (Thủy), Mầm Non Tái Sinh - Collei (Thảo) sẽ tăng mạnh!\r\n\r\n● Sau khi kết thúc sự kiện, nhân vật 5 sao Sư Tử Lửa - Dehya (Hỏa) sẽ vào cầu nguyện thường Du Hành Thế Gian trong phiên bản tiếp theo.\r\n\r\n※ Lần cầu nguyện này là sự kiện Cầu Nguyện Nhân Vật, số lần đảm bảo của sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2 sẽ được tính chung, đồng thời được tích lũy trong sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2, được tính độc lập với các sự kiện cầu nguyện khác và không ảnh hưởng lẫn nhau.\r\n\r\n※ Trong thời gian mở Cầu Nguyện, sẽ mở sự kiện dùng thử nhân vật \"Thử Thân Thủ\", Nhà Lữ Hành có thể sử dụng đội hình cố định có chứa nhân vật dùng thử để vượt ải chỉ định và thử nghiệm tính năng. Sau khi vượt qua thử thách sẽ nhận được phần thưởng tương ứng!\r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện cầu nguyện để xem.\r\nCầu Nguyện \"Tà Dương Phán Quyết\": UP Xác Suất \"Phán Quyết Ẩn Mật - Cyno (Lôi)\"!\r\n\r\nTrong thời gian sự kiện, Nhà Lữ Hành có thể nhận thêm vũ khí và nhân vật trong sự kiện cầu nguyện để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n \r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 5 sao giới hạn Phán Quyết Ẩn Mật - Cyno (Lôi) sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận nhân vật 4 sao Thử Thách Của Vận Mệnh - Bennett (Hỏa), Thần Tượng Tỏa Sáng - Barbara (Thủy), Mầm Non Tái Sinh - Collei (Thảo) sẽ tăng mạnh!\r\n\r\n※ Trong các nhân vật ở trên, nhân vật giới hạn sẽ không vào Cầu Nguyện Thường \"Du Hành Thế Gian\".\r\n\r\n※ Lần cầu nguyện này là sự kiện Cầu Nguyện Nhân Vật-2, số lần đảm bảo của sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2 sẽ được tính chung, đồng thời được tích lũy trong sự kiện Cầu Nguyện Nhân Vật và Cầu Nguyện Nhân Vật-2, được tính độc lập với các sự kiện cầu nguyện khác và không ảnh hưởng lẫn nhau.\r\n\r\n※ Trong thời gian mở Cầu Nguyện, sẽ mở sự kiện dùng thử nhân vật \"Thử Thân Thủ\", Nhà Lữ Hành có thể sử dụng đội hình cố định có chứa nhân vật dùng thử để vượt ải chỉ định và thử nghiệm tính năng. Sau khi vượt qua thử thách sẽ nhận được phần thưởng tương ứng!\r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện để xem.\r\n\r\nCầu Nguyện \"Thân Hình Thần Đúc\": UP Xác Suất \"Trọng Kiếm - Hải Đăng Bờ Biển Lau\", \"Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ\"!\r\n\r\nTrong thời gian sự kiện, Nhà Lữ Hành có thể nhận nhiều vũ khí và nhân vật trong sự kiện cầu nguyện \"Thân Hình Thần Đúc\" để tăng khả năng chiến đấu của đội!\r\n\r\n〓Thời Gian Cầu Nguyện〓\r\n\r\nSau khi cập nhật phiên bản 3.5 - 2023/3/21 17:59\r\n\r\n \r\n\r\n〓Giới Thiệu Cầu Nguyện〓\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận vũ khí 5 sao giới hạn Trọng Kiếm - Hải Đăng Bờ Biển Lau, Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, tỷ lệ cầu nguyện nhận vũ khí 4 sao giới hạn Kiếm Đơn - Tia Sáng Nơi Hẻm Tối, Cung - Thợ Săn Hẻm Tối, vũ khí 4 sao Trọng Kiếm - Đại Kiếm Tế Lễ, Vũ Khí Cán Dài - Tai Ương Của Rồng, Pháp Khí - Chiêu Tâm sẽ tăng mạnh!\r\n\r\n● Trong thời gian sự kiện, có thể sử dụng Định Chuẩn Thần Đúc để tiến hành định chuẩn đối với vũ khí UP 5 sao kỳ này là Trọng Kiếm - Hải Đăng Bờ Biển Lau hoặc Vũ Khí Cán Dài - Quyền Trượng Cát Đỏ, các thông tin khác về \"Định Chuẩn Thần Đúc\" có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện cầu nguyện để xem.\r\n\r\n※ Trong các vũ khí ở trên, vũ khí giới hạn sẽ không vào Cầu Nguyện Thường \"Du Hành Thế Gian\".\r\n\r\n \r\n\r\n※ Các thông tin khác về sự kiện Cầu Nguyện có thể nhấn nút \"Chi Tiết\" góc dưới bên trái giao diện để xem.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/27/33141d7c2e5be7ec7d3678a69610c446_8072336947262077121.jpg', NULL, NULL, NULL, '2023-03-04 16:01:39', NULL),
(10, NULL, 'Giới Thiệu Thẻ Bài Mới Trong Thất Thánh Triệu Hồi Phiên Bản 3.5\r\n', '', NULL, 'Nhà Lữ Hành thân mến, sau khi cập nhật phiên bản 3.5, cách chơi Thất Thánh Triệu Hồi sẽ có thêm Thẻ Nhân Vật \"Eula\", \"Sangonomiya Kokomi\", \"Kujou Sara\" và Thẻ Thiên Phú tương ứng cùng 2 Thẻ Trang Bị mới. Cùng đến xem nào!\r\n\r\nSau khi cập nhật phiên bản 3.5, đến Quán Rượu Đuôi Mèo để mời nhân vật quyết đấu, đạt mục tiêu khiêu chiến chỉ định sẽ nhận được Thẻ Nhân Vật và Thẻ Thiên Phú tương ứng. Thẻ Trang Bị mới có thể mua trong Cửa Hàng Thẻ Bài.\r\n\r\n*Nhóm phát triển sẽ tiếp tục theo dõi trải nghiệm game của các Nhà Lữ Hành và tiến hành điều chỉnh, ưu hóa tính cân bằng của thẻ bài. Thông tin thẻ bài vui lòng lấy nội dung chính thức trong game làm chuẩn.', 'https://webstatic.hoyoverse.com/upload/op-public/2023/02/23/278619f8b177c561b43deaf85af7e754_1777221815824703679.png', NULL, NULL, NULL, '2023-03-04 16:02:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-03-04 02:14:10', NULL),
(2, 'User', '2023-03-04 02:14:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `phone`, `role_id`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 'huyAdmin', 'huy12@gmail.com', 'huy12', '123', '0123', 1, NULL, '2023-03-04 02:14:10', NULL),
(2, 'huyCommentMain', 'huy12@gmail.com', 'huyTestComment', '123', '0123456789', 2, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\64055d0f360b2.jpg', '2023-03-06 03:25:03', NULL),
(3, 'huyTestComment2', 'huy12@gmail.com', 'huyTestComment2', '123', '0123456789', 2, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\64055d48b234a.jpg', '2023-03-06 03:26:00', NULL),
(4, 'huyTestSubComment1', 'huy123@gmail.com', 'huyTestSubComment1', '123', '0123456789', 1, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\64055d7066247.png', '2023-03-06 03:26:40', NULL),
(5, 'huyTestSubComment2', 'huy123@gmail.com', 'huyTestSubComment2', '123', '0123456789', 1, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\64055d89c6a8e.jpg', '2023-03-06 03:27:05', NULL),
(6, 'huy123', 'huy12@gmail.com', 'huytestShowimage', '1234567891', '0123456789', 1, 'http:\\\\localhost\\manga-comic-be\\assets\\images\\avatarUser\\640b508b00388.jpg', '2023-03-10 15:45:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_news`
--
ALTER TABLE `category_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_news_id` (`category_news_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_news`
--
ALTER TABLE `category_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_news_id`) REFERENCES `category_news` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
