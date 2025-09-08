-- Filters customers by DeliveryCityID and shows their names.
SELECT CustomerName
FROM Sales.Customers
WHERE DeliveryCityID = '232';

-- Counts how many orders each customer made.
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC;

-- Counts how many orders each customer made.
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC;

-- Counts how many orders each customer made.
SELECT CustomerID, COUNT(OrderID) AS TotalOrders
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY TotalOrders DESC;

-- Shows products with quantity greater than 0.
SELECT StockItemID, QuantityOnHand
FROM Warehouse.StockItemHoldings
WHERE QuantityOnHand > 0;

-- Retrieves orders with quantity more than 100.
SELECT OrderID, StockItemID, Quantity
FROM Sales.OrderLines
WHERE Quantity > 100;

-- Shows customers who have a postal code.
SELECT CustomerID, CustomerName, PostalPostalCode
FROM Sales.Customers
WHERE PostalPostalCode IS NOT NULL;

-- Shows customers who have a postal code.
SELECT CustomerID, CustomerName, PostalPostalCode
FROM Sales.Customers
WHERE PostalPostalCode IS NOT NULL;

-- Shows customers who have a postal code.
SELECT CustomerID, CustomerName, PostalPostalCode
FROM Sales.Customers
WHERE PostalPostalCode IS NOT NULL;

-- Calculates the total tax for each invoice.
SELECT InvoiceID, SUM(TaxAmount) AS TotalTax
FROM Sales.InvoiceLines
GROUP BY InvoiceID;

-- Shows the top 5 products by quantity sold.
SELECT TOP 5 
    il.StockItemID, 
    SUM(il.Quantity) AS TotalSold
FROM Sales.InvoiceLines il
GROUP BY il.StockItemID
ORDER BY TotalSold DESC;

-- Shows the top 5 highest-priced products.
SELECT TOP 5 StockItemID, StockItemName, RecommendedRetailPrice
FROM Warehouse.StockItems
ORDER BY RecommendedRetailPrice DESC;

-- Shows products that have a tax rate.
SELECT StockItemID, StockItemName, TaxRate
FROM Warehouse.StockItems
WHERE TaxRate IS NOT NULL;

-- Shows customers who made more than 5 orders.
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Sales.Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 5;

-- Lists all products in the warehouse.
SELECT StockItemID, StockItemName
FROM Warehouse.StockItems;

-- Shows the most recent order date for each customer.
SELECT CustomerID, MAX(OrderDate) AS MostRecentOrder
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY MostRecentOrder DESC;

-- Filters orders placed on the last day of the month.
SELECT OrderID, OrderDate, CustomerID
FROM Sales.Orders
WHERE OrderDate = EOMONTH(OrderDate);

-- Shows customers whose credit limit is over 4000.
SELECT CustomerID, CustomerName, CreditLimit
FROM Sales.Customers
WHERE CreditLimit > 4000;

-- Lists customers who have a website URL.
SELECT CustomerID, CustomerName, WebsiteURL
FROM Sales.Customers
WHERE WebsiteURL IS NOT NULL;

-- Shows the earliest order date for each customer.
SELECT CustomerID, MIN(OrderDate) AS EarliestOrder
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY EarliestOrder ASC;

-- Shows customers with the highest credit limit.
SELECT CustomerID, CustomerName, CreditLimit 
FROM Sales.Customers
WHERE CreditLimit = (SELECT MAX(CreditLimit) FROM Sales.Customers);
