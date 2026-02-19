/*
Query 7:  How many artists published at least 10 MPEG tracks?
*/

SELECT COUNT(*) 
FROM (
    SELECT ar.ArtistId
    FROM artists AS ar
    JOIN albums AS al ON ar.ArtistId = al.ArtistId
    JOIN tracks AS t ON al.AlbumId = t.AlbumId
    JOIN media_types AS mt ON t.MediaTypeId = mt.MediaTypeId
    WHERE mt.Name LIKE '%MPEG%'
      AND ar.Name IS NOT NULL
    GROUP BY ar.ArtistId
    HAVING COUNT(t.TrackId) >= 10
) AS SubQuery;
