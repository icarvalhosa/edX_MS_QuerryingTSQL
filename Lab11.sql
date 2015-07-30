--Challenge 1, Q1
DECLARE @SalesOrderID int = 0
IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
BEGIN
	THROW 50001, 'The order does not exist.', 0
END
ELSE
BEGIN
	DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
	DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
END

--Challenge 1, Q2
DECLARE @SalesOrderID int = 0
BEGIN TRY
	IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
	BEGIN
		THROW 50001, 'The order does not exist.', 0
	END
	ELSE
	BEGIN
		DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
		DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
	END
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH;

--Challenge 2, Q1
DECLARE @SalesOrderID int = 0;
--SELECT @SalesOrderID = MAX(SalesOrderID) FROM SalesLT.SalesOrderHeader;
BEGIN TRY
	IF EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID)
	BEGIN
		BEGIN TRANSACTION
			DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @SalesOrderID;
			THROW 50002, 'Test error', 0  --Uncomment to test transaction
			DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;
		COMMIT TRANSACTION
	END
	ELSE
	BEGIN
		THROW 50001, 'The order does not exist.', 0;
	END
END TRY

BEGIN CATCH
	IF @@TRANCOUNT > 0
	BEGIN
		ROLLBACK TRANSACTION;
		THROW;
	END
	ELSE
	BEGIN
	PRINT ERROR_MESSAGE();
	END
END CATCH;
