--Queries Homework #3
--Mary Miller


--1. Get the cities of agents booking an order for customers c002. Use a subquery

--2. Get the cities of agents booking an order for customer c002. This time use joins; no subqueries.

--3. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use subqueries

--4. Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. Use joins thus time; no subqueries

--5. Get the names of customers who have never placed an order. Use a subquery.

--6. Get the names of customers who have never placed an order. Use an outer join.

--7. Get the names of customers who placed at least one order through an agent in their city, along with those agent(s) names.

--8. Get the names of customers and agents in the same city, along with the name of the city, regardless of whether or not the customer has ever palced an order with that agent.

--9. Get the name and city of customers who live in the city where the least number of products are made.

--10. Get the name and city of customers who live in a city where the most number of products are made.

--11. Get the name and city of customers who live in any city where the most number of products are made.

--12. List the products whose priceUSD is above the average priceUSD.

--13. Show the customer name, pid ordered, and the dollars for all customer orders, sorted by dollars from high to low.

--14. Show all customer names(in order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.

--15. Show the names of all customers who bought products they ordered, and the names of the afents who sold it to them.

--16.Write a query to check the accuracy of the dollars column in the Orders table.
-- This means calculating Orders.dollars from other data in other tables and then comparing those values to the values in Orders.dollars

--17. Create an error in the dollars column of the Orders table so that you can verify your accuracy checking query. 