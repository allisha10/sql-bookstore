-- Create Authors table
CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  Name VARCHAR(100),
  Country VARCHAR(50)
);

-- Create Books table
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  AuthorID INT,
  Price DECIMAL(6, 2),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Create Sales table
CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  BookID INT,
  Quantity INT,
  SaleDate DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert data into Authors
INSERT INTO Authors VALUES
(1, 'George Orwell', 'UK'),
(2, 'J.K. Rowling', 'UK'),
(3, 'Mark Twain', 'USA');

-- Insert data into Books
INSERT INTO Books VALUES
(101, '1984', 1, 15.99),
(102, 'Harry Potter', 2, 29.99),
(103, 'Huckleberry Finn', 3, 10.50);

-- Insert data into Sales
INSERT INTO Sales VALUES
(1001, 101, 3, '2024-04-10'),
(1002, 102, 2, '2024-05-01'),
(1003, 103, 5, '2024-05-05');

-- Query 1: List all books with authors
SELECT b.Title, a.Name AS Author, b.Price
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- Query 2: Total sales per book
SELECT b.Title, SUM(s.Quantity) AS TotalSold
FROM Sales s
JOIN Books b ON s.BookID = b.BookID
GROUP BY b.Title;
