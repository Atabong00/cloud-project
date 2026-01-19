-- Database Schema for Veri-Grade / CertifyU

CREATE DATABASE IF NOT EXISTS `verify_grade_db`;
USE `verify_grade_db`;

-- Users Table
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(50) NOT NULL PRIMARY KEY,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'student',
  `regNo` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Courses Table
CREATE TABLE IF NOT EXISTS `courses` (
  `id` varchar(50) NOT NULL PRIMARY KEY,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `masterId` varchar(50) DEFAULT NULL,
  `credits` int(11) DEFAULT '0',
  `description` text,
  FOREIGN KEY (`masterId`) REFERENCES `users` (`id`) ON DELETE SET NULL
);

-- Certificates Table
CREATE TABLE IF NOT EXISTS `certificates` (
  `id` varchar(50) NOT NULL PRIMARY KEY,
  `studentId` varchar(50) DEFAULT NULL,
  `courseIds` text DEFAULT NULL COMMENT 'JSON Array of Course IDs',
  `candidateName` varchar(100) DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `expiryDate` varchar(20) DEFAULT NULL,
  FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE SET NULL
);

-- Enrollments Table
CREATE TABLE IF NOT EXISTS `enrollments` (
  `id` varchar(50) NOT NULL PRIMARY KEY,
  `studentId` varchar(50) NOT NULL,
  `courseId` varchar(50) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'Active',
  `marks` int(11) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '0',
  FOREIGN KEY (`studentId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`courseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE
);

-- Posts/Announcements Table
CREATE TABLE IF NOT EXISTS `posts` (
  `id` varchar(50) NOT NULL PRIMARY KEY,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(50) DEFAULT 'notice',
  `authorId` varchar(50) NOT NULL,
  `authorRole` varchar(50) DEFAULT NULL,
  `courseId` varchar(50) DEFAULT 'GLOBAL',
  `date` datetime DEFAULT CURRENT_TIMESTAMP
);

-- Feedback Table
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `userName` varchar(100) NOT NULL,
  `userRole` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
);

-- Seed Data

INSERT IGNORE INTO `users` (`id`, `name`, `email`, `password`, `role`, `regNo`, `dob`, `title`, `balance`) VALUES
('u1', 'Admin User', 'admin@test.com', '123', 'admin', NULL, NULL, NULL, '0.00'),
('u2', 'John Prof', 'prof@test.com', '123', 'master', NULL, NULL, 'Senior Professor', '0.00'),
('u3', 'Alice Student', 'alice@test.com', '123', 'student', 'REG2024001', '2000-01-01', NULL, '500.00');

INSERT IGNORE INTO `courses` (`id`, `code`, `name`, `masterId`, `credits`, `description`) VALUES
('c1', 'CS101', 'Intro to Computer Science', 'u2', 4, 'Basics of CS'),
('c2', 'MATH202', 'Advanced Calculus', 'u2', 3, 'Derivatives and Integrals');

INSERT IGNORE INTO `certificates` (`id`, `studentId`, `courseIds`, `candidateName`, `issueDate`, `expiryDate`) VALUES
('CERT-DEMO-001', 'u3', '[\"c1\"]', 'Alice Student', '2023-01-15', '2028-01-15');
