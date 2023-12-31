SELECT *
FROM Customer c 

SELECT *
FROM Invoice i 

SELECT *
FROM InvoiceLine il 

SELECT *
FROM Track t 

SELECT *
FROM Genre g 

-- Join ----------------------------------------------------
	
SELECT
	c.CustomerId 
	, c.FirstName 
	, c.LastName 
	, COUNT(DISTINCT g.GenreId) AS nmb_genres
FROM InvoiceLine il 
LEFT JOIN Track t ON il.TrackId = t.TrackId 	
LEFT JOIN Genre g ON t.GenreId = g.GenreId 
LEFT JOIN Invoice i ON il.InvoiceId = i.InvoiceId
LEFT JOIN Customer c ON i.CustomerId = c.CustomerId 
GROUP BY 1,2,3
HAVING COUNT(DISTINCT g.GenreId) >= 3
;

-- CTE ----------------------------------------------------

WITH customers AS (

	SELECT
		c.CustomerId 
		, c.FirstName 
		, c.LastName 
		, COUNT(DISTINCT g.GenreId) AS nmb_genres
	FROM InvoiceLine il 
	LEFT JOIN Track t ON il.TrackId = t.TrackId 	
	LEFT JOIN Genre g ON t.GenreId = g.GenreId 
	LEFT JOIN Invoice i ON il.InvoiceId = i.InvoiceId
	LEFT JOIN Customer c ON i.CustomerId = c.CustomerId 
	GROUP BY 1,2,3
	HAVING COUNT(DISTINCT g.GenreId) >= 3
)

, invoices AS (

	SELECT *
	FROM Invoice i 
	WHERE InvoiceDate BETWEEN '2008-01-01' AND '2009-01-01'
)

SELECT *
FROM customers c
LEFT JOIN invoices i ON c.CustomerId = i.CustomerId 
WHERE i.CustomerId IS NULL;
