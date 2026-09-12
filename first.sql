-- ==========================================
-- PROJECT: DATA DIGGER
-- E-Commerce Store Database Management Script
-- ==========================================

-- Create database safely if it doesn't exist
CREATE DATABASE IF NOT EXISTS DataDigger;
USE DataDigger;

-- Disable safe update mode temporarily to prevent error 1175 during deletes/updates without keys
SET SQL_SAFE_UPDATES = 0;

-- Drop existing tables in correct order if re-running the script
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;


-- ==========================================
-- 1. CUSTOMERS TABLE
-- ==========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Insert at least 5 sample customers
INSERT INTO Customers (CustomerID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@example.com', '123 Main St'),
(2, 'Bob', 'bob@example.com', '456 Park Ave'),
(3, 'Charlie', 'charlie@example.com', '789 Market Rd'),
(4, 'Diana', 'diana@example.com', '321 Ocean Dr'),
(5, 'Alice', 'alice2@example.com', '654 Beach Blvd');

-- Retrieve all customer details
SELECT * FROM Customers;

-- Update a customer's address
UPDATE Customers 
SET Address = '999 New Street' 
WHERE CustomerID = 1;

-- Delete a customer using their CustomerID
DELETE FROM Customers 
WHERE CustomerID = 5;

-- Display all customers whose name is 'Alice'
SELECT * FROM Customers 
WHERE Name = 'Alice';


-- ==========================================
-- 2. ORDERS TABLE
-- ==========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- Insert at least 5 sample orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2026-08-15', 1500.00),
(102, 2, '2026-08-20', 850.00),
(103, 3, '2026-08-25', 2400.00),
(104, 1, '2026-09-01', 1200.00),
(105, 4, '2026-09-05', 450.00);

-- Retrieve all orders made by a specific customer
SELECT * FROM Orders 
WHERE CustomerID = 1;

-- Update an order's total amount
UPDATE Orders 
SET TotalAmount = 1600.00 
WHERE OrderID = 101;

-- Delete an order using its OrderID
DELETE FROM Orders 
WHERE OrderID = 105;

-- Retrieve orders placed in the last 30 days
SELECT * FROM Orders 
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- Retrieve the highest, lowest, and average order amount using aggregate functions
SELECT 
    MAX(TotalAmount) AS HighestOrder, 
    MIN(TotalAmount) AS LowestOrder, 
    AVG(TotalAmount) AS AverageOrder 
FROM Orders;


-- ==========================================
-- 3. PRODUCTS TABLE
-- ==========================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Insert at least 5 sample products into the Products table
INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(1, 'Wireless Mouse', 750.00, 50),
(2, 'Mechanical Keyboard', 1800.00, 20),
(3, 'Gaming Headset', 1500.00, 0),
(4, 'USB-C Hub', 1200.00, 15),
(5, 'Mousepad', 350.00, 100);

-- Retrieve all products sorted by price in descending order
SELECT * FROM Products 
ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products 
SET Price = 1900.00 
WHERE ProductID = 2;

-- Delete a product if it's out of stock
DELETE FROM Products 
WHERE Stock = 0;

-- Retrieve products whose price is between ₹500 and ₹2000
SELECT * FROM Products 
WHERE Price BETWEEN 500 AND 2000;

-- Retrieve the most expensive and cheapest product using MAX() and MIN()
SELECT 
    MAX(Price) AS MaxPrice, 
    MIN(Price) AS MinPrice 
FROM Products;


-- ==========================================
-- 4. ORDER DETAILS TABLE
-- ==========================================

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);

-- Insert at least 5 sample records into the OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 101, 1, 2, 1500.00),
(2, 102, 4, 1, 1200.00),
(3, 103, 2, 1, 1800.00),
(4, 104, 1, 1, 750.00),
(5, 104, 4, 1, 1200.00);

-- Retrieve all order details for a specific order
SELECT * FROM OrderDetails 
WHERE OrderID = 104;

-- Calculate the total revenue generated from all orders using SUM()
SELECT SUM(SubTotal) AS TotalRevenue 
FROM OrderDetails;

-- Retrieve the top 3 most ordered products
SELECT ProductID, SUM(Quantity) AS TotalQuantity 
FROM OrderDetails 
GROUP BY ProductID 
ORDER BY TotalQuantity DESC 
LIMIT 3;

-- Count how many times a specific product has been sold using COUNT()
SELECT COUNT(*) AS TimesSold 
FROM OrderDetails 
WHERE ProductID = 1;

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;
