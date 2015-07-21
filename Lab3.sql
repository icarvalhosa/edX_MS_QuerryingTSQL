--Challenge 1, Q1
SELECT c.CompanyName, s.SalesOrderID, s.TotalDue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader as s
ON c.CustomerID = s.CustomerID;

--Challenge 1, Q2
SELECT c.CompanyName, s.SalesOrderID, s.TotalDue, 
		a.AddressLine1+', '+ISNULL(a.AddressLine2+', ', '')+a.City+', '+a.StateProvince+', '+a.PostalCode+', '+a.CountryRegion AS MainOfficeAddress
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON ca.CustomerID = c.CustomerID AND ca.AddressType = 'Main Office'
LEFT JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID;

--Challenge 2, Q1
SELECT	c.CompanyName, c.FirstName AS ContactFirstName, c.LastName AS ContactLastName, s.SalesOrderID, s.TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
ORDER BY s.SalesOrderID DESC;

--Challenge 2, Q2
SELECT c.CustomerID, c.CompanyName, c.FirstName AS ContactFirstName, c.LastName AS ContactLastName, c.Phone 
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
WHERE ca.CustomerID IS NULL;

--Challenge 2, Q3
SELECT c.CustomerID, p.ProductID 
FROM SalesLT.Customer AS c
FULL OUTER JOIN SalesLT.SalesOrderHeader sh
ON c.CustomerID = sh.CustomerID
FULL OUTER JOIN SalesLT.SalesOrderDetail AS sd
ON sh.SalesOrderID = sd.SalesOrderID
FULL OUTER JOIN SalesLT.Product AS p
ON sd.ProductID = p.ProductID
WHERE sh.SalesOrderID IS NULL;
