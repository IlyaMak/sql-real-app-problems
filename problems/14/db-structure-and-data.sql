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