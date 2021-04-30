/* БД Яндекс.Музыка */

CREATE DATABASES yandex_music;

USE yandex_music;

/* Таблица альбомы */

CREATE TABLE IF NOT EXISTS albums (
  id INT(11) NOT NULL,
  title VARCHAR(250) NOT NULL,
  artist INT(11) NOT NULL,
  genre INT(11) NOT NULL,
  images VARCHAR(500) NOT NULL
) AUTO_INCREMENT=8 ;

ALTER TABLE albums
 ADD PRIMARY KEY (id);

ALTER TABLE albums
MODIFY id INT(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;


INSERT INTO albums (id, title, artist, genre, images) VALUES
(DEFAULT, 'SEXY DRILL', 2, 4, 'assets/images/artwork/drill.png'),
(DEFAULT, 'FREERIO', 5, 10, 'assets/images/artwork/freerio.png'),
(DEFAULT, 'Стыд и слава', 3, 1, 'assets/images/artwork/slava.png'),
(DEFAULT, 'Здесь', 2, 9, 'assets/images/artwork/good.png'),
(DEFAULT, 'Stick Out', 1, 3, 'assets/images/artwork/stick.png'),
(DEFAULT, 'Без истерик', 3, 6, 'assets/images/artwork/not.png'),
(DEFAULT, 'Your power', 4, 10, 'assets/images/artwork/power.png');

/* Таблица артисты */

CREATE TABLE IF NOT EXISTS artists (
  id INT(11) NOT NULL,
  name VARCHAR(50) NOT NULL
) AUTO_INCREMENT=6 ;

ALTER TABLE artists
 ADD PRIMARY KEY (id);

ALTER TABLE artists
MODIFY id INT(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;


INSERT INTO artists (id, name) VALUES
(DEFAULT, 'OG Buda'),
(DEFAULT, 'OBLADAET'),
(DEFAULT, 'Lil Pump'),
(DEFAULT, 'May Wave'),
(DEFAULT, 'SALUKI');

/* Таблица жанры */

CREATE TABLE IF NOT EXISTS genres (
  id INT(11) NOT NULL,
  name VARCHAR(50) NOT NULL
) AUTO_INCREMENT=11 ;

ALTER TABLE genres
 ADD PRIMARY KEY (id);

ALTER TABLE genres
MODIFY id INT(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;



INSERT INTO genres (id, name) VALUES
(DEFAULT, 'Rock'),
(DEFAULT, 'Pop'),
(DEFAULT, 'Hip-hop'),
(DEFAULT, 'Rap'),
(DEFAULT, 'R & B'),
(DEFAULT, 'Classical'),
(DEFAULT, 'Trap'),
(DEFAULT, 'Jazz'),
(DEFAULT, 'Folk'),
(DEFAULT, 'Country');

/* Таблица плейлисты */

CREATE TABLE IF NOT EXISTS playlists (
  id INT(11) NOT NULL,
  name VARCHAR(50) NOT NULL,
  owner VARCHAR(50) NOT NULL,
  date_created DATETIME NOT NULL
) AUTO_INCREMENT=1 ;

ALTER TABLE playlists
 ADD PRIMARY KEY (id);

ALTER TABLE playlists
MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

/* Таблица песни в плейлистах */

CREATE TABLE IF NOT EXISTS playlist_songs (
  id INT(11) NOT NULL,
  songId INT(11) NOT NULL,
  playlist_id INT(11) NOT NULL,
  playlist_order INT(11) NOT NULL
) AUTO_INCREMENT=1 ;

ALTER TABLE playlist_songs
 ADD PRIMARY KEY (id);

ALTER TABLE playlist_songs
MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

/* Таблица песни */

CREATE TABLE IF NOT EXISTS songs (
  id INT(11) NOT NULL,
  title VARCHAR(250) NOT NULL,
  artist INT(11) NOT NULL,
  album INT(11) NOT NULL,
  genre INT(11) NOT NULL,
  duration VARCHAR(8) NOT NULL,
  paths VARCHAR(500) NOT NULL,
  album_order INT(11) NOT NULL,
  plays INT(11) NOT NULL
) AUTO_INCREMENT=32 ;

ALTER TABLE songs
 ADD PRIMARY KEY (id);

ALTER TABLE songs
MODIFY id INT(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;


INSERT INTO songs (id, title, artist, album, genre, duration, paths, album_order, plays) VALUES
(DEFAULT, 'Сон', 1, 5, 8, '2:12', 'assets/music/sleep.wave', 1, 10),
(DEFAULT, 'Ты горишь как огонь', 1, 5, 1, '2:19', 'assets/music/fire.wave', 2, 4),
(DEFAULT, 'Сияй', 1, 5, 2, '2:01', 'assets/music/123.wave', 3, 10),
(DEFAULT, 'Комета', 1, 5, 3, '2:41', 'assets/music/big_boy.wave', 4, 13),
(DEFAULT, 'Банк', 1, 5, 4, '2:09', 'assets/music/bank.wave', 5, 8),
(DEFAULT, 'Going Higher', 2, 1, 1, '4:04', 'assets/music/goinghigher.wave', 1, 29),
(DEFAULT, 'Funny Song', 2, 4, 2, '3:07', 'assets/music/bensound-funnysong.wave', 2, 11),
(DEFAULT, 'I Am Cute', 2, 1, 3, '1:59', 'assets/music/cute.wave', 2, 24),
(DEFAULT, 'One Two Three', 2, 1, 4, '2:10', 'assets/music/one_two_three.wave', 3, 26),
(DEFAULT, 'Epic', 2, 4, 5, '2:58', 'assets/music/epic.wave', 3, 16),
(DEFAULT, 'Energy', 2, 1, 6, '2:59', 'assets/music/bensound-energy.wave', 4, 21),

/* Таблица пользователи */

CREATE TABLE IF NOT EXISTS users (
  id INT(11) NOT NULL,
  username VARCHAR(25) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(200) NOT NULL,
  password_hash VARCHAR(32) NOT NULL,
  sign_up_date DATETIME NOT NULL,
  profile_pic VARCHAR(500) NOT NULL
) AUTO_INCREMENT=3 ;

ALTER TABLE users
 ADD PRIMARY KEY (id);

ALTER TABLE users
MODIFY id INT(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

INSERT INTO users (id, username, first_name, last_name, email, password_hash, sign_up_date, profile_pic) VALUES
(1, 'everymanchewie', 'Ivan', 'Yachmenkov', 'everymanchewie@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2021-05-28 00:00:00', 'assets/images/photo.png'),
(2, 'La_nelan_02', 'Pavel', 'Kamzolov', 'kamzolov@mail.ru', '7c6a180b36896a0a8c02787eeafb0e4c', '2021-05-28 00:00:00', 'assets/images/my_photo.png');


