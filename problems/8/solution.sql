# Runtime ~2.9 seconds
SELECT
    SUM(CASE
            WHEN store = 'appstore' THEN price * 0.7 * (
                FLOOR(TIMESTAMPDIFF(
                    DAY,
                    created_at,
                    CASE
                        WHEN cancelled_at = NULL THEN '2023-12-31 23:59:59'
                        ELSE cancelled_at
                    END
                ) / CASE
                    WHEN product_id = 'subscription.week' THEN 7
                    WHEN product_id = 'subscription.month' THEN 30
                END))
            WHEN store = 'googleplay' THEN price * 0.85  * (
                FLOOR(TIMESTAMPDIFF(
                    DAY,
                    created_at,
                    CASE
                        WHEN cancelled_at = NULL THEN '2023-12-31 23:59:59'
                        ELSE cancelled_at
                    END
                ) / CASE
                    WHEN product_id = 'subscription.week' THEN 7
                    WHEN product_id = 'subscription.month' THEN 30
                END))
            ELSE price  * (
                FLOOR(TIMESTAMPDIFF(
                    DAY,
                    created_at,
                    CASE
                        WHEN cancelled_at = NULL THEN '2023-12-31 23:59:59'
                        ELSE cancelled_at
                    END
                ) / CASE
                  WHEN product_id = 'subscription.week' THEN 7
                  WHEN product_id = 'subscription.month' THEN 30
            END))
    END) AS sum_without_comissions,
    YEAR(created_at), product_id
FROM `transactions`
WHERE product_id IN('subscription.week', 'subscription.month')
GROUP BY YEAR(created_at), product_id