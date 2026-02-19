/*
Query 5: What are the names of the artists who made an album containing the substring "symphony" in the album title?
*/

SELECT DISTINCT 
    r.Name
FROM artists AS r
JOIN albums AS a ON r.ArtistId = a.ArtistId
WHERE a.Title LIKE '%symphony%'
  AND r.Name IS NOT NULL
  AND a.Title IS NOT NULL;
