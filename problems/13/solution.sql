# Runtime ~0.001 seconds
INSERT INTO `localizations` (`be`,`cz`,`en`,`lv`,`pl`,`child_id`)
SELECT `name_be`,`name_cz`,`name_en`,`name_lv`,`name_pl`,`id`
FROM `categories`
LIMIT 5;

# Runtime ~0.002 seconds
INSERT INTO `localizations` (`be`,`cz`,`en`,`lv`,`pl`,`child_id`)
SELECT `name_be`,`name_cz`,`name_en`,`name_lv`,`name_pl`,`id`
FROM `categories`
LIMIT 5 OFFSET 5;

# Runtime ~0.002 seconds
INSERT INTO `localizations` (`be`,`cz`,`en`,`lv`,`pl`,`child_id`)
SELECT `description_be`,`description_cz`,`description_en`,`description_lv`,`description_pl`,`id`
FROM `categories`
LIMIT 5;

# Runtime ~0.003 seconds
INSERT INTO `localizations` (`be`,`cz`,`en`,`lv`,`pl`,`child_id`)
SELECT `description_be`,`description_cz`,`description_en`,`description_lv`,`description_pl`,`id`
FROM `categories`
LIMIT 5 OFFSET 5;