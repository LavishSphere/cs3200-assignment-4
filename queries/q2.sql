/*
Query 2: What are the names of each album and the artist who created it?
*/

SELECT 
    a.Title, 
    r.Name
FROM albums AS a
JOIN artists AS r ON a.ArtistId = r.ArtistId
WHERE a.Title IS NOT NULL 
  AND r.Name IS NOT NULL;
