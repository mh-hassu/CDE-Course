# SQL Classes - SQL Server Tutorial

This repository contains SQL Server learning materials covering fundamental to advanced concepts.

## Topics Covered

### 1. WHERE, LIKE, TOP, ORDER BY, FETCH/OFFSET
**File:** `where like top order fetch .sql`

| Concept | Description |
|---------|-------------|
| WHERE | Filtering rows with conditions |
| ORDER BY | Sorting result sets (ASC/DESC) |
| TOP | Limiting the number of rows returned |
| OFFSET/FETCH | Pagination with row skipping |
| LIKE | Pattern matching with wildcards (`%`, `_`, `[]`) |
| Operators | `AND`, `OR`, `NOT`, `BETWEEN` |
| CONCAT | String concatenation |
| Alias | Column renaming with `AS` |

**Wildcards Examples:**
- `'A%'` - Starts with 'A'
- `'%son'` - Ends with 'son'
- `'[B-C]%'` - Starts with B or C

---

### 2. DDL & Joins
**File:** `DDL & joins.sql`

#### Data Definition Language (DDL)
```sql
CREATE DATABASE database_name;
CREATE TABLE table_name (...);
DROP TABLE table_name;
```

#### Data Manipulation Language (DML)
```sql
INSERT INTO table_name (columns) VALUES (...);
```

#### Types of Joins
| Join Type | Description |
|-----------|-------------|
| INNER JOIN | Returns matching rows from both tables |
| LEFT JOIN | Returns all from left + matching from right |
| RIGHT JOIN | Returns all from right + matching from left |
| FULL OUTER JOIN | Returns all rows from both tables |
| CROSS JOIN | Cartesian product of both tables |
| SELF JOIN | Table joins to itself |

#### Anti Joins
- **Left Anti Join:** Rows in left table with no match in right
- **Right Anti Join:** Rows in right table with no match in left

---

### 3. GROUP BY, HAVING & Subqueries
**File:** `group having sub query.sql`

#### Aggregate Functions with GROUP BY
```sql
SELECT column, COUNT(*)
FROM table
GROUP BY column
HAVING COUNT(*) > value;
```

#### Advanced Grouping
| Feature | Description |
|---------|-------------|
| GROUPING SETS | Custom group combinations |
| CUBE | All possible grouping combinations |
| ROLLUP | Hierarchical grouping (subtotals) |

#### Subqueries
- **Scalar Subquery:** Returns single value
- **Correlated Subquery:** References outer query columns

---

### 4. CASE Expressions & Duplicate Handling
**File:** `case_pk_row.sql`

#### CASE Expression
```sql
SELECT
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE default_result
    END AS alias_name
FROM table;
```

#### NULL Functions
| Function | Description |
|----------|-------------|
| COALESCE | Returns first non-NULL value |
| NULLIF | Returns NULL if values are equal |

#### Handling Duplicates
```sql
-- Using ROW_NUMBER() with CTE
WITH cte_duplicates AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY col1, col2 ORDER BY col1) AS rn
    FROM table
)
SELECT * FROM cte_duplicates WHERE rn = 1;
```

#### Views
```sql
CREATE VIEW view_name AS
SELECT columns FROM tables WHERE conditions;
```

---

### 5. Clustered & Non-Clustered Indexes
**File:** `table cluster non_cluster .sql`

#### Index Types Comparison
| Feature | Clustered Index | Non-Clustered Index |
|---------|-----------------|---------------------|
| Storage | Physical sort order | Logical pointer structure |
| Per Table | Only 1 allowed | Multiple allowed |
| Speed | Faster for range queries | Faster for specific lookups |

```sql
-- Clustered Index
CREATE CLUSTERED INDEX ix_name ON table(column);

-- Non-Clustered Index
CREATE INDEX ix_name ON table(column);

-- Composite Index
CREATE INDEX ix_name ON table(col1, col2);
```

---

### 6. Index Management
**File:** `indexes .sql`

#### Index Operations
```sql
-- Disable Index
ALTER INDEX ix_name ON table DISABLE;

-- Rebuild (Enable) Index
ALTER INDEX ix_name ON table REBUILD;

-- Drop Index
DROP INDEX ix_name ON table;
```

#### Unique Index
```sql
CREATE UNIQUE INDEX ix_name ON table(column);
```

> Note: Unique indexes ensure no duplicate values in the indexed column(s).

---

### 7. Stored Procedures & Control Flow
**File:** `advance if else cursor while.sql`

#### Stored Procedures
```sql
CREATE PROCEDURE procedure_name
    @param1 AS datatype,
    @param2 AS datatype OUTPUT
AS
BEGIN
    -- SQL statements
    SELECT @output_param = @@ROWCOUNT;
END;
```

#### Executing Procedures
```sql
-- With parameters
EXEC procedure_name @param1 = value, @param2 = value;

-- With output parameter
DECLARE @result INT;
EXEC procedure_name @input = value, @output = @result OUTPUT;
SELECT @result;
```

#### Control Flow
| Statement | Description |
|-----------|-------------|
| IF/ELSE | Conditional execution |
| WHILE | Loop execution |
| BREAK | Exit loop |
| CONTINUE | Skip to next iteration |

---

## SQL Query Execution Order

```
FROM/JOIN >> WHERE >> GROUP BY >> HAVING >> SELECT >> DISTINCT >> ORDER BY >> LIMIT/OFFSET
```

---

## Database Used

The examples use the **BikeStores** sample database which includes:
- `sales.customers`
- `sales.orders`
- `sales.order_items`
- `sales.staffs`
- `production.products`
- `production.brands`
- `production.categories`
- `production.stocks`

---

## Additional Resources

For more detailed tutorials and examples, visit:
**[SQL Server Tutorial](https://www.sqlservertutorial.net/)**

Topics to explore further:
- [SELECT Statement](https://www.sqlservertutorial.net/sql-server-basics/sql-server-select/)
- [JOINS](https://www.sqlservertutorial.net/sql-server-basics/sql-server-joins/)
- [Subqueries](https://www.sqlservertutorial.net/sql-server-basics/sql-server-subquery/)
- [Indexes](https://www.sqlservertutorial.net/sql-server-indexes/)
- [Stored Procedures](https://www.sqlservertutorial.net/sql-server-stored-procedures/)

---

## File Structure

```
SQL Classes/
+-- where like top order fetch .sql    # Basic queries & filtering
+-- DDL & joins.sql                     # DDL, DML, and JOIN operations
+-- group having sub query.sql          # Aggregation and subqueries
+-- case_pk_row.sql                     # CASE, NULL functions, Views
+-- table cluster non_cluster .sql      # Index types
+-- indexes .sql                        # Index management
+-- advance if else cursor while.sql    # Stored procedures & control flow
+-- README.md                           # This documentation
```

---

*Last updated: March 2026*