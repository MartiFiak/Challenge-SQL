SELECT InvoiceId, round(avg(tracks.UnitPrice), 2) AS 'Average Price', floor(sum(Milliseconds*0.001)) AS 'Track Total Time', round(round(avg(tracks.UnitPrice), 2)/floor(sum(Milliseconds*0.001)), 5) || '€' AS 'Price by second'
FROM tracks
INNER JOIN main.invoice_items ii on tracks.TrackId = ii.TrackId
GROUP BY InvoiceId
