SELECT FirstName, LastName, Country,
CASE
    WHEN Country = 'Brazil' OR Country = 'Canada' OR Country = 'USA' OR Country = 'Argentina' OR Country = 'Chile' THEN 'America'
    WHEN Country = 'Australia' THEN 'Oceania'
    WHEN Country = 'India' THEN 'Asia'
    ELSE 'Europe'
END AS 'Continent'
FROM customers