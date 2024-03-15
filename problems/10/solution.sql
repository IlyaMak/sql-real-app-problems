# Runtime ~20 seconds
SELECT COUNT(t.user_id) from (
    SELECT user_id
        FROM transactions
        WHERE cancelled_at IS NULL and product_id  IN ('subscription.week', 'subscription.month')
        GROUP BY user_id
        HAVING count(user_id) > 1
) as t