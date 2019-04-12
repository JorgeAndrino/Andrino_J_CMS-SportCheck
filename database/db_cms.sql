-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-04-2019 a las 16:39:41
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_cms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categories`
--

DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE IF NOT EXISTS `tbl_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids'),
(4, 'Shoes'),
(5, 'Electronics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_product-categories`
--

DROP TABLE IF EXISTS `tbl_product-categories`;
CREATE TABLE IF NOT EXISTS `tbl_product-categories` (
  `product-category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product-category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_product-categories`
--

INSERT INTO `tbl_product-categories` (`product-category_id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 3),
(16, 16, 3),
(17, 17, 3),
(18, 18, 3),
(19, 19, 3),
(20, 20, 3),
(21, 21, 3),
(22, 22, 4),
(23, 23, 4),
(24, 24, 4),
(25, 25, 4),
(26, 26, 4),
(27, 27, 4),
(28, 28, 4),
(29, 29, 5),
(30, 30, 5),
(31, 31, 5),
(32, 32, 5),
(33, 33, 5),
(34, 34, 5),
(35, 35, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_img` varchar(55) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_desc` text NOT NULL,
  `product_price` varchar(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_products`
--

INSERT INTO `tbl_products` (`product_id`, `product_img`, `product_name`, `product_desc`, `product_price`) VALUES
(1, 'a-Hurley-Mens-Crone-Crew-Sweater-Obsidian-Heather.png', 'Hurley Men\'s Crone Crew Sweater - Obsidian Heather', 'The Hurley Crone Crew is a two-toned sweater made with soft marled fleece and raglan sleeves that makes your everyday outfit more unique and comfortable.', '$61.99'),
(2, 'a-Champion-Mens-Powerblend-Fleece-Full-Zip-Hoodie.png', 'Champion Men\'s Powerblend Fleece Full Zip Hoodie', 'With a loose and comfortable fit, the Champion Powerblend Full Zip Hoodie is the staple fleece sweater for your active closet. This classic piece has two hand pockets and a drawstring hood.', '$59.99'),
(3, 'a-ONeill-Mens-Record-T-Shirt-Burgundy-Heather.png', 'O\'Neill Men\'s Record T Shirt - Burgundy Heather', 'Showcasing a record soft-hand screen print graphic, the O’Neill Men’s Record T Shirt - Burgundy Heather gives a nod to vintage style. At the same time, the slim fit gives the blended cotton tee a mod silhouette.', '$31.99'),
(4, 'a-PUMA-Mens-Ace-Tank.png', 'PUMA Men\'s Ace Tank', 'Performance wear designed to match your level of performance. Stay dry and comfortable with PUMA’s signature training material, dryCELL technology, engineered for a lightweight, breathable fit and mesh panels for added ventilation and comfort.', '$39.99'),
(5, 'a-Quiksilver-Mens-Highline-Boardshorts-Blue', 'Quiksilver Men\'s Highline Boardshorts - Blue', 'Men’s board shorts made from REPREVE™ traceable, recycled 4-way stretch polyester made from plastic bottles, with a DryFlight® water-repellent hydrophobic coating, and finished with a 19\" outseam for an on the knee length.', '$69.99'),
(6, 'a-Champion-Mens-Powerblend-Fleece-Open-Bottom-Pants.png', 'Champion Men\'s Powerblend Fleece Open Bottom Pants', 'A classic sweatpant, the Champion Powerblend Pants have open bottom pants legs for a looser fit and have two hand pockets for your essentials. Relax all day with the comfortable fleece fabric.', '$49.99'),
(7, 'a-Jordan-Ultimate-Flight-Quarter-Basketball-Socks', 'Jordan Ultimate Flight Quarter Basketball Socks', 'The Jordan Ultimate Flight Quarter 2.0 Basketball Socks feature a plush design with targeted cushioning to help keep you comfortable on the court. Mesh ventilation zones and sweat-wicking technology help keep you cool and dry through the 4th quarter.', '$22.00'),
(8, 'a-PUMA-Womens-SG-x-PUMA-Full-Zip-Hoodie.png', 'PUMA Women\'s SG x PUMA Full Zip Hoodie', 'The Selena Gomez collection has strength stitched into every piece. It’s inspired by, and designed for, the strong girl. Not strong in the sense of power, but strong in her passions, her expression, and strong in how she wants to leave her mark on the world. She’s compassionate, but uncompromising. Fearless, but approachable. She draws from the legacy of strong women before her to create the future she’s always wanted. You know, the strong women who challenged and questioned and carved out their own space, and who looked damn good while doing it. Slip on this comfortable zip hoodie to complete your laidback Strong Girl look. With a mesh lined hood and Selena Gomez x PUMA applique on the back, you can channel your inner strength to take on the day.', '$169.99'),
(9, 'a-Nike-Pro-Womens-All-Over-Mesh-Tank.png', 'Nike Pro Women\'s All Over Mesh Tank', 'The Nike Pro Women\'s Mesh Tank has a fitted silhouette perfect for layering or wearing solo. Its nonrestrictive design allows for a wider range of mobility, while its mesh fabrication helps you stay cool during the heat of your workout.', '$35.00'),
(10, 'a-Arcteryx-Womens-A-Squared-T-Shirt-Cloudburst.png', 'Arc\'teryx Women\'s A Squared T Shirt - Cloudburst', 'Women’s T-shirt featuring a flocked Arc’teryx ’A’ graphic on the front. Made from organically grown cotton with elastane fibres added for comfort stretch.', '$39.99'),
(11, 'a-Roxy-Womens-Hidden-Star-Reversible-Bomber-Jacket.png', 'Roxy Women\'s Hidden Star Reversible Bomber Jacket', 'Women\'s reversible sateen bomber jacket fashioned in lightweight polyester sateen fabric, with a comfortable regular fit with set-in sleeves, and finished with a full reversible lining [can be worn either side.', '$99.99'),
(12, 'a-Nike-Pro-Womens-Tights.png', 'Nike Pro Women\'s Tights', 'An ideal base layer for high-intensity training, the Nike Pro Women’s Tights deliver sweat-wicking power in a tight fitting silhouette that flatters your shape from hip to hem. The wide elastic waistband secures the fit while mesh panels at the lower legs enhance breathability.', '$64.00'),
(13, 'a-ONeill-Womens-Margot-Knit-Stripe-Dress.png', 'O\'Neill Women\'s Margot Knit Stripe Dress', 'O’Neill’s Margot Dress is a simple striped dress and a great addition to your wardrobe. Pair with flat or heeled sandals for versatile look.', '$28.88'),
(14, 'a-Nike-Womens-Infinity-Sports-Bra.png', 'Nike Women\'s Infinity Sports Bra', 'With soft, adjustable elastic straps and an adjustable chest band, the Nike Infinity Women\'s Medium Support Sports Bra provides a personalized fit. Cut-out details on the sides and back enhance breathability, while the wide U-shaped neckline flatters your shape.', '$64.00'),
(15, 'a-Under-Armour-Boys-Mega-Duo-Logo-T-Shirt.png', 'Under Armour Boys\' Mega Duo Logo T Shirt', 'This Charged Cotton® T Shirt has the comfort of cotton, but dries much faster. Perfect for the those days of chaos - keep cool and comfortable all day long.', '$24.99'),
(16, 'a-Under-Armour-Girls-Novelty-Short-Sleeve-Tee.png', 'Under Armour Girls\' Novelty Short Sleeve Tee', 'UA Tech™ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.', '$29.99'),
(17, 'a-Under-Armour-Boys-Rival-UA-Logo-Hoodie.png', 'Under Armour Boys\' Rival UA Logo Hoodie', 'The Under Armour Boys\' Rival UA Logo Hoodie is a lightweight, ultra-comfortable cotton-blend fleece. Enjoy a loose fit with a fuller cut for complete comfort.', '$49.99'),
(18, 'a-Under-Armour-Girls-Rival-Terry-Hoodie.png', 'Under Armour Girls\' Rival Terry Hoodie', 'If you want to stay comfy, warmed-up and ready before the game—or after—this is what you wear. We call it \"Rival Terry.\" You can just call it your new favorite.', '$49.99'),
(19, 'a-Ripzone-Boys-Relaxed-Fit-Jeans-Blue.png', 'Ripzone Boys\' Relaxed Fit Jeans - Blue', 'Sport Chek is proud to offer the Ripzone Boys Relaxed Fit Jean. This denim is soft, fitted and stretchy and feature a snap button center front with a zipper fly and interior waist adjustment for that perfect comfortable fit.', '$14.97'),
(20, 'a-Under-Armour-Girls-Novelty-ColdGear-Leggings.png', 'Under Armour Girls\' Novelty ColdGear Leggings', 'Is it cold out? We didn\'t notice. We were too distracted by those awesome prints and patterns that heat up any chilly day.', '$49.99'),
(21, 'a-Under-Armour-Boys-UA-Stunt-Printed-Shorts.png', 'Under Armour Boys\' UA Stunt Printed Shorts', 'The Under Armour Boys’ Stunt Printed Shorts are smooth, lightweight, fast-drying fabric for superior performance. Enjoy a loose fit with a fuller cut for complete comfort.', '$20.97'),
(22, 'a-ASICS-Mens-Running-Shoes-GreyBlack.png', 'ASICS Men\'s Running Shoes - Grey/Black', 'Exceptional performance meets incredible value. With its balanced support and guided stability, the sleek GT-1000® 7 road stability running shoe for men has been created to protect your feet and help you run further than ever before. Suitable for mid to long-distance runners, the GT-1000® 7 shoe features cutting-edge GEL® technology which combines with a responsive FLYTEFOAM® and SpEVA® foam midsole for exceptional bounce back and comfort. The DUOMAX® support system and GUIDANCE LINE® system maintain the structural integrity of the shoe while reducing the overall weight, so feet feel incredibly lightweight yet supported. Featuring an ORTHOLITE® sockliner and a durable AHAR® outsole, this is footwear built to last and will provide support on every step of your journey. ', '$139.99'),
(23, 'a-adidas-Mens-Training-Shoes-BlueWhiteBlack.png', 'adidas Men\'s Training Shoes - Blue/White/Black', 'These adidas Men’s Duramo 9 Training Shoes feature a durable two-layer mesh upper for breathability and a seamless print overlay for additional support. Pillow-soft Cloudfoam cushions every stride, while the durable outsole provides long-lasting wear.', '$89.99'),
(24, 'a-Nike-Mens-LeBron-15-Basketball-Shoes-Black.png', 'Nike Men\'s LeBron 15 Basketball Shoes - Black', 'The Nike Men\'s LeBron 15 Shoe delivers premium innovation that heralds a totally new direction for LeBron James. The shoe features durable Battleknit construction and an advanced cushioning system—both designed expressly for the greatest player in the world.', '$242.99'),
(25, 'a-Nike-Phantom-Venom-Academy-Shoes-RedBlack.png', 'Nike Phantom Venom Academy Shoes - Red/Black', 'The Men\'s Phantom Venom Academy Firm Ground Shoes are engineered for powerful, precise strikes that win games. Ridges on the instep create spin to control the flight of the ball, while the firm-ground plate provides the traction needed to unleash at any moment.', '$104.99'),
(26, 'a-New-Balance-Mens-Baseball-Cleats-Black-White.png', 'New Balance Men\'s Baseball Cleats - Black/White', 'One of the most innovative spikes the game has seen to date, the New Balance COMPv1 offers comparable performance of a metal spike, with the comfort of a TPU spike. At 11.8 oz it will have you blazing around the base paths, and with a supportive Fantom Frame upper, you are sure to have the stability you need to keep you on the field.', '$219.99'),
(27, 'a-Helly-Hansen-Mens-Stockholm-Boots-Black.png', 'Helly Hansen Men\'s Stockholm Boots - Black', 'Come rain or shine, these stylish sneaker-boots are the epitome of Scandinavian design. No winter is complete without its fare share of snow and ice, and these warm, protective, comfortable, and lightweight boots can tackle all conditions with ease.', '$111.97'),
(28, 'a-Vans-Mens-Classic-Slip-On-Shoes-BlackWhite.png', 'Vans Men\'s Classic Slip-On Shoes - Black/White', 'The Classic Slip-Ons need no one to sing their praises; they have become such a part of skate culture and contemporary style, effortlessly proving their iconoclastic relevance from the skate spot to the big screen and every walk of life around the globe. Their popularity comes from unmatched quality, and they have hence become a big time influence on Van’s Off The Wall efforts to innovate, every step of the way.', '$65.00'),
(29, 'a-Fitbit-Versa-Lite-Smart-Watch-White.png', 'Fitbit Versa Lite Smart Watch - White', 'Open a world of possibilities with Fitbit Versa™ Lite Edition, the versatile, everyday smartwatch. With all the core fitness and smart features, vibrant colors and an easy one-button design, this watch will inspire you to live boldly and make your goals reality.', '$199.95'),
(30, 'a-GoPro-HERO7-White-Edition-Action-Camera.png', 'GoPro HERO7 White Edition Action Camera', 'Say hello to New GoPro HERO 7 White, the perfect partner on any adventure. It’s tough, tiny and totally waterproof so it can go wherever you do. An intuitive touch screen makes it simple to get great shots. Just swipe and tap. Use the photo timer to grab a sweet selfie. You can even shoot vertically then add your photos and videos right to your Instagram Story. Your shots move to the GoPro app automatically to share on the spot. From awesome moments to everyday experiences, capture the fun in creative new ways with GoPro HERO 7 White edition.', '$269.99'),
(31, 'a-Garmin-fēnix-5-GPS-Watch-Slate-Grey--Black-Band.png', 'Garmin fēnix 5 GPS Watch - Slate Grey Black Band', 'Beat yesterday all day, every day. fēnix 5 is the premium multisport GPS watch with wrist-based heart rate, advanced fitness features and interchangeable bands that let you go from workplace to workout without breaking stride. Whatever sport you want to track, fēnix 5 has it covered, thanks to built-in activity profiles and performance metrics plus smart notifications.', '$519.99'),
(32, 'a-44-alu-space-nike-sport-anth-black.png', 'Apple Watch Nike with Black Nike Sport Band', 'Apple Watch Nike+ is the perfect running partner with the Nike Run Club app. But for most people, that’s just one facet of their training. That’s why Nike created the Nike Training Club app to let you tap into a world of different workouts and experts. Together they’ll help you build the endurance and strength to take your fitness to the next level.', '$559.00'),
(33, 'a-Beats-Solo3-Wireless-Headphones–GlossBlack.png', 'Beats Solo3 Wireless Headphones – Gloss Black', 'With up to 40 hours of battery life, Beats Solo3 Wireless is your perfect everyday headphone. Get the most out of your music with an award-winning, emotionally charged Beats listening experience.', '$329.99'),
(34, 'a-JBL-Endurance-SPRINT.png', 'JBL Endurance SPRINT Wireless Headphones - Blue', 'Let nothing stop your workout. Wireless and IPX7 waterproof, the JBL Endurance SPRINT headphones are always up for a run, and with Speed Charge you can get an hour of listening time after charging the 8hr battery for just 10 minutes. Supremely comfortable with FlexSoft™ ear tips and TwistLock™ technology, these secure fi t buds were designed from the ground up to amplify your workout. They’re guaranteed never to hurt or fall out, while touch controls let you easily manage music and MagHook™ lets you secure them conveniently close at hand when you’re done using them. ', '$69.99'),
(35, 'a-Fitbit-Aria-2-Wi-Fi-Smart-Scale-Black.png', 'Fitbit Aria 2 Wi-Fi Smart Scale - Black', 'Get a clear picture of your health with the Fitbit Aria 2™ Wi-Fi Smart Scale. Easy to set up and even easier to use, this sleek scale measures weight, body fat, lean mass and BMI. Your stats sync automatically to the Fitbit app, so you can see how everything you do adds up—from steps to exercise to nutrition.', '$169.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(30) NOT NULL,
  `user_email` varchar(80) NOT NULL,
  `user_password` varchar(10) NOT NULL,
  `user_token` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_fname`, `user_email`, `user_password`, `user_token`) VALUES
(1, 'George', 'admin@email.com', 'password', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
