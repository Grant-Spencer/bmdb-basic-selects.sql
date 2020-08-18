select * from customers;

-- select by primary key
select* from customers where customernumber = 131;

-- count function
select count(*) from customers;

-- count with an alias
select count(*) as row_count
from customers; 

-- count with an alias, shorthand
selectcount(*) row_count
from customers;

-- sum function
select sum(creditlimit)
 from customers;

-- avg & Format function
select format (avg(creditlimit),2) from customers;

-- avg & Format, and concat function
select concat('$',format(avg(creditlimit),2)) as avg_credit_limit from customers;

-- group by: avg & Format, and concat function by country
select country, concat('$',format(avg(creditlimit),2)) as avg_credit_limit 
from customers
group by country
order by avg(creditlimit) desc;

-- group by, having: avg & Format, and concat function by country where avg is greater than 0
select country, concat('$',format(avg(creditlimit),2)) as avg_credit_limit 
from customers
group by country
having avg(creditlimit) > 0
order by avg(creditlimit) desc;


-- max credit limit
select max(creditlimit) 
from customers;

-- min credit limit
select min(creditlimit)
from customers;