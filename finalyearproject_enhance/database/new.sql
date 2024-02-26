-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 18, 2024 at 02:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoping_recommender`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Shopping Malls'),
(2, 'Speciality & Gift Shops'),
(3, 'Flea Markets'),
(4, 'Night Market');

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id` int(11) NOT NULL,
  `place_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_feedback`
--

INSERT INTO `customer_feedback` (`id`, `place_id`, `user_id`, `score`, `created_date`) VALUES
(3, 1, 3, 4, '2024-01-12 03:06:38'),
(6, 2, 3, 5, '2024-01-12 03:06:38'),
(7, 11, 3, 3, '2024-01-12 03:06:38'),
(8, 2, 14, 3, '2024-01-14 01:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `interest` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `name`, `email`, `password`, `type`, `phone`, `address`, `interest`) VALUES
(2, 'Main Admin', 'superadmin@gmail.com', 'admin1234', 1, NULL, NULL, NULL),
(14, 'Bree Powell', 'elit.pellentesque.a@icloud.com', 'admin1234', 2, '1-771-112-2885', 'Ap #821-1419 Erat, Ave', '[\"Speciality & Gift Shops\",\"Flea Markets\",\"Night Market\"]');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL,
  `primary` longtext DEFAULT NULL,
  `secondary` longtext DEFAULT NULL,
  `tertiary` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `primary`, `secondary`, `tertiary`) VALUES
