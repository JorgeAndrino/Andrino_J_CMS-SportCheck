-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-04-2019 a las 03:28:35
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categories`
--

INSERT INTO `tbl_categories` (`category_id`, `category_name`) VALUES
(1, 'Men'),
(2, 'Women'),
(3, 'Kids'),
(4, 'Shoes'),
(5, 'Electronics'),
(6, 'Gear'),
(7, 'Jerseys');

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
(35, 35, 7),
(34, 34, 7),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(33, 33, 7),
(32, 32, 7),
(11, 11, 3),
(12, 12, 3),
(13, 13, 3),
(14, 14, 3),
(15, 15, 3),
(31, 31, 7),
(30, 30, 6),
(16, 16, 4),
(17, 17, 4),
(18, 18, 4),
(19, 19, 4),
(20, 20, 4),
(29, 29, 6),
(28, 28, 6),
(21, 21, 5),
(22, 22, 5),
(23, 23, 5),
(24, 24, 5),
(25, 25, 5),
(27, 27, 6),
(26, 26, 6);

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
(35, 'a-Dallas-Cowboys-Dak-Prescott-Football-Jersey.png', 'Dallas Cowboys Dak Prescott Football Jersey', 'The Dallas Cowboys Dak Prescott Limited Football Jersey is made for the passionate fan looking for a jersey that combines authentic team detailing with everyday style.', '$150.00'),
(34, 'a-PSG-2018-19-Nike-Home-Jersey.png', 'PSG 2018/19 Nike Men\'s Breathe Home Stadium Jersey', 'The Nike Breathe Paris Saint-Germain Home Stadium Men’s Short-Sleeve Jersey brings team pride details, such as a woven crest, together with performance elements like highly breathable fabric to help you stay dry and cool.', '$110.00'),
(6, 'a-PUMA-Womens-SG-x-PUMA-Full-Zip-Hoodie.png', 'PUMA Women\'s SG x PUMA Full Zip Hoodie', 'The Selena Gomez collection has strength stitched into every piece. It’s inspired by, and designed for, the strong girl. Not strong in the sense of power, but strong in her passions, her expression, and strong in how she wants to leave her mark on the world. She’s compassionate, but uncompromising. Fearless, but approachable. She draws from the legacy of strong women before her to create the future she’s always wanted. You know, the strong women who challenged and questioned and carved out their own space, and who looked damn good while doing it. Slip on this comfortable zip hoodie to complete your laidback Strong Girl look. With a mesh lined hood and Selena Gomez x PUMA applique on the back, you can channel your inner strength to take on the day.', '$169.99'),
(7, 'a-Nike-Pro-Womens-All-Over-Mesh-Tank.png', 'Nike Pro Women\'s All Over Mesh Tank', 'The Nike Pro Women\'s Mesh Tank has a fitted silhouette perfect for layering or wearing solo. Its nonrestrictive design allows for a wider range of mobility, while its mesh fabrication helps you stay cool during the heat of your workout.', '$35.00'),
(8, 'a-Arcteryx-Womens-A-Squared-T-Shirt-Cloudburst.png', 'Arc\'teryx Women\'s A Squared T Shirt - Cloudburst', 'Women’s T-shirt featuring a flocked Arc’teryx ’A’ graphic on the front. Made from organically grown cotton with elastane fibres added for comfort stretch.', '$39.99'),
(9, 'a-Roxy-Womens-Hidden-Star-Reversible-Bomber-Jacket.png', 'Roxy Women\'s Hidden Star Reversible Bomber Jacket', 'Women\'s reversible sateen bomber jacket fashioned in lightweight polyester sateen fabric, with a comfortable regular fit with set-in sleeves, and finished with a full reversible lining [can be worn either side.', '$99.99'),
(10, 'a-Nike-Pro-Womens-Tights.png', 'Nike Pro Women\'s Tights', 'An ideal base layer for high-intensity training, the Nike Pro Women’s Tights deliver sweat-wicking power in a tight fitting silhouette that flatters your shape from hip to hem. The wide elastic waistband secures the fit while mesh panels at the lower legs enhance breathability.', '$64.00'),
(33, 'a-Toronto-Blue-Jays-Marcus-Stroman-Baseball-Jersey.png', 'Toronto Blue Jays Marcus Stroman Baseball Jersey', 'With its tapered fit the Toronto Blue Jays Marcus Stroman Women\'s Baseball Jersey is a feminine way to show the world who your favourite player is. The pitcher\'s appear right on the back of this just-for-the-ladies version of an official game jersey.', '$129.99'),
(32, 'a-Toronto-Raptors-Nike-Lin-Swingman-Icon-Jersey.png', 'Toronto Raptors Nike Lin Swingman Icon Jersey', 'Based on the authentic NBA jersey, the Icon Edition Swingman (Toronto Raptors) Men’s Nike NBA Connected Jersey lets you rep your team while helping keep you cool and comfortable through every move.', '$130.00'),
(11, 'a-Under-Armour-Boys-Mega-Duo-Logo-T-Shirt.png', 'Under Armour Boys\' Mega Duo Logo T Shirt', 'This Charged Cotton® T Shirt has the comfort of cotton, but dries much faster. Perfect for the those days of chaos - keep cool and comfortable all day long.', '$24.99'),
(12, 'a-Under-Armour-Girls-Novelty-Short-Sleeve-Tee.png', 'Under Armour Girls\' Novelty Short Sleeve Tee', 'UA Tech™ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.', '$29.99'),
(13, 'a-Under-Armour-Boys-Rival-UA-Logo-Hoodie.png', 'Under Armour Boys\' Rival UA Logo Hoodie', 'The Under Armour Boys\' Rival UA Logo Hoodie is a lightweight, ultra-comfortable cotton-blend fleece. Enjoy a loose fit with a fuller cut for complete comfort.', '$49.99'),
(14, 'a-Under-Armour-Girls-Rival-Terry-Hoodie.png', 'Under Armour Girls\' Rival Terry Hoodie', 'If you want to stay comfy, warmed-up and ready before the game—or after—this is what you wear. We call it \"Rival Terry.\" You can just call it your new favorite.', '$49.99'),
(15, 'a-Ripzone-Boys-Relaxed-Fit-Jeans-Blue.png', 'Ripzone Boys\' Relaxed Fit Jeans - Blue', 'Sport Chek is proud to offer the Ripzone Boys Relaxed Fit Jean. This denim is soft, fitted and stretchy and feature a snap button center front with a zipper fly and interior waist adjustment for that perfect comfortable fit.', '$14.97'),
(16, 'a-ASICS-Mens-Running-Shoes-GreyBlack.png', 'ASICS Men\'s Running Shoes - Grey/Black', 'Exceptional performance meets incredible value. With its balanced support and guided stability, the sleek GT-1000® 7 road stability running shoe for men has been created to protect your feet and help you run further than ever before. Suitable for mid to long-distance runners, the GT-1000® 7 shoe features cutting-edge GEL® technology which combines with a responsive FLYTEFOAM® and SpEVA® foam midsole for exceptional bounce back and comfort. The DUOMAX® support system and GUIDANCE LINE® system maintain the structural integrity of the shoe while reducing the overall weight, so feet feel incredibly lightweight yet supported. Featuring an ORTHOLITE® sockliner and a durable AHAR® outsole, this is footwear built to last and will provide support on every step of your journey. ', '$139.99'),
(17, 'a-adidas-Mens-Training-Shoes-BlueWhiteBlack.png', 'adidas Men\'s Training Shoes - Blue/White/Black', 'These adidas Men’s Duramo 9 Training Shoes feature a durable two-layer mesh upper for breathability and a seamless print overlay for additional support. Pillow-soft Cloudfoam cushions every stride, while the durable outsole provides long-lasting wear.', '$89.99'),
(18, 'a-Nike-Mens-LeBron-15-Basketball-Shoes-Black.png', 'Nike Men\'s LeBron 15 Basketball Shoes - Black', 'The Nike Men\'s LeBron 15 Shoe delivers premium innovation that heralds a totally new direction for LeBron James. The shoe features durable Battleknit construction and an advanced cushioning system—both designed expressly for the greatest player in the world.', '$242.99'),
(19, 'a-Nike-Phantom-Venom-Academy-Shoes-RedBlack.png', 'Nike Phantom Venom Academy Shoes - Red/Black', 'The Men\'s Phantom Venom Academy Firm Ground Shoes are engineered for powerful, precise strikes that win games. Ridges on the instep create spin to control the flight of the ball, while the firm-ground plate provides the traction needed to unleash at any moment.', '$104.99'),
(20, 'a-New-Balance-Mens-Baseball-Cleats-Black-White.png', 'New Balance Men\'s Baseball Cleats - Black/White', 'One of the most innovative spikes the game has seen to date, the New Balance COMPv1 offers comparable performance of a metal spike, with the comfort of a TPU spike. At 11.8 oz it will have you blazing around the base paths, and with a supportive Fantom Frame upper, you are sure to have the stability you need to keep you on the field.', '$219.99'),
(31, 'a-Toronto-Maple-Leafs-Fanatics-Marner-Home-Jersey.png', 'Toronto Maple Leafs Fanatics Marner Home Jersey', 'Introducing the Breakaway by Fanatics - the official jersey made just for the fans. From the world’s largest collection of officially licensed gear comes the first jersey inspired and built by fans for fans. We asked NHL devotees what they wanted in a new jersey. We listened and we delivered, creating a jersey with an exclusive set of features designed for the fan.', '$169.99'),
(29, 'a-Wilson-NCAA-Solution-Official-Game-Basketball.png', 'Wilson NCAA Solution Official Game Basketball', 'The Wilson Solution basketball is the official game ball of the NCAA and March Madness. Built with a cushion core which has superior softness and grip making those slick moves on the court much easier. ', '$89.99'),
(30, 'a-adidas-World-Cup-2018-Mini-Soccer-Ball.png', 'adidas World Cup 2018 Mini Soccer Ball', 'A mini replica of the full-size ball used in 2018 FIFA World Cup™ matches, this football features an innovative panel shape. Inspired by Russia\'s urban landscapes, its pixelated graphic pays tribute to the iconic Telstar ball. A foam core ensures it\'s always ready to roll when you want to unleash your skills.', '$13.97'),
(21, 'a-Fitbit-Versa-Lite-Smart-Watch-White.png', 'Fitbit Versa Lite Smart Watch - White', 'Open a world of possibilities with Fitbit Versa™ Lite Edition, the versatile, everyday smartwatch. With all the core fitness and smart features, vibrant colors and an easy one-button design, this watch will inspire you to live boldly and make your goals reality.', '$199.95'),
(22, 'a-GoPro-HERO7-White-Edition-Action-Camera.png', 'GoPro HERO7 White Edition Action Camera', 'Say hello to New GoPro HERO 7 White, the perfect partner on any adventure. It’s tough, tiny and totally waterproof so it can go wherever you do. An intuitive touch screen makes it simple to get great shots. Just swipe and tap. Use the photo timer to grab a sweet selfie. You can even shoot vertically then add your photos and videos right to your Instagram Story. Your shots move to the GoPro app automatically to share on the spot. From awesome moments to everyday experiences, capture the fun in creative new ways with GoPro HERO 7 White edition.', '$269.99'),
(23, 'a-Garmin-fēnix-5-GPS-Watch-Slate-Grey--Black-Band.png', 'Garmin fēnix 5 GPS Watch - Slate Grey Black Band', 'Beat yesterday all day, every day. fēnix 5 is the premium multisport GPS watch with wrist-based heart rate, advanced fitness features and interchangeable bands that let you go from workplace to workout without breaking stride. Whatever sport you want to track, fēnix 5 has it covered, thanks to built-in activity profiles and performance metrics plus smart notifications.', '$519.99'),
(24, 'a-44-alu-space-nike-sport-anth-black.png', 'Apple Watch Nike with Black Nike Sport Band', 'Apple Watch Nike+ is the perfect running partner with the Nike Run Club app. But for most people, that’s just one facet of their training. That’s why Nike created the Nike Training Club app to let you tap into a world of different workouts and experts. Together they’ll help you build the endurance and strength to take your fitness to the next level.', '$559.00'),
(25, 'a-Beats-Solo3-Wireless-Headphones–GlossBlack.png', 'Beats Solo3 Wireless Headphones – Gloss Black', 'With up to 40 hours of battery life, Beats Solo3 Wireless is your perfect everyday headphone. Get the most out of your music with an award-winning, emotionally charged Beats listening experience.', '$329.99'),
(27, 'a-Nike-Brasilia-XL-Backpack-Black.png', 'Nike Brasilia XL Backpack - Black', 'The Nike Brasilia Training Backpack (Extra Large) is built for secure storage, with multiple zippered pockets inside and out. Its durable design includes padded shoulder straps for comfort on the go.', '$55.00'),
(28, 'a-Mizuno-Finch-Fastpitch-Bat-13.png', 'Mizuno Finch Fastpitch Bat (-13)', 'The Mizuno Finch Fastpitch Softball bat is part of the Jennie Finch Collection created with the softball player’s specific needs in focus. MZ-2200+ Alloy for lightweight swing weight. Cushioned Grip for comfort and a soft feel. One Year Warranty.', '$99.99'),
(26, 'a-Diadora-Artico-26-Fatbike-2019.png', 'Diadora Artico 26\" Fatbike - 2019', 'Go places you’ve never biked before with the Diadora Artico fat bike. The 4.9” wide tires provide exceptional grip and floatation on all surfaces. The all-weather Artico performs great in muddy conditions and sandy soft terain but where it really shines is on your favorite winter snow covered trails. No more putting the bike away for the winter when you ride the versatile Artico.', '$1,199.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(80) NOT NULL,
  `user_password` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_fname`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Admin', 'George', 'admin@email.com', 'password');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
