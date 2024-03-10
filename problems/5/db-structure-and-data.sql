# Problem:
# Need to generate millions of transactions

# Solution:

CREATE TABLE transactions (
    id INT NOT NULL AUTO_INCREMENT,
    order_id VARCHAR(255) NOT NULL,
    transaction_id VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    store ENUM('appstore', 'googleplay', 'aptoide', 'f-droid') NOT NULL,
    price INT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    cancelled_at DATETIME,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE cancelledAt VARCHAR(21);
    DECLARE createdAt DATETIME;
    DECLARE productId VARCHAR(18);

    WHILE i < 1000 DO
        SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
        SET cancelledAt =
            CONCAT(
                '"',
                TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt),
                '"'
            );
        SET productId = ELT(FLOOR(RAND() * 4) + 1, 'subscription.week', 'subscription.month', 'product1', 'product2');
        SET cancelledAt = IF(productId IN('product1', 'product2'), 'NULL', cancelledAt);        SET @query =
            CONCAT(
                'INSERT INTO `transactions` (`order_id`,`transaction_id`,`user_id`,`store`,`price`,`product_id`,`cancelled_at`,`created_at`)
                VALUES (
                    UUID(),
                    UUID(),
                    FLOOR(RAND() * 2000000) + 1,
                    ELT(FLOOR(RAND() * 4) + 1, "appstore", "googleplay", "aptoide", "f-droid"),
                    FLOOR(RAND() * 30) + 1,"',
                    productId,
                    '",',
                    cancelledAt,
                    ',"',
                    createdAt,
                '")'
            );

        WHILE j < 999 DO
            SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
            SET cancelledAt =
                CONCAT(
                    '"',
                    TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt),
                    '"'
                );
            SET productId = ELT(FLOOR(RAND() * 4) + 1, 'subscription.week', 'subscription.month', 'product1', 'product2');
            SET cancelledAt = IF(productId IN('product1', 'product2'), 'NULL', cancelledAt);
            SET @query = CONCAT(
                @query,
                ',(
                    UUID(),
                    UUID(),
                    FLOOR(RAND() * 2000000) + 1,
                    ELT(FLOOR(RAND() * 4) + 1, "appstore", "googleplay", "aptoide", "f-droid"),
                    FLOOR(RAND() * 30) + 1,"',
                    productId,
                    '",',
                    cancelledAt,
                    ',"',
                    createdAt,
                '")'
            );
            SET j = j + 1;
        END WHILE;

        PREPARE myquery FROM @query;
        EXECUTE myquery;
        SET j = 0;
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();