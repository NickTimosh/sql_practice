# запит без форматування

select * from salaries;

# запит з форматуванням та основними блоками

SELECT
      year
    , exp_level AS level
    , emp_type AS type
FROM 
    salaries
WHERE
    year != 2022
    AND exp_level = 'SE'
ORDER BY 
    year ASC
LIMIT 20;

# ТОП 5 з/п в сфері data science в 2023 році:

SELECT
    year
    , job_title
    , salary_in_usd
FROM 
    salaries
WHERE
    year = 2023
    AND job_title = 'Data Scientist'
ORDER BY salary_in_usd DESC
LIMIT 5;

# 👇 Рішення завдань для практики:

SELECT * FROM salaries LIMIT 10;

-- Вивести з/п спеціалістів ML Engineer в 2023 році

SELECT 
	job_title
	, year
	, salary_in_usd
FROM salaries
WHERE 
	job_title = 'ML Engineer'
	AND year = '2023'
ORDER BY 3 DESC;

/* Назвати країну (company_location), в якій зафіксована 
найменша з/п спеціаліста в сфері Data Scientist в 2023 році*/

SELECT 
	year
	, job_title
	, company_location AS country
	, salary_in_usd
FROM salaries
WHERE
	job_title = 'Data Scientist'
	AND year = '2023'
ORDER BY 4 ASC
LIMIT 1;

/* Вивести з/п українців (код країни UA), додати сортування 
за зростанням з/п */

SELECT
	salary_in_usd
FROM salaries
WHERE company_location = 'UA'
ORDER BY 1 ASC;

/* Вивести топ 5 з/п серед усіх спеціалістів, 
які працюють повністю віддалено (remote_ratio = 100) */

SELECT
	salary_in_usd
FROM salaries
WHERE 
	remote_ratio = 100
ORDER BY 1 DESC
LIMIT 5;

/* Згенерувати .csv файл з таблицею даних всіх спеціалістів, 
які в 2023 році мали з/п більшу за $100,000 і працювали в 
компаніях середнього розміру (company_size = 'M') */

SELECT *
FROM salaries
WHERE
	year = '2023'
	AND salary_in_usd > 100000
	AND company_size = 'M';
