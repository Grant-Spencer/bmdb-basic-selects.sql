-- bmdb - add genre and movie genre tables
-- Note: You must run the bmdb create script first!

-- Create Genre table

Create table genre(
ID		integer			primary key auto_increment,
name	varchar(30)		not null unique
);

-- Create moviegenre table
-- business rule combo of genre+movie must be unique

create table moviegenre(
ID		integer		primary key auto_increment,
movieid	integer		not null,
genreid	integer		not null,
foreign key (genreid) references genre(id),
foreign key (movieid) references movie(id),
constraint gnr_mov	unique	(genreid, movieid)
);

insert into genre values
(1, 'action'),
(2, 'adventure'),
(3, 'animation'),
(4, 'biography'),
(5, 'comedy'),
(6, 'documentary'),
(7, 'drama,'),
(8, 'family'),
(9, 'fantasy'),
(10,'film noir'),
(11, 'history'),
(12, 'horror'),
(13, 'music'),
(14, 'mystery'),
(15, 'romance'),
(16, 'sci-fi'),
(17, 'short film'),
(18, 'sport'),
(19, 'superhero'),
(20, 'thriller'),
(21, 'war'),
(22, 'western');