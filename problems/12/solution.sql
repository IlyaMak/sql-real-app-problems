# Runtime ~24 seconds
SELECT ROUND(COUNT(t.user_id) * 100 / (SELECT COUNT(*) FROM `users`), 2) AS percentage FROM (
    SELECT DISTINCT users.id AS user_id
    FROM `users`
    JOIN `transactions`
    ON users.id = transactions.user_id
    WHERE users.created_at > transactions.created_at
) AS t