-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 16, 2024 at 04:12 PM
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
-- Database: `travel_shopper`
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
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `shopping_name` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `operating` longtext DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `direction` longtext DEFAULT NULL,
  `image_1` longtext DEFAULT NULL,
  `image_2` longtext DEFAULT NULL,
  `image_3` longtext DEFAULT NULL,
  `is_active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `shopping_name`, `state`, `category`, `address`, `operating`, `review`, `website`, `description`, `direction`, `image_1`, `image_2`, `image_3`, `is_active`) VALUES
(1, 'Pavilion KL', 'Kuala Lumpur', 'Shopping Malls', '168 Jalan Bukit Bintang, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '4160', 'https://www.tripadvisor.com.my/Tourism-g298570-Kuala_Lumpur_Wilayah_Persekutuan-Vacations.html', 'Pavilion Kuala Lumpur is an award-winning shopping mall located in the heart of Bukit Bintang, Malaysia’s shopping paradise. Pavilion Kuala Lumpur brings the best of retail with a nett lettable area of over 1.7 million square feet, 700 stores and 8 themed precincts. The Pavilion Crystal Fountain, a symbol of Malaysia’s diverse culture welcomes visitors to this tourist-friendly destination, surrounded by upmarket hotels and a 10-minute walk from KLCC. Enjoy tourist-centric services such as money changers, ATM machines, currency exchange kiosks, as well as specially curated tours for large groups.', '', NULL, NULL, NULL, 1),
(2, 'Suria KLCC Mall', 'Kuala Lumpur', 'Shopping Malls', '', '10:00 AM - 10:00 PM', '2200', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d456578-Reviews-Suria_KLCC_Mall-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Located in the heart of Kuala Lumpur, Suria KLCC is the most iconic premier shopping destination in Malaysia. A world-class complex of over 1.17 million square feet, it is the place to go for the best shopping, dining and entertainment experience. With more than 300 specialty stores, Suria KLCC offers an exclusive blend of renowned international fashion brands, flagship stores, unique concept stores and more. From the hottest global fashion trends to the latest high-tech home gadgets, you can find it all here under one roof. Take a breather after shopping to relax and catch up with family and friends at the multitude of cafes fronting a 50-acre park and a symphonic water fountain. Or tantalize your taste buds at a myriad of restaurants and 2 food courts offering local and international delights.', 'KLCC • 4 min walk, Kampung Baru • 9 min walk', NULL, NULL, NULL, 1),
(3, 'Hong Kong', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Hang Kasturi, Kuala Lumpur 50050 Malaysia', '10:00 AM - 9:30 PM', '4974', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d450992-Reviews-Central_Market_Kuala_Lumpur-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Known to locals as Pasar Seni, this bazaar houses more than 350 shops retailing traditional goods, art collectibles, local handicrafts, and more. The three zones—Lorong Melayu, Lorong Cina and Lorong India—feature stalls that highlight the three main races in Malaysia. Experience the different cultures and heritage as you browse through the shops. You can also snag unique souvenirs like Borneo pearls, Wau Bulan (a traditional Malay kite), and the quintessential Batik for keepsakes. When hungry, don’t miss trying local hawker fare like nasi kandar, goreng pisang, or ais kacang for a much-needed energy boost.', '\"Pasar Seni • 4 min walk', 'test 1', 'test 1', 'test 1', 1),
(4, 'Sungei Wang Plaza', 'Kuala Lumpur', 'Shopping Malls', '55100 Jalan Bukit Bintang Swp Box No. 009, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '777', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d804144-Reviews-Sungei_Wang_Plaza-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Sungei Wang Plaza which literally means \'River of Gold\' is located in the premier district of Kuala Lumpur\'s Golden Triangle, Bukit Bintang and is one of Malaysia\'s pioneer and top ten shopping malls centrally located at the bustling Jalan Sultan Ismail which house more than 600 tenants and offers a wide array of local and international merchandise, food and beverage outlets at affordable rates.', '\"Bukit Bintang • 2 min walk', NULL, NULL, NULL, 1),
(5, 'SOGO', 'Kuala Lumpur', 'Shopping Malls', '190 Jalan Tuanku Abdul Rahman, Kuala Lumpur 50100 Malaysia', '10:00 AM - 10:00 PM', '642', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d7211856-Reviews-SOGO-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Cosmetics & Fragrances - Fashion - Home Furnishing - Children & Infant Wear - Electronics & Gadgets - Fast Food & Restaurants Tourist Privilege Card: Enjoy additional 5% OFF on any storewide purchase with the Tourist Privilege Card during your stay in Malaysia.', '\"Bandaraya • 3 min walk', NULL, NULL, NULL, 1),
(6, 'Sunway Velocity', 'Kuala Lumpur', 'Shopping Malls', 'Lingkaran SV, Sunway Velocity, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '107', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d12000074-Reviews-Sunway_Velocity_Mall-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Sunway Velocity Mall is earmarked to be the leading retail and lifestyle destination in Kuala Lumpur with its cutting edge architecture, a neo futuristic façade, and a contemporary interior. Easily accessible through major roads and highways, the development is well serviced by public transportation including 1 LRT and 2 MRTs. As one of the main components in Sunway Velocity, the mall comprises of 7 levels and 3 precincts – Market Place, Food Street Food and Commune.', 'Maluri • 6 min walk', NULL, NULL, NULL, 1),
(7, 'Lot 10 Shopping Centre', 'Kuala Lumpur', 'Shopping Malls', '50 Jalan Sultan Ismail, Kuala Lumpur 50250 Malaysia', '10:00 AM - 10:00 PM', '405', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d3522278-Reviews-Lot_10_Shopping_Centre-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Having been a key player and an icon of Bukit Bintang for the past 26 years, Lot 10 is Kuala Lumpur’s foremost trendsetter in fashion, dining and lifestyle. Nestled in the heart of the city, Lot 10 is the focal point for locals and tourists to Meet, Play, #lovelot10. The dynamic, fashion-forward destination offers a trendy digital environment that entertains, excites and engages shoppers. Home to exciting shops, dining outlets and year-round events, Lot 10 offers experiences promoting youthful fun and creativity. The mall houses Isetan Japan Store, the first outside Japan; Malaysia’s first flagship H&M store; the world’s largest apparel retailer ZARA; and Lot 10 Hutong, Malaysia’s first and only local heritage street food village.', '\"Bukit Bintang • 2 min walk', NULL, NULL, NULL, 1),
(8, 'MyTOWN Shopping Centre', 'Kuala Lumpur', 'Shopping Malls', 'Level 3, No.6, Jalan Cochrane, Seksyen 90, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '106', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d12273348-Reviews-MyTOWN_Shopping_Centre-Kuala_Lumpur_Wilayah_Persekutuan.html', 'MyTOWN Shopping Centre , spans the size of 20 football fields and is located in the heart of Kuala Lumpur. Anchor tenants include the biggest IKEA in Malaysia, Golden Screen Cinemas, Village Grocer, H&M, Food Empire, the largest ZARA in Malaysia and the country’s first flagship Best store. Giving respite in the city, are the 2 acre park surrounding MyTOWN, and sunken garden, which will host various outdoor activities and events. Planned with the shoppers in mind, MyTOWN Shopping Centre is segregated by categories, dotted with amenities and diverse F&B outlets, taking customers on a journey the minute they step into the shopping centre. Strategically located at Jalan Cochrane, Kuala Lumpur and will be directly linked to Maju Expressway (MEX) and Cochrane MRT station to ensure seamless connectivity for shoppers and visitors. MyTOWN Shopping Centre is also equipped with more than 6500 parking bays.', '', NULL, NULL, NULL, 1),
(9, 'Batik Boutique', 'Kuala Lumpur', 'Speciality & Gift Shops', '62-1 The Row Jalan Doraisamy The Row, Kuala Lumpur 50300 Malaysia', '9:00 AM - 6:00 PM', '140', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d11671224-Reviews-Batik_Boutique-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Explore the process of Batik or Shibori (tie dye) and become an artist for a day by creating your own patterns and designs in our workshop. You will learn the basics of batik or shibori and explore the process of hand-dyed textiles. At the end, you will take home your own personalised Batik Boutique product. Some product require up to one week for processing, so do let us know if you need your finished product the same day. Join us and learn how to make your own batik products and gifts!', '', NULL, NULL, NULL, 1),
(10, 'Jadi Batek Gallery', 'Kuala Lumpur', 'Speciality & Gift Shops', '30 Jalan Inai Off Jalan Imbi, Kuala Lumpur 55100 Malaysia', '9:00 AM - 5:30 PM', '89', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d1383017-Reviews-Jadi_Batek_Gallery-Kuala_Lumpur_Wilayah_Persekutuan.html', 'One stop batik handicraft centre in Kuala Lumpur. Batik demonstration at workshop everyday. Visitors are also welcomed to create their own batik masterpiece at the batik class. The retail showroom offer a great selection of Malaysian handicraft at good prices.', '', NULL, NULL, NULL, 1),
(11, 'BookXcess', 'Kuala Lumpur', 'Speciality & Gift Shops', 'Lot 2-14 Jalan Bukit Bintang, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '53', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d7291543-Reviews-BookXcess-Kuala_Lumpur_Wilayah_Persekutuan.html', '\"Malaysia\'s favorite bargain bookstore! BookXcess\' mission is to provide an opportunity for everyone to \"\"Read More For Less\"\". We are passionate about books and see it as our mission to provide affordable literature of all sorts; from premium fiction and non-fiction titles to wonderful children\'s books and beautiful coffee table hardcovers. Our books are brand new overstock and overprint books.\"', '\"Bukit Bintang • 3 min walk', NULL, NULL, NULL, 1),
(12, 'Petronas Twin Towers Gift Shop', 'Kuala Lumpur', 'Speciality & Gift Shops', '', '10:00 AM - 10:00 PM', '45', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d9705923-Reviews-Petronas_Twin_Towers_Gift_Shop-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Established in 2006, Queensbay Mall is located in the heart of a prime waterfront development in Bayan Lepas. An ideal shopping destination for locals and tourists, shoppers can explore various local a+I13nd international brands such as Crabtree & Evelyn, Elle, Dressing Paula, Charles & Keith and more.', '\"Kerinchi • 5 min walk', NULL, NULL, NULL, 1),
(13, 'NU Sentral', 'Kuala Lumpur', 'Shopping Malls', '201 Jalan Tun Sambanthan, 50470 Kuala Lumpur, Malaysia', '10:00 AM - 10:00 PM', '25', 'https://www.yelp.com/biz/nu-sentral-kuala-lumpur', 'Herb is the way to life, herb today, herb tomorrow, herb everyday !! Interesting and exciting herb !!!', '\"KL Sentral • 5 min walk', NULL, NULL, NULL, 1),
(14, 'Publika Bazaar', 'Kuala Lumpur', 'Flea Markets', 'Jalan Dutamas 1, Level G2, The Boulevard, Solaris Dutamas No 1, 50480 Kuala Lumpur, Malaysia', '10:00 AM - 10:00 PM', '5', '', '', '', NULL, NULL, NULL, 1),
(15, 'Wangsa Walk Mall', 'Kuala Lumpur', 'Shopping Malls', '1, Jalan Wangsa Delima, 12 Wangsa Maju, 53300 Kuala Lumpur, Malaysia', '10:00 AM - 10:00 PM', '5', 'https://www.yelp.com/biz/wangsa-walk-mall-kuala-lumpur', '', '', NULL, NULL, NULL, 1),
(16, 'The intermark Mall', 'Kuala Lumpur', 'Shopping Malls', '348 Jalan Tun Razak, 50400 Kuala Lumpur, Malaysia', '10:00 AM - 10:00 PM', '2', 'https://www.yelp.com/biz/the-intermark-mall-kuala-lumpur?hrid=xHmkU1oDlFVHQmhUrTgsiA', '', '', NULL, NULL, NULL, 1),
(17, 'Ampang Park', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Ampang Kampung Baharu,50450 Kuala Lumpur,Malaysia', '10:00 AM - 10:00 PM', '3', 'https://www.yelp.com/biz/ampang-park-kuala-lumpur', '', '', NULL, NULL, NULL, 1),
(18, 'Ayer Itam Market', 'Penang', 'Speciality & Gift ShopsFlea & Street MarketsFarmers Markets', 'Jalan Air Itam and Jalan Pasar, Air Itam, Penang Island 11090 Malaysia', '5:00 PM - 12:00AM', '84', 'https://www.tripadvisor.com.my/Attraction_Review-g4327677-d8426703-Reviews-Ayer_Itam_Market-Air_Itam_Penang_Island_Penang.html', '', '', NULL, NULL, NULL, 1),
(19, 'Nguni Designs', 'Penang', 'Speciality & Gift ShopsArt GalleriesAntique Shops', '38 Stewart Lane, George Town, Penang Island 10200 Malaysia', '10:30 AM - 9:00 PM', '4', 'https://www.tripadvisor.com.my/Attraction_Review-g298303-d19840227-Reviews-Nguni_Designs-George_Town_Penang_Island_Penang.html', 'It\'s where you could find unique & fascinating genuine & authentic tribal arts (artefacts) from Borneo & South East Asia & also from many African countries to add to your collections. Or you could take home some animal hides/rugs from around the world, of which were obtained from sustainable sources & professionally tanned. None of our hides/rugs are protected/endangered. Do come & visit us!', '', NULL, NULL, NULL, 1),
(20, 'REX Custom Tailor', 'Penang, George Town', 'Speciality & Gift Shops', 'No.8 Jalan Gurdwara, George Town, Penang Island 10300 Malaysia', '12:00 PM - 6:00 PM', '35', 'https://www.tripadvisor.com.my/Attraction_Review-g298303-d16742495-Reviews-REX_Custom_Tailor-George_Town_Penang_Island_Penang.html', 'Award-Winning Tailor in Penang since 1966. We are a Chinese Family-Owned Business and are specialized in crafting the perfect suit. At REX Custom Tailor, we believe in using the power of bespoke, custom-tailored suits to tell a story. You’ll set yourself apart from other well-dressed men, with attire that flatters every angle of your body. To experience the REX difference for yourself, give us a call or drop by our showroom today. We look forward to showing you what the perfect suit looks like and feels like soon.', '', NULL, NULL, NULL, 1),
(21, 'Queensbay Mall', 'Penang', 'Shopping Malls', '100 Persiaran Bayan Indah, Bayan Lepas, 11900, Penang, MALAYSIA', '10:30 AM - 10:00 PM', '', 'https://www.mypenang.gov.my/all/directory/1178/?lg=en', 'Established in 2006, Queensbay Mall is located in the heart of a prime waterfront development in Bayan Lepas. An ideal shopping destination for locals and tourists, shoppers can explore various local and international brands such as Crabtree & Evelyn, Elle, Dressing Paula, Charles & Keith and more.', '', NULL, NULL, NULL, 1),
(22, 'Penang Batik Factory & Showroom', 'Penang', 'Speciality & Gift Shops', '651, Mk.2 Teluk Bahang, Teluk Bahang, 11050, Penang, MALAYSIA', '9:00 AM - 5:30 PM', '106', 'https://www.mypenang.gov.my/food-lifestyle/directory/1170/?lg=en', 'Established in 1973, Penang Batik Factory specialises in hand-drawn batik and hand-block printed batik in floral motifs.', '', NULL, NULL, NULL, 1),
(23, 'Gurney Paragon Mall', 'Penang', 'Shopping Malls', 'Persiaran Gurney, George Town, 10250, Penang, MALAYSIA', '10.00 AM - 10.00 PM', '', 'https://www.mypenang.gov.my/food-lifestyle/directory/1133/?lg=en', 'Gurney Paragon is set to be the new premier shopping, entertainment, office and luxury residential address in Penang. It is a mixed development comprising a 700,000 sq ft shopping mall, an office tower, and two high-end residential towers. It is located on Gurney Drive, a beachfront esplanade that enjoys stunning ocean views and cool sea breezes. But most uniquely, it is built around and inspired by the former St. Joseph\'s Novitiate - converted into St. Jo\'s, an area for stylish restaurants and cafes steeped in the architecture of Penang\'s heritag.', '', NULL, NULL, NULL, 1),
(24, 'Batu Ferringhi Night Market', 'Penang', 'Night Market', 'Jalan Batu Ferringhi, Batu Ferringih, 11100, Penang, MALAYSIA', '7:00 PM - 11:00 PM', '', 'https://mypenang.gov.my/food-lifestyle/directory/1108/?lg=en', 'Situated along the Batu Ferringhi stretch, the night market is famed for its medley of souvenirs, t-shirts, handbags and accessories.', '', NULL, NULL, NULL, 1),
(25, 'Tanjung Bungah Night Market', 'Penang', 'Night Market', 'Jalan Tanjung Bungah, Tanjung Bungah, 11200, Penang, MALAYSIA', '5:30 PM - 10:00 PM', '664', 'https://www.gopenang.my/tanjung-bungah-market/', 'The open air night market in Tanjung Bungah is located right outside the wet market building of the neighbourhood, off the main Tanjung Bungah road. Here, just before the sun sets each Tuesday evening, is where you can find a variety of things from favourite hawker food to clothing. The myriad stalls and vendors give out a cheerful, busy ambience and they will surely tempt you with many flavours and colourful things at very reasonable prices.', '', NULL, NULL, NULL, 1),
(26, 'Cecil Street Market', 'Penang', 'Flea & Street Markets', '24, Lebuh Cecil, George Town, 10300 George Town, Pulau Pinang', '7:00 AM - 7:00 PM', '52', 'https://www.tripadvisor.com.my/Attraction_Review-g298303-d12563692-Reviews-Cecil_Street_Market-George_Town_Penang_Island_Penang.html', 'Located in Lebuh Cecil, the Cecil Street Market is one of the oldest wet markets in Georgetown. The market is also called the 7th Street Market ?????, as it is located seven streets away from the Komtar tower.', '', NULL, NULL, NULL, 1),
(27, 'JYJ Textile', 'Penang', 'Factory Outlets', 'Gat Lebuh Macallum 2-1-19, Ground Floor, Harbour Trade Centre, George Town, Penang Island 10300 Malaysia', '1:30 PM - 5:30 PM', '1', 'https://www.tripadvisor.com.my/Attraction_Review-g298303-d10834947-Reviews-JYJ_Textile-George_Town_Penang_Island_Penang.html', 'JYJ Textile is an established uniform fabric supplier & wholesaler specializing in full range of fabrics, for shirts, blouses, work wear, sportswear, casual wear & other non-apparel uses. We provide uniform cloth fabrics with more than 1,000 variety of color to be choose from. Our product includes a full line of commercial, fashion, government, hospital and varieties of quality textile fabrics.', '', NULL, NULL, NULL, 1),
(28, 'Berjaya Times Square ', 'Kuala Lumpur', 'Shopping Malls', '1 Jalan Imbi, Kuala Lumpur 55100 Malaysia', '10:00 AM - 10:00 PM', '2763', 'https://www.tripadvisor.com.my/Attraction_Review-g298570-d456569-Reviews-Berjaya_Times_Square_Kuala_Lumpur-Kuala_Lumpur_Wilayah_Persekutuan.html', 'Malaysia’s largest inter-city shopping-cum-leisure mall-Berjaya Times Square (BTS) is located in the heart of the city of Kuala Lumpur. This 203-metre-tall tower with 48 floors is a fascinating combination of a hotel, condominium, and shopping center complex with its very own indoor amusement park. The shopping center at Berjaya Times Square has roughly 2,260 stores making it one of the biggest bargain-friendly malls offering a huge variety of goods and accessories. The Berjaya Times Square Theme park has about 14 rides and its very own roller coaster all of which is contained within this glamorous tower. From its very own Berjaya Times Square Hotel to penthouses and budget condominiums, this is currently the eighth tallest twin buildings in Kuala Lumpur and fifth largest in the world by floor area!', '\"Imbi • 2 min walk', NULL, NULL, NULL, 1),
(29, 'Langkawi Craft Complex', 'Langkawi', 'Speciality & Gift Shops', 'Jalan Teluk Yu Mukim Bohor, Langkawi 07000 Malaysia', '10:00 AM - 6:00 PM', '158', 'https://www.tripadvisor.com.my/Attraction_Review-g298283-d455131-Reviews-Langkawi_Craft_Complex-Langkawi_Langkawi_District_Kedah.html', 'Langkawi Craft Complex is one of the major tourist destinations in Langkawi Island. It is one-stop center that serves a variety of authentic craft products such as batik, hand woven cloth, fiber plaited, metals and other crafts. Visit Langkawi Craft Complex, which provide many interesting activities such as craft sales, craft demonstrations, educational crafts, cultural performance and guided tours. Unique architecture with attractive landscaping makes Langkawi Craft Complex as a must-see tourist destination.', '', NULL, NULL, NULL, 1),
(30, 'Langkawi Night Market', 'Langkawi', 'Flea & Street Markets', 'Kuah, Temoyong, Air Hangat, Padang Matsirat Jalan Ulu Melaka Jalan Kedawang, Langkawi 07000 Malaysia', '6:00 PM -11:00 PM', '559', 'https://www.tripadvisor.com.my/Attraction_Review-g298283-d2002332-Reviews-Langkawi_Night_Market-Langkawi_Langkawi_District_Kedah.html', '', '', NULL, NULL, NULL, 1),
(31, 'Cenang Mall', 'Langkawi', 'Shopping Malls', 'Jl. Pantai, Pantai Cenang, Langkawi 07000 Malaysia', '10:00 AM - 10:00 PM', '574', 'https://www.tripadvisor.com.my/Attraction_Review-g1096282-d4810888-Reviews-Cenang_Mall-Pantai_Cenang_Langkawi_Langkawi_District_Kedah.html', '', '', NULL, NULL, NULL, 1),
(32, 'Langkawi Parade MegaMall', 'Langkawi', 'Shopping Malls', 'A-14-15, Pokok Asam, Kuah, Langkawi 07000 Malaysia', '10:00 AM - 10:00 PM', '147', 'https://www.tripadvisor.com.my/Attraction_Review-g1096277-d7935975-Reviews-Langkawi_Parade_MegaMall-Kuah_Langkawi_Langkawi_District_Kedah.html', '', '', NULL, NULL, NULL, 1),
(33, 'Perniagaan Haji Ismail Group Sdn Bhd', 'Langkawi', 'Speciality & Gift Shops', '802, 803 & 804, Jalan Pandak Mayah 2, Pusat Bandar Kuah, Kuah, Kedah, Malaysia', '9:00 AM - 9:00 PM', '', 'https://www.hotels.com/go/malaysia/best-duty-free-outlets-langkawi', 'Perniagaan Haji Ismail Group Sdn Bhd is a great place for visitors and locals to stock up on their favourite confectionery products on Langkawi Island. Located in Kuah Town, you can find chocolates from well-loved brands such as Hershey’s, Cadbury’s, Ritter Sport, Pepero, and Toblerone, which are sold at attractive prices. As with most duty-free outlets in Langkawi, Perniagaan Haji Ismail Group Sdn Bhd also sells imported kitchenware, apparel, bags, and luggage, though choices are rather limited to make way for its extensive chocolate collection.', '', NULL, NULL, NULL, 1),
(34, 'Langkawi Saga Shopping Centre', 'Langkawi', 'Shopping Malls', 'Langkawi Saga Shopping Centre, Jalan Pandak Mayah, Pusat Bandar Kuah, 07000 Langkawi, Kedah', '10:00 AM - 10:00 PM', '', 'https://www.traveloka.com/en-my/destination/landmark/langkawi-saga-shopping-centre-91574324158920', 'One of the biggest shopping centres on the island, Langkawi Saga is a duty-free mall specialised in wines and liquors. They also offer a good choice of chocolate and kitchenware at reasonable prices.', '', NULL, NULL, NULL, 1),
(35, 'Langkawi Fair Shopping Mall', 'Langkawi', 'Shopping Malls', 'Jalan Putra Kuah, Langkawi 07000 Malaysia', '10:00 AM - 10:00 PM', '305', 'https://www.tripadvisor.com.my/Attraction_Review-g298283-d3187509-Reviews-Langkawi_Fair_Shopping_Mall-Langkawi_Langkawi_District_Kedah.html', 'Langkawi Fair Shopping Mall is a great place to shop for a variety of duty-free items on the island. It has several fast food outlets, a food court, money changers, and an information counter for tourists in Kuah. Similar to most duty-free shopping complexes on the island, the shopping mall has electronic items, clothes, cosmetics, perfume, leather products, sportswear, accessories, confectioneries, liquor, and cigarettes.', '', NULL, NULL, NULL, 1),
(36, 'Temoyong Night Market', 'Langkawi', 'Night Market', 'Kampung Lubok Buaya, 07000 Langkawi, Kedah, Malaysia', '6:00 PM - 11:00 PM', '', 'https://www.hotels.com/go/malaysia/best-shopping-langkawi', 'The Temoyong Night Market is one of the most popular street bazaars in Langkawi. It\'s a lively affair filled with local delights, fresh produce, clothes, trinkets, watches, sunglasses, wallets and handbags, paintings, and many other knick-knacks. Well-frequented by foreigners and locals alike, the Temoyong Night Market takes place on Thursday evenings until 11 pm.', '', NULL, NULL, NULL, 1),
(37, 'Teow Soon Huat Duty Free Sdn. Bhd.', 'Langkawi', 'Shopping Malls', 'A-14-15, Pokok Asam, Pulau Langkawi, Kuah, 07000, Langkawi, Kedah Kuah Town, Langkawi 07000 Malaysia', '10:00 AM - 9:30 PM', '12', 'https://www.trip.com/travel-guide/shops/langkawi/teow-soon-huat-duty-free-sdn-bhd-18535213/', 'Teow Soon Huat Duty-Free Shopping houses 60 retail outlets, 12 eateries, and a supermarket. Besides the usual staples of tobacco and chocolates, you can get household commodities, a wide variety of apparel, luggage and bags, as well as groceries.Teow Soon Huat Duty-Free Shopping is one of the most popular shopping venues in Padang Matsirat. It stocks duty-free whiskies from Chivas Regal, Royal Salute, JW Black Label, and Glenfiddich. Imported clothing brands such as U.S. Polo Assn, Dr Cardin, and Santini often offer discounts of up to 70% off original retail prices.', '', NULL, NULL, NULL, 1),
(40, 'Kenangan Mall', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Gelugor 55200 Kuala Lumpur Malaysia', '\"', '10:00 AM - 7:00 PM', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(41, 'Plaza Arkadia', 'Kuala Lumpur', 'Shopping Malls', '3, Jalan Intisari Perdana Desa ParkCity 52200 Kuala Lumpur Malaysia', '24 hours', '2', 'https://www.yelp.com/biz/plaza-arkadia-kuala-lumpur', '', '', 'https://www.yelp.com/biz_photos/plaza-arkadia-kuala-lumpur?select=yGT11K0XE2iE3kKtUAoHzQ', 'https://www.yelp.com/biz_photos/plaza-arkadia-kuala-lumpur?select=l4vp_tM2Y5XGQNxDIaH62A', 'https://www.propsocial.my/developments/plaza-arkadia-4626/shop-for-rent-by-emmawongyx16-1392595', 1),
(42, 'Quill City Mall', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Sultan Ismail Wilayah Persekutuan 55100 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '5', 'https://www.yelp.com/biz/quill-city-mall-kuala-lumpur', '', '', 'https://my.openrice.com/en/klangvalley/article/10-most-talked-about-restaurants-in-quill-city-mall-a731', 'https://upload.wikimedia.org/wikipedia/commons/e/e7/Quill_City_Mall_Kuala_Lumpur_-_panoramio_%286%29.jpg', 'https://www.placesandfoods.com/2015/01/quill-city-mall-review.html', 1),
(43, 'Setapak Central Mall', 'Kuala Lumpur', 'Shopping Malls', '67, Jalan Taman Ibu Kota Taman Danau Kota 53300 Kuala Lumpur Malaysia', '\"', '10:00 AM - 10:00 PM\"', '5', 'https://www.yelp.com/biz/setapak-central-mall-kuala-lumpur', '', '', 'https://en.wikipedia.org/wiki/Setapak_Central#/media/File:Setapak_Central_(220124)_01.jpg', 'https://upload.wikimedia.org/wikipedia/commons/1/17/Setapak_Sentral.jpg', 1),
(44, 'Anevue K', 'Kuala Lumpur', 'Shopping Malls', '156 Jalan Ampang 50450 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '11', 'https://www.yelp.com/biz/avenue-k-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/wc0DylKCSwh50zPlq2PPAg/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/nOIJK4JaN19LjbSge_xkzQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/J3Da8ZFZtx5Z9lotr_94lQ/348s.jpg', 1),
(45, 'Aeon BIG', 'Kuala Lumpur', 'Shopping Malls', 'Lingkaran Syed Putra AT1, Mid Valley City 59200 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '8', 'https://www.yelp.com/biz/aeon-big-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/zCWlyIb4Wqvp-HavKAI3iQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/p2JjbGlOKV0-pJk736ZPSw/348s.jpg', 'https://theedgemalaysia.com/_next/image?url=https%3A%2F%2Fassets.theedgemarkets.com%2Faeon-big.png&w=1920&q=75', 1),
(46, 'Scott Garden', 'Kuala Lumpur', 'Shopping Malls', '289 Jalan Klang Lama 58000 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '7', 'https://www.yelp.com/biz/scott-garden-kuala-lumpur', '', '', '', '', '', 1),
(47, 'Carousel', 'Kuala Lumpur', 'Toy Stores', 'Lot 14, 1 Jalan Dutamas 1 Level G3, Sri Hartamas Publika Shopping Center 50480 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '8', 'https://www.yelp.com/biz/carousel-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/Tno1-v3KUPpfgiS9V5P91Q/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/ooONRhIDfYj91DrVERTZ0w/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/VKkCxDPZshIva8QD7WT-EA/348s.jpg', 1),
(48, 'Kwong Yik Seng Crockey', 'Kuala Lumpur', 'Antiques', '144, Jalan Tun H S Lee 50000 Kuala Lumpur Malaysia', '\"', '', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(49, '9:00 AM - 5:00 PM\"', '3', 'https://www.yelp.com/biz/kwong-yik-seng-crockery-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/GxPSbgDqOD2GOrfGsjQQIQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/uk7h1pppAjHQTBGAVKLZdA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/Op4XYGkef8rFMUpLBvDxkg/o.jpg', '', '', '', '', 1),
(50, 'Nexus', 'Kuala Lumpur', '', 'Jalan Kerinchi Bangsar South 59200 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '5', 'https://www.yelp.com/biz/nexus-kuala-lumpur-2', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/sKAHxHHpnD5seqVaipYo3Q/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/UGD-6hAGnQzPrG6V0KASCg/o.jpg', '', 1),
(51, 'Jaya Shopping Centre', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Semangat, Seksyen 14 46100 Petaling Jaya, Selangor Malaysia', '10:00 AM - 10:00 PM', '5', 'https://www.yelp.com/biz/jaya-shopping-centre-petaling-jaya', '', '', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiPSJoCOJ044KIWopuidOM2nYmxHWLTvchXg&usqp=CAU', 1),
(52, 'AMCORP MALL', 'Kuala Lumpur', 'Shopping Malls', '18 Jalan Persiaran Barat 46050 Petaling Jaya, Selangor Malaysia', '24 hours', '7', 'https://www.yelp.com/biz/amcorp-mall-petaling-jaya', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg7PKdgHOipTWN4_XhI9FGFD7u3XbY42NB431wfqcjlRMfokqk4CGdEV0MqG07pFuLIDU&usqp=CAU', 'https://livelifelah123.files.wordpress.com/2017/12/20171126_130430-1152x864.jpg', 'https://d5dkjitd3iude.cloudfront.net/eyJidWNrZXQiOiJ3d3cudGhlZWRnZXByb3BlcnR5LmNvbS5teSIsImtleSI6InMzZnMtcHVibGljXC8xMDIzNzBfMTY3MTYwMDM3MV81RWRnUHJvNV9hbWNvcnAxMV8wLmpwZyIsInZlcnNpb24iOiIxIiwiZWRpdHMiOnsicmVzaXplIjp7ImZpdCI6Im91dHNpZGUiLCJoZWlnaHQiOjcyMH0sIlRFUFdhdGVybWFyayI6eyJvcHRpb25zIjp7Im5hbWUiOiJLRUxMWSBMT1ciLCJncmF2aXR5Ijoic291dGhlYXN0In19fX0=', 1),
(53, 'Tropicana City Mall', 'Kuala Lumpur', 'Shopping Malls', '3, Jalan SS 20/27 Damansara Jaya 47400 Petaling Jaya, Selangor Malaysia', '\"', '', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(54, '10:00 AM - 10:00 PM\"', '8', 'https://www.yelp.com/biz/tropicana-city-mall-petaling-jaya', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5kh-3H7idaSS93qbFvi-HOUEWlvMnvtjmog&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-AfeJKljxXfy8Zn095shMCpq9i9E8aNREYg&usqp=CAU', 'https://cdn-cms.pgimgs.com/news/2015/01/Tropicana-City-Mall.jpg', '', '', '', '', 1),
(55, '1 Mont Kiara', 'Kuala Lumpur', 'Shopping Malls', '1 Jalan Kiara Mont Kiara 50480 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '6', 'https://www.yelp.com/biz/1-mont-kiara-kuala-lumpur', '', 'kuala', 'https://s3-media0.fl.yelpcdn.com/bphoto/UqG31yRfnXaZkVPTCmz45g/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/Q6GGuwhWjjPfwyqyVm-fpg/348s.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlsw2IFOVOeAT8Br8KIq-ablffwrp_bzFCg7-7JdnhF6u2mdcgfxNKJtoQVjCapH1L2_s&usqp=CAU', 1),
(56, 'Junk Bookstore', 'Kuala Lumpur', 'Book stores', '78, Jalan Tun H. S. Lee 50000 Kuala Lumpur Malaysia', '8:30 AM - 5:00 PM', '4', 'https://www.yelp.com/biz/junk-bookstore-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCOSJ6ntmfkPmnFSp2is5TxvSUONY6rjLt5A&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ67Nn7jKl5oYkA7inwKqWTGEpq4MstEtsFow&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWSyA1dvSJ1RQHicuxR0n19xMsJjTyP-czmQ&usqp=CAU', 1),
(57, 'Sunway Putra Mall', 'Kuala Lumpur', 'Shopping Malls', '100, Jalan Putra 50350 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '1', 'https://www.yelp.com/biz/sunway-putra-mall-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9TIEtepv2_UY1cRIvzRAiMsmMOKKvGiHZbw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRZwtfX1AjZnWM94vF472AZJqGmG_7bfoTqg&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdlMrgJX8yY05ej3AH-_R9nVK0VOpX0bMbvQ&usqp=CAU', 1),
(58, 'Ampang Point Shopping Mall', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Mamanda 3 68000 Ampang District, Selangor Malaysia', '10:00 AM - 10:00 PM', '7', 'https://www.yelp.com/biz/ampang-point-shopping-centre-ampang-2', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/1MidyBY7PUzs25y6ybg1Ug/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL7Q5i1nFwkxo-MNgy2JaxMNqKJmfrbirmdA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxYNm-HbEnQ1Eet6UCdl8MGZcPEpvHqPg8EvpdqLPbywkdEeXyswZ20iE2KqIO3ZxT0U&usqp=CAU', 1),
(59, 'De Gift House', 'Kuala Lumpur', 'Speciality & Gift Shops', '7, Jalan Damai Perdana 1/9d, Bandar Damai Perdana, 56000, Kuala Lumpur 56000 Kuala Lumpur Malaysia', '8:30 AM - 5:00 PM', '1', 'https://www.yelp.com/biz/de-gift-house-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZlZQIv3zk6imjY9ZlW3cR02sZDDJ5aE8sknkHj7eyH4Oy485rdDVD_ehzl0UchDgxiUc&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCMnhA6yCrHnP7PBmr0pE3pECt_HtT8YBJEA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsl0SWl4XIih3-LGEh1D0t2_Dmd7AsxjoFAg&usqp=CAU', 1),
(60, 'Kedai Buku SP', 'Kuala Lumpur', 'Book stores', 'No. 21, Jalan Prima Setapak 3, Off Jalan Genting Klang 53000 Kuala Lumpur Malaysia', '10:00 AM - 9:00 PM', '1', 'https://www.yelp.com/biz/kedai-buku-sp-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/8ok56XqHNFN7EI7FXbaZeQ/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBhUv_zzWY_OaYt4vzrV-VRT8VAvDws5o1xQ&usqp=CAU', '', 1),
(61, 'Sueta Fashion Boutique', 'Kuala Lumpur', 'Outlet Stores', 'Unit 7A, Kl Sentral Station 50470 Kuala Lumpur Malaysia', '10:00 AM - 9:00 PM', '1', 'https://www.yelp.com/biz/sueta-fashion-boutique-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/ZbWJ2oZQUdFocsXv9XhLiw/o.jpg', '', '', 1),
(62, 'Great Eastern Mall', 'Kuala Lumpur', 'Shopping Malls', '303, Jalan Ampang Desa Pahlawan 50450 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '5', 'https://www.yelp.com/biz/great-eastern-mall-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/Qg0ZKUwjdUoeFBMld5Ifew/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF4_O7eDIlR7etNrlCs73sXOTIuyNPR038oQ&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiQd_a90mTlAi8nwIpf_B_PwlFI83LXYxjGQ&usqp=CAU', 1),
(63, 'Manke Ryohin', 'Kuala Lumpur', 'Outlet Stores', 'Plaza Usahawan, Genting Klang, Jalan Danau Niaga 1, Taman Danau Kota 53300 Kuala Lumpur Malaysia', '8:30 AM - 5:00 PM', '2', 'https://www.yelp.com/biz/manke-ryohin-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/klGtd4EHpwZeyz5_wCp1wA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/z9w-7eAEzrZ11LUGtXVVdw/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/NbZwcrFltlazm5qGVSt6rQ/o.jpg', 1),
(64, 'Taman Connaught Night Market', 'Kuala Lumpur', 'Night Market', '130,108 Jalan Cerdas Taman Connaught 56000 Kuala Lumpur Malaysia', '5:00 PM - 1:00 AM', '8', 'https://www.yelp.com/biz/taman-connaught-night-market-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/4AleH5YoolFMyTyLa2vnfA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/30cFIaqsto71f_HCfUmBhA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/u985zPXXddRKTsrJvEri9Q/o.jpg', 1),
(65, 'Pasar Tani Taman Melawati', 'Kuala Lumpur', 'Night Market', 'Taman Melawati, Lorong Selangor 53100 Kuala Lumpur Malaysia', '5:00 PM - 1:00 AM', '1', 'https://www.yelp.com/biz/pasar-tani-taman-melawati-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi8dpP-hbPzeBFtBQIPR1iVuwu5hWRKDvduA&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRC2lV9ExA1NWhBiHdogZ_k5opKbuvu78M0xg&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZIZQ6ZkUb4PADGc5lnVHykVqL6GJwkMt_Mw&usqp=CAU', 1),
(66, 'KL Gateway Mall', 'Kuala Lumpur', 'Shopping Malls', 'L1-02, 2 Jalan Kerinchi Gerbang Kerinchi Lestari 59200 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '', 'https://www.yelp.com/biz/kl-gateway-mall-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS61hsTvg8GHQcI6NnzaFvt-Bqk-oHdHHmDrQH0G3zIxlCznGF8yNyGWa_ahWXZmkebXh0&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvvbJ3y3lyWbruAU2jFjeyUj1QUD8LNr_3Okf9IwjkoIXrkw_wvSbmMk9hNCJI2dt6htw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl1PLuhFyt8eR3fWVReVslfpCD_XNMMeOlOzBJeJrwfi2p4vwGFSlI34-Jcw2q4L_qT-s&usqp=CAU', 1),
(67, 'Imbi Market', 'Kuala Lumpur', 'Flea & Street Markets', '8 Jalan Melati Bukit Bintang Kuala Lumpur 55100 Kuala Lumpur Malaysia', '6:00 PM -11:00 PM', '4', 'https://www.yelp.com/biz/imbi-market-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/CFU2uauIwMFE1MOg_C4HCA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/-iMihcoBHffqw4vHB31pAQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/bFKLSUElWNYCEOB5twZB2Q/o.jpg', 1),
(68, 'The Sphere', 'Kuala Lumpur', 'Shopping Malls', 'No.1, Avenue 1 No.8, Jalan Kerinchi 59200 Bangsar South, Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '3', 'https://www.yelp.com/biz/the-sphere-bangsar-south', '', '', 'https://static.wixstatic.com/media/189d04_a5f143e782af4c678e8c5a0b7c1aded2~mv2_d_1920_1289_s_2.jpg/v1/fit/w_290,h_195,q_90/189d04_a5f143e782af4c678e8c5a0b7c1aded2~mv2_d_1920_1289_s_2.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL3XRBkS81ODJsMezht-1L1dS33cWPoOUl7WJ0j25Z57HRoKNjyT9M9EuM2AYkFHKMhBM&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDzvvPjT4TyG9rYnAwXdj7wNWl04lHZZDWzg&usqp=CAU', 1),
(69, 'Flea Market Petaling Street', 'Kuala Lumpur', 'Flea & Street Markets', 'Jalan Petaling, City Centre 50000 Kuala Lumpur Malaysia', '10:00 AM - 9:30 PM', '4', 'https://www.yelp.com/biz/flea-market-petaling-street-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/9h4bELBD5zhAXWrQda95YQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/ukxOZjejdIIwks5RItJtcQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/bbKbCcrFfZcdqnk7H_SpRg/o.jpg', 1),
(70, 'The Curve Shopping Mall', 'Kuala Lumpur', 'Shopping Malls', '6, Jalan PJU 7/3 Mutiara Damansara 47800 Petaling Jaya, Selangor Malaysia', '10:00 AM - 10:00 PM', '4', 'https://www.yelp.com/biz/the-curve-shopping-mall-petaling-jaya', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/AjYR81kj9hHWuBAC6d7r4Q/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/73SdQyWHwMQMuigL6fhWxQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/FllxfZ7zMDEAj0MIYia0_Q/o.jpg', 1),
(71, 'Plaza Pudu', 'Kuala Lumpur', 'Shopping Malls', 'Jalan Landak Pudu 55100 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '2', 'https://www.yelp.com/biz/plaza-pudu-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy761aeBCC4f4UpqXh2NGsdMxI51M1X7hDKQ&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/RAQD4K9easpHdzGQ2UT1KA/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4KyI9hKC7UT72K6gxT11kffDFzL9wBJUcsg&usqp=CAU', 1),
(72, 'Peter Hoe Beyond', 'Kuala Lumpur', 'Speciality & Gift Shops', '145, Jalan Tun H S Lee 50000 Kuala Lumpur Malaysia', '8:30 AM - 5:00 PM', '2', 'https://www.yelp.com/biz/peter-hoe-beyond-kuala-lumpur', '', '', 'https://d2dzi65yjecjnt.cloudfront.net/365431.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/x2Rfo9zywI2Q66XlypKwxQ/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/O9u4OUdNI4R0bVyNIdfovA/o.jpg', 1),
(73, 'Gamuda Walk', 'Kuala Lumpur', 'Shopping Malls', 'Persiaran Anggerik Vanilla Kota Kemuning 40460 Shah Alam, Selangor Malaysia', '10:00 AM - 10:00 PM', '3', 'https://www.yelp.com/biz/gamuda-walk-shah-alam', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/zljCFkiFxPTPJPsVQPzOog/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/O_mvwyGypikYshth_-WqCA/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/rSVGzuri6URWeoHSq74HWg/348s.jpg', 1),
(74, 'The Strand', 'Kuala Lumpur', 'Shopping Malls', 'No.46G, Jalan PJU 5/22 Encorp Strand Pusat Perdagangan Kota Damansara 47810 Petaling Jaya, Selangor Malaysia', '10:00 AM - 10:00 PM', '4', 'https://www.yelp.com/biz/the-strand-petaling-jaya', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/ViZZXtz2MMCGWLM9DbWQkQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/OVls9EJijf8Z7TI1CF-JYQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/HeAFPyIuAQ-QWUR7xSHprw/348s.jpg', 1),
(75, 'Solaris Mont Kiara', 'Kuala Lumpur', 'Shopping Malls', '2, Jalan Solaris 50480 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '4', 'https://www.yelp.com/biz/solaris-mont-kiara-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvK0iCPQGaMTcCd8AzOg_ccwNUlJiNNp9nHA&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/cdos4UYuaNWCCLQxYLo_yA/o.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/nSx4hYQecrw9BB89Y287CA/o.jpg', 1),
(76, 'The Mines', 'Kuala Lumpur', 'Shopping Malls', 'Mines Resort City Jalan Dulang 43300 Seri Kembangan, Selangor Malaysia', '10:00 AM - 10:00 PM', '2', '6+I77', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/9RT7x_YGD24WOE5pkbez5w/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTZmz21NWTrwaL0UNDUulbXBwALguQD_MY3A&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBveFEWdmEunEYEKmK-WJ4m7_5RSHoYXz9pw&usqp=CAU', 1),
(77, 'Pestle & Mortar ', 'Kuala Lumpur', 'Outlet Stores', '11, Jalan Telawi 5 Bangsar Baru 59100 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '6', 'https://www.yelp.com/biz/pestle-dan-mortar-bangsar-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/bhUpYXuaHoVi-JRzamoYnw/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/jROwxKoK0mz1kbZ-pmDvwQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/pf7uW5J6RkcjNPz6a3O13g/348s.jpg', 1),
(78, 'Shoes Shoes Shoes', 'Kuala Lumpur', 'Outlet Stores', '22-1 & No.22-2, Jalan Telawi 3 59100 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '2', 'https://www.yelp.com/biz/shoes-shoes-shoes-kuala-lumpur', '\"A longstanding local shoes store helmed by socialite Yiu Lin. Shoes Shoes Shoes has been around for many years and now a staple amongst everyone from celebrities to office workers.', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(79, 'Yiu Lin\'s clutch', 'Melaka', 'https://s3-media0.fl.yelpcdn.com/bphoto/fLhbc5NUZWr0imJ4QfeGPQ/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/nuQLRCcOcN2nc0eZ8DJeUw/348s.jpg', 'https://s3-media0.fl.yelpcdn.com/bphoto/MxTWVS9gUVrxTUEkPcCysg/348s.jpg', '', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d2518370-Reviews-Umyang_Batik-Melaka_Central_Melaka_District_Melaka_State.html', 'No Comment', 'No Direction Provided', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c4/fe/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1', 1),
(80, 'Plaza Dataran Merdeka/Dataran Underground', 'Kuala Lumpur', 'Shopping Malls', 'Dataran Merdeka 50050 Kuala Lumpur Malaysia', '8:00 AM - 8:00 PM', '3', 'https://www.yelp.com/biz/plaza-dataran-merdeka-dataran-underground-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/wo9WzFfpiEbp6MLmhxZydg/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE1Lp_ej4xKnHYEVd3j3DL812zODcsLCJEIQ&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW9pUrBpkFwXkbmATrHzuJv2P9QOogVpKfSw&usqp=CAU', 1),
(81, 'Yakin Book Store', 'Kuala Lumpur', 'Book stores', '21, Persiaran Ara Kiri Lucky Garden 59100 Kuala Lumpur Malaysia', '8:30 AM - 5:00 PM', '1', 'https://www.yelp.com/biz/yakin-book-store-kuala-lumpur', '', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRg_FJYh9ghL5LQAXRZA7BDsw__IuyjQZCM3Q&usqp=CAU', 'https://s3-media0.fl.yelpcdn.com/bphoto/LiIFq5K28iNH0HlrGazRYA/o.jpg', '', 1),
(82, 'One Metro Pudu', 'Kuala Lumpur', 'Shopping Malls', 'Avenue Business Centre, Fraser Business Park, Jalan Metro Pudu 55200 Kuala Lumpur Malaysia', '10:00 AM - 10:00 PM', '1', 'https://www.yelp.com/biz/one-metro-pudu-kuala-lumpur', '', '', 'https://s3-media0.fl.yelpcdn.com/bphoto/FXp8-OHt3nKk4k9jzMRCVw/o.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJepoTiXwBkOpCQaSROu4xGb97Ta07iuOGw&usqp=CAU', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtJepoTiXwBkOpCQaSROu4xGb97Ta07iuOGw&usqp=CAU', 1),
(83, 'Jetty Point Complex', 'Langkawi', 'Shopping Malls', 'Kompleks Jetty Point, Persiaran Putera, Kuah, 07000 Langkawi, Kedah, Malaysia', '2:00 PM - 11:00 PM', '', 'https://www.hotels.com/go/malaysia/best-shopping-langkawi', '\"Jetty Point Complex is a popular last-minute shopping stopover for visitors before they board the ferry back to the mainland. This 3-storey shopping mall is conveniently located at the entrance of Kuah Jetty.', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(84, 'Clothing and accessories', 'Selangor', 'https://a.cdn-hotels.com/gdcs/production49/d1090/c9cfa11b-4e91-4435-ad35-054b867cea18.jpg?impolicy=fcrop&w=1600&h=1066&q=medium', 'https://gowhere.my/wp-content/uploads/2015/07/jetty-point-langkawi-e1438068110777.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd_IfNB8ztsjJcTE9HJTYE8WZ_nqmomSy_1r9hWn0agUAS_WAhhJ4eBFceajvFqkfba_w&usqp=CAU', '', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d2518370-Reviews-Umyang_Batik-Melaka_Central_Melaka_District_Melaka_State.html', 'clothing and accessories', 'clothing and accessories', '', '', '', 1),
(85, 'Atma Alam Batik Village', 'Langkawi', 'Textile factory and gallery', 'Padang Matsirat, 07000 Langkawi, Kedah, Malaysia', '10:00 AM - 6:00 PM (closed on Tuesdays)', '', 'https://www.hotels.com/go/malaysia/best-shopping-langkawi', '\"The Atma Alam Batik Village is a textile factory with an onsite art gallery that showcases exquisite batik prints and cultural works. The complex also houses a large retail outlet offering an extensive range of batik apparel, songket (brocade) and batik fabrics, original oil paintings, bags, purses, handmade crafts for sale. ', 'undefined', 'undefined', 'undefined', 'undefined', 1),
(86, 'The Atma Alam Batik Village', 'Melaka', 'https://a.cdn-hotels.com/gdcs/production187/d514/069026fb-823f-489f-b7f5-63f9bf4a462c.jpg?impolicy=fcrop&w=1600&h=1066&q=medium', 'https://www.berjayahotel.com/sites/default/files/atma%20alam%20batik_1.jpg', 'https://lh5.googleusercontent.com/p/AF1QipPwmen0bg2iNR17o7VYAONNl_wFDBauPp4lbRhc=s296-w296-h168-n-k-no-v1', '', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d2518370-Reviews-Umyang_Batik-Melaka_Central_Melaka_District_Melaka_State.html', '', '', '', '', '', 1),
(87, 'Kompleks HiG Duty Free Mall', 'Langkawi', 'Shopping Malls', '', '9:30 AM to 9:30 PM', '', 'https://www.holidify.com/pages/malls-in-langkawi-6067.html', 'Renovated in 2019, this mall sells the widest range of tax and duty-free products in Langkawi. The narrow aisles of the mall are filled with household items, kitchenware, cutlery, water bottles, luggage and chocolates at bargain basement prices. Langkawi is rich in cocoa production, reflected in the wide range of chocolates on sale here. The mall has an attached ATM and a food court serving both Asian and Western fare.', '', 'https://www.holidify.com/images/cmsuploads/compressed/Screenshot2022-10-06at5.39.36PM_20221006174009.png', 'https://www.shutterstock.com/shutterstock/photos/394670389/display_1500/stock-photo-kedah-malaysia-november-haji-ismail-group-or-hig-is-the-biggest-duty-free-complex-394670389.jpg', 'https://www.jomjalan.com.my/wp-content/uploads/2016/03/kompleks-hig.jpg.webp', 1),
(88, 'Dataran Pahlawan Melaka Megamall', 'Melaka', 'Shopping Malls', 'Dataran Pahlawan Melaka Megamall Dataran Pahlawan Melaka Megamall Lianbang Ventures Sdn. Bhd. Bandar Hilir, Melaka 75000 Malaysia', '10:00 AM - 10:00 PM', '291', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d1022991-Reviews-Dataran_Pahlawan_Melaka_Megamall-Melaka_Central_Melaka_District_Melaka_State.html', 'Dataran Pahlawan Melaka Megamall is your must-visit place for all your shopping needs in Melaka. This premier shopping destination features over 750 retail shops from fashion to entertainment and a wide range of local and International food and beverage outlets. Nestled amidst the colourful architectural heritage of Melaka\'s UNESCO World Heritage buildings like the Porta de Santiago (A Famosa), the mall was awarded two commendations for Retail Development and Retail Architecture Malaysia in the Asia Pacific Property Awards 2013/2014.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/ac/e9/d4/img-20161110-wa0059-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/9e/e5/9a/20161113-163738-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/9e/e5/91/20161113-163444-largejpg.jpg?w=1200&h=-1&s=1', 1),
(89, 'Mahkota Parade', 'Melaka', 'Shopping Malls', 'Jalan Merdeka Taman Costa Mahkota, Melaka 75000 Malaysia', '10:00 AM - 10:00 PM', '134', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d7802583-Reviews-Mahkota_Parade-Melaka_Central_Melaka_District_Melaka_State.html', 'Mahkota Parade is a shopping mall located in Malacca City, Malacca, Malaysia, which was originally established on 30 January 1994 and relaunched on 1 May 2010 after refurbishment.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/51/5f/a8/mahkota-parade.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/51/5f/9c/mahkota-parade.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/80/5c/19/mahkota-parade.jpg?w=1000&h=-1&s=1', 1),
(90, 'AEON Bandaraya Melaka Shopping Centre', 'Melaka', 'Shopping Malls', 'No. 2 Jalan Legenda Taman 1 - Legend, Melaka 75400 Malaysia', '10:00 AM - 10:00 PM', '42', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d10670521-Reviews-AEON_Bandaraya_Melaka_Shopping_Centre-Melaka_Central_Melaka_District_Melaka_Stat.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c5/9d/external-facade.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c6/85/similarities-to-johor.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/4c/c5/95/external-facade.jpg?w=1200&h=-1&s=1', 1);
INSERT INTO `places` (`id`, `shopping_name`, `state`, `category`, `address`, `operating`, `review`, `website`, `description`, `direction`, `image_1`, `image_2`, `image_3`, `is_active`) VALUES
(91, 'Freeport A\'Famosa Outlet', 'Melaka', 'Shopping Malls', 'Jalan Kamus Alor Gajah, Malacca, Melaka 78000 Malaysia', '12:00 PM - 8:00 PM', '155', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d8871502-Reviews-Freeport_A_Famosa_Outlet-Melaka_Central_Melaka_District_Melaka_State.html', 'Freeport A’Famosa Outlet offers over 80 fashion, sport and accessories brands in some 180,000 sq.ft. The outlet is set in an open air mall featuring a lake, fountains, carousel and windmill with architecture loosely themed on Melaka’s Dutch heritage.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/ed/df/45/20160101-113437-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/09/b1/b7/d6/freeport-a-famosa-outlet.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/ff/79/4d/freeport-a-famosa-outlet.jpg?w=1200&h=-1&s=1', 1),
(92, 'Mydin Mall Mitc', 'Melaka', 'Shopping Malls', '12 Hang Tuah Jaya, Melaka 75450 Malaysia', '10:00 AM - 10:00 PM', '23', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d6633533-Reviews-Mydin_Mall_Mitc-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/e1/a1/43/mydin-mall-mitc.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/43/ef/9a/locals-mall.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/e1/a1/2a/mydin-mall-mitc.jpg?w=1200&h=-1&s=1', 1),
(93, 'Vedro Mall Melaka', 'Melaka', 'Shopping Malls', 'Jalan Baru, Melaka 75100 Malaysia', '10:00 AM - 10:00 PM', '1', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d17780893-Reviews-Vedro_Mall_Melaka-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/85/c2/d5/vedro-mall-melaka.jpg?w=1000&h=-1&s=1', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgBEzPaoCMCPc7XjQDEnLFDA35YwD63jAcHGKYJiYPNouffDkE7bU1qkAvs_SaHtjPnqjmT9ROf4tTy4w6kNFK3MhcSWJ9l8Qhyphenhyphen-5hnnrOJCPxkgSbWkcgAlykjBWHEW8SIeRq8acYy770i/s1600/st_20170228_hatten283wl1_2971611.jpg', '', 1),
(94, 'ElementX Mall', 'Melaka', 'Shopping Malls', '', '10:00 AM - 10:00 PM', '24', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d14947579-Reviews-ElementX_Mall-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e2/e4/dead-mall.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e2/ec/dead-mall.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/13/e0/e3/54/dead-mall.jpg?w=800&h=-1&s=1', 1),
(95, 'Abdul Antiques', 'Melaka', 'Antiques Shops', '', '9:00 AM - 6:00 PM', '3', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d26857135-Reviews-Abdul_Antiques-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/83/33/caption.jpg?w=800&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/83/30/caption.jpg?w=600&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/e1/80/a7/caption.jpg?w=800&h=-1&s=1', 1),
(96, 'Red Earth Collection', 'Melaka', 'Art Galleries & Antique Shops', 'Heeren Street, Melaka 75200 Malaysia', '', '3', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d13136273-Reviews-Red_Earth_Collection-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/62/melaka.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/75/melaka.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/3f/cd/82/melaka.jpg?w=1200&h=-1&s=1', 1),
(97, 'Melipoly', 'Melaka', 'Speciality & Gift Shops, Gardens, Geologic Formations', '141 Jalan Hang Jebat, Melaka 75200 Malaysia', '10:00 AM - 10:00 PM', '9', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d14931426-Reviews-Melipoly-Melaka_Central_Melaka_District_Melaka_State.html', 'Melipoly was established in 2014 and we are one of the largest beekeepers in West Malaysia. We specialise in local honey bee and stingless bee species which do not require artificial support to survive or produce. Our main honey products are Malaysian forest bee (apis cerana) and stingless bee honeys. Our bee farms are located in the forest, away from pollution and pesticides. We have conducted voluntary testing and certified the purity of our honey using the highest international standards at the EU\'s premier testing institutes. Our continuing R&D work has discovered that our honey contains natural probiotics that are beneficial to our digestive and immune systems.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/f8/a6/4f/shopfront.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/83/d6/dd/the-honey-peark-milk.jpg?w=1100&h=-1&s=1', '', 1),
(98, 'Uptown Pahlawan Walk', 'Melaka', 'Flea & Street Markets', 'Jalan Pm 2 Corner Jalan PM3, Plaza Mahkota, Melaka 75000 Malaysia', '6:00 PM - 2:00 AM', '15', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d12255362-Reviews-Uptown_Pahlawan_Walk-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/02/4a/90/caption.jpg?w=900&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/1a/33/56/market-by-night.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/c6/67/53/photo0jpg.jpg?w=1200&h=-1&s=1', 1),
(99, 'Kee Ann Food Street', 'Melaka', 'Flea & Street Markets', 'Jalan Kee Ann, Melaka 75100 Malaysia', '6:00 PM - 12:00 AM', '7', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d17805773-Reviews-Kee_Ann_Food_Street-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/b1/kee-ann-food-street.jpg?w=1000&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/a9/kee-ann-food-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/9d/ea/f1/kee-ann-food-street.jpg?w=1000&h=-1&s=1', 1),
(100, 'Harmony Street Sdn. Bhd.', 'Melaka', 'Antique Shops', '15 Jalan Tukang Emas, Melaka 75200 Malaysia', '', '2', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d11947752-Reviews-Harmony_Street_Sdn_Bhd-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/b5/moschea.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/cb/tempio-buddhista.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/68/d3/dc/immagine-dentro-il-tempio.jpg?w=1200&h=-1&s=1', 1),
(101, 'RazKashmir Crafts', 'Melaka', 'Speciality & Gift Shops', 'No. 12 Jalan Tukang Emas, Melaka 75200 Malaysia', '10:00 AM - 7:00 PM', '38', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d5813184-Reviews-RazKashmir_Crafts-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/c2/37/c2/razkashmir-crafts.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/c2/37/b5/razkashmir-crafts.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/daodao/photo-o/12/4b/1f/5f/razkashmir-crafts.jpg?w=1200&h=-1&s=1', 1),
(102, 'Joe\'s Design Handcrafted', 'Melaka', 'Speciality & Gift Shops', 'No 6 Jalan Tun, Melaka 75200 Malaysia', '9:30 AM - 7:00 PM', '29', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d2422561-Reviews-Joe_s_Design_Handcrafted-Melaka_Central_Melaka_District_Melaka_State.html', 'Based in Malacca, Malaysia. Joe\'s Design created a wide range of unique handmade jewellery of the exquisite works. Visit our online shop; you will discover bright, bold and chunky fashion accessories, available in a variety of colours and designs. Our hand crafted necklaces and colourful bracelets are all created using the best materials including genuine freshwater pearls, semi precious gemstones such as Turquoise, Amethyst and Jade, Fossil Coral, Ammonite and handmade artisan lampwork with glass beads. Pendants, earrings and matching sets exquisitely finished and totally made by hand. Joe’s Design ~ Artisan Handcrafted Jewellery, a limited edition and one of a kind designs to express your individual; characteristic.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/ef/d9/50/photo3jpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/5a/c8/dc/handmade-lampshades-at.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-s/02/39/e7/75/filename-20111214-125307.jpg?w=600&h=-1&s=1', 1),
(103, 'Sixty 3 Heritage', 'Melaka', 'Speciality & Gift Shops', '63 Jalan Tun, Melaka 75300 Malaysia', '9:30 AM - 7:00 PM', '9', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d6107628-Reviews-Sixty_3_Heritage-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c4/fe/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c5/7d/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/66/c5/66/sixty-3-heritage.jpg?w=1200&h=-1&s=1', 1),
(104, 'Ghee Hiang @ Jonker', 'Melaka', 'Speciality & Gift Shops', '17 Jonker St, Melaka 75200 Malaysia', '9:30 AM - 7:00 PM', '8', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d10100307-Reviews-Ghee_Hiang_Jonker-Melaka_Central_Melaka_District_Melaka_State.html', 'At our new Malacca outlet, we are excited to bring you these oriental pastries nearing two centuries of history. All handmade and baked fresh daily in limited quantities! We also sell the most fragrant sesame oil since 1856! Well-loved in every kitchen locally as well as abroad.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/ad/e2/f2/getlstd-property-photo.jpg?w=400&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', '', 1),
(105, 'Old Town Clog Shoes - Jonkers Street Melaka', 'Melaka', 'Speciality & Gift Shops', '', '9:30 AM - 7:00 PM', '7', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d4332447-Reviews-Old_Town_Clog_Shoes_Jonkers_Street_Melaka-Melaka_Central_Melaka_District_Melaka_S.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/9e/jonkers-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/af/jonkers-street.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1', 1),
(106, 'Umyang Batik', 'Melaka', 'Speciality & Gift Shops', 'No 6 Jalan Hang Kasturi, Melaka 75200 Malaysia', '9:30 AM - 7:00 PM', '2', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d2518370-Reviews-Umyang_Batik-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/dd/a9/06/umyang-batik.jpg?w=1200&h=-1&s=1', '', '', 1),
(107, 'Wah Aik Shoemaker', 'Melaka', 'Speciality & Gift Shops', '92 Jalan Tun Tan Cheng Lock, Melaka 75200 Malaysia', '9:30 AM - 7:00 PM', '9', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d13792005-Reviews-Wah_Aik_Shoemaker-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/a2/8f/55/wah-aik-shoemaker.jpg?w=1100&h=-1&s=1', '', '', 1),
(108, 'Jonker Chocolate House', 'Melaka', 'Speciality & Gift Shops', 'No. 1 Jalan Laksamana, Melaka 75000 Malaysia', '9:00 AM - 10:00 PM', '1', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d20089576-Reviews-Jonker_Chocolate_House-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/d4/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/a7/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/93/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 1),
(109, 'Guan Huat Seng', 'Melaka', 'Speciality & Gift Shops', 'Bangunan GHS, 388A, Jalan Tengkera, Melaka 75200 Malaysia', '8:30 AM - 5:30 PM', '1', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d25383932-Reviews-Guan_Huat_Seng-Melaka_Central_Melaka_District_Melaka_State.html', 'Founded in 1938, Guan Huat Seng Heng Kee Sdn Bhd is a name well known to locals and tourists in Melaka. Starting out from a humble shop in the late thirties, we have now grown into a well established corporation owing to the great effort and vision from 3 generations. Endlessly sourcing for good quality products to cater for the food industries from wholesalers to retailers alike. Our products range from dried and frozen seafood i.e. sea cucumbers, abalones, fish maw, scallops to a variety of canned products and packet sauces and seasoning. We strive to ensure customer satisfaction by providing quality products that meet safety standards. We have several in house brands that are available throughout Malaysia and overseas like Sun City, Heng\'s, Cai Yan and McCann. By not forgetting our roots, we are determined to continuously provide quality, and wide variety of choices to our consumers.', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSylVXatOWoukcpr3Tw81hpALysi49IoW6thw&usqp=CAU', 'https://www.guanhuatseng.com/image/catalog/cc.jpg', 'https://www.guanhuatseng.com/image/catalog/b.jpg', 1),
(110, 'Sweet Souvenirs Creative Trading', 'Melaka', 'Speciality & Gift Shops', 'Jalan Merdeka E122A, Dataran Pahlawan Megamall, Melaka 75000 Malaysia', '8:30 AM - 10:00 PM', '2', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d6717541-Reviews-Sweet_Souvenirs_Creative_Trading-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/98/hot-weather-no-problem.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/73/we-have-various-type.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/0c/53/8f/located-in-newton-food.jpg?w=1200&h=-1&s=1', 1),
(111, 'Tan Kim Hock Product Centre', 'Melaka', 'Speciality & Gift Shops', '85, Jalan Bendahara, Kampung Jawa, Melaka 75100 Malaysia', '8:30 AM - 5:30 PM', '1', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d20206474-Reviews-Tan_Kim_Hock_Product_Centre-Melaka_Central_Melaka_District_Melaka_State.html', '', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/02/28/55/photo1jpg.jpg?w=1200&h=-1&s=1', '', '', 1),
(112, 'Cek Pah Chickeboom', 'Melaka', 'Speciality & Gift Shops', 'Jalan Pm 2 Plaza Mahkota, Melaka 75000 Malaysia', '8:30 AM - 10:00 PM', '', 'https://www.tripadvisor.com.my/Attraction_Review-g306997-d13569719-Reviews-Cek_Pah_Chickeboom-Melaka_Central_Melaka_District_Melaka_State.html', 'Cek Pah Chickeboom is the most relevant shop to visit in Melaka as they sell various type of souvenirs including fridge magnet, key chain, t-shirt, traditional kebaya and traditional food of Melaka. Don\'t forget to bring back souvenirs for your buddies and families.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/33/1f/25/selling-souvenirs-and.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/95/73/2d/gula-melaka-palm-sugar.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/95/72/f2/coconut-cookies.jpg?w=1200&h=-1&s=1', 1),
(113, 'Hatten Square', 'Melaka', 'Shopping Malls', 'Jln Merdeka, Taman Costa Mahkota, 75000 Malacca, Malaysia', '10:00 AM - 10:00 PM', '', 'https://www.hotels.com/go/malaysia/best-shopping-malacca', '\"Hatten Square Suites and Shoppes is a 4-storey shopping mall located along Jalan Merdeka in Malacca. It occupies the bottom levels of a massive mixed development complex right in the middle of Malacca City Centre. The shopping mall has several international brands, with H&M and Braun Buffel just to name a few, together with independent retail stores ranging from boutiques to hair salons.', '', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/02/28/55/photo1jpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/33/dd/73/we-have-various-type.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1', 1),
(114, 'San Shu Gong', 'Melaka', 'Speciality & Gift Shops', '33, Lorong Hang Jebat, 75200 Malacca, Malaysia', '9:00 AM - 6:00 PM', '', 'https://www.hotels.com/go/malaysia/best-shopping-malacca', '\"The giant San Shu Gong local produce shop is one you should not miss out on when exploring Jonker Street in Malacca. Conveniently located at the entrance of Jonker Street across the concrete bridge from the Stadhuys (beside Kedai Kopi Chung Wah), it is usually packed with visitors shopping for Nyonya pastries.', NULL, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/de/f7/d4/inside-melaka-chocolate.jpg?w=700&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0b/1a/74/28/20160501-130325-1-largejpg.jpg?w=1200&h=-1&s=1', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1c/7c/b3/jonkers-street.jpg?w=700&h=-1&s=1', 1);

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
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `recent_tracker`
--
ALTER TABLE `recent_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

CREATE TABLE `travel_shopper`.`search_key` (`id` INT NOT NULL AUTO_INCREMENT , `user_id` INT NULL DEFAULT NULL , `keyword` VARCHAR(255) NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
