# Runtime ~2.1 seconds
SELECT
    SUM(case
            WHEN store = 'appstore' THEN price * 0.7
            WHEN store = 'gooogleplay' THEN price * 0.85
            ELSE price
        END
    ) AS sum_without_comissions,
    YEAR(created_at),
    product_id
FROM `transactions`
WHERE product_id IN('product1', 'product2')
GROUP BY YEAR(created_at), product_id