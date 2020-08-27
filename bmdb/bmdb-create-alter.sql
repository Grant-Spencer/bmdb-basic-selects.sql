-- create / alter a view
create view movieCredits as 
-- alter view movieCredits as 
select m.Title, m.Year, a.FirstName, a.LastName, c.Role 
  from actor a
  join credit c
    on a.ID = c.ActorID
  join movie m
    on m.ID = c.MovieID;
-- use the view
select * from movieCredits;

-- use the view and order by
select * from movieCredits
 order by title;