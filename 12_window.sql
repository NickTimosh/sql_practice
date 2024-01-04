-- звичайна агрегація з групуванням
select 
	job_title 
	, ROUND(AVG(salary_in_usd),0) as avg_salary
from salaries
group by 1

-- використання віконних функцій агрегації
with cte as (
	select 
		job_title 
		, salary_in_usd 
		, SUM(salary_in_usd)	OVER(partition by job_title order by salary_in_usd)	as sum_salary
--		, AVG(salary_in_usd) 	OVER(partition by job_title)	as avg_salary			
--		, MIN(salary_in_usd)	OVER(partition by job_title)	as min_salary
--		, MAX(salary_in_usd)	OVER(partition by job_title)	as max_salary
--		, COUNT(salary_in_usd)	OVER(partition by job_title)	as job_cnt
--		, SUM(salary_in_usd)	OVER(partition by job_title)	as sum_salary
	from salaries s 	
	where year = 2023
)

select *
--	, 	salary_in_usd::float / max_salary	as ratio_max	-- CAST()
--	, salary_in_usd / avg_salary 			as ratio_avg
from cte


-- тільки співробітники, у яких зп перевищує середню по професії, яку вони представляють

with cte as (
	select 
		job_title 
		, salary_in_usd 
		, AVG(salary_in_usd) 	OVER(partition by job_title)	as avg_salary			
	from salaries s 	
	where year = 2023
)

select *
from cte
where salary_in_usd > avg_salary

-- ранжування таблиці (для кожного замовника рейтинг інвойсів за сумою)
WITH cte AS (
	SELECT
		InvoiceId 
		, CustomerId
		, Total
		, ROW_NUMBER() 	OVER(PARTITION BY CustomerId ORDER BY Total DESC) AS invoice_nmb
		, RANK() 		OVER(PARTITION BY CustomerId ORDER BY Total DESC) AS invoice_rank
		, DENSE_RANK() 	OVER(PARTITION BY CustomerId ORDER BY Total DESC) AS invoice_rank
	FROM Invoice i 
	ORDER BY CustomerId
) 
SELECT *
FROM cte
WHERE invoice_nmb = 2

-- зміщення відносно поточного рядка

SELECT 
	InvoiceId 
	, CustomerId 
	, InvoiceDate 
	, Total
	, LAG(Total, 1) OVER(Partition by CustomerId Order By InvoiceDate) AS lag_total
	, LAG(InvoiceDate, 1) OVER(Partition by CustomerId Order By InvoiceDate) AS lag_total
	, JULIANDAY(InvoiceDate) - JULIANDAY(LAG(InvoiceDate, 1) OVER(Partition by CustomerId Order By InvoiceDate))  AS diff_in_days
	, LEAD(Total, 1) OVER(Partition by CustomerId Order By InvoiceDate) AS lead_total
FROM Invoice i 
ORDER By CustomerId 


SELECT 
	InvoiceId 
	, CustomerId 
	, InvoiceDate 
	, Total
	, FIRST_VALUE(Total) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate ASC) AS first_amount
FROM Invoice i 
