--Challenge 1, Q1
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight
FROM SalesLT.Product;

--Challenge 1, Q2
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth
FROM SalesLT.Product;

--Challenge 1, Q3
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth, 
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product;

--Challenge 1, Q4
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight, DATENAME(YYYY, SellStartDate) AS SellStartYear, DATENAME(MM, SellStartDate) AS SellStartMonth, 
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

--Challenge 2, Q1
SELECT c.CompanyName, sh.TotalDue, RANK()OVER(ORDER BY sh.TotalDue DESC) AS TotalDueRank
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS sh
ON c.CustomerID = sh.CustomerID;

--Challenge 3, Q1
SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

--Challenge 3, Q2
SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY TotalRevenue DESC;

--Challeng 3, Q3
SELECT p.Name, SUM(sd.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sd
JOIN SalesLT.Product AS p
ON p.ProductID = sd.ProductID
GROUP BY p.Name
HAVING SUM(sd.LineTotal) > 20000
ORDER BY TotalRevenue DESC;
