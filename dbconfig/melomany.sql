-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 192.168.25.4:3306
-- Tiempo de generación: 26-05-2022 a las 16:47:54
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

DROP TABLE IF EXISTS `genre`;
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
(6, 'Reggaeton');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidences`
--

DROP TABLE IF EXISTS `incidences`;
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

DROP TABLE IF EXISTS `playlist`;
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
(1, 11, 'Viva el Verano', './images/viva.jpg\r\n'),
(2, 11, 'Vicios y Virtudes', './images/vicios-y-virtudes.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_has_songs`
--

DROP TABLE IF EXISTS `playlist_has_songs`;
CREATE TABLE `playlist_has_songs` (
  `playlist_id` int NOT NULL,
  `songs_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `playlist_has_songs`
--

INSERT INTO `playlist_has_songs` (`playlist_id`, `songs_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
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

DROP TABLE IF EXISTS `songs`;
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
(1, 2, 'Que pasa tio', '1:00:00', 'Denis Duran', './images/casa.png', 1, NULL, './music/1.mp3', NULL),
(2, 1, 'React', '2:00:00', 'Pablo Martinez', './images/circulo.png', 1, NULL, './music/2.mp3', NULL),
(3, 1, 'Facebook', '4:00:00', 'Pablo Martinez', './images/facebook.png', 1, NULL, './music/3.mp3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
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
(1, 1, 'pablo.martinez@gmail.com', '123456', 'Pablo', 'Martinez', NULL, NULL, 'Administrador del sitio Web', '1999-12-01', 22, 'España'),
(2, 2, 'denis.duran@gmail.com', '123456', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(3, 4, 'dduran@gmail.com', 'Hola1111', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(4, 4, 'dduran2@gmail.com', 'Hola1111', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(5, 4, 'dduran3@gmail.com', '$2b$10$eAkQPu0FA8fktyBuxkgtaO28cRWv8yBGkSTXMgdWUinRZzsUiaX7O', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(9, 4, 'ddu2@gmail.com', '$2b$10$JFluqHafuRVRA1jBMQ1xLOgUzjLTkuQuGOK9lfG68hqG05YQBnnnq', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(10, 4, 'ddu2@gmail.com', '$2b$10$4IdzDWHs4FGyELN4ueR8qu6/wpq3yM7od7NBO4x5aFjfoDJQ4QMvS', 'Denis', 'Duran', NULL, NULL, '', NULL, NULL, NULL),
(11, 4, 'dr@gmail.com', '$2b$10$QN/d3D0pslcclzm3U5jB9.8TeYJ99ExEfFMI/Y0gt9fEKxWPCfG1q', 'Denis', 'Duran', '5555-6666-8888-2222', 'C/Moragas i Barret 41, BJ1', 'Administrador del sitio web.', '1991-07-05', 31, 'España'),
(12, 4, 'dlr@gmail.com', '$2b$10$BiYeut38g5zvrHmdjPrBUeKeE0iM4MvwIgcJQppV3duv24MYjUkOK', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 4, 'fefwfew@gmail.com', '$2b$10$lHFO6vMa/pRRLonJSNcFbet.191JfkyJEjMaeLo.YyG.bR5eyMIFi', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 4, 'dwdqwwdqddq@gmail.com', '$2b$10$Kxoz2L/bcQbLm/sCZWm3k.3ym6XFijigrzXbJnAfJaxtjyWzK87de', 'Denis', 'Duran Ibañez', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 4, 'wefwefwefweffwefw@gmail.com', '$2b$10$DoijSeGFPHSmV0mJB/VXX.CSmsGA10544xa2zTjlUqMv/k/S4HPxy', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 4, 'fwefwfefwdcffwefw@gmail.com', '$2b$10$Z4wkjJ22Lj2TFuQeBhEAG.7id9SXXsl7no2hPAEKhkCLktRiA.ITe', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 4, 'dededededed@gmail.com', '$2b$10$M7NCB5dDkBa2qj9eiSMBKegrdVPLNv/owAY2ajafa/F.cY.ocjq/6', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 4, 'dededededfefefefed@gmail.com', '$2b$10$Z7dSummy1VvVbVgzYCRk9O/ir7j4/nywdK.aTzmqrSYpYwJXMTFla', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 4, 'quetalefed@gmail.com', '$2b$10$0XK1gyk8uKtaYV88twD/HeW7bK8hVl.EZzwHH4tlwnq.zuG.JwoQi', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 4, 'freferferfeggged@gmail.com', '$2b$10$LpZs4ygewdsXWYUYpOtx9.cDFw8nHbTibby8Ia0kyXasLPObclr9G', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 4, 'fwefwfeweffwefwf.44@gmail.com', '$2b$10$cBGK15b.StrgLzYjkv8FE.bLHj.q6PXhoRZcX.4sQwqdbWdKwQRoa', 'Denis', 'Duran', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 4, 'ya@gmail.com', '$2b$10$UWmw9v9Xt2P5xfr7LjMjBePJ5HzxaOt3NxyQ9GHY8XrQICUMkfAr6', 'yamuza', 'yamuza', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 4, 'denis.duran.44@gmail.com', '$2b$10$zhd5ml8K.pAXv9lErVQoYOo6aubvLv1GCMfhFi5kD5CjXTIH0qhru', 'Denis', 'Duran', NULL, NULL, 'Holaaa', '1991-07-05', NULL, NULL),
(25, 4, 'denis.duran33@gmail.com', '$2b$10$vg9FT3s1ofo8fAKtRC0MjOOfof/Feb.PMOncbNzSoeyTF08.ftKZ6', 'Ylenia', 'Ibañez', NULL, NULL, 'fewffewf', '1991-07-05', NULL, NULL),
(26, 4, 'denis.ddqd@gmail.com', '$2b$10$bM31hxCX189av9.oSF5LpOT2Ik0GAZUjHGSJZcodIxA1RWTEbMSqG', 'Ylenia', 'Ibañez', NULL, NULL, 'fdwefwefe', '1991-07-05', NULL, NULL),
(27, 4, 'denis.e2e12e12n.44@gmail.com', '$2b$10$0qCTIbsRGKHnVEc9mkT.OuSa4X44P7g1wY9Fx2be3xDQDXkHTcj3u', 'Ylenia', 'Ibañez', NULL, NULL, 'fwefweffe', '1991-12-08', NULL, NULL),
(28, 4, 'dee21@gmail.com', '$2b$10$y5WR4Il.DGHseFJB1.mLLe8hafHClUJJWosmKiQwGJq6s6r91oZzO', 'Denis', 'Duran', NULL, NULL, 'España', '1991-07-05', NULL, NULL),
(29, 4, 'ergergeg4@gmail.com', '$2b$10$QHOrsKzkzPIoV1RaIqdAh.P2pozk.vpP8hMO0PIXOaXP39foCCtu.', 'Denis', 'Duran', NULL, NULL, 'España', '1991-07-05', NULL, NULL),
(30, 4, 'dwqdqdn.44@gmail.com', '$2b$10$svjs2p.5HC5vQqMwMB5YX.4aAt8m9vbCtNYNrwPUXgW.FnFQpYw.6', 'Denis', 'Duran', NULL, NULL, 'España', '1991-12-05', NULL, NULL),
(31, 4, 'denis.fwefwwefwe@gmail.com', '$2b$10$ZDpjBvT6HHC8vhvLyCbQ3O8xUAFxIlJYIZugalPlcIUVynUdfCgKi', 'few', 'fwefwefwf', NULL, NULL, 'Españita', '1991-07-05', NULL, NULL),
(32, 4, 'fwefwf@gmail.com', '$2b$10$FBs528E8FuU7ZB2ZAWn8GejT4vSk/f6uWHgm0EMNO733uHWbCh8A2', 'Jorge', 'Duran Ibañez', NULL, NULL, '', '1991-12-05', NULL, ''),
(33, 4, 'denis.d32r@gmail.com', '$2b$10$J0uhiOGxbhYSIB8UVxdXw.3hjky8Oen1AW88pvCXbBgDOXME0Hq8W', 'Denis', 'Bond', NULL, NULL, 'dqwdqwddwq', '1991-07-05', NULL, 'Francia'),
(34, 4, 'duran.44@gmail.com', '$2b$10$y9Obw8YHJNji.CgMw6551OY/TfbbTCQ.bvwZ3DUOt2CEelhjKqGUC', 'Denis', 'Jorge', NULL, NULL, 'efwfwefwefwefw', '1992-12-05', NULL, 'Italia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_has_songs`
--

DROP TABLE IF EXISTS `user_has_songs`;
CREATE TABLE `user_has_songs` (
  `user_id` int NOT NULL,
  `songs_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_plays_playlist`
--

DROP TABLE IF EXISTS `user_plays_playlist`;
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
