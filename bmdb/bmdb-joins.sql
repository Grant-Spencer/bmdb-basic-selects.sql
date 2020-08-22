select * from movie;
select * from credit;

-- inner join: data in common between 2 tables
select m.id, title, c.id, year, role 
	from movie as m
	join credit as c
		on m.id = c.movieid;

-- inner join credit - actor
select * from credit as c
	join actor as a
		on c.actorid = a.id;
        
        -- outer join, all movies and actors assigned
	select * from movie
		left join credit 
			on movie.id = credit.movieid;