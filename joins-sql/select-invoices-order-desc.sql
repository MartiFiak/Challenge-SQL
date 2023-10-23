SELECT *
FROM invoices
WHERE BillingCity IN ('Bordeaux', 'Paris', 'Stuttgart')
ORDER BY Total DESC