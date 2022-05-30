-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 192.168.25.3:3306
-- Tiempo de generación: 30-05-2022 a las 11:53:55
-- Versión del servidor: 8.0.29
-- Versión de PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `melomany`
--
CREATE DATABASE IF NOT EXISTS `melomany` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `melomany`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Hip-Hop'),
(2, 'Heavy Metal'),
(3, 'Rock'),
(4, 'Blues'),
(5, 'Jazz'),
(6, 'Reggaeton'),
(7, 'Pop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidences`
--

CREATE TABLE `incidences` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `message` varchar(250) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id` int NOT NULL,
  `idOwner` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `playlist`
--

INSERT INTO `playlist` (`id`, `idOwner`, `name`, `image`) VALUES
(1, 39, 'Viva el Verano', './images/viva.jpg\r\n'),
(2, 39, 'Vicios y Virtudes', './music/vicios_virtudes/cover.jpg'),
(3, 11, 'Motomami', './music/motomami/cover.jpg'),
(4, 39, 'Legendaddy', './music/legendaddy/cover.jpg'),
(5, 11, 'Algo Personal', './music/algo_personal/cover.jpg'),
(6, 11, 'Rap pata negra', './images/patanegra.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_has_songs`
--

CREATE TABLE `playlist_has_songs` (
  `playlist_id` int NOT NULL,
  `songs_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `playlist_has_songs`
--

INSERT INTO `playlist_has_songs` (`playlist_id`, `songs_id`) VALUES
(2, 8),
(2, 9),
(2, 10),
(6, 10),
(2, 11),
(2, 14),
(2, 15),
(2, 18),
(2, 19),
(6, 19),
(2, 20),
(1, 23),
(2, 23),
(6, 23),
(2, 24),
(2, 26),
(2, 27),
(6, 27),
(2, 28),
(2, 30),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(4, 37),
(4, 38),
(1, 39),
(4, 39),
(2, 40),
(4, 40),
(1, 41),
(4, 41),
(1, 42),
(4, 42),
(4, 43),
(4, 44),
(4, 45),
(6, 45),
(4, 46),
(1, 49),
(4, 49),
(4, 50),
(4, 51),
(4, 52),
(5, 53),
(5, 54),
(5, 55),
(5, 56),
(5, 57),
(6, 57),
(5, 58),
(5, 61),
(5, 62),
(6, 62),
(5, 63),
(1, 64),
(5, 64),
(6, 64),
(1, 65),
(5, 65),
(5, 66),
(5, 67),
(5, 68),
(6, 68),
(5, 69),
(6, 69),
(1, 70),
(3, 70),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(1, 79),
(3, 79),
(3, 80),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'artist'),
(3, 'premiumuser'),
(4, 'freeuser');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `songs`
--

CREATE TABLE `songs` (
  `id` int NOT NULL,
  `ownerID` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `artist` varchar(150) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `genre_ID` int NOT NULL,
  `featuring` varchar(250) DEFAULT NULL,
  `src` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `songs`
--

INSERT INTO `songs` (`id`, `ownerID`, `title`, `duration`, `artist`, `image`, `genre_ID`, `featuring`, `src`, `score`) VALUES
(8, 36, 'Introducción', '0:52', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/01.mp3', NULL),
(9, 36, 'Vicios y virtudes', '5:34', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/02.mp3', NULL),
(10, 36, 'Marrones, morenas, coronas', '5:05', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/Documentos/vicios_virtudes/03.mp3', NULL),
(11, 36, 'Trae ese ron', '6:34', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/04.mp3', NULL),
(14, 36, 'No es ningun trofeo noble', '6:00', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/05.mp3', NULL),
(15, 36, 'Tu y tus historias', '2:05', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/06.mp3', NULL),
(18, 36, 'No pasa nada', '4:58', 'Doble V', './music/vicios_virtudes/cover.jpg\r\n', 1, NULL, './music/vicios_virtudes/07.mp3\r\n', NULL),
(19, 36, 'Modestia aparte', '5:08', 'Doble V', './music/vicios_virtudes/cover.jpg\r\n', 1, NULL, './music/vicios_virtudes/08.mp3\r\n', NULL),
(20, 36, 'Ninguna chavala tiene dueño', '4:28', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/09.mp3', NULL),
(23, 36, 'Que te importan todos los demás', '5:38', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/11.mp3\r\n', NULL),
(24, 36, 'Cerdo agridulce', '3:14', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/10.mp3', NULL),
(26, 36, 'SuiZaragoza', '1:54', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/12.mp3\r\n', NULL),
(27, 36, 'Capricornio', '3:15', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/13.mp3\r\n', NULL),
(28, 36, 'Por honor', '6:15', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/14.mp3\r\n', NULL),
(30, 36, 'La ciudad nunca duerme', '5:39', 'Doble V', './music/vicios_virtudes/cover.jpg', 1, NULL, './music/vicios_virtudes/15.mp3\r\n', NULL),
(31, 37, 'Bloke', '2:44', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/01.mp3', NULL),
(32, 37, 'Campeón', '3:14', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/02.mp3', NULL),
(33, 37, 'El abusador del abusador', '2:41', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/03.mp3', NULL),
(34, 37, 'El rey de lo imperfecto', '2:36', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/04.mp3', NULL),
(35, 37, 'Enchuletiao', '3:09', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/05.mp3', NULL),
(37, 37, 'Impares', '3:15', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/06.mp3', NULL),
(38, 37, 'La ola', '3:11', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/07.mp3', NULL),
(39, 37, 'Legendaddy', '0:48', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/08.mp3', NULL),
(40, 37, 'Remix', '2:43', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/09.mp3', NULL),
(41, 37, 'Rumbatón', '4:08', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/10.mp3', NULL),
(42, 37, 'Truquito', '0:26', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/11.mp3', NULL),
(43, 37, 'Uno quitao y otro puesto', '3:09', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/12.mp3', NULL),
(44, 37, 'Por última vez', '3:12', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/13.mp3', NULL),
(45, 37, 'Bombón', '3:02', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/14.mp3', NULL),
(46, 37, 'Pasatiempo', '3:24', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/15.mp3', NULL),
(49, 37, 'Zona del perreo', '3:11', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/16.mp3', NULL),
(50, 37, 'Hot', '2:34', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/17.mp3', NULL),
(51, 37, 'Agua', '3:24', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/18.mp3', NULL),
(52, 37, 'Para siempre', '3:30', 'Daddy Yankee', './music/legendaddy/cover.jpg', 6, NULL, './music/legendaddy/19.mp3', NULL),
(53, 38, 'Come in', '2:27', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/01.mp3', NULL),
(54, 38, 'Planto cara', '3:43', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/02.mp3', NULL),
(55, 38, 'Esperanza', '3:46', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/03.mp3', NULL),
(56, 38, 'Vivo el presento', '3:55', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/04.mp3', NULL),
(57, 38, 'Promesas', '3:59', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/05.mp3', NULL),
(58, 38, 'Preludio', '1:00', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/06.mp3', NULL),
(61, 38, 'La verdad absoluta', '3:59', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/07.mp3', NULL),
(62, 38, 'La última palabra', '4:21', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/08.mp3', NULL),
(63, 38, 'Sin miedo', '3:03', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/09.mp3', NULL),
(64, 38, 'Volar', '3:39', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/10.mp3\r\n', NULL),
(65, 38, 'Sigo fiel', '4:01', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/11.mp3', NULL),
(66, 38, 'Tiene un plan', '4:09', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/12.mp3', NULL),
(67, 38, 'Nobles', '3:17', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/13.mp3', NULL),
(68, 38, 'Para variar', '4:28', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/14.mp3', NULL),
(69, 38, 'Esperan de mí', '4:22', 'El Santo', './music/algo_personal/cover.jpg', 1, NULL, './music/algo_personal/15.mp3', NULL),
(70, 35, 'Saoko', '2:17', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/01.mp3', NULL),
(71, 35, 'Candy', '3:13', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/02.mp3', NULL),
(72, 35, 'La fama', '3:08', 'Rosalía', './music/motomami/cover.jpg', 7, '', './music/motomami/03.mp3', NULL),
(73, 35, 'Bulerías', '2:35', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/04.mp3', NULL),
(74, 35, 'Chicken Teriyaki', '2:02', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/05.mp3', NULL),
(75, 35, 'Hentai', '2:42', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/06.mp3', NULL),
(76, 35, 'Bizcochito', '1:49', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/07.mp3', NULL),
(77, 35, 'G3 N15', '4:12', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/08.mp3', NULL),
(78, 35, 'Motomami', '1:01', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/09.mp3', NULL),
(79, 35, 'Diablo', '2:45', 'Rosalía', './music/motomami/cover.jpg', 7, '', './music/motomami/10.mp3', NULL),
(80, 35, 'Delirio de grandeza', '2:35', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/11.mp3', NULL),
(81, 35, 'Cuuuuuuuuute', '2:30', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/12.mp3', NULL),
(82, 35, 'Como un G', '4:22', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/13.mp3', NULL),
(83, 35, 'Abcdefg', '1:06', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/14.mp3', NULL),
(84, 35, 'La Combi Versace', '2:41', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/15.mp3', NULL),
(85, 35, 'Sakura', '3:21', 'Rosalía', './music/motomami/cover.jpg', 7, NULL, './music/motomami/16.mp3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `rol` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastName` varchar(150) NOT NULL,
  `creditCard` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `direction` varchar(200) DEFAULT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dateBirth` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `rol`, `email`, `password`, `name`, `lastName`, `creditCard`, `direction`, `description`, `dateBirth`, `age`, `country`) VALUES
(11, 4, 'denis.duran@gmail.com', '$2b$10$QN/d3D0pslcclzm3U5jB9.8TeYJ99ExEfFMI/Y0gt9fEKxWPCfG1q', 'Denis', 'Duran', '5555-6666-8888-2222', 'C/Moragas i Barret 41, BJ1', 'Administrador del sitio web.', '1991-07-05', 31, 'España'),
(35, 2, 'rosalia@rosalia.com', 'Hola111111', 'Rosalia', '\" \"', NULL, NULL, 'Cantante de música pop', '2022-05-11', 31, 'Spain'),
(36, 2, 'doblev@doblev.com', 'Hola1111', 'Doble', 'V', NULL, NULL, 'Perfil del grupo de Violadores del Verso', '2022-05-10', 31, 'España'),
(37, 2, 'daddy@yankee.com', 'Hola1111', 'Daddy', 'Yankee', NULL, NULL, 'Perfil del artista Daddy Yankee', '2022-05-04', 31, 'Puerto Rico'),
(38, 2, 'elsanto@gmail.com', 'Hola1111', 'El', 'Santo', NULL, NULL, 'Perfil del artista El Santo', '2022-05-07', NULL, 'Spain'),
(39, 4, 'pablo.martinez@gmail.com', '$2b$10$mxx.Xh0REjbJwrEDtp7SxOLArGBHcPzB3LZk9XarOhR1b2Zg2KMIm', 'Pablo', 'Martinez', NULL, NULL, 'Administrador del sitio web.', '1999-07-03', NULL, 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_has_songs`
--

CREATE TABLE `user_has_songs` (
  `user_id` int NOT NULL,
  `songs_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_plays_playlist`
--

CREATE TABLE `user_plays_playlist` (
  `user_id` int NOT NULL,
  `playlist_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incidences`
--
ALTER TABLE `incidences`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `fk_incidences_user1_idx` (`user_id`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idOwner_idx` (`idOwner`);

--
-- Indices de la tabla `playlist_has_songs`
--
ALTER TABLE `playlist_has_songs`
  ADD PRIMARY KEY (`playlist_id`,`songs_id`),
  ADD KEY `fk_playlist_has_songs_songs1_idx` (`songs_id`),
  ADD KEY `fk_playlist_has_songs_playlist1_idx` (`playlist_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ownerKey_idx` (`ownerID`,`genre_ID`),
  ADD KEY `fk_songs_genre1` (`genre_ID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_1_idx` (`rol`);

--
-- Indices de la tabla `user_has_songs`
--
ALTER TABLE `user_has_songs`
  ADD PRIMARY KEY (`user_id`,`songs_id`),
  ADD KEY `fk_user_has_songs_songs1_idx` (`songs_id`),
  ADD KEY `fk_user_has_songs_user1_idx` (`user_id`);

--
-- Indices de la tabla `user_plays_playlist`
--
ALTER TABLE `user_plays_playlist`
  ADD PRIMARY KEY (`user_id`,`playlist_id`),
  ADD KEY `fk_user_has_playlist_playlist1_idx` (`playlist_id`),
  ADD KEY `fk_user_has_playlist_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidences`
--
ALTER TABLE `incidences`
  ADD CONSTRAINT `fk_incidences_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `fk_idOwner` FOREIGN KEY (`idOwner`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `playlist_has_songs`
--
ALTER TABLE `playlist_has_songs`
  ADD CONSTRAINT `fk_playlist_has_songs_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  ADD CONSTRAINT `fk_playlist_has_songs_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`);

--
-- Filtros para la tabla `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `fk_ownerKey` FOREIGN KEY (`ownerID`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_songs_genre1` FOREIGN KEY (`genre_ID`) REFERENCES `genre` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_1` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_has_songs`
--
ALTER TABLE `user_has_songs`
  ADD CONSTRAINT `fk_user_has_songs_songs1` FOREIGN KEY (`songs_id`) REFERENCES `songs` (`id`),
  ADD CONSTRAINT `fk_user_has_songs_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_plays_playlist`
--
ALTER TABLE `user_plays_playlist`
  ADD CONSTRAINT `fk_user_has_playlist_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `fk_user_plays_playlist_playlist1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
