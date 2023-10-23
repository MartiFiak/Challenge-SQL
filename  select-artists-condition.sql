SELECT artists.Name
FROM artists
INNER JOIN albums ON artists.ArtistId = albums.ArtistId
GROUP BY artists.Name
HAVING COUNT(AlbumId) = 4 OR COUNT(AlbumId) > 4
ORDER BY artists.Name DESC
