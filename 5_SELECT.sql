# повернення значень без використання будь-якого джерела
  
SELECT
    	1	  AS nmb_1
	,2	  AS nmb_2
	,5+5      AS nmb_3;

# Знайомство з таблицею: повернення кількості значень в таблиці і колонці, а також унікальних значень в колонці
  
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

# 👇 Додаткові вправи для практики: 

/* 1. Вивести кількість унікальних значень для кожної колонки, 
що містить текстові значення. 
P.s. Ми не фільтруємо таблицю, виводячи колонки певного типу даних.
Натомість, ми просто досліджуємо кожну окрему колонку, де бачимо текстові дані
*/

SELECT COUNT(DISTINCT job_title)
FROM salaries;

/* 2. Вивести унікальні значення для кожної колонки, 
що містить текстові значення. 
(SELECT DISTINCT column_name FROM salaries) */

SELECT DISTINCT job_title
FROM salaries
ORDER BY 1 ASC;

/* 3. Вивести середню, мінімальну та максимальну з/п (salary_in_usd)
для кожного року (окремими запитами, в кожному з яких 
впроваджено фільтр відповідного року) */

SELECT 
	ROUND(AVG(salary_in_usd),0)	AS avg_salary
	, MIN(salary_in_usd)		AS min_salary
	, MAX(salary_in_usd)		AS max_salary
FROM salaries
WHERE year = '2021';

/* 4. Вивести середню з/п (salary_in_usd) для 2023 року по 
кожному рівню досвіду працівників (окремими запитами, 
в кожному з яких впроваджено фільтр року та досвіду). */

SELECT ROUND(AVG(salary_in_usd),0)	AS avg_salary
FROM salaries
WHERE year = 2023 AND exp_level = 'MI';

/* 5. Вивести 5 найвищих заробітних плат в 2023 році для 
представників спеціальності ML Engineer. 
Заробітні плати перевести в гривні. */

SELECT
	year
	, job_title
	, salary_in_usd
	, salary_in_usd * 38 	AS salary_in_uah
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 4 DESC
LIMIT 5;

/* 6. Вивести Унікальні значення колонки remote_ratio, 
формат даних має бути дробовим з двома знаками після коми, 
приклад: значення 50 має відображатись в форматі 0.50 */

SELECT DISTINCT ROUND(remote_ratio/100.0,2) AS remote_ratio
FROM salaries;

/* 7. Вивести дані таблиці, додавши колонку 'exp_level_full' 
з повною назвою рівнів досвіду працівників відповідно до колонки 
exp_level. 
Визначення: Entry-level (EN), Mid-level (MI), Senior-level (SE), 
Executive-level (EX) */

SELECT *
	, CASE  
		WHEN exp_level = 'EN' THEN 'Entry-level'
		WHEN exp_level = 'MI' THEN 'Mid-level'
		WHEN exp_level = 'SE' THEN 'Senior-level'
		WHEN exp_level = 'EX' THEN 'Executive-level'
		END AS exp_level_full
FROM salaries
LIMIT 100;


/* 8. Додатки колонку "salary_category', яка буде відображати 
різні категорії заробітних плат відповідно до їх значення 
в колонці 'salary_in_usd'. 

Визначення: 
з/п менша за 20 000 - Категорія 1, 
з/п менша за 50 000 - Категорія 2, 
з/п менша за 100 000 - Категорія 3, 
з/п більша за 100 000 - Категорія 4 */


SELECT *
	, CASE  
		WHEN salary_in_usd <= 20000 THEN 'Категорія 1'
		WHEN salary_in_usd <= 50000 THEN 'Категорія 2'
		WHEN salary_in_usd <= 100000 THEN 'Категорія 3'
		ELSE 'Категорія 4' END AS salary_category
FROM salaries
LIMIT 100;


/* 9. Дослідити всі колонки на наявність відсутніх значень, 
порівнявши кількість рядків таблиці з кількістю значень відповідної 
колонки */

SELECT 
	COUNT(*)					AS total_nmb
	, COUNT(job_title)				AS dist_nmb
	, COUNT(*) - COUNT(job_title) 			AS null_nmb
FROM salaries;

/* 10. Порахувати кількість працівників в таблиці, 
які в 2023 році працюють на компанії розміру "М" і отримують 
з/п вищу за $100 000 */

SELECT COUNT(salary_in_usd)
FROM salaries
WHERE 1=1
	AND year = '2023'
	AND company_size = 'M'
	AND salary_in_usd >= 100000;
