--Queries Homework #3
--Mary Miller


--1. Get the cities of agents booking an order for customers c002. Use a subquery
select city
from agents
where aid in (select aid
	      from orders
	      where cid = 'c002')
--2. Get the cities of agents booking an order for customer c002. This time use joins; no subqueries.
select a.city
from agents a,
     orders o
where a.aid = o.aid
  and o.cid = 'c002'
--3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries
select distinct pid
from orders 
where aid in (select aid
	      from orders
	      where cid in (select cid
		            from customers
			    where city = 'Kyoto'))
order by pid
--4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries
select distinct o2.pid
from orders o1,
     orders o2,
     customers c
where c.city = 'Kyoto'
  and c.cid = o1.cid
  and o1.aid = o2.aid
order by o2.pid
--5. Get the names of customers who have never placed an order. Use a subquery.
select name
from customers
where cid not in (select cid
	          from orders)

--6. Get the names of customers who have never placed an order. Use an outer join.
select distinct c.name 
from customers c left outer join orders o
on c.cid = o.cid
where o.cid is null

--7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.
select c.name, a.name
from customers c,
     agents a
where c.city = a.city 
  and (a.aid, c.cid) in (select aid, cid
                         from orders)
--8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever palced an order with that agent.
select c.name, a.name, a.city
from customers c, 
     agents a
where a.city = c.city
--9. Get the name and city of customers who live in the city where the least number of products are made.
select c.name, count(p.city), c.city
from customers c,
     products p
where c.city = p.city
group by c.name, p.city, c.city
order by count(p.city)
limit 1
--10. Get the name and city of customers who live in a city where the most number of products are made.
select c.name, count(p.city), c.city
from customers c,
     products p
where c.city = p.city
group by c.name, p.city, c.city
order by count(p.city)
limit 1
--11. Get the name and city of customers who live in any city where the most number of products are made.
select c.name, c.city
from customers c,
     products p
where c.city = p.city and 
      p.quantity in (select max(quantity) 
                     from products) 
--12. List the products whose priceUSD is above the average priceUSD.
select *
from products p
where p.priceUSD > (select avg(priceUSD)
                    from products)
--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.
select c.name, o.pid, o.dollars
from customers c,
     orders o
where c.cid = o.cid
order by o.dollars DESC

--14. Show all customer names(in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.
select c.name, coalesce(sum(o.dollars),0.00)
from customers c left outer join orders o
on c.cid = o.cid
group by c.name, c.cid
order by c.cid
--15. Show the names of all customers who bought products from agents based in New York along with the names of the products they ordered, and the names of the agents who sold it to them.
select c.name, p.name, a.name
from customers c, 
     agents a,
     orders o,
     products p
where c.cid = o.cid
  and a.aid = o.aid
  and p.pid = o.pid
  and a.city = 'New York'
--16.Write a query to check the accuracy of the dollars column in the Orders table.
-- This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars
select o.dollars, (o.qty * p.priceUSD * (1-c.discount/100)) as "Actual Price"
from orders o,
     products p,
     customers c
where o.pid = p.pid
  and c.cid = o.cid
--17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query. 
INSERT INTO Orders( ordno, mon, cid, aid, pid, qty, dollars )
  VALUES(1027, 'jan', 'c001', 'a01', 'p01', 1000, 550.00);