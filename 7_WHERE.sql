SELECT * FROM salaries LIMIT 20;

# Фільтр числових колонок -----------------------
SELECT * 
FROM salaries 
WHERE 
	year != 2023
LIMIT 20;

# Фільтр текстових колонок -----------------------
SELECT year
FROM salaries 
WHERE 
	exp_level = 'MI'
LIMIT 20;

# Поєднання фільтрів умовними операторами --------
SELECT *
FROM salaries 
WHERE 
	exp_level = 'MI'
	AND (exp_level != 'MI'
	OR exp_level != 'MI')
LIMIT 20;

# Вказання діапазону значень ---------------------
SELECT DISTINCT year
FROM salaries 
WHERE 1=1
	AND year NOT BETWEEN 2021 AND 2023
-- 	AND year >= 2020
-- 	AND year <= 2023
LIMIT 20;

# Вказання Списку числових значень ---------------
SELECT DISTINCT year
FROM salaries 
WHERE 1=1
	AND year NOT IN (2020,2021)
-- 	AND year >= 2020
-- 	AND year <= 2023
LIMIT 20;

# Вказання Списку текстових значень --------------
SELECT DISTINCT job_title
FROM salaries 
WHERE 1=1
	AND job_title IN ('Data Analyst', 'Data Scientist')
-- 	AND year >= 2020
-- 	AND year <= 2023
LIMIT 20;

# Пошук тексту за шаблоном -----------------------
SELECT DISTINCT job_title
FROM salaries 
WHERE 1=1
	AND job_title iLIKE ('data_A%') 
-- 	AND year >= 2020
-- 	AND year <= 2023
LIMIT 20;

# Фільтр пустих значень --------------------------
SELECT *
FROM salaries 
WHERE 1=1
  AND year IS NOT NULL
-- 	AND job_title iLIKE ('data_A%') 
LIMIT 20;

# Приклади рішень для вправ: ----------------------

/*
1. Вивести всіх співробітників, 
які в 2023 отримували з/п більшу за $300тис.
*/

SELECT *
FROM salaries
WHERE 1=1
	AND year = 2023
	AND salary_in_usd >= 300000
;

/*
2. Вивести всіх співробітників, 
які в 2023 отримували з/п більшу за $300тис. 
та не працювали в великих компаніях 
*/

SELECT *
FROM salaries
WHERE 1=1
	AND year = 2023
	AND salary_in_usd >= 300000
	AND company_size != 'L'
;

/*
3. Чи є співробітники, які
працювали на Українську компанію 
повністю віддалено?
*/

SELECT *
FROM salaries
WHERE 1=1
	AND remote_ratio = 100
	AND company_location = 'UA'
;

/*
4. Вивести всіх співробітників, 
які в 2023 році 
працюючи в Німеччині (company_location = 'DE') 
отримували з/п більшу за $100тис.
*/

SELECT *
FROM salaries
WHERE 1=1
	AND year = 2023
	AND salary_in_usd >= 100000
	AND company_location = 'DE'
;
	
/*
5. Доопрацювати попередній запит:
Вивести тільки ТОП 5 співробітників 
за рівнем з/п з попередньої таблиці
*/

SELECT *
FROM salaries
WHERE 1=1
	AND year = 2023
	AND salary_in_usd >= 100000
	AND company_location = 'DE'
ORDER BY salary_in_usd DESC
LIMIT 5;

/*
6. Додати в попередню таблицю окрім 
спеціалістів з Німеччини спеціалістів з Канади (CA).
*/

SELECT *
FROM salaries
WHERE 1=1
	AND year = 2023
	AND salary_in_usd >= 100000
	AND (company_location = 'DE'
	OR company_location = 'CA')
ORDER BY salary_in_usd DESC
LIMIT 5;

/*
7. Надати перелік країн, в яких 
в 2021 році 
спеціалісти "ML Engineer" та "Data Scientist"
отримувати з/п в діапазоні між $50тис і $100тис
*/

SELECT DISTINCT company_location
FROM salaries
WHERE 1=1
	AND year = 2021
	AND (job_title = 'ML Engineer'
	OR job_title = 'Data Scientist')
	AND salary_in_usd BETWEEN 50000 AND 100000
;

/*
8. Порахувати кількість спеціалістів,
які працюючи в середніх компаніях 
(company_size = M) 
та в великих компаніях 
(company_size = L)
працювали віддалено 
(remote_ratio=100 або remote_ratio=50). 
Є багато різних варіантів прописання таких фільтрів,
доречно експерементувати.
*/

SELECT COUNT(year)
FROM salaries
WHERE 1=1
	AND company_size IN ('M', 'L')
	AND remote_ratio NOT IN (0)
;

/*
9. Вивести кількість країн, які починаються на "С"
*/

SELECT COUNT(DISTINCT company_location)
FROM salaries
WHERE company_location LIKE 'C%';

/*
10. Вивести професії, назви яких 
не складаються з трьох слів
*/

SELECT DISTINCT job_title
FROM salaries
WHERE job_title NOT LIKE '% % %' -- цей запит не поверне професії, які складаються з 4х слів

-- Варіант вирішення з врахуванням 4х слів і більше:	
SELECT DISTINCT job_title 
FROM salaries
WHERE LENGTH (job_title) - LENGTH(REPLACE(job_title,' ','')) != 2 -- всі професії, в назвах яких НЕ 2 знаки пробілу
GROUP BY 1;
