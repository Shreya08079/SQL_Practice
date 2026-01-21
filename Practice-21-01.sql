IF DB_ID('SelectPracticeDB') IS NULL
    CREATE DATABASE SelectPracticeDB;
GO

USE SelectPracticeDB;
GO
IF OBJECT_ID('dbo.CustomerInfo', 'U') IS NOT NULL DROP TABLE dbo.CustomerInfo;
IF OBJECT_ID('dbo.OrderInfo', 'U') IS NOT NULL DROP TABLE dbo.OrderInfo;

CREATE TABLE dbo.CustomerInfo
(
    CustomerId   INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City         VARCHAR(50)  NOT NULL,
    CustomerType VARCHAR(20)  NOT NULL,   -- Retail / Corporate
    IsActive     BIT          NOT NULL,
    CreatedDate  DATE         NOT NULL
);

CREATE TABLE dbo.OrderInfo
(
    OrderId     INT PRIMARY KEY,
    CustomerId  INT NOT NULL,
    OrderDate   DATE NOT NULL,
    Amount      DECIMAL(10,2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    PayMode     VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Order_Customer
        FOREIGN KEY (CustomerId) REFERENCES dbo.CustomerInfo(CustomerId)
);
GO
INSERT INTO dbo.CustomerInfo VALUES
(1, 'Ravi Kumar',   'Chennai',   'Retail',    1, '2025-11-10'),
(2, 'Anita Sharma', 'Bangalore', 'Corporate', 1, '2025-10-01'),
(3, 'Suresh Rao',   'Hyderabad', 'Retail',    1, '2025-09-15'),
(4, 'Meena Joshi',  'Chennai',   'Retail',    0, '2024-12-20'),
(5, 'Karthik Iyer', 'Pune',      'Corporate', 1, '2025-01-05');

INSERT INTO dbo.OrderInfo VALUES
(101, 1, '2026-01-10', 1200.00, 'Delivered', 'UPI'),
(102, 1, '2026-01-15',  800.00, 'Pending',   'Card'),
(103, 2, '2026-01-05', 5000.00, 'Delivered', 'Card'),
(104, 3, '2025-12-30',  300.00, 'Cancelled', 'Cash'),
(105, 5, '2026-01-18', 2500.00, 'Delivered', 'UPI'),
(106, 2, '2026-01-20', 1500.00, 'Pending',   'UPI');
GO


SELECT * FROM dbo.CustomerInfo;

SELECT CustomerId, CustomerName, City
FROM dbo.CustomerInfo;

SELECT DISTINCT City
FROM dbo.CustomerInfo;

SELECT CustomerName AS Name, City AS Location
FROM dbo.CustomerInfo;


SELECT *
FROM dbo.CustomerInfo
WHERE City = 'Chennai';


SELECT *
FROM dbo.CustomerInfo
WHERE City IN ('Chennai', 'Hyderabad');


SELECT *
FROM dbo.OrderInfo
WHERE Amount BETWEEN 800 AND 3000;

SELECT *
FROM dbo.CustomerInfo
WHERE CustomerName LIKE 'S%';
