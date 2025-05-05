-- create database Market;
use market;
-- show tables;
 select * from supermarket;
 
 
-- Null handling these column city,branch,gender,customer_type,product_line,gross_margin_percentage,gross income

 select count(*) from supermarket
 where 
 city or branch or
 gender or customer_type or product_line
 gross_margin_percentage or gross_income
 is null
 
 
-- How many order in supermarkets Three citys
-- count of Yangon
select count(*) from supermarket where city='yangon'

-- count of Naypyitaw
select count(*) from supermarket where city='naypyitaw'

-- count of Mandalay
select count(*) from supermarket where city='Mandalay'




-- Total revenue in whole supermarket
select sum(Total) As Total_revenu from supermarket

-- revenue in yangon
select Sum(Total) As Revenu_yangon from supermarket where city ='yangon'

-- revenue in naypyitaw
select sum(Total) As Revenu_Naypyitaw from supermarket where city='naypyitaw'

-- revenue in Mandalay
select sum(Total) As Revenu_Mandalay from supermarket where city='Mandalay'





-- customer Gender_types count Both Male and Female Peoples
-- Male
select count(*) from supermarket where Gender='male'
-- Female
select count(*) from supermarket where Gender='Female'
--  which Gender is returned profit from supermarket
Select gender,count(gender),sum(unit_price * quantity * 0.10)as profit from supermarket group by gender





-- Most selling product in supermarket_sales
-- Food and Beverages
select count(*) from supermarket where product_line ='Food and Beverages'
-- Health and Beverages
select count(*) from supermarket where product_line ='Health and Beverages'
-- sports and travel
select count(*) from supermarket where product_line ='sports and travel'
-- home and lifestyle
select count(*) from supermarket where product_line ='home and lifestyle'
-- fashion accessories
select count(*) from supermarket where product_line ='fashion accessories'
-- Electronic accessories
select count(*) from supermarket where product_line='Electronic accessories'



-- Total revenue from each products
select product_line, sum(Total) from supermarket group by product_line;

-- Maxmium Revenue from each products
select product_line, max(total) from supermarket group by product_line;
-- Avgerage Revenue from each products
select product_line, Avg(total) from supermarket group by product_line;
-- Minmium Revenue from each products
select product_line, min(total) from supermarket group by product_line;

-- Total profit
Select sum(unit_price * Quantity * 0.10) As profit from supermarket 

-- profit from 'Food and Beverages'
select sum(unit_price * Quantity * 0.10) as profit from supermarket where product_line in ('Food and Beverages')

-- profit from 'Health and Beverages'
Select sum(unit_price * Quantity * 0.10) as profit from supermarket where product_line in ('Health and Beverages')

-- profit from 'sports and travel'
Select sum(Unit_price * Quantity * 0.10) as profit from supermarket where product_line In ('sports and travel')

-- profit from 'home and lifestyle'
select sum(unit_price * Quantity * 0.10) as profit from supermarket where product_line In ('home and lifestyle')

-- profit from 'fashion accessories'
select sum(unit_price * Quantity * 0.10) as profit from supermarket where product_line In ('fashion accessories')

-- profit from 'Electronic accessories'
Select sum(unit_price * Quantity * 0.10) as profit from supermarket where product_line In ('Electronic accessories')

-- Gross_income of Max,Avg,Min

select max(gross_income) from supermarket 
select avg(gross_income) from supermarket
select min(gross_income) from supermarket



-- how is regular shoping supermarket Member or Normal peoples
select customer_type,count(customer_type) as customer from supermarket group by customer_type
-- Total by customer_type
select customer_type,sum(total) from supermarket group by customer_type


-- which payment system most use customer 
select payment,count(payment) from supermarket group by payment




-- when case using categores find customer spending level and which spender shoping most

with Ct as(select Customer_type,product_line,total,payment,
case
	when total > 800 then 'high spender'
    when total between 400 and 800 then 'medium spender'
    when total < 400 then 'low spender'
end as customer_slevel
 from supermarket )
 select customer_slevel,count(*) from Ct group by customer_slevel 
  
  

 


