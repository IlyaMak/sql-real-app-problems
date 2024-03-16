# Runtime ~6 seconds
SELECT COUNT(t.user_id), t.created_year
FROM (
     SELECT user_id, YEAR(created_at) as created_year
     FROM transactions
     WHERE product_id IN ('product1', 'product2')
     GROUP BY user_id, YEAR(created_at)
     HAVING COUNT(user_id) > 1
) as t
GROUP BY t.created_year