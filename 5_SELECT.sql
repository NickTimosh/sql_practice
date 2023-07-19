# повернення значень без використання будь-якого джерела
  
SELECT
    	1	  AS nmb_1
	,2	  AS nmb_2
	,5+5      AS nmb_3;

# повернення кількості значень в таблиці і колонці, а також унікальних значень в колонці
  
SELECT 
	COUNT(*)			        AS cnt_all
	, COUNT(exp_level)	 		 AS cnt_level
	, COUNT(DISTINCT exp_level)
FROM salaries
LIMIT 10;

# повернення деяких описових статистик по вказаній колонці
  
SELECT 
	AVG(salary_in_usd)	   	AS salary_avg
	, MIN(salary_in_usd)   		AS salary_min
	, MAX(salary_in_usd)   		AS salary_max
FROM salaries
WHERE year = '2023'
LIMIT 10;

# впровадження нових колонок за розрахунком та умовою

SELECT 
	year
	, exp_level
	, salary_in_usd
	, salary_in_usd * 38	      AS salary_in_uah
	, CASE
		WHEN exp_level = 'SE'
		  THEN 'Senior'
		WHEN exp_level = 'MI'
		  THEN 'Middle'
		ELSE 'Other' 
    END 		                  AS full_level
FROM salaries
LIMIT 100;
