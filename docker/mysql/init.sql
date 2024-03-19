CREATE DATABASE IF NOT EXISTS sql_app;
USE sql_app;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    language CHAR(2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS transactions (
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

CREATE TABLE IF NOT EXISTS categories (
    id INT NOT NULL AUTO_INCREMENT,
    priority INT NOT NULL,
    name_be VARCHAR(255) NOT NULL,
    name_cz VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    name_lv VARCHAR(255) NOT NULL,
    name_pl VARCHAR(255) NOT NULL,
    description_be VARCHAR(255) NOT NULL,
    description_cz VARCHAR(255) NOT NULL,
    description_en VARCHAR(255) NOT NULL,
    description_lv VARCHAR(255) NOT NULL,
    description_pl VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)
CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS localizations (
    id INT NOT NULL AUTO_INCREMENT,
    be VARCHAR(255) NOT NULL,
    cz VARCHAR(255) NOT NULL,
    en VARCHAR(255) NOT NULL,
    lv VARCHAR(255) NOT NULL,
    pl VARCHAR(255) NOT NULL,
    child_id INT NOT NULL,
    PRIMARY KEY (id)
)
CHARSET=utf8 COLLATE=utf8_unicode_ci;
