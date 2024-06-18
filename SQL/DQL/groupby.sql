CREATE DATABASE sales
USE sales

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    location VARCHAR(100)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    address VARCHAR(200)
);
INSERT INTO products (product_id, product_name, price, stock, location) VALUES
(1, 'SuperSound Headphones', 5000, 10, 'Mumbai'),
(2, 'HighRes Audio System', 15000, 20, 'Delhi'),
(3, 'Wireless Earbuds Pro', 25000, 15, 'Mumbai'),
(4, 'Studio Over-Ear Headphones', 35000, 5, 'Delhi'),
(5, 'Gaming Headset Pro', 45000, 8, 'Bangalore'),
(6, 'Ultimate Sound System', 55000, 12, 'Mumbai');



INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'Shashank', 25, 'Mumbai'),
(2, 'saketh', 30, 'Delhi'),
(3, 'koushik', 35, 'Mumbai'),
(4, 'adithya', 40, 'Delhi'),
(5, 'athmanathan', 45, 'Bangalore'),
(6, 'jaswanth', 50, 'Mumbai');


SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location;

SELECT 
CASE 
WHEN price BETWEEN 0 AND 10000 THEN '0-10000'
WHEN price BETWEEN 10001 AND 20000 THEN '10001-20000'
WHEN price BETWEEN 20001 AND 50000 THEN '20001-50000'
ELSE '50001+' 
END AS price_range,
COUNT(*) AS product_count
FROM products
GROUP BY price_range;

#Find the average age of customers grouped by their location (based on the address)
SELECT address AS location, AVG(age) AS average_age
FROM customers
GROUP BY address;
