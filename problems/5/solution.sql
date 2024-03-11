# Runtime ~5.8 seconds
SELECT SUM(price), DATE_FORMAT(created_at,'%Y-%m'), store
FROM `transactions`
GROUP BY DATE_FORMAT(created_at,'%Y-%m'), store