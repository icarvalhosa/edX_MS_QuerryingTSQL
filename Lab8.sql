-- Challenge 1, Q1
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

--Challenge 1, Q2
SELECT a.CountryRegion, a.StateProvince, SUM(soh.TotalDue) AS Revenue,  
CASE 
	WHEN GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1 THEN 'Total'
	WHEN GROUPING_ID(a.CountryRegion) = 0 AND GROUPING_ID(a.StateProvince) = 1 THEN CONCAT(a.CountryRegion, ' Subtotal')
	WHEN GROUPING_ID(a.CountryRegion) = 0 AND GROUPING_ID(a.StateProvince) = 0 THEN CONCAT(a.StateProvince, ' Subtotal')
END AS Level
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince)
ORDER BY a.CountryRegion, a.StateProvince;

--Challenge 1, Q3
SELECT a.CountryRegion, a.StateProvince, a.City, SUM(soh.TotalDue) AS Revenue,  
CASE 
	WHEN GROUPING_ID(a.CountryRegion) = 1 AND GROUPING_ID(a.StateProvince) = 1 AND GROUPING_ID(a.City) = 1 THEN 'Total'
	WHEN GROUPING_ID(a.CountryRegion) = 0 AND GROUPING_ID(a.StateProvince) = 1 AND GROUPING_ID(a.City) = 1 THEN CONCAT(a.CountryRegion, ' Subtotal')
	WHEN GROUPING_ID(a.CountryRegion) = 0 AND GROUPING_ID(a.StateProvince) = 0 AND GROUPING_ID(a.City) = 1 THEN CONCAT(a.StateProvince, ' Subtotal')
	WHEN GROUPING_ID(a.CountryRegion) = 0 AND GROUPING_ID(a.StateProvince) = 0 AND GROUPING_ID(a.City) = 0 THEN CONCAT(a.City, ' Subtotal')
END AS Level
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca ON a.AddressID = ca.AddressID
JOIN SalesLT.Customer AS c ON ca.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderHeader as soh ON c.CustomerID = soh.CustomerID
GROUP BY ROLLUP(a.CountryRegion, a.StateProvince, a.City)
ORDER BY a.CountryRegion, a.StateProvince, a.City;

--Challenge 2, Q1
SELECT * FROM (
SELECT c.CompanyName, vgac.ParentProductCategoryName, sod.LineTotal
FROM SalesLT.SalesOrderHeader AS soh
JOIN SalesLT.Customer AS c
ON soh.CustomerID = c.CustomerID
JOIN SalesLT.SalesOrderDetail AS sod
ON soh.SalesOrderID = sod.SalesOrderID
JOIN SalesLT.Product AS p
ON sod.ProductID = p.ProductID
JOIN SalesLT.vGetAllCategories AS vgac
ON p.ProductCategoryID = vgac.ProductCategoryID) AS PCN
PIVOT 
(
SUM(LineTotal) 
FOR [ParentProductCategoryName] IN ([Accessories], [Bikes], [Clothing], [Components])
) AS PPCN
ORDER BY CompanyName;
