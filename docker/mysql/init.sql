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
