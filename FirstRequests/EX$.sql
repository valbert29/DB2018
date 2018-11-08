USE Filmography
GO


/*ALTER TABLE Movies ADD movie_id int IDENTITY;
GO*/

/*ALTER TABLE Movies ADD PRIMARY KEY(movie_id)
GO*/

/*ALTER TABLE Actors ADD actor_id int IDENTITY;
GO*/

/*ALTER TABLE Actors ADD PRIMARY KEY (actor_id);*/

/*ALTER TABLE Producers ADD producer_id int IDENTITY;
GO*/

/*ALTER TABLE Producers ADD PRIMARY KEY (producer_id)*/

/*CREATE TABLE Movies_Actors(
movie_id int REFERENCES Movies(movie_id),
actor_id int REFERENCES Actors(actor_id))*/

CREATE TABLE Movies_Actors(
actor_id int CONSTRAINT FK_Act_Act REFERENCES Actors(actor_id),
movie_id int CONSTRAINT FK_Mov_Mov_act REFERENCES Movies(movie_id))

CREATE TABLE Movies_Producers(
producer_id int CONSTRAINT FK_Prod_Prod REFERENCES Producers(producer_id),
movie_id int CONSTRAINT FK_Mov_Mov_prod REFERENCES Movies(movie_id))

CREATE TABLE Movies_Genres(
genre_id int CONSTRAINT FK_Genr_Genr REFERENCES Genres(genre_id),
movie_id int CONSTRAINT FK_Mov_Mov REFERENCES Movies(movie_id))



ALTER TABLE Producers
ADD best_movie nvarchar(255) REFERENCES Movies (movie_id)
GO

ALTER TABLE Genres ADD CONSTRAINT PK_genre_id PRIMARY KEY (genre_id);

/*ALTER TABLE Producers
ADD CONSTRAINT producers_motherland_default DEFAULT 'UK' FOR motherland
GO*/

ALTER TABLE Movies
ADD CONSTRAINT movies_unic_id UNIQUE (movie_id);
GO

ALTER TABLE Movies DROP CONSTRAINT PK_genre_id;

CREATE TABLE Genres(
genre_id int IDENTITY,
PRIMARY KEY(genre_id),
genre_name nvarchar
);
GO

ALTER TABLE Movies DROP CONSTRAINT PK__Movies__83CDF7496C12D7C8;
GO

ALTER TABLE Movies_Genres DROP CONSTRAINT FK__Movies_Ge__movie__0F624AF8;
GO

ALTER TABLE Movies ADD CONSTRAINT PK_movie_id PRIMARY KEY (movie_id)
GO

ALTER TABLE Movies ADD genre_id int NOT NULL;

ALTER TABLE Movies_Genres ADD FOREIGN KEY (movie_id) REFERENCES Movies(movie_id);
GO

DROP TABLE Movies_Producers;

ALTER TABLE Genres ADD CONSTRAINT FK_genres FOREIGN KEY (genre_id) REFERENCES Movies(genre_id);
GO

ALTER TABLE Producers ADD CONSTRAINT check_country CHECK (Motherland IN ('USA', 'UK', 'Russia', 'France', 'Germany'));

ALTER TABLE Actors ADD CONSTRAINT check_birthd CHECK (Birthday < GETDATE());

/*CREATE TABLE Movies_Genres(
genre_id int IDENTITY,*/

CREATE INDEX AK_Actors_name_sur ON Actors("Name", Surname);

INSERT INTO [Movies]("Name", "Description", "Year", Country, Budget)
VALUES
('BRAT', 'fdsggfgdf', '2001', 'Russia', 1500),
('BRAT2', 'fdsggfgdf', '2002', 'Russia', 1006),
('BRAT3', 'fdsggefdgdf', '2003', 'Russia', 1700)

ALTER TABLE Producers ADD best_movie int REFERENCES Movies(movie_id);