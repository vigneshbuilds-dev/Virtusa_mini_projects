-- FreshMart Retail Insights Project

-- create database
CREATE DATABASE FreshMart;
USE FreshMart;

-- Category details
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- Product details
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    stock_count INT,
    expiry_date DATE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Sales details
CREATE TABLE SalesTransactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity_sold INT,
    total_amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert category data
INSERT INTO Categories (category_name) VALUES
('Fruits'),
('Dairy'),
('Snacks'),
('Beverages');

-- Insert product data
INSERT INTO Products (product_name, category_id, price, stock_count, expiry_date) VALUES
('Apple', 1, 120.00, 80, CURDATE() + INTERVAL 5 DAY),
('Milk', 2, 50.00, 100, CURDATE() + INTERVAL 3 DAY),
('Chips', 3, 30.00, 40, CURDATE() + INTERVAL 90 DAY),
('Juice', 4, 80.00, 70, CURDATE() + INTERVAL 6 DAY),
('Butter', 2, 60.00, 30, CURDATE() + INTERVAL 20 DAY),
('Banana', 1, 40.00, 120, CURDATE() + INTERVAL 4 DAY),
('Cookies', 3, 45.00, 90, CURDATE() + INTERVAL 120 DAY);

-- Insert sales transaction data
INSERT INTO SalesTransactions (product_id, quantity_sold, total_amount, sale_date) VALUES
(1, 10, 1200.00, CURDATE() - INTERVAL 10 DAY),
(2, 15, 750.00, CURDATE() - INTERVAL 5 DAY),
(3, 20, 600.00, CURDATE() - INTERVAL 20 DAY),
(4, 8, 640.00, CURDATE() - INTERVAL 15 DAY),
(1, 5, 600.00, CURDATE() - INTERVAL 35 DAY),
(2, 10, 500.00, CURDATE() - INTERVAL 40 DAY),
(4, 12, 960.00, CURDATE() - INTERVAL 50 DAY),
(5, 7, 420.00, CURDATE() - INTERVAL 70 DAY);

-- Report 1: Products expiring within next 7 days and stock more than 50
SELECT 
    product_id,
    product_name,
    stock_count,
    expiry_date
FROM Products
WHERE expiry_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY
AND stock_count > 50;

-- Report 2: Dead stock (no sales in last 60 days)
SELECT 
    p.product_id,
    p.product_name,
    p.stock_count
FROM Products p
LEFT JOIN SalesTransactions s
ON p.product_id = s.product_id
AND s.sale_date >= CURDATE() - INTERVAL 60 DAY
WHERE s.transaction_id IS NULL;

-- Report 3: Category revenue for last month
SELECT 
    c.category_name,
    SUM(s.total_amount) AS total_revenue
FROM SalesTransactions s
JOIN Products p ON s.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
WHERE MONTH(s.sale_date) = MONTH(CURDATE() - INTERVAL 1 MONTH)
AND YEAR(s.sale_date) = YEAR(CURDATE() - INTERVAL 1 MONTH)
GROUP BY c.category_name
ORDER BY total_revenue DESC;
