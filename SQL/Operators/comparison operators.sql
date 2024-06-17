CREATE DATABASE comparison_op
USE comparison_op;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(200),
    price DECIMAL(15, 2),
    created_at DATE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(00),
    age INT,
    email VARCHAR(200)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(15, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO products (product_id, product_name, price, created_at, stock) VALUES
(1, 'printer', 160000.00, '2024-01-15', 20),
(2, 'processor', 90000.00, '2024-02-20', 100),
(3, 'monitor', 20000.00, '2024-03-10', 50),
(4, 'keyboard', 1200.00, '2024-04-05', 60),
(5, 'cooling fan', 50000.00, '2024-05-15', 35);


INSERT INTO customers (customer_id, customer_name, age, email) VALUES
(1, 'Shashank', 27, 'shashank@example.com'),
(2, 'aditya', 33, 'aditya@example.com'),
(3, 'koushik', 30, 'koushik@example.com'),
(4, 'athmanathan', 46, 'athmanathan@example.com'),
(5, 'Rishi', 29, 'rishi@example.com');

INSERT INTO orders (order_id, customer_id, order_amount, order_date) VALUES
(1, 1, 160000.00, '2024-01-20'),
(2, 2, 90000.00, '2024-02-25'),
(3, 3, 20000.00, '2024-03-15'),
(4, 4, 1200.00, '2024-04-10'),
(5, 5, 50000.00, '2024-05-20');

SELECT * FROM products
WHERE price >= 50000;

SELECT * FROM customers
WHERE age <> 30;

SELECT * FROM orders
WHERE order_amount <= 10000;

