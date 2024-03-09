# Problem:
# Need to generate millions of users

# Solution:

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE j INT DEFAULT 0;
    DECLARE createdAt DATETIME;
    DECLARE updatedAt DATETIME;

    WHILE i < 100 DO
        SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
        SET updatedAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt);
        SET @query =
            CONCAT(
                'INSERT INTO `users` (`name`,`email`,`password`,`language`,`created_at`,`updated_at`)
                VALUES (
                LEFT(UUID(), 10 + RAND() * 20),
                CONCAT(UUID(), "@example.com"),
                LEFT(UUID(), 8 + RAND() * 16),
                ELT(FLOOR(RAND() * 5) + 1, "be", "cz", "en", "lv", "pl"),"',
                createdAt,
                '","',
                updatedAt,
                '")'
            );

        WHILE j < 99 DO
            SET createdAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
            SET updatedAt = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt, '2023-12-31 23:59:59')), createdAt);
            SET @query = CONCAT(
                @query,
                ',(
                     LEFT(UUID(), 10 + RAND() * 20),
                     CONCAT(UUID(), "@example.com"),
                     LEFT(UUID(), 8 + RAND() * 16),
                     ELT(FLOOR(RAND() * 5) + 1, "be", "cz", "en", "lv", "pl"),"',
                     createdAt,
                    '","',
                     updatedAt,
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