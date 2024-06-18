CREATE DATABASE numeric;
USE numeric;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value INT
);
INSERT INTO numbers (value) VALUES (12), (18), (24), (30), (NULL);

SELECT AVG(value) AS average_value FROM numbers;

SELECT COUNT(value) AS count_values FROM numbers;

SELECT SQRT(144) AS square_root;

SELECT ROUND(3.14159, 2) AS rounded_number;

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    revenue DECIMAL(10, 2)
);
INSERT INTO sales (product, revenue) VALUES
('X', 200.75),
('Y', 250.50),
('X', 210.00),
('Y', 275.30);
SELECT product, MIN(revenue) AS min_revenue, MAX(revenue) AS max_revenue
FROM sales
GROUP BY product;

SELECT POWER(2, 5) AS power_value;
