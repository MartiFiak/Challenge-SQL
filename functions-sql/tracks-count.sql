SELECT genres.Name, count(TrackId) AS 'NumberOfTracks'
FROM tracks
INNER JOIN genres ON tracks.GenreId = genres.GenreId
GROUP BY genres.Name