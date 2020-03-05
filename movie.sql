-- 1.
SELECT * FROM movies.movies;

-- 2.
SELECT id, title FROM movies.movies LIMIT 10;

-- 3.
SELECT title FROM movies.movies WHERE id = 485;

-- 4.
SELECT id FROM movies WHERE title = "Made in America (1993)";

-- 5.
SELECT title FROM movies ORDER BY title LIMIT 10;

-- 6.
SELECT title FROM movies WHERE title LIKE "%2002%";

-- 7.
SELECT title FROM movies WHERE title LIKE "Godfather%";

-- 8.
SELECT title FROM movies WHERE genres LIKE "%Comedy%";

-- 9.
SELECT title FROM movies WHERE title LIKE "%(2000)%" AND  genres LIKE "%Comedy%";

-- 10
SELECT title FROM movies WHERE title LIKE "%death%" AND  genres LIKE "%Comedy%";

-- 11.
SELECT title 
FROM movies 
WHERE title LIKE "%super%"
AND title LIKE "%(2001)%" OR "%(2002)%";

-- 12.
CREATE TABLE `actors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `actorName` varchar(45) DEFAULT NULL,
  `charName` varchar(45) DEFAULT NULL,
  `movie_id` int unsigned DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- 13.
INSERT INTO actors (actorName, charName, movie_id, dob)
VALUES ('Tom Hanks', "Woody", '1', '7/9/1956'),
('Tim Allen','Buzz Lightyear','1','6/13/1953'),
('Don Rickles','Mr. Potato Head','1','5/8/1926'),
('Jim Varney','Slinky Dog','1','6/15/1949'),
('Wallace Shawn','Rex','1','11/12/1943'),
('John Ratzenberger','Hamm','1','4/6/1947'),
('Annie Potts','Bo Peep','1','10/28/1952'),
('John Morris','Andy','1','10/2/1984'),
('Erik von Detten','Sid','1','10/3/1982'),
('R. Lee Ermey','Sergeant','1','3/24/1944'),
('Walter Matthau','Max Goldman','3','10/1/1920'),
('Jack Lemmon','John Gustafson','3','2/8/1925'),
('Sophia Loren','Maria Sophia Coletta Ragetti','3','9/20/1934'),
('Ann-Margret','Ariel Gustafson','3','4/28/1941'),
('Burgess Meredith','Grandpa Gustafson','3','11/16/1907'),
('Daryl Hannah','Melanie Gustafson','3','12/3/1960'),
('Kevin Pollack','Jacob Goldman','3','10/30/1957'),
('Katie Sagona','Allie','3','11/26/1989'),
('Ann Morgan Guilbert','Mama Ragetti','3','10/16/1928'),
('James Andelin','Sven','3','9/27/1917'),
('Al Pacino','Lt. Vincent Hanna','6','4/25/1940'),
('Robert De Niro','Neil McCauley','6','8/17/1943'),
('Val Kilmer','Chris Shiherlis','6','12/31/1959'),
('Jon Voight','Nate','6','12/29/1938'),
('Tom Sizemore','Michael Cheritto','6','11/29/1961'),
('Diane Venora','Justine','6','8/10/1952'),
('Amy Brenneman','Eady','6','6/22/1964'),
('Ashley Judd','Charlene','6','4/19/1968'),
('Mykelti Williamson','Sergeant Drucker','6','3/4/1957'),
('Wes Studi','Casals','6','12/17/1947')

-- 14.
ALTER TABLE movies ADD rating varchar(20)
UPDATE movies
SET rating='G'
WHERE id=1;

UPDATE movies
SET rating='PG'
WHERE id=2;

UPDATE movies
SET rating='PG-13'
WHERE id=3;

UPDATE movies
SET rating='R'
WHERE id=4;

UPDATE movies
SET rating='PG'
WHERE id=5;

-- 15. 
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings  ON movies.id = ratings.movie_id
WHERE movies.id = 858

-- 16.
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings  ON movies.id = ratings.movie_id
WHERE movies.id = 858
ORDER BY timestamp ASC

-- 17. 
SELECT movies.title, links.imdb_Id 
FROM movies 
LEFT JOIN links ON links.movie_id = movies.id
WHERE movies.title LIKE "%(2005)%" AND  movies.genres LIKE "%Comedy%"

-- 18.
SELECT movies.title, ratings.rating 
FROM movies 
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE ISNULL(ratings.rating)

-- 19.
SELECT movies.title, AVG(ratings.rating)
FROM movies  
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.id =3
GROUP BY movies.title

-- 20.
SELECT movies.title, COUNT(ratings.rating)
FROM movies  
LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.id =4
GROUP BY movies.title

-- 21.
SELECT movies.genres, COUNT(movies.genres)
FROM movies  
WHERE movies.genres ="Comedy"
GROUP BY movies.genres