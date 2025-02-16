WITH RankedSalaries AS (
    SELECT 
        e.departmentId, 
        e.name AS Employee, 
        e.salary, 
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
)
SELECT 
    d.name AS Department,
    r.Employee,
    r.salary
FROM RankedSalaries r
JOIN Department d ON r.departmentId = d.id
WHERE r.salary_rank <= 3
ORDER BY r.departmentId, r.salary DESC;
