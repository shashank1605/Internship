CREATE DATABASE Operators
USE Operators

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    price DECIMAL(10, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT
);

INSERT INTO products (product_id, product_name, price, created_on, stock) VALUES
(1, 'computer', 15000.00, '2024-01-15', 50),
(2, 'camera', 9000.00, '2024-02-20', 30),
(3, 'router', 2000.00, '2024-03-10', 20),
(4, 'harddisk', 1200.00, '2024-04-05', 10),
(5, 'Laptop', 50000.00, '2024-05-15', 5);

SELECT SUM(price) AS total_revenue
FROM products;

SELECT *
FROM products
WHERE price % 3 = 0;

SELECT product_id, product_name, price, 
       price - (SELECT AVG(price) FROM products) AS price_difference
FROM products;
