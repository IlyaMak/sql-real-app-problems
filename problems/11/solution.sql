# Runtime ~18 seconds
SELECT ROUND(AVG(t.user_spending), 2) AS average_user_spending, t.year FROM (
    SELECT user_id, YEAR(created_at) AS year, SUM(
        CASE
            WHEN product_id IN ('subscription.week', 'subscription.month') THEN
                price * (FLOOR(TIMESTAMPDIFF(
                    DAY,
                    created_at,
                    CASE
                        WHEN cancelled_at IS NULL THEN '2023-12-31 23:59:59'
                        ELSE cancelled_at
                    END
                ) / CASE
                    WHEN product_id = 'subscription.week' THEN 7
                    WHEN product_id = 'subscription.month' THEN 30
                END) + 1)
            ELSE price
        END
    ) AS user_spending
    FROM `transactions`
    GROUP BY user_id, YEAR(created_at)
) AS t
GROUP BY t.year