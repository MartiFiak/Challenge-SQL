SELECT artists.Name AS 'ArtistName', albums.Title AS 'AlbumName', tracks.Name AS 'TrackName', Round(tracks.Bytes / 1000000.0, 2) || ' MB' AS 'MegaBytes'
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
INNER JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE AlbumName = 'American Idiot'