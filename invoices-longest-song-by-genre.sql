SELECT ii.InvoiceId AS 'InvoiceId'
FROM invoices JOIN main.invoice_items ii on invoices.InvoiceId = ii.InvoiceId
JOIN main.tracks t on t.TrackId = ii.TrackId
WHERE Milliseconds = (
    SELECT max(Milliseconds)
    FROM tracks JOIN genres ON tracks.GenreId = genres.GenreId
    WHERE t.GenreId = genres.GenreId
    )
GROUP BY ii.InvoiceId

