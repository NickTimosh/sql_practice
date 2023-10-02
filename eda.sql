-- Select a few rows to check (no order) ---------------------------------------
SELECT count(*) FROM salaries;

--  Count missing values ----------------------------------------------------
SELECT 
    COUNT(*) - COUNT(salary_in_usd) AS missing
FROM salaries;

-- A few words about data types ----------------------------------------------------

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

-- Exploring distributions for finding errors, outliers...

SELECT 
    remote_rate
    , COUNT(*)
FROM salaries -- for small number of discrete values

-- Generate series to create bins
...
    
-- More summary functions:
SELECT CORR(revenues,profits) AS rev_profits,
	   -- Correlation between revenues and assets
       CORR(revenues, assets) AS rev_assets,
       -- Correlation between revenues and equity
       CORR(revenues, equity) AS rev_equity 
  FROM fortune500;

-- Exploring categorical data and instractured text ----------------------------------------------------
SELECT category, count(*) FROM table GROUP BY 1 ORDER BY 2 DESC; -- mistakes? duplicates? errors?

-- change text data, regexp...

-- Data Science Market Data Exploration ----------------------------------------------------------------
