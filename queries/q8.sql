/*
Query 8:  What is the total length of each playlist in hours? List the playlist id and name of only those playlists that are longer than 2 hours, along with the length in hours rounded to two decimals.
*/

SELECT 
    p.PlaylistId, 
    p.Name, 
    ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS TotalHours
FROM playlists AS p
JOIN playlist_track AS pt ON p.PlaylistId = pt.PlaylistId
JOIN tracks AS t ON pt.TrackId = t.TrackId
WHERE p.Name IS NOT NULL
GROUP BY p.PlaylistId, p.Name
HAVING (SUM(t.Milliseconds) / 3600000.0) > 2;
