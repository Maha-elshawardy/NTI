-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 07:36 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `flat` varchar(50) NOT NULL,
  `notes` varchar(256) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `regions_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => not verifeid , 1=> verifeid , 2 => block',
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name_ar`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'APPLE', 'ابل', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(2, 'SAMSUNG', 'سامسونج', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(3, 'DELL', 'ديل', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(4, 'HP', 'اتش بي', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(5, 'HUAWEI', 'هواوي', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(6, 'LG', 'ال جي', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03'),
(7, 'TOSHIBA', 'توشيبا', 1, 'default.jpg', '2022-01-19 14:45:03', '2022-01-19 14:45:03');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => not verifeid , 1=> verifeid , 2 => block',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ELECTRONICS', 'الكترونيات', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-19 15:22:28'),
(2, 'SUPERMARKET', 'بقالة', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-19 15:22:28'),
(3, 'FASHONE', 'ازياء', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-19 15:22:28'),
(4, 'HOME', 'منزل', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-19 15:22:28'),
(5, 'HEALTH & BEAUY', 'منتجات العناية بالاطفال', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-20 16:05:53'),
(6, 'PET SUPPLIES', 'مستلومات الحيوانات الأليفة', 'default.jpg', 1, '2022-01-19 15:22:28', '2022-01-19 15:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `code` mediumtext NOT NULL,
  `discount` int(5) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `start_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `mini_order_price` int(5) NOT NULL,
  `max_discount_value` int(5) NOT NULL,
  `max_usage_per_user` int(5) NOT NULL,
  `max_usage_per_coupon` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `title_ar` varchar(200) NOT NULL,
  `discount` int(5) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `start_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers_products`
--

CREATE TABLE `offers_products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('1','2','','') NOT NULL COMMENT '1=> cash , 2=> cridet',
  `total_price` decimal(7,0) NOT NULL,
  `delivery_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `lat` varchar(20) NOT NULL,
  `long` varchar(20) NOT NULL,
  `coupons_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `code` mediumtext NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `desc_en` longtext NOT NULL,
  `desc_ar` longtext NOT NULL,
  `quantity` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_en`, `name_ar`, `price`, `code`, `image`, `desc_en`, `desc_ar`, `quantity`, `status`, `subcategory_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Apple MacBook Pro 2020', 'ابل ماك بوك برو 2020', '52000.00', '12354', 'MacBookPro.jpg', 'Touch ID with one touch is enough to lock and unlock your MacBook Air.\r\nThe Magic Keyboard is designed to make you do everything better and in a jiffy.\r\nThanks to the M1 chip, the FaceTime HD camera takes full advantage of our most advanced image signal processor.\r\nWith the stunning Retina display, images are highly detailed and realistic.\r\nmacOS Big Sur was developed to harness the potential of the M1 chip and transform the Mac.', 'معرف اللمس بلمسة واحدة كافٍ لقفل وفتح جهاز MacBook Air الخاص بك تم تصميم Magic Keyboard لتجعلك تفعل كل شيء بشكل أفضل وفي لمح البصر بفضل شريحة M1 ، تستفيد كاميرا FaceTime HD بشكل كامل من معالج إشارات الصور الأكثر تقدمًا لدينا. شاشة Retina المذهلة ، الصور مفصلة للغاية وتم تطوير macOS Big Sur الواقعي لتسخير إمكانات شريحة M1 وتحويل جهاز Mac', 6, 1, 3, 1, '2022-01-19 17:43:14', '2022-01-20 14:49:47'),
(2, 'Apple Macbook Air 2020', 'ابل ماك بوك اير 2020', '20988.00', '1364', 'MacbookAir.jpg', 'Touch ID with one touch is enough to lock and unlock your MacBook Air\r\nEnjoy absolute comfort from A to Z. In addition to typing at your leisure, with the pre programmed shortcuts on this keyboard you can instantly access the features you use the most\r\nThe M1 chip carries our most advanced image signal processor so you always look great on your FaceTime video calls\r\nEnjoy the views. Rest your eyes. The MacBook Air knows how to automatically adjust the white point of the screen according to the ambient color temperature, so it is more comfortable to look at\r\nThe 2,560 by 1,600 pixel resolution of the 13.3 inch Retina display offers astonishing detail and realism', 'معرف اللمس بلمسة واحدة يكفي لقفل وفتح جهاز MacBook Air الخاص بك\r\nاستمتع براحة مطلقة من الألف إلى الياء. بالإضافة إلى الكتابة في وقت فراغك ، باستخدام الاختصارات المبرمجة مسبقًا على لوحة المفاتيح هذه ، يمكنك الوصول فورًا إلى الميزات التي تستخدمها كثيرًا\r\nتحمل شريحة M1 معالج إشارة الصور الأكثر تقدمًا لدينا ، لذا ستبدو دائمًا رائعًا في مكالمات الفيديو عبر FaceTime\r\nاستمتع بالمناظر. ارح عينيك. يعرف MacBook Air كيفية ضبط النقطة البيضاء للشاشة تلقائيًا وفقًا لدرجة حرارة اللون المحيطة ، بحيث يكون أكثر راحة عند النظر إليه\r\nتوفر دقة شاشة Retina البالغة 2560 × 1600 بكسل مقاس 13.3 بوصة تفاصيل مذهلة وواقعية', 4, 1, 3, 1, '2022-01-19 17:43:14', '2022-01-20 14:50:05'),
(3, 'Corn Velvet Animal Pet Toy Wearing Plush Vocal Gir', 'لعبة ذرة مخملية للحيوانات الأليفة ترتدي جرو الزراف', '197.00', '1234', 'corn.jpg', 'Can make the dog no longer lonely, and divert the dog\'s attention to prevent it from biting the furniture The product is also an animal, the dog will be very happy to play with it. The owner can play with the dog to enhance the relationship and make the dog and the owner more intimate\r\nSpecifications: Material: flannel pp cotton cotton rope Color: blue pink yellow Size: height 29cm width 10cm thickness 4cm Weight: 65g\r\nNotes: Due to the difference between different monitors, the picture may not reflect the actual color of the item. We guarantee the style is the same as shown in the pictures.\r\nPackage Include: 1 Corn velvet animal pet toy', 'يمكن أن يجعل الكلب لم يعد وحيدًا ، ويحول انتباه الكلب لمنعه من قضم الأثاث. المنتج أيضًا حيوان ، سيكون الكلب سعيدًا جدًا باللعب معه. يمكن للمالك اللعب مع الكلب لتعزيز العلاقة وجعل الكلب والمالك أكثر حميمية\r\nالمواصفات: المادة: حبل قطن بولي بروبلين من الفانيلا اللون: أصفر وردي أزرق الحجم: ارتفاع 29 سم عرض 10 سم سمك 4 سم الوزن: 65 جرام\r\nملاحظات: نظرًا للاختلاف بين الشاشات المختلفة ، فقد لا تعكس الصورة اللون الفعلي للعنصر. نحن نضمن أن النمط هو نفسه كما هو موضح في الصور.\r\nتتضمن العبوة: 1 لعبة حيوانات أليفة من مخمل الذرة', 10, 1, 12, NULL, '2022-01-19 17:58:29', '2022-01-20 14:50:29'),
(7, 'Finish Dishwasher Tabs - 13 Tabs - 3 Packs', 'فينيش أقراص لغسالة الأطباق - 13 قرص - 3 عبوات', '168.00', '3241', 'dishwasher.jpg', 'Thanks to its unique technology, our powerful tabs deliver a powerful clean even in the toughest conditions – which means you’ll never have to re-wash your pots, pans and dishes!\r\nOur revolutionary Pre-Soaking Powerball fizzes into action dispersing deep cleaning agents that remove the toughest food residues like dried-on lasagna and porridge oats.\r\nOur powerful cleaners remove even the toughest stains, like coffee and tea, and gently scrub your dishes and glasses sparkling clean.\r\nSalt and Rinse aid action rinses away residues and helps to eliminate spots and film, delivering sparkling shine.\r\nDeep Cleaning fizz Action\r\nRemoves the toughest food residues\r\nRemoves Toughest stains\r\nEliminates spots and film\r\nEach tablet is individually wrapped for freshness.', 'بفضل تقنيتها الفريدة ، توفر ألسنةنا القوية تنظيفًا قويًا حتى في أصعب الظروف - مما يعني أنك لن تضطر أبدًا إلى إعادة غسل الأواني والمقالي والأطباق!\r\nتتأرجح Powerball الثورية قبل النقع لتعمل على تشتيت عوامل التنظيف العميقة التي تزيل أصعب بقايا الطعام مثل اللازانيا المجففة والشوفان.\r\nتعمل منظفاتنا القوية على إزالة أصعب البقع ، مثل القهوة والشاي ، وتنظيف الأطباق والأكواب برفق لتنظيفها.\r\nيعمل الملح ومساعد الشطف على شطف البقايا ويساعد على التخلص من البقع والغشاء ، مما يوفر لمعانًا لامعًا.\r\nتنظيف عميق لعمل فوران\r\nيزيل أصعب بقايا الطعام\r\nيزيل أصعب البقع\r\nيزيل البقع والفيلم\r\nكل قرص مغلف بشكل منفرد للحفاظ على نضارته.', 4, 1, 6, NULL, '2022-01-20 18:06:34', '2022-01-22 14:53:03'),
(8, 'Nescafe Classic Jar - 200 G', 'نسكافيه كلاسيك - 200 جم', '125.00', '3256', 'nescafe.jpg', 'Prepared from highly roasted coffee beans for a rich and delicious flavour\r\nEasy to prepare\r\nKeep in a cool, dry place.\r\nPackaging may vary', 'محضرة من حبوب القهوة شديدة التحميص للاستمتاع بنكهة غنية ولذيذة\r\nسهلة التحضير\r\nيحفظ في مكان بارد وجاف.\r\nالتغليف قد يختلف', 3, 1, 5, NULL, '2022-01-19 18:15:01', '2022-01-20 14:51:07'),
(9, 'Toshiba GR-EF40P-J-S No Frost Refrigerator With Ci', 'ثلاجة نو فروست بمقبض دائري - 355 لتر - 2 باب - فضي', '7900.00', '6432', 'fefrigerator.jpg', 'Refrigerators do more than keep food and beverages at optimum temperatures, and many of the latest features include the functionality to fully integrate with your life and help protect the planet. Updated appliances are offered in a host of finishes and designs to accommodate any decor and often become the stylish focal point of kitchen design.Whether you are looking to update your existing kitchen or are choosing appliances for a new build, you will find a configuration to suit every budget, taste, and application.\r\n\r\n', 'تقوم الثلاجات بأكثر من مجرد الاحتفاظ بالطعام والمشروبات في درجات حرارة مثالية ، وتتضمن العديد من أحدث الميزات وظيفة تكامل تمامًا مع حياتك وتساعد في حماية كوكب الأرض. يتم تقديم الأجهزة المحدثة في مجموعة من التشطيبات والتصميمات لاستيعاب أي ديكور وغالبًا ما تصبح النقطة المحورية الأنيقة في تصميم المطبخ. سواء كنت تبحث عن تحديث مطبخك الحالي أو تختار أجهزة لبناء جديد ، ستجد التكوين المناسب تناسب كل ميزانية وذوق وتطبيق.', 7, 1, 11, 7, '2022-01-19 18:22:29', '2022-01-20 14:51:22'),
(10, 'SunBoat Commerce Folding Round Table 80 Cm Set + 4', 'SunBoat Commerce طقم طى طاولة مستديرة 80 سم + 4 كر', '7000.00', '6745', 'foldableset.jpg', 'Folding table 80 cm + 4 folding chairs\r\nVersatile foldable set\r\nThis portable set is made of high-quality materials that are heavy-duty, suitable for indoor and outdoor use\r\nVery easy to maintain, smooth surface, easy to care, durable, maintenance free\r\nConforms to approved test and quality standards EN 581 - TUV - SGS - ISO9001 - BSCI - Eurofins\r\nMade in China - Import - 12 months warranty against manufacturing defects', 'طاولة طى 80 سم + 4 كراسي قابلة للطي\r\nمجموعة قابلة للطي متعددة الاستخدامات\r\nهذه المجموعة المحمولة مصنعة من خامات عالية الجودة شديدة تحمل الاوزان، مناسبة للاستخدام الداخلي والخارجي\r\nمن السهل جدًا الحفاظ على سطح أملس سهل العناية ومتين لا تحتاج الى صيانة \r\nمطابق لمعايير الاختبار والجودة المعتمدة EN 581 - TUV - SGS - ISO9001 - BSCI - Eurofins\r\nصنع في الصين - استيراد - ضمان 12 شهر ضد عيوب الصناعة\r\n', 2, 1, 11, NULL, '2022-01-19 18:30:25', '2022-01-20 14:51:48'),
(11, 'Samsung Galaxy A12', 'سامسونج جالكسي اي 12', '2700.00', '3456', 'Galaxy.jpg', '', '', 6, 1, 1, 2, '2022-01-19 18:37:38', '2022-01-20 14:52:01'),
(15, 'Huawei Free Buds Pro Earphones', 'سماعات هواوي فري بودز برو', '3500.00', '9775', 'freebuds.jpg', 'You will be able to enjoy the best sound quality in your ears. The new Huawei FreeBuds 3 Pro will give you all the sound quality you need, thanks to its 11mm drivers with 0.6mm width. A real pro model. It will provide the best sound quality with its ANC active noise cancellation which, thanks to its triple microphone, will reduce noise for a perfect, clear sound. Designed to be used everywhere, you can take them with you while traveling, studying, or working out. These are spectacular headphones, which stand out for its advanced active noise cancellation technology.', 'ستتمكن من الاستمتاع بأفضل جودة صوت في أذنيك. ستمنحك سماعة Huawei FreeBuds 3 Pro الجديدة جودة الصوت التي تحتاجها ، وذلك بفضل مشغلات 11 مم بعرض 0.6 مم. نموذج محترف حقيقي. سيوفر أفضل جودة صوت مع إلغاء الضوضاء النشط ANC والذي ، بفضل ميكروفونه الثلاثي ، سيقلل الضوضاء للحصول على صوت مثالي وواضح. مصممة للاستخدام في كل مكان ، يمكنك اصطحابها معك أثناء السفر أو الدراسة أو التمرين. هذه سماعات رأس مذهلة تتميز بتقنية إلغاء الضوضاء النشطة المتقدمة.', 1, 1, 13, 5, '2022-01-19 18:43:24', '2022-01-20 14:52:23'),
(17, 'LG 4K UHD 55UP7750PVB 55 Inch LED Smart TV to LG', 'LG 4K UHD 55UP7750PVB تلفزيون ليد سمارت الى جى 55 ', '10000.00', '56874', 'LG4K.jpg', 'True 4K UHD picture, great color and depthα5 AI Processor 4K AI Upscaling to 4K AI ThinQ AI webOS Smart TV with Magic Remote A true cinematic experience powered by Active HDR, Film Maker Mode and AI Sound Unlimited gaming fun with HGiG technologies , ALLM, HDMI 2.0 eARC', 'صورة UHD بدقة 4K حقيقية، بمستوى رائع من الألوان والعمقمعالج α5 بتقنية الذكاء الاصطناعي بدقة 4k مع زيادة مستوى إلى 4K بالذكاء الاصطناعيتلفزيون ThinQ AI webOS ذكي مع ريموت سحريتجربة سينمائية حقيقية مدعومة بتقنيات Active HDR، وFilm Maker Mode، وAI Soundمتعة لعب بلا حدود مع تقنيات HGiG، وALLM، وHDMI 2.0 eARC', 3, 1, 2, 6, '2022-01-19 18:50:53', '2022-01-20 14:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `products_spacs`
--

CREATE TABLE `products_spacs` (
  `space_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `value_ar` varchar(50) NOT NULL,
  `value_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_spacs`
--

INSERT INTO `products_spacs` (`space_id`, `product_id`, `value_ar`, `value_en`) VALUES
(1, 1, 'ذاكرة داخلية بسعة 8 جيجا بايت بسعة 2133 ميجا هرتز ', '8GB of 2133MHz LPDDR3 onboard memory'),
(2, 1, '256 جيجا بايت SSD', '256GB SSD'),
(3, 1, '1.4 جيجاهرتز رباعي النواة Intel Core i5 ، Turbo Bo', '1.4GHz quad-core Intel Core i5, Turbo Boost up to '),
(4, 1, 'macOS', 'macOS'),
(5, 3, 'حبل القطن الفانيلا PP', 'flannel pp cotton cotton rope'),
(6, 3, 'أزرق وردي أصفر', ' blue pink yellow'),
(11, 3, 'الحجم: الارتفاع 29 سم العرض 10 سم سمك 4 سم الوزن: ', 'Size: height 29cm width 10cm thickness 4cm Weight:');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `productct_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `value` enum('1','2','3','4','5','0') NOT NULL DEFAULT '0',
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`productct_id`, `user_id`, `value`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, '5', 'This is actually the second refurbished Apple product ive bought, but the first refurbished one off Amazon. Let me say.... a used, 5 year old model seems iffy, but looking at the brand new models I was sold on a refurbished one.\r\n\r\nI got this solely for the purpose of school. Im in paramedic school and needed a computer, I have an iphone and ipad (refurbished) and decided to stick with the apple theme. Upon opening it the mac is in pretty good condition, the top looks new, screen is crisp and clear, speakers work great, keyboard has zero issues. The battery charges to 100% and holds its charge well. The only cosmetic \"damage\" is on the bottom of the mac which is absolutely ok with me, and its just minor scuffing.\r\n\r\nIve had this thing 2 weeks now, and watching constant videos on the human anatomy, constantly doing/turning assignments in online, zoom class meetings, apple music lol and ive had no issues whatsoever. I do have until Oct to return if desired, which if it keeps up like it is I wont be returning it. Like other have said, if you want a mac but dont want to pay 1500+ for a new one, this is one great alternative!\r\n\r\n**UPDATE 02/21** Fast forward to February and this laptop is still going strong!! I use this for school as well as work and personal time. Absolutely no regrets here.', '2022-01-21 16:26:04', '2022-01-21 16:26:04'),
(1, 3, '1', 'Record your unboxing from very beginning to end and pack very well when sending back', '2022-01-21 16:26:04', '2022-01-21 16:26:25'),
(1, 4, '1', NULL, '2022-01-21 16:26:04', '2022-01-21 16:26:04'),
(2, 2, '5', 'nice', '2022-01-22 17:08:21', '2022-01-22 17:08:21'),
(2, 3, '5', 'very good', '2022-01-22 17:08:21', '2022-01-22 17:08:21'),
(2, 4, '5', 'nice', '2022-01-22 17:08:21', '2022-01-22 17:08:21'),
(9, 3, '5', 'good', '2022-01-22 16:34:48', '2022-01-22 16:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `name_en`, `name_ar`) VALUES
(1, 'Memory', 'الذاكرة'),
(2, 'Storage', 'تخزين'),
(3, 'Processor', 'المعالج'),
(4, 'Operating System', 'نظام التشغيل'),
(5, 'Material', 'مادة'),
(6, 'Color', 'اللون'),
(7, 'made in', 'صنع في'),
(8, 'Capacity in Liters', 'السعة باللتر'),
(9, 'Number Of Doors', 'عدد الابواب'),
(10, 'Communications', 'مجال الاتصالات'),
(11, 'Size and Weight', 'حجم والوزن'),
(12, 'Battery', 'بطارية'),
(13, 'Type', 'نوع'),
(14, 'Features', 'الميزات'),
(15, 'Screen size in inches', 'حجم الشاشة بالبوصة'),
(16, 'Internet connection', 'اتصال بالإنترنت'),
(17, 'Screen design', 'تصميم الشاشة');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name_en`, `name_ar`, `image`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', 'موبايل', 'default.jpg', 1, 1, '2022-01-19 16:49:36', '2022-01-19 16:49:36'),
(2, 'Tv', 'تليفزيون', 'default.jpg', 1, 1, '2022-01-19 16:49:36', '2022-01-19 16:49:36'),
(3, 'Laptop', 'لاب توب', 'default.jpg', 1, 1, '2022-01-19 16:49:36', '2022-01-19 16:49:36'),
(4, 'Desktops', 'جهاز مكتبي', 'default.jpg', 1, 1, '2022-01-19 17:07:06', '2022-01-19 17:07:06'),
(5, 'Beverages', 'المشروبات', 'default.jpg', 1, 2, '2022-01-19 17:07:06', '2022-01-19 17:07:06'),
(6, 'Houshold Cleaning', 'التنظيف المنزلي', 'default.jpg', 1, 2, '2022-01-19 17:07:06', '2022-01-19 17:07:40'),
(7, 'Foods', 'طعام', 'default.jpg', 1, 2, '2022-01-19 17:09:03', '2022-01-19 17:09:03'),
(8, 'Breakfast Foods', 'أغذية الإفطار', 'default.jpg', 1, 2, '2022-01-19 17:09:03', '2022-01-19 17:09:03'),
(9, 'Women\'s Fashion', 'أزياء نسائية', 'default.jpg', 1, 3, '2022-01-19 17:09:03', '2022-01-19 17:09:03'),
(10, 'Men\'s Fashion', 'أزياء رجالية', 'default.jpg', 1, 3, '2022-01-19 17:18:43', '2022-01-19 17:18:43'),
(11, 'kitchen & Dining', 'المطبخ والطعام', 'default.jpg', 1, 4, '2022-01-19 17:18:43', '2022-01-19 17:18:43'),
(12, 'Dog Toys', 'ألعاب للكلاب', 'default.jpg', 1, 6, '2022-01-19 17:18:43', '2022-01-19 17:18:43'),
(13, 'Mobile accessories', 'اكسسوارات الموبايل', 'default.jpg', 1, 1, '2022-01-19 18:45:19', '2022-01-19 18:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `image` varchar(50) DEFAULT 'default.jpg',
  `credit_card` tinyint(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 => not verifeid , 1=> verifeid , 2 => block',
  `code` mediumint(5) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `gender`, `image`, `credit_card`, `status`, `code`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(2, 'eman', 'mohamed', 'emmohamed902@gmail.com', '01151210476', 'ecbe87fb97519d7fb9f1c0fd803fb36ed8a63680', 'f', 'default.jpg', NULL, 1, 67815, '2022-01-17 18:20:27', '2022-01-17 18:19:57', '2022-01-17 18:20:27'),
(3, 'maha', 'mohamed', 'moha.elshawardy@gmail.com', '01066655142', 'ecbe87fb97519d7fb9f1c0fd803fb36ed8a63680', 'f', 'default.jpg', NULL, 2, 79834, '2022-01-17 18:23:45', '2022-01-17 18:22:45', '2022-01-17 18:23:56'),
(4, 'maher', 'mohamed', 'herotub@gmail.com', '01151210474', 'ecbe87fb97519d7fb9f1c0fd803fb36ed8a63680', 'm', 'default.jpg', NULL, 0, 19757, NULL, '2022-01-19 22:27:11', '2022-01-19 22:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`product_id`, `user_id`) VALUES
(1, 2),
(9, 4),
(10, 2),
(17, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_orders_fk` (`order_id`),
  ADD KEY `addresses_regions_fk` (`regions_id`),
  ADD KEY `addresses_users_fk` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `carts_users_fk` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`) USING HASH;

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD PRIMARY KEY (`product_id`,`offer_id`),
  ADD KEY `offers_products_offers_fk` (`offer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_coupons_fk` (`coupons_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `orders_products_orders_fk` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`) USING HASH,
  ADD KEY `products_brands_fk` (`brand_id`),
  ADD KEY `products_subcategories_fk` (`subcategory_id`);

--
-- Indexes for table `products_spacs`
--
ALTER TABLE `products_spacs`
  ADD PRIMARY KEY (`space_id`,`product_id`),
  ADD KEY `products_spacs_products_fk` (`product_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regions_cities_fk` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`productct_id`,`user_id`),
  ADD KEY `reviews_users_fk` (`user_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_categories_fk` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `woshlists_users_fk` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_regions_fk` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD CONSTRAINT `offers_products_offers_fk` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offers_products_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_coupons_fk` FOREIGN KEY (`coupons_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_products_producs_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brands_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_subcategories_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_spacs`
--
ALTER TABLE `products_spacs`
  ADD CONSTRAINT `products_spacs_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_spacs_spacs_fk` FOREIGN KEY (`space_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_cities_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_products_fk` FOREIGN KEY (`productct_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_categories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `woshlists_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
