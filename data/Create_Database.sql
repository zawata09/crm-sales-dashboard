-- 1. Create CRM Database
CREATE DATABASE CRMSalesDB;
GO

USE CRMSalesDB;
GO

-- 2. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    City NVARCHAR(50),
    State NVARCHAR(50),
    JoinDate DATE,
    CustomerType NVARCHAR(20) -- 'Regular', 'Premium', 'Enterprise'
);
GO

-- 3. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    Cost DECIMAL(10,2)
);
GO

-- 4. Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20) -- 'Completed', 'Pending', 'Cancelled'
);
GO

-- 5. Insert Sample Data
INSERT INTO Customers (FirstName, LastName, Email, Phone, City, State, JoinDate, CustomerType) VALUES
('John', 'Smith', 'john.smith@email.com', '0411222333', 'Sydney', 'NSW', '2023-01-15', 'Premium'),
('Sarah', 'Johnson', 'sarah.j@email.com', '0422333444', 'Melbourne', 'VIC', '2023-02-20', 'Regular'),
('Mike', 'Brown', 'mike.b@email.com', '0433444555', 'Brisbane', 'QLD', '2023-03-10', 'Enterprise'),
('Emma', 'Wilson', 'emma.w@email.com', '0444555666', 'Perth', 'WA', '2023-04-05', 'Regular'),
('David', 'Lee', 'david.lee@email.com', '0455666777', 'Adelaide', 'SA', '2023-05-12', 'Premium');
GO

INSERT INTO Products (ProductName, Category, Price, Cost) VALUES
('Laptop Pro', 'Electronics', 1499.99, 900.00),
('Office Desk', 'Furniture', 499.99, 250.00),
('Wireless Mouse', 'Electronics', 49.99, 15.00),
('Ergonomic Chair', 'Furniture', 299.99, 150.00),
('Monitor 24"', 'Electronics', 349.99, 200.00);
GO

INSERT INTO Sales (CustomerID, ProductID, SaleDate, Quantity, TotalAmount, Status) VALUES
(1, 1, '2024-01-10', 1, 1499.99, 'Completed'),
(2, 3, '2024-01-12', 2, 99.98, 'Completed'),
(3, 2, '2024-01-15', 1, 499.99, 'Completed'),
(1, 4, '2024-01-18', 1, 299.99, 'Completed'),
(4, 5, '2024-01-20', 1, 349.99, 'Pending'),
(5, 1, '2024-01-22', 1, 1499.99, 'Completed'),
(2, 2, '2024-01-25', 1, 499.99, 'Cancelled'),
(3, 3, '2024-01-28', 3, 149.97, 'Completed');
GO

-- 6. Create a View for Sales Summary (Optional but useful)
CREATE VIEW SalesSummary AS
SELECT 
    s.SaleID,
    c.FirstName + ' ' + c.LastName as CustomerName,
    c.CustomerType,
    p.ProductName,
    p.Category,
    s.SaleDate,
    s.Quantity,
    s.TotalAmount,
    s.Status,
    (s.TotalAmount - (p.Cost * s.Quantity)) as Profit
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID;
GO

-- Verify data
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales;
SELECT * FROM SalesSummary;