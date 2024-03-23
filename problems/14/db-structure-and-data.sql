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
# Runtime ~1.7 seconds

DROP PROCEDURE IF EXISTS generate_data;

DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
    DECLARE limitValue INT DEFAULT 0;
    DECLARE offsetValue INT DEFAULT 0;
    SET @i = 0;
    SET limitValue = 10000;
    SET offsetValue = 0;

    WHILE @i < 10 DO
        INSERT INTO `quiz_answers` (`quiz_id`,`is_correct`)
        SELECT `id`,0
        FROM `quizzes`
        LIMIT limitValue OFFSET offsetValue;

        INSERT INTO `quiz_answers` (`quiz_id`,`is_correct`)
        SELECT `id`,1
        FROM `quizzes`
        LIMIT limitValue OFFSET offsetValue;

        SET offsetValue = offsetValue + 10000;
        SET @i = @i + 1;
    END WHILE;
END$$
DELIMITER ;

CALL generate_data();

# Problem:
# Need to generate quiz_answers localizations

# Solution:
# Runtime ~1.3 seconds

INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'quiz','quiz_answer',UUID(),UUID(),UUID(),UUID(),UUID()
FROM `quiz_answers`;