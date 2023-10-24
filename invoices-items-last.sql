SELECT Name
FROM invoice_items
INNER JOIN tracks ON invoice_items.TrackId = tracks.TrackId
WHERE 'Name' = (
    SELECT tracks.Name
    FROM tracks
    LIMIT 1
          )