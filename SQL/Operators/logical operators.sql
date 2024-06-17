CREATE DATABASE logical_op
USE logical_op;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(15, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT,
    location VARCHAR(100)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(15, 2),
    order_date DATE,
    payment_mode VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO products (product_id, product_name, price, created_at, stock, location) VALUES
(1, 'apple', 150000.00, '2024-01-15', 50, 'Mumbai'),
(2, 'samsung', 90000.00, '2024-02-20', 30, 'Delhi'),
(3, 'MI', 20000.00, '2024-03-10', 20, 'Mumbai'),
(4, 'realme', 12000.00, '2024-04-05', 15, 'Mumbai'),
(5, 'oneplus', 50000.00, '2024-05-15', 5, 'Chennai');

INSERT INTO customers (customer_id, customer_name, age, email, city) VALUES
(1, 'Shashank', 27, 'shashank@example.com', 'Mumbai'),
(2, 'aditya', 33, 'aditya@example.com','Delhi'),
(3, 'koushik', 30, 'koushik@example.com', 'Mumbai'),
(4, 'athmanathan', 46, 'athmanathan@example.com', 'Bangalore'),
(5, 'Rishi', 29, 'rishi@example.com', 'Mumbai');

INSERT INTO orders (order_id, customer_id, order_amount, order_date, payment_mode, status) VALUES
(1, 1, 15000.00, '2024-01-20', 'credit_card', 'completed'),
(2, 2, 9000.00, '2024-02-25', 'upi', 'pending'),
(3, 3, 5000.00, '2024-03-15', 'net_banking', 'completed'),
(4, 4, 22000.00, '2024-04-10', 'debit_card', 'completed'),
(5, 5, 10000.00, '2024-05-20', 'upi', 'completed');

SELECT * FROM products
WHERE location = 'Mumbai' AND stock > 10;

SELECT * FROM customers
WHERE city = 'Mumbai'
OR customer_id IN (SELECT customer_id FROM orders WHERE order_amount > 20000);

SELECT * FROM orders
WHERE payment_mode <> 'upi' AND status = 'completed';
