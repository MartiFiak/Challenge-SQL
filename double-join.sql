SELECT DISTINCT tracks.Name AS 'TrackName', playlists.Name AS 'PlaylistName'
FROM playlist_track
INNER JOIN main.tracks ON tracks.TrackId = playlist_track.TrackId
INNER JOIN main.playlists ON playlists.PlaylistId = playlist_track.PlaylistId
WHERE GenreId = 19
LIMIT 100
