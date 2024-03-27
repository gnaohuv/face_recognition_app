CREATE DATABASE  IF NOT EXISTS `webbanhangdt` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webbanhangdt`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: webbanhangdt
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_sub` tinyint(1) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `sub_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `app_category_sub_category_id_7b7f6a7f_fk_app_category_id` (`sub_category_id`),
  CONSTRAINT `app_category_sub_category_id_7b7f6a7f_fk_app_category_id` FOREIGN KEY (`sub_category_id`) REFERENCES `app_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_category`
--

LOCK TABLES `app_category` WRITE;
/*!40000 ALTER TABLE `app_category` DISABLE KEYS */;
INSERT INTO `app_category` VALUES (1,0,'Chuột','chuot',NULL),(2,0,'Bàn phím','ban-phim',NULL),(3,0,'Màn hình','man-hinh',NULL),(6,0,'Tai nghe - Loa','thiet-bi-am-thanh',NULL),(7,0,'Thiết bị lưu trữ','thiet-bi-luu-tru',NULL),(8,0,'Thiết bị mạng','thiet-bi-mang',NULL),(9,0,'Laptop','laptop',NULL),(11,0,'Phần mềm','phan-mem',NULL);
/*!40000 ALTER TABLE `app_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_order` datetime(6) NOT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `transaction_id` varchar(200) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_customer_id_7c27c407_fk_auth_user_id` (`customer_id`),
  CONSTRAINT `app_order_customer_id_7c27c407_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (32,'2023-07-02 03:50:37.283970',0,NULL,19),(33,'2023-07-02 04:05:42.372448',0,NULL,32);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_orderitem`
--

DROP TABLE IF EXISTS `app_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_orderitem_order_id_41257a1b_fk_app_order_id` (`order_id`),
  KEY `app_orderitem_product_id_5f40ddb0_fk_app_product_id` (`product_id`),
  CONSTRAINT `app_orderitem_order_id_41257a1b_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`),
  CONSTRAINT `app_orderitem_product_id_5f40ddb0_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_orderitem`
--

