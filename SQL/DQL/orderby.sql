CREATE DATABASE orderby
USE orderby

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    location VARCHAR(100)
);

#Creating the customers Table
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
(1, 'Samsung Galaxy', 5000.00, 10, 'Mumbai'),
(2, 'Apple iPhone', 15000.00, 20, 'Delhi'),
(3, 'Google Pixel', 25000.00, 15, 'Mumbai'),
(4, 'OnePlus', 35000.00, 5, 'Delhi'),
(5, 'Xiaomi Mi', 45000.00, 8, 'Bangalore'),
(6, 'Huawei Mate', 55000.00, 12, 'Mumbai');



INSERT INTO customers (customer_id, customer_name, age, address) VALUES
(1, 'shashank', 25, 'Mumbai'),
(2, 'sai', 30, 'Delhi'),
(3, 'adithya', 35, 'Mumbai'),
(4, 'athma', 40, 'Delhi'),
(5, 'krishna', 45, 'Bangalore'),
(6, 'Koushik', 50, 'Mumbai');


INSERT INTO orders (order_id, customer_id, order_amount) VALUES
(1, 1, 10000.00),
(2, 2, 20000.00),
(3, 3, 30000.00),
(4, 4, 15000.00),
(5, 5, 25000.00),
(6, 6, 5000.00);



SELECT * FROM products
ORDER BY price DESC;

SELECT * FROM customers
ORDER BY age ASC;

SELECT orders.order_id, orders.customer_id, orders.order_amount, customers.customer_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY orders.order_amount DESC, customers.customer_name ASC;
