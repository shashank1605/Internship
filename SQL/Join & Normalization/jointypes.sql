

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Sellers (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    category_id INT
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100)
);

CREATE TABLE SellerProducts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT,
    product_id INT
);

INSERT INTO Sellers (name, category_id) VALUES
('sai', 1),
('shashank', 2),
('koushik', 1),
('krishna', 3);

INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Home Appliances'),
('Books');

INSERT INTO Products (product_name) VALUES
('Laptop'),
('Microwave'),
('Book: kindle');

INSERT INTO SellerProducts (seller_id, product_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 2);


--Inner Join----Returns records that have matching values in both tables
SELECT Sellers.name, Categories.category_name
FROM Sellers
INNER JOIN Categories ON Sellers.category_id = Categories.category_id;

-- Left (Outer) Join---Returns all records from the left table and the matching records from the right table. There can be NULLs from the right side if there is no match.
SELECT Sellers.name, Categories.category_name
FROM Sellers
LEFT JOIN Categories ON Sellers.category_id = Categories.category_id;

-- Right (Outer) Join---Returns all records from the right table and the matching records from the left table. There can be NULLs from the left side if there is no match.
SELECT Sellers.name, Categories.category_name
FROM Sellers
RIGHT JOIN Categories ON Sellers.category_id = Categories.category_id;

--Full (Outer) Join--- Returns all records when there is a match in the left or right table.
SELECT Sellers.name, Categories.category_name
FROM Sellers
LEFT JOIN Categories ON Sellers.category_id = Categories.category_id
UNION
SELECT Sellers.name, Categories.category_name
FROM Sellers
RIGHT JOIN Categories ON Sellers.category_id = Categories.category_id;

-- Cross Join---Every row from one table is paired with every row from the other table
SELECT Sellers.name, Products.product_name
FROM Sellers
CROSS JOIN Products;

--Self Join---A normal join but the table is joined with itself
SELECT S1.name AS Seller, S2.name AS Colleague
FROM Sellers S1
JOIN Sellers S2 ON S1.category_id = S2.category_id
WHERE S1.seller_id != S2.seller_id;
