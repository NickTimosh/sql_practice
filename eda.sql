-- Select a few rows to check (no order) -------------
SELECT count(*) FROM salaries;

--  Count missing values -------------
SELECT 
    COUNT(*) - COUNT(salary_in_usd) AS missing
FROM salaries;

-- A few words about data types -------------

-- Summarizing and aggregating numeric data
-- Range: Min and Max
-- Variance var_samp
-- Standard deviation

-- Sammarize by group

SELECT 
  exp_level
, min(salary)
, avg(salary)
, max(salary)...
FROM salaries
GROUP BY 1;




