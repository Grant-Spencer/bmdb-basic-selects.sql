select * from movie;
        
	insert into movie values
    (11, 'Paid In Full', 2002, 'R', 'Charles Stone III'),
    (12, 'Half Baked', 1998, 'R', 'Tamra Davis'),
    (13, 'The Simpsons Movie', 2007, 'PG-13', 'David Silverman'),
    (14, 'Swiss Family Robinson', 1960, 'G', 'Ken Annakin'),
    (15, 'Pirates of the Caribbean: The Curse of the Black Pearl', 2003, 'PG-13', 'Gore Verbinski')
    ;
    
    select * from actor;
    
    insert into actor (firstname, lastname, gender, birthdate)
    VALUES
 	('Wood', 'Harris', 'M', '1969-10-17'),
    ('Brad', 'Pitt', 'M', '1963-12-18'),
    ('Bruce', 'Willis', 'M', '1955-03-19'),
 	('Dan', 'Castellaneta', 'M', '1957-10-29')
    ;
    
    delete from actor
    where id > 4;