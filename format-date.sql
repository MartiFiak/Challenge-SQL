SELECT EmployeeId, LastName, FirstName, HireDate AS 'HireFrenchDate'
FROM employees
WHERE date(HireFrenchDate )
ORDER BY HireDate ASC