CREATE DATABASE library;
USE library;

--table with required contents
CREATE TABLE books
(
    book_id INT(5) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT(5),
    genre VARCHAR(50),
    price DECIMAL(8, 2),
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE authors
(
    author_id INT(5) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(50)
);

CREATE TABLE members
(
    member_id INT(5) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE NOT NULL
);

CREATE TABLE loans
(
    loan_id INT(5) PRIMARY KEY,
    book_id INT(5),
    member_id INT(5),
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE transactions
(
    transaction_id INT(5) PRIMARY KEY,
    loan_id INT(5),
    amount DECIMAL(8, 2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    payment_mode VARCHAR(30) CHECK (payment_mode IN ('cash', 'credit', 'debit', 'upi')),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

INSERT INTO authors (author_id, name, birthdate, nationality) VALUES
(1, 'chetan bhagath', '1993-06-25', 'India'),
(2, 'J.K. Rowling', '1965-07-31', 'British'),
(3, 'Rk Narayan', '1972-01-03', 'India');

INSERT INTO books (book_id, title, author_id, genre, price, publication_date) VALUES
(101, '2states', 1, 'Dystopian', 15.00, '2005-06-08'),
(102, 'Harry Potter and the Philosopher\'s Stone', 2, 'Fantasy', 20.00, '1997-06-26'),
(103, 'malgudi days', 3, 'Fantasy', 12.00, '1980-09-21');

INSERT INTO members (member_id, name, email, join_date) VALUES
(201, 'shashank', 'shashank@example.com', '2020-01-15'),
(202, 'koushik', 'koushik@example.com', '2021-03-22'),
(203, 'adithya', 'adithya@example.com', '2019-08-05');

INSERT INTO loans (loan_id, book_id, member_id, loan_date, return_date) VALUES
(301, 101, 201, '2022-05-10', '2022-06-10'),
(302, 102, 202, '2022-05-15', '2022-06-15'),
(303, 103, 203, '2022-05-20', '2022-06-20');

INSERT INTO transactions (transaction_id, loan_id, amount, transaction_date, payment_mode) VALUES
(401, 301, 15.00, '2022-05-10 10:00:00', 'cash'),
(402, 302, 20.00, '2022-05-15 11:00:00', 'credit'),
(403, 303, 12.00, '2022-05-20 12:00:00', 'debit');

UPDATE books
SET price = 18.00
WHERE book_id = 101;

DELETE FROM members
WHERE member_id = 203;

SELECT * 
FROM books 
WHERE publication_date > '1990-01-01';

UPDATE loans
SET return_date = CURDATE()
WHERE loan_id = 301;

DELETE FROM books 
WHERE price < 15.00;

CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO employees (id, name, position, salary)
VALUES (1, 'Athmanathan', 'Librarian', 50000);

UPDATE employees
SET salary = 55000
WHERE id = 1;

DELETE FROM employees
WHERE id = 1;

CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT CHECK (age >= 18),
  course_id INT,
  grade CHAR(1) DEFAULT 'F'
);

CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL
);

ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES courses (course_id)
ON DELETE CASCADE;

INSERT INTO students (student_id, name, email, age, course_id, grade)
VALUES (1, 'Athmanathan', 'athma@example.com', 20, 101, 'A');

SELECT * 
FROM books 
WHERE price > 10 AND publication_date > '2000-01-01';

ALTER TABLE books ADD COLUMN last_updated DATETIME;
UPDATE books
SET price = 25.00, last_updated = NOW()  
WHERE book_id = 102;

ALTER TABLE books ADD COLUMN stock INT;
DELETE FROM books 
WHERE stock < 10;
