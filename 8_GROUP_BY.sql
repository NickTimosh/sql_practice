SELECT * FROM salaries LIMIT 20;

/* 
Для кожної професії та відповідного рівня досвіду навести:

- кількість в таблиці
- середню заробітну плату
*/

SELECT 
	job_title
	, exp_level
	, COUNT(*) AS job_nmb
	, ROUND(AVG(salary_in_usd*37),2) AS salary_avg_in_uah
FROM salaries
WHERE year = 2023
GROUP BY job_title, exp_level
ORDER BY 1,2;

/*
Для професій, зо зустрічаються лише 1 (або 2) раз, навести заробітну плату
*/

SELECT 
	job_title
-- 	, COUNT(*) AS job_nmb
	, ROUND(AVG(salary_in_usd*37),2) AS salary_avg_in_uah
FROM salaries
WHERE year = 2023
GROUP BY job_title
HAVING 
	COUNT(*) = 2
	AND ROUND(AVG(salary_in_usd*37),2) > 4000000
ORDER BY 2 ASC;


/*
Вправа:
Для кожного року навести дані щодо середньої заробітної плати та кількість спеціалістів в таблиці.
Результат експортувати в .csv файл, імпортувати в Power BI і побудувати доречну візуалізацію отриманих даних
*/


SELECT
	year
	, ROUND(AVG(salary_in_usd),2) 	AS avg_salary
	, COUNT(*) 			AS emp_nmb
FROM salaries
GROUP BY 1;
