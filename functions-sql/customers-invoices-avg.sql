SELECT customers.FirstName, customers.LastName, avg(Total) AS 'InvoicesAverage'
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.CustomerId
ORDER BY customers.FirstName ASC