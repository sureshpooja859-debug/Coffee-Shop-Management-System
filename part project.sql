
-- ==================================================
-- PROJECT: COFFEE SHOP MANAGEMENT SYSTEM
-- DATABASE: coffee_shop_db
-- ==================================================

-- STEP 1: CREATE DATABASE

CREATE DATABASE IF NOT EXISTS coffee_shop_db;

USE coffee_shop_db;


-- STEP 2: DROP EXISTING TABLES
-- (To avoid foreign key errors when running again)

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Menu_Items;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;


-- STEP 3: CREATE CUSTOMERS TABLE

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50) NOT NULL
);


-- STEP 4: CREATE EMPLOYEES TABLE

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_role VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);


-- STEP 5: CREATE MENU_ITEMS TABLE

CREATE TABLE Menu_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    availability VARCHAR(20) NOT NULL DEFAULT 'Available'
);


-- STEP 6: CREATE ORDERS TABLE

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_type VARCHAR(30) NOT NULL,
    order_status VARCHAR(30) NOT NULL DEFAULT 'Pending',

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_orders_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
);


-- STEP 7: CREATE ORDER_DETAILS TABLE

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_details_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT fk_details_item
        FOREIGN KEY (item_id)
        REFERENCES Menu_Items(item_id)
);


-- STEP 8: CREATE PAYMENTS TABLE

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL DEFAULT 'Paid',

    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);


-- ==================================================
-- STEP 9: INSERT CUSTOMERS DATA
-- ==================================================

INSERT INTO Customers
(customer_id, first_name, last_name, phone, email, city)
VALUES
(1, 'Pooja', 'Suresh', '9876543210', 'pooja@gmail.com', 'Kozhikode'),
(2, 'Anjali', 'Raj', '9876543211', 'anjali@gmail.com', 'Kochi'),
(3, 'Arjun', 'Kumar', '9876543212', 'arjun@gmail.com', 'Kannur'),
(4, 'Neha', 'Thomas', '9876543213', 'neha@gmail.com', 'Thrissur'),
(5, 'Rahul', 'Menon', '9876543214', 'rahul@gmail.com', 'Malappuram');


-- ==================================================
-- STEP 10: INSERT EMPLOYEES DATA
-- ==================================================

INSERT INTO Employees
(employee_id, first_name, last_name, job_role, phone, hire_date, salary)
VALUES
(1, 'Akhil', 'Raj', 'Manager', '9123456780', '2024-01-10', 30000.00),
(2, 'Meera', 'Nair', 'Barista', '9123456781', '2024-03-15', 18000.00),
(3, 'Vishnu', 'Kumar', 'Cashier', '9123456782', '2024-05-20', 16000.00),
(4, 'Sneha', 'Das', 'Barista', '9123456783', '2024-06-10', 18000.00),
(5, 'Rahul', 'Krishnan', 'Supervisor', '9123456784', '2024-08-01', 25000.00);


-- ==================================================
-- STEP 11: INSERT MENU_ITEMS DATA
-- ==================================================

INSERT INTO Menu_Items
(item_id, item_name, category, description, price, availability)
VALUES
(1, 'Cappuccino', 'Coffee', 'Espresso with steamed milk foam', 150.00, 'Available'),
(2, 'Latte', 'Coffee', 'Coffee with steamed milk', 160.00, 'Available'),
(3, 'Americano', 'Coffee', 'Espresso with hot water', 130.00, 'Available'),
(4, 'Cold Coffee', 'Beverage', 'Chilled coffee with milk', 180.00, 'Available'),
(5, 'Sandwich', 'Food', 'Fresh vegetable sandwich', 120.00, 'Available');


-- ==================================================
-- STEP 12: INSERT ORDERS DATA
-- ==================================================

INSERT INTO Orders
(order_id, customer_id, employee_id, order_date, order_type, order_status)
VALUES
(1, 1, 2, '2026-11-20 09:30:00', 'Dine-in', 'Completed'),
(2, 2, 3, '2026-11-20 10:15:00', 'Takeaway', 'Completed'),
(3, 3, 2, '2026-11-21 11:00:00', 'Dine-in', 'Completed'),
(4, 4, 4, '2026-11-21 12:30:00', 'Takeaway', 'Completed'),
(5, 5, 3, '2026-11-22 15:00:00', 'Dine-in', 'Completed');


-- ==================================================
-- STEP 13: INSERT ORDER_DETAILS DATA
-- ==================================================

INSERT INTO Order_Details
(order_detail_id, order_id, item_id, quantity, unit_price, subtotal)
VALUES
(1, 1, 1, 2, 150.00, 300.00),
(2, 1, 5, 1, 120.00, 120.00),

(3, 2, 2, 1, 160.00, 160.00),
(4, 2, 5, 1, 120.00, 120.00),

(5, 3, 3, 2, 130.00, 260.00),

(6, 4, 4, 1, 180.00, 180.00),
(7, 4, 5, 1, 120.00, 120.00),

(8, 5, 1, 1, 150.00, 150.00),
(9, 5, 2, 1, 160.00, 160.00);


-- ==================================================
-- STEP 14: INSERT PAYMENTS DATA
-- ==================================================

INSERT INTO Payments
(payment_id, order_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, 1, '2026-11-20 09:35:00', 'UPI', 420.00, 'Paid'),
(2, 2, '2026-11-20 10:20:00', 'Cash', 280.00, 'Paid'),
(3, 3, '2026-11-21 11:05:00', 'Card', 260.00, 'Paid'),
(4, 4, '2026-11-21 12:35:00', 'UPI', 300.00, 'Paid'),
(5, 5, '2026-11-22 15:05:00', 'Cash', 310.00, 'Paid');


-- ==================================================
-- STEP 15: DISPLAY ALL TABLES
-- ==================================================

SHOW TABLES;


-- STEP 16: CHECK ALL TABLE RECORDS

SELECT * FROM Customers;

SELECT * FROM Employees;

SELECT * FROM Menu_Items;

SELECT * FROM Orders;

SELECT * FROM Order_Details;

SELECT * FROM Payments;


USE coffee_shop_db;

SHOW TABLES;

SELECT 'Customers' AS Table_Name, COUNT(*) AS Total_Records FROM Customers
UNION ALL
SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL
SELECT 'Menu_Items', COUNT(*) FROM Menu_Items
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*) FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments;