-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 May 2017, 17:03:35
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=138 ;

--
-- Tablo döküm verisi `category`
--

INSERT INTO `category` (`ID`, `category_name`) VALUES
(22, 'Technology'),
(23, 'Music'),
(128, 'poğoğpoğpuıu'),
(127, 'pğoğoğpo'),
(126, 'jnkjh'),
(125, 'uyıuyı'),
(124, 'jhjh'),
(24, 'Social Responsibility'),
(121, 'Entertainment'),
(123, 'oıopı'),
(122, 'Entertainment'),
(73, 'Android'),
(52, 'History'),
(103, 'Eğitim'),
(68, 'Healthy'),
(67, 'Education'),
(136, 'ıjoj'),
(137, 'oıuoıuo');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(2550) CHARACTER SET utf8 NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `publish_date` datetime NOT NULL,
  `slug` varchar(255) NOT NULL,
  `hit` int(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fkUserID` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Tablo döküm verisi `post`
--

INSERT INTO `post` (`ID`, `title`, `description`, `image_url`, `user_id`, `publish_date`, `slug`, `hit`) VALUES
(9, 'Cinnet Getiren Adam Evinin Önündeki Pokemon GO Oyuncusuna Ateş Açtı!', 'Pokemon GO oyunun neden olduğu olaylar giderek çeşitleniyor. Ceset bulma, trafik kazası, çukura düşme derken bu da oldu ve Pokemon GO yüzünden bir kişi silahlı saldırıya uğradı.\r\nPokemon GO oyununun neden olduğu tuhaf olaylara bir yenisi daha eklendi. Oyun nedeniyle trafik kazası yapana, su birikintisine düşene, ceset bulana rastlamıştık ama silahına sarılanı ilk kez görüyoruz. kotaku.com sitesinin haberine göre, Floridalı bir adamın evinin önüne park eden aracın içinde Pokemon GO oynayan iki gence ateş ettiği iddia edildi.\r\n Olay Nasıl Gelişti?\r\nİsmi açıklanmayan ev sahibi polise verdiği ifadede, gece yarısından sonra 1.30’da evinin önünde bir gürültü duyduğunu ve bunun üzerine silahına sarılarak dışarı çıktığını, fren lambaları yanan aracın içindekileri hırsız sandığını belirtiyor. Hızla hareket eden aracın arkasından ateş ettiğini söyleyen adam ardından polisi aradığını ifade ediyor.\r\n\r\n\r\n Gençlere Göre Yaşananlar Biraz Farklı\r\nOlayın diğer tarafındaki 16 ve 19 yaşındaki iki genç ise bu ifadeye katılmıyor. Araçtaki gençlerPokemon GO oynadıkları sırada “Onu yakaladınız mı?” şeklinde bir ses duyduklarını ve cevap verdikleri sırada silah sesi duyduklarını ve hızla oradan uzaklaştıklarını belirtiyor. Neyse ki olayda bir can kaybı yok ama ateşlenen silahtan çıkan kurşunlar arabaya zarar vermiş. Olay, Pokemon GOoynarken neden dikkatli olmamız gerektiğine verilebilecek güzel örneklerden birisi. \r\n\r\n', 'http://127.0.0.1:8000/uploads/cinnet-getiren-adam-evinin-onundeki-pokemon-go-oyuncusuna-ates-acti-705x290.jpg', 1, '2016-05-18 00:00:00', 'cinnet-getiren-adam-evinin-nndeki-pokemon-go-oyuncusuna-ate-at', 46),
(8, 'OPERATÖRLERDEN ÜCRETSIZ ACIL İLETIŞIM PAKETI', 'Turkcell, Türk Telekom ve Vodafone, yaşanan darbe girişiminden sonra kullanıcılarına kullanabilmeleri için ücretsiz acil iletişim paketi tanımladı. Paketin detayları haberimizde.\r\n\r\n\r\n\r\n15 Temmuz 2016 akşamı başlayan darbe girişimi, 24 saat geçmeden bastırıldı fakat bu darbe girişimi bizlere acil durumlarda iletişiminin ne kadar önemli olduğunu da göstermiş oldu.\r\nCumhurbaşkanı ilk açıklamasını FaceTime üzerinden yaparken, pek çok siyasi de bağlantılarını telefonla gerçekleştirdi. İletişimin gücü, bir kalkışmanın seyrini bile değiştirdi.\r\nHafta sonu boyunca Turkcell ve Vodafone, kullanıcılarına ücretsiz acil iletişim paketi tanımladı. Turkcell tarafında 150 dakika konuşma, 150 SMSve 150 MB veri paketi, hafta sonu kullanılması için ücretsiz olarak hatlara tanımlandı.\r\nVodafone tarafında ise 150 dakika konuşma ve 250 MB veri paketi ücretsiz olarak tanımlanmış durumda. Vodafone ve Turkcell kullanıcıları, hafta sonu bu haklarını ücretsiz olarak kullanabilecekler.\r\nTurkcell''in ve Vodafone''un Cumartesi günü yaptıkları paylaşıma cevap, Türk Telekom tarafından ise Pazar günü geldi.\r\nPazar günü iletişim noktalarını açık tutan Türk Telekom, mobil hatlara ücretsiz dakika ve 500 MB seviyesinde internet yüklemesi gerçekleştirdi. Ayrıca 1 hafta boyunca Türk Telekom WiFi noktaları da ücretsiz kullanılabilecek.\r\n\r\n', 'http://127.0.0.1:8000/uploads/ucretsiz-iletisim-paket.jpg', 1, '2016-07-18 00:00:00', 'operatrlerden-cretsiz-acil-iletiim-paketi-dfx', 105),
(13, 'Android N Final Önizleme Sürümü Çıktı!', 'Daha önceki önizleme sürümlerinde bulunan hataların giderildiği ve gerekli optimizasyonların yapıldığı final önizleme sürümü, en stabilAndroid N sürümü olduğu için merak eden kullanıcılar tarafından kurulabilir. Tabi, en kararlı sürüm olması sorunların olmadığı anlamına gelmiyor.Google, testlerine devam ettiği Android 7.0 Nougat işletim sisteminin, final geliştirici önizleme sürümünü yayınladı. Peki, Android Nougat final önizleme sürümü ile neler değişiyor?\r\nAndroid işletim sistemli telefonların her zaman çok yavaş güncellendiği söyleniyor, ancak işin aslı öyle değil. Google tarafında oldukça hızlı işleyen bu süreç, üreticiler her model için ayrı güncelleme yayınladığı için kullanıcılara oldukça geç yansıyor.\r\n\r\n', 'http://127.0.0.1:8000/uploads/android-m-70-ne-zaman-cikiyor.png', 1, '2016-01-01 00:00:00', 'android-n-final-nizleme-srm-kt', 110),
(11, 'ENGELSİZ İZMİR 2016 ULUSAL KISA FİLM YARIŞMASI', 'Engelsiz yaşamın öncüsü olabilmek için yola çıkan İzmir Büyükşehir Belediyesi, engellilerin sorunları ve çözümlerine yönelik olarak 2013 yılında Türkiye''de ilk kez uluslararası bir kongre düzenlemiştir. ''Engelsiz İzmir'', bilimsel bir kongre olmasının yanında, kentsel yaşamda engelleri ve engellileri görünür kılacak sosyal projeleri hayata geçirmeye başlamıştır. \r\n \r\nİzmir Büyükşehir Belediyesi tarafından 2-5 Kasım 2016 tarihlerinde “Engellilerin Sosyal Yaşama Katılımını Arttırmaya Yönelik Yerel Politikalar” temalı Uluslararası Engelsizmir 2. Kongresi gerçekleştirilecektir. Bu kongre kapsamnda ayrıca ulusal bir kısa film yarışması da yer alıyor.\r\n\r\nEngelsizmir 2016 Ulusal Kısa Film Yarışması Şartnamesi ve katılım için ayrıntılı bilgiye bu linkten erişebilirsiniz.\r\n\r\n', 'http://127.0.0.1:8000/uploads/aksaray-belediyesinden-engellilere-engelsiz-yasam-imkni4f036fdcc828064ae184.jpg', 1, '2016-01-01 00:00:00', 'engelsiz-izmir-2016-ulusal-kisa-film-yarimasi', 113);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `post_category`
--

CREATE TABLE IF NOT EXISTS `post_category` (
  `categoryID` int(11) DEFAULT NULL,
  `postID` int(11) DEFAULT NULL,
  KEY `fkcatID` (`categoryID`),
  KEY `fkpostID` (`postID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `post_category`
--

INSERT INTO `post_category` (`categoryID`, `postID`) VALUES
(22, 7),
(22, 5),
(22, 2),
(2, 2),
(22, 6),
(22, 8),
(22, 9),
(24, 10),
(25, 10),
(22, 13),
(25, 13);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(8) DEFAULT NULL,
  `mail` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`ID`, `user_name`, `name`, `surname`, `password`, `mail`) VALUES
(1, 'alper', 'Alper', 'Şalvız', '123', NULL),
(2, 'Kaan', 'Kaan', 'Tuna', '123', NULL),
(4, 'gcnrtp', 'gulcan', 'ertop', '12345', 'gulcanertopp@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
