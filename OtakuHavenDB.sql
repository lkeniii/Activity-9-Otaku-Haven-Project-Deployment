CREATE DATABASE  IF NOT EXISTS `animeotakuhaven` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `animeotakuhaven`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: animeotakuhaven
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `archived_orders`
--

DROP TABLE IF EXISTS `archived_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archived_orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` enum('pending','completed','shipped') NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archived_orders`
--

LOCK TABLES `archived_orders` WRITE;
/*!40000 ALTER TABLE `archived_orders` DISABLE KEYS */;
INSERT INTO `archived_orders` VALUES (1,2,430.00,'shipped','2025-02-19 13:08:14'),(2,2,870.00,'completed','2025-02-19 13:08:14'),(3,3,450.00,'completed','2025-02-19 13:08:14'),(4,3,1200.00,'shipped','2025-02-19 13:08:14'),(5,4,1850.00,'shipped','2025-02-19 13:08:14'),(6,5,1200.00,'shipped','2025-02-19 13:08:14'),(7,6,2900.00,'completed','2025-02-19 13:08:14'),(8,6,500.00,'shipped','2025-02-19 13:08:14'),(9,7,650.00,'completed','2025-02-19 13:08:14'),(10,8,1800.00,'shipped','2025-02-19 13:08:14');
/*!40000 ALTER TABLE `archived_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (8,'Accessories'),(11,'Acrylic Stand'),(7,'Cosplay Costumes'),(2,'Eyemasks'),(10,'Footwear'),(9,'Gaming Mousepads'),(5,'Hoodies'),(1,'Keychains'),(4,'Plush Toys'),(3,'T-Shirts'),(6,'Tote Bags');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `non-updatable_frequent_buyers`
--

DROP TABLE IF EXISTS `non-updatable_frequent_buyers`;
/*!50001 DROP VIEW IF EXISTS `non-updatable_frequent_buyers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `non-updatable_frequent_buyers` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `total_orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `non-updatable_recent_orders_view`
--

DROP TABLE IF EXISTS `non-updatable_recent_orders_view`;
/*!50001 DROP VIEW IF EXISTS `non-updatable_recent_orders_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `non-updatable_recent_orders_view` AS SELECT 
 1 AS `order_id`,
 1 AS `customer_name`,
 1 AS `total_amount`,
 1 AS `order_status`,
 1 AS `order_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `non-updatable_view_top_rated_products`
--

DROP TABLE IF EXISTS `non-updatable_view_top_rated_products`;
/*!50001 DROP VIEW IF EXISTS `non-updatable_view_top_rated_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `non-updatable_view_top_rated_products` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `avg_rating`,
 1 AS `total_reviews`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,2,140.00),(2,2,3,1,360.00),(3,2,2,4,300.00),(4,3,2,2,150.00),(5,4,3,3,1080.00),(6,5,1,1,70.00),(7,6,2,1,75.00),(8,7,3,2,720.00),(9,8,1,3,210.00),(10,9,2,2,150.00),(11,10,3,1,360.00),(12,1,2,1,500.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_item_insert` BEFORE INSERT ON `order_items` FOR EACH ROW BEGIN
    DECLARE stock_available INT;
    
    SELECT stock_quantity INTO stock_available FROM Products WHERE product_id = NEW.product_id;
    
    IF stock_available < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock available';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_log`
--

DROP TABLE IF EXISTS `order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_log`
--

LOCK TABLES `order_log` WRITE;
/*!40000 ALTER TABLE `order_log` DISABLE KEYS */;
INSERT INTO `order_log` VALUES (1,11,1,'Order Placed','2025-03-24 15:08:34'),(2,1,2,'Order status changed to shipped','2025-03-24 15:12:44'),(3,12,5,'Order Placed','2025-04-03 14:05:32'),(4,13,5,'Order Placed','2025-04-03 14:06:10');
/*!40000 ALTER TABLE `order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` enum('pending','completed','shipped') NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,2,430.00,'shipped','2025-02-19 13:08:14'),(2,2,870.00,'completed','2025-02-19 13:08:14'),(3,3,450.00,'completed','2025-02-19 13:08:14'),(4,3,1200.00,'shipped','2025-02-19 13:08:14'),(5,4,1850.00,'shipped','2025-02-19 13:08:14'),(6,5,1200.00,'shipped','2025-02-19 13:08:14'),(7,6,2900.00,'completed','2025-02-19 13:08:14'),(8,6,500.00,'shipped','2025-02-19 13:08:14'),(9,7,650.00,'completed','2025-02-19 13:08:14'),(10,8,1800.00,'shipped','2025-02-19 13:08:14'),(11,1,150.00,'pending','2025-03-24 15:08:34'),(12,5,500.00,'pending','2025-04-03 14:05:32'),(13,5,500.00,'pending','2025-04-03 14:06:10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_insert` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO Order_Log (order_id, user_id, action)
    VALUES (NEW.order_id, NEW.user_id, 'Order Placed');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_update` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    IF OLD.order_status <> NEW.order_status THEN
        INSERT INTO Order_Log (order_id, user_id, action)
        VALUES (NEW.order_id, NEW.user_id, CONCAT('Order status changed to ', NEW.order_status));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_delete` BEFORE DELETE ON `orders` FOR EACH ROW BEGIN
    IF OLD.order_status IN ('shipped', 'delivered') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete orders that are shipped or delivered';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_method` enum('Credit Card','PayPal','Gcash','Bank Transfer') DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Gcash','completed','2025-02-19 13:10:24'),(2,2,'Credit Card','completed','2025-02-19 13:10:24'),(3,3,'PayPal','completed','2025-02-19 13:10:24'),(4,4,'Bank Transfer','failed','2025-02-19 13:10:24'),(5,5,'Gcash','pending','2025-02-19 13:10:24'),(6,6,'Credit Card','completed','2025-02-19 13:10:24'),(7,7,'PayPal','completed','2025-02-19 13:10:24'),(8,8,'Gcash','pending','2025-02-19 13:10:24'),(9,9,'Credit Card','completed','2025-02-19 13:10:24'),(10,10,'Gcash','completed','2025-02-19 13:10:24');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_log`
--

DROP TABLE IF EXISTS `product_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_log`
--

LOCK TABLES `product_log` WRITE;
/*!40000 ALTER TABLE `product_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  `stock_quantity` int DEFAULT '0',
  `size` varchar(45) DEFAULT NULL,
  `style` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Genshin Impact Design1 Keychain','Acrylic keychain with Genshin Impact design.',70.00,1,50,'2-3 inches','Keychain'),(2,'Genshin Impact Design2 Keychain','Acrylic keychain with Genshin Impact design.',70.00,1,43,'2-3 inches','Keychain'),(3,'Genshin Impact Design3 Keychain','Acrylic keychain with Genshin Impact design.',70.00,1,45,'2-3 inches','Keychain'),(4,'Genshin Impact Eyemask Design1','Soft plush material, breathable Genshin Impact eyemask.',75.00,2,30,'22*11cm','Eyemask'),(5,'Genshin Impact T-Shirt Design1','Unisex soft and comfortable Genshin Impact T-shirt.',360.00,3,25,'S, M, L, XL, XXL','T-Shirt'),(6,'Genshin Impact Acrylic Stand','Premium acrylic stand with UV anti-friction printing.',170.00,11,20,'16cm','Stand'),(7,'Anime Xiao Bird Plush Large','Large plush cushion of Xiao Bird from Genshin Impact.',1900.00,4,15,'45*40*40cm','Plush'),(8,'Anime Xiao Bird Plush Charm','Mini Xiao Bird plush charm keychain.',650.00,4,40,'11*10*10cm','Plush'),(9,'Genshin Impact Cosplay Hoodie','Unisex hoodie featuring various anime characters.',590.00,5,35,'S - 5XL','Hoodie'),(10,'Demonia Trinity Boots Dupe','Fashionable boots available in matte finish.',1850.00,10,10,'US 35-43','Boots'),(11,'TinPlate Pins Badge Brooch','Glossy and glitter-finished anime badges.',100.00,8,100,'25mm, 32mm, 58mm','Badge'),(12,'Genshin Impact Canvas Bag','Anime handbag featuring Hutao, Keqing, Diluc, and Eula. Fashion casual tote bag.',450.00,6,30,'One Size','Bag'),(13,'Custom Playmat/Gaming Mousepad','High-quality custom gaming mousepad for competitive play.',650.00,9,50,'Various Sizes','Mousepad'),(14,'Genshin Impact Cosplay Yelan Jumpsuit','High-quality cosplay costume featuring Yelan’s Water Royal Sister outfit.',2900.00,7,10,'S, M, L, XL','Cosplay'),(15,'Genshin Impact Cosplay Keqing New Skin','Complete cosplay costume for Keqing’s newest in-game skin.',0.00,7,0,'S, M, L, XL, XXL','Cosplay');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_product_update` BEFORE UPDATE ON `products` FOR EACH ROW BEGIN
    IF NEW.price < OLD.price * 0.5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price drop exceeds allowed limit';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_product_delete` AFTER DELETE ON `products` FOR EACH ROW BEGIN
    INSERT INTO Product_Log (product_id, action)
    VALUES (OLD.product_id, 'Product Deleted');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,5,'Excellent quality keychain!','2025-02-19 12:53:46'),(2,3,12,4,'Nice tote bag, good material.','2025-02-19 12:53:46'),(3,4,10,5,'These boots are amazing!','2025-02-19 12:53:46'),(4,5,14,3,'Mousepad is okay, expected better.','2025-02-19 12:53:46'),(5,6,15,5,'Great cosplay outfit, fits well.','2025-02-19 12:53:46'),(6,7,3,4,'Really cute keychain!','2025-02-19 12:53:46'),(7,8,5,3,'T-shirt fabric is a bit thin but looks great.','2025-02-19 12:53:46');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `updatable_pending_orders`
--

DROP TABLE IF EXISTS `updatable_pending_orders`;
/*!50001 DROP VIEW IF EXISTS `updatable_pending_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `updatable_pending_orders` AS SELECT 
 1 AS `order_id`,
 1 AS `user_id`,
 1 AS `total_amount`,
 1 AS `order_status`,
 1 AS `order_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `updatable_product_stock_management`
--

DROP TABLE IF EXISTS `updatable_product_stock_management`;
/*!50001 DROP VIEW IF EXISTS `updatable_product_stock_management`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `updatable_product_stock_management` AS SELECT 
 1 AS `product_id`,
 1 AS `name`,
 1 AS `price`,
 1 AS `stock_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','customer') DEFAULT 'customer',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123@gmail.com','admin123','admin','2025-02-19 12:42:34'),(2,'keniii','keniii@gmail.com','keniii123','customer','2025-02-19 12:42:34'),(3,'gwynth','gwynth@gmail.com','gwynth123','customer','2025-02-19 12:42:34'),(4,'jeyjey','jeyjey@gmail.com','jeyjey123','customer','2025-02-19 12:42:34'),(5,'anto','anto@gmail.com','anto123','customer','2025-02-19 12:42:34'),(6,'cla','cla@gmail.com','cla123','customer','2025-02-19 12:42:34'),(7,'meh','meh@gmail.com','meh123','customer','2025-02-19 12:42:34'),(8,'laiza','laiza@gmail.com','laiza123','customer','2025-02-19 12:42:34'),(9,'gracie','grace@gmail.com','grace123','customer','2025-02-19 12:42:34'),(10,'thei','althea@gmail.com','althea123','customer','2025-02-19 12:42:34'),(11,'val','valerie@gmail.com','val123','customer','2025-02-19 12:42:34'),(12,'grasya','rechelle@gmail.com','grasya123','customer','2025-02-19 12:42:34'),(13,'dave','dave@gmail.com','dave123','customer','2025-02-19 12:42:34'),(14,'jucel','jucel@gmail.com','jucel123','customer','2025-02-19 12:42:34'),(15,'rchii','archie@gmail.com','archie123','customer','2025-02-19 12:42:34'),(16,'rob','robert@gmail.com','rob123','customer','2025-02-19 12:42:34'),(17,'jaybomb','jaybomb@gmail.com','jaybomb123','customer','2025-02-19 12:42:34'),(18,'jay','jay@gmail.com','jay123','customer','2025-02-19 12:42:34'),(19,'fred','fred@gmail.com','fred123','customer','2025-02-19 12:42:34'),(20,'edward','edward@gmail.com','edward123','customer','2025-02-19 12:42:34'),(21,'kyla','kyla@gmail.com','kyla123','customer','2025-02-19 12:42:34'),(22,'otakuMaster','otaku@gmail.com','otaku123','customer','2025-03-18 15:54:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1,3,'2025-01-31 16:00:00'),(2,2,2,'2025-02-01 16:00:00'),(3,3,1,'2025-02-02 16:00:00'),(4,4,3,'2025-02-03 16:00:00'),(5,5,2,'2025-02-04 16:00:00'),(6,6,1,'2025-02-05 16:00:00'),(7,7,3,'2025-02-06 16:00:00'),(8,8,2,'2025-02-07 16:00:00');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'animeotakuhaven'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `update_inventory_daily` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `update_inventory_daily` ON SCHEDULE EVERY 1 DAY STARTS '2025-04-04 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN 
	UPDATE products SET stock_quantity = stock_quantity + 5 WHERE categories = 'keychains';
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'animeotakuhaven'
--
/*!50003 DROP FUNCTION IF EXISTS `Get_Pending_Payment_Count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Pending_Payment_Count`() RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE pending_count INT;

    SELECT COUNT(*) INTO pending_count 
    FROM Payments 
    WHERE payment_status = 'pending';

    RETURN pending_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_Product_Stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Product_Stock`(productID INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE stock_qty INT;

    SELECT stock_quantity INTO stock_qty 
    FROM Products 
    WHERE product_id = productID;

    RETURN stock_qty;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_Total_Amount_Spent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Total_Amount_Spent`(userID INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_spent DECIMAL(10,2);

    SELECT IFNULL(SUM(total_amount), 0) INTO total_spent
    FROM Orders
    WHERE user_id = userID AND order_status = 'completed';

    RETURN total_spent;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_Total_Orders_By_User` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_Total_Orders_By_User`(u_id INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_orders INT;
    
    SELECT COUNT(*) INTO total_orders
    FROM Orders
    WHERE user_id = u_id;
    
    RETURN total_orders;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Get_User_Role` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Get_User_Role`(u_id INT) RETURNS char(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE user_role CHAR(10);
    
    SELECT role INTO user_role
    FROM Users
    WHERE user_id = u_id;
    
    RETURN user_role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Customer_Order_Summary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Customer_Order_Summary`(IN userID INT)
BEGIN
    SELECT 
        o.order_id,
        o.order_status,
        o.total_amount,
        o.order_date
    FROM Orders o
    WHERE o.user_id = userID
    ORDER BY o.order_date DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Get_Total_Sales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_Total_Sales`(IN sale_date DATE, OUT total_sales DECIMAL(10,2))
BEGIN
    SELECT IFNULL(SUM(total_amount), 0) INTO total_sales 
    FROM Orders 
    WHERE DATE(order_date) = sale_date AND order_status = 'completed';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Notify_Pending_Payments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Notify_Pending_Payments`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE o_id INT;
    DECLARE method VARCHAR(50);
    
    -- Cursor to fetch pending payments
    DECLARE pending_cursor CURSOR FOR 
    SELECT order_id, payment_method FROM Payments WHERE payment_status = 'pending';
    
    -- Handler for when there are no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN pending_cursor;
    
    read_loop: LOOP
        FETCH pending_cursor INTO o_id, method;
        IF done THEN 
            LEAVE read_loop;
        END IF;
        
        -- Print pending payments
        SELECT CONCAT('Order ', o_id, ' has a pending payment via ', method) AS Payment_Status;
    END LOOP;
    
    CLOSE pending_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Process_Low_Stock_Products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Process_Low_Stock_Products`(IN restock_threshold INT, IN restock_amount INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE p_id INT;
    DECLARE p_name VARCHAR(100);
    DECLARE p_stock INT;
    
    -- Declare Cursor
    DECLARE cur CURSOR FOR 
        SELECT product_id, name, stock_quantity FROM Products WHERE stock_quantity < restock_threshold;

    -- Declare a CONTINUE HANDLER for loop termination
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    -- Open the Cursor
    OPEN cur;
    
    read_loop: LOOP
        -- Fetch data from the cursor
        FETCH cur INTO p_id, p_name, p_stock;
        
        -- If no more rows, exit the loop
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Update product stock
        UPDATE Products 
        SET stock_quantity = stock_quantity + restock_amount
        WHERE product_id = p_id;
        
        -- Log message
        SELECT CONCAT('Restocked ', p_name, ' by ', restock_amount, ' units. New stock: ', (p_stock + restock_amount)) AS LogMessage;
    
    END LOOP;

    -- Close the Cursor
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `non-updatable_frequent_buyers`
--

/*!50001 DROP VIEW IF EXISTS `non-updatable_frequent_buyers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `non-updatable_frequent_buyers` AS select `u`.`user_id` AS `user_id`,`u`.`username` AS `username`,count(`o`.`order_id`) AS `total_orders` from (`orders` `o` join `users` `u` on((`o`.`user_id` = `u`.`user_id`))) group by `u`.`user_id`,`u`.`username` order by `total_orders` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `non-updatable_recent_orders_view`
--

/*!50001 DROP VIEW IF EXISTS `non-updatable_recent_orders_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `non-updatable_recent_orders_view` AS select `o`.`order_id` AS `order_id`,`u`.`username` AS `customer_name`,`o`.`total_amount` AS `total_amount`,`o`.`order_status` AS `order_status`,`o`.`order_date` AS `order_date` from (`orders` `o` join `users` `u` on((`o`.`user_id` = `u`.`user_id`))) order by `o`.`order_date` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `non-updatable_view_top_rated_products`
--

/*!50001 DROP VIEW IF EXISTS `non-updatable_view_top_rated_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `non-updatable_view_top_rated_products` AS select `p`.`product_id` AS `product_id`,`p`.`name` AS `product_name`,avg(`r`.`rating`) AS `avg_rating`,count(`r`.`review_id`) AS `total_reviews` from (`products` `p` join `reviews` `r` on((`p`.`product_id` = `r`.`product_id`))) group by `p`.`product_id` having (avg(`r`.`rating`) >= 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `updatable_pending_orders`
--

/*!50001 DROP VIEW IF EXISTS `updatable_pending_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `updatable_pending_orders` AS select `orders`.`order_id` AS `order_id`,`orders`.`user_id` AS `user_id`,`orders`.`total_amount` AS `total_amount`,`orders`.`order_status` AS `order_status`,`orders`.`order_date` AS `order_date` from `orders` where (`orders`.`order_status` = 'Pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `updatable_product_stock_management`
--

/*!50001 DROP VIEW IF EXISTS `updatable_product_stock_management`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `updatable_product_stock_management` AS select `products`.`product_id` AS `product_id`,`products`.`name` AS `name`,`products`.`price` AS `price`,`products`.`stock_quantity` AS `stock_quantity` from `products` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 20:42:45
