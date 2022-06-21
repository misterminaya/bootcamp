USE Northwind
GO

----------------------------------------
--- FUNCIONES ESCALARES
----------------------------------------
--Creación de la función de tipo Escalar
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

--Prueba de la función, llamada directa:
-- obligatorio el uso del esquema (dbo)
SELECT dbo.fn_Prueba01(3,4) AS Resultado

--Prueba de la función, uso en una consulta:
-- obligatorio el uso del esquema (dbo)
SELECT ProductName, UnitPrice,  UnitsInStock, UnitsOnOrder,
dbo.fn_Prueba01(UnitsInStock,UnitsOnOrder) AS TotalUnits 
FROM dbo.Products

--prueba de la función, uso de variables
DECLARE @Resultado int
SET @Resultado = dbo.fn_Prueba01(3,4)
SELECT @Resultado
GO

--Modificación de funciones
--obtener el cuerpo de la función (el código)
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

--eliminación de funciones
DROP FUNCTION fn_Prueba01
GO

--creación de función pública en la bd modelo
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

--creación de una nueva base de datos para probar función pública
USE master
GO

CREATE DATABASE Nueva_BD
GO

--prueba de función escalar para manejo de fecha
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

--probar la función usándola en una consulta
SELECT OrderID, CustomerID, OrderDate, 
dbo.fn_MiFecha(OrderDate, '/') AS FechaOrden
FROM Orders

--identificar las funciones que existen en la BD
SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION'

--identificar los parámetros de las funciones
SELECT * FROM INFORMATION_SCHEMA.PARAMETERS


----------------------------------------
--- FUNCIONES DE VALOR DE TABLA EN LÍNEA
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

--convertimos la consulta en una función de valor de tabla
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

--Prueba de la función de valor de tabla en línea
SELECT * FROM dbo.fn_ConsultaEmpleados('Sales Manager')

SELECT * FROM dbo.fn_ConsultaEmpleados('Sales Representative')