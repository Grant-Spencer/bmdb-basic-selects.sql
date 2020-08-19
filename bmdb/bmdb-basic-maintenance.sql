/* Let's test the maintenance sql
We should test in the order of:
- select (read)
- insert (create)
- update (update)
- delete (delete)
*/

select * from movie;

insert into movie values
    (11, 'Dummy Movie', 2020, 'G', 'Test director');
    
    update movie
		set title = 'Dummy Movie 2'
        where id = 11;
        
        delete from movie
        where id = 11;