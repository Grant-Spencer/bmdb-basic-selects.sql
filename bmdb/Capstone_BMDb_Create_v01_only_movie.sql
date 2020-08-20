-- create and select the database
DROP DATABASE IF EXISTS bmdb;
CREATE DATABASE bmdb;
USE bmdb;

-- create Movie table
-- DROP TABLE IF EXISTS Movie;
Create table Movie (
ID 			integer 		primary key auto_increment,
Title 		varchar(255) 	not null,
Year 		integer 		not null,
Rating 		varchar(5) 		not null,
Director 	varchar(255) 	not null,
CONSTRAINT unq_movie unique (Title,year)
);

-- create Actor table
Create table Actor (
ID 			integer 		primary key auto_increment,
FirstName 	varchar(255) 	not null,
LastName 	varchar(255) 	not null,
Gender 		varchar(1) 		not null,
BirthDate 	date 			not null,
CONSTRAINT unq_actor unique (FirstName, LastName, BirthDate)
);

-- Add some movies
 insert into Movie VALUES
 	(1, 'Star Wars', 1977, 'PG', 'George Lucas'),
 	(2, 'Sixteen Candles', 1984, 'PG', 'John Hughes'),
  	(3, 'Fifth Element', 1997, 'PG-13', 'Luc Besson'),
 	(4, 'Better Off Dead', 1985, 'PG', 'Savage Steve Holland'),
    (5, 'Blazing Saddles', 1974, 'R', 'Mel Brooks'),
	(6, 'The Godfather', 1972, 'R', 'Francis Ford Coppola'),
    (7, 'Tears of the Sun', 2003, 'R', 'Antoine Fuqua'),
    (8, 'Friday', 1995, 'R', 'F. Gary Gray'),
    (9, 'Die Hard', 1988, 'R', 'John McTiernan'),
    (10, 'Troy', 2004, 'R', 'Wolfgang Petersen');
    
    -- Add some actors
    -- date fields are YYYY-MM-DD
 insert into actor VALUES
 	(1, 'Mark', 'Hamill', 'M', '1951-09-25'),
    (2, 'Harrison', 'Ford', 'M', '1942-07-13'),
    (3, 'Molly', 'Ringwald', 'F', '1968-02-18'),
 	(4, 'Anthony Michael', 'Hall', 'M', '1968-04-14')
    ;
    
    -- add credit
    create table credit(
    ID			integer			primary key auto_increment,
    actorID		integer			not null,
    movieID 	integer			not null,
    role	 	varchar(255)	not null,
    Foreign Key (ActorID) 	references Actor(ID),
	Foreign Key (MovieID) 	references Movie(ID),
	CONSTRAINT act_mov 		unique (ActorID, MovieID)
    );
    
    -- Add some credits
 insert into Credit VALUES
 	(1, 1, 1, 'Luke Skywalker'),
 	(2, 2, 1, 'Han Solo'),
    (3, 3, 2, 'Samantha Baker'),
    (4, 4, 2, 'Geek')
    ;
    
    
    
    