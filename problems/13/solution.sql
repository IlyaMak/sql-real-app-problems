# Runtime ~0.001 seconds
INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'category','name',`name_be`,`name_cz`,`name_en`,`name_lv`,`name_pl`
FROM `categories`
LIMIT 5;

# Runtime ~0.002 seconds
INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'category','name',`name_be`,`name_cz`,`name_en`,`name_lv`,`name_pl`
FROM `categories`
LIMIT 5 OFFSET 5;

# Runtime ~0.002 seconds
INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'category','description',`description_be`,`description_cz`,`description_en`,`description_lv`,`description_pl`
FROM `categories`
LIMIT 5;

# Runtime ~0.003 seconds
INSERT INTO `localizations` (`child_id`,`entity`,`key_name`,`be`,`cz`,`en`,`lv`,`pl`)
SELECT `id`,'category','description',`description_be`,`description_cz`,`description_en`,`description_lv`,`description_pl`
FROM `categories`
LIMIT 5 OFFSET 5;

# Runtime ~0.05 seconds
ALTER TABLE `categories`
DROP `name_be`,
DROP `name_cz`,
DROP `name_en`,
DROP `name_lv`,
DROP `name_pl`,
DROP `description_be`,
DROP `description_cz`,
DROP `description_en`,
DROP `description_lv`,
DROP `description_pl`;