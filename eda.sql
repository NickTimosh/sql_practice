SELECT *
FROM salaries
LIMIT 100;

SELECT COUNT(*)
FROM salaries;

SELECT 
	COUNT(*)
	, COUNT(*) - COUNT(salary_in_usd) AS missing_values
FROM salaries;

-- categorical data
SELECT 
	job_title
	, COUNT(*) -- to check not only distribution, but spelling as well
FROM salaries
GROUP BY 1
ORDER BY 2 DESC
-- LIMIT 10 and generate a bar chart

-- numeric data
SELECT 
	job_title
	, exp_level
	, min(salary_in_usd)
	, max(salary_in_usd)
	, ROUND(avg(salary_in_usd),2) AS avg
	, ROUND(variance(salary_in_usd),2) As var
	, ROUND(stddev(salary_in_usd),2) as stddev
FROM salaries
GROUP BY 1,2
ORDER BY 1,2

-- distribution
SELECT -- not easy to explore
	salary_in_usd
	, COUNT(*)
FROM salaries
GROUP BY 1;

SELECT -- trancate allows to make 160000 from 154560
	TRUNC(salary_in_usd,-1)
	, COUNT(*)
FROM salaries
GROUP BY 1;

SELECT
	CASE 
		WHEN salary_in_usd <=10000 THEN 'A'
		WHEN salary_in_usd <=50000 THEN 'B'
		WHEN salary_in_usd <=100000 THEN 'C'
		WHEN salary_in_usd <=200000 THEN 'D'
		WHEN salary_in_usd > 200000 THEN 'E' END AS salary_cat
	, COUNT(*)
FROM salaries
GROUP BY 1;


SELECT corr(remote_ratio, salary_in_usd)
FROM salaries;
