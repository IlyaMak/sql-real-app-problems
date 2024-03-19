# Runtime ~0.01 seconds
SELECT transactions.id, transactions.order_id, transactions.transaction_id, transactions.user_id, transactions.store, transactions.price, transactions.product_id, transactions.cancelled_at, transactions.created_at, users.email, users.name
FROM transactions
INNER JOIN users
ON transactions.user_id = users.id
WHERE DATE(transactions.created_at) = '2023-01-01'