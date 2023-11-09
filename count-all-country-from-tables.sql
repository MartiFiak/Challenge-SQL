SELECT Country, COUNT(*) AS "Total",

    SUM(CASE
        WHEN Source = 'E' THEN 1 ELSE 0 END
    ) AS "Employees",

    SUM(CASE
        WHEN Source = 'C' THEN 1 ELSE 0 END
    ) AS "Customers",

    SUM(CASE
        WHEN Source = 'I' THEN 1 ELSE 0 END
    ) AS "Invoices"

FROM (
         SELECT Country, 'E' as Source
         FROM employees
         UNION ALL
         SELECT Country, 'C' as Source
         FROM customers
         UNION ALL
         SELECT BillingCountry, 'I' as Source
         FROM invoices
     )
GROUP BY Country;