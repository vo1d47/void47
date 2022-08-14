-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2022 at 12:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_discussions` (IN `user_id` INT)   BEGIN
	SELECT MAX(M.id) AS mid, M.message_creator as message_creator, MR.receiver_id as message_receiver, M.create_date as message_date, MR.is_read as is_read FROM message AS M
	INNER JOIN message_recipient AS MR
	ON M.id = MR.message_id
    WHERE M.message_creator = user_id OR MR.receiver_id = user_id
	GROUP BY M.message_creator, MR.receiver_id
	ORDER BY mid DESC;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `group_recipient_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`id`, `sender`, `receiver`, `group_recipient_id`, `message_id`) VALUES
(67, 1, 2, NULL, 67),
(69, 4, 1, NULL, 69),
(70, 4, 1, NULL, 70),
(71, 4, 1, NULL, 71),
(72, 4, 1, NULL, 72),
(73, 4, 1, NULL, 73),
(74, 4, 1, NULL, 74),
(75, 4, 1, NULL, 75),
(76, 4, 1, NULL, 76),
(77, 4, 1, NULL, 77);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment_owner` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `comment_edit_date` timestamp NULL DEFAULT NULL,
  `comment_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment_owner`, `post_id`, `comment_date`, `comment_edit_date`, `comment_text`) VALUES
(1, 1, 1, '2022-07-29 19:56:12', NULL, 'wpw'),
(2, 1, 2, '2022-07-29 19:56:28', NULL, 'wow'),
(3, 4, 5, '2022-07-29 21:36:12', NULL, 'hjkgfhdf&#039;'),
(4, 1, 6, '2022-07-30 08:54:17', NULL, 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `like_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `post_id`, `user_id`, `like_date`) VALUES
(1, 1, 1, '2022-07-29 19:56:07'),
(2, 5, 4, '2022-07-29 21:36:09'),
(3, 6, 1, '2022-07-30 08:54:14'),
(4, 7, 4, '2022-08-03 12:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message_creator` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_reply` int(11) DEFAULT NULL,
  `reply_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `message_creator`, `message`, `create_date`, `is_reply`, `reply_to`) VALUES
(51, 2, 'hello', '2022-07-29 16:05:09', NULL, NULL),
(52, 2, 'fghf', '2022-07-29 16:05:16', NULL, NULL),
(53, 2, '', '2022-07-29 16:05:16', NULL, NULL),
(54, 2, '', '2022-07-29 16:05:16', NULL, NULL),
(55, 2, '', '2022-07-29 16:05:16', NULL, NULL),
(56, 2, '', '2022-07-29 16:05:16', NULL, NULL),
(57, 1, 'hello', '2022-07-29 17:37:26', NULL, NULL),
(58, 1, 'gvgduvgsjgvje', '2022-07-29 17:37:30', NULL, NULL),
(59, 1, 'vdhvdshjgvcjhwgfjhsadghfcsdafkhfcsd', '2022-07-29 17:37:33', NULL, NULL),
(61, 4, 'fgjhfgdsjhvgjhf', '2022-07-29 17:39:51', 1, 59),
(62, 4, 'helloooo', '2022-07-29 17:40:00', 1, 57),
(63, 2, 'vdfhjvghjgdvhjs', '2022-07-30 04:52:16', NULL, NULL),
(64, 2, '', '2022-07-30 04:52:21', NULL, NULL),
(65, 1, 'read meee', '2022-07-30 04:52:53', NULL, NULL),
(66, 2, 'hello', '2022-07-30 04:56:32', NULL, NULL),
(67, 1, 'hello', '2022-08-02 10:24:28', NULL, NULL),
(68, 1, 'bvhb', '2022-08-02 10:24:51', NULL, NULL),
(69, 4, 'jgj', '2022-08-03 08:39:21', NULL, NULL),
(70, 4, '', '2022-08-03 08:39:22', NULL, NULL),
(71, 4, '', '2022-08-03 08:39:22', NULL, NULL),
(72, 4, '', '2022-08-03 08:39:22', NULL, NULL),
(73, 4, 'gjhghj', '2022-08-03 08:39:23', NULL, NULL),
(74, 4, 'feadf', '2022-08-06 20:16:26', NULL, NULL),
(75, 4, 'ghjghgffffffffffffffffffff', '2022-08-06 20:16:53', NULL, NULL),
(76, 4, 'hi my name is e', '2022-08-06 20:17:30', NULL, NULL),
(77, 4, 'hi', '2022-08-06 20:19:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_recipient`
--

CREATE TABLE `message_recipient` (
  `id` int(11) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message_recipient`
--

INSERT INTO `message_recipient` (`id`, `receiver_id`, `message_id`, `is_read`) VALUES
(1, 2, NULL, 0),
(2, 2, NULL, 0),
(3, 2, NULL, 0),
(4, 2, NULL, 0),
(5, 2, NULL, 0),
(7, 2, NULL, 0),
(8, 2, NULL, 0),
(9, 2, NULL, 0),
(10, 2, NULL, 0),
(11, 2, NULL, 0),
(12, 2, NULL, 0),
(13, 2, NULL, 0),
(14, 2, NULL, 0),
(15, 2, NULL, 0),
(16, 2, NULL, 0),
(17, 2, NULL, 0),
(18, 2, NULL, 0),
(19, 2, NULL, 0),
(20, 1, NULL, 0),
(21, 1, NULL, 0),
(22, 2, NULL, 0),
(23, 2, NULL, 0),
(24, 2, NULL, 0),
(25, 2, NULL, 0),
(26, 1, NULL, 0),
(27, 2, NULL, 0),
(28, 2, NULL, 0),
(29, 2, NULL, 0),
(30, 2, NULL, 0),
(31, 1, NULL, 0),
(32, 1, NULL, 0),
(33, 2, NULL, 0),
(34, 2, NULL, 0),
(35, 2, NULL, 0),
(36, 2, NULL, 0),
(37, 2, NULL, 0),
(38, 2, NULL, 0),
(39, 2, NULL, 0),
(40, 2, NULL, 0),
(41, 2, NULL, 0),
(42, 2, NULL, 0),
(43, 2, NULL, 0),
(44, 2, NULL, 0),
(45, 2, NULL, 0),
(46, 2, NULL, 0),
(47, 2, NULL, 0),
(48, 2, NULL, 0),
(49, 2, NULL, 0),
(50, 2, NULL, 0),
(51, 1, 51, 0),
(52, 1, 52, 0),
(53, 1, 53, 0),
(54, 1, 54, 0),
(55, 1, 55, 0),
(56, 1, 56, 0),
(57, 4, 57, 0),
(58, 4, 58, 0),
(59, 4, 59, 0),
(61, 1, 61, 0),
(62, 1, 62, 0),
(63, 1, 63, 0),
(64, 1, 64, 0),
(65, 4, 65, 0),
(66, 1, 66, 0),
(67, 2, 67, 0),
(68, 4, 68, 0),
(69, 1, 69, 0),
(70, 1, 70, 0),
(71, 1, 71, 0),
(72, 1, 72, 0),
(73, 1, 73, 0),
(74, 1, 74, 0),
(75, 1, 75, 0),
(76, 1, 76, 0),
(77, 1, 77, 0);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `post_owner` int(11) NOT NULL,
  `post_visibility` int(11) NOT NULL DEFAULT 0,
  `post_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `post_edit_date` timestamp NULL DEFAULT NULL,
  `text_content` text DEFAULT NULL,
  `picture_media` text DEFAULT NULL,
  `video_media` text DEFAULT NULL,
  `post_place` int(11) DEFAULT 1,
  `is_shared` int(11) DEFAULT 0,
  `post_shared_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `post_owner`, `post_visibility`, `post_date`, `post_edit_date`, `text_content`, `picture_media`, `video_media`, `post_place`, `is_shared`, `post_shared_id`) VALUES
(1, 1, 1, '2022-07-29 19:55:58', NULL, 'me so cool', 'data/users/frostdeday/posts/62e3e6ee982128.04969304/media/pictures/', 'data/users/frostdeday/posts/62e3e6ee982128.04969304/media/videos/', 1, 0, NULL),
(2, 1, 1, '2022-07-29 19:56:23', NULL, '', 'data/users/frostdeday/posts/62e3e7070154f1.83584209/media/pictures/', 'data/users/frostdeday/posts/62e3e7070154f1.83584209/media/videos/', 1, 0, NULL),
(3, 1, 1, '2022-07-29 19:56:40', NULL, '', NULL, NULL, 1, 1, 2),
(4, 3, 1, '2022-07-29 20:06:40', NULL, 'hello&lt;br/&gt;', 'data/users/mrbuck/posts/62e3e9702dfb28.57093017/media/pictures/', 'data/users/mrbuck/posts/62e3e9702dfb28.57093017/media/videos/', 1, 0, NULL),
(5, 4, 1, '2022-07-29 21:36:04', NULL, 'hello', 'data/users/nikkieice/posts/62e3fe64e18321.01756325/media/pictures/', 'data/users/nikkieice/posts/62e3fe64e18321.01756325/media/videos/', 1, 0, NULL),
(6, 1, 1, '2022-07-30 08:53:54', NULL, 'hello', 'data/users/frostdeday/posts/62e49d42b79964.81890259/media/pictures/', 'data/users/frostdeday/posts/62e49d42b79964.81890259/media/videos/', 1, 0, NULL),
(7, 4, 1, '2022-08-03 12:37:23', NULL, 'hfhjfy', 'data/users/nikkieice/posts/62ea17a3ac9f35.58673933/media/pictures/', 'data/users/nikkieice/posts/62ea17a3ac9f35.58673933/media/videos/', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_place`
--

CREATE TABLE `post_place` (
  `id` int(11) NOT NULL,
  `post_place` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_place`
--

INSERT INTO `post_place` (`id`, `post_place`) VALUES
(1, 'timeline'),
(2, 'group');

-- --------------------------------------------------------

--
-- Table structure for table `post_visibility`
--

CREATE TABLE `post_visibility` (
  `id` int(11) NOT NULL,
  `visibility` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_visibility`
--

INSERT INTO `post_visibility` (`id`, `visibility`) VALUES
(1, 'public'),
(2, 'friends'),
(3, 'only me');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hash` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_session`
--

INSERT INTO `users_session` (`id`, `user_id`, `hash`) VALUES
(6, 4, '1cd200eb71e777be8be714d676e9ad75c93a437bc99e21ceb8e33c11a1b7b4be'),
(7, 1, 'a9ccd00e6e488fbbb8167b583dd0c16eef42db3da436f947e39faaebc1c9efce'),
(8, 2, 'deb051f05fd1c9100cccd08e48453a54728e03f83c5274ec327b2626cf60223c');

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `followed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`id`, `follower_id`, `followed_id`) VALUES
(5, 1, 4),
(3, 3, 2),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `joined` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_type` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `bio` varchar(800) DEFAULT NULL,
  `picture` text DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT -1,
  `last_active_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `username`, `password`, `salt`, `firstname`, `lastname`, `joined`, `user_type`, `email`, `bio`, `picture`, `cover`, `private`, `last_active_update`) VALUES
(1, 'frostdeday', 'cd21bb25814d3ce3008ac30cac3b14bb45b0b5c3106bcf3f7a596c7f2c2de0c0', '0b69ed9f05672a2fc4dee552494e90bb', 'justin', 'ruck', '2022-07-29 05:51:07', 1, 'justinruck080@gmail.com', 'hello jfbdashjvgaj', 'data/users/frostdeday/media/pictures/4d0fbfa4a044fb3473daa93dc415c18184deb7ac567a3a53d3133b983101e995.png', 'data/users/frostdeday/media/covers/a2313aa3f9866fd69a5ba2d981abbdb516dab458554984006e7932c069b75871.png', 1, '2022-08-03 12:33:34'),
(2, 'frostdeday2', '7cc0031cd176d4aca875469ab03944f56156c66f6cd4126140c89ccb00cca201', '7bea02c65426f3ac38e73ed7d832ec76', 'monkey', 'hitman', '2022-07-29 05:52:13', 1, 'justinruck080@gmail.com', NULL, NULL, NULL, -1, '2022-07-30 09:06:35'),
(3, 'mrbuck', '5f646d722cd4ea80fa0f480178056dcd3f10703037d48c6cb202745ade8781d6', '4eff429a055a402338812f5077d9f1cd', 'nick', 'buck', '2022-07-29 08:06:12', 1, 'someaddr.com', NULL, NULL, NULL, -1, '2022-07-29 08:42:52'),
(4, 'nikkieice', 'afb52e2909fd2eca16e3e553aae88b3d986ba4f8fe0a8f24ecbebec95e0e1339', 'f691acb92da6ba87b13d4554cb527a34', 'nicole7', 'ruck', '2022-07-29 09:35:18', 1, 'cjdbchjsdghcjs@gmail.com', 'hello i am cool', 'data/users/nikkieice/media/pictures/30c09289068b54a215c37929cc31f4ea2ed447b90d20dc92534cde4f8950cfd1.png', 'data/users/nikkieice/media/covers/8064bab0cf4d47e866cd3bd48ca6a57c0a8511a23702319af9fc5a2790085397.png', -1, '2022-08-06 12:19:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_metadata`
--

CREATE TABLE `user_metadata` (
  `id` int(11) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_metadata`
--

INSERT INTO `user_metadata` (`id`, `label`, `content`, `user_id`) VALUES
(1, 'school', 'new york un', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_relation`
--

CREATE TABLE `user_relation` (
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  `since` timestamp NOT NULL DEFAULT current_timestamp(),
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_relation`
--

INSERT INTO `user_relation` (`from`, `to`, `status`, `since`, `id`) VALUES
(4, 1, 'F', '2022-07-29 15:37:14', 4),
(1, 4, 'F', '2022-07-29 21:37:14', 5),
(2, 1, 'F', '2022-08-02 08:05:00', 8),
(1, 2, 'F', '2022-08-02 14:05:00', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(30) DEFAULT NULL,
  `permission` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type_name`, `permission`) VALUES
(1, 'Normal user', NULL),
(2, 'Admin', '{\'Admin\':1}');

-- --------------------------------------------------------

--
-- Table structure for table `writing_message_notifier`
--

CREATE TABLE `writing_message_notifier` (
  `message_writer` int(11) DEFAULT NULL,
  `message_waiter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_index` (`post_id`,`user_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_recipient`
--
ALTER TABLE `message_recipient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_place` (`post_place`);

--
-- Indexes for table `post_place`
--
ALTER TABLE `post_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_visibility`
--
ALTER TABLE `post_visibility`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `follow_unique` (`follower_id`,`followed_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_metadata`
--
ALTER TABLE `user_metadata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_label_UK` (`label`,`user_id`);

--
-- Indexes for table `user_relation`
--
ALTER TABLE `user_relation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE_RELATION` (`from`,`to`,`status`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `message_recipient`
--
ALTER TABLE `message_recipient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_place`
--
ALTER TABLE `post_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_visibility`
--
ALTER TABLE `post_visibility`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_metadata`
--
ALTER TABLE `user_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_relation`
--
ALTER TABLE `user_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `message_recipient`
--
ALTER TABLE `message_recipient`
  ADD CONSTRAINT `message_recipient_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_place` FOREIGN KEY (`post_place`) REFERENCES `post_place` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
