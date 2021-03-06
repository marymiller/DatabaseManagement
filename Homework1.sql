/*Homework 1 

Mary Miller - Successfully Tested*/


/*Question 1. List all data for all customers.*/
select * from customers;

/*Question 2. List the name and city of agents named Smith.*/
select name, city from agents where name="smith";

/*Question 3. List pid, name, and quantity of products costing more than US$1.25.*/
select pid, name, quantity from products where priceUSD > 1.25;

/*Question 4. List the ordno and aid of all orders.*/
select ordno, aid from orders;

/*Question 5. List the names and cities of customers not in Dallas.*/
select name,city from customers where city != 'Dallas';

/*Question 6. List names of agents in New York or Newark.*/
select name from agents where city = 'New York' OR city = 'Newark';

/*Question 7. List all data for products not in New York or Newark that cost us$1 or less.*/
select * from products where city != 'New York' OR city != 'Newark' AND priceUSD <= 1.00;

/*Question 8. List all data for orders in January or March.*/
select * from orders where mon='jan' OR mon='mar';

/*Question 9. List all data for orders in February less than us$100*/
select * from orders where mon='feb' AND dollars< 100.00 ;

/*Question 10. List all orders from the customer whose cid is C005.*/
select * from orders where cid = 'c005';