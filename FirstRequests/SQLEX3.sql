GRANT CREATE TABLE TO ALVA
GO
ALTER DATABASE Filmography
SET OWNER = ALVA
CREATE TABLE Movies(
"Name" nvarchar(30) NOT NULL,
"Description" text NOT NULL,
"Year" int,
Genres text,
Country nvarchar(40),
Budget money CHECK(budget>10000),
PRIMARY KEY("Name", "Year"),
CHECK("Year">1900 AND "Year"<YEAR(GETDATE())+10)
)

CREATE TABLE Actors(
Surname nvarchar(30),
"Name" nvarchar(30),
Birthdate date,
Motherland nvarchar(30),
Number_of_movies int CHECK(Number_of_movies>5),
Some_column int IDENTITY(1,1),
CONSTRAINT Const_SurNamYe UNIQUE(Surname, Name, Birthdate)
)

CREATE TABLE Proudcer(
Surname nvarchar(30),
"Name" nvarchar(30),
Birthday date,
Motherland nvarchar(30) DEFAULT 'USA',
Some_column int IDENTITY(1,1)
)
