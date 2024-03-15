# Runtime ~22 seconds
SELECT COUNT(user_id)
FROM `transactions`
WHERE product_id IN ('subscription.week', 'subscription.month') AND user_id IN (
    SELECT user_id
    FROM transactions
    WHERE cancelled_at IS NULL
    GROUP BY user_id
    HAVING COUNT(product_id IN ('subscription.week', 'subscription.month')) > 1
)