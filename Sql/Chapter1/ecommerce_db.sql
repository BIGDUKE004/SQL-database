CREATE DATABASE Ecommerce_store;
CREATE TABLE users(
user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
full_name VARCHAR(50) NOT NULL,
userpassword VARCHAR(100) NOT NULL,
email VARCHAR(255) NOT NULL,
is_logged_in BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE product(
product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100) NOT NULL,
product_description VARCHAR(500) NOT NULL,
product_quantity BIGINT NOT NULL,
product_price DECIMAL(10, 2) NOT NULL,
expiry_date DATE NOT NULL
);

CREATE TABLE orders(
    order_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
    
);    
    SELECT 
    u.user_name,
    p.product_name
	FROM orders o
	JOIN users u
		ON o.user_id = u.user_id
	JOIN product p
		ON o.product_id = p.product_id;


