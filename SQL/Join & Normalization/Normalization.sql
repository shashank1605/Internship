CREATE DATABASE Library;
USE Library;

CREATE TABLE Unnormalized (
    BookID INT,
    BookTitle VARCHAR(100),
    AuthorID INT,
    AuthorName VARCHAR(100),
    PublisherID INT,
    PublisherName VARCHAR(100),
    BorrowerID INT,
    BorrowerName VARCHAR(100),
    BorrowDate DATE
);

INSERT INTO Unnormalized (BookID, BookTitle, AuthorID, AuthorName, PublisherID, PublisherName, BorrowerID, BorrowerName, BorrowDate)
VALUES
(1, 'Book A', 101, 'Author X', 201, 'Publisher P', 301, 'sai', '2024-06-01'),
(2, 'Book B', 102, 'Author Y', 202, 'Publisher Q', 302, 'shashank', '2024-06-02'),
(3, 'Book C', 103, 'Author Z', 203, 'Publisher R', 303, 'koushik', '2024-06-03'),
(4, 'Book D', 104, 'Author W', 201, 'Publisher P', 304, 'krishna', '2024-06-04'),
(5, 'Book E', 105, 'Author V', 202, 'Publisher Q', 305, 'saketh', '2024-06-05');

--First Normal Form (1NF)---  Each column contains single values.

--2NF Normalization--breaking down the table into smaller tables and ensuring that non-key attributes are fully functionally dependent on the primary key.

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    AuthorID INT,
    PublisherID INT
);

INSERT INTO Books (BookID, BookTitle, AuthorID, PublisherID)
VALUES
(1, 'Book A', 101, 201),
(2, 'Book B', 102, 202),
(3, 'Book C', 103, 203),
(4, 'Book D', 104, 201),
(5, 'Book E', 105, 202);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);

INSERT INTO Authors (AuthorID, AuthorName)
VALUES
(101, 'Author X'),
(102, 'Author Y'),
(103, 'Author Z'),
(104, 'Author W'),
(105, 'Author V');

CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100)
);

INSERT INTO Publishers (PublisherID, PublisherName)
VALUES
(201, 'Publisher P'),
(202, 'Publisher Q'),
(203, 'Publisher R');

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    BorrowerName VARCHAR(100)
);

INSERT INTO Borrowers (BorrowerID, BorrowerName)
VALUES
(301, 'sai'),
(302, 'shashank'),
(303, 'koushik'),
(304, 'krishna'),
(305, 'saketh');

CREATE TABLE Borrowings (
    BorrowingID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

INSERT INTO Borrowings (BookID, BorrowerID, BorrowDate)
VALUES
(1, 301, '2024-06-01'),
(2, 302, '2024-06-02'),
(3, 303, '2024-06-03'),
(4, 304, '2024-06-04'),
(5, 305, '2024-06-05');


--3NF Normalization---In 3NF, we need to eliminate transitive dependencies. Non-key attributes should not depend on other non-key attributes.

--for the table with Books, Borrowers, and Borrowing details:
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History');

--update the Books Table to reference categories Table
CREATE TABLE Books_3NF (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Books_3NF (BookID, BookTitle, AuthorID, PublisherID, CategoryID)
VALUES
(1, 'Book A', 101, 201, 1),
(2, 'Book B', 102, 202, 2),
(3, 'Book C', 103, 203, 3),
(4, 'Book D', 104, 201, 4),
(5, 'Book E', 105, 202, 1);


--BCNF (Boyce-Codd Normal Form)--for every functional dependency, there should be a SUPERKEY.

CREATE TABLE BookStores (
    StoreID INT,
    StoreName VARCHAR(100),
    Location VARCHAR(100),
    ManagerName VARCHAR(100)
);

INSERT INTO BookStores (StoreID, StoreName, Location, ManagerName)
VALUES
(1, 'Store A', 'Location 1', 'Manager X'),
(2, 'Store B', 'Location 2', 'Manager Y'),
(3, 'Store C', 'Location 3', 'Manager Z'),
(4, 'Store D', 'Location 1', 'Manager W');

--eliminating partial dependencies by 2nf
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Stores (StoreID, StoreName, Location)
VALUES
(1, 'Store A', 'Location 1'),
(2, 'Store B', 'Location 2'),
(3, 'Store C', 'Location 3'),
(4, 'Store D', 'Location 1');

CREATE TABLE Managers (
    ManagerName VARCHAR(100),
    StoreID INT,
    PRIMARY KEY (ManagerName, StoreID)
);

INSERT INTO Managers (ManagerName, StoreID)
VALUES
('Manager X', 1),
('Manager Y', 2),
('Manager Z', 3),
('Manager W', 4);

--removing dependencies by 3nf

CREATE TABLE StoreLocations (
    Location VARCHAR(100),
    ManagerName VARCHAR(100),
    PRIMARY KEY (Location)
);

INSERT INTO StoreLocations (Location, ManagerName)
VALUES
('Location 1', 'Manager X'),
('Location 2', 'Manager Y'),
('Location 3', 'Manager Z'),
('Location 4', 'Manager W');

--update stores Table:

CREATE TABLE Stores_3NF (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(100),
    FOREIGN KEY (Location) REFERENCES StoreLocations(Location)
);

INSERT INTO Stores_3NF (StoreID, StoreName, Location)
VALUES
(1, 'Store A', 'Location 1'),
(2, 'Store B', 'Location 2'),
(3, 'Store C', 'Location 3'),
(4, 'Store D', 'Location 4');

