--Challenge 1, Q1
INSERT INTO SalesLT.Product(Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES 
('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE());

--------
----@@IDENTITY: the last identity generated in the session
----SCOPE_IDENTITY(): The last identity generated in the current scope
----IDENT_CURRENT('<table_name>'): The last identity generated into the table

SELECT SCOPE_IDENTITY();

SELECT * FROM SalesLT.Product
WHERE ProductID = SCOPE_IDENTITY();

--Challenge 1, Q2
INSERT INTO SalesLT.ProductCategory(ParentProductCategoryID, Name)
VALUES (4, 'Bells and Horns');

INSERT INTO SalesLT.Product(Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
VALUES 
('Bicycle Bell','BB-RING', 2.47, 4.99, 42, GETDATE()), 
('Bicycle Horn', 'BB-PARP', 1.29, 3.75, IDENT_CURRENT('SalesLT.ProductCategory'), GETDATE());

SELECT * FROM SalesLT.ProductCategory;
SELECT * FROM SalesLT.Product;

--Challenge 2, Q1
UPDATE SalesLT.Product
SET ListPrice = ListPrice*1.1
WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

SELECT * FROM SalesLT.Product;

--Challenge 2, Q2
UPDATE SalesLT.Product
SET DiscontinuedDate = GETDATE()
WHERE ProductCategoryID = 37 AND Name NOT LIKE '%LED Lights%';

SELECT * FROM SalesLT.Product;

--Challenge 3, Q1
DELETE FROM SalesLT.Product
WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

DELETE FROM SalesLT.ProductCategory
WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory WHERE Name = 'Bells and Horns');

