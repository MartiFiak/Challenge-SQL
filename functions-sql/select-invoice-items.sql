SELECT invoices.InvoiceId, Name AS 'InvoiceItem', tracks.UnitPrice
FROM invoice_items
INNER JOIN tracks ON invoice_items.TrackId = tracks.TrackId
INNER JOIN invoices ON invoice_items.InvoiceId = invoices.InvoiceId
WHERE invoices.InvoiceId = '10'
ORDER BY tracks.Name