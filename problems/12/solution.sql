# Runtime ~24 seconds (should not be improved by adding created_at indexes
# to both users and transactions tables, because it is a one-time use query)
SELECT ROUND(COUNT(t.user_id) * 100 / (SELECT COUNT(*) FROM `users`), 2) AS percentage FROM (
    SELECT DISTINCT users.id AS user_id
    FROM `users`
    INNER JOIN `transactions`
    ON users.id = transactions.user_id
    WHERE users.created_at > transactions.created_at
) AS t