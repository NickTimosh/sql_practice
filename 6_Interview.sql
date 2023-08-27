SELECT * FROM salaries LIMIT 10;

/* #1. Вивести з/п спеціалістів ML Engineer в 2023 році, 
додати сортування за зростанням з/п.*/

SELECT 
	salary_in_usd AS salary
-- 	, year
-- 	, job_title
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 1 ASC
LIMIT 10;

/* #2. Назвати країну (company_location),
в якій зафіксована найменша з/п спеціаліста в сфері Data Scientist в 2023 році */

SELECT
	company_location
	, salary_in_usd
	, job_title
	, year
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY 2 ASC
LIMIT 1;
/* #3. Вивести топ 5 з/п серед усіх спеціалістів, 
які працюють повністю віддалено (remote_ratio = 100) */

SELECT 
	salary_in_usd AS salary
	, remote_ratio
FROM salaries
WHERE
	remote_ratio = 100
ORDER BY 1 DESC
LIMIT 5;

/* #4. Вивести унікальні значення для колонки */

SELECT DISTINCT remote_ratio
FROM salaries;



/* #5. Вивести кількість унікальних значень колонки */

SELECT COUNT(remote_ratio)
FROM salaries;



/* #6. Вивести середню, мінімальну та максимальну з/п (salary_in_usd) для 2023 року. */

SELECT 
	ROUND(AVG(salary_in_usd), 2) 	AS avg_salary_in_usd
	, MIN(salary_in_usd)			AS min_salary_in_usd
	, MAX(salary_in_usd)			AS max_salary_in_usd
FROM salaries
WHERE year = 2023;

/* #7. Вивести 5 найвищих заробітних плат в 2023 році для представників спеціальності 
ML Engineer. Заробітні плати перевести в гривні. */

SELECT
-- 	salary_in_usd
-- 	, year
-- 	, job_title
-- 	, 
	(salary_in_usd * 38)	AS salary_in_uah
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 1 DESC
LIMIT 5;


/* #8. Вивести Унікальні значення колонки remote_ratio, 
формат даних має бути дробовим з двома знаками після коми, 
приклад: значення 50 має відображатись в форматі 0.50 */

SELECT DISTINCT ROUND((remote_ratio/100.0),2) AS remote_frac
FROM salaries;

/* #9. Вивести дані таблиці, додавши колонку 'exp_level_full' 
з повною назвою рівнів досвіду працівників відповідно до колонки exp_level. 
Визначення: Entry-level (EN), Mid-level (MI), Senior-level (SE), Executive-level (EX)*/ 

SELECT *
	, CASE
		WHEN exp_level = 'EN' THEN 'Entry_level'
		WHEN exp_level = 'MI' THEN 'Mid-level'
		WHEN exp_level = 'SE' THEN 'Senior-level'
		ELSE 'Executive-level' END 					AS exp_level_full
FROM salaries
LIMIT 10;

SELECT *
	, CASE
		WHEN salary_in_usd < 50000 THEN 'Category 1'
		WHEN salary_in_usd < 100000 THEN 'Category 2'
		WHEN salary_in_usd < 150000 THEN 'Category 3'
		ELSE 'Category 4' END 					AS salary_level
FROM salaries
LIMIT 10;

/* #10. Дослідити всі колонки на наявність відсутніх значень */

SELECT COUNT(*)
FROM salaries;

SELECT COUNT(*) - COUNT(salary_in_usd)
FROM salaries;
