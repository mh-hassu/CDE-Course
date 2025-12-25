USE BikeStores;
SELECT  * FROM [sales].[customers];

--group by , having

SELECT 
    state,
   COUNT(state) AS customer_per_state
FROM [sales].[customers]
GROUP BY state
HAVING COUNT(state) > 200;


SELECT  
   brand,
   category,
   SUM(sales) AS total_sales
FROM [sales].[sales_summary]
GROUP BY brand,category;

-- grouping sets

--a,b = (), (a),(b),(a,b)
--eg: brand,category
--  - total ()
--	- per brand (brand)
--	- per category (category)
--	-per brandper category (brand,category)

SELECT  
   brand,
   category,
   SUM(sales) AS total_sales
FROM [sales].[sales_summary]
GROUP BY 
 GROUPING SETS( 
 (),
 (brand),
 (category),
 (brand,category)
 );

 --CUBE

 SELECT  
   brand,
   category,
   SUM(sales) AS total_sales
FROM [sales].[sales_summary]
GROUP BY 
     CUBE (brand,category);

-- ROLLUP
 SELECT  
   brand,
   category,
   SUM(sales) AS total_sales
FROM [sales].[sales_summary]
GROUP BY 
     ROLLUP(brand,category);

-- SUB-QUERY

SELECT customer_id FROM [sales].[customers] WHERE state = 'NY';

SELECT * FROM [sales].[orders] 
WHERE customer_id IN (
      SELECT customer_id 
      FROM [sales].[customers]
      WHERE state = 'NY'
);

SELECT * FROM [sales].[order_items]
WHERE  order_id IN (
                  SELECT customer_id
				  FROM [sales].[customers]
				  WHERE list_price < 200
);

-- SQL Server Corelated Subquery
SELECT 
    product_name,
    list_price,
    category_id
FROM [production].[products] AS p1
WHERE
    list_price IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
    )
ORDER BY
    category_id,
    product_name;



SELECT * FROM sys.databases;

IF NOT EXISTS(
SELECT name FROM sys.databases WHERE name = 'MISC'
)
BEGIN 
  CREATE DATABASE testing ;
END



