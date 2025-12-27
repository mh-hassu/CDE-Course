--Q1. List top 5 customers by total order amount.
--Retrieve the top 5 customers who have spent the most across all sales orders. Show CustomerID, CustomerName, and TotalSpent.
 SELECT TOP 5 
        c.Name,
        s.CustomerID,        
		SUM(s.TotalAmount) AS Total_spent	
 FROM SalesOrder s
 INNER JOIN Customer c ON s.CustomerID = c.CustomerID
 GROUP BY s.CustomerID,c.Name
 ORDER BY Total_spent Desc
--Q2. Find the number of products supplied by each supplier.
--Display SupplierID, SupplierName, and ProductCount. Only include suppliers that have more than 10 products.
 SELECT 
       s.SupplierID,
	   s.Name as Supplier_name,
	   COUNT(pd.ProductID) as Product_count
 FROM  Supplier s
 INNER JOIN PurchaseOrder po ON s.SupplierID = po.SupplierID
 INNER JOIN PurchaseOrderDetail pd ON pd.OrderID = po.OrderID
 GROUP BY s.SupplierID,s.Name
 HAVING COUNT(pd.ProductID) > 10 
--Q3. Identify products that have been ordered but never returned.
--Show ProductID, ProductName, and total order quantity.
 SELECT 
     p.ProductID,
	 p.Name as Product_name,
	 rd.Quantity as total_order_quantity
 FROM Product p
 INNER JOIN ReturnDetail rd ON rd.ProductID = p.ProductID


--Q4. For each category, find the most expensive product.
--Display CategoryID, CategoryName, ProductName, and Price. Use a subquery to get the max price per category.
WITH CTE AS (
SELECT 
      c.CategoryID,
	  c.Name AS Category_name,
	  p.Name AS Product_name,
	  MAX(p.Price) AS max_price
FROM Category c
INNER JOIN Product p ON c.CategoryID =p.CategoryID
GROUP BY c.CategoryID,c.Name,p.Name )
--ORDER BY max_price DESC 
SELECT * FROM CTE
ORDER BY max_price DESC;
--Q5. List all sales orders with customer name, product name, category, and supplier.
--For each sales order, display:
--OrderID, CustomerName, ProductName, CategoryName, SupplierName, and Quantity.

SELECT 
      sod.OrderID,
	  c.Name as Customer_name,
	  p.Name as Product_name,
	  s.Name as Supplier_name,
	  pod.Quantity,
	  p.CategoryID
FROM SalesOrderDetail sod
INNER JOIN SalesOrder so ON so.OrderID = sod.OrderID
INNER JOIN Customer  c ON c.CustomerID = so.CustomerID
INNER JOIN  Product p ON p.ProductID = sod.ProductID
INNER JOIN  Category cy ON cy.CategoryID = p.CategoryID
INNER JOIN PurchaseOrderDetail pod ON pod.ProductID = p.ProductID
INNER JOIN PurchaseOrder po ON po.OrderID = pod.OrderID
INNER JOIN Supplier s ON po.SupplierID =s.SupplierID;

--Q6. Find all shipments with details of warehouse, manager, and products shipped.
--Display:
--ShipmentID, WarehouseName, ManagerName, ProductName, QuantityShipped, and TrackingNumber.
SELECT 
    s.ShipmentID,
	l.Name as WarehouseName,
	e.Name as ManagerName,
    p.Name as ProductName,
	sd.Quantity as QuantityShipped,
	s.TrackingNumber
FROM Shipment s
INNER JOIN ShipmentDetail sd ON s.ShipmentID = sd.ShipmentID
INNER JOIN Product p ON sd.ProductID = p.ProductID
INNER JOIN Warehouse w ON w.WarehouseID = s.WarehouseID
INNER JOIN Employee e ON w.ManagerID = e.EmployeeID
INNER JOIN Location l ON l.LocationID = w.LocationID

--Q7. Find the top 3 highest-value orders per customer using RANK(). Display CustomerID, CustomerName, OrderID, and TotalAmount.

WITH CTE AS (
SELECT 
    c.CustomerID,
	c.Name As CustomerName,
	s.OrderID,
	s.TotalAmount,
	RANK() OVER (
            PARTITION BY c.CustomerID 
            ORDER BY s.TotalAmount DESC
        ) as OrderRank
FROM Customer c
INNER JOIN SalesOrder s ON c.CustomerID = s.CustomerID
)
SELECT 
   *
FROM CTE 
WHERE OrderRank <= 3
Order By CustomerID,OrderRank


--Q8. For each product, show its sales history with the previous and next sales quantities (based on order date). 
--Display ProductID, ProductName, OrderID, OrderDate, Quantity, PrevQuantity, and NextQuantity.

WITH CTE AS (
SELECT 
       sod.ProductID,
	   p.Name as ProductName,
	   so.OrderID,
	   so.OrderDate,
	   sod.Quantity,
-- Gets the Quantity from the previous order for this specific product
        LAG(sod.Quantity) OVER (
            PARTITION BY p.ProductID 
            ORDER BY so.OrderDate, so.OrderID
        ) AS PrevQuantity,
        -- Gets the Quantity from the next order for this specific product
        LEAD(sod.Quantity) OVER (
            PARTITION BY p.ProductID 
            ORDER BY so.OrderDate, so.OrderID
        ) AS NextQuantity
FROM Product p
INNER JOIN SalesOrderDetail sod ON sod.ProductID = p.ProductID
INNER JOIN SalesOrder so  ON  so.OrderID = sod.OrderID
INNER JOIN Payment py ON py.OrderID = so.OrderID
)
SELECT  * FROM CTE
--Q9. Create a view named vw_CustomerOrderSummary that shows for each customer:
--CustomerID, CustomerName, TotalOrders, TotalAmountSpent, and LastOrderDate
SELECT 
     c.CustomerID,
	 c.Name as CustomerName,
	 Count(so.OrderID) as TotalOrders,
	 SUM(so.TotalAmount) as TotalAmountSpent,
	 MAX(so.OrderDate) as LastOrderDate
FROM Customer c
LEFT JOIN SalesOrder so ON so.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
--Q10. Write a stored procedure sp_GetSupplierSales that takes a SupplierID as input and 
--returns the total sales amount for all products supplied by that supplier.
CREATE PROCEDURE sp_GetSupplierSales
    @SupplierID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.SupplierID,
        s.Name AS SupplierName,
        SUM(sod.TotalAmount) AS TotalSalesAmount
    FROM supplier s
    INNER JOIN product p ON s.SupplierID = p.ManufacturerID -- Linking Supplier to Product
    INNER JOIN salesorderdetail sod ON p.ProductID = sod.ProductID
    WHERE s.SupplierID = @SupplierID
    GROUP BY s.SupplierID, s.Name;
END;

