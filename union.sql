SELECT *
FROM salaries s;

-- union ---------------------------------------------

select 
	'min_salary'		as parameter
	, MIN(salary_in_usd) 	as value
from salaries s 

UNION

select 
	'max_salary'			as parameter
	, MAX(salary_in_usd) 		as value
from salaries s 
;

-----

select 
	'min_salary'		as parameter
	, MIN(salary_in_usd) 	as value
from salaries s 

union all 

select 
	'min_salary'		as parameter
	, MIN(salary_in_usd) 	as value
from salaries s;

-----

select 
	'min_salary'		as parameter
	, MIN(salary_in_usd) 	as value
from salaries s 

union

select 
	'min_salary'		as parameter
	, MIN(salary_in_usd) 	as value
from salaries s;

-- Intersect ---------------------------------------------

SELECT email
FROM Customer

INTERSECT

SELECT Email
FROM Employee
;

-----

SELECT email
FROM Customer

EXCEPT

SELECT Email
FROM Employee
;
