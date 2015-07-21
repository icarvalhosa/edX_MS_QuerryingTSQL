--Challenge 1, Q1
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice > 
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail);

--Challenge 1, Q2
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice >= 100
AND ProductID IN 
(SELECT ProductID
FROM SalesLT.SalesOrderDetail
WHERE UnitPrice < 100);

--Challenge 1, Q3
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(sd.UnitPrice) 
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p;

--Challenge 1, Q4
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
(SELECT AVG(sd.UnitPrice)
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID) AS AverageUnitPrice
FROM SalesLT.Product AS p
WHERE p.StandardCost > 
(SELECT AVG(sd.UnitPrice)
FROM SalesLT.SalesOrderDetail AS sd
WHERE sd.ProductID = p.ProductID);

--Challenge 2, Q1
SELECT sh.SalesOrderID, ci.CustomerID, ci.FirstName, ci.LastName, sh.TotalDue
FROM SalesLT.SalesOrderHeader AS sh
CROSS APPLY dbo.ufnGetCustomerInformation(sh.CustomerID) AS ci
ORDER BY sh.SalesOrderID;

--Challenge 2, Q2
SELECT ci.CustomerID, ci.FirstName, ci.LastName, a.AddressLine1, a.City
FROM SalesLT.CustomerAddress AS ca
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
OUTER APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ci.CustomerID;

