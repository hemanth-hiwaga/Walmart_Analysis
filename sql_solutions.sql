show databases;
use wallmart_db;
show tables;
select * from wallmart;

/*This will give you a sorted list of distinct 
payment methods and how frequently they were used.*/

select 
	distinct payment_method,
    count(payment_method) as used
from wallmart
group by 1
order by used desc;

/*
Finding the total number of branches
*/

select 
	count(distinct branch) as `total number of branches`
from wallmart;

/*
finding number of transactions made in each branch
*/

select 
	distinct branch,
    count(*)
from wallmart
group by 1
order by 2 desc;
-- -------------------------------------------------------------------------------------------

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method

select 
	distinct payment_method,
    count(*) as `number of transctions`,
    sum(quantity) as qty_sold
from wallmart
group by 1
order by 2 desc;

-- ----------------------------------------------------------------------------------------------

-- Project Question #2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating

select *
from(
	select 
		branch,
		category,
		avg(rating) as avg_rating,
		rank() over(partition by branch order by avg(rating) desc) as rnk
	from wallmart
	group by 1,2
	order by 1,3 desc
)as ranked
where rnk = 1;

-- -----------------------------------------------------------------------------------------------

-- Q3: Identify the busiest day for each branch based on the number of transactions

select * from
	(SELECT 
		branch,
		dayname(str_to_date(date,'%d/%m/%y')) as day_name,
		count(*) as number_of_transactions,
		rank() over(partition by branch order by count(*) desc) as rnk
		
	FROM wallmart
	group by 1,2) as ranked
where rnk = 1;

-- ----------------------------------------------------------------------------------------------

-- Q4: Calculate the total quantity of items sold per payment method

select 
	payment_method,
    sum(quantity) as quantity_sold
from wallmart
group by 1
order by 2 desc;

-- -----------------------------------------------------------------------------------------------

-- Q5: Determine the average, minimum, and maximum rating of categories for each city

select 
	city,
    avg(rating) as average_rating,
    min(rating) as minimum_rating,
    max(rating) as maximum_rating
from wallmart
group by city
order by city;

-- -----------------------------------------------------------------------------------------------

-- Q6: Calculate the total profit for each category

select
	category,
    sum(unit_price * quantity * profit_margin) as `profit in each category`
from wallmart
group by 1
order by 2 desc;

-- ---------------------------------------------------------------------------------------------

-- Q7: Determine the most common payment method for each branch

select branch,payment_method, no_of_trans from
	(select 
		branch,
		payment_method,
		count(*) as no_of_trans,
		rank() over(partition by branch order by count(*) desc) as rnk
	from wallmart
	group by 1,2) as ranked
where rnk = 1;

-- ---------------------------------------------------------------------------------------------


-- WITH cte AS (
--     SELECT 
--         branch,
--         payment_method,
--         COUNT(*) AS total_trans,
--         RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
--     FROM wallmart
--     GROUP BY branch, payment_method
-- )
-- SELECT branch, payment_method AS preferred_payment_method
-- FROM cte
-- WHERE rnk = 1;

-- Q8: Categorize sales into Morning, Afternoon, and Evening shifts

select
	branch,
    case 
    when hour(time(time)) < 12 then 'Morning'
    when hour(time(time)) between 12 and 16 then 'Afternoon'
    else 'Evening'
    end as shift,
    count(*) as number_of_invoices
from wallmart
group by 1,2
order by 1,3 desc;
-- -----------------------------------------------------------------------------------------------

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)



with revenue_2022 as
(
	select 
		branch,
		sum(total) as revenue
	from wallmart
		
	where year(str_to_date(date,'%d/%m/%Y'))  = 2022
	group by branch
),
revenue_2023 as
(
	select 
		branch,
		sum(total) as revenue
	from wallmart
		
	where year(str_to_date(date,'%d/%m/%Y'))  = 2023
	group by branch
)
select 
r2022.branch, 
r2022.revenue as last_year_revenue,
r2023.revenue as current_year_revenue,
round(((r2022.revenue - r2023.revenue)/r2022.revenue)*100,2) as revenue_decrese_ratio
from revenue_2022 r2022
join revenue_2023 r2023 on r2023.branch = r2022.branch
where r2022.revenue > r2023.revenue
order by 4 desc
limit 5;
