SELECT * FROM [BikeStores].[sales].[customers] WHERE customer_id > 500 AND state = 'TX';

SELECT * FROM [BikeStores].[sales].[customers] ORDER BY first_name;
SELECT * FROM [BikeStores].[sales].[customers] ORDER BY first_name , state;
SELECT
    first_name,
    last_name,
    email
FROM
    [BikeStores].[sales].[customers];
SELECT
    city,
    COUNT (*)
FROM
    [BikeStores].[sales].[customers]
WHERE
    state = 'CA'
GROUP BY
    city
ORDER BY
    city;

-- Limiting Top
SELECT TOP(15) *
FROM [BikeStores].[sales].[customers];

---- FETCH / OFFSET
SELECT *
FROM [BikeStores].[sales].[customers]
ORDER BY first_name
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;
--
SELECT
    first_name,
    street
FROM
    [BikeStores].[sales].[customers]
ORDER BY
    last_name,
	city

OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

----fetch
SELECT
    product_name,
    list_price
FROM
    production.products
ORDER BY
    list_price,
    product_name 
OFFSET 10 ROWS 
FETCH NEXT 10 ROWS ONLY;

-- Operators (OR,NOT,AND,BETWEEN)
SELECT * FROM [BikeStores].[sales].[customers] 
WHERE customer_id BETWEEN 101 AND 155;

SELECT * FROM [BikeStores].[sales].[customers] 
WHERE customer_id > 100;


SELECT * FROM [BikeStores].[sales].[customers] 
WHERE last_name = 'Bates' OR first_name = 'Marget';

-- LIKE (with wildcard)
SELECT * FROM [BikeStores].[sales].[customers] 
WHERE first_name LIKE 'A%ron';

SELECT * FROM [BikeStores].[sales].[customers] 
WHERE first_name LIKE '[B-C]%';

-- concatination and ALIAS
SELECT CONCAT(first_name , last_name) AS full_name 
FROM [BikeStores].[sales].[customers]; 

SELECT first_name +'  '+last_name AS full_name
FROM  [BikeStores].[sales].[customers];
