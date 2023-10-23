SELECT FirstName, LastName, strftime('%Y', HireDate) - BirthDate AS 'ApproximateAge'
FROM employees
ORDER BY ApproximateAge ASC