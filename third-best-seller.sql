SELECT employees.LastName || ' ' || employees.FirstName AS '3rd best seller'
FROM employees
WHERE EmployeeId = (
    SELECT EmployeeId
    FROM employees
    WHERE EmployeeId = 5
    )