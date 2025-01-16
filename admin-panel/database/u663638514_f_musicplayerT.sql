-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 16, 2024 at 09:17 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u663638514_f_musicplayerT`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`, `email`, `image`) VALUES
(1, 'admin', '$argon2i$v=19$m=65536,t=4,p=1$V2pEQ2RKODdHcm9KSE50SQ$3H8wfOrye1UR4Tah3yHUj9Wit2VLvr6P+u+zaJSDJis', 'email@gmali.com', '7223_Bird-Masked DJ at Event.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_album`
--

CREATE TABLE `tbl_album` (
  `aid` int(11) NOT NULL,
  `artist_ids` varchar(255) DEFAULT NULL,
  `album_name` varchar(255) NOT NULL,
  `album_image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_album`
--

INSERT INTO `tbl_album` (`aid`, `artist_ids`, `album_name`, `album_image`, `status`) VALUES
(2, '38,36,39,2,37', 'Bollywood', '72670_67c3718fb2f9f9ad7d0ee372c71ff044.jpg', 1),
(5, '38,10,39,2,37', 'Love', '64788_93530eb8-9727-47cc-872f-69b8e7bc4cf0.jpg', 1),
(6, '36,10,33,2,37', 'Punjabi', '29540_India-Incredible.jpg', 1),
(7, '38,36,39,2,37', 'Sad', '90916_0fb5d9e6-2f15-4f50-b5de-d724a2b0f115.jpg', 1),
(11, '38,36,24,10,33', 'Breakup', '87716_Check-it-out.jpg', 1),
(12, '13,39,34,2,32,37', 'Wedding', '73545_Romantic-Wedding-Photos.jpg', 1),
(13, '24,10,13,2', 'Indipop', '23865_Almost-Monday-at-Bluebird-Denver.jpg', 1),
(25, '57,38,58,13,34', 'Full Of Hope', '96025_girl-711087.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_artist`
--

CREATE TABLE `tbl_artist` (
  `id` int(11) NOT NULL,
  `artist_name` varchar(255) NOT NULL,
  `artist_image` varchar(255) NOT NULL,
  `a_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_artist`
--

INSERT INTO `tbl_artist` (`id`, `artist_name`, `artist_image`, `a_status`) VALUES
(2, 'Arijit Singh', '13377_213dd466-25cc-4d80-8963-02585c2643d1.jpg', 1),
(10, 'Neha Kakkar', '79218_901f8433-4fe0-4b59-bd82-22542b69975c.jpg', 1),
(13, 'Honey Singh', '31457_Blue-Eyes-Singer_-Yo-Yo-Honey-Singh.jpg', 1),
(24, 'Shreya Ghoshal', '7472_2b861c3c-c43b-4bb8-85f4-b273e9abf2bb.jpg', 1),
(32, 'Alka Yagnik', '47645_Alka-Yagnik.jpg', 1),
(33, 'Kumar Sanu', '53787_Kumar-Sanu-watch-latest-melodious.jpg', 1),
(34, 'B Praak', '57934_B-Praak.jpg', 1),
(36, 'Sonu Nigam', '34734_894101d8-5d26-47bc-aea8-7c931d1e2f42.jpg', 1),
(37, 'Akull', '83268_ab6761610000e5eb6a7239e63a850d8c4c4d287e.jpg', 1),
(38, 'Teriyaki Boyz', '89098_Screenshot_1.png', 1),
(39, 'Dhvani Bhanushali', '47619_21-Photos-Of-Dhvani-Bhanushali,-The-Young-Singer-Who-Is-Stealing-Our-Hearts.jpg', 1),
(42, 'Mirawilibass', '5645_d41d8cd98f00b204e9800998ecf8427e.jpg', 1),
(57, 'Udit Narayan', '8622_Udit_Narayan_500x500.jpg', 1),
(58, 'Mika Singh', '94560_2022_3$largeimg_1308389596.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banner`
--

CREATE TABLE `tbl_banner` (
  `bid` int(11) NOT NULL,
  `banner_title` varchar(255) NOT NULL,
  `banner_sort_info` varchar(500) NOT NULL,
  `banner_image` varchar(255) NOT NULL,
  `banner_songs` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_banner`
--

INSERT INTO `tbl_banner` (`bid`, `banner_title`, `banner_sort_info`, `banner_image`, `banner_songs`, `status`) VALUES
(5, 'House Music', '&lt;p&gt;House Music&lt;/p&gt;', '16817_Focused-Audio-Engineer.jpg', '75,73,72,71,70,68,66,65,64,62,77', 1),
(6, 'Music World', '&lt;p&gt;Music World&lt;/p&gt;', '3397_Retro-Pastel-Red-Boombox-with-Yellow-Cassette.jpg', '75,73,72,71,70,68,66,65,64,77', 1),
(9, 'Mix Music', '&lt;p&gt;Mix Music&lt;/p&gt;', '49850_abstract-7476911_1920.png', '75,73,72,71,70,68,65,77', 1),
(14, 'Instrumental Music', '&lt;p&gt;Instrumental Music&lt;/p&gt;', '22802_Passionate-Guitarist-in-Warm-Hues.jpg', '75,73,72,71,70,68,66,65,77', 1),
(15, 'No Music', '&lt;p&gt;No Music&lt;/p&gt;', '29534_Serene-Melody.jpg', '73,72,71,70,68,66,65,64,62', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`cid`, `category_name`, `category_image`, `status`) VALUES
(7, 'Sad Song wala', '47012_sad-8175107.jpg', 1),
(12, 'Patriotic', '26070_krishna-8570354.jpg', 1),
(14, 'Popular music', '91346_ai-generated-7919986.jpg', 1),
(17, 'Classical music', '32193_violin-8778026.png', 1),
(21, 'Bollywood', '1455_girl-6534052.jpg', 1),
(25, 'Hip hop', '82105_dancer-6919922.jpg', 1),
(34, 'Folk music', '39232_ai-generated-8677390.jpg', 1),
(35, 'Soul music', '74823_music-6775817.jpg', 1),
(36, 'Rock', '18818_girl-5010295.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorite`
--

CREATE TABLE `tbl_favorite` (
  `id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_favorite`
--

INSERT INTO `tbl_favorite` (`id`, `post_id`, `user_id`, `created_at`) VALUES
(109, 63, 227, '1672304528'),
(282, 78, 226, '1673414179'),
(283, 63, 226, '1673414264'),
(284, 77, 261, '1673415257'),
(287, 63, 263, '1673426219'),
(288, 71, 263, '1673426273'),
(289, 67, 263, '1673426418'),
(291, 66, 263, '1673431590'),
(296, 76, 263, '1673518440'),
(297, 62, 263, '1673518588'),
(305, 73, 254, '1673842587'),
(306, 72, 254, '1673842607'),
(315, 70, 281, '1674449104'),
(381, 82, 0, '1675839695'),
(390, 79, 223, '1675853695'),
(392, 75, 299, '1676551956'),
(393, 77, 299, '1676552110'),
(395, 66, 299, '1676552350'),
(403, 77, 305, '1678634406'),
(413, 65, 310, '1679624078'),
(415, 73, 310, '1679624123'),
(417, 71, 309, '1679645496'),
(422, 64, 317, '1682576841'),
(423, 62, 315, '1682827335'),
(424, 70, 318, '1683378015'),
(425, 71, 319, '1683434444'),
(426, 68, 319, '1683434461'),
(427, 71, 322, '1684322025'),
(429, 62, 322, '1684324015'),
(430, 77, 343, '1688459762'),
(440, 71, 362, '1688468977'),
(463, 78, 373, '1688531277'),
(465, 68, 340, '1688638437'),
(466, 64, 340, '1688638763'),
(468, 62, 340, '1688638772'),
(469, 65, 421, '1689600860'),
(470, 84, 427, '1691662618'),
(471, 73, 435, '1693862353'),
(474, 78, 444, '1699528451'),
(488, 65, 462, '1709768074'),
(489, 73, 462, '1709768105'),
(490, 70, 462, '1709805928'),
(491, 66, 471, '1710300690'),
(492, 68, 10, '1714469730'),
(497, 98, 478, '1717825030'),
(503, 85, 466, '1728360867'),
(504, 90, 494, '1734160303');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favorite_artist`
--

CREATE TABLE `tbl_favorite_artist` (
  `id` int(10) NOT NULL,
  `artist_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_favorite_artist`
--

INSERT INTO `tbl_favorite_artist` (`id`, `artist_id`, `user_id`, `created_at`) VALUES
(1, 37, 223, '1671712107'),
(2, 32, 223, '1671712246'),
(7, 10, 10, '1714470216');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_geners`
--

CREATE TABLE `tbl_geners` (
  `id` int(11) NOT NULL,
  `geners_name` int(11) NOT NULL,
  `g_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_geners`
--

INSERT INTO `tbl_geners` (`id`, `geners_name`, `g_status`) VALUES
(1, 2019, 1),
(2, 2020, 1),
(3, 2021, 1),
(4, 2022, 1),
(6, 2023, 1),
(7, 2024, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_section`
--

CREATE TABLE `tbl_home_section` (
  `id` int(10) NOT NULL,
  `section_title` varchar(150) NOT NULL,
  `section_books` longtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_home_section`
--

INSERT INTO `tbl_home_section` (`id`, `section_title`, `section_books`, `status`) VALUES
(1, 'Latest', '79,78,77,76,75,74,71,70,69,66,65', 1),
(2, 'Today Mix', '85,90,91,94', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mp3`
--

CREATE TABLE `tbl_mp3` (
  `id` int(11) NOT NULL,
  `cat_id` varchar(250) NOT NULL,
  `album_id` int(11) NOT NULL,
  `mp3_type` varchar(255) NOT NULL,
  `mp3_title` varchar(100) NOT NULL,
  `mp3_url` text NOT NULL,
  `mp3_artist` varchar(250) NOT NULL DEFAULT '1',
  `mp3_thumbnail` varchar(255) NOT NULL,
  `mp3_cover` varchar(250) NOT NULL DEFAULT '26002_19725_4.jpg',
  `mp3_duration` varchar(255) NOT NULL,
  `mp3_description` text NOT NULL,
  `mp3_lyrics` text NOT NULL,
  `total_rate` int(11) NOT NULL DEFAULT 0,
  `rate_avg` int(11) NOT NULL DEFAULT 0,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `total_download` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_mp3`
--

INSERT INTO `tbl_mp3` (`id`, `cat_id`, `album_id`, `mp3_type`, `mp3_title`, `mp3_url`, `mp3_artist`, `mp3_thumbnail`, `mp3_cover`, `mp3_duration`, `mp3_description`, `mp3_lyrics`, `total_rate`, `rate_avg`, `total_views`, `total_download`, `status`) VALUES
(62, '7', 11, 'local', 'BEWAFA', '9766162_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '35497_Bewafa-Tera-Masoom-Chehra-Hindi-2020-20201116051001-500x500.jpg', '26002_19725_4.jpg', '04:44', '&lt;p&gt;BEWAFA&lt;/p&gt;', '&lt;p&gt;BEWAFA&lt;/p&gt;', 0, 0, 1463, 0, 1),
(64, '17', 5, 'local', 'Desh Mere', '7268764_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '85403_Bhuj-The-Pride-Of-India-Hindi-2021-20210818145728-500x500.jpg', '26002_19725_4.jpg', '03:08', '&lt;p&gt;Desh Mera&lt;/p&gt;', '&lt;p&gt;Desh Mera&lt;/p&gt;', 0, 0, 201, 0, 1),
(65, '21', 13, 'local', 'Dhoom Tera', '9158665_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '62554_Movie-Review-Bellbottom.jpg', '26002_19725_4.jpg', '02:04', '&lt;p&gt;Dhoom Tera&lt;/p&gt;', '&lt;p&gt;Dhoom Tera&lt;/p&gt;', 0, 0, 648, 0, 1),
(66, '7', 5, 'local', 'Dosti', '7361666_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '36960_Dosti-From-Rrr--Hindi-2021-20210731203739-500x500.jpg', '26002_19725_4.jpg', '05:05', '&lt;p&gt;Dosti&lt;/p&gt;', '&lt;p&gt;Dosti&lt;/p&gt;', 0, 0, 898, 2, 1),
(68, '14', 6, 'local', 'Khushi Jab Bhi Teri', '9674168_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '54450_Khushi-Jab-Bhi-Teri-Feat-Khushalii-Kumar--Hindi-2021-20210820183120-500x500.jpg', '26002_19725_4.jpg', '04:10', '&lt;p&gt;Khushi Jab Bhi Teri&lt;/p&gt;', '&lt;p&gt;Khushi Jab Bhi Teri&lt;/p&gt;', 1, 5, 261, 0, 1),
(70, '21', 12, 'local', 'Marjaawaan', '2826970_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '19475_ab67616d0000b27338a5518f517ddee915a17765.jpg', '26002_19725_4.jpg', '03:20', '&lt;p&gt;Marjaawaan&lt;/p&gt;', '&lt;p&gt;Marjaawaan&lt;/p&gt;', 0, 0, 253, 0, 1),
(71, '14', 6, 'local', 'Qismat 2', '6685271_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '50101_images.jpg', '26002_19725_4.jpg', '04:59', '&lt;p&gt;Qismat 2&lt;/p&gt;', '&lt;p&gt;Qismat Qismat Qismat Qismat Qismat X2&lt;/p&gt;\n\n&lt;p&gt;O Baarish Taan Badlaan Te&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Ho Baaki Mor Di Qismat Ae X2&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Oh Ajj Kise Hor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Ajj Kise Hor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Ajj Kise Hor Di Qismat Ae.&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Qismat Qismat Qismat Qismat Qismat X2&lt;/p&gt;\n\n&lt;p&gt;Oo Nadi Si Dariya Lae Gaya&lt;/p&gt;\n\n&lt;p&gt;Mai Taa&rsquo;n Vekhda Reh Gaya X2&lt;/p&gt;\n\n&lt;p&gt;Aethe Chann Di Marzi Hoye&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Chakor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Ajj Kise Hor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Ajj Kise Hor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Antra 1 ,&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Oh Khuda Mereya. Mere Naal Aisi Hoyi&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Mere Pyaar Da Vi. Pyaar Ae Koi X2&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Mera Dil Roya. Meri Rooh Vi Royi&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Mere Pyaar Da Vi Pyaar Ae Koi&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jaani Vargeaa&rsquo;n Di Duniya&rsquo;n&lt;/p&gt;\n\n&lt;p&gt;Kamzor Di Qismat Ae&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Oh Ajj Kise Hor Di Qismat Ae X3&lt;/p&gt;\n\n&lt;p&gt;&nbsp;&lt;/p&gt;\n\n&lt;p&gt;Tere Naal Pyaar Marde Dum Tak&lt;/p&gt;\n\n&lt;p&gt;Tera Intzaar Marde Dum Tak&lt;/p&gt;\n\n&lt;p&gt;Zinda Na Chadeyaa Mareya Vi Nai&lt;/p&gt;\n\n&lt;p&gt;Eh Ki Ae Yaar Marde Dum Tak&lt;/p&gt;\n\n&lt;p&gt;Kado&rsquo;n Tod Deve Koi&lt;/p&gt;\n\n&lt;p&gt;Eh Taa&rsquo;n Dor Di Qismat Ae&lt;/p&gt;\n\n&lt;p&gt;Jo Kal Meri Qismat Si&lt;/p&gt;\n\n&lt;p&gt;Oh Ajj Kise Hor Di Qismat Ae X3&lt;/p&gt;', 0, 0, 717, 0, 1),
(72, '21', 6, 'local', 'Raatan Lambiyan', '4515972_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '51560_download-(1).jpg', '26002_19725_4.jpg', '03:50', '&lt;p&gt;Raatan Lambiyan&lt;/p&gt;', '&lt;p&gt;ਤੇਰੀ ਮੇਰੀ ਗੱਲਾਂ ਹੋ ਗਈ ਮਸ਼ਹੂਰ&lt;br /&gt;\nਕਰ ਨਾ ਕਭੀ ਤੂ ਮੁਝੇ ਨਜ਼ਰੋਂ ਸੇ ਦੂਰ&lt;br /&gt;\nਕਿੱਥੇ ਚਲੀ ਏ ਤੂ ਕਿਥੇ ਚਲੀ ਏ ਤੂ&lt;br /&gt;\nਕਿੱਥੇ ਚਲੀ ਏ ਤੂ ਕਿਥੇ ਚਲੀ ਏ ਤੂ&lt;br /&gt;\nਜਾਣਦਾ ਏ ਦਿਲ ਏ ਤੋਂ ਜਾਂਦੀ ਏ ਤੂ&lt;br /&gt;\nਤੇਰੇ ਬਿਨ ਮੈਂ ਨਾ ਰਹਿਣ ਮੇਰੇ ਬਿਨਾ ਤੂ&lt;br /&gt;\nਕਿੱਥੇ ਚਲੀ ਏ ਤੂ ਕਿਥੇ ਚਲੀ ਏ ਤੂ&lt;br /&gt;\nਕਿੱਥੇ ਚਲੀ ਏ ਤੂ ਕਿਥੇ ਚਲੀ ਏ ਤੂ&lt;br /&gt;\nਕਾਟੂੰ ਕੈਸੇ ਰਾਤਾਂ ਓ ਸਾਵਰੇ&lt;br /&gt;\nਜਿਯਾ ਨਹੀ ਜਾਤਾ ਸੁਣ ਬਾਵਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;/p&gt;\n\n&lt;p&gt;ਚੰਮ ਚੰਮ ਚੰਮ ਅੰਬਰਾਂ ਦੇ ਤਾਰੇ ਕਿਹੰਦੇ ਨੇ ਸੱਜਣਾ&lt;br /&gt;\nਤੂ ਹੀ ਚੰਨ ਮੇਰੇ ਇਸ ਦਿਲ ਦਾ ਮੰਨ ਲੇ ਵੇ ਸੱਜਣਾ&lt;br /&gt;\nਤੇਰੇ ਬਿਨਾ ਮੇਰਾ ਹੋ ਨਾ ਗੁਜ਼ਾਰਾ&lt;br /&gt;\nਛੱਡ ਕੇ ਨਾ ਜਾਵੀਂ ਮੈਨੂ ਤੂ ਹੀ ਹੈ ਸਹਾਰਾ&lt;/p&gt;\n\n&lt;p&gt;ਕਾਟੂੰ ਕੈਸੇ ਰਾਤਾਂ ਓ ਸਾਵਰੇ&lt;br /&gt;\nਜਿਯਾ ਨਹੀ ਜਾਤਾ ਸੁਣ ਬਾਵਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;/p&gt;\n\n&lt;p&gt;ਤੇਰੀ ਮੇਰੀ ਗੱਲਾਂ ਹੋ ਗਾਯੀ ਮਸ਼ਹੂਰ&lt;br /&gt;\nਕਰ ਨਾ ਕਭੀ ਤੂ ਮੈਨੂ ਨਜ਼ਰੋਂ ਸੇ ਦੂਰ&lt;br /&gt;\nਪਿੱਛੇ ਚਲੀ ਏ ਤੇਰੇ ਪਿੱਛੇ ਚਲੀ ਏ&lt;br /&gt;\nਤੇਰੇ ਪਿੱਛੇ ਚਲੀ ਏ&lt;/p&gt;\n\n&lt;p&gt;ਜਾਣਦਾ ਏ ਦਿਲ ਏ ਤੋਂ ਜਾਣਦੀ ਏ ਤੂ&lt;br /&gt;\nਤੇਰੇ ਬਿਨਾ ਮੈਂ ਨਾ ਰਹਿਣ ਮੇਰੇ ਬਿਨਾ ਤੂ&lt;br /&gt;\nਕਿਥੇ ਚਲੀ ਏ ਤੂ ਕੀਤੇ ਚਲੀ ਏ ਤੂ&lt;br /&gt;\nਕਿਥੇ ਚਲੀ ਏ&lt;br /&gt;\nਕਾਟੂੰ ਕੈਸੇ ਰਾਤਾਂ ਓ ਸਾਵਰੇ&lt;br /&gt;\nਜਿਯਾ ਨਹੀ ਜਾਤਾ ਸੁਣ ਬਾਵਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;/p&gt;\n\n&lt;p&gt;ਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;br /&gt;\nਕੇ ਰਾਤਾਂ ਲੰਮੀਆਂ ਲੰਮੀਆਂ ਰੇ&lt;br /&gt;\nਕਟੇ ਤੇਰੇ ਸੰਗਿਆਂ ਸੰਗਿਆਂ ਰੇ&lt;/p&gt;', 0, 0, 109, 0, 1),
(73, '17', 13, 'local', 'Rang Dariya', '1018173_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '7560_first-song-rang-dariya-from-chehre.jpg', '26002_19725_4.jpg', '03:15', '&lt;p&gt;Rang Dariya&lt;/p&gt;', '&lt;p&gt;Rang Dariya&lt;/p&gt;', 0, 0, 498, 0, 1),
(75, '12', 11, 'local', 'Saath Kya Nibhaoge', '3286875_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '10781_04_08_2021-saath_kya_nibhaoge.jpg', '26002_19725_4.jpg', '03:56', '&lt;p&gt;Saath Kya Nibhaoge&lt;/p&gt;', '&lt;p&gt;Saath Kya Nibhaoge&lt;/p&gt;', 0, 0, 501, 0, 1),
(77, '14', 11, 'local', 'Baarish mein Tum', '6861577_mp3.mp3', 'Teriyaki Boyz,Sonu Nigam,Neha Kakkar,Mirawilibass', '61980_Baarish-Mein-Tum.jpg', '26002_19725_4.jpg', '04:03', '&lt;p&gt;Description Baarish Mein Tum&lt;/p&gt;', '&lt;p&gt;Description Baarish Mein Tum&lt;/p&gt;', 0, 0, 1847, 0, 1),
(78, '14', 11, 'local', 'Dhokhaa', '6732778_mp3.mp3', 'Arijit Singh', '35249_TERA-NAAM-DHOKHA-RAKH-DU.jpg', '26002_19725_4.jpg', '04:53', '&lt;p&gt;&nbsp;Dhokha&lt;/p&gt;', '&lt;p&gt;&nbsp;Dhokha&lt;/p&gt;', 0, 0, 1930, 0, 1),
(85, '21', 25, 'local', 'tinku jiya', '9847785_mp3.mp3', 'Shreya Ghoshal,Mirawilibass', '32289_Tinku-Jiya-Full-Song-Yamla-Pagla-Deewana-_-Dharmendra,-Bobby-Deol.jpg', '26002_19725_4.jpg', '02:57', '&lt;p&gt;tinku jiya&lt;/p&gt;', '&lt;p&gt;tinku jiya&nbsp;&lt;/p&gt;', 0, 0, 71, 0, 1),
(90, '25', 5, 'local', 'Gulabi Sadi', '42997_Gulabi-Sadi(PaglaSongs).mp3', 'Sonu Nigam,Shreya Ghoshal,Neha Kakkar,Mika Singh,Kumar Sanu,Dhvani Bhanushali', '57398_19136_4.jpg', '26002_19725_4.jpg', '03:45', '&lt;blockquote&gt;\n&lt;table&gt;\n	&lt;tbody&gt;\n		&lt;tr&gt;\n			&lt;td&gt;&lt;strong&gt;Trending Songs (2024)&lt;/strong&gt;&lt;/td&gt;\n		&lt;/tr&gt;\n	&lt;/tbody&gt;\n&lt;/table&gt;\n\n&lt;p&gt;Sanju Rathod&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Sanju Rathod&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 11, 0, 1),
(91, '7', 2, 'local', 'Kyon Itna Tadpata Hai', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/98268_Kyon-Itna-Tadpata-Hai(PagalWorld).mp3', 'Udit Narayan', '41619_maxresdefault.jpg', '26002_19725_4.jpg', '07:08', '&lt;blockquote&gt;\n&lt;p&gt;Babul Supriyo&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Babul Supriyo&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 7, 0, 1),
(92, '36', 25, 'local', 'Ullu Ka Pattha', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/80832_Ullu-Ka-Pattha(PagalWorld).mp3', 'Arijit Singh', '5592_5881e052cc2ac8ee6d2c3a9218dca972.1000x1000x1.png', '26002_19725_4.jpg', '03:31', '&lt;blockquote&gt;\n&lt;p&gt;Amitabh Bhattacharya&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Amitabh Bhattacharya&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 4, 0, 1),
(93, '7', 7, 'local', 'Sitam Humpe', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/99184_Sitam-Humpe(PagalWorld).mp3', 'B Praak', '26002_19725_4.jpg', '26002_19725_4.jpg', '03:10', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 0, 0, 1),
(94, '17', 5, 'local', 'Kamsin Kali', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/20160_Kamsin-Kali(PagalWorld).mp3', 'Neha Kakkar', '81584_maxresdefault-(1).jpg', '26002_19725_4.jpg', '03:12', '&lt;blockquote&gt;\n&lt;p&gt;Tony Kakkar&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Tony Kakkar&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 0, 0, 1),
(95, '35', 5, 'local', 'O Mere Humnava', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/37621_O-Mere-Humnava(PagalWorld).mp3', 'Sonu Nigam', '35346_GJMFcNuWYAInP39.jpg', '26002_19725_4.jpg', '03:53', '&lt;blockquote&gt;\n&lt;p&gt;Sanjeev Chaturvedi&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Sanjeev Chaturvedi&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 0, 0, 1),
(96, '14', 25, 'local', 'Rabba Mereya', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/21711_Rabba-Mereya(PagalWorld).mp3', 'B Praak', '71730_maxresdefault-(2).jpg', '26002_19725_4.jpg', '03:49', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 3, 0, 1),
(97, '36', 6, 'local', 'Kithe Challe Ho', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/17123_Kithe-Challe-Ho(PagalWorld)-(1).mp3', 'Mika Singh', '58718_Kithe-Challe-Ho-Punjabi-2023-20231213191024-500x500.jpg', '26002_19725_4.jpg', '02:56', '&lt;blockquote&gt;\n&lt;p&gt;Mika Singh&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Mika Singh&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 1, 0, 1),
(98, '35', 13, 'local', 'Jawaab', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/31218_Jawaab(PagalWorld).mp3', 'Mika Singh', '39410_maxresdefault-(3).jpg', '26002_19725_4.jpg', '03:23', '&lt;blockquote&gt;\n&lt;h2&gt;Badshah&lt;/h2&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Badshah&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 6, 0, 1),
(99, '7', 7, 'local', 'Hum Peete Nahi Pilai Gai Hai', '40059_Hum-Peete-Nahi-Pilai-Gai-Hai(PagalWorld).mp3', 'B Praak', '20661_hq720.jpg', '26002_19725_4.jpg', '05:20', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 1, 0, 1),
(100, '7', 5, 'local', 'Ae Dil Hai Mushkil', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/58114_Ae-Dil-Hai-Mushkil(PagalWorld).mp3', 'Arijit Singh', '94663_sddefault.jpg', '26002_19725_4.jpg', '05:01', '&lt;blockquote&gt;\n&lt;p&gt;Amitabh Bhattacharya&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Amitabh Bhattacharya&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 5, 0, 1),
(101, '7', 5, 'local', 'Hamdard', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/51399_Hamdard_192(PagalWorld).mp3', 'Arijit Singh', '2513_artworks-000081201902-lsb9b7-t500x500.jpg', '26002_19725_4.jpg', '04:19', '&lt;blockquote&gt;\n&lt;p&gt;Mithoon&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Mithoon&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 1, 0, 1),
(102, '7', 7, 'local', 'Tujhe Yaad Na Meri Ayee', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/3210_Tujhe-Yaad-Na-Meri-Ayee-2(PagalWorld).mp3', 'B Praak', '6147_Tujhe-Yaad-Na-Meri-Ayee-2-Hindi-2023-20231107133527-500x500.jpg', '26002_19725_4.jpg', '04:52', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;B Praak&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 0, 0, 1),
(103, '7', 5, 'local', 'Aaj Phir Tumpe Pyar Aaya Hai', 'https://vocsyinfotech.in/vocsy/laravel/flutter_musicplayer/5710_Aaj-Phir-Tumpe-Pyar-Aaya-Hai(PagalWorld).mp3', 'Arijit Singh', '33024_Hate-Story-2-Hindi-2014-500x500.jpg', '26002_19725_4.jpg', '04:21', '&lt;blockquote&gt;\n&lt;p&gt;Laxmikant-Pyarelal&lt;/p&gt;\n&lt;/blockquote&gt;', '&lt;blockquote&gt;\n&lt;p&gt;Laxmikant-Pyarelal&lt;/p&gt;\n&lt;/blockquote&gt;', 0, 0, 4, 0, 1),
(104, '25', 25, 'local', 'Lofi hiphop type beat', '815_lofi-hiphop-type-beat-170305.mp3', 'Mika Singh,Akull', '23787_Focused-Audio-Engineer.jpg', '53490_urban-8562302.jpg', '01:03', '&lt;p&gt;Lofi hiphop type beat&lt;/p&gt;', '&lt;p&gt;Lofi hiphop type beat&lt;/p&gt;', 0, 0, 4, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mp3_views`
--

CREATE TABLE `tbl_mp3_views` (
  `view_id` bigint(20) NOT NULL,
  `mp3_id` bigint(20) NOT NULL,
  `views` bigint(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_mp3_views`
--

INSERT INTO `tbl_mp3_views` (`view_id`, `mp3_id`, `views`, `date`) VALUES
(1, 200452, 3, '2020-11-23'),
(2, 213289, 1, '2020-11-23'),
(3, 12925, 1, '2020-11-23'),
(4, 209610, 5, '2020-11-23'),
(5, 24, 1, '2020-12-11'),
(6, 26, 188, '2021-03-16'),
(7, 34, 19, '2021-03-16'),
(8, 33, 8, '2021-03-16'),
(9, 32, 4, '2021-03-16'),
(10, 31, 2, '2021-03-16'),
(11, 30, 12, '2021-03-16'),
(12, 29, 2, '2021-03-16'),
(13, 25, 10, '2021-03-16'),
(14, 0, 4, '2021-03-16'),
(15, 22, 4, '2021-03-16'),
(16, 20, 12, '2021-03-17'),
(17, 19, 13, '2021-03-19'),
(18, 1, 2, '2021-03-19'),
(19, 28, 2, '2021-03-19'),
(20, 30, 13, '2021-03-22'),
(21, 34, 12, '2021-03-22'),
(22, 1, 2, '2021-03-22'),
(23, 26, 9, '2021-03-22'),
(24, 19, 4, '2021-03-22'),
(25, 22, 2, '2021-03-23'),
(26, 33, 7, '2021-03-24'),
(27, 28, 1, '2021-03-24'),
(28, 32, 4, '2021-03-24'),
(29, 20, 2, '2021-03-24'),
(30, 27, 3, '2021-03-24'),
(31, 31, 2, '2021-03-24'),
(32, 26, 62, '2021-03-29'),
(33, 34, 47, '2021-03-30'),
(34, 19, 47, '2021-03-30'),
(35, 30, 77, '2021-03-30'),
(36, 20, 2, '2021-03-30'),
(37, 28, 7, '2021-03-30'),
(38, 29, 9, '2021-03-30'),
(39, 27, 18, '2021-03-30'),
(40, 32, 17, '2021-03-31'),
(41, 33, 7, '2021-03-31'),
(42, 31, 6, '2021-03-31'),
(43, 22, 4, '2021-04-01'),
(44, 25, 1, '2021-04-01'),
(45, 30, 6, '2021-04-05'),
(46, 26, 7, '2021-04-05'),
(47, 34, 5, '2021-04-05'),
(48, 20, 2, '2021-04-06'),
(49, 31, 1, '2021-04-06'),
(50, 19, 3, '2021-04-07'),
(51, 28, 1, '2021-04-08'),
(52, 32, 1, '2021-04-10'),
(53, 33, 10, '2021-04-13'),
(54, 32, 5, '2021-04-13'),
(55, 34, 18, '2021-04-13'),
(56, 19, 15, '2021-04-13'),
(57, 26, 31, '2021-04-13'),
(58, 30, 15, '2021-04-13'),
(59, 20, 2, '2021-04-13'),
(60, 31, 2, '2021-04-13'),
(61, 24, 2, '2021-04-13'),
(62, 28, 3, '2021-04-13'),
(63, 25, 1, '2021-04-13'),
(64, 27, 3, '2021-04-13'),
(65, 23, 1, '2021-04-16'),
(66, 30, 8, '2021-04-27'),
(67, 28, 1, '2021-04-27'),
(68, 26, 4, '2021-04-27'),
(69, 34, 4, '2021-04-27'),
(70, 19, 2, '2021-04-27'),
(71, 32, 1, '2021-04-27'),
(72, 33, 1, '2021-05-01'),
(73, 24, 4, '2021-05-03'),
(74, 19, 8, '2021-05-04'),
(75, 33, 94, '2021-05-04'),
(76, 25, 5, '2021-05-04'),
(77, 20, 1, '2021-05-05'),
(78, 26, 43, '2021-05-06'),
(79, 34, 37, '2021-05-06'),
(80, 31, 8, '2021-05-06'),
(81, 28, 3, '2021-05-06'),
(82, 32, 5, '2021-05-06'),
(83, 30, 22, '2021-05-06'),
(84, 23, 4, '2021-05-08'),
(85, 27, 4, '2021-05-08'),
(86, 29, 2, '2021-05-08'),
(87, 11, 2, '2021-05-08'),
(88, 21, 1, '2021-05-10'),
(89, 32, 1, '2021-05-10'),
(90, 30, 2, '2021-05-10'),
(91, 33, 1, '2021-05-10'),
(92, 29, 1, '2021-05-10'),
(93, 34, 4, '2021-05-11'),
(94, 26, 3, '2021-05-12'),
(95, 28, 2, '2021-05-12'),
(96, 25, 2, '2021-05-12'),
(97, 20, 6, '2021-05-12'),
(98, 38, 3, '2021-05-12'),
(99, 41, 10, '2021-05-12'),
(100, 42, 26, '2021-05-12'),
(101, 45, 7, '2021-05-12'),
(102, 43, 2, '2021-05-12'),
(103, 40, 2, '2021-05-12'),
(104, 44, 11, '2021-05-12'),
(105, 39, 1, '2021-05-12'),
(106, 45, 14, '2021-05-17'),
(107, 42, 16, '2021-05-18'),
(108, 40, 6, '2021-05-18'),
(109, 38, 3, '2021-05-18'),
(110, 41, 10, '2021-05-19'),
(111, 1, 4, '2021-05-19'),
(112, 3, 1, '2021-05-19'),
(113, 44, 11, '2021-05-19'),
(114, 20, 3, '2021-05-19'),
(115, 43, 6, '2021-05-19'),
(116, 39, 2, '2021-05-19'),
(117, 40, 7, '2021-05-24'),
(118, 44, 16, '2021-05-24'),
(119, 42, 14, '2021-05-24'),
(120, 38, 4, '2021-05-24'),
(121, 39, 2, '2021-05-24'),
(122, 43, 5, '2021-05-24'),
(123, 20, 4, '2021-05-24'),
(124, 45, 11, '2021-05-27'),
(125, 41, 4, '2021-05-28'),
(126, 38, 8, '2021-05-31'),
(127, 40, 4, '2021-05-31'),
(128, 42, 15, '2021-05-31'),
(129, 20, 2, '2021-05-31'),
(130, 41, 5, '2021-05-31'),
(131, 44, 10, '2021-05-31'),
(132, 45, 21, '2021-05-31'),
(133, 43, 3, '2021-06-03'),
(134, 39, 1, '2021-06-03'),
(135, 44, 3, '2021-06-10'),
(136, 45, 6, '2021-06-10'),
(137, 42, 3, '2021-06-11'),
(138, 41, 2, '2021-06-11'),
(139, 43, 5, '2021-06-12'),
(140, 38, 1, '2021-06-12'),
(141, 42, 3, '2021-06-14'),
(142, 44, 2, '2021-06-14'),
(143, 45, 4, '2021-06-14'),
(144, 43, 2, '2021-06-14'),
(145, 41, 1, '2021-06-19'),
(146, 39, 1, '2021-06-19'),
(147, 43, 4, '2021-06-22'),
(148, 45, 7, '2021-06-23'),
(149, 41, 2, '2021-06-23'),
(150, 20, 3, '2021-06-23'),
(151, 40, 2, '2021-06-23'),
(152, 42, 10, '2021-06-24'),
(153, 39, 5, '2021-06-27'),
(154, 20, 3, '2021-06-28'),
(155, 38, 2, '2021-06-28'),
(156, 43, 4, '2021-06-28'),
(157, 42, 4, '2021-06-29'),
(158, 45, 3, '2021-06-30'),
(159, 41, 1, '2021-06-30'),
(160, 39, 2, '2021-06-30'),
(161, 42, 3, '2021-07-06'),
(162, 43, 4, '2021-07-07'),
(163, 38, 1, '2021-07-07'),
(164, 40, 1, '2021-07-07'),
(165, 20, 3, '2021-07-07'),
(166, 39, 1, '2021-07-10'),
(167, 39, 1, '2021-07-14'),
(168, 42, 1, '2021-07-16'),
(169, 42, 28, '2021-07-19'),
(170, 43, 14, '2021-07-19'),
(171, 40, 10, '2021-07-21'),
(172, 39, 27, '2021-07-21'),
(173, 20, 20, '2021-07-23'),
(174, 38, 4, '2021-07-24'),
(175, 39, 38, '2021-07-26'),
(176, 43, 65, '2021-07-26'),
(177, 40, 19, '2021-07-26'),
(178, 20, 43, '2021-07-26'),
(179, 38, 26, '2021-07-26'),
(180, 45, 53, '2021-07-26'),
(181, 42, 40, '2021-07-26'),
(182, 41, 13, '2021-07-26'),
(183, 2, 1, '2021-07-27'),
(184, 46, 28, '2021-07-28'),
(185, 46, 123, '2021-08-02'),
(186, 43, 40, '2021-08-02'),
(187, 41, 20, '2021-08-02'),
(188, 20, 163, '2021-08-02'),
(189, 45, 90, '2021-08-02'),
(190, 38, 74, '2021-08-02'),
(191, 39, 23, '2021-08-03'),
(192, 40, 16, '2021-08-03'),
(193, 42, 31, '2021-08-03'),
(194, 48, 23, '2021-08-07'),
(195, 45, 3, '2021-08-09'),
(196, 20, 7, '2021-08-09'),
(197, 48, 8, '2021-08-10'),
(198, 46, 6, '2021-08-10'),
(199, 38, 4, '2021-08-10'),
(200, 40, 4, '2021-08-10'),
(201, 41, 3, '2021-08-10'),
(202, 42, 5, '2021-08-10'),
(203, 39, 1, '2021-08-11'),
(204, 43, 1, '2021-08-11'),
(205, 49, 6, '2021-08-14'),
(206, 48, 72, '2021-08-16'),
(207, 38, 5, '2021-08-16'),
(208, 49, 1, '2021-08-16'),
(209, 40, 20, '2021-08-16'),
(210, 46, 9, '2021-08-17'),
(211, 42, 14, '2021-08-17'),
(212, 39, 10, '2021-08-17'),
(213, 20, 18, '2021-08-17'),
(214, 43, 18, '2021-08-17'),
(215, 45, 1, '2021-08-21'),
(216, 41, 2, '2021-08-21'),
(217, 55, 2, '2021-08-21'),
(218, 54, 4, '2021-08-22'),
(219, 52, 1, '2021-08-22'),
(220, 43, 18, '2021-08-23'),
(221, 42, 10, '2021-08-23'),
(222, 54, 12, '2021-08-23'),
(223, 51, 5, '2021-08-24'),
(224, 55, 7, '2021-08-24'),
(225, 38, 4, '2021-08-24'),
(226, 40, 8, '2021-08-24'),
(227, 20, 15, '2021-08-24'),
(228, 52, 5, '2021-08-24'),
(229, 50, 1, '2021-08-26'),
(230, 46, 2, '2021-08-26'),
(231, 53, 4, '2021-08-29'),
(232, 39, 4, '2021-08-30'),
(233, 42, 7, '2021-08-30'),
(234, 55, 3, '2021-08-30'),
(235, 54, 6, '2021-08-30'),
(236, 46, 1, '2021-08-30'),
(237, 40, 5, '2021-08-30'),
(238, 50, 1, '2021-08-30'),
(239, 43, 8, '2021-08-30'),
(240, 20, 5, '2021-08-30'),
(241, 52, 2, '2021-08-31'),
(242, 48, 3, '2021-08-31'),
(243, 38, 1, '2021-08-31'),
(244, 53, 1, '2021-09-03'),
(245, 51, 2, '2021-09-03'),
(246, 52, 1, '2021-09-06'),
(247, 39, 1, '2021-09-06'),
(248, 46, 2, '2021-09-08'),
(249, 48, 4, '2021-09-08'),
(250, 20, 2, '2021-09-08'),
(251, 43, 4, '2021-09-08'),
(252, 51, 1, '2021-09-11'),
(253, 55, 1, '2021-09-12'),
(254, 54, 1, '2021-09-12'),
(255, 40, 1, '2021-09-12'),
(256, 50, 2, '2021-09-13'),
(257, 42, 6, '2021-09-13'),
(258, 43, 4, '2021-09-13'),
(259, 55, 5, '2021-09-13'),
(260, 20, 11, '2021-09-13'),
(261, 54, 4, '2021-09-14'),
(262, 46, 2, '2021-09-15'),
(263, 39, 1, '2021-09-18'),
(264, 52, 2, '2021-09-18'),
(265, 40, 5, '2021-09-18'),
(266, 41, 1, '2021-09-18'),
(267, 38, 1, '2021-09-18'),
(268, 48, 1, '2021-09-20'),
(269, 43, 3, '2021-09-22'),
(270, 54, 1, '2021-09-22'),
(271, 51, 1, '2021-09-22'),
(272, 42, 6, '2021-09-27'),
(273, 43, 4, '2021-09-27'),
(274, 20, 4, '2021-09-28'),
(275, 38, 2, '2021-09-28'),
(276, 39, 2, '2021-09-28'),
(277, 55, 1, '2021-09-29'),
(278, 46, 1, '2021-10-02'),
(279, 40, 1, '2021-10-03'),
(280, 54, 2, '2021-10-03'),
(281, 40, 4, '2021-10-04'),
(282, 55, 2, '2021-10-04'),
(283, 43, 6, '2021-10-04'),
(284, 51, 1, '2021-10-04'),
(285, 50, 1, '2021-10-04'),
(286, 39, 2, '2021-10-04'),
(287, 54, 3, '2021-10-06'),
(288, 42, 2, '2021-10-08'),
(289, 38, 1, '2021-10-10'),
(290, 20, 1, '2021-10-10'),
(291, 20, 2, '2021-10-12'),
(292, 55, 2, '2021-10-14'),
(293, 46, 1, '2021-10-14'),
(294, 43, 2, '2021-10-14'),
(295, 51, 2, '2021-10-14'),
(296, 38, 2, '2021-10-15'),
(297, 39, 1, '2021-10-17'),
(298, 42, 1, '2021-10-17'),
(299, 54, 2, '2021-10-19'),
(300, 42, 4, '2021-10-19'),
(301, 40, 4, '2021-10-19'),
(302, 43, 1, '2021-10-20'),
(303, 20, 1, '2021-10-20'),
(304, 39, 6, '2021-10-22'),
(305, 55, 1, '2021-10-22'),
(306, 41, 1, '2021-10-23'),
(307, 42, 3, '2021-10-25'),
(308, 50, 1, '2021-10-25'),
(309, 39, 2, '2021-10-26'),
(310, 20, 4, '2021-10-26'),
(311, 43, 5, '2021-10-26'),
(312, 54, 4, '2021-10-26'),
(313, 48, 1, '2021-10-26'),
(314, 56, 2, '2021-10-27'),
(315, 55, 2, '2021-10-27'),
(316, 40, 2, '2021-10-28'),
(317, 51, 1, '2021-10-28'),
(318, 42, 3, '2021-11-01'),
(319, 43, 11, '2021-11-01'),
(320, 50, 1, '2021-11-01'),
(321, 54, 3, '2021-11-02'),
(322, 20, 2, '2021-11-03'),
(323, 40, 6, '2021-11-04'),
(324, 55, 4, '2021-11-06'),
(325, 38, 3, '2021-11-06'),
(326, 51, 1, '2021-11-07'),
(327, 20, 1, '2021-11-09'),
(328, 54, 1, '2021-11-16'),
(329, 43, 3, '2021-11-16'),
(330, 42, 2, '2021-11-18'),
(331, 51, 1, '2021-11-18'),
(332, 56, 1, '2021-11-18'),
(333, 39, 1, '2021-11-18'),
(334, 55, 2, '2021-11-20'),
(335, 43, 10, '2021-11-23'),
(336, 39, 4, '2021-11-23'),
(337, 38, 2, '2021-11-23'),
(338, 55, 6, '2021-11-23'),
(339, 42, 13, '2021-11-23'),
(340, 20, 2, '2021-11-23'),
(341, 51, 1, '2021-11-24'),
(342, 40, 1, '2021-11-25'),
(343, 46, 1, '2021-11-25'),
(344, 56, 1, '2021-11-26'),
(345, 54, 3, '2021-11-26'),
(346, 50, 2, '2021-11-26'),
(347, 54, 4, '2021-11-29'),
(348, 40, 1, '2021-11-29'),
(349, 38, 2, '2021-11-29'),
(350, 42, 2, '2021-11-30'),
(351, 43, 3, '2021-12-02'),
(352, 46, 1, '2021-12-02'),
(353, 55, 1, '2021-12-05'),
(354, 55, 4, '2021-12-07'),
(355, 43, 10, '2021-12-08'),
(356, 54, 4, '2021-12-08'),
(357, 20, 3, '2021-12-08'),
(358, 40, 1, '2021-12-08'),
(359, 50, 1, '2021-12-08'),
(360, 42, 2, '2021-12-11'),
(361, 39, 3, '2021-12-11'),
(362, 51, 1, '2021-12-12'),
(363, 56, 1, '2021-12-12'),
(364, 42, 2, '2021-12-17'),
(365, 43, 1, '2021-12-18'),
(366, 54, 2, '2021-12-18'),
(367, 39, 2, '2021-12-18'),
(368, 55, 5, '2021-12-21'),
(369, 43, 2, '2021-12-21'),
(370, 42, 4, '2021-12-21'),
(371, 20, 1, '2021-12-21'),
(372, 43, 22, '2021-12-27'),
(373, 55, 23, '2021-12-27'),
(374, 51, 9, '2021-12-27'),
(375, 54, 35, '2021-12-28'),
(376, 42, 25, '2021-12-28'),
(377, 20, 23, '2021-12-28'),
(378, 40, 6, '2021-12-28'),
(379, 39, 11, '2021-12-28'),
(380, 38, 12, '2021-12-28'),
(381, 50, 4, '2021-12-28'),
(382, 46, 3, '2021-12-28'),
(383, 56, 2, '2021-12-28'),
(384, 55, 8, '2022-01-03'),
(385, 20, 6, '2022-01-03'),
(386, 38, 15, '2022-01-03'),
(387, 42, 7, '2022-01-03'),
(388, 50, 2, '2022-01-03'),
(389, 43, 12, '2022-01-03'),
(390, 54, 7, '2022-01-03'),
(391, 51, 2, '2022-01-03'),
(392, 39, 8, '2022-01-03'),
(393, 40, 4, '2022-01-07'),
(394, 46, 2, '2022-01-07'),
(395, 56, 1, '2022-01-07'),
(396, 39, 5, '2022-01-10'),
(397, 38, 7, '2022-01-10'),
(398, 42, 5, '2022-01-10'),
(399, 20, 10, '2022-01-10'),
(400, 40, 3, '2022-01-11'),
(401, 55, 4, '2022-01-11'),
(402, 51, 2, '2022-01-11'),
(403, 43, 3, '2022-01-11'),
(404, 54, 1, '2022-01-11'),
(405, 43, 4, '2022-01-17'),
(406, 39, 4, '2022-01-17'),
(407, 42, 12, '2022-01-17'),
(408, 38, 2, '2022-01-17'),
(409, 55, 2, '2022-01-20'),
(410, 54, 3, '2022-01-20'),
(411, 20, 2, '2022-01-21'),
(412, 40, 1, '2022-01-22'),
(413, 43, 2, '2022-01-24'),
(414, 54, 1, '2022-01-24'),
(415, 55, 4, '2022-01-24'),
(416, 39, 1, '2022-01-24'),
(417, 42, 1, '2022-01-30'),
(418, 43, 3, '2022-01-31'),
(419, 54, 2, '2022-01-31'),
(420, 50, 2, '2022-01-31'),
(421, 42, 2, '2022-02-01'),
(422, 55, 5, '2022-02-02'),
(423, 39, 1, '2022-02-02'),
(424, 20, 2, '2022-02-02'),
(425, 56, 1, '2022-02-02'),
(426, 40, 2, '2022-02-02'),
(427, 43, 1, '2022-02-08'),
(428, 38, 3, '2022-02-15'),
(429, 56, 2, '2022-02-16'),
(430, 39, 1, '2022-02-16'),
(431, 54, 2, '2022-02-18'),
(432, 42, 3, '2022-02-18'),
(433, 55, 3, '2022-02-18'),
(434, 20, 1, '2022-02-18'),
(435, 46, 1, '2022-02-24'),
(436, 20, 2, '2022-02-26'),
(437, 42, 1, '2022-02-26'),
(438, 38, 1, '2022-02-26'),
(439, 55, 1, '2022-02-27'),
(440, 55, 4, '2022-02-28'),
(441, 54, 4, '2022-03-01'),
(442, 51, 2, '2022-03-01'),
(443, 20, 1, '2022-03-01'),
(444, 43, 4, '2022-03-01'),
(445, 38, 4, '2022-03-01'),
(446, 42, 2, '2022-03-01'),
(447, 46, 1, '2022-03-02'),
(448, 50, 1, '2022-03-03'),
(449, 39, 1, '2022-03-05'),
(450, 54, 3, '2022-03-08'),
(451, 51, 2, '2022-03-08'),
(452, 42, 2, '2022-03-08'),
(453, 46, 2, '2022-03-08'),
(454, 20, 4, '2022-03-08'),
(455, 39, 3, '2022-03-08'),
(456, 56, 1, '2022-03-08'),
(457, 40, 1, '2022-03-09'),
(458, 55, 4, '2022-03-09'),
(459, 43, 2, '2022-03-09'),
(460, 50, 3, '2022-03-09'),
(461, 38, 1, '2022-03-10'),
(462, 43, 3, '2022-03-15'),
(463, 38, 1, '2022-03-15'),
(464, 50, 1, '2022-03-15'),
(465, 39, 2, '2022-03-15'),
(466, 42, 1, '2022-03-16'),
(467, 54, 3, '2022-03-21'),
(468, 42, 4, '2022-03-21'),
(469, 38, 2, '2022-03-21'),
(470, 39, 4, '2022-03-21'),
(471, 55, 3, '2022-03-21'),
(472, 20, 1, '2022-03-21'),
(473, 50, 1, '2022-03-22'),
(474, 51, 1, '2022-03-22'),
(475, 40, 1, '2022-03-24'),
(476, 54, 9, '2022-03-28'),
(477, 40, 5, '2022-03-28'),
(478, 43, 6, '2022-03-29'),
(479, 39, 2, '2022-03-31'),
(480, 42, 11, '2022-03-31'),
(481, 38, 7, '2022-03-31'),
(482, 46, 3, '2022-03-31'),
(483, 55, 3, '2022-03-31'),
(484, 56, 1, '2022-03-31'),
(485, 20, 5, '2022-04-01'),
(486, 50, 1, '2022-04-02'),
(487, 51, 1, '2022-04-02'),
(488, 20, 3, '2022-04-04'),
(489, 50, 1, '2022-04-04'),
(490, 42, 1, '2022-04-04'),
(491, 38, 2, '2022-04-05'),
(492, 43, 3, '2022-04-05'),
(493, 54, 3, '2022-04-05'),
(494, 55, 2, '2022-04-06'),
(495, 40, 2, '2022-04-06'),
(496, 51, 1, '2022-04-08'),
(497, 42, 4, '2022-04-11'),
(498, 50, 1, '2022-04-11'),
(499, 43, 10, '2022-04-13'),
(500, 38, 3, '2022-04-13'),
(501, 54, 3, '2022-04-13'),
(502, 55, 4, '2022-04-13'),
(503, 20, 2, '2022-04-13'),
(504, 39, 4, '2022-04-13'),
(505, 40, 1, '2022-04-16'),
(506, 43, 7, '2022-04-18'),
(507, 20, 2, '2022-04-18'),
(508, 42, 4, '2022-04-18'),
(509, 56, 1, '2022-04-18'),
(510, 38, 3, '2022-04-19'),
(511, 55, 2, '2022-04-19'),
(512, 40, 1, '2022-04-19'),
(513, 39, 1, '2022-04-20'),
(514, 50, 1, '2022-04-21'),
(515, 55, 2, '2022-04-25'),
(516, 43, 4, '2022-04-25'),
(517, 54, 8, '2022-04-25'),
(518, 39, 4, '2022-04-25'),
(519, 42, 4, '2022-04-26'),
(520, 40, 3, '2022-04-26'),
(521, 46, 1, '2022-04-27'),
(522, 50, 4, '2022-04-27'),
(523, 51, 1, '2022-04-27'),
(524, 38, 2, '2022-04-28'),
(525, 43, 24, '2022-05-02'),
(526, 42, 10, '2022-05-02'),
(527, 40, 7, '2022-05-02'),
(528, 54, 10, '2022-05-02'),
(529, 50, 2, '2022-05-02'),
(530, 56, 2, '2022-05-02'),
(531, 20, 9, '2022-05-02'),
(532, 55, 5, '2022-05-02'),
(533, 39, 8, '2022-05-02'),
(534, 51, 4, '2022-05-02'),
(535, 38, 2, '2022-05-03'),
(536, 46, 1, '2022-05-06'),
(537, 43, 15, '2022-05-09'),
(538, 50, 3, '2022-05-09'),
(539, 54, 8, '2022-05-09'),
(540, 38, 2, '2022-05-09'),
(541, 55, 15, '2022-05-09'),
(542, 42, 6, '2022-05-09'),
(543, 40, 9, '2022-05-09'),
(544, 20, 3, '2022-05-10'),
(545, 39, 8, '2022-05-10'),
(546, 51, 1, '2022-05-10'),
(547, 46, 1, '2022-05-15'),
(548, 56, 1, '2022-05-15'),
(549, 51, 1, '2022-05-17'),
(550, 54, 4, '2022-05-17'),
(551, 55, 2, '2022-05-18'),
(552, 43, 3, '2022-05-18'),
(553, 42, 3, '2022-05-18'),
(554, 20, 1, '2022-05-18'),
(555, 38, 1, '2022-05-18'),
(556, 39, 2, '2022-05-18'),
(557, 43, 7, '2022-05-23'),
(558, 54, 11, '2022-05-23'),
(559, 46, 3, '2022-05-23'),
(560, 38, 6, '2022-05-23'),
(561, 42, 4, '2022-05-23'),
(562, 40, 3, '2022-05-23'),
(563, 55, 3, '2022-05-25'),
(564, 50, 1, '2022-05-25'),
(565, 20, 2, '2022-05-25'),
(566, 39, 1, '2022-05-28'),
(567, 42, 6, '2022-05-30'),
(568, 20, 3, '2022-06-01'),
(569, 38, 3, '2022-06-01'),
(570, 54, 4, '2022-06-01'),
(571, 55, 3, '2022-06-01'),
(572, 43, 5, '2022-06-02'),
(573, 50, 2, '2022-06-03'),
(574, 56, 1, '2022-06-03'),
(575, 39, 1, '2022-06-05'),
(576, 20, 5, '2022-06-06'),
(577, 55, 9, '2022-06-07'),
(578, 38, 3, '2022-06-07'),
(579, 54, 7, '2022-06-07'),
(580, 39, 4, '2022-06-07'),
(581, 43, 3, '2022-06-07'),
(582, 42, 2, '2022-06-07'),
(583, 40, 2, '2022-06-07'),
(584, 51, 3, '2022-06-08'),
(585, 40, 7, '2022-06-14'),
(586, 54, 9, '2022-06-14'),
(587, 51, 2, '2022-06-14'),
(588, 20, 3, '2022-06-14'),
(589, 38, 4, '2022-06-14'),
(590, 56, 1, '2022-06-14'),
(591, 43, 3, '2022-06-14'),
(592, 39, 2, '2022-06-14'),
(593, 55, 2, '2022-06-14'),
(594, 54, 9, '2022-06-20'),
(595, 55, 5, '2022-06-20'),
(596, 39, 3, '2022-06-20'),
(597, 43, 8, '2022-06-20'),
(598, 20, 3, '2022-06-22'),
(599, 51, 3, '2022-06-22'),
(600, 38, 2, '2022-06-23'),
(601, 50, 2, '2022-06-23'),
(602, 42, 3, '2022-06-23'),
(603, 46, 1, '2022-06-25'),
(604, 42, 6, '2022-06-27'),
(605, 55, 2, '2022-06-27'),
(606, 43, 8, '2022-06-28'),
(607, 20, 10, '2022-06-28'),
(608, 39, 3, '2022-06-28'),
(609, 38, 6, '2022-06-28'),
(610, 54, 3, '2022-06-28'),
(611, 51, 1, '2022-06-28'),
(612, 50, 1, '2022-06-29'),
(613, 56, 1, '2022-07-01'),
(614, 51, 2, '2022-07-04'),
(615, 55, 4, '2022-07-04'),
(616, 42, 44, '2022-07-04'),
(617, 40, 1, '2022-07-04'),
(618, 39, 1, '2022-07-05'),
(619, 43, 4, '2022-07-05'),
(620, 46, 1, '2022-07-05'),
(621, 38, 3, '2022-07-05'),
(622, 56, 1, '2022-07-05'),
(623, 1, 3, '2022-07-06'),
(624, 54, 3, '2022-07-07'),
(625, 50, 1, '2022-07-10'),
(626, 43, 2, '2022-07-15'),
(627, 42, 11, '2022-07-16'),
(628, 38, 1, '2022-07-17'),
(629, 20, 1, '2022-07-17'),
(630, 54, 2, '2022-07-18'),
(631, 55, 2, '2022-07-18'),
(632, 42, 30, '2022-07-18'),
(633, 56, 1, '2022-07-22'),
(634, 43, 1, '2022-07-23'),
(635, 46, 1, '2022-07-23'),
(636, 40, 1, '2022-07-24'),
(637, 42, 5, '2022-07-25'),
(638, 38, 2, '2022-07-25'),
(639, 43, 2, '2022-07-25'),
(640, 51, 1, '2022-07-25'),
(641, 56, 2, '2022-07-25'),
(642, 57, 4, '2022-07-27'),
(643, 20, 3, '2022-07-27'),
(644, 50, 3, '2022-07-28'),
(645, 55, 1, '2022-07-28'),
(646, 39, 2, '2022-07-28'),
(647, 40, 1, '2022-07-29'),
(648, 46, 1, '2022-07-29'),
(649, 38, 1, '2022-08-01'),
(650, 54, 2, '2022-08-01'),
(651, 43, 1, '2022-08-01'),
(652, 20, 1, '2022-08-01'),
(653, 57, 1, '2022-08-01'),
(654, 56, 1, '2022-08-03'),
(655, 55, 1, '2022-08-03'),
(656, 57, 1, '2022-08-08'),
(657, 43, 4, '2022-08-09'),
(658, 38, 10, '2022-08-09'),
(659, 56, 1, '2022-08-09'),
(660, 50, 1, '2022-08-12'),
(661, 39, 4, '2022-08-12'),
(662, 54, 3, '2022-08-12'),
(663, 42, 2, '2022-08-12'),
(664, 51, 3, '2022-08-12'),
(665, 20, 3, '2022-08-12'),
(666, 55, 3, '2022-08-12'),
(667, 46, 1, '2022-08-12'),
(668, 58, 3, '2022-08-14'),
(669, 38, 15, '2022-08-16'),
(670, 54, 8, '2022-08-16'),
(671, 55, 10, '2022-08-16'),
(672, 20, 17, '2022-08-16'),
(673, 39, 10, '2022-08-16'),
(674, 43, 5, '2022-08-16'),
(675, 57, 9, '2022-08-17'),
(676, 40, 3, '2022-08-17'),
(677, 58, 5, '2022-08-17'),
(678, 42, 9, '2022-08-17'),
(679, 56, 1, '2022-08-18'),
(680, 50, 1, '2022-08-20'),
(681, 46, 1, '2022-08-20'),
(682, 57, 2, '2022-08-22'),
(683, 58, 4, '2022-08-22'),
(684, 20, 2, '2022-08-22'),
(685, 56, 1, '2022-08-22'),
(686, 43, 7, '2022-08-22'),
(687, 55, 2, '2022-08-22'),
(688, 54, 2, '2022-08-23'),
(689, 38, 1, '2022-08-28'),
(690, 0, 1, '2022-08-29'),
(691, 39, 1, '2022-08-29'),
(692, 40, 2, '2022-08-30'),
(693, 50, 1, '2022-08-30'),
(694, 20, 1, '2022-08-31'),
(695, 58, 3, '2022-08-31'),
(696, 43, 2, '2022-08-31'),
(697, 38, 1, '2022-08-31'),
(698, 54, 1, '2022-09-03'),
(699, 58, 2, '2022-09-08'),
(700, 51, 1, '2022-09-08'),
(701, 55, 2, '2022-09-08'),
(702, 43, 2, '2022-09-08'),
(703, 54, 2, '2022-09-08'),
(704, 20, 1, '2022-09-08'),
(705, 50, 1, '2022-09-10'),
(706, 54, 2, '2022-09-12'),
(707, 51, 1, '2022-09-12'),
(708, 39, 2, '2022-09-13'),
(709, 43, 2, '2022-09-14'),
(710, 56, 1, '2022-09-16'),
(711, 43, 4, '2022-09-19'),
(712, 39, 1, '2022-09-19'),
(713, 58, 4, '2022-09-19'),
(714, 20, 3, '2022-09-20'),
(715, 51, 4, '2022-09-20'),
(716, 38, 3, '2022-09-20'),
(717, 40, 1, '2022-09-20'),
(718, 56, 2, '2022-09-20'),
(719, 55, 3, '2022-09-20'),
(720, 46, 1, '2022-09-21'),
(721, 50, 1, '2022-09-23'),
(722, 54, 2, '2022-09-26'),
(723, 38, 1, '2022-09-28'),
(724, 40, 2, '2022-09-29'),
(725, 43, 1, '2022-09-29'),
(726, 56, 1, '2022-10-03'),
(727, 40, 1, '2022-10-03'),
(728, 38, 2, '2022-10-03'),
(729, 43, 1, '2022-10-03'),
(730, 58, 1, '2022-10-04'),
(731, 55, 1, '2022-10-05'),
(732, 51, 1, '2022-10-05'),
(733, 59, 4, '2022-10-22'),
(734, 59, 7, '2022-10-25'),
(735, 60, 1, '2022-10-27'),
(736, 59, 1, '2022-11-08'),
(737, 62, 3, '2022-11-10'),
(738, 63, 5, '2022-11-10'),
(739, 67, 5, '2022-11-12'),
(740, 73, 6, '2022-11-13'),
(741, 73, 6, '2022-11-14'),
(742, 71, 2, '2022-11-14'),
(743, 67, 2, '2022-11-14'),
(744, 63, 5, '2022-11-14'),
(745, 62, 5, '2022-11-14'),
(746, 75, 2, '2022-11-15'),
(747, 64, 1, '2022-11-17'),
(748, 73, 10, '2022-11-22'),
(749, 74, 2, '2022-11-22'),
(750, 63, 4, '2022-11-25'),
(751, 67, 2, '2022-11-25'),
(752, 66, 3, '2022-11-25'),
(753, 62, 3, '2022-11-25'),
(754, 77, 2, '2022-11-25'),
(755, 75, 1, '2022-11-25'),
(756, 64, 1, '2022-11-27'),
(757, 73, 3, '2022-11-28'),
(758, 63, 1, '2022-11-28'),
(759, 66, 3, '2022-11-28'),
(760, 62, 1, '2022-11-29'),
(761, 75, 1, '2022-11-30'),
(762, 73, 9, '2022-12-05'),
(763, 79, 1, '2022-12-06'),
(764, 74, 4, '2022-12-06'),
(765, 0, 1, '2022-12-06'),
(766, 12, 1, '2022-12-06'),
(767, 76, 2, '2022-12-10'),
(768, 71, 1, '2022-12-10'),
(769, 63, 1, '2022-12-10'),
(770, 62, 1, '2022-12-10'),
(771, 63, 3, '2022-12-12'),
(772, 73, 4, '2022-12-13'),
(773, 77, 2, '2022-12-16'),
(774, 76, 1, '2022-12-16'),
(775, 67, 2, '2022-12-17'),
(776, 66, 1, '2022-12-17'),
(777, 71, 1, '2022-12-17'),
(778, 73, 10, '2022-12-19'),
(779, 74, 7, '2022-12-20'),
(780, 79, 1, '2022-12-20'),
(781, 20, 1, '2022-12-22'),
(782, 19, 2, '2022-12-22'),
(783, 64, 64, '2022-12-23'),
(784, 17, 1, '2022-12-23'),
(785, 63, 69, '2022-12-23'),
(786, 62, 13, '2022-12-23'),
(787, 77, 11, '2022-12-23'),
(788, 66, 104, '2022-12-23'),
(789, 67, 15, '2022-12-23'),
(790, 76, 10, '2022-12-23'),
(791, 80, 24, '2022-12-24'),
(792, 78, 2, '2022-12-24'),
(793, 71, 1, '2022-12-24'),
(794, 75, 1, '2022-12-24'),
(795, 64, 4, '2022-12-26'),
(796, 73, 3, '2022-12-26'),
(797, 78, 40, '2022-12-26'),
(798, 66, 129, '2022-12-26'),
(799, 62, 734, '2022-12-26'),
(800, 76, 69, '2022-12-26'),
(801, 63, 792, '2022-12-26'),
(802, 67, 120, '2022-12-26'),
(803, 71, 78, '2022-12-26'),
(804, 74, 31, '2022-12-26'),
(805, 77, 65, '2022-12-26'),
(806, 75, 52, '2022-12-26'),
(807, 0, 1, '2022-12-29'),
(808, 78, 659, '2023-01-02'),
(809, 71, 84, '2023-01-02'),
(810, 63, 20, '2023-01-02'),
(811, 76, 39, '2023-01-02'),
(812, 67, 64, '2023-01-02'),
(813, 77, 292, '2023-01-02'),
(814, 74, 2, '2023-01-02'),
(815, 75, 68, '2023-01-03'),
(816, 62, 7, '2023-01-03'),
(817, 62, 588, '2023-01-09'),
(818, 76, 489, '2023-01-09'),
(819, 74, 703, '2023-01-09'),
(820, 77, 1183, '2023-01-09'),
(821, 71, 392, '2023-01-09'),
(822, 66, 380, '2023-01-09'),
(823, 67, 445, '2023-01-09'),
(824, 78, 664, '2023-01-09'),
(825, 63, 316, '2023-01-09'),
(826, 75, 77, '2023-01-09'),
(827, 0, 155, '2023-01-10'),
(828, 5, 7, '2023-01-10'),
(829, 39, 1, '2023-01-10'),
(830, 2, 1, '2023-01-12'),
(831, 65, 40, '2023-01-12'),
(832, 3, 2, '2023-01-12'),
(833, 68, 18, '2023-01-12'),
(834, 72, 5, '2023-01-12'),
(835, 64, 14, '2023-01-12'),
(836, 73, 13, '2023-01-12'),
(837, 70, 3, '2023-01-12'),
(838, 12, 1, '2023-01-12'),
(839, 8, 1, '2023-01-13'),
(840, 0, 220, '2023-01-16'),
(841, 62, 7, '2023-01-16'),
(842, 68, 15, '2023-01-16'),
(843, 65, 17, '2023-01-16'),
(844, 76, 16, '2023-01-16'),
(845, 72, 46, '2023-01-16'),
(846, 70, 6, '2023-01-16'),
(847, 77, 38, '2023-01-16'),
(848, 73, 91, '2023-01-16'),
(849, 71, 27, '2023-01-16'),
(850, 9, 6, '2023-01-16'),
(851, 9, 6, '2023-01-16'),
(852, 66, 14, '2023-01-16'),
(853, 75, 3, '2023-01-16'),
(854, 64, 15, '2023-01-16'),
(855, 74, 12, '2023-01-16'),
(856, 63, 13, '2023-01-16'),
(857, 67, 8, '2023-01-16'),
(858, 78, 9, '2023-01-16'),
(859, 0, 395, '2023-01-23'),
(860, 75, 118, '2023-01-23'),
(861, 70, 55, '2023-01-23'),
(862, 64, 25, '2023-01-23'),
(863, 77, 32, '2023-01-23'),
(864, 62, 14, '2023-01-23'),
(865, 65, 95, '2023-01-23'),
(866, 78, 60, '2023-01-23'),
(867, 66, 47, '2023-01-23'),
(868, 68, 173, '2023-01-23'),
(869, 72, 11, '2023-01-23'),
(870, 73, 53, '2023-01-23'),
(871, 71, 61, '2023-01-23'),
(872, 83, 6, '2023-01-24'),
(873, 82, 9, '2023-01-25'),
(874, 86, 1, '2023-01-28'),
(875, 70, 12, '2023-01-30'),
(876, 0, 130, '2023-01-30'),
(877, 77, 29, '2023-01-30'),
(878, 66, 18, '2023-01-30'),
(879, 78, 21, '2023-01-31'),
(880, 75, 9, '2023-01-31'),
(881, 64, 10, '2023-01-31'),
(882, 71, 6, '2023-01-31'),
(883, 65, 10, '2023-01-31'),
(884, 68, 5, '2023-01-31'),
(885, 82, 13, '2023-01-31'),
(886, 72, 6, '2023-01-31'),
(887, 62, 9, '2023-02-01'),
(888, 73, 7, '2023-02-01'),
(889, 0, 183, '2023-02-07'),
(890, 82, 6, '2023-02-08'),
(891, 65, 3, '2023-02-08'),
(892, 66, 1, '2023-02-08'),
(893, 70, 1, '2023-02-08'),
(894, 78, 1, '2023-02-08'),
(895, 64, 1, '2023-02-09'),
(896, 77, 6, '2023-02-09'),
(897, 71, 1, '2023-02-11'),
(898, 65, 14, '2023-02-13'),
(899, 73, 46, '2023-02-13'),
(900, 70, 6, '2023-02-13'),
(901, 0, 137, '2023-02-13'),
(902, 75, 5, '2023-02-13'),
(903, 62, 3, '2023-02-13'),
(904, 72, 11, '2023-02-13'),
(905, 82, 7, '2023-02-13'),
(906, 66, 14, '2023-02-13'),
(907, 64, 3, '2023-02-13'),
(908, 77, 11, '2023-02-13'),
(909, 78, 7, '2023-02-14'),
(910, 71, 1, '2023-02-17'),
(911, 68, 1, '2023-02-17'),
(912, 77, 1, '2023-02-20'),
(913, 82, 1, '2023-02-20'),
(914, 70, 1, '2023-02-24'),
(915, 78, 3, '2023-02-27'),
(916, 0, 52, '2023-02-28'),
(917, 75, 5, '2023-02-28'),
(918, 65, 18, '2023-02-28'),
(919, 77, 15, '2023-02-28'),
(920, 82, 1, '2023-03-01'),
(921, 66, 3, '2023-03-01'),
(922, 73, 7, '2023-03-01'),
(923, 70, 14, '2023-03-02'),
(924, 71, 3, '2023-03-02'),
(925, 62, 5, '2023-03-02'),
(926, 68, 2, '2023-03-03'),
(927, 68, 2, '2023-03-03'),
(928, 64, 2, '2023-03-03'),
(929, 72, 1, '2023-03-03'),
(930, 65, 3, '2023-03-06'),
(931, 64, 4, '2023-03-06'),
(932, 0, 162, '2023-03-06'),
(933, 77, 28, '2023-03-06'),
(934, 66, 8, '2023-03-06'),
(935, 73, 22, '2023-03-06'),
(936, 72, 6, '2023-03-06'),
(937, 68, 6, '2023-03-06'),
(938, 78, 5, '2023-03-07'),
(939, 70, 6, '2023-03-07'),
(940, 62, 6, '2023-03-12'),
(941, 71, 2, '2023-03-12'),
(942, 0, 34, '2023-03-13'),
(943, 73, 9, '2023-03-13'),
(944, 64, 7, '2023-03-13'),
(945, 66, 6, '2023-03-14'),
(946, 77, 6, '2023-03-14'),
(947, 78, 3, '2023-03-14'),
(948, 70, 3, '2023-03-16'),
(949, 65, 3, '2023-03-16'),
(950, 62, 1, '2023-03-18'),
(951, 0, 46, '2023-03-20'),
(952, 77, 20, '2023-03-20'),
(953, 77, 20, '2023-03-20'),
(954, 70, 4, '2023-03-22'),
(955, 65, 12, '2023-03-22'),
(956, 73, 14, '2023-03-22'),
(957, 66, 10, '2023-03-22'),
(958, 75, 2, '2023-03-22'),
(959, 78, 6, '2023-03-22'),
(960, 71, 2, '2023-03-24'),
(961, 58, 1, '2023-03-24'),
(962, 0, 6, '2023-03-28'),
(963, 0, 13, '2023-04-04'),
(964, 62, 6, '2023-04-04'),
(965, 65, 3, '2023-04-04'),
(966, 64, 6, '2023-04-06'),
(967, 66, 2, '2023-04-06'),
(968, 77, 1, '2023-04-07'),
(969, 70, 2, '2023-04-08'),
(970, 0, 4, '2023-04-10'),
(971, 65, 1, '2023-04-10'),
(972, 66, 2, '2023-04-11'),
(973, 77, 7, '2023-04-13'),
(974, 77, 7, '2023-04-13'),
(975, 0, 9, '2023-04-18'),
(976, 65, 1, '2023-04-18'),
(977, 77, 1, '2023-04-18'),
(978, 71, 10, '2023-04-20'),
(979, 75, 1, '2023-04-21'),
(980, 75, 1, '2023-04-21'),
(981, 64, 2, '2023-04-21'),
(982, 73, 1, '2023-04-22'),
(983, 62, 1, '2023-04-22'),
(984, 0, 23, '2023-04-24'),
(985, 70, 4, '2023-04-24'),
(986, 71, 1, '2023-04-24'),
(987, 75, 3, '2023-04-25'),
(988, 75, 3, '2023-04-25'),
(989, 72, 8, '2023-04-25'),
(990, 68, 3, '2023-04-27'),
(991, 77, 4, '2023-04-27'),
(992, 65, 5, '2023-04-27'),
(993, 62, 5, '2023-04-27'),
(994, 64, 4, '2023-04-27'),
(995, 0, 11, '2023-05-01'),
(996, 75, 2, '2023-05-06'),
(997, 70, 2, '2023-05-06'),
(998, 65, 3, '2023-05-07'),
(999, 72, 1, '2023-05-07'),
(1000, 72, 1, '2023-05-07'),
(1001, 68, 6, '2023-05-07'),
(1002, 71, 2, '2023-05-07'),
(1003, 62, 2, '2023-05-07'),
(1004, 0, 15, '2023-05-11'),
(1005, 77, 4, '2023-05-11'),
(1006, 77, 4, '2023-05-11'),
(1007, 73, 1, '2023-05-11'),
(1008, 70, 8, '2023-05-12'),
(1009, 68, 2, '2023-05-12'),
(1010, 75, 1, '2023-05-12'),
(1011, 66, 6, '2023-05-12'),
(1012, 72, 1, '2023-05-12'),
(1013, 71, 4, '2023-05-12'),
(1014, 71, 4, '2023-05-12'),
(1015, 65, 1, '2023-05-13'),
(1016, 0, 12, '2023-05-16'),
(1017, 75, 1, '2023-05-17'),
(1018, 75, 1, '2023-05-17'),
(1019, 78, 5, '2023-05-17'),
(1020, 71, 8, '2023-05-17'),
(1021, 70, 12, '2023-05-17'),
(1022, 77, 4, '2023-05-17'),
(1023, 73, 1, '2023-05-17'),
(1024, 65, 1, '2023-05-17'),
(1025, 64, 3, '2023-05-17'),
(1026, 62, 1, '2023-05-17'),
(1027, 0, 10, '2023-05-22'),
(1028, 70, 2, '2023-05-23'),
(1029, 64, 1, '2023-05-23'),
(1030, 65, 2, '2023-05-27'),
(1031, 0, 12, '2023-05-29'),
(1032, 70, 4, '2023-05-29'),
(1033, 62, 2, '2023-06-01'),
(1034, 75, 1, '2023-06-01'),
(1035, 66, 4, '2023-06-03'),
(1036, 64, 3, '2023-06-03'),
(1037, 77, 2, '2023-06-03'),
(1038, 0, 5, '2023-06-05'),
(1039, 68, 4, '2023-06-05'),
(1040, 0, 1, '2023-06-15'),
(1041, 68, 2, '2023-06-15'),
(1042, 0, 4, '2023-06-30'),
(1043, 78, 20, '2023-07-03'),
(1044, 0, 64, '2023-07-03'),
(1045, 65, 101, '2023-07-03'),
(1046, 73, 10, '2023-07-03'),
(1047, 77, 30, '2023-07-03'),
(1048, 70, 18, '2023-07-03'),
(1049, 71, 8, '2023-07-03'),
(1050, 72, 1, '2023-07-03'),
(1051, 68, 4, '2023-07-03'),
(1052, 66, 58, '2023-07-04'),
(1053, 64, 4, '2023-07-04'),
(1054, 62, 9, '2023-07-04'),
(1055, 75, 3, '2023-07-04'),
(1056, 0, 37, '2023-07-10'),
(1057, 70, 4, '2023-07-11'),
(1058, 62, 6, '2023-07-11'),
(1059, 68, 3, '2023-07-11'),
(1060, 78, 1, '2023-07-11'),
(1061, 71, 1, '2023-07-12'),
(1062, 73, 4, '2023-07-12'),
(1063, 77, 1, '2023-07-14'),
(1064, 65, 1, '2023-07-14'),
(1065, 64, 1, '2023-07-15'),
(1066, 66, 1, '2023-07-15'),
(1067, 75, 1, '2023-07-15'),
(1068, 0, 7, '2023-07-17'),
(1069, 65, 3, '2023-07-17'),
(1070, 70, 2, '2023-07-17'),
(1071, 78, 3, '2023-07-17'),
(1072, 77, 1, '2023-07-22'),
(1073, 64, 1, '2023-07-22'),
(1074, 62, 1, '2023-07-22'),
(1075, 0, 94, '2023-07-24'),
(1076, 65, 12, '2023-07-24'),
(1077, 73, 5, '2023-07-24'),
(1078, 66, 3, '2023-07-24'),
(1079, 77, 2, '2023-07-24'),
(1080, 70, 1, '2023-07-24'),
(1081, 68, 1, '2023-07-28'),
(1082, 0, 16, '2023-07-31'),
(1083, 65, 4, '2023-07-31'),
(1084, 73, 1, '2023-07-31'),
(1085, 70, 1, '2023-07-31'),
(1086, 62, 7, '2023-08-01'),
(1087, 64, 3, '2023-08-03'),
(1088, 64, 3, '2023-08-03'),
(1089, 77, 4, '2023-08-05'),
(1090, 71, 2, '2023-08-06'),
(1091, 0, 47, '2023-08-08'),
(1092, 78, 10, '2023-08-09'),
(1093, 78, 10, '2023-08-09'),
(1094, 77, 5, '2023-08-09'),
(1095, 62, 2, '2023-08-09'),
(1096, 68, 1, '2023-08-09'),
(1097, 68, 1, '2023-08-09'),
(1098, 65, 2, '2023-08-10'),
(1099, 84, 13, '2023-08-10'),
(1100, 73, 2, '2023-08-12'),
(1101, 66, 1, '2023-08-12'),
(1102, 72, 2, '2023-08-12'),
(1103, 0, 3, '2023-08-14'),
(1104, 65, 5, '2023-08-14'),
(1105, 73, 1, '2023-08-19'),
(1106, 0, 14, '2023-08-21'),
(1107, 84, 2, '2023-08-23'),
(1108, 65, 6, '2023-08-24'),
(1109, 75, 1, '2023-08-24'),
(1110, 73, 5, '2023-08-24'),
(1111, 78, 4, '2023-08-27'),
(1112, 0, 17, '2023-08-28'),
(1113, 84, 5, '2023-08-28'),
(1114, 62, 3, '2023-08-29'),
(1115, 65, 1, '2023-08-29'),
(1116, 64, 3, '2023-08-29'),
(1117, 70, 1, '2023-08-29'),
(1118, 72, 1, '2023-08-29'),
(1119, 66, 1, '2023-08-31'),
(1120, 78, 1, '2023-09-03'),
(1121, 0, 9, '2023-09-04'),
(1122, 84, 3, '2023-09-04'),
(1123, 73, 1, '2023-09-05'),
(1124, 77, 1, '2023-09-06'),
(1125, 0, 12, '2023-09-12'),
(1126, 78, 4, '2023-09-12'),
(1127, 84, 6, '2023-09-12'),
(1128, 66, 1, '2023-09-14'),
(1129, 77, 1, '2023-09-14'),
(1130, 65, 2, '2023-09-14'),
(1131, 70, 1, '2023-09-14'),
(1132, 72, 1, '2023-09-16'),
(1133, 0, 13, '2023-09-20'),
(1134, 70, 2, '2023-09-21'),
(1135, 77, 3, '2023-09-21'),
(1136, 66, 2, '2023-09-21'),
(1137, 72, 2, '2023-09-21'),
(1138, 65, 10, '2023-09-21'),
(1139, 84, 5, '2023-09-21'),
(1140, 73, 3, '2023-09-21'),
(1141, 0, 4, '2023-09-27'),
(1142, 84, 1, '2023-09-27'),
(1143, 65, 1, '2023-09-28'),
(1144, 64, 1, '2023-09-28'),
(1145, 68, 1, '2023-10-01'),
(1146, 0, 21, '2023-10-02'),
(1147, 73, 5, '2023-10-02'),
(1148, 65, 6, '2023-10-02'),
(1149, 77, 6, '2023-10-02'),
(1150, 84, 8, '2023-10-04'),
(1151, 78, 3, '2023-10-05'),
(1152, 68, 1, '2023-10-07'),
(1153, 72, 1, '2023-10-08'),
(1154, 70, 2, '2023-10-08'),
(1155, 64, 1, '2023-10-08'),
(1156, 62, 1, '2023-10-08'),
(1157, 0, 14, '2023-10-09'),
(1158, 65, 4, '2023-10-09'),
(1159, 84, 4, '2023-10-09'),
(1160, 78, 2, '2023-10-12'),
(1161, 75, 1, '2023-10-12'),
(1162, 77, 1, '2023-10-14'),
(1163, 66, 1, '2023-10-14'),
(1164, 73, 3, '2023-10-14'),
(1165, 70, 1, '2023-10-14'),
(1166, 68, 1, '2023-10-15'),
(1167, 0, 21, '2023-10-16'),
(1168, 73, 4, '2023-10-16'),
(1169, 77, 2, '2023-10-17'),
(1170, 66, 6, '2023-10-19'),
(1171, 84, 4, '2023-10-19'),
(1172, 75, 2, '2023-10-19'),
(1173, 71, 2, '2023-10-19'),
(1174, 70, 1, '2023-10-19'),
(1175, 64, 3, '2023-10-19'),
(1176, 65, 7, '2023-10-21'),
(1177, 0, 12, '2023-10-23'),
(1178, 73, 3, '2023-10-25'),
(1179, 65, 2, '2023-10-25'),
(1180, 78, 2, '2023-10-25'),
(1181, 77, 1, '2023-10-25'),
(1182, 70, 5, '2023-10-25'),
(1183, 64, 4, '2023-10-25'),
(1184, 66, 2, '2023-10-27'),
(1185, 0, 7, '2023-10-31'),
(1186, 65, 7, '2023-10-31'),
(1187, 73, 1, '2023-10-31'),
(1188, 70, 4, '2023-10-31'),
(1189, 84, 3, '2023-10-31'),
(1190, 64, 1, '2023-10-31'),
(1191, 68, 3, '2023-10-31'),
(1192, 77, 1, '2023-11-02'),
(1193, 0, 7, '2023-11-08'),
(1194, 84, 7, '2023-11-08'),
(1195, 64, 1, '2023-11-08'),
(1196, 78, 3, '2023-11-09'),
(1197, 77, 4, '2023-11-09'),
(1198, 0, 7, '2023-11-13'),
(1199, 75, 1, '2023-11-13'),
(1200, 77, 1, '2023-11-14'),
(1201, 65, 2, '2023-11-14'),
(1202, 84, 1, '2023-11-14'),
(1203, 78, 1, '2023-11-14'),
(1204, 62, 4, '2023-11-14'),
(1205, 0, 7, '2023-11-21'),
(1206, 73, 1, '2023-11-21'),
(1207, 68, 2, '2023-11-22'),
(1208, 84, 1, '2023-11-25'),
(1209, 65, 1, '2023-11-26'),
(1210, 0, 4, '2023-11-28'),
(1211, 73, 2, '2023-11-28'),
(1212, 65, 3, '2023-11-30'),
(1213, 66, 2, '2023-11-30'),
(1214, 0, 5, '2023-12-08'),
(1215, 84, 2, '2023-12-08'),
(1216, 62, 3, '2023-12-08'),
(1217, 77, 1, '2023-12-09'),
(1218, 0, 1, '2023-12-11'),
(1219, 78, 1, '2023-12-11'),
(1220, 0, 4, '2023-12-18'),
(1221, 73, 1, '2023-12-18'),
(1222, 62, 2, '2023-12-24'),
(1223, 65, 1, '2023-12-24'),
(1224, 0, 17, '2023-12-27'),
(1225, 65, 15, '2023-12-27'),
(1226, 73, 6, '2023-12-27'),
(1227, 84, 5, '2023-12-29'),
(1228, 66, 2, '2023-12-29'),
(1229, 78, 1, '2023-12-30'),
(1230, 62, 2, '2023-12-30'),
(1231, 0, 16, '2024-01-01'),
(1232, 78, 2, '2024-01-01'),
(1233, 77, 4, '2024-01-04'),
(1234, 73, 1, '2024-01-04'),
(1235, 65, 1, '2024-01-04'),
(1236, 84, 2, '2024-01-04'),
(1237, 62, 1, '2024-01-04'),
(1238, 70, 1, '2024-01-04'),
(1239, 66, 1, '2024-01-04'),
(1240, 72, 1, '2024-01-04'),
(1241, 0, 1, '2024-01-13'),
(1242, 84, 1, '2024-01-13'),
(1243, 65, 1, '2024-01-13'),
(1244, 0, 2, '2024-01-15'),
(1245, 62, 1, '2024-01-15'),
(1246, 77, 1, '2024-01-20'),
(1247, 65, 1, '2024-01-20'),
(1248, 71, 1, '2024-01-20'),
(1249, 0, 7, '2024-01-23'),
(1250, 73, 3, '2024-01-23'),
(1251, 84, 3, '2024-01-23'),
(1252, 65, 7, '2024-01-26'),
(1253, 64, 1, '2024-01-26'),
(1254, 62, 1, '2024-01-27'),
(1255, 0, 2, '2024-02-04'),
(1256, 73, 2, '2024-02-04'),
(1257, 71, 2, '2024-02-04'),
(1258, 66, 3, '2024-02-04'),
(1259, 0, 10, '2024-02-05'),
(1260, 66, 1, '2024-02-05'),
(1261, 84, 3, '2024-02-05'),
(1262, 73, 2, '2024-02-05'),
(1263, 77, 2, '2024-02-06'),
(1264, 0, 4, '2024-02-12'),
(1265, 73, 1, '2024-02-12'),
(1266, 66, 2, '2024-02-12'),
(1267, 84, 1, '2024-02-12'),
(1268, 65, 3, '2024-02-12'),
(1269, 78, 2, '2024-02-12'),
(1270, 0, 8, '2024-02-19'),
(1271, 84, 7, '2024-02-19'),
(1272, 78, 4, '2024-02-19'),
(1273, 77, 2, '2024-02-19'),
(1274, 71, 1, '2024-02-19'),
(1275, 66, 2, '2024-02-19'),
(1276, 65, 5, '2024-02-20'),
(1277, 0, 1, '2024-03-03'),
(1278, 0, 9, '2024-03-06'),
(1279, 65, 8, '2024-03-06'),
(1280, 84, 10, '2024-03-06'),
(1281, 73, 3, '2024-03-07'),
(1282, 71, 1, '2024-03-07'),
(1283, 70, 2, '2024-03-07'),
(1284, 66, 1, '2024-03-07'),
(1285, 0, 12, '2024-03-11'),
(1286, 84, 1, '2024-03-11'),
(1287, 70, 1, '2024-03-11'),
(1288, 65, 1, '2024-03-13'),
(1289, 66, 4, '2024-03-13'),
(1290, 73, 3, '2024-03-15'),
(1291, 0, 28, '2024-03-28'),
(1292, 65, 4, '2024-03-28'),
(1293, 75, 1, '2024-03-29'),
(1294, 84, 2, '2024-03-29'),
(1295, 73, 1, '2024-03-29'),
(1296, 77, 1, '2024-03-29'),
(1297, 78, 3, '2024-03-29'),
(1298, 64, 2, '2024-03-29'),
(1299, 85, 3, '2024-03-29'),
(1300, 68, 1, '2024-03-29'),
(1301, 72, 1, '2024-03-29'),
(1302, 70, 1, '2024-03-29'),
(1303, 0, 3, '2024-04-03'),
(1304, 73, 2, '2024-04-04'),
(1305, 70, 1, '2024-04-04'),
(1306, 0, 3, '2024-04-08'),
(1307, 73, 1, '2024-04-08'),
(1308, 64, 1, '2024-04-11'),
(1309, 0, 5, '2024-04-16'),
(1310, 85, 2, '2024-04-16'),
(1311, 65, 1, '2024-04-17'),
(1312, 0, 2, '2024-04-24'),
(1313, 1, 1, '2024-04-30'),
(1314, 62, 2, '2024-04-30'),
(1315, 64, 1, '2024-04-30'),
(1316, 0, 41, '2024-06-05'),
(1317, 78, 17, '2024-06-05'),
(1318, 85, 35, '2024-06-05'),
(1319, 72, 1, '2024-06-06'),
(1320, 64, 2, '2024-06-06'),
(1321, 66, 3, '2024-06-06'),
(1322, 75, 4, '2024-06-06'),
(1323, 73, 5, '2024-06-07'),
(1324, 71, 1, '2024-06-07'),
(1325, 70, 2, '2024-06-07'),
(1326, 91, 3, '2024-06-07'),
(1327, 65, 1, '2024-06-08'),
(1328, 103, 3, '2024-06-08'),
(1329, 100, 2, '2024-06-08'),
(1330, 68, 1, '2024-06-08'),
(1331, 98, 1, '2024-06-08'),
(1332, 0, 40, '2024-06-10'),
(1333, 91, 1, '2024-06-10'),
(1334, 77, 1, '2024-06-10'),
(1335, 85, 20, '2024-06-10'),
(1336, 78, 357, '2024-06-10'),
(1337, 73, 87, '2024-06-10'),
(1338, 75, 125, '2024-06-10'),
(1339, 65, 1, '2024-06-11'),
(1340, 100, 1, '2024-06-11'),
(1341, 0, 19, '2024-06-21'),
(1342, 71, 1, '2024-06-21'),
(1343, 78, 1, '2024-06-21'),
(1344, 85, 2, '2024-06-22'),
(1345, 98, 1, '2024-06-22'),
(1346, 99, 1, '2024-06-22'),
(1347, 75, 1, '2024-06-22'),
(1348, 0, 4, '2024-06-24'),
(1349, 62, 1, '2024-06-27'),
(1350, 0, 3, '2024-07-05'),
(1351, 71, 1, '2024-07-05'),
(1352, 0, 6, '2024-07-17'),
(1353, 75, 1, '2024-07-18'),
(1354, 68, 1, '2024-07-18'),
(1355, 71, 4, '2024-07-18'),
(1356, 104, 1, '2024-07-18'),
(1357, 92, 1, '2024-07-18'),
(1358, 85, 1, '2024-07-18'),
(1359, 70, 1, '2024-07-18'),
(1360, 77, 1, '2024-07-19'),
(1361, 0, 4, '2024-07-22'),
(1362, 65, 1, '2024-07-22'),
(1363, 0, 1, '2024-07-31'),
(1364, 73, 2, '2024-07-31'),
(1365, 0, 3, '2024-08-08'),
(1366, 65, 1, '2024-08-08'),
(1367, 85, 2, '2024-08-08'),
(1368, 98, 1, '2024-08-09'),
(1369, 73, 1, '2024-08-09'),
(1370, 0, 2, '2024-08-12'),
(1371, 0, 2, '2024-08-19'),
(1372, 96, 1, '2024-08-19'),
(1373, 0, 1, '2024-08-26'),
(1374, 0, 75, '2024-09-24'),
(1375, 98, 2, '2024-09-25'),
(1376, 103, 1, '2024-09-25'),
(1377, 65, 7, '2024-09-25'),
(1378, 66, 10, '2024-09-25'),
(1379, 90, 1, '2024-09-25'),
(1380, 101, 1, '2024-09-25'),
(1381, 100, 1, '2024-09-25'),
(1382, 77, 2, '2024-09-25'),
(1383, 75, 1, '2024-09-25'),
(1384, 78, 1, '2024-09-28'),
(1385, 71, 1, '2024-09-28'),
(1386, 73, 1, '2024-09-28'),
(1387, 0, 24, '2024-09-30'),
(1388, 65, 168, '2024-09-30'),
(1389, 66, 33, '2024-09-30'),
(1390, 71, 2, '2024-09-30'),
(1391, 70, 43, '2024-09-30'),
(1392, 77, 1, '2024-09-30'),
(1393, 0, 11, '2024-10-07'),
(1394, 70, 10, '2024-10-07'),
(1395, 65, 1, '2024-10-07'),
(1396, 85, 1, '2024-10-08'),
(1397, 0, 5, '2024-10-19'),
(1398, 66, 1, '2024-10-19'),
(1399, 0, 2, '2024-10-23'),
(1400, 0, 2, '2024-11-09'),
(1401, 0, 20, '2024-12-14'),
(1402, 73, 7, '2024-12-14'),
(1403, 68, 2, '2024-12-14'),
(1404, 75, 3, '2024-12-14'),
(1405, 90, 10, '2024-12-14'),
(1406, 91, 3, '2024-12-14'),
(1407, 85, 5, '2024-12-14'),
(1408, 104, 3, '2024-12-14'),
(1409, 97, 1, '2024-12-14'),
(1410, 65, 7, '2024-12-14'),
(1411, 96, 1, '2024-12-14'),
(1412, 92, 3, '2024-12-14'),
(1413, 70, 2, '2024-12-14'),
(1414, 66, 2, '2024-12-14'),
(1415, 71, 1, '2024-12-14'),
(1416, 78, 1, '2024-12-14'),
(1417, 72, 1, '2024-12-14'),
(1418, 100, 1, '2024-12-14'),
(1419, 0, 4, '2024-12-16'),
(1420, 73, 2, '2024-12-16'),
(1421, 65, 1, '2024-12-16'),
(1422, 98, 1, '2024-12-16'),
(1423, 96, 1, '2024-12-16'),
(1424, 70, 1, '2024-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_playlist`
--

CREATE TABLE `tbl_playlist` (
  `pid` int(11) NOT NULL,
  `playlist_name` varchar(255) NOT NULL,
  `playlist_image` varchar(255) NOT NULL,
  `playlist_songs` text NOT NULL,
  `geners_type` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_playlist`
--

INSERT INTO `tbl_playlist` (`pid`, `playlist_name`, `playlist_image`, `playlist_songs`, `geners_type`, `status`) VALUES
(4, 'Chill', '62184_Chill.jpg', '75,73', '6,1', 1),
(5, 'Classic', '46215_f6e7999c-b82e-4086-b816-1043e5a7a07b.jpg', '73,71,70,66,65,64,62', '6,3,1', 1),
(6, 'Desi Hip Hop', '78886_3c540794-b090-4da5-9153-e1ed6cbc68af.jpg', '73,70,66,65', '6,4,3,2,1', 1),
(7, 'Happy Tunes', '93176_The-Swing-on-Things.jpg', '68,66,64,77', '6,1', 1),
(8, 'Workout', '76390_24553ca3-ca9a-4019-9d26-3d29cafc65e2.jpg', '75,65,64,62', '6,1', 1),
(10, 'Sad', '13638_11263_ai-generated-8562305.jpg', '71,68,65,62,77', '6,4,3,1', 1),
(11, 'Super Hit', '90649_92808054-fac7-4ef0-b05d-90a7c6cb1d02.jpg', '73,71,70,66,64,77', '6,2,1', 1),
(12, 'Love Notes', '74164_Love-Backgrounds-Aesthetic.jpg', '73,68,65,77', '6,4,2,1', 1),
(13, 'Oldies', '269_download.jpg', '75,73,72,71', '6,4,1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `rate` int(11) NOT NULL,
  `dt_rate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`id`, `post_id`, `ip`, `rate`, `dt_rate`) VALUES
(1, 38, '10', 5, '2022-08-29 04:53:22'),
(2, 68, '10', 5, '2024-04-30 08:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reports`
--

CREATE TABLE `tbl_reports` (
  `id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `report` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_reports`
--

INSERT INTO `tbl_reports` (`id`, `song_id`, `user_id`, `report`) VALUES
(1, 12, 12, 'dfgdfgdfg'),
(2, 38, 206, 'demo hai'),
(3, 38, 206, 'demo hai'),
(4, 38, 148, 'demo hai'),
(5, 64, 342, 'this is too..');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `envato_buyer_name` varchar(255) NOT NULL,
  `envato_purchase_code` varchar(255) NOT NULL,
  `envato_buyer_email` varchar(150) NOT NULL,
  `envato_purchased_status` int(1) NOT NULL DEFAULT 0,
  `package_name` varchar(255) NOT NULL,
  `onesignal_app_id` varchar(500) NOT NULL,
  `onesignal_rest_key` varchar(500) NOT NULL,
  `email_from` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `app_logo` varchar(255) NOT NULL,
  `app_name_logo` varchar(255) NOT NULL,
  `app_email` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `app_author` varchar(255) NOT NULL,
  `app_contact` varchar(255) NOT NULL,
  `app_website` varchar(255) NOT NULL,
  `app_description` text NOT NULL,
  `app_developed_by` varchar(255) NOT NULL,
  `app_privacy_policy` text NOT NULL,
  `api_latest_limit` int(3) NOT NULL,
  `api_cat_order_by` varchar(255) NOT NULL,
  `api_cat_post_order_by` varchar(255) NOT NULL,
  `publisher_id` varchar(500) NOT NULL,
  `interstital_ad` varchar(500) NOT NULL,
  `interstital_ad_id` varchar(500) NOT NULL,
  `interstital_ad_click` varchar(500) NOT NULL,
  `banner_ad` varchar(500) NOT NULL,
  `banner_ad_id` varchar(500) NOT NULL,
  `app_open_ad_id` varchar(500) NOT NULL,
  `song_download` varchar(255) NOT NULL DEFAULT 'true',
  `ios_banner_ad` varchar(500) NOT NULL,
  `ios_banner_ad_id` varchar(500) NOT NULL,
  `ios_app_open_ad_id` varchar(500) NOT NULL,
  `ios_interstital_ad` varchar(500) NOT NULL,
  `ios_interstital_ad_id` varchar(500) NOT NULL,
  `ios_interstital_ad_click` varchar(500) NOT NULL,
  `banner_ad_id_status` int(11) NOT NULL DEFAULT 1,
  `interstital_ad_id_status` int(11) NOT NULL DEFAULT 1,
  `app_open_ad_id_status` int(11) NOT NULL DEFAULT 1,
  `banner_ad_id_ios_status` int(11) NOT NULL DEFAULT 1,
  `interstital_ad_id_ios_status` int(11) NOT NULL DEFAULT 1,
  `ios_app_open_ad_id_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `envato_buyer_name`, `envato_purchase_code`, `envato_buyer_email`, `envato_purchased_status`, `package_name`, `onesignal_app_id`, `onesignal_rest_key`, `email_from`, `app_name`, `app_logo`, `app_name_logo`, `app_email`, `app_version`, `app_author`, `app_contact`, `app_website`, `app_description`, `app_developed_by`, `app_privacy_policy`, `api_latest_limit`, `api_cat_order_by`, `api_cat_post_order_by`, `publisher_id`, `interstital_ad`, `interstital_ad_id`, `interstital_ad_click`, `banner_ad`, `banner_ad_id`, `app_open_ad_id`, `song_download`, `ios_banner_ad`, `ios_banner_ad_id`, `ios_app_open_ad_id`, `ios_interstital_ad`, `ios_interstital_ad_id`, `ios_interstital_ad_click`, `banner_ad_id_status`, `interstital_ad_id_status`, `app_open_ad_id_status`, `banner_ad_id_ios_status`, `interstital_ad_id_ios_status`, `ios_app_open_ad_id_status`) VALUES
(1, '', '', '', 1, 'com.vinodflutter.musicPlayerDemo', '27222528-9375-40f3-88e6-857a62b8cc31', 'ZWJiYjQ3MGUtNTQ5MC00OGFmLWFkM2EtMzBkY2IyOWFlZWNl', '-', 'Online MP3 App', 'logo.png', 'logo-text.png', 'vocsyinfotech@gmail.com', '1.0.0', 'Infotech', '+91 8347652922', 'https://vocsyinfotech.com/', '&lt;p&gt;&lt;strong&gt;Online mp3&nbsp;&lt;/strong&gt;is an Mp3 Songs app. You can stream songs from large collection of songs. You can search you favourite songs or go through your favourite categories. Get all the latest songs here and keep listening everyday.&nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;The application is specially optimized to be extremely easy to configure and detailed documentation is provided.&lt;br /&gt;\r\n&lt;br /&gt;\r\nThough if you have any query can contact us any time vai skype or whatsapp.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;strong&gt;Skype: &lt;/strong&gt;VocsyInfotech/ support.VocsyInfotech&lt;br /&gt;\r\n&lt;strong&gt;WhatsApp:&lt;/strong&gt; +918347652922&lt;/p&gt;\r\n\r\n&lt;h3&gt;You can check our other Apps on Envato via below link.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;a href=&quot;https://codecanyon.net/user/VocsyInfotech/portfolio?ref=VocsyInfotech&quot; rel=&quot;nofollow noreferrer noopener&quot; target=&quot;_blank&quot;&gt;https://codecanyon.net/user/VocsyInfotech/portfolio?ref=VocsyInfotech&lt;/a&gt;&lt;/h3&gt;', 'vocsy Infotech', '<p><strong>We are committed to protecting your privacy</strong></p>\r\n\r\n<p>We collect the minimum amount of information about you that is commensurate with providing you with a satisfactory service. This policy indicates the type of processes that may result in data being collected about you. Your use of this website gives us the right to collect that information.&nbsp;</p>\r\n\r\n<p><strong>Information Collected</strong></p>\r\n\r\n<p>We may collect any or all of the information that you give us depending on the type of transaction you enter into, including your name, address, telephone number, and email address, together with data about your use of the website. Other information that may be needed from time to time to process a request may also be collected as indicated on the website.</p>\r\n\r\n<p><strong>Information Use</strong></p>\r\n\r\n<p>We use the information collected primarily to process the task for which you visited the website. Data collected in the UK is held in accordance with the Data Protection Act. All reasonable precautions are taken to prevent unauthorised access to this information. This safeguard may require you to provide additional forms of identity should you wish to obtain information about your account details.</p>\r\n\r\n<p><strong>Cookies</strong></p>\r\n\r\n<p>Your Internet browser has the in-built facility for storing small files - &quot;cookies&quot; - that hold information which allows a website to recognise your account. Our website takes advantage of this facility to enhance your experience. You have the ability to prevent your computer from accepting cookies but, if you do, certain functionality on the website may be impaired.</p>\r\n\r\n<p><strong>Disclosing Information</strong></p>\r\n\r\n<p>We do not disclose any personal information obtained about you from this website to third parties unless you permit us to do so by ticking the relevant boxes in registration or competition forms. We may also use the information to keep in contact with you and inform you of developments associated with us. You will be given the opportunity to remove yourself from any mailing list or similar device. If at any time in the future we should wish to disclose information collected on this website to any third party, it would only be with your knowledge and consent.&nbsp;</p>\r\n\r\n<p>We may from time to time provide information of a general nature to third parties - for example, the number of individuals visiting our website or completing a registration form, but we will not use any information that could identify those individuals.&nbsp;</p>\r\n\r\n<p>In addition Dummy may work with third parties for the purpose of delivering targeted behavioural advertising to the Dummy website. Through the use of cookies, anonymous information about your use of our websites and other websites will be used to provide more relevant adverts about goods and services of interest to you. For more information on online behavioural advertising and about how to turn this feature off, please visit youronlinechoices.com/opt-out.</p>\r\n\r\n<p><strong>Changes to this Policy</strong></p>\r\n\r\n<p>Any changes to our Privacy Policy will be placed here and will supersede this version of our policy. We will take reasonable steps to draw your attention to any changes in our policy. However, to be on the safe side, we suggest that you read this document each time you use the website to ensure that it still meets with your approval.</p>\r\n\r\n<p><strong>Contacting Us</strong></p>\r\n\r\n<p>If you have any questions about our Privacy Policy, or if you want to know what information we have collected about you, please email us at vocsy@infotech.com. You can also correct any factual errors in that information or require us to remove your details form any list under our control.</p>\r\n', 10, 'DESC', 'cid', 'ca-app-pub-71420559909214799', 'true', 'ca-app-pub-3940256099942544/1033173712', '3', '', 'ca-app-pub-3940256099942544/6300978111', 'ca-app-pub-3940256099942544/5224354917', 'true', '', 'ca-app-pub-3940256099942544/2934735716', 'ca-app-pub-3940256099942544/1712485313', '', 'ca-app-pub-3940256099942544/4411468910', '', 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smtp_settings`
--

CREATE TABLE `tbl_smtp_settings` (
  `id` int(5) NOT NULL,
  `smtp_host` varchar(150) NOT NULL,
  `smtp_email` varchar(150) NOT NULL,
  `smtp_password` text NOT NULL,
  `smtp_secure` varchar(20) NOT NULL,
  `port_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_smtp_settings`
--

INSERT INTO `tbl_smtp_settings` (`id`, `smtp_host`, `smtp_email`, `smtp_password`, `smtp_secure`, `port_no`) VALUES
(1, 'mail.google.com', 'darshitgajera101@gmail.com', 'DArs10da', 'ssl', '465');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_song_suggest`
--

CREATE TABLE `tbl_song_suggest` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_title` varchar(500) NOT NULL,
  `song_image` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_song_suggest`
--

INSERT INTO `tbl_song_suggest` (`id`, `user_id`, `song_title`, `song_image`, `message`) VALUES
(1, 1, 'hello', NULL, 'good song'),
(2, 206, 'deva o deva', NULL, 'demo hai'),
(3, 206, 'deva o deva', NULL, 'demo hai'),
(4, 342, 'OMH', '50595_79221_profile.jpg', 'OMH..'),
(5, 342, 'OMH', '86338_pexels-george-desipris-792381.jpg', 'OMH..');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `user_code` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `device_id` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `user_image` varchar(500) DEFAULT NULL,
  `total_followers` int(11) NOT NULL DEFAULT 0,
  `total_following` int(11) NOT NULL DEFAULT 0,
  `user_youtube` varchar(500) DEFAULT NULL,
  `user_instagram` varchar(500) DEFAULT NULL,
  `confirm_code` varchar(255) DEFAULT NULL,
  `total_point` int(11) NOT NULL DEFAULT 0,
  `is_verified` int(1) NOT NULL DEFAULT 0,
  `player_id` text DEFAULT NULL,
  `is_duplicate` int(1) NOT NULL DEFAULT 0,
  `is_deleted` int(1) NOT NULL DEFAULT 0,
  `registration_on` varchar(255) NOT NULL DEFAULT '0',
  `auth_id` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user_code`, `user_type`, `device_id`, `name`, `email`, `password`, `phone`, `user_image`, `total_followers`, `total_following`, `user_youtube`, `user_instagram`, `confirm_code`, `total_point`, `is_verified`, `player_id`, `is_duplicate`, `is_deleted`, `registration_on`, `auth_id`, `status`, `created_at`) VALUES
(330, 'k6705kna', 'Google', '312062514', 'godhani', '123aniket456@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1688451420', '8588574596', '1', '2024-04-25 05:23:49'),
(489, 'shxit6kd', 'Apple', '0', '4w2j25dvyp', '4w2j25dvyp@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'Rhx2TZPfaEhcPSSNAhwdLwYFsnJ3', '1', '2024-07-24 23:37:00'),
(342, 'ram45duo', 'Normal', '1674', 'godhani', '667689yg@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9033879227', '37271_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688452920', '', '1', '2024-04-25 05:23:49'),
(341, '8fwdk3ux', 'Normal', '14', 'godhani', '689yg@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9033879227', '11497_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688452860', '', '1', '2024-04-25 05:23:49'),
(487, '5xcj2fy6', 'Apple', '0', '8wy8qyjkr8', '8wy8qyjkr8@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'KJptBDvliffdmYeY2mEBvkxCG8x2', '1', '2024-06-21 21:24:46'),
(284, 'iifn634p', 'Normal', '', 'A786', 'A786@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9632587410', '77031_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 1, '1674538560', '', '1', '2024-04-25 05:23:49'),
(442, '2yxcfkbg', 'Normal', '', 'aaaaa', 'aaaaa@gmail.com', '25f9e794323b453885f5181f1b624d0b', '3204130760', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1699055700', '', '1', '2024-04-25 05:23:49'),
(457, 'e6q22evs', 'Normal', '', 'ali', 'ab@gmail.com', 'b86ffaf7de29e8aa87785572741025f3', '0618325969', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1707062100', '', '1', '2024-04-25 05:23:49'),
(148, 'obggn4tk', 'Normal', '8132b0fce75f5b6a', 'Darshit', 'abc@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$aXB3WHZuMlMvWFUwVTJVTQ$6NZs3b7XHhdE/kKXxHddMTMRgsFJaW+CR1szUsJe+so', '1234569807', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629204120', '', '1', '2024-04-25 05:23:49'),
(343, 'jrcm5bhj', 'Normal', '', 'abcdemo', 'abcdemoxyz@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9632589765', '5536_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688454600', '', '1', '2024-04-25 05:23:49'),
(331, 'iygveojc', 'Google', '2514', 'godhani', 'abcdg@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688451660', '8596', '1', '2024-04-25 05:23:49'),
(194, 'kbws4py0', 'Google', 'eec0c87eb9905c82', 'Abo Reem', 'aboayahreem@gmail.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJwsquDLbLeaC-7PEWu9H2e4mubK1dr7XysnqoNI=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1651568880', 'qj6t6e51G4Mk6ox5jSSF0dZeCRG2', '1', '2024-04-25 05:23:49'),
(430, 'h4w7tixz', 'Google', '0', 'Aham', 'abongcher@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtfUfILvI4ISmJeOWm9-euCRwK1Lt6YFtKtgD1LxgKH8qas=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1692583380', 'nHIKcGnZkkVQKvh4FuA5WP78hCb2', '1', '2024-04-25 05:23:49'),
(200, 'ot8ix58q', 'Google', '979064d5d573663a', 'أبو إرشاد عثمان', 'abuirchad@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GheVeNa3uTYpD3kAmL_Bgb86pcksq2ktvCZ72RpCA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1654578720', 'Nh31BrppIbVka1R3cldxeQPP6Nm1', '1', '2024-04-25 05:23:49'),
(202, 'erfgcw2n', 'Normal', 'ebe35afbe6955c90', 'holly', 'adahosabex@gmail.com', '25d55ad283aa400af464c76d713c07ad', '08131235005', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1656929280', '', '1', '2024-04-25 05:23:49'),
(333, '6gviy8nr', 'Apple', '214', 'godhani', 'adg@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '596', '1', '2024-04-25 05:23:49'),
(195, 'o3n04ag8', 'Google', '60bd310eead07fbf', 'Afri Veo', 'afriveo@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GgDq4qzE8xGar29futeU7UkmVQBTn95gIADd_Yf=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1651591980', 'JOh6whWotHeY33JaUs1ymZhKZPQ2', '1', '2024-04-25 05:23:49'),
(453, 'atixby06', 'Normal', '', 'Ahmed', 'ahmed@gmail.com', '72d05ce8a77a0e155680890fc6d49bbe', '0106475648', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1705090740', '', '1', '2024-04-25 05:23:49'),
(174, '4isg600v', 'Google', '38c7701f409a2c34', 'Ahmed Elziaty', 'ahmedelziaty94@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GguayUWXlrrIcW_l01jL8kVxFg8W2ldvaJ2BUOF=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1643583900', '5pLYSH2nqBeJ2JMpLFh8YpixjdM2', '1', '2024-04-25 05:23:49'),
(324, 'ob3b2wsi', 'Normal', '', 'ahmet', 'ahmet@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '5071515151', '19947_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1684697220', '', '1', '2024-04-25 05:23:49'),
(177, 'mzbekcis', 'Normal', '7d991389fef64c60', 'auham', 'aiham.saleh@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0971544729798', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1646177220', '', '1', '2024-04-25 05:23:49'),
(190, '3up3d8bz', 'Normal', '57bcec1680378a2d', 'ajay', 'ajay@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '7985948361', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1649836800', '', '1', '2024-04-25 05:23:49'),
(473, 'kvxjyu7p', 'Google', '0', 'Alexis Carter', 'alexiscarter.00472@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/ACg8ocIzPL6hQAVc9AeAcLxDNijoyzV55rpJlwV0GSd0z5JI=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1711688340', 'OxUlDDlIhgdqTUVOtFeWiCEgXKl1', '1', '2024-04-25 05:23:49'),
(209, '3e5mmzdh', 'Normal', 'e15c5d1f02e675d3', 'dssn', 'alexwestley@btinternet.com', 'e10adc3949ba59abbe56e057f20f883e', '07999562312', '27102022070442_91755.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1666877400', '', '1', '2024-04-25 05:23:49'),
(322, '7jn06vqp', 'Google', '', 'Alex Westley', 'alexwestleygb@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZn_RfCpM-SYwod90-D6UMQo8u5xmHrO-3Xk3q2=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1684321620', 'OSpW29y4iuYZW8YQzxRNgOdTtMf2', '1', '2024-04-25 05:23:49'),
(306, 'w6gkmohb', 'Google', '', 'Ali Terani', 'aliterani76@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZCOY7byLdwbT4L_kLB8uLyCpJaPjc5mU3BPaCSZA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1678722780', '7fJuwxiv6Ne06ZhP6StZ17l9w7W2', '1', '2024-04-25 05:23:49'),
(281, 'ekydkj3u', 'Google', '', 'Vocsy ? ', 'allvocsy@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '9632587410', '42881_userimage.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1674448920', 'ZlY4BCR2VKY0iCpqzWqpcwGMQb63', '1', '2024-04-25 05:23:49'),
(472, 'bmevm2s7', 'Google', '0', 'Female Allvocsy', 'allvocsyfemale@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/ACg8ocKzZtGzVe8RFFz7g2mEXsCQFjQmnzCOD2h4CF8o9Wdn=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1711631940', 'XNOhTChP8bPmLFOwe55PODPCHU73', '1', '2024-04-25 05:23:49'),
(150, 'fsx6rwop', 'Normal', 'cde148c980d44bb3', 'alsahley', 'alsahley@hotmail.com', '4297f44b13955235245b2497399d7a93', '123456789709', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629222840', '', '1', '2024-04-25 05:23:49'),
(289, '8yoqp5rn', 'Normal', '', 'ami', 'ami@gmail.com', '202ab6466c1b65fef5ecfbc7bde9b439', '1478523690', '90851_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1675234380', '', '1', '2024-04-25 05:23:49'),
(300, '2nu4my7k', 'Google', '', 'Angelo Jackson', 'angelojackson.30459@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp6YmSABw5UcJVSl7R9gvT2UAlUXalAFJJekjAd_=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1676588940', 'aoIlm0YUeMhDvPWwkzRHs8TeOS43', '1', '2024-04-25 05:23:49'),
(187, 'vofpnt74', 'Google', '7df19c012e665651', 'ANIL TAMIC', 'anyltamych007@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14Gj3znfmogk_KgMYDkrWsTt2QEe9bDrPaVoHKTTZSA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1649360820', 'kTHxVymAEjWYDpUQ8zIhGXg6Zxx1', '1', '2024-04-25 05:23:49'),
(166, 'jmf68nug', 'Google', 'afe3529a9ac279b5', 'UG Stream', 'app.beeetv@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GifKD--Rf9aDZO827gFlMgNI2CLvjjHkdDvA50s=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1634483340', 'aCWpFOXABsWhW21NEUGq4hKTHqD2', '1', '2024-04-25 05:23:49'),
(162, 'y6aoq42n', 'Google', '4ef70b1357ea5099', 'Артем Лакунов', 'artemlakunov@gmail.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJxDusGHZAu9DR8T2WTt4wqJ9BeS601RMv86NzCA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1631915940', 'lhAaAFHJpufrcgnSveUhCHRkPV43', '1', '2024-04-25 05:23:49'),
(325, 'pbon872e', 'Normal', '', 'sadasd', 'asdas@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '5070000000', '1034_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1685303520', '', '1', '2024-04-25 05:23:49'),
(203, 'mtvoxmat', 'Normal', '84ae7923284c8e0e', 'Avinash', 'avipawar786@gmail.com', '821bba1e4990fd15275a7b420e836f9b', '7028114838', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1660739100', '', '1', '2024-04-25 05:23:49'),
(488, 'gwahqkj6', 'Normal', '', 'bambycasau', 'bambycasau@naver.com', '$argon2i$v=19$m=65536,t=4,p=1$UzRCa29mY3dsNnJmUUFFTw$PVWi+mGqoMl4rGbMlBwZt0nqQrtY2AIWc8ic0Gq9SNQ', '5154620099', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1719238140', '', '1', '2024-06-24 14:09:18'),
(180, 'b0a4eivi', 'Normal', 'eddfafed899764a5', 'hhh', 'bbb@ujhh.com', '25d55ad283aa400af464c76d713c07ad', '00000000000', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1646753760', '', '1', '2024-04-25 05:23:49'),
(106, 'eu065md5', 'Normal', '23bc04d39c550b1d', 'Benjamin', 'benjaminlallianzama17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '09894114341', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1625040240', '', '1', '2024-04-25 05:23:49'),
(92, 'dqqrpv5s', 'Google', '8299de76b92534d0', 'Harari Mix', 'binikud1@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1620915660', 'XqxLJQ7QANNC2dLmTNl5cAR9b6z1', '1', '2024-04-25 05:23:49'),
(163, 'pfxj5rz3', 'Google', 'ad2a05509bb1a846', 'Bernard Kioko', 'bkioko@bernsoft.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJyerErvuqhyIz3gaNiwRGRgyZ0WN-AwwoSZQaGS=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1632846780', 'CgTbtENETISZBMdL1TfrCXBOHIk1', '1', '2024-04-25 05:23:49'),
(182, 'kw6nzbdr', 'Google', 'ed228398a46fbae1', 'Black Africa', 'blackafrica22@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GhQjo_-nXLL4jfwUf61oJLfbM3ANquTysBHwR3EuA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1647854280', 'xUVkKLbtRqev3rvoZatETQn8TWl2', '1', '2024-04-25 05:23:49'),
(448, 'c3iyfihp', 'Normal', '', 'Brian', 'briansdailygrind@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567891', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1702881840', '', '1', '2024-04-25 05:23:49'),
(434, 'vvsqwbci', 'Normal', '', 'burifl', 'burifl@hotmail.ch', '924aa5a90a19f7fbf6056c4e0e28c621', '0782047066', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1693399620', '', '1', '2024-04-25 05:23:49'),
(423, 'tq2wcf3m', 'Google', '0', 'by beta', 'bybeta12@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtdsopTsDkc9a9_3eaOSJPFaB4Tp57qUokWuimdl--XZ=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1690828200', '7vNC1JvNv0cYym3oHgop4zKDJ702', '1', '2024-04-25 05:23:49'),
(456, '4ywsr57i', 'Normal', '', 'abdalla', 'cabdale736@gmail.com', '25eebad11679e4ca633453e17b240e17', '0617578367', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1707057060', '', '1', '2024-04-25 05:23:49'),
(94, 'tuhjc7ez', 'Google', '3fa41d84c0d53930', 'Pawan Kumar', 'celebwala@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '213213321', 0, 0, '1621381140', 'WpUojl9gCihP0g9H8qQcy3UDuyP2', '1', '2024-04-25 05:23:49'),
(461, 'fnf0zarh', 'Normal', '', 'Marcos', 'chillimarcos@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '8295468127', '23022024093146_53751.webp', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 1, '1708704000', '', '1', '2024-04-25 05:23:49'),
(424, 'ievz5rm0', 'Google', '0', 'cloud manager', 'cloudmanager774@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtfkN4LUXn1VL5poDW_yB4gArQRfSbj5YVoWWciHrgSL=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1691207460', 'KsqF9eTC9pWNrQgUZnQMPsoZKpp1', '1', '2024-04-25 05:23:49'),
(318, 'sj485zpz', 'Google', '', 'Cynthesis Labs', 'cynthesislabs@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZZuB6H6e6e0eyGFHAIxSOv0OyzKVVDpaM-5L1R=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1683377940', '2exZznbxVWRFldOk5UJCknIqwjm1', '1', '2024-04-25 05:23:49'),
(339, '4aspc4w5', 'Apple', '14', 'godhani', 'd5t56yg@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '96', '1', '2024-04-25 05:23:49'),
(338, '2h0ovzkh', 'Google', '14', 'godhani', 'd5tyg@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688451780', '96', '1', '2024-04-25 05:23:49'),
(490, 'aqpbkc4q', 'Apple', '0', 'dadams1990', 'dadams1990@icloud.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'bZUD1OsG6KPGse73buo3IrvZaEr2', '1', '2024-08-11 19:51:33'),
(485, '8zuyzz38', 'Google', '0', 'Dan Vasquez', 'danvasquez.74750@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/ACg8ocIJLmylHhN-ST0WrqiLEJQJNWIT2Z9gDiiVN0-CSepxt9im1w=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718954880', 'JCU2Gi3wXRQyFSIWF5DwZpcebLw2', '1', '2024-06-21 07:28:21'),
(155, '6pfwyzg0', 'Facebook', '3b3c9476a0e5f9bc', 'Darshit Dholariya', 'darshitdholariya2611@gmail.com', '', '', 'https://graph.facebook.com/1257128644734924/picture', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629545220', 'S92RUozi3jPDNjn5QNDLFzf8YyU2', '1', '2024-04-25 05:23:49'),
(479, 'qq0s5kct', 'Normal', '', 'demo4567', 'demo4567@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$Y1ZCSzlIeEk0RFBBZGJpNA$vUMR6y72OHSDSVzNTXQ4mtNkzj4uHqv3krZDCvhYnjM', '1234567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718099160', '', '1', '2024-06-11 09:46:26'),
(296, 'hu3nr3v7', 'Normal', '', 'Demo', 'demo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', '75122_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1676365020', '', '1', '2024-04-25 05:23:49'),
(336, 'chwc4dta', 'Normal', '14', 'godhani', 'dg@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9033879227', '60072_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688451720', '', '1', '2024-04-25 05:23:49'),
(450, 't5db0kp5', 'Apple', '0', 'dhq8tkcjbn', 'dhq8tkcjbn@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'DE47xaQyexVo7nowsMl9E7gTxj82', '1', '2024-04-25 05:23:49'),
(313, 'zsnssr6q', 'Google', '', 'Đồng Phước Đức', 'dongphuocducdn1999@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZU_IaSoW6yRe6DC4OKVcC7D1qHauwUl3EJysm4Fg=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1682005080', 'oGcCqhcTXuR3QzGiQFIdjCW9lM93', '1', '2024-04-25 05:23:49'),
(314, '46hrxqic', 'Google', '', 'Hani ALEBEED', 'ebedhani@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxaU-jrWgaf8giTGLJg11f1EbeC0t6wRRGu_cRnUYg=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1682289000', 'xpb28WosbScBwFYFfV6aMmzPtK03', '1', '2024-04-25 05:23:49'),
(449, '02vo7gey', 'Normal', '', 'emil', 'em.memmedov31@gmail.com', '4d476f5427b6d78c62f8a2e0de6bb57e', '0505051398', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1703371920', '', '1', '2024-04-25 05:23:49'),
(204, 'qtvx54b6', 'Normal', 'ebe35afbe6955c90', 'ella', 'emahosa2@gmail.com', '25d55ad283aa400af464c76d713c07ad', '08131235085', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1660777860', '', '1', '2024-04-25 05:23:49'),
(196, 'wjpp0npq', 'Google', '22a1279b6e035edf', 'Fahim Muntasir Vlogs', 'fahimmuntasir8704@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14Gi5Tey9t0VfkhknPmZil_ttBeg8L0fqCWhIhKQ1=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1652068020', 'gCdewpKUR4eanMENc5xY9bGMYNA3', '1', '2024-04-25 05:23:49'),
(283, 'vbicwzdx', 'Normal', '', 'v yhg', 'ftyg@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9632', '86113_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674538020', '', '1', '2024-04-25 05:23:49'),
(328, 'uvtoui7y', 'Apple', '362514', 'godhani', 'g12221g@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '858596', '1', '2024-04-25 05:23:49'),
(329, 'to30macn', 'Google', '362514', 'godhani', 'g221g@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1688451300', '858596', '1', '2024-04-25 05:23:49'),
(158, 'v3mxqckf', 'Normal', '0924e6190a8fa149', 'gff', 'gff@jdjd.com', 'e10adc3949ba59abbe56e057f20f883e', '44123456789', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629619680', '', '1', '2024-04-25 05:23:49'),
(184, 'd6b5wvav', 'Normal', 'eddfafed899764a5', 'hhhh', 'ghh@g.com', 'b7e6923f6de66497d51789db0ef3571d', '3333636663', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1648883580', '', '1', '2024-04-25 05:23:49'),
(437, 'v0ba62mx', 'Normal', '', 'Zjs', 'go@gmail.com', '0dc2d97cbdcab8d4e9a5074c30607d43', '8976464646', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1696488420', '', '1', '2024-04-25 05:23:49'),
(495, 'bp8hpz4x', 'Normal', '', 'googleuser', 'googleuser@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$eFZpNGg4UG9MaVUub05kaw$Nct2NX93abrvxiRiRsqinEODDKw/4aPn/w7dMB3WKjQ', '6185845565', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1734339900', '', '1', '2024-12-16 09:05:48'),
(439, '0mpnj3vb', 'Normal', '', 'Ben', 'goveyabenjamin@gmail.com', '95bb0656664eeece08b6292c1ca08951', '0987553897', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1697040540', '', '1', '2024-04-25 05:23:49'),
(93, 'nye07xsm', 'Google', '8a34be8f9be200c6', 'Michel Graf', 'grafmichel9@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '213213321', 0, 0, '1621141500', 'raXGXlGJHEYlRw3sdP4vGojCsJH3', '1', '2024-04-25 05:23:49'),
(201, 'oxn0n5c3', 'Google', 'c206bb22b5b85a0b', 'gaurav jha', 'grv.jha90@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GjfcMyqzGSehHb7uemsvyGU8TNHCic76-ZZl0VYI0c=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1654776360', 'mAXUtuXpnUYLDJVt14QsJ7q2pE93', '1', '2024-04-25 05:23:49'),
(181, 'x2c3vbrt', 'Normal', 'eddfafed899764a5', 'hhhhhhh', 'h@h.com', '3dbe00a167653a1aaee01d93e77e730e', '0000000000', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1646754480', '', '1', '2024-04-25 05:23:49'),
(193, 'vr6cfv2j', 'Normal', 'cb13d67803780780', 'hhhh', 'h@h.netttt', 'b7e6923f6de66497d51789db0ef3571d', '0953954152', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1650722340', '', '1', '2024-04-25 05:23:49'),
(189, '3odw6pxg', 'Normal', 'eddfafed899764a5', 'hhhh', 'h@h.nnn', 'b7e6923f6de66497d51789db0ef3571d', '0909509579', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1649686740', '', '1', '2024-04-25 05:23:49'),
(186, 'wytqqish', 'Normal', 'eddfafed899764a5', 'bhh', 'h@hhh.com', 'b7e6923f6de66497d51789db0ef3571d', '0000000000', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1649069520', '', '1', '2024-04-25 05:23:49'),
(185, '4i5sdao5', 'Normal', 'cb13d67803780780', 'haha', 'haha@gmai.com', '4f0b36a34946153c358f8b243428a1eb', '4646464646', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1648897380', '', '1', '2024-04-25 05:23:49'),
(286, 'x5dixdsc', 'Normal', '', 'Zeeshan Khan', 'haroonhussain00@gmail.com', 'fe1c7a07ce1b6649a185aeeee9a7e7a1', '+923319157733', '18191_user.jpg', 0, 1, '', '', NULL, 0, 0, '', 0, 0, '1674716580', '', '1', '2024-04-25 05:23:49'),
(265, 'ocwvktwx', 'Google', '', 'Harsh godhani', 'harshgoogle@gmail.com', '', '9636524107', 'https://vocsyinfotech.in/envato/cc/flutter_musicplayer/images/11012023051556_73443.png', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1673437440', 'harsh_2p2ASHoWiqWiEaQ8EKZtIuf3cut22', '1', '2024-04-25 05:23:49'),
(271, 'rfufjh0j', 'Normal', '', 'Harsh Godhani', 'harshnormal_test@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9636524107', '59786_21.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1674108840', '', '1', '2024-04-25 05:23:49'),
(344, 'r6jyuqz6', 'Google', '88887777', 'Harsh_Vocsy', 'harshvocsy1200@gmail.com', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688461140', 'harshvocsyauth', '1', '2024-04-25 05:23:49'),
(346, 'oywj3z6r', 'Apple', '88887777aa', 'Harsh_Vocsy', 'harshvocsy1200aa@gmail.com', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'harshvocsyauthaa', '1', '2024-04-25 05:23:49'),
(345, 'sssbccj2', 'Facebook', '88887777ff', 'Harsh_Vocsy', 'harshvocsy1200ff@gmail.com', '', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688461620', 'harshvocsyauthff', '1', '2024-04-25 05:23:49'),
(347, 'p2bp0a76', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1200nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '47186_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688461920', '', '1', '2024-04-25 05:23:49'),
(350, '3gtwqbvc', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1201nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '37779_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462220', '', '1', '2024-04-25 05:23:49'),
(351, 'v4qgnaqv', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1202nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '74888_11.jfif', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462280', '', '1', '2024-04-25 05:23:49'),
(352, '4ru52tga', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1203nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462640', '', '1', '2024-04-25 05:23:49'),
(353, 'kc3quxu0', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1204nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462700', '', '1', '2024-04-25 05:23:49'),
(354, '72hh6krj', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1205nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462880', '', '1', '2024-04-25 05:23:49'),
(355, '0wkuk8g7', 'Normal', '88887777nn', 'Harsh_Vocsy', 'harshvocsy1206nn@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688463060', '', '1', '2024-04-25 05:23:49'),
(340, 'ogmgs2vq', 'Normal', '14', 'godhani harsh', 'harshvocsy@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '9632365890', '06072023034312_33874.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688452860', '', '1', '2024-04-25 05:23:49'),
(431, 'qayka75o', 'Normal', '', 'hat', 'hatlink30@gmail.com', '80a46b2778f26c30dbd0422fa1fce3a8', '0978921731', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1692813540', '', '1', '2024-04-25 05:23:49'),
(451, 'jm5tun6o', 'Normal', '', 'bdje', 'hdhe@ss.com', '4297f44b13955235245b2497399d7a93', '9513879960', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1703843760', '', '1', '2024-04-25 05:23:49'),
(102, 'eicpdk6e', 'Normal', 'e2c2ceba325ca472', 'hello', 'hellohello@yahooo.com', '4297f44b13955235245b2497399d7a93', '8884294229', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1623244020', '', '1', '2024-04-25 05:23:49'),
(183, '2vfpsxpn', 'Normal', 'eddfafed899764a5', 'hh', 'hh@a.com', '3dbe00a167653a1aaee01d93e77e730e', '00000000000', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1648745340', '', '1', '2024-04-25 05:23:49'),
(465, 'x4c7tf5b', 'Normal', '', 'heyyyZZZihjk', 'hjkhk@gmail.com', '202cb962ac59075b964b07152d234b70', '1234567890', '35356_user.jpg', 0, 1, '', '', NULL, 0, 0, NULL, 0, 0, '1709986020', '', '1', '2024-04-25 05:23:49'),
(481, 'qa672vat', 'Normal', '', 'hyy009988', 'hyy0099880@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$RURiaUVrV0Z6NmlycjVzLw$8Si4S4QpHWeSBhky1AnzCXT/8hnRvfJH0rV7q4DEDsY', '1234567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718101860', '', '1', '2024-06-11 10:31:42'),
(482, 'i4fvdbxc', 'Normal', '', 'hyy00998899', 'hyy00998899@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$Q2pJOVk5a2NtQ1RPZGUwYw$YMPnVnCKr2Vp0QpGTFZ+Ibfwuup1Us+BXSAfIc7moSU', '1234567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718102040', '', '1', '2024-06-11 10:34:42'),
(480, 'tgnteqqq', 'Normal', '', 'hyy009988', 'hyy009988@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$WDBlMllNdnZHVGQuSEMubw$Gikk4/fDmjKvYtMydayCo0fpF6oJ5W4PfEb+C3lE4Po', '1234567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718101860', '', '1', '2024-06-11 10:31:04'),
(466, 'vj4mqobx', 'Normal', '', 'hyyy', 'hyyy@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$Yy5yanh3N1o2UG51MGZxWg$KgdNiTl5phl5pMzwjOJaMFj89Ue+VI6rzxSmSZv/WNM', '9865321740', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710133740', '', '1', '2024-04-25 05:23:49'),
(462, 'vew62hpf', 'Normal', '', 'appie', 'iboapps@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '0612345672', '07032024033023_54349.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1709767980', '', '1', '2024-04-25 05:23:49'),
(444, '88rybtxf', 'Normal', '', 'Infant', 'infantleenas25@gmail.com', 'a0dfcf303d7387a082cb417fb188733d', '7639428125', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1699528320', '', '1', '2024-04-25 05:23:49'),
(170, 'bxtun7wr', 'Google', '9d047ae6da8898a6', 'Ivander Cláudio Madau', 'ivandetmadau28@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GgNO4dN7NsajD2RIpVPXbRDjMvVT0_431MqDIKfoA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1639224180', 'iDpYSyn6L9Zk7ww5zbyrRayiOLu1', '1', '2024-04-25 05:23:49'),
(493, 'pyx7fkd7', 'Apple', '0', 'j5jbgr6c6s', 'j5jbgr6c6s@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'smMaK27Ofeb2ToAyCo2OfcySHnE2', '1', '2024-10-23 00:15:12'),
(428, 'a4gyx6qs', 'Google', '0', 'jako realme5', 'jakorealme@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtc_tb-dGLOeT6u5jfMwTc5OZYY__ef4OqGFQQI4CLf9=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1691852340', 'zdcx4JKOqiSnKRnawyr1hf7Kp7O2', '1', '2024-04-25 05:23:49'),
(298, 'qq40ytck', 'Google', '', 'Janet Hogan', 'janethogan.26039@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp4r05T5zQ-nXhXzaDUk_zHEWAaTb7rIYcZjn8sK=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1676547420', 'ps8Mdvy1PnPxoxvTFrXuOr0HmPg1', '1', '2024-04-25 05:23:49'),
(279, 'qj3ffgsu', 'Normal', '', 'janki', 'janki@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9632585825', '69833_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674197820', '', '1', '2024-04-25 05:23:49'),
(290, 'yyvie8c4', 'Google', '', 'Janki Dobariya', 'jankidobariya3@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp77_QY5b2PuNdFVZm6v9ouTva_SJAlskVWMHE3VGw=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1675254960', 'UwU9mXQowtSZPaevKzj1a9rje673', '1', '2024-04-25 05:23:49'),
(295, 'zbmvd3c8', 'Normal', '', 'jannu', 'januu@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', '1361_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1676094600', '', '1', '2024-04-25 05:23:49'),
(157, '50udbgd5', 'Normal', 'ed954ebdedf435a9', 'dikshit', 'kanani.dikshit@gmail.com', '4297f44b13955235245b2497399d7a93', '1234567890', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629557580', '', '1', '2024-04-25 05:23:49'),
(154, 'c8gayc3z', 'Facebook', '2c33b13207f33a68', 'Kaushik Godhani', 'kaushik64494@gmail.com', '', '', 'https://graph.facebook.com/4625384037519705/picture', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629541440', 'WJHPbHO6XNPygjTiSRuMevGVvYl1', '1', '2024-04-25 05:23:49'),
(149, 'u7ma5n8e', 'Apple', '5E6C27D2-C441-4B75-B1CB-3FC1AF59FCC5', 'kaushik', 'kaushik@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'SgaPgDsKiEcLG4bPi6Jb6xDVnCH3', '1', '2024-04-25 05:23:49'),
(361, 'ae566bng', 'Apple', '74', 'godhani', 'ketan123456789@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '696', '1', '2024-04-25 05:23:49'),
(360, '4n7w4p0v', 'Normal', '74', 'godhani', 'ketan123456@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688463900', '', '1', '2024-04-25 05:23:49'),
(359, 'un48tbjc', 'Google', '74', 'godhani', 'ketan123@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688463840', '696', '1', '2024-04-25 05:23:49'),
(348, 'b3vuzrgs', 'Normal', '1674', 'godhani', 'ketan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '9033879227', '27384_', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688462040', '', '1', '2024-04-25 05:23:49'),
(317, '4f52qas4', 'Normal', '', 'bxns', 'kidding@mail.ru', '25d55ad283aa400af464c76d713c07ad', '9214176255', '65341_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1682576700', '', '1', '2024-04-25 05:23:49'),
(483, 'spectv64', 'Apple', '0', 'kqdh9n5qyy', 'kqdh9n5qyy@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'gjRQsFmTbPRpsqy8yEiEo9QGJN12', '1', '2024-06-13 21:16:00'),
(446, '8kaimwzu', 'Normal', '', 'amine', 'kwaryking@outlook.com', 'e10adc3949ba59abbe56e057f20f883e', '0623456789', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1699914900', '', '1', '2024-04-25 05:23:49'),
(308, '6cfbpf35', 'Google', '', 'Leolee S Gibson', 'leoleegibson2022@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxapG9t4l5nNRH-_sWZDjSrzPrdw_EIVLUZRW5Pm=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1679617800', '7j5e1onP6EY8nPBZuxv3Ig4tDtC3', '1', '2024-04-25 05:23:49'),
(432, 'iie87s5f', 'Apple', '0', 'leoleegibson', 'leoleegibson@hotmail.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'HcUUArDES1YUcqkOPpp5Djxfznp1', '1', '2024-04-25 05:23:49'),
(491, 'psckvoz6', 'Google', '0', 'Wafik Elsayed', 'ligacups@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/ACg8ocLJZ8n0ej14EDebuVJ-N9E3u-8EREAHevrWLBGxmaJYxDKfMg=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1724087220', 'z1sFDiMJbtO6O7T0BM4EBaXx9Wg2', '1', '2024-08-19 17:07:38'),
(458, 'upruxu6i', 'Normal', '', 'Quan', 'luusonba@gmail.com', '7171a0ba48d2d945776006b6fbd4ce5e', '0916158555', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1707196440', '', '1', '2024-04-25 05:23:49'),
(323, '47okcit5', 'Google', '', 'Lykos Daemo', 'lykosdaemo@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxbfrct8_SgWLn2_hho9X-mpA49vKDeqbpkF2hoR=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1684349580', 'UJw9RRwJxLa1XXgN24nTwhurI5t1', '1', '2024-04-25 05:23:49'),
(422, 'osds8qhx', 'Google', '0', 'Lalit Singh', 'mailtolalit21@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtc2Fn146idbyoFbqBA4dqV33Q-_44AKK45fJdoxmRO5cdE=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1690167840', 'bVgU8KDztnYlZdMf4J8NjiQ2m3y2', '1', '2024-04-25 05:23:49'),
(440, 'gokk3fgc', 'Normal', '', 'momo', 'mbhx55@gmail.com', 'b18669b1101578cdc0be139e8b0dda6d', '1620698035', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1697148660', '', '1', '2024-04-25 05:23:49'),
(104, 's60qwyf3', 'Google', '35dc84553cb69f0e', 'Colin Williams', 'members.musiverse@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '213213321', 0, 0, '1624707780', 'bzKePLEdw3dwM1llC0ToiDG3gt33', '1', '2024-04-25 05:23:49'),
(172, 'h4d37hnr', 'Google', 'ccbe582ea9f54f9e', 'Meta Seiha', 'metta.seiha@gmail.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJxrToVTpzrJbh_aSQ_oxzhXbVgDNXb4i6oedeLq=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1640926200', 'MD6mrixqeSeBcerOOb8S7jTyTUZ2', '1', '2024-04-25 05:23:49'),
(175, 'gc8n08xq', 'Normal', 'a4429f938c1c3fc7', 'miki', 'mik.ortho73@yahoo.com', '6a6931d51bb82c89569370541cd02fba', '2064886293', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1643774280', '', '1', '2024-04-25 05:23:49'),
(105, 'brkr2vmt', 'Normal', '373d690b4267ff45', 'Mirawilibass', 'mirawilibass@gmail.com', 'c373f6cd6ee01c5aa3a0a6d9110d4333', '08138859058', '30062021095650_96840.jpg', 0, 0, '', '', NULL, 0, 0, '', 0, 0, '1625026920', '', '1', '2024-04-25 05:23:49'),
(304, 'mr0u8724', 'Normal', '', 'mkamel', 'mkamel0538@gmail.com', '25d55ad283aa400af464c76d713c07ad', '1234567890', '19170_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1678130700', '', '1', '2024-04-25 05:23:49'),
(159, 'yoqdpbqw', 'Normal', '644bcaa524cfc2f6', 'mlwa', 'mlwa3000@gmail.com', 'bb08fc3492208bb88d4f637e806cf056', '12457805335', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1629636360', '', '1', '2024-04-25 05:23:49'),
(173, 'dxdo35wj', 'Normal', '41903b154d19644e', 'mayar kreeshan', 'mohanadkreeshan505@gmail.com', '7beb5af2576475d39bbaa6a85d6e9b4f', '962787982301', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1641426960', '', '1', '2024-04-25 05:23:49'),
(454, 'qcrkkeyn', 'Normal', '', 'murthi', 'msriv1997@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '0767592100', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1705982160', '', '1', '2024-04-25 05:23:49'),
(297, '6y8ag5h0', 'Normal', 'd274dff8e334b414', 'manh', 'ngomanh.dev@gmail.com', 'd66d0150e9461c552b82f1c1b3682935', '0359390326', '77180_', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1676520720', '', '1', '2024-04-25 05:23:49'),
(151, 'vsra3q7k', 'Apple', '2DD153E1-3D87-4147-B3F1-00B5A609D890', 'nikhil', 'nikhil@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'oGKrNeIom6cCm936UWPVJ42qZAg2', '1', '2024-04-25 05:23:49'),
(198, 'uwxuymff', 'Normal', 'b7d15309afc242b2', 'nilima', 'Nilima@gmail.com', '034a00d9d95372ac677c915781ca3bf4', '9922432049', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1653285600', '', '1', '2024-04-25 05:23:49'),
(427, '2ihvxyie', 'Normal', '', 'niraj kumar', 'nirajkumar456@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1691660340', '', '1', '2024-04-25 05:23:49'),
(445, 'egw03vqn', 'Normal', '', 'Nivesh', 'niveshrajssr@gmail.com', '9900a44187adbaf53309c41b7cbddcc8', '9080097998', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1699529880', '', '1', '2024-04-25 05:23:49'),
(100, 'ygerwa4s', 'Google', '379e12c8434dd0c1', 'Nixz Developer Contact', 'nixzdevelopercontact@gmail.com', '', '', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '213213321', 0, 0, '1622707440', 'ZsQwTxfL3hVUkgcIrXpvqHgEJEh2', '1', '2024-04-25 05:23:49'),
(316, 'jqyi0f4t', 'Normal', '', 'bxns', 'nsjs@mail.ru', '25d55ad283aa400af464c76d713c07ad', '9214176255', '32347_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1682576700', '', '1', '2024-04-25 05:23:49'),
(191, 'y3muaaoh', 'Google', 'f14a435fdcf89e88', 'Sami Sami', 'omar.omar.sami.74@gmail.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJzv0cUvWQe641R6_CTE9I_drZ0X4nXw3YH_Dptc=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1650135540', '0LmjZPbbFmPLt62HaW08EBCg0CB2', '1', '2024-04-25 05:23:49'),
(319, '8mzjaoiv', 'Google', '', 'Open Work', 'openwork9090@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', 'nu', 'https://lh3.googleusercontent.com/a/AGNmyxZ8ngrtj-N-AWAnNyXOeIdmgNiHyXZQ6To3bwJe=s96-c', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1683434340', 'lGLduTvmMSd9T2m3I3LqV83cbLB2', '1', '2024-04-25 05:23:49'),
(205, 'q3grgz52', 'Normal', '9a27caa320269b32', 'otavio', 'otavioretamal@me.com', '293a5bc131721a34d0b909af32077a97', '92984758653', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1661005560', '', '1', '2024-04-25 05:23:49'),
(75, 'udjrrwwx', 'Normal', '1c612e77d9098398', 'Nikhil Panseriya', 'panseriya138@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', '57725_user.png', 0, 0, '', '', NULL, 0, 0, '', 1, 1, '1620035040', '', '1', '2024-04-25 05:23:49'),
(433, 'cy3i2utn', 'Normal', '', 'pavan', 'pavankrishnaganta27@gmail.com', '39a6f3945b5602809ba95e07346f111b', '8143567123', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1693331760', '', '1', '2024-04-25 05:23:49'),
(294, '0fg0372g', 'Google', '', 'Pedro Jimenez', 'pedrojimenez.17951@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp5gHjxRsboOZb0Ge9cMeHdun22bFlB4TbEqy15N=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1675492620', 'z5QsmMZAZIQ5zXvNxKaXpxwXwID2', '1', '2024-04-25 05:23:49'),
(419, 'mw8ujy6h', 'Normal', '', 'demo', 'persondemo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '8523697410', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1689153300', '', '0', '2024-04-25 05:23:49'),
(420, 'xa2tuyww', 'Normal', '', 'person', 'personp@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '8523697410', '12072023025246_17920.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1689153480', '', '1', '2024-04-25 05:23:49'),
(315, 'dh0ncxeg', 'Google', '', 'Phuong Phally', 'phuongphally070@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxbz8fOeaLxPawegRLf0wExD1dLfaU1YQlJz0uge=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1682575320', 'LgjKfDX8ePdT6pOeOmNCS3XYSeu1', '1', '2024-04-25 05:23:49'),
(176, 'pd6cc8to', 'Google', 'e15c5d1f02e675d3', 'Alex Westley', 'poetslam.app@gmail.com', '', '', 'https://lh3.googleusercontent.com/a-/AOh14GjOGaAS9moBjXi2n2z2ASBATk48jjMUebukYK-A=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1646124900', 'F8BCClbclvcQSqkqfLfjd8SFEyy1', '1', '2024-04-25 05:23:49'),
(326, 'uh660bfm', 'Normal', '', 'sameer', 'qamber@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '3352521300', '80268_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1685734740', '', '1', '2024-04-25 05:23:49'),
(310, 'ao5yspki', 'Google', '', 'Qanon Army', 'qanoncrew@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZDbvjWZFy7qs8Gn_E-yOYhIV3HiBXwKQy2P1M2NA=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1679623860', 'olXpWuu0xQZqdcPIhIvNKb6xbmh2', '1', '2024-04-25 05:23:49'),
(492, 'wa3vj2mo', 'Apple', '0', 'qbmw6sgcf9', 'qbmw6sgcf9@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'XmGFAyiN6wdwTFt8GfmCW70bmf93', '1', '2024-08-26 03:32:17'),
(447, '26jbk2f2', 'Apple', '0', 'qd6n5fr6br', 'qd6n5fr6br@privaterelay.appleid.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'H7FRTFisvHVMEVWDkcTmE2zYWXP2', '1', '2024-04-25 05:23:49'),
(307, 'hhxhfddu', 'Normal', '', 'raj', 'raj@in.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '9658688888', '44927_Serene-Portrait-in-Sunlight.jpg', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1678953420', '', '1', '2024-04-25 05:23:49'),
(321, 'am0ttwrr', 'Google', '', 'Rakesh Kumar', 'rakesh26jan@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxbwpH7GofaSkjmZSodBjt3NyUm2zmZgXyKNYXQkLg=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1683988200', 'WJGiXXMKpBguC6d3mYyv6PfSsaV2', '1', '2024-04-25 05:23:49'),
(425, 'd00e2tar', 'Google', '0', 'Rudny Alves', 'rudnypc@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTte4NXOmffY8lTUMsh-4b39tgR3QJs1KkRAKyHQlxLqgUav8=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1691209620', 'asItv3wGA5gbHRgyqxUbvd2rA0A2', '1', '2024-04-25 05:23:49'),
(455, 'kb6vxajb', 'Normal', '', 'Roberto', 'rwocads@gmail.com', '5416d7cd6ef195a0f7622a9c56b55e84', '7399371319', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1706066520', '', '1', '2024-04-25 05:23:49'),
(421, 'at4q64jk', 'Google', '0', 'Samo education', 'samoeducationonline@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTteNexrdSr8lZyWZ0w3eRzuyLVw95F8WbtHir8epv6-dnw=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1689600720', 'gth9iiGkcsVqmRcLItHJIi2rkzL2', '1', '2024-04-25 05:23:49'),
(305, '2qceov8z', 'Google', '', 'Samuel Dias da Silva', 'samueldiasviana@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxZe5bm5YCm2gDPgfMGdx-jiBWgG0QgREAt1e-jjZQ=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1678634340', 'WlbZyyIA4SNKEm2vQY0AAG616FS2', '1', '2024-04-25 05:23:49'),
(452, 'vpfnc4tk', 'Normal', '', 'Santosh', 'santhoshreddy8484@gmail.com', '98ddd9feee6dd51b4bf6ac55f7237633', '8497883188', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1703843880', '', '1', '2024-04-25 05:23:49'),
(309, 'hfwjn0mq', 'Normal', '', 'Sarlee', 'sarlee@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '0881369443', '24032023060606_4403.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1679618040', '', '1', '2024-04-25 05:23:49'),
(374, 'cmpeavmy', 'Normal', 'null', 'aniket', 'satanianiket888@gmail.com', '462c3672ff595279a30c1d656002e42f', '3256895623', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1688549100', '', '1', '2024-04-25 05:23:49'),
(277, 'pxa8im0d', 'Google', '', 'Aniket', 'satanianiket@gmail.com', '', '9639639630', '', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674125160', 'KN8phTehJGdaAlA2qlfvn1o1KJR2', '1', '2024-04-25 05:23:49'),
(441, '7ovwx8gk', 'Normal', '', 'sheeq', 'sheequ@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '8568855866', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1698066660', '', '1', '2024-04-25 05:23:49'),
(103, 'p8qisgx0', 'Normal', '4428643ff75cbee7', 'soem', 'soemvannthanmmo@gmail.com', '9181bc712d416f53b30752ce68cc582f', '917875368974', '12062021095433_52668.jpg', 0, 0, '', '', NULL, 0, 0, '', 0, 0, '1623514680', '', '1', '2024-04-25 05:23:49'),
(165, '002ob5ze', 'Normal', '3ec6a51f00a8ae8b', 'Poor Souh', 'souh@mail.com', 'c8837b23ff8aaa8a2dde915473ce0991', '11111111111', '14102021041649_40467.jpg', 0, 0, '', '', NULL, 0, 0, '', 0, 0, '1634164980', '', '1', '2024-04-25 05:23:49'),
(443, 'uooio2af', 'Normal', '', 'srinadh', 'srinadhramadurga@gmail.com', 'f2bed976cfa71e8511da314455d6ad1b', '7696457890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1699438560', '', '1', '2024-04-25 05:23:49'),
(197, 'rr207733', 'Normal', 'F7530DE2-2652-491C-BBD6-BB9F7F0AC731', 'armando', 'Steve@yopmail.com', '25f9e794323b453885f5181f1b624d0b', '6563421578', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1652305260', '', '1', '2024-04-25 05:23:49'),
(426, '2frcorkf', 'Apple', '0', 'sumitnp41', 'sumitnp41@icloud.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'mrPjjgVbREgSwkaW8wFlweWpwqH2', '1', '2024-04-25 05:23:49'),
(471, '24fsw7c8', 'Normal', '', 'Sunil Ghimire', 'sunil@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '9862382486', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710300540', '', '1', '2024-04-25 05:23:49'),
(107, '8q2ymdxu', 'Normal', 'fad706bc27cd932f', 'suriya', 'suriyakalidoss@gmail.com', '60474c9c10d7142b7508ce7a50acf414', '9788483030', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1625528400', '', '1', '2024-04-25 05:23:49'),
(459, 'kue8tw85', 'Normal', '', 'talii', 'talito@gmail.com', '992623d79ac19e57820da7f16cac054c', '0447811447', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1707598200', '', '1', '2024-04-25 05:23:49'),
(460, 'zfsf262o', 'Normal', '', 'kamrej', 'test003@yopmail.com', 'cb45328611c0c2481b763924ab7f4361', '9454046404', '19022024061909_50104.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1708346760', '', '1', '2024-04-25 05:23:49'),
(303, 'sejevtfx', 'Normal', '', 'test1', 'test1@gmail.com', '245cf079454dc9a3374a7c076de247cc', '2536980741', '35371_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1677856080', '', '1', '2024-04-25 05:23:49'),
(301, 'diwio6q0', 'Normal', '', 'test', 'test@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2580369147', '64897_android_meditation.png', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1677665640', '', '1', '2024-04-25 05:23:49'),
(164, 'hdgy5uq6', 'Normal', '9cd1d9507a7cda6b', 'tetsuser', 'test@test.com', '6661987f0da7fcafd3c66a84c2dd3299', '3636363636', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1633631280', '', '1', '2024-04-25 05:23:49'),
(464, 'nt3en374', 'Normal', '', 'test123', 'test@user.com', '202cb962ac59075b964b07152d234b70', '', '73900_user.jpg', 0, 1, '', '', NULL, 0, 0, NULL, 0, 0, '1709974920', '', '1', '2024-04-25 05:23:49'),
(435, 'gym82k3g', 'Normal', '', 'testme', 'testme@huawei.com', '733d7be2196ff70efaf6913fc8bdcabf', '0700885550', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1693862040', '', '1', '2024-04-25 05:23:49'),
(436, 'rr076x4a', 'Normal', '', 'testme', 'testme@yahoo.br', 'c7d74f4e12a2250a86fa5536f90e7ed2', '0662584178', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1696268100', '', '1', '2024-04-25 05:23:49'),
(188, '3ent2w0c', 'Normal', 'eddfafed899764a5', 'Test', 'testo@teste.com', '45fcaeafd8ebec14bece68f7f00ca154', '0909090909', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1649488500', '', '1', '2024-04-25 05:23:49'),
(292, 'fqijxznw', 'Google', '', 'Hacker Men', 'thehackermen8@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp4CVnpk1SbIMPXeSH9G4Uo9rVb5KobBJkwdCIc1=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 1, '1675398060', '4JDKuihcI9Urbqguxrgr46a2ISI3', '1', '2024-04-25 05:23:49'),
(320, '4oj6jscu', 'Normal', '', 'yaroslav227', 'ujhbyybhju@mail.ru', '53bfef360f0c4e9d70cc1e6b262e24f1', 'null', '83585_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1683590760', '', '1', '2024-04-25 05:23:49'),
(161, 'zir25r7w', 'Normal', 'ce105ae878e01d5a', 'userq', 'userq@gmail.com', 'a9709746b03871ff808caa3443047c7f', '8888888888', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1630201440', '', '1', '2024-04-25 05:23:49'),
(312, 'hykqcxcd', 'Normal', '', 'vdemo', 'vdemo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2356897413', '83573_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1680845940', '', '1', '2024-04-25 05:23:49'),
(311, 'b8wfvv0q', 'Google', '', 'Vicky Coleman', 'vickycoleman.20705@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxbdH07bC1hPjrEaVGVmdE0yoneGtZXfEhNnV5lf=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1680397140', 'TgoHdiIYxTP6WmeLy0O0GK3x9F43', '1', '2024-04-25 05:23:49'),
(469, 'kthp8ybb', 'Normal', '', 'vi', 'vinoda1234@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '8956237410', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710216120', '474', '1', '2024-04-25 05:23:49'),
(467, '50gwwh57', 'Normal', '', 'vi', 'vinoda123@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '8956237410', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710134220', '474', '1', '2024-04-25 05:23:49'),
(396, 'su0ft0xy', 'Apple', '0', 'vi', 'vinoda@gmail.com', '', '8956237410', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '1', '1', '2024-04-25 05:23:49'),
(393, 'e73xpbjz', 'Google', '0', 'vinodasodariya0', 'vinodasodariya0@gmail.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1689145320', 'o60sQInEL9TOfHSwaRTTTeIromJ3', '1', '2024-04-25 05:23:49'),
(438, 'qw7tc02t', 'Normal', '', 'vivek', 'vivektank30@gmail.com', '4297f44b13955235245b2497399d7a93', '9408584078', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1696750620', '', '1', '2024-04-25 05:23:49'),
(153, 'v3mj5obc', 'Normal', '5E6C27D2-C441-4B75-B1CB-3FC1AF59FCC5', 'Darshit', 'vocsy.darshit@gmaial.com', 'e10adc3949ba59abbe56e057f20f883e', '1234567890', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1629447300', '', '1', '2024-04-25 05:23:49'),
(89, 'eoo4viea', 'Normal', '1c612e77d9098398', 'Darshit Dholariya', 'vocsy.darshitdholariya@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '12345678', '10082021051202_10742.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1620629820', '', '1', '2024-04-25 05:23:49'),
(486, 'jtjgodhc', 'Apple', '0', 'vocsy.developer', 'vocsy.developer@icloud.com', '', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'IP4Am3y3ZXRdsj3RH0MACcAedts1', '1', '2024-06-21 08:49:33'),
(476, 'bgs4zhmw', 'Normal', '', 'Hello', 'vocsy.wieking@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$WC5EYktqOE9MMHhCenFMUA$rBnPJTXVxW/dH48J8tqbONIHKS4ZQ1dE/sHKHdl7cng', '9988776655', '33348_userimage.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1714536900', '', '1', '2024-05-01 04:15:59'),
(470, 'kcyni2qj', 'Normal', '', 'vocsy00878', 'vocsy00879@gmail.com', '3f07da52024f2c9ce2f6974b8f4295d5', '1235567890', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710221880', '', '1', '2024-04-25 05:23:49'),
(291, '75zinu7f', 'Google', '', 'Vocsy Amisha', 'vocsyamisha@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp5hLf9n6Vbed98bbFfd5JbaD55-uL-yxgKYFyFK=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1675312020', 'exeQZKyyTVXHjFXQ6s1viGMew5w1', '1', '2024-04-25 05:23:49'),
(275, 'mq4qdy5z', 'Google', '', 'Aniket', 'vocsyaniket@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '9632587410', 'https://vocsyinfotech.in/envato/cc/flutter_musicplayer/images/25012023102002_55589.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1674110340', '2p2ASHoWiqWiEaQ8EKZtIuf3cut2', '1', '2024-04-25 05:23:49'),
(288, 'jus0s3c4', 'Google', '', 'Vocsy Developer', 'vocsydeveloper@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp6f3mCHoyeX3L4EUIfpWzVHqdwvCqqonn6mUEysfQ=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674908940', 'NndKE3P7pbf8Zj3JbsOyL08ex7M2', '1', '2024-04-25 05:23:49'),
(494, 'w7g7e607', 'Normal', '', 'Vocsy tester', 'vocsyfacktester@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$akdBS25mamM2N3V0UmNycA$HU8UQInNeopt7zkdQ/mhnWbyE5460xpx6/oiMW5HrZA', '9864868686', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1734157380', '', '1', '2024-12-14 06:23:30'),
(287, 'yeqs34tk', 'Google', '', 'Vinod', 'vocsyinfotech@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '9632589856', 'https://vocsyinfotech.in/envato/cc/flutter_musicplayer/images/28012023100721_420.png', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1674880560', 'ArC0BGbjZuai49svtmjeaXr0WDy2', '1', '2024-04-25 05:23:49'),
(293, '4wtpbsgu', 'Google', '', 'Ipad Vocsy', 'vocsyipad@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp4VXbR446y00P_ssPnwy3Mwn0MFnR7iYFedxpWX=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 1, '1675490160', 'ENeNgVxy2fNnIoNUPOJnJAgH1jT2', '1', '2024-04-25 05:23:49'),
(282, 'xjj7j7dc', 'Google', '', 'jay mangukiya', 'vocsyjay@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp6F6I3_0DuRFO95Z8aqQw0hvcf7t__bsgbcgGa2=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674449820', 'ThLagYBucNbGSChu1gIjShHVqn13', '1', '2024-04-25 05:23:49'),
(299, 'gqyiv237', 'Google', '', 'Vocsy Kanudo', 'vocsykanudo@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AEdFTp4JgsJMcD9ombPC-zPTQckWOZJaZarLak78tdAe=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1676551740', 'FROzaMCqJ2hhuhyyNUasGhJT2tW2', '1', '2024-04-25 05:23:49'),
(468, 'dtockrqu', 'Normal', '', 'vocsy', 'vocsykd@yopmail.com', '2e97fa46d18bbd60053d80f886945eb3', '6434846704', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1710149340', '', '1', '2024-04-25 05:23:49');
INSERT INTO `tbl_users` (`id`, `user_code`, `user_type`, `device_id`, `name`, `email`, `password`, `phone`, `user_image`, `total_followers`, `total_following`, `user_youtube`, `user_instagram`, `confirm_code`, `total_point`, `is_verified`, `player_id`, `is_duplicate`, `is_deleted`, `registration_on`, `auth_id`, `status`, `created_at`) VALUES
(484, '0n0pfbkb', 'Normal', '', 'demo vocsy', 'vocsykenil@gmail.com', '$argon2i$v=19$m=65536,t=4,p=1$M084VHkzRERMN2YwUU80dQ$73gGR5gL1X8E7vHFzIHW7T55Y4h2UrZ+djAX+3KbiKE', '9636524107', '83685_userimage.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1718948700', '', '1', '2024-06-21 05:45:48'),
(285, 'ebdyuxjo', 'Normal', '', 'rinkal', 'vocsyrinkal@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '8488915125', '9639_', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1674539580', '', '1', '2024-04-25 05:23:49'),
(278, 'e2sfxz0a', 'Google', '', 'Samsung ', 'vocsysamsung@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '2365890852', 'https://vocsyinfotech.in/envato/cc/flutter_musicplayer/images/20012023100309_5286.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 1, '1674189000', 'e1SMZ6mKpid9avWynFa1utr01Ln2', '1', '2024-04-25 05:23:49'),
(302, 'yyqi65yj', 'Google', '', 'SamsungA23', 'vocsysamsunga23@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AGNmyxaLfgx9TE26_MYbwC6nPKK0jcR0Bl7N0A_fZjQt=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1677834840', 'dxKjR1vnUvbvzyfkY87tLiE5ssu1', '1', '2024-04-25 05:23:49'),
(362, 'c82d72io', 'Google', '', 'Samsung A51', 'vocsysamsunga51@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtfa1lFOANCq0D0-SqYPddkrtfQiHyrrb9ELQsJ1dM9y=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688464140', '474', '1', '2024-04-25 05:23:49'),
(260, 'aomo5y7x', 'Facebook', '', 'Urvish Vocsy', 'vocsyurvish@gmail.com', '37a6259cc0c1dae299a7866489dff0bd', '', 'https://vocsyinfotech.in/envato/cc/flutter_musicplayer/images/24012023022454_85588.jpg', 0, 0, '', '', NULL, 0, 0, '', 1, 0, '1673412660', 'PtWCJPricuY7o7pBQEHqoHufHc82', '1', '2024-04-25 05:23:49'),
(327, 'v3ovmhrr', 'Google', '', 'Vivo Y12', 'vocsyvivoy12@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtd649uKh4m1iGVh9plsWBnZEpeN8C1v43kJYC00pn2L=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 0, '1688450760', 'aPAkFN2B4UUxdzZXGgtdecSD5qo1', '1', '2024-04-25 05:23:49'),
(192, '6prv2for', 'Normal', '8fc70b8b3ebfc585', 'ggv', 'wazery@gmaim.com', 'e10adc3949ba59abbe56e057f20f883e', '01111568425', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1650491520', '', '1', '2024-04-25 05:23:49'),
(160, '3t25e5nf', 'Normal', 'ab487e4b105c1513', 'mostaf', 'wpyar.cohm@gmail.com', '3121cd2ff24a8aea5861c70ceed1ebb2', '09137749591', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1630002660', '', '1', '2024-04-25 05:23:49'),
(207, 'sjbc8k2h', 'Normal', '40d4510ecc6d097c', 'hshbs', 'xx@pk.com', '827ccb0eea8a706c4c34a16891f84e7b', '1234567890', NULL, 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1662649080', '', '1', '2024-04-25 05:23:49'),
(146, 'wbdpx4k2', 'Facebook', '123456', 'kaush', 'xyz102@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, '', 1, 1, '1629203460', 'vocsy_facebook', '1', '2024-04-25 05:23:49'),
(363, 'y02kr6vr', 'Google', '', 'godhani', 'xyzdemo111@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 1, 0, '1688464920', '6', '1', '2024-04-25 05:23:49'),
(365, '4nz6mbau', 'Apple', '', 'godhani', 'xyzdemo123@gmail.com', '', '9033879227', '', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', '6', '1', '2024-04-25 05:23:49'),
(199, 'dx32msuk', 'Google', '84840592-B6C8-47E2-A60E-64E623C7EC25', 'YOUNES ATTAR', 'younes.attar@finatechsystems.com', '', '', 'https://lh3.googleusercontent.com/a/AATXAJxFKNO4_UkgJD5ysgS4jM837hq6-HcLP5Je6PAj=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, '', 0, 0, '1654208040', '5bfyxkS35SPUMKvHyEXM4ehMln53', '1', '2024-04-25 05:23:49'),
(429, '4c7z3658', 'Google', '0', 'Zaac William', 'zaacwilliam@gmail.com', '', 'null', 'https://lh3.googleusercontent.com/a/AAcHTtdZ4qbIHQ7v91bTYhVBEEv_MeK9TTvoXcUGwLpPPYer=s96-c', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '1691971560', 'bedveBPdUGQbRSRmauPT9JKv5VC3', '1', '2024-04-25 05:23:49'),
(478, 'mep3mhtq', 'Apple', '0', 'zx42kcxdyk', 'zx42kcxdyk@privaterelay.appleid.com', '', 'null', '94581_Serene-Portrait-in-Sunlight.jpg', 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '0', 'm74B1bEaRxX2rXX8NXykHqrqGnE2', '1', '2024-06-08 05:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_verify_user`
--

CREATE TABLE `tbl_verify_user` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `document` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `verify_at` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_opened` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_album`
--
ALTER TABLE `tbl_album`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_favorite_artist`
--
ALTER TABLE `tbl_favorite_artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_geners`
--
ALTER TABLE `tbl_geners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_section`
--
ALTER TABLE `tbl_home_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mp3`
--
ALTER TABLE `tbl_mp3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_mp3_views`
--
ALTER TABLE `tbl_mp3_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `tbl_playlist`
--
ALTER TABLE `tbl_playlist`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_smtp_settings`
--
ALTER TABLE `tbl_smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_song_suggest`
--
ALTER TABLE `tbl_song_suggest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_album`
--
ALTER TABLE `tbl_album`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_artist`
--
ALTER TABLE `tbl_artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tbl_banner`
--
ALTER TABLE `tbl_banner`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_favorite`
--
ALTER TABLE `tbl_favorite`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT for table `tbl_favorite_artist`
--
ALTER TABLE `tbl_favorite_artist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_geners`
--
ALTER TABLE `tbl_geners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_home_section`
--
ALTER TABLE `tbl_home_section`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_mp3`
--
ALTER TABLE `tbl_mp3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `tbl_mp3_views`
--
ALTER TABLE `tbl_mp3_views`
  MODIFY `view_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1425;

--
-- AUTO_INCREMENT for table `tbl_playlist`
--
ALTER TABLE `tbl_playlist`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_reports`
--
ALTER TABLE `tbl_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_smtp_settings`
--
ALTER TABLE `tbl_smtp_settings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_song_suggest`
--
ALTER TABLE `tbl_song_suggest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
