use sakila;

-- Query 1
select p.payment_id
, c.customer_id
, amount
, date(payment_date)
from customer c inner join payment p 
on c.customer_id = p.customer_id
where p.payment_id between 101 and 120
and p.customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23');

-- Query 2
select p.payment_id
, c.customer_id
, amount
, date(payment_date)
from customer c inner join payment p 
on c.customer_id = p.customer_id
where p.payment_id between 101 and 120 
and p.customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19');

-- Query 3
select p.payment_id
, c.customer_id
, amount
, date(payment_date)
from customer c inner join payment p 
on c.customer_id = p.customer_id
where p.amount in (1.98, 7.98, 9.98);

-- Query 4
select last_name
from customer
where last_name like '_A%W%';

-- Query 5
select last_name
from customer
where last_name like '__E';
