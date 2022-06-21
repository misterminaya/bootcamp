USE Northwind
GO

----------------------------------------
--- FUNCIONES ESCALARES
----------------------------------------
--Creaci�n de la funci�n de tipo Escalar
CREATE FUNCTION fn_Prueba01
	(@N1 Int, @N2 Int) 
	RETURNS Int
BEGIN
	DECLARE @Suma Int
	SET @Suma = @N1 + @N2
	RETURN @Suma
END
GO

--USO DEL ESQUEMA EN LAS CONSULTAS:
--consulta sin esquema
SELECT * FROM Customers
go

--consulta con esquema
SELECT * FROM dbo.Customers
go

--Prueba de la funci�n, llamada directa:
-- obligatorio el uso del esquema (dbo)
SELECT dbo.fn_Prueba01(3,4) AS Resultado

--Prueba de la funci�n, uso en una consulta:
-- obligatorio el uso del esquema (dbo)
SELECT ProductName, UnitPrice,  UnitsInStock, UnitsOnOrder,
dbo.fn_Prueba01(UnitsInStock,UnitsOnOrder) AS TotalUnits 
FROM dbo.Products

--prueba de la funci�n, uso de variables
DECLARE @Resultado int
SET @Resultado = dbo.fn_Prueba01(3,4)
SELECT @Resultado
GO

--Modificaci�n de funciones
--obtener el cuerpo de la funci�n (el c�digo)
EXEC sys.sp_helptext 'dbo.fn_Prueba01'
GO
  
ALTER FUNCTION fn_Prueba01  
 (@N1 Int, @N2 Int)   
 RETURNS Int  
BEGIN  
 DECLARE @Suma Int  
 SET @Suma = (@N1 + @N2) * 2
 RETURN @Suma  
END  
GO

--eliminaci�n de funciones
DROP FUNCTION fn_Prueba01
GO

--creaci�n de funci�n p�blica en la bd modelo
USE model
GO
CREATE FUNCTION fn_Prueba01  
 (@N1 Int, @N2 Int)   
 RETURNS Int  
BEGIN  
 DECLARE @Suma Int  
 SET @Suma = (@N1 + @N2) * 2
 RETURN @Suma  
END  
GO

--creaci�n de una nueva base de datos para probar funci�n p�blica
USE master
GO

CREATE DATABASE Nueva_BD
GO

--prueba de funci�n escalar para manejo de fecha
USE Northwind
GO

CREATE FUNCTION fn_MiFecha
  (@indate datetime, @separator char(1))
  RETURNS char(20)
AS
BEGIN
  RETURN 
  CONVERT(varchar(20), DATEPART(dd,@indate)) --cambiar el tipo de dato (ej, de entero a caracter)
  + @separator
  + CONVERT(varchar(20), DATEPART(mm,@indate))
  + @separator
  + CONVERT(varchar(20), DATEPART(yy,@indate))
END
GO

SELECT GETDATE()

SELECT dbo.fn_MiFecha (GETDATE(), '-')

--probar la funci�n us�ndola en una consulta
SELECT OrderID, CustomerID, OrderDate, 
dbo.fn_MiFecha(OrderDate, '/') AS FechaOrden
FROM Orders

--identificar las funciones que existen en la BD
SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION'

--identificar los par�metros de las funciones
SELECT * FROM INFORMATION_SCHEMA.PARAMETERS


----------------------------------------
--- FUNCIONES DE VALOR DE TABLA EN L�NEA
--- formadas por una sentencia SELECT
--- simpre retorna TABLE
--- no usa bloque BEGIN..END
----------------------------------------
USE Northwind
GO

SELECT o.OrderID, o.OrderDate,
       CONCAT(e.LastName,', ',e.FirstName) AS EmployeeName, e.Title
FROM Orders o INNER JOIN Employees e
ON o.EmployeeID=e.EmployeeID
WHERE e.Title = 'Sales Manager'
GO

--convertimos la consulta en una funci�n de valor de tabla
CREATE FUNCTION fn_ConsultaEmpleados
  (@Puesto varchar(50))
  RETURNS Table
AS
  RETURN (SELECT o.OrderID, o.OrderDate,
       CONCAT(e.LastName,', ',e.FirstName) AS EmployeeName, e.Title
FROM Orders o INNER JOIN Employees e
ON o.EmployeeID=e.EmployeeID
WHERE e.Title = @Puesto)
GO

--Prueba de la funci�n de valor de tabla en l�nea
SELECT * FROM dbo.fn_ConsultaEmpleados('Sales Manager')

SELECT * FROM dbo.fn_ConsultaEmpleados('Sales Representative')