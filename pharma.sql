use pharma_data;



-- 1. Retrieve all columns for all records in the dataset
select *
from pharma_data;

-- 2. How many unique countries are represented in the dataset?

select distinct country
from pharma_data;

-- 3. Select the names of all the customers on the 'Retail' channel.

select `customer name`
from pharma_data
where `sub-channel`='retail'

-- 4.Find the total quantity sold for the ' Antibiotics' product class.

select round(sum(quantity),0),`product class`
from pharma_data
where `product class`='antibiotics'

-- 5. List all the distinct months present in the dataset.

select distinct month
from pharma_data;

-- 6.Calculate the total sales for each year.

select round(sum(sales) ,0)as sales_total,year
from pharma_data
group by year;

-- 7.Find the customer with the highest sales value.

select distinct `customer name`,max(sales)
from pharma_data
group by `customer name`
order by max(sales) desc
limit 1;


-- 8.Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'

select distinct `name of sales rep`
from pharma_data
where manager='james goodwill';

-- 9.Retrieve the top 5 cities with the highest sales.

select max(sales),city
from pharma_data
group by  city
order by max(sales) desc
limit 5;

-- 10.Calculate the average price of products in each sub-channel.

select round(avg(price),0),`sub-channel`
from pharma_data
group by `sub-channel`;

-- 11.Join the 'Employees' table with the 'Sales' table to get the name of the Sales Rep and the
-- corresponding sales records


-- 12.Retrieve all sales made by employees from ' Rendsburg ' in the year 2018.

select sales,`name of sales rep`
from pharma_data
where  city='rendsburg' and year =2018


-- 13. Calculate the total sales for each product class, for each month, and order the results by
-- year, month, and product class.

select  sum(sales) as total_sales,`product class`,year,month
from pharma_data
group by year,month,`product class`
order by year,month,`product class`;

-- 14. Find the top 3 sales reps with the highest sales in 2019.

select sales,`name of sales rep`,year 
from pharma_data
where year=2019
order by sales desc
limit 3;


-- 15.   Calculate the monthly total sales for each sub-channel, and then calculate the average
-- monthly sales for each sub-channel over the years 

select sum(sales),month,year,`sub-channel`,avg(sales)
from pharma_data
group by month,year,`sub-channel`;



WITH monthly_sales AS (
    SELECT 
        `sub-channel`,
        YEAR,
        MONTH,
        SUM(sales) AS total_monthly_sales
    FROM 
        pharma_data
    GROUP BY 
        `sub-channel`, 
        YEAR, 
        MONTH
)

SELECT 
    `sub-channel`,
    AVG(total_monthly_sales) AS average_monthly_sales
FROM 
    monthly_sales
GROUP BY 
    `sub-channel`
ORDER BY 
   ` sub-channel`;


-- 16.Create a summary report that includes the total sales, average price, and total quantity
-- sold for each product class


select  round(sum(sales),0)as `total sales`,round(avg(price))as `average price`,round(sum(quantity)) as `total quantity`,`product class`
from pharma_data
group by `product class`;

-- 17.Find the top 5 customers with the highest sales for each year.

select max(sales) as` highest sales`,`customer name`,year
from pharma_data
group by `customer name`,year
order by `customer name`,year ,`highest sales`desc
limit 5;


-- 19.List the months with the lowest sales for each year

select month ,year,min(sales) as `low sales`
from pharma_data
group by month,year 
order by month,year,`low sales` desc;


-- 20.Calculate the total sales for each sub-channel in each country, and then find the country
-- with the highest total sales for each sub-channel.


select sum(sales) as `sales`,`sub-channel`,country
from pharma_data
group by `sales`,`sub-channel`,country







