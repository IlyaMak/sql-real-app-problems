# Problem:
# Need to generate millions of transactions

# Solution:
# Runtime ~240 seconds

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE cancelledAt VARCHAR(21);
    DECLARE createdAt DATETIME;
    DECLARE productId VARCHAR(18);

    WHILE i < 2000 DO
        SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
        SET cancelledAt =
            CONCAT(
                '"',
                TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt),
                '"'
            );
        SET productId = ELT(FLOOR(RAND() * 4) + 1, 'subscription.week', 'subscription.month', 'product1', 'product2');
        SET cancelledAt = IF(productId IN('product1', 'product2'), 'NULL', cancelledAt);
        SET @query =
                'INSERT INTO `transactions` (`order_id`,`transaction_id`,`user_id`,`store`,`price`,`product_id`,`cancelled_at`,`created_at`)
                VALUES ';
        SET @j = 0;

        WHILE @j < 1000 DO
            SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
            SET cancelledAt =
                CONCAT(
                    '"',
                    TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt),
                    '"'
                );
            SET cancelledAt = IF(productId IN('product1', 'product2'), 'NULL', cancelledAt);
            SET @query = CONCAT(
                @query,
                IF(@j = 0, '', ','),
                '(
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
            SET @j = @j + 1;
        END WHILE;

        PREPARE myquery FROM @query;
        EXECUTE myquery;
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();