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


