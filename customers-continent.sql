SELECT FirstName, LastName, Country,
CASE
    WHEN Country = 'Brazil' OR Country = 'Canada' OR Country = 'USA' THEN 'America'
    ELSE 'Europe'
END AS 'Continent'
FROM customers