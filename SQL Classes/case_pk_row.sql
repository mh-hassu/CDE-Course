--1 -> PEnding 
-- 2   processing
-- 3  rejected 
--4  completed 
SELECT 
    case order_status
	WHEN 1 THEN 'Pending'
	WHEN 2 THEN 'Processing'
	WHEN 3 THEN 'Rejected'
	END AS modified_or_status,
	count(*) AS or_status_count
FROM [sales].[orders]
GROUP BY order_status;
    case order_status
	WHEN 1 THEN 'Pending'
	WHEN 2 THEN 'Processing'
	WHEN 3 THEN 'Rejected'
	WHEN 4 THEN 'Completed'
	END;


SELECT * FROM [sales].[order_items];
SELECT    
    o.order_id, 
    SUM(quantity * list_price) as order_value,
    CASE
        WHEN SUM(quantity * list_price) <= 500 
            THEN 'Very Low'
        WHEN SUM(quantity * list_price) > 500 AND 
            SUM(quantity * list_price) <= 1000 
            THEN 'Low'
        WHEN SUM(quantity * list_price) > 1000 AND 
            SUM(quantity * list_price) <= 5000 
            THEN 'Medium'
        WHEN SUM(quantity * list_price) > 5000 AND 
            SUM(quantity * list_price) <= 10000 
            THEN 'High'
        WHEN SUM(quantity * list_price) > 10000 
            THEN 'Very High'
    END order_priority
FROM    
    sales.order_items o
GROUP BY 
    o.order_id;


--COALESCE
SELECT COALESCE('Hi',NULL);

SELECT 
	first_name,
	last_name,
	COALESCE(phone,'Hi') as phone
FROM [sales].[customers];


--NULLIF
-- lhs = rhs (lhs)
-- LHS != rhs (NULL)

SELECT NULLIF (10,20);

SELECT NULLIF ('Hello','Hi');

-- HANDLING DUPLICATES
DROP TABLE IF EXISTS t1;
CREATE TABLE t1 (
    id INT IDENTITY(1, 1), 
    a  INT, 
    b  INT, 
    PRIMARY KEY(id)
);
INSERT INTO
    t1(a,b)
VALUES
    (1,1),
    (1,2),
    (1,3),
    (2,1),
    (1,2),
    (1,3),
    (2,1),
    (2,2);

SELECT * FROM t1;

SELECT 
     a,
	 b,
	 count(*) records_count
FROM t1
GROUP BY a,b
HAVING COUNT (*) < 2;

SELECT DISTINCT id , a,b FROM t1;

WITH cte_duplicates AS (
     SELECT 
     a,
	 id,
	 b,
	 
     ROW_NUMBER () OVER (
	 PARTITION BY a,b
	 ORDER BY a,b 
	 ) AS rn
	 
     FROM t1 
)
SELECT
  a,
  b,
  id
FROM 
    cte_duplicates
WHERE rn =1	;




-- id coll col2  = col_new
-- 1    1    1 =   1 
-- 1    1    2  =  2


--VIEWS
CREATE VIEW product_catalog 
AS
SELECT 
		 p.product_id,
		 p.product_name,
		 p.list_price,
		 p.model_year,
		 c.category_id,
		 c.category_name,
		 b.brand_id,
		 b.brand_name,
		 s.product_id,
		 s.quantity,
		 s.store_id

FROM [production].[products]  p 
INNER JOIN [production].[categories] c ON p.category_id = c.category_id
INNER JOIN [production].[brands] b ON p.brand_id = b.brand_id
INNER JOIN  [production].[stocks] s ON p.product_id = s.product_id;

SELECT * 
FROM dbo.product_catalog;



--LISTING In VIEW
SELECT  name fROmsys.