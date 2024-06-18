CREATE DATABASE having
USE having


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


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



INSERT INTO products (product_id, product_name, price, stock, location) VALUES
(1, 'MacBook Pro', 80000.00, 5, 'Mumbai'),
(2, 'Samsung Galaxy S21', 20000.00, 15, 'Mumbai'),
(3, 'Android Tablet', 30000.00, 25, 'Delhi'),
(4, 'UltraWide Monitor', 10000.00, 30, 'Bangalore'),
(5, 'Wireless Mouse', 1500.00, 50, 'Chennai'),
(6, 'USB Pen Drive', 700.00, 40, 'Mumbai');



INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'Shashank', 28, 'knr'),
(2, 'Sai', 32, 'Delhi'),
(3, 'adithya', 25, 'Bangalore'),
(4, 'athma', 27, 'Chennai'),
(5, 'koushik', 34, 'vizag'),
(6, 'ram', 30, 'hyderabad');


INSERT INTO orders (order_id, customer_id, order_amount) VALUES
(1, 1, 15000.00),
(2, 2, 25000.00),
(3, 3, 8000.00),
(4, 4, 12000.00),
(5, 5, 22000.00),
(6, 6, 3000.00);

SELECT location, SUM(stock) AS total_stock
FROM products
GROUP BY location
HAVING total_stock > 20;

SELECT customers.customer_id, customers.customer_name, SUM(orders.order_amount) AS total_amount
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING total_amount > 10000;

SELECT * FROM products
WHERE stock BETWEEN 10 AND 20
AND location = 'Mumbai';
