# Runtime ~20 seconds
SELECT COUNT(t.user_id) FROM (
    SELECT user_id
        FROM transactions
        WHERE cancelled_at IS NULL AND product_id IN ('subscription.week', 'subscription.month')
        GROUP BY user_id
        HAVING COUNT(user_id) > 1
) AS t