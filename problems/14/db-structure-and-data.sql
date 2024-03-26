# Problem:
# Need to generate quizzes

# Solution:
# Runtime ~8.7 seconds

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    SET @i = 0;

    WHILE @i < 10000 DO
        INSERT INTO `quizzes` (`category_id`,`priority`)
        SELECT `id`,@i
        FROM `categories`;
        SET @i = @i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();

# Problem:
# Need to generate quiz localizations

# Solution:
# Runtime ~0.7 seconds

INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'quiz','quiz_question',UUID(),UUID(),UUID(),UUID(),UUID()
FROM `quizzes`;

# Problem:
# Need to generate quiz_answers

# Solution:
# Runtime ~1.4 seconds

INSERT INTO `quiz_answers` (`quiz_id`,`is_correct`)
SELECT `id`,0
FROM `quizzes`;

INSERT INTO `quiz_answers` (`quiz_id`,`is_correct`)
SELECT `id`,1
FROM `quizzes`;

# Problem:
# Need to generate quiz_answers localizations

# Solution:
# Runtime ~1.3 seconds

INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'quiz','quiz_answer',UUID(),UUID(),UUID(),UUID(),UUID()
FROM `quiz_answers`;

# Problem:
# Need to generate millions of quiz_user_answers

# Solution:
# Runtime ~130 seconds

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    SET @i = 0;

    WHILE @i < 20 DO
        INSERT INTO `quiz_user_answers` (`user_id`,`quiz_answer_id`,`thinking_seconds`,`used_hints`,`created_at`)
        SELECT
            FLOOR(RAND() * 1000000) + 1,
            `id`,
            FLOOR(RAND() * 60) + 5,
            FLOOR(RAND() * 3),
            TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, '2022-01-01 00:00:00', '2023-12-31 23:59:59')), '2022-01-01 00:00:00')
        FROM `quiz_answers`
        ORDER BY RAND() LIMIT 100000;
        SET @i = @i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();