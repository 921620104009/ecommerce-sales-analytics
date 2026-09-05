# E-Commerce Sales & Analytics Database

## 📌 Project Overview

The **E-Commerce Sales & Analytics Database** is a MySQL-based relational database project designed to manage customers, products, orders, payments, inventory, and sales analytics.

The project demonstrates practical SQL and database engineering concepts including **relational database design, primary and foreign keys, constraints, joins, aggregations, subqueries, CTEs, window functions, indexing, views, transactions, and query performance analysis**.

The project is designed around real-world e-commerce business requirements and focuses on writing **clean, maintainable, and optimized SQL queries**.

---

## 🎯 Project Objectives

* Design a normalized relational database for an e-commerce application.
* Maintain relationships between customers, orders, products, payments, and inventory.
* Write SQL queries for business and analytics requirements.
* Analyze sales and customer purchasing behavior.
* Identify top-performing products and categories.
* Use indexes to improve query performance.
* Analyze query execution using `EXPLAIN`.
* Demonstrate transactions and data integrity.
* Create reusable database views for reporting.

---

## 🛠️ Technologies Used

* **Database:** MySQL
* **Database Tool:** MySQL Workbench
* **Language:** SQL
* **Version Control:** Git / GitHub

---

## 🗄️ Database Design

The database contains the following tables:

| Table         | Purpose                                |
| ------------- | -------------------------------------- |
| `categories`  | Stores product categories              |
| `customers`   | Stores customer information            |
| `products`    | Stores product details and prices      |
| `orders`      | Stores customer orders                 |
| `order_items` | Stores products included in each order |
| `payments`    | Stores payment information             |
| `inventory`   | Tracks product stock                   |

### Relationships

```text
Categories
    │
    └── Products
          │
          ├── Inventory
          │
          └── Order Items
                    │
                    └── Orders
                           │
                           ├── Customers
                           │
                           └── Payments
```

### Main Relationships

* One customer can place many orders.
* One order can contain multiple products.
* One product can appear in multiple orders.
* Products belong to categories.
* Orders are associated with payments.
* Products have inventory records.

---

## 🔑 Database Features

### Data Integrity

The database uses:

* Primary Keys
* Foreign Keys
* `NOT NULL`
* `UNIQUE`
* `DEFAULT`
* `CHECK` constraints
* `AUTO_INCREMENT`

These constraints help maintain data consistency and prevent invalid data from being inserted.

---

## 📊 SQL Concepts Demonstrated

### Basic SQL

* `CREATE DATABASE`
* `CREATE TABLE`
* Data types
* `INSERT`
* `UPDATE`
* `DELETE`
* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`
* `DISTINCT`

### Relational Queries

* `INNER JOIN`
* Multi-table joins
* Foreign-key relationships
* Customer/order/product relationships

### Aggregation & Analytics

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`
* `GROUP BY`
* `HAVING`

### Advanced SQL

* Subqueries
* Common Table Expressions (`CTE`)
* `CASE`
* Window functions
* `RANK()`
* Date-based analysis

---

## 📈 Business Analytics

The project contains queries for real-world business questions such as:

* What is the total revenue?
* What are the top-selling products?
* Which product categories generate the most revenue?
* Which customers spend the most?
* Which customers have placed multiple orders?
* What is the average order value?
* Which products have low inventory?
* What is the revenue generated from delivered orders?
* How are products ranked within their categories?

---

## ⚡ Query Performance Optimization

Query performance is an important part of this project.

Indexes are created on frequently queried columns such as:

```sql
category_id
customer_id
status
order_date
product_id
```

Example:

```sql
CREATE INDEX idx_orders_customer
ON orders(customer_id);
```

The `EXPLAIN` statement is used to analyze query execution plans and understand how MySQL accesses data.

Example:

```sql
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 5;
```

This demonstrates practical knowledge of **query optimization and database performance**.

---

## 👁️ Database View

A reusable view is created for customer order reporting:

```sql
CREATE VIEW customer_order_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
```

This provides a reusable reporting layer for customer-level analytics.

---

## 🔄 Transactions

The project also demonstrates transaction handling using:

```sql
START TRANSACTION;

-- Database operations

COMMIT;
```

and:

```sql
ROLLBACK;
```

Transactions help maintain database consistency when multiple related operations must succeed together.

---

## 📁 Project Structure

```text
ecommerce-sales-analytics/
│
├── sql/
│   ├── 01_database.sql
│   ├── 02_tables.sql
│   ├── 03_sample_data.sql
│   ├── 04_queries.sql
│   ├── 05_analytics.sql
│   └── 06_performance.sql
│
├── screenshots/
│   └── query-results.png
│
└── README.md
```

> The current version may initially contain the complete database export as `ecommerce_db.sql`. The SQL can later be separated into the structure shown above.

---

## 💼 Relevance to Software Engineering

This project demonstrates database skills relevant to backend and full-stack software development, including:

* Relational database design
* SQL development
* Query optimization
* Data integrity
* Database performance analysis
* REST/backend data requirements
* Clean and maintainable database code
* Business reporting and analytics
* Version-controlled SQL development

These concepts provide a strong database foundation for applications built with technologies such as **Java, Spring Boot, REST APIs, and frontend frameworks**.

---

## 🚀 Future Enhancements

Planned improvements include:

* Connect the database to a **Spring Boot REST API**
* Add authentication and authorization
* Build an admin dashboard
* Add automated database testing
* Dockerize the application
* Add CI/CD pipeline
* Integrate static code quality and security analysis
* Deploy the application to cloud infrastructure
* Add advanced sales analytics

---

## 🧠 Key Learning Outcomes

Through this project, I practiced:

* Designing relational databases
* Creating relationships using primary and foreign keys
* Writing complex SQL queries
* Joining multiple tables
* Performing business analytics
* Using CTEs and window functions
* Creating indexes
* Reading query execution plans with `EXPLAIN`
* Improving query performance
* Maintaining data integrity with constraints
* Using transactions
* Creating reusable database views

---

## 👩‍💻 Author

**Dharani P**

Aspiring Java Backend / Full-Stack Developer

### Technical Interests

Java • Spring Boot • REST APIs • MySQL • SQL • React • Git • Backend Development
