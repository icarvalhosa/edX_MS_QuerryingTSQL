--Challenge 1, Q1
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

--Challenge 1, Q2
SELECT TOP 10 Percent Name
FROM SalesLT.Product
ORDER BY Weight DESC;

--Challenge 1, Q3
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS 
FETCH NEXT 100 ROWS ONLY;

--Challenge 2, Q1
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

--Challenge 2. Q2
SELECT ProductNumber, Name
FROM SalesLT.Product
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');

--Challenge 2. Q3
SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

--Challenge 2. Q4
SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';