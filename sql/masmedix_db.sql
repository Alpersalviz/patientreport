-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 May 2017, 17:05:00
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `masmedix_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `branches`
--

INSERT INTO `branches` (`id`, `contact_id`, `title`, `lang`) VALUES
(5, 3, 'Genel Müdürlük', 'tr'),
(6, 3, 'Head Office', 'en'),
(7, 4, 'Antalya Şubesi', 'tr'),
(8, 4, 'Antalya Branch', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '99999',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `slug`, `position`) VALUES
(1, 0, 'vascutek', 5),
(2, 0, 'sorin', 99999),
(3, 0, 'maquet', 2),
(4, 0, 'oryamed', 6),
(5, 0, 'pulsecath', 4),
(14, 7, 'interventional-cardiology', 99999),
(7, 0, 'boston', 1),
(8, 0, 'ekos', 3),
(9, 1, 'polyester', 99999),
(10, 1, 'eptfe', 99999),
(11, 1, 'anaconda', 99999),
(12, 1, 'biovalsalva', 99999),
(13, 1, 'gelweave', 99999),
(15, 7, 'radiology', 99999),
(16, 7, 'urology', 99999),
(17, 7, 'womens-health', 99999),
(18, 7, 'gastroenterology', 99999),
(19, 2, 'mechanical-valves-appl', 99999),
(20, 2, 'mechanical-valves-cpl', 99999),
(21, 3, 'on-pump-cardiac-surgery', 99999),
(29, 3, 'beating-heart-surgery', 99999),
(28, 3, 'cardiac-assist', 99999),
(26, 3, 'vascular-surgery', 99999),
(32, 29, 'heart-positioners', 99999),
(31, 29, 'heart-strabilizers', 99999),
(33, 29, 'clampless-proximal-anastomosis-', 99999),
(34, 29, 'heart-accessories', 99999),
(35, 0, 'heartware', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories_info`
--

CREATE TABLE IF NOT EXISTS `categories_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Tablo döküm verisi `categories_info`
--

INSERT INTO `categories_info` (`id`, `category_id`, `name`, `lang`) VALUES
(1, 1, 'Vascutek', 'tr'),
(2, 1, 'Vascutek', 'en'),
(3, 2, 'Sorin', 'tr'),
(4, 2, 'Sorin', 'en'),
(5, 3, 'Maquet', 'tr'),
(6, 3, 'Maquet', 'en'),
(7, 4, 'Oryamed', 'tr'),
(8, 4, 'Oryamed', 'en'),
(9, 5, 'Pulsecath', 'tr'),
(10, 5, 'Pulsecath', 'en'),
(27, 14, 'Interventional Cardiology', 'tr'),
(13, 7, 'Boston', 'tr'),
(14, 7, 'Boston', 'en'),
(15, 8, 'Ekos', 'tr'),
(16, 8, 'Ekos', 'en'),
(17, 9, 'Polyester', 'tr'),
(18, 9, 'Polyester', 'en'),
(19, 10, 'ePTFE', 'tr'),
(20, 10, 'ePTFE', 'en'),
(21, 11, 'Anaconda', 'tr'),
(22, 11, 'Anaconda', 'en'),
(23, 12, 'BioValsalva', 'tr'),
(24, 12, 'BioValsalva', 'en'),
(25, 13, 'Gelweave', 'tr'),
(26, 13, 'Gelweave', 'en'),
(28, 14, 'Interventional Cardiology', 'en'),
(29, 15, 'Radiology', 'tr'),
(30, 15, 'Radiology', 'en'),
(31, 16, 'Urology', 'tr'),
(32, 16, 'Urology', 'en'),
(33, 17, 'Women''s Health', 'tr'),
(34, 17, 'Women''s Health', 'en'),
(35, 18, 'Gastroenterology', 'tr'),
(36, 18, 'Gastroenterology', 'en'),
(37, 19, 'Mechanical Valves - APPL', 'tr'),
(38, 19, 'Mechanical Valves - APPL', 'en'),
(39, 20, 'Mechanical Valves - CPL', 'tr'),
(40, 20, 'Mechanical Valves - CPL', 'en'),
(41, 21, 'On-Pump Cardiac Surgery', 'tr'),
(42, 21, 'On-Pump Cardiac Surgery', 'en'),
(56, 28, 'Cardiac Assist', 'en'),
(55, 28, 'Cardiac Assist', 'tr'),
(52, 26, 'Vascular Surgery', 'en'),
(51, 26, 'Vascular Surgery', 'tr'),
(57, 29, 'Beating Heart Surgery', 'tr'),
(58, 29, 'Beating Heart Surgery', 'en'),
(62, 31, 'Heart Strabilizers', 'en'),
(61, 31, 'Heart Strabilizers', 'tr'),
(63, 32, 'Heart Positioners', 'tr'),
(64, 32, 'Heart Positioners', 'en'),
(65, 33, 'Clampless Proximal Anastomosis', 'tr'),
(66, 33, 'Clampless Proximal Anastomosis', 'en'),
(67, 34, 'Heart Accessories', 'tr'),
(68, 34, 'Heart Accessories', 'en'),
(69, 35, 'Heartware', 'tr'),
(70, 35, 'Heartware', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text NOT NULL,
  `phone` varchar(25) NOT NULL,
  `fax` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `maps` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Tablo döküm verisi `contact`
--

INSERT INTO `contact` (`id`, `address`, `phone`, `fax`, `email`, `maps`) VALUES
(3, 'Ankara Caddesi Ünal Atalay İş Merkezi No:22 B Blok K:4 D:404 Çınarlı - Konak / İZMİR', '+90 (232) 435 50 30 (Pbx)', '+90 (232) 435 80 30', 'info@masmedikal.com', '<iframe width="380" height="240" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&msid=202314759242106501993.0004c1f778326ba6359a2&ie=UTF8&t=h&ll=38.446111,27.176973&spn=0,0&output=embed"></iframe>'),
(4, 'Meydan Kavağı Mah. 1584 Sk. No:5 Saniye Alaylı Sitesi B Blok D:3 Muratpaşa - ANTALYA', '+90 (242) 321 01 12', '+90 (242) 321 01 14', 'info@masmedikal.com', '<iframe width="380" height="240" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&msid=202314759242106501993.0004c4c76f890216ec322&ie=UTF8&t=h&ll=36.877134,30.731506&spn=0,0&output=embed"></iframe> ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `deviceID` int(20) NOT NULL AUTO_INCREMENT,
  `HVADPumpID` varchar(50) NOT NULL,
  PRIMARY KEY (`deviceID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `device`
--

INSERT INTO `device` (`deviceID`, `HVADPumpID`) VALUES
(1, 'HW1216'),
(2, 'HW1214');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `device_of_patient`
--

