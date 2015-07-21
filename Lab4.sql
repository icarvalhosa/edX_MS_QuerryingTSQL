--Challenge 1, Q1
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

--Challenge 1, Q2
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;

--Challenge 1, Q3
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
UNION ALL
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName, AddressType;

--Challenge 2. Q1
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
EXCEPT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
ORDER BY CompanyName;

--Challenge 2, Q2
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Main Office'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID
INTERSECT
SELECT c.CompanyName
FROM SalesLT.Customer as c
JOIN SalesLT.CustomerAddress as ca
ON c.CustomerID = ca.CustomerID AND ca.AddressType = 'Shipping'
JOIN SalesLT.Address AS a
ON a.AddressID = ca.AddressID;