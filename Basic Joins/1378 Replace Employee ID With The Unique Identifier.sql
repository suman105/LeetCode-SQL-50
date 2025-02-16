SELECT U.unique_id, E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS U
ON U.id = E.id;
