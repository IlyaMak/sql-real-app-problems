# Runtime ~1.2 seconds
SELECT COUNT(*), MONTH(created_at) FROM users GROUP BY MONTH(created_at)