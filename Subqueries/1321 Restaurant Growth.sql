WITH DailyTotals AS (
    SELECT
        visited_on,
        SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT
    a.visited_on,
    SUM(b.total_amount) AS amount,
    ROUND(SUM(b.total_amount) / 7, 2) AS average_amount
FROM DailyTotals a
JOIN DailyTotals b
    ON b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on
WHERE a.visited_on >= (SELECT MIN(visited_on) FROM DailyTotals) + INTERVAL 6 DAY
GROUP BY a.visited_on
ORDER BY a.visited_on;