LOCK TABLES `app_orderitem` WRITE;
/*!40000 ALTER TABLE `app_orderitem` DISABLE KEYS */;
INSERT INTO `app_orderitem` VALUES (53,1,'2023-07-02 04:06:18.182323',33,37),(54,2,'2023-07-02 04:06:25.405305',33,12),(55,2,'2023-10-17 17:07:35.282909',32,16),(56,1,'2023-10-18 01:57:15.847742',32,18),(57,1,'2024-03-14 14:40:32.215639',32,3);
/*!40000 ALTER TABLE `app_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_product`
--

DROP TABLE IF EXISTS `app_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `price` double NOT NULL,
  `digital` tinyint(1) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `detail` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product`
--

LOCK TABLES `app_product` WRITE;
/*!40000 ALTER TABLE `app_product` DISABLE KEYS */;
INSERT INTO `app_product` VALUES (3,'Màn hình Asus TUF GAMING VG249Q1A 24\" IPS 165Hz',3790000,0,'Màn_hình_Asus_TUF_GAMING_VG249Q1A.webp','Màn hình Asus TUF GAMING VG249Q1A rộng 23,8 inch, sử dụng tấm nền IPS độ phân giải Full HD (1920x1080) với tốc độ làm mới 165Hz cực nhanh. TUF VG249Q1A được thiết kế dành cho các game thủ chuyên nghiệp và những người chơi muốn hòa mình vào các trò chơi thực sự. Không chỉ vậy, công nghệ ELMB độc quyền cho phép phản hồi trong vòng 1ms MPRT và sự kết hợp của công nghệ đồng bộ hóa thích ứng (FreeSync Premium) sẽ mang đến cho người dùng màn hình mượt mà và trải nghiệm chơi game tuyệt vời.'),(4,'Màn hình AOC Q24G2 24\" IPS 2K 165Hz G-Sync',5290000,0,'Màn_hình_AOC_Q24G2.webp','Màn hình AOC Q24G2 24 inch IPS 2K 165Hz chuyên game sẽ mang đến cho bạn những trải nghiệm chơi game bất tận. Kích thước màn hình 24 inch dưới tấm nền IPS kết hợp với độ phủ màu cao cùng nhiều công nghệ hỗ trợ chơi game tiên tiến đi kèm, AOC Q24G2 chắc chắn là kép phụ không thể thiếu cho dàn PC gaming của bạn.'),(5,'Màn hình ACER EK221Q H 22\" 100Hz',1890000,0,'Màn_hình_ACER_EK221Q.webp','Màn hình ACER EK221Q H 22“ 100Hz là một model màn hình máy tính giá rẻ mới của nhà Acer. Màn hình này vô cùng đa-zi-năng khi nó có thể làm tốt mọi tác vụ từ làm việc cơ bản hằng ngày đến chơi game giải trí với những tựa game thông dụng. Kích thước màn hình cơ bản với tần số quét cao nhưng lại ở một mức giá thành tầm trung thì quả thật ACER EK221Q H 22“ 100Hz là miếng mồi béo bở cho người dùng trong thời gian sắp tới.'),(6,'Màn hình Philips 272E1GSJ 27\" 144Hz Freesync',3590000,0,'Màn_hình_Philips_272E1GSJ.webp','Màn hình Philips 272E1GSJ 27 inch 144Hz Freesync là hiện thân của sự hoàn hảo khi được tích hợp nhiều tính năng nổi bật và công nghệ tiên tiến giúp cải thiện trải nghiệm người dùng. Dù chơi game hay văn phòng thì Philips 272E1GSJ vẫn có thể đáp ứng tốt nhu cầu của bạn.'),(7,'Màn hình Philips 243V7QDSB 24\" IPS 75Hz',2450000,0,'Màn_hình_Philips_243V7QDSB.webp','Philips 243V7QDSB kích thước 24 inch, tấm nền IPS cùng tần số quét 75Hz là một trong những dòng màn hình máy tính LCD Full HD mang đến hình ảnh sắc nét, khung hình chất lượng không gây hại cho mắt khi sử dụng suốt thời gian dài.'),(8,'Màn hình LG 22MP410-B 22\" 75Hz FreeSync',2200000,0,'Màn_hình_LG_22MP410.webp','LG 22MP410-B màn hình máy tính với kích thước 22 inch độ phân giải Full HD (1920X1080), được tích hợp nhiều tính năng ưu việt giúp bảo vệ mắt trong suốt quá trình sử dụng. Đặc biệt, ở chế độ đọc sách sẽ tránh được tình trạng mỏi mắt tăng cường hiệu suất làm việc và giải trí.'),(9,'Màn hình Lenovo Q24i-20 24\" IPS 75Hz loa kép 3W',3750000,0,'Màn_hình_Lenovo.webp','Với kích thước 24 inch, độ phân giải Full HD dưới tấm nền IPS, màn hình Lenovo Q24i-20 sẽ mang lại những hình ảnh hiển thị sắc mắt và tươi tắn nhất cho người dùng. Kích thước lớn đi kèm chứng nhận bảo vệ mắt Eye Safe Display và công nghệ Natural Low Blue Light, màn hình Lenovo giúp giảm thiểu tình trạng mỏi mắt và ánh sáng xanh ảnh hưởng trực tiếp đến người dùng khi phải tiếp xúc với màn hình máy tính quá lâu.'),(10,'Màn hình ACER VG240Y S 24\" IPS 165Hz FreeSync',4190000,0,'Màn_hình_ACER_VG240Y.webp','ACER VG240Y S 24\" IPS 165Hz FreeSync là một trong những dòng sản phẩm màn hình chuyên game tràn viền tối ưu không gian. Tấm nền IPS với độ phủ màu lên đến 99% sRGB mang lại hình ảnh mãn nhãn, sắc nét ở mọi góc nhìn, đưa game thủ hòa mình vào thế giới game sống động như thật.'),(11,'Laptop MSI Modern 14 C11M 011VN',10490000,0,'Laptop_MSI_Modern_14_C11M_011VN.webp','Một trong những siêu phẩm laptop học tập làm việc mới nhất đến từ nhà MSI là MSI Modern 14 C11M 011VN. Sở hữu thiết kế năng động cấu hình mạnh mẽ đến từ con chip gen 12 đáp ứng mọi nhu cầu công việc hằng ngày. MSI Modern 14 được đầu tư thiết kế nhằm tối ưu trải nghiệm và phục vụ nhu cầu di chuyển mỗi ngày của người dùng. Trọng lượng chỉ khoảng 1.3kg thuận lợi trong việc bỏ vào balo và mang đi cứ lúc nào. Kiểu dáng sang trọng với tông màu đen thời thượng kết hợp từng đường nét chau chuốt tỉ mỉ tạo ra một nét đẹp đầy phong cách. Bắt kịp xu hướng và thị hiếu của các bạn trẻ ngày nay.'),(12,'Laptop Dell Inspiron 15 3520 N5I5122W1 Black',16290000,0,'Laptop_Dell_Inspiron_15_3520_N5I5122W1_Black.webp','Tùy theo nhiều nhu cầu khác nhau mà có nhiều dòng sản phẩm laptop Dell khác nhau. Nếu bạn đang tìm một chiếc laptop phục vụ cho nhu cầu học tập và làm việc hằng ngày thì Dell Inspiron 15 3520 N5I5122W1 Black sẽ là người bạn đồng hành cực tốt. cấu hình mạnh mẽ trên thiết kế đơn giản mang lại hiệu năng giải quyết mọi công việc mượt mà, nhanh chóng.'),(13,'Laptop MSI Modern 14 C7M 083VN',12990000,0,'Laptop_MSI_Modern_14_C11M_011VN_gKTl67b.webp','Một trong những siêu phẩm laptop học tập làm việc mới nhất đến từ nhà MSI là MSI Modern 14 C7M 083VN. Sở hữu thiết kế năng động cấu hình mạnh mẽ đến từ con chip AMD Ryzen 5 đáp ứng mọi nhu cầu công việc hằng ngày. MSI Modern 14 được đầu tư thiết kế nhằm tối ưu trải nghiệm và phục vụ nhu cầu di chuyển mỗi ngày của người dùng. Trọng lượng chỉ khoảng 1.4kg thuận lợi trong việc bỏ vào balo và mang đi cứ lúc nào. Kiểu dáng sang trọng với tông màu đen thời thượng kết hợp từng đường nét chau chuốt tỉ mỉ tạo ra một nét đẹp đầy phong cách. Bắt kịp xu hướng và thị hiếu của các bạn trẻ ngày nay.'),(14,'Laptop Lenovo Ideapad 5 Pro 14ITL6 82L300MAVN',19990000,0,'Laptop_Lenovo_Ideapad_5_Pro_14ITL6_82L300MAVN.webp','Bước đến với thị trường laptop văn phòng là một tân binh, Lenovo Ideapad 5 Pro 14ITL6 82L300MAVN vẫn tự tin khi sở hữu cho mình một vẻ ngoài đậm chất … văn phòng. Không cần sắc sảo như những người anh em Legion 5, Lenovo Ideapad 5 Pro 14ITL6 82L300MAVN khoác cho mình màu Cloud Grey đẹp mắt cùng mặt A hào nhoáng. Chiếc laptop đem đến sự tự tin và thoải mái nhất định đi được đồng hành cùng người dùng ở mọi môi trường làm việc, học tập. Kích thước mỏng chỉ ~ 16mm với trọng lượng khoảng 1.38kg, Lenovo Ideapad 5 Pro 14ITL6 82L300MAVN dễ dàng để cho vào balo và mang laptop ra khỏi thủ đô hay thành phố.'),(15,'Laptop ASUS VivoBook Pro 14 OLED K3405VC KM006W',26490000,0,'Laptop_ASUS_VivoBook_Pro_14_OLED_K3405VC_KM006W.webp','Laptop ASUS VivoBook Pro 14 OLED K3405VC KM006W sở hữu lớp vỏ kim loại đầy cứng cáp kết hợp cùng màu xám bạc thời thượng tạo sự thu hút đặc biệt đến người dùng. Từng đường nét trên máy đều được cắt xén tỉ mỉ thể hiện sự mạnh mẽ không chỉ về vẻ bề ngoài mà còn mạnh mẽ về hiệu suất hoạt động. Trọng lượng chỉ khoảng 1.68kg vô cùng nhẹ giúp người dùng thuận tiện hơn trong việc di chuyển. Phần logo của dòng ASUS Vivobook được đặt lệch sang một bên của nắp máy tính làm điểm nhấn cho sản phẩm thêm phần sang trọng khi người dùng sử dụng ở bất cứ đâu.'),(16,'Chuột Logitech G102 Lightsync RGB Black',400000,0,'Chuột_Logitech_G102_Lightsync_RGB_Black.webp','Dù có mức giá rất bình dân nhưng chuột Logitech G102 Lightsync RGB lại được trang bị led  RGB 16,8 triệu màu .Chọn một màu hay trộn 3 màu, hiệu ứng có sẵn hay tạo hiệu ứng của riêng bạn . Sự lựa chọn là của bạn ! Bạn còn có thể đồng bộ chuột với thiết bị LIGHTSYNC của Logitech G khác giúp góc máy trở nên đồng bộ và độc đáo hơn. Theo dõi con trỏ chính xác và đạt hiệu suất phản hồi nhanh nhạy nhờ vào cảm biến cấp độ chơi game. Với độ nhạy có thể tùy chỉnh từ 200 - 8.000 DPI cùng feet chuột chất lượng, hãy chọn mức độ phù hợp với sở thích chơi của bạn. Sử dụng phần mềm HUB G của Logitech để lập trình lên tới 5 chế độ thiết lập sẵn.'),(18,'Chuột Logitech G502 X Plus LightSpeed White',3290000,0,'Chuột_Logitech_G502_X_Plus_LightSpeed_White.webp','Chuột Logitech G502 X PLUS White là sản phẩm mới nhất của series G502 đình đám. Được thiết kế lại và cải tiến với công nghệ chơi game hiện đại, bao gồm công tắc Lightforce lai quang học - cơ học đầu tiên, Lightspeed không dây, LIGHT SYNC RGB và cảm biến quang học Hero 25K, Logitech G502 X PLUS chắc chắn là một trong những gaming gear đáng mua nhất cho game thủ thời gian sắp tới.'),(19,'Chuột Havit MS953',350000,0,'Chuột_Havit_MS953.webp','Havit MS953 sở hữu thiết kế độc đáo cùng những chi tiết led RGB được gia công tinh xảo tạo nên tổng thể vô cùng đẹp mắt. Trang bị lên đến 7 nút bấm được bố trí thông minh, thiết kế ôm tay tạo cảm giác cầm nắm chắc chắn trong từng pha xử lý. Hứa hẹn đây sẽ là một trong những dòng chuột máy tính mang đến cho người dùng những cảm xúc thăng hoa với tựa game yêu thích.'),(20,'Chuột ASUS ROG Harpe Ace Aim Lab Edition',2690000,0,'Chuột_ASUS_ROG_Harpe_Ace_Aim_Lab_Edition.webp','ASUS - Thương hiệu đã vô cùng nổi tiếng với các sản phẩm công nghệ, từ laptop đến các linh kiện máy tính. Và khi lấn sân sang gaming gear, ASUS vẫn sở hữu cho mình một dòng sản phẩm chuột gaming cao cấp mang tên ASUS ROG Harpe Ace. Chúng ta cùng chào mừng phiên bản mới nhất của lineup sản phẩm với model ASUS ROG Harpe Ace Aim Lab Edition. Cùng GEARVN đi tìm hiểu kỹ hơn về chú chuột này nhé!'),(21,'Chuột chơi game ZOWIE EC3-C',1590000,0,'Chuột_chơi_game_ZOWIE_EC3-C.webp','Chuột gaming ZOWIE EC3-C sở hữu một thiết kế nhỏ gọn được thiết kế cho người dùng thuận tay phải. Thiết kế này cung cấp cho người dùng nhiều không gian hơn để di chuyển cổ tay. Cạnh phải chuột được thiết kế bo tròn giúp mang đến tư thế cầm tay thoải mái nhất cho người dùng và sự mượt mà khi di chuyển. Phiên bản chuột ZOWIE EC3-C mới có kích thước và trọng lượng nhỏ gọn giúp nâng cao tính linh động khi di chuyển, cáp paracord siêu đàn hồi và con lăn 24 nấc phù hợp với mọi nhu cầu và sở thích cá nhân.'),(22,'Chuột Razer Viper V2 Pro',3290000,0,'Chuột_Razer_Viper_V2_Pro.webp','Theo Razer, cảm biến quang học Focus Pro 30K mới giúp Viper V2 Pro là một trong những dòng chuột máy tính đạt được độ phân giải chính xác đến 99,8%. Cảm biến này được trang bị tính năng AI (trí tuệ nhân tạo) như Smart Tracking, Motion Sync và Asymmetric Cut-off giúp game thủ nâng cao hiệu suất đến mức cao ở các cấp độ chơi khó. Tính năng Asymmetric Cut-off đã được cải tiến để có thể hỗ trợ điều chỉnh độ cao chi tiết lên đến 26 cấp độ, so với chỉ 3 cấp độ ở phiên bản trước. Việc mở rộng phạm vi tùy chỉnh cho phép người dùng linh hoạt tinh chỉnh khoảng cách tối đa nhấc chuột và khoảng cách hạ chuột để phù hợp với lối chơi của họ.với lối chơi của họ.'),(23,'Bàn phím cơ AKKO 3068B Black Gold',2190000,0,'Bàn_phím_cơ_AKKO_3068B_Black_Gold.webp','AKKO 3068B Black Gold dòng bàn phím máy tính chơi game được tích hợp nhiều tính năng nổi bật mang đến trải nghiệm gõ phím độc đáo. Kích thước Tenkeyless nhỏ gọn, dễ dàng kết với nhiều thiết bị nhờ vào khả năng tương thích cao. Đặc biệt, việc sử dụng bộ Switch độc quyền Akko TTC Switch hứa hẹn sẽ mang đến cho người chơi những trải nghiệm có một không hai.'),(24,'Bàn phím cơ Razer BlackWidow V4 Pro',5499000,0,'Bàn_phím_cơ_Razer_BlackWidow_V4_Pro.webp','Razer BlackWidow V4 Pro Green Switch có thể nói là dòng bàn phím cơ đa năng nhất thời điểm hiện tại. Được đánh giá cao bởi những công nghệ được tích hợp giúp bạn nâng tầm trải nghiệm chơi game, tối ưu thời gian làm việc. Không dừng lại ở đó, với thiết kế đẹp mắt mang đậm chất Gaming. Hứa hẹn đây sẽ là dòng bàn phím máy tính bạn không nên bỏ qua đấy nhé!'),(25,'Bàn phím cơ Razer Huntsman Mini Mercury',3090000,0,'Bàn_phím_cơ_Razer_Huntsman_Mini_Mercury.webp','Bàn phím Razer Huntsman Mini là một trong những dòng sản phẩm bàn phím cơ giá rẻ trang bị dây cáp type- C giúp đảm bảo độ chắc chắn, nó giúp đảm bảo rằng nó vẫn được kết nối an toàn trong khi chơi trò chơi và đặc biệt nó có thể dễ dàng tháo rời để bạn dễ dàng thuận tiện khi di chuyển khi sử dụng. Được thiết kế để có độ bền cao hơn, keycaps trên bàn phím chơi game 60% này có chất lượng cao cấp, kết cấu sẽ không bao giờ bị xuống cấp đến độ hoàn thiện sáng bóng hoặc bị mòn nhãn mác khi sử dụng với thời lượng cao. Để dễ dàng hơn khi thực thi các lệnh và phím nóng, các chức năng phụ cạnh bên cũng đã được thêm vào.'),(26,'Bàn phím cơ Asus ROG Strix Scope RX EVA Edition',3450000,0,'Bàn_phím_cơ_Asus_ROG_Strix_Scope_RX_EVA_Edition.webp','Bàn phím Asus ROG Strix Scope RX EVA Edition nằm trong bộ sưu tập EVANGELION được sáng tạo từ ROG. Mang thiết kế đặc trưng cùng tính năng Anti-ghosting, kháng nước IP57 hứa hẹn một sản phẩm tuyệt vời giúp các game thủ chiến game đắm chìm hơn.  Bàn phím Asus ROG Strix Scope RX EVA Edition sở hữu kiểu dáng fullsize hoàn hảo. Case được làm bằng nhôm cứng cáp màu tím kết hợp cùng các họa tiết ấn tượng từ bộ sưu tập EVANGELION. Sử dụng kết nối có dây qua giao diện USB 2.0 cung cấp đường truyền ổn định cho người dùng trong mọi hoàn cảnh.'),(27,'Bàn phím Asus ROG Strix Scope NX TKL Moonlight White',3390000,0,'Ban_phim_Asus_ROG_Strix_Scope_NX_TKL_Moonlight_White.webp','Asus đã trình làng bàn phím cơ Asus ROG Strix Scope NX TKL Moonlight White đặc biệt dành cho các game thủ trong những trận FPS đầy máu lửa. Một chiếc sản phẩm bắt mắt về thiết kế, hoàn hảo về chất lượng. Chiếc bàn phím Asus ROG Strix Scope NX TKL Moonlight White là một trong những sản phẩm gaming gear Asus ROG nổi bật được thiết kế nhỏ gọn. Giải phóng không gian trên bàn làm việc để có thể tích hợp di chuyển chuột mượt mà hơn.'),(28,'Bàn phím Corsair K68 - Red Led',2190000,0,'Bàn_phím_Corsair_K68_-_Red_Led.webp','Các dòng bàn phím cơ từ bàn phím không dây cho đến có dây từ Corsair luôn mang thiết kế vô cùng ấn tượng và độc đáo. Sản phẩm được chăm chút và hoàn thiện ở chất lượng cao, nhờ đó mà bạn hoàn toàn an tâm khi trải nghiệm. Đi kèm những phần cứng tuyệt vời nhất như switch Cherry MX Red giúp bạn gõ êm ái. Kê tay xịn xò chống mỏi và êm ái.'),(29,'Bàn phím cơ Corsair K65 RGB MINI White',2590000,0,'Bàn_phím_cơ_Corsair_K65_RGB_MINI_White.webp','Bàn phím cơ Corsair K65 RGB MINI White Cherry MX Speed/ Red kết hợp hiệu suất cấp cao với tính di động, nó có công nghệ siêu xử lý AXON, Switch cơ CHERRY MX và khả năng tùy chỉnh đặc biệt trong một thiết kế bàn phím cơ nhỏ gọn 60%. Corsair K65 RGB MINI cung cấp các tính năng lớn được gói gọn trong kiểu phím 60%, dễ dàng phù hợp với mọi thiết lập để chơi game thoải mái và di chuyển. Cùng với thiết kế vô cùng nhỏ gọn không khác gì các dòng bàn phím không dây. Đây sẽ là một trong những sản phẩm ngoại vi dành cho game thủ thích một góc máy chơi game gọn gàng.'),(30,'Bàn phím cơ Corsair K100 RGB Midnight Gold',5890000,0,'Bàn_phím_cơ_Corsair_K100_RGB_Midnight_Gold.webp','Corsair K100 RGB Midnight Gold sẽ là người bạn đồng hành tuyệt vời trong những trận game đầy máu lửa của bạn. Nhà Corsair đã thành công mang đến chiếc bàn phím cơ với những tính năng vượt trội và cảm giác gõ lôi cuốn đến mọi người. Tìm hiểu ngay về sản phẩm cùng GEARVN nhé. Corsair K100 RGB được thiết kế bằng khung nhôm mạ vàng bền bỉ cho một sản phẩm chắc chắn đầy sang trọng. Theo đó là đèn nền RGB động cho mỗi phím tạo nên một chiếc bàn phím vô cùng đẹp mắt.'),(31,'Bàn phím Fuhlen Eraser Mechanical Keyboard',790000,0,'Bàn_phím_Fuhlen_Eraser_Mechanical_Keyboard.webp','Fuhlen là một trong những thương hiệu nổi tiếng khi mang đến tay người tiêu dùng những dòng sản phẩm gaming gear chính hãng, chất lượng với giá thành rất hợp lý. Với các dòng sản phẩm đã tạo nên thương hiệu như các dòng chuột fuhlen, tai nghe gaming, pad chuột và các dòng bàn phím. Trong đó, không thể nào không nhắc đến Fuhlen E (Eraser).'),(32,'Tai nghe Razer Barracuda X 2022 Quart',2390000,0,'Tai_nghe_Razer_Barracuda_X_2022_Quart.webp','Razer Barracuda X 2022 Quart mang đến chiếc tai nghe chơi game hoàn hảo cho mọi game thủ. Thiết kế ôm sát với khả năng lọc âm thanh tốt cùng kết nối không dây tiện lợi hứa hẹn sẽ mang đến sản phẩm tuyệt vời. Sẵn sàng cho mọi khoảnh khắc chơi game đắm chìm hay nghe nhạc ngoài trời, tai nghe Razer Barracuda X 2022 Quart đều mang đến sự thoải mái. Phần đệm tai vô cùng thông thoáng với chất liệu Flowknit Memory Foam. Kích thước vừa đủ để ôm trọn lấy đôi tai của bạn.'),(33,'Tai nghe Razer Hammerhead True Wireless Earbuds Pikachu Limited Edition',4890000,0,'Tai_nghe_Razer_Hammerhead_True_Wireless_Earbuds_Pikachu_Limited_Edition.webp','Tai nghe Razer Hammerhead True Wireless Earbuds Pikachu Limited Edition với các trình điều khiển động 13mm của dòng tai nghe true wireless được điều chỉnh tùy chỉnh để mang lại trải nghiệm nghe chất lượng, tạo ra âm trầm và âm trung rõ nét với âm trầm sâu, thỏa mãn. Với độ trễ đầu vào cực thấp 60ms, kết nối của những mẫu tai nghe bluetooth hàng đầu trong ngành của nó mang lại âm thanh mượt mà, không bị giật hình mà không bị trễ hoặc bỏ qua âm thanh.'),(34,'Tai nghe Razer BlackShark V2 X White',1190000,0,'Tai_nghe_Razer_BlackShark_V2_X_White.webp','Razer luôn mang đến người dùng những dòng sản phẩm Gaming Gear như chuột gaming, bàn phím máy tính cùng nhiều phụ kiện chơi game chất lượng, cùng thiết kế ấn tượng được hàng triệu game thủ chuyên nghiệp, Streamer nổi tiếng lựa chọn. \r\n\r\nTai nghe Razer BlackShark V2 X sở hữu vẻ ngoài vô cùng sang trọng với tông màu trắng cùng các chi tiết được tinh xảo giúp tai nghe máy tính mới nhất từ Razer thêm phần độc đáo. Lấy cảm hứng từ những dòng tai nghe dành cho phi công, tạo cho người chơi thêm phấn khởi khi chơi game.'),(35,'Tai nghe HP HYPERX Cloud Earbuds II Red',1090000,0,'Tai_nghe_HP_HYPERX_Cloud_Earbuds_II_Red.webp','HyperX Cloud Earbuds II Red dòng tai nghe máy tính với nhiều cải tiếng mạnh mẽ về thiết kế, hệ thống âm thanh được xử lý chỉnh chu mang đến tai người chơi chất âm vô cùng chất lượng. Hứa hẹn đây sẽ là một trong những dòng tai nghe in ear sở hữu âm thanh chất lượng và khả năng di động tiện lợi rất đáng trải nghiệm.'),(36,'Loa SoundMax A700',480000,0,'Loa_SoundMax_A700.webp','SoundMax A700 dòng loa vi tính với thiết kế độc đáo kết hợp cùng hệ thống led RGB tạo nên không gian chơi game ấn tượng. Sở hữu hệ thống âm thanh 3 loa chất lượng 1 loa siêu trầm Subwoofer và 2 loa vệ tinh nhỏ gọn, xinh xắn. Đồng thời, với dòng loa ​​SoundMax bạn có thể kết nối tiện lợi với nhiều thiết bị khác nhau để có những trải nghiệm riêng biệt.'),(37,'Loa Microlab B26',280000,0,'Loa_Microlab_B26.webp','Microlab B26 có thiết kế dạng hình khối với những đường cắt sắc gọn vô cùng sáng tạo giúp loa toát lên sự sang trọng, đẳng cấp và phong cách riêng của mình. Chân loa khá lớn cùng thiết kế đối xứng giúp loa đứng vững vàng hơn trên bàn, kệ tủ, văn phòng làm việc của bạn.'),(38,'Loa Razer Leviathan V2 X',2690000,0,'Loa_Razer_Leviathan_V2_X.webp','Được ra mắt với vai trò là loa máy tính, Razer Leviathan V2 X hứa hẹn sẽ trở thành một gaming gear đáng sở hữu cho những ai vừa muốn trang trí không gian chơi game của mình vừa muốn có một thiết bị âm thanh tuyệt vời. Sở hữu vẻ ngoài đơn giản nhưng vô cùng thanh lịch, Razer Leviathan V2 X hứa hẹn mang đến cho người dùng những trải nghiệm âm thanh sống động nhất.'),(39,'Loa SoundMax SB206',870000,0,'Loa_SoundMax_SB206.webp','SoundMax SB206 với vẻ ngoài vô cùng sang trọng, người chơi hoàn toàn có thể mang đi bất kỳ đâu nhờ vào thiết kế nhỏ gọn. Công nghệ kết nối Bluetooth ổn định, thời lượng pin sử dụng liên tục lên đến 4 giờ tránh làm gián đoạn cho những chuyến đi chơi xa, dã ngoại, picnic,...'),(40,'Bộ Định Tuyến TP-Link Archer C86 AC1900',999000,0,'Bộ_Định_Tuyến_TP-Link_Archer_C86_AC1900.webp','TP-Link Archer C86 AC1900 một trong những dòng Router WiFi được tích hợp nhiều công nghệ hiện đại cải thiện hiệu suất và tốc độ truyền tải Internet. Hứa hẹn đây sẽ là một trong những thiết bị mạng hoạt động ổn định, tránh tình trạng tắc nghẽn giúp bạn nâng cao hiệu suất làm việc và chơi game giải trí lên một tầm cao mới.'),(41,'Bộ định tuyến WiFi 6 Mercusys MR70X',1090000,0,'Bộ_định_tuyến_WiFi_6_Mercusys_MR70X.webp','Bộ tiếp sóng Mercusys MR70X có các ăng-ten MIMO bên ngoài mạnh mẽ để giúp bạn loại bỏ các vùng chết tín hiệu và cải thiện tầm phủ sóng của router không dây hiện có. Thiết bị hoạt động như một bộ lặp sóng đồng nghĩa với thiết bị có thể mở rộng kết nối mạng không dây tới mọi ngóc ngách của ngôi nhà, tới cả những điểm khó vươn tới. Điều này giúp đảm phủ sóng internet tốc độ cao và tin cậy tới mọi vị trí cho các thiết bị như notebook, máy tính bảng, điện thoại thông minh, máy chơi game và TV thông minh.'),(42,'Bộ định tuyến MESH WiFi 5 TP-Link Deco E4 (2 pack) chuẩn AC1200',1399000,0,'Bộ_định_tuyến_MESH_WiFi_5_TP-Link_Deco_E4.webp','Deco E4 là cách đơn giản nhất để đảm bảo tín hiệu Wi-Fi mạnh ở mọi góc trong nhà của bạn lên tới hơn 260 mét vuông. Các kết nối Wi-Fi và đường truyền Ethernet tùy chọn hoạt động cùng nhau để liên kết các thiết bị Deco, cung cấp tốc độ mạng nhanh hơn và vùng phủ sóng thực sự liền mạch. Muốn mở rộng vùng phủ sóng? Đơn giản chỉ cần thêm một Deco khác.'),(43,'Bộ tiếp sóng WiFi 6 TP-Link RE505X chuẩn AX1500',1490000,0,'Bộ_tiếp_sóng_WiFi_6_TP-Link_RE505X_chuẩn_AX1500.webp','Re505X được trang bị công nghệ không dây wifi 6 mới nhất, tốc độ nhanh cùng dung lượng cực lớn, độ trễ giảm tối thiểu nhất. Công nghệ này còn giúp giảm tắc nghẽn mạng hiệu quả cho wifi nhà bạn. Sử dụng cổng Gigabit Ethernet để cung cấp kết nối dùng dây nhanh và mạnh mẽ hơn đến TV, laptop, máy chơi game,... Ngoài ra, bạn còn có thể thiết lập mạng Mesh bằng cách tạo kết nối với bộ định tuyến OneMesh và phủ sóng liền mạch.'),(44,'Bộ phát sóng Wi-Fi di động 4G TP-Link MIFi 7350',1490000,0,'Bộ_phát_sóng_Wi-Fi_di_động_4G_TP-Link_MIFi_7350.webp','Bộ phát sóng Wi-Fi di động 4G TP-Link MIFi 7350 hỗ trợ chuẩn 4G LTE với tốc độ download lên đến 150Mbps và tốc độ upload lên đến 50Mbps đem lại cho bạn trải nghiệm lướt web mượt mà, thưởng thức những bộ phim một cách trọn vẹn, tải tập tin trong chớp mắt và những cuộc gọi video call không bị ngắt quãng.'),(45,'Card mạng PCIe WiFi 6 ASUS PCE-AX58BT Chuẩn AX3000',1490000,0,'Card_mạng_PCIe_WiFi_6_ASUS_PCE-AX58BT_Chuẩn_AX3000.webp','Với công nghệ Wi-Fi 6 (802.11ax) và băng thông 160 MHz, ASUS PCE-AX58BT cho tốc độ không giây nhanh hơn 2,7 lần so với các thiết bị Wi-Fi 5 (802.11ac). Sự kết hợp mang tính cách mạng của công nghệ OFDMA và MU-MIMO đảm bảo kết nối Wi-Fi hiệu quả nhất đối với PC của bạn. PCE-AX58BT chỉ hỗ trợ tiêu chuẩn PCI-Express x1, vì vậy hãy lắp đặt bộ điều hợp vào khe cắm PCI-e x1.'),(46,'Card mạng WiFi 6 Asus PCE-AX3000 chuẩn AX3000',1190000,0,'Card_mạng_WiFi_6_Asus_PCE-AX3000_chuẩn_AX3000.webp','Với công nghệ WiFi 6 (802.11ax) và băng thông rộng 160 MHz, ASUS PCE-AX3000 mang đến tốc độ không dây nhanh hơn gấp 2,7 lần so với các thiết bị WiFi 5 (802.11ac). Sự kết hợp mang tính cách mạng giữa công nghệ OFDMA và MU-MIMO đảm bảo kết nối WiFi hiệu quả nhất cho máy tính của bạn.'),(47,'SSD SamSung 990 PRO 2TB M.2 PCIe gen 4 NVMe (MZ-V9P2T0BW)',7590000,0,'SSD_SamSung_990_PRO_2TB_M.2_PCIe_gen_4_NVMe_MZ-V9P2T0BW.webp','Samsung, thương hiệu luôn nằm trong top đầu ở lĩnh vực công nghệ đặc biệt là ổ cứng lưu trữ. Thể hiện sự vượt trội với những sản phẩm ổ cứng SSD cao cấp, Samsung mang tới những thành phẩm vô cùng lý tưởng dành cho máy tính bàn và laptop. Và với model Samsung 990 PRO 2TB M.2 PCIe gen 4 NVMe thì đây thực sự là một lựa chọn tuyệt vời dành cho những người dùng chuyên nghiệp. Hãy cùng GEARVN tìm hiểu về chiếc ổ cứng SSD này ngay sau đây nhé !'),(48,'SSD GIGABYTE NVMe 256Gb',790000,0,'SSD_GIGABYTE_NVMe_256Gb.webp','Ổ cứng SSD là phương tiện lưu trữ dữ liệu trên máy tính. Nó không những là một sự nâng cấp hoàn hảo cho ổ HDD truyền thống trong việc xử lý dữ liệu mà còn cải thiện tối đa nhiệt độ và điện năng tiêu thụ. SSD Gigabyte M.2 PCIe 256GB thế hệ mới với chuẩn giao thức kết nối PCI-Express 3.0 x4 và NVMe 1.3 tự hào có thể làm tốt mọi tác vụ cần có ở một ổ lưu trữ và nâng cao hiệu suất hệ thống.'),(49,'SSD Kingston A400 480GB 2.5\' SATA III',1490000,0,'SSD_Kingston_A400_480GB_2.5_SATA_III.webp','Ổ cứng SSD Kingston A400 480GB 2.5\' SATA III là một trong những sản phẩm SSD cải thiện tốc độ đáp ứng của hệ thống hiện tại của bạn với tốc độ khởi động, tải và truyền nhanh một cách đáng kinh ngạc so với ổ cứng cơ học.  Được hỗ trợ bởi thế hệ bộ điều khiển mới nhất cho tốc độ đọc và ghi lên đến 500MB/giây và 450MB/giây, ổ SSD này nhanh hơn 10 lần so với một ổ cứng truyền thống mang lại hiệu năng cao hơn, khả năng đa nhiệm siêu mượt và tốc độ lớn hơn cho toàn bộ hệ thống. Đáng tin cậy và bền hơn so với ổ cứng thông thường.'),(50,'SSD GIGABYTE AORUS 500GB M.2 PCIe NVMe gen 4',3090000,0,'SSD_GIGABYTE_AORUS_500GB_M.2_PCIe_NVMe_gen_4.webp','SSD GIGABYTE AORUS 500GB M.2 PCIe NVMe Gen 4 là chiếc SSD mới nhất, được sản xuất từ một trong những thương hiệu nổi tiếng về các phần cứng của PC Gaming như VGA, mainboard,... đó là GIGABYTE AORUS. SSD GIGABYTE AORUS 500GB được trang bị những công nghệ tiên tiến nhất hiện, hướng tới trải nghiệm sử dụng tuyệt vời nhất cho người dùng.'),(51,'Ổ cứng SSD Kingston KC2500 500GB PCIe Gen 3.0',1890000,0,'Ổ_cứng_SSD_Kingston_KC2500_500GB_PCIe_Gen_3.0.webp','Ổ cứng SSD PCIe NVMe KC2500 của Kingston mang lại hiệu năng mạnh mẽ vì sử dụng bộ điều khiển Gen 3.0 x 4 mới nhất và NAND TLC 3D 96 lớp. Với tốc độ đọc/ghi lên đến 3.500/2.900MB/giây, KC2500 cho độ bền xuất sắc và nâng cao hiệu suất công việc trên máy bàn, máy trạm và các hệ thống điện toán hiệu năng cao (HPC). Thiết kế M.2 nhỏ gọn linh hoạt hơn, tăng dung lượng lưu trữ và tiết kiệm không gian.'),(52,'USB',250000,0,'USB.webp','Thiết bị mạng Asus USB-N10 NANO sở hữu Wi-Fi siêu nhanh chưa bao giờ trở nên dễ dàng truy cập đến thế qua USB, lên đến 150Mbps trên băng tần 2.4GHz thông thoáng. Sử dụng chuẩn không dây 802.11b/g/n, kết nối nhanh hơn và sự tận hưởng sẽ đến với tất cả các thiết bị của bạn.'),(54,'aaa',10000,0,'','');
/*!40000 ALTER TABLE `app_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_product_category`
--

DROP TABLE IF EXISTS `app_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_product_category_product_id_category_id_73528da5_uniq` (`product_id`,`category_id`),
  KEY `app_product_category_category_id_369a9753_fk_app_category_id` (`category_id`),
  CONSTRAINT `app_product_category_category_id_369a9753_fk_app_category_id` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`id`),
  CONSTRAINT `app_product_category_product_id_c059d7b6_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_product_category`
--

LOCK TABLES `app_product_category` WRITE;
/*!40000 ALTER TABLE `app_product_category` DISABLE KEYS */;
INSERT INTO `app_product_category` VALUES (3,3,3),(4,4,3),(5,5,3),(6,6,3),(7,7,3),(8,8,3),(9,9,3),(10,10,3),(11,11,9),(12,12,9),(13,13,9),(14,14,9),(15,15,9),(16,16,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,2),(24,24,2),(25,25,2),(26,26,2),(27,27,2),(28,28,2),(29,29,2),(30,30,2),(31,31,2),(32,32,6),(33,33,6),(34,34,6),(35,35,6),(36,36,6),(37,37,6),(38,38,6),(39,39,6),(40,40,8),(41,41,8),(42,42,8),(43,43,8),(44,44,8),(45,45,8),(46,46,8),(47,47,7),(50,48,7),(51,49,7),(52,50,7),(53,51,7),(54,52,11),(56,54,11);
/*!40000 ALTER TABLE `app_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_shippingaddress`
--

DROP TABLE IF EXISTS `app_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `app_shippingaddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_shippingaddress_order_id_220f1517_fk_app_order_id` (`order_id`),
  KEY `app_shippingaddress_customer_id_24c9534f_fk_auth_user_id` (`customer_id`),
  CONSTRAINT `app_shippingaddress_customer_id_24c9534f_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `app_shippingaddress_order_id_220f1517_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_shippingaddress`
--

LOCK TABLES `app_shippingaddress` WRITE;
/*!40000 ALTER TABLE `app_shippingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add shipping address',9,'add_shippingaddress'),(34,'Can change shipping address',9,'change_shippingaddress'),(35,'Can delete shipping address',9,'delete_shippingaddress'),(36,'Can view shipping address',9,'view_shippingaddress'),(37,'Can add order item',10,'add_orderitem'),(38,'Can change order item',10,'change_orderitem'),(39,'Can delete order item',10,'delete_orderitem'),(40,'Can view order item',10,'view_orderitem'),(41,'Can add category',11,'add_category'),(42,'Can change category',11,'change_category'),(43,'Can delete category',11,'delete_category'),(44,'Can view category',11,'view_category');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (19,'pbkdf2_sha256$600000$DYylqsxXQHeD8LOfzhmrSy$7wwpxY8iOI3Brqd2aItm8L5haKEs0RN1OU32v+DMpm4=','2024-03-14 14:39:00.753889',1,'admin1','long','nguyen','pl02042002@gmail.com',1,1,'2023-06-05 16:43:26.000000'),(32,'pbkdf2_sha256$600000$6PDq94qUvfmdSmxlLWB39T$LY/aYZVuvx22a+dyg3UojOGVQlpYVDvVf7F0vuOhYH0=','2023-07-02 04:10:40.077663',0,'test1','Long','Nguyễn','long@gmail.com',1,1,'2023-07-02 04:05:32.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (7,32,29);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (76,'2023-06-05 16:46:40.639563','28','Bàn phím Corsair K68 - Red Led',1,'[{\"added\": {}}]',8,19),(77,'2023-06-05 16:47:59.126372','29','Bàn phím cơ Corsair K65 RGB MINI White',1,'[{\"added\": {}}]',8,19),(78,'2023-06-05 16:49:04.807087','30','Bàn phím cơ Corsair K100 RGB Midnight Gold',1,'[{\"added\": {}}]',8,19),(79,'2023-06-05 16:49:59.451029','31','Bàn phím Fuhlen Eraser Mechanical Keyboard',1,'[{\"added\": {}}]',8,19),(80,'2023-06-05 16:50:12.554566','31','Bàn phím Fuhlen Eraser Mechanical Keyboard',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,19),(81,'2023-06-05 16:52:53.309784','32','Tai nghe Razer Barracuda X 2022 Quart',1,'[{\"added\": {}}]',8,19),(82,'2023-06-05 16:54:47.900286','33','Tai nghe Razer Hammerhead True Wireless Earbuds Pikachu Limited Edition',1,'[{\"added\": {}}]',8,19),(83,'2023-06-05 16:55:32.005551','6','Tai nghe - Loa',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,19),(84,'2023-06-05 16:56:01.858005','34','Tai nghe Razer BlackShark V2 X White',1,'[{\"added\": {}}]',8,19),(85,'2023-06-05 16:57:24.448439','35','Tai nghe HP HYPERX Cloud Earbuds II Red',1,'[{\"added\": {}}]',8,19),(86,'2023-06-05 16:58:55.150081','36','Loa SoundMax A700',1,'[{\"added\": {}}]',8,19),(87,'2023-06-05 16:59:42.158018','37','Loa Microlab B26',1,'[{\"added\": {}}]',8,19),(88,'2023-06-05 17:00:24.936721','38','Loa Razer Leviathan V2 X',1,'[{\"added\": {}}]',8,19),(89,'2023-06-05 17:01:08.233120','39','Loa SoundMax SB206',1,'[{\"added\": {}}]',8,19),(90,'2023-06-06 03:42:46.699566','40','Bộ Định Tuyến TP-Link Archer C86 AC1900',1,'[{\"added\": {}}]',8,19),(91,'2023-06-06 03:45:04.102366','41','Bộ định tuyến WiFi 6 Mercusys MR70X',1,'[{\"added\": {}}]',8,19),(92,'2023-06-06 03:46:27.770991','42','Bộ định tuyến MESH WiFi 5 TP-Link Deco E4 (2 pack) chuẩn AC1200',1,'[{\"added\": {}}]',8,19),(93,'2023-06-06 03:48:49.009624','43','Bộ tiếp sóng WiFi 6 TP-Link RE505X chuẩn AX1500',1,'[{\"added\": {}}]',8,19),(94,'2023-06-06 03:49:51.981552','44','Bộ phát sóng Wi-Fi di động 4G TP-Link MIFi 7350',1,'[{\"added\": {}}]',8,19),(95,'2023-06-06 03:51:16.687369','45','Card mạng PCIe WiFi 6 ASUS PCE-AX58BT Chuẩn AX3000',1,'[{\"added\": {}}]',8,19),(96,'2023-06-06 03:52:43.712010','46','Card mạng WiFi 6 Asus PCE-AX3000 chuẩn AX3000',1,'[{\"added\": {}}]',8,19),(97,'2023-06-06 03:54:28.731633','10','Máy in',3,'',11,19),(98,'2023-06-06 03:54:28.739337','5','Playstation',3,'',11,19),(99,'2023-06-06 03:54:28.743475','4','Camera',3,'',11,19),(100,'2023-06-06 03:58:00.208204','47','SSD SamSung 990 PRO 2TB M.2 PCIe gen 4 NVMe (MZ-V9P2T0BW)',1,'[{\"added\": {}}]',8,19),(101,'2023-06-06 03:59:21.015134','48','SSD GIGABYTE NVMe 256Gb',1,'[{\"added\": {}}]',8,19),(102,'2023-06-06 04:00:45.284419','49','SSD Kingston A400 480GB 2.5\' SATA III',1,'[{\"added\": {}}]',8,19),(103,'2023-06-06 04:02:05.392599','50','SSD GIGABYTE AORUS 500GB M.2 PCIe NVMe gen 4',1,'[{\"added\": {}}]',8,19),(104,'2023-06-06 04:03:07.104253','51','Ổ cứng SSD Kingston KC2500 500GB PCIe Gen 3.0',1,'[{\"added\": {}}]',8,19),(105,'2023-06-06 04:03:31.833163','51','Ổ cứng SSD Kingston KC2500 500GB PCIe Gen 3.0',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,19),(106,'2023-06-06 04:03:42.711062','49','SSD Kingston A400 480GB 2.5\' SATA III',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,19),(107,'2023-06-06 04:04:36.513675','48','SSD GIGABYTE NVMe 256Gb',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',8,19),(108,'2023-06-09 03:15:37.238633','20','huy',1,'[{\"added\": {}}]',4,19),(109,'2023-06-09 03:16:30.189763','20','huy',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,19),(110,'2023-06-10 05:13:59.109553','20','huy',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,19),(111,'2023-06-10 05:15:25.548900','20','huy',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,19),(112,'2023-06-10 06:07:40.988847','11','Phần mềm',1,'[{\"added\": {}}]',11,19),(113,'2023-06-10 06:08:14.960558','52','USB',1,'[{\"added\": {}}]',8,19),(114,'2023-06-10 06:15:13.098814','23','test1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,19),(115,'2023-06-10 06:17:03.823109','23','test1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,19),(116,'2023-06-10 06:19:08.908465','20','huy',3,'',4,19),(117,'2023-06-10 06:19:08.949656','21','long',3,'',4,19),(118,'2023-06-10 06:19:08.950655','22','test',3,'',4,19),(119,'2023-06-10 06:19:17.127320','24','long',1,'[{\"added\": {}}]',4,19),(120,'2023-06-10 06:20:03.736009','24','long',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]',4,19),(121,'2023-06-10 06:22:03.195982','24','long',3,'',4,19),(122,'2023-06-10 06:22:03.199041','23','test1',3,'',4,19),(123,'2023-06-10 06:22:13.309049','25','long',1,'[{\"added\": {}}]',4,19),(124,'2023-06-10 06:22:46.569264','25','long',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"User permissions\"]}}]',4,19),(125,'2023-06-20 14:10:38.024333','1','Chuột',2,'[]',11,19),(126,'2023-06-30 05:04:42.771327','25','long',3,'',4,19),(127,'2023-06-30 05:04:42.776375','26','test1',3,'',4,19),(128,'2023-06-30 05:04:42.778937','27','test123',3,'',4,19),(129,'2023-06-30 05:04:42.782168','28','test1234',3,'',4,19),(130,'2023-06-30 05:04:55.667082','31','OrderItem object (31)',3,'',10,19),(131,'2023-06-30 05:04:59.778255','30','OrderItem object (30)',3,'',10,19),(132,'2023-06-30 05:05:07.681297','21','21',3,'',7,19),(133,'2023-06-30 05:05:07.685285','20','20',3,'',7,19),(134,'2023-06-30 05:05:07.688277','19','19',3,'',7,19),(135,'2023-06-30 05:05:07.690272','18','18',3,'',7,19),(136,'2023-06-30 05:05:07.704235','17','17',3,'',7,19),(137,'2023-06-30 05:05:07.707227','16','16',3,'',7,19),(138,'2023-06-30 05:05:07.711219','15','15',3,'',7,19),(139,'2023-06-30 05:05:07.714209','14','14',3,'',7,19),(140,'2023-06-30 05:05:07.717200','13','13',3,'',7,19),(141,'2023-06-30 05:05:07.720193','12','12',3,'',7,19),(142,'2023-06-30 05:05:07.722188','11','11',3,'',7,19),(143,'2023-06-30 05:05:07.725180','10','10',3,'',7,19),(144,'2023-06-30 05:05:07.728172','9','9',3,'',7,19),(145,'2023-06-30 05:05:07.731164','8','8',3,'',7,19),(146,'2023-06-30 05:05:07.733159','7','7',3,'',7,19),(147,'2023-06-30 05:05:07.736150','6','6',3,'',7,19),(148,'2023-06-30 05:05:07.740139','5','5',3,'',7,19),(149,'2023-06-30 05:05:07.743131','4','4',3,'',7,19),(150,'2023-06-30 05:05:07.747120','3','3',3,'',7,19),(151,'2023-06-30 05:05:07.750113','2','2',3,'',7,19),(152,'2023-06-30 05:05:07.753105','1','1',3,'',7,19),(153,'2023-06-30 05:05:13.288110','29','OrderItem object (29)',3,'',10,19),(154,'2023-06-30 05:05:13.292352','25','OrderItem object (25)',3,'',10,19),(155,'2023-06-30 05:05:13.296949','24','OrderItem object (24)',3,'',10,19),(156,'2023-06-30 05:05:13.300312','22','OrderItem object (22)',3,'',10,19),(157,'2023-06-30 05:05:13.303942','21','OrderItem object (21)',3,'',10,19),(158,'2023-06-30 05:05:13.307936','14','OrderItem object (14)',3,'',10,19),(159,'2023-06-30 05:05:13.310926','13','OrderItem object (13)',3,'',10,19),(160,'2023-06-30 05:05:13.314768','12','OrderItem object (12)',3,'',10,19),(161,'2023-06-30 05:05:13.318138','11','OrderItem object (11)',3,'',10,19),(162,'2023-06-30 05:05:13.321886','10','OrderItem object (10)',3,'',10,19),(163,'2023-06-30 05:05:13.325240','9','OrderItem object (9)',3,'',10,19),(164,'2023-06-30 05:05:13.328468','8','OrderItem object (8)',3,'',10,19),(165,'2023-06-30 05:05:13.331892','7','OrderItem object (7)',3,'',10,19),(166,'2023-06-30 05:05:13.335347','1','OrderItem object (1)',3,'',10,19),(167,'2023-06-30 05:06:49.522142','22','22',3,'',7,19),(168,'2023-06-30 05:07:36.786270','36','OrderItem object (36)',3,'',10,19),(169,'2023-06-30 05:10:00.096607','23','23',3,'',7,19),(170,'2023-06-30 05:13:58.449502','41','OrderItem object (41)',3,'',10,19),(171,'2023-06-30 05:14:05.442884','40','OrderItem object (40)',3,'',10,19),(172,'2023-06-30 05:14:05.448869','39','OrderItem object (39)',3,'',10,19),(173,'2023-06-30 05:14:05.451900','38','OrderItem object (38)',3,'',10,19),(174,'2023-06-30 05:14:05.455226','37','OrderItem object (37)',3,'',10,19),(175,'2023-06-30 05:14:12.499970','25','25',3,'',7,19),(176,'2023-06-30 05:14:12.503663','24','24',3,'',7,19),(177,'2023-06-30 05:15:03.056348','26','26',1,'[{\"added\": {}}]',7,19),(178,'2023-06-30 05:15:07.904689','26','26',3,'',7,19),(179,'2023-06-30 09:13:56.622096','1','G1',1,'[{\"added\": {}}]',3,19),(180,'2023-06-30 09:14:28.009194','1','G1',2,'[]',3,19),(181,'2023-06-30 09:14:46.343136','1','G1',3,'',3,19),(182,'2023-06-30 16:28:14.011251','11','Phần mềm',2,'[]',11,19),(183,'2023-07-01 09:13:39.500329','28','28',3,'',7,19),(184,'2023-07-01 09:13:39.505964','27','27',3,'',7,19),(185,'2023-07-01 09:13:44.402210','44','OrderItem object (44)',3,'',10,19),(186,'2023-07-01 09:13:44.407106','43','OrderItem object (43)',3,'',10,19),(187,'2023-07-02 03:15:27.940338','29','test1',3,'',4,19),(188,'2023-07-02 03:38:07.031424','30','test1',3,'',4,19),(189,'2023-07-02 03:46:01.635288','31','test1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,19),(190,'2023-07-02 03:46:57.157314','31','test1',3,'',4,19),(191,'2023-07-02 03:50:26.761151','31','31',3,'',7,19),(192,'2023-07-02 03:50:26.766241','30','30',3,'',7,19),(193,'2023-07-02 03:50:26.769184','29','29',3,'',7,19),(194,'2023-07-02 04:08:51.005068','53','Chuột Logitech G102 Lightsync RGB Black',1,'[{\"added\": {}}]',8,19),(195,'2023-07-02 04:09:09.972505','53','Chuột Logitech G102 Lightsync RGB Black',3,'',8,19),(196,'2023-07-02 04:10:20.381655','32','test1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',4,19),(197,'2023-10-18 01:57:58.752931','54','aaa',1,'[{\"added\": {}}]',8,19);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'app','category'),(7,'app','order'),(10,'app','orderitem'),(8,'app','product'),(9,'app','shippingaddress'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-05 04:00:42.261493'),(2,'auth','0001_initial','2023-06-05 04:00:42.623837'),(3,'admin','0001_initial','2023-06-05 04:00:42.718160'),(4,'admin','0002_logentry_remove_auto_add','2023-06-05 04:00:42.726938'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-05 04:00:42.737876'),(6,'app','0001_initial','2023-06-05 04:00:43.147499'),(7,'app','0002_product_image','2023-06-05 04:00:43.171434'),(8,'app','0003_alter_order_customer_alter_shippingaddress_customer_and_more','2023-06-05 04:00:43.399949'),(9,'app','0004_category','2023-06-05 04:00:43.453273'),(10,'app','0005_product_category','2023-06-05 04:00:43.558859'),(11,'app','0006_product_detail','2023-06-05 04:00:43.581562'),(12,'contenttypes','0002_remove_content_type_name','2023-06-05 04:00:43.646861'),(13,'auth','0002_alter_permission_name_max_length','2023-06-05 04:00:43.690448'),(14,'auth','0003_alter_user_email_max_length','2023-06-05 04:00:43.720897'),(15,'auth','0004_alter_user_username_opts','2023-06-05 04:00:43.729579'),(16,'auth','0005_alter_user_last_login_null','2023-06-05 04:00:43.774811'),(17,'auth','0006_require_contenttypes_0002','2023-06-05 04:00:43.779911'),(18,'auth','0007_alter_validators_add_error_messages','2023-06-05 04:00:43.790963'),(19,'auth','0008_alter_user_username_max_length','2023-06-05 04:00:43.840867'),(20,'auth','0009_alter_user_last_name_max_length','2023-06-05 04:00:43.889707'),(21,'auth','0010_alter_group_name_max_length','2023-06-05 04:00:43.914710'),(22,'auth','0011_update_proxy_permissions','2023-06-05 04:00:43.926677'),(23,'auth','0012_alter_user_first_name_max_length','2023-06-05 04:00:43.985457'),(24,'sessions','0001_initial','2023-06-05 04:00:44.017374');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6rvr2ze1umpievojzjxparsdqc3xsrnn','.eJxVjEEOwiAQRe_C2hAoFKYu3fcMZAYGqRqalHZlvLtt0oVu_3vvv0XAbS1ha7yEKYmr0IO4_I6E8cn1IOmB9T7LONd1mUgeijxpk-Oc-HU73b-Dgq3sNfUDgLdkNHFyltiCRtdFMNl0OTplfb8DhJS8VwYoK2cj6sysSCOIzxcLxzht:1qsmok:GF4qDQ-4XWtV_gQEyugH3JXEM-pPd7dZW3zzAaWjHhg','2023-10-31 16:21:14.664113'),('a6cr6i67w3cux2jbfki594q848zyvmy8','.eJxVjEEOwiAQRe_C2hCYArUu3fcMzQzDSNVAUtqV8e7apAvd_vfef6kJtzVPW0vLNLO6KAjq9DsSxkcqO-E7llvVsZZ1mUnvij5o02Pl9Lwe7t9Bxpa_tbEBQIB9B65nY0XI0iCBuTOB0J0B0IuLGJAie_LJMjNa6TnC4JJ6fwAO1DkL:1q7tGL:x9NGgPqmQqTrB2qMBkl4PxrXyJT1U7uFQje64lKCtSk','2023-06-24 07:43:53.761786'),('jmi6eclitvl7lh5ts9urx0wis0hhm84i','.eJxVjDEOAiEQRe9CbQgMIGJp7xnIwAyyaiBZdivj3XWTLbT9773_EhHXpcZ18BwnEmcBQRx-x4T5wW0jdMd26zL3tsxTkpsidzrktRM_L7v7d1Bx1G_tWYE3VmlPJoHPlopxTBhOBrNzELQJHpRh4pCsBq1zKVg0YAlF2aN4fwD1XjfR:1qF6Qm:-YgeADbuqb-MLkf-Ht12Y6Udhm4xvQMNiaSeRqs3isE','2023-07-14 05:12:28.601346'),('kin1rxcpldb6tnmzsngcgfo1lpfjlbfu','.eJxVjEEOwiAQRe_C2hAoFKYu3fcMZAYGqRqalHZlvLtt0oVu_3vvv0XAbS1ha7yEKYmr0IO4_I6E8cn1IOmB9T7LONd1mUgeijxpk-Oc-HU73b-Dgq3sNfUDgLdkNHFyltiCRtdFMNl0OTplfb8DhJS8VwYoK2cj6sysSCOIzxcLxzht:1rkmEW:d2ff8liFnK0yNlXgOI5DsCs-53KFXXH0ks4o4m7DSm4','2024-03-28 14:39:00.762890'),('s58ivlvp7w0qmtsr6pgc3n163lj8o4lz','.eJxVjEEOwiAQRe_C2pCBwQIu3fcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXERqMXpd4yUHtx2ku_UbrNMc1uXKcpdkQftcpwzP6-H-3dQqddvzYgJz9qjV2BY6eKIE2RWxUZToqUIRiEnrYC18ey9csNggMFZ5xOJ9wf-ODeh:1qFoQ4:Wt4dD0eKEJRHmLUarOZ_hwsoVU1Y0xxL9cMnSGkDbzg','2023-07-16 04:10:40.081656');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 22:16:37
