SELECT A.id
FROM Weather A
JOIN Weather B
ON A.recordDate = DATE_ADD(B.recordDate, INTERVAL 1 DAY)
WHERE A.temperature > B.temperature;
