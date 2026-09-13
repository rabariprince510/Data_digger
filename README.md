# 🛒 Data Digger — E-Commerce Store Database

A beginner-friendly **MySQL database management project** designed to simulate the core database operations of an e-commerce store.

The project manages **customers, orders, products, and order details** while demonstrating important SQL concepts such as database creation, table relationships, CRUD operations, filtering, sorting, aggregate functions, and foreign keys.

---

## 📌 Project Overview

**Data Digger** is an e-commerce database system built using **MySQL**.

It contains four main tables:

* 👤 **Customers** — Stores customer information
* 📦 **Orders** — Stores customer orders
* 🛍️ **Products** — Stores product information and stock
* 🧾 **OrderDetails** — Stores individual products included in orders

The SQL script is designed so that the database can be safely recreated and tested multiple times.

---

## ✨ Features

### 👤 Customer Management

* Add customer records
* View all customers
* Update customer addresses
* Delete customers
* Search customers by name

### 📦 Order Management

* Create orders
* View orders for a specific customer
* Update order amounts
* Delete orders
* Find orders from the last 30 days
* Calculate highest, lowest, and average order amounts

### 🛍️ Product Management

* Add products
* Display products sorted by price
* Update product prices
* Remove out-of-stock products
* Find products within a specific price range
* Find the cheapest and most expensive products

### 🧾 Order Details

* Store products belonging to orders
* View details of a specific order
* Calculate total revenue
* Find the top 3 most ordered products
* Count how many times a product has been sold

---

## 🗄️ Database Structure

The database is named:

```text
DataDigger
```

### Entity Relationship Overview

```text
Customers
    │
    │ 1
    │
    │
    │ N
  Orders
    │
    │ 1
    │
    │
    │ N
OrderDetails
    │
    │ N
    │
    │ 1
 Products
```

### Relationships

* One **Customer** can have multiple **Orders**
* One **Order** can contain multiple **OrderDetails**
* One **Product** can appear in multiple **OrderDetails**
* Foreign keys maintain relationships between related tables
* `ON DELETE CASCADE` is used for dependent records

---

## 📋 Database Tables

### 1. Customers

| Column     | Data Type    | Key         | Description        |
| ---------- | ------------ | ----------- | ------------------ |
| CustomerID | INT          | Primary Key | Unique customer ID |
| Name       | VARCHAR(100) | —           | Customer name      |
| Email      | VARCHAR(100) | —           | Customer email     |
| Address    | VARCHAR(255) | —           | Customer address   |

The `Customers` table is created with `CustomerID` as its primary key.

---

### 2. Orders

| Column      | Data Type     | Key         | Description                   |
| ----------- | ------------- | ----------- | ----------------------------- |
| OrderID     | INT           | Primary Key | Unique order ID               |
| CustomerID  | INT           | Foreign Key | Customer who placed the order |
| OrderDate   | DATE          | —           | Date of the order             |
| TotalAmount | DECIMAL(10,2) | —           | Total order amount            |

`CustomerID` references the `Customers` table, creating a customer-to-orders relationship.

---

### 3. Products

| Column      | Data Type     | Key         | Description        |
| ----------- | ------------- | ----------- | ------------------ |
| ProductID   | INT           | Primary Key | Unique product ID  |
| ProductName | VARCHAR(100)  | —           | Product name       |
| Price       | DECIMAL(10,2) | —           | Product price      |
| Stock       | INT           | —           | Available quantity |

The project includes sample products such as Wireless Mouse, Mechanical Keyboard, Gaming Headset, USB-C Hub, and Mousepad.

---

### 4. OrderDetails

| Column        | Data Type     | Key         | Description            |
| ------------- | ------------- | ----------- | ---------------------- |
| OrderDetailID | INT           | Primary Key | Unique order-detail ID |
| OrderID       | INT           | Foreign Key | Related order          |
| ProductID     | INT           | Foreign Key | Related product        |
| Quantity      | INT           | —           | Quantity ordered       |
| SubTotal      | DECIMAL(10,2) | —           | Subtotal for the item  |

The table connects orders and products through foreign keys.

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates several fundamental SQL concepts:

