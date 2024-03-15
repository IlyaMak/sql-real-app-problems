# Runtime ~22 seconds
SELECT COUNT(user_id) AS users, YEAR(created_at) AS year, product_id
FROM `transactions`
WHERE product_id IN ('product1', 'product2') AND user_id IN (
    SELECT user_id
    FROM transactions
    GROUP BY user_id
    HAVING SUM(CASE WHEN product_id IN ('product1', 'product2') THEN 1 ELSE 0 END) > 1
)
GROUP BY YEAR(created_at), product_id