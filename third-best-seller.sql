SELECT employees.LastName || ' ' || employees.FirstName AS '3rd best seller'
FROM employees join main.customers c on employees.EmployeeId = c.SupportRepId
ORDER BY SupportRepId DESC
LIMIT 1