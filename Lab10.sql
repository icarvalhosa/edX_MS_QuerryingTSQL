--Challenge 1, Q1
DECLARE @OrderDate date = GETDATE();
DECLARE @DueDate date = DATEADD(dd, 7, GETDATE());
DECLARE @CustomerID INT = 1;

/* SalesOrderID is auto generated */
INSERT INTO SalesLT.SalesOrderHeader(OrderDate, DueDate, CustomerID, ShipMethod)
VALUES (@OrderDate, @DueDate, @CustomerID, 'CARGO TRANSPORT 5');
PRINT IDENT_CURRENT('SalesLT.SalesOrderHeader');

--Challenge 1, Q2
DECLARE @OrderID INT = 71949 --or 0
DECLARE @ProductID INT = 760
DECLARE @Quantity INT = 1
DECLARE @UnitPrice MONEY = 782.99

IF EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
BEGIN
	INSERT INTO SalesLT.SalesOrderDetail(SalesOrderID, ProductID, OrderQty, UnitPrice)
	VALUES (@OrderID, @ProductID, @Quantity, @UnitPrice)
END
ELSE
BEGIN
	PRINT('The order does not exis')
END

--Challenge 2, Q1
DECLARE @MarketAvg INT = 2000;
DECLARE @MarketMax INT = 5000;
DECLARE @Avg INT
DECLARE @Max INT

SELECT @Avg = AVG(ListPrice), @Max = Max(ListPrice) 
FROM SalesLT.Product
WHERE ProductCategoryID IN
(SELECT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes');

PRINT @Avg;
PRINT @Max;

WHILE(@Avg < @MarketAvg)
BEGIN
	UPDATE SalesLT.Product
	SET ListPrice = ListPrice*1.1
	WHERE ProductCategoryID IN (SELECT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes');

	SELECT @Avg = AVG(ListPrice), @Max = Max(ListPrice) 
	FROM SalesLT.Product
	WHERE ProductCategoryID IN
	(SELECT ProductCategoryID FROM SalesLT.vGetAllCategories WHERE ParentProductCategoryName = 'Bikes');

	PRINT @Avg;
	PRINT @Max;

	IF(@Max >= @MarketMax)
		BREAK;
	ELSE
      CONTINUE;
END