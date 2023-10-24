SELECT employees.EmployeeId, employees.FirstName || ' ' || employees.LastName AS 'EmployeeName', empl.FirstName || ' ' || empl.LastName AS 'ReportsTo'
FROM employees
LEFT JOIN main.employees empl ON employees.ReportsTo = empl.EmployeeId
