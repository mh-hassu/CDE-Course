--DISABLE index
ALTER INDEX [ix_customers_city]
ON [sales].[customers]
DISABLE;
--RENAME Index UI
-- FOR ALL INDEXES
ALTER INDEX ALL
ON [sales].[customers]
DISABLE;

-- Enable Index

ALTER INDEX ALL
ON [sales].[customers]
REBUILD;

--TASK:
-- simply query on any table
-- create non-cluster index
-- query the table again and observe the result.
-- rename the index 
-- query again an observe 
-- disable the index 
-- query again and observe
-- rebuild and query again

SELECT product_name FROM production.products;
CREATE INDEX ix_product_name ON production.products(product_name);
SELECT product_name FROM production.products;

-- Unique Index
SELECT
    customer_id, 
    email,
	first_name
FROM
    sales.customers
WHERE 
    email = 'caren.stephens@msn.com';

-- Duplicate Emails
SELECT 
    email, 
    COUNT(email)
FROM 
    sales.customers
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;
-- unique
CREATE UNIQUE INDEX ix_cust_email 
ON sales.customers(email);

-------------------------
drop table dbo.t1;
CREATE TABLE t1 (
    a INT, 
    b INT
);

CREATE UNIQUE INDEX ix_uniq_ab 
ON t1(a, b);

INSERT INTO t1(a,b) VALUES(1,1);

INSERT INTO t1(a,b) VALUES(1,2);

INSERT INTO t1(a,b) VALUES(1,2);
------------------

CREATE TABLE t2(
    a INT
);

CREATE UNIQUE INDEX a_uniq_t2
ON t2(a);
INSERT INTO t2(a) VALUES(NULL);
-- can't  NULL 
-- Drop index
DROP INDEX  produ 
--filter index
select 