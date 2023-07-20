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
