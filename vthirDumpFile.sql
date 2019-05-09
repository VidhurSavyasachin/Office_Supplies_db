-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Stationary_supply_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `Address_id` int(11) NOT NULL,
  `Line_1` varchar(300) DEFAULT NULL,
  `LINE_2` varchar(300) DEFAULT NULL,
  `LINE_3` varchar(300) DEFAULT NULL,
  `CITY` varchar(200) DEFAULT NULL,
  `ZIPCODE` varchar(5) DEFAULT NULL,
  `State` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (651650,'50,Bistol st','F2','','West Haven','06516','CT'),(651651,'51,Bistol st','F1','','West Haven','06516','CT'),(651652,'52,Bistol st','F2','','West Haven','06516','CT'),(651660,'34,Lambda st','f3',NULL,'Connecticut','06460','CT'),(651661,'27,cambridge','f7',NULL,'New Haven','06460','CT'),(651778,'51,Podrige st','f1',NULL,'New York','10001','NY'),(651779,'64,Yogurt St',NULL,NULL,'New York','10005','NY'),(651780,'94,Lucifer st',NULL,NULL,'Los Angeles','90001','CA');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `basic_supplies`
--

DROP TABLE IF EXISTS `basic_supplies`;
/*!50001 DROP VIEW IF EXISTS `basic_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `basic_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Supplier_categoryid`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Customer_addresses`
--

DROP TABLE IF EXISTS `Customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_addresses` (
  `Customer_id` int(11) NOT NULL,
  `Address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`),
  KEY `Address_id` (`Address_id`),
  CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `customer_addresses_ibfk_2` FOREIGN KEY (`Address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_addresses`
--

LOCK TABLES `Customer_addresses` WRITE;
/*!40000 ALTER TABLE `Customer_addresses` DISABLE KEYS */;
INSERT INTO `Customer_addresses` VALUES (800003,651650),(800002,651651),(800001,651652),(800010,651660),(800004,651778),(800005,651779);
/*!40000 ALTER TABLE `Customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_details` (
  `Customer_id` int(11) NOT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `mName` varchar(200) DEFAULT NULL,
  `lName` varchar(200) DEFAULT NULL,
  `email` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (800001,'Vidhur','Savyasachin','Thiruparkadal','vidhursachin@gmail.com'),(800002,'Shalini','Gar','Garikapati','shalugarikapati96@gmail.com'),(800003,'Ghost','Savyasachin','Thiruparkadal','ghostTheRetriever@gmail.com'),(800004,'Latica','Axtell','Janney','LAJanny@gmail.com'),(800005,'Hewett','Reagle','Murr','hRm@gmail.com'),(800006,'Woltz','Replogle','Nester','WoltzRepNes@hotmail.com'),(800007,'Leif','Heal','Suzi','LeifSuzi@gmail.com'),(800008,'Michelle','Heal','Emely','EmilyHeal@gmail.com'),(800010,'Caleb','Alesa','Michelle','Michelle@gmail.com');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Orders`
--

DROP TABLE IF EXISTS `Customer_Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_Orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_method_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `payment_method_code` (`payment_method_code`),
  CONSTRAINT `customer_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Orders`
--

LOCK TABLES `Customer_Orders` WRITE;
/*!40000 ALTER TABLE `Customer_Orders` DISABLE KEYS */;
INSERT INTO `Customer_Orders` VALUES (100001,800001,8114),(100002,800002,8115),(100003,800003,8116),(100004,800010,8117),(100005,800004,8116),(100006,800001,8119),(100007,800005,8120),(100008,800004,8121);
/*!40000 ALTER TABLE `Customer_Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_Orders_products`
--

DROP TABLE IF EXISTS `Customer_Orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer_Orders_products` (
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `customer_orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `customer_orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `customer_products` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Orders_products`
--

LOCK TABLES `Customer_Orders_products` WRITE;
/*!40000 ALTER TABLE `Customer_Orders_products` DISABLE KEYS */;
INSERT INTO `Customer_Orders_products` VALUES (100001,0,60,1),(100001,30,50,2),(100001,1,30,3),(100002,19,70,4),(100002,9,5,5),(100002,0,150,6),(100003,6,70,7),(100003,8,10,8),(100001,6,5,9),(100004,4,15,10),(100001,9,29,11),(100001,4,30,12),(100004,9,30,13),(100004,4,15,14),(100007,3,100,15),(100007,9,20,16),(100008,16,6,17);
/*!40000 ALTER TABLE `Customer_Orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_products`
--

DROP TABLE IF EXISTS `customer_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_products` (
  `Products_id` int(11) NOT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `supplier_categoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_products`
--

LOCK TABLES `customer_products` WRITE;
/*!40000 ALTER TABLE `customer_products` DISABLE KEYS */;
INSERT INTO `customer_products` VALUES (0,'Pen',1),(1,'pencil',1),(2,'markers',1),(3,'Chalks',1),(4,'copy Paper',2),(5,'pads',2),(6,'Envelops',2),(7,'A3 Sheets',2),(8,'Labels',3),(9,'Staplers',3),(10,'Paper clips',3),(11,'Rubber Bands',3),(12,'Scissors',3),(13,'Pilot G2 Gel pen',1),(14,'Correction Tape',3),(15,'Wooden pencil ',1),(16,'Dry Erase Markers',1),(17,'Quick dry fluid ',1),(18,'Pen style Correction Type',1),(19,'Dixon Eraser Pink',1),(20,'Multipurpose Copy Paper',2),(21,'Poly Wrap Copy paper',2),(22,'Star wars copy paper',2),(23,'Blank Computer Paper',2),(24,'Wide Format Paper',2),(25,'Security Paper',2),(26,'Business cards',2),(27,'POS paper',2),(28,'Tax forms ',2),(29,'index Cards',3),(30,'Colored Papers',3);
/*!40000 ALTER TABLE `customer_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `max_spent_user_basics_supplies`
--

DROP TABLE IF EXISTS `max_spent_user_basics_supplies`;
/*!50001 DROP VIEW IF EXISTS `max_spent_user_basics_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `max_spent_user_basics_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `max_spent_user_paper_supplies`
--

DROP TABLE IF EXISTS `max_spent_user_paper_supplies`;
/*!50001 DROP VIEW IF EXISTS `max_spent_user_paper_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `max_spent_user_paper_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `max_spent_user_writing_supplies`
--

DROP TABLE IF EXISTS `max_spent_user_writing_supplies`;
/*!50001 DROP VIEW IF EXISTS `max_spent_user_writing_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `max_spent_user_writing_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `paper_supplies`
--

DROP TABLE IF EXISTS `paper_supplies`;
/*!50001 DROP VIEW IF EXISTS `paper_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `paper_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Supplier_categoryid`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_methods` (
  `pay_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `payment_method_code` int(11) DEFAULT NULL,
  `pay_total` double DEFAULT NULL,
  `Order_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `cust_id` (`cust_id`),
  KEY `Order_Id` (`Order_Id`),
  CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `payment_methods_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `customer_orders` (`order_id`),
  CONSTRAINT `payment_methods_ibfk_3` FOREIGN KEY (`pay_id`) REFERENCES `customer_orders` (`payment_method_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_prices`
--

DROP TABLE IF EXISTS `Product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Product_prices` (
  `product_id` int(11) NOT NULL,
  `product_price` double DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `customer_products` (`products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_prices`
--

LOCK TABLES `Product_prices` WRITE;
/*!40000 ALTER TABLE `Product_prices` DISABLE KEYS */;
INSERT INTO `Product_prices` VALUES (0,3.99),(1,1.99),(2,5.99),(3,2.99),(4,7.99),(5,8.99),(6,1.99),(7,0.99),(8,0.99),(9,7.99),(10,5.99),(11,0.75),(12,4.99),(13,2.99),(14,3.99),(15,4.99),(16,8.99),(17,7.99),(18,2.99),(19,3.99),(20,12.99),(21,24.99),(22,8.99),(23,25.99),(24,16.99),(25,17.99),(26,5.99),(27,6.99),(28,9.99),(29,10.99),(30,12.99);
/*!40000 ALTER TABLE `Product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `writing_supplies`
--

DROP TABLE IF EXISTS `writing_supplies`;
/*!50001 DROP VIEW IF EXISTS `writing_supplies`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `writing_supplies` AS SELECT 
 1 AS `Name`,
 1 AS `Supplier_categoryid`,
 1 AS `Total_Value`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `basic_supplies`
--

/*!50001 DROP VIEW IF EXISTS `basic_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `basic_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,`a`.`supplier_categoryID` AS `Supplier_categoryid`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 3) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_spent_user_basics_supplies`
--

/*!50001 DROP VIEW IF EXISTS `max_spent_user_basics_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_spent_user_basics_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 3) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_spent_user_paper_supplies`
--

/*!50001 DROP VIEW IF EXISTS `max_spent_user_paper_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_spent_user_paper_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 2) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_spent_user_writing_supplies`
--

/*!50001 DROP VIEW IF EXISTS `max_spent_user_writing_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_spent_user_writing_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 1) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paper_supplies`
--

/*!50001 DROP VIEW IF EXISTS `paper_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paper_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,`a`.`supplier_categoryID` AS `Supplier_categoryid`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 2) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `writing_supplies`
--

/*!50001 DROP VIEW IF EXISTS `writing_supplies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `writing_supplies` AS select concat(`b`.`fname`,' ',`b`.`mName`,' ',`b`.`lName`) AS `Name`,`a`.`supplier_categoryID` AS `Supplier_categoryid`,sum((`e`.`product_price` * `d`.`quantity`)) AS `Total_Value` from ((((`customer_products` `a` join `customer_details` `b`) join `customer_orders` `c`) join `customer_orders_products` `d`) join `product_prices` `e`) where ((`d`.`order_id` = `c`.`order_id`) and (`c`.`customer_id` = `b`.`Customer_id`) and (`d`.`product_id` = `a`.`Products_id`) and (`a`.`supplier_categoryID` = 1) and (`d`.`product_id` = `e`.`product_id`)) group by `d`.`order_id` order by `Total_Value` desc limit 1 */;
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

-- Dump completed on 2019-04-30  5:15:25
