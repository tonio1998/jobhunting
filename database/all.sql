-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.36 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table etrabaho.audits
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=MyISAM AUTO_INCREMENT=396 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.audits: 395 rows
DELETE FROM `audits`;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":0,"ApplicationStatus":null}', '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', 'http://192.168.160.114:8001/api/bids/jobs/workers/24', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 09:55:30', '2025-06-27 09:55:30'),
	(2, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', '{"isReviewed":0,"ApplicationStatus":"shortlisted"}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 09:55:32', '2025-06-27 09:55:32'),
	(3, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"ApplicationStatus":"shortlisted"}', '{"ApplicationStatus":"Rejected"}', 'http://192.168.160.114:8001/api/bids/status/24/Rejected', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 09:56:22', '2025-06-27 09:56:22'),
	(4, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":0,"ApplicationStatus":null}', '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', 'http://192.168.160.114:8001/api/bids/jobs/workers/24', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:07:08', '2025-06-27 10:07:08'),
	(5, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', '{"isReviewed":0,"ApplicationStatus":"shortlisted"}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:08:19', '2025-06-27 10:08:19'),
	(6, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"ApplicationStatus":"shortlisted"}', '{"ApplicationStatus":"Hired"}', 'http://192.168.160.114:8001/api/bids/status/24/Hired', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:08:52', '2025-06-27 10:08:52'),
	(7, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null,"ApplicationStatus":null}', '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', 'http://192.168.160.114:8001/api/bids/jobs/workers/24', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:15:03', '2025-06-27 10:15:03'),
	(8, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', '{"isReviewed":0,"ApplicationStatus":"shortlisted"}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:16:25', '2025-06-27 10:16:25'),
	(9, NULL, NULL, 'created', 'App\\Models\\Chats', 18, '[]', '{"sender_id":1,"receiver_id":2,"message":"Your application status has been updated to: shortlisted.","attachment_url":null,"attachment_type":null,"id":18}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:16:25', '2025-06-27 10:16:25'),
	(10, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null,"ApplicationStatus":null}', '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', 'http://192.168.160.114:8001/api/bids/jobs/workers/24', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:17:05', '2025-06-27 10:17:05'),
	(11, NULL, NULL, 'created', 'App\\Models\\Chats', 19, '[]', '{"sender_id":1,"receiver_id":2,"message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":19}', 'http://192.168.160.114:8001/api/bids/jobs/workers/24', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:17:05', '2025-06-27 10:17:05'),
	(12, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":1,"ApplicationStatus":"The employee has seen your application."}', '{"isReviewed":0,"ApplicationStatus":"shortlisted"}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:20:25', '2025-06-27 10:20:25'),
	(13, NULL, NULL, 'created', 'App\\Models\\Chats', 20, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"Good news! You have been shortlisted. Please wait for further instructions.","attachment_url":null,"attachment_type":null,"id":20}', 'http://192.168.160.114:8001/api/bids/status/24/shortlisted', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:20:25', '2025-06-27 10:20:25'),
	(14, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"ApplicationStatus":"shortlisted"}', '{"ApplicationStatus":"Hired"}', 'http://192.168.160.114:8001/api/bids/status/24/Hired', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:27:42', '2025-06-27 10:27:42'),
	(15, NULL, NULL, 'created', 'App\\Models\\Chats', 21, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"Congratulations! You have been hired for the position.","attachment_url":null,"attachment_type":null,"id":21}', 'http://192.168.160.114:8001/api/bids/status/24/Hired', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:27:42', '2025-06-27 10:27:42'),
	(16, NULL, NULL, 'created', 'App\\Models\\Chats', 22, '[]', '{"sender_id":2,"receiver_id":1,"message":"Woow","attachment_url":null,"attachment_type":null,"id":22}', 'http://192.168.160.114:8001/api/chats', '192.168.160.147', 'okhttp/4.9.2', NULL, '2025-06-27 10:31:12', '2025-06-27 10:31:12'),
	(17, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 5, '[]', '{"RequirementID":"1","UserID":"2","JobID":"205","FilePath":"user_files\\/2\\/submission\\/205\\/1\\/DanbqqdStuUnlhHlOMAKrVkfNJybhsZ2NdZ00Yxc.pdf","FileName":"Recommended-Titles.pdf","size":63073,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"id":5}', 'http://10.25.1.130:8000/api/user/upload-requirement', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:28:32', '2025-06-27 18:28:32'),
	(18, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 6, '[]', '{"RequirementID":"2","UserID":"2","JobID":"205","FilePath":"user_files\\/2\\/submission\\/205\\/2\\/VaZOQwVy57aZkMGYxe015bIJ1pzNNCa3SerYmiN3.pdf","FileName":"Recommended-Titles.pdf","size":63073,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"id":6}', 'http://10.25.1.130:8000/api/user/upload-requirement', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:28:34', '2025-06-27 18:28:34'),
	(19, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 7, '[]', '{"RequirementID":"2","UserID":"2","JobID":"205","FilePath":"user_files\\/2\\/submission\\/205\\/2\\/n3Qz8YJsOp6Qmdv0ylAZlFNgXR8AtfIBktYXV5Vc.pdf","FileName":"E-Gov.pdf","size":1032034,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"id":7}', 'http://10.25.1.130:8000/api/user/upload-requirement', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:34:20', '2025-06-27 18:34:20'),
	(20, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 8, '[]', '{"RequirementID":"1","UserID":"2","JobID":"205","FilePath":"user_files\\/2\\/submission\\/205\\/1\\/cWXWj9mBY2szAbpO2HhW9spMIJ8LTjuNxT8L1HsC.pdf","FileName":"E-GovernmentAct.pdf","size":41493,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"id":8}', 'http://10.25.1.130:8000/api/user/upload-requirement', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:34:26', '2025-06-27 18:34:26'),
	(21, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 35, '[]', '{"UserID":2,"skill_id":5,"created_by":2,"updated_by":2,"status":"active","archived":0,"id":35}', 'http://10.25.1.130:8000/api/skills/worker/add', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:36:21', '2025-06-27 18:36:21'),
	(22, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"ApplicationStatus":"shortlisted"}', '{"ApplicationStatus":"Hired"}', 'http://10.25.1.130:8000/api/bids/status/24/Hired', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:39:31', '2025-06-27 18:39:31'),
	(23, NULL, NULL, 'created', 'App\\Models\\Chats', 23, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"Congratulations! You have been hired for the position.","attachment_url":null,"attachment_type":null,"id":23}', 'http://10.25.1.130:8000/api/bids/status/24/Hired', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:39:31', '2025-06-27 18:39:31'),
	(24, NULL, NULL, 'created', 'App\\Models\\Review', 11, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"None","created_by":1,"updated_by":1,"status":"active","archived":0,"id":11}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:52:34', '2025-06-27 18:52:34'),
	(25, NULL, NULL, 'created', 'App\\Models\\Review', 12, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"None","created_by":1,"updated_by":1,"status":"active","archived":0,"id":12}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:53:58', '2025-06-27 18:53:58'),
	(26, NULL, NULL, 'created', 'App\\Models\\Review', 13, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"None","created_by":1,"updated_by":1,"status":"active","archived":0,"id":13}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:54:54', '2025-06-27 18:54:54'),
	(27, NULL, NULL, 'created', 'App\\Models\\Review', 14, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"None","created_by":1,"updated_by":1,"status":"active","archived":0,"id":14}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:55:24', '2025-06-27 18:55:24'),
	(28, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":0}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 18:55:24', '2025-06-27 18:55:24'),
	(29, NULL, NULL, 'created', 'App\\Models\\Review', 1, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"Ccv","created_by":1,"updated_by":1,"status":"active","archived":0,"id":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:25:21', '2025-06-27 19:25:21'),
	(30, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:25:21', '2025-06-27 19:25:21'),
	(31, NULL, NULL, 'created', 'App\\Models\\Review', 2, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":3,"comment":"Ccv","created_by":1,"updated_by":1,"status":"active","archived":0,"id":2}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:26:46', '2025-06-27 19:26:46'),
	(32, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:26:46', '2025-06-27 19:26:46'),
	(33, NULL, NULL, 'created', 'App\\Models\\Review', 3, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"Ccv","created_by":1,"updated_by":1,"status":"active","archived":0,"id":3}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:27:35', '2025-06-27 19:27:35'),
	(34, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:27:35', '2025-06-27 19:27:35'),
	(35, NULL, NULL, 'created', 'App\\Models\\Review', 4, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":4,"comment":"Ccv","created_by":1,"updated_by":1,"status":"active","archived":0,"id":4}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:28:20', '2025-06-27 19:28:20'),
	(36, NULL, NULL, 'created', 'App\\Models\\SkilledWorker', 1, '[]', '{"user_id":2,"rating":"3.7500","created_by":1,"updated_by":1,"status":"active","archived":0,"id":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:28:20', '2025-06-27 19:28:20'),
	(37, NULL, NULL, 'created', 'App\\Models\\Review', 1, '[]', '{"BidID":24,"reviewer_id":1,"reviewee_id":2,"rating":5,"comment":"Ccv","created_by":1,"updated_by":1,"status":"active","archived":0,"id":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:28:50', '2025-06-27 19:28:50'),
	(38, NULL, NULL, 'updated', 'App\\Models\\Bid', 24, '{"isReviewed":null}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:28:50', '2025-06-27 19:28:50'),
	(39, NULL, NULL, 'created', 'App\\Models\\SkilledWorker', 1, '[]', '{"user_id":2,"rating":"5.0000","created_by":1,"updated_by":1,"status":"active","archived":0,"id":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-27 19:28:50', '2025-06-27 19:28:50'),
	(40, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 36, '[]', '{"UserID":12,"skill_id":1,"created_by":12,"updated_by":12,"status":"active","archived":0,"id":36}', 'http://10.25.1.130:8000/api/skills/worker/add', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-28 23:26:17', '2025-06-28 23:26:17'),
	(41, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 37, '[]', '{"UserID":12,"skill_id":2,"created_by":12,"updated_by":12,"status":"active","archived":0,"id":37}', 'http://10.25.1.130:8000/api/skills/worker/add', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-28 23:26:18', '2025-06-28 23:26:18'),
	(42, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 38, '[]', '{"UserID":12,"skill_id":3,"created_by":12,"updated_by":12,"status":"active","archived":0,"id":38}', 'http://10.25.1.130:8000/api/skills/worker/add', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-28 23:26:19', '2025-06-28 23:26:19'),
	(43, NULL, NULL, 'created', 'App\\Models\\Chats', 24, '[]', '{"sender_id":2,"receiver_id":1,"message":"Ggg","attachment_url":null,"attachment_type":null,"id":24}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 18:40:22', '2025-06-29 18:40:22'),
	(44, NULL, NULL, 'created', 'App\\Models\\Chats', 25, '[]', '{"sender_id":2,"receiver_id":1,"message":"Xxx","attachment_url":null,"attachment_type":null,"id":25}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 18:41:28', '2025-06-29 18:41:28'),
	(45, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1993-06-24"}', '{"dob":"1998-02-03"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 18:46:11', '2025-06-29 18:46:11'),
	(46, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-03"}', '{"dob":"1998-02-02"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:12:01', '2025-06-29 19:12:01'),
	(47, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-02"}', '{"dob":"1998-02-03"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:12:12', '2025-06-29 19:12:12'),
	(48, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-03"}', '{"dob":"1998-02-02"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:13:52', '2025-06-29 19:13:52'),
	(49, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-02"}', '{"dob":"1998-02-01"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:15:14', '2025-06-29 19:15:14'),
	(50, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-01"}', '{"dob":"1998-01-31"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:18:08', '2025-06-29 19:18:08'),
	(51, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-04"}', '{"dob":"2025-06-30"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:25:55', '2025-06-29 19:25:55'),
	(52, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"2025-06-30"}', '{"dob":"2025-06-04"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:33:12', '2025-06-29 19:33:12'),
	(53, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"2025-06-04"}', '{"dob":"2025-06-30"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:33:48', '2025-06-29 19:33:48'),
	(54, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"2025-06-30"}', '{"dob":"2025-05-04"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:35:54', '2025-06-29 19:35:54'),
	(55, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"2025-05-04"}', '{"dob":"1998-02-04"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:36:13', '2025-06-29 19:36:13'),
	(56, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-04"}', '{"dob":"1998-02-05"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:40:12', '2025-06-29 19:40:12'),
	(57, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1998-02-05"}', '{"dob":"1999-02-05"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:42:52', '2025-06-29 19:42:52'),
	(58, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"civilStatus":"Single"}', '{"civilStatus":"Separated"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:43:26', '2025-06-29 19:43:26'),
	(59, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"civilStatus":"Separated"}', '{"civilStatus":"Single"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 19:43:31', '2025-06-29 19:43:31'),
	(60, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 2, '[]', '{"RequirementID":"2","UserID":"2","FilePath":"user_files\\/2\\/2\\/b5ee1W9KbzTgp7rDO9xP47dTIqhSaXob3mWueH5z.pdf","FileName":"grades_2014-00996_1751101285760.pdf","size":242795,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"id":2}', 'http://10.25.1.130:8000/api/user/2/2/upload', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:08:43', '2025-06-29 20:08:43'),
	(61, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 29, '{"id":29,"UserID":2,"skill_id":20,"created_by":2,"updated_by":2,"status":"active","archived":0}', '[]', 'http://10.25.1.130:8000/api/skills/worker/remove', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:08:51', '2025-06-29 20:08:51'),
	(62, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 35, '{"id":35,"UserID":2,"skill_id":5,"created_by":2,"updated_by":2,"status":"active","archived":0}', '[]', 'http://10.25.1.130:8000/api/skills/worker/remove', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:08:57', '2025-06-29 20:08:57'),
	(63, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"dob":"1999-02-05"}', '{"dob":"1998-02-04"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:09:24', '2025-06-29 20:09:24'),
	(64, NULL, NULL, 'created', 'App\\Models\\Chats', 26, '[]', '{"sender_id":2,"receiver_id":1,"message":"Hey","attachment_url":null,"attachment_type":null,"id":26}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:09:46', '2025-06-29 20:09:46'),
	(65, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"Nationality":null}', '{"Nationality":"Filipino"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 20:37:41', '2025-06-29 20:37:41'),
	(66, NULL, NULL, 'created', 'App\\Models\\Chats', 27, '[]', '{"sender_id":1,"receiver_id":2,"message":"Jane","attachment_url":null,"attachment_type":null,"id":27}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 21:19:05', '2025-06-29 21:19:05'),
	(67, NULL, NULL, 'created', 'App\\Models\\Jobs', 207, '[]', '{"title":"Labada","description":"Maglaba","due_date":"2025-07-01 05:57:00","start_date":"2025-06-30","end_date":"2025-06-30","rate_amount":"800","rate_type":"Fixed","requirements":"[2]","homeowner_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":207}', 'http://10.25.1.130:8000/api/jobs', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 21:59:56', '2025-06-29 21:59:56'),
	(68, NULL, NULL, 'created', 'App\\Models\\Jobs', 208, '[]', '{"title":"Labada","description":"Maglaba","due_date":"2025-07-01 05:57:00","start_date":"2025-06-30","end_date":"2025-06-30","rate_amount":"800","rate_type":"Fixed","requirements":"[2,3]","homeowner_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":208}', 'http://10.25.1.130:8000/api/jobs', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 22:01:58', '2025-06-29 22:01:58'),
	(69, NULL, NULL, 'created', 'App\\Models\\Jobs', 209, '[]', '{"title":"Cook","description":"Magluto kuman fiesta..I need 3","due_date":"2025-07-01 06:57:00","start_date":"2025-07-02","end_date":"2025-07-03","rate_amount":"800","rate_type":"daily","requirements":"[8]","homeowner_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":209}', 'http://10.25.1.130:8000/api/jobs', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 22:02:55', '2025-06-29 22:02:55'),
	(70, NULL, NULL, 'created', 'App\\Models\\Jobs', 210, '[]', '{"title":"Magluto kuman fiesta","description":"I need 3","due_date":"2025-07-02 06:57:00","start_date":"2025-06-30","end_date":"2025-07-05","rate_amount":"450","rate_type":"daily","requirements":"[8]","homeowner_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":210}', 'http://10.25.1.130:8000/api/jobs', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 22:04:30', '2025-06-29 22:04:30'),
	(71, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-07-02 06:57:00"}', '{"due_date":"2025-07-01 22:57:00"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:11:29', '2025-06-29 23:11:29'),
	(72, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-07-01 22:57:00","start_date":"2025-06-30"}', '{"due_date":"2025-07-01 14:57:00","start_date":"2025-07-01"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:11:53', '2025-06-29 23:11:53'),
	(73, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-07-01 14:57:00"}', '{"due_date":"2025-06-30 06:57:00"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:12:17', '2025-06-29 23:12:17'),
	(74, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-30 06:57:00","requirements":"[8]"}', '{"due_date":"2025-06-29 22:57:00","requirements":"[\\"[\\",\\"8\\",\\"]\\",6,8,5]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:19:32', '2025-06-29 23:19:32'),
	(75, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-29 22:57:00","requirements":"[\\"[\\", \\"8\\", \\"]\\", 6, 8, 5]"}', '{"due_date":"2025-06-29 14:57:00","requirements":"[\\"[\\",\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"6\\",\\",\\",null,\\"8\\",\\",\\",null,\\"5\\",\\"]\\",7,6,5]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:20:15', '2025-06-29 23:20:15'),
	(76, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-29 14:57:00","requirements":"[\\"[\\", \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"6\\", \\",\\", null, \\"8\\", \\",\\", null, \\"5\\", \\"]\\", 7, 6, 5]"}', '{"due_date":"2025-06-29 06:57:00","requirements":"[\\"[\\",\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"6\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"5\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"7\\",\\",\\",null,\\"6\\",\\",\\",null,\\"5\\",\\"]\\",3,4]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-29 23:58:05', '2025-06-29 23:58:05'),
	(77, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-29 06:57:00","requirements":"[\\"[\\", \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"6\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"5\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"7\\", \\",\\", null, \\"6\\", \\",\\", null, \\"5\\", \\"]\\", 3, 4]"}', '{"due_date":"2025-06-28 22:57:00","requirements":"[\\"[\\",\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"6\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"5\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"7\\",\\",\\",null,\\"6\\",\\",\\",null,\\"5\\",\\"]\\",3,4,2]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:06:03', '2025-06-30 00:06:03'),
	(78, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-28 22:57:00","requirements":"[\\"[\\", \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"6\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"5\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"7\\", \\",\\", null, \\"6\\", \\",\\", null, \\"5\\", \\"]\\", 3, 4, 2]"}', '{"due_date":"2025-06-28 14:57:00","requirements":"[\\"[\\",\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"6\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"5\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"7\\",\\",\\",null,\\"6\\",\\",\\",null,\\"5\\",\\"]\\",3,4,2,7]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:06:18', '2025-06-30 00:06:18'),
	(79, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-28 14:57:00"}', '{"due_date":"2025-06-28 06:57:00"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:07:11', '2025-06-30 00:07:11'),
	(80, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-28 06:57:00","requirements":"[\\"[\\", \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"[\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"\\\\\\\\\\", \\"\\\\\\"\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"6\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"8\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\",\\", \\"\\\\\\"\\", \\",\\", null, \\"n\\", \\"u\\", \\"l\\", \\"l\\", \\",\\", null, \\"\\\\\\"\\", \\"5\\", \\"\\\\\\"\\", \\",\\", null, \\"\\\\\\"\\", \\"]\\", \\"\\\\\\"\\", \\",\\", null, \\"7\\", \\",\\", null, \\"6\\", \\",\\", null, \\"5\\", \\"]\\", 3, 4, 2, 7]"}', '{"due_date":"2025-06-27 22:57:00","requirements":"[\\"[\\",\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"[\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"\\\\\\\\\\",\\"\\\\\\"\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"6\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"8\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\",\\",\\"\\\\\\"\\",\\",\\",null,\\"n\\",\\"u\\",\\"l\\",\\"l\\",\\",\\",null,\\"\\\\\\"\\",\\"5\\",\\"\\\\\\"\\",\\",\\",null,\\"\\\\\\"\\",\\"]\\",\\"\\\\\\"\\",\\",\\",null,\\"7\\",\\",\\",null,\\"6\\",\\",\\",null,\\"5\\",\\"]\\",3,4,2,7,6]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:07:45', '2025-06-30 00:07:45'),
	(81, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-27 22:57:00","requirements":null}', '{"due_date":"2025-06-27 14:57:00","requirements":"[2,3,4]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:16:44', '2025-06-30 00:16:44'),
	(82, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"due_date":"2025-06-27 14:57:00","requirements":"[2, 3, 4]"}', '{"due_date":"2025-06-27 06:57:00","requirements":"[2,3,4,7]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-06-30 00:16:59', '2025-06-30 00:16:59'),
	(83, NULL, NULL, 'updated', 'App\\Models\\Workers', 3, '{"fullName":"Jane Smith","nickname":"Jane","gender":"Female"}', '{"fullName":"Antonio Jr Piloton","nickname":"Jun","gender":"Male"}', 'http://10.25.1.130:8000/api/user/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 04:41:08', '2025-07-01 04:41:08'),
	(84, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 2, '{"id":2,"RequirementID":2,"UserID":2,"FileName":"grades_2014-00996_1751101285760.pdf","FilePath":"user_files\\/2\\/2\\/b5ee1W9KbzTgp7rDO9xP47dTIqhSaXob3mWueH5z.pdf","size":242795,"type":"application\\/pdf","created_by":2,"updated_by":2,"status":"active","archived":0,"deleted_at":null}', '[]', 'http://10.25.1.130:8000/api/user/files/2', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 05:03:07', '2025-07-01 05:03:07'),
	(85, NULL, NULL, 'created', 'App\\Models\\Jobs', 211, '[]', '{"title":"Manghinlo sa balay","description":"2 person","due_date":"2025-07-05 13:11:00","start_date":"2025-07-05","end_date":"2025-07-05","rate_amount":"800","rate_type":"Fixed","requirements":"[8]","homeowner_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":211}', 'http://10.25.1.130:8000/api/jobs', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 05:14:05', '2025-07-01 05:14:05'),
	(86, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '{"description":"2 person"}', '{"description":"2 personhahh"}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 05:15:30', '2025-07-01 05:15:30'),
	(87, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '[]', '[]', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 08:41:18', '2025-07-01 08:41:18'),
	(88, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '[]', '[]', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 08:49:43', '2025-07-01 08:49:43'),
	(89, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '[]', '[]', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 08:51:30', '2025-07-01 08:51:30'),
	(90, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '[]', '[]', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:06:59', '2025-07-01 09:06:59'),
	(91, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '{"placeOfAssignmentText":"{\\"_h\\":2,\\"_i\\":1,\\"_j\\":\\"Surigao City, Surigao del Norte, Caraga, 8400, Philippines\\",\\"_k\\":null,\\"status\\":\\"fulfilled\\",\\"value\\":\\"Surigao City, Surigao del Norte, Caraga, 8400, Philippines\\"}"}', '{"placeOfAssignmentText":null}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:08:10', '2025-07-01 09:08:10'),
	(92, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '[]', '[]', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:09:14', '2025-07-01 09:09:14'),
	(93, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '{"placeOfAssignmentText":null}', '{"placeOfAssignmentText":"Purok 5, Day-asan, Surigao del Norte, Caraga, 8400, Philippines"}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:23:03', '2025-07-01 09:23:03'),
	(94, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"placeOfAssignmentText":null,"requirements":"[2, 3, 4, 7]"}', '{"placeOfAssignmentText":"Tubajon, Dinagat Islands, Caraga, Philippines","requirements":"[2,3,4,7]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:32:00', '2025-07-01 09:32:00'),
	(95, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '{"placeOfAssignmentText":"Purok 5, Day-asan, Surigao del Norte, Caraga, 8400, Philippines"}', '{"placeOfAssignmentText":"Buenavista Elementary School, Surigao City, Buenavista, Surigao del Norte, Caraga, 8400, Philippines"}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:43:35', '2025-07-01 09:43:35'),
	(96, NULL, NULL, 'updated', 'App\\Models\\Jobs', 211, '{"placeOfAssignmentText":"Buenavista Elementary School, Surigao City, Buenavista, Surigao del Norte, Caraga, 8400, Philippines"}', '{"placeOfAssignmentText":"Juan P. Cedro, Sr. Memorial High School, Surigao City, Buenavista, Surigao del Norte, Caraga, 8400, Philippines"}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:48:26', '2025-07-01 09:48:26'),
	(97, NULL, NULL, 'updated', 'App\\Models\\Jobs', 206, '{"placeOfAssignmentText":null,"requirements":"[2, 3, 5]"}', '{"placeOfAssignmentText":"Purok 2, Mahayahay, Kitcharao, Agusan del Norte, Caraga, 8609, Philippines","requirements":"[2,3,5]"}', 'http://10.25.1.130:8000/api/jobs/206', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:51:36', '2025-07-01 09:51:36'),
	(98, NULL, NULL, 'updated', 'App\\Models\\Jobs', 209, '{"placeOfAssignmentText":null}', '{"placeOfAssignmentText":"Tagana-an Road, Purok 1, Lower Libas, Surigao del Norte, Caraga, 8404, Philippines"}', 'http://10.25.1.130:8000/api/jobs/209', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 09:56:34', '2025-07-01 09:56:34'),
	(99, NULL, NULL, 'updated', 'App\\Models\\Jobs', 21, '{"placeOfAssignmentText":null,"requirements":null,"updated_by":3}', '{"placeOfAssignmentText":"Rizal Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[8]","updated_by":1}', 'http://10.25.1.130:8000/api/jobs/21', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-01 23:54:40', '2025-07-01 23:54:40'),
	(100, NULL, NULL, 'updated', 'App\\Models\\Jobs', 53, '{"placeOfAssignmentText":null,"requirements":null,"updated_by":2}', '{"placeOfAssignmentText":"Prince Town, Espina Street, Espina Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[1,2,3,5,7]","updated_by":1}', 'http://10.25.1.130:8000/api/jobs/53', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:21:20', '2025-07-02 00:21:20'),
	(101, NULL, NULL, 'created', 'App\\Models\\Skill', 21, '[]', '{"description":"Heheheheh","created_by":1,"updated_by":1,"status":"active","archived":0,"id":21}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:49:06', '2025-07-02 00:49:06'),
	(102, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 39, '[]', '{"skill_id":21,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":39}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:49:06', '2025-07-02 00:49:06'),
	(103, NULL, NULL, 'created', 'App\\Models\\Skill', 22, '[]', '{"description":"Hhhahahahha","created_by":1,"updated_by":1,"status":"active","archived":0,"id":22}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:49:57', '2025-07-02 00:49:57'),
	(104, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 40, '[]', '{"skill_id":22,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":40}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:49:57', '2025-07-02 00:49:57'),
	(105, NULL, NULL, 'created', 'App\\Models\\Skill', 23, '[]', '{"description":"Errt","created_by":1,"updated_by":1,"status":"active","archived":0,"id":23}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:56:36', '2025-07-02 00:56:36'),
	(106, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 41, '[]', '{"skill_id":23,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":41}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 00:56:36', '2025-07-02 00:56:36'),
	(107, NULL, NULL, 'created', 'App\\Models\\Skill', 24, '[]', '{"description":"Ffff","created_by":1,"updated_by":1,"status":"active","archived":0,"id":24}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 01:35:27', '2025-07-02 01:35:27'),
	(108, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 42, '[]', '{"skill_id":24,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":42}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 01:35:27', '2025-07-02 01:35:27'),
	(109, NULL, NULL, 'created', 'App\\Models\\JobSkill', 11, '[]', '{"job_id":"211","skill_id":0,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":11}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:26:21', '2025-07-02 02:26:21'),
	(110, NULL, NULL, 'created', 'App\\Models\\JobSkill', 12, '[]', '{"job_id":"211","skill_id":0,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":12}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:26:21', '2025-07-02 02:26:21'),
	(111, NULL, NULL, 'created', 'App\\Models\\JobSkill', 13, '[]', '{"job_id":"211","skill_id":2,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":13}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:26:59', '2025-07-02 02:26:59'),
	(112, NULL, NULL, 'created', 'App\\Models\\JobSkill', 14, '[]', '{"job_id":"211","skill_id":9,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":14}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:26:59', '2025-07-02 02:26:59'),
	(113, NULL, NULL, 'created', 'App\\Models\\JobSkill', 15, '[]', '{"job_id":"211","skill_id":3,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":15}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(114, NULL, NULL, 'created', 'App\\Models\\JobSkill', 16, '[]', '{"job_id":"211","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":16}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(115, NULL, NULL, 'created', 'App\\Models\\JobSkill', 17, '[]', '{"job_id":"211","skill_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":17}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(116, NULL, NULL, 'created', 'App\\Models\\JobSkill', 18, '[]', '{"job_id":"211","skill_id":10,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":18}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(117, NULL, NULL, 'created', 'App\\Models\\JobSkill', 19, '[]', '{"job_id":"211","skill_id":7,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":19}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(118, NULL, NULL, 'created', 'App\\Models\\JobSkill', 20, '[]', '{"job_id":"211","skill_id":5,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":20}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(119, NULL, NULL, 'created', 'App\\Models\\JobSkill', 21, '[]', '{"job_id":"211","skill_id":6,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":21}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:27:37', '2025-07-02 02:27:37'),
	(120, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"requirements":"[2, 3, 4, 7]"}', '{"requirements":"[2,3,4,7]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:39:17', '2025-07-02 02:39:17'),
	(121, NULL, NULL, 'created', 'App\\Models\\JobSkill', 22, '[]', '{"job_id":"210","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":22}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:39:17', '2025-07-02 02:39:17'),
	(122, NULL, NULL, 'created', 'App\\Models\\Skill', 25, '[]', '{"description":"Cook","created_by":1,"updated_by":1,"status":"active","archived":0,"id":25}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:41:46', '2025-07-02 02:41:46'),
	(123, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 43, '[]', '{"skill_id":25,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":43}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:41:46', '2025-07-02 02:41:46'),
	(124, NULL, NULL, 'updated', 'App\\Models\\Jobs', 210, '{"requirements":"[2, 3, 4, 7]"}', '{"requirements":"[2,3,4,7]"}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:41:51', '2025-07-02 02:41:51'),
	(125, NULL, NULL, 'created', 'App\\Models\\JobSkill', 23, '[]', '{"job_id":"210","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":23}', 'http://10.25.1.130:8000/api/jobs/210', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:41:51', '2025-07-02 02:41:51'),
	(126, NULL, NULL, 'created', 'App\\Models\\Skill', 26, '[]', '{"description":"Laundry","created_by":1,"updated_by":1,"status":"active","archived":0,"id":26}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:43:49', '2025-07-02 02:43:49'),
	(127, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 44, '[]', '{"skill_id":26,"UserID":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":44}', 'http://10.25.1.130:8000/api/skills', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:43:49', '2025-07-02 02:43:49'),
	(128, NULL, NULL, 'updated', 'App\\Models\\Jobs', 208, '{"requirements":"[2, 3]"}', '{"requirements":"[2,3]"}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:43:56', '2025-07-02 02:43:56'),
	(129, NULL, NULL, 'created', 'App\\Models\\JobSkill', 24, '[]', '{"job_id":"208","skill_id":10,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":24}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:43:56', '2025-07-02 02:43:56'),
	(130, NULL, NULL, 'created', 'App\\Models\\JobSkill', 25, '[]', '{"job_id":"208","skill_id":26,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":25}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:43:56', '2025-07-02 02:43:56'),
	(131, NULL, NULL, 'updated', 'App\\Models\\Jobs', 208, '{"placeOfAssignmentText":null,"requirements":"[2, 3]"}', '{"placeOfAssignmentText":"CARAGA Regional Hospital, Roxas Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[2,3]"}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:44:22', '2025-07-02 02:44:22'),
	(132, NULL, NULL, 'created', 'App\\Models\\JobSkill', 26, '[]', '{"job_id":"208","skill_id":3,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":26}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:44:22', '2025-07-02 02:44:22'),
	(133, NULL, NULL, 'created', 'App\\Models\\JobSkill', 27, '[]', '{"job_id":"208","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":27}', 'http://10.25.1.130:8000/api/jobs/208', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:44:22', '2025-07-02 02:44:22'),
	(134, NULL, NULL, 'created', 'App\\Models\\JobSkill', 28, '[]', '{"job_id":"211","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":28}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(135, NULL, NULL, 'created', 'App\\Models\\JobSkill', 29, '[]', '{"job_id":"211","skill_id":3,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":29}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(136, NULL, NULL, 'created', 'App\\Models\\JobSkill', 30, '[]', '{"job_id":"211","skill_id":1,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":30}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(137, NULL, NULL, 'created', 'App\\Models\\JobSkill', 31, '[]', '{"job_id":"211","skill_id":10,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":31}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(138, NULL, NULL, 'created', 'App\\Models\\JobSkill', 32, '[]', '{"job_id":"211","skill_id":7,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":32}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(139, NULL, NULL, 'created', 'App\\Models\\JobSkill', 33, '[]', '{"job_id":"211","skill_id":5,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":33}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(140, NULL, NULL, 'created', 'App\\Models\\JobSkill', 34, '[]', '{"job_id":"211","skill_id":6,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":34}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:06', '2025-07-02 02:47:06'),
	(141, NULL, NULL, 'created', 'App\\Models\\JobSkill', 35, '[]', '{"job_id":"211","skill_id":3,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":35}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:35', '2025-07-02 02:47:35'),
	(142, NULL, NULL, 'created', 'App\\Models\\JobSkill', 36, '[]', '{"job_id":"211","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":36}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:47:35', '2025-07-02 02:47:35'),
	(143, NULL, NULL, 'created', 'App\\Models\\JobSkill', 37, '[]', '{"job_id":"211","skill_id":3,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":37}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:56:02', '2025-07-02 02:56:02'),
	(144, NULL, NULL, 'created', 'App\\Models\\JobSkill', 38, '[]', '{"job_id":"211","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":38}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:56:02', '2025-07-02 02:56:02'),
	(145, NULL, NULL, 'created', 'App\\Models\\JobSkill', 39, '[]', '{"job_id":"211","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":39}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:56:02', '2025-07-02 02:56:02'),
	(146, NULL, NULL, 'created', 'App\\Models\\JobSkill', 40, '[]', '{"job_id":"211","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":40}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:56:13', '2025-07-02 02:56:13'),
	(147, NULL, NULL, 'created', 'App\\Models\\JobSkill', 41, '[]', '{"job_id":"211","skill_id":11,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":41}', 'http://10.25.1.130:8000/api/jobs/211', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:56:13', '2025-07-02 02:56:13'),
	(148, NULL, NULL, 'created', 'App\\Models\\JobSkill', 42, '[]', '{"job_id":"209","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":42}', 'http://10.25.1.130:8000/api/jobs/209', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:57:29', '2025-07-02 02:57:29'),
	(149, NULL, NULL, 'updated', 'App\\Models\\Jobs', 209, '{"requirements":"[8]"}', '{"requirements":"[4,3]"}', 'http://10.25.1.130:8000/api/jobs/209', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:57:59', '2025-07-02 02:57:59'),
	(150, NULL, NULL, 'created', 'App\\Models\\JobSkill', 43, '[]', '{"job_id":"209","skill_id":25,"created_by":1,"updated_by":1,"status":"active","archived":0,"id":43}', 'http://10.25.1.130:8000/api/jobs/209', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 02:57:59', '2025-07-02 02:57:59'),
	(151, NULL, NULL, 'created', 'App\\Models\\Bid', 25, '[]', '{"UserID":2,"job_id":211,"bid_amount":"800","proposed_duration":"1","created_by":2,"updated_by":2,"status":"active","archived":0,"id":25}', 'http://10.25.1.130:8000/api/bids', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:05:03', '2025-07-02 04:05:03'),
	(152, NULL, NULL, 'deleted', 'App\\Models\\Bid', 25, '{"id":25,"job_id":211,"UserID":2,"proposed_duration":"1","bid_amount":"800.00","description":null,"isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":2,"updated_by":2,"status":"active","archived":0}', '[]', 'http://10.25.1.130:8000/api/bids/25/withdraw', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:05:18', '2025-07-02 04:05:18'),
	(153, NULL, NULL, 'created', 'App\\Models\\Bid', 26, '[]', '{"UserID":2,"job_id":211,"bid_amount":"800","proposed_duration":"3PM only","created_by":2,"updated_by":2,"status":"active","archived":0,"id":26}', 'http://10.25.1.130:8000/api/bids', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:07:52', '2025-07-02 04:07:52'),
	(154, NULL, NULL, 'updated', 'App\\Models\\Bid', 26, '{"ApplicationStatus":null}', '{"ApplicationStatus":"The employee has seen your application."}', 'http://10.25.1.130:8000/api/bids/jobs/workers/26', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:08:56', '2025-07-02 04:08:56'),
	(155, NULL, NULL, 'created', 'App\\Models\\Chats', 28, '[]', '{"sender_id":2,"receiver_id":2,"from":"auto","message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":28}', 'http://10.25.1.130:8000/api/bids/jobs/workers/26', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:08:56', '2025-07-02 04:08:56'),
	(156, NULL, NULL, 'deleted', 'App\\Models\\Bid', 26, '{"id":26,"job_id":211,"UserID":2,"proposed_duration":"3PM only","bid_amount":"800.00","description":null,"isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":2,"updated_by":2,"status":"active","archived":0}', '[]', 'http://10.25.1.130:8000/api/bids/26/withdraw', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:37:59', '2025-07-02 04:37:59'),
	(157, NULL, NULL, 'updated', 'App\\Models\\Bid', 11, '{"ApplicationStatus":null}', '{"ApplicationStatus":"The employee has seen your application."}', 'http://10.25.1.130:8000/api/bids/jobs/workers/11', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:46:27', '2025-07-02 04:46:27'),
	(158, NULL, NULL, 'created', 'App\\Models\\Chats', 29, '[]', '{"sender_id":11,"receiver_id":11,"from":"auto","message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":29}', 'http://10.25.1.130:8000/api/bids/jobs/workers/11', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:46:27', '2025-07-02 04:46:27'),
	(159, NULL, NULL, 'created', 'App\\Models\\Chats', 30, '[]', '{"sender_id":11,"receiver_id":11,"message":"maam","attachment_url":null,"attachment_type":null,"id":30}', 'http://10.25.1.130:8000/api/chats', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:03', '2025-07-02 04:50:03'),
	(160, NULL, NULL, 'updated', 'App\\Models\\Bid', 11, '{"ApplicationStatus":"The employee has seen your application."}', '{"ApplicationStatus":"Rejected"}', 'http://10.25.1.130:8000/api/bids/status/11/Rejected', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:10', '2025-07-02 04:50:10'),
	(161, NULL, NULL, 'created', 'App\\Models\\Chats', 31, '[]', '{"sender_id":11,"receiver_id":11,"from":"auto","message":"We regret to inform you that your application has been rejected.","attachment_url":null,"attachment_type":null,"id":31}', 'http://10.25.1.130:8000/api/bids/status/11/Rejected', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:10', '2025-07-02 04:50:10'),
	(162, NULL, NULL, 'updated', 'App\\Models\\Jobs', 205, '{"requirements":"[1, 2]","updated_by":1}', '{"requirements":"[1,2]","updated_by":11}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:28', '2025-07-02 04:50:28'),
	(163, NULL, NULL, 'created', 'App\\Models\\JobSkill', 44, '[]', '{"job_id":"205","skill_id":3,"created_by":11,"updated_by":11,"status":"active","archived":0,"id":44}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:28', '2025-07-02 04:50:28'),
	(164, NULL, NULL, 'created', 'App\\Models\\JobSkill', 45, '[]', '{"job_id":"205","skill_id":1,"created_by":11,"updated_by":11,"status":"active","archived":0,"id":45}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:50:28', '2025-07-02 04:50:28'),
	(165, NULL, NULL, 'updated', 'App\\Models\\Jobs', 205, '{"placeOfAssignmentText":null,"requirements":"[1, 2]"}', '{"placeOfAssignmentText":"DM Avenue, Purok 3, San Jose, Dinagat Islands, Caraga, 8427, Philippines","requirements":"[1,2]"}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:51:08', '2025-07-02 04:51:08'),
	(166, NULL, NULL, 'created', 'App\\Models\\JobSkill', 46, '[]', '{"job_id":"205","skill_id":3,"created_by":11,"updated_by":11,"status":"active","archived":0,"id":46}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:51:08', '2025-07-02 04:51:08'),
	(167, NULL, NULL, 'created', 'App\\Models\\JobSkill', 47, '[]', '{"job_id":"205","skill_id":1,"created_by":11,"updated_by":11,"status":"active","archived":0,"id":47}', 'http://10.25.1.130:8000/api/jobs/205', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:51:08', '2025-07-02 04:51:08'),
	(168, NULL, NULL, 'created', 'App\\Models\\Chats', 32, '[]', '{"sender_id":11,"receiver_id":2,"message":"sir","attachment_url":null,"attachment_type":null,"id":32}', 'http://10.25.1.130:8000/api/chats', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:58:02', '2025-07-02 04:58:02'),
	(169, NULL, NULL, 'created', 'App\\Models\\Chats', 33, '[]', '{"sender_id":2,"receiver_id":11,"message":"Yes?","attachment_url":null,"attachment_type":null,"id":33}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:58:13', '2025-07-02 04:58:13'),
	(170, NULL, NULL, 'created', 'App\\Models\\Chats', 34, '[]', '{"sender_id":11,"receiver_id":2,"message":"etytyftyurdtuty","attachment_url":null,"attachment_type":null,"id":34}', 'http://10.25.1.130:8000/api/chats', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 04:58:21', '2025-07-02 04:58:21'),
	(171, NULL, NULL, 'created', 'App\\Models\\Chats', 35, '[]', '{"sender_id":2,"receiver_id":11,"message":"Hhahhahhahaha..unsa?","attachment_url":null,"attachment_type":null,"id":35}', 'http://10.25.1.130:8000/api/chats', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 04:58:27', '2025-07-02 04:58:27'),
	(172, NULL, NULL, 'created', 'App\\Models\\Bid', 27, '[]', '{"UserID":2,"job_id":211,"bid_amount":"750","proposed_duration":"1","created_by":2,"updated_by":2,"status":"active","archived":0,"id":27}', 'http://10.25.1.130:8000/api/bids', '10.25.1.139', 'okhttp/4.9.2', NULL, '2025-07-02 05:03:29', '2025-07-02 05:03:29'),
	(173, NULL, NULL, 'updated', 'App\\Models\\Bid', 27, '{"ApplicationStatus":null}', '{"ApplicationStatus":"The employee has seen your application."}', 'http://10.25.1.130:8000/api/bids/jobs/workers/27', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:07:56', '2025-07-02 05:07:56'),
	(174, NULL, NULL, 'created', 'App\\Models\\Chats', 36, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":36}', 'http://10.25.1.130:8000/api/bids/jobs/workers/27', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:07:56', '2025-07-02 05:07:56'),
	(175, NULL, NULL, 'updated', 'App\\Models\\Bid', 27, '{"ApplicationStatus":"The employee has seen your application."}', '{"ApplicationStatus":"shortlisted"}', 'http://10.25.1.130:8000/api/bids/status/27/shortlisted', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:08:46', '2025-07-02 05:08:46'),
	(176, NULL, NULL, 'created', 'App\\Models\\Chats', 37, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"Good news! You have been shortlisted. Please wait for further instructions.","attachment_url":null,"attachment_type":null,"id":37}', 'http://10.25.1.130:8000/api/bids/status/27/shortlisted', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:08:46', '2025-07-02 05:08:46'),
	(177, NULL, NULL, 'updated', 'App\\Models\\Bid', 27, '{"ApplicationStatus":"shortlisted","dateHired":null}', '{"ApplicationStatus":"Hired","dateHired":"2025-07-02 13:10:56"}', 'http://10.25.1.130:8000/api/bids/status/27/Hired', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:10:56', '2025-07-02 05:10:56'),
	(178, NULL, NULL, 'created', 'App\\Models\\Chats', 38, '[]', '{"sender_id":1,"receiver_id":2,"from":"auto","message":"Congratulations! You have been hired for the position.","attachment_url":null,"attachment_type":null,"id":38}', 'http://10.25.1.130:8000/api/bids/status/27/Hired', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:10:56', '2025-07-02 05:10:56'),
	(179, NULL, NULL, 'created', 'App\\Models\\Review', 2, '[]', '{"BidID":27,"reviewer_id":1,"reviewee_id":2,"rating":3,"comment":"puluho","created_by":1,"updated_by":1,"status":"active","archived":0,"id":2}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:11:38', '2025-07-02 05:11:38'),
	(180, NULL, NULL, 'updated', 'App\\Models\\Bid', 27, '{"isReviewed":null}', '{"isReviewed":1}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:11:38', '2025-07-02 05:11:38'),
	(181, NULL, NULL, 'updated', 'App\\Models\\SkilledWorker', 1, '{"rating":"5.00"}', '{"rating":"4.0000"}', 'http://10.25.1.130:8000/api/bids/reviews', '10.25.1.213', 'okhttp/4.9.2', NULL, '2025-07-02 05:11:38', '2025-07-02 05:11:38'),
	(182, NULL, NULL, 'created', 'App\\Models\\Bid', 28, '[]', '{"UserID":5,"job_id":211,"bid_amount":"750","proposed_duration":"1","created_by":5,"updated_by":5,"status":"active","archived":0,"id":28}', 'https://app.lakemainit-biodiversity.com/api/bids', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:48:04', '2025-07-03 03:48:04'),
	(183, NULL, NULL, 'created', 'App\\Models\\Workers', 4, '[]', '{"UserID":"5","Nationality":"Filipino","fullName":"Antonio Jr. L. Piloton","nickname":"Ju.","dob":"1998-02-04","gender":"Male","civilStatus":"Single","created_by":5,"updated_by":5,"status":"active","archived":0,"id":4}', 'https://app.lakemainit-biodiversity.com/api/user/5', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:50:32', '2025-07-03 03:50:32'),
	(184, NULL, NULL, 'updated', 'App\\Models\\Workers', 4, '{"nickname":"Ju."}', '{"nickname":"Jun"}', 'https://app.lakemainit-biodiversity.com/api/user/5', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:50:43', '2025-07-03 03:50:43'),
	(185, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 3, '[]', '{"RequirementID":"1","UserID":"5","FilePath":"user_files\\/5\\/1\\/gGQlbwvLsqKvSL3FTukSCcpstim5qyBUrijPSdX6.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":3}', 'https://app.lakemainit-biodiversity.com/api/user/5/1/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:51:05', '2025-07-03 03:51:05'),
	(186, NULL, NULL, 'created', 'App\\Models\\Skill', 27, '[]', '{"description":"Rrtt","created_by":5,"updated_by":5,"status":"active","archived":0,"id":27}', 'https://app.lakemainit-biodiversity.com/api/skills', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:55:23', '2025-07-03 03:55:23'),
	(187, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 45, '[]', '{"skill_id":27,"UserID":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":45}', 'https://app.lakemainit-biodiversity.com/api/skills', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 03:55:23', '2025-07-03 03:55:23'),
	(188, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 46, '[]', '{"UserID":5,"skill_id":3,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":46}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:06:44', '2025-07-03 04:06:44'),
	(189, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 47, '[]', '{"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":47}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:06:49', '2025-07-03 04:06:49'),
	(190, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 48, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":48}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:06:51', '2025-07-03 04:06:51'),
	(191, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 49, '[]', '{"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":49}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:11', '2025-07-03 04:07:11'),
	(192, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 50, '[]', '{"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":50}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:12', '2025-07-03 04:07:12'),
	(193, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 50, '{"id":50,"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:31', '2025-07-03 04:07:31'),
	(194, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 47, '{"id":47,"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:34', '2025-07-03 04:07:34'),
	(195, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 48, '{"id":48,"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:35', '2025-07-03 04:07:35'),
	(196, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 49, '{"id":49,"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:36', '2025-07-03 04:07:36'),
	(197, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 46, '{"id":46,"UserID":5,"skill_id":3,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:38', '2025-07-03 04:07:38'),
	(198, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 51, '[]', '{"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":51}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:40', '2025-07-03 04:07:40'),
	(199, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 52, '[]', '{"UserID":5,"skill_id":3,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":52}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:07:43', '2025-07-03 04:07:43'),
	(200, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 53, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":53}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:08:54', '2025-07-03 04:08:54'),
	(201, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 54, '[]', '{"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":54}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:08:56', '2025-07-03 04:08:56'),
	(202, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 53, '{"id":53,"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:08:58', '2025-07-03 04:08:58'),
	(203, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 55, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":55}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:09:58', '2025-07-03 04:09:58'),
	(204, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 56, '[]', '{"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":56}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:10:00', '2025-07-03 04:10:00'),
	(205, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 45, '{"id":45,"UserID":5,"skill_id":27,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 04:10:02', '2025-07-03 04:10:02'),
	(206, NULL, NULL, 'created', 'App\\Models\\Chats', 39, '[]', '{"sender_id":5,"receiver_id":1,"message":"Hi maam","attachment_url":null,"attachment_type":null,"id":39}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:40:51', '2025-07-03 06:40:51'),
	(207, NULL, NULL, 'created', 'App\\Models\\Chats', 40, '[]', '{"sender_id":5,"receiver_id":1,"message":"*sir \\ud83d\\ude02\\ud83d\\ude02","attachment_url":null,"attachment_type":null,"id":40}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:40:59', '2025-07-03 06:40:59'),
	(208, NULL, NULL, 'created', 'App\\Models\\Chats', 41, '[]', '{"sender_id":5,"receiver_id":1,"message":"Sir","attachment_url":null,"attachment_type":null,"id":41}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:42:05', '2025-07-03 06:42:05'),
	(209, NULL, NULL, 'updated', 'App\\Models\\Jobs', 106, '{"due_date":"2025-06-23 08:20:02","start_date":"2025-06-22","rate_type":"hourly","placeOfAssignmentText":null,"requirements":null,"updated_by":1}', '{"due_date":"2025-07-04 00:20:00","start_date":"2025-07-06","rate_type":"daily","placeOfAssignmentText":"Pio Castro Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[7]","updated_by":4}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:45:50', '2025-07-03 06:45:50'),
	(210, NULL, NULL, 'created', 'App\\Models\\JobSkill', 48, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":48}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:45:50', '2025-07-03 06:45:50'),
	(211, NULL, NULL, 'created', 'App\\Models\\JobSkill', 49, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":49}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:45:50', '2025-07-03 06:45:50'),
	(212, NULL, NULL, 'created', 'App\\Models\\Bid', 29, '[]', '{"UserID":5,"job_id":106,"bid_amount":"374.54","proposed_duration":"11monh","created_by":5,"updated_by":5,"status":"active","archived":0,"id":29}', 'https://app.lakemainit-biodiversity.com/api/bids', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:46:28', '2025-07-03 06:46:28'),
	(213, NULL, NULL, 'updated', 'App\\Models\\Bid', 29, '{"ApplicationStatus":null}', '{"ApplicationStatus":"The employee has seen your application."}', 'https://app.lakemainit-biodiversity.com/api/bids/jobs/workers/29', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:46:34', '2025-07-03 06:46:34'),
	(214, NULL, NULL, 'created', 'App\\Models\\Chats', 42, '[]', '{"sender_id":4,"receiver_id":5,"from":"auto","message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":42}', 'https://app.lakemainit-biodiversity.com/api/bids/jobs/workers/29', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:46:34', '2025-07-03 06:46:34'),
	(215, NULL, NULL, 'created', 'App\\Models\\Chats', 43, '[]', '{"sender_id":5,"receiver_id":4,"message":"Hi po","attachment_url":null,"attachment_type":null,"id":43}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:47:33', '2025-07-03 06:47:33'),
	(216, NULL, NULL, 'created', 'App\\Models\\Chats', 44, '[]', '{"sender_id":4,"receiver_id":5,"message":"yyes?","attachment_url":null,"attachment_type":null,"id":44}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:47:44', '2025-07-03 06:47:44'),
	(217, NULL, NULL, 'updated', 'App\\Models\\Bid', 29, '{"ApplicationStatus":"The employee has seen your application."}', '{"ApplicationStatus":"shortlisted"}', 'https://app.lakemainit-biodiversity.com/api/bids/status/29/shortlisted', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:47:58', '2025-07-03 06:47:58'),
	(218, NULL, NULL, 'created', 'App\\Models\\Chats', 45, '[]', '{"sender_id":4,"receiver_id":5,"from":"auto","message":"Good news! You have been shortlisted. Please wait for further instructions.","attachment_url":null,"attachment_type":null,"id":45}', 'https://app.lakemainit-biodiversity.com/api/bids/status/29/shortlisted', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:47:58', '2025-07-03 06:47:58'),
	(219, NULL, NULL, 'updated', 'App\\Models\\Bid', 29, '{"ApplicationStatus":"shortlisted","dateHired":null}', '{"ApplicationStatus":"Hired","dateHired":"2025-07-03 06:49:04"}', 'https://app.lakemainit-biodiversity.com/api/bids/status/29/Hired', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:49:04', '2025-07-03 06:49:04'),
	(220, NULL, NULL, 'created', 'App\\Models\\Chats', 46, '[]', '{"sender_id":4,"receiver_id":5,"from":"auto","message":"Congratulations! You have been hired for the position.","attachment_url":null,"attachment_type":null,"id":46}', 'https://app.lakemainit-biodiversity.com/api/bids/status/29/Hired', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:49:04', '2025-07-03 06:49:04'),
	(221, NULL, NULL, 'created', 'App\\Models\\Review', 3, '[]', '{"BidID":29,"reviewer_id":4,"reviewee_id":5,"rating":4,"comment":"hahahahahahah","created_by":4,"updated_by":4,"status":"active","archived":0,"id":3}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:49:38', '2025-07-03 06:49:38'),
	(222, NULL, NULL, 'updated', 'App\\Models\\Bid', 29, '{"isReviewed":null}', '{"isReviewed":1}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:49:38', '2025-07-03 06:49:38'),
	(223, NULL, NULL, 'created', 'App\\Models\\SkilledWorker', 2, '[]', '{"user_id":5,"rating":"4.0000","created_by":4,"updated_by":4,"status":"active","archived":0,"id":2}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 06:49:38', '2025-07-03 06:49:38'),
	(224, NULL, NULL, 'deleted', 'App\\Models\\Bid', 28, '{"id":28,"job_id":211,"UserID":5,"proposed_duration":"1","bid_amount":"750.00","description":null,"isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/bids/28/withdraw', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:29:26', '2025-07-03 07:29:26'),
	(225, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 56, '{"id":56,"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:22', '2025-07-03 07:30:22'),
	(226, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 51, '{"id":51,"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:24', '2025-07-03 07:30:24'),
	(227, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 54, '{"id":54,"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:26', '2025-07-03 07:30:26'),
	(228, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 57, '[]', '{"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":57}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:28', '2025-07-03 07:30:28'),
	(229, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 58, '[]', '{"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":58}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:30', '2025-07-03 07:30:30'),
	(230, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 59, '[]', '{"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":59}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 07:30:31', '2025-07-03 07:30:31'),
	(231, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 58, '{"id":58,"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 09:42:47', '2025-07-03 09:42:47'),
	(232, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 59, '{"id":59,"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 09:42:48', '2025-07-03 09:42:48'),
	(233, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 57, '{"id":57,"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 09:42:49', '2025-07-03 09:42:49'),
	(234, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 55, '{"id":55,"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 09:42:50', '2025-07-03 09:42:50'),
	(235, NULL, NULL, 'created', 'App\\Models\\Workers', 5, '[]', '{"UserID":"6","Nationality":"Filipino","fullName":"Mary Jane Libay","nickname":"prett\\u00ffyy","dob":"1999-06-27","gender":"Female","civilStatus":"Single","created_by":6,"updated_by":6,"status":"active","archived":0,"id":5}', 'https://app.lakemainit-biodiversity.com/api/user/6', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-03 09:57:18', '2025-07-03 09:57:18'),
	(236, NULL, NULL, 'created', 'App\\Models\\Bid', 30, '[]', '{"UserID":5,"job_id":211,"bid_amount":"800","proposed_duration":"1 day","created_by":5,"updated_by":5,"status":"active","archived":0,"id":30}', 'https://app.lakemainit-biodiversity.com/api/bids', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:23:30', '2025-07-03 10:23:30'),
	(237, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 60, '[]', '{"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":60}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:28:03', '2025-07-03 10:28:03'),
	(238, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 61, '[]', '{"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":61}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:28:04', '2025-07-03 10:28:04'),
	(239, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 62, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":62}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:28:05', '2025-07-03 10:28:05'),
	(240, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 63, '[]', '{"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":63}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:28:05', '2025-07-03 10:28:05'),
	(241, NULL, NULL, 'created', 'App\\Models\\Chats', 47, '[]', '{"sender_id":5,"receiver_id":4,"message":"Thank you po \\ud83d\\ude2d\\ud83d\\ude2d","attachment_url":null,"attachment_type":null,"id":47}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2672:52c7:a0d8:a4ff:fed9:ee6d', 'okhttp/4.9.2', NULL, '2025-07-03 10:29:39', '2025-07-03 10:29:39'),
	(242, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 64, '[]', '{"UserID":9,"skill_id":1,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":64}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:36:35', '2025-07-03 11:36:35'),
	(243, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 65, '[]', '{"UserID":9,"skill_id":4,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":65}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:36:37', '2025-07-03 11:36:37'),
	(244, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 66, '[]', '{"UserID":9,"skill_id":3,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":66}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:36:39', '2025-07-03 11:36:39'),
	(245, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 67, '[]', '{"UserID":9,"skill_id":2,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":67}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:36:41', '2025-07-03 11:36:41'),
	(246, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 68, '[]', '{"UserID":9,"skill_id":5,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":68}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:36:41', '2025-07-03 11:36:41'),
	(247, NULL, NULL, 'created', 'App\\Models\\Skill', 28, '[]', '{"description":"Computer technician","created_by":9,"updated_by":9,"status":"active","archived":0,"id":28}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:38:47', '2025-07-03 11:38:47'),
	(248, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 69, '[]', '{"skill_id":28,"UserID":9,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":69}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:38:47', '2025-07-03 11:38:47'),
	(249, NULL, NULL, 'created', 'App\\Models\\Skill', 29, '[]', '{"description":"Computer technician","created_by":9,"updated_by":9,"status":"active","archived":0,"id":29}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:38:56', '2025-07-03 11:38:56'),
	(250, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 70, '[]', '{"skill_id":29,"UserID":9,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":70}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:38:56', '2025-07-03 11:38:56'),
	(251, NULL, NULL, 'created', 'App\\Models\\Skill', 30, '[]', '{"description":"Computer technician","created_by":9,"updated_by":9,"status":"active","archived":0,"id":30}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:39:02', '2025-07-03 11:39:02'),
	(252, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 71, '[]', '{"skill_id":30,"UserID":9,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":71}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:39:02', '2025-07-03 11:39:02'),
	(253, NULL, NULL, 'created', 'App\\Models\\Skill', 31, '[]', '{"description":"Computer technician","created_by":9,"updated_by":9,"status":"active","archived":0,"id":31}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:39:02', '2025-07-03 11:39:02'),
	(254, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 72, '[]', '{"skill_id":31,"UserID":9,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":72}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:39:02', '2025-07-03 11:39:02'),
	(255, NULL, NULL, 'deleted', 'App\\Models\\Bid', 5, '{"id":5,"job_id":5,"UserID":9,"proposed_duration":"0","bid_amount":"500.00","description":"Install new flooring","isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":0,"updated_by":0,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/bids/5/withdraw', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:41:18', '2025-07-03 11:41:18'),
	(256, NULL, NULL, 'deleted', 'App\\Models\\Bid', 9, '{"id":9,"job_id":9,"UserID":9,"proposed_duration":"0","bid_amount":"600.00","description":"Fix roof leak","isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":0,"updated_by":0,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/bids/9/withdraw', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:41:23', '2025-07-03 11:41:23'),
	(257, NULL, NULL, 'created', 'App\\Models\\Workers', 6, '[]', '{"UserID":"9","Nationality":"Filipinos","fullName":"Robert N. Zabala","nickname":"Roro","dob":"2002-04-10","gender":"Male","civilStatus":"Single","created_by":9,"updated_by":9,"status":"active","archived":0,"id":6}', 'https://app.lakemainit-biodiversity.com/api/user/9', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:42:22', '2025-07-03 11:42:22'),
	(258, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 71, '{"id":71,"UserID":9,"skill_id":30,"created_by":9,"updated_by":9,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:42:36', '2025-07-03 11:42:36'),
	(259, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 70, '{"id":70,"UserID":9,"skill_id":29,"created_by":9,"updated_by":9,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:42:37', '2025-07-03 11:42:37'),
	(260, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 72, '{"id":72,"UserID":9,"skill_id":31,"created_by":9,"updated_by":9,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:42:40', '2025-07-03 11:42:40'),
	(261, NULL, NULL, 'created', 'App\\Models\\Skill', 32, '[]', '{"description":"IT Support","created_by":9,"updated_by":9,"status":"active","archived":0,"id":32}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:43:17', '2025-07-03 11:43:17'),
	(262, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 73, '[]', '{"skill_id":32,"UserID":9,"created_by":9,"updated_by":9,"status":"active","archived":0,"id":73}', 'https://app.lakemainit-biodiversity.com/api/skills', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:43:17', '2025-07-03 11:43:17'),
	(263, NULL, NULL, 'created', 'App\\Models\\Bid', 31, '[]', '{"UserID":9,"job_id":211,"bid_amount":"2000000","proposed_duration":"1 day","created_by":9,"updated_by":9,"status":"active","archived":0,"id":31}', 'https://app.lakemainit-biodiversity.com/api/bids', '175.176.85.122', 'okhttp/4.9.2', NULL, '2025-07-03 11:44:14', '2025-07-03 11:44:14'),
	(264, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 74, '[]', '{"UserID":6,"skill_id":2,"created_by":6,"updated_by":6,"status":"active","archived":0,"id":74}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:52:13', '2025-07-03 14:52:13'),
	(265, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 75, '[]', '{"UserID":6,"skill_id":1,"created_by":6,"updated_by":6,"status":"active","archived":0,"id":75}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:52:14', '2025-07-03 14:52:14'),
	(266, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 76, '[]', '{"UserID":6,"skill_id":3,"created_by":6,"updated_by":6,"status":"active","archived":0,"id":76}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:52:15', '2025-07-03 14:52:15'),
	(267, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 77, '[]', '{"UserID":6,"skill_id":4,"created_by":6,"updated_by":6,"status":"active","archived":0,"id":77}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:52:16', '2025-07-03 14:52:16'),
	(268, NULL, NULL, 'created', 'App\\Models\\Bid', 32, '[]', '{"UserID":6,"job_id":211,"bid_amount":"800","proposed_duration":"1","created_by":6,"updated_by":6,"status":"active","archived":0,"id":32}', 'https://app.lakemainit-biodiversity.com/api/bids', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:52:41', '2025-07-03 14:52:41'),
	(269, NULL, NULL, 'created', 'App\\Models\\Chats', 48, '[]', '{"sender_id":6,"receiver_id":1,"message":"Hi sir","attachment_url":null,"attachment_type":null,"id":48}', 'https://app.lakemainit-biodiversity.com/api/chats', '110.54.205.184', 'okhttp/4.9.2', NULL, '2025-07-03 14:53:10', '2025-07-03 14:53:10'),
	(270, NULL, NULL, 'created', 'App\\Models\\Skill', 33, '[]', '{"description":"Cleaner","created_by":10,"updated_by":10,"status":"active","archived":0,"id":33}', 'https://app.lakemainit-biodiversity.com/api/skills', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:32:13', '2025-07-03 15:32:13'),
	(271, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 78, '[]', '{"skill_id":33,"UserID":10,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":78}', 'https://app.lakemainit-biodiversity.com/api/skills', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:32:13', '2025-07-03 15:32:13'),
	(272, NULL, NULL, 'created', 'App\\Models\\Jobs', 212, '[]', '{"title":"LF: Cleaners para kuman Sabado ug Dominggo","description":"None","due_date":"2025-07-04 15:29:00","start_date":"2025-07-05","end_date":"2025-07-06","rate_amount":"750","rate_type":"daily","requirements":"[1]","homeowner_id":10,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":212}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:32:51', '2025-07-03 15:32:51'),
	(273, NULL, NULL, 'created', 'App\\Models\\JobSkill', 50, '[]', '{"job_id":212,"skill_id":33,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":50}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:32:51', '2025-07-03 15:32:51'),
	(274, NULL, NULL, 'created', 'App\\Models\\JobSkill', 51, '[]', '{"job_id":212,"skill_id":20,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":51}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:32:51', '2025-07-03 15:32:51'),
	(275, NULL, NULL, 'updated', 'App\\Models\\Jobs', 212, '{"due_date":"2025-07-04 15:29:00","placeOfAssignmentText":null}', '{"due_date":"2025-07-04 07:29:00","placeOfAssignmentText":"Capalayan-Espina-Navarro Road, Cayutan, Cagniog, Surigao del Norte, Caraga, 8400, Philippines"}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:34:07', '2025-07-03 15:34:07'),
	(276, NULL, NULL, 'created', 'App\\Models\\JobSkill', 52, '[]', '{"job_id":"212","skill_id":33,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":52}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:34:07', '2025-07-03 15:34:07'),
	(277, NULL, NULL, 'created', 'App\\Models\\JobSkill', 53, '[]', '{"job_id":"212","skill_id":20,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":53}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:34:07', '2025-07-03 15:34:07'),
	(278, NULL, NULL, 'created', 'App\\Models\\Bid', 33, '[]', '{"UserID":5,"job_id":212,"bid_amount":"750","proposed_duration":"1","created_by":5,"updated_by":5,"status":"active","archived":0,"id":33}', 'https://app.lakemainit-biodiversity.com/api/bids', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:37:24', '2025-07-03 15:37:24'),
	(279, NULL, NULL, 'deleted', 'App\\Models\\Bid', 33, '{"id":33,"job_id":212,"UserID":5,"proposed_duration":"1","bid_amount":"750.00","description":null,"isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/bids/33/withdraw', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:37:38', '2025-07-03 15:37:38'),
	(280, NULL, NULL, 'created', 'App\\Models\\Bid', 34, '[]', '{"UserID":5,"job_id":212,"bid_amount":"750","proposed_duration":"1","created_by":5,"updated_by":5,"status":"active","archived":0,"id":34}', 'https://app.lakemainit-biodiversity.com/api/bids', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:37:41', '2025-07-03 15:37:41'),
	(281, NULL, NULL, 'created', 'App\\Models\\Chats', 49, '[]', '{"sender_id":5,"receiver_id":10,"message":"Hi po","attachment_url":null,"attachment_type":null,"id":49}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:37:47', '2025-07-03 15:37:47'),
	(282, NULL, NULL, 'created', 'App\\Models\\Chats', 50, '[]', '{"sender_id":5,"receiver_id":10,"message":"\\ud83d\\ude02\\ud83d\\ude02\\ud83d\\ude05\\ud83d\\ude18\\ud83d\\ude18\\ud83d\\ude18\\ud83d\\ude18","attachment_url":null,"attachment_type":null,"id":50}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:37:53', '2025-07-03 15:37:53'),
	(283, NULL, NULL, 'deleted', 'App\\Models\\Bid', 34, '{"id":34,"job_id":212,"UserID":5,"proposed_duration":"1","bid_amount":"750.00","description":null,"isReviewed":null,"ApplicationStatus":null,"dateHired":null,"isPaid":null,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/bids/34/withdraw', '2001:fd8:2672:52c7:48e:c8ff:fe00:8587', 'okhttp/4.9.2', NULL, '2025-07-03 15:38:37', '2025-07-03 15:38:37'),
	(284, NULL, NULL, 'updated', 'App\\Models\\Jobs', 212, '{"due_date":"2025-07-04 07:29:00","placeOfAssignmentText":"Capalayan-Espina-Navarro Road, Cayutan, Cagniog, Surigao del Norte, Caraga, 8400, Philippines"}', '{"due_date":"2025-07-03 23:29:00","placeOfAssignmentText":"Espina Street, Espina Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines"}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:16:38', '2025-07-03 16:16:38'),
	(285, NULL, NULL, 'created', 'App\\Models\\JobSkill', 54, '[]', '{"job_id":"212","skill_id":33,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":54}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:16:38', '2025-07-03 16:16:38'),
	(286, NULL, NULL, 'created', 'App\\Models\\JobSkill', 55, '[]', '{"job_id":"212","skill_id":20,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":55}', 'https://app.lakemainit-biodiversity.com/api/jobs/212', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:16:38', '2025-07-03 16:16:38'),
	(287, NULL, NULL, 'created', 'App\\Models\\Jobs', 213, '[]', '{"title":"Maghimo ug Logo","description":"Hhsb","due_date":"2025-07-03 23:17:00","start_date":"2025-07-08","end_date":"2025-07-09","rate_amount":"1500","rate_type":"Fixed","requirements":"[1,3]","homeowner_id":10,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":213}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:18:29', '2025-07-03 16:18:29'),
	(288, NULL, NULL, 'created', 'App\\Models\\JobSkill', 56, '[]', '{"job_id":213,"skill_id":16,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":56}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:18:29', '2025-07-03 16:18:29'),
	(289, NULL, NULL, 'created', 'App\\Models\\Jobs', 214, '[]', '{"title":"Maghimo ug Logo","description":"Hhsb","due_date":"2025-07-03 23:17:00","start_date":"2025-07-08","end_date":"2025-07-09","rate_amount":"1500","rate_type":"Fixed","requirements":"[1,3]","homeowner_id":10,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":214}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:18:45', '2025-07-03 16:18:45'),
	(290, NULL, NULL, 'created', 'App\\Models\\JobSkill', 57, '[]', '{"job_id":214,"skill_id":16,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":57}', 'https://app.lakemainit-biodiversity.com/api/jobs', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:18:45', '2025-07-03 16:18:45'),
	(291, NULL, NULL, 'updated', 'App\\Models\\Jobs', 214, '{"due_date":"2025-07-03 23:17:00","placeOfAssignmentText":null}', '{"due_date":"2025-07-03 15:17:00","placeOfAssignmentText":"Silop, Surigao del Norte, Caraga, Philippines"}', 'https://app.lakemainit-biodiversity.com/api/jobs/214', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:20:29', '2025-07-03 16:20:29'),
	(292, NULL, NULL, 'created', 'App\\Models\\JobSkill', 58, '[]', '{"job_id":"214","skill_id":16,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":58}', 'https://app.lakemainit-biodiversity.com/api/jobs/214', '2001:fd8:2898:d7c3:a0ec:36ff:fe11:fef', 'okhttp/4.9.2', NULL, '2025-07-03 16:20:29', '2025-07-03 16:20:29'),
	(293, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 9, '[]', '{"RequirementID":"5","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/5\\/CviHeO3NzXdzTfcWUNDIr0HGKbRjmBkC0mtS3HwG.pdf","FileName":"grades_2014-00996_1751101285760.pdf","size":242795,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":9}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 03:04:38', '2025-07-04 03:04:38'),
	(294, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 10, '[]', '{"RequirementID":"6","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/6\\/9ehelD6c0CZVC4XkeSyyZd41wj69rzKHAxfop1Mj.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":10}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 03:04:43', '2025-07-04 03:04:43'),
	(295, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 11, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/SGLlMWU7SE3t9cTWOf6ZpThuiWROvnLLC83wySI9.pdf","FileName":"BSIT-Interview-Result.pdf","size":4323873,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":11}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 03:04:49', '2025-07-04 03:04:49'),
	(296, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 12, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/Y595owtCtz2Oky25wfOPFqFIr1cGFImpbf0EdlcW.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":12}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 04:55:01', '2025-07-04 04:55:01'),
	(297, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 13, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/HTOGiQv0iw3MadVELmQVX9E3opEBbF3ymmjhDkPW.pdf","FileName":"BSIT-Interview-Result.pdf","size":4323873,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":13}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 04:57:36', '2025-07-04 04:57:36'),
	(298, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 1, '[]', '{"RequirementID":"6","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/6\\/KgrpiSnXobab08RHg00Wa3XqA0AQqSDe4VSoi1sw.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":1}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:00:26', '2025-07-04 05:00:26'),
	(299, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 2, '[]', '{"RequirementID":"5","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/5\\/Q18jBocbsDUWdcDzf3UKhYdg3GDeka47uuFnNszO.pdf","FileName":"Recommended-Titles.pdf","size":63073,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":2}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:01:45', '2025-07-04 05:01:45'),
	(300, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 3, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/5kGJSvG9Nc0TCq3WNLZq0lXF0R6vYC7Gk58sA45z.pdf","FileName":"Recommended-Titles.pdf","size":63073,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":3}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:02:04', '2025-07-04 05:02:04'),
	(301, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 4, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/JlXXCMtM7W8gxlMGNeDBCaMibe3FKy9Z846v63Xp.pdf","FileName":"E-Gov.pdf","size":1032034,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":4}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:18:17', '2025-07-04 05:18:17'),
	(302, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 5, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/qQE279vpL79qTgTI1HooNHFehI68qVbUTBACPpU7.pdf","FileName":"1680001269286_20250520200156.pdf","size":382952,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":5}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:18:36', '2025-07-04 05:18:36'),
	(303, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 6, '[]', '{"RequirementID":"6","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/6\\/LWRaNciJnDGLfHhVgq8zpWWQtXoTMgvQA1TFqGqc.pdf","FileName":"E-GovernmentAct.pdf","size":41493,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":6}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:22:26', '2025-07-04 05:22:26'),
	(304, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 1, '[]', '{"RequirementID":"5","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/5\\/HC02skPeDOmo2I7uooCO1wYFaBzxfzd2wspPvLGo.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":1}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:23:11', '2025-07-04 05:23:11'),
	(305, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 4, '[]', '{"RequirementID":"1","UserID":"5","FilePath":"user_files\\/5\\/1\\/dmJkRI6MI41q3RESDEqe4KB69rSiySBX8d640cF7.pdf","FileName":"Recommended-Titles.pdf","size":63073,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":4}', 'https://app.lakemainit-biodiversity.com/api/user/5/1/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 05:33:21', '2025-07-04 05:33:21'),
	(306, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 62, '{"id":62,"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:30', '2025-07-04 06:13:30'),
	(307, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 79, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":79}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:36', '2025-07-04 06:13:36'),
	(308, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 52, '{"id":52,"UserID":5,"skill_id":3,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:40', '2025-07-04 06:13:40'),
	(309, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 61, '{"id":61,"UserID":5,"skill_id":2,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:41', '2025-07-04 06:13:41'),
	(310, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 63, '{"id":63,"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:42', '2025-07-04 06:13:42'),
	(311, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 79, '{"id":79,"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:43', '2025-07-04 06:13:43'),
	(312, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 60, '{"id":60,"UserID":5,"skill_id":1,"created_by":5,"updated_by":5,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:45', '2025-07-04 06:13:45'),
	(313, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 80, '[]', '{"UserID":5,"skill_id":5,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":80}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:48', '2025-07-04 06:13:48'),
	(314, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 81, '[]', '{"UserID":5,"skill_id":4,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":81}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:13:52', '2025-07-04 06:13:52'),
	(315, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 82, '[]', '{"UserID":5,"skill_id":3,"created_by":5,"updated_by":5,"status":"active","archived":0,"id":82}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 06:15:12', '2025-07-04 06:15:12'),
	(316, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 4, '{"id":4,"RequirementID":1,"UserID":5,"FileName":"Recommended-Titles.pdf","FilePath":"user_files\\/5\\/1\\/dmJkRI6MI41q3RESDEqe4KB69rSiySBX8d640cF7.pdf","size":63073,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/4', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 07:04:13', '2025-07-04 07:04:13'),
	(317, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 5, '[]', '{"RequirementID":"3","UserID":"5","FilePath":"user_files\\/5\\/3\\/WjcScfwvUxnwEG2yEzGjQ3DruQ7xRpww76hSM1PY.pdf","FileName":"ZipGrade50QuestionV2.pdf","size":73585,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":5}', 'https://app.lakemainit-biodiversity.com/api/user/5/3/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 07:05:10', '2025-07-04 07:05:10'),
	(318, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 6, '[]', '{"RequirementID":"2","UserID":"5","FilePath":"user_files\\/5\\/2\\/gKnGhjJGEwFl7e1J84RaqkaJVaihQK2EhbOKxIIZ.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":6}', 'https://app.lakemainit-biodiversity.com/api/user/5/2/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:08:06', '2025-07-04 15:08:06'),
	(319, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 5, '{"id":5,"RequirementID":3,"UserID":5,"FileName":"ZipGrade50QuestionV2.pdf","FilePath":"user_files\\/5\\/3\\/WjcScfwvUxnwEG2yEzGjQ3DruQ7xRpww76hSM1PY.pdf","size":73585,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/5', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:08:49', '2025-07-04 15:08:49'),
	(320, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 6, '{"id":6,"RequirementID":2,"UserID":5,"FileName":"Certificate_of_Registration.pdf","FilePath":"user_files\\/5\\/2\\/gKnGhjJGEwFl7e1J84RaqkaJVaihQK2EhbOKxIIZ.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/6', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:08:52', '2025-07-04 15:08:52'),
	(321, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 7, '[]', '{"RequirementID":"4","UserID":"5","FilePath":"user_files\\/5\\/4\\/X3CJxRn75F2wWCAxqyI36nEdcLMmo63UkgNED3ct.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":7}', 'https://app.lakemainit-biodiversity.com/api/user/5/4/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:12:47', '2025-07-04 15:12:47'),
	(322, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 7, '{"id":7,"RequirementID":4,"UserID":5,"FileName":"Certificate_of_Registration.pdf","FilePath":"user_files\\/5\\/4\\/X3CJxRn75F2wWCAxqyI36nEdcLMmo63UkgNED3ct.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/7', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:12:55', '2025-07-04 15:12:55'),
	(323, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 8, '[]', '{"RequirementID":"4","UserID":"5","FilePath":"user_files\\/5\\/4\\/MD02DxaCMQBf4rHkdyHoS9HGvkz89NbuXOpnan8P.pdf","FileName":"grades_2014-00996_1751101285760.pdf","size":242795,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":8}', 'https://app.lakemainit-biodiversity.com/api/user/5/4/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:13:35', '2025-07-04 15:13:35'),
	(324, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 8, '{"id":8,"RequirementID":4,"UserID":5,"FileName":"grades_2014-00996_1751101285760.pdf","FilePath":"user_files\\/5\\/4\\/MD02DxaCMQBf4rHkdyHoS9HGvkz89NbuXOpnan8P.pdf","size":242795,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/8', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:13:41', '2025-07-04 15:13:41'),
	(325, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 9, '[]', '{"RequirementID":"5","UserID":"5","FilePath":"user_files\\/5\\/5\\/z8nuN54oCG6i2W6x3fGp3tHXfwNIaYy88J6dWLf9.pdf","FileName":"evaluation_2014-00996_1750842411223.pdf","size":219623,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":9}', 'https://app.lakemainit-biodiversity.com/api/user/5/5/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:13:58', '2025-07-04 15:13:58'),
	(326, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 9, '{"id":9,"RequirementID":5,"UserID":5,"FileName":"evaluation_2014-00996_1750842411223.pdf","FilePath":"user_files\\/5\\/5\\/z8nuN54oCG6i2W6x3fGp3tHXfwNIaYy88J6dWLf9.pdf","size":219623,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/9', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:14:03', '2025-07-04 15:14:03'),
	(327, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 10, '[]', '{"RequirementID":"2","UserID":"5","FilePath":"user_files\\/5\\/2\\/FQh2wiaGgUcB7qylBPKw02aomyS8B11lUW34nNqA.pdf","FileName":"ZipGrade50QuestionV2.pdf","size":73585,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":10}', 'https://app.lakemainit-biodiversity.com/api/user/5/2/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:14:27', '2025-07-04 15:14:27'),
	(328, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 10, '{"id":10,"RequirementID":2,"UserID":5,"FileName":"ZipGrade50QuestionV2.pdf","FilePath":"user_files\\/5\\/2\\/FQh2wiaGgUcB7qylBPKw02aomyS8B11lUW34nNqA.pdf","size":73585,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/10', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:15:11', '2025-07-04 15:15:11'),
	(329, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 11, '[]', '{"RequirementID":"1","UserID":"5","FilePath":"user_files\\/5\\/1\\/XCzNAAlVRLwmaNqNHzqemxfMMKsMZmTWaesuYoG4.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":11}', 'https://app.lakemainit-biodiversity.com/api/user/5/1/upload', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:15:18', '2025-07-04 15:15:18'),
	(330, NULL, NULL, 'deleted', 'App\\Models\\WorkerAttachments', 11, '{"id":11,"RequirementID":1,"UserID":5,"FileName":"Certificate_of_Registration.pdf","FilePath":"user_files\\/5\\/1\\/XCzNAAlVRLwmaNqNHzqemxfMMKsMZmTWaesuYoG4.pdf","size":299993,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"deleted_at":null}', '[]', 'https://app.lakemainit-biodiversity.com/api/user/files/11', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:15:27', '2025-07-04 15:15:27'),
	(331, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 2, '[]', '{"RequirementID":"1","UserID":"5","JobID":"211","FilePath":"user_files\\/5\\/submission\\/211\\/1\\/8PgcOWTSWp2QfF7TliZLut3kjXG0Jfz34frZr5QL.pdf","FileName":"grades_2014-00996_1751101285760.pdf","size":242795,"type":"application\\/pdf","created_by":5,"updated_by":5,"status":"active","archived":0,"id":2}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:16:41', '2025-07-04 15:16:41'),
	(332, NULL, NULL, 'created', 'App\\Models\\Bid', 1, '[]', '{"UserID":5,"job_id":211,"bid_amount":"800","proposed_duration":"1","created_by":5,"updated_by":5,"status":"active","archived":0,"id":1}', 'https://app.lakemainit-biodiversity.com/api/bids', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 15:16:52', '2025-07-04 15:16:52'),
	(333, NULL, NULL, 'created', 'App\\Models\\JobSkill', 59, '[]', '{"job_id":"214","skill_id":16,"created_by":10,"updated_by":10,"status":"active","archived":0,"id":59}', 'https://app.lakemainit-biodiversity.com/api/jobs/214', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 18:15:38', '2025-07-04 18:15:38'),
	(334, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 83, '[]', '{"UserID":18,"skill_id":1,"created_by":18,"updated_by":18,"status":"active","archived":0,"id":83}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 20:43:28', '2025-07-04 20:43:28'),
	(335, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 84, '[]', '{"UserID":18,"skill_id":2,"created_by":18,"updated_by":18,"status":"active","archived":0,"id":84}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-04 20:43:29', '2025-07-04 20:43:29'),
	(336, NULL, NULL, 'created', 'App\\Models\\WorkerAttachments', 12, '[]', '{"RequirementID":"1","UserID":"18","FilePath":"user_files\\/18\\/1\\/pilEOTGT4mEbQiW1QGEctIYdeFrplER1TsyVCLMa.pdf","FileName":"Certificate_of_Registration.pdf","size":299993,"type":"application\\/pdf","created_by":18,"updated_by":18,"status":"active","archived":0,"id":12}', 'https://app.lakemainit-biodiversity.com/api/user/18/1/upload', '2001:fd8:2657:e901:ecf5:2fff:fe5f:833f', 'okhttp/4.9.2', NULL, '2025-07-04 21:18:56', '2025-07-04 21:18:56'),
	(337, NULL, NULL, 'created', 'App\\Models\\Workers', 7, '[]', '{"UserID":"18","Nationality":"Filipino","fullName":"ANTONIO JR. PILOTON","nickname":"F.c","dob":"1998-02-04","gender":"Male","civilStatus":"Single","created_by":18,"updated_by":18,"status":"active","archived":0,"id":7}', 'https://app.lakemainit-biodiversity.com/api/user/18', '2001:fd8:2657:e901:ecf5:2fff:fe5f:833f', 'okhttp/4.9.2', NULL, '2025-07-04 21:21:09', '2025-07-04 21:21:09'),
	(338, NULL, NULL, 'updated', 'App\\Models\\Jobs', 106, '{"due_date":"2025-07-04 00:20:00","end_date":"2025-06-27"}', '{"due_date":"2025-07-06 00:20:00","end_date":"2025-07-08"}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:11:26', '2025-07-04 23:11:26'),
	(339, NULL, NULL, 'created', 'App\\Models\\JobSkill', 60, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":60}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:11:26', '2025-07-04 23:11:26'),
	(340, NULL, NULL, 'created', 'App\\Models\\JobSkill', 61, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":61}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:11:26', '2025-07-04 23:11:26'),
	(341, NULL, NULL, 'created', 'App\\Models\\JobRequirementsSubmission', 3, '[]', '{"RequirementID":"7","UserID":"6","JobID":"106","FilePath":"user_files\\/6\\/submission\\/106\\/7\\/rJrKws4SlcLBa3Fyn4ZKdmJWRfnNQLiy11yIXF1C.pdf","FileName":"LIBAY%2C%20JADE.pdf","size":1621514,"type":"application\\/pdf","created_by":6,"updated_by":6,"status":"active","archived":0,"id":3}', 'https://app.lakemainit-biodiversity.com/api/user/upload-requirement', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:15:33', '2025-07-04 23:15:33'),
	(342, NULL, NULL, 'created', 'App\\Models\\Bid', 2, '[]', '{"UserID":6,"job_id":106,"bid_amount":"374.54","proposed_duration":"2 days","created_by":6,"updated_by":6,"status":"active","archived":0,"id":2}', 'https://app.lakemainit-biodiversity.com/api/bids', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:15:44', '2025-07-04 23:15:44'),
	(343, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"ApplicationStatus":null}', '{"ApplicationStatus":"The employee has seen your application."}', 'https://app.lakemainit-biodiversity.com/api/bids/jobs/workers/2', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:15:53', '2025-07-04 23:15:53'),
	(344, NULL, NULL, 'created', 'App\\Models\\Chats', 51, '[]', '{"sender_id":4,"receiver_id":6,"from":"auto","message":"The employee has seen your application.","attachment_url":null,"attachment_type":null,"id":51}', 'https://app.lakemainit-biodiversity.com/api/bids/jobs/workers/2', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:15:53', '2025-07-04 23:15:53'),
	(345, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"ApplicationStatus":"The employee has seen your application."}', '{"ApplicationStatus":"shortlisted"}', 'https://app.lakemainit-biodiversity.com/api/bids/status/2/shortlisted', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:16:36', '2025-07-04 23:16:36'),
	(346, NULL, NULL, 'created', 'App\\Models\\Chats', 52, '[]', '{"sender_id":4,"receiver_id":6,"from":"auto","message":"Good news! You have been shortlisted. Please wait for further instructions.","attachment_url":null,"attachment_type":null,"id":52}', 'https://app.lakemainit-biodiversity.com/api/bids/status/2/shortlisted', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:16:36', '2025-07-04 23:16:36'),
	(347, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"ApplicationStatus":"shortlisted","dateHired":null}', '{"ApplicationStatus":"Hired","dateHired":"2025-07-04 23:18:04"}', 'https://app.lakemainit-biodiversity.com/api/bids/status/2/Hired', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:18:04', '2025-07-04 23:18:04'),
	(348, NULL, NULL, 'created', 'App\\Models\\Chats', 53, '[]', '{"sender_id":4,"receiver_id":6,"from":"auto","message":"Congratulations! You have been hired for the position.","attachment_url":null,"attachment_type":null,"id":53}', 'https://app.lakemainit-biodiversity.com/api/bids/status/2/Hired', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-04 23:18:04', '2025-07-04 23:18:04'),
	(349, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 02:34:42', '2025-07-05 02:34:42'),
	(350, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 02:59:55', '2025-07-05 02:59:55'),
	(351, NULL, NULL, 'created', 'App\\Models\\Review', 4, '[]', '{"BidID":2,"reviewer_id":4,"reviewee_id":6,"rating":4,"comment":"Hhhhaaha","created_by":4,"updated_by":4,"status":"active","archived":0,"id":4}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:05:12', '2025-07-05 03:05:12'),
	(352, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isReviewed":null}', '{"isReviewed":1}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:05:12', '2025-07-05 03:05:12'),
	(353, NULL, NULL, 'created', 'App\\Models\\SkilledWorker', 3, '[]', '{"user_id":6,"rating":"4.0000","created_by":4,"updated_by":4,"status":"active","archived":0,"id":3}', 'https://app.lakemainit-biodiversity.com/api/bids/reviews', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:05:12', '2025-07-05 03:05:12'),
	(354, NULL, NULL, 'updated', 'App\\Models\\Jobs', 145, '{"placeOfAssignmentText":null,"requirements":null,"updated_by":5}', '{"placeOfAssignmentText":"Cayutan, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[4]","updated_by":4}', 'https://app.lakemainit-biodiversity.com/api/jobs/145', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:06:54', '2025-07-05 03:06:54'),
	(355, NULL, NULL, 'created', 'App\\Models\\JobSkill', 62, '[]', '{"job_id":"145","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":62}', 'https://app.lakemainit-biodiversity.com/api/jobs/145', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:06:54', '2025-07-05 03:06:54'),
	(356, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:18:51', '2025-07-05 03:18:51'),
	(357, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:24:24', '2025-07-05 03:24:24'),
	(358, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:25:09', '2025-07-05 03:25:09'),
	(359, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 03:49:34', '2025-07-05 03:49:34'),
	(360, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 04:03:52', '2025-07-05 04:03:52'),
	(361, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 04:15:44', '2025-07-05 04:15:44'),
	(362, NULL, NULL, 'created', 'App\\Models\\WorkerSkill', 85, '[]', '{"UserID":6,"skill_id":5,"created_by":6,"updated_by":6,"status":"active","archived":0,"id":85}', 'https://app.lakemainit-biodiversity.com/api/skills/worker/add', '110.54.170.66', 'okhttp/4.9.2', NULL, '2025-07-05 04:26:17', '2025-07-05 04:26:17'),
	(363, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 84, '{"id":84,"UserID":18,"skill_id":2,"created_by":18,"updated_by":18,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '110.54.169.124', 'okhttp/4.9.2', NULL, '2025-07-05 07:54:27', '2025-07-05 07:54:27'),
	(364, NULL, NULL, 'deleted', 'App\\Models\\WorkerSkill', 83, '{"id":83,"UserID":18,"skill_id":1,"created_by":18,"updated_by":18,"status":"active","archived":0}', '[]', 'https://app.lakemainit-biodiversity.com/api/skills/worker/remove', '110.54.169.124', 'okhttp/4.9.2', NULL, '2025-07-05 07:54:29', '2025-07-05 07:54:29'),
	(365, NULL, NULL, 'created', 'App\\Models\\JobSkill', 63, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":63}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 08:20:10', '2025-07-05 08:20:10'),
	(366, NULL, NULL, 'created', 'App\\Models\\JobSkill', 64, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":64}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 08:20:10', '2025-07-05 08:20:10'),
	(367, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 08:24:26', '2025-07-05 08:24:26'),
	(368, NULL, NULL, 'updated', 'App\\Models\\Bid', 2, '{"isPaid":null}', '{"isPaid":1}', 'https://app.lakemainit-biodiversity.com/api/payment/charge/logs', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 08:28:25', '2025-07-05 08:28:25'),
	(369, NULL, NULL, 'created', 'App\\Models\\JobSkill', 65, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":65}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 09:20:04', '2025-07-05 09:20:04'),
	(370, NULL, NULL, 'created', 'App\\Models\\JobSkill', 66, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":66}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 09:20:04', '2025-07-05 09:20:04'),
	(371, NULL, NULL, 'created', 'App\\Models\\Chats', 54, '[]', '{"sender_id":4,"receiver_id":5,"message":"Good morning","attachment_url":null,"attachment_type":null,"id":54}', 'https://app.lakemainit-biodiversity.com/api/chats', '27.110.161.98', 'okhttp/4.9.2', NULL, '2025-07-05 09:32:12', '2025-07-05 09:32:12'),
	(372, NULL, NULL, 'updated', 'App\\Models\\Jobs', 48, '{"rate_type":"fixed","rate_amount":"555.57","placeOfAssignmentText":null,"requirements":null,"updated_by":3}', '{"rate_type":"daily","rate_amount":"600","placeOfAssignmentText":"Cayutan, Surigao City, Surigao del Norte, Caraga, 8400, Philippines","requirements":"[1]","updated_by":4}', 'https://app.lakemainit-biodiversity.com/api/jobs/48', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 21:23:34', '2025-07-05 21:23:34'),
	(373, NULL, NULL, 'created', 'App\\Models\\JobSkill', 67, '[]', '{"job_id":"48","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":67}', 'https://app.lakemainit-biodiversity.com/api/jobs/48', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 21:23:34', '2025-07-05 21:23:34'),
	(374, NULL, NULL, 'created', 'App\\Models\\Chats', 55, '[]', '{"sender_id":4,"receiver_id":6,"message":"Hi \\ud83d\\ude18\\ud83d\\ude18\\ud83d\\ude18","attachment_url":null,"attachment_type":null,"id":55}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 22:25:01', '2025-07-05 22:25:01'),
	(375, NULL, NULL, 'created', 'App\\Models\\Chats', 56, '[]', '{"sender_id":6,"receiver_id":4,"message":"Hello","attachment_url":null,"attachment_type":null,"id":56}', 'https://app.lakemainit-biodiversity.com/api/chats', '64.226.60.36', 'okhttp/4.9.2', NULL, '2025-07-05 22:25:21', '2025-07-05 22:25:21'),
	(376, NULL, NULL, 'created', 'App\\Models\\Chats', 57, '[]', '{"sender_id":4,"receiver_id":6,"message":"I love you","attachment_url":null,"attachment_type":null,"id":57}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 22:25:27', '2025-07-05 22:25:27'),
	(377, NULL, NULL, 'created', 'App\\Models\\Chats', 58, '[]', '{"sender_id":4,"receiver_id":6,"message":"Hahahah","attachment_url":null,"attachment_type":null,"id":58}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 22:25:34', '2025-07-05 22:25:34'),
	(378, NULL, NULL, 'created', 'App\\Models\\Chats', 59, '[]', '{"sender_id":6,"receiver_id":4,"message":"Ijate you","attachment_url":null,"attachment_type":null,"id":59}', 'https://app.lakemainit-biodiversity.com/api/chats', '64.226.60.36', 'okhttp/4.9.2', NULL, '2025-07-05 22:25:34', '2025-07-05 22:25:34'),
	(379, NULL, NULL, 'created', 'App\\Models\\Chats', 60, '[]', '{"sender_id":4,"receiver_id":6,"message":"Hhahahhhaha","attachment_url":null,"attachment_type":null,"id":60}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 22:26:20', '2025-07-05 22:26:20'),
	(380, NULL, NULL, 'created', 'App\\Models\\Chats', 61, '[]', '{"sender_id":4,"receiver_id":6,"message":"\\ud83e\\udd23\\ud83e\\udd23\\ud83d\\ude02\\ud83d\\ude02\\ud83d\\ude02","attachment_url":null,"attachment_type":null,"id":61}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:b4f8:b8ff:fe38:fc8f', 'okhttp/4.9.2', NULL, '2025-07-05 22:26:35', '2025-07-05 22:26:35'),
	(381, NULL, NULL, 'created', 'App\\Models\\JobSkill', 68, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":68}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:14:44', '2025-07-06 11:14:44'),
	(382, NULL, NULL, 'created', 'App\\Models\\JobSkill', 69, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":69}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:14:44', '2025-07-06 11:14:44'),
	(383, NULL, NULL, 'updated', 'App\\Models\\Jobs', 106, '{"start_date":"2025-07-06","rate_type":"daily","requirements":"[7]"}', '{"start_date":"2025-07-07","rate_type":"Fixed","requirements":"[7,1,2,3,4]"}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:02', '2025-07-06 11:17:02'),
	(384, NULL, NULL, 'created', 'App\\Models\\JobSkill', 70, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":70}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:02', '2025-07-06 11:17:02'),
	(385, NULL, NULL, 'created', 'App\\Models\\JobSkill', 71, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":71}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:02', '2025-07-06 11:17:02'),
	(386, NULL, NULL, 'created', 'App\\Models\\JobSkill', 72, '[]', '{"job_id":"106","skill_id":16,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":72}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:02', '2025-07-06 11:17:02'),
	(387, NULL, NULL, 'updated', 'App\\Models\\Jobs', 106, '{"requirements":"[7,1,2,3,4]"}', '{"requirements":"[8]"}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:12', '2025-07-06 11:17:12'),
	(388, NULL, NULL, 'created', 'App\\Models\\JobSkill', 73, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":73}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:12', '2025-07-06 11:17:12'),
	(389, NULL, NULL, 'created', 'App\\Models\\JobSkill', 74, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":74}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:12', '2025-07-06 11:17:12'),
	(390, NULL, NULL, 'created', 'App\\Models\\JobSkill', 75, '[]', '{"job_id":"106","skill_id":16,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":75}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:12', '2025-07-06 11:17:12'),
	(391, NULL, NULL, 'updated', 'App\\Models\\Jobs', 106, '{"requirements":"[8]"}', '{"requirements":"[1,2,3,4,5,6,7]"}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:59', '2025-07-06 11:17:59'),
	(392, NULL, NULL, 'created', 'App\\Models\\JobSkill', 76, '[]', '{"job_id":"106","skill_id":3,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":76}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:59', '2025-07-06 11:17:59'),
	(393, NULL, NULL, 'created', 'App\\Models\\JobSkill', 77, '[]', '{"job_id":"106","skill_id":11,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":77}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:59', '2025-07-06 11:17:59'),
	(394, NULL, NULL, 'created', 'App\\Models\\JobSkill', 78, '[]', '{"job_id":"106","skill_id":16,"created_by":4,"updated_by":4,"status":"active","archived":0,"id":78}', 'https://app.lakemainit-biodiversity.com/api/jobs/106', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:17:59', '2025-07-06 11:17:59'),
	(395, NULL, NULL, 'created', 'App\\Models\\Chats', 62, '[]', '{"sender_id":4,"receiver_id":6,"message":"Hehhehheh","attachment_url":null,"attachment_type":null,"id":62}', 'https://app.lakemainit-biodiversity.com/api/chats', '2001:fd8:2675:1f0b:94d8:edff:fe8c:ab88', 'okhttp/4.9.2', NULL, '2025-07-06 11:18:21', '2025-07-06 11:18:21');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;

-- Dumping structure for table etrabaho.bids
CREATE TABLE IF NOT EXISTS `bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `proposed_duration` varchar(100) NOT NULL DEFAULT '',
  `bid_amount` decimal(10,2) NOT NULL,
  `description` text,
  `isReviewed` int(11) DEFAULT NULL,
  `ApplicationStatus` varchar(200) DEFAULT NULL,
  `dateHired` datetime DEFAULT NULL,
  `isPaid` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_id` (`job_id`),
  KEY `skilled_worker_id` (`UserID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.bids: 2 rows
DELETE FROM `bids`;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` (`id`, `job_id`, `UserID`, `proposed_duration`, `bid_amount`, `description`, `isReviewed`, `ApplicationStatus`, `dateHired`, `isPaid`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 211, 5, '1', 800.00, NULL, NULL, NULL, NULL, NULL, 5, 5, '2025-07-04 15:16:52', '2025-07-04 15:16:52', 'active', 0, NULL),
	(2, 106, 6, '2 days', 845.03, NULL, 1, 'Hired', '2025-07-04 23:18:04', 1, 6, 6, '2025-07-04 23:15:44', '2025-07-05 08:28:24', 'active', 0, NULL);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;

-- Dumping structure for table etrabaho.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.cache: 0 rows
DELETE FROM `cache`;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- Dumping structure for table etrabaho.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.cache_locks: 0 rows
DELETE FROM `cache_locks`;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

-- Dumping structure for table etrabaho.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.failed_jobs: 0 rows
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table etrabaho.favjob
CREATE TABLE IF NOT EXISTS `favjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `JobID` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table etrabaho.favjob: 0 rows
DELETE FROM `favjob`;
/*!40000 ALTER TABLE `favjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `favjob` ENABLE KEYS */;

-- Dumping structure for table etrabaho.homeowners
CREATE TABLE IF NOT EXISTS `homeowners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `PhoneNumber` varchar(12) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.homeowners: 10 rows
DELETE FROM `homeowners`;
/*!40000 ALTER TABLE `homeowners` DISABLE KEYS */;
INSERT INTO `homeowners` (`id`, `user_id`, `PhoneNumber`, `address`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 1, '', '123 Main St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(2, 3, '', '456 Elm St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(3, 5, '', '789 Oak St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(4, 6, '', '321 Maple St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(5, 8, '', '901 Pine St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(6, 1, '', '123 Main St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(7, 3, '', '456 Elm St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(8, 5, '', '789 Oak St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(9, 6, '', '321 Maple St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL),
	(10, 8, '', '901 Pine St', 0, 0, NULL, '2025-06-24 04:40:06', 'active', 0, NULL);
/*!40000 ALTER TABLE `homeowners` ENABLE KEYS */;

-- Dumping structure for table etrabaho.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.jobs: 16 rows
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
	(1, 'default', '{"uuid":"ec5e69ba-0cac-41c6-b762-407a6795c37b","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:41;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751524925,"delay":null}', 0, NULL, 1751524925, 1751524925),
	(2, 'default', '{"uuid":"7fbf820d-91ca-4cce-b90d-b49cd538273a","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:43;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751525253,"delay":null}', 0, NULL, 1751525253, 1751525253),
	(3, 'default', '{"uuid":"00d96dda-9891-4a2e-99da-5b8e599b03ab","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:44;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751525264,"delay":null}', 0, NULL, 1751525264, 1751525264),
	(4, 'default', '{"uuid":"dd5c0e09-a218-41d6-a083-7714e58cf0b2","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:47;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751538579,"delay":null}', 0, NULL, 1751538579, 1751538579),
	(5, 'default', '{"uuid":"f2fe13e4-2a98-4acc-a5f8-b5194ffc8e2e","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:48;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751554390,"delay":null}', 0, NULL, 1751554390, 1751554390),
	(6, 'default', '{"uuid":"97efedc3-50b3-43ea-ad46-469e6540ba87","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:49;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751557067,"delay":null}', 0, NULL, 1751557067, 1751557067),
	(7, 'default', '{"uuid":"77790234-2be1-47d4-bbec-0f6b946e1368","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:50;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751557073,"delay":null}', 0, NULL, 1751557073, 1751557073),
	(8, 'default', '{"uuid":"30551535-e1c2-447d-9fbd-91ff7a216de3","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:54;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751679132,"delay":null}', 0, NULL, 1751679132, 1751679132),
	(9, 'default', '{"uuid":"efed8141-1819-4509-9554-deb547be4937","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:55;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725501,"delay":null}', 0, NULL, 1751725501, 1751725501),
	(10, 'default', '{"uuid":"198dfbfd-00de-4348-9c44-b13c97d7c554","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:56;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725521,"delay":null}', 0, NULL, 1751725521, 1751725521),
	(11, 'default', '{"uuid":"1b2abd41-25df-4f8f-8d9f-be005fb23b2d","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:57;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725527,"delay":null}', 0, NULL, 1751725527, 1751725527),
	(12, 'default', '{"uuid":"05695154-9074-43f0-bda8-93eb944996f8","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:58;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725534,"delay":null}', 0, NULL, 1751725534, 1751725534),
	(13, 'default', '{"uuid":"c7ecb316-bb65-4da1-bf55-2f41a1e5c60b","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:59;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725534,"delay":null}', 0, NULL, 1751725534, 1751725534),
	(14, 'default', '{"uuid":"11865e9e-5128-48a4-a320-564ebdb6ba5f","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:60;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725580,"delay":null}', 0, NULL, 1751725580, 1751725580),
	(15, 'default', '{"uuid":"8b51595c-f320-43ef-8f38-0942b362f1d8","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:61;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751725595,"delay":null}', 0, NULL, 1751725595, 1751725595),
	(16, 'default', '{"uuid":"80253096-4433-4eb9-adb4-aab6d56d9e6a","displayName":"App\\\\Events\\\\MessageSent","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Broadcasting\\\\BroadcastEvent","command":"O:38:\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\":14:{s:5:\\"event\\";O:22:\\"App\\\\Events\\\\MessageSent\\":1:{s:7:\\"message\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:16:\\"App\\\\Models\\\\Chats\\";s:2:\\"id\\";i:62;s:9:\\"relations\\";a:0:{}s:10:\\"connection\\";s:5:\\"mysql\\";s:15:\\"collectionClass\\";N;}}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:7:\\"backoff\\";N;s:13:\\"maxExceptions\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;}"},"createdAt":1751771901,"delay":null}', 0, NULL, 1751771901, 1751771901);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table etrabaho.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.job_batches: 0 rows
DELETE FROM `job_batches`;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

-- Dumping structure for table etrabaho.job_requirements
CREATE TABLE IF NOT EXISTS `job_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `JobID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `AttachmentID` int(11) DEFAULT NULL,
  `RequirementID` int(11) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table etrabaho.job_requirements: 3 rows
DELETE FROM `job_requirements`;
/*!40000 ALTER TABLE `job_requirements` DISABLE KEYS */;
INSERT INTO `job_requirements` (`id`, `JobID`, `UserID`, `AttachmentID`, `RequirementID`, `FilePath`, `FileName`, `size`, `type`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 211, 5, NULL, 5, 'user_files/5/submission/211/5/HC02skPeDOmo2I7uooCO1wYFaBzxfzd2wspPvLGo.pdf', 'Certificate_of_Registration.pdf', 299993, 'application/pdf', 5, 5, '2025-07-04 05:23:11', '2025-07-04 05:23:11', 'active', 0, NULL),
	(2, 211, 5, NULL, 1, 'user_files/5/submission/211/1/8PgcOWTSWp2QfF7TliZLut3kjXG0Jfz34frZr5QL.pdf', 'grades_2014-00996_1751101285760.pdf', 242795, 'application/pdf', 5, 5, '2025-07-04 15:16:41', '2025-07-04 15:16:41', 'active', 0, NULL),
	(3, 106, 6, NULL, 7, 'user_files/6/submission/106/7/rJrKws4SlcLBa3Fyn4ZKdmJWRfnNQLiy11yIXF1C.pdf', 'LIBAY%2C%20JADE.pdf', 1621514, 'application/pdf', 6, 6, '2025-07-04 23:15:33', '2025-07-04 23:15:33', 'active', 0, NULL);
/*!40000 ALTER TABLE `job_requirements` ENABLE KEYS */;

-- Dumping structure for table etrabaho.job_skills
CREATE TABLE IF NOT EXISTS `job_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_id` (`job_id`),
  KEY `skill_id` (`skill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.job_skills: 76 rows
DELETE FROM `job_skills`;
/*!40000 ALTER TABLE `job_skills` DISABLE KEYS */;
INSERT INTO `job_skills` (`id`, `job_id`, `skill_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 1, 2, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(2, 2, 4, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(3, 3, 3, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(4, 4, 1, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(5, 5, 9, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(6, 6, 2, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(7, 7, 4, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(8, 8, 7, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(9, 9, 9, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(10, 10, 3, 0, 0, NULL, '2025-06-24 04:39:59', 'active', 0, NULL),
	(16, 211, 11, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(15, 211, 3, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(13, 211, 2, 1, 1, '2025-07-02 10:26:59', '2025-07-02 02:27:37', 'active', 0, '2025-07-02 02:27:37'),
	(14, 211, 9, 1, 1, '2025-07-02 10:26:59', '2025-07-02 02:27:37', 'active', 0, '2025-07-02 02:27:37'),
	(17, 211, 1, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(18, 211, 10, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(19, 211, 7, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(20, 211, 5, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(21, 211, 6, 1, 1, '2025-07-02 10:27:37', '2025-07-02 02:47:06', 'active', 0, '2025-07-02 02:47:06'),
	(22, 210, 11, 1, 1, '2025-07-02 10:39:17', '2025-07-02 02:41:51', 'active', 0, '2025-07-02 02:41:51'),
	(23, 210, 25, 1, 1, '2025-07-02 10:41:51', '2025-07-02 02:41:51', 'active', 0, NULL),
	(24, 208, 10, 1, 1, '2025-07-02 10:43:56', '2025-07-02 02:44:22', 'active', 0, '2025-07-02 02:44:22'),
	(25, 208, 26, 1, 1, '2025-07-02 10:43:56', '2025-07-02 02:44:22', 'active', 0, '2025-07-02 02:44:22'),
	(26, 208, 3, 1, 1, '2025-07-02 10:44:22', '2025-07-02 02:44:22', 'active', 0, NULL),
	(27, 208, 25, 1, 1, '2025-07-02 10:44:22', '2025-07-02 02:44:22', 'active', 0, NULL),
	(28, 211, 11, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(29, 211, 3, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(30, 211, 1, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(31, 211, 10, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(32, 211, 7, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(33, 211, 5, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(34, 211, 6, 1, 1, '2025-07-02 10:47:06', '2025-07-02 02:47:35', 'active', 0, '2025-07-02 02:47:35'),
	(35, 211, 3, 1, 1, '2025-07-02 10:47:35', '2025-07-02 02:56:02', 'active', 0, '2025-07-02 02:56:02'),
	(36, 211, 11, 1, 1, '2025-07-02 10:47:35', '2025-07-02 02:56:02', 'active', 0, '2025-07-02 02:56:02'),
	(37, 211, 3, 1, 1, '2025-07-02 10:56:02', '2025-07-02 02:56:13', 'active', 0, '2025-07-02 02:56:13'),
	(38, 211, 25, 1, 1, '2025-07-02 10:56:02', '2025-07-02 02:56:13', 'active', 0, '2025-07-02 02:56:13'),
	(39, 211, 11, 1, 1, '2025-07-02 10:56:02', '2025-07-02 02:56:13', 'active', 0, '2025-07-02 02:56:13'),
	(40, 211, 25, 1, 1, '2025-07-02 10:56:13', '2025-07-02 02:56:13', 'active', 0, NULL),
	(41, 211, 11, 1, 1, '2025-07-02 10:56:13', '2025-07-02 02:56:13', 'active', 0, NULL),
	(42, 209, 25, 1, 1, '2025-07-02 10:57:29', '2025-07-02 02:57:59', 'active', 0, '2025-07-02 02:57:59'),
	(43, 209, 25, 1, 1, '2025-07-02 10:57:59', '2025-07-02 02:57:59', 'active', 0, NULL),
	(44, 205, 3, 11, 11, '2025-07-02 12:50:28', '2025-07-02 04:51:08', 'active', 0, '2025-07-02 04:51:08'),
	(45, 205, 1, 11, 11, '2025-07-02 12:50:28', '2025-07-02 04:51:08', 'active', 0, '2025-07-02 04:51:08'),
	(46, 205, 3, 11, 11, '2025-07-02 12:51:08', '2025-07-02 04:51:08', 'active', 0, NULL),
	(47, 205, 1, 11, 11, '2025-07-02 12:51:08', '2025-07-02 04:51:08', 'active', 0, NULL),
	(48, 106, 3, 4, 4, '2025-07-03 06:45:50', '2025-07-04 23:11:26', 'active', 0, '2025-07-04 23:11:26'),
	(49, 106, 11, 4, 4, '2025-07-03 06:45:50', '2025-07-04 23:11:26', 'active', 0, '2025-07-04 23:11:26'),
	(50, 212, 33, 10, 10, '2025-07-03 15:32:51', '2025-07-03 15:34:07', 'active', 0, '2025-07-03 15:34:07'),
	(51, 212, 20, 10, 10, '2025-07-03 15:32:51', '2025-07-03 15:34:07', 'active', 0, '2025-07-03 15:34:07'),
	(52, 212, 33, 10, 10, '2025-07-03 15:34:07', '2025-07-03 16:16:38', 'active', 0, '2025-07-03 16:16:38'),
	(53, 212, 20, 10, 10, '2025-07-03 15:34:07', '2025-07-03 16:16:38', 'active', 0, '2025-07-03 16:16:38'),
	(54, 212, 33, 10, 10, '2025-07-03 16:16:38', '2025-07-03 16:16:38', 'active', 0, NULL),
	(55, 212, 20, 10, 10, '2025-07-03 16:16:38', '2025-07-03 16:16:38', 'active', 0, NULL),
	(56, 213, 16, 10, 10, '2025-07-03 16:18:29', '2025-07-03 16:18:29', 'active', 0, NULL),
	(57, 214, 16, 10, 10, '2025-07-03 16:18:45', '2025-07-03 16:20:29', 'active', 0, '2025-07-03 16:20:29'),
	(58, 214, 16, 10, 10, '2025-07-03 16:20:29', '2025-07-04 18:15:38', 'active', 0, '2025-07-04 18:15:38'),
	(59, 214, 16, 10, 10, '2025-07-04 18:15:38', '2025-07-04 18:15:38', 'active', 0, NULL),
	(60, 106, 3, 4, 4, '2025-07-04 23:11:26', '2025-07-05 08:20:10', 'active', 0, '2025-07-05 08:20:10'),
	(61, 106, 11, 4, 4, '2025-07-04 23:11:26', '2025-07-05 08:20:10', 'active', 0, '2025-07-05 08:20:10'),
	(62, 145, 3, 4, 4, '2025-07-05 03:06:54', '2025-07-05 03:06:54', 'active', 0, NULL),
	(63, 106, 3, 4, 4, '2025-07-05 08:20:10', '2025-07-05 09:20:04', 'active', 0, '2025-07-05 09:20:04'),
	(64, 106, 11, 4, 4, '2025-07-05 08:20:10', '2025-07-05 09:20:04', 'active', 0, '2025-07-05 09:20:04'),
	(65, 106, 3, 4, 4, '2025-07-05 09:20:04', '2025-07-06 11:14:44', 'active', 0, '2025-07-06 11:14:44'),
	(66, 106, 11, 4, 4, '2025-07-05 09:20:04', '2025-07-06 11:14:44', 'active', 0, '2025-07-06 11:14:44'),
	(67, 48, 3, 4, 4, '2025-07-05 21:23:34', '2025-07-05 21:23:34', 'active', 0, NULL),
	(68, 106, 3, 4, 4, '2025-07-06 11:14:44', '2025-07-06 11:17:02', 'active', 0, '2025-07-06 11:17:02'),
	(69, 106, 11, 4, 4, '2025-07-06 11:14:44', '2025-07-06 11:17:02', 'active', 0, '2025-07-06 11:17:02'),
	(70, 106, 3, 4, 4, '2025-07-06 11:17:02', '2025-07-06 11:17:12', 'active', 0, '2025-07-06 11:17:12'),
	(71, 106, 11, 4, 4, '2025-07-06 11:17:02', '2025-07-06 11:17:12', 'active', 0, '2025-07-06 11:17:12'),
	(72, 106, 16, 4, 4, '2025-07-06 11:17:02', '2025-07-06 11:17:12', 'active', 0, '2025-07-06 11:17:12'),
	(73, 106, 3, 4, 4, '2025-07-06 11:17:12', '2025-07-06 11:17:59', 'active', 0, '2025-07-06 11:17:59'),
	(74, 106, 11, 4, 4, '2025-07-06 11:17:12', '2025-07-06 11:17:59', 'active', 0, '2025-07-06 11:17:59'),
	(75, 106, 16, 4, 4, '2025-07-06 11:17:12', '2025-07-06 11:17:59', 'active', 0, '2025-07-06 11:17:59'),
	(76, 106, 3, 4, 4, '2025-07-06 11:17:59', '2025-07-06 11:17:59', 'active', 0, NULL),
	(77, 106, 11, 4, 4, '2025-07-06 11:17:59', '2025-07-06 11:17:59', 'active', 0, NULL),
	(78, 106, 16, 4, 4, '2025-07-06 11:17:59', '2025-07-06 11:17:59', 'active', 0, NULL);
/*!40000 ALTER TABLE `job_skills` ENABLE KEYS */;

-- Dumping structure for table etrabaho.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `from` varchar(10) DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `attachment_type` enum('image','file','video','audio') DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `conversation_id` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.messages: ~0 rows (approximately)
DELETE FROM `messages`;

-- Dumping structure for table etrabaho.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.migrations: 3 rows
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table etrabaho.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(125) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.model_has_permissions: 0 rows
DELETE FROM `model_has_permissions`;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table etrabaho.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(125) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.model_has_roles: 1 rows
DELETE FROM `model_has_roles`;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(9, 'App\\Models\\User', 4);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table etrabaho.otp
CREATE TABLE IF NOT EXISTS `otp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(16) DEFAULT NULL,
  `otp` varchar(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.otp: 0 rows
DELETE FROM `otp`;
/*!40000 ALTER TABLE `otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp` ENABLE KEYS */;

-- Dumping structure for table etrabaho.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.password_reset_tokens: 2 rows
DELETE FROM `password_reset_tokens`;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
	('rferol@ssct.edu.ph', '$2y$12$h3/nbKlaGRnYCxQ08wDqr.ab.I4Ff0PXSt9pq3HGKZEGr7rkg08Mi', '2025-06-20 03:07:02'),
	('apiloton1@ssct.edu.ph', '$2y$12$GupueSaeJrwc97bBXTGcD.ZL0H0zjUTexSex3BvoXD.ciOC1MElyu', '2025-06-20 03:21:05');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- Dumping structure for table etrabaho.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `BidID` int(10) DEFAULT NULL,
  `amount` decimal(10,6) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archived` tinyint(3) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.payments: 1 rows
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `user_id`, `BidID`, `amount`, `Remark`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(12, 6, 2, 7605.270000, 'success', NULL, '2025-07-05 08:28:24', '2025-07-05 08:28:24', NULL, NULL, NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Dumping structure for table etrabaho.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.permissions: 0 rows
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table etrabaho.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.personal_access_tokens: 117 rows
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(174, 'App\\Models\\User', 5, 'mobile', 'c0000bb788209c15b9bb86715e6a9f1bea3eb15a17718f3452b73b63e4d52733', '["*"]', '2025-07-03 04:32:39', NULL, '2025-07-03 03:46:31', '2025-07-03 04:32:39'),
	(175, 'App\\Models\\User', 5, 'mobile', '4928d6b18be17cb792fbd938d3ba49f7db0b4b9287a941b1e63ce9f36b88cc45', '["*"]', '2025-07-03 04:56:39', NULL, '2025-07-03 04:38:08', '2025-07-03 04:56:39'),
	(176, 'App\\Models\\User', 5, 'mobile', '8ec7583d5de61d5c767ccd0ad1d35e27e6777c6fea508f721fd8788328b7068f', '["*"]', '2025-07-03 10:18:56', NULL, '2025-07-03 06:40:40', '2025-07-03 10:18:56'),
	(177, 'App\\Models\\User', 4, 'mobile', '0a19e6fc0f30ca6d5205c23d1af53680a6a66326558bfa7acdda24bf0931cc4d', '["*"]', '2025-07-03 06:43:24', NULL, '2025-07-03 06:43:08', '2025-07-03 06:43:24'),
	(178, 'App\\Models\\User', 4, 'mobile', '81efed830743c767cef1af200fcda233f5adc3832f5082c013a1b4d8cf7b6934', '["*"]', '2025-07-03 06:44:23', NULL, '2025-07-03 06:43:43', '2025-07-03 06:44:23'),
	(179, 'App\\Models\\User', 4, 'mobile', 'ea4eb0dda4dd669ec9f5929a666247d5e30cffa622fe5e8fd49b577c74f0a24a', '["*"]', '2025-07-03 06:56:55', NULL, '2025-07-03 06:44:36', '2025-07-03 06:56:55'),
	(180, 'App\\Models\\User', 5, 'mobile', 'cb363674804b943eceb61977e9f2ed2ec4845312b83880589f470d1aaa24d89d', '["*"]', '2025-07-03 09:59:02', NULL, '2025-07-03 07:49:43', '2025-07-03 09:59:02'),
	(181, 'App\\Models\\User', 6, 'mobile', '70b47eb1d917e0396a46972410db37f52798d1d23e6a849b41090cb63aa9d06f', '["*"]', '2025-07-04 23:11:41', NULL, '2025-07-03 09:54:59', '2025-07-04 23:11:41'),
	(182, 'App\\Models\\User', 5, 'mobile', '8e7e5c9fab5466ddeebde1c4798ea31c46903690b4239b26f7c95b10846f1fa9', '["*"]', '2025-07-03 11:26:29', NULL, '2025-07-03 10:21:40', '2025-07-03 11:26:29'),
	(183, 'App\\Models\\User', 7, 'mobile', '2723acc74e9bf98ff341e14cf1af64c29687e6729006fe3eb333c792d870e43a', '["*"]', '2025-07-03 10:29:15', NULL, '2025-07-03 10:28:49', '2025-07-03 10:29:15'),
	(184, 'App\\Models\\User', 8, 'mobile', '48b1fbf62d63064ae8e1bfb4699b1720376f70c4f084717fa0b2a89e2f6a9a15', '["*"]', '2025-07-03 10:47:17', NULL, '2025-07-03 10:47:04', '2025-07-03 10:47:17'),
	(185, 'App\\Models\\User', 5, 'mobile', '56210e512d2c6a17ae82e8b19dcf1d273436723b7bbd18d55b79f67d806d1c70', '["*"]', '2025-07-03 13:14:39', NULL, '2025-07-03 10:52:38', '2025-07-03 13:14:39'),
	(186, 'App\\Models\\User', 9, 'mobile', '474f7182e695932aab40cb83e66106627c8ddc1ed65d8e414948ab51d804332f', '["*"]', '2025-07-03 11:44:46', NULL, '2025-07-03 11:35:21', '2025-07-03 11:44:46'),
	(187, 'App\\Models\\User', 5, 'mobile', '4cdb3e4614ecb8567b39311a86c6848115b7a26cda115e23ca7f4f3d4b30f9c8', '["*"]', '2025-07-03 14:43:10', NULL, '2025-07-03 12:45:04', '2025-07-03 14:43:10'),
	(188, 'App\\Models\\User', 5, 'mobile', '025090ad0a41ac5b01b2dffd420768f7609792dc7fc69cc3d6b30af4ef7e2c53', '["*"]', '2025-07-03 15:26:21', NULL, '2025-07-03 15:24:50', '2025-07-03 15:26:21'),
	(189, 'App\\Models\\User', 10, 'mobile', '87e132262627f1875a0b6724ffe9f95825f29c063cec2f8450f7d4b6969554c3', '["*"]', '2025-07-04 00:28:02', NULL, '2025-07-03 15:29:27', '2025-07-04 00:28:02'),
	(190, 'App\\Models\\User', 5, 'mobile', '5ae70d41e211d2dd367a8326dc5bf27d92aac4d46a7dea5452ea0f031913b604', '["*"]', '2025-07-03 16:06:26', NULL, '2025-07-03 15:36:32', '2025-07-03 16:06:26'),
	(191, 'App\\Models\\User', 5, 'mobile', 'a8dd33e704400b5e19a196f0ee86469ef3f87890a6c3892af12d97b543e695b9', '["*"]', '2025-07-04 02:25:41', NULL, '2025-07-04 00:28:19', '2025-07-04 02:25:41'),
	(192, 'App\\Models\\User', 5, 'mobile', '554df77c9c9b752e039c20270cbd8dd42b900b5f53334d70c717ebc5fa6b145a', '["*"]', '2025-07-04 02:51:52', NULL, '2025-07-04 02:29:49', '2025-07-04 02:51:52'),
	(193, 'App\\Models\\User', 10, 'mobile', '250d57033691dbaa5f5a18ce1a64e710ca51985f60c40f4985d59229839fa2d3', '["*"]', '2025-07-04 03:00:57', NULL, '2025-07-04 02:52:30', '2025-07-04 03:00:57'),
	(194, 'App\\Models\\User', 5, 'mobile', 'e351a23e26ff2958bc0db57721769158651eb922353a5dc430a6d23f55788701', '["*"]', '2025-07-04 03:31:37', NULL, '2025-07-04 03:01:16', '2025-07-04 03:31:37'),
	(195, 'App\\Models\\User', 5, 'mobile', 'be0fb307dba0875f712b85c7f65339086248e98176dd90bc388e65a6e4a95991', '["*"]', '2025-07-04 05:48:07', NULL, '2025-07-04 03:31:53', '2025-07-04 05:48:07'),
	(196, 'App\\Models\\User', 5, 'mobile', '96a3d0c5d919ff75de301c16eaf0267b3e78e25ac677e75f949e4fddcc2ef6d4', '["*"]', '2025-07-04 15:26:59', NULL, '2025-07-04 05:48:41', '2025-07-04 15:26:59'),
	(197, 'App\\Models\\User', 5, 'mobile', '7b2e134545384fbe6d0639c37f7c7f80146fc476bb8fcf6222c517f18372287f', '["*"]', '2025-07-04 15:32:20', NULL, '2025-07-04 15:29:53', '2025-07-04 15:32:20'),
	(198, 'App\\Models\\User', 5, 'mobile', '5007b6d512e46bb6cf9c44e3d9d01dae50951581447dba40096ceca9b874cffa', '["*"]', '2025-07-04 15:36:20', NULL, '2025-07-04 15:32:59', '2025-07-04 15:36:20'),
	(199, 'App\\Models\\User', 5, 'mobile', '45916e39f9333af002365ce81b48d8975e27f950949688cdab51e51d47812fe6', '["*"]', '2025-07-04 15:49:30', NULL, '2025-07-04 15:37:36', '2025-07-04 15:49:30'),
	(200, 'App\\Models\\User', 5, 'mobile', 'ea49d71704dea9d1d6c3851b2b9b4829fc3ffa305167b577e41c7c78392549f4', '["*"]', '2025-07-04 15:51:14', NULL, '2025-07-04 15:51:06', '2025-07-04 15:51:14'),
	(201, 'App\\Models\\User', 5, 'mobile', 'fa6c31d9c6d9d5b7c62315b8983faf79be4ac51c746703cb050d1c9e833b1595', '["*"]', '2025-07-04 16:00:40', NULL, '2025-07-04 15:58:00', '2025-07-04 16:00:40'),
	(202, 'App\\Models\\User', 5, 'mobile', 'e16189f07eebbd0b073b826c309946ebe1a02d6a1f671b275b16ddc1a63c24da', '["*"]', '2025-07-04 16:19:15', NULL, '2025-07-04 16:19:10', '2025-07-04 16:19:15'),
	(203, 'App\\Models\\User', 5, 'mobile', 'eae2a0975783db1e3fc461a8206106a3db98824924083718266b8c4fba09685f', '["*"]', '2025-07-04 16:23:15', NULL, '2025-07-04 16:23:11', '2025-07-04 16:23:15'),
	(204, 'App\\Models\\User', 5, 'mobile', '5b7d5fb0ec8eed8cc93ba3486a8a4d6d4feb847fcb282fe2b7c11dbb69dc2d35', '["*"]', '2025-07-04 16:38:04', NULL, '2025-07-04 16:37:59', '2025-07-04 16:38:04'),
	(205, 'App\\Models\\User', 5, 'mobile', '9fb7f2a14bd84e08510dae8fceaf604df5507f47bf9fc225b1b683cff43f86e3', '["*"]', '2025-07-04 16:52:26', NULL, '2025-07-04 16:51:46', '2025-07-04 16:52:26'),
	(206, 'App\\Models\\User', 5, 'mobile', 'b9999105686ed608223cc795333cdd6491e6ff08c322f87f8f90fa75a7391bd6', '["*"]', '2025-07-04 17:04:00', NULL, '2025-07-04 16:55:27', '2025-07-04 17:04:00'),
	(207, 'App\\Models\\User', 5, 'mobile', 'f3748b788a1961e6e6b648b1d7dd562881ee7fa1abfca1f506c0a4e1306351e9', '["*"]', '2025-07-04 17:09:28', NULL, '2025-07-04 17:09:23', '2025-07-04 17:09:28'),
	(208, 'App\\Models\\User', 5, 'mobile', '3033ab3e18bf30dd4e5578a9f6f8b8be067f8fe0a9d6d3672376e4782bdd6899', '["*"]', '2025-07-04 17:10:39', NULL, '2025-07-04 17:10:34', '2025-07-04 17:10:39'),
	(209, 'App\\Models\\User', 5, 'mobile', 'f00641829b71b7487f074a40e8c456c517551cea7cc152d5cb1d8664e73f065d', '["*"]', '2025-07-04 17:13:16', NULL, '2025-07-04 17:12:16', '2025-07-04 17:13:16'),
	(210, 'App\\Models\\User', 5, 'mobile', '0980807f84ac9421be811f6c22c5df57a6571f9b29e092d8840485b21cebf88c', '["*"]', '2025-07-04 17:15:00', NULL, '2025-07-04 17:14:55', '2025-07-04 17:15:00'),
	(211, 'App\\Models\\User', 5, 'mobile', 'ca87247f7bd2c1c9c3772d02acfdfb83128a1d2711e3aeebb19ca12700cdf21f', '["*"]', '2025-07-04 17:15:14', NULL, '2025-07-04 17:15:03', '2025-07-04 17:15:14'),
	(212, 'App\\Models\\User', 5, 'mobile', '5ef77253b6ababc817ec464bb8fbc895f279b141ce6815780dbbc0bb8c96d7f1', '["*"]', '2025-07-04 18:17:50', NULL, '2025-07-04 17:15:23', '2025-07-04 18:17:50'),
	(213, 'App\\Models\\User', 10, 'mobile', '2dbbd1793d000b5c8e64c57f3ae27892489634e3ffde17b96bb361f97da93bfc', '["*"]', '2025-07-04 18:17:31', NULL, '2025-07-04 18:14:53', '2025-07-04 18:17:31'),
	(214, 'App\\Models\\User', 10, 'mobile', 'd1fcf61a573835d2a6856c261e05b35bbf46a4d377335dc98a9d944310790286', '["*"]', '2025-07-04 18:40:47', NULL, '2025-07-04 18:18:08', '2025-07-04 18:40:47'),
	(215, 'App\\Models\\User', 11, 'mobile', 'a3f5fd018d2a918c9ccd4ed1a9e73c53bdf63bbdfe521112e60b44530f9c0fdd', '["*"]', NULL, NULL, '2025-07-04 19:42:20', '2025-07-04 19:42:20'),
	(216, 'App\\Models\\User', 11, 'mobile', 'd80c1ddce31dbfc71e939864a0b20e696bcd2b6c616b15ed0ce3f8506712eb59', '["*"]', '2025-07-04 19:43:05', NULL, '2025-07-04 19:42:48', '2025-07-04 19:43:05'),
	(217, 'App\\Models\\User', 11, 'mobile', 'bf8cc6546d634865930b54633aa9957c55ef742c46b7daba7b7e236957b8eb97', '["*"]', '2025-07-04 19:43:28', NULL, '2025-07-04 19:43:26', '2025-07-04 19:43:28'),
	(218, 'App\\Models\\User', 1, 'mobile', 'cdec3e2cc8f48c8ad5e5f5c600a173ebebee3967165ff42a477e6a20abe14fc9', '["*"]', '2025-07-04 19:44:50', NULL, '2025-07-04 19:44:45', '2025-07-04 19:44:50'),
	(219, 'App\\Models\\User', 11, 'mobile', 'e971fee4fb4f14e932527ad5acef14a57a122bef2c5a2f9bcb390295add1e956', '["*"]', '2025-07-04 19:45:11', NULL, '2025-07-04 19:44:57', '2025-07-04 19:45:11'),
	(220, 'App\\Models\\User', 11, 'mobile', 'f78e285b84089c71e9bb3e7e685b861f70f218749f61c469f25c3843984565c2', '["*"]', '2025-07-04 19:45:36', NULL, '2025-07-04 19:45:34', '2025-07-04 19:45:36'),
	(221, 'App\\Models\\User', 10, 'mobile', 'd40e45f7bd409033a0b6da0aef630c2ae28ae66a065dc50a3dd94f7ad90cb3ea', '["*"]', '2025-07-04 19:46:48', NULL, '2025-07-04 19:46:45', '2025-07-04 19:46:48'),
	(222, 'App\\Models\\User', 1, 'mobile', '5b86ab00f3c38c523d06861d90b00adc5f5e81d411e825d54d776e64b3590e7c', '["*"]', '2025-07-04 19:47:25', NULL, '2025-07-04 19:47:23', '2025-07-04 19:47:25'),
	(223, 'App\\Models\\User', 11, 'mobile', '23f65595bd3901136694bc448d48918a900d4d8ecd186158ec084b57e99d40ec', '["*"]', '2025-07-04 19:50:14', NULL, '2025-07-04 19:49:15', '2025-07-04 19:50:14'),
	(224, 'App\\Models\\User', 1, 'mobile', '589dbcf0f940497bc8d857834454a0c1f3ee593ef29aeed6bb425854bdc32296', '["*"]', '2025-07-04 19:51:22', NULL, '2025-07-04 19:50:40', '2025-07-04 19:51:22'),
	(225, 'App\\Models\\User', 4, 'mobile', 'a961dab19fa3c521bd6758ebd489647a42e6cc69ceda071e36cfcc8c303ac434', '["*"]', '2025-07-04 19:51:55', NULL, '2025-07-04 19:51:29', '2025-07-04 19:51:55'),
	(226, 'App\\Models\\User', 1, 'mobile', '4e0ca7e584c77fa8c9268b6b8e793d3a556b4a7b27126c176027aea19752bd9d', '["*"]', '2025-07-04 19:57:28', NULL, '2025-07-04 19:57:03', '2025-07-04 19:57:28'),
	(227, 'App\\Models\\User', 10, 'mobile', 'ab940d15baaccb272b5afa4007bcbf94d214345d57fd72075c8ddf8772b9cb44', '["*"]', '2025-07-04 19:58:25', NULL, '2025-07-04 19:57:41', '2025-07-04 19:58:25'),
	(228, 'App\\Models\\User', 4, 'mobile', '260988624e0ab82b43dcda52c367210fea64ccc425014bfbdf86d2e4a67aec95', '["*"]', '2025-07-04 19:58:58', NULL, '2025-07-04 19:58:32', '2025-07-04 19:58:58'),
	(229, 'App\\Models\\User', 10, 'mobile', '5b277a39e4e3bb7de7a95b328372e7ba55cfbe792f1dfb353090ef545f5f7c04', '["*"]', '2025-07-04 19:59:09', NULL, '2025-07-04 19:59:05', '2025-07-04 19:59:09'),
	(230, 'App\\Models\\User', 12, 'mobile', '9193b2efbd126b858a4c48e88e765aacdd90dc6a298352c40b5e79019398e75d', '["*"]', '2025-07-04 20:01:52', NULL, '2025-07-04 19:59:48', '2025-07-04 20:01:52'),
	(231, 'App\\Models\\User', 1, 'mobile', '65e2de56f461dd9fd3e24a66c215a9d059fe54af18505950acec3375796747b2', '["*"]', '2025-07-04 20:03:05', NULL, '2025-07-04 20:01:58', '2025-07-04 20:03:05'),
	(232, 'App\\Models\\User', 13, 'mobile', '474e9dc5baa77304424f74395b49f93cf89265e36d35410962831d407b1cdbba', '["*"]', '2025-07-04 20:03:36', NULL, '2025-07-04 20:03:11', '2025-07-04 20:03:36'),
	(233, 'App\\Models\\User', 12, 'mobile', '9242005a67f796c0de8197aa0c908ce695ade22dd6fb5cd3d0402805ce8539bf', '["*"]', '2025-07-04 20:04:29', NULL, '2025-07-04 20:03:42', '2025-07-04 20:04:29'),
	(234, 'App\\Models\\User', 12, 'mobile', 'f2e02bede4c302bf12d6f4a0f02aa891338bf05e8bf26901e3aaeb7dc20c7614', '["*"]', '2025-07-04 20:06:28', NULL, '2025-07-04 20:04:38', '2025-07-04 20:06:28'),
	(235, 'App\\Models\\User', 12, 'mobile', '0b164647dea29f2fef6bdb61b5e39e064e5b0bea7937b6b7cf85e76b043e4f55', '["*"]', '2025-07-04 20:10:08', NULL, '2025-07-04 20:07:02', '2025-07-04 20:10:08'),
	(236, 'App\\Models\\User', 4, 'mobile', '6b3faca21e0ea0758e6b31df32191ccfe65523459ba3f751a9dafd41a98c3748', '["*"]', '2025-07-04 20:11:12', NULL, '2025-07-04 20:10:13', '2025-07-04 20:11:12'),
	(237, 'App\\Models\\User', 1, 'mobile', '2e537ac839cdc6ec6890aff166c43996cac6a34170281cf305b70aee6d6900e1', '["*"]', '2025-07-04 20:11:41', NULL, '2025-07-04 20:11:19', '2025-07-04 20:11:41'),
	(238, 'App\\Models\\User', 1, 'mobile', '7d69de60137796aa541c532c60bab16d6371aefa43e98f4cd40983eebd324907', '["*"]', '2025-07-04 20:12:01', NULL, '2025-07-04 20:11:49', '2025-07-04 20:12:01'),
	(239, 'App\\Models\\User', 4, 'mobile', 'ffec685ceed23599f019fd44c8f78092e095684d395c86a9e87f506385f74e5a', '["*"]', '2025-07-04 20:12:16', NULL, '2025-07-04 20:12:07', '2025-07-04 20:12:16'),
	(240, 'App\\Models\\User', 12, 'mobile', '5762c5d66262e64f2317f4319cfa31bc30b324631b20e0787338e31007eb488a', '["*"]', '2025-07-04 20:17:49', NULL, '2025-07-04 20:12:33', '2025-07-04 20:17:49'),
	(241, 'App\\Models\\User', 14, 'mobile', 'bd18358fa73e91da2efde1a14fb5f44166c655f9be272e8af6f2b160cf3217b9', '["*"]', '2025-07-04 20:19:51', NULL, '2025-07-04 20:19:08', '2025-07-04 20:19:51'),
	(242, 'App\\Models\\User', 15, 'mobile', '3cbd7913a89f432bb773dde1fefbed5a07c72c9629a1e6a56ba8196db82b76a3', '["*"]', '2025-07-04 20:21:00', NULL, '2025-07-04 20:19:58', '2025-07-04 20:21:00'),
	(243, 'App\\Models\\User', 15, 'mobile', 'e9b6bcd75288cfe89df61383becc75be8fcb23247706635e0731776e615e6ef3', '["*"]', '2025-07-04 20:21:13', NULL, '2025-07-04 20:21:06', '2025-07-04 20:21:13'),
	(244, 'App\\Models\\User', 4, 'mobile', '8af1f00b26df89c7a57ca855b104e67ab9ab9d163a7afce2c3ffd58ac89602dc', '["*"]', '2025-07-04 20:21:33', NULL, '2025-07-04 20:21:19', '2025-07-04 20:21:33'),
	(245, 'App\\Models\\User', 16, 'mobile', 'fb52239c3d9999d43bffdab96098fb065a0793f5bea6dd4888b7792d8b6268c1', '["*"]', '2025-07-04 20:21:55', NULL, '2025-07-04 20:21:41', '2025-07-04 20:21:55'),
	(246, 'App\\Models\\User', 17, 'mobile', '764d1409aca5d275c28bf7d3a2a05ece281db9888200f266bd7f202f76ec0dd2', '["*"]', '2025-07-04 20:34:44', NULL, '2025-07-04 20:22:18', '2025-07-04 20:34:44'),
	(247, 'App\\Models\\User', 18, 'mobile', 'b832892019aa1ec03d7f5c6d0b5cf20a5aef1e4596dccebad81cf6d17151bb23', '["*"]', '2025-07-04 20:43:37', NULL, '2025-07-04 20:34:51', '2025-07-04 20:43:37'),
	(248, 'App\\Models\\User', 1, 'mobile', 'dfefd462e175d75135b9947ec59f6c1243556f9592eeafe65e64b7fcb9d61a60', '["*"]', '2025-07-04 20:45:58', NULL, '2025-07-04 20:45:49', '2025-07-04 20:45:58'),
	(249, 'App\\Models\\User', 18, 'mobile', '13d37e091de8b3d27ebb5956b5db044442f6e8c0324935e73118b8a89e2542af', '["*"]', '2025-07-04 20:46:10', NULL, '2025-07-04 20:46:06', '2025-07-04 20:46:10'),
	(250, 'App\\Models\\User', 4, 'mobile', '69302035d733fbdab01aa3468eb81a210be7172f0ae019b156538964d40bc952', '["*"]', '2025-07-04 21:04:40', NULL, '2025-07-04 20:46:15', '2025-07-04 21:04:40'),
	(251, 'App\\Models\\User', 17, 'mobile', '37292e1baa0bc132e147492ac36532564c5708427424c461791969aa66a032e0', '["*"]', '2025-07-04 20:49:37', NULL, '2025-07-04 20:49:32', '2025-07-04 20:49:37'),
	(252, 'App\\Models\\User', 6, 'mobile', '30608351cafb42dcb1d3619334e427dc3166a5658ddeeeb687741b151123b1bf', '["*"]', '2025-07-04 20:49:48', NULL, '2025-07-04 20:49:45', '2025-07-04 20:49:48'),
	(253, 'App\\Models\\User', 18, 'mobile', 'fb0e5e6592e097411395a3bc9c5ce1fbf6f3f99c5762441699d54543f6475516', '["*"]', '2025-07-06 11:34:53', NULL, '2025-07-04 20:49:58', '2025-07-06 11:34:53'),
	(254, 'App\\Models\\User', 1, 'mobile', 'd26f485181228fcdf477cd6ca6c070314acf1c1b7d5ec7f2d0e256eec628fb97', '["*"]', '2025-07-04 21:17:17', NULL, '2025-07-04 21:04:47', '2025-07-04 21:17:17'),
	(255, 'App\\Models\\User', 1, 'mobile', 'e3efdc2f03045c4efa5d6de92788b1127fca4c0afe5b4452b8437ee9fe6cb136', '["*"]', '2025-07-04 21:17:52', NULL, '2025-07-04 21:17:22', '2025-07-04 21:17:52'),
	(256, 'App\\Models\\User', 18, 'mobile', '9eb8a78409c21c9746b5faa968986bdbc06df18c65e4c17dc51d6fb9cde2b295', '["*"]', '2025-07-04 21:22:49', NULL, '2025-07-04 21:18:13', '2025-07-04 21:22:49'),
	(257, 'App\\Models\\User', 19, 'mobile', '1dcdf7821ca7ea81d35f419b9ef4f7f1e0ff5b9b8faa2d60fb9bb15780a20790', '["*"]', '2025-07-04 21:57:34', NULL, '2025-07-04 21:57:10', '2025-07-04 21:57:34'),
	(258, 'App\\Models\\User', 18, 'mobile', '82f5ef2cfaf1b8dee4fb9d39d08272f29d7f394b2ccc58683ee3385a2964867d', '["*"]', '2025-07-04 22:39:22', NULL, '2025-07-04 22:28:05', '2025-07-04 22:39:22'),
	(259, 'App\\Models\\User', 1, 'mobile', 'ca1c8aac494bb16bfd4ca7aa1975cbbb7729eefd7100e0d57ecfd77f005ec54d', '["*"]', '2025-07-04 22:45:31', NULL, '2025-07-04 22:39:39', '2025-07-04 22:45:31'),
	(260, 'App\\Models\\User', 18, 'mobile', 'e51f652c48338033b82529920712a2d2db73b023b7bdc48cc1745655cbd616e9', '["*"]', '2025-07-04 22:57:11', NULL, '2025-07-04 22:45:47', '2025-07-04 22:57:11'),
	(261, 'App\\Models\\User', 4, 'mobile', 'a3873729a856826bb4b3d6eb9438db301719ad431f1a86e80b8f35c2d5786d1a', '["*"]', '2025-07-04 22:57:00', NULL, '2025-07-04 22:56:58', '2025-07-04 22:57:00'),
	(262, 'App\\Models\\User', 4, 'mobile', 'e1eb8dd12c73bda92f2b863b3628f12172ea86352537c0ccb4354ff26205dbb5', '["*"]', '2025-07-04 23:07:30', NULL, '2025-07-04 22:57:20', '2025-07-04 23:07:30'),
	(263, 'App\\Models\\User', 5, 'mobile', 'e4d7818fee5cb3ae994f1278054e21b47b777eabf434a83ce6de5b395fedca66', '["*"]', '2025-07-04 23:08:02', NULL, '2025-07-04 23:07:48', '2025-07-04 23:08:02'),
	(264, 'App\\Models\\User', 18, 'mobile', '51f56a24e318d64ac10cf608ba8b1b31f2f9d6af4290306c53081b66a7867436', '["*"]', '2025-07-04 23:09:42', NULL, '2025-07-04 23:08:13', '2025-07-04 23:09:42'),
	(265, 'App\\Models\\User', 4, 'mobile', 'a65705218d83e6ef38b91e9d664634129cc2fce498fa7b9bfcd4cfe9e5e9f6e3', '["*"]', '2025-07-04 23:36:28', NULL, '2025-07-04 23:10:12', '2025-07-04 23:36:28'),
	(266, 'App\\Models\\User', 6, 'mobile', '2f5dd3f545630dad1ee2deae4a4b4c259e8cb5403cf470dd44ec96063b442ff2', '["*"]', '2025-07-05 04:19:47', NULL, '2025-07-04 23:14:31', '2025-07-05 04:19:47'),
	(267, 'App\\Models\\User', 4, 'mobile', 'd718ded9474e12146bd16d57961c06a106ffe872630865909fa36d09057ffbd9', '["*"]', '2025-07-05 01:05:32', NULL, '2025-07-04 23:39:59', '2025-07-05 01:05:32'),
	(268, 'App\\Models\\User', 4, 'mobile', '434b9adbe1eca4d71e9064e5104038203483237ceffc60f33b7ff286be9e9b7e', '["*"]', '2025-07-05 01:14:26', NULL, '2025-07-05 01:05:56', '2025-07-05 01:14:26'),
	(269, 'App\\Models\\User', 18, 'mobile', '65be146cd09680cb25edb22e7dd5f2a43cd6576ff35b53205b0e50d5422caa10', '["*"]', '2025-07-05 01:20:11', NULL, '2025-07-05 01:19:42', '2025-07-05 01:20:11'),
	(270, 'App\\Models\\User', 4, 'mobile', 'f86bb0dbb0b2d622ca92ab78f54960323f008c3a3916c35b2a429ee6f98e6c33', '["*"]', '2025-07-05 04:31:02', NULL, '2025-07-05 01:49:03', '2025-07-05 04:31:02'),
	(271, 'App\\Models\\User', 4, 'mobile', '8f9026b85a767b52494865e9ff001801e22645abe182b5d3e8688d9b63b3c894', '["*"]', '2025-07-05 03:58:24', NULL, '2025-07-05 03:56:53', '2025-07-05 03:58:24'),
	(272, 'App\\Models\\User', 6, 'mobile', '2755954efdfd8caccc69d99f2673a741a3797566f74472bf8b73797537275bad', '["*"]', '2025-07-05 04:03:32', NULL, '2025-07-05 03:59:09', '2025-07-05 04:03:32'),
	(273, 'App\\Models\\User', 6, 'mobile', 'a338c0635455e99f8efc1a28409c3f9df6d5b410deed3aa6ff9208b662923ac5', '["*"]', '2025-07-05 04:11:00', NULL, '2025-07-05 04:04:30', '2025-07-05 04:11:00'),
	(274, 'App\\Models\\User', 6, 'mobile', '14a73b5b33eaf629a3d90122ea51369107548e03da2d4bf76ec5c4ae26ee4075', '["*"]', '2025-07-05 22:26:59', NULL, '2025-07-05 04:23:16', '2025-07-05 22:26:59'),
	(275, 'App\\Models\\User', 18, 'mobile', '1ef6ee812841729eb4a6bb93083069681d53ffe642a65856b200f7e48236ea7b', '["*"]', '2025-07-05 04:33:22', NULL, '2025-07-05 04:33:04', '2025-07-05 04:33:22'),
	(276, 'App\\Models\\User', 4, 'mobile', '6053e4e7acaa5eece06301039a3bfc7dd1c1fe0081647d7f658e33b78a599571', '["*"]', '2025-07-05 07:53:12', NULL, '2025-07-05 04:33:44', '2025-07-05 07:53:12'),
	(277, 'App\\Models\\User', 18, 'mobile', '6b759eec774c3ba97b55a28a91ec76cbc856b2f1b5489e391e39a7f4df2bb65d', '["*"]', '2025-07-05 07:54:34', NULL, '2025-07-05 07:53:27', '2025-07-05 07:54:34'),
	(278, 'App\\Models\\User', 17, 'mobile', 'be1ec6149c9b108c2c5d178ae3826cdd895dc59e7e9b970e2ae313982114ac23', '["*"]', '2025-07-05 08:17:58', NULL, '2025-07-05 08:17:13', '2025-07-05 08:17:58'),
	(279, 'App\\Models\\User', 4, 'mobile', '7d4b2ca727696c35a3960546720dfc73f967a9be99a901d5ced3e67e28c057c8', '["*"]', '2025-07-05 09:31:32', NULL, '2025-07-05 08:18:37', '2025-07-05 09:31:32'),
	(280, 'App\\Models\\User', 4, 'mobile', 'c75266e4f6f80d25fbfd459d87c9866681a098adab0f73577dcf44b3557ea691', '["*"]', '2025-07-05 09:20:06', NULL, '2025-07-05 09:07:55', '2025-07-05 09:20:06'),
	(281, 'App\\Models\\User', 4, 'mobile', '442b04033317304365d4ca441ff589e8a81c05ea28cc2c2345a7cc78b1bce940', '["*"]', '2025-07-05 09:32:38', NULL, '2025-07-05 09:31:54', '2025-07-05 09:32:38'),
	(282, 'App\\Models\\User', 18, 'mobile', 'aa1c13b83383744715a435801a721d84bfa69fa87a4a2d65fd9d67ceb8a764da', '["*"]', '2025-07-05 09:33:17', NULL, '2025-07-05 09:32:45', '2025-07-05 09:33:17'),
	(283, 'App\\Models\\User', 18, 'mobile', '8a345edf704ecc0e31465fb7acbe7901a8bc341370362efbec11b88ecfad64a3', '["*"]', '2025-07-05 10:56:42', NULL, '2025-07-05 10:48:33', '2025-07-05 10:56:42'),
	(284, 'App\\Models\\User', 17, 'mobile', 'a3f42e66af035c1798392e651d769db8c9f6bc3e2897b1f8658ce21f2b04d0a2', '["*"]', '2025-07-05 11:30:19', NULL, '2025-07-05 11:30:08', '2025-07-05 11:30:19'),
	(285, 'App\\Models\\User', 4, 'mobile', '6af1288219a1f7d3b1433f962beec525274ff6bee0ac070fa6576fa7d8836d5a', '["*"]', '2025-07-05 21:13:46', NULL, '2025-07-05 14:24:51', '2025-07-05 21:13:46'),
	(286, 'App\\Models\\User', 20, 'mobile', 'c1fadfdcd7c2a1faa105d384b3e66f14116be78f15de367e861ad46726fbbec6', '["*"]', '2025-07-05 14:59:17', NULL, '2025-07-05 14:58:04', '2025-07-05 14:59:17'),
	(287, 'App\\Models\\User', 4, 'mobile', '0dede81c6ef43d2f1dd0793f42487877f8acd84b0de8d5a18c8c176483e3b001', '["*"]', '2025-07-05 22:27:10', NULL, '2025-07-05 21:17:53', '2025-07-05 22:27:10'),
	(288, 'App\\Models\\User', 1, 'mobile', 'c15dde25c59affc412d3922b87b50c6bfa4fe45f86ec381c7e0990b32e1bbe8e', '["*"]', '2025-07-05 22:39:57', NULL, '2025-07-05 22:27:17', '2025-07-05 22:39:57'),
	(289, 'App\\Models\\User', 4, 'mobile', '1f01ef3e268307c72dcc523ece094075dc1889234795544a1318ed7c84656079', '["*"]', '2025-07-06 11:19:51', NULL, '2025-07-06 08:03:06', '2025-07-06 11:19:51'),
	(290, 'App\\Models\\User', 18, 'mobile', '7448ee6f0f3530f2e01db5ae6b8a6ee4f85f6fb758e0d585b188c1131af7cc20', '["*"]', '2025-07-06 19:49:33', NULL, '2025-07-06 11:20:31', '2025-07-06 19:49:33');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table etrabaho.requirements
CREATE TABLE IF NOT EXISTS `requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.requirements: 8 rows
DELETE FROM `requirements`;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` (`id`, `type`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 'Application Letter', NULL, NULL, '2025-06-27 04:08:17', NULL, NULL, NULL),
	(2, 'Resume', NULL, NULL, '2025-06-27 04:08:25', NULL, NULL, NULL),
	(3, 'Barangay Clearance', NULL, NULL, '2025-06-27 04:09:14', NULL, NULL, NULL),
	(4, 'Government ID', NULL, NULL, '2025-06-27 04:09:21', NULL, NULL, NULL),
	(5, ' Proof of Skills / Experience', NULL, NULL, '2025-06-27 04:11:17', NULL, NULL, NULL),
	(6, 'Police Clearance / NBI Clearance', NULL, NULL, '2025-06-27 04:11:24', NULL, NULL, NULL),
	(7, 'Certificate ', NULL, NULL, '2025-06-27 04:11:42', NULL, NULL, NULL),
	(8, 'None', NULL, NULL, '2025-06-30 05:59:44', NULL, NULL, NULL);
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;

-- Dumping structure for table etrabaho.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BidID` int(11) NOT NULL DEFAULT '0',
  `reviewer_id` int(11) DEFAULT NULL,
  `reviewee_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `comment` text,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `reviewer_id` (`reviewer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.reviews: 4 rows
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `BidID`, `reviewer_id`, `reviewee_id`, `rating`, `comment`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 24, 1, 2, 5, 'Ccv', 1, 1, '2025-06-28 03:28:50', '2025-06-27 19:28:50', 'active', 0, NULL),
	(2, 27, 1, 2, 3, 'puluho', 1, 1, '2025-07-02 13:11:38', '2025-07-02 05:11:38', 'active', 0, NULL),
	(3, 29, 4, 5, 4, 'hahahahahahah', 4, 4, '2025-07-03 06:49:38', '2025-07-03 06:49:38', 'active', 0, NULL),
	(4, 2, 4, 6, 4, 'Hhhhaaha', 4, 4, '2025-07-05 03:05:12', '2025-07-05 03:05:12', 'active', 0, NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table etrabaho.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(125) NOT NULL,
  `guard_name` varchar(125) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.roles: 3 rows
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(7, 'homeowner', 'web', '2025-07-06 21:05:37', '2025-07-06 21:05:37'),
	(8, 'skilled_worker', 'web', '2025-07-06 21:05:43', '2025-07-06 21:05:43'),
	(9, 'admin', 'web', '2025-07-06 21:44:33', '2025-07-06 21:44:33');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table etrabaho.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table etrabaho.role_has_permissions: 0 rows
DELETE FROM `role_has_permissions`;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table etrabaho.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.sessions: 2 rows
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('7My3RyxP5pAiuNTDkurPLq8uVBo741JhIH6BTCxc', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidFhMWUgzSGdpRUNSSTkyRXlDbjlOY0w3QjZhRDNjNW1USW5QV1FMSyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cDovL2V0cmFiYWhvLmRldi5jb20vZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9ldHJhYmFoby5kZXYuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1752038616),
	('VspS7lSryitjZOtfXOGVPpEUD8IzIYWvvvRFb0G1', 4, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQnh0S3pkd3hyaHlHakM0V1lid0tDVFROSDFmdnd3VmhHTzh2NHlkMiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vZXRyYWJhaG8uZGV2LmNvbS9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1751962630);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table etrabaho.skilled_workers
CREATE TABLE IF NOT EXISTS `skilled_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `description` text,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.skilled_workers: 3 rows
DELETE FROM `skilled_workers`;
/*!40000 ALTER TABLE `skilled_workers` DISABLE KEYS */;
INSERT INTO `skilled_workers` (`id`, `user_id`, `rating`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 2, 4.00, NULL, 1, 1, '2025-06-28 03:28:50', '2025-07-02 05:11:38', 'active', 0, NULL),
	(2, 5, 3.55, NULL, 4, 4, '2025-07-03 06:49:38', '2025-07-04 06:51:38', 'active', 0, NULL),
	(3, 6, 4.00, NULL, 4, 4, '2025-07-05 03:05:12', '2025-07-05 03:05:12', 'active', 0, NULL);
/*!40000 ALTER TABLE `skilled_workers` ENABLE KEYS */;

-- Dumping structure for table etrabaho.skills
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.skills: 33 rows
DELETE FROM `skills`;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`id`, `description`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 'Electrician', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(2, 'Plumber', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(3, 'Carpenter', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(4, 'Painter', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(5, 'Handyman', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(6, 'Locksmith', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(7, 'Glazier', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(8, 'Tiler', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(9, 'Roofer', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(10, 'Flooring', 0, 0, NULL, '2025-06-24 04:39:39', 'active', 0, NULL),
	(11, 'Driving', 0, 0, NULL, '2025-06-24 17:46:30', 'active', 0, NULL),
	(12, 'Hehehh', 1, 1, '2025-06-25 03:17:33', '2025-06-24 19:17:33', 'active', 0, NULL),
	(13, 'Hhehhhehe', 1, 1, '2025-06-25 03:17:46', '2025-06-24 19:17:46', 'active', 0, NULL),
	(14, 'Excel', 1, 1, '2025-06-25 03:19:03', '2025-06-24 19:19:03', 'active', 0, NULL),
	(15, 'Excel', 1, 1, '2025-06-25 03:19:41', '2025-06-24 19:19:41', 'active', 0, NULL),
	(16, 'Graphics Design', 1, 1, '2025-06-25 03:20:18', '2025-06-24 19:20:18', 'active', 0, NULL),
	(17, 'Hhehhwhwhw', 1, 1, '2025-06-25 03:21:02', '2025-06-24 19:21:02', 'active', 0, NULL),
	(18, 'Hahh', 1, 1, '2025-06-25 03:29:53', '2025-06-24 19:29:53', 'active', 0, NULL),
	(19, 'Piloton', 1, 1, '2025-06-25 03:48:56', '2025-06-24 19:48:56', 'active', 0, NULL),
	(20, 'Panday', 2, 2, '2025-06-25 07:37:13', '2025-06-24 23:37:13', 'active', 0, NULL),
	(21, 'Heheheheh', 1, 1, '2025-07-02 08:49:06', '2025-07-02 00:49:06', 'active', 0, NULL),
	(22, 'Hhhahahahha', 1, 1, '2025-07-02 08:49:57', '2025-07-02 00:49:57', 'active', 0, NULL),
	(23, 'Errt', 1, 1, '2025-07-02 08:56:36', '2025-07-02 00:56:36', 'active', 0, NULL),
	(24, 'Ffff', 1, 1, '2025-07-02 09:35:27', '2025-07-02 01:35:27', 'active', 0, NULL),
	(25, 'Cook', 1, 1, '2025-07-02 10:41:46', '2025-07-02 02:41:46', 'active', 0, NULL),
	(26, 'Laundry', 1, 1, '2025-07-02 10:43:49', '2025-07-02 02:43:49', 'active', 0, NULL),
	(27, 'Rrtt', 5, 5, '2025-07-03 03:55:23', '2025-07-03 03:55:23', 'active', 0, NULL),
	(28, 'Computer technician', 9, 9, '2025-07-03 11:38:47', '2025-07-03 11:38:47', 'active', 0, NULL),
	(29, 'Computer technician', 9, 9, '2025-07-03 11:38:56', '2025-07-03 11:38:56', 'active', 0, NULL),
	(30, 'Computer technician', 9, 9, '2025-07-03 11:39:02', '2025-07-03 11:39:02', 'active', 0, NULL),
	(31, 'Computer technician', 9, 9, '2025-07-03 11:39:02', '2025-07-03 11:39:02', 'active', 0, NULL),
	(32, 'IT Support', 9, 9, '2025-07-03 11:43:17', '2025-07-03 11:43:17', 'active', 0, NULL),
	(33, 'Cleaner', 10, 10, '2025-07-03 15:32:13', '2025-07-03 15:32:13', 'active', 0, NULL);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;

-- Dumping structure for table etrabaho.tjobs
CREATE TABLE IF NOT EXISTS `tjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homeowner_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `skill_required` text,
  `due_date` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `rate_type` varchar(10) DEFAULT NULL,
  `rate_amount` decimal(10,2) DEFAULT NULL,
  `placeOfAssignment` longtext,
  `placeOfAssignmentText` longtext,
  `work_status` varchar(50) DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `performed_by` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `homeowner_id` (`homeowner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.tjobs: 214 rows
DELETE FROM `tjobs`;
/*!40000 ALTER TABLE `tjobs` DISABLE KEYS */;
INSERT INTO `tjobs` (`id`, `homeowner_id`, `title`, `description`, `skill_required`, `due_date`, `start_date`, `end_date`, `rate_type`, `rate_amount`, `placeOfAssignment`, `placeOfAssignmentText`, `work_status`, `requirements`, `performed_by`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 3, 'Consequatur dolores dolore autem', 'Et suscipit fugiat debitis. Eius occaecati molestias dolor veritatis atque doloremque. Ea facilis nemo non.', NULL, '2025-06-19 21:38:39', '2025-06-18', '2025-06-27', 'hourly', 778.19, NULL, NULL, 'completed', NULL, 4, 3, 2, '2025-06-18 21:38:39', '2025-06-27 13:38:39', 'active', 0, NULL),
	(2, 3, 'Adipisci doloremque omnis voluptas', 'Quia laboriosam ipsam voluptas natus quia ad ipsum. Recusandae veniam consequuntur soluta.', NULL, '2025-06-03 21:48:42', '2025-05-30', '2025-06-01', 'daily', 835.79, NULL, NULL, 'completed', NULL, 9, 4, 5, '2025-05-30 21:48:42', '2025-06-01 13:48:42', 'active', 0, NULL),
	(3, 8, 'Quas et consequatur', 'Qui necessitatibus fugiat cumque reprehenderit. Ratione quo est rerum rerum. Ea aut earum quis architecto.', NULL, '2025-05-28 05:13:21', '2025-05-26', '2025-05-27', 'hourly', 647.97, NULL, NULL, 'cancelled', NULL, 2, 1, 2, '2025-05-26 05:13:21', '2025-05-26 21:13:21', 'active', 0, NULL),
	(4, 6, 'Corrupti sequi perferendis aut quisquam eaque', 'Quas quidem minima sed. Illum assumenda magnam rerum enim pariatur voluptatibus vel. Sed aut quibusdam aspernatur consequatur natus aut omnis.', NULL, '2025-06-02 18:31:51', '2025-06-01', '2025-06-10', 'fixed', 311.55, NULL, NULL, 'cancelled', NULL, 5, 5, 2, '2025-06-01 18:31:51', '2025-06-10 10:31:51', 'active', 0, NULL),
	(5, 9, 'Temporibus enim placeat vitae ea', 'Cumque qui vel sit voluptatibus doloremque voluptas harum. Atque doloremque non natus. Neque expedita dolorem unde quos perspiciatis autem.', NULL, '2025-06-11 18:03:30', '2025-06-10', '2025-06-14', 'daily', 793.45, NULL, NULL, 'pending', NULL, 4, 5, 4, '2025-06-10 18:03:30', '2025-06-14 10:03:30', 'active', 0, NULL),
	(6, 1, 'Distinctio dicta qui nihil voluptas quas', 'Atque dolorem quia aut. Libero voluptatem molestiae est. Eaque earum vel cupiditate omnis tempora accusamus.', NULL, '2025-06-22 13:40:42', '2025-06-17', '2025-06-26', 'hourly', 222.61, NULL, NULL, 'completed', NULL, 3, 4, 4, '2025-06-17 13:40:42', '2025-06-26 05:40:42', 'active', 0, NULL),
	(7, 5, 'Deleniti alias porro', 'Suscipit explicabo harum ea sit molestiae quaerat quos. Atque sunt ut pariatur vel quas. Eum quis nisi ipsum culpa autem nam.', NULL, '2025-06-04 08:52:35', '2025-06-02', '2025-06-06', 'fixed', 787.45, NULL, NULL, 'pending', NULL, 10, 3, 2, '2025-06-02 08:52:35', '2025-06-06 00:52:35', 'active', 0, NULL),
	(8, 2, 'Sunt voluptate qui', 'Voluptatibus atque omnis eum ab. Corporis saepe nam culpa sint. Quia et voluptates quasi sit ex recusandae eum. Odit est est iusto itaque aperiam.', NULL, '2025-06-09 01:52:02', '2025-06-07', '2025-06-17', 'hourly', 622.85, NULL, NULL, 'completed', NULL, 10, 2, 1, '2025-06-07 01:52:02', '2025-06-16 17:52:02', 'active', 0, NULL),
	(9, 8, 'Animi facere ullam', 'Nostrum iste vero quas et hic voluptatem natus. Ullam dicta ab repudiandae animi doloremque eum. Explicabo adipisci sint quas.', NULL, '2025-06-18 07:22:11', '2025-06-14', '2025-06-15', 'hourly', 274.43, NULL, NULL, 'cancelled', NULL, 9, 2, 5, '2025-06-14 07:22:11', '2025-06-14 23:22:11', 'active', 0, NULL),
	(10, 3, 'Non suscipit facere magnam', 'Et sint dolores non minus quisquam sed. Cumque illum et magnam quis facere sapiente minima. Tenetur molestias fuga sit rerum aliquid est.', NULL, '2025-06-28 22:04:29', '2025-06-23', '2025-06-29', 'daily', 776.42, NULL, NULL, 'in_progress', NULL, 8, 1, 4, '2025-06-23 22:04:29', '2025-06-29 14:04:29', 'active', 0, NULL),
	(11, 3, 'Ipsum occaecati odio qui', 'Nihil eos qui temporibus rerum autem. Vel sunt enim reiciendis.', NULL, '2025-06-21 07:05:52', '2025-06-17', '2025-06-23', 'hourly', 864.04, NULL, NULL, NULL, NULL, 3, 2, 3, '2025-06-17 07:05:52', '2025-06-22 23:05:52', 'active', 0, NULL),
	(12, 7, 'Quia doloribus natus laboriosam', 'Quia est inventore voluptatem omnis dicta. Architecto distinctio nihil id nam. Est inventore vel in ut atque qui nostrum.', NULL, '2025-06-23 17:48:54', '2025-06-19', '2025-06-26', 'daily', 787.08, NULL, NULL, 'pending', NULL, 8, 3, 5, '2025-06-19 17:48:54', '2025-06-26 09:48:54', 'active', 0, NULL),
	(13, 9, 'Occaecati aspernatur sed explicabo', 'Eius et deserunt et animi. Quia voluptate consectetur et enim et modi iure. Omnis perferendis temporibus qui odio eius.', NULL, '2025-06-27 11:09:20', '2025-06-23', '2025-06-24', 'fixed', 982.13, NULL, NULL, 'pending', NULL, 5, 5, 2, '2025-06-23 11:09:20', '2025-06-24 03:09:20', 'active', 0, NULL),
	(14, 8, 'Blanditiis et distinctio dignissimos', 'Assumenda et assumenda et velit. Quae optio rerum animi qui neque. Delectus dolorem labore maxime nulla unde rem omnis esse.', NULL, '2025-06-25 14:49:43', '2025-06-23', '2025-06-27', 'fixed', 142.62, NULL, NULL, 'in_progress', NULL, 4, 3, 4, '2025-06-23 14:49:43', '2025-06-27 06:49:43', 'active', 0, NULL),
	(15, 7, 'Praesentium recusandae ipsum fugiat sed', 'Suscipit ipsum sed praesentium dolorem voluptatem tempore. Cum id debitis neque sunt voluptatem. Rerum molestias molestiae quos eos autem.', NULL, '2025-05-28 21:46:26', '2025-05-25', '2025-05-29', 'hourly', 260.69, NULL, NULL, 'cancelled', NULL, 10, 2, 5, '2025-05-25 21:46:26', '2025-05-29 13:46:26', 'active', 0, NULL),
	(16, 6, 'Fugiat ea sed quo', 'Aut eveniet fuga fugit ut natus. Repellendus earum cum officia quia dicta ad. Natus possimus culpa qui molestias dolores ut non.', NULL, '2025-06-18 01:24:43', '2025-06-13', '2025-06-16', 'daily', 659.60, NULL, NULL, 'pending', NULL, 2, 5, 5, '2025-06-13 01:24:43', '2025-06-15 17:24:43', 'active', 0, NULL),
	(17, 9, 'Cumque voluptates quia autem quia facere', 'Ex est quia nostrum omnis. Odio qui nesciunt recusandae ullam quibusdam illo quod. Dicta expedita corrupti odit.', NULL, '2025-06-11 10:08:29', '2025-06-10', '2025-06-13', 'hourly', 558.78, NULL, NULL, NULL, NULL, 8, 2, 3, '2025-06-10 10:08:29', '2025-06-13 02:08:29', 'active', 0, NULL),
	(18, 1, 'Et saepe assumenda ab', 'Et dolores dolorum nulla. Possimus ratione illum labore minima. Placeat illo consectetur vitae aliquam eveniet et minus.', NULL, '2025-06-17 01:56:18', '2025-06-14', '2025-06-16', 'fixed', 103.34, NULL, NULL, NULL, NULL, 8, 1, 2, '2025-06-14 01:56:18', '2025-06-15 17:56:18', 'active', 0, NULL),
	(19, 3, 'Tenetur eveniet dolores eum ab', 'Suscipit natus distinctio totam porro. Quia facere in et et dignissimos. Mollitia a molestiae quibusdam id accusantium ratione illo.', NULL, '2025-05-31 13:07:11', '2025-05-28', '2025-06-01', 'daily', 417.03, NULL, NULL, 'completed', NULL, 9, 5, 2, '2025-05-28 13:07:11', '2025-06-01 05:07:11', 'active', 0, NULL),
	(20, 8, 'Cupiditate ea sit quia qui accusamus', 'Cumque nisi reprehenderit quidem quaerat. Ut non non quod quidem expedita delectus fugit. Hic inventore id occaecati quas ipsam.', NULL, '2025-06-20 00:04:30', '2025-06-16', '2025-06-25', 'hourly', 208.75, NULL, NULL, NULL, NULL, 10, 1, 2, '2025-06-16 00:04:30', '2025-06-24 16:04:30', 'active', 0, NULL),
	(21, 1, 'Est dolor est sed', 'Reprehenderit non perferendis aliquam dicta. In suscipit optio sunt et. Qui sint labore omnis assumenda architecto.', NULL, '2025-06-11 03:18:28', '2025-06-06', '2025-06-09', 'daily', 600.30, '{"latitude":9.78639487045304,"longitude":125.4916525259137}', 'Rizal Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', 'cancelled', '[8]', 9, 5, 1, '2025-06-06 03:18:28', '2025-07-01 23:54:40', 'active', 0, NULL),
	(22, 2, 'Est eaque aperiam esse dolore facere', 'Tenetur nesciunt est aliquam est. Est vero nobis cupiditate. Amet autem et eveniet aliquid consequatur eaque commodi.', NULL, '2025-06-24 11:33:50', '2025-06-20', '2025-06-28', 'daily', 775.01, NULL, NULL, 'cancelled', NULL, 4, 4, 4, '2025-06-20 11:33:50', '2025-06-28 03:33:50', 'active', 0, NULL),
	(23, 8, 'Excepturi quis aut eius eaque', 'Eos voluptatem iusto quaerat ex. Voluptas libero est soluta laudantium deserunt beatae. Qui quam eos voluptatem porro reprehenderit.', NULL, '2025-06-19 00:00:20', '2025-06-16', '2025-06-18', 'daily', 153.50, NULL, NULL, 'in_progress', NULL, 8, 3, 4, '2025-06-16 00:00:20', '2025-06-17 16:00:20', 'active', 0, NULL),
	(24, 2, 'Voluptas adipisci iure illo', 'Quis et consectetur beatae sequi porro eos. Et quia est nobis aut quo quis reiciendis expedita.', NULL, '2025-06-09 21:31:58', '2025-06-04', '2025-06-10', 'daily', 872.22, NULL, NULL, 'completed', NULL, 3, 2, 2, '2025-06-04 21:31:58', '2025-06-10 13:31:58', 'active', 0, NULL),
	(25, 8, 'Vitae temporibus laborum alias itaque', 'Aut aliquam aut quia. Dignissimos a nulla vel repellat quaerat natus.', NULL, '2025-06-15 10:10:47', '2025-06-13', '2025-06-20', 'fixed', 594.10, NULL, NULL, 'in_progress', NULL, 8, 4, 3, '2025-06-13 10:10:47', '2025-06-20 02:10:47', 'active', 0, NULL),
	(26, 5, 'Non dolor necessitatibus', 'Sed cupiditate ut recusandae sequi similique consequatur quis magni. Esse eligendi pariatur eos nesciunt. Dignissimos quibusdam tenetur rerum.', NULL, '2025-06-11 15:56:34', '2025-06-09', '2025-06-10', 'fixed', 770.82, NULL, NULL, 'pending', NULL, 5, 5, 5, '2025-06-09 15:56:34', '2025-06-10 07:56:34', 'active', 0, NULL),
	(27, 2, 'Numquam architecto quo eos officia', 'Vel accusamus omnis atque soluta doloribus vero. Aliquid in cum reprehenderit. In id exercitationem voluptatum architecto reiciendis ut et.', NULL, '2025-06-14 18:57:36', '2025-06-11', '2025-06-16', 'daily', 102.64, NULL, NULL, 'cancelled', NULL, 10, 2, 4, '2025-06-11 18:57:36', '2025-06-16 10:57:36', 'active', 0, NULL),
	(28, 8, 'Id excepturi consectetur nostrum expedita', 'Libero soluta molestias accusamus dolorem. Distinctio tempore aperiam nihil aut et. Qui omnis eaque ut voluptatibus voluptatem omnis.', NULL, '2025-05-28 05:16:06', '2025-05-26', '2025-06-02', 'fixed', 523.36, NULL, NULL, NULL, NULL, 6, 5, 1, '2025-05-26 05:16:06', '2025-06-01 21:16:06', 'active', 0, NULL),
	(29, 9, 'Quos aut perferendis ipsa omnis quis', 'Doloribus quibusdam repellat quia fugiat voluptatem et expedita. Qui ad deleniti est aliquam asperiores sunt placeat.', NULL, '2025-06-25 19:32:50', '2025-06-21', '2025-07-01', 'daily', 111.87, NULL, NULL, 'cancelled', NULL, 6, 5, 1, '2025-06-21 19:32:50', '2025-07-01 11:32:50', 'active', 0, NULL),
	(30, 7, 'Aliquam nemo quaerat eius iure assumenda', 'Saepe architecto pariatur fuga maxime aperiam qui sint. Et rerum ut eum fugiat. Voluptatem voluptatem officia fuga omnis provident unde.', NULL, '2025-06-20 22:52:14', '2025-06-17', '2025-06-18', 'fixed', 576.15, NULL, NULL, 'pending', NULL, 7, 5, 2, '2025-06-17 22:52:14', '2025-06-18 14:52:14', 'active', 0, NULL),
	(31, 8, 'Molestias dolor repudiandae possimus maiores', 'Ullam ad sapiente dolores fugit dolor. Corporis et recusandae ab ut nesciunt. Quas quo vero aliquam. Qui rerum quos eos quis omnis facilis esse.', NULL, '2025-06-15 13:14:36', '2025-06-11', '2025-06-18', 'daily', 491.48, NULL, NULL, 'cancelled', NULL, 7, 1, 1, '2025-06-11 13:14:36', '2025-06-18 05:14:36', 'active', 0, NULL),
	(32, 4, 'Velit illo nobis qui nostrum', 'Tenetur dignissimos omnis consectetur. Velit est qui debitis sed delectus esse inventore. Animi omnis est aut quidem dolor fugiat.', NULL, '2025-06-08 20:43:44', '2025-06-04', '2025-06-07', 'hourly', 415.02, NULL, NULL, 'pending', NULL, 7, 3, 3, '2025-06-04 20:43:44', '2025-06-07 12:43:44', 'active', 0, NULL),
	(33, 4, 'Qui perferendis voluptas perferendis', 'Eligendi quam quibusdam aut omnis voluptatum. Eaque et et sed eum inventore doloribus et. Quis explicabo earum eius est.', NULL, '2025-06-05 02:55:24', '2025-06-02', '2025-06-05', 'hourly', 187.48, NULL, NULL, NULL, NULL, 3, 1, 1, '2025-06-02 02:55:24', '2025-06-04 18:55:24', 'active', 0, NULL),
	(34, 7, 'Qui ut rerum repellendus', 'Enim id maxime molestiae eum reiciendis sequi. Atque numquam et ut aut.', NULL, '2025-06-16 17:52:40', '2025-06-14', '2025-06-16', 'hourly', 760.59, NULL, NULL, 'completed', NULL, 3, 3, 3, '2025-06-14 17:52:40', '2025-06-16 09:52:40', 'active', 0, NULL),
	(35, 5, 'Facilis doloribus libero id id', 'Qui et aut sunt dolores tenetur ab. Ducimus sunt non est soluta. Enim voluptas possimus et labore.', NULL, '2025-05-30 23:36:58', '2025-05-25', '2025-06-03', 'fixed', 944.25, NULL, NULL, NULL, NULL, 6, 4, 5, '2025-05-25 23:36:58', '2025-06-03 15:36:58', 'active', 0, NULL),
	(36, 2, 'Magni exercitationem aut voluptatem fugit', 'Non minima est dicta earum. Sequi possimus ut dolore vel. Expedita qui et laborum corrupti beatae pariatur omnis omnis.', NULL, '2025-06-17 04:12:42', '2025-06-15', '2025-06-22', 'fixed', 930.31, NULL, NULL, 'in_progress', NULL, 7, 5, 5, '2025-06-15 04:12:42', '2025-06-21 20:12:42', 'active', 0, NULL),
	(37, 2, 'Qui animi quo aut sunt', 'Et amet est qui aut. Et architecto ut ut modi quo dolore. Quo velit quo assumenda aspernatur accusantium sit. Qui nisi vel modi at.', NULL, '2025-06-08 07:19:40', '2025-06-04', '2025-06-09', 'fixed', 146.47, NULL, NULL, 'pending', NULL, 3, 4, 4, '2025-06-04 07:19:40', '2025-06-08 23:19:40', 'active', 0, NULL),
	(38, 9, 'Est distinctio quo', 'Suscipit voluptas dolore sit ut. Quasi omnis dolor occaecati nam nihil laborum est reprehenderit.', NULL, '2025-06-13 17:35:22', '2025-06-12', '2025-06-21', 'daily', 530.66, NULL, NULL, 'completed', NULL, 7, 3, 3, '2025-06-12 17:35:22', '2025-06-21 09:35:22', 'active', 0, NULL),
	(39, 3, 'Architecto aspernatur quaerat excepturi ea', 'Mollitia et perferendis ut hic sed consequatur quis. Autem placeat et enim aperiam. Magnam voluptatum eaque optio velit.', NULL, '2025-06-12 02:52:55', '2025-06-08', '2025-06-17', 'daily', 545.88, NULL, NULL, 'cancelled', NULL, 1, 1, 2, '2025-06-08 02:52:55', '2025-06-16 18:52:55', 'active', 0, NULL),
	(40, 4, 'Fugit odit quos nobis illum', 'Natus fugit recusandae est ipsum nisi. Amet nemo suscipit et non. Tempore temporibus in perferendis aut.', NULL, '2025-06-18 00:02:04', '2025-06-13', '2025-06-21', 'daily', 955.71, NULL, NULL, NULL, NULL, 1, 5, 5, '2025-06-13 00:02:04', '2025-06-20 16:02:04', 'active', 0, NULL),
	(41, 2, 'Quia vero eum exercitationem quibusdam', 'Ut ipsum soluta vero. Consequatur optio in quia quis. Voluptas culpa culpa et et eveniet.', NULL, '2025-05-28 01:07:24', '2025-05-27', '2025-06-02', 'hourly', 951.41, NULL, NULL, NULL, NULL, 10, 1, 4, '2025-05-27 01:07:24', '2025-06-01 17:07:24', 'active', 0, NULL),
	(42, 5, 'Voluptas et ullam quas at', 'Ratione qui quasi odio est. Voluptate repudiandae aut nihil aliquid deleniti. Rerum nostrum voluptas ad est distinctio.', NULL, '2025-06-18 20:17:34', '2025-06-14', '2025-06-22', 'daily', 358.89, NULL, NULL, 'cancelled', NULL, 4, 4, 1, '2025-06-14 20:17:34', '2025-06-22 12:17:34', 'active', 0, NULL),
	(43, 6, 'Culpa aut consequatur qui ab', 'Rem et voluptas sed eum eum architecto. Nesciunt dolor placeat nesciunt molestiae sed animi. Aliquid esse omnis sapiente officiis explicabo sed.', NULL, '2025-06-01 21:21:28', '2025-05-28', '2025-06-01', 'daily', 684.51, NULL, NULL, NULL, NULL, 10, 4, 3, '2025-05-28 21:21:28', '2025-06-01 13:21:28', 'active', 0, NULL),
	(44, 8, 'Animi ab ea aut omnis', 'Iure facere facere in qui reprehenderit vitae deserunt. Debitis aut voluptatem nobis repellat. Aut voluptatem molestias rerum aut.', NULL, '2025-06-10 19:06:47', '2025-06-06', '2025-06-14', 'fixed', 978.43, NULL, NULL, 'completed', NULL, 9, 5, 3, '2025-06-06 19:06:47', '2025-06-14 11:06:47', 'active', 0, NULL),
	(45, 7, 'Atque nulla aut numquam', 'Deserunt sed cupiditate ab eaque laudantium ut. Animi voluptatibus earum magni earum sed. Ab est aut modi. Aut enim ut officia. Earum et adipisci ut.', NULL, '2025-06-08 02:26:53', '2025-06-07', '2025-06-17', 'daily', 293.04, NULL, NULL, 'cancelled', NULL, 7, 3, 5, '2025-06-07 02:26:53', '2025-06-16 18:26:53', 'active', 0, NULL),
	(46, 10, 'Aut aspernatur cum error iusto', 'Nobis sapiente maxime optio ipsam et. Qui occaecati consequatur sint. Ea et facere voluptatem id.', NULL, '2025-05-30 15:49:38', '2025-05-26', '2025-06-03', 'hourly', 104.39, NULL, NULL, 'pending', NULL, 8, 3, 2, '2025-05-26 15:49:38', '2025-06-03 07:49:38', 'active', 0, NULL),
	(47, 3, 'Labore reprehenderit modi quis sit aut', 'Velit dicta cupiditate molestias similique vero. Sint et commodi eos eaque totam sunt. Voluptatem impedit autem veritatis nemo.', NULL, '2025-06-26 11:47:13', '2025-06-21', '2025-06-23', 'daily', 455.77, NULL, NULL, 'in_progress', NULL, 9, 1, 3, '2025-06-21 11:47:13', '2025-06-23 03:47:13', 'active', 0, NULL),
	(48, 4, 'Repellat totam impedit sit temporibus id', 'Eveniet doloremque architecto mollitia quaerat voluptas. Voluptatem molestiae consequatur nisi alias sed et. Et rem et expedita.', NULL, '2025-06-23 16:08:16', '2025-06-20', '2025-06-23', 'daily', 600.00, '{"latitude":9.773559348848737,"longitude":125.49141371537763}', 'Cayutan, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', 'pending', '[1]', 8, 3, 4, '2025-06-20 16:08:16', '2025-07-05 21:23:34', 'active', 0, NULL),
	(49, 3, 'Laboriosam voluptatem nostrum qui', 'Porro deserunt rerum et nihil. Eius enim ea ea autem dolores. Saepe atque sit molestiae nam et voluptas vitae vel.', NULL, '2025-06-04 06:11:37', '2025-05-30', '2025-06-09', 'daily', 608.99, NULL, NULL, 'completed', NULL, 10, 1, 2, '2025-05-30 06:11:37', '2025-06-08 22:11:37', 'active', 0, NULL),
	(50, 7, 'Tempora quis reiciendis repellat blanditiis', 'Recusandae sint voluptatem eum. Veritatis aliquid eaque id beatae qui.', NULL, '2025-06-25 06:49:00', '2025-06-23', '2025-06-24', 'daily', 260.64, NULL, NULL, 'pending', NULL, 2, 2, 2, '2025-06-23 06:49:00', '2025-06-23 22:49:00', 'active', 0, NULL),
	(51, 1, 'Similique magnam eligendi explicabo quia sed', 'Praesentium unde repudiandae est voluptas quis consequatur. Inventore necessitatibus occaecati beatae quis molestias.', NULL, '2025-06-01 07:23:11', '2025-05-29', '2025-06-05', 'hourly', 516.45, NULL, NULL, 'completed', NULL, 5, 5, 2, '2025-05-29 07:23:11', '2025-06-04 23:23:11', 'active', 0, NULL),
	(52, 8, 'Maxime magni ut sed blanditiis', 'Pariatur laudantium at doloremque enim aut sapiente suscipit. Necessitatibus ut omnis et laboriosam aperiam ut. Qui quo ex eaque et vero ex.', NULL, '2025-06-13 20:34:12', '2025-06-12', '2025-06-19', 'hourly', 548.48, NULL, NULL, 'in_progress', NULL, 8, 2, 3, '2025-06-12 20:34:12', '2025-06-19 12:34:12', 'active', 0, NULL),
	(53, 1, 'Cum dolore sint consectetur', 'Vel cumque pariatur aut. Voluptatem eos qui necessitatibus autem velit. Doloremque commodi omnis velit iure nemo velit modi.', NULL, '2025-06-18 17:15:36', '2025-06-17', '2025-06-25', 'daily', 785.17, '{"latitude":9.783607932334863,"longitude":125.49558891239958}', 'Prince Town, Espina Street, Espina Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', 'pending', '[1, 2, 3, 5, 7]', 2, 1, 1, '2025-06-17 17:15:36', '2025-07-02 00:21:20', 'active', 0, NULL),
	(54, 3, 'Nesciunt facere pariatur vitae asperiores', 'Quia et voluptatem est cum est nemo sit. Laboriosam expedita qui sed libero a odio nisi. Commodi corrupti sit est eaque dicta assumenda qui.', NULL, '2025-06-26 06:29:19', '2025-06-22', '2025-06-29', 'fixed', 908.96, NULL, NULL, 'in_progress', NULL, 7, 1, 1, '2025-06-22 06:29:19', '2025-06-28 22:29:19', 'active', 0, NULL),
	(55, 3, 'Iure voluptatem quia', 'Et minus ipsum harum nobis dolores ratione. Et quia aperiam dolor delectus.', NULL, '2025-06-23 08:28:04', '2025-06-22', '2025-06-28', 'hourly', 642.98, NULL, NULL, NULL, NULL, 9, 1, 5, '2025-06-22 08:28:04', '2025-06-28 00:28:04', 'active', 0, NULL),
	(56, 5, 'Ea voluptatem non quas vitae', 'Vel ullam nihil atque. Officiis neque voluptate corrupti eligendi temporibus voluptatem. Quo ab veritatis est id. Maiores qui et quibusdam odio.', NULL, '2025-06-10 16:32:19', '2025-06-09', '2025-06-12', 'daily', 716.09, NULL, NULL, 'pending', NULL, 3, 4, 2, '2025-06-09 16:32:19', '2025-06-12 08:32:19', 'active', 0, NULL),
	(57, 6, 'Officiis sed deserunt tenetur', 'Alias aperiam et officia illo eius minus doloribus. Laboriosam vel dignissimos impedit. Et vero ut laudantium in.', NULL, '2025-06-07 00:48:14', '2025-06-05', '2025-06-06', 'daily', 720.05, NULL, NULL, NULL, NULL, 9, 3, 2, '2025-06-05 00:48:14', '2025-06-05 16:48:14', 'active', 0, NULL),
	(58, 5, 'Quasi iure similique nihil iusto autem', 'Praesentium voluptatibus quia officiis autem ex eaque consectetur. Et quia alias minus reiciendis. Similique facilis eos excepturi rerum.', NULL, '2025-05-30 15:03:19', '2025-05-29', '2025-06-05', 'daily', 369.65, NULL, NULL, 'cancelled', NULL, 4, 5, 3, '2025-05-29 15:03:19', '2025-06-05 07:03:19', 'active', 0, NULL),
	(59, 2, 'Ut consectetur eaque voluptatem fugit', 'Modi occaecati vel et veritatis. Reiciendis sed dicta natus accusantium. Officia neque harum libero et.', NULL, '2025-06-07 14:32:00', '2025-06-03', '2025-06-11', 'hourly', 272.67, NULL, NULL, NULL, NULL, 5, 1, 5, '2025-06-03 14:32:00', '2025-06-11 06:32:00', 'active', 0, NULL),
	(60, 5, 'Omnis molestiae unde commodi voluptas', 'Libero numquam neque rerum saepe iusto. Et qui qui dolore in itaque accusamus explicabo. Et quis voluptatem ducimus pariatur.', NULL, '2025-06-13 01:53:19', '2025-06-10', '2025-06-11', 'fixed', 596.87, NULL, NULL, 'in_progress', NULL, 2, 3, 3, '2025-06-10 01:53:19', '2025-06-10 17:53:19', 'active', 0, NULL),
	(61, 6, 'Distinctio vitae reiciendis dignissimos', 'Facilis mollitia doloribus sint nihil. Eligendi quas est id consequatur vel. Delectus dolorum aspernatur amet maiores.', NULL, '2025-06-24 16:01:00', '2025-06-21', '2025-06-24', 'hourly', 595.86, NULL, NULL, 'cancelled', NULL, 2, 5, 3, '2025-06-21 16:01:00', '2025-06-24 08:01:00', 'active', 0, NULL),
	(62, 6, 'Ipsum in qui animi', 'Facere quaerat voluptatem excepturi quod itaque fuga nobis. Delectus sit eum odio aut. Autem ut itaque nihil illo vel aspernatur voluptatem.', NULL, '2025-06-20 19:53:29', '2025-06-17', '2025-06-25', 'hourly', 464.08, NULL, NULL, 'completed', NULL, 4, 5, 3, '2025-06-17 19:53:29', '2025-06-25 11:53:29', 'active', 0, NULL),
	(63, 2, 'Qui placeat atque sed', 'Architecto dolorem omnis pariatur totam maiores. Dolorum inventore aut voluptatum. Fugiat et voluptas reiciendis atque sapiente pariatur quae.', NULL, '2025-06-11 02:02:42', '2025-06-06', '2025-06-15', 'daily', 829.72, NULL, NULL, 'in_progress', NULL, 2, 5, 4, '2025-06-06 02:02:42', '2025-06-14 18:02:42', 'active', 0, NULL),
	(64, 6, 'Voluptatem excepturi itaque expedita blanditiis', 'Consequatur sed et nulla aut eligendi dolores ut. Eum tenetur dicta adipisci quia. Ut nam eos non aut consectetur.', NULL, '2025-06-11 14:34:37', '2025-06-08', '2025-06-12', 'daily', 312.30, NULL, NULL, 'in_progress', NULL, 7, 2, 2, '2025-06-08 14:34:37', '2025-06-12 06:34:37', 'active', 0, NULL),
	(65, 7, 'Molestiae facere rerum cumque ducimus', 'Temporibus et eum reprehenderit quod aut ipsum. Illum voluptatem molestiae ab dolore ex. Eum in quis dolores voluptatem veniam molestiae aperiam.', NULL, '2025-06-14 13:54:49', '2025-06-12', '2025-06-17', 'fixed', 465.89, NULL, NULL, 'in_progress', NULL, 6, 3, 4, '2025-06-12 13:54:49', '2025-06-17 05:54:49', 'active', 0, NULL),
	(66, 1, 'Et quibusdam atque natus doloremque', 'Voluptatem nihil consequatur quaerat ipsum. Dolorem provident veniam voluptate velit. Laborum eveniet a numquam quia perferendis.', NULL, '2025-05-28 14:03:57', '2025-05-26', '2025-05-29', 'daily', 917.62, NULL, NULL, NULL, NULL, 8, 2, 4, '2025-05-26 14:03:57', '2025-05-29 06:03:57', 'active', 0, NULL),
	(67, 5, 'Animi error id', 'Error repudiandae cum et. Velit quas quam officia necessitatibus nostrum excepturi repellendus. Ut placeat fugit quod ratione officiis.', NULL, '2025-06-01 07:46:31', '2025-05-30', '2025-05-31', 'hourly', 395.66, NULL, NULL, 'cancelled', NULL, 5, 1, 3, '2025-05-30 07:46:31', '2025-05-30 23:46:31', 'active', 0, NULL),
	(68, 7, 'Dicta consequatur explicabo itaque voluptatem', 'Ipsum repellendus et praesentium harum iste. Consequatur aut beatae cupiditate. Nobis omnis nostrum fuga accusantium qui.', NULL, '2025-06-18 04:43:04', '2025-06-13', '2025-06-17', 'hourly', 505.11, NULL, NULL, 'pending', NULL, 10, 1, 1, '2025-06-13 04:43:04', '2025-06-16 20:43:04', 'active', 0, NULL),
	(69, 3, 'Reiciendis aperiam vel labore nihil provident', 'Maxime minus est omnis quos. Aut ipsum consequatur ex inventore. Cum sapiente praesentium sunt qui et. Commodi labore nihil aut rerum impedit.', NULL, '2025-06-17 21:25:40', '2025-06-12', '2025-06-17', 'daily', 747.70, NULL, NULL, 'completed', NULL, 3, 1, 3, '2025-06-12 21:25:40', '2025-06-17 13:25:40', 'active', 0, NULL),
	(70, 6, 'In iste dolorem inventore', 'Ea ipsa molestiae soluta autem aut. Dolorum facilis incidunt qui. Ab ex et veritatis voluptatem harum.', NULL, '2025-06-06 03:11:09', '2025-06-02', '2025-06-06', 'fixed', 525.81, NULL, NULL, NULL, NULL, 5, 4, 4, '2025-06-02 03:11:09', '2025-06-05 19:11:09', 'active', 0, NULL),
	(71, 5, 'Culpa ut rerum et et', 'Enim omnis dolore voluptatem odio. Enim et et delectus reprehenderit dolorem fugiat consequatur.', NULL, '2025-06-20 03:09:00', '2025-06-16', '2025-06-22', 'hourly', 969.34, NULL, NULL, NULL, NULL, 5, 4, 5, '2025-06-16 03:09:00', '2025-06-21 19:09:00', 'active', 0, NULL),
	(72, 7, 'Molestiae ullam rerum ipsum molestias', 'Cum et voluptatum et sit voluptatem et. Vel dolorem quia laboriosam. Enim magnam qui impedit rerum veritatis dolore.', NULL, '2025-06-06 09:02:29', '2025-06-03', '2025-06-09', 'hourly', 443.00, NULL, NULL, 'pending', NULL, 9, 4, 5, '2025-06-03 09:02:29', '2025-06-09 01:02:29', 'active', 0, NULL),
	(73, 9, 'Dolores aut similique voluptatem consequatur', 'Et et et et id quo. Cupiditate aliquam et doloremque et enim nihil. Ea deserunt voluptatem quaerat dolores.', NULL, '2025-06-03 10:53:37', '2025-05-29', '2025-06-01', 'hourly', 789.36, NULL, NULL, 'cancelled', NULL, 2, 1, 4, '2025-05-29 10:53:37', '2025-06-01 02:53:37', 'active', 0, NULL),
	(74, 10, 'Cum inventore id laborum aut', 'Illo porro quam fugit praesentium. Doloremque quos aut magnam ea quo officia blanditiis.', NULL, '2025-06-20 06:02:38', '2025-06-16', '2025-06-21', 'fixed', 474.27, NULL, NULL, 'in_progress', NULL, 10, 3, 4, '2025-06-16 06:02:38', '2025-06-20 22:02:38', 'active', 0, NULL),
	(75, 3, 'Exercitationem similique nemo inventore voluptatem consequatur', 'Expedita in quisquam ratione eaque quia magni. Sapiente aut totam veritatis ea. Neque facilis id explicabo qui ad dolores voluptatum.', NULL, '2025-05-29 23:41:02', '2025-05-28', '2025-06-06', 'daily', 450.56, NULL, NULL, 'pending', NULL, 10, 1, 4, '2025-05-28 23:41:02', '2025-06-06 15:41:02', 'active', 0, NULL),
	(76, 10, 'Tenetur nesciunt adipisci suscipit', 'Eius aut expedita inventore repellat qui cum. Id rerum cum dolor est quia et iste quis. Quod hic exercitationem facere corporis.', NULL, '2025-05-30 16:14:59', '2025-05-26', '2025-05-31', 'daily', 339.79, NULL, NULL, 'completed', NULL, 10, 5, 5, '2025-05-26 16:14:59', '2025-05-31 08:14:59', 'active', 0, NULL),
	(77, 10, 'Aperiam aut nihil quo sed', 'Adipisci itaque ullam doloribus. Iste consectetur voluptatem esse necessitatibus ea aliquid reiciendis quis.', NULL, '2025-06-24 02:09:02', '2025-06-20', '2025-06-29', 'daily', 808.59, NULL, NULL, 'cancelled', NULL, 9, 5, 5, '2025-06-20 02:09:02', '2025-06-28 18:09:02', 'active', 0, NULL),
	(78, 7, 'Eligendi fugiat beatae eaque expedita rem', 'Earum voluptatem rerum nesciunt et. Quis unde quos et est. Omnis maiores rerum aliquam.', NULL, '2025-06-19 15:33:43', '2025-06-16', '2025-06-25', 'fixed', 458.17, NULL, NULL, 'in_progress', NULL, 3, 1, 2, '2025-06-16 15:33:43', '2025-06-25 07:33:43', 'active', 0, NULL),
	(79, 5, 'Repellendus dicta velit', 'Quis sunt quae nulla ut optio. Earum nisi et et neque eaque soluta et. Perferendis cumque ipsa consequatur ratione error excepturi.', NULL, '2025-06-04 18:40:20', '2025-06-02', '2025-06-04', 'hourly', 527.48, NULL, NULL, NULL, NULL, 6, 4, 1, '2025-06-02 18:40:20', '2025-06-04 10:40:20', 'active', 0, NULL),
	(80, 3, 'Nihil temporibus ut rerum sit', 'Odio molestiae aliquam velit repellat sunt sit. Voluptas perspiciatis in id illo dolor dolore. Unde velit dolorem accusamus aut.', NULL, '2025-06-24 06:49:32', '2025-06-19', '2025-06-25', 'hourly', 674.65, NULL, NULL, 'pending', NULL, 1, 5, 5, '2025-06-19 06:49:32', '2025-06-24 22:49:32', 'active', 0, NULL),
	(81, 6, 'Aut et recusandae magni consectetur', 'Praesentium non minus est qui cupiditate. Molestiae esse hic autem et. Fuga in et ex laboriosam.', NULL, '2025-06-25 17:36:35', '2025-06-20', '2025-06-26', 'fixed', 100.34, NULL, NULL, 'pending', NULL, 1, 2, 4, '2025-06-20 17:36:35', '2025-06-26 09:36:35', 'active', 0, NULL),
	(82, 9, 'Ab ea adipisci accusamus aut', 'Exercitationem repellat id expedita vero asperiores et. Sequi numquam et ea ducimus. Magni excepturi qui est tenetur.', NULL, '2025-06-20 00:26:47', '2025-06-15', '2025-06-25', 'daily', 769.03, NULL, NULL, 'in_progress', NULL, 9, 4, 4, '2025-06-15 00:26:47', '2025-06-24 16:26:47', 'active', 0, NULL),
	(83, 4, 'Recusandae est omnis tempore et accusantium', 'Assumenda reiciendis quia facere quidem nihil harum. Autem qui praesentium architecto dolor dicta amet. Autem modi nemo qui magnam.', NULL, '2025-06-17 23:28:04', '2025-06-15', '2025-06-21', 'daily', 700.47, NULL, NULL, 'cancelled', NULL, 5, 5, 4, '2025-06-15 23:28:04', '2025-06-21 15:28:04', 'active', 0, NULL),
	(84, 6, 'Fuga qui consequatur harum placeat', 'Dolor non in repellendus tempora repellat laboriosam. Nihil et beatae quia dolorem cupiditate. Cupiditate vitae voluptas nam ipsum eius.', NULL, '2025-06-15 23:22:16', '2025-06-10', '2025-06-19', 'fixed', 213.32, NULL, NULL, NULL, NULL, 3, 4, 5, '2025-06-10 23:22:16', '2025-06-19 15:22:16', 'active', 0, NULL),
	(85, 6, 'Culpa ullam non voluptatibus dolores', 'Excepturi quasi et iure. Eius nulla est repellat sapiente at id. Omnis et odit et maxime sed quod. Officia non architecto omnis qui.', NULL, '2025-06-14 18:15:45', '2025-06-11', '2025-06-13', 'hourly', 548.54, NULL, NULL, NULL, NULL, 7, 1, 1, '2025-06-11 18:15:45', '2025-06-13 10:15:45', 'active', 0, NULL),
	(86, 4, 'Earum corrupti quam dolore fugit', 'Sit consequatur eum est placeat dolorem. Quos harum dolorum incidunt vel cum. Libero quae molestiae libero consequatur quas dolor quam.', NULL, '2025-06-12 10:22:00', '2025-06-10', '2025-06-16', 'daily', 323.01, NULL, NULL, 'in_progress', NULL, 1, 2, 5, '2025-06-10 10:22:00', '2025-06-16 02:22:00', 'active', 0, NULL),
	(87, 1, 'Aperiam omnis doloribus', 'Autem nihil at occaecati porro est tenetur ad dolores. Aut quasi veritatis ut quo facilis sit. Ut hic aliquid ad animi.', NULL, '2025-06-16 22:51:19', '2025-06-14', '2025-06-16', 'hourly', 121.66, NULL, NULL, 'pending', NULL, 10, 1, 4, '2025-06-14 22:51:19', '2025-06-16 14:51:19', 'active', 0, NULL),
	(88, 4, 'Dolor omnis corrupti', 'Molestias et fuga voluptas ad necessitatibus. Ea est fuga laudantium in reprehenderit cum. At ipsa laboriosam porro aut neque.', NULL, '2025-06-10 11:34:57', '2025-06-09', '2025-06-15', 'daily', 155.23, NULL, NULL, NULL, NULL, 2, 5, 4, '2025-06-09 11:34:57', '2025-06-15 03:34:57', 'active', 0, NULL),
	(89, 7, 'Debitis soluta incidunt', 'Rerum et dolorem quasi error illo sunt in numquam. Sunt id id et. Est amet ut modi pariatur ea sapiente. Rem aut velit unde maiores dolorum aut.', NULL, '2025-06-12 00:07:10', '2025-06-09', '2025-06-14', 'fixed', 724.23, NULL, NULL, 'cancelled', NULL, 10, 5, 2, '2025-06-09 00:07:10', '2025-06-13 16:07:10', 'active', 0, NULL),
	(90, 3, 'Odio perspiciatis aliquid et', 'Ut veritatis modi quasi eaque ab. Ipsa vero quaerat iusto vitae dolorum facilis. Minima qui eaque nihil ut consequatur fuga.', NULL, '2025-06-24 05:49:16', '2025-06-21', '2025-06-26', 'hourly', 359.96, NULL, NULL, 'cancelled', NULL, 3, 3, 4, '2025-06-21 05:49:16', '2025-06-25 21:49:16', 'active', 0, NULL),
	(91, 2, 'Qui necessitatibus est sunt tempore qui', 'Modi quos molestiae eum doloribus. Molestias vitae neque voluptatum amet alias eum.', NULL, '2025-06-14 20:15:19', '2025-06-10', '2025-06-15', 'hourly', 979.53, NULL, NULL, NULL, NULL, 10, 3, 5, '2025-06-10 20:15:19', '2025-06-15 12:15:19', 'active', 0, NULL),
	(92, 5, 'Nostrum et aut corrupti ipsum placeat', 'Magni et voluptas dolorem est. Libero ducimus qui impedit impedit. Cupiditate dolor minima consectetur. Facilis laborum dolorum est quia.', NULL, '2025-05-31 01:52:55', '2025-05-30', '2025-06-03', 'hourly', 673.58, NULL, NULL, 'pending', NULL, 6, 1, 1, '2025-05-30 01:52:55', '2025-06-02 17:52:55', 'active', 0, NULL),
	(93, 2, 'Sint libero maxime', 'Qui magni beatae et. Aut eaque et delectus sed.', NULL, '2025-06-16 07:14:20', '2025-06-15', '2025-06-17', 'fixed', 761.54, NULL, NULL, 'pending', NULL, 1, 5, 5, '2025-06-15 07:14:20', '2025-06-16 23:14:20', 'active', 0, NULL),
	(94, 8, 'Voluptas voluptatem assumenda', 'Commodi qui nemo omnis aut vel deleniti asperiores. Vel magni voluptatem ipsam molestiae tempora vel aut. Atque dignissimos eligendi et adipisci et.', NULL, '2025-06-24 23:19:51', '2025-06-22', '2025-06-29', 'fixed', 833.14, NULL, NULL, NULL, NULL, 9, 5, 3, '2025-06-22 23:19:51', '2025-06-29 15:19:51', 'active', 0, NULL),
	(95, 4, 'Ut voluptas eum excepturi', 'Asperiores repellendus quasi deleniti facere et quia aliquam. Aliquam exercitationem ut error quaerat culpa omnis. Eius iure quas nam.', NULL, '2025-05-30 16:46:13', '2025-05-27', '2025-06-05', 'hourly', 481.76, NULL, NULL, 'cancelled', NULL, 3, 3, 1, '2025-05-27 16:46:13', '2025-06-05 08:46:13', 'active', 0, NULL),
	(96, 8, 'Quia id nostrum ipsa dolorum cumque', 'Consequatur voluptatum itaque nostrum et quis voluptates assumenda. Porro nulla suscipit iste recusandae sequi velit. Eaque adipisci eligendi est ex.', NULL, '2025-06-20 01:37:08', '2025-06-16', '2025-06-19', 'daily', 900.94, NULL, NULL, 'completed', NULL, 4, 4, 4, '2025-06-16 01:37:08', '2025-06-18 17:37:08', 'active', 0, NULL),
	(97, 5, 'Perspiciatis aut ex non', 'Aut assumenda sapiente doloribus voluptatibus tempore vel accusantium. Nostrum quisquam soluta et. Voluptatum impedit ut sit rem optio pariatur.', NULL, '2025-06-05 06:57:34', '2025-05-31', '2025-06-06', 'hourly', 993.17, NULL, NULL, NULL, NULL, 3, 4, 4, '2025-05-31 06:57:34', '2025-06-05 22:57:34', 'active', 0, NULL),
	(98, 5, 'Aperiam quae consequatur quasi voluptate', 'Eos sed vel aliquid voluptatem odio quia. Aut rerum vero adipisci quia. Sunt dicta dolore nam ut asperiores magnam.', NULL, '2025-06-04 12:58:50', '2025-05-31', '2025-06-07', 'hourly', 515.69, NULL, NULL, NULL, NULL, 2, 1, 2, '2025-05-31 12:58:50', '2025-06-07 04:58:50', 'active', 0, NULL),
	(99, 3, 'Omnis magnam neque nemo veniam', 'Consequatur sit dolorem asperiores ut. Occaecati est quia recusandae doloribus.', NULL, '2025-06-28 00:07:53', '2025-06-24', '2025-06-29', 'fixed', 892.40, NULL, NULL, NULL, NULL, 6, 5, 5, '2025-06-24 00:07:53', '2025-06-28 16:07:53', 'active', 0, NULL),
	(100, 1, 'Maiores et sed iusto culpa aliquam', 'Est et velit id explicabo. Modi error accusantium repudiandae dolorum quos reprehenderit non. Minus numquam fuga laborum ad nulla laudantium qui.', NULL, '2025-06-01 09:11:45', '2025-05-31', '2025-06-10', 'fixed', 265.60, NULL, NULL, 'completed', NULL, 4, 4, 3, '2025-05-31 09:11:45', '2025-06-10 01:11:45', 'active', 0, NULL),
	(101, 9, 'Totam blanditiis veritatis ex et', 'Ducimus est asperiores sequi quia rerum. Animi explicabo amet amet non doloremque. Omnis quisquam quaerat qui eum laborum.', NULL, '2025-06-08 17:39:29', '2025-06-04', '2025-06-06', 'daily', 844.75, NULL, NULL, 'pending', NULL, 10, 5, 5, '2025-06-04 17:39:29', '2025-06-06 09:39:29', 'active', 0, NULL),
	(102, 5, 'Qui facere sunt omnis est', 'Omnis fuga molestiae labore. Placeat qui laudantium error sit numquam et tempore. Omnis sit cupiditate dolorum et dolorem.', NULL, '2025-05-30 12:01:31', '2025-05-28', '2025-06-03', 'hourly', 920.34, NULL, NULL, NULL, NULL, 5, 3, 3, '2025-05-28 12:01:31', '2025-06-03 04:01:31', 'active', 0, NULL),
	(103, 5, 'Illo sunt fuga', 'Dolores beatae explicabo voluptatem ipsam. In quam dolorum quis sint tempora libero aut nihil.', NULL, '2025-06-09 04:45:40', '2025-06-06', '2025-06-10', 'fixed', 763.34, NULL, NULL, 'in_progress', NULL, 3, 2, 1, '2025-06-06 04:45:40', '2025-06-09 20:45:40', 'active', 0, NULL),
	(104, 8, 'Ex consequatur corrupti dolorem veritatis', 'Dolor commodi ad aut sunt. Ea quam beatae omnis molestias ab voluptatibus vero quas. Dolor odit qui officiis atque ut hic.', NULL, '2025-06-08 15:04:39', '2025-06-05', '2025-06-12', 'hourly', 280.14, NULL, NULL, NULL, NULL, 5, 1, 2, '2025-06-05 15:04:39', '2025-06-12 07:04:39', 'active', 0, NULL),
	(105, 6, 'Officia quae rerum repudiandae', 'Numquam minus inventore aut molestiae quam voluptatem. Repudiandae consequatur ut doloribus ducimus aliquam autem. Unde ut nulla eos.', NULL, '2025-05-31 08:07:13', '2025-05-29', '2025-06-02', 'fixed', 890.63, NULL, NULL, 'cancelled', NULL, 6, 4, 3, '2025-05-29 08:07:13', '2025-06-02 00:07:13', 'active', 0, NULL),
	(106, 4, 'Harum fugiat tempore', 'Sequi eos id facere earum at asperiores totam. Maiores ea iure aliquid labore voluptatem voluptatum nemo. Et dicta non nisi quae velit labore sed.', NULL, '2025-07-06 00:20:00', '2025-07-07', '2025-07-15', 'Fixed', 850.96, '{"latitude":9.785780266554077,"longitude":125.48592987514928}', 'Pio Castro Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', 'cancelled', '[1,2,3,4,5,6,7]', 10, 1, 4, '2025-06-22 08:20:02', '2025-07-06 11:17:59', 'active', 0, NULL),
	(107, 7, 'Hic nostrum cupiditate non qui', 'Sed aut quae tempore alias ut mollitia. Neque et accusamus iusto voluptas ut ut. Officia eos aspernatur pariatur enim ducimus.', NULL, '2025-06-10 06:40:03', '2025-06-08', '2025-06-11', 'fixed', 720.05, NULL, NULL, 'in_progress', NULL, 10, 3, 5, '2025-06-08 06:40:03', '2025-06-10 22:40:03', 'active', 0, NULL),
	(108, 8, 'Corporis hic magni quaerat aliquid', 'Provident voluptas non id. Modi ratione autem reiciendis amet rerum. Eaque amet exercitationem repellat dolores deserunt id.', NULL, '2025-06-18 19:43:20', '2025-06-13', '2025-06-14', 'hourly', 241.23, NULL, NULL, 'completed', NULL, 4, 3, 1, '2025-06-13 19:43:20', '2025-06-14 11:43:20', 'active', 0, NULL),
	(109, 9, 'Labore perferendis officiis molestias voluptatem', 'Ipsa vel tenetur omnis non sit alias. Exercitationem ut laborum eligendi quisquam qui blanditiis quod. Vel numquam ipsa voluptates qui esse dolore.', NULL, '2025-06-21 21:48:10', '2025-06-16', '2025-06-22', 'fixed', 434.81, NULL, NULL, NULL, NULL, 7, 5, 2, '2025-06-16 21:48:10', '2025-06-22 13:48:10', 'active', 0, NULL),
	(110, 5, 'Ut molestias velit aut', 'Est aut nihil delectus nam ea. Quidem velit sit velit laudantium. Ut atque ipsa a debitis.', NULL, '2025-06-03 13:11:46', '2025-05-29', '2025-06-01', 'hourly', 584.64, NULL, NULL, 'pending', NULL, 5, 2, 1, '2025-05-29 13:11:46', '2025-06-01 05:11:46', 'active', 0, NULL),
	(111, 10, 'Laborum eveniet qui', 'Dolores ad et laudantium in ut iste. Nihil assumenda dolore ut recusandae vero. Illum sed libero corporis dolores vitae. Omnis est in ea illo quidem.', NULL, '2025-06-27 21:20:09', '2025-06-23', '2025-06-29', 'hourly', 508.56, NULL, NULL, NULL, NULL, 8, 2, 3, '2025-06-23 21:20:09', '2025-06-29 13:20:09', 'active', 0, NULL),
	(112, 7, 'Ut inventore est voluptatem quasi consectetur', 'Praesentium et temporibus ut et non. Soluta culpa omnis corrupti dolorem qui. Exercitationem quis et non voluptatem consequatur aliquid error.', NULL, '2025-06-01 14:23:41', '2025-05-29', '2025-06-03', 'fixed', 946.23, NULL, NULL, NULL, NULL, 2, 1, 3, '2025-05-29 14:23:41', '2025-06-03 06:23:41', 'active', 0, NULL),
	(113, 1, 'Eaque cumque neque ipsum', 'Nostrum ut non nemo. Sunt asperiores a voluptatem consequatur qui. Sequi numquam magnam rerum sunt. Dolorem dolorum est ratione.', NULL, '2025-06-23 01:57:58', '2025-06-21', '2025-06-25', 'fixed', 784.31, NULL, NULL, 'cancelled', NULL, 9, 4, 5, '2025-06-21 01:57:58', '2025-06-24 17:57:58', 'active', 0, NULL),
	(114, 2, 'Nam et sed', 'Ullam rerum voluptatum nemo inventore exercitationem corporis. Dicta qui ut cupiditate quia a quis. Nisi aut illum sint amet.', NULL, '2025-06-18 03:48:01', '2025-06-13', '2025-06-16', 'daily', 691.70, NULL, NULL, 'pending', NULL, 6, 3, 4, '2025-06-13 03:48:01', '2025-06-15 19:48:01', 'active', 0, NULL),
	(115, 2, 'Maiores corporis est voluptas', 'Quis natus non et aut quae itaque ut possimus. Libero deleniti laudantium doloribus ea sequi. Voluptate fugiat eos et necessitatibus harum.', NULL, '2025-05-29 13:02:49', '2025-05-27', '2025-06-06', 'daily', 684.47, NULL, NULL, NULL, NULL, 9, 1, 4, '2025-05-27 13:02:49', '2025-06-06 05:02:49', 'active', 0, NULL),
	(116, 7, 'Cum nostrum voluptate', 'Voluptas sed sit laboriosam non. Ea aliquam repudiandae deleniti. Ducimus minus libero enim accusantium voluptatibus deleniti culpa est.', NULL, '2025-06-23 01:58:07', '2025-06-22', '2025-06-28', 'fixed', 853.68, NULL, NULL, 'cancelled', NULL, 5, 5, 4, '2025-06-22 01:58:07', '2025-06-27 17:58:07', 'active', 0, NULL),
	(117, 9, 'Consequuntur et eveniet est', 'Cupiditate ut quis delectus est quo consequuntur modi. Rerum omnis enim repellendus reiciendis perspiciatis id temporibus.', NULL, '2025-06-09 07:46:38', '2025-06-05', '2025-06-07', 'hourly', 944.91, NULL, NULL, 'cancelled', NULL, 5, 2, 4, '2025-06-05 07:46:38', '2025-06-06 23:46:38', 'active', 0, NULL),
	(118, 10, 'Voluptas quo ut tempore', 'Sed non facilis non et. Quos facilis autem magnam molestiae. Sit facere natus qui eum non pariatur.', NULL, '2025-06-21 16:10:17', '2025-06-19', '2025-06-22', 'fixed', 567.62, NULL, NULL, 'pending', NULL, 1, 4, 3, '2025-06-19 16:10:17', '2025-06-22 08:10:17', 'active', 0, NULL),
	(119, 10, 'Pariatur debitis iusto hic', 'Aperiam quidem ad fuga qui. In id vel qui autem possimus. Repellendus repudiandae a expedita id omnis itaque ab.', NULL, '2025-05-30 08:05:57', '2025-05-28', '2025-05-31', 'hourly', 920.29, NULL, NULL, 'in_progress', NULL, 8, 1, 1, '2025-05-28 08:05:57', '2025-05-31 00:05:57', 'active', 0, NULL),
	(120, 4, 'Nesciunt nesciunt consequatur', 'Est quia incidunt quisquam laborum. Incidunt blanditiis saepe dolores rerum. Dolorem quae eaque a voluptates laborum enim.', NULL, '2025-06-13 04:47:03', '2025-06-09', '2025-06-15', 'fixed', 259.86, NULL, NULL, 'cancelled', NULL, 9, 5, 5, '2025-06-09 04:47:03', '2025-06-14 20:47:03', 'active', 0, NULL),
	(121, 8, 'Dolor repellat molestiae', 'Nemo qui ut temporibus consequatur quia ipsa. Nihil et impedit omnis. Nihil est inventore autem odio ut qui. Rem voluptatem qui natus.', NULL, '2025-05-30 13:42:55', '2025-05-26', '2025-06-02', 'daily', 311.88, NULL, NULL, 'cancelled', NULL, 9, 5, 3, '2025-05-26 13:42:55', '2025-06-02 05:42:55', 'active', 0, NULL),
	(122, 5, 'Dolores illum autem', 'Corporis perferendis et aut mollitia blanditiis velit. Maiores voluptas id accusantium placeat. Aliquam qui consectetur quia dolor aut provident.', NULL, '2025-06-13 06:02:40', '2025-06-08', '2025-06-16', 'hourly', 254.01, NULL, NULL, 'completed', NULL, 10, 1, 1, '2025-06-08 06:02:40', '2025-06-15 22:02:40', 'active', 0, NULL),
	(123, 10, 'Labore minima laudantium alias', 'Cumque omnis modi quaerat error numquam recusandae tempore. Minima ut soluta illum cumque debitis tenetur dolores. Sit non delectus eos pariatur.', NULL, '2025-06-11 03:44:41', '2025-06-08', '2025-06-16', 'fixed', 609.95, NULL, NULL, 'pending', NULL, 8, 5, 1, '2025-06-08 03:44:41', '2025-06-15 19:44:41', 'active', 0, NULL),
	(124, 6, 'Voluptas unde velit qui dicta', 'Natus quis molestiae rerum aut sit optio. Saepe repellendus unde corrupti voluptas officiis adipisci officia. Natus nostrum magni neque quo.', NULL, '2025-06-01 20:00:14', '2025-05-30', '2025-06-04', 'daily', 870.09, NULL, NULL, 'in_progress', NULL, 9, 2, 3, '2025-05-30 20:00:14', '2025-06-04 12:00:14', 'active', 0, NULL),
	(125, 3, 'Modi aut corrupti magni', 'Dolorem ducimus accusamus sapiente doloremque alias. Nobis debitis nam sunt earum vel.', NULL, '2025-06-14 07:57:05', '2025-06-09', '2025-06-19', 'fixed', 546.81, NULL, NULL, 'completed', NULL, 1, 4, 5, '2025-06-09 07:57:05', '2025-06-18 23:57:05', 'active', 0, NULL),
	(126, 6, 'Esse error consequatur quasi', 'Illo saepe ratione et inventore maxime autem est. Sit sequi omnis reiciendis alias. Dolores labore praesentium rerum est dolores aliquam ducimus.', NULL, '2025-06-17 04:48:00', '2025-06-14', '2025-06-23', 'hourly', 805.80, NULL, NULL, NULL, NULL, 4, 4, 5, '2025-06-14 04:48:00', '2025-06-22 20:48:00', 'active', 0, NULL),
	(127, 4, 'Voluptatem alias amet voluptatibus', 'Nemo esse voluptatem dolorem asperiores. Molestias incidunt numquam laboriosam ut. Est soluta ducimus quis et. Qui nulla voluptatem impedit est.', NULL, '2025-06-05 10:51:27', '2025-05-31', '2025-06-04', 'hourly', 144.84, NULL, NULL, 'pending', NULL, 9, 3, 1, '2025-05-31 10:51:27', '2025-06-04 02:51:27', 'active', 0, NULL),
	(128, 10, 'Est quibusdam voluptas dicta', 'Ut quae cumque ea voluptatibus. Perspiciatis dicta molestiae velit voluptas earum omnis. Odit delectus minima aut natus molestiae.', NULL, '2025-06-17 17:46:15', '2025-06-13', '2025-06-15', 'fixed', 578.51, NULL, NULL, 'in_progress', NULL, 5, 2, 2, '2025-06-13 17:46:15', '2025-06-15 09:46:15', 'active', 0, NULL),
	(129, 10, 'Voluptas maiores amet qui ratione', 'Nihil aut et unde eum perferendis quo fuga voluptas. Molestiae quae voluptatem voluptas ipsam. Pariatur qui temporibus inventore.', NULL, '2025-06-10 04:23:09', '2025-06-09', '2025-06-15', 'fixed', 238.77, NULL, NULL, 'completed', NULL, 2, 3, 1, '2025-06-09 04:23:09', '2025-06-14 20:23:09', 'active', 0, NULL),
	(130, 3, 'Dolorum ad nisi assumenda rerum', 'Qui qui qui accusantium explicabo est. Accusamus soluta quasi commodi id dolorem est sint.', NULL, '2025-06-14 03:01:44', '2025-06-11', '2025-06-19', 'fixed', 529.42, NULL, NULL, 'in_progress', NULL, 9, 5, 2, '2025-06-11 03:01:44', '2025-06-18 19:01:44', 'active', 0, NULL),
	(131, 7, 'Consequatur est omnis fuga', 'Et blanditiis non itaque iusto unde sit debitis. Eos sint non quasi deserunt et qui. Inventore aut eligendi autem ducimus incidunt aut et amet.', NULL, '2025-05-30 12:02:15', '2025-05-26', '2025-06-01', 'fixed', 115.57, NULL, NULL, 'completed', NULL, 9, 5, 4, '2025-05-26 12:02:15', '2025-06-01 04:02:15', 'active', 0, NULL),
	(132, 8, 'Fugiat id quod sint quis omnis', 'Dolore sed iste velit eum. Aut magnam quisquam inventore expedita officiis ducimus non. Iure mollitia temporibus earum veniam exercitationem.', NULL, '2025-06-04 09:39:55', '2025-05-31', '2025-06-07', 'daily', 312.69, NULL, NULL, 'pending', NULL, 4, 5, 5, '2025-05-31 09:39:55', '2025-06-07 01:39:55', 'active', 0, NULL),
	(133, 8, 'In vel aspernatur', 'Deleniti error at officia. Impedit fugiat veritatis totam eius pariatur laboriosam.', NULL, '2025-05-30 04:45:48', '2025-05-28', '2025-05-30', 'daily', 576.36, NULL, NULL, 'cancelled', NULL, 4, 2, 4, '2025-05-28 04:45:48', '2025-05-29 20:45:48', 'active', 0, NULL),
	(134, 5, 'Tempore nihil voluptatum', 'Est amet doloremque consequuntur est tempora eos. Tenetur atque sed quaerat dolore libero perferendis aut. Consequuntur dignissimos qui veniam.', NULL, '2025-06-14 12:18:59', '2025-06-10', '2025-06-19', 'daily', 122.96, NULL, NULL, 'in_progress', NULL, 3, 1, 1, '2025-06-10 12:18:59', '2025-06-19 04:18:59', 'active', 0, NULL),
	(135, 3, 'Quae fugit accusamus sit porro', 'Fugit quam totam numquam quia nihil tempora. Est labore sed distinctio et perspiciatis. Non ea qui est autem dolorum reiciendis voluptates.', NULL, '2025-06-19 20:37:16', '2025-06-17', '2025-06-22', 'daily', 939.00, NULL, NULL, 'pending', NULL, 7, 1, 2, '2025-06-17 20:37:16', '2025-06-22 12:37:16', 'active', 0, NULL),
	(136, 10, 'Nihil fugiat doloribus ullam dicta', 'Nostrum velit nesciunt suscipit sed doloremque. Qui aut cum non officiis dolores. Repellat ullam nam et quam dolor saepe possimus quia.', NULL, '2025-06-25 12:26:00', '2025-06-20', '2025-06-25', 'fixed', 830.71, NULL, NULL, 'completed', NULL, 4, 5, 5, '2025-06-20 12:26:00', '2025-06-25 04:26:00', 'active', 0, NULL),
	(137, 5, 'Rem ipsam sapiente assumenda quibusdam', 'Et nobis rerum quia sapiente id enim eos ipsum. Consequatur nihil aliquam quia sint.', NULL, '2025-06-10 11:36:50', '2025-06-06', '2025-06-16', 'hourly', 188.23, NULL, NULL, NULL, NULL, 7, 3, 2, '2025-06-06 11:36:50', '2025-06-16 03:36:50', 'active', 0, NULL),
	(138, 5, 'Quod consequatur est labore', 'Ut voluptas voluptatibus doloremque. Nihil qui et aliquam minus repudiandae placeat aut. Exercitationem quia et ratione necessitatibus quas quia.', NULL, '2025-06-12 16:14:54', '2025-06-10', '2025-06-17', 'fixed', 121.11, NULL, NULL, NULL, NULL, 3, 5, 5, '2025-06-10 16:14:54', '2025-06-17 08:14:54', 'active', 0, NULL),
	(139, 5, 'Vel et fugit consequatur ducimus', 'Impedit magnam at repellat quidem quia. Ea ea veniam quaerat sint quam. Ducimus vel amet reprehenderit ab beatae quasi voluptas.', NULL, '2025-06-05 18:36:10', '2025-06-04', '2025-06-07', 'hourly', 202.03, NULL, NULL, 'cancelled', NULL, 10, 1, 1, '2025-06-04 18:36:10', '2025-06-07 10:36:10', 'active', 0, NULL),
	(140, 2, 'Et voluptatum minima dolorum', 'Officiis dolor velit itaque perspiciatis dolor fuga. Magni pariatur nisi ad ut eaque eaque magni occaecati. Soluta sequi in facilis ut quos.', NULL, '2025-06-01 04:34:13', '2025-05-31', '2025-06-08', 'hourly', 882.05, NULL, NULL, 'completed', NULL, 7, 2, 5, '2025-05-31 04:34:13', '2025-06-07 20:34:13', 'active', 0, NULL),
	(141, 6, 'Voluptatem tempora voluptatem et', 'Ut sit sequi aut tempora. Consequatur qui hic tempora omnis ab provident molestiae. Molestias est voluptate ea ea deserunt.', NULL, '2025-05-29 10:54:29', '2025-05-27', '2025-05-30', 'hourly', 504.33, NULL, NULL, 'pending', NULL, 1, 2, 5, '2025-05-27 10:54:29', '2025-05-30 02:54:29', 'active', 0, NULL),
	(142, 9, 'Nulla sunt nulla voluptatum quia', 'Suscipit rerum mollitia voluptas autem molestiae laborum. Non in quidem quod harum aspernatur consequuntur earum.', NULL, '2025-06-12 00:33:06', '2025-06-11', '2025-06-16', 'hourly', 244.61, NULL, NULL, 'pending', NULL, 10, 2, 4, '2025-06-11 00:33:06', '2025-06-15 16:33:06', 'active', 0, NULL),
	(143, 3, 'Incidunt eos aliquam iste natus', 'Qui molestiae error sapiente error modi et fuga. Sapiente vel beatae nisi nihil sint tempora.', NULL, '2025-06-17 19:08:41', '2025-06-13', '2025-06-20', 'daily', 715.45, NULL, NULL, 'pending', NULL, 6, 5, 5, '2025-06-13 19:08:41', '2025-06-20 11:08:41', 'active', 0, NULL),
	(144, 3, 'Debitis veniam nisi sit non perferendis', 'Quisquam et aut dolorem maxime accusantium molestiae. Quos molestiae vero ut commodi.', NULL, '2025-06-25 01:28:45', '2025-06-23', '2025-07-03', 'fixed', 647.79, NULL, NULL, NULL, NULL, 9, 1, 1, '2025-06-23 01:28:45', '2025-07-02 17:28:45', 'active', 0, NULL),
	(145, 4, 'Asperiores repellendus eaque voluptas', 'Possimus voluptas et ut quia dolor voluptatibus voluptas optio. Doloremque ab atque molestias eum est aut. Molestiae rerum nam aliquid et.', NULL, '2025-06-14 17:54:50', '2025-06-13', '2025-06-23', 'fixed', 274.62, '{"latitude":9.77423602792963,"longitude":125.49111354937166}', 'Cayutan, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', NULL, '[4]', 1, 5, 4, '2025-06-13 17:54:50', '2025-07-05 03:06:54', 'active', 0, NULL),
	(146, 4, 'Ut sint id consequatur a', 'Ut et unde optio minus. Eos similique adipisci rerum consequatur.', NULL, '2025-06-08 14:03:52', '2025-06-03', '2025-06-09', 'fixed', 497.41, NULL, NULL, 'cancelled', NULL, 4, 5, 5, '2025-06-03 14:03:52', '2025-06-09 06:03:52', 'active', 0, NULL),
	(147, 1, 'Aut animi aut neque molestiae illo', 'Sapiente dolor nam voluptatibus. Voluptatem maiores laboriosam nihil sunt dolorem autem sequi. Vel voluptas qui mollitia nesciunt.', NULL, '2025-06-08 21:28:46', '2025-06-05', '2025-06-06', 'daily', 425.95, NULL, NULL, 'completed', NULL, 9, 5, 4, '2025-06-05 21:28:46', '2025-06-06 13:28:46', 'active', 0, NULL),
	(148, 9, 'Ad minima eos sint tempora', 'Eius necessitatibus quo necessitatibus perspiciatis illum. Sit iure iste et reiciendis ad aspernatur.', NULL, '2025-06-06 08:43:22', '2025-06-05', '2025-06-14', 'fixed', 929.82, NULL, NULL, NULL, NULL, 4, 3, 3, '2025-06-05 08:43:22', '2025-06-14 00:43:22', 'active', 0, NULL),
	(149, 4, 'Omnis rerum molestiae', 'Libero illum sequi est quidem qui minus aut. Quibusdam porro asperiores quisquam est magni. Voluptates facilis natus reiciendis est sint quibusdam.', NULL, '2025-06-16 18:18:38', '2025-06-11', '2025-06-18', 'daily', 586.75, NULL, NULL, 'cancelled', NULL, 7, 5, 5, '2025-06-11 18:18:38', '2025-06-18 10:18:38', 'active', 0, NULL),
	(150, 4, 'Et beatae et animi', 'Est nisi ad sed ut. Placeat impedit blanditiis laudantium officiis fugiat sit. Iusto omnis aliquam quod architecto ratione.', NULL, '2025-05-31 03:25:04', '2025-05-29', '2025-06-01', 'hourly', 708.41, NULL, NULL, 'cancelled', NULL, 5, 3, 4, '2025-05-29 03:25:04', '2025-05-31 19:25:04', 'active', 0, NULL),
	(151, 5, 'Omnis quibusdam atque', 'Beatae minima temporibus cupiditate in. Sapiente optio velit quasi iure id sed.', NULL, '2025-06-03 00:33:50', '2025-05-31', '2025-06-02', 'daily', 630.24, NULL, NULL, 'completed', NULL, 1, 4, 1, '2025-05-31 00:33:50', '2025-06-01 16:33:50', 'active', 0, NULL),
	(152, 3, 'Rem earum voluptas et explicabo', 'Consequuntur aut asperiores autem blanditiis repellendus ab repellat. Qui odio non et non quis.', NULL, '2025-05-27 15:46:30', '2025-05-25', '2025-06-02', 'hourly', 911.50, NULL, NULL, 'completed', NULL, 1, 3, 1, '2025-05-25 15:46:30', '2025-06-02 07:46:30', 'active', 0, NULL),
	(153, 5, 'Est laborum fuga aut odit', 'Eum qui perspiciatis delectus cum officia eligendi. Quis similique vero et quam ut molestiae. Aut non ea amet quam nemo.', NULL, '2025-06-10 08:50:21', '2025-06-07', '2025-06-11', 'hourly', 873.71, NULL, NULL, 'cancelled', NULL, 5, 5, 1, '2025-06-07 08:50:21', '2025-06-11 00:50:21', 'active', 0, NULL),
	(154, 3, 'Ullam ea ad occaecati non', 'Provident eos nam sit omnis. Laudantium adipisci et adipisci cum asperiores architecto. Consectetur quam recusandae commodi sunt assumenda.', NULL, '2025-05-29 19:46:06', '2025-05-28', '2025-05-31', 'hourly', 438.97, NULL, NULL, 'in_progress', NULL, 5, 1, 2, '2025-05-28 19:46:06', '2025-05-31 11:46:06', 'active', 0, NULL),
	(155, 2, 'Aut placeat vero cum quod', 'Unde qui voluptas enim qui fuga qui nihil. Dolorum iste labore fuga esse. Ratione maxime pariatur voluptatem aliquid veritatis autem quasi.', NULL, '2025-05-31 11:48:14', '2025-05-28', '2025-06-05', 'hourly', 278.45, NULL, NULL, NULL, NULL, 3, 2, 5, '2025-05-28 11:48:14', '2025-06-05 03:48:14', 'active', 0, NULL),
	(156, 9, 'A facilis eos et dolore est', 'Incidunt aut qui est occaecati cum voluptatem. Tempora optio similique earum necessitatibus et sed ut fugit. Quia nam ut ab quia.', NULL, '2025-06-06 00:17:07', '2025-06-04', '2025-06-14', 'hourly', 693.13, NULL, NULL, NULL, NULL, 4, 4, 2, '2025-06-04 00:17:07', '2025-06-13 16:17:07', 'active', 0, NULL),
	(157, 2, 'Enim corporis et quaerat consequatur', 'At dolorem quia accusamus ea placeat. Expedita dolorem assumenda voluptate magni. Eos quasi tempora voluptatem quia. Iure earum esse labore non.', NULL, '2025-06-22 23:39:08', '2025-06-17', '2025-06-19', 'hourly', 916.52, NULL, NULL, 'pending', NULL, 4, 4, 2, '2025-06-17 23:39:08', '2025-06-19 15:39:08', 'active', 0, NULL),
	(158, 9, 'Dolor sint non molestiae eaque aut', 'Eum et quis iste inventore officia quasi. Fuga accusamus adipisci consequatur est iusto tempore.', NULL, '2025-06-07 21:27:48', '2025-06-05', '2025-06-07', 'fixed', 710.16, NULL, NULL, 'completed', NULL, 3, 4, 4, '2025-06-05 21:27:48', '2025-06-07 13:27:48', 'active', 0, NULL),
	(159, 3, 'Veniam expedita et delectus doloribus', 'Optio ut sunt dolores et sequi est quis. Voluptatem culpa et est dicta. Sint est laborum facilis.', NULL, '2025-05-26 21:46:16', '2025-05-25', '2025-05-29', 'hourly', 847.31, NULL, NULL, 'in_progress', NULL, 3, 1, 2, '2025-05-25 21:46:16', '2025-05-29 13:46:16', 'active', 0, NULL),
	(160, 9, 'Facilis aut vitae quo consequatur enim', 'Accusantium at dolorum sunt aut et facere ducimus. Qui optio et quod qui. Eum dolor tenetur nesciunt.', NULL, '2025-06-06 00:22:37', '2025-06-02', '2025-06-10', 'fixed', 811.31, NULL, NULL, 'pending', NULL, 2, 1, 4, '2025-06-02 00:22:37', '2025-06-09 16:22:37', 'active', 0, NULL),
	(161, 6, 'Et non cumque voluptate', 'Ipsam cumque sed veritatis occaecati. A dicta dolorum aut ut omnis at quis. Et occaecati maxime necessitatibus soluta voluptates.', NULL, '2025-06-01 15:05:16', '2025-05-27', '2025-05-28', 'daily', 143.12, NULL, NULL, 'completed', NULL, 10, 5, 4, '2025-05-27 15:05:16', '2025-05-28 07:05:16', 'active', 0, NULL),
	(162, 4, 'Nihil illum eveniet magnam', 'Dignissimos quasi id ut eum. Iusto sequi sunt repellat autem.', NULL, '2025-06-02 11:58:44', '2025-05-30', '2025-06-09', 'daily', 662.62, NULL, NULL, 'cancelled', NULL, 10, 3, 2, '2025-05-30 11:58:44', '2025-06-09 03:58:44', 'active', 0, NULL),
	(163, 10, 'Incidunt quos voluptatem consequatur sed', 'Dolorem quos ut corporis sed error quaerat. Et aliquam neque suscipit deserunt. Quos et odio autem accusamus autem.', NULL, '2025-06-17 12:00:54', '2025-06-12', '2025-06-19', 'fixed', 520.93, NULL, NULL, 'pending', NULL, 1, 1, 1, '2025-06-12 12:00:54', '2025-06-19 04:00:54', 'active', 0, NULL),
	(164, 5, 'Unde adipisci quia a explicabo', 'Error eligendi similique ut optio. Dolore rerum eos hic iste minus commodi. Libero eligendi veniam ut maiores distinctio.', NULL, '2025-06-02 06:39:59', '2025-05-28', '2025-06-07', 'daily', 782.46, NULL, NULL, NULL, NULL, 6, 5, 1, '2025-05-28 06:39:59', '2025-06-06 22:39:59', 'active', 0, NULL),
	(165, 2, 'Dolorum corrupti neque beatae nisi', 'Expedita deserunt non accusamus at est illum. Ut corrupti maxime cum culpa.', NULL, '2025-06-18 12:44:13', '2025-06-14', '2025-06-15', 'hourly', 816.26, NULL, NULL, 'cancelled', NULL, 8, 5, 4, '2025-06-14 12:44:13', '2025-06-15 04:44:13', 'active', 0, NULL),
	(166, 5, 'Voluptatem iste et provident', 'Debitis aut ipsam voluptas pariatur voluptatem voluptatibus eius. Vel sint fuga sint hic quae voluptatem eveniet. At repellat id dolore debitis.', NULL, '2025-06-24 03:36:05', '2025-06-23', '2025-06-24', 'hourly', 415.32, NULL, NULL, 'in_progress', NULL, 4, 4, 1, '2025-06-23 03:36:05', '2025-06-23 19:36:05', 'active', 0, NULL),
	(167, 4, 'Voluptatem vero amet ducimus itaque', 'Aut eos optio laboriosam quidem. Maxime dignissimos amet laboriosam eum.', NULL, '2025-06-13 01:37:28', '2025-06-09', '2025-06-14', 'fixed', 404.83, NULL, NULL, 'pending', NULL, 9, 1, 2, '2025-06-09 01:37:28', '2025-06-13 17:37:28', 'active', 0, NULL),
	(168, 8, 'Deleniti ipsum illum eum vel', 'Doloremque et quae ratione accusantium. Iure quis illum omnis earum. Sit est a doloremque voluptatem eum vel.', NULL, '2025-06-02 12:57:38', '2025-05-29', '2025-05-31', 'daily', 943.83, NULL, NULL, 'cancelled', NULL, 8, 1, 5, '2025-05-29 12:57:38', '2025-05-31 04:57:38', 'active', 0, NULL),
	(169, 7, 'Aut ad veniam et nemo', 'Quos consequatur consequatur dignissimos quae at ut. Voluptatem quia quis animi mollitia dolorum. Qui officia quos nesciunt eos.', NULL, '2025-06-19 06:16:05', '2025-06-14', '2025-06-15', 'fixed', 495.48, NULL, NULL, 'completed', NULL, 7, 3, 3, '2025-06-14 06:16:05', '2025-06-14 22:16:05', 'active', 0, NULL),
	(170, 10, 'Vero a libero sed', 'Commodi aspernatur et quibusdam. Omnis ex perferendis possimus.', NULL, '2025-06-20 02:14:02', '2025-06-16', '2025-06-18', 'fixed', 620.51, NULL, NULL, 'completed', NULL, 3, 3, 3, '2025-06-16 02:14:02', '2025-06-17 18:14:02', 'active', 0, NULL),
	(171, 10, 'Ex et omnis natus maxime', 'Enim veniam ut maiores minus molestiae facere error. Et quia est nisi perferendis unde. Aliquam aut libero ut quibusdam consequatur.', NULL, '2025-06-21 04:22:44', '2025-06-18', '2025-06-25', 'hourly', 220.13, NULL, NULL, 'completed', NULL, 10, 2, 1, '2025-06-18 04:22:44', '2025-06-24 20:22:44', 'active', 0, NULL),
	(172, 6, 'Doloribus cupiditate perferendis quaerat earum', 'Aut neque nihil consequuntur eligendi est omnis. Non incidunt quos fugit nobis nulla molestiae magni. Qui voluptas ut quibusdam deserunt.', NULL, '2025-06-17 10:12:55', '2025-06-16', '2025-06-24', 'fixed', 426.02, NULL, NULL, 'in_progress', NULL, 2, 5, 3, '2025-06-16 10:12:55', '2025-06-24 02:12:55', 'active', 0, NULL),
	(173, 5, 'Ut et ut', 'Eaque voluptates soluta et beatae mollitia deserunt. Et est iusto aut fugit incidunt.', NULL, '2025-06-16 23:16:18', '2025-06-12', '2025-06-18', 'daily', 226.84, NULL, NULL, 'pending', NULL, 2, 1, 3, '2025-06-12 23:16:18', '2025-06-18 15:16:18', 'active', 0, NULL),
	(174, 3, 'Porro aut dolores esse', 'Molestiae harum nobis mollitia consequatur dolore ut. Ex odit maiores voluptas ut sint. Officia ab illum perferendis repellat est.', NULL, '2025-06-09 20:15:42', '2025-06-06', '2025-06-15', 'hourly', 967.65, NULL, NULL, NULL, NULL, 9, 2, 2, '2025-06-06 20:15:42', '2025-06-15 12:15:42', 'active', 0, NULL),
	(175, 4, 'Non molestiae vitae consequatur libero', 'Culpa ipsam placeat laudantium. Voluptatem non id nesciunt qui a. Quia asperiores quia reprehenderit eveniet corporis.', NULL, '2025-06-07 15:47:58', '2025-06-04', '2025-06-12', 'fixed', 301.73, NULL, NULL, NULL, NULL, 2, 2, 4, '2025-06-04 15:47:58', '2025-06-12 07:47:58', 'active', 0, NULL),
	(176, 5, 'Quo atque quidem', 'Esse architecto minima dolores amet architecto voluptate. Natus eos quod omnis a qui molestiae eveniet. Iusto nemo ut sint exercitationem molestiae.', NULL, '2025-06-18 22:45:43', '2025-06-17', '2025-06-26', 'fixed', 809.96, NULL, NULL, NULL, NULL, 6, 4, 1, '2025-06-17 22:45:43', '2025-06-26 14:45:43', 'active', 0, NULL),
	(177, 6, 'Pariatur ab et dolor', 'Quam dolor ut quibusdam ab et quam fugiat. Velit quibusdam eligendi dolores neque. Est id tenetur quo quod harum. Est et eum ipsa placeat a et.', NULL, '2025-06-02 07:23:16', '2025-05-29', '2025-06-03', 'fixed', 156.50, NULL, NULL, NULL, NULL, 5, 1, 1, '2025-05-29 07:23:16', '2025-06-02 23:23:16', 'active', 0, NULL),
	(178, 4, 'Voluptates sunt magni dolorum', 'Iste soluta molestias sed. Ut excepturi ipsa dignissimos quia sed sit.', NULL, '2025-06-08 20:16:05', '2025-06-05', '2025-06-12', 'daily', 417.29, NULL, NULL, 'pending', NULL, 2, 2, 3, '2025-06-05 20:16:05', '2025-06-12 12:16:05', 'active', 0, NULL),
	(179, 7, 'Incidunt voluptas dolorum doloribus qui excepturi', 'Animi ut autem nulla impedit molestiae autem. Natus facere quibusdam iste architecto rerum inventore. Sit et corrupti et soluta aut.', NULL, '2025-06-24 13:31:43', '2025-06-20', '2025-06-23', 'hourly', 511.49, NULL, NULL, NULL, NULL, 10, 1, 2, '2025-06-20 13:31:43', '2025-06-23 05:31:43', 'active', 0, NULL),
	(180, 3, 'At quas distinctio neque', 'Laborum explicabo sed non qui ut. Maxime totam est ut incidunt nostrum. Atque sunt cum odio id.', NULL, '2025-06-05 15:33:57', '2025-06-03', '2025-06-04', 'daily', 326.84, NULL, NULL, 'cancelled', NULL, 8, 2, 1, '2025-06-03 15:33:57', '2025-06-04 07:33:57', 'active', 0, NULL),
	(181, 6, 'Dolorem ipsam quae voluptatum', 'Omnis qui quia qui veniam. Dolor molestiae est est dolor. Ut cupiditate deleniti cum. Perspiciatis alias ipsum voluptatem.', NULL, '2025-06-11 16:06:04', '2025-06-08', '2025-06-14', 'daily', 489.25, NULL, NULL, 'pending', NULL, 9, 4, 2, '2025-06-08 16:06:04', '2025-06-14 08:06:04', 'active', 0, NULL),
	(182, 2, 'Odio ducimus facere rerum', 'Est nemo tempore blanditiis voluptas et odio. Illo eligendi id rem ipsum totam magni. In dolor aut blanditiis perferendis aut autem.', NULL, '2025-06-20 14:05:22', '2025-06-18', '2025-06-27', 'hourly', 210.92, NULL, NULL, 'in_progress', NULL, 7, 2, 3, '2025-06-18 14:05:22', '2025-06-27 06:05:22', 'active', 0, NULL),
	(183, 4, 'Quia ut ut rerum sunt', 'A perspiciatis labore ducimus aut ipsum qui et. Aut rem error nihil accusamus. Corrupti qui cum repellendus debitis quasi quod nam.', NULL, '2025-06-01 23:53:26', '2025-05-30', '2025-06-07', 'hourly', 612.33, NULL, NULL, 'completed', NULL, 2, 4, 5, '2025-05-30 23:53:26', '2025-06-07 15:53:26', 'active', 0, NULL),
	(184, 3, 'Ratione suscipit ipsam est', 'Nobis aperiam est ad rerum sunt voluptates. Corrupti ad ut nesciunt est aut est. Sit et aut mollitia consectetur voluptatem ut.', NULL, '2025-06-05 18:42:58', '2025-06-01', '2025-06-06', 'fixed', 296.47, NULL, NULL, 'in_progress', NULL, 6, 5, 3, '2025-06-01 18:42:58', '2025-06-06 10:42:58', 'active', 0, NULL),
	(185, 3, 'Voluptatibus et voluptas et itaque dolores', 'Esse est labore aliquam id cum doloribus. Eos sint maiores et voluptas.', NULL, '2025-06-16 07:04:01', '2025-06-15', '2025-06-22', 'daily', 392.35, NULL, NULL, NULL, NULL, 4, 3, 5, '2025-06-15 07:04:01', '2025-06-21 23:04:01', 'active', 0, NULL),
	(186, 4, 'Voluptate debitis facilis sed aperiam', 'Error ex magnam incidunt aut nesciunt quia. Ut adipisci sint et laborum vero aliquam. Quisquam aut et iste corrupti aut.', NULL, '2025-06-12 06:21:05', '2025-06-11', '2025-06-20', 'fixed', 659.64, NULL, NULL, 'completed', NULL, 1, 5, 5, '2025-06-11 06:21:05', '2025-06-19 22:21:05', 'active', 0, NULL),
	(187, 9, 'Sapiente tempore et dolores et', 'Quaerat qui sed error eius aut eveniet occaecati. Nam nulla aut voluptas sapiente nam pariatur doloremque.', NULL, '2025-06-09 02:16:57', '2025-06-04', '2025-06-07', 'hourly', 952.02, NULL, NULL, NULL, NULL, 5, 5, 1, '2025-06-04 02:16:57', '2025-06-06 18:16:57', 'active', 0, NULL),
	(188, 4, 'Non facilis adipisci sit blanditiis', 'Sit consequatur deleniti enim mollitia perspiciatis. Facere qui iusto nam commodi. Ut quia distinctio ea laborum.', NULL, '2025-06-12 23:20:37', '2025-06-09', '2025-06-11', 'hourly', 499.98, NULL, NULL, NULL, NULL, 3, 3, 1, '2025-06-09 23:20:37', '2025-06-11 15:20:37', 'active', 0, NULL),
	(189, 6, 'Corporis molestiae qui', 'Nesciunt porro in sit qui voluptatem fugiat. Non quam voluptas a mollitia soluta voluptatem.', NULL, '2025-06-10 03:51:31', '2025-06-07', '2025-06-11', 'fixed', 640.93, NULL, NULL, 'completed', NULL, 10, 4, 3, '2025-06-07 03:51:31', '2025-06-10 19:51:31', 'active', 0, NULL),
	(190, 6, 'Quos ut aliquam nobis nostrum', 'Quo maiores modi facere ea. Consectetur fuga similique quaerat. Ea voluptate suscipit rerum libero porro.', NULL, '2025-06-17 17:31:17', '2025-06-13', '2025-06-16', 'fixed', 887.28, NULL, NULL, 'in_progress', NULL, 5, 5, 3, '2025-06-13 17:31:17', '2025-06-16 09:31:17', 'active', 0, NULL),
	(191, 2, 'Qui fugiat rem enim dolorem', 'Voluptas necessitatibus ut aspernatur aliquam. Sit impedit aut cumque aut veniam voluptates.', NULL, '2025-06-13 20:50:35', '2025-06-12', '2025-06-16', 'fixed', 855.23, NULL, NULL, NULL, NULL, 1, 2, 1, '2025-06-12 20:50:35', '2025-06-16 12:50:35', 'active', 0, NULL),
	(192, 5, 'Ducimus et occaecati unde aut', 'Necessitatibus eaque perspiciatis quasi corporis. Esse dolorem autem dolorum assumenda dolor quidem aliquid nam. Fuga et hic non beatae.', NULL, '2025-05-29 16:34:14', '2025-05-25', '2025-05-27', 'hourly', 656.20, NULL, NULL, 'in_progress', NULL, 6, 2, 2, '2025-05-25 16:34:14', '2025-05-27 08:34:14', 'active', 0, NULL),
	(193, 9, 'Nulla reiciendis non ea omnis', 'Quis temporibus voluptates rerum laboriosam voluptas. Quo molestiae et mollitia id.', NULL, '2025-06-12 22:21:04', '2025-06-08', '2025-06-17', 'daily', 654.91, NULL, NULL, 'cancelled', NULL, 5, 2, 5, '2025-06-08 22:21:04', '2025-06-17 14:21:04', 'active', 0, NULL),
	(194, 7, 'Sed quam omnis blanditiis', 'Quas dicta vitae qui eum accusantium tempora. Et non qui dolor maiores. Temporibus quia consequatur alias dolorem quisquam laboriosam optio.', NULL, '2025-06-10 09:44:29', '2025-06-05', '2025-06-07', 'fixed', 817.38, NULL, NULL, 'pending', NULL, 4, 2, 1, '2025-06-05 09:44:29', '2025-06-07 01:44:29', 'active', 0, NULL),
	(195, 9, 'Accusamus est ullam est eveniet ut', 'Modi quo repudiandae quas quo. Consequatur enim asperiores id non dolor. Eaque quidem itaque delectus repellendus amet odit.', NULL, '2025-06-21 02:05:56', '2025-06-20', '2025-06-28', 'daily', 531.62, NULL, NULL, NULL, NULL, 5, 2, 3, '2025-06-20 02:05:56', '2025-06-27 18:05:56', 'active', 0, NULL),
	(196, 9, 'A odio deserunt illo', 'Nulla inventore delectus quam iste debitis expedita. Voluptatibus molestiae aut hic nihil et. Quia et et veniam sapiente ex doloremque natus.', NULL, '2025-06-04 11:01:02', '2025-06-02', '2025-06-04', 'daily', 277.31, NULL, NULL, 'completed', NULL, 4, 3, 3, '2025-06-02 11:01:02', '2025-06-04 03:01:02', 'active', 0, NULL),
	(197, 9, 'Voluptate vero ex omnis doloribus deleniti', 'Quam reprehenderit rerum quam voluptatem cum. Voluptas necessitatibus fugiat et fugiat tenetur. Ad in commodi velit natus fugit.', NULL, '2025-06-03 00:45:31', '2025-06-01', '2025-06-06', 'daily', 397.21, NULL, NULL, 'completed', NULL, 1, 3, 2, '2025-06-01 00:45:31', '2025-06-05 16:45:31', 'active', 0, NULL),
	(198, 5, 'Ut et commodi ipsum qui quidem', 'Cum illo ut et aut qui. Ab temporibus porro odio nesciunt. Quia aut culpa qui eum cumque eligendi illum.', NULL, '2025-06-15 12:45:49', '2025-06-11', '2025-06-18', 'daily', 952.88, NULL, NULL, 'in_progress', NULL, 9, 5, 1, '2025-06-11 12:45:49', '2025-06-18 04:45:49', 'active', 0, NULL),
	(199, 9, 'Quia atque est corporis veniam cupiditate', 'Vel repellendus sed odit et omnis sit distinctio. Nesciunt quia quas et molestiae ullam corporis modi id. Quibusdam quia et non ut vero rerum.', NULL, '2025-06-08 05:41:04', '2025-06-03', '2025-06-04', 'fixed', 145.14, NULL, NULL, 'cancelled', NULL, 4, 1, 2, '2025-06-03 05:41:04', '2025-06-03 21:41:04', 'active', 0, NULL),
	(200, 2, 'Illum nostrum nesciunt est perferendis soluta', 'Dolore maxime voluptatum corporis eum. Qui minima hic non et dolorem ullam. Est voluptatem delectus et laborum minima.', NULL, '2025-05-28 19:36:47', '2025-05-25', '2025-05-28', 'fixed', 242.66, NULL, NULL, NULL, NULL, 3, 5, 5, '2025-05-25 19:36:47', '2025-05-28 11:36:47', 'active', 0, NULL),
	(201, 1, 'Hshsh', 'Hdhehe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-06-24 06:37:00', '2025-06-23 22:37:00', 'active', 0, NULL),
	(202, 1, 'Hdhdh', 'Ush', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-06-24 06:40:05', '2025-06-23 22:40:05', 'active', 0, NULL),
	(203, 1, 'Hdhh', 'Jdhdhd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-06-24 06:46:56', '2025-06-23 22:46:56', 'active', 0, NULL),
	(204, 1, 'Jjehhe', 'Jjssjhs', NULL, '2025-06-24 07:26:06', '2025-06-24', '2025-06-26', 'Hourly', 800.00, NULL, NULL, NULL, NULL, NULL, 1, 1, '2025-06-24 07:31:21', '2025-06-25 07:24:04', 'active', 0, NULL),
	(205, 11, 'LF:Panday', 'Pagpasabot sa Trabaho:\r\nNanginahanglan kami og Panday alang sa 1 ka adlaw nga trabaho. Ang buhat kay maglakip og yano nga mason o karpintero nga mga buluhaton sama sa pagtabang sa mga guba, pag-ayo, o gagmay nga konstruksyon. Walay long-term nga kontrata.\r\n\r\nMga Kinahanglanon:\r\n- Adunay kasinatian isip panday o skilled construction worker.\r\n- Kusgan ug andam mo trabaho sulod sa tibuok adlaw.\r\n- Maayo nga disiplina ug kasaligan nga manarbaho.\r\n- Pamilyar sa paggamit sa mga himan sa construction.\r\n- Mas maayo kung adunay TESDA certificate, apan dili kinahanglanon.', NULL, '2025-06-25 10:54:00', '2025-06-24', '2025-06-26', 'Fixed', 800.00, '{"latitude":10.008488187860138,"longitude":125.56908829309076}', 'DM Avenue, Purok 3, San Jose, Dinagat Islands, Caraga, 8427, Philippines', NULL, '[1, 2]', NULL, 1, 11, '2025-06-24 07:55:22', '2025-07-02 04:51:08', 'active', 0, NULL),
	(206, 1, 'LF:Panday', 'Pagpasabot sa Trabaho:\r\nNanginahanglan kami og Panday alang sa 1 ka adlaw nga trabaho. Ang buhat kay maglakip og yano nga mason o karpintero nga mga buluhaton sama sa pagtabang sa mga guba, pag-ayo, o gagmay nga konstruksyon. Walay long-term nga kontrata.\r\n\r\nMga Katungdanan:\r\n- Pag-andam ug pagsagol sa semento o konkreto.\r\n- Pag-tabang sa pagbuhat og hollow blocks, bato, o kahoy.\r\n- Paggamit og mga himan sa konstruksyon kung kinahanglan.\r\n- Pagbitbit sa materyales ug pagtabang sa uban pang trabahante.\r\n- Mosunod sa instruksyon sa foreman o engineer sa site.\r\n- Pagpanalipod sa kalimpyo ug kahapsay sa lugar sa trabaho.\r\n\r\nMga Kinahanglanon:\r\n- Adunay kasinatian isip panday o skilled construction worker.\r\n- Kusgan ug andam mo trabaho sulod sa tibuok adlaw.\r\n- Maayo nga disiplina ug kasaligan nga manarbaho.\r\n- Pamilyar sa paggamit sa mga himan sa construction.\r\n- Mas maayo kung adunay TESDA certificate, apan dili kinahanglanon.', NULL, '2025-06-25 08:52:00', '2025-06-25', '2025-06-25', 'Fixed', 800.00, '{"latitude":9.451073760771788,"longitude":125.57496700655616}', 'Purok 2, Mahayahay, Kitcharao, Agusan del Norte, Caraga, 8609, Philippines', NULL, '[2, 3, 5]', NULL, 1, 1, '2025-06-25 06:52:37', '2025-07-01 09:51:36', 'active', 0, NULL),
	(207, 1, 'Labada', 'Maglaba', NULL, '2025-07-01 05:57:00', '2025-06-30', '2025-06-30', 'Fixed', 800.00, NULL, NULL, NULL, '[2]', NULL, 1, 1, '2025-06-30 05:59:56', '2025-06-29 21:59:56', 'active', 0, NULL),
	(208, 1, 'Labada', 'Maglaba', NULL, '2025-07-01 05:57:00', '2025-06-30', '2025-06-30', 'Fixed', 800.00, '{"latitude":9.784347011433907,"longitude":125.49017044457894}', 'CARAGA Regional Hospital, Roxas Street, Kaskag Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', NULL, '[2, 3]', NULL, 1, 1, '2025-06-30 06:01:58', '2025-07-02 02:44:22', 'active', 0, NULL),
	(209, 1, 'Cook', 'Magluto kuman fiesta..I need 3', NULL, '2025-07-01 06:57:00', '2025-07-02', '2025-07-03', 'daily', 800.00, '{"latitude":9.65908623528971,"longitude":125.54270577406929}', 'Tagana-an Road, Purok 1, Lower Libas, Surigao del Norte, Caraga, 8404, Philippines', NULL, '[4, 3]', NULL, 1, 1, '2025-06-30 06:02:55', '2025-07-02 02:57:59', 'active', 0, NULL),
	(210, 1, 'Magluto kuman fiesta', 'I need 3', NULL, '2025-06-27 06:57:00', '2025-07-01', '2025-07-05', 'daily', 450.00, '{"latitude":10.319168434657897,"longitude":125.55708178174629}', 'Tubajon, Dinagat Islands, Caraga, Philippines', NULL, '[2, 3, 4, 7]', NULL, 1, 1, '2025-06-30 06:04:30', '2025-07-02 02:41:50', 'active', 0, NULL),
	(211, 1, 'Manghinlo sa balay', '2 personhahh', NULL, '2025-07-05 13:11:00', '2025-07-05', '2025-07-05', 'Fixed', 800.00, '{"latitude":9.868576946318171,"longitude":125.53501420305614}', 'Juan P. Cedro, Sr. Memorial High School, Surigao City, Buenavista, Surigao del Norte, Caraga, 8400, Philippines', NULL, '[1,5,6]', NULL, 1, 1, '2025-07-01 13:14:05', '2025-07-04 03:03:15', 'active', 0, NULL),
	(212, 10, 'LF: Cleaners para kuman Sabado ug Dominggo', 'None', NULL, '2025-07-03 23:29:00', '2025-07-05', '2025-07-06', 'daily', 750.00, '{"latitude":9.780241494433879,"longitude":125.49107092907639}', 'Espina Street, Espina Village, Surigao City, Surigao del Norte, Caraga, 8400, Philippines', NULL, '[1]', NULL, 10, 10, '2025-07-03 15:32:51', '2025-07-03 16:16:38', 'active', 0, NULL),
	(213, 10, 'Maghimo ug Logo', 'Hhsb', NULL, '2025-07-03 23:17:00', '2025-07-08', '2025-07-09', 'Fixed', 1500.00, NULL, NULL, NULL, '[1,3]', NULL, 10, 10, '2025-07-03 16:18:29', '2025-07-03 16:18:29', 'active', 0, NULL),
	(214, 10, 'Maghimo ug Logo', 'Hhsb', NULL, '2025-07-03 15:17:00', '2025-07-08', '2025-07-09', 'Fixed', 1500.00, '{"latitude":9.60768940071434,"longitude":125.52291398038805}', 'Silop, Surigao del Norte, Caraga, Philippines', NULL, '[1,3]', NULL, 10, 10, '2025-07-03 16:18:45', '2025-07-03 16:20:29', 'active', 0, NULL);
/*!40000 ALTER TABLE `tjobs` ENABLE KEYS */;

-- Dumping structure for table etrabaho.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile` longtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` longtext COLLATE utf8mb4_unicode_ci,
  `isVerified` int(11) DEFAULT NULL,
  `profile_pic` longtext COLLATE utf8mb4_unicode_ci,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table etrabaho.users: 13 rows
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `profile`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `avatar`, `isVerified`, `profile_pic`, `phone_number`, `current_location`) VALUES
	(1, 'https://lh3.googleusercontent.com/a/ACg8ocICxZuvbmnED8B5vH9nAzZ75oj4EyyJOq04YOMO7jxaSaNGZqsv=s96-c', 'ANTONIO JR. PILOTON', 'apiloton@ssct.edu.ph', NULL, '$2y$12$mSzUymzh7VFbHRWektBpbOkOJE2rNEs.nqg/KR1eQeLokq4gxi2F6', 'rBDJriJPEY2Zw1sTnbKhZXjPuTQ4p9oxYbyyTrmY43N4ZUr7IbChBovJOMLw', '2025-06-14 03:57:54', '2025-07-05 22:39:57', 'homeowner', 'https://lh3.googleusercontent.com/a/ACg8ocL3wAymfBAhWbSdEodGOmAd_GQYm5owScFjk3IjUnV-AxNh7o8=s96-c', NULL, 'https://lh3.googleusercontent.com/a/ACg8ocL3wAymfBAhWbSdEodGOmAd_GQYm5owScFjk3IjUnV-AxNh7o8=s96-c', NULL, '{"latitude":9.773706,"longitude":125.4910267}'),
	(2, 'https://lh3.googleusercontent.com/a-/ALV-UjWoyQBh9dszz0VpVlymO7E2aPOb5lU54Mde9RoO_gOalwkHcqjzGCkBp5kQrzc4VUPBT8LUMgRlWpzsJLsTiAuuZFI9AecUWHi0oAKmA8CI8a_vbkwrFEBg9v_pwk4mT3fUk2Vs7Ug8Np2C8VQ3H49A-DnQVD_vhXVXbssX3BF51L8suKsEB-Omuq9PdK2cVz4bd8U28uKMYyvwJTlMZETJnomxgD7xmeU2EdwDZxc_fJWAYjkLPh4Bmyp-Ypqt9mLC3HkNUrdHXrJwYJD2hHIv2ettxV9NQRUHvtqMMZ43zpCL1SWIvQl8e_FkdgWnBsNhFQA1yjd2tYvq0QDxOGlU4uF9Fhq0cfllLMq5_PLQEIgKVHtkANLnKXmviVwanplbJRMFB8zSrffRcQXAGr3sKV9nmgoUc0Ct0eJojaYnUvB5N8qZFzZ84IIdS6FKgfy4eBA86SPXVQB-qgdDy_ruw01e5pvYv8FyvCmEB22Z3RVrjJjeF5N8weSePLmJZkd0RuiL5tH-P-_awg7VPtWOxsjP6bs8Smd5Ic-jTOjywYca2SosPoOQPqM_7VA2AOy2CdranFm1khqjwDWk1qWoUYPdz4aPSbEYQ9PCl1siTE6VA5x6b6QyRWw-WqUj8LWmeINwVPf0j9D6SdJUkrDXdLbrEL7ayu5NXRsydOs_GmzCces1lD11wf9T86fvbppsilwU2Rpax1cyWBCb1f1OfEVTARFmcOdlKb3ujzg29ZsdgOJDxRU8NgfhEIgeic0LCyl5Bz8Nb9aCygfZPwWzfNUPQYhqSgkksEJ4Pu7QCbgp0U2RlLF1dyddyU3kas0RGnhwA1A3nAPLMWnBX1OnAwoiPB0GNMq9TK9I43MonyjDZnCCo04lBZUuQBWPPXztW41OdedvdgiLZ7PqgIuiXcMoEoP7AHyC2LW-uHdmWCiqeTIHT1J62b2Q5sHXslfr8rAQdVKwIZ0FTP28iF7pPA631woX=s96-c', 'Rolit Joan C. Ferol', 'yanyanferol@gmail.com', NULL, '$2y$12$unvis21rr2ZLWKkgLKUeDeIsshVdV.TXAAfkLjHlFpDfN0MlAx.dy', NULL, '2025-06-17 02:45:11', '2025-06-20 03:08:49', '', '', NULL, '', NULL, ''),
	(3, 'https://lh3.googleusercontent.com/a-/ALV-UjWp0LEuINKTSWMrHMawE-lm1VTP0avHOGfFdvvBGxzQ0gNy4IFGTDeuDdI9pyMe4gRI9plB47K3UmBixGkOxCXm02O2Cs3DUextGUsc4qomjYgV797-pcJjUM404wVQhyon_L0zO2gGH4nTJwm8jyFWmQt_qBMq5BZ3TzQg-twR0krHwUPr2tW7ny2Z2jeSj7fOEX5mq5dhTtBmguVdYJ_ue6pKGC7ykjNIna7yz2bDMHIEeIWakHW-HJXsw77wtiAhkB-wVIhTNtgRLMkta7WrvPs9HbL2snRo3DHOQWG5x1LgCt08P2tDuEzYV09MR3zhXltERikXWmPZiSii5xY26iVStDsIl5kFlyj2YgBLdSQsI3WzpQtFDWwcXmPWkA46Er8fI_rlB7pojfhZ5yQWw4qJ2LWDifrtCea1gOw-CUl2oBRiM-HHIJX_TMaFP7TW-DqdRPQAyhfDeL9sjqJ6AvIUd8tD633Gz2t6DkZGE3e6HJ4sfIUXQRa-9iofrRE0QNfoxCVGa-BIjWE7m_fZ0ps3TQUnI1eBzkNaO4RLuzm2esqO0UnNFsL4U01zWrZ9OFm81EzGyr2RozEr75nsImiFt78ZlQfqao-wvR21gzHim9rl2txqW5SDbNUSGXaNSmO8_JE4Orr2obHs1akdTVnYIVlMYF2DflUFadJm3ZrmY-DCRTv2EYkgjt0dlSoIVkEeysoNAeh960ktL-Z28me1VSimfTnJ_jvoQ1g4Q2a8tTP7H8HFr7iKQ-h00-Xk038LXf1CddaZzf_sXSkvpNO24q5zh17HJAM6sHOXWFz6nUBCtfsr4D2yf3Q3TpNQYcHa27z7ZH0SbIdVKI8GxYFOjXq24zYOoIt_1haYBRNl-iZwV0VccpQpBzynWnawZhAvkRvX3DGVhXEKDQpof3hPSXGllwOc0uppKXAsV3xkLzghuFXxVm3M4HezbnvzVjVGMgiFeNT1yxqVG4wmGKXKXhMt=s96-c', 'Rolit Joan C. Ferol', 'rferol@ssct.edu.ph', NULL, '$2y$12$FnLXOO5pN.5cYI9g1GFZ/enYwTWHUsEr3dW4S2dESCcFLcEr.cIgC', NULL, '2025-06-20 03:10:04', '2025-06-20 03:25:45', '', '', NULL, '', NULL, ''),
	(4, 'https://lh3.googleusercontent.com/a/ACg8ocICxZuvbmnED8B5vH9nAzZ75oj4EyyJOq04YOMO7jxaSaNGZqsv=s96-c', 'Antonio Jr Piloton', 'apiloton1@ssct.edu.ph', NULL, '$2y$12$BoJ64hLX/eN6z1xn87apTua5MNDd1KbFpvaBOa5tNjCJZUMFGsp0G', NULL, '2025-06-20 03:13:43', '2025-07-06 11:19:39', 'homeowner', 'https://lh3.googleusercontent.com/a/ACg8ocICxZuvbmnED8B5vH9nAzZ75oj4EyyJOq04YOMO7jxaSaNGZqsv=s96-c', NULL, 'user_files/4/profile_pic/gGcvMoKPDyW2kb5Bo05Zw6At15Kc3vw6HghMX2t2.jpg', NULL, '{"latitude":9.7821353,"longitude":125.4988504}'),
	(5, NULL, 'Antonio Jr. L. Piloton', 'a@gmail.com', NULL, '$2y$12$/ZyWtn/40Psf.0QkUBBNkOH2E1xxV2oX.MCmbCkyM7oBfHuwrv1ei', NULL, '2025-07-03 03:41:48', '2025-07-04 23:08:02', 'skilled_worker', NULL, NULL, 'user_files/5/profile_pic/ZVSfdJFaSc6ySDHcM1V5slu3g9T3DH7MISElQxCz.jpg', '+639451939591', '{"latitude":9.7737023,"longitude":125.4910218}'),
	(6, NULL, 'Mary Jane Libay', 'maryjanelibay12@gmail.com', NULL, '$2y$12$/ZyWtn/40Psf.0QkUBBNkOH2E1xxV2oX.MCmbCkyM7oBfHuwrv1ei', NULL, '2025-07-03 09:54:59', '2025-07-04 20:49:48', 'skilled_worker', 'https://lh3.googleusercontent.com/a/ACg8ocLFf4F7U5G5XjVxhYqzzmhmgnjFIqSLkCOqzhcOg2q6Etc22ANX=s96-c', NULL, NULL, '+639128941731', '{"latitude":9.7872837,"longitude":125.4944412}'),
	(7, NULL, 'Rogen Bernal', 'rbernal2@ssct.edu.ph', NULL, '$2y$12$ihKICGv2kRrBqLulGkCN2undqmBFKqLLYsCl8mgW0XwvAdyzSEN.O', NULL, '2025-07-03 10:28:49', '2025-07-03 10:28:49', 'skilled_worker', NULL, NULL, NULL, NULL, NULL),
	(8, NULL, 'Maedel Rose Buscato', 'mbuscato@ssct.edu.ph', NULL, '$2y$12$8we7LKwXWGFUs4efJ5P1seOydzUtDfZq76bIasp61EVWKzX0gUyH6', NULL, '2025-07-03 10:47:04', '2025-07-03 10:47:04', 'skilled_worker', NULL, NULL, NULL, NULL, NULL),
	(9, NULL, 'Robert N. Zabala', 'robertzabala041002@gmail.com', NULL, '$2y$12$aeEMf3J9JrVfXm5O76sQqOEluyVwbCnGbscciUHGCvZ8oLzarwcYu', NULL, '2025-07-03 11:35:21', '2025-07-03 11:42:22', 'skilled_worker', NULL, NULL, NULL, NULL, 'null'),
	(17, NULL, 'Antonio Jr. Piloton', 'antoniollealdeluibpiloton@gmail.com', NULL, '$2y$12$3LEIEeZwfXT.lP5RjHXXyuvVNgIxswd/uJW97y7IE9llNTPakCyBy', NULL, '2025-07-04 20:22:18', '2025-07-05 11:30:14', 'homeowner', 'https://lh3.googleusercontent.com/a/ACg8ocIePyh0g-KjmgY4ExcctYWe3yFw3RLwyFyBugTmPpu4RUnTdIQFwQ=s96-c', NULL, NULL, NULL, '{"latitude":9.7873455,"longitude":125.4946154}'),
	(18, NULL, 'ANTONIO JR. PILOTON', 'antoniojrpiloton@gmail.com', NULL, '$2y$12$Abjeiw8ECm9Yfbir1bj3sOpHPkMrlgWAVKDOqWWgrANZJpPf/U/gy', NULL, '2025-07-04 20:34:51', '2025-07-06 19:49:33', 'skilled_worker', 'https://lh3.googleusercontent.com/a/ACg8ocKkyDZe64PBZKwzpp0RZycR0EkIrvLozpRb9PuWO14e-MU6Upk=s96-c', NULL, 'user_files/18/profile_pic/0xWwlOw5qEbCxihEiRmheV9sOW3Qk9o6TeMHvGqS.jpg', NULL, '{"latitude":9.7735912,"longitude":125.4908528}'),
	(19, NULL, 'Flixar Vinz Simene', 'fsimene@ssct.edu.ph', NULL, '$2y$12$MzanWyd8jQaEdlszncOLh.gX1tEYzHzGp7p2SFsTfCj1iOpNrRpOa', NULL, '2025-07-04 21:57:10', '2025-07-04 21:57:10', 'skilled_worker', NULL, NULL, NULL, NULL, NULL),
	(20, NULL, 'ATHEAJEEN ANINIPOT', 'aaninipot@ssct.edu.ph', NULL, '$2y$12$LI/HTB4JVJdP4.GPHJoKpOMJC/xaCax7pbPuTrmF5zU1x/anE3BNe', NULL, '2025-07-05 14:58:04', '2025-07-05 14:58:07', 'skilled_worker', 'https://lh3.googleusercontent.com/a/ACg8ocLCwpdCPx0MJ0mMu6ws28abyiNm2yej-hAh-B3CM3EzdI7PiQ=s96-c', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table etrabaho.user_verification
CREATE TABLE IF NOT EXISTS `user_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `isValidated` int(11) NOT NULL DEFAULT '0',
  `DateValidated` datetime DEFAULT NULL,
  `ValidatedBy` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table etrabaho.user_verification: 0 rows
DELETE FROM `user_verification`;
/*!40000 ALTER TABLE `user_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_verification` ENABLE KEYS */;

-- Dumping structure for table etrabaho.workers
CREATE TABLE IF NOT EXISTS `workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `fullName` varchar(50) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civilStatus` varchar(10) DEFAULT NULL,
  `phoneNumber` varchar(11) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.workers: 7 rows
DELETE FROM `workers`;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` (`id`, `UserID`, `fullName`, `nickname`, `dob`, `gender`, `civilStatus`, `phoneNumber`, `Nationality`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 1, 'Antonio Jr. L. Piloton', 'Jun', '1998-02-03', 'Male', 'Single', NULL, NULL, 1, 1, '2025-06-25 01:46:59', '2025-06-24 17:46:59', 'active', 0, NULL),
	(2, 3, 'Bob Johnson', 'Jun', '2025-06-24', 'Male', 'Single', NULL, NULL, 3, 3, '2025-06-25 07:34:03', '2025-06-24 23:34:03', 'active', 0, NULL),
	(3, 2, 'Antonio Jr Piloton', 'Jun', '1998-02-04', 'Male', 'Single', '09128941731', 'Filipino', 2, 2, '2025-06-25 07:36:43', '2025-07-01 04:41:08', 'active', 0, NULL),
	(4, 5, 'Antonio Jr. L. Piloton', 'Jun', '1998-02-04', 'Male', 'Single', NULL, 'Filipino', 5, 5, '2025-07-03 03:50:32', '2025-07-03 03:50:43', 'active', 0, NULL),
	(5, 6, 'Mary Jane Libay', 'prettÃ¿yy', '1999-06-27', 'Female', 'Single', NULL, 'Filipino', 6, 6, '2025-07-03 09:57:18', '2025-07-03 09:57:18', 'active', 0, NULL),
	(6, 9, 'Robert N. Zabala', 'Roro', '2002-04-10', 'Male', 'Single', NULL, 'Filipinos', 9, 9, '2025-07-03 11:42:22', '2025-07-03 11:42:22', 'active', 0, NULL),
	(7, 18, 'ANTONIO JR. PILOTON', 'F.c', '1998-02-04', 'Male', 'Single', NULL, 'Filipino', 18, 18, '2025-07-04 21:21:09', '2025-07-04 21:21:09', 'active', 0, NULL);
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;

-- Dumping structure for table etrabaho.worker_attachments
CREATE TABLE IF NOT EXISTS `worker_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RequirementID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `FileName` varchar(200) NOT NULL DEFAULT '0',
  `FilePath` varchar(255) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `archived` tinyint(4) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.worker_attachments: 1 rows
DELETE FROM `worker_attachments`;
/*!40000 ALTER TABLE `worker_attachments` DISABLE KEYS */;
INSERT INTO `worker_attachments` (`id`, `RequirementID`, `UserID`, `FileName`, `FilePath`, `size`, `type`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(12, 1, 18, 'Certificate_of_Registration.pdf', 'user_files/18/1/pilEOTGT4mEbQiW1QGEctIYdeFrplER1TsyVCLMa.pdf', 299993, 'application/pdf', 18, 18, '2025-07-04 21:18:56', '2025-07-04 21:18:56', 'active', 0, NULL);
/*!40000 ALTER TABLE `worker_attachments` ENABLE KEYS */;

-- Dumping structure for table etrabaho.worker_profile
CREATE TABLE IF NOT EXISTS `worker_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `skills` int(11) DEFAULT NULL,
  `personal_info` int(11) DEFAULT NULL,
  `requirements` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('active','inactive','locked','unlocked') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.worker_profile: 5 rows
DELETE FROM `worker_profile`;
/*!40000 ALTER TABLE `worker_profile` DISABLE KEYS */;
INSERT INTO `worker_profile` (`id`, `UserID`, `email`, `phone_number`, `skills`, `personal_info`, `requirements`, `points`, `created_by`, `updated_by`, `created_at`, `updated_at`, `status`, `archived`, `deleted_at`) VALUES
	(1, 5, NULL, NULL, 1, 1, 0, 0, NULL, NULL, '2025-07-04 06:05:59', '2025-07-04 15:15:27', NULL, NULL, NULL),
	(5, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-04 15:13:41', '2025-07-04 15:13:41', NULL, NULL, NULL),
	(6, 18, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, '2025-07-04 20:43:28', '2025-07-05 07:54:29', NULL, NULL, NULL),
	(7, 19, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-04 21:57:10', '2025-07-04 21:57:10', NULL, NULL, NULL),
	(8, 6, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2025-07-05 04:26:17', '2025-07-05 04:26:17', NULL, NULL, NULL);
/*!40000 ALTER TABLE `worker_profile` ENABLE KEYS */;

-- Dumping structure for table etrabaho.worker_skills
CREATE TABLE IF NOT EXISTS `worker_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `skilled_worker_id` (`UserID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

-- Dumping data for table etrabaho.worker_skills: 72 rows
DELETE FROM `worker_skills`;
/*!40000 ALTER TABLE `worker_skills` DISABLE KEYS */;
INSERT INTO `worker_skills` (`id`, `UserID`, `skill_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `archived`, `deleted_at`) VALUES
	(1, 1, 1, '2025-06-24 18:49:03', 1, '2025-06-24 18:49:03', 1, 'active', 0, NULL),
	(20, 1, 14, '2025-06-24 19:21:08', 1, '2025-06-24 19:21:08', 1, 'active', 0, NULL),
	(19, 1, 17, '2025-06-24 19:21:02', 1, '2025-06-24 19:21:02', 1, 'active', 0, NULL),
	(15, 1, 2, '2025-06-24 19:09:25', 1, '2025-06-24 19:09:25', 1, 'active', 0, NULL),
	(5, 1, 8, '2025-06-24 18:55:26', 1, '2025-06-24 18:55:26', 1, 'active', 0, NULL),
	(23, 1, 12, '2025-06-24 19:44:32', 1, '2025-06-24 19:44:32', 1, 'active', 0, NULL),
	(24, 1, 6, '2025-06-24 19:47:29', 1, '2025-06-24 19:47:29', 1, 'active', 0, NULL),
	(25, 1, 7, '2025-06-24 19:47:30', 1, '2025-06-24 19:47:30', 1, 'active', 0, NULL),
	(17, 1, 15, '2025-06-24 19:19:41', 1, '2025-06-24 19:19:41', 1, 'active', 0, NULL),
	(16, 1, 5, '2025-06-24 19:11:48', 1, '2025-06-24 19:11:48', 1, 'active', 0, NULL),
	(21, 1, 13, '2025-06-24 19:21:09', 1, '2025-06-24 19:21:09', 1, 'active', 0, NULL),
	(18, 1, 16, '2025-06-24 19:20:18', 1, '2025-06-24 19:20:18', 1, 'active', 0, NULL),
	(22, 1, 18, '2025-06-24 19:29:53', 1, '2025-06-24 19:29:53', 1, 'active', 0, NULL),
	(26, 1, 19, '2025-06-24 19:48:56', 1, '2025-06-24 19:48:56', 1, 'active', 0, NULL),
	(28, 2, 16, '2025-06-24 23:37:00', 2, '2025-06-24 23:37:00', 2, 'active', 0, NULL),
	(29, 2, 20, '2025-06-24 23:37:13', 2, '2025-06-29 20:08:51', 2, 'active', 0, '2025-06-29 20:08:51'),
	(30, 2, 5, '2025-06-26 21:38:08', 2, '2025-06-26 23:39:21', 2, 'active', 0, '2025-06-26 23:39:21'),
	(31, 2, 4, '2025-06-26 21:38:08', 2, '2025-06-26 21:38:08', 2, 'active', 0, NULL),
	(32, 2, 3, '2025-06-26 21:38:09', 2, '2025-06-26 21:38:09', 2, 'active', 0, NULL),
	(33, 2, 2, '2025-06-26 21:38:10', 2, '2025-06-26 21:38:10', 2, 'active', 0, NULL),
	(34, 2, 1, '2025-06-26 21:38:10', 2, '2025-06-26 21:38:10', 2, 'active', 0, NULL),
	(35, 2, 5, '2025-06-27 18:36:21', 2, '2025-06-29 20:08:57', 2, 'active', 0, '2025-06-29 20:08:57'),
	(36, 12, 1, '2025-06-28 23:26:17', 12, '2025-06-28 23:26:17', 12, 'active', 0, NULL),
	(37, 12, 2, '2025-06-28 23:26:18', 12, '2025-06-28 23:26:18', 12, 'active', 0, NULL),
	(38, 12, 3, '2025-06-28 23:26:19', 12, '2025-06-28 23:26:19', 12, 'active', 0, NULL),
	(39, 1, 21, '2025-07-02 00:49:06', 1, '2025-07-02 00:49:06', 1, 'active', 0, NULL),
	(40, 1, 22, '2025-07-02 00:49:57', 1, '2025-07-02 00:49:57', 1, 'active', 0, NULL),
	(41, 1, 23, '2025-07-02 00:56:36', 1, '2025-07-02 00:56:36', 1, 'active', 0, NULL),
	(42, 1, 24, '2025-07-02 01:35:27', 1, '2025-07-02 01:35:27', 1, 'active', 0, NULL),
	(43, 1, 25, '2025-07-02 02:41:46', 1, '2025-07-02 02:41:46', 1, 'active', 0, NULL),
	(44, 1, 26, '2025-07-02 02:43:49', 1, '2025-07-02 02:43:49', 1, 'active', 0, NULL),
	(45, 5, 27, '2025-07-03 03:55:23', 5, '2025-07-03 04:10:02', 5, 'active', 0, '2025-07-03 04:10:02'),
	(46, 5, 3, '2025-07-03 04:06:44', 5, '2025-07-03 04:07:38', 5, 'active', 0, '2025-07-03 04:07:38'),
	(47, 5, 5, '2025-07-03 04:06:49', 5, '2025-07-03 04:07:34', 5, 'active', 0, '2025-07-03 04:07:34'),
	(48, 5, 4, '2025-07-03 04:06:51', 5, '2025-07-03 04:07:35', 5, 'active', 0, '2025-07-03 04:07:35'),
	(49, 5, 2, '2025-07-03 04:07:11', 5, '2025-07-03 04:07:36', 5, 'active', 0, '2025-07-03 04:07:36'),
	(50, 5, 1, '2025-07-03 04:07:12', 5, '2025-07-03 04:07:31', 5, 'active', 0, '2025-07-03 04:07:31'),
	(51, 5, 2, '2025-07-03 04:07:40', 5, '2025-07-03 07:30:24', 5, 'active', 0, '2025-07-03 07:30:24'),
	(52, 5, 3, '2025-07-03 04:07:43', 5, '2025-07-04 06:13:40', 5, 'active', 0, '2025-07-04 06:13:40'),
	(53, 5, 4, '2025-07-03 04:08:54', 5, '2025-07-03 04:08:58', 5, 'active', 0, '2025-07-03 04:08:58'),
	(54, 5, 5, '2025-07-03 04:08:56', 5, '2025-07-03 07:30:26', 5, 'active', 0, '2025-07-03 07:30:26'),
	(55, 5, 4, '2025-07-03 04:09:58', 5, '2025-07-03 09:42:50', 5, 'active', 0, '2025-07-03 09:42:50'),
	(56, 5, 1, '2025-07-03 04:10:00', 5, '2025-07-03 07:30:22', 5, 'active', 0, '2025-07-03 07:30:22'),
	(57, 5, 2, '2025-07-03 07:30:28', 5, '2025-07-03 09:42:49', 5, 'active', 0, '2025-07-03 09:42:49'),
	(58, 5, 1, '2025-07-03 07:30:30', 5, '2025-07-03 09:42:47', 5, 'active', 0, '2025-07-03 09:42:47'),
	(59, 5, 5, '2025-07-03 07:30:31', 5, '2025-07-03 09:42:48', 5, 'active', 0, '2025-07-03 09:42:48'),
	(60, 5, 1, '2025-07-03 10:28:03', 5, '2025-07-04 06:13:45', 5, 'active', 0, '2025-07-04 06:13:45'),
	(61, 5, 2, '2025-07-03 10:28:04', 5, '2025-07-04 06:13:41', 5, 'active', 0, '2025-07-04 06:13:41'),
	(62, 5, 4, '2025-07-03 10:28:05', 5, '2025-07-04 06:13:30', 5, 'active', 0, '2025-07-04 06:13:30'),
	(63, 5, 5, '2025-07-03 10:28:05', 5, '2025-07-04 06:13:42', 5, 'active', 0, '2025-07-04 06:13:42'),
	(64, 9, 1, '2025-07-03 11:36:35', 9, '2025-07-03 11:36:35', 9, 'active', 0, NULL),
	(65, 9, 4, '2025-07-03 11:36:37', 9, '2025-07-03 11:36:37', 9, 'active', 0, NULL),
	(66, 9, 3, '2025-07-03 11:36:39', 9, '2025-07-03 11:36:39', 9, 'active', 0, NULL),
	(67, 9, 2, '2025-07-03 11:36:41', 9, '2025-07-03 11:36:41', 9, 'active', 0, NULL),
	(68, 9, 5, '2025-07-03 11:36:41', 9, '2025-07-03 11:36:41', 9, 'active', 0, NULL),
	(69, 9, 28, '2025-07-03 11:38:47', 9, '2025-07-03 11:38:47', 9, 'active', 0, NULL),
	(70, 9, 29, '2025-07-03 11:38:56', 9, '2025-07-03 11:42:37', 9, 'active', 0, '2025-07-03 11:42:37'),
	(71, 9, 30, '2025-07-03 11:39:02', 9, '2025-07-03 11:42:36', 9, 'active', 0, '2025-07-03 11:42:36'),
	(72, 9, 31, '2025-07-03 11:39:02', 9, '2025-07-03 11:42:40', 9, 'active', 0, '2025-07-03 11:42:40'),
	(73, 9, 32, '2025-07-03 11:43:17', 9, '2025-07-03 11:43:17', 9, 'active', 0, NULL),
	(74, 6, 2, '2025-07-03 14:52:13', 6, '2025-07-03 14:52:13', 6, 'active', 0, NULL),
	(75, 6, 1, '2025-07-03 14:52:14', 6, '2025-07-03 14:52:14', 6, 'active', 0, NULL),
	(76, 6, 3, '2025-07-03 14:52:15', 6, '2025-07-03 14:52:15', 6, 'active', 0, NULL),
	(77, 6, 4, '2025-07-03 14:52:16', 6, '2025-07-03 14:52:16', 6, 'active', 0, NULL),
	(78, 10, 33, '2025-07-03 15:32:13', 10, '2025-07-03 15:32:13', 10, 'active', 0, NULL),
	(79, 5, 4, '2025-07-04 06:13:36', 5, '2025-07-04 06:13:43', 5, 'active', 0, '2025-07-04 06:13:43'),
	(80, 5, 5, '2025-07-04 06:13:48', 5, '2025-07-04 06:13:48', 5, 'active', 0, NULL),
	(81, 5, 4, '2025-07-04 06:13:51', 5, '2025-07-04 06:13:51', 5, 'active', 0, NULL),
	(82, 5, 3, '2025-07-04 06:15:12', 5, '2025-07-04 06:15:12', 5, 'active', 0, NULL),
	(83, 18, 1, '2025-07-04 20:43:28', 18, '2025-07-05 07:54:29', 18, 'active', 0, '2025-07-05 07:54:29'),
	(84, 18, 2, '2025-07-04 20:43:29', 18, '2025-07-05 07:54:27', 18, 'active', 0, '2025-07-05 07:54:27'),
	(85, 6, 5, '2025-07-05 04:26:17', 6, '2025-07-05 04:26:17', 6, 'active', 0, NULL);
/*!40000 ALTER TABLE `worker_skills` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
