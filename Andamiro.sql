-- --------------------------------------------------------
-- 호스트:                          kaget.iptime.org
-- 서버 버전:                        5.5.64-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- andamiro 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `andamiro` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `andamiro`;

-- 테이블 andamiro.CATEGORY 구조 내보내기
CREATE TABLE IF NOT EXISTS `CATEGORY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL COMMENT '매장 고유번호',
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '카테고리 명',
  `coordinates` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '카테고리 좌표',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='메뉴 카테고리';

-- 테이블 데이터 andamiro.CATEGORY:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;
INSERT INTO `CATEGORY` (`id`, `shop_id`, `name`, `coordinates`) VALUES
	(1, 1, '커피', '00'),
	(2, 1, '차', '01'),
	(3, 1, '디저트', '03');
/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;

-- 테이블 andamiro.MEMBER 구조 내보내기
CREATE TABLE IF NOT EXISTS `MEMBER` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pw` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='고객 정보 테이블';

-- 테이블 데이터 andamiro.MEMBER:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` (`id`, `pw`, `name`, `email`, `phone`) VALUES
	('kgt1994', '123123', '강근태', 'kgt1994@gmail.com', '01066686447'),
	('shs', '123123', '송희수', 'shs@naver.com', '01053478469'),
	('sys', '123', 'sys', 'ys@naver.com', '01012341234'),
	('sys8547', '1234', '신윤수', 'tlsdbstn67@naver.com', '01030760612');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;

-- 테이블 andamiro.MENU 구조 내보내기
CREATE TABLE IF NOT EXISTS `MENU` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '메뉴 고유 번호',
  `shop_id` int(11) NOT NULL COMMENT '가게 고유 번호',
  `category_id` int(11) NOT NULL COMMENT '카테고리 고유 아이디',
  `item` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '메뉴 이름',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '가격',
  `coordinates` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '메뉴 위치',
  PRIMARY KEY (`id`),
  KEY `FOREGN` (`shop_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='메뉴 테이블';

-- 테이블 데이터 andamiro.MENU:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `MENU` DISABLE KEYS */;
INSERT INTO `MENU` (`id`, `shop_id`, `category_id`, `item`, `price`, `coordinates`) VALUES
	(1, 1, 1, '아메리카노', 4000, '01'),
	(2, 1, 1, '카페라떼', 5000, '02'),
	(3, 1, 1, '바닐라라떼', 5500, '03'),
	(4, 1, 1, '모카라떼', 5500, '04'),
	(5, 1, 1, '에스프레소', 3000, '00'),
	(6, 1, 1, '콜드브루', 4500, '10'),
	(7, 1, 2, '녹차', 3000, '00'),
	(8, 1, 2, '홍차', 3000, '01'),
	(9, 1, 2, '페퍼민트', 3500, '03'),
	(10, 1, 2, '레몬차', 3000, '02'),
	(11, 1, 2, '캐모마일', 3500, '04'),
	(12, 1, 2, '코코아', 3000, '10'),
	(13, 1, 3, '치즈케이크', 3000, '04'),
	(14, 1, 3, '초코케이크', 5500, '10'),
	(15, 1, 3, '에그타르트', 4000, '03');
/*!40000 ALTER TABLE `MENU` ENABLE KEYS */;