(41, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRZwtfX1AjZnWM94vF472AZJqGmG_7bfoTqg&usqp=CAU', 'https://www.yelp.com/biz_photos/plaza-arkadia-kuala-lumpur?select=l4vp_tM2Y5XGQNxDIaH62A', 'https://www.propsocial.my/developments/plaza-arkadia-4626/shop-for-rent-by-emmawongyx16-1392595'),
(42, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL7Q5i1nFwkxo-MNgy2JaxMNqKJmfrbirmdA&usqp=CAU', 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Quill_City_Mall_Kuala_Lumpur_-_panoramio_%286%29.jpg', 'https://www.placesandfoods.com/2015/01/quill-city-mall-review.html'),
(44, 'https://s3-media0.fl.yelpcdn.com/bphoto/wc0DylKCSwh50zPlq2PPAg/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/nOIJK4JaN19LjbSge_xkzQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/J3Da8ZFZtx5Z9lotr_94lQ/348s.jpg'),
(45, 'https://s3-media0.fl.yelpcdn.com/bphoto/zCWlyIb4Wqvp-HavKAI3iQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/p2JjbGlOKV0-pJk736ZPSw/348s.jpg', 'https://theedgemalaysia.com/_next/image?url=https%3A%2F%2Fassets.theedgemarkets.com%2Faeon-big.png&w=1920&q=75'),
(47, 'https://s3-media0.fl.yelpcdn.com/bphoto/Tno1-v3KUPpfgiS9V5P91Q/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/ooONRhIDfYj91DrVERTZ0w/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/VKkCxDPZshIva8QD7WT-EA/348s.jpg'),
(50, 'https://s3-media0.fl.yelpcdn.com/bphoto/sKAHxHHpnD5seqVaipYo3Q/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/UGD-6hAGnQzPrG6V0KASCg/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/Tno1-v3KUPpfgiS9V5P91Q/348s.jpg'),
(52, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg7PKdgHOipTWN4_XhI9FGFD7u3XbY42NB431wfqcjlRMfokqk4CGdEV0MqG07pFuLIDU&usqp=CAU', 'https://livelifelah123.files.wordpress.com/2017/12/20171126_130430-1152x864.jpg', 'https://d5dkjitd3iude.cloudfront.net/eyJidWNrZXQiOiJ3d3cudGhlZWRnZXByb3BlcnR5LmNvbS5teSIsImtleSI6InMzZnMtcHVibGljXC8xMDIzNzBfMTY3MTYwMDM3MV81RWRnUHJvNV9hbWNvcnAxMV8wLmpwZyIsInZlcnNpb24iOiIxIiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6Im91dHNpZGUiLCJoZWlnaHQiOjcyMH0sIlRFUFdhdGVybWFyayI6eyJvcHRpb25zIjp7Im5hbWUiOiJLRUxMWSBMT1ciLCJncmF2aXR5Ijoic291dGhlYXN0In19fX0='),
(55, 'https://s3-media0.fl.yelpcdn.com/bphoto/UqG31yRfnXaZkVPTCmz45g/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/Q6GGuwhWjjPfwyqyVm-fpg/348s.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlsw2IFOVOeAT8Br8KIq-ablffwrp_bzFCg7-7JdnhF6u2mdcgfxNKJtoQVjCapH1L2_s&usqp=CAU'),
(56, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCOSJ6ntmfkPmnFSp2is5TxvSUONY6rjLt5A&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ67Nn7jKl5oYkA7inwKqWTGEpq4MstEtsFow&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWSyA1dvSJ1RQHicuxR0n19xMsJjTyP-czmQ&usqp=CAU'),
(57, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9TIEtepv2_UY1cRIvzRAiMsmMOKKvGiHZbw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRZwtfX1AjZnWM94vF472AZJqGmG_7bfoTqg&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdlMrgJX8yY05ej3AH-_R9nVK0VOpX0bMbvQ&usqp=CAU'),
(58, 'https://s3-media0.fl.yelpcdn.com/bphoto/1MidyBY7PUzs25y6ybg1Ug/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL7Q5i1nFwkxo-MNgy2JaxMNqKJmfrbirmdA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxYNm-HbEnQ1Eet6UCdl8MGZcPEpvHqPg8EvpdqLPbywkdEeXyswZ20iE2KqIO3ZxT0U&usqp=CAU'),
(59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZlZQIv3zk6imjY9ZlW3cR02sZDDJ5aE8sknkHj7eyH4Oy485rdDVD_ehzl0UchDgxiUc&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCMnhA6yCrHnP7PBmr0pE3pECt_HtT8YBJEA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsl0SWl4XIih3-LGEh1D0t2_Dmd7AsxjoFAg&usqp=CAU'),
(60, 'https://s3-media0.fl.yelpcdn.com/bphoto/8ok56XqHNFN7EI7FXbaZeQ/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBhUv_zzWY_OaYt4vzrV-VRT8VAvDws5o1xQ&usqp=CAU', 'https://www.yelp.com/biz_photos/plaza-arkadia-kuala-lumpur?select=l4vp_tM2Y5XGQNxDIaH62A'),
(61, 'https://s3-media0.fl.yelpcdn.com/bphoto/ZbWJ2oZQUdFocsXv9XhLiw/o.jpg', 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Quill_City_Mall_Kuala_Lumpur_-_panoramio_%286%29.jpg', 'https://d5dkjitd3iude.cloudfront.net/eyJidWNrZXQiOiJ3d3cudGhlZWRnZXByb3BlcnR5LmNvbS5teSIsImtleSI6InMzZnMtcHVibGljXC8xMDIzNzBfMTY3MTYwMDM3MV81RWRnUHJvNV9hbWNvcnAxMV8wLmpwZyIsInZlcnNpb24iOiIxIiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6Im91dHNpZGUiLCJoZWlnaHQiOjcyMH0sIlRFUFdhdGVybWFyayI6eyJvcHRpb25zIjp7Im5hbWUiOiJLRUxMWSBMT1ciLCJncmF2aXR5Ijoic291dGhlYXN0In19fX0='),
(62, 'https://s3-media0.fl.yelpcdn.com/bphoto/Qg0ZKUwjdUoeFBMld5Ifew/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4_O7eDIlR7etNrlCs73sXOTIuyNPR038oQ&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiQd_a90mTlAi8nwIpf_B_PwlFI83LXYxjGQ&usqp=CAU'),
(63, 'https://s3-media0.fl.yelpcdn.com/bphoto/klGtd4EHpwZeyz5_wCp1wA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/z9w-7eAEzrZ11LUGtXVVdw/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/NbZwcrFltlazm5qGVSt6rQ/o.jpg'),
(64, 'https://s3-media0.fl.yelpcdn.com/bphoto/4AleH5YoolFMyTyLa2vnfA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/30cFIaqsto71f_HCfUmBhA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/u985zPXXddRKTsrJvEri9Q/o.jpg'),
(65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi8dpP-hbPzeBFtBQIPR1iVuwu5hWRKDvduA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2lV9ExA1NWhBiHdogZ_k5opKbuvu78M0xg&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZIZQ6ZkUb4PADGc5lnVHykVqL6GJwkMt_Mw&usqp=CAU'),
(66, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS61hsTvg8GHQcI6NnzaFvt-Bqk-oHdHHmDrQH0G3zIxlCznGF8yNyGWa_ahWXZmkebXh0&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvvbJ3y3lyWbruAU2jFjeyUj1QUD8LNr_3Okf9IwjkoIXrkw_wvSbmMk9hNCJI2dt6htw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl1PLuhFyt8eR3fWVReVslfpCD_XNMMeOlOzBJeJrwfi2p4vwGFSlI34-Jcw2q4L_qT-s&usqp=CAU'),
(67, 'https://s3-media0.fl.yelpcdn.com/bphoto/CFU2uauIwMFE1MOg_C4HCA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/-iMihcoBHffqw4vHB31pAQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/bFKLSUElWNYCEOB5twZB2Q/o.jpg'),
(68, 'https://static.wixstatic.com/media/189d04_a5f143e782af4c678e8c5a0b7c1aded2~mv2_d_1920_1289_s_2.jpg/v1/fit/w_290,h_195,q_90/189d04_a5f143e782af4c678e8c5a0b7c1aded2~mv2_d_1920_1289_s_2.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL3XRBkS81ODJsMezht-1L1dS33cWPoOUl7WJ0j25Z57HRoKNjyT9M9EuM2AYkFHKMhBM&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDzvvPjT4TyG9rYnAwXdj7wNWl04lHZZDWzg&usqp=CAU'),
(69, 'https://s3-media0.fl.yelpcdn.com/bphoto/9h4bELBD5zhAXWrQda95YQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/ukxOZjejdIIwks5RItJtcQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/bbKbCcrFfZcdqnk7H_SpRg/o.jpg'),
(70, 'https://s3-media0.fl.yelpcdn.com/bphoto/AjYR81kj9hHWuBAC6d7r4Q/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/73SdQyWHwMQMuigL6fhWxQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/FllxfZ7zMDEAj0MIYia0_Q/o.jpg'),
(71, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy761aeBCC4f4UpqXh2NGsdMxI51M1X7hDKQ&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/RAQD4K9easpHdzGQ2UT1KA/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4KyI9hKC7UT72K6gxT11kffDFzL9wBJUcsg&usqp=CAU'),
(72, 'https://d2dzi65yjecjnt.cloudfront.net/365431.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/x2Rfo9zywI2Q66XlypKwxQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/O9u4OUdNI4R0bVyNIdfovA/o.jpg'),
(73, 'https://s3-media0.fl.yelpcdn.com/bphoto/zljCFkiFxPTPJPsVQPzOog/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/O_mvwyGypikYshth_-WqCA/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/rSVGzuri6URWeoHSq74HWg/348s.jpg'),
(74, 'https://s3-media0.fl.yelpcdn.com/bphoto/ViZZXtz2MMCGWLM9DbWQkQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/OVls9EJijf8Z7TI1CF-JYQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/HeAFPyIuAQ-QWUR7xSHprw/348s.jpg'),
(75, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvK0iCPQGaMTcCd8AzOg_ccwNUlJiNNp9nHA&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/cdos4UYuaNWCCLQxYLo_yA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/nSx4hYQecrw9BB89Y287CA/o.jpg'),
(76, 'https://s3-media0.fl.yelpcdn.com/bphoto/9RT7x_YGD24WOE5pkbez5w/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTZmz21NWTrwaL0UNDUulbXBwALguQD_MY3A&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBveFEWdmEunEYEKmK-WJ4m7_5RSHoYXz9pw&usqp=CAU'),
(77, 'https://s3-media0.fl.yelpcdn.com/bphoto/bhUpYXuaHoVi-JRzamoYnw/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/jROwxKoK0mz1kbZ-pmDvwQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/pf7uW5J6RkcjNPz6a3O13g/348s.jpg'),
(79, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c4/fe/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1'),
(80, 'https://s3-media0.fl.yelpcdn.com/bphoto/wo9WzFfpiEbp6MLmhxZydg/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE1Lp_ej4xKnHYEVd3j3DL812zODcsLCJEIQ&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW9pUrBpkFwXkbmATrHzuJv2P9QOogVpKfSw&usqp=CAU'),
(81, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_FJYh9ghL5LQAXRZA7BDsw__IuyjQZCM3Q&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/LiIFq5K28iNH0HlrGazRYA/o.jpg', ''),
(82, 'https://s3-media0.fl.yelpcdn.com/bphoto/FXp8-OHt3nKk4k9jzMRCVw/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJepoTiXwBkOpCQaSROu4xGb97Ta07iuOGw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJepoTiXwBkOpCQaSROu4xGb97Ta07iuOGw&usqp=CAU'),
(87, 'https://www.holidify.com/images/cmsuploads/compressed/Screenshot2022-10-06at5.39.36PM_20221006174009.png', 'https://www.shutterstock.com/shutterstock/photos/394670389/display_1500/stock-photo-kedah-malaysia-november-haji-ismail-group-or-hig-is-the-biggest-duty-free-complex-394670389.jpg', 'https://www.jomjalan.com.my/wp-content/uploads/2016/03/kompleks-hig.jpg.webp'),
(88, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/ac/e9/d4/img-20161110-wa0059-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/9e/e5/9a/20161113-163738-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/9e/e5/91/20161113-163444-largejpg.jpg?w=1200&h=-1&s=1'),
(89, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/51/5f/a8/mahkota-parade.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/51/5f/9c/mahkota-parade.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/80/5c/19/mahkota-parade.jpg?w=1000&h=-1&s=1'),
(90, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c5/9d/external-facade.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c6/85/similarities-to-johor.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c5/95/external-facade.jpg?w=1200&h=-1&s=1'),
(91, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/ed/df/45/20160101-113437-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/b1/b7/d6/freeport-a-famosa-outlet.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/ff/79/4d/freeport-a-famosa-outlet.jpg?w=1200&h=-1&s=1'),
(92, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/e1/a1/43/mydin-mall-mitc.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/43/ef/9a/locals-mall.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/e1/a1/2a/mydin-mall-mitc.jpg?w=1200&h=-1&s=1'),
(93, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/85/c2/d5/vedro-mall-melaka.jpg?w=1000&h=-1&s=1', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBEzPaoCMCPc7XjQDEnLFDA35YwD63jAcHGKYJiYPNouffDkE7bU1qkAvs_SaHtjPnqjmT9ROf4tTy4w6kNFK3MhcSWJ9l8Qhyphenhyphen-5hnnrOJCPxkgSbWkcgAlykjBWHEW8SIeRq8acYy770i/s1600/st_20170228_hatten283wl1_2971611.jpg', ''),
(94, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e2/e4/dead-mall.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e2/ec/dead-mall.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e3/54/dead-mall.jpg?w=800&h=-1&s=1'),
(95, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/83/33/caption.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/83/30/caption.jpg?w=600&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/80/a7/caption.jpg?w=800&h=-1&s=1'),
(96, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/62/melaka.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/75/melaka.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/82/melaka.jpg?w=1200&h=-1&s=1'),
(97, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/f8/a6/4f/shopfront.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/83/d6/dd/the-honey-peark-milk.jpg?w=1100&h=-1&s=1', ''),
(98, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/02/4a/90/caption.jpg?w=900&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/1a/33/56/market-by-night.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/c6/67/53/photo0jpg.jpg?w=1200&h=-1&s=1'),
(99, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/b1/kee-ann-food-street.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/a9/kee-ann-food-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/f1/kee-ann-food-street.jpg?w=1000&h=-1&s=1'),
(100, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/b5/moschea.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/cb/tempio-buddhista.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/dc/immagine-dentro-il-tempio.jpg?w=1200&h=-1&s=1'),
(101, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/c2/37/c2/razkashmir-crafts.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/c2/37/b5/razkashmir-crafts.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/daodao/photo-o/12/4b/1f/5f/razkashmir-crafts.jpg?w=1200&h=-1&s=1'),
(102, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/ef/d9/50/photo3jpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/5a/c8/dc/handmade-lampshades-at.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/02/39/e7/75/filename-20111214-125307.jpg?w=600&h=-1&s=1'),
(103, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c4/fe/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c5/7d/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c5/66/sixty-3-heritage.jpg?w=1200&h=-1&s=1'),
(104, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/ad/e2/f2/getlstd-property-photo.jpg?w=400&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', ''),
(105, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/9e/jonkers-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/af/jonkers-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1'),
(106, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/dd/a9/06/umyang-batik.jpg?w=1200&h=-1&s=1', '', ''),
(107, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/a2/8f/55/wah-aik-shoemaker.jpg?w=1100&h=-1&s=1', '', ''),
(108, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/d4/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/a7/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/93/inside-melaka-chocolate.jpg?w=700&h=-1&s=1'),
(109, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSylVXatOWoukcpr3Tw81hpALysi49IoW6thw&usqp=CAU', 'https://www.guanhuatseng.com/image/catalog/cc.jpg', 'https://www.guanhuatseng.com/image/catalog/b.jpg'),
(110, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/98/hot-weather-no-problem.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/73/we-have-various-type.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0c/53/8f/located-in-newton-food.jpg?w=1200&h=-1&s=1'),
(111, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/02/28/55/photo1jpg.jpg?w=1200&h=-1&s=1', '', ''),
(112, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/33/1f/25/selling-souvenirs-and.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/95/73/2d/gula-melaka-palm-sugar.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/95/72/f2/coconut-cookies.jpg?w=1200&h=-1&s=1'),
(113, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/02/28/55/photo1jpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/73/we-have-various-type.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1'),
(114, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/d4/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `shopping_name` varchar(255) NOT NULL,
  `state` varchar(266) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `operating` varchar(100) DEFAULT NULL,
  `review` int(11) NOT NULL DEFAULT 0,
  `website` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `image_1` varchar(100) DEFAULT NULL,
  `image_2` varchar(100) DEFAULT NULL,
  `image_3` varchar(100) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `shopping_name`, `state`, `category`, `address`, `operating`, `review`, `website`, `description`, `direction`, `image_1`, `image_2`, `image_3`, `is_active`, `latitude`, `longitude`, `contact_number`) VALUES
(1, 'Mitsui Outlet Park', NULL, 'Factory Outlet', 'Persiaran Komersial, 63000 Sepang, Selangor', '10:00 AM - 10:00 PM', 0, 'https://www.mitsuioutletparkklia.com.my/', 'Popular outlet mall with various brands.', NULL, NULL, NULL, NULL, 1, 2.6834, 101.6591, '+60 3-8959 0101'),
(2, 'Big Bad Wolf Book Sale', NULL, 'Bookstore', 'Various Locations', 'Varies (Event)', 0, 'https://bigbadwolfbooks.com/', 'Annual book fair with massive discounts.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(3, 'Karyaneka', NULL, 'Antique Shop', 'Lot 2.49.00, 2nd Floor, Suria KLCC, 50088 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.karyaneka.com.my/', 'Showcasing Malaysian arts and crafts.', NULL, NULL, NULL, NULL, 1, 3.1588, 101.712, '+60 3-2164 7901'),
(4, 'JPO - Johor Premium Outlets', NULL, 'Factory Outlet', 'Jalan Premium Outlets Indahpura, 81000 Kulai, Johor', '10:00 AM - 10:00 PM', 0, 'https://www.premiumoutlets.com.my/', 'Premium outlet shopping destination.', NULL, NULL, NULL, NULL, 1, 1.5951, 103.6179, '+60 7-661 8888'),
(5, 'Silverfish Books', NULL, 'Bookstore', '32-2, Jalan Telawi, Bangsar, 59100 Kuala Lumpur', '11:00 AM - 7:00 PM', 0, 'http://www.silverfishbooks.com/', 'Independent bookstore with a wide selection.', NULL, NULL, NULL, NULL, 1, 3.1306, 101.6711, '+60 3-2284 4837'),
(6, 'Langkawi Craft Complex', NULL, 'Antique Shop', 'Kompleks Kraf Langkawi, Mukim Bohor, 07000 Langkawi', '9:00 AM - 6:00 PM', 0, 'https://www.kraftangan.gov.my/', 'Traditional crafts and cultural artifacts.', NULL, NULL, NULL, NULL, 1, 6.3157, 99.8549, '+60 4-966 3494'),
(7, 'Jalan Jalan Japan', NULL, 'Factory Outlet', 'Lot 3472-1, Jalan SS23/15, Taman SEA, 47400 Petaling Jaya', '11:00 AM - 8:00 PM', 0, NULL, 'Japanese pre-loved items and collectibles.', NULL, NULL, NULL, NULL, 1, 3.1162, 101.6144, NULL),
(8, 'BookXcess', NULL, 'Bookstore', 'Various Locations', 'Varies (Store Hours)', 0, 'https://www.bookxcessonline.com/', 'Discounted books in various genres.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(9, 'Antique Street', NULL, 'Antique Shop', 'Jalan Sultan Iskandar, 30000 Ipoh', '10:00 AM - 6:00 PM', 0, NULL, 'Row of antique shops in Ipoh.', NULL, NULL, NULL, NULL, 1, 4.595, 101.0834, NULL),
(10, 'Genting Highlands Premium Outlets', NULL, 'Factory Outlet', '69000 Genting Highlands, Pahang', '10:00 AM - 10:00 PM', 0, 'https://www.premiumoutlets.com.my/ghpo', 'Elevated outlet shopping experience.', NULL, NULL, NULL, NULL, 1, 3.3881, 101.7515, '+60 3-6439 1100'),
(11, 'Kinokuniya Bookstore', NULL, 'Bookstore', 'Various Locations', 'Varies (Store Hours)', 0, 'https://kinokuniya.com/', 'International bookstore chain.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(12, 'Junk Bookstore', NULL, 'Bookstore', '78 Jalan Sultan, 50000 Kuala Lumpur', '11:00 AM - 8:00 PM', 0, NULL, 'Quirky bookstore with vintage finds.', NULL, NULL, NULL, NULL, 1, 3.1478, 101.6964, '+60 3-2022 1028'),
(13, 'Annexe Gallery Bookshop', NULL, 'Bookstore', 'Central Market, Jalan Hang Kasturi, 50050 Kuala Lumpur', '11:00 AM - 7:00 PM', 0, 'http://annexegallery.com/', 'Artistic bookstore and cultural space.', NULL, NULL, NULL, NULL, 1, 3.1458, 101.6969, '+60 3-2070 1137'),
(14, 'The Rustic Lanna', NULL, 'Antique Shop', 'B-9-5, Megan Avenue II, Jalan Yap Kwan Seng, 50450 Kuala Lumpur', '11:00 AM - 7:00 PM', 0, NULL, 'Northern Thai antiques and artifacts.', NULL, NULL, NULL, NULL, 1, 3.1622, 101.7176, '+60 17-639 4280'),
(15, 'Factory Mart', NULL, 'Factory Outlet', 'Lot 31, Jalan PJS 11/20, Bandar Sunway, 47500 Petaling Jaya', '10:00 AM - 10:00 PM', 0, NULL, 'Discounts on clothing and accessories.', NULL, NULL, NULL, NULL, 1, 3.0725, 101.6097, NULL),
(16, 'Gerakbudaya Bookshop', NULL, 'Bookstore', '2, Jalan Bukit 11/2, Seksyen 11, 46200 Petaling Jaya', '11:00 AM - 7:00 PM', 0, 'https://www.gerakbudaya.com/', 'Independent bookstore with a focus on arts and culture.', NULL, NULL, NULL, NULL, 1, 3.1096, 101.6418, '+60 3-7957 8342'),
(17, 'Jalan Panggong', NULL, 'Antique Shop', 'Jalan Panggong, 50150 Kuala Lumpur', '10:00 AM - 6:00 PM', 0, NULL, 'Antique shops in the heart of Kuala Lumpur.', NULL, NULL, NULL, NULL, 1, 3.1472, 101.6981, NULL),
(18, 'Melaka Art and Antique Gallery', NULL, 'Antique Shop', '62, Jalan Tokong, 75200 Melaka', '9:00 AM - 6:00 PM', 0, NULL, 'Art and antiques from various periods.', NULL, NULL, NULL, NULL, 1, 2.1969, 102.2483, '+60 16-360 0885'),
(19, 'Borders Bookstore', NULL, 'Bookstore', 'Various Locations', 'Varies (Store Hours)', 0, NULL, 'Bookstore chain offering a wide selection.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(20, 'Time Tunnel Antique Museum', NULL, 'Antique Shop', '39, Jalan Gopeng, 30250 Ipoh', '9:00 AM - 7:00 PM', 0, 'https://timetunnel.my/', 'A journey through Malaysia’s past.', NULL, NULL, NULL, NULL, 1, 4.5949, 101.0911, '+60 12-510 0036'),
(21, 'Queensbay Mall', NULL, 'Shopping Mall', '100 Persiaran Bayan Indah, 11900 Bayan Lepas, Penang', '10:00 AM - 10:00 PM', 0, 'https://www.queensbaymall.com.my/', 'Largest shopping mall in Penang.', NULL, NULL, NULL, NULL, 1, 5.3338, 100.3067, '+60 4-619 8989'),
(22, 'BookXcess @ Gurney Paragon Mall', NULL, 'Bookstore', '163-D, Persiaran Gurney, 10250 Penang', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Bookstore with a view of the sea.', NULL, NULL, NULL, NULL, 1, 5.4376, 100.31, '+60 4-226 9887'),
(23, 'Craft Cultural Complex', NULL, 'Antique Shop', 'Kompleks Budaya Kraf, Jalan Conlay, 50450 Kuala Lumpur', '9:00 AM - 6:00 PM', 0, 'https://www.kraftangan.gov.my/', 'Preserving and promoting Malaysian crafts.', NULL, NULL, NULL, NULL, 1, 3.1507, 101.7157, '+60 3-2162 7533'),
(24, 'Avenue K', NULL, 'Shopping Mall', '156, Jalan Ampang, 50450 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.avenuek.com.my/', 'Modern shopping experience in the heart of KL.', NULL, NULL, NULL, NULL, 1, 3.1591, 101.7136, '+60 3-2168 7888'),
(25, 'Times Bookstore @ Pavilion KL', NULL, 'Bookstore', 'Lot 4.22.00, Level 4, Pavilion KL, 168 Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.timesbookstores.com.my/', 'International bookstore in a luxurious setting.', NULL, NULL, NULL, NULL, 1, 3.1497, 101.7138, '+60 3-2141 8033'),
(26, 'Craft Batik', NULL, 'Specialty & Gift Shop', 'Lot 22, Level 4, Pavilion KL, 168 Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.craftbatik.com/', 'Unique batik products from local artisans.', NULL, NULL, NULL, NULL, 1, 3.1506, 101.714, '+60 3-2148 0150'),
(27, 'Sunway Pyramid', NULL, 'Shopping Mall', '3, Jalan PJS 11/15, Bandar Sunway, 47500 Petaling Jaya', '10:00 AM - 10:00 PM', 0, 'https://www.sunwaypyramid.com/', 'Iconic pyramid-shaped mall with diverse shops.', NULL, NULL, NULL, NULL, 1, 3.073, 101.6055, '+60 3-7494 3100'),
(28, 'Popular Bookstore', NULL, 'Bookstore', 'Various Locations', 'Varies (Store Hours)', 0, 'https://www.popular.com.my/', 'Well-known bookstore with a wide book selection.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(29, 'Penang Time Tunnel', NULL, 'Tourist Attraction', '39, Jalan Green Hall, 10200 George Town, Penang', '9:00 AM - 7:00 PM', 0, 'https://www.penangtimetunnel.com/', 'Interactive museum showcasing Penang’s history.', NULL, NULL, NULL, NULL, 1, 5.4197, 100.3401, '+60 4-261 9116'),
(30, 'Bookalicious @ The Starling', NULL, 'Bookstore', 'T-327, Level 3, The Starling, 6, Jalan SS 21/37, Damansara Utama, 47400 Petaling Jaya', '10:00 AM - 10:00 PM', 0, 'https://bookalicious.com.my/', 'Cozy bookstore in The Starling mall.', NULL, NULL, NULL, NULL, 1, 3.1348, 101.6233, '+60 3-7662 5440'),
(31, 'Pavilion KL', NULL, 'Shopping Mall', '168 Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.pavilion-kl.com/', 'Luxurious shopping destination in Bukit Bintang.', NULL, NULL, NULL, NULL, 1, 3.1484, 101.7134, '+60 3-2118 8833'),
(32, 'MPH Bookstore @ Nu Sentral', NULL, 'Bookstore', 'L2-12 & L2-13, Level 2, Nu Sentral Mall, Jalan Tun Sambanthan, 50470 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.mphonline.com/', 'Bookstore conveniently located in Nu Sentral.', NULL, NULL, NULL, NULL, 1, 3.1357, 101.6861, '+60 3-2276 8033'),
(33, 'Jonker Street Antiques', NULL, 'Antique Shop', 'Jalan Hang Jebat, 75200 Melaka', '10:00 AM - 6:00 PM', 0, NULL, 'Antique shops along the historic Jonker Street.', NULL, NULL, NULL, NULL, 1, 2.1976, 102.2476, NULL),
(34, 'One Utama Shopping Centre', NULL, 'Shopping Mall', '1, Lebuh Bandar Utama, Bandar Utama City Centre, 47800 Petaling Jaya', '10:00 AM - 10:00 PM', 0, 'https://www.oneutama.com.my/', 'Large shopping mall in Bandar Utama.', NULL, NULL, NULL, NULL, 1, 3.1504, 101.615, '+60 3-7710 8118'),
(35, 'Books Kinokuniya @ KLCC', NULL, 'Bookstore', 'Lot 406-408 & 429-430, Level 4, Suria KLCC, 50088 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.kinokuniya.com/', 'Japanese bookstore chain with a view of the Petronas Towers.', NULL, NULL, NULL, NULL, 1, 3.1587, 101.7114, '+60 3-2164 8133'),
(36, 'Craft Complex Kuala Lumpur', NULL, 'Specialty & Gift Shop', 'Jalan Conlay, 50450 Kuala Lumpur', '9:00 AM - 6:00 PM', 0, 'https://www.kraftangan.gov.my/', 'Malaysian crafts and cultural products.', NULL, NULL, NULL, NULL, 1, 3.149, 101.7154, '+60 3-2717 9161'),
(37, 'Mid Valley Megamall', NULL, 'Shopping Mall', 'Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '10:00 - 10:00 PM', 0, 'https://www.oneutama.com.my/', 'One of the largest malls in Malaysia.', NULL, NULL, NULL, NULL, 1, 3.1185, 101.677, '+60 3-7710 8118'),
(38, 'BookXcess @ Starling Mall', NULL, 'Bookstore', 'S-211, Level 2, The Starling, 6, Jalan SS 21/37, Damansara Utama, 47400 Petaling Jaya', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Discounted books in a stylish setting.', NULL, NULL, NULL, NULL, 1, 3.1346, 101.6229, '+60 3-7662 5240'),
(39, 'Chinatown Antique Street', NULL, 'Antique Shop', 'Jalan Petaling, 55100 Kuala Lumpur', '10:00 AM - 6:00 PM', 0, NULL, 'Antique shops in Kuala Lumpur Chinatown.', NULL, NULL, NULL, NULL, 1, 3.1445, 101.6978, NULL),
(40, 'The Mines Shopping Mall', NULL, 'Shopping Mall', 'Jalan Dulang, Mines Resort City, 43300 Seri Kembangan, Selangor', '10:00 AM - 10:00 PM', 0, 'https://www.mines.com.my/', 'Mall with an underground theme park.', NULL, NULL, NULL, NULL, 1, 3.032, 101.722, '+60 3-8949 6333'),
(41, 'Kinokuniya @ The Gardens Mall', NULL, 'Bookstore', 'Lot LG-202 & 203B, Lower Ground Floor, The Gardens Mall, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.kinokuniya.com/', 'Japanese bookstore in a serene garden setting.', NULL, NULL, NULL, NULL, 1, 3.1173, 101.6774, '+60 3-2164 8133'),
(42, 'Craft Haven', NULL, 'Specialty & Gift Shop', 'B-0-15, Plaza Damas 3, 63, Jalan Sri Hartamas 1, Sri Hartamas, 50480 Kuala Lumpur', '10:00 AM - 7:00 PM', 0, 'https://www.crafthaven.my/', 'Handmade crafts and unique gifts.', NULL, NULL, NULL, NULL, 1, 3.1623, 101.6569, '+60 3-6201 2622'),
(43, 'BookXcess @ fahrenheit88', NULL, 'Bookstore', 'Lot 3.01, Level 3, fahrenheit88, 179, Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Discounted books in the heart of Bukit Bintang.', NULL, NULL, NULL, NULL, 1, 3.1477, 101.7121, '+60 3-2148 7887'),
(44, 'Johor Bahru City Square', NULL, 'Shopping Mall', '106-108, Jalan Wong Ah Fook, 80000 Johor Bahru, Johor', '10:00 AM - 10:00 PM', 0, 'https://www.johorcitysquaremall.com.my/', 'Shopping and dining in Johor Bahru.', NULL, NULL, NULL, NULL, 1, 1.4612, 103.7634, '+60 7-226 3668'),
(45, 'MPH Bookstore @ 1 Utama', NULL, 'Bookstore', 'Lot G213B, Ground Floor, 1 Utama Shopping Centre, 1, Lebuh Bandar Utama, Bandar Utama City Centre, 47800 Petaling Jaya', '10:00 AM - 10:00 PM', 0, 'https://www.mphonline.com/', 'Bookstore in the expansive 1 Utama mall.', NULL, NULL, NULL, NULL, 1, 3.1507, 101.615, '+60 3-7727 3253'),
(46, 'Citta Mall', NULL, 'Shopping Mall', '1, Jalan PJU 1A/48, Ara Damansara, 47301 Petaling Jaya, Selangor', '10:00 AM - 10:00 PM', 0, 'https://www.citta.com.my/', 'Neighborhood mall with diverse retail options.', NULL, NULL, NULL, NULL, 1, 3.1183, 101.5797, '+60 3-7660 6992'),
(47, 'Gerakbudaya Bookshop @ Rimbun Dahan', NULL, 'Bookstore', 'Rimbun Dahan, Kilometer 27 Jalan Kuang, 48050 Kuang, Selangor', '11:00 AM - 7:00 PM', 0, 'https://www.gerakbudaya.com/', 'Independent bookstore in an artistic setting.', NULL, NULL, NULL, NULL, 1, 3.3046, 101.6155, '+60 3-6038 5810'),
(48, 'Bentong Walk Night Market', NULL, 'Night Market', 'Jalan Chui Yin, 28700 Bentong, Pahang', '6:00 PM - 11:00 PM', 0, NULL, 'Charming night market in Bentong town.', NULL, NULL, NULL, NULL, 1, 3.5231, 101.9072, NULL),
(49, 'Perdana Botanical Gardens', NULL, 'Park', 'Jalan Kebun Bunga, Tasik Perdana, 55100 Kuala Lumpur', '7:00 AM - 8:00 PM', 0, NULL, 'Lush greenery in the heart of Kuala Lumpur.', NULL, NULL, NULL, NULL, 1, 3.1466, 101.688, NULL),
(50, 'BookXcess @ Tamarind Square', NULL, 'Bookstore', 'Lot 40160-40162, First Floor, Tamarind Square, 63000 Cyberjaya', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Bookstore with a unique forest-like ambiance.', NULL, NULL, NULL, NULL, 1, 2.9322, 101.6622, '+60 3-7733 3310'),
(51, 'Central Market', NULL, 'Shopping Mall', 'Jalan Hang Kasturi, 50050 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.centralmarket.com.my/', 'Cultural and artsy market in the heart of KL.', NULL, NULL, NULL, NULL, 1, 3.1458, 101.6969, '+60 3-2031 0399'),
(52, 'Silverfish Books @ Publika', NULL, 'Bookstore', 'Lot 46, Level G2, Publika Shopping Gallery, 1, Jalan Dutamas 1, Solaris Dutamas, 50480 Kuala Lumpur', '11:00 AM - 7:00 PM', 0, 'http://www.silverfishbooks.com/', 'Independent bookstore in the vibrant Publika Mall.', NULL, NULL, NULL, NULL, 1, 3.1702, 101.6659, '+60 3-6201 7318'),
(53, 'Kota Kinabalu Handicraft Market', NULL, 'Specialty & Gift Shop', 'Jalan Tun Fuad Stephens, 88000 Kota Kinabalu, Sabah', '9:00 AM - 6:00 PM', 0, NULL, 'Market showcasing local handicrafts in Sabah.', NULL, NULL, NULL, NULL, 1, 5.9781, 116.0726, NULL),
(54, 'BookXcess @ Gurney Plaza', NULL, 'Bookstore', '170-G-42A, Plaza Gurney, Persiaran Gurney, 10250 Penang', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Bookstore with a seafront view in Penang.', NULL, NULL, NULL, NULL, 1, 5.4367, 100.3096, '+60 3-5613 1419'),
(55, 'Pasar Malam Taman Connaught', NULL, 'Night Market', 'Jalan Cerdas, Taman Connaught, 56000 Kuala Lumpur', '6:00 PM - 12:00 AM', 0, NULL, 'Popular night market in Cheras, Kuala Lumpur.', NULL, NULL, NULL, NULL, 1, 3.0812, 101.7361, NULL),
(56, 'Kinokuniya @ Suria KLCC', NULL, 'Bookstore', 'Lot 406-408 & 429-430, Level 4, Suria KLCC, 50088 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.kinokuniya.com/', 'Japanese bookstore with a view of KLCC Park.', NULL, NULL, NULL, NULL, 1, 3.1587, 101.7114, '+60 3-2164 8133'),
(57, 'Kuching Waterfront Bazaar', NULL, 'Shopping District', 'Jalan Main Bazaar, 93000 Kuching, Sarawak', 'Varies (Shops)', 0, NULL, 'Waterfront market showcasing local products.', NULL, NULL, NULL, NULL, 1, 1.556, 110.3494, NULL),
(58, 'BookXcess @ SS15 Courtyard', NULL, 'Bookstore', 'Lot G-03A, SS15 Courtyard, Jalan SS15/4G, 47500 Subang Jaya', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Bookstore with a cozy courtyard setting.', NULL, NULL, NULL, NULL, 1, 3.074, 101.5885, '+60 3-5637 7733'),
(59, 'Central Market Annex', NULL, 'Shopping Mall', 'Jalan Hang Kasturi, 50050 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.centralmarket.com.my/', 'Annex to the iconic Central Market in KL.', NULL, NULL, NULL, NULL, 1, 3.1457, 101.6972, '+60 3-2031 0399'),
(60, 'MPH Bookstore @ IOI City Mall', NULL, 'Bookstore', 'L2-03A & 03B, Level 2, IOI City Mall, Lebuh IRC, IOI Resort City, 62502 Putrajaya', '10:00 AM - 10:00 PM', 0, 'https://www.mphonline.com/', 'Bookstore in the expansive IOI City Mall.', NULL, NULL, NULL, NULL, 1, 2.9703, 101.7131, '+60 3-8213 0633'),
(61, 'Jalan TAR (Tunku Abdul Rahman)', NULL, 'Shopping District', 'Jalan Tunku Abdul Rahman, 50100 Kuala Lumpur', 'Varies (Shops)', 0, NULL, 'Historic shopping street in Kuala Lumpur.', NULL, NULL, NULL, NULL, 1, 3.1514, 101.6955, NULL),
(62, 'BookXcess @ Fahrenheit88', NULL, 'Bookstore', 'Lot 3.01, Level 3, fahrenheit88, 179, Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.bookxcessonline.com/', 'Discounted books in the heart of Bukit Bintang.', NULL, NULL, NULL, NULL, 1, 3.1477, 101.7121, '+60 3-2148 7887'),
(63, 'Artisanal Crafts', NULL, 'Specialty & Gift Shop', 'B-0-15, Plaza Damas 3, 63, Jalan Sri Hartamas 1, Sri Hartamas, 50480 Kuala Lumpur', '10:00 AM - 7:00 PM', 0, 'https://www.artisanalcrafts.com/', 'Handcrafted goods from local artisans.', NULL, NULL, NULL, NULL, 1, 3.1623, 101.6569, '+60 3-6201 2622'),
(64, 'Kuala Lumpur Tech Hub', NULL, 'Business Center', 'Lot 40160-40162, First Floor, Tamarind Square, 63000 Cyberjaya', '9:00 AM - 6:00 PM', 0, 'https://www.kltechhub.com/', 'Hub for technology and innovation.', NULL, NULL, NULL, NULL, 1, 2.9322, 101.6622, '+60 3-7733 3310'),
(65, 'Serenity Spa', NULL, 'Spa', 'Level 5, The Gardens Mall, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '11:00 AM - 9:00 PM', 0, 'https://www.serenityspa.com.my/', 'Relax and rejuvenate at Serenity Spa.', NULL, NULL, NULL, NULL, 1, 3.1173, 101.6774, '+60 3-2287 1888'),
(66, 'Sky High Lounge', NULL, 'Bar', 'Level 57, Menara 3 Petronas, Persiaran KLCC, 50088 Kuala Lumpur', '5:00 PM - 1:00 AM', 0, 'https://www.skyhighlounge.com/', 'Sip cocktails with a panoramic view.', NULL, NULL, NULL, NULL, 1, 3.1588, 101.7116, '+60 3-2670 9000'),
(67, 'Petronas Art Gallery', NULL, 'Art Gallery', 'Level 3, Suria KLCC, Kuala Lumpur City Centre, 50088 Kuala Lumpur', '10:00 AM - 7:00 PM', 0, 'https://www.petronasartgallery.com/', 'Explore contemporary art at Petronas Art Gallery.', NULL, NULL, NULL, NULL, 1, 3.1587, 101.7115, '+60 3-2051 7770'),
(68, 'Green Oasis Park', NULL, 'Park', 'Persiaran KLCC, Kuala Lumpur City Centre, 50088 Kuala Lumpur', '6:00 AM - 8:00 PM', 0, NULL, 'A serene park with lush greenery.', NULL, NULL, NULL, NULL, 1, 3.1574, 101.7111, NULL),
(69, 'Techie Bookstore', NULL, 'Bookstore', 'Lot 4.22.00, Level 4, Pavilion KL, 168 Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.techiebookstore.com/', 'Discover the latest tech books.', NULL, NULL, NULL, NULL, 1, 3.1497, 101.7138, '+60 3-2141 8033'),
(70, 'Rainforest Cafe', NULL, 'Cafe', 'Level 3, Sunway Pyramid, 3, Jalan PJS 11/15, Bandar Sunway, 47500 Petaling Jaya', '11:00 AM - 10:00 PM', 0, 'https://www.rainforestcafe.com.my/', 'Enjoy a meal surrounded by nature.', NULL, NULL, NULL, NULL, 1, 3.073, 101.6055, '+60 3-7492 0808'),
(71, 'Central Plaza', NULL, 'Shopping Mall', '156, Jalan Ampang, 50450 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.centralplaza.com.my/', 'Modern shopping experience in the heart of KL.', NULL, NULL, NULL, NULL, 1, 3.1591, 101.7136, '+60 3-2168 7888'),
(72, 'Rooftop Garden Lounge', NULL, 'Bar', 'Level 32, Tower 2, Etiqa Twins, 11, Jalan Pinang, 50450 Kuala Lumpur', '6:00 PM - 1:00 AM', 0, 'https://www.rooftopgardenlounge.com/', 'Chic rooftop lounge with city views.', NULL, NULL, NULL, NULL, 1, 3.1534, 101.7086, '+60 3-2338 8888'),
(73, 'Fashion Haven', NULL, 'Shopping Mall', 'Lot 10, Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.fashionhaven.com.my/', 'Trendy fashion destination in KL.', NULL, NULL, NULL, NULL, 1, 3.1468, 101.7119, '+60 3-2787 1128'),
(74, 'Gastronomy Delight', NULL, 'Restaurant', 'Level 4, Pavilion Elite, 166 Jalan Bukit Bintang, 55100 Kuala Lumpur', '12:00 PM - 10:00 PM', 0, 'https://www.gastronomydelight.com/', 'Culinary delights in a vibrant atmosphere.', NULL, NULL, NULL, NULL, 1, 3.1485, 101.7146, '+60 3-2117 4180'),
(75, 'Glowing Gardens', NULL, 'Park', 'Taman Tasik Perdana, Jalan Kebun Bunga, Tasik Perdana, 55100 Kuala Lumpur', '7:00 PM - 11:00 PM', 0, NULL, 'Magical garden with illuminated displays.', NULL, NULL, NULL, NULL, 1, 3.1357, 101.6868, NULL),
(76, 'Tech Junction', NULL, 'Tech Hub', 'Level 6, Quill City Mall, Jalan Sultan Ismail, 50250 Kuala Lumpur', '9:00 AM - 6:00 PM', 0, 'https://www.techjunction.com.my/', 'Innovation hub for tech enthusiasts.', NULL, NULL, NULL, NULL, 1, 3.1564, 101.6996, '+60 3-2603 3366'),
(77, 'Eco-friendly Bookstore', NULL, 'Bookstore', 'Level 2, The Gardens Mall, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '10:00 AM - 9:00 PM', 0, 'https://www.ecofriendlybooks.com/', 'Explore a collection of eco-friendly books.', NULL, NULL, NULL, NULL, 1, 3.1173, 101.6774, '+60 3-2287 1888'),
(78, 'The Last Bookstore', NULL, 'Bookstore', 'Seventh Floor, Jalan Balai Polis, 50000 Kuala Lumpur', '10:00 AM - 8:00 PM', 0, 'https://www.lastbookstorekl.com/', 'An independent bookstore with a vast collection of new and used books.', NULL, NULL, NULL, NULL, 1, 3.1471, 101.6958, '+60 3-2022 9913'),
(79, 'Cosmic Adventures', NULL, 'Entertainment Center', 'Level 3, Berjaya Times Square, 1, Jalan Imbi, 55100 Kuala Lumpur', '10:00 AM - 8:00 PM', 0, 'https://www.cosmicadventures.com.my/', 'Exciting adventures for all ages.', NULL, NULL, NULL, NULL, 1, 3.1429, 101.7106, '+60 3-2117 3118'),
(80, 'Floral Fantasy', NULL, 'Botanical Garden', 'Level 5, Pavilion Kuala Lumpur, 168 Jalan Bukit Bintang, 55100 Kuala Lumpur', '10:00 AM - 9:00 PM', 0, 'https://www.floralfantasy.com.my/', 'Immerse in the beauty of diverse flora.', NULL, NULL, NULL, NULL, 1, 3.1499, 101.7139, '+60 3-2118 8833'),
(81, 'Urban Retreat Spa', NULL, 'Spa', 'Level 3, Bangsar Shopping Centre, Jalan Maarof, Bukit Bandaraya, 59000 Kuala Lumpur', '10:00 AM - 8:00 PM', 0, 'https://www.urbanretreatspa.com.my/', 'Escape to tranquility at Urban Retreat Spa.', NULL, NULL, NULL, NULL, 1, 3.1413, 101.6679, '+60 3-2287 8833'),
(82, 'Artisan Coffee Collective', NULL, 'Cafe', '32, Jalan Telawi, Bangsar Baru, 59100 Kuala Lumpur', '8:00 AM - 7:00 PM', 0, 'https://www.artisancoffeeco.com/', 'A cozy coffee spot offering artisanal brews.', NULL, NULL, NULL, NULL, 1, 3.1314, 101.6705, '+60 3-2201 7772'),
(83, 'The Retro Factory', NULL, 'Vintage Store', '45, Jalan Doraisamy, 50300 Kuala Lumpur', '11:00 AM - 6:00 PM', 0, NULL, 'Step into the past with a collection of retro finds.', NULL, NULL, NULL, NULL, 1, 3.1675, 101.6942, '+60 3-2856 9222'),
(84, 'Green Oasis Spa', NULL, 'Spa', 'Level 1, Great Eastern Mall, 303 Jalan Ampang, 50450 Kuala Lumpur', '10:00 AM - 9:00 PM', 0, 'https://www.greenoasisspa.com/', 'Relax and rejuvenate in a lush green oasis.', NULL, NULL, NULL, NULL, 1, 3.1597, 101.7291, '+60 3-4257 2451'),
(85, 'Pixel Playhouse', NULL, 'Gaming Lounge', 'Level 4, MyTOWN Shopping Centre, 6, Jalan Cochrane, 55100 Kuala Lumpur', '10:00 AM - 10:00 PM', 0, 'https://www.pixelplayhouse.com/', 'A gaming paradise with the latest consoles and VR experiences.', NULL, NULL, NULL, NULL, 1, 3.1352, 101.7196, '+60 3-2710 5608'),
(86, 'Botanic Eats', NULL, 'Restaurant', 'G-1, Menara Gamuda, PJ Trade Centre, No 8, Jalan PJU 8/8A, Damansara Perdana, 47820 Petaling Jaya', '11:00 AM - 9:00 PM', 0, 'https://www.botaniceats.com/', 'Fresh and flavorful dishes in a botanical-inspired setting.', NULL, NULL, NULL, NULL, 1, 3.1669, 101.6137, '+60 3-2718 8875'),
(87, 'Dreamscape Gallery', NULL, 'Art Gallery', 'Level 3, The Linc KL, 360, Jalan Tun Razak, 50400 Kuala Lumpur', '10:00 AM - 6:00 PM', 0, 'https://www.dreamscapegallery.com/', 'Explore a dreamscape of contemporary art and installations.', NULL, NULL, NULL, NULL, 1, 3.1598, 101.7201, '+60 3-2788 3038'),
(88, 'The Sound Haven', NULL, 'Music Venue', 'Lot G-03, Ground Floor, The Starling, 6, Jalan SS 21/37, Damansara Utama, 47400 Petaling Jaya', '7:00 PM - 2:00 AM', 0, 'https://www.thesoundhaven.com/', 'Immerse in live music and good vibes at The Sound Haven.', NULL, NULL, NULL, NULL, 1, 3.1339, 101.6233, '+60 3-7625 3228'),
(89, 'Heritage Crafts Museum', NULL, 'Museum', 'Jalan Damansara, Kuala Lumpur', '9:00 AM - 5:00 PM', 0, NULL, 'Preserving Malaysia’s rich heritage through traditional crafts.', NULL, NULL, NULL, NULL, 1, 3.139, 101.6795, '+60 3-2022 6882'),
(90, 'Tea Temptations', NULL, 'Tea House', 'Level 2, The Gardens Mall, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '10:00 AM - 8:00 PM', 0, 'https://www.teatempts.com/', 'Savor the finest teas from around the world.', NULL, NULL, NULL, NULL, 1, 3.1173, 101.6774, '+60 3-2287 1888'),
(91, 'Adventure Peak', NULL, 'Outdoor Recreation', 'Level 3, Sunway Pyramid, 3, Jalan PJS 11/15, Bandar Sunway, 47500 Petaling Jaya', '10:00 AM - 7:00 PM', 0, 'https://www.adventurepeak.com.my/', 'An adventure hub for thrill-seekers with various outdoor activities.', NULL, NULL, NULL, NULL, 1, 3.0732, 101.6054, '+60 3-5639 0000'),
(92, 'Sky High Lounge', NULL, 'Bar', 'Level 36, Menara Ken TTDI, 37, Jalan Burhanuddin Helmi, Taman Tun Dr Ismail, 60000 Kuala Lumpur', '6:00 PM - 2:00 AM', 0, 'https://www.skyhighlounge.com/', 'Experience the city lights from a stylish rooftop lounge.', NULL, NULL, NULL, NULL, 1, 3.1532, 101.6224, '+60 3-2771 6692'),
(93, 'Tea Temptations', NULL, 'Tea House', 'Level 2, The Gardens Mall, Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur', '10:00 AM - 8:00 PM', 0, 'https://www.teatempts.com/', 'Savor the finest teas from around the world.', NULL, NULL, NULL, NULL, 1, 3.1173, 101.6774, '+60 3-2287 1888'),
(94, 'Adventure Peak', NULL, 'Outdoor Recreation', 'Level 3, Sunway Pyramid, 3, Jalan PJS 11/15, Bandar Sunway, 47500 Petaling Jaya', '10:00 AM - 7:00 PM', 0, 'https://www.adventurepeak.com.my/', 'An adventure hub for thrill-seekers with various outdoor activities.', NULL, NULL, NULL, NULL, 1, 3.0732, 101.6054, '+60 3-5639 0000'),
(95, 'Beyond Borders Bookshop', NULL, 'Bookstore', 'Level 1, Quill City Mall, Jalan Sultan Ismail, 55100 Kuala Lumpur', '11:00 AM - 8:00 PM', 0, 'https://www.beyondborders.com.my/', 'Discover a world of literature beyond borders.', NULL, NULL, NULL, NULL, 1, 3.1584, 101.6982, '+60 3-2602 2231'),
(96, 'Mystic Melodies Music Studio', NULL, 'Music School', '33, Jalan SS 2/55, SS 2, 47300 Petaling Jaya', '2:00 PM - 9:00 PM', 0, 'https://www.mysticmelodies.com/', 'Unleash your musical talents with expert guidance.', NULL, NULL, NULL, NULL, 1, 3.1185, 101.6208, '+60 3-7865 6320'),
(97, 'Gastronomic Delights', NULL, 'Fine Dining Restaurant', 'Level 8, Pavilion Elite, 166, Jalan Bukit Bintang, 55100 Kuala Lumpur', '6:00 PM - 11:00 PM', 0, 'https://www.gastronomicdelights.com/', 'Elevate your dining experience with exquisite gastronomic delights.', NULL, NULL, NULL, NULL, 1, 3.1484, 101.7141, '+60 3-2110 0666'),
(98, 'Cosmic Comics Corner', NULL, 'Comic Book Store', '17, Jalan Telawi 2, Bangsar Baru, 59100 Kuala Lumpur', '10:00 AM - 6:00 PM', 0, 'https://www.cosmiccomicscorner.com/', 'Embark on adventures through a vast collection of comic books.', NULL, NULL, NULL, NULL, 1, 3.1305, 101.6717, '+60 3-2202 8990'),
(99, 'Floral Fantasy', NULL, 'Flower Shop', '22, Jalan Maarof, Bangsar, 59000 Kuala Lumpur', '9:00 AM - 7:00 PM', 0, 'https://www.floralfantasy.com.my/', 'Breathtaking blooms and floral arrangements for every occasion.', NULL, NULL, NULL, NULL, 1, 3.1319, 101.6717, '+60 3-2287 7660'),
(100, 'Urban Jungle Climbing Gym', NULL, 'Indoor Climbing Gym', 'Level 2, Nu Sentral Mall, Jalan Tun Sambanthan, Brickfields, 50470 Kuala Lumpur', '12:00 PM - 10:00 PM', 0, 'https://www.urbanjungle.my/', 'Climb to new heights in a vibrant urban setting.', NULL, NULL, NULL, NULL, 1, 3.1314, 101.687, '+60 3-2276 1862');

-- --------------------------------------------------------

--
-- Table structure for table `recent_tracker`
--

CREATE TABLE `recent_tracker` (
  `id` int(11) NOT NULL,
  `recent_visit` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recent_tracker`
--

INSERT INTO `recent_tracker` (`id`, `recent_visit`, `user_id`, `timestamp`) VALUES
(4, '30', 3, '2024-01-13 01:26:40'),
(5, '30', 3, '2024-01-13 01:26:41'),
(6, '30', 3, '2024-01-13 01:26:42'),
(7, '30', 3, '2024-01-14 00:05:21'),
(8, '30', 3, '2024-01-14 00:05:23'),
(9, '30', 3, '2024-01-14 00:05:23'),
(10, '30', 3, '2024-01-14 00:07:32'),
(11, '30', 3, '2024-01-14 00:07:33'),
(12, '26', 3, '2024-01-14 00:07:38'),
(13, '30', 3, '2024-01-14 00:07:41'),
(14, '26', 3, '2024-01-14 00:07:52'),
(15, '2', 14, '2024-01-14 01:40:18'),
(16, '2', 14, '2024-01-14 01:40:22'),
(17, '2', 14, '2024-01-14 02:04:31'),
(18, '1', 14, '2024-01-16 15:11:53'),
(19, '23', 14, '2024-01-16 15:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `search_key`
--

CREATE TABLE `search_key` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `search_key`
--

INSERT INTO `search_key` (`id`, `user_id`, `keyword`) VALUES
(5, 14, 'kampug'),
(6, 14, 'Hidden Who');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(1, 'Kuala Lumpur'),
(2, 'Penang'),
(3, 'Langkawi'),
(4, 'Melaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_tracker`
--
ALTER TABLE `recent_tracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_key`
--
ALTER TABLE `search_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `recent_tracker`
--
ALTER TABLE `recent_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `search_key`
--
ALTER TABLE `search_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
