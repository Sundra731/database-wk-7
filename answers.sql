-- QUESTION 1: Achieving 1NF
USE salesdb;
-- Create the new table in 1NF
CREATE TABLE ProductDetail(
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

-- Insert rows (one product per row)
INSERT INTO ProductDetail(OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

SELECT * FROM ProductDetail;

-- QUESTION 2: Achieving 2NF
CREATE TABLE OrdersX (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES OrdersX(OrderID)
);
-- Orders table (no product repetition, only one row per order)
INSERT INTO OrdersX VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- OrderItems table (each product linked to its order)
INSERT INTO OrderItems VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

SELECT * FROM OrdersX;
SELECT * FROM OrderItems;



