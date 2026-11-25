# Coffee-Shop-Management-System
# ☕ Coffee Shop Management System

## 📌 Project Overview

The **Coffee Shop Management System** is a relational database project developed using MySQL. It is designed to manage and organize the daily operations of a coffee shop efficiently.

The database stores and manages information about customers, employees, menu items, customer orders, order details, and payments.

This project demonstrates the practical implementation of SQL concepts, including database creation, table creation, Primary Keys, Foreign Keys, constraints, relationships, and data manipulation.

---

## 🎯 Project Objectives

The main objectives of this project are:

- To design a structured relational database for a coffee shop.
- To maintain customer and employee information.
- To manage coffee shop menu items and prices.
- To record customer orders and order details.
- To maintain payment information.
- To establish relationships between database tables.
- To ensure data accuracy and consistency using SQL constraints.

---

## 🏢 Business Scenario

A coffee shop needs a database to manage its daily business activities.

Customers visit the coffee shop and place orders for different coffee and food items. Employees handle these orders, and customers make payments using different payment methods such as Cash, UPI, and Card.

The database helps the coffee shop maintain all this information in an organized manner.

---

## 🗄️ Database Information

| Details | Description |
|---|---|
| Project Name | Coffee Shop Management System |
| Database Name | coffee_shop_db |
| Database Language | SQL |
| DBMS | MySQL |
| Development Tool | MySQL Workbench |
| Project Type | Individual Database Project |
| Number of Tables | 6 |

---

## 📋 Database Tables

This project consists of six tables.

### 1. Customers

Stores information about coffee shop customers.

| Column | Data Type | Description |
|---|---|---|
| customer_id | INT | Unique customer ID |
| first_name | VARCHAR(50) | Customer first name |
| last_name | VARCHAR(50) | Customer last name |
| phone | VARCHAR(15) | Customer phone number |
| email | VARCHAR(100) | Customer email |
| city | VARCHAR(50) | Customer city |

**Primary Key:** customer_id

### 2. Employees

Stores employee information.

| Column | Data Type | Description |
|---|---|---|
| employee_id | INT | Unique employee ID |
| first_name | VARCHAR(50) | Employee first name |
| last_name | VARCHAR(50) | Employee last name |
| job_role | VARCHAR(50) | Employee job position |
| phone | VARCHAR(15) | Employee phone number |
| hire_date | DATE | Joining date |
| salary | DECIMAL(10,2) | Employee salary |

**Primary Key:** employee_id

### 3. Menu_Items

Stores information about available coffee and food items.

| Column | Data Type | Description |
|---|---|---|
| item_id | INT | Unique item ID |
| item_name | VARCHAR(100) | Name of the menu item |
| category | VARCHAR(50) | Item category |
| description | VARCHAR(255) | Item description |
| price | DECIMAL(10,2) | Selling price |
| availability | VARCHAR(20) | Availability status |

**Primary Key:** item_id

### 4. Orders

Stores customer order information.

| Column | Data Type | Description |
|---|---|---|
| order_id | INT | Unique order ID |
| customer_id | INT | Customer reference ID |
| employee_id | INT | Employee reference ID |
| order_date | DATETIME | Order date and time |
| order_type | VARCHAR(30) | Dine-in or Takeaway |
| order_status | VARCHAR(30) | Order status |

**Primary Key:** order_id

**Foreign Keys:**
- customer_id references Customers(customer_id).
- employee_id references Employees(employee_id).

### 5. Order_Details

Stores individual items included in each order.

| Column | Data Type | Description |
|---|---|---|
| order_detail_id | INT | Unique order detail ID |
| order_id | INT | Order reference ID |
| item_id | INT | Menu item reference ID |
| quantity | INT | Number of items ordered |
| unit_price | DECIMAL(10,2) | Price per item |
| subtotal | DECIMAL(10,2) | Total item price |

**Primary Key:** order_detail_id

**Foreign Keys:**
- order_id references Orders(order_id).
- item_id references Menu_Items(item_id).