CREATE TABLE IF NOT EXISTS `device_of_patient` (
  `device_of_patientID` int(20) NOT NULL AUTO_INCREMENT,
  `patientID` varchar(70) NOT NULL,
  `deviceID` int(20) NOT NULL,
  `hospitalID` int(255) NOT NULL,
  `implant_date` date NOT NULL,
  `status_date` date NOT NULL,
  `patient_status` varchar(100) NOT NULL,
  `descr_dev_of_pat` varchar(255) NOT NULL,
  `stay_duration_of_dev` int(255) NOT NULL,
  PRIMARY KEY (`device_of_patientID`),
  KEY `fk_patID` (`patientID`),
  KEY `fk_devID` (`deviceID`),
  KEY `fk_hospID` (`hospitalID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `device_of_patient`
--

INSERT INTO `device_of_patient` (`device_of_patientID`, `patientID`, `deviceID`, `hospitalID`, `implant_date`, `status_date`, `patient_status`, `descr_dev_of_pat`, `stay_duration_of_dev`) VALUES
(1, 'EGE001NH', 1, 1, '2010-08-12', '0000-00-00', 'Died', 'Hasta hayatını kaybetti', 555),
(2, 'ANTEP001VO', 2, 2, '2010-12-21', '2013-06-30', 'Tx', 'Tx hakkında bir açıklama eklenebilir', 66),
(3, 'EGE001NH', 1, 1, '2017-02-08', '2017-02-16', 'Died', 'Öldü', 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('d','i') DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `extension` varchar(5) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=202 ;

--
-- Tablo döküm verisi `files`
--

INSERT INTO `files` (`id`, `folder_id`, `type`, `name`, `filename`, `extension`, `mimetype`, `width`, `height`, `filesize`, `date_added`) VALUES
(42, 44, 'i', 'Logo', 'a1e28d5126bbf3057ea2e91b722fa703', '.png', 'image/png', 326, 102, 28, 1339166332),
(51, 47, 'i', 'FluoropassivTWCarotidPatch', 'FluoropassivTWCarotidPatch', '.jpg', 'image/jpeg', 306, 340, 18, 1339849777),
(44, 44, 'i', 'vascutek', 'cf840301167d8de4cb03bebfe53a14d3', '.jpg', 'image/jpeg', 130, 38, 6, 1339845332),
(45, 44, 'i', 'sorin', 'f8fa51190ec1e21f1a928a3a19056319', '.jpg', 'image/jpeg', 130, 25, 5, 1339845349),
(46, 44, 'i', 'maquet', 'd510204154d6de0ba7136df8b693b31d', '.jpg', 'image/jpeg', 130, 44, 8, 1339845368),
(47, 44, 'i', 'oryamed', 'f687e29040980e01747caa24c2f99758', '.jpg', 'image/jpeg', 130, 52, 7, 1339845386),
(48, 44, 'i', 'pulsecath', '99e1e872c38c227db10f09b1fe293c24', '.jpg', 'image/jpeg', 130, 60, 10, 1339845402),
(49, 44, 'i', 'boston', 'd4c5d295d5f321fc553b21b442525888', '.jpg', 'image/jpeg', 130, 46, 11, 1339845414),
(50, 44, 'i', 'ekos', '0bef90091127cb5233c80d5f29e3509a', '.jpg', 'image/jpeg', 130, 55, 7, 1339845422),
(52, 47, 'i', 'Gelsoft&Gelsealpatches', 'Gelsoft&Gelsealpatches', '.jpg', 'image/jpeg', 321, 340, 40, 1339849777),
(53, 47, 'i', 'Gelsoft', 'Gelsoft', '.jpg', 'image/jpeg', 351, 320, 25, 1339849777),
(54, 47, 'i', 'GelsoftPlus', 'GelsoftPlus', '.jpg', 'image/jpeg', 338, 317, 27, 1339849777),
(55, 47, 'i', 'Gelweave', 'Gelweave', '.jpg', 'image/jpeg', 356, 340, 30, 1339849777),
(56, 47, 'i', 'GelweaveAbdominalDesigns', 'GelweaveAbdominalDesigns', '.jpg', 'image/jpeg', 274, 298, 17, 1339849777),
(57, 47, 'i', 'GelweaveArchDesigns', 'GelweaveArchDesigns', '.jpg', 'image/jpeg', 273, 311, 25, 1339849777),
(58, 47, 'i', 'GelweaveValsalva', 'GelweaveValsalva', '.jpg', 'image/jpeg', 291, 313, 19, 1339849777),
(59, 47, 'i', 'ThinWallCarotidPatch', 'ThinWallCarotidPatch', '.jpg', 'image/jpeg', 366, 340, 20, 1339849777),
(60, 47, 'i', 'ThinWallFluoropassi', 'ThinWallFluoropassi', '.jpg', 'image/jpeg', 369, 340, 33, 1339849777),
(61, 47, 'i', 'ThoracoabdominalDesigns', 'ThoracoabdominalDesigns', '.jpg', 'image/jpeg', 430, 340, 32, 1339849777),
(62, 47, 'i', 'VP1200K', 'VP1200K', '.jpg', 'image/jpeg', 349, 340, 49, 1339849777),
(63, 48, 'i', 'Cobrahood', 'Cobrahood', '.jpg', 'image/jpeg', 327, 340, 23, 1339850249),
(64, 48, 'i', 'Maxiflo', 'Maxiflo', '.jpg', 'image/jpeg', 350, 286, 26, 1339850249),
(65, 48, 'i', 'Rapidax', 'Rapidax', '.jpg', 'image/jpeg', 375, 323, 30, 1339850249),
(66, 48, 'i', 'SEALPTFE', 'SEALPTFE', '.jpg', 'image/jpeg', 350, 286, 26, 1339850249),
(67, 48, 'i', 'TaperFlo', 'TaperFlo', '.jpg', 'image/jpeg', 288, 301, 26, 1339850249),
(68, 48, 'i', 'Unity', 'Unity', '.jpg', 'image/jpeg', 401, 332, 23, 1339850249),
(69, 49, 'i', 'Anaconda', 'fd599dcce1fe4f8225c42827e3655ff8', '.jpg', 'image/jpeg', 445, 340, 22, 1339851187),
(70, 50, 'i', 'BioValsalva', '4fc057d23c83166503c8485fda01f7a2', '.jpg', 'image/jpeg', 339, 276, 35, 1339851290),
(71, 51, 'i', 'Gelweave', 'a5602ca6b33300970a3824f39b6e215d', '.jpg', 'image/jpeg', 285, 319, 19, 1339851317),
(72, 45, 'i', 'pulsecath', 'd32c4eb1685e0579b6a50dda135a9c16', '.jpg', 'image/jpeg', 297, 232, 7, 1339857491),
(73, 45, 'i', 'EKOS-MACH4e', 'd18db19f05c21f366905cca845ca1eb6', '.jpg', 'image/jpeg', 253, 206, 5, 1340021831),
(74, 45, 'd', 'oryamed-no', 'a023e33ea3a926e924ad2db539e86b0c', '.JPG', 'image/jpeg', 575, 600, 36, 1340614097),
(75, 45, 'i', 'oryamed-no', 'b2b06e2e243a75bd7e77aba054b09da9', '.jpg', 'image/jpeg', 575, 600, 36, 1340614189),
(76, 52, 'i', 'Carbomedics Carbo-Seal', 'b9d852fc0203017163d2f6aa2213f9ea', '.jpg', 'image/jpeg', 181, 128, 16, 1340616349),
(77, 52, 'i', 'Carbo-Seal Valsalva', '2a17812f087acfbbae30488b110633fd', '.jpg', 'image/jpeg', 298, 225, 7, 1340616459),
(78, 52, 'i', 'Reduced', '7e46f35f1c7c1f9cfdf72d486f81586f', '.jpg', 'image/jpeg', 220, 163, 11, 1340616624),
(79, 52, 'i', 'Tophad', '28d86e860d73b95b33e355ffe2ed0ce6', '.jpg', 'image/jpeg', 228, 173, 10, 1340616999),
(80, 52, 'i', 'Pediactic Small Adult', 'f9bcf5ff62716f2ede4c6dfd77bd45a1', '.jpg', 'image/jpeg', 163, 142, 8, 1340617124),
(81, 52, 'i', 'AdultsMitralValve', '07e7e869c94efe6f3c6f483944d88b73', '.jpg', 'image/jpeg', 175, 141, 8, 1340617220),
(82, 52, 'i', 'Standard Aortic Valve', '74abe3dfd977d62ab1a90b870e802661', '.jpg', 'image/jpeg', 194, 153, 11, 1340617315),
(83, 52, 'i', 'Standard Mitral Valve', 'f2dc01ea4618d635645aa928a95820cd', '.jpg', 'image/jpeg', 200, 185, 14, 1340617398),
(84, 44, 'i', 'pdf-icon', 'e1165bff08ccd9f3c2fd077249dd979a', '.png', 'image/png', 41, 50, 4, 1340622436),
(86, 44, 'i', 'heartware', 'e30b1a4cb7ddde450af79c0321e74733', '.jpg', 'image/jpeg', 130, 55, 7, 1342255316),
(88, 45, 'i', 'heartware', '8b2d588682b797667a0516910992faec', '.jpg', 'image/jpeg', 400, 365, 44, 1342618277),
(89, 45, 'i', 'icross', '09428ab0b49dd6a9fb36d5b108f7ab86', '.jpg', 'image/jpeg', 400, 300, 13, 1342618378),
(90, 45, 'i', 'Delivery Support Guide Wires', 'ab176051fbefcd2e059fd9977383faf1', '.gif', 'image/gif', 400, 75, 7, 1342618464),
(91, 45, 'i', 'Frontline Guide Wires', '2b55ac2c258b1eacdd84538ffbcfed31', '.gif', 'image/gif', 400, 75, 7, 1342618531),
(92, 45, 'i', 'Kinetix™ Guidewire', 'bfd4b25a381e2ce6d953a648dcca2e73', '.jpg', 'image/jpeg', 225, 146, 7, 1342618597),
(93, 45, 'i', 'Rotablator® Rotational Atherectomy System', '0ab44d846ef68e5f8a8966d7d77958e7', '.jpg', 'image/jpeg', 500, 339, 18, 1342618650),
(94, 45, 'i', 'Apex® PTCA Dilatation Catheter', 'b3001af7a5b6646ebf0d0b867a7e4480', '.jpg', 'image/jpeg', 400, 300, 11, 1342618701),
(95, 45, 'i', 'Emerge™ PTCA Dilatation Catheter', '5d9793f75d24e0469d3eb3659d6b9996', '.jpg', 'image/jpeg', 500, 396, 27, 1342618870),
(96, 45, 'i', 'Flextome® Cutting Balloon® Dilatation Device', '433d26b4f079a8d7d84b32dfafe6729d', '.jpg', 'image/jpeg', 400, 300, 23, 1342618925),
(97, 45, 'i', 'Maverick® PTCA Balloon Catheters', 'c2d5f1b527442a1c6effd375e29645ea', '.jpg', 'image/jpeg', 400, 300, 17, 1342618976),
(98, 45, 'i', 'NC Quantum Apex™ PTCA Dilatation Catheter', 'de8c9a736e2bf0400129e8316ee023fe', '.jpg', 'image/jpeg', 240, 180, 3, 1342619101),
(99, 45, 'i', 'Quantum™ Maverick® Balloon Catheters', '6bc37822632e47fc6515644d867995a6', '.jpg', 'image/jpeg', 400, 300, 19, 1342619155),
(100, 45, 'i', 'Diagnostic Catheters', '8e80a9ec85eabca8f64b9efc41313d8c', '.jpg', 'image/jpeg', 362, 198, 9, 1342619226),
(101, 45, 'i', 'FilterWire EZ™ Embolic Protection System for SVG''s', '8bd8f255d9089bc25f6901709945fb19', '.jpg', 'image/jpeg', 400, 300, 39, 1342619307),
(102, 45, 'i', 'Guide Catheters', 'bf24c5a18e9dab60e943f5051f9386b3', '.jpg', 'image/jpeg', 362, 355, 18, 1342619375),
(103, 45, 'i', 'Access and Crossing Guide Wires', '6e49e1d5d1c37e9ef856557aab7b06a6', '.gif', 'image/gif', 400, 75, 6, 1342619428),
(104, 45, 'i', 'Imager™ II Angiographic Catheter', 'a6383afb8b841abb3b7fa4c546f5e87d', '.jpg', 'image/jpeg', 352, 352, 51, 1342619496),
(105, 45, 'i', 'Coyote™ Balloon Dilatation Catheter', '4984dc5a93b6a54bcce19757891ca055', '.jpg', 'image/jpeg', 450, 212, 19, 1342619541),
(106, 45, 'i', 'Mustang™ Balloon Dilatation Catheter', 'f26f3576d36c908456876b23508dc919', '.jpg', 'image/jpeg', 450, 470, 49, 1342619589),
(107, 45, 'i', 'Standard Occlusion Balloon Catheter', '57c51e8d693e650c516419ea669a41d8', '.jpg', 'image/jpeg', 400, 300, 44, 1342619636),
(108, 45, 'i', 'Sterling® ES Balloon Dilatation Catheters', '47949f53ac49ec9267ee1528a7c59eb6', '.jpg', 'image/jpeg', 400, 300, 9, 1342619685),
(109, 45, 'i', 'Sterling® SL Balloon Dilatation Catheter', '4a10cf76ac92a636db2ed40bf5b05d29', '.jpg', 'image/jpeg', 400, 300, 19, 1342619729),
(110, 45, 'i', 'Sterling™ Balloon Dilatation Catheter', '119ee596fc53d7a783b5391fc9d60d2a', '.jpg', 'image/jpeg', 400, 300, 19, 1342619835),
(111, 45, 'i', 'Sterling™ Monorail® Balloon Dilatation Catheter', '8e34eb4e3504f8ff35da52b0b65cb9c5', '.jpg', 'image/jpeg', 450, 338, 12, 1342619922),
(112, 45, 'i', 'Express® LD Iliac Premounted Stent System', '86961f3b63f47a38d14ef8dd319c52e7', '.jpg', 'image/jpeg', 400, 300, 23, 1342619973),
(113, 45, 'i', 'Express® SD Renal Monorail® Premounted Stent Syste', 'fe5a213dc9be7dd88194c3c8b6370d92', '.jpg', 'image/jpeg', 400, 300, 12, 1342620019),
(114, 45, 'i', 'Fathom® Steerable Guidewires', '6bcbca3e1426d451dc6a88e3eb9beceb', '.jpg', 'image/jpeg', 400, 300, 45, 1342620068),
(115, 45, 'i', 'Guide Wires for Peripheral Interventions', '937a235f43798c394746e107c409dcfa', '.jpg', 'image/jpeg', 490, 45, 7, 1342620113),
(116, 45, 'i', 'Journey™ Guidewire', 'afa6b40f8c85148a2282544367910ebe', '.jpg', 'image/jpeg', 451, 336, 24, 1342620224),
(117, 45, 'i', 'ZIPwire® Hydrophilic Guide Wire', '0a0fc4d7e836e545c21372cde21a037b', '.jpg', 'image/jpeg', 400, 300, 53, 1342620271),
(118, 45, 'd', 'Super Sheath™ Introducer Sheath', '7f4624be57551a633a79bf280c91ef23', '.gIf', 'image/gif', 118, 105, 3, 1342620420),
(119, 45, 'i', 'Super Sheath™ Introducer Sheath', 'dbe406251bae7ae2d4b64b15d673b3e6', '.jpg', 'image/jpeg', 572, 381, 23, 1342620787),
(120, 45, 'i', 'Renegade® HI-FLO', '59b8f6ae4718bb8865e879035866a1bd', '.jpg', 'image/jpeg', 175, 175, 3, 1342690904),
(121, 45, 'i', 'Epic™ Vascular Self-Expanding Stent System', 'cb4b443b0aaf0ffaa2f3edc3e523bfc8', '.jpg', 'image/jpeg', 245, 194, 85, 1342690990),
(122, 45, 'i', 'WALLSTENT® Endoscopic Biliary Stent System', '7ce2b92ec19e8348ee3a634d3a16a17c', '.jpg', 'image/jpeg', 400, 300, 61, 1342691039),
(123, 45, 'i', 'Carotid WALLSTENT® Monorail® Endoprosthesis', 'c9d31dbcb4f1dec29a0db7af486a0ac1', '.jpg', 'image/jpeg', 400, 300, 23, 1342691207),
(124, 45, 'i', 'Precision SpeedTac® Transvaginal Anchor System', '9589e171aec36e1a26e823e0ebd14ddf', '.jpg', 'image/jpeg', 400, 300, 27, 1342691337),
(125, 45, 'i', 'Precision Twist® Transvaginal Anchor System', '98ce5508838397e831d22cfde6b9a18c', '.jpg', 'image/jpeg', 400, 300, 40, 1342691400),
(126, 45, 'i', 'NephroMax™ High Pressure Nephrostomy Balloon Cathe', 'd80c0e3446929a1f26647827336ccf3b', '.jpg', 'image/jpeg', 250, 188, 7, 1342691479),
(127, 45, 'i', 'UroMax Ultra™ High Pressure Balloon Catheter', '8acd5b2c24971d7305a9309fa5cb1356', '.jpg', 'image/jpeg', 400, 300, 39, 1342691535),
(128, 45, 'i', 'Escape® Nitinol Stone Retrieval Basket', '01f7f60ba957b706de8b24ae911ed912', '.jpg', 'image/jpeg', 400, 300, 38, 1342691597),
(129, 45, 'i', 'Graspit® Nitinol Stone Retrieval Forceps', '5fe9a0bd38f56fdf9a2069918cad1e1b', '.jpg', 'image/jpeg', 250, 188, 5, 1342691691),
(130, 45, 'i', 'Gemini™ Paired Wire Helical Stone Retrieval Basket', 'b6f0f558121ec8199c921bfd4720dbae', '.jpg', 'image/jpeg', 250, 188, 25, 1342691797),
(131, 45, 'i', 'OptiFlex™ 1.3F Nitinol Stone Retrieval Basket', '509c9d60725ed414b9f24e74e15cf444', '.jpg', 'image/jpeg', 275, 222, 10, 1342691906),
(132, 45, 'i', 'Segura Hemisphere® Stone Retrieval Basket', '248d97f7e9bc05a5be776e7d781c7954', '.jpg', 'image/jpeg', 250, 188, 19, 1342691966),
(133, 45, 'i', 'Stone Cone® Nitinol Retrieval Coil', 'ece8cc31add1fe02ee02d624ed2a5ae6', '.jpg', 'image/jpeg', 250, 188, 18, 1342692051),
(134, 45, 'i', 'Zero Tip™ Nitinol Stone Retrieval Basket', 'd7683e44a6dd341a2961cc74962542ff', '.jpg', 'image/jpeg', 250, 188, 20, 1342692098),
(135, 45, 'i', 'Dual Lumen Ureteral Catheters', '92f1188a1a8cb08c4c3edd6da8db5b37', '.jpg', 'image/jpeg', 250, 188, 20, 1342692147),
(136, 45, 'i', 'Imager™ II Catheters', '94365ec7b3dfe130aba6be35f63cc8d1', '.jpg', 'image/jpeg', 243, 181, 6, 1342692182),
(137, 45, 'i', 'Sensor® PTFE-Nitinol Guidewire Hydrophilic Tip', '98ff7c12e8df109b6cd92b819f435f3c', '.jpg', 'image/jpeg', 250, 188, 31, 1342692228),
(138, 45, 'i', 'Glidewire® Nitinol Hydrophilic Guidewire', '4b8ed27324d3333343352ca5f30c8e5c', '.jpg', 'image/jpeg', 250, 188, 21, 1342692278),
(139, 45, 'i', 'Navigator™ Ureteral Access Sheath', 'fcffb36504c828671a9e37a2e96ea233', '.jpg', 'image/jpeg', 250, 188, 17, 1342692353),
(140, 45, 'i', 'Zebra® Urologic Guidewire', '74d6c69523d3f956a3804cd91c501d77', '.jpg', 'image/jpeg', 250, 188, 26, 1342692399),
(141, 45, 'i', 'Advantage Fit™ System', '2f5d9ab332f67fbee83f65a36c0c0d94', '.jpg', 'image/jpeg', 400, 300, 45, 1342692439),
(142, 45, 'i', 'Advantage® Transvaginal Mid-Urethral Sling System', '364045e113fbcce0366f61429d288ced', '.jpg', 'image/jpeg', 400, 300, 35, 1342692535),
(143, 45, 'i', 'Lynx® Suprapubic Mid-Urethral Sling System', 'a907f28a3ae339a53fbec12adcf4275d', '.jpg', 'image/jpeg', 400, 300, 35, 1342692619),
(144, 45, 'i', 'Obtryx® Transobturator Mid-Urethral Sling System', 'f35967d32a62478a5cdf506cc16a8488', '.jpg', 'image/jpeg', 432, 400, 39, 1342692672),
(145, 45, 'i', 'Prefyx PPS® System', '8aeb9569165e68a6c8f0adbbe64b82cb', '.jpg', 'image/jpeg', 400, 300, 17, 1342692718),
(146, 45, 'i', 'Solyx™ SIS System', '965a1707be1541415cde2345d102a1b6', '.jpg', 'image/jpeg', 343, 250, 33, 1342692755),
(147, 45, 'i', 'Contour™ Ureteral Stent', '5d27fba347d85f74eb3e284f3655e38d', '.jpg', 'image/jpeg', 250, 188, 4, 1342692792),
(148, 45, 'i', 'Percuflex® Ureteral Stent', '96f3d65fc7d0028cab49bbd2ee9a5492', '.jpg', 'image/jpeg', 250, 188, 18, 1342692837),
(149, 45, 'i', 'Polaris™ Ultra Ureteral Stent', 'abe5427d5ba9a1a3d56b4b74c7dc6b18', '.jpg', 'image/jpeg', 250, 188, 6, 1342692900),
(150, 45, 'i', 'Polaris™ Loop Ureteral Stent', 'a17d832ef14d5c970e00ec40d3dd8af2', '.jpg', 'image/jpeg', 250, 188, 7, 1342692910),
(151, 45, 'i', 'CRE™ Fixed Wire Balloon Dilator', '5d85c71789f68f1bb6f774da47652245', '.jpg', 'image/jpeg', 400, 300, 73, 1342693250),
(152, 45, 'i', 'CRE™ Wireguided Balloon Dilator', '35f5fb8c74691a6556e243f457d40f3e', '.jpg', 'image/jpeg', 400, 300, 68, 1342693299),
(153, 45, 'i', 'Extractor™ Pro RX, XL and DL Retrieval Balloons', '49c0ab572590e055ea360f272deeb34d', '.jpg', 'image/jpeg', 400, 300, 43, 1342693357),
(154, 45, 'i', 'Extractor™ RX Retrieval Balloon', '2b92910f2651d73ebbca49f6c2adb640', '.jpg', 'image/jpeg', 400, 300, 26, 1342693395),
(155, 45, 'i', 'Resolution® Clip', '2137a5af1efaff824c240c9f16ce0c3f', '.jpg', 'image/jpeg', 400, 300, 79, 1342693447),
(156, 45, 'i', 'Initial Placement PEG', '54438281f4e064982a51b5478318fa9f', '.jpg', 'image/jpeg', 100, 100, 24, 1342693486),
(158, 45, 'i', 'Dreamwire™ High Performance Guidewire', '9aeaad6b771bc3e0a947f2341b5b578d', '.jpg', 'image/jpeg', 239, 190, 9, 1342693675),
(159, 45, 'i', 'Hydra Jagwire® Guidewire', '5eb111066bc621451165aa80398cbf50', '.jpg', 'image/jpeg', 400, 300, 37, 1342693735),
(160, 45, 'i', 'Rotatable Snare', 'fb26bccfbe24c30ab9d97d18fac40271', '.jpg', 'image/jpeg', 400, 300, 35, 1342693774),
(161, 45, 'i', 'Autotome™ RX Cannulating Sphincterotome', 'a105ad9c63fb5c62bfb83529daf6b89e', '.jpg', 'image/jpeg', 400, 300, 28, 1342693823),
(162, 45, 'i', 'Dreamtome™ RX Cannulating Sphincterotome', '021b8d013c7aef5a496df0f59c94153c', '.jpg', 'image/jpeg', 267, 55, 25, 1342693864),
(163, 45, 'i', 'Hydratome® RX Cannulating Sphincterotome', '86b5d6dba6a0d1277af9be6ed6cd1895', '.jpg', 'image/jpeg', 400, 300, 57, 1342694070),
(164, 45, 'i', 'Advanix™ Biliary Stent with NaviFlex™ RX Delivery', '288d378c257c08429c14fc579c260ded', '.jpg', 'image/jpeg', 400, 300, 29, 1342694132),
(165, 45, 'i', 'Polyflex® Esophageal Stent', '4e50e2d1640fe98e31eb6ed92a43e470', '.jpg', 'image/jpeg', 400, 300, 23, 1342694172),
(166, 45, 'i', 'Ultraflex™ Esophageal NG Stent System', '086c201c3aa99f314138848dae8b0712', '.jpg', 'image/jpeg', 400, 300, 91, 1342694215),
(167, 45, 'i', 'Ultraflex™ Precision Colonic Stent System', '080248d21e2f16368d19c8c2bf1ddb91', '.jpg', 'image/jpeg', 400, 300, 41, 1342694252),
(168, 45, 'i', 'WALLSTENT® Colonic & Duodenal Endoprosthesis', 'e3b5c22e134be1866177f418cb161d60', '.jpg', 'image/jpeg', 400, 300, 31, 1342694287),
(169, 45, 'i', 'WALLSTENT® RX Biliary Endoprosthesis', '6c0fddcffb3b34a6ab7af7195366b63c', '.jpg', 'image/jpeg', 400, 300, 37, 1342694336),
(170, 45, 'i', 'WallFlex® Biliary RX Stents', '028c67ac034efbb338b1b2fea29925d1', '.jpg', 'image/jpeg', 397, 296, 16, 1342694390),
(171, 45, 'i', 'WallFlex® Colonic Stent', 'a0da72a4c0df2cf8047ed6ff5433fbad', '.jpg', 'image/jpeg', 362, 149, 19, 1342694429),
(172, 45, 'i', 'WallFlex® Duodenal Stent', 'c218c50b792cc1017cf7fb8a4ab46b72', '.jpg', 'image/jpeg', 400, 300, 24, 1342694491),
(173, 45, 'i', 'WallFlex® Fully and Partially Covered Esophageal', 'e27e411fcac0d17fc81c33070cded906', '.jpg', 'image/jpeg', 400, 300, 21, 1342694539),
(174, 45, 'i', 'ECMO Cannulae', 'babe3600e4a4f11dcc518d250c2851d2', '.jpg', 'image/jpeg', 320, 201, 7, 1342694631),
(175, 45, 'i', 'ROTAFLOW Centrifugal Pump', '76d3b16b71ed8f91a4eedfa12208444a', '.jpg', 'image/jpeg', 320, 201, 9, 1342694675),
(176, 45, 'i', 'BIOLINE Coating', '50f13d14c5f45d3a19bed8a8a4abbfdb', '.jpg', 'image/jpeg', 320, 201, 26, 1342694704),
(177, 45, 'i', 'SOFTLINE Coating', '7a21ab101ca7207279d17de4418c7034', '.jpg', 'image/jpeg', 320, 201, 24, 1342694731),
(178, 45, 'i', 'MECC System', 'b8f4244eec2a59950b652a8dea6e66c9', '.jpg', 'image/jpeg', 320, 201, 8, 1342694763),
(179, 45, 'i', 'MEGA® IAB CATHETERS', 'b1acea7b34d33b3bec51ea2c8acec16c', '.jpg', 'image/jpeg', 573, 451, 20, 1342695703),
(180, 45, 'i', 'SENSATION PLUS™ 8Fr. 50cc IAB CATHETER', 'a1f52f20fa12e85d4aa40b6c69ad4222', '.png', 'image/png', 573, 451, 247, 1342695749),
(181, 45, 'i', 'SENSATION® 7Fr. IAB CATHETER', 'ec2b20c044af079c3c70f853ee2ee7d7', '.jpg', 'image/jpeg', 573, 451, 14, 1342695784),
(182, 45, 'i', 'LINEAR® 7.5Fr. IAB CATHETER', 'ddad5ee928629088ef1615725e750211', '.jpg', 'image/jpeg', 274, 227, 11, 1342695813),
(183, 45, 'i', 'CARDIOSAVE™ IABP HYBRID & RESCUE', 'f26ff7097460862a363f1a02e1109dbf', '.jpg', 'image/jpeg', 573, 451, 55, 1342695850),
(184, 45, 'i', 'SENSATION® 7FR. & CS300™ IABP SYSTEM', 'e2e6a94eb7a3f103b26e095dfb6460a6', '.jpg', 'image/jpeg', 274, 203, 8, 1342695885),
(185, 45, 'i', 'CS300™ IABP WITH INTELLISENSE™', '3b518544ec942535932422b306a0e1d5', '.jpg', 'image/jpeg', 274, 338, 18, 1342695935),
(186, 45, 'i', 'CS100® IABP WITH INTELLISYNC™', 'c8f3e2178e4075e07ec893f79726dce9', '.jpg', 'image/jpeg', 274, 251, 24, 1342695969),
(187, 45, 'i', 'Fusion Bioline Vascular Grafts', '641be568399082524884aba33c00ca54', '.jpg', 'image/jpeg', 320, 201, 8, 1342696017),
(188, 45, 'i', 'Fusion Vascular Graft', '5e13ce05a086d92a56fe195bcea78c92', '.jpg', 'image/jpeg', 320, 200, 8, 1342696047),
(189, 45, 'i', 'ACROBAT-I STABILIZER SYSTEM', '90c05dcb7774be3372719e02aa6236fc', '.jpg', 'image/jpeg', 320, 201, 5, 1342696099),
(190, 45, 'i', 'ACROBAT MECHANICAL OFF-PUMP SYSTEM', '97821ae089ea297c747781f9a7097d37', '.jpg', 'image/jpeg', 320, 200, 7, 1342696126),
(191, 45, 'i', 'ACROBAT SUV VACUUM STABILIZER', '09cfdc12e012543fbe3dae771ecfd99c', '.jpg', 'image/jpeg', 320, 200, 6, 1342696184),
(192, 45, 'i', 'ACROBAT V VACUUM STABILIZER', '7fd5d1523bdac66fc0df09c1bbe39b31', '.jpg', 'image/jpeg', 320, 200, 6, 1342696262),
(193, 45, 'i', 'ULTIMA OPCAB SYSTEM', '411a9d600cc4976eab27a37952198f16', '.jpg', 'image/jpeg', 320, 200, 6, 1342696321),
(194, 45, 'i', 'ACROBAT-I POSITIONER SYSTEM', 'f4c58f61e55c2558efc6979d48c7d149', '.jpg', 'image/jpeg', 320, 201, 6, 1342696377),
(195, 45, 'i', 'XPOSE 3 ACCESS DEVICE', '8fcb2d7fd97bdc59d8b9dad05dc4b75b', '.jpg', 'image/jpeg', 320, 201, 6, 1342696404),
(196, 45, 'i', 'XPOSE 4 ACCESS DEVICE', '7f0a8139169c635c67ee619fc4f23cfe', '.jpg', 'image/jpeg', 320, 201, 7, 1342696432),
(197, 45, 'i', 'AORTIC CUTTER', '070f9788609faf42360cb4a00885a736', '.jpg', 'image/jpeg', 320, 201, 4, 1342696471),
(198, 45, 'i', 'HEARTSTRING III PROXIMAL SEAL SYSTEM', 'cbae1bd5f8e28b95dee40ad41f3252a6', '.jpg', 'image/jpeg', 320, 201, 7, 1342696499),
(199, 45, 'i', 'ACROBAT-I BLOWER MISTER', '4734a07479de1091cb116cddf71f9a64', '.jpg', 'image/jpeg', 320, 201, 4, 1342696541),
(200, 45, 'i', 'AXIUS BLOWER MISTER', 'd9e6cd88c3b45d3e6383098f98cb7890', '.jpg', 'image/jpeg', 320, 201, 4, 1342696570),
(201, 45, 'i', 'AXIUS CORONARY SHUNT', '152e4f2118a71736588caa37aee79921', '.jpg', 'image/jpeg', 320, 201, 4, 1342696598);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `file_folders`
--

CREATE TABLE IF NOT EXISTS `file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_added` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Tablo döküm verisi `file_folders`
--

INSERT INTO `file_folders` (`id`, `parent_id`, `slug`, `name`, `date_added`) VALUES
(44, 0, 'resimler', 'Resimler', 1339166306),
(45, 0, 'urunler', 'Ürünler', 1339170425),
(47, 45, 'polyester', 'Polyester', 1339849340),
(48, 45, 'eptfe', 'ePTFE', 1339849751),
(49, 45, 'anaconda', 'Anaconda', 1339851139),
(50, 45, 'biovalsalva', 'Biovalsalva', 1339851153),
(51, 45, 'gelweave', 'Gelweave', 1339851303),
(52, 45, 'sorin-urunler', 'Sorin Ürünler', 1340616332);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Permission roles such as admins, moderators, staff, etc' AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Yöneticiler'),
(2, 'users', 'Kullanıcılar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hospital`
--

CREATE TABLE IF NOT EXISTS `hospital` (
  `hospitalID` int(255) NOT NULL AUTO_INCREMENT,
  `name_hosp` varchar(255) NOT NULL,
  `city_hosp` varchar(255) NOT NULL,
  `adress_hosp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hospitalID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `hospital`
--

INSERT INTO `hospital` (`hospitalID`, `name_hosp`, `city_hosp`, `adress_hosp`) VALUES
(1, 'EGE UNIVERSITY', 'IZMIR', NULL),
(2, 'AKDENIZ UNIVERSITY', 'ANTALYA', NULL),
(3, 'GAZIANTEP UNIVERSITY', 'GAZIANTEP', NULL),
(4, 'KOSUYOLU STATE HOSPITAL', 'ISTANBUL', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hrform`
--

CREATE TABLE IF NOT EXISTS `hrform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `position` varchar(250) NOT NULL,
  `profile` text NOT NULL,
  `cv_file` varchar(250) NOT NULL,
  `created_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Tablo döküm verisi `hrform`
--

INSERT INTO `hrform` (`id`, `name`, `email`, `phone`, `position`, `profile`, `cv_file`, `created_on`) VALUES
(1, 'selin çakar', 'selincakar5.2@hotmail.com', '0555 - 6960189', '', 'Ege Üniversitesi biyoloji bölümünde lisans eğitimi aldıktan sonra aynı alanda yüksek lisan yaptım.', '0c82e939b88a1050a54fbc30b532f154.doc', 1341590764),
(2, 'MEHMET DEMİR', 'mehmetdemir8135@hotmail.com', ' - ', '', '', 'a03c601d75616894f8b6dc094d69ae5e.doc', 1344434516),
(3, 'ORHAN  ADIGÜZEL', 'orhanadiguzel@mynet.com', '546 - 2489111', 'TEKNİSYEN', '1976 AFYON EMİRDAĞ DOĞUMLUYUM 1994 ÇINARLI ENDÜSTRİ MESLEK LİSESİ ELEKTRO MEKANİK TAŞIYICILAR BÖLÜMÜ MEZUNUYUM EN SON BAŞKENT ÜNV. ZÜBEYDE HANIM UYG. ARŞ. MRKZ. TEKNİK SERVİS SORUMLUSU OLARAK 11 YILA YAKIN SÜRE ÇALIŞTIM.EVLİ VE 2 ÇOCUK SAHİBİYİM.DİĞER TÜM AYRINTILAR CV MDE MEVCUTTUR.', '59150267de629b7a0d89ff4149e58d6b.doc', 1344960592),
(4, 'gönül gelişken', 'darkness_35gg_@hotmail.com', '506 - 3500797', 'satış temsilcisi-laborant', '16.05.1990 izmir doğumluyum.endüstri meslek lisesi kimya bölmünden mezunum.ege üniversitesi meslek yüksek okuluna yatay geeçiş ile aynı bölümümü (kimya) okumaya devam ettim,ancak maddi durumlar nedeniyle bırakmak zorunda kaldım.4 tane staj yaptım.1. si beçet uz çocuk hastanesi \\n2.si pınar süt mamülleri\\n3.süpınar et entegre et tesisleri\\n4.sü yine pınar süt mamulleri.\\n2.5 yılda delphi otomotiv şirketinde montaj operatörü olarak çalıştım. ', 'c390702a5812b78020e899abae56dac4.doc', 1348693999),
(5, 'pınar soylu', 'pinar.syl@hotmail.com', '0535 - 0763801', 'satın alma departmanı,pazarlama ve satış bölümü', '', '81fc19f9e2a5c76a057fcabaf1c1c3ed.doc', 1349460958),
(6, 'şehla karaoğlu', 'sehla.07@hotmail.com', '0535 - 5012060', 'genel başvuru', '', '90b559408b910adde5e4ecd5d6e961ba.doc', 1354388727),
(7, 'sedat  nurdan ', 'sedatnurdan1@hotmail.com', '532 - 5952779', 'tıbbi satış temsilcisi', '2006 yılında çukurova kimya bölümünden mezun oldum. 2007 yılında santa farma ilaç firmasında 2009 yılında alfa wasserman ilaç firmasında çalıştım. ayrıntılı özgeçmişim eklı dosyada bulunmaktadır.gerekli görmeniz durumunda mersin bölgesinde çalışmak için sizinle yüzyüze görüşmek isterim saygılarımla sedat NURDAN...', '02c4ead6719f2d4a51baf356abd57a28.doc', 1354575603),
(8, 'Adnan Fışkınlı', 'adnan@live.in', '536 - 0276615', 'Aplikasyon - Teknik - Genel', 'Adı Soyadı:  	Adnan Fışkınlı\\nDoğum Tarihi :  21.03.1982\\nMeslek : 	Biyolog\\nCinsiyet : 	Erkek\\nMedeni Hali : 	Bekar\\nAdres : 	Deliktaş mh. 1967 sk. No:13 Kat:1 Denizli\\nEposta : 	adnan@live.in\\nCep: 		05360276615–05427270261\\nTelefon : 	02582658559\\n', '16762684c843f1a6133b4739ef2eed73.doc', 1359214338),
(9, 'Umut ERTEKİN', 'umutertekin88@hotmail.com', '0530  - 293 53 78', 'Satış Temsilcisi', 'Ekteki cv''mde gerekli bilgilerim bulunmaktadır.İyi çalışmalar.', '1e98881b7f70a6389d70441f85de0f84.doc', 1359629473),
(10, 'aydın yıldırım', 'aydinyildrim1905@gmail.com', '506 - 4323774', 'bilgi işlem bakım onarım bilgisayar operatörü bilgisayar işletmeni', '1ocak 1988 bornova dogumlu dokuz eylül üniv meslek yüksek okulu endüstriyel donanım önlisans mezunu 186cm boyunda herhangi saglık problemi bulunmayan sigara alkol kullanmayan bir personelim', 'df66d506d161a12423c35877c83d21ec.doc', 1363771488),
(11, 'SEVGÜR ABACI', 'sewgur_17@hotmail.com', '0544 - 9696520', 'yaz stajı(stajyer)', 'ben sevgür abacı dokuz eylül üniversitesi biyomedikal bölümü 2.sınıf öğrencisiyim bu sene ki yaz stajımı şirketinizde yapmak istiyorum.ilginize şimdiden teşekkür ederim.', '264df3eb5bbde710b8543c8609c0636a.docx', 1368624812),
(12, 'Kutluhan Burak KAYA', 'kutluhan-kaya@hotmail.com', '0544 - 2659592', 'Biyomedikal teknikeri', 'Akdeniz Üniversitesi 2012 biyomedikal Cihaz teklonojisi mezunuyum . En son Kvk teknik hizmetler A.Ş de çalıstım . Çalıstıgım Şirketin müdürünü referans olarak verebilirim . İşten ayrılma nedenim    Şirketin Nokia Firması ile anlaşmasının sona ermesi ve şirketin küçülmeye gitmesi.  . Donus sağlarsanız sevinirim . Biyomedikal Sektoründe kariyer yapmak hedefim Yardımcı olursanız sevinirim iyi çalışmalar.', 'bd055d66d63adcd9756a792002b5c4fb.docx', 1372356956),
(13, 'Kadir AYDOĞAN', 'kadir-aydogan@hotmail.com', '0506 - 658 7218', 'Satış Temsilcisi', '24 yaşındayım Ankara da ikamet ediyorum Akdeniz Üniversitesi Biyomedikal Cihaz Teknolojisi mezunuyum', '2f2eeb4725a7e1c4f4b14d608dc1ca36.doc', 1373052970),
(14, 'Hasan Randa', 'amanos_242@hotmail.com', '+90 - 5374904271', 'Biyomedikal Mühendis', 'Erciyes Üniversitesi Biyomedikal Mühendisliğini 2013 haziran ayında bitirdim. Üniversite zamanında elektroporasyon üzerine, bulanık sistemler üzerine ve görüntü işleme üzerine çalışmalarım oldu. Çalışacağım ortamlarda ayrı bir hava yaratacağıma ve ekibin vazgeçilmez bir parçası olacağıma inanıyorum.Güncel bilgilerim CV''de mevcuttur, esen kalın', '571ef57858eea72b9a6e8f1d728dc963.docx', 1373868470),
(15, 'Sencer KAN', 'sencerkan@gmail.com', '555 - 6258169', 'Genel', 'Sayın Yetkili;\\n\\n2005 yılında Dokuz Eylül Üniversitesi Ekonometri (lisans), 2000 yılında Eğe Üniversitesi Anestezi Teknikerliği (ön lisans) bölümünden mezun oldum.\\n\\nTıbbi Mümessil, Satış Temsilcisi, Ürün Uzmanı, Ekip Lideri, Bölge Sorumlusu, Satış ve Fiyatlandırma Uzmanı ve son olarak, Bölge Satış Müdürü olarak SAĞLIK ENDÜSTRİSİ''NDE ilaç, medikal, tıbbi cihaz ve hizmet ayağında geniş bilgi birikimi ve deneyim ile yol aldım, almaya devam ediyorum.\\n\\nSahip olduğum, sorgulayan ve esnek bakış açısını, güçlü duygusal zekâ bileşenleri ve iletişim yetkinliklerim ile bir araya getirip, fark yaratan, ölçülebilir çıktılar haline getirdiğimi düşünüyorum.\\n\\nÇalıştığım son firma Biolitec, merkezi Köln Almanya’da bulunan, halen faaliyetlerine yedi ülkede devam eden, yirmi beş yaşında çok uluslu, kurumsal bir firmadır. Tıbbi lazer sistemleri, optik fiber geliştirme ve üretme alanında kapsamlı deneyime sahiptir. Lazer jenatörlerinin, bağlantılı fiber elyafların ve farklı alanlara yönelik tedavi modalitelerinin üreticisi konumundadır.\\n\\nFirmanın küçülmeye gitmesi sonucunda, sorumlu bulunduğum İzmir Antalya divizyonu kapatıldığı için işten ayrılmak zorunda kaldım. \\n\\nReferanslarımdan da takip edebileceğiniz gibi buradaki üstlerimle ve Biolitec Türkiye ile yakın ve güçlü iletişimim halen devam etmektedir.\\n\\nEn son Haziran 2013 tarihinde yurt dışında tamamladığım, ayrıntılarını ekteki öz geçmişimden takip edebileceğiniz eğitimler firmanın performansım ve sonuçlarımdan memnun olup benimle daha çok alanda çalışmak istemesinin bir göstergesidir.\\n\\nAncak ne yazık ki verilen küçülme kararı Türkiye organizasyonu dışında gelişmiştir.\\n\\n\\nBu firmadaki iş tanımım;\\n\\n•	Genel Cerrahi; 1470nm Diyot lazerle minimal invaziv koloproktoloji çözümleri, \\nÜroloji; 980nm contact Diyot Lazerle prostat vaporizasyonu –Red Light-, \\nKalp Damar Cerrahisi, Jinekoloji, Göğüs ve Plastik Cerrahi Branşlarında kullanılan cerrahi lazer sistem ve ekipmanlarının hastane ve özel merkezler bünyesinde satış ve pazarlaması.\\n•	Her vaka için uygun cihaz ve prob seçimi ilgili cihazın parametrelerinin ayarlanması.\\n•	Ameliyatlara girerek hekimin yönlendirilmesi, asiste edilmesi ve teknik hizmetin sağlanması. \\n•	Ameliyat sonuçlarının takibi ve raporlanması.\\n•	Lansman, promosyon ve satış organizasyonuna ilişkin faaliyetlerin gerçekleştirilmesi. \\n•	Satış ekibi ve teknik kadronun eğitimlerinin verilmesi, sevk ve idaresi. \\n•	Hastane içinde etkin, güçlü ve devamlı bir iletişim ağının teşkili.\\n•	Tüm ürün gruplarında pazar payının arttırılması. Hizmet götürülen her bir merkez için, hekim, hemşire, teknik ve idari personel ile güçlü ve etkin bir iletişimin sağlanması.\\n•	Şirketin geleceği için kilit isimler ve merkezlerle güçlü ilişkiler teşkil ederek, kurulan ilişkilerin devamlılığını sağlamak.\\n•	Satış sonrası gerçekleştirilen ziyaretlerle, satın alınan tüm ürün ve hizmetler için müşteri memnuniyetini üst seviyeye taşıyarak uzun soluklu, güvenilir bir iletişimi sağlamak.  \\n•	Ürün, modalite ve diğer detaylarla ilgili olarak etkin sunumlar gerçekleştirmek.  \\n•	Sürekli olarak yeni müşterileri takip etmek. \\n•	Belirlenen kotaların realizasyonunu sağlamak. Şirket hedefleri ve bu kotalar göz önüne alınarak, analiz ve projeksiyonlara dayanan yıllık satış planları hazırlamak, yönetmek ve uygulamak.  \\n•	Satış ve teknik personelin saha, hastane ve ameliyathane eğitimlerini vermek.  \\n•	Rakip firma ve ürünler hakkında fiyatlandırmalar ve tüm diğer promosyonel aktiviteler de dahil olmak üzere tüm verinin sürekli takip edilmesi, raporlanması. Yeniliklerin yönetimle paylaşılması uygun teklif ve yönlendirmelerin yapılması.  \\n•	Şirket hedeflerinin gerçekleştirilmesi için plan, yönerge ve direktiflere uymak.  \\n•	Toplantı ve kongre katılımlarının sağlanması ardından ilgili raporlamaların güncel olarak tutulması.\\n•	Harcamaların, belirlenen şirket politikaları çerçevesinde gerçekleştirilerek güncel olarak raporlanması.\\n•	Tüm kayıtların CRM’e aktarılması   \\nŞeklinde özetlenebilir. \\nAyrıntıları ekten, Türkçe ve İngilizce öz geçmişlerimden takip edebilirsiniz.\\nYa da Linked-IN sayfama göz atabilirsiniz.\\nhttp://www.linkedin.com/in/sencerkan\\n\\nSencer KAN\\n+90555 625 81 69\\n', 'ecdd804d8a8f0cc6a0c7f6f11d8ed3ff.doc', 1375100031),
(16, 'ESRA HAÇAT', 'esrahacat@hotmail.com', '506 - 2386895', 'BİYOMEDİKAL MÜHENDİSİ', '', '186e9228efc71efcd366270fc064b404.doc', 1375655196),
(17, 'N.Çağdaş Dinç', 'dincmedikal@hotmail.com', '537 - 8715688', 'Ürün Sorumlusu, Aplikasyon, Yönetici Asistanı', '1985 doğumluyum. Lisansımı Ankara-Başkent Üniversitesi, yüksek lisansımı ise Almanya-Aachen Üniversitesi''nde Biyomedikal Mühendisliği üzerine yaptım. Bu okulları dereceyle bitirdim. İyi seviyede İngilizce, orta seviyede Almanca dillerine hakimim. 1 sene Almanyada Ar-Ge mühendisi olarak, 1 sene de Türkiye''de Klinik Mühendisi olarak çalıştım; toplamda 2 sene iş tecrübem vardır. Kardiyovasküler Mühendislik konusu ilgi alanlarım arasına girer. Bu konuda Koç Üniversitesi''nde yapılan "Türkiye’nin İlk Vücut İçine Yerleştirilebilir, Minyatür Kalp Pompasının (LVAD) Tasarımı, Analizi ve Üretimi" programına katılmışlığım da vardır ki zaten bu ürünlerle ilgilendiğiniz için şirketinize başvurdum. Askerlik hizmetim 01.11.2013 tarihinde bitmektedir, aktif araç kullanırım. Hızlı öğrenir, hızlı adapte olurum. Niteliklerime saygı duyan, gelişimime katkıda bulunacak ve destekleyecek bir firmada çalışmak istiyorum. Ankara''da ikamet etmekteyim. Devam niteliğindeki detaylı bilgiler ekte yolladığım özgeçmişimde mevcuttur.', 'e5dba7790d629424a161b6ba2773f0fb.doc', 1376349422),
(18, 'Taha Tuna Göksu', 'taha_022@hotmail.com', '0506 - 681 57 65 ', 'Makine Mühendisi', '', 'f94f92edd62b5d6b61eb22fdfb53d03f.docx', 1377161064),
(19, 'ÇAĞLAR KAPLAN', 'caglar_kaplanlondon@hotmail.com', '0553 - 4108947', 'SATIŞ PAZARLAMA', 'MERHABALAR \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n \\n\\nSuan Askerligimi Kasımpaşada yapmaktayım biyomedikal mühendisiyim izmirde ikamet etmekteyim askerlik sonunda sizinle calısabilirim eger uygun görüyorsanız. Suan İSTANBUL KASIMPAŞA HASTANESINDE askerligimi yapmaktayım.İngilterede biyomedikal mühendislik alaınında yüksek lisansımı ve lisansımı bitirdim. İzmir''de Askerlikten sonra ikamet ediyorum ve sizin firmanızda çalışmayı istiyorum babam El ve Mikrocerrahi hastanesinde başhekim Doç. Dr Ibrahim Kaplan beni sizin sitenize bakmam konusunda yönlendirdi, Kendim Ortopedik implantların tasarım üretim aşamalaındada AR-GE faaliyetleri kapasmında askerlik öncesi çalıştım ve de satış pazarlama konularında  sizlerle uygun görüyorrsanız İzmir''de firmanızda çalışabilirim  biriminizde bilginize.Babam El ve Mikrocerrahi hastanesinin başhekimidir onun tavsiyesi ile şirketinize baktım ve çok begendim umarım satış ve pazrlama biriminizde İzmirde çalışabilirim\\n\\n\\n\\n\\n\\n\\nSaygılarımla\\n\\n\\n\\n\\nÇağlar Kaplan', '82514e54c9fad7d68da72716192c015a.doc', 1378135627),
(20, 'CAGLAR KAPLAN', 'caglar_kaplanlondon@hotmail.com', '0553 - 4108947', 'SATIŞ PAZARLAMA', 'MERHABALAR \\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n \\n\\nSuan Askerligimi Kasımpaşada yapmaktayım biyomedikal mühendisiyim izmirde ikamet etmekteyim askerlik sonunda sizinle calısabilirim eger uygun görüyorsanız. Suan İSTANBUL KASIMPAŞA HASTANESINDE askerligimi yapmaktayım.İngilterede biyomedikal mühendislik alaınında yüksek lisansımı ve lisansımı bitirdim. İzmir''de Askerlikten sonra ikamet ediyorum ve sizin firmanızda çalışmayı istiyorum babam El ve Mikrocerrahi hastanesinde başhekim Doç. Dr Ibrahim Kaplan beni sizin sitenize bakmam konusunda yönlendirdi, Kendim Ortopedik implantların tasarım üretim aşamalaındada AR-GE faaliyetleri kapasmında askerlik öncesi çalıştım ve de satış pazarlama konularında  sizlerle uygun görüyorrsanız İzmir''de firmanızda çalışabilirim  biriminizde bilginize.\\n\\n\\n\\n\\n\\n\\nSaygılarımla\\n\\n\\n\\n\\nÇağlar Kaplan', '4f558865c8dcc724fb45ba24a06f5d0f.doc', 1378677989),
(21, 'mehmet deniz', 'carisma_deniz_32@hotmail.com', '0554 - 7663650', 'Biyomedikal cihaz teknikeri', '', '58ac7817e6ebe2831b6a41b8bd467e34.doc', 1387156410),
(22, 'pınar ayan', 'pinarayan85@hotmail.com', '506 - 2371772', 'sekreter', 'Merhabalar,\\nburdur doğumluyum,evlendikten sonra 2007 yılından itibaren izmirde hikametkah ediyorum,berke medikal''de 1,5 yıl sekreterlik yaptım iyi derecede microsoft office kullanıyorum,sekreterin yerine getireceği görevlere ve disipline sahibim teşekkürler.', '5d50c4c1c02fde76c064714a9acafabe.docx', 1387229036),
(23, 'GÜRKAN  YENEN', 'gurkan_yenen1@hotmail.com', '0554 - 9734574', 'BİYOMEDİKAL SATIŞ ELEMANI', '', 'c1dd74adfdbf9aa50929f03b41a8d829.docx', 1388572640),
(24, 'BAHAR CANDAN', 'baharim_02@hotmail.com', '0553 - 2705448', 'İHALE SORUMLUSU', '', 'ddbab5fa0abe94fce0ed2db8c4e25fab.docx', 1388617636),
(25, 'Gizem  Keleşoğlu', 'gizemkelesogluu@windowslive.com', '0505 - 8620913', 'Yönetici Asistanı - Sekreter', 'Özgeçmişime ait bilgiler ekte tarafınıza gönderilmiştir.', '5a81de9f0dfdf72ec2e7b882fabe2aee.doc', 1389197371),
(26, 'Alper Demir', 'alperdemir@live.com', '0543 - 4785377', 'Sales & Marketing', 'Merhabalar,\\n13.02.1985 Isparta dogumluyum. Su an Antalya''da yasamaktayim. Oncesinde ailemle Sivas''ta ikamet ettim. 2006 yilinda Mersin Universitesi Turizm ve Otel Isletmeciliginden mezun oldum. Ardindan Anadolu Universitesi Isletme Yonetimi bolumunu bitirdim. Yuksek Lisansimi da buna istinaden Isletme Yonetimi uzerine yaptim. Is deneyimleri CV''imde deincelem sansi bulacaksinizdir ancak sunu belirtmek isterim; en son Sivas''ta Gurbuz Medikal''de Boston urun danismani olarak calistim. Dolayisi ile sizin de pazarlamasini yaptiginiz bu marka urunleri hakinda bilgi sahibiyim. Calisirken sizin firmaniz hakkinda cok bilgi edindim. Simdi ozel nedenlerden dolayi askerlik gorevimi icra ettikten sonra Antalya''da yasamaya basladim ve sizlere ulasmak istedim. Olasi bir personel ihtiyacinizda CV''imi degerlendirmenizi rica ederim. Umarim yuz yuze goreusme sansini elde ederim. Simdiden cok tesekkurler\\nIyi Calismalar\\nAlper Demir ', '2174f5b9603ac81ca0a23df3218a51da.docx', 1395248657),
(27, 'özhan topuz', 'ozhantopuz@gmail.com', '541 - 6777067', 'satış sorumlusu', 'Özhan TOPUZ	\\nHamitler mahallesi Evren sokak Eserkent apart 1/3\\nOsmangazi /BURSA\\nCep: 0 541 677 70 67\\nE-Posta: ozhantopuz@gmail.com\\n\\nKişisel Bilgiler\\n\\nDoğum Tarihi ve Yeri: 1979-ZONGULDAK\\nMedeni Durumu: Bekar\\nAskerlik: Terhis\\nSigara Kullanımı: Kullanmıyor\\nUyruğu: T.C.\\n\\nEğitim Bilgileri\\n\\n1994-1997 Fener Lisesi\\n\\nİş Tecrübeleri\\n2012-2013 Berka Saglik Sistemleri Paz. San. Ith. Ihr. Ltd. Sti.  (Satış Sorumlusu )\\n2011-2012 ALVİMEDİCA (Satış Sorumlusu )\\n2010-2011 Özsel ecza depoları (Satış Sorumlusu )\\n2008-2010 Medar Sağlık San. Tic. Ldt. Şti (Satış Sorumlusu )\\n\\n\\nSertifika ve Kurslar\\n\\nMİCROSOFT OFFİCE( WORD EXCEL POWERPOİNT OUTLOOK ) ofis\\naraçları \\nİHLAS TANITIM VE HİZMET ORGANİZASYONU - 2001 satış teknikleri\\n\\nHobiler: SEYAHAT ETMEK,ARABA KULLANMAK, MÜZİK DİNLEMEK,KiTAP OKUMAK (Felsefe,Psikoloji ve Kişisel Gelişim ) \\n\\nReferanslar\\nİstendiği takdirde verilecektir.\\n', '1275515de8e291c4f214b4c7a71adc8a.docx', 1398195128),
(28, 'Şule Doğan', 'suledogan_bb@hotmail.com', '0554 - 8623565', 'Ürün geliştirme', '', 'ec9dc6933aaf807d94769206507074d0.docx', 1405274741),
(29, 'emine mihrap kahvecioğlu', 'kahvecioglumihrap@gmail.com', '531 - 7973875', 'finansman', '2008 yılında TEB''de başlamış olduğum bankacılık/finans sektörüne şu an Şekerbank''ta devam etmeyim. sektör değişikliği yaparak finans alanında kariyerime devam etmek istiyorum.', 'ae837966155d1a2c31e71a734e066eda.doc', 1411382382),
(30, 'GÜRKAN YENEN', 'gurkan1903@yandex.com', '0554 - 9734574', 'SATIŞ ELEMANI VEYA TEKNİK SERVİS', '', '454579f57bf25c67e7c5e78aa6757b44.docx', 1417619802),
(31, 'Mustafa Cera', 'mustafacera@gmail.com', '0554 - 7002832', 'Genel', '', 'daf69971862498fad8ffa49370ef827a.docx', 1420481041),
(32, 'Hazal Bilici', 'hazal-bilici@yandex.com', '0534 - 9174823', 'Biyomedikal Mühendisi', 'Sayın Yetkili,\\n\\n   Firmanızın sunduğu imkanlar ve misyonu ilgimi çekmektedir. Firmanızda uygun bir pozisyonda çalışmak için almış olduğum eğitime, deneyimlerime, bilgi ve becerilerime güveniyorum.\\n\\n   Yakın Doğu Üniversitesi Biyomedikal Mühendisliği bölümünden 2013 yılında mezun oldum. Eğitimim süresince bir buçuk ay kadar Draeger Medikal firmasında ve bir buçuk ay kadar 9 Eylül Hastahanesinde staj yaptım. Ayrıca eğitim dönemi boyunca okulumuzun hastanesinde gönüllü olarak stajerlik yapma imkanım oldu.\\n\\n    Bugüne değin görev aldığım kurumlarda araştırmacı, yenilikçi ve fırsat yaratan bir rol alarak kurumların daha etkin bir yapıya kavuşmasını sağladım. Bugüne kadar gösterdiğim performans ve edindiğim tecrübe ile şirketiniz için de son derece yararlı olacağıma inanıyorum.\\n\\n    Pozisyonun gerekliliklerini ve benim pozisyona uygunluğumu görüşmek üzere sizden haber bekliyorum.\\n\\n    İlginiz için şimdiden teşekkür ederim.\\n\\nHazal Bilici\\n05349174823', 'b4a8c27a390f3cf5471353f529b15638.docx', 1420565362),
(33, 'Işıl Kılıç', 'isil.klc@gmail.com', '554 - 7637689', 'Elektronik ve Haberleşme Mühendisi', 'Elektronik ve Haberleşme Mühendisi 2013 Çankaya Üniversitesi''nden mezunum.', '780d87adbe7a1aac24b2448ae69ad85f.doc', 1426433218),
(34, 'DİDEM ÖZKÖKBUĞUR', 'didem_ozkok@hotmail.com', '507 - 1932390', '', '', '8399a6df83e8b321f4a6c842a892de0e.docx', 1428414526),
(35, 'TOLGA DALDA', 'tolgadalda@gmail.com', '0551 - 4186281', 'Biyomedikal', '1992 Aydın/Nazilli doğumlu Akdeniz Üniversitesi Biyomedikal Cihaz Teknolojisi mezunu olup halen Lisans Kamu Yönetimi 4.sınıf öğrencisiyim.', '49fa7a0b110538aecf43ebbadcaa2c4a.doc', 1430770316),
(36, 'SABRİ  BULUT', 'sabri.bulut@outlook.com', '0544 - 5608351', 'Biyomedikal Mühendisi', '1993 Tarihinde Trabzonda doğdu.Orta  ve  lise  eğitimini Trabzonda tamamladı Üniversite  eğitimini İstanbul Yeni Yüzyıl Üniversitesinde  biyomedikal mühendisliğini GNO:3.43 ile  tamamladı.KURT & KURT ve  Cerrahpaşa  Tıp Fakülteisi Biypmedikal Birimde  staj yaptı.Askerlik tecilli ve  bekar. İngilizce (çok iyi ) almanca (başlangıc)', '11a8bcab415f6253bb5b8182951bad3b.docx', 1433760405),
(37, 'Emine Önal', 'emineonal90@gmail.com', '506 - 9120926', 'biyoistatistikçi', 'Merhaba,\\nEge Üniversitesi istatistik bölümü mezunuyum. Sağlık bilimleri enstitüsüne bağlı biyoistatistik bölümünde yüksek lisans yapıyorum. Tez dönemine geçtim ve tez konum olarak veri madenciliğini seçtim. Sizinle çalışmak, kendimi geliştirmek isterim. Şimdiden teşekkürler.\\niyi günler', '4bd16b1f021687bdda108031aaf47c9a.doc', 1438948787),
(38, 'Caner Tunçay', 'tuncaycaner@hotmail.com', '0555 - 8423480', '-', '', 'd411f154199d60d766bc209baeddb123.doc', 1439321779),
(39, 'ALİ GÜRBÜZ', 'ali-gurbuz@hotmail.com', '0506 - 1453890', 'SATIN ALMA', '1990 yılında İzmir''de doğdum. Yaşamım boyunca İzmir''de bulundum ve iyi eğitim olanaklarına sahip oldum. Son olarak İzmir Ekonomi Üniversitesinde, İşletme Bölümü + Perakende Yönetimi okudum. Başarılı bir üniversite hayatımın sonunda askerlik görevimi tamamladım. Evlendim ve iyi bir iş yaşamı için gereken her türlü alt yapıyı oluşturdum. Üniversite 3.sınıf başı ile birlikte kendimin satın alma departmanına yakın olduğumu farkettim. Fakat bu bir saplantı şeklinde değil. İlerleyen süreçte daha aktif olabileceğim farklı bir pozisyonada sıcak bakarım. Fırsat verilirse, karşılıklı katabileceğimiz değerler hakkında sizinle görüşmek isterim. İlginiz için teşekkürler. ', '0dd257ec63975295bd9f203c32dd7dc3.doc', 1439336947),
(40, 'Umut Doğu  Seçkin', 'umutdoguseckin@gmail.com', '542 - 7611644', 'Mühendis', '', '98219f46f11073679d98cac9a7e2d9b7.docx', 1441754862),
(41, 'Umut Doğu  Seçkin', 'umutdoguseckin@gmail.com', '7611644 - 7611644', '', '', 'c61cba7938ff0fcd0a62e948ab60a5df.docx', 1442152869),
(42, 'Musa  Özkaya', 'musaozkaya905@gmail.com', '0553 - 3692324', 'perfüzyonist', 'üniversiteyi birinvilikle perfüzyon teknikeri olarak bitirdim. kapl damar cerrrahisinde kullanılan ekipmnalar kanüller tubingsetler ve oksijenatörler hakkında gerekli bilgi ve beceriye sahıbım  \\necmo kurulumunu takılmasını iyi bilirim. \\nmaquet te kullanılan ekıpmanlarla ilgili deneyimim var.', 'a2f3e83fa4fb459f1820c66d64a1f992.docx', 1444050571),
(43, 'Beril  GÜNDOĞAN', 'gundoganberil@gmail.com', '0536 - 9745281', '', '', 'b923a5fbef07b7bc4ed6cbcf5af17f3a.doc', 1444126807),
(44, 'ismail yaşar', 'ismaillyasar@hotmail.com', '532 - 5648796', 'tıbbi mümessil', '', '9b406c271c1c400dbad8b9c7d92895ae.docx', 1444981219),
(45, 'Sertaç Arcan', 'arcansertac@gmail.com', '544 - 8424782', 'Biyolog', 'EGE ÜNİVERSİTESİ BİYOLOJİ BÖLÜMÜ MEZUNUYUM. AYNI BÖLÜMDE YÜKSEK LİSANS ÖĞRENİMİME DEVAM EDİYORUM.', 'a58dea53aadacb22250bd8f732663bfe.docx', 1445118364),
(46, 'Gökçe  Kılıç', 'gokce3593@gmail.com', '553 - 3149911', '', '', '01fc64c0430e3d89b81a13a44a5243f5.docx', 1455574005),
(47, 'serkan  polat', 'serkan__polat@hotmail.com', '507 - 9680480', 'satis ve pazarlama', 'Yaklasik 4 yia yakindir beyin cerrahi alanda calismaktayim medikal sektore yabamci değilim ankara da ikamet etmekteyim eleman ihtiyaciniz varsa ekibinize katilmak isterim.', 'a72dd82782e380fd0c2614b90367284a.docx', 1465497155),
(48, 'CAGLAR KAPLAN KAPLAN', 'caglar_kaplanlondon@hotmail.com', '553 - 5534108947', 'DIS TICARET', 'Merhaba Sayın ilgili,\\n\\n6 sene İngilterede ikamet ettim ve 1 senede Amerikada calıstım. İngilterede Universitemi bitirdim. Ayrıca Anadolu Universitesinde suan itibari ile Dıs ticaret bölümü okumaktayım son senem. Dış ticaret bölümünü bitirdikten sonra Anadolu Universitesinde, Uluslararası ticaret ve lojistik yönetimi bölümü okuyacagım. \\n \\nIngilizcem anadilim gibidir ve de Italyanca kurslarına  gidiyor ve italyan dilini yakından takıp ediyor ve ogreniyorum. Medikal, Ev ürünleri ve Makine Sektöründe suan itibari ile 5 senedir profesyonel olarak DIS TICARET SORUMLUSU [ ITHALAT IHRACAT OPERASYON VE YURTDISI MUSTERI TEMSILCISI ] olarak calıstım ve ihracat ve ithalat ile ilgili iş aramaktayım çeşitli dış ticaret sektörlerinde. Ihracat ve ithalat alanımda deneyimliyim ve her sektöre kolayca adapte olabilirim. \\n \\nDıs ticaret operasyonel kısımda; ihracat ve ithalat operasyonlarında kara, deniz ve hava gönderimlerinde yada mal ithalatında hakimiyet kazandım. Ihracat ve ithalat ödeme sekillerine hakimiyetim vardır ve ayrıca da Full veya Partial Hava, Gemi, Tır ( 20DC 40DC and 40HC konteyner kargolarında) , ve CMR (TIR) lojistik  operasyonları ve gümrükleme operasyonlarına cok iyi hakimiyetim vardır.  Yurtdışı müsteri odaklı olarak calısmakta ve onların hem operasyon hemde müsteri temsilciligni profesyonel olarak yapmaktayım. Ithalat firma iinde yabancı müsterilerin talepleri dogrultusunda operasyonlarını da profesyonel anlamda yapmaktayım.\\n\\n Izmir ticaret odasında tüm dıs ticaret ile ilgili egitimlerine ve kurslara katıldım ve kendimi aktif olarak gelistirmek için herzaman katılmaktayım. Sizinle dış ticaret departmanınızda çalışmayı cok isterim. \\n \\nDeneyimim 5 sene olmus olup, yabancı müşteri bazında ve ihracat, ithalat operasyonel kısımda hakimiyetim vardır kendim ihracat müsteri sorumlusu olarak görev almıs olup dıs ticaret icin gereken operasyonları tam anlamıyla hakimim ve deneyimliyimdir.\\n \\nİlginizi için simdiden tesekkurler ve olumlu olumsuz sonuclarınızı beklemekteyim\\nSaygılarımla, \\nCaglar Kaplan\\nGSM : +90-5534108947', 'b443e74148cb444a3294c0a815657bc1.doc', 1475101504);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `langs`
--

CREATE TABLE IF NOT EXISTS `langs` (
  `id` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `langs`
--

INSERT INTO `langs` (`id`, `title`, `lang`) VALUES
(1, 'Türkçe', 'tr'),
(0, 'İngilizce', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `fronted` tinyint(4) NOT NULL,
  `backend` tinyint(4) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `installed` tinyint(4) NOT NULL,
  `is_core` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Tablo döküm verisi `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `version`, `description`, `fronted`, `backend`, `menu`, `enabled`, `installed`, `is_core`) VALUES
(1, 'Modül Yönetimi', 'module', '1.0', 'Sistemde yüklü modüllerin listesini gösterir.', 0, 1, '', 1, 1, 1),
(2, 'Sayfalar', 'pages', '1.0', 'Web sayfanıza yeni sayfalar ekleyin.', 0, 1, 'content', 1, 1, 1),
(3, 'Menü Yönetimi', 'navigations', '1.0', 'Menüleri ve bağlantıları yönetin.', 0, 1, 'design', 1, 1, 1),
(4, 'Diller', 'lang', '1.0', 'Dilleri yönetin.', 0, 1, '', 1, 1, 1),
(5, 'Ayarlar', 'settings', '1.0', 'Web sayfanızın genel ayarlarını yapın.', 0, 1, '', 1, 1, 1),
(6, 'Kullanıcı Yönetimi', 'users', '1.0', 'Kullanıcıları yönetin.', 0, 1, 'user', 1, 1, 1),
(7, 'Gruplar', 'groups', '1.0', 'Kullanıcı grupları.', 0, 1, 'user', 1, 1, 1),
(8, 'Dosyalar', 'files', '2.0', 'Dosyalarınıza gözatın, yeni dosyalar yükleyin.', 0, 1, 'content', 1, 1, 1),
(9, 'Haberler', 'news', '1.0', 'Sayfanıza haber ekleyin.', 1, 1, 'content', 1, 1, 1),
(10, 'Kısayol Tuşları', 'keyboard', '1.0', 'Kısayol tuşları ile zaman kazanın.', 0, 1, 'design', 1, 1, 1),
(11, 'Yetkiler', 'permissions', '1.0', 'Kullanıcı yetkileri.', 0, 1, 'user', 1, 1, 1),
(13, 'Tema Yönetimi', 'themes', '1.0', 'Web sayfasının tasarımını değiştirin.', 0, 1, 'design', 1, 1, 1),
(14, 'İletişim', 'contact', '1.0', 'İletişim bilgileri.', 1, 1, 'content', 1, 1, 1),
(48, 'Site Haritası', 'sitemaps', '1.0', 'Site Haritası Oluşturun.', 0, 1, 'content', 1, 1, 0),
(49, 'Franchise', 'franchise', '1.0', 'Franchise.', 1, 0, 'content', 1, 0, 0),
(50, 'Ürünler', 'products', '2.0', 'Ürünlerinizi yönetin.', 1, 1, 'content', 1, 1, 0),
(51, 'Ürün Kategorileri', 'categories', '1.0', 'Ürün kategorilerini yönetin.', 1, 1, 'content', 1, 1, 0),
(52, 'İnsan Kaynakları', 'hrform', '1.0', 'Başvuruları yönetin.', 1, 1, 'content', 1, 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `navigations`
--

CREATE TABLE IF NOT EXISTS `navigations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `link_type` varchar(20) NOT NULL,
  `page_id` int(11) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Tablo döküm verisi `navigations`
--

INSERT INTO `navigations` (`id`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `position`, `target`) VALUES
(27, 0, 'uri', 0, '', 'http://', '', 0, '_self'),
(31, 0, 'module', 0, 'hrform', 'http://', '', 5, '_self'),
(28, 0, 'page', 9, '', '', '', 1, '_self'),
(29, 0, 'module', 0, 'contact', 'http://', '', 6, '_self'),
(30, 0, 'module', 0, 'categories', 'http://', '', 4, '_self');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `navigations_info`
--

CREATE TABLE IF NOT EXISTS `navigations_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `navigation_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Tablo döküm verisi `navigations_info`
--

INSERT INTO `navigations_info` (`id`, `navigation_id`, `title`, `lang`) VALUES
(17, 27, 'Anasayfa', 'tr'),
(18, 27, 'Home', 'en'),
(19, 28, 'Kurumsal', 'tr'),
(20, 28, 'About', 'en'),
(21, 29, 'İletişim', 'tr'),
(22, 29, 'Contact', 'en'),
(23, 30, 'Ürün Grupları', 'tr'),
(24, 30, 'Product Groups', 'en'),
(25, 31, 'İnsan Kaynakları', 'tr'),
(26, 31, 'Human Resource', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(150) NOT NULL,
  `created_on` int(11) NOT NULL,
  `status` enum('Aktif','Pasif') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Tablo döküm verisi `news`
--

INSERT INTO `news` (`id`, `slug`, `created_on`, `status`) VALUES
(4, '14-17-aralik-2016-heartware-workshop-hannover-', 1339165775, 'Aktif'),
(8, '2', 1343910253, 'Aktif'),
(10, 'HeartWare', 1448372241, 'Aktif'),
(11, 'HeartWare14Ocak2016', 1449307936, 'Aktif');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news_info`
--

CREATE TABLE IF NOT EXISTS `news_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `short` varchar(250) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Tablo döküm verisi `news_info`
--

INSERT INTO `news_info` (`id`, `news_id`, `title`, `short`, `body`, `lang`) VALUES
(7, 4, '14-17 ARALIK 2016 HEARTWARE WORKSHOP HANNOVER ', 'HEARTWARE WORKSHOP HANNOVER 14-17 ARALIK 2016 EĞİTİM PROGRAMI', '<h3 style="color:blue;">\\n	<span style="color:#b22222;">HEARTWARE WORKSHOP HANNOVER 14-17 DECEMBER 2016</span></h3>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<h4>\\n	AGENDA WEDNESDAY 14TH DECEMBER 2016</h4>\\n<div>\\n	7:50</div>\\n<div>\\n	Departure to Medical School of Hannover</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	9:00-17:00</div>\\n<div>\\n	Welcome, Introduction and Presentation of the VAD Program</div>\\n<div>\\n	Patient Selection for VAD Implantation</div>\\n<div>\\n	Techniques of HeartWare HVAD&reg; Implantation</div>\\n<div>\\n	Criterias and Surgical technique of LVAD explantation for recovery</div>\\n<div>\\n	Anticoagulation Therapy at the MHH</div>\\n<div>\\n	Clinical Experience with the HVAD&reg; System</div>\\n<div>\\n	Perioperative Management of the RV</div>\\n<div>\\n	Closing Remarks</div>\\n<div>\\n	Dinner</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<h4>\\n		THURSDAY 15TH DECEMBER 2016</h4>\\n	<div>\\n		7:50 Departure to the Medical Scholl of Hannover</div>\\n	<div>\\n		&nbsp;</div>\\n	<div>\\n		9:00-17:00 Treatment at the ICU</div>\\n	<div>\\n		CT- and PET-Imaging of VAD-Patients</div>\\n	<div>\\n		Company Presentation and Product Pipeline</div>\\n	<div>\\n		Role and Responsibilities in a VAD Program</div>\\n	<div>\\n		Follow Up Outpatients and Emergency Situations</div>\\n	<div>\\n		Discussing Prepared Patients</div>\\n	<div>\\n		Technical background and Hands-On session HVAD</div>\\n	<div>\\n		Closing Remarks and Wrap Up</div>\\n	<div>\\n		Adjourn</div>\\n	<div>\\n		&nbsp;</div>\\n	<div>\\n		&nbsp;</div>\\n	<div>\\n		<h4>\\n			FRIDAY 16TH DECEMBER 2016</h4>\\n		<div>\\n			7:50 Departure to the Medical Scholl of Hannover</div>\\n		<div>\\n			&nbsp;</div>\\n		<div>\\n			9:00-17:00 Pre-, Intra- and Postoperative Echo</div>\\n		<div>\\n			CT- and PET-Imaging of VAD-Patients</div>\\n		<div>\\n			Company Presentation and Product Pipeline</div>\\n		<div>\\n			Technical Problems and Solutions</div>\\n		<div>\\n			VAD Outpatient Care Unit</div>\\n		<div>\\n			RV failure/ ICU treatment</div>\\n		<div>\\n			Driveline Management</div>\\n		<div>\\n			Closing Remarks and Wrap Up</div>\\n		<div>\\n			Adjourn</div>\\n		<div>\\n			&nbsp;</div>\\n		<div>\\n			&nbsp;</div>\\n		<h4>\\n			SATURDAY 17TH DECEMBER 2016</h4>\\n		<div>\\n			9:00-17:00 Join cardiac surgery, ICU and Cardiology</div>\\n		<div>\\n			Closing Remarks and Wrap Up</div>\\n		<div>\\n			Adjourn</div>\\n	</div>\\n</div>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(8, 4, '', '', '', 'en'),
(16, 8, '', '', '', 'en'),
(15, 8, 'Lotus Tavi Bilimsel Eğitim Programları', '6 Aralık ve 7 Aralık 2015 tarihlerinde Dubai''de düzenlenecek olan Lotus TAVI Bilimsel Eğitim Programları gerçekleştirilecektir.', '<p>\\n	<strong><em>Lotus<sup>TM</sup> Valve System Training</em></strong></p>\\n<p>\\n	<strong><em>Face to Face Session &ldquo;Phase 2&rdquo;</em></strong></p>\\n<p>\\n	<strong><em>December 6, 7 2015</em></strong><br />\\n	&nbsp;</p>\\n<p>\\n	<span style="color:#ff0000;"><strong>Lokasyon:</strong></span></p>\\n<p>\\n	NMC Specialty Hospital Al Nahda</p>\\n<p>\\n	7 A St, Amman Street, Al Nahda 2 ,Next to Bait AL Khair Building &ndash;DUBAI, United Arab Emirates</p>\\n<p>\\n	<br />\\n	<span style="color:#ff0000;"><strong><em>AGENDA</em></strong></span></p>\\n<p>\\n	<strong><em>December , 6 2015</em></strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\\n<table border="1" cellpadding="0" cellspacing="0" style="width:728px;" width="728">\\n	<tbody>\\n		<tr>\\n			<td style="width:113px;height:49px;">\\n				<p align="center">\\n					<strong><em>13.00 &ndash; 13.15</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:49px;">\\n				<p align="center">\\n					<strong><em>Nathalie Ganas</em></strong></p>\\n				<p align="center">\\n					<strong><em>Expectations</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:49px;">\\n				<p align="center">\\n					<strong><em>Welcome &amp; Introduction</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:65px;">\\n				<p align="center">\\n					<strong><em>13.15 &ndash; 14.15</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:65px;">\\n				<p align="center">\\n					<strong><em>Nathalie Ganas</em></strong></p>\\n				<p align="center">\\n					<strong><em>Explain in details the Lotus&trade;</em></strong></p>\\n				<p align="center">\\n					<strong><em>Valve Components</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:65px;">\\n				<p align="center">\\n					<em>Lotus&trade; Valve System</em></p>\\n				<p align="center">\\n					<strong><em>&quot;Device Components&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:45px;">\\n				<p align="center">\\n					<strong><em>14.15 &ndash; 15.15</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:45px;">\\n				<p align="center">\\n					<strong><em>Dr. Jan Harnek </em></strong></p>\\n				<p align="center">\\n					<strong><em>Get familiar with procedure</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:45px;">\\n				<p align="center">\\n					<em>Lotus&trade; Valve System</em></p>\\n				<p align="center">\\n					<strong><em>&quot;Step by Step&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:37px;">\\n				<p align="center">\\n					<strong><em>15.15 &ndash; 15.30</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:37px;">\\n				<p align="center">\\n					<em>Coffee Break</em></p>\\n			</td>\\n			<td style="width:236px;height:37px;">\\n				<p align="center">\\n					&nbsp;</p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:69px;">\\n				<p align="center">\\n					<strong><em>15.30 &ndash; 16.15</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:69px;">\\n				<p align="center">\\n					<strong><em>Dr. Jan Harnek</em></strong></p>\\n				<p align="center" style="margin-left:-26.7pt;">\\n					<strong><em>Explain the Lotus&trade; TAVI implant </em></strong></p>\\n				<p align="center" style="margin-left:-26.7pt;">\\n					<strong><em>with the appropriate step by step</em></strong></p>\\n				<p align="center" style="margin-left:-33.75pt;">\\n					<strong><em>Identify the elements discussed previously</em></strong></p>\\n				<p align="center">\\n					&nbsp;</p>\\n			</td>\\n			<td style="width:236px;height:69px;">\\n				<p align="center">\\n					<em>Lotus&trade; Valve System</em></p>\\n				<p align="center">\\n					<strong><em>&quot;</em></strong><strong><em>Case Presentation&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n	</tbody>\\n</table>\\n<p>\\n	<br />\\n	<strong><em>December ,7 2015</em></strong></p>\\n<table border="1" cellpadding="0" cellspacing="0" style="width:728px;" width="728">\\n	<tbody>\\n		<tr>\\n			<td style="width:113px;height:44px;">\\n				<p align="center">\\n					<strong><em>08.15 &ndash; 11.45</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:44px;">\\n				<p align="center">\\n					<strong><em>Dr. Jan Harnek</em></strong></p>\\n				<p align="center">\\n					<strong><em>Measurement accordingto Lotus&trade; implant</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:44px;">\\n				<p align="center">\\n					<strong><em>Patient Screening</em></strong></p>\\n				<p align="center">\\n					<strong><em>&amp;</em></strong></p>\\n				<p align="center">\\n					<strong><em>Sizing</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:26px;">\\n				<p align="center">\\n					<strong><em>11.45&ndash; 13.00</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:26px;">\\n				<p align="center">\\n					<em>Lunch</em></p>\\n			</td>\\n			<td style="width:236px;height:26px;">\\n				<p align="center">\\n					&nbsp;</p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:63px;">\\n				<p align="center">\\n					<strong><em>13.00 &ndash; 14.00</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:63px;">\\n				<p align="center">\\n					<strong><em>Dr. Jan Harnek</em></strong></p>\\n				<p align="center">\\n					<strong><em>Manipulateactual Lotus&trade; Valve System</em></strong></p>\\n				<p align="center">\\n					<strong><em>(Cath Lab)</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:63px;">\\n				<p align="center">\\n					<em>Group Rotational</em></p>\\n				<p align="center">\\n					<strong><em>&quot;Training Workshop&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:65px;">\\n				<p align="center">\\n					<strong><em>14.00 &ndash; 15.45</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:65px;">\\n				<p align="center">\\n					<strong><em>Nathalie Ganas</em></strong></p>\\n				<p align="center">\\n					<strong><em>Reinforcestepbystepprocedure</em></strong></p>\\n				<p align="center">\\n					<strong><em>(Virtual Reality)</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:65px;">\\n				<p align="center">\\n					<em>Group Rotational</em></p>\\n				<p align="center">\\n					<strong><em>&quot;Training Workshop&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:53px;">\\n				<p align="center">\\n					<strong><em>15.45 &ndash; 16.30</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:53px;">\\n				<p align="center">\\n					<strong><em>Dr. Jan Harnek</em></strong></p>\\n				<p align="center">\\n					<strong><em>Howto manage challengingcases</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:53px;">\\n				<p align="center">\\n					<em>Lotus&trade; Valve System</em></p>\\n				<p align="center">\\n					<strong><em>&quot;</em></strong><strong><em>Tips&amp; Tricks&quot;</em></strong></p>\\n			</td>\\n		</tr>\\n		<tr>\\n			<td style="width:113px;height:31px;">\\n				<p align="center">\\n					<strong><em>16.30 - 16.45</em></strong></p>\\n			</td>\\n			<td style="width:378px;height:31px;">\\n				<p align="center">\\n					<strong><em>Nathalie Ganas</em></strong></p>\\n			</td>\\n			<td style="width:236px;height:31px;">\\n				<p align="center">\\n					<strong><em>DFU &amp;Wrap-Up</em></strong></p>\\n			</td>\\n		</tr>\\n	</tbody>\\n</table>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(19, 10, 'HeartWare HVAD Regional Training', 'HeartWare HVAD Regional Training eğitim toplantı detayı için tıklayınız...', '<p>\\n	<strong><span style="color:#ff0000;">Yer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: </span>Niguarda Ca Granda Hospital-Milano</strong></p>\\n<p>\\n	<strong><span style="color:#ff0000;">Toplantı Adı: </span>HeartWare HVAD Regional Training</strong></p>\\n<p>\\n	<strong><span style="color:#ff0000;">Tarih &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</span> 09 - 10 Aralık 2015</strong></p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	<span style="font-size:14px;"><strong><a href="http://www.masmedikal.com/heartware-agenda.pdf" target="_blank"><span style="color:#ff0000;">EĞİTİM PROGRAMI AJANDASINI G&Ouml;R&Uuml;NT&Uuml;LEMEK İ&Ccedil;İN TIKLAYINIZ</span></a></strong></span></p>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(20, 10, '', '', '', 'en'),
(21, 11, 'Heartware Eğitim Programı Duyurusu', '14 Ocak 2016 tarihinde San Raffaele Hospital, Milano''da düzenlenecek olan Heartware Eğitim Programı detayları için tıklayınız...', '<p>\\n	<strong><span style="color: rgb(255, 0, 0);">Yer &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;</span>San Raffaele Hospital, Milano</strong></p>\\n<p>\\n	<strong><span style="color: rgb(255, 0, 0);">Tarih &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :</span>&nbsp;14 Ocak 2016</strong></p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	<span style="font-size: 14px;"><strong><span style="color: rgb(255, 0, 0);"><a href="http://www.masmedikal.com/14january16agenda.pdf" target="_blank">EĞİTİM PROGRAMI AJANDASINI G&Ouml;R&Uuml;NT&Uuml;LEMEK İ&Ccedil;İN TIKLAYINIZ</a></span></strong></span></p>\\n<div>\\n	&nbsp;</div>\\n', 'tr'),
(22, 11, '', '', '', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `operator`
--

CREATE TABLE IF NOT EXISTS `operator` (
  `operatorID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fistname_op` varchar(100) NOT NULL,
  `lastname_op` varchar(100) NOT NULL,
  `password_op` varchar(50) NOT NULL,
  PRIMARY KEY (`operatorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Tablo döküm verisi `operator`
--

INSERT INTO `operator` (`operatorID`, `username`, `fistname_op`, `lastname_op`, `password_op`) VALUES
(1, 'glcn', 'Gülcan', 'Ertop', '1122'),
(2, 'alp', 'Alper', 'Şalvız', '2233');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `theme_layout` varchar(50) NOT NULL DEFAULT 'theme',
  `css` text NOT NULL,
  `js` text NOT NULL,
  `status` enum('Aktif','Pasif') NOT NULL,
  `core` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Tablo döküm verisi `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `theme_layout`, `css`, `js`, `status`, `core`) VALUES
(13, 'Anasayfa', 'home', 'theme', '', '', 'Aktif', 1),
(9, 'Kurumsal', 'kurumsal', 'theme2', '', '', 'Aktif', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `page_layouts`
--

CREATE TABLE IF NOT EXISTS `page_layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Tablo döküm verisi `page_layouts`
--

INSERT INTO `page_layouts` (`id`, `page_id`, `title`, `body`, `lang`) VALUES
(26, 13, 'Firma Profili', '<div>\\nKalp Nakli’ne köprüleme amaçlı, uzun ve kısa süreli dolaşım desteği sağlamaya yönelik, ventrikül destek cihazı implantasyonları konusunda Türkiye''deki öncü firmalardan olan şirketimiz, 2002 yılında İzmir merkezli olarak kurulmuştur.\\n\\n10 yılı aşkındır medikal sektöründeki deneyimi ile, başlangıçta Kardiyoloji ve Kalp Damar Cerrahisi alanlarında hizmet vermek üzere kurulan şirketimiz, kurulduğu günden itibaren ürün portföyünü ve hizmet kalitesini sürekli olarak arttırarak, günümüzde Radyoloji, Üroloji ve Gastroentoroloji alanlarında da deneyimli ve uzman kadrosuyla hizmet vermeye devam etmektedir.\\n	&nbsp;</div>\\n<div>\\n	<strong>MAS TIBBİ &Uuml;R&Uuml;NLER</strong></div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<div>\\n		<a href="http://masmedikal.com/categories/detail/heartware"><img alt="heartware" src="http://masmedikal.com/uploads/e30b1a4cb7ddde450af79c0321e74733_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/boston"><img alt="boston" src="http://masmedikal.com/uploads/d4c5d295d5f321fc553b21b442525888_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/maquet"><img alt="maquet" src="http://masmedikal.com/uploads/d510204154d6de0ba7136df8b693b31d_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/ekos"><img alt="ekos" src="http://masmedikal.com/uploads/0bef90091127cb5233c80d5f29e3509a_thumb.jpg" /></a></div>\\n	<div>\\n		&nbsp;</div>\\n	<div>\\n		<a href="http://masmedikal.com/categories/detail/pulsecath"><img alt="pulsecath" src="http://masmedikal.com/uploads/99e1e872c38c227db10f09b1fe293c24_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/vascutek"><img alt="vascutek" src="http://masmedikal.com/uploads/cf840301167d8de4cb03bebfe53a14d3_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/oryamed"><img alt="oryamed" src="http://masmedikal.com/uploads/f687e29040980e01747caa24c2f99758_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/sorin"><img alt="sorin" src="http://masmedikal.com/uploads/f8fa51190ec1e21f1a928a3a19056319_thumb.jpg" /></a></div>\\n</div>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(27, 13, 'Company Profile', '<p>\\n	<span style="text-align: justify; ">Our company, which is one of the leading companies in Turkey in the implantations of ventricular assist devices that provide short and long term support as a bridge to transplantation, was established in Izmir in 2002.</span></p>\\n<p>\\n	&nbsp;</p>\\n<div>\\n	<p style="text-align: justify; ">\\n		With the more than ten years of experience in medical field, our company initially established to serve only in Cardiology and Cardiovascular Surgery. Our company, which increases its product portfolio and service quality since the day it was established, now also serve in the areas of Radiology, Urology and Gastroenterology with its well-trained and experienced team.</p>\\n	<p style="text-align: justify; ">\\n		&nbsp;</p>\\n</div>\\n<div style="text-align: justify; ">\\n	<strong>MAS TIBBİ &Uuml;R&Uuml;NLER</strong></div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div>\\n	<div style="text-align: justify; ">\\n		<a href="http://masmedikal.com/categories/detail/heartware"><img alt="heartware" src="http://masmedikal.com/uploads/e30b1a4cb7ddde450af79c0321e74733_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/boston"><img alt="boston" src="http://masmedikal.com/uploads/d4c5d295d5f321fc553b21b442525888_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/maquet"><img alt="maquet" src="http://masmedikal.com/uploads/d510204154d6de0ba7136df8b693b31d_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/ekos"><img alt="ekos" src="http://masmedikal.com/uploads/0bef90091127cb5233c80d5f29e3509a_thumb.jpg" /></a></div>\\n	<div style="text-align: justify; ">\\n		&nbsp;</div>\\n	<div style="text-align: justify; ">\\n		<a href="http://masmedikal.com/categories/detail/pulsecath"><img alt="pulsecath" src="http://masmedikal.com/uploads/99e1e872c38c227db10f09b1fe293c24_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/vascutek"><img alt="vascutek" src="http://masmedikal.com/uploads/cf840301167d8de4cb03bebfe53a14d3_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/oryamed"><img alt="oryamed" src="http://masmedikal.com/uploads/f687e29040980e01747caa24c2f99758_thumb.jpg" /></a>&nbsp; &nbsp; &nbsp;<a href="http://masmedikal.com/categories/detail/sorin"><img alt="sorin" src="http://masmedikal.com/uploads/f8fa51190ec1e21f1a928a3a19056319_thumb.jpg" /></a></div>\\n</div>\\n<div>\\n	&nbsp;</div>\\n', 'en'),
(18, 9, 'Kurumsal', '<div>\\n	Kalp nakline k&ouml;pr&uuml;leme ama&ccedil;lı, uzun ve kısa s&uuml;reli dolaşım desteği sağlamaya y&ouml;nelik, ventrik&uuml;l destek cihazı implantasyonları konusunda T&uuml;rkiye&#39;deki öncü &nbsp;firmalardan olan şirketimiz, 2002 yılında İzmir merkezli olarak kurulmuştur.</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	10 yılı aşkındır medikal sekt&ouml;r&uuml;ndeki deneyimi ile, başlangı&ccedil;ta Kardiyoloji ve Kalp Damar Cerrahisi alanlarında hizmet vermek &uuml;zere kurulan şirketimiz, kurulduğu g&uuml;nden itibaren &uuml;r&uuml;n portf&ouml;y&uuml;n&uuml; ve hizmet kalitesini s&uuml;rekli arttırarak, g&uuml;n&uuml;m&uuml;zde Radyoloji, &Uuml;roloji ve Gastroentoroloji alanlarında da&nbsp; deneyimli ve uzman kadrosuyla hizmet vermeye devam etmektedir.</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<strong>MAS TIBBİ &Uuml;R&Uuml;NLER</strong></div>\\n', 'tr'),
(19, 9, 'About', '<p>\\n	<span>Our company which is one of the leading companies in Turkey about long and short term bridging for heart transplant, ventricular assist device implantation to provide circulatory support is based in Izmir since 2002 with nine years of experience in the medical sector initially established to serve the areas of Cardiology and Cardiovascular Surgery.&nbsp;</span></p>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	Our company increases its product portfolio and service quality since its inspection, and today it continues to serve also in the areas of Radiology, Urology and Gastroenterology with its experienced and expert staff.</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<strong>MAS TIBBİ &Uuml;R&Uuml;NLER LTD. ŞTİ.</strong></div>\\n', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `patientID` varchar(70) NOT NULL,
  `operatorID` int(11) NOT NULL,
  `tckimlikNo` varchar(11) NOT NULL,
  `firstname_pat` varchar(255) NOT NULL,
  `lastname_pat` varchar(255) NOT NULL,
  `adress_pat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  KEY `fk_opID` (`operatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `patient`
--

INSERT INTO `patient` (`patientID`, `operatorID`, `tckimlikNo`, `firstname_pat`, `lastname_pat`, `adress_pat`) VALUES
('ANTEP001VO', 2, '67453856767', 'Vakkas ', 'Öztürk', NULL),
('EGE001NH', 1, '4555353536', 'Nurettin', 'Gölcük', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains a list of modules that a group can access.' AUTO_INCREMENT=11 ;

--
-- Tablo döküm verisi `permissions`
--

INSERT INTO `permissions` (`id`, `group_id`, `module`) VALUES
(1, 2, 'settings'),
(2, 2, 'files'),
(3, 2, 'news'),
(4, 2, 'contact'),
(5, 2, 'hrform'),
(6, 2, 'keyboard'),
(7, 2, 'pages'),
(8, 2, 'sitemaps'),
(9, 2, 'categories'),
(10, 2, 'products');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `phone_no_pat`
--

CREATE TABLE IF NOT EXISTS `phone_no_pat` (
  `phonenoID` int(20) NOT NULL AUTO_INCREMENT,
  `patientID` varchar(70) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  PRIMARY KEY (`phonenoID`),
  KEY `fk_patientID` (`patientID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Tablo döküm verisi `phone_no_pat`
--

INSERT INTO `phone_no_pat` (`phonenoID`, `patientID`, `phone_no`) VALUES
(1, 'ANTEP001VO', '5062808057'),
(2, 'ANTEP001VO', '5072228985'),
(3, 'ANTEP001VO', '5447370145'),
(4, 'EGE001NH', '5368789260'),
(5, 'EGE001NH', '5076656468'),
(6, 'EGE001NH', '5349705848'),
(7, 'EGE001NH', '5077388427');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=159 ;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `categories_id`, `slug`, `image`) VALUES
(1, 9, 'fluoropassiv-tw-carotid-patch', 'FluoropassivTWCarotidPatch.jpg'),
(2, 9, 'gelsoft', 'Gelsoft.jpg'),
(3, 9, 'gelsoft-gelseal', 'Gelsoft&Gelsealpatches.jpg'),
(4, 9, 'gelsoft-plus', 'GelsoftPlus.jpg'),
(5, 9, 'gelweave', 'Gelweave.jpg'),
(6, 9, 'gelweave-abdominal-designs', 'GelweaveAbdominalDesigns.jpg'),
(7, 9, 'gelweave-aortic-root-designs', 'GelweaveValsalva.jpg'),
(8, 9, 'gelweave-arch-designs', 'GelweaveArchDesigns.jpg'),
(9, 9, 'thin-wall-carotid-patch', 'ThinWallCarotidPatch.jpg'),
(10, 9, 'thin-wall-fluoropassiv', 'ThinWallFluoropassi.jpg'),
(11, 9, 'thoracoabdominal-designs', 'ThoracoabdominalDesigns.jpg'),
(12, 9, 'vp1200k', 'VP1200K.jpg'),
(13, 10, 'cobrahood', 'Cobrahood.jpg'),
(14, 10, 'maxiflo', 'Maxiflo.jpg'),
(15, 10, 'rapidax', 'Rapidax.jpg'),
(16, 10, 'sealptfe', 'SEALPTFE.jpg'),
(17, 10, 'taperflo', 'TaperFlo.jpg'),
(18, 10, 'unity', 'Unity.jpg'),
(19, 11, 'anaconda-aaa-stent-graft-system', 'fd599dcce1fe4f8225c42827e3655ff8.jpg'),
(20, 12, 'biovalsalva', '4fc057d23c83166503c8485fda01f7a2.jpg'),
(21, 13, 'gelweave-aortic-root-designs', 'a5602ca6b33300970a3824f39b6e215d.jpg'),
(22, 5, 'ivac-3l-', 'd32c4eb1685e0579b6a50dda135a9c16.jpg'),
(23, 8, 'mach4e', 'd18db19f05c21f366905cca845ca1eb6.jpg'),
(24, 4, 'nitrik-oksit-no', 'b2b06e2e243a75bd7e77aba054b09da9.jpg'),
(25, 19, 'carbomedics-carbo-seal', 'b9d852fc0203017163d2f6aa2213f9ea.jpg'),
(26, 19, 'carbomedics-carbo-seal-valsalva', '2a17812f087acfbbae30488b110633fd.jpg'),
(27, 20, 'carbomedics-reduced-series', '7e46f35f1c7c1f9cfdf72d486f81586f.jpg'),
(28, 20, 'carbomedics-top-hat', '28d86e860d73b95b33e355ffe2ed0ce6.jpg'),
(29, 20, 'pediatricsmall-adults-aortic-valve', 'f9bcf5ff62716f2ede4c6dfd77bd45a1.jpg'),
(30, 20, 'pediatricsmall-adults-mitral-valve', '07e7e869c94efe6f3c6f483944d88b73.jpg'),
(31, 20, 'standard-aortic-valve', '74abe3dfd977d62ab1a90b870e802661.jpg'),
(32, 20, 'standard-mitral-valve', 'f2dc01ea4618d635645aa928a95820cd.jpg'),
(33, 14, 'icross-coronary-imaging-catheter', '09428ab0b49dd6a9fb36d5b108f7ab86.jpg'),
(34, 14, 'delivery-support-guide-wires', 'ab176051fbefcd2e059fd9977383faf1.gif'),
(35, 14, 'frontline-guide-wires', '2b55ac2c258b1eacdd84538ffbcfed31.gif'),
(36, 14, 'kinetix-guidewire', 'bfd4b25a381e2ce6d953a648dcca2e73.jpg'),
(37, 14, 'rotablator-rotational-atherectomy-system', '0ab44d846ef68e5f8a8966d7d77958e7.jpg'),
(38, 14, 'apex-ptca-dilatation-catheter', 'b3001af7a5b6646ebf0d0b867a7e4480.jpg'),
(39, 14, 'emerge-ptca-dilatation-catheter', '5d9793f75d24e0469d3eb3659d6b9996.jpg'),
(40, 14, 'flextome-cutting-balloon-dilatation-device', '433d26b4f079a8d7d84b32dfafe6729d.jpg'),
(41, 14, 'maverick-ptca-balloon-catheters', 'c2d5f1b527442a1c6effd375e29645ea.jpg'),
(42, 14, 'nc-quantum-apex-ptca-dilatation-catheter', 'de8c9a736e2bf0400129e8316ee023fe.jpg'),
(43, 14, 'quantum-maverick-balloon-catheters', '6bc37822632e47fc6515644d867995a6.jpg'),
(44, 14, 'diagnostic-catheters', '8e80a9ec85eabca8f64b9efc41313d8c.jpg'),
(45, 14, 'filterwire-ez-embolic-protection-system-for-svgs', '8bd8f255d9089bc25f6901709945fb19.jpg'),
(46, 14, 'guide-catheters', 'bf24c5a18e9dab60e943f5051f9386b3.jpg'),
(47, 14, 'access-and-crossing-guide-wires', '6e49e1d5d1c37e9ef856557aab7b06a6.gif'),
(48, 15, 'imager-ii-angiographic-catheter', 'a6383afb8b841abb3b7fa4c546f5e87d.jpg'),
(49, 15, 'coyote-balloon-dilatation-catheter', '4984dc5a93b6a54bcce19757891ca055.jpg'),
(50, 15, 'mustang-balloon-dilatation-catheter', 'f26f3576d36c908456876b23508dc919.jpg'),
(51, 15, 'standard-occlusion-balloon-catheter', '57c51e8d693e650c516419ea669a41d8.jpg'),
(52, 15, 'sterling-es-balloon-dilatation-catheters', '47949f53ac49ec9267ee1528a7c59eb6.jpg'),
(53, 15, 'sterling-sl-balloon-dilatation-catheter', '4a10cf76ac92a636db2ed40bf5b05d29.jpg'),
(54, 15, 'sterling-balloon-dilatation-catheter', '119ee596fc53d7a783b5391fc9d60d2a.jpg'),
(55, 15, 'sterling-monorail-balloon-dilatation-catheter', '8e34eb4e3504f8ff35da52b0b65cb9c5.jpg'),
(56, 15, 'express-ld-iliac-premounted-stent-system', '86961f3b63f47a38d14ef8dd319c52e7.jpg'),
(57, 15, 'express-sd-renal-monorail-premounted-stent-syste', 'fe5a213dc9be7dd88194c3c8b6370d92.jpg'),
(58, 15, 'fathom-steerable-guidewires', '6bcbca3e1426d451dc6a88e3eb9beceb.jpg'),
(59, 15, 'guide-wires-for-peripheral-interventions', '937a235f43798c394746e107c409dcfa.jpg'),
(60, 15, 'journey-guidewire', 'afa6b40f8c85148a2282544367910ebe.jpg'),
(61, 15, 'zipwire-hydrophilic-guide-wire', '0a0fc4d7e836e545c21372cde21a037b.jpg'),
(62, 15, 'super-sheath-introducer-sheath', 'dbe406251bae7ae2d4b64b15d673b3e6.jpg'),
(63, 15, 'renegade-hi-flo-microcatheter-kits-and-systems', '59b8f6ae4718bb8865e879035866a1bd.jpg'),
(64, 15, 'epic-vascular-self-expanding-stent-system', 'cb4b443b0aaf0ffaa2f3edc3e523bfc8.jpg'),
(65, 15, 'wallstent-endoscopic-biliary-stent-system', '7ce2b92ec19e8348ee3a634d3a16a17c.jpg'),
(66, 15, '0.018-and-0.035-fibered-platinum-coils', ''),
(67, 15, 'vortx-18-and-35-vascular-occlusion-coils', ''),
(68, 15, 'contour-pva-embolization-particles', ''),
(69, 15, 'carotid-wallstent-monorail-endoprosthesis', 'c9d31dbcb4f1dec29a0db7af486a0ac1.jpg'),
(70, 16, 'precision-speedtac-transvaginal-anchor-system', '9589e171aec36e1a26e823e0ebd14ddf.jpg'),
(71, 16, 'precision-twist-transvaginal-anchor-system', '98ce5508838397e831d22cfde6b9a18c.jpg'),
(72, 16, 'nephromax-high-pressure-nephrostomy-balloon-cathe', 'd80c0e3446929a1f26647827336ccf3b.jpg'),
(73, 16, 'uromax-ultra-high-pressure-balloon-catheter', '8acd5b2c24971d7305a9309fa5cb1356.jpg'),
(74, 16, 'escape-nitinol-stone-retrieval-basket', '01f7f60ba957b706de8b24ae911ed912.jpg'),
(75, 16, 'graspit-nitinol-stone-retrieval-forceps', '5fe9a0bd38f56fdf9a2069918cad1e1b.jpg'),
(76, 16, 'gemini-paired-wire-helical-stone-retrieval-basket', 'b6f0f558121ec8199c921bfd4720dbae.jpg'),
(77, 16, 'optiflex-1.3f-nitinol-stone-retrieval-basket', '509c9d60725ed414b9f24e74e15cf444.jpg'),
(78, 16, 'segura-hemisphere-stone-retrieval-basket', '248d97f7e9bc05a5be776e7d781c7954.jpg'),
(79, 16, 'stone-cone-nitinol-retrieval-coil', 'ece8cc31add1fe02ee02d624ed2a5ae6.jpg'),
(80, 16, 'zero-tip-nitinol-stone-retrieval-basket', 'd7683e44a6dd341a2961cc74962542ff.jpg'),
(81, 16, 'dual-lumen-ureteral-catheters', '92f1188a1a8cb08c4c3edd6da8db5b37.jpg'),
(82, 16, 'imager-ii-catheters', '94365ec7b3dfe130aba6be35f63cc8d1.jpg'),
(83, 16, 'sensor-ptfe-nitinol-guidewire-hydrophilic-tip', '98ff7c12e8df109b6cd92b819f435f3c.jpg'),
(84, 16, 'glidewire-nitinol-hydrophilic-guidewire', '4b8ed27324d3333343352ca5f30c8e5c.jpg'),
(87, 16, 'navigator-ureteral-access-sheath', 'fcffb36504c828671a9e37a2e96ea233.jpg'),
(86, 16, 'zebra-urologic-guidewire', '74d6c69523d3f956a3804cd91c501d77.jpg'),
(88, 16, 'advantage-fit-system', '2f5d9ab332f67fbee83f65a36c0c0d94.jpg'),
(89, 16, 'advantage-transvaginal-mid-urethral-sling-system', '364045e113fbcce0366f61429d288ced.jpg'),
(90, 16, 'lynx-suprapubic-mid-urethral-sling-system', 'a907f28a3ae339a53fbec12adcf4275d.jpg'),
(91, 16, 'obtryx-transobturator-mid-urethral-sling-system', 'f35967d32a62478a5cdf506cc16a8488.jpg'),
(92, 16, 'prefyx-pps-system', '8aeb9569165e68a6c8f0adbbe64b82cb.jpg'),
(93, 16, 'solyx-sis-system', '965a1707be1541415cde2345d102a1b6.jpg'),
(94, 16, 'contour-ureteral-stent', '5d27fba347d85f74eb3e284f3655e38d.jpg'),
(95, 16, 'percuflex-ureteral-stent', '96f3d65fc7d0028cab49bbd2ee9a5492.jpg'),
(96, 16, 'polaris-ultra-ureteral-stent', 'abe5427d5ba9a1a3d56b4b74c7dc6b18.jpg'),
(97, 16, 'polaris-loop-ureteral-stent', 'a17d832ef14d5c970e00ec40d3dd8af2.jpg'),
(98, 17, 'precision-speedtac-transvaginal-anchor-system', '9589e171aec36e1a26e823e0ebd14ddf.jpg'),
(99, 17, 'precision-twist-transvaginal-anchor-system', '98ce5508838397e831d22cfde6b9a18c.jpg'),
(100, 17, 'advantage-fit-system', '2f5d9ab332f67fbee83f65a36c0c0d94.jpg'),
(101, 17, 'advantage-transvaginal-mid-urethral-sling-system', '364045e113fbcce0366f61429d288ced.jpg'),
(102, 17, 'lynx-suprapubic-mid-urethral-sling-system', 'a907f28a3ae339a53fbec12adcf4275d.jpg'),
(103, 17, 'obtryx-transobturator-mid-urethral-sling-system', 'f35967d32a62478a5cdf506cc16a8488.jpg'),
(104, 17, 'prefyx-pps-system', '8aeb9569165e68a6c8f0adbbe64b82cb.jpg'),
(105, 17, 'solyx-sis-system', '965a1707be1541415cde2345d102a1b6.jpg'),
(106, 18, 'cre-fixed-wire-balloon-dilator', '5d85c71789f68f1bb6f774da47652245.jpg'),
(107, 18, 'cre-wireguided-balloon-dilator', '35f5fb8c74691a6556e243f457d40f3e.jpg'),
(108, 18, 'extractor-pro-rx-xl-and-dl-retrieval-balloons', '49c0ab572590e055ea360f272deeb34d.jpg'),
(109, 18, 'extractor-rx-retrieval-balloon', '2b92910f2651d73ebbca49f6c2adb640.jpg'),
(110, 18, 'resolution-clip', '2137a5af1efaff824c240c9f16ce0c3f.jpg'),
(111, 18, 'initial-placement-peg-', '54438281f4e064982a51b5478318fa9f.jpg'),
(112, 18, 'endovive-standard-profile-balloon-replacements', ''),
(113, 18, 'dreamwire-high-performance-guidewire', '9aeaad6b771bc3e0a947f2341b5b578d.jpg'),
(114, 18, 'hydra-jagwire-guidewire', '5eb111066bc621451165aa80398cbf50.jpg'),
(115, 18, 'rotatable-snare', 'fb26bccfbe24c30ab9d97d18fac40271.jpg'),
(116, 18, 'autotome-rx-cannulating-sphincterotome', 'a105ad9c63fb5c62bfb83529daf6b89e.jpg'),
(117, 18, 'dreamtome-rx-cannulating-sphincterotome', '021b8d013c7aef5a496df0f59c94153c.jpg'),
(118, 18, 'hydratome-rx-cannulating-sphincterotome', '86b5d6dba6a0d1277af9be6ed6cd1895.jpg'),
(119, 18, 'advanix-biliary-stent-with-naviflex-rx-delivery-', '288d378c257c08429c14fc579c260ded.jpg'),
(120, 18, 'polyflex-esophageal-stent', '4e50e2d1640fe98e31eb6ed92a43e470.jpg'),
(121, 18, 'ultraflex-esophageal-ng-stent-system', '086c201c3aa99f314138848dae8b0712.jpg'),
(122, 18, 'ultraflex-precision-colonic-stent-system', '080248d21e2f16368d19c8c2bf1ddb91.jpg'),
(123, 18, 'wallstent-colonic-duodenal-endoprosthesis', 'e3b5c22e134be1866177f418cb161d60.jpg'),
(124, 18, 'wallstent-rx-biliary-endoprosthesis', '6c0fddcffb3b34a6ab7af7195366b63c.jpg'),
(125, 18, 'wallflex-biliary-rx-stents', '028c67ac034efbb338b1b2fea29925d1.jpg'),
(126, 18, 'wallflex-colonic-stent', 'a0da72a4c0df2cf8047ed6ff5433fbad.jpg'),
(127, 18, 'wallflex-duodenal-stent', 'c218c50b792cc1017cf7fb8a4ab46b72.jpg'),
(128, 18, 'wallflex-fully-and-partially-covered-esophageal', 'e27e411fcac0d17fc81c33070cded906.jpg'),
(129, 21, 'ecmo-cannulae', 'babe3600e4a4f11dcc518d250c2851d2.jpg'),
(130, 21, 'rotaflow-centrifugal-pump', '76d3b16b71ed8f91a4eedfa12208444a.jpg'),
(131, 21, 'bioline-coating', '50f13d14c5f45d3a19bed8a8a4abbfdb.jpg'),
(132, 21, 'softline-coating', '7a21ab101ca7207279d17de4418c7034.jpg'),
(133, 21, 'mecc-system', ''),
(135, 28, 'sensation-plus-8fr.-50cc-iab-catheter', 'a1f52f20fa12e85d4aa40b6c69ad4222.png'),
(136, 28, 'mega-iab-catheters', 'b1acea7b34d33b3bec51ea2c8acec16c.jpg'),
(137, 28, 'sensation-7fr.-iab-catheter', 'ec2b20c044af079c3c70f853ee2ee7d7.jpg'),
(138, 28, 'linear-7.5fr.-iab-catheter', 'ddad5ee928629088ef1615725e750211.jpg'),
(139, 28, 'cardiosave-iabp-hybrid-rescue', 'f26ff7097460862a363f1a02e1109dbf.jpg'),
(140, 28, 'sensation-7fr.-cs300-iabp-system', 'e2e6a94eb7a3f103b26e095dfb6460a6.jpg'),
(141, 28, 'cs300-iabp-with-intellisense', '3b518544ec942535932422b306a0e1d5.jpg'),
(142, 28, 'cs100-iabp-with-intellisync', 'c8f3e2178e4075e07ec893f79726dce9.jpg'),
(143, 26, 'fusion-bioline-vascular-grafts', '641be568399082524884aba33c00ca54.jpg'),
(144, 26, 'fusion-vascular-graft', '5e13ce05a086d92a56fe195bcea78c92.jpg'),
(145, 31, 'acrobat-i-stabilizer-system', '90c05dcb7774be3372719e02aa6236fc.jpg'),
(146, 31, 'acrobat-mechanical-off-pump-system', '97821ae089ea297c747781f9a7097d37.jpg'),
(147, 31, 'acrobat-suv-vacuum-stabilizer', '09cfdc12e012543fbe3dae771ecfd99c.jpg'),
(148, 31, 'acrobat-v-vacuum-stabilizer', '7fd5d1523bdac66fc0df09c1bbe39b31.jpg'),
(149, 31, 'ultima-opcab-system', '411a9d600cc4976eab27a37952198f16.jpg'),
(150, 32, 'acrobat-i-positioner-system', 'f4c58f61e55c2558efc6979d48c7d149.jpg'),
(151, 32, 'xpose-3-access-device', '8fcb2d7fd97bdc59d8b9dad05dc4b75b.jpg'),
(152, 32, 'xpose-4-access-device', '7f0a8139169c635c67ee619fc4f23cfe.jpg'),
(153, 33, 'aortic-cutter', '070f9788609faf42360cb4a00885a736.jpg'),
(154, 33, 'heartstring-iii-proximal-seal-system', 'cbae1bd5f8e28b95dee40ad41f3252a6.jpg'),
(155, 34, 'acrobat-i-blower-mister', '4734a07479de1091cb116cddf71f9a64.jpg'),
(156, 34, 'axius-blower-mister', 'd9e6cd88c3b45d3e6383098f98cb7890.jpg'),
(157, 34, 'axius-coronary-shunt', '152e4f2118a71736588caa37aee79921.jpg'),
(158, 35, 'heartware-ventrikuler-destek-sistemi', '8b2d588682b797667a0516910992faec.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_info`
--

CREATE TABLE IF NOT EXISTS `product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `lang` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=317 ;

--
-- Tablo döküm verisi `product_info`
--

INSERT INTO `product_info` (`id`, `products_id`, `name`, `content`, `lang`) VALUES
(1, 1, 'Fluoropassiv™ TW Carotid Patch', '<p>\\n	&nbsp;</p>\\n<table border="0" cellpadding="0" cellspacing="0" style="width: 250px; " width="182">\\n	<colgroup>\\n		<col />\\n		<col />\\n	</colgroup>\\n	<tbody>\\n		<tr height="20">\\n			<td height="20" style="height:20px;width:118px;">\\n				Size (mm)</td>\\n			<td style="width:64px;">\\n				&nbsp;Cat No.</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				6 x 75&nbsp;</td>\\n			<td>\\n				920675FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				8 x 75&nbsp;</td>\\n			<td>\\n				920875FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				10 x 50&nbsp;</td>\\n			<td>\\n				921050FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				10 x 75&nbsp;</td>\\n			<td>\\n				921075FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				10 x 100&nbsp;</td>\\n			<td>\\n				921010FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				10 x 150&nbsp;</td>\\n			<td>\\n				921015FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				15 x 50&nbsp;</td>\\n			<td>\\n				921550FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				15 x 75&nbsp;</td>\\n			<td>\\n				921575FT</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height:20px;">\\n				25 x 120&nbsp;</td>\\n			<td>\\n				922512FT</td>\\n		</tr>\\n	</tbody>\\n</table>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(2, 1, 'Fluoropassiv™ TW Carotid Patch', '<p>\\n	&nbsp;</p>\\n<div>\\n	Would you like to examine the product catalog?</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<a href="http://www.vascutek.com/Downloads/Literature/Thin_Wall_Fluoropassiv_Carotid_Patch/Fluoropassiv%20TWCP-English.pdf" target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(3, 2, 'Gelsoft', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(4, 2, 'Gelsoft', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelsoft/Gelsoft_Literature_English.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(5, 3, 'Gelsoft™ & Gelseal™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(6, 3, 'Gelsoft™ & Gelseal™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelsoft/Gelsoft_Literature_English.pdf#page=2" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(7, 4, 'Gelsoft™ Plus', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(8, 4, 'Gelsoft™ Plus', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/GelsoftPlus/GelsoftPlus%20English_lo.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(9, 5, 'Gelweave™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(10, 5, 'Gelweave™', '<p>\\n	<span style="color: rgb(101, 122, 139); font-family: Arial, sans-serif; text-align: justify; ">Would you like to examine the product catalog?</span></p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave/Gelweave_B097_2E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(11, 6, 'Gelweave™ Abdominal Designs', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(12, 6, 'Gelweave™ Abdominal Designs', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave/Gelweave%20Bro_B097_2E_smallest.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(13, 7, 'Gelweave™ Aortic Root Designs', '<p>\\n	&nbsp;</p>\\n<table border="0" cellpadding="0" cellspacing="0" style="width: 600px; " width="694">\\n	<colgroup>\\n		<col style="text-align: center; " />\\n		<col style="text-align: center; " />\\n		<col style="text-align: center; " />\\n		<col style="text-align: center; " />\\n		<col style="text-align: center; " />\\n		<col style="text-align: center; " />\\n	</colgroup>\\n	<tbody>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; width: 118px; text-align: center; ">\\n				&Ccedil;ap mm</td>\\n			<td style="width: 154px; text-align: center; ">\\n				Max Boy &Ccedil;apı mm</td>\\n			<td style="width: 130px; text-align: center; ">\\n				G&ouml;vde Uzunluğu cm</td>\\n			<td style="width: 98px; text-align: center; ">\\n				Uzunluk cm</td>\\n			<td style="width: 110px; text-align: center; ">\\n				Yaka Boyu cm</td>\\n			<td style="width: 82px; text-align: center; ">\\n				Katalog No</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				16</td>\\n			<td style="text-align: center; ">\\n				21</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				16</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730016ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				18</td>\\n			<td style="text-align: center; ">\\n				24</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				18</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730018ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				20</td>\\n			<td style="text-align: center; ">\\n				26</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				20</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730020ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				22</td>\\n			<td style="text-align: center; ">\\n				28</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				22</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730022ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				24</td>\\n			<td style="text-align: center; ">\\n				32</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				24</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730024ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				26</td>\\n			<td style="text-align: center; ">\\n				34</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				26</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730026ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				28</td>\\n			<td style="text-align: center; ">\\n				36</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				28</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730028ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				30</td>\\n			<td style="text-align: center; ">\\n				38</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				30</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730030ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				32</td>\\n			<td style="text-align: center; ">\\n				42</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				32</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730032ADP</td>\\n		</tr>\\n		<tr height="20">\\n			<td height="20" style="height: 20px; text-align: center; ">\\n				34</td>\\n			<td style="text-align: center; ">\\n				44</td>\\n			<td style="text-align: center; ">\\n				15</td>\\n			<td style="text-align: center; ">\\n				34</td>\\n			<td style="text-align: center; ">\\n				10</td>\\n			<td style="text-align: center; ">\\n				730034ADP</td>\\n		</tr>\\n	</tbody>\\n</table>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(14, 7, 'Gelweave™ Aortic Root Designs', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave/Gelw_Valsalva_4pp_B304-2E_PQ.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(15, 8, 'Gelweave™ Arch Designs', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(16, 8, 'Gelweave™ Arch Designs', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave_Arch_Geometries/Geometries-Eng_B127_2E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(17, 9, 'Thin Wall Carotid Patch', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(18, 9, 'Thin Wall Carotid Patch', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Thin_Wall_Fluoropassiv_Carotid_Patch/Fluoropassiv%20TWCP-English.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(19, 10, 'Thin Wall Fluoropassiv™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(20, 10, 'Thin Wall Fluoropassiv™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Thin_Wall_Fluoropassiv/FVTW%20_English.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(21, 11, 'Thoracoabdominal Designs', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(22, 11, 'Thoracoabdominal Designs', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave_Arch_Geometries/Geometries-Eng_B127_2E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(23, 12, 'VP1200K', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(24, 12, 'VP1200K', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/VP1200k/VP1200K_English_Literature.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(25, 13, 'Cobrahood™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellencektir.</p>\\n', 'tr'),
(26, 13, 'Cobrahood™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/ePTFE/ePTFE_ROW_B253-3E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(27, 14, 'Maxiflo™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(28, 14, 'Maxiflo™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/ePTFE/ePTFE_ROW_B253-3E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(29, 15, 'Rapidax™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(30, 15, 'Rapidax™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Rapidax/Rapidax_Eng.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(31, 16, 'SEALPTFE™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(32, 16, 'SEALPTFE™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/ePTFE/ePTFE_ROW_B253-3E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(33, 17, 'TaperFlo™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(34, 17, 'TaperFlo™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/ePTFE/ePTFE_ROW_B253-3E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(35, 18, 'Unity', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(36, 18, 'Unity', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/ePTFE/ePTFE_ROW_B253-3E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(37, 19, 'Anaconda™ AAA Stent Graft System', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(38, 19, 'Anaconda™ AAA Stent Graft System', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Anaconda/BlueGlide_English.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(39, 20, 'BioValsalva™', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(40, 20, 'BioValsalva™', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/BioValsalva/biovalsalva%20B205_2E.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(41, 21, 'Gelweave™ Aortic Root Designs', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(42, 21, 'Gelweave™ Aortic Root Designs', '<p>\\n	&nbsp;</p>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	Would you like to examine the product catalog?</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	&nbsp;</div>\\n<div style="font-family: Arial, sans-serif; outline: 0px; padding: 0px; margin: 0px; border: 0px; color: rgb(101, 122, 139); text-align: justify; ">\\n	<a href="http://www.vascutek.com/Downloads/Literature/Gelweave/Gelw_Valsalva_4pp_B304-2E_PQ.pdf" style="font-family: inherit; outline: 0px; padding: 0px; margin: 0px; border: 0px; text-decoration: none; color: rgb(88, 88, 88); " target="_blank"><b><u>CLICK HERE</u></b></a></div>\\n', 'en'),
(43, 22, 'Ivac 3L ™', '<p>\\n	&nbsp;</p>\\n<div style="text-align: justify; ">\\n	<strong>Cihazın Tanımı</strong></div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	PulseCath sol taraf ventrik&uuml;ler bozukluğu olan hastalara dolaşım desteği sağlamak &uuml;zere tasarlanmıştır. PulseCath, a&ccedil;ık-g&ouml;ğ&uuml;s &nbsp;ameliyatı s&uuml;recinde k&ouml;pr&uuml;c&uuml;k kemiği altı/yardımcı arter &uuml;zerinden veya aortik &ccedil;eper &uuml;zerinden sol ventrik&uuml;ler boşluğa yerleştirilebilir. Dakikada 60 ila 120 kalp atışı değerlerinde, dolaşım destek kapasitesi LV21 i&ccedil;in 2 &ndash; 3 L/dk ve &nbsp;LV17 i&ccedil;in 1,5 &ndash; 2 L/dk dır. PulseCath, bir Aort İ&ccedil;i Balon Pompası (IABP) &nbsp;s&uuml;r&uuml;c&uuml; konsolu ile kombine olarak &ccedil;alışır.</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	<strong>Endikasyonlar</strong></div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	PulseCath, 24 saate kadar sol ventrik&uuml;ler mekanik dolaşım desteği gerektiren &nbsp;sol taraf ventrik&uuml;ler bozukluğu olan hastalarda kullanılmak &uuml;zere ama&ccedil;lanmıştır.</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	<strong>Kontr-Endikasyonlar</strong></div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	- Aortik hastalık: y&uuml;kselen aortik anevrizma, şiddetli aortik &ccedil;eper kire&ccedil;lenmesi</div>\\n<div style="text-align: justify; ">\\n	- Aortik kapak&ccedil;ık hastalığı: aortik kapak&ccedil;ık stenozu, aortik kapak&ccedil;ık yetersizliği</div>\\n<div style="text-align: justify; ">\\n	- Aortik kapak&ccedil;ık protezi</div>\\n<div style="text-align: justify; ">\\n	- k&ouml;pr&uuml;c&uuml;k kemiği altı/yardımcı arter &uuml;zerinden takılması halinde k&ouml;pr&uuml;c&uuml;k kemiği altı/yardımcı arter stenozu</div>\\n<div style="text-align: justify; ">\\n	- Sol ventrik&uuml;lde tromb&uuml;s</div>\\n<div style="text-align: justify; ">\\n	- Sol ventrik&uuml;lde artık işlevi olmaması</div>\\n<div style="text-align: justify; ">\\n	- Sağ ventrik&uuml;lde işlevsizlik</div>\\n', 'tr'),
(44, 22, 'Ivac 3L ™', '<div>\\n	<strong>Device Description</strong></div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	The PulseCath is designed to provide circulatory support to patients with impaired left ventricular function. The PulseCath can be positioned in the left ventricular cavity through the subclavian/axillary artery, or through the aortic wall during open-chest surgery. At heart rates from 60 to 120 beats per minute, the circulatory support capacity is 2 &ndash; 3 L/min for the LV21 and 1,5 &ndash; 2 L/min for the LV17. The PulseCath functions in combination with an Intra Aortic Balloon Pump (IABP) driving console.</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<strong>Indications</strong></div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	The PulseCath is intended for use in patients with impaired left ventricular function which require left ventricular mechanical circulatory support for up to 24 hr.</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	<strong>Contra Indications</strong></div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	- Aortic disease: ascending aortic aneurism, severe aortic wall calcifications</div>\\n<div>\\n	- Aortic valvular disease: aortic valve stenosis, aortic valve insufficiency</div>\\n<div>\\n	- Aortic valve prosthesis</div>\\n<div>\\n	- Subclavian/axillary artery stenosis, in case of insertion via subclavian/axillary artery</div>\\n<div>\\n	- Thrombus in left ventricle</div>\\n<div>\\n	- No residual function of left ventricle</div>\\n<div>\\n	- No function of right ventricle</div>\\n', 'en'),
(45, 23, 'MACH4e', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(46, 23, 'MACH4e', '<p>\\n	&nbsp;</p>\\n<p>\\n	<strong>EKOS </strong>ultrasound accelerated thrombolysis is the safe alternative for dissolving thrombus completely. &ldquo;<strong>EKOS IT</strong>&rdquo; anywhere in the periphery: Veins, Arteries, through an IVC filter and behind valves.</p>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	&nbsp;</div>\\n<div>\\n	Use the links on the left to learn more about the <strong>EKOS </strong>EkoSonic Endovascular System with <strong>MACH4e</strong>, and the EkoSonic SV Endovascular System for the safe, fast and complete choice for treating thrombus.</div>\\n', 'en'),
(47, 24, 'Nitrik Oksit (NO)', '<p>\\n	&nbsp;</p>\\n<div style="text-align: justify; ">\\n	Son yirmi yılda yapılan yoğun araştırmalar, bu molek&uuml;l&uuml;n h&uuml;creler arası haberleşmede temel bir g&ouml;rev &uuml;stlendiğini ortaya &ccedil;ıkarmıştır. Nitrik oksit, insan v&uuml;cudunda doğal olarak &uuml;retilen bir hormon, yani kimyasal bir habercidir; sinir, dolaşım, savunma, solunum ve &uuml;reme sistemlerinin hayati fonksiyonlarının d&uuml;zenlenmesinde stratejik bir rol oynamaktadır. Nitrik oksidin &ccedil;ok &ouml;nemli bir g&ouml;rev &uuml;stlendiği yerlerden biri de damarlarımızdır.&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	M&uuml;kemmel molek&uuml;l nitrik oksit sayesinde, v&uuml;cudun farklı ortamlara g&ouml;re değişen ihtiya&ccedil;ları otomatik olarak sağlanır. Kan damarlarının, spor yaparken genişleyerek artan kan ihtiyacını sağlaması veya yaralanma sonrasında daralarak kanamayı azaltması s&ouml;z&uuml; edilen kusursuz sistemin bir sonucudur.&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	<strong>Endikasyonları</strong></div>\\n<div style="text-align: justify; ">\\n	&nbsp;</div>\\n<div style="text-align: justify; ">\\n	<div>\\n		- Yenidoğanın solunum yetmezliği, (yenidoğanın persistan pulmoner hipertansiyonu, mekonyum aspirasyonu, pn&ouml;moni, respiratuvar distress sendomu),</div>\\n	<div>\\n		- Pulmoner hipertansiyonlu veya pulmoner hipertansif kriz riski bulunan olgularda uygulanan konjenital kalp cerrahisi sonrası,</div>\\n	<div>\\n		- Erişkin respirtuvar ditress sendomu,</div>\\n	<div>\\n		- Kronik pulmoner tromboemboli olgularında uygulanan pulmoner tromboendarterektomi sonrası,</div>\\n	<div>\\n		- Akciğer transplantasyonu,</div>\\n	<div>\\n		- Sağ kalp yetersizliği riski bulunan pulmoner hipertansiyonlu kalp transplantasyonu olguları,</div>\\n	<div>\\n		- Sol ventrik&uuml;l destek cihazı takılan kalp yetersizliği olgularında sağ kalp yetersizliğini &ouml;nleme ve pulmoner hipertansiyonun tedavisinde,</div>\\n	<div>\\n		- Ciddi pulmoner hipertansiyonu bulunan sağ kalp yetersizliği riski mevcut kalp kapak hastaları,</div>\\n</div>\\n<p>\\n	&nbsp;</p>\\n', 'tr'),
(49, 25, 'Carbomedics Carbo-Seal', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(50, 25, 'Carbomedics Carbo-Seal', '<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Low porosity,&nbsp;zero-preclot&nbsp;Gelweave&nbsp;graft provides superior handling and flexibility</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Minimizes interference and suture stress of coronary&nbsp;ostia&nbsp;implantation</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Pliable, cork-shaped sewing cuff conforms to annulus, minimizing potential&nbsp;perivalvularleaks</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows valve&nbsp;rotatability&nbsp;in-situ</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Collagen gel encourages fast, secure&nbsp;intimal&nbsp;attachment</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Collagen gel hydrolyzes within 14 days</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Full-sized standard aortic valve provides excellent&nbsp;hemodynamics</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve related events</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Ascending aortic aneurysms</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Infective&nbsp;aortitis</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Marfan&#39;s&nbsp;Syndrome</li>\\n</ul>\\n', 'en'),
(48, 24, 'Nitric Oxide (NO)', '<p>\\n	Details...</p>\\n', 'en'),
(51, 26, 'Carbomedics Carbo-Seal Valsalva', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr');
INSERT INTO `product_info` (`id`, `products_id`, `name`, `content`, `lang`) VALUES
(52, 26, 'Carbomedics Carbo-Seal Valsalva', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Vertical orientation of pleats facilitates coronary&nbsp;anastomosis</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Graft material resists fraying and quickly seals suture holes, minimizing bleeding</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Easier handling and suturing in comparison to bulkier velour materials</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Ultra-low porosity fabric results in less leakage, weeping and blushing</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Pliable, cork-shaped sewing cuff conforms to annulus, minimizing potential&nbsp;perivalvularleaks</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows valve&nbsp;rotatability&nbsp;in-situ</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Graft is infused with minimally cross-linked gelatin for faster healing, encouraging a secure&nbsp;neo-intimal&nbsp;attachment with reduced inflammatory response</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Collagen gel hydrolyzes within 14 days</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Sinus of&nbsp;Valsalva&nbsp;replicates the native sinus, reducing stress on the coronary&nbsp;anastomoses</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Sinus design encourages natural formation of systolic vortex</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Full-sized standard aortic valve provides excellent&nbsp;hemodynamics</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />The&nbsp;Carbomedics&nbsp;Standard Aortic Valve offers unsurpassed&nbsp;thromboembolic&nbsp;performance and excellent&nbsp;hemodynamics.</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Ascending aortic aneurysms</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Infective&nbsp;aortitis</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Marfan&#39;s&nbsp;Syndrome</li>\\n</ul>\\n', 'en'),
(53, 27, 'Carbomedics Reduced Series', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(54, 27, 'Carbomedics Reduced Series', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<span face="" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; "><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></span></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />True sized for a true fit</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Smaller, pliable cork-shaped sewing cuff allows for improved seating in a smaller annulus or small root</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Smallest external diameter&nbsp;bileaflet&nbsp;valve</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows easy, consistent&nbsp;rotatability&nbsp;in-situ</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<span face="" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; "><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></span></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Alternative to aortic root enlargement when supra-annular valve won&#39;t fit in narrow sinus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve-related events</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<span face="" style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; "><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></span></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Narrow, rigid aortic annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Small, inflexible aorta that lacks Sinus of&nbsp;Valsalva</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Low coronary&nbsp;ostia</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />MIS procedures</li>\\n</ul>\\n', 'en'),
(55, 28, 'Carbomedics Top Hat', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(56, 28, 'Carbomedics Top Hat', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Supra-annular design with no valve components in the annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />No ventricular protrusions for confident seating</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Special&nbsp;sizers&nbsp;allow assessment of valve position and clearance of coronaries before implantation</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Consistent, effortless suturing</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows for&nbsp;rotatability&nbsp;in-situ</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Supra-annular design allows for one or two size increase over intra-annular valves</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Size upgrades provide maximum blood flow</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Allows the largest possible orifice-to-annulus match of any valve</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Alternative to aortic root enlargement</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve related events</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Small aortic annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Severely&nbsp;calcific&nbsp;aortic annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />DVR procedures</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />MIS procedures</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Normal sinus area</li>\\n</ul>\\n', 'en'),
(57, 29, 'Pediatric/Small Adults Aortic Valve', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(58, 29, 'Pediatric/Small Adults Aortic Valve', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Excellent orifice-to-annulus ratio without sacrificing safety or efficacy</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Sewing cuff assembly reduces cuff size for maximum orifice area</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Minimizes repeated replacements in the growing heart</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Fits where other&nbsp;bileaflet&nbsp;valves will not</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve-related events</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Extremely small aortic annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Design allows for intra- or supra-annular placement</li>\\n</ul>\\n', 'en'),
(59, 30, 'Pediatric/Small Adults Mitral Valve', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(60, 30, 'Pediatric/Small Adults Mitral Valve', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Excellent orifice-to-annulus ratio without sacrificing safety or efficacy</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Sewing cuff assembly reduces cuff size for maximum orifice area</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Design allows for intra- or supra-annular placement</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve-related event</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Minimizes repeated replacements in the growing heart</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Fits where other&nbsp;bileaflet&nbsp;valves will not</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n</ul>\\n', 'en'),
(61, 31, 'Standard Aortic Valve', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(62, 31, 'Standard Aortic Valve', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows&nbsp;rotatability&nbsp;in-situ</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Generous sewing cuff conforms to annulus, minimizing&nbsp;perivalvular&nbsp;leaks</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Low profile minimizes housing interference with coronary arteries</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve related events</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Low coronary&nbsp;ostia</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Narrow, rigid aortic sinus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Large annulus</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />MIS procedures</li>\\n</ul>\\n', 'en'),
(63, 32, 'Standard Mitral Valve', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr');
INSERT INTO `product_info` (`id`, `products_id`, `name`, `content`, `lang`) VALUES
(64, 32, 'Standard Mitral Valve', '<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p>\\n	&nbsp;</p>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Implantation Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Large, flexible sewing cuff promotes&nbsp;coaptation&nbsp;to annulus and minimizes potential forperivalvular&nbsp;leaks</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Cuff design displaces tissue up and away from orifice and leaflets allowing for leaflet preservation</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring allows&nbsp;rotatability&nbsp;in-situ to minimize possible interference withsubvalvular&nbsp;anatomy</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Clinical Considerations</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Low profile pivot design minimizes protrusion into low-flow atrial area, reducing potential for thrombus formation</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Titanium stiffening ring minimizes the possibility of leaflet lock-up or escape</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Unsurpassed safety and clinical record for valve related events</li>\\n</ul>\\n<p style="margin: 0px; padding: 10px 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; color: rgb(63, 74, 82); font-family: arial; ">\\n	<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; ">Applications</strong></p>\\n<ul class="list-green" style="margin: 0px; padding: 10px 0px 10px 20px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style-position: initial; list-style-image: initial; color: rgb(63, 74, 82); font-family: arial; ">\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Mitral valve replacement using mitral leaflet preservation procedures</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />Double valve replacement</li>\\n	<li style="margin: 0px; padding: 0px 0px 0px 12px; border: 0px; outline: 0px; vertical-align: baseline; background-color: transparent; list-style: none; position: relative; ">\\n		<img alt="" src="http://www.sorin.com/sites/default/themes/zen/images/bg/list-green.gif" style="border: 0px; margin: 0px; padding: 0px; outline: 0px; vertical-align: bottom; background-color: transparent; position: absolute; left: 0px; top: 4px; " />MIS procedures</li>\\n</ul>\\n', 'en'),
(65, 33, 'iCross™ Coronary Imaging Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(66, 33, 'iCross™ Coronary Imaging Catheter', '<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n &nbsp;</p>\\n<h2 class="top" id="top">\\n Outstanding Image Clarity</h2>\\n<ul>\\n <li>\\n  40 MHz catheter provides excellent image resolution and clarity</li>\\n <li>\\n  Transducer housing and drive shaft designed for uniform imaging core rotation</li>\\n <li>\\n  Large imaging window clearance intended to decrease friction in tortuous anatomy</li>\\n</ul>\\n<br />\\n<br />\\n<h2 class="top" id="top">\\n Excellent Catheter Performance</h2>\\n<ul>\\n <li>\\n  Bioslide&reg; Hydrophilic Coating provides a 28% improvement in pushability in challenging anatomy</li>\\n <li>\\n  Tip designed to provide excellent kink resistance</li>\\n <li>\\n  6F guide catheter compatibility (&ge;.064&quot;)</li>\\n <li>\\n  Tapered tip with .022&quot; entry profile</li>\\n</ul>\\n<br />\\n<br />\\n<h2 class="top" id="top">\\n Unique Coating</h2>\\n<p>\\n <span>When in the presence of water of body fluids, the hydrophilic polymer coating absorbs water molecules to create a rapidly-formed interface at the surface of the device. This coating makes the catheter very slick and thus reduces the catheter push force.</span></p>\\n', 'en'),
(67, 34, 'Delivery Support Guide Wires', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(68, 34, 'Delivery Support Guide Wires', '<p>\\n Details...</p>\\n', 'en'),
(69, 35, 'Frontline Guide Wires', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(70, 35, 'Frontline Guide Wires', '<p>\\n Details...</p>\\n', 'en'),
(71, 36, 'Kinetix™ Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(72, 36, 'Kinetix™ Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(73, 37, 'Rotablator® Rotational Atherectomy System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(74, 37, 'Rotablator® Rotational Atherectomy System', '<p>\\n Details...</p>\\n', 'en'),
(75, 38, 'Apex® PTCA Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(76, 38, 'Apex® PTCA Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(77, 39, 'Emerge™ PTCA Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(78, 39, 'Emerge™ PTCA Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(79, 40, 'Flextome® Cutting Balloon® Dilatation Device', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(80, 40, 'Flextome® Cutting Balloon® Dilatation Device', '<p>\\n Details...</p>\\n', 'en'),
(81, 41, 'Maverick® PTCA Balloon Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(82, 41, 'Maverick® PTCA Balloon Catheters', '<p>\\n Details...</p>\\n', 'en'),
(83, 42, 'NC Quantum Apex™ PTCA Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(84, 42, 'NC Quantum Apex™ PTCA Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(85, 43, 'Quantum™ Maverick® Balloon Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(86, 43, 'Quantum™ Maverick® Balloon Catheters', '<p>\\n Details...</p>\\n', 'en'),
(87, 44, 'Diagnostic Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(88, 44, 'Diagnostic Catheters', '<p>\\n Details...</p>\\n', 'en'),
(89, 45, 'FilterWire EZ™ Embolic Protection System for SVG''s', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(90, 45, 'FilterWire EZ™ Embolic Protection System for SVG''s', '<p>\\n Details...</p>\\n', 'en'),
(91, 46, 'Guide Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(92, 46, 'Guide Catheters', '<p>\\n Details...</p>\\n', 'en'),
(93, 47, 'Access and Crossing Guide Wires', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(94, 47, 'Access and Crossing Guide Wires', '<p>\\n Details...</p>\\n', 'en'),
(95, 48, 'Imager™ II Angiographic Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(96, 48, 'Imager™ II Angiographic Catheter', '<p>\\n Details...</p>\\n', 'en'),
(97, 49, 'Coyote™ Balloon Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(98, 49, 'Coyote™ Balloon Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(99, 50, 'Mustang™ Balloon Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(100, 50, 'Mustang™ Balloon Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(101, 51, 'Standard Occlusion Balloon Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(102, 51, 'Standard Occlusion Balloon Catheter', '<p>\\n Details...</p>\\n', 'en'),
(103, 52, 'Sterling® ES Balloon Dilatation Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(104, 52, 'Sterling® ES Balloon Dilatation Catheters', '<p>\\n Details...</p>\\n', 'en'),
(105, 53, 'Sterling® SL Balloon Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(106, 53, 'Sterling® SL Balloon Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(107, 54, 'Sterling™ Balloon Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(108, 54, 'Sterling™ Balloon Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(109, 55, 'Sterling™ Monorail® Balloon Dilatation Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(110, 55, 'Sterling™ Monorail® Balloon Dilatation Catheter', '<p>\\n Details...</p>\\n', 'en'),
(111, 56, 'Express® LD Iliac Premounted Stent System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(112, 56, 'Express® LD Iliac Premounted Stent System', '<p>\\n Details...</p>\\n', 'en'),
(113, 57, 'Express® SD Renal Monorail® Premounted Stent Syste', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(114, 57, 'Express® SD Renal Monorail® Premounted Stent Syste', '<p>\\n Details...</p>\\n', 'en'),
(115, 58, 'Fathom® Steerable Guidewires', '<p>\\n &Uuml;r&uuml;n bilgiler en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(116, 58, 'Fathom® Steerable Guidewires', '<p>\\n Details...</p>\\n', 'en'),
(117, 59, 'Guide Wires for Peripheral Interventions', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(118, 59, 'Guide Wires for Peripheral Interventions', '<p>\\n Details...</p>\\n', 'en'),
(119, 60, 'Journey™ Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(120, 60, 'Journey™ Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(121, 61, 'ZIPwire® Hydrophilic Guide Wire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(122, 61, 'ZIPwire® Hydrophilic Guide Wire', '<p>\\n Details...</p>\\n', 'en'),
(123, 62, 'Super Sheath™ Introducer Sheath', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(124, 62, 'Super Sheath™ Introducer Sheath', '<p>\\n Details...</p>\\n', 'en'),
(125, 63, 'Renegade® HI-FLO™ Microcatheter, Kits and Systems', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(126, 63, 'Renegade® HI-FLO™ Microcatheter, Kits and Systems', '<p>\\n Details...</p>\\n', 'en'),
(127, 64, 'Epic™ Vascular Self-Expanding Stent System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(128, 64, 'Epic™ Vascular Self-Expanding Stent System', '<p>\\n Details...</p>\\n', 'en'),
(129, 65, 'WALLSTENT® Endoscopic Biliary Stent System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(130, 65, 'WALLSTENT® Endoscopic Biliary Stent System', '<p>\\n Details...</p>\\n', 'en'),
(131, 66, '0.018" and 0.035" Fibered Platinum Coils', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(132, 66, '0.018" and 0.035" Fibered Platinum Coils', '<p>\\n	Details...</p>\\n', 'en'),
(133, 67, 'VortX® 18 and 35 Vascular Occlusion Coils', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(134, 67, 'VortX® 18 and 35 Vascular Occlusion Coils', '<p>\\n	Details...</p>\\n', 'en'),
(135, 68, 'Contour® PVA Embolization Particles', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(136, 68, 'Contour® PVA Embolization Particles', '<p>\\n	Details...</p>\\n', 'en'),
(137, 69, 'Carotid WALLSTENT® Monorail® Endoprosthesis', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(138, 69, 'Carotid WALLSTENT® Monorail® Endoprosthesis', '<p>\\n Details...</p>\\n', 'en'),
(139, 70, 'Precision SpeedTac® Transvaginal Anchor System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(140, 70, 'Precision SpeedTac® Transvaginal Anchor System', '<p>\\n Details...</p>\\n', 'en'),
(141, 71, 'Precision Twist® Transvaginal Anchor System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(142, 71, 'Precision Twist® Transvaginal Anchor System', '<p>\\n Details...</p>\\n', 'en'),
(143, 72, 'NephroMax™ High Pressure Nephrostomy Balloon Cathe', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(144, 72, 'NephroMax™ High Pressure Nephrostomy Balloon Cathe', '<p>\\n Details...</p>\\n', 'en'),
(145, 73, 'UroMax Ultra™ High Pressure Balloon Catheter', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(146, 73, 'UroMax Ultra™ High Pressure Balloon Catheter', '<p>\\n Details...</p>\\n', 'en'),
(147, 74, 'Escape® Nitinol Stone Retrieval Basket', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(148, 74, 'Escape® Nitinol Stone Retrieval Basket', '<p>\\n Details...</p>\\n', 'en'),
(149, 75, 'Graspit® Nitinol Stone Retrieval Forceps', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(150, 75, 'Graspit® Nitinol Stone Retrieval Forceps', '<p>\\n Details...</p>\\n', 'en'),
(151, 76, 'Gemini™ Paired Wire Helical Stone Retrieval Basket', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(152, 76, 'Gemini™ Paired Wire Helical Stone Retrieval Basket', '<p>\\n Details...</p>\\n', 'en'),
(153, 77, 'OptiFlex™ 1.3F Nitinol Stone Retrieval Basket', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(154, 77, 'OptiFlex™ 1.3F Nitinol Stone Retrieval Basket', '<p>\\n Details...</p>\\n', 'en'),
(155, 78, 'Segura Hemisphere® Stone Retrieval Basket', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(156, 78, 'Segura Hemisphere® Stone Retrieval Basket', '<p>\\n Details...</p>\\n', 'en'),
(157, 79, 'Stone Cone® Nitinol Retrieval Coil', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(158, 79, 'Stone Cone® Nitinol Retrieval Coil', '<p>\\n Details...</p>\\n', 'en'),
(159, 80, 'Zero Tip™ Nitinol Stone Retrieval Basket', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(160, 80, 'Zero Tip™ Nitinol Stone Retrieval Basket', '<p>\\n Details...</p>\\n', 'en'),
(161, 81, 'Dual Lumen Ureteral Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(162, 81, 'Dual Lumen Ureteral Catheters', '<p>\\n Details...</p>\\n', 'en'),
(163, 82, 'Imager™ II Catheters', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(164, 82, 'Imager™ II Catheters', '<p>\\n Details...</p>\\n', 'en'),
(165, 83, 'Sensor® PTFE-Nitinol Guidewire Hydrophilic Tip', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(166, 83, 'Sensor® PTFE-Nitinol Guidewire Hydrophilic Tip', '<p>\\n Details...</p>\\n', 'en'),
(167, 84, 'Glidewire® Nitinol Hydrophilic Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(168, 84, 'Glidewire® Nitinol Hydrophilic Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(174, 87, 'Navigator™ Ureteral Access Sheath', '<p>\\n Details...</p>\\n', 'en'),
(173, 87, 'Navigator™ Ureteral Access Sheath', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(171, 86, 'Zebra® Urologic Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(172, 86, 'Zebra® Urologic Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(175, 88, 'Advantage Fit™ System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(176, 88, 'Advantage Fit™ System', '<p>\\n Details...</p>\\n', 'en'),
(177, 89, 'Advantage® Transvaginal Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(178, 89, 'Advantage® Transvaginal Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(179, 90, 'Lynx® Suprapubic Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(180, 90, 'Lynx® Suprapubic Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(181, 91, 'Obtryx® Transobturator Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(182, 91, 'Obtryx® Transobturator Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(183, 92, 'Prefyx PPS® System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(184, 92, 'Prefyx PPS® System', '<p>\\n Details...</p>\\n', 'en'),
(185, 93, 'Solyx™ SIS System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(186, 93, 'Solyx™ SIS System', '<p>\\n Details...</p>\\n', 'en'),
(187, 94, 'Contour™ Ureteral Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(188, 94, 'Contour™ Ureteral Stent', '<p>\\n Details...</p>\\n', 'en'),
(189, 95, 'Percuflex® Ureteral Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(190, 95, 'Percuflex® Ureteral Stent', '<p>\\n Details...</p>\\n', 'en'),
(191, 96, 'Polaris™ Ultra Ureteral Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(192, 96, 'Polaris™ Ultra Ureteral Stent', '<p>\\n Details...</p>\\n', 'en'),
(193, 97, 'Polaris™ Loop Ureteral Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(194, 97, 'Polaris™ Loop Ureteral Stent', '<p>\\n Details...</p>\\n', 'en'),
(195, 98, 'Precision SpeedTac® Transvaginal Anchor System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(196, 98, 'Precision SpeedTac® Transvaginal Anchor System', '<p>\\n Details...</p>\\n', 'en'),
(197, 99, 'Precision Twist® Transvaginal Anchor System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(198, 99, 'Precision Twist® Transvaginal Anchor System', '<p>\\n Details...</p>\\n', 'en'),
(199, 100, 'Advantage Fit™ System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(200, 100, 'Advantage Fit™ System', '<p>\\n Details...</p>\\n', 'en'),
(201, 101, 'Advantage® Transvaginal Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(202, 101, 'Advantage® Transvaginal Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(203, 102, 'Lynx® Suprapubic Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(204, 102, 'Lynx® Suprapubic Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(205, 103, 'Obtryx® Transobturator Mid-Urethral Sling System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(206, 103, 'Obtryx® Transobturator Mid-Urethral Sling System', '<p>\\n Details...</p>\\n', 'en'),
(207, 104, 'Prefyx PPS® System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(208, 104, 'Prefyx PPS® System', '<p>\\n Details...</p>\\n', 'en'),
(209, 105, 'Solyx™ SIS System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(210, 105, 'Solyx™ SIS System', '<p>\\n Details...</p>\\n', 'en'),
(211, 106, 'CRE™ Fixed Wire Balloon Dilator', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(212, 106, 'CRE™ Fixed Wire Balloon Dilator', '<p>\\n Details...</p>\\n', 'en'),
(213, 107, 'CRE™ Wireguided Balloon Dilator', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(214, 107, 'CRE™ Wireguided Balloon Dilator', '<p>\\n Details...</p>\\n', 'en'),
(215, 108, 'Extractor™ Pro RX, XL and DL Retrieval Balloons', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(216, 108, 'Extractor™ Pro RX, XL and DL Retrieval Balloons', '<p>\\n Details...</p>\\n', 'en'),
(217, 109, 'Extractor™ RX Retrieval Balloon', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(218, 109, 'Extractor™ RX Retrieval Balloon', '<p>\\n Details...</p>\\n', 'en'),
(219, 110, 'Resolution® Clip', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(220, 110, 'Resolution® Clip', '<p>\\n Details...</p>\\n', 'en'),
(221, 111, 'Initial Placement PEG', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(222, 111, 'Initial Placement PEG ', '<p>\\n Details...</p>\\n', 'en'),
(223, 112, 'EndoVive Standard Profile Balloon Replacements', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(224, 112, 'EndoVive Standard Profile Balloon Replacements', '<p>\\n	Details...</p>\\n', 'en'),
(225, 113, 'Dreamwire™ High Performance Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(226, 113, 'Dreamwire™ High Performance Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(227, 114, 'Hydra Jagwire® Guidewire', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(228, 114, 'Hydra Jagwire® Guidewire', '<p>\\n Details...</p>\\n', 'en'),
(229, 115, 'Rotatable Snare', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(230, 115, 'Rotatable Snare', '<p>\\n Details...</p>\\n', 'en'),
(231, 116, 'Autotome™ RX Cannulating Sphincterotome', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(232, 116, 'Autotome™ RX Cannulating Sphincterotome', '<p>\\n Details...</p>\\n', 'en'),
(233, 117, 'Dreamtome™ RX Cannulating Sphincterotome', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(234, 117, 'Dreamtome™ RX Cannulating Sphincterotome', '<p>\\n Details...</p>\\n', 'en'),
(235, 118, 'Hydratome® RX Cannulating Sphincterotome', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(236, 118, 'Hydratome® RX Cannulating Sphincterotome', '<p>\\n Details...</p>\\n', 'en'),
(237, 119, 'Advanix™ Biliary Stent with NaviFlex™ RX Delivery', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(238, 119, 'Advanix™ Biliary Stent with NaviFlex™ RX Delivery ', '<p>\\n Details...</p>\\n', 'en'),
(239, 120, 'Polyflex® Esophageal Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(240, 120, 'Polyflex® Esophageal Stent', '<p>\\n Details...</p>\\n', 'en'),
(241, 121, 'Ultraflex™ Esophageal NG Stent System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(242, 121, 'Ultraflex™ Esophageal NG Stent System', '<p>\\n Details...</p>\\n', 'en'),
(243, 122, 'Ultraflex™ Precision Colonic Stent System', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(244, 122, 'Ultraflex™ Precision Colonic Stent System', '<p>\\n Details...</p>\\n', 'en'),
(245, 123, 'WALLSTENT® Colonic & Duodenal Endoprosthesis', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(246, 123, 'WALLSTENT® Colonic & Duodenal Endoprosthesis', '<p>\\n Details...</p>\\n', 'en'),
(247, 124, 'WALLSTENT® RX Biliary Endoprosthesis', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(248, 124, 'WALLSTENT® RX Biliary Endoprosthesis', '<p>\\n Details...</p>\\n', 'en'),
(249, 125, 'WallFlex® Biliary RX Stents', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(250, 125, 'WallFlex® Biliary RX Stents', '<p>\\n Details...</p>\\n', 'en'),
(251, 126, 'WallFlex® Colonic Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(252, 126, 'WallFlex® Colonic Stent', '<p>\\n Details...</p>\\n', 'en'),
(253, 127, 'WallFlex® Duodenal Stent', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(254, 127, 'WallFlex® Duodenal Stent', '<p>\\n Details...</p>\\n', 'en'),
(255, 128, 'WallFlex® Fully and Partially Covered Esophageal', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(256, 128, 'WallFlex® Fully and Partially Covered Esophageal', '<p>\\n Details...</p>\\n', 'en'),
(257, 129, 'ECMO Cannulae', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(258, 129, 'ECMO Cannulae', '<p>\\n &nbsp;</p>\\n<div>\\n MAQUET&#39;s ECMO Cannulae are used for extracorporeal membrane oxygenation (ECMO) in the treatment of neonate respiratory insufficiency.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The cannulae are made of blood-compatible and tissue-friendly polyurethane to prevent complications arising during long insertion periods. Radiopacity allows for continual monitoring of the correct cannula position during use. MAQUET supplies cannulae for both veno-venous ECMO procedures.</div>\\n', 'en'),
(259, 130, 'ROTAFLOW Centrifugal Pump', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(260, 130, 'ROTAFLOW Centrifugal Pump', '<p>\\n Engineered with simplicity and sophistication, the ROTAFLOW Centrifugal Pump is one of the smallest centrifugal pumps around, and at the same time a highly flexible modular component for systems integration.</p>\\n', 'en'),
(261, 131, 'BIOLINE Coating', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(262, 131, 'BIOLINE Coating', '<p>\\n Every time blood comes into contact with an extrinsic surface during extracorporeal circulation, numerous cellular and plasmatic regulation mechanisms are activated. By its very nature, extracorporeal blood circulation produces intensive contact between blood and a whole range of extrinsic materials.</p>\\n', 'en'),
(263, 132, 'SOFTLINE Coating', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(264, 132, 'SOFTLINE Coating', '<p>\\n A challenge for perfusion: In extracorporeal circulation systems, blood continuously comes into contact with foreign materials.</p>\\n', 'en'),
(265, 133, 'MECC System', '<p>\\n	&Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(266, 133, 'MECC System', '<p>\\n	Excellence and quality by MAQUET Cardiovascular: the leading-edge MECC SYSTEM has come to represent the generic concept of a closed, compact minimal extracorporeal circulation system. It is an optimized set of disposables, catheters and cannulae as well as hardware - a truly integrated solution reduced to essential components. The MECC philosophy is more than just shorter tubing. With separated cardiotomy suction, the external venous reservoir eliminated and priming volume significantly reduced, it creates significantly improved conditions for patient care. MECC&#39;s less invasive approach has opened the door to new patient management.</p>\\n', 'en'),
(270, 135, 'SENSATION PLUS™ 8Fr. 50cc IAB CATHETER', '<p>\\n SENSATION PLUS 8Fr. 50cc IAB is a technological first in improved hemodynamic support, offering all the benefits of MAQUET&#39;s easy-to-use IAB fiber-optic technology with the increased clinical effectiveness that 50cc provides.</p>\\n', 'en'),
(271, 136, 'MEGA® IAB CATHETERS', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(269, 135, 'SENSATION PLUS™ 8Fr. 50cc IAB CATHETER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(272, 136, 'MEGA® IAB CATHETERS', '<p>\\n The MEGA IAB family offers greater hemodynamic support and higher efficacy for every patient, at any height. Building on the exceptional track record of superior blood volume displacement of the MEGA 50cc IAB, we&#39;ve added the 30cc and 40cc IAB, completing the family.</p>\\n', 'en'),
(273, 137, 'SENSATION® 7Fr. IAB CATHETER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(274, 137, 'SENSATION® 7Fr. IAB CATHETER', '<p>\\n The SENSATION 7Fr. is the smallest IAB catheter available today combined with innovative, fiber-optic technology that automatically calibrates in vivo. Smaller is better for the patient, potentially reducing vascular complications.</p>\\n', 'en'),
(275, 138, 'LINEAR® 7.5Fr. IAB CATHETER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(276, 138, 'LINEAR® 7.5Fr. IAB CATHETER', '<p>\\n The LINEAR IAB features the innovative Durathane membrane and a 7.5Fr. size. This reduced size enables clinicians to deliver counterpulsation therapy to a broader range of patients, including those with smaller peripheral vasculature.</p>\\n', 'en'),
(277, 139, 'CARDIOSAVE™ IABP HYBRID & RESCUE', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(278, 139, 'CARDIOSAVE™ IABP HYBRID & RESCUE', '<p>\\n CARDIOSAVE represents a giant leap forward in functionality and versatility while continuing to deliver the performance and intuitiveness of the Datascope pumps you know and trust.</p>\\n', 'en'),
(279, 140, 'SENSATION® 7FR. & CS300™ IABP SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(280, 140, 'SENSATION® 7FR. & CS300™ IABP SYSTEM', '<p>\\n The intelligent automation of the CS300 is combined with innovative, fiber-optic pressure technology that automatically calibrates in the patient. The SENSATION catheter is the smallest IAB catheter available today.</p>\\n', 'en'),
(281, 141, 'CS300™ IABP WITH INTELLISENSE™', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(282, 141, 'CS300™ IABP WITH INTELLISENSE™', '<p>\\n The CS300 with IntelliSense combines fiber-optic speed with automatic in vivo calibration. The result is faster time to therapy, faster signal acquisition, and faster adaptation to rate and rhythm changes.</p>\\n', 'en'),
(283, 142, 'CS100® IABP WITH INTELLISYNC™', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(284, 142, 'CS100® IABP WITH INTELLISYNC™', '<p>\\n The CS100 with IntelliSync offers one-button start up, automatically adapting to changing conditions, making it the right choice for any patient condition.</p>\\n', 'en'),
(285, 143, 'Fusion Bioline Vascular Grafts', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(286, 143, 'Fusion Bioline Vascular Grafts', '<p>\\n &nbsp;</p>\\n<div>\\n The MAQUET line of FUSION grafts merges ePTFE with PET to offer vascular surgeons the best of both materials: the easy handling of ePTFE and the minimal suture hole bleeding seen in knit polyester grafts. FUSION BIOLINE Vascular Grafts build on this revolutionary designed combination with the addition of a special heparin coating designed to increase thromboresistance.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n By adding the benefits of heparin to the unique FUSION hybrid construction, the FUSION BIOLINE graft sets a new standard for peripheral bypass treatment.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n FUSION Vascular Grafts: Revolutionising Vascular Grafts, Inside and Out.</div>\\n', 'en'),
(287, 144, 'Fusion Vascular Graft', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(288, 144, 'Fusion Vascular Graft', '<p>\\n &nbsp;</p>\\n<div>\\n The MAQUET line of FUSION grafts merges ePTFE with PET to offer vascular surgeons the best of both materials: the easy handling of ePTFE and the minimal suture hole bleeding seen in knit polyester grafts. The two-layer construction of FUSION grafts delivers benefits during and after peripheral bypass surgery:</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n - Axial compliance for better handling compared with standard ePTFE grafts</div>\\n<div>\\n - High suture retention strength and durability for long-term performance</div>\\n<div>\\n - Kink resistant to enhance blood flow*</div>\\n<div>\\n - Minimal suture hole bleeding for improved hemostasis</div>\\n<div>\\n - Crush resistant to help enhance flow dynamics</div>\\n', 'en'),
(289, 145, 'ACROBAT-I STABILIZER SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(290, 145, 'ACROBAT-I STABILIZER SYSTEM', '<p>\\n &nbsp;</p>\\n<div>\\n The new ACROBAT-i Off-Pump System from MAQUET helps surgeons more confidently deliver the benefits of OPCAB (off-pump coronary artery bypass) to patients. &nbsp;Uniquely created to enhance visibility and control, the ACROBAT-i Stabilizer, Positioner and Blower Mister products combine sleek form with function:</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n - Swivel provides 180˚ side-to-side range of motion for both the ACROBAT-i Stabilizer and ACROBAT-i Positioner Systems</div>\\n<div>\\n - Vertical drop of ACROBAT-i Stabilizer arm into the chest cavity</div>\\n<div>\\n - FLEXLINK arm technology delivers proven strength and flexibility for exceptional manueverability</div>\\n<div>\\n - Significantly lower profile mount and tubing management system for increased space in the working field</div>\\n<div>\\n - Hands-free Blower Mister &ndash; multiple mounting pods are integrated into the ACROBAT-i Stabilizer Foot for placement of the ACROBAT-i Blower Mister</div>\\n', 'en'),
(291, 146, 'ACROBAT MECHANICAL OFF-PUMP SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(292, 146, 'ACROBAT MECHANICAL OFF-PUMP SYSTEM', '<p>\\n &nbsp;</p>\\n<div>\\n Need to fit in tight spaces? The ACROBAT Mechanical Off-Pump System is our latest innovation in mechanical tissue stabilization.&nbsp;</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The ACROBAT Mechanical Stabilizer, combined with XPOSE Access Devices, forms the ACROBAT Mechanical Off-Pump System. &nbsp;When used together these devices provide a solution for off-pump bypass surgery.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The ACROBAT Mechanical stabilizer is equipped with low-profile feet, FlexLink technology, and a tri-swivel mount for greater reach, maneuverability, and access to target vessels.</div>\\n', 'en'),
(293, 147, 'ACROBAT SUV VACUUM STABILIZER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(294, 147, 'ACROBAT SUV VACUUM STABILIZER', '<p>\\n &nbsp;</p>\\n<div>\\n The ACROBAT SUV Vacuum Stabilizer provides local stabilization of a target vessel during off-pump coronary artery bypass.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Designed for optimal stabilization and ease of use, this newest member of the ACROBAT family comes with a mount that is compatible with various retractors and has a 3-D swivel for exceptional control and reach. &nbsp;The ACROBAT SUV Vacuum Stabilizer offers strength and stability with anastomotic site visibility and access and features the maneuverability of our FlexLink technology on a stronger arm, our innovative tri-slot socket wrist for &ldquo;toes-up&rdquo; capability, and independent vacuum pods on malleable feet designed to conform to all contours of the heart.</div>\\n', 'en'),
(295, 148, 'ACROBAT V VACUUM STABILIZER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(296, 148, 'ACROBAT V VACUUM STABILIZER', '<p>\\n &nbsp;</p>\\n<div>\\n The ACROBAT V Vacuum Stabilizer provides local stabilization of a target vessel during off-pump coronary artery bypass.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Designed for optimal stabilization and ease of use, this member of the ACROBAT family offers strength and stability with anastomotic site visibility and access. &nbsp;Featuring the maneuverability of our FlexLink technology on a stronger arm, our innovative tri-slot socket wrist for &ldquo;toes-up&rdquo; capability, and independent vacuum pods on malleable feet, this product is designed to conform to all contours of the heart.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The ACROBAT V Vacuum Stabilizer is compatible with MAQUET sternal retractor blades.</div>\\n', 'en'),
(297, 149, 'ULTIMA OPCAB SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(298, 149, 'ULTIMA OPCAB SYSTEM', '<p>\\n &nbsp;</p>\\n<div>\\n The ULTIMA OPCAB System is designed with a rigid arm to offer a unique approach to mechanical tissue stabilization. The Ultima OPCAB System combined with XPOSE Access Devices, forms the Ultima Mechanical Off-Pump System. When used together these devices provide a solution for off-pump bypass surgery.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The Ultima mechanical stabilizer is equiped with low profile feet. a rigid arm, and quick-lock mount for simple positioning and stabilization of target vessels.</div>\\n', 'en'),
(299, 150, 'ACROBAT-I POSITIONER SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(300, 150, 'ACROBAT-I POSITIONER SYSTEM', '<p>\\n &nbsp;</p>\\n<div>\\n The new ACROBAT-i Off-Pump System from MAQUET helps surgeons more confidently deliver the benefits of OPCAB (off-pump coronary artery bypass) to patients. &nbsp;Uniquely created to enhance visibility and control, the ACROBAT-i Stabilizer, Positioner and Blower Mister products combine sleek form with function:</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n - Joint swivel provides 180˚ side-to-side range of motion for both the ACROBAT-i Stabilizer and ACROBAT-i Positioner Systems</div>\\n<div>\\n - FLEXLINK arm technology delivers proven strength and flexibility for exceptional maneuverability</div>\\n<div>\\n - Significantly lower profile mount and tubing management system for increased space in the working field</div>\\n', 'en'),
(301, 151, 'XPOSE 3 ACCESS DEVICE', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(302, 151, 'XPOSE 3 ACCESS DEVICE', '<p>\\n &nbsp;</p>\\n<div>\\n XPOSE Positioning Devices - Simplifying the way cardiac surgeons perform off-pump bypass surgery.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The XPOSE 3 Positioner is a third generation access device designed to securely lift the heart during off-pump bypass surgery and to easily position and access target vessels, while maintaining hemodynamic stability. &nbsp;Intended for both apical and non-apical placement on the heart, this device provides exceptional maneuverability, greater access, and ease of use. &nbsp;The XPOSE 3 device has a &quot;clamshell&quot; type mount.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Combine the XPOSE 3 Access Device with an ACROBAT Stabilizer and you have the ability to reach all major vessels of the heart with a low-profile system that is easy to use for revascularization procedures performed off-pump.</div>\\n', 'en'),
(303, 152, 'XPOSE 4 ACCESS DEVICE', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(304, 152, 'XPOSE 4 ACCESS DEVICE', '<p>\\n &nbsp;</p>\\n<div>\\n XPOSE Positioning Devices - Simplifying the way cardiac surgeons perform off-pump bypass surgery.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The XPOSE 4 Positioner is a 4th generation access device designed to securely lift the heart during off-pump bypass surgery and to easily position and access target vessels, while maintaining hemodynamic stability. &nbsp;Intended for both apical and non-apical placement on the heart, this device provides exceptional maneuverability, greater access, and ease of use. &nbsp;The XPOSE 4 Positioner has a universal type mount.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Combine the XPOSE 4 Access Device with an ACROBAT Stabilizer and you have the ability to reach all major vessels of the heart with a low-profile system that is easy to use for revascularization procedures performed off-pump.</div>\\n', 'en'),
(305, 153, 'AORTIC CUTTER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(306, 153, 'AORTIC CUTTER', '<p>\\n &nbsp;</p>\\n<div>\\n The HEARTSTRING Aortic Cutter offers state-of-the-art ergonomic design and fully automated cutting action for precision aortotomy in unclamped aortas. It helps assure high-quality results in beating heart clampless anastomoses when used as an integral part of the HEARTSTRING Proximal Seal System.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n HEARTSTRING is an innovative advance in proximal seal technology. Its hemostatic seal enables the surgeon to eliminate the use of partial occlusion clamps and minimize aortic manipulation. &nbsp;This system for beating heart surgery helps avoid embolic release and reduces the potential for neurologic complications.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Each HEARTSTRING Proximal Seal System includes the Seal, Delivery Device Loader and a choice between two different Aortic Cutter sizes; 4.3 mm or 3.8 mm.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n With an elegant design and small operational footprint, the HEARTSTRING system leaves no foreign material inside the vessel after completion of the anastamosis. The Aortic Cutter makes a single, clean hole in the aorta and is simple to use.</div>\\n', 'en'),
(307, 154, 'HEARTSTRING III PROXIMAL SEAL SYSTEM', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(308, 154, 'HEARTSTRING III PROXIMAL SEAL SYSTEM', '<p>\\n The HEARTSTRING Proximal Seal System allows you to achieve clampless hemostasis during CABG proximal anastomoses while suturing with your own hand. It&#39;s an easy-to-use advance in patient care and helps reduce the release of emboli that can potentially have neurocognitive consequences for patients post-surgery.</p>\\n', 'en'),
(309, 155, 'ACROBAT-I BLOWER MISTER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(310, 155, 'ACROBAT-I BLOWER MISTER', '<p>\\n &nbsp;</p>\\n<div>\\n The ACROBAT-i Blower Mister is uniquely designed for hands-free or traditional, handheld use.&nbsp;</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n With a newly engineered nozzle, multiple modes of operation and precise flow control, the new, more versatile ACROBAT-i Blower Mister device allows surgeons to deliver a customized blend of saline and CO2 in a gentle irrigation mist, to consistently maintain an unobstructed view and near bloodless field during surgical anastomosis.</div>\\n', 'en'),
(311, 156, 'AXIUS BLOWER MISTER', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(312, 156, 'AXIUS BLOWER MISTER', '<p>\\n The AXIUS Blower/Mister provides controlled delivery of CO2 and saline to improve visibility during anastomosis.</p>\\n', 'en'),
(313, 157, 'AXIUS CORONARY SHUNT', '<p>\\n &Uuml;r&uuml;n bilgileri en kısa s&uuml;rede g&uuml;ncellenecektir.</p>\\n', 'tr'),
(314, 157, 'AXIUS CORONARY SHUNT', '<p>\\n Designed to create a near bloodless field and provide myocardial protection during target vessel anastomosis. Its unique internal coil and tapered tip have been designed to allow easy, atraumatic insertion into the artery.</p>\\n', 'en');
INSERT INTO `product_info` (`id`, `products_id`, `name`, `content`, `lang`) VALUES
(315, 158, 'HEARTWARE® Ventriküler Destek Sistemi', '<p>\\n HeartWare&reg; Sistemi, kalbinizin v&uuml;cudunuza kan pompalamasına yardımcı olmak&mdash;ve kalbinizin aşırı y&uuml;k&uuml;n&uuml; hafifletmek&mdash;i&ccedil;in gerekli olan t&uuml;m donanıma sahiptir. Bu sistemin kullanımı, semptomlarınızı en aza indirmek ve &ccedil;oğu g&uuml;nl&uuml;k etkinlikleri rahatlıkla ger&ccedil;ekleştirmenize yardımcı olmak i&ccedil;in tasarlanmıştır.</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n HeartWare Sisteminin merkezinde sol ventrik&uuml;ler destek cihazı (lVaD) adında bir pompalama cihazı bulunur. lVaD g&ouml;ğs&uuml;n&uuml;z&uuml;n i&ccedil;inde kalır ve doğrudan kalbinize bağlıdır. Kanı kalbinizin sol tarafından aort damarınıza (kanı kalbinizden v&uuml;cudunuzun kalanına taşıyan geniş damar) pompalar. Kan, bah&ccedil;e hortumundan &ccedil;ıkan suya benzer bi&ccedil;imde pompadan s&uuml;rekli bir akış halinde &ccedil;ıkar. ancak bu s&uuml;rekli kan akışı normal bir kalbin atışından farklıdır, sonu&ccedil; olarak nabzınızı hissetmeyebilirsiniz. Endişelenmenize gerek yoktur, bu durum tamamen normaldir.lVaD, kontrol birimi adında k&uuml;&ccedil;&uuml;k bir harici bilgisayar tarafından &ccedil;alıştırılır.</p>\\n<p>\\n &nbsp;</p>\\n<p>\\n lVaD ve kontrol birimi, karnınızın &uuml;st kısmındaki cildinizden ge&ccedil;en k&uuml;&ccedil;&uuml;k bir kablo (aktarma hatle birbirlerine bağlanır. Kontrol birimi pompayı &ccedil;alıştırır ve sistemin &ccedil;alışmasını y&ouml;netmenize yardımcı olması i&ccedil;in metin mesajları ve sesli uyarı alarmları verir. Kontrol birimi iki pil veya bir pil ve duvar prizi veya araba elektriği ile &ccedil;alışır. HeartWare Sisteminin tamamı taşınabilirdir. Sistemi gittiğiniz her yere g&ouml;t&uuml;rmenizi sağlayan bir taşıma muhafazasını, belinizde veya omzunuzda taşıyabilirsiniz. Sistem yaklaşık 2,5 pound (1,1 kg) ağırlığındadır.</p>\\n', 'tr'),
(316, 158, 'HEARTWARE® Ventricular Assist System', '<p>\\n &nbsp;</p>\\n<div>\\n At the core of the HeartWare Ventricular Assist System is a small implantable centrifugal blood pump called the HVAD&reg; pump. The pump is designed to draw blood from the left ventricle and propel it through an outflow graft connected to the patient&#39;s ascending aorta. The device is capable of generating up to 10 liters of blood flow per minute.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n With a displaced volume of only 50cc, the HVAD pump is designed to be implanted in the pericardial space, directly adjacent to the heart. Implantation above the diaphragm is expected to lead to relatively short surgery time and quick recovery.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n The HVAD pump has only one moving part, the impeller, which spins at rates between 2,400 and 3,200 revolutions per minute. The impeller is suspended within the pump housing through a combination of passive magnets and hydrodynamic thrust bearings. This hydrodynamic suspension is achieved by a gentle incline on the upper surfaces of the impeller blades. When the impeller spins, blood flows across these inclined surfaces, creating a &quot;cushion&quot; between the impeller and the pump housing. There are no mechanical bearings or any points of contact between the impeller and the pump housing.</div>\\n<div>\\n &nbsp;</div>\\n<div>\\n Device reliability is enhanced through the use of dual motor stators with independent drive circuitry, allowing a seamless transition between dual and single stator mode if required. The pump&#39;s inflow cannula is integrated with the device, ensuring proximity between the heart and the pump itself. This proximity is expected to facilitate ease of implant and to help ensure optimal blood flow characteristics. The use of a wide-bladed impeller and clear flow paths through the system are expected to help minimize risk of pump induced hemolysis (damage to blood cells) or thrombus (blood clotting).</div>\\n', 'en');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `first_name`, `last_name`, `phone`, `mobile`) VALUES
(1, 1, 'Net', 'Plus', '', ''),
(4, 5, 'Mas', 'Medikal', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `slug` varchar(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` set('text','textarea','password','select','radio','checkbox') NOT NULL,
  `default` text NOT NULL,
  `value` text NOT NULL,
  `options` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `display` int(11) NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all sorts of settings for the admin to change';

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `position`, `display`) VALUES
('alexa-verification', 'Alexa Verification Code', 'Alexa web sayfası doğrulama kodu.', 'text', '', '', '', 3, 1),
('default-theme', 'Default Theme', 'Varsayılan olarak gösterilecek tema', 'text', 'default', '', '', 0, 0),
('email', 'Default E-Mail', 'Varsayılan e-mail adresi.', 'text', '', 'info@masmedikal.com', '', 4, 1),
('google-track', 'Google Track Code', 'Google Analytics istatistik izleme kodu.', 'textarea', '', '', '', 5, 1),
('google-verification', 'Google Verification Code', 'Google web sayfası doğrulama kodu.', 'text', '', '', '', 4, 1),
('meta-description', 'Açıklama', 'Web sayfanızı tanıtacak kısa yazı.', 'textarea', '', '', '', 1, 1),
('meta-keywords', 'Anahtar Kelimeler', 'Web sayfanızın arama sonuçlarında çıkmasını istediğiniz kelimeler. "Önerilen 6 kelime."', 'text', '', '', '', 2, 1),
('site-name', 'Site Adı', 'Web sitesinin araç çubuğunda görünecek adıdır.', 'text', 'İsimsiz', 'Mas Tıbbi Ürünler', '', 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `status` enum('Aktif','Pasif') NOT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `group_id`, `email`, `username`, `password`, `ip_address`, `status`, `created_on`, `last_login`) VALUES
(1, 1, 'info@netpluscms.com', 'netplus', 'ajans8586', '127.0.0.1', 'Aktif', 1339164691, 0),
(5, 2, 'info@masmedikal.com', 'masmedikal', 'masmedical2012', '94.121.194.46', 'Aktif', 1342532719, 0);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `device_of_patient`
--
ALTER TABLE `device_of_patient`
  ADD CONSTRAINT `fk_devID` FOREIGN KEY (`deviceID`) REFERENCES `device` (`deviceID`),
  ADD CONSTRAINT `fk_hospID` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`),
  ADD CONSTRAINT `fk_patID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`);

--
-- Tablo kısıtlamaları `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_opID` FOREIGN KEY (`operatorID`) REFERENCES `operator` (`operatorID`);

--
-- Tablo kısıtlamaları `phone_no_pat`
--
ALTER TABLE `phone_no_pat`
  ADD CONSTRAINT `fk_patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
