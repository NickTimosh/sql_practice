SELECT * FROM salaries LIMIT 20;

/* ЗАДАЧА 1

Вивести всіх спеціалістів, в яких з/п вище середньої в таблиці
*/
	
SELECT *
FROM salaries
WHERE 
	salary_in_usd > 			-- порівняння з avg_salary
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
	AND year = 2023;

/* ЗАДАЧА 2 

Вивести всіх спеціалістів, які живуть в країнах, де середня з/п вища за середню серед усіх країн.
*/
	
--1. Пошук середньої з/п
--2. По кожній країні - середня з/п
--3. Порівнюємо, виводимо передік країн
--4. Спеціалісти, що проживають в цих країнах

------------------

-- 1
SELECT AVG(salary_in_usd)
FROM salaries

-- 2,3
SELECT
	company_location
FROM salaries
WHERE year = 2023
GROUP BY 1
HAVING AVG(salary_in_usd) > 
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)

-- 4
SELECT *
FROM salaries
WHERE emp_location IN 
(
	SELECT
	company_location
FROM salaries
WHERE year = 2023
GROUP BY 1
HAVING AVG(salary_in_usd) > 
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
)
	
/* ЗАДАЧА 3

Знайти мінімальну заробітну плату серед максимальних з/п по країнах
*/

-- 1. максимальних з/п по країнах в 2023 році
-- 2. Знайти мінімальну з/п

-------------

--1.
SELECT 
	company_location
	, MAX(salary_in_usd)
FROM salaries
GROUP BY 1

--2. 
SELECT MIN(t.salary_in_usd)
FROM 
(
	SELECT 
		company_location
		, MAX(salary_in_usd) AS salary_in_usd
	FROM salaries
	GROUP BY 1
) AS t

-- альтернатива
SELECT 
	company_location
	, MAX(salary_in_usd) AS salary_in_usd
FROM salaries
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1


/* ЗАДАЧА 4

По кожній професії вивести різницю між середньою з/п та максимальною з/п усіх спеціалістів
*/

--1. Максимальна з/п
--2. Таблиця професій і середніх з/п
--3. Результат

SELECT MAX(salary_in_usd)
FROM salaries

SELECT
	job_title
	, AVG(salary_in_usd) -
(
		SELECT MAX(salary_in_usd)
		FROM salaries
) AS diff
FROM salaries
GROUP BY 1

/* ЗАДАЧА 5

Вивести дані по співробітнику, який отримує другу по розміру з/п в таблиці
*/

SELECT *
FROM
(
	SELECT *
	FROM salaries
	ORDER BY salary_in_usd DESC
	LIMIT 2
) AS t
ORDER BY salary_in_usd ASC
LIMIT 1

-- альтернатива
SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 1 OFFSET 1
