INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Hip-Hop'),
(2, 'Heavy Metal'),
(3, 'Rock'),
(4, 'Blues'),
(5, 'Jazz'),
(6, 'Reggaeton');

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'artist'),
(3, 'premiumuser'),
(4, 'freeuser'),
(5, 'unverified');

INSERT INTO `user` (`id`, `rol`, `email`, `password`, `name`, `lastName`, `creditCard`, `direction`) VALUES
(1, 1, 'pablo.martinez@gmail.com', '123456', 'Pablo', 'Martinez', NULL, NULL),
(2, 2, 'denis.duran@gmail.com', '123456', 'Denis', 'Duran', NULL, NULL);

INSERT INTO `songs` (`id`, `ownerID`, `title`, `duration`, `artist`, `image`, `genre_ID`, `featuring`, `location`, `score`) VALUES
(1, 2, 'Que pasa tio', '5', 'Denis Duran', '/home/dduran/songs/1/imagen/portada.jpg', 1, NULL, '/home/dduran/songs/1/song/1.mp3', NULL),
(2, 1, 'React', '5', 'Pablo Martinez', '/home/dduran/songs/2/imagen/portada.jpg', 1, NULL, '/home/dduran/songs/2/song/2.mp3', NULL);

INSERT INTO `playlist` (`id`, `idOwner`, `name`) VALUES
(1, 2, 'Viva el Verano');

INSERT INTO `playlist_has_songs` (`playlist_id`, `songs_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------










