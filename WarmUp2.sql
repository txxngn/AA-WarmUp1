-- **Warm Up 2**


--1. Which product category has the highest number of orders among 31-year olds? Return only the top product category.
select Product_Category, sum(Order_Quantity) num_order
from prework.sales 
where Customer_Age = 31
group by 1
order by 2 desc
limit 1

--2. Of female customers in the U.S. who purchased bike-related products in 2015, what was the average revenue?

select avg(Revenue)
from prework.sales 
where Customer_Gender="F"
and country="United States"
and year = 2015
and Product like "%Bike%"




--3. Categorize all purchases into bike vs. non-bike related purchases. How many purchases were there in each group among male customers in 2016?
select case 
        when product like "%Bike%" then "biker"
          else "non-biker" end as non_biker,
        count(*) count
from prework.sales 
where Customer_Gender="M"
and year = 2016
group by 1



--4. Among people who purchased socks or caps (use `sub_category`), what was the average profit earned per country per year, ordered by highest average profit to lowest average profit?
select country, year, avg(profit)
from prework.sales 
where Sub_Category in ('Caps','Socks') --hoặc dùng or, cái này clean hơn
group by 1,2
order by 3 desc

--5. For male customers who purchased the AWC Logo Cap (use `product`), use a window function to order the purchase dates from oldest to most recent within each gender.

select *, 
	row_number() over (partition by customer_gender order by date asc ) as date_rank
from prework.sales
where customer_gender = 'M' and product = 'AWC Logo Cap';
