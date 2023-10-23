SELECT EmployeeId, LastName, FirstName, STRFTIME('%d/%m/%Y', HireDate) AS HireFrenchDate
FROM employees
ORDER BY HireDate ASC;