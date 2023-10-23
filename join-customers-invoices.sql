SELECT FirstName, LastName, Company, Total AS 'InvoiceTotalPrice'
FROM invoices
INNER JOIN customers ON customers.CustomerId = invoices.CustomerId
WHERE Company IS NOT NULL
