SELECT * FROM Invoice i LIMIT 100;
SELECT * FROM InvoiceLine il LIMIT 100;
SELECT * FROM Track t LIMIT 100;
SELECT * FROM Album a LIMIT 100;
SELECT * FROM Artist a LIMIT 100;	

-- Inner Join
SELECT 
	t.TrackId 
	, t.Name 
	, a.Title 		AS album_title
	, a2.Name 
FROM Track t 
INNER JOIN Album a 	ON t.AlbumId = a.AlbumId  
INNER JOIN Artist a2 	ON a.ArtistId = a2.ArtistId 
WHERE a2.Name LIKE 'A%'
LIMIT 100
;
