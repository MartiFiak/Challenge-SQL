DELETE FROM tracks
WHERE AlbumId = (
    SELECT AlbumId
    FROM albums
    WHERE Title = 'Facelift'
)