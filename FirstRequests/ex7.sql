USE Filmography;
GO

SELECT Producers.* FROM Producers, Movies WHERE Producers.best_movie = Movies.movie_id AND Movies."Year" = 2000;



INSERT INTO [Movies]("Name", "Description", "Year", Country, Budget)
VALUES
('BRAT11', 'fdsggfgdf', '2001', 'Russia', 1500),
('BRAT21', 'fdsggfgdf', '2002', 'Russia', 1006),
('BRAT31', 'fdsggefdgdf', '2003', 'UK', 1700),
('BRAT1', 'fdsggfgdf', '2000', 'USA', 15000),
('BRAT12', 'fdsggfgdf', '2000', 'UK', 10006),
('BRAT13', 'fdsggefdgdf', '2000', 'Germany', 17000)

INSERT INTO [Actors]("name", Surname, Birthday, Motherland)
VALUES 
('Jhon', 'Sina', '1997-12-31', 'Russia'),
('Jhon1', 'Sina', '1980-12-31', 'USA'),
('Jhon', 'Sina1', '1989-12-31', 'UK'),
('Jhon1', 'Sina1', '1998-12-31', 'Germany'),
('Jhon2', 'Sina', '1967-12-31', 'France'),
('Jhon', 'Sina2', '1976-12-31', 'Russia')

INSERT INTO [Producers](Surname, "name", Birthday, Motherland, best_movie)
VALUES
('Kemberbetch', 'Benedrickt', '1941-11-05', 'Russia', '3'),
('Kemberbetcher', 'Benedrickt', '1941-11-06', 'Russia', '2'),
('Kemberbetch', 'Benedrickter', '1941-11-07', 'Russia', '4'),
('Kemberbetcher', 'Benedrickter', '1941-11-08', 'Russia', '5'),
('Kemberbutcher', 'Benedrocher', '1941-11-09', 'Russia', '6'),
('Kemberbutcher', 'CUCMBECHER', '1941-11-10', 'Russia', '7'),
('KemberBITches', 'Benedickter', '1941-11-11', 'Russia', '8');

/* 2*/
SELECT p.*
FROM (SELECT a.producer_id FROM (SELECT mp.producer_id, COUNT(mp.movie_id) ct
FROM Movies_Producers mp GROUP BY mp.producer_id) a 
WHERE a.ct>2) b INNER JOIN Producers p ON b.producer_id=p.producer_id

SELECT mov.*
FROM (SELECT fr.movie_id FROM (SELECT m.movie_id, COUNT(m.actor_id) ct  
FROM Movies_Actors m GROUP BY m.movie_id) fr
WHERE fr.ct>3) f INNER JOIN Movies mov ON mov.movie_id=f.movie_id

/*ex4*/
select top 10 * FROM Movies m WHERE m.Country='Russia'  ORDER BY -m.rate

UPDATE Movies SET rate = 10 WHERE  movie_id=9


INSERT INTO [Movies_Producers](producer_id, movie_id)
VALUES
('2','2'),
('2','3'),
('2','4'),
('3','5'),
('3','6'),
('3','7'),
('4','8'),
('5','9'),
('6','10')

INSERT INTO [Movies_Actors](actor_id, movie_id)
VALUES
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(4, 5),
(5, 2),
(6, 2),
(5, 3),
(5, 4)

ALTER TABLE Movies ADD rate int

INSERT INTO [Movies](rate)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)

DELETE FROM Genres WHERE genre_id>13

INSERT INTO Genres(genre_name)
VAlUES
('Horror'),
('Comedy'),
('Triller'),
('Sport'),
('Historic'),
('Documental'),
('Musical'),
('Detective'),
('Vestern'),
('Tragedy'),
('Drama'),
('Fantasy')

ALTER TABLE Genres ADD genre_name nvarchar(25)

INSERT INTO Movies_Genres(genre_id, movie_id)
VAlUES
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(4, 20),
(5, 21),
(6, 22),
(7, 23),
(8, 24),
(9, 25)
/*Отобрать все различные фильмы ужасов, в которых снимались актёры родом из Англии.*/
SELECT mg3.*, a.Motherland
FROM(SELECT mg2.*, ma.actor_id
FROM(SELECT gh.*, mov."Name"
FROM(SELECT mg.movie_id, g.genre_id, g.genre_name 
FROM( Movies_Genres mg JOIN Genres g ON mg.genre_id=g.genre_id)WHERE g.genre_name='Horror') gh
JOIN Movies mov ON gh.movie_id=mov.movie_id) mg2 JOIN Movies_Actors ma ON ma.movie_id = mg2.movie_id) mg3
Join Actors a ON a.actor_id=mg3.actor_id  WHERE a.Motherland='USA';

SELECT a.*
FROM (SELECT am.actor_id
FROM (SELECT mv.movie_id
FROM (SELECT mv.movie_id, mv.Name, mg.genre_id
FROM Movies_Genres mg JOIN Movies mv ON mg.movie_id=mv.movie_id) mv JOIN Genres g ON mv.genre_id=g.genre_id
WHERE g.genre_name='Horror') mv JOIN Movies_Actors am ON mv.movie_id=am.movie_id) ac JOIN Actors a ON ac.actor_id=a.actor_id
WHERE a.Motherland='USA'

/*ex6*/

SELECT en.*
FROM(SELECT * FROM(SELECT mg.genre_id, COUNT(mg.movie_id) ct
FROM Movies_Genres mg GROUP BY mg.genre_id) tc
WHERE tc.ct>0) en
INNER JOIN Genres g ON g.genre_id=en.genre_id

/*Для пропуска определнного S и взяти определенного T*/
DECLARE @Skip INT = 3, @Take INT = 5
SELECT * FROM Movies m
ORDER BY m.movie_id ASC
OFFSET (@Skip) ROWS FETCH NEXT (@Take) ROWS ONLY

/*ex8*/
SELECT g.genre_name FROM(
SELECT mg.genre_id FROM(
SELECT mp.movie_id FROM(
SELECT pr.* FROM Producers pr WHERE pr.Motherland='Russia' OR pr.Motherland='USA') pm 
JOIN Movies_Producers mp ON pm.producer_id=mp.producer_id) movp JOIN Movies_Genres mg ON movp.movie_id=mg.movie_id) movg
JOIN Genres g ON movg.genre_id = g.genre_id
