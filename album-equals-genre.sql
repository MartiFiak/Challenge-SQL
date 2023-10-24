SELECT Name
FROM albums
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
WHERE Name =(
    SELECT genres.Name
    FROM genres
          )