* `CREATE DATABASE`
* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `UPDATE`
* `DELETE`
* `WHERE`
* `ORDER BY`
* `BETWEEN`
* `GROUP BY`
* `LIMIT`
* `MAX()`
* `MIN()`
* `AVG()`
* `SUM()`
* `COUNT()`
* Primary Keys
* Foreign Keys
* `ON DELETE CASCADE`
* Date functions
* Database/table recreation
* SQL Safe Update Mode

---

## 🔍 Example Queries

### Find all customers named Alice

```sql
SELECT * FROM Customers
WHERE Name = 'Alice';
```

### Find products between ₹500 and ₹2000

```sql
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
```

### Find average order amount

```sql
SELECT AVG(TotalAmount) AS AverageOrder
FROM Orders;
```

### Calculate total revenue

```sql
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
```

### Find the top 3 most ordered products

```sql
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```

These operations are included directly in the project SQL script.

---

## ⚙️ Requirements

To run this project, you need:

* **MySQL Server**
* **MySQL Workbench** or another MySQL-compatible SQL client
* Basic knowledge of SQL

---

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone <your-repository-url>
```

### 2. Open the SQL file

Open:

```text
first.sql
```

in MySQL Workbench or your preferred MySQL editor.

### 3. Execute the script

Run the complete SQL script.

The script automatically:

1. Creates the `DataDigger` database if it doesn't exist.
2. Selects the database.
3. Temporarily disables safe update mode.
4. Removes existing tables in the correct dependency order.
5. Creates all four tables.
6. Inserts sample data.
7. Executes demonstration queries.
8. Re-enables safe update mode.

---

## 📂 Project Structure

```text
Data-Digger/
│
├── first.sql
└── README.md
```

---

## 📊 Sample Data

The project contains sample data for:

### Customers

```text
Alice
Bob
Charlie
Diana
Alice
```

### Products

```text
Wireless Mouse
Mechanical Keyboard
Gaming Headset
USB-C Hub
Mousepad
```

The SQL file includes five initial customer records and five initial product records for demonstration purposes.

---

## 🔐 Data Integrity

The project uses **primary keys** and **foreign keys** to maintain data integrity.

For example:

```sql
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID)
ON DELETE CASCADE
```

This ensures that orders are associated with valid customers.

Similarly, `OrderDetails` uses foreign keys to connect orders and products.

---

## 🎯 Learning Objectives

By completing this project, you can practice:

* Designing a relational database
* Creating tables and defining columns
* Understanding primary and foreign keys
* Establishing relationships between tables
* Performing CRUD operations
* Filtering and sorting data
* Using SQL aggregate functions
* Grouping and analyzing data
* Working with dates
* Managing dependent records
* Writing practical SQL queries

---

## 🔮 Future Improvements

Possible future versions of **Data Digger** could include:

* Customer login and authentication
* Product categories
* Shopping carts
* Payment information
* Order status tracking
* Product reviews and ratings
* Inventory management
* Discounts and coupons
* Sales reports and dashboards
* Stored procedures
* Views
* Triggers
* More advanced JOIN queries

---

## 👨‍💻 Author

**Prince Rabari**

### Project

**Data Digger — E-Commerce Store Database Management System**

Built using:

```text
MySQL
SQL
Relational Database Concepts
```

---

## ⭐ If You Like This Project

If this project helped you learn SQL or database management, consider giving the repository a ⭐ on GitHub.

---

## 📄 License

This project is created for **educational and learning purposes**.

# Screenshots of the project is given below:

<img width="1366" height="768" alt="Screenshot (195)" src="https://github.com/user-attachments/assets/1619e558-0310-428b-8a40-eaf54901223a" />
<img width="1366" height="768" alt="Screenshot (196)" src="https://github.com/user-attachments/assets/4bc888a5-08e0-4143-addb-dca2f5803479" />
<img width="1366" height="768" alt="Screenshot (197)" src="https://github.com/user-attachments/assets/2c6bbe90-f8d7-47c4-9e0f-c72340107cdf" />
<img width="1366" height="768" alt="Screenshot (198)" src="https://github.com/user-attachments/assets/6dfbd430-2b60-40d2-895a-43d8ac4b16e8" />

# Video explaining the project is given below:

