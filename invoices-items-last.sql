SELECT Name
FROM invoice_items
INNER JOIN tracks ON invoice_items.TrackId = tracks.TrackId
WHERE Name = (
    SELECT tracks.Name
    FROM tracks
    INNER JOIN invoice_items ON tracks.TrackId = invoice_items.TrackId
    INNER JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
    ORDER BY InvoiceDate DESC
          )
LIMIT 1