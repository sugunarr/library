-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: lms
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
-- Table structure for table `access_logs`
--

DROP TABLE IF EXISTS `access_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `access_time` datetime DEFAULT NULL,
  `access_action` varchar(100) DEFAULT NULL,
  `access_details` text,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `access_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_logs`
--

LOCK TABLES `access_logs` WRITE;
/*!40000 ALTER TABLE `access_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accessibility_settings`
--

DROP TABLE IF EXISTS `accessibility_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessibility_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `font_size` int DEFAULT NULL,
  `contrast_mode` varchar(20) DEFAULT NULL,
  `text_to_speech` tinyint(1) DEFAULT NULL,
  `dyslexia_friendly` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `accessibility_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessibility_settings`
--

LOCK TABLES `accessibility_settings` WRITE;
/*!40000 ALTER TABLE `accessibility_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessibility_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `birth_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'F. Scott','Fitzgerald','USA','1896-09-24'),(2,'Harper','Lee','USA','1926-04-28'),(3,'George','Orwell','UK','1903-06-25'),(4,'Jane','Austen','UK','1775-12-16'),(5,'J.D.','Salinger','USA','1919-01-01'),(6,'J.R.R.','Tolkien','UK','1892-01-03'),(7,'Charles','Dickens','UK','1812-02-07'),(8,'J.K.','Rowling','UK','1965-07-31'),(9,'Herman','Hesse','Germany','1877-07-02'),(10,'Leo','Tolstoy','Russia','1828-09-09'),(11,'Emily','Bronte','UK','1818-07-30'),(12,'Victor','Hugo','France','1802-02-26'),(13,'Charlotte','Bronte','UK','1816-04-21'),(14,'Homer','','Greece','8th century BC'),(15,'Herman','Melville','USA','1819-08-01'),(16,'Oscar','Wilde','Ireland','1854-10-16'),(17,'Antoine','de Saint-Exupery','France','1900-06-29'),(18,'Mark','Twain','USA','1835-11-30'),(19,'Aldous','Huxley','UK','1894-07-26'),(20,'Gabriel','Garcia Marquez','Colombia','1927-03-06'),(21,'Dante','Alighieri','Italy','1265-05-29');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_copies`
--

DROP TABLE IF EXISTS `book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_copies` (
  `copy_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `checked_out_by` int DEFAULT NULL,
  `checked_out_at` datetime DEFAULT NULL,
  `checked_in_at` datetime DEFAULT NULL,
  PRIMARY KEY (`copy_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_copies_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_copies`
--

LOCK TABLES `book_copies` WRITE;
/*!40000 ALTER TABLE `book_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publication_year` int DEFAULT NULL,
  `description` text,
  `quantity` text,
  `available` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Great Gatsby',1,1,1,'9780743273565',1925,'A classic American novel about the decadence of the Jazz Age','5','5',NULL,NULL),(2,'To Kill a Mockingbird',2,2,1,'9780061120084',1960,'A powerful story tackling racial injustice in the American South','3','3',NULL,NULL),(3,'1984',3,3,2,'9780451524935',1949,'A dystopian novel depicting a totalitarian society','7','7',NULL,NULL),(4,'Pride and Prejudice',4,4,3,'9780141439518',1813,'A witty and romantic novel set in 19th-century England','2','2',NULL,NULL),(5,'The Catcher in the Rye',5,5,1,'9780316769488',1951,'A coming-of-age story following a disenchanted teenager','4','4',NULL,NULL),(6,'The Lord of the Rings',6,6,4,'9780544003415',1954,'A fantasy epic set in the fictional world of Middle-earth','10','10',NULL,NULL),(7,'To Kill a Mockingbird',2,7,1,'9780061120084',1960,'A powerful story tackling racial injustice in the American South','5','5',NULL,NULL),(8,'Harry Potter and the Philosopher\'s Stone',8,8,4,'9780590353427',1997,'The first book in the popular Harry Potter series','15','15',NULL,NULL),(9,'The Hobbit',6,9,4,'9780618260300',1937,'A fantasy adventure novel set in the same world as The Lord of the Rings','8','8',NULL,NULL),(10,'The Alchemist',10,10,5,'9780062315007',1988,'A philosophical novel about a young Andalusian shepherd on a journey of self-discovery','12','12',NULL,NULL),(11,'Jane Eyre',13,12,3,'9780141441146',1847,'A novel following the story of an orphaned governess','6','6',NULL,NULL),(12,'The Odyssey',14,13,2,'9780140449112',-800,'An ancient Greek epic poem attributed to Homer','3','3',NULL,NULL),(13,'Moby-Dick',15,14,3,'9780142437247',1851,'A novel about Captain Ahab\'s obsession with a giant white whale','9','9',NULL,NULL),(14,'The Picture of Dorian Gray',16,15,3,'9780199535989',1890,'A philosophical novel exploring the concept of beauty and morality','4','4',NULL,NULL),(15,'The Little Prince',17,16,5,'9780156012195',1943,'A novella about a young prince and his journey through various planets','7','7',NULL,NULL),(16,'The Adventures of Huckleberry Finn',18,17,1,'9780143107323',1884,'A novel depicting the adventures of a young boy and a runaway slave on the Mississippi River','11','11',NULL,NULL),(17,'Brave New World',19,18,2,'9780060850524',1932,'A dystopian novel set in a futuristic society','5','5',NULL,NULL),(18,'One Hundred Years of Solitude',20,19,5,'9780060883287',1967,'A multi-generational saga following the Buendía family','8','8',NULL,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowings`
--

DROP TABLE IF EXISTS `borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowings` (
  `borrowing_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `borrowed_at` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `returned_at` datetime DEFAULT NULL,
  `overdue_fine` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowings`
--

LOCK TABLES `borrowings` WRITE;
/*!40000 ALTER TABLE `borrowings` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Fiction'),(2,'Science Fiction'),(3,'Classic'),(4,'Fantasy'),(5,'Non-Fiction'),(6,'Mystery'),(7,'Thriller'),(8,'Romance'),(9,'Biography'),(10,'Historical Fiction'),(11,'Horror'),(12,'Poetry'),(13,'Drama'),(14,'Adventure'),(15,'Young Adult'),(16,'Crime'),(17,'Self-Help'),(18,'Business'),(19,'Travel'),(20,'Art');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_optimization`
--

DROP TABLE IF EXISTS `content_optimization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_optimization` (
  `content_id` int NOT NULL AUTO_INCREMENT,
  `content_type` varchar(100) DEFAULT NULL,
  `accessibility_score` decimal(5,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_optimization`
--

LOCK TABLES `content_optimization` WRITE;
/*!40000 ALTER TABLE `content_optimization` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_optimization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_field_values` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `field_id` int DEFAULT NULL,
  `field_value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `field_id` (`field_id`),
  CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `field_id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(100) DEFAULT NULL,
  `field_type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_mappings`
--

DROP TABLE IF EXISTS `external_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_mappings` (
  `mapping_id` int NOT NULL AUTO_INCREMENT,
  `system_id` int DEFAULT NULL,
  `internal_table` varchar(100) DEFAULT NULL,
  `external_table` varchar(100) DEFAULT NULL,
  `mapping_details` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`mapping_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `external_mappings_ibfk_1` FOREIGN KEY (`system_id`) REFERENCES `external_systems` (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_mappings`
--

LOCK TABLES `external_mappings` WRITE;
/*!40000 ALTER TABLE `external_mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_systems`
--

DROP TABLE IF EXISTS `external_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_systems` (
  `system_id` int NOT NULL AUTO_INCREMENT,
  `system_name` varchar(100) DEFAULT NULL,
  `system_type` varchar(100) DEFAULT NULL,
  `api_key` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_systems`
--

LOCK TABLES `external_systems` WRITE;
/*!40000 ALTER TABLE `external_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fines` (
  `fine_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT NULL,
  `fine_date` date DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`fine_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

LOCK TABLES `fines` WRITE;
/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holds`
--

DROP TABLE IF EXISTS `holds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holds` (
  `hold_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `hold_date` date DEFAULT NULL,
  `fulfilled` tinyint(1) DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  PRIMARY KEY (`hold_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holds`
--

LOCK TABLES `holds` WRITE;
/*!40000 ALTER TABLE `holds` DISABLE KEYS */;
/*!40000 ALTER TABLE `holds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keywords` (
  `keyword_id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`keyword_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `keywords_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John',NULL,'johndoe@example.com','123 Main St',NULL,NULL,NULL,'Doe','New York City','NY','10001',NULL),(2,'Jane',NULL,'janesmith@example.com','456 Elm St',NULL,NULL,NULL,'Smith','Los Angeles','CA','90001',NULL),(3,'Michael',NULL,'michaeljohnson@example.com','789 Oak St',NULL,NULL,NULL,'Johnson','Chicago','IL','60601',NULL),(4,'Emily',NULL,'emilybrown@example.com','12 Pine St',NULL,NULL,NULL,'Brown','Houston','TX','77001',NULL),(5,'William',NULL,'williamjones@example.com','34 Maple St',NULL,NULL,NULL,'Jones','Philadelphia','PA','19101',NULL),(6,'Olivia',NULL,'oliviadavis@example.com','56 Cedar St',NULL,NULL,NULL,'Davis','Phoenix','AZ','85001',NULL),(7,'James',NULL,'jamesmiller@example.com','78 Walnut St',NULL,NULL,NULL,'Miller','San Antonio','TX','78201',NULL),(8,'Sophia',NULL,'sophiawilson@example.com','90 Birch St',NULL,NULL,NULL,'Wilson','San Diego','CA','92101',NULL),(9,'Benjamin',NULL,'benjamintaylor@example.com','123 Pineapple St',NULL,NULL,NULL,'Taylor','Dallas','TX','75201',NULL),(10,'Isabella',NULL,'isabellaanderson@example.com','456 Orange St',NULL,NULL,NULL,'Anderson','Austin','TX','78701',NULL),(11,'Joseph',NULL,'josephthomas@example.com','789 Mango St',NULL,NULL,NULL,'Thomas','San Francisco','CA','94101',NULL),(12,'Mia',NULL,'miamartinez@example.com','12 Cherry St',NULL,NULL,NULL,'Martinez','Seattle','WA','98101',NULL),(13,'David',NULL,'davidclark@example.com','34 Lemon St',NULL,NULL,NULL,'Clark','Denver','CO','80201',NULL),(14,'Samantha',NULL,'samanthahill@example.com','56 Grape St',NULL,NULL,NULL,'Hill','Washington, D.C.','DC','20001',NULL),(15,'Daniel',NULL,'danieladams@example.com','78 Blueberry St',NULL,NULL,NULL,'Adams','Boston','MA','02101',NULL),(16,'Ava',NULL,'avacampbell@example.com','90 Raspberry St',NULL,NULL,NULL,'Campbell','Atlanta','GA','30301',NULL),(17,'Andrew',NULL,'andrewgreen@example.com','123 Strawberry St',NULL,NULL,NULL,'Green','Miami','FL','33101',NULL),(18,'Charlotte',NULL,'charlottee@example.com','456 Watermelon St',NULL,NULL,NULL,'Lee','Orlando','FL','32801',NULL),(19,'Henry',NULL,'henryyoung@example.com','789 Kiwi St',NULL,NULL,NULL,'Young','New Orleans','LA','70112',NULL),(20,'Ella',NULL,'ellaallen@example.com','12 Blackberry St',NULL,NULL,NULL,'Allen','Las Vegas','NV','89101',NULL),(21,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-04 12:41:37',NULL,'Rajarathinam',NULL,NULL,'600034',NULL),(22,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-04 12:41:37',NULL,'Rajarathinam','chennai','Tamilnadu','600034',NULL),(23,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-04 12:41:37',NULL,'Rajarathinam','chennai','Tamilnadu','600034','44'),(24,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-04 12:41:37',NULL,'Rajarathinam','chennai','Tamilnadu','600034','45'),(25,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:40:02',NULL,'Rajarathinam',NULL,NULL,'600034','46'),(26,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:43:40',NULL,'Rajarathinam',NULL,NULL,'600034','47'),(27,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:44:50',NULL,'Rajarathinam',NULL,NULL,'600034','48'),(28,'Suguna 1',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:55:01',NULL,'Rajarathinam',NULL,NULL,'600034','49'),(29,'Suguna 1',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:55:17',NULL,'Rajarathinam',NULL,NULL,'600034','50'),(30,'Suguna 1',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 18:55:46',NULL,'Rajarathinam',NULL,NULL,'600034','51'),(31,'Suguna 1',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 19:15:32',NULL,'Rajarathinam',NULL,NULL,'600034','52'),(32,'Suguna 1',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 19:18:17',NULL,'Rajarathinam',NULL,NULL,'600034','53'),(33,'Suguna',NULL,NULL,'3, 1st Floor,  2nd Street tankbund road,  Nungambakkam',NULL,'2023-07-07 19:19:45',NULL,'Rajarathinam',NULL,NULL,'600034','54');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Manage Users',NULL,NULL),(2,'Manage Books',NULL,NULL),(3,'Manage Catalog',NULL,NULL),(4,'Manage Check-in/Check-out',NULL,NULL),(5,'Manage Reservations',NULL,NULL),(6,'Manage Fines and Payments',NULL,NULL),(7,'Generate Reports',NULL,NULL),(8,'Manage Security and Access Control',NULL,NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Penguin Random House','USA'),(2,'HarperCollins','USA'),(3,'Hachette Livre','France'),(4,'Simon & Schuster','USA'),(5,'Macmillan Publishers','UK'),(6,'Bloomsbury Publishing','UK'),(7,'Scholastic Corporation','USA'),(8,'Oxford University Press','UK'),(9,'Cambridge University Press','UK'),(10,'Pearson Education','UK'),(11,'Wiley','USA'),(12,'Random House','USA'),(13,'Pan Macmillan','UK'),(14,'Penguin Books','UK'),(15,'Harper & Brothers','USA'),(16,'Vintage Books','USA'),(17,'Houghton Mifflin Harcourt','USA'),(18,'Bantam Books','USA'),(19,'Doubleday','USA'),(20,'Little, Brown and Company','USA');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_name` varchar(100) DEFAULT NULL,
  `query` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `fulfilled` tinyint(1) DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `member_id` (`member_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(3,6),(3,7),(3,8);
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',NULL,NULL),(2,'Librarian',NULL,NULL),(3,'Member',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(100) DEFAULT NULL,
  `setting_value` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,2),(3,3),(4,2),(5,3),(6,3),(7,1),(8,2),(9,3),(10,1),(11,2),(12,3),(13,1),(14,2),(15,3),(16,2),(17,3),(18,3),(19,1),(20,2);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `role` enum('librarian','member') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'password123','johndoe@example.com','John','member',NULL,NULL,'Doe'),(2,NULL,'password456','janesmith@example.com','Jane','member',NULL,NULL,'Smith'),(3,NULL,'password789','michaeljohnson@example.com','Michael','member',NULL,NULL,'Johnson'),(4,NULL,'passwordabc','emilybrown@example.com','Emily','member',NULL,NULL,'Brown'),(5,NULL,'passworddef','williamjones@example.com','William','member',NULL,NULL,'Jones'),(6,NULL,'passwordghi','oliviadavis@example.com','Olivia','member',NULL,NULL,'Davis'),(7,NULL,'passwordjkl','jamesmiller@example.com','James','member',NULL,NULL,'Miller'),(8,NULL,'passwordmno','sophiawilson@example.com','Sophia','member',NULL,NULL,'Wilson'),(9,NULL,'passwordpqr','benjamintaylor@example.com','Benjamin','member',NULL,NULL,'Taylor'),(10,NULL,'passwordstu','isabellaanderson@example.com','Isabella','member',NULL,NULL,'Anderson'),(11,NULL,'passwordvwx','josephthomas@example.com','Joseph','member',NULL,NULL,'Thomas'),(12,NULL,'passwordyz0','miamartinez@example.com','Mia','member',NULL,NULL,'Martinez'),(13,NULL,'password123','davidclark@example.com','David','member',NULL,NULL,'Clark'),(14,NULL,'password456','samanthahill@example.com','Samantha','member',NULL,NULL,'Hill'),(15,NULL,'password789','danieladams@example.com','Daniel','member',NULL,NULL,'Adams'),(16,NULL,'passwordabc','avacampbell@example.com','Ava','member',NULL,NULL,'Campbell'),(17,NULL,'passworddef','andrewgreen@example.com','Andrew','member',NULL,NULL,'Green'),(18,NULL,'passwordghi','charlottee@example.com','Charlotte','member',NULL,NULL,'Lee'),(19,NULL,'passwordjkl','henryyoung@example.com','Henry','member',NULL,NULL,'Young'),(20,NULL,'passwordmno','ellaallen@example.com','Ella','member',NULL,NULL,'Allen'),(21,'John','password','test@test.com','John','member',NULL,NULL,'Doe'),(22,'John1','password','test@test.com','John','member',NULL,NULL,'Doe'),(23,'John1','password','test@test.com','John','member',NULL,NULL,'Doe'),(24,'John2','password','test@test.com','John','member',NULL,NULL,'Doe'),(25,'John2','password','test@test.com','John','member',NULL,NULL,'Doe'),(26,'John2','password','test@test.com','John','member',NULL,NULL,'Doe'),(27,'John2','password','test@test.com','John','member','2023-07-04 06:56:42',NULL,'Doe'),(28,'John2','password','test@test.com','John','member','2023-07-04 07:02:45',NULL,'Doe'),(29,'John2','password','test@test.com','John','member','2023-07-04 07:05:29',NULL,'Doe'),(30,'John2','password','test@test.com','John','member','2023-07-04 07:06:18',NULL,'Doe'),(31,'John2','password','test@test.com','John','member','2023-07-04 07:07:32',NULL,'Doe'),(32,'John2','password','test@test.com','John','member','2023-07-04 07:07:35',NULL,'Doe'),(33,'John2','password','test@test.com','John','member','2023-07-04 07:10:07',NULL,'Doe'),(34,'John2','password','test@test.com','John','member','2023-07-04 07:11:11',NULL,'Doe'),(35,'John2','password','test@test.com','John','member','2023-07-04 07:11:37',NULL,'Doe'),(36,'John2','password','test@test.com','John','member','2023-07-04 07:12:30',NULL,'Doe'),(37,'John2','password','test@test.com','John','member','2023-07-04 07:13:02',NULL,'Doe'),(38,'Thunder client','password','test@test.com','John','member','2023-07-03 18:30:00',NULL,'Doe'),(39,'Thunder client','password','test@test.com','John','member','2023-07-03 18:30:00',NULL,'Doe'),(40,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(41,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(42,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(43,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(44,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(45,'Suguna','123','sugunadevi14@gmail.com','Suguna','member','2023-07-04 07:11:37',NULL,'Rajarathinam'),(46,'test','123','sugunadevi14@gmail.com','Suguna','member','2023-07-07 13:10:02',NULL,'Rajarathinam'),(47,'test','123','sugunadevi14@gmail.com','Suguna','member','2023-07-07 13:13:40',NULL,'Rajarathinam'),(48,'test','123','sugunadevi14@gmail.com','Suguna','member','2023-07-07 13:14:50',NULL,'Rajarathinam'),(49,'test 1','123','sugunadevi14@gmail.com','Suguna 1','member','2023-07-07 13:25:01',NULL,'Rajarathinam'),(50,'test 1','123','sugunadevi14@gmail.com','Suguna 1','member','2023-07-07 13:25:17',NULL,'Rajarathinam'),(51,'test 1','123','sugunadevi14@gmail.com','Suguna 1','member','2023-07-07 13:25:46',NULL,'Rajarathinam'),(52,'test 1','123','sugunadevi14@gmail.com','Suguna 1','member','2023-07-07 13:45:32',NULL,'Rajarathinam'),(53,'test 1','123','sugunadevi14@gmail.com','Suguna 1','member','2023-07-07 13:48:17',NULL,'Rajarathinam'),(54,'test 2','123','sugunadevi14@gmail.com','Suguna','member','2023-07-07 13:49:45',NULL,'Rajarathinam');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-15 16:49:14
