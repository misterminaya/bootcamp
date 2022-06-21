
USE Northwind;
GO
-- 1.1.	Cree un stored procedure que reciba como parámetro de entrada el código de producto y lo borre de la tabla producto. (Puntos 3)

SELECT *FROM Products;
GO

CREATE PROCEDURE p_productsdelete 
    @idproduct INT
AS 
BEGIN 
DELETE FROM [Order Details] WHERE ProductID = @idproduct
DELETE FROM Products WHERE ProductID = @idproduct
END
GO

EXEC dbo.p_productsdelete  @idproduct=2;


-- 1.2.	Cree un trigger que cuando se actualice un producto se grabe en otra tabla ProductoActualizado (Puntos 2)

SELECT *FROM Products;

CREATE TABLE productoActualizado(
fecha DATETIME NOT NULL,
productID INT NOT NULL,
CategoryName VARCHAR(40) NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
)
GO

CREATE TRIGGER TR_Updateproducts
ON Products AFTER UPDATE
AS
BEGIN
DECLARE @productID INT
SET @productID = (SELECT productID FROM inserted)
DECLARE @ProductName VARCHAR(40)
SET @ProductName = (SELECT ProductName FROM inserted)
INSERT INTO productoActualizado VALUES(GETDATE(),@productID,@ProductName,'Producto actualizado')
END



UPDATE Products
SET UnitPrice = 100
WHERE ProductID=1;

SELECT *FROM Products;
SELECT *FROM Categories;
SELECT *FROM productoActualizado;

-- insert para comprobar de que 
INSERT INTO Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES('demo',1,1,'test demo',10,1,1,1,1);


INSERT INTO Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued)
VALUES('acuate',1,1,'acuate',10,1,1,1,1);

-- 1.3.	Cree una función del tipo tabla en línea que permita consultar las ventas de un determinado producto (Puntos 5).

SELECT *FROM Orders;
SELECT *FROM Products;
SELECT *FROM [Order Details];
GO

CREATE FUNCTION dbo.fn_consultaVentas(@productid  INT)
RETURNS TABLE
AS
RETURN(
SELECT *FROM [Order Details] WHERE ProductID = @productid)
GO

SELECT *FROM dbo.fn_consultaVentas(3);

-- 1.4.	Cree un usuario que pueda solamente actualizar las tablas clientes y productos (Puntos 5) 

USE master
USE [NORTHWIND]
GO
CREATE LOGIN [userminaya1] WITH PASSWORD='123456' MUST_CHANGE,
DEFAULT_DATABASE=[NORTHWIND], DEFAULT_LANGUAGE=[ESPAÑOL],
CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
CREATE USER [userminaya1] FOR LOGIN [userminaya1]
GO
GRANT UPDATE ON Customers TO [userminaya1]
GRANT UPDATE ON Products TO [userminaya1]
DENY  INSERT  ON Customers TO [userminaya1]
DENY  INSERT  ON Products TO [userminaya1]
DENY  DELETE  ON Customers TO [userminaya1]
DENY  DELETE  ON Products TO [userminaya1]





-- 1.5.	Cree un backup completo, un backup transaccional y un backup diferencial en ese orden (Puntos 5)

USE master
GO

--copia de seguridad
BACKUP DATABASE Northwind
TO DISK = 'C:\backup\20200721_FULL_Northwind.bak'
WITH INIT
GO

-- verificar cuantas copias de seguridad tiene el archivo
RESTORE HEADERONLY FROM DISK = 'C:\backup\20200721_FULL_Northwind.bak'
GO

BACKUP DATABASE Northwind
TO DISK = 'C:\backup\20200721_DIFF_Northwind.bak'
WITH INIT, DIFFERENTIAL
GO


BACKUP LOG Northwind
TO DISK = 'C:\backup\20200721_LOG_Northwind.trn'
WITH INIT
GO


