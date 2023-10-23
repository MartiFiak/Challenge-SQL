SELECT FirstName || ' ' || UPPER(LastName) AS 'FullName', SUM(invoices.Total) AS "AllInvoices"
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY invoices.CustomerId
HAVING sum(invoices.Total) > 38
ORDER BY FullName ASC
