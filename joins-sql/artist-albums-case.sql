SELECT Name, count(albums.AlbumId) AS 'NbAlbums',
CASE
    WHEN count(albums.AlbumId) = 1 THEN 'Unproductive'
    WHEN count(albums.AlbumId) > 1 AND count(albums.AlbumId) < 10 THEN 'Productive'
    WHEN count(albums.AlbumId) >= 10 THEN 'Very Productive'
END
AS 'IsProductive'
FROM artists
INNER JOIN albums ON artists.ArtistId = albums.ArtistId
GROUP BY albums.ArtistId
LIMIT 100