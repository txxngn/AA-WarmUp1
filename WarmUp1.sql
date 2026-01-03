--Warm Up 1
-- 1. What is the earliest year of purchase?

select min(year) as earliest_year 
from prework.sales
limit 1


-- 2. What is the average customer age per year? Order the years in ascending order
select year, avg(Customer_Age)
from prework.sales
group by 1
order by 2


-- 3. Return all clothing purchases from September 2015 where the cost was at least $70.
select *
from prework.sales p
where Product_Category = "Clothing"
  And Cost >= 70
  And p.Date >= DATE '2015-09-01'


-- 4. What are all the different types of product categories that were sold from 2014 to 2016 in France?
select Product_Category
from prework.sales
where Country = "France"
  AND Year BETWEEN 2014 AND 2016
Group by 1

-- 5. Within each product category and age group (combined), what is the average order quantity and total profit?
select Product_Category, Age_Group, AVG(Order_Quantity) avg_order_qt, SUM(Profit) total_profit
from prework.sales
group by 1,2

