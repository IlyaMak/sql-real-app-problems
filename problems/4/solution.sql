# Runtime ~1.3 seconds
SELECT COUNT(*) AS Count, MONTH(created_at)
FROM users
GROUP BY MONTH(created_at)
ORDER BY Count DESC LIMIT 1