### 6. Payments

Stores payment information for customer orders.

| Column | Data Type | Description |
|---|---|---|
| payment_id | INT | Unique payment ID |
| order_id | INT | Order reference ID |
| payment_date | DATETIME | Payment date and time |
| payment_method | VARCHAR(30) | Cash, UPI, or Card |
| amount | DECIMAL(10,2) | Payment amount |
| payment_status | VARCHAR(30) | Payment status |

**Primary Key:** payment_id

**Foreign Key:** order_id references Orders(order_id).

A UNIQUE constraint is applied to order_id to allow one payment record per order.

---

## 🔗 Database Relationships

The database uses Primary Keys and Foreign Keys to establish relationships between tables.

| Parent Table | Child Table | Relationship |
|---|---|---|
| Customers | Orders | One-to-Many |
| Employees | Orders | One-to-Many |
| Orders | Order_Details | One-to-Many |
| Menu_Items | Order_Details | One-to-Many |
| Orders | Payments | One-to-One |

### Relationship Explanation

- One customer can place multiple orders.
- One employee can handle multiple orders.
- One order can contain multiple menu items.
- One menu item can appear in multiple orders.
- Each order can have one payment record.

---

## 🔑 SQL Concepts Used

The following SQL concepts are implemented in this project:

### Database Management
- CREATE DATABASE
- USE DATABASE
- DROP TABLE IF EXISTS

### Table Management
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY

### Constraints
- NOT NULL
- UNIQUE
- DEFAULT

### Data Types
- INT
- VARCHAR
- DATE
- DATETIME
- DECIMAL

### Data Manipulation
- INSERT INTO
- SELECT
- COUNT
- UNION ALL

---

## 📊 Sample Data

The project contains sample records in all six tables.

| Table Name | Number of Records |
|---|---:|
| Customers | 5 |
| Employees | 5 |
| Menu_Items | 5 |
| Orders | 5 |
| Order_Details | 9 |
| Payments | 5 |
| **Total** | **34** |

---

## 🛠️ Tools and Technologies

- **MySQL:** Used to create and manage the relational database.
- **MySQL Workbench:** Used to execute SQL queries and generate the ER Diagram.
- **SQL:** Used for database creation, table creation, inserting records, and retrieving data.
- **GitHub:** Used to store and submit the project files.

---

## 📁 Project Structure

```text
Coffee-Shop-Management-System/
│
├── README.md
│
├── database.sql
│
└── ER_Diagram.png
```

### Project Files Description

- `README.md` – Contains project documentation and database details.
- `database.sql` – Contains the complete SQL script for creating the database, tables, relationships, and inserting sample records.
- `ER_Diagram.png` – Visual representation of the database tables and their relationships.

---

## ⚙️ How to Run the Project

Follow these steps to execute the project:

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Connect to your MySQL Server.
4. Open a new SQL query tab.
5. Copy the contents of `database.sql`.
6. Paste the SQL script into the query editor.
7. Execute the script using the lightning button.
8. Run `SHOW TABLES;` to view the created tables.
9. Run SELECT queries to verify the inserted records.

---

## 📈 Expected Outcomes

After executing the SQL script successfully:

- A database named `coffee_shop_db` will be created.
- Six relational tables will be created.
- Primary Keys and Foreign Keys will establish table relationships.
- Sample records will be inserted into all six tables.
- Customer orders and payment details will be organized.
- The ER Diagram will represent the database structure.

---

## 🏁 Conclusion

The Coffee Shop Management System demonstrates the practical application of MySQL in designing a real-world relational database.

Through this project, I gained practical experience in database planning, table creation, SQL queries, Primary Keys, Foreign Keys, constraints, data insertion, and database relationships.

This project helped me understand how SQL can be used to organize and manage business information efficiently.

---

**Project Name:** Coffee Shop Management System

**Database:** MySQL

**Project Type:** Individual Project

**Developed as part of:** SQL Database Design Project

**Thank You! ☕**
