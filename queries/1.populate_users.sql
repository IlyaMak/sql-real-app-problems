# Problem:
# Need to generate millions of users

# Solution:

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    # Dynamic query with prepared statement is 2x slower than the current solution
    DECLARE i INT DEFAULT 0;
    DECLARE createdAt1 DATETIME;
    DECLARE updatedAt1 DATETIME;
    DECLARE createdAt2 DATETIME;
    DECLARE updatedAt2 DATETIME;
    DECLARE createdAt3 DATETIME;
    DECLARE updatedAt3 DATETIME;
    DECLARE createdAt4 DATETIME;
    DECLARE updatedAt4 DATETIME;
    DECLARE createdAt5 DATETIME;
    DECLARE updatedAt5 DATETIME;

    WHILE i < 200000 DO
        SET @initialDate = '2022-01-01 00:00:00';
        SET @finalDate = '2023-12-31 23:59:59';
        SET @mailDomain = '@example.com';
        SET createdAt1 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @initialDate, @finalDate)), @initialDate);
        SET updatedAt1 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt1, @finalDate)), createdAt1);
        SET createdAt2 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @initialDate, @finalDate)), @initialDate);
        SET updatedAt2 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt2, @finalDate)), createdAt2);
        SET createdAt3 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @initialDate, @finalDate)), @initialDate);
        SET updatedAt3 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt3, @finalDate)), createdAt3);
        SET createdAt4 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @initialDate, @finalDate)), @initialDate);
        SET updatedAt4 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt4, @finalDate)), createdAt4);
        SET createdAt5 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @initialDate, @finalDate)), @initialDate);
        SET updatedAt5 = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, createdAt5, @finalDate)), createdAt5);

        INSERT INTO `users` (`name`,`email`,`password`,`language`,`created_at`,`updated_at`)
        VALUES
        (
            LEFT(UUID(), 10 + RAND() * 20),
            CONCAT(UUID(), @mailDomain),
            LEFT(UUID(), 8 + RAND() * 16),
            ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
            createdAt1,
            updatedAt1
        ),
        (
           LEFT(UUID(), 10 + RAND() * 20),
           CONCAT(UUID(), @mailDomain),
           LEFT(UUID(), 8 + RAND() * 16),
           ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
           createdAt2,
           updatedAt2
        ),
        (
            LEFT(UUID(), 10 + RAND() * 20),
            CONCAT(UUID(), @mailDomain),
            LEFT(UUID(), 8 + RAND() * 16),
            ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
            createdAt3,
            updatedAt3
        ),
        (
            LEFT(UUID(), 10 + RAND() * 20),
            CONCAT(UUID(), @mailDomain),
            LEFT(UUID(), 8 + RAND() * 16),
            ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
            createdAt4,
            updatedAt4
        ),
        (
            LEFT(UUID(), 10 + RAND() * 20),
            CONCAT(UUID(), @mailDomain),
            LEFT(UUID(), 8 + RAND() * 16),
            ELT(FLOOR(RAND() * 5) + 1, 'be', 'cz', 'en', 'lv', 'pl'),
            createdAt5,
            updatedAt5
        );
        SET i = i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();