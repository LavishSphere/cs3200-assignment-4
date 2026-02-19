/*
Query 6: What are the names of all artists who performed MPEG (video or audio) tracks in either the "Brazilian Music" or the "Grunge" playlists?
*/

SELECT DISTINCT 
    ar.Name
FROM artists AS ar
JOIN albums AS al ON ar.ArtistId = al.ArtistId
JOIN tracks AS t ON al.AlbumId = t.AlbumId
JOIN media_types AS mt ON t.MediaTypeId = mt.MediaTypeId
JOIN playlist_track AS pt ON t.TrackId = pt.TrackId
JOIN playlists AS p ON pt.PlaylistId = p.PlaylistId
WHERE (mt.Name LIKE '%MPEG%')
  AND (p.Name = 'Brazilian Music' OR p.Name = 'Grunge')
  AND ar.Name IS NOT NULL;
