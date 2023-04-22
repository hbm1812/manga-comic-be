-- comment
DROP TABLE IF EXISTS `comment`;
-- manga
-- DROP TABLE IF EXISTS `satisfied_story`;
DROP TABLE IF EXISTS `satisfied`;
-- DROP TABLE IF EXISTS `favorite_story`;
DROP TABLE IF EXISTS `favorite`;
-- DROP TABLE IF EXISTS `view_user`;
DROP TABLE IF EXISTS `story_genres`;
DROP TABLE IF EXISTS `chapter_images`;
DROP TABLE IF EXISTS `genres`;
DROP TABLE IF EXISTS `chapter`;
DROP TABLE IF EXISTS `character`;
DROP TABLE IF EXISTS `view`;
DROP TABLE IF EXISTS `stories`;
DROP TABLE IF EXISTS `author`;
DROP TABLE IF EXISTS `status`;

-- news
DROP TABLE IF EXISTS `news`;
DROP TABLE IF EXISTS `category_news`;

-- user
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `roles`;


-- vai trò
-- DEFAULT(admin, user)
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

-- người dùng
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(50),
  `email` varchar(50),
  `username` varchar(50),
  `password` varchar(50),
  `phone` varchar(50) NULL,
  `role_id` int(10) UNSIGNED,
  `avatar` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`)
);

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) 
    VALUES 
    (NULL, 'Admin', current_timestamp(), NULL), 
    (NULL, 'User', current_timestamp(), NULL);

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `phone`, `role_id`, `avatar`, `created_at`, `updated_at`) 
    VALUES 
    (NULL, 'huyAdmin', 'huy12@gmail.com', 'huy12', '123', '0123', '1', NULL, current_timestamp(), NULL);


-- tin tức 
CREATE TABLE `category_news`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255),
  `keyword` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `category_news` (`id`, `name`, `keyword`, `created_at`, `updated_at`) 
  VALUES 
  (NULL, 'mới nhất', 'lastest', current_timestamp(), NULL),
  (NULL, 'anime', 'anime', current_timestamp(), NULL), 
  (NULL, 'truyện tranh', 'comic', current_timestamp(), NULL), 
  (NULL, 'thông tin', 'info', current_timestamp(), NULL);

CREATE TABLE `news`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `category_news_id` int(10) UNSIGNED,
  `title` varchar(255),
  `keyword` varchar(255),
  `author` varchar(50),
  `content` text,
  `thumbnail` varchar(255),
  `views` int(10),
  `languages` varchar(50) NULL,
  `country` varchar(50) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`category_news_id`) REFERENCES `category_news`(`id`)
);

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


-- đang update
-- manga (stories)
CREATE TABLE `author`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),
  `alias` varchar(255),
  `avatar` varchar(255),
  `desc` varchar(255),  
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `author` (`id`, `keyword`, `name`, `alias`, `avatar`, `desc`, `created_at`, `updated_at`) VALUES 
(NULL, NULL, 'not found name', 'Asato Asato', 'https://cdn.anime-planet.com/people/primary/asato-asato-1-190x267.jpg?t=1625790596', 'Asato Asato (安里アサト, born 1985) is a female Japanese novelist. The pen name Asato Asato is a combination of her real name (Toru Asakura) and eighty-eight.', current_timestamp(), NULL), 
(NULL, NULL, 'Shinichi Fukuda', NULL, 'https://media.zenfs.com/es/levelup_525/42fac2aa5fdd822efc4e64f6e2964a9f', NULL, current_timestamp(), NULL), 
(NULL, NULL, '', 'Code:000', 'https://upload.wikimedia.org/wikipedia/en/d/dc/DARLING_in_the_FRANXX%2C_second_key_visual.jpg?20200726083303', NULL, current_timestamp(), NULL);

-- define 
-- 3 complete / 2 coming soon / 1 continue
CREATE TABLE `status`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),  
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `status` (`id`, `keyword`, `name`, `created_at`, `updated_at`) VALUES 
(NULL, '0', 'Đang tiến hành', current_timestamp(), NULL), 
(NULL, '1', 'Sắp chiếu', current_timestamp(), NULL), 
(NULL, '2', 'Hoàn thành', current_timestamp(), NULL);

-- desc thumbnail: ảnh chính của manga lúc up lên YC ảnh dọc
-- background : ảnh lúc giới thiệu ngang to YC ảnh ngang 
-- satisfied = favorite / view
-- 1 truyện sẽ có 1 trạng thái 
CREATE TABLE `stories`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),
  `name_romanji` varchar(255),
  `name_english` varchar(255),
  `name_japan` varchar(255),
  `alias` varchar(255),
  `thumbnail` varchar(255),
  `background` varchar(255),
  `desc` text,
  `status_id` int(10) UNSIGNED,
  `author_id` int(10) UNSIGNED,
  `view_count` int(10) UNSIGNED DEFAULT 0,
  `favorite_count` int(10) UNSIGNED DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`status_id`) REFERENCES `status`(`id`),
  FOREIGN KEY (`author_id`) REFERENCES `author`(`id`)
);

INSERT INTO `stories` (`id`, `keyword`, `name`, `name_romanji`, `name_english`, `name_japan`, `alias`, `thumbnail`, `background`, `desc`, `status_id`, `author_id`, `created_at`, `updated_at`) VALUES 
(NULL, '86', '86 - Eighty Six', '86-エイティシックス-', '86 - Eighty Six', NULL, NULL, 'https://st.nettruyenup.com/data/comics/144/86-eighty-six.jpg', 'https://www.slashfilm.com/img/gallery/86-eighty-six-is-one-of-the-best-war-anime-ever-made/intro-1638465386.jpg', 'The Republic of San Magnolia has been at war with the Empire of Giad for nine years. Though it initially suffered devastating losses to the Empire\'s autonomous mechanized Legions, the Republic has since developed its own autonomous units, called Juggernauts, which are directed remotely by a Handler. While on the surface, the public believes the war is being fought between machines, in reality, the Juggernauts are being piloted by humans, all of whom are \"86\"—the designation given to the Colorata minority of San Magnolia. The 86 originally had equal rights, but were persecuted and scapegoated by the dominant Alba race and the Alba-supremacist Republic government to the point where Colorata were both officially designated and popularly considered subhuman. The 86 were not permitted to have personal names and were immured in internment camps in the 86th District (their namesake), all the while being forced to fight in the Republic\'s war with the Empire to receive better treatment.', '1', '1', current_timestamp(), NULL),
(NULL, 'my-dress-up-darling', 'Sono Bisque Doll wa Koi wo suru', 'Sono Bisque Doll wa Koi wo suru', 'MY DRESS-UP DARLING', 'その着せ替え人形ビスク・ドールは恋をする', NULL, 'https://upload.wikimedia.org/wikipedia/en/thumb/2/2f/Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg/220px-Sono_Bisque_Doll_wa_Koi_wo_Suru%2C_Volume_1.jpg', 'https://i0.wp.com/anitrendz.net/news/wp-content/uploads/2021/10/My-Dress-up-Darling-1-Cropped-scaled.jpg', 'Wakana Gojo is a high school student with a secret admiration for hina dolls and aspires to become a craftsman like his grandfather. Having been socially traumatized for his passion, he had closed himself off from everyone. One day at school, his classmate Marin Kitagawa runs into him using a sewing machine for making a doll\s costume. After admiring Wakana\s doll and praising his work, Marin asks if Wakana could help her create cosplays. Initially, Wakana is nervous about his ability to create cosplay costumes for Marin because of his experience being limited to Hina dolls. However, he agrees to do it.', '3', '2', current_timestamp(), NULL), 
(NULL, 'darling-in-the-franxx', 'Darling in the Franxx', '', 'Darling in the Franxx', 'ダーリン・イン・ザ・フランキス', NULL, 'https://upload.wikimedia.org/wikipedia/en/d/dc/DARLING_in_the_FRANXX%2C_second_key_visual.jpg', 'https://images.alphacoders.com/901/thumb-1920-901811.png', 'Darling in the Franxx is set in a dystopian future where children are artificially created and indoctrinated solely to defend the remnants of civilization. The story follows a squad of ten pilots, particularly focusing on the partnership between Hiro, a former prodigy, and Zero Two, a hybrid human and elite pilot who aspires to become entirely human.', '2', '3', current_timestamp(), NULL);

-- views
CREATE TABLE `view`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `user_id` int(10) UNSIGNED,
  `stories_id` int(10) UNSIGNED,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`stories_id`) REFERENCES `stories`(`id`)
);

CREATE TABLE `favorite`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `user_id` int(10) UNSIGNED,
  `stories_id` int(10) UNSIGNED,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`stories_id`) REFERENCES `stories`(`id`)
);

-- thể loại truyện (danh mục)
CREATE TABLE `genres`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),
  `background` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO `genres` (`id`, `keyword`, `name`, `background`, `created_at`, `updated_at`) VALUES 
(NULL, 'action', 'Action', 'http://localhost/manga-comic-be/assets/images/base/genres/action.jpg', current_timestamp(), NULL), 
(NULL, 'adventure', 'Adventure', 'http://localhost/manga-comic-be/assets/images/base/genres/adventure.jpg', current_timestamp(), NULL), 
(NULL, 'comedy', 'Comedy', 'http://localhost/manga-comic-be/assets/images/base/genres/comedy.jpg', current_timestamp(), NULL), 
(NULL, 'romance', 'romance', 'http://localhost/manga-comic-be/assets/images/base/genres/romance.jpg', current_timestamp(), NULL), 
(NULL, 'drama', 'Drama', 'http://localhost/manga-comic-be/assets/images/base/genres/drama.jpg', current_timestamp(), NULL), 
(NULL, 'mecha', 'Mecha', 'http://localhost/manga-comic-be/assets/images/base/genres/mecha.jpg', current_timestamp(), NULL), 
(NULL, 'slice-of-life', 'Slice of life', 'http://localhost/manga-comic-be/assets/images/base/genres/sliceoflife.jpg', current_timestamp(), NULL), 
(NULL, 'supernatural', 'Super natural', 'http://localhost/manga-comic-be/assets/images/base/genres/supernatual.jpg', current_timestamp(), NULL), 
(NULL, 'magic', 'Magic', 'http://localhost/manga-comic-be/assets/images/base/genres/magic.jpg', current_timestamp(), NULL), 
(NULL, 'fantasy', 'Fantasy', 'http://localhost/manga-comic-be/assets/images/base/genres/fantasy.jpg', current_timestamp(), NULL), 
(NULL, 'psychological', 'Psychological', 'http://localhost/manga-comic-be/assets/images/base/genres/psy.jpg', current_timestamp(), NULL), 
(NULL, 'school', 'School', 'http://localhost/manga-comic-be/assets/images/base/genres/school.jpg', current_timestamp(), NULL), 
(NULL, 'sport', 'Sport', 'http://localhost/manga-comic-be/assets/images/base/genres/sport.jpg', current_timestamp(), NULL), 
(NULL, 'music', 'Music', 'http://localhost/manga-comic-be/assets/images/base/genres/music.jpg', current_timestamp(), NULL), 
(NULL, 'shonen', 'Shonen', 'http://localhost/manga-comic-be/assets/images/base/genres/shonen.jpg', current_timestamp(), NULL), 
(NULL, 'yuri', 'Yuri', 'http://localhost/manga-comic-be/assets/images/base/genres/yuri.jpg', current_timestamp(), NULL), 
(NULL, 'josei', 'Josei', 'http://localhost/manga-comic-be/assets/images/base/genres/josei.jpg', current_timestamp(), NULL), 
(NULL, 'harem', 'Harem', 'http://localhost/manga-comic-be/assets/images/base/genres/harem.jpg', current_timestamp(), NULL);

CREATE TABLE `story_genres`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `genres_id` int(10) UNSIGNED,
  `story_id` int(10) UNSIGNED,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`genres_id`) REFERENCES `genres`(`id`),
  FOREIGN KEY (`story_id`) REFERENCES `stories`(`id`)
);
INSERT INTO `story_genres` (`id`, `genres_id`, `story_id`, `created_at`, `updated_at`) VALUES 
(NULL, '1', '1', current_timestamp(), NULL), 
(NULL, '5', '1', current_timestamp(), NULL), 
(NULL, '6', '1', current_timestamp(), NULL), 
(NULL, '3', '2', current_timestamp(), NULL), 
(NULL, '5', '2', current_timestamp(), NULL), 
(NULL, '4', '2', current_timestamp(), NULL), 
(NULL, '7', '2', current_timestamp(), NULL), 
(NULL, '5', '3', current_timestamp(), NULL), 
(NULL, '6', '3', current_timestamp(), NULL), 
(NULL, '11', '3', current_timestamp(), NULL);

-- chapter
-- desc qh 1 nhiều 1 truyện có nhiều chapter
CREATE TABLE `chapter`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),
  `subname` varchar(255),
  `story_id` int(10) UNSIGNED,
  `country` varchar(255),
  `languages` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`story_id`) REFERENCES `stories`(`id`)
);
-- My Dress-Up Darling, Chapter 1
-- keyword của chapter phải trùng với keyword trên stories
INSERT INTO `chapter` (`id`, `keyword`, `name`, `subname`, `story_id`, `country`, `languages`, `created_at`, `updated_at`) VALUES 
(NULL, '86', 'Eighty Six, Chapter 1', NULL, '1', 'JP', 'EN', current_timestamp(), NULL), 
(NULL, '86', 'Eighty Six, Chapter 2', NULL, '1', 'JP', 'EN', current_timestamp(), NULL),
(NULL, 'my-dress-up-darling', 'My Dress-Up Darling, Chapter 1', NULL, '2', 'JP', 'EN', current_timestamp(), NULL),
(NULL, 'darling-in-the-franxx', 'Darling in the franxx, Chapter 1', NULL, '3', 'JP', 'Vi', current_timestamp(), NULL);


-- 1 chapter có nhiều ảnh
CREATE TABLE `chapter_images`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `thumbnail` varchar(255),
  `chapter_id` int(10) UNSIGNED,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`chapter_id`) REFERENCES `chapter`(`id`)
);
INSERT INTO `chapter_images` (`id`, `thumbnail`, `chapter_id`, `created_at`, `updated_at`) VALUES 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/001.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/002.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/003.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/004.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/005.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/006.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/007.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/008.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/009.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%201/010.jpg', '1', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/001.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/002.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/003.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/004.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/005.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/006.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/007.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/008.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/009.jpg', '2', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/86/Chapter%202/010.jpg', '2', current_timestamp(), NULL),
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/1.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/2.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/3.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/4.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/5.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/6.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/7.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/8.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/9.jpg', '3', current_timestamp(), NULL), 
(NULL, 'https://cdn.hxmanga.com/file/majekayoo/sono-bisque-doll-wa-koi-wo-suru/Chapter-1/10.jpg', '3', current_timestamp(), NULL),
(NULL, 'https://i3.truyen-hay.com/289/289218/000.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/000a.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/001.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/002.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/003-004.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/005.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/006.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/007.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/008.jpg', '4', current_timestamp(), NULL), 
(NULL, 'https://i3.truyen-hay.com/289/289218/009.jpg', '4', current_timestamp(), NULL);

-- giới thiệu nv 
-- 1 truyện sẽ có nhiều char
CREATE TABLE `character`  (
  `id` int(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
  `keyword` varchar(255),
  `name` varchar(255),
  `avatar` varchar(255),
  `char_full` varchar(255),
  `role` varchar(255),
  `desc` text,
  `story_id` int(10) UNSIGNED,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`story_id`) REFERENCES `stories`(`id`)
);

-- comment
CREATE TABLE `comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` int(10) UNSIGNED,
  `news_id` int(10) UNSIGNED,
  `story_id` int(10) UNSIGNED,
  `parent_id` int(10) UNSIGNED,
  `thumbnail` varchar(255),
  `content` varchar(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`news_id`) REFERENCES `news`(`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`story_id`) REFERENCES `stories`(`id`)
);

