-- Challenge 1, Q1
select * from SalesLT.Customer;

-- Challenge 1, Q2
select Title, FirstName, MiddleName, LastName, Suffix 
from SalesLT.Customer;

-- Challenge 1, Q3
select SalesPerson, Title + LastName as CustomerName, Phone
from SalesLT.Customer;

-- Challenge 2, Q1
 select convert(varchar(5), CustomerID) + ': ' + CompanyName from SalesLT.Customer;

-- Challenge 2, Q2
select SalesOrderNumber + ' (' + convert(varchar(2), RevisionNumber) +')', convert(nvarchar(30), OrderDate, 102) as OrderDate 
from SalesLT.SalesOrderHeader;

-- Challenge 3, Q1
select FirstName + ' ' + isnull(MiddleName + ' ', '') + LastName as CustomerName
from SalesLT.Customer;
 
-- Challenge 3, Q2
UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1;
select CustomerID, coalesce (EmailAddress, Phone) as PrimaryContact
from SalesLT.Customer;

-- Challenge 3, Q3
UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;
select SalesOrderID, OrderDate, 
		case
			when ShipDate is null then 'Awaiting Shipment'
			else 'Shipped'
		end as ShippingStatus
from SalesLT.SalesOrderHeader;