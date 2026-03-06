# SQL Quiz & Database Scripts

This folder contains SQL learning materials, quiz questions, and a complete database schema.

## Files

| File | Description |
|------|-------------|
| `quiz of sql.sql` | 10 SQL quiz questions with solutions |
| `NEXT_COLA_TSQL.sql` | Complete database creation script for NEXT_COLA_OLTP |
| `ERD.jpeg` | Entity Relationship Diagram |
| `Questions.docx` | Questions document |

---

## Quiz Questions (`quiz of sql.sql`)

| # | Topic | Description |
|---|-------|-------------|
| Q1 | Aggregation | Top 5 customers by total order amount |
| Q2 | GROUP BY / HAVING | Products count by supplier (>10 products) |
| Q3 | Joins | Products ordered but never returned |
| Q4 | CTE / Subquery | Most expensive product per category |
| Q5 | Multi-table Joins | Sales orders with customer, product, category, supplier details |
| Q6 | Joins | Shipments with warehouse, manager, and product details |
| Q7 | Window Functions (RANK) | Top 3 highest-value orders per customer |
| Q8 | Window Functions (LAG/LEAD) | Product sales history with previous/next quantities |
| Q9 | Views | Customer order summary view |
| Q10 | Stored Procedures | Supplier sales stored procedure |

---

## Database Schema (`NEXT_COLA_TSQL.sql`)

Creates the `NEXT_COLA_OLTP` database with the following tables:

### Core Tables

| Table | Description |
|-------|-------------|
| `Supplier` | Supplier information and contracts |
| `Manufacturer` | Product manufacturers |
| `Category` | Product categories |
| `Product` | Product catalog |
| `Customer` | Customer information |

### Order Management

| Table | Description |
|-------|-------------|
| `PurchaseOrder` | Purchase orders from suppliers |
| `PurchaseOrderDetail` | Line items for purchase orders |
| `SalesOrder` | Customer sales orders |
| `SalesOrderDetail` | Line items for sales orders |
| `Return` | Product returns |
| `ReturnDetail` | Line items for returns |

### Logistics

| Table | Description |
|-------|-------------|
| `Warehouse` | Warehouse locations |
| `Shipment` | Shipments and tracking |
| `ShipmentDetail` | Shipment line items |
| `Location` | Geographic locations |

### HR & Finance

| Table | Description |
|-------|-------------|
| `Employee` | Employee records |
| `Department` | Company departments |
| `Payment` | Payment transactions |

---

## Topics Covered

- **JOINs**: INNER JOIN, LEFT JOIN, multi-table joins
- **Aggregation**: SUM, COUNT, MAX, GROUP BY, HAVING
- **Window Functions**: RANK(), LAG(), LEAD()
- **CTEs**: Common Table Expressions
- **Views**: Creating database views
- **Stored Procedures**: Parameterized procedures
- **Subqueries**: Nested queries

---

## Usage

1. Run `NEXT_COLA_TSQL.sql` to create the database and tables
2. Use `quiz of sql.sql` to practice SQL queries
3. Refer to `ERD.jpeg` for table relationships

---

## Requirements

- SQL Server (T-SQL compatible)
- SQL Server Management Studio (SSMS) or equivalent