-- 테이블 andamiro.ORDER 구조 내보내기
CREATE TABLE IF NOT EXISTS `ORDER` (
  `id` int(11) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 andamiro.ORDER:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER` ENABLE KEYS */;

-- 테이블 andamiro.ORDER_MENU 구조 내보내기
CREATE TABLE IF NOT EXISTS `ORDER_MENU` (
  `order_id` int(11) NOT NULL,
  `item` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='주문한 메뉴 테이블';

-- 테이블 데이터 andamiro.ORDER_MENU:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ORDER_MENU` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDER_MENU` ENABLE KEYS */;

-- 테이블 andamiro.PAYMENT 구조 내보내기
CREATE TABLE IF NOT EXISTS `PAYMENT` (
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '주문 번호 fk',
  `shop_id` int(11) NOT NULL COMMENT '매장 고유 넘버 fk',
  `item_id` int(11) DEFAULT NULL,
  `cash` int(11) DEFAULT '0' COMMENT '현금 결제 금액',
  `card` int(11) DEFAULT '0' COMMENT '카드 결제 금액',
  `duedate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '결제 일시',
  KEY `shop_id` (`shop_id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='결제 내역';

-- 테이블 데이터 andamiro.PAYMENT:~40 rows (대략적) 내보내기
/*!40000 ALTER TABLE `PAYMENT` DISABLE KEYS */;
INSERT INTO `PAYMENT` (`order_id`, `shop_id`, `item_id`, `cash`, `card`, `duedate`) VALUES
	(1, 1, 1, 0, 3000, '2019-11-22 10:06:41'),
	(3, 1, 13, 0, 3000, '2019-08-13 12:22:23'),
	(2, 1, 6, 6000, 0, '2019-09-13 12:23:04'),
	(3, 1, 14, 3000, 0, '2019-10-13 12:23:29'),
	(2, 1, 7, 10000, 0, '2019-12-13 11:52:21'),
	(2, 1, 8, 0, 3000, '2019-01-13 11:52:37'),
	(3, 1, 14, 0, 3000, '2019-02-12 12:19:00'),
	(1, 1, 3, 0, 5000, '2019-03-13 12:20:06'),
	(1, 1, 4, 0, 12000, '2019-04-13 12:20:34'),
	(1, 1, 5, 0, 3000, '2019-05-13 12:21:03'),
	(2, 1, 9, 0, 7000, '2019-06-13 12:21:25'),
	(3, 1, 15, 0, 6000, '2019-07-13 12:21:49'),
	(2, 1, 11, 0, 1500, '2019-12-19 19:07:18'),
	(1, 1, 3, 4000, 0, '2019-01-20 07:16:55'),
	(2, 1, 8, 8000, 0, '2019-02-20 07:19:24'),
	(1, 1, 2, 0, 9000, '2019-03-20 07:19:51'),
	(1, 1, 3, 4000, 0, '2019-04-20 07:20:27'),
	(1, 1, 4, 3000, 0, '2019-05-20 07:20:59'),
	(3, 1, 15, 0, 5500, '2019-06-20 07:21:25'),
	(3, 1, 14, 0, 5500, '2019-04-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-06-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-07-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-06-20 07:21:42'),
	(3, 1, 13, 3500, 0, '2019-01-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-10-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-03-20 07:21:42'),
	(3, 1, 14, 1500, 5500, '2019-12-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-11-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-12-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-09-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-12-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-02-20 07:21:42'),
	(3, 1, 13, 0, 5500, '2019-03-20 07:21:42'),
	(3, 1, 14, 0, 5500, '2019-04-20 07:21:42'),
	(3, 1, 15, 4500, 5500, '2019-02-19 07:21:42'),
	(3, 1, 15, 1000, 5500, '2019-09-20 07:21:42'),
	(3, 1, 15, 0, 5500, '2019-11-20 07:21:42'),
	(3, 1, 15, 0, 5500, '2019-07-20 07:21:42'),
	(3, 1, 15, 0, 5500, '2019-01-20 07:21:42'),
	(3, 1, 15, 0, 5500, '2019-05-20 07:21:42');
/*!40000 ALTER TABLE `PAYMENT` ENABLE KEYS */;

-- 테이블 andamiro.SHOP 구조 내보내기
CREATE TABLE IF NOT EXISTS `SHOP` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '매장 고유 넘버',
  `member_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '회원 아이디 fk',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '매장 이름',
  `pw` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '매장 비밀번호',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'order or table',
  `img_src` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT './resources/image/',
  `img_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `img_extention` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '.jpg',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 andamiro.SHOP:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `SHOP` DISABLE KEYS */;
INSERT INTO `SHOP` (`id`, `member_id`, `name`, `pw`, `type`, `img_src`, `img_name`, `img_extention`) VALUES
	(1, 'kgt1994', '투썸플레이스', '123', 'order', './resources/image/', 'default', '.jpg'),
	(2, 'kgt1994', '에슐리', '321', 'table', './resources/image/', 'default', '.jpg');
/*!40000 ALTER TABLE `SHOP` ENABLE KEYS */;

-- 테이블 andamiro.TABLE 구조 내보내기
CREATE TABLE IF NOT EXISTS `TABLE` (
  `id` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NULL',
  `shop_id` int(11) DEFAULT NULL COMMENT '매장 고유 넘버',
  `tablenum` int(11) DEFAULT NULL COMMENT '테이블 번호',
  `coordinates` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '테이블 좌표',
  `floor` int(11) DEFAULT NULL COMMENT '층',
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 andamiro.TABLE:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABLE` ENABLE KEYS */;

-- 테이블 andamiro.TABLE_SET 구조 내보내기
CREATE TABLE IF NOT EXISTS `TABLE_SET` (
  `shop_id` int(11) NOT NULL COMMENT '매장 고유 넘버',
  `width` int(11) DEFAULT '0' COMMENT '행',
  `height` int(11) DEFAULT '0' COMMENT '열',
  `floor` int(11) DEFAULT '0' COMMENT '면',
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='매장별 테이블 설정 ex) 테이블 갯수, 층';

-- 테이블 데이터 andamiro.TABLE_SET:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `TABLE_SET` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABLE_SET` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
