# Problem:
# Need to generate millions of users

# Solution:

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE createdAt1 DATETIME;
    DECLARE updatedAt1 DATETIME;
    DECLARE createdAt2 DATETIME;
    DECLARE updatedAt2 DATETIME;

    WHILE i < 500000 DO
        SET createdAt1 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
        SET updatedAt1 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt1, '2023-12-31 23:59:59')), createdAt1);
        SET createdAt2 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00');
        SET updatedAt2 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt2, '2023-12-31 23:59:59')), createdAt2);

            INSERT INTO `users` (`name`,`email`,`password`,`language`,`created_at`,`updated_at`)
            VALUES (
                LEFT(UUID(), 10 + RAND() * 20),
                CONCAT(UUID(), '@example.com'),
                LEFT(UUID(), 8 + RAND() * 16),
                ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
                createdAt1,
                updatedAt1
            ),
            (
               LEFT(UUID(), 10 + RAND() * 20),
               CONCAT(UUID(), '@example.com'),
               LEFT(UUID(), 8 + RAND() * 16),
               ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
               createdAt2,
               updatedAt2
            );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();