--DDl(Data Defination Language)
CREATE DATABASE MISC;
USE MISC;

DROP TABLE Lefttable;

CREATE TABLE Lefttable(
    Dated date,
	Country_ID int,
	Units int
);
CREATE TABLE Righttable(
  ID int,
  Country varchar(100)
);
--DML(Data Manipulation Language)

INSERT INTO Lefttable(Dated,Country_ID,Units) VALUES
('2020-01-01',1,40),
('2020-01-02',1,25),
('2020-01-03',3,30),
('2020-01-04',2,35);


INSERT INTO Righttable(ID,Country) VALUES
(3,'PANAMA'),
(4,'SPAIN');

SELECT * FROM Righttable

-- Quering
SELECT * FROM Lefttable;
SELECT * FROM Righttable;

SELECT * 
FROM Lefttable AS L
INNER JOIN Righttable AS R
ON L.Country_ID = r.ID;

SELECT 
  L.Country_ID,
  L.Dated,
  L.Units,
  R.Country
FROM Lefttable AS L
LEFT JOIN Righttable AS R
ON L.Country_ID = R.ID;

SELECT 
  R.ID,
  R.Country,
  L.Units,
  L.Dated
FROM Lefttable L
RIGHT JOIN Righttable R
ON L.Country_ID = R.ID;

SELECT *
FROM Lefttable L
FULL OUTER JOIN Righttable R
ON L.Country_ID = R.ID;

-- LEFT ANTI JOIN 

SELECT * 
FROM Lefttable L 
LEFT JOIN Righttable R
ON L.Country_ID = R.ID
WHERE R.Country IS NULL;

-- RIGHT ANTI JOIN 
SELECT *
FROM Lefttable L
RIGHT JOIN Righttable R
ON R.ID = L.Country_ID
WHERE Country is NULL;

--FROM/JOIN >> WHERE >> GROUP BY >>HAVING >> SELECT >> DISTINCT >> ORDER BY >> LIMIT/OFFSET 
-- CRoss JOIN
SELECT *
FROM Lefttable L
CROSS JOIN Righttable R ;
-- SEMI jOIn
SELECT *
FROM Lefttable L

USE BikeStores;
-- SELF JOIN
SELECT 
     e.first_name + ' ' + e.last_name AS employee_name,
	 m.first_name + ' ' + m.last_name AS manager_name
FROM [sales].[staffs] e
LEFT JOIN  [sales].[staffs] m
ON e.staff_id = m.manager_id;


SELECT
    state,
	count(*) AS state_count 
FROM sales.customers
GROUP BY state; 

SELECT 
    state,
	count(*) AS state_count 
FROM [sales].[customers]
GROUP BY state
HAVING COUNT(*) > 1000;
-- GROUP SETS
SELECT 
     b.brand_name AS brand,
	 c.category_name AS category,
	 p.model_year,
	 round(
        SUM (
            quantity * oi.list_price * (1 - discount)
        ),
        0
    ) AS sales INTO sales.sales_summary 
FROM sales.order_items oi
INNER JOIN production.products p ON oi.product_id = p.product_id
INNER JOIN production.brands  b   ON p.brand_id = b.brand_id
INNER JOIN production.categories c ON p.category_id = c.category_id
GROUP BY 
     b.brand_name,
	 c.category_name,
	 p.model_year
ORDER BY
     b.brand_name,
	 c.category_name,
	 p.model_year;

SELECT 
     brand,
	 category,
     SUM (sales) as brand_sales
FROM sales.sales_summary
GROUP BY brand, category;

SELECT SUM(sales) as total_sales
FROM sales.sales_summary;

SELECT * FROM sales.sales_summary;