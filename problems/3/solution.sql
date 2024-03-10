# Runtime ~1.3 seconds
SELECT COUNT(*), YEAR(created_at) FROM users GROUP BY YEAR(created_at)