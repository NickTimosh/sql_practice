select 
	job_title 
	, ROUND(AVG(salary_in_usd),0) as avg_salary
from salaries
group by 1


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
