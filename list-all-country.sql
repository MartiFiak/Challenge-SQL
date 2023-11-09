SELECT Country, COUNT(*) AS "Total"
FROM (
    SELECT Country
    FROM employees
    UNION ALL
    SELECT Country
    FROM customers
    UNION ALL
    SELECT BillingCountry
    FROM invoices
     )
GROUP BY Country