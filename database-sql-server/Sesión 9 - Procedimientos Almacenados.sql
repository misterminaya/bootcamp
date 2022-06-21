SELECT * FROM Customers
EXEC sp_help Customers
GO

--creaci�n del procedimiento
ALTER PROCEDURE AltaCustomers
@CustomerID	nchar(10), @CompanyName nvarchar(50), @ContactName	nvarchar(100), @ContactTitle	nvarchar(100),
@Address nvarchar(100), @City nvarchar(100), @Region nvarchar(100), @PostalCode nvarchar(100), @Country	nvarchar(100),
@Phone nvarchar(100), @Fax nvarchar(100)
AS
INSERT INTO Customers (CustomerID, CompanyName, ContactName,ContactTitle,Address,
                       City,Region,PostalCode,Country,Phone,Fax)
VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address,
                     @City,@Region,@PostalCode,@Country,@Phone,@Fax)
GO

--execuci�n
EXEC AltaCustomers '1000', 'Mi Compa��a', 'El Jefe','Gerente', 'Calle 1',
                   'Lima', 'Lima', '100', 'Per�', '123455', '1234'
				    
SELECT * FROM Customers