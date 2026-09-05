-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,'Books'),(2,'Clothing'),(1,'Electronics'),(4,'Home & Kitchen'),(5,'Sports');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_order_summary`
--

DROP TABLE IF EXISTS `customer_order_summary`;
/*!50001 DROP VIEW IF EXISTS `customer_order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_order_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `city`,
 1 AS `total_orders`,
 1 AS `total_spending`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Dharani','P','dharani@gmail.com','9876543210','Chennai','2026-09-05 03:07:11'),(2,'Arun','Kumar','arun@gmail.com','9876543211','Coimbatore','2026-09-05 03:07:11'),(3,'Priya','Raj','priya@gmail.com','9876543212','Madurai','2026-09-05 03:07:11'),(4,'Karthik','S','karthik@gmail.com','9876543213','Chennai','2026-09-05 03:07:11'),(5,'Meena','R','meena@gmail.com','9876543214','Salem','2026-09-05 03:07:11'),(6,'Rahul','M','rahul@gmail.com','9876543215','Bangalore','2026-09-05 03:07:11'),(7,'Anitha','K','anitha@gmail.com','9876543216','Chennai','2026-09-05 03:07:11'),(8,'Vijay','R','vijay@gmail.com','9876543217','Trichy','2026-09-05 03:07:11'),(9,'Sneha','P','sneha@gmail.com','9876543218','Madurai','2026-09-05 03:07:11'),(10,'Suresh','K','suresh@gmail.com','9876543219','Coimbatore','2026-09-05 03:07:11');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity_available` int NOT NULL DEFAULT '0',
  `reorder_level` int NOT NULL DEFAULT '10',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `product_id` (`product_id`),
  CONSTRAINT `fk_inventory_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `chk_inventory_quantity` CHECK ((`quantity_available` >= 0)),
  CONSTRAINT `chk_reorder_level` CHECK ((`reorder_level` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,19,5,'2026-09-05 03:07:13'),(2,2,100,20,'2026-09-05 03:07:11'),(3,3,50,10,'2026-09-05 03:07:11'),(4,4,30,5,'2026-09-05 03:07:11'),(5,5,80,15,'2026-09-05 03:07:11'),(6,6,60,10,'2026-09-05 03:07:11'),(7,7,40,5,'2026-09-05 03:07:11'),(8,8,30,5,'2026-09-05 03:07:11'),(9,9,25,5,'2026-09-05 03:07:11'),(10,10,20,5,'2026-09-05 03:07:11'),(11,11,45,10,'2026-09-05 03:07:11'),(12,12,70,15,'2026-09-05 03:07:11');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_item_order` (`order_id`),
  KEY `idx_order_items_product` (`product_id`),
  CONSTRAINT `fk_item_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_item_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `chk_item_price` CHECK ((`unit_price` > 0)),
  CONSTRAINT `chk_item_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,65000.00),(2,1,2,1,1200.00),(3,2,6,1,1999.00),(4,3,11,1,2999.00),(5,3,2,1,1200.00),(6,3,8,1,999.00),(7,4,8,1,999.00),(8,5,9,1,3500.00),(9,5,2,1,699.00),(10,6,4,1,35000.00),(11,6,3,1,4500.00),(12,6,2,1,1200.00),(13,7,5,1,799.00),(14,7,12,1,500.00),(15,8,5,2,799.00),(16,8,6,1,1999.00),(17,8,11,1,2999.00),(18,9,3,1,4500.00),(19,10,8,1,999.00),(20,11,11,1,2999.00),(21,12,4,1,35000.00),(22,12,2,1,1200.00),(23,13,9,1,3500.00),(24,13,10,1,2298.00),(25,14,12,1,1200.00),(26,15,7,1,899.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `total_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`),
  KEY `idx_orders_customer` (`customer_id`),
  KEY `idx_orders_status` (`status`),
  KEY `idx_orders_date` (`order_date`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `chk_order_amount` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-09-05 03:07:11','DELIVERED',66200.00),(2,2,'2026-09-05 03:07:11','DELIVERED',1999.00),(3,3,'2026-09-05 03:07:11','SHIPPED',4498.00),(4,1,'2026-09-05 03:07:11','PROCESSING',999.00),(5,4,'2026-09-05 03:07:11','DELIVERED',4199.00),(6,5,'2026-09-05 03:07:11','DELIVERED',35998.00),(7,6,'2026-09-05 03:07:11','SHIPPED',1299.00),(8,7,'2026-09-05 03:07:11','DELIVERED',7999.00),(9,8,'2026-09-05 03:07:11','CANCELLED',4500.00),(10,9,'2026-09-05 03:07:11','DELIVERED',999.00),(11,10,'2026-09-05 03:07:11','PENDING',2999.00),(12,2,'2026-09-05 03:07:11','DELIVERED',36200.00),(13,3,'2026-09-05 03:07:11','SHIPPED',5798.00),(14,4,'2026-09-05 03:07:11','DELIVERED',1200.00),(15,5,'2026-09-05 03:07:11','PENDING',899.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `chk_paid_amount` CHECK ((`paid_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'UPI','PAID',66200.00,'2026-09-05 03:07:11'),(2,2,'CARD','PAID',1999.00,'2026-09-05 03:07:11'),(3,3,'UPI','PAID',4498.00,'2026-09-05 03:07:11'),(4,4,'UPI','PENDING',999.00,'2026-09-05 03:07:11'),(5,5,'CARD','PAID',4199.00,'2026-09-05 03:07:11'),(6,6,'CARD','PAID',35998.00,'2026-09-05 03:07:11'),(7,7,'UPI','PAID',1299.00,'2026-09-05 03:07:11'),(8,8,'CARD','PAID',7999.00,'2026-09-05 03:07:11'),(9,9,'CARD','REFUNDED',4500.00,'2026-09-05 03:07:11'),(10,10,'UPI','PAID',999.00,'2026-09-05 03:07:11'),(11,11,'COD','PENDING',2999.00,'2026-09-05 03:07:11'),(12,12,'CARD','PAID',36200.00,'2026-09-05 03:07:11'),(13,13,'UPI','PAID',5798.00,'2026-09-05 03:07:11'),(14,14,'UPI','PAID',1200.00,'2026-09-05 03:07:11'),(15,15,'COD','PENDING',899.00,'2026-09-05 03:07:11');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL,
  `category_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `idx_products_category` (`category_id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `chk_product_price` CHECK ((`price` > 0)),
  CONSTRAINT `chk_product_stock` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop',1,68250.00,20,'2026-09-05 03:07:11'),(2,'Wireless Mouse',1,1260.00,100,'2026-09-05 03:07:11'),(3,'Mechanical Keyboard',1,4725.00,50,'2026-09-05 03:07:11'),(4,'Smartphone',1,36750.00,30,'2026-09-05 03:07:11'),(5,'T-Shirt',2,799.00,80,'2026-09-05 03:07:11'),(6,'Jeans',2,1999.00,60,'2026-09-05 03:07:11'),(7,'Java Programming Book',3,899.00,40,'2026-09-05 03:07:11'),(8,'SQL Mastery Book',3,999.00,30,'2026-09-05 03:07:11'),(9,'Coffee Maker',4,3500.00,25,'2026-09-05 03:07:11'),(10,'Mixer Grinder',4,4500.00,20,'2026-09-05 03:07:11'),(11,'Running Shoes',5,2999.00,45,'2026-09-05 03:07:11'),(12,'Yoga Mat',5,1200.00,70,'2026-09-05 03:07:11');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `customer_order_summary`
--

/*!50001 DROP VIEW IF EXISTS `customer_order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_summary` AS select `c`.`customer_id` AS `customer_id`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `customer_name`,`c`.`city` AS `city`,count(`o`.`order_id`) AS `total_orders`,coalesce(sum((case when (`o`.`status` <> 'CANCELLED') then `o`.`total_amount` else 0 end)),0) AS `total_spending` from (`customers` `c` left join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) group by `c`.`customer_id`,`c`.`first_name`,`c`.`last_name`,`c`.`city` */;
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

-- Dump completed on 2026-09-05  8:47:55
