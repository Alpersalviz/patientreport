-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 May 2017, 17:05:14
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `soguk`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`ID`, `title`, `image_url`) VALUES
(14, 'Test', 'http://sogukdenge.com/uploads/menteseli-soguk-hava-deposu-kapisi.jpg'),
(16, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/3bab0f0f-05e8-4834-bc50-a99d17a5bcc1.jpg'),
(17, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/4cf31180-c63d-46c0-b014-a5310e8a62ab.jpg'),
(18, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/37e8c009-8690-4068-a130-e503f0dd5292.jpg'),
(19, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/45f138b4-f655-4f1c-8db7-cbf4b3aea607.jpg'),
(20, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/098f0b18-ebe2-42ab-b0f5-321bc1ccfa51.jpg'),
(21, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/0190f93d-0057-4a4d-9dee-d2dd4f7e7892.jpg'),
(22, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/927f6491-1573-49c0-a57d-1018f9db438d.jpg'),
(23, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/4159e9ad-5b94-4d7d-8f34-527ff7c96832.jpg'),
(24, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/485900ce-e00b-43b6-8950-c933ee179162.jpg'),
(25, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/a7d327dc-6c12-4c4f-a40d-78260e6a402e.jpg'),
(26, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/asdsd.jpg'),
(27, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/c67f47f4-d4c6-4ede-a66d-e5d0c3069edb.jpg'),
(28, 'Yaptığımız Projeler', 'http://sogukdenge.com/uploads/soklamaunitesi.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(8) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`ID`, `user_name`, `password`) VALUES
(1, 'admin', '123456');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
