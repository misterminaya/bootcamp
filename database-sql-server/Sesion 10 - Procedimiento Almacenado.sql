USE Master
GO

CREATE DATABASE Sociedad
GO

USE Sociedad
GO

--Tabla de ejemplo de clientes
CREATE TABLE Cliente
(ClienteID INT NOT NULL,
 NombreCliente VARCHAR(40) NOT NULL,
 DistritoCliente VARCHAR(15) NOT NULL,
 TelefonoCliente VARCHAR(13) NOT NULL)
GO

SELECT * FROM Cliente
GO

INSERT Cliente VALUES (1, 'ROBERT MATTOS CARDENAS', 'Rimac', '3245876')
INSERT Cliente VALUES (2, 'ENRIQUE PAREDES	TRUJILLO', 'Los Olivos', '4959554')
INSERT Cliente VALUES (3, 'JOEL TINCO	HUALLPA', 'San Isidro', '4791004')
INSERT Cliente VALUES (4, 'PABLO ROMERO	ZAVALA', 'Surco', '4151004')
INSERT Cliente VALUES (5, 'RENEE ROSALES GOICOCHEA', 'Chorrillos', '4568741')
INSERT Cliente VALUES (6, 'SILVIA AVENDAÑO	NOLASCO', 'Ate', '4568741')
GO

SELECT * FROM Cliente
GO

EXEC sp_help Cliente
GO

--Crear procedimiento que no usa parámetros
CREATE PROCEDURE ListaCliente
AS
SELECT ClienteID, NombreCliente, DistritoCliente, TelefonoCliente 
FROM Cliente
GO

EXEC ListaCliente
GO

--Consulta compleja encapsulada en un procedimiento
USE Northwind
GO

CREATE PROCEDURE VentasProveedor
AS
SELECT S.CompanyName, 
SUM(OD.UnitPrice*OD.Quantity*(1-OD.DISCOUNT)) AS [Monto de Ventas]
FROM		Suppliers		S
INNER JOIN	Products		P	ON	S.SupplierID = P.SupplierID
INNER JOIN	[Order Details]	OD	ON	P.ProductID =OD.ProductID
GROUP BY S.CompanyName
GO

EXEC VentasProveedor
GO

--Procedimiento almacenado con parámetros
--parámetro: variable que recibe un valor y lo usa en el programa
USE Sociedad
GO

EXEC sp_help Cliente
GO

--Procedimiento almadenado de inserción de nuevos registros, tabla Cliente
CREATE PROCEDURE AgregaCliente
--BUENA PRACTICA:Nombre y tipo de dato de parámetros, igual al campo (respetar mayúsculas)
(@ClienteID INT,
 @NombreCliente VARCHAR(40),
 @DistritoCliente VARCHAR(15),
 @TelefonoCliente VARCHAR(13)='000-000000000')
AS
--INSERTAR NUEVO REGISTRO (incluir las columnas de la tabla)
--BUENA PRACTICA: Incluir los nombres de columna de la tabla en el INSERT INTO
INSERT INTO Cliente (ClienteID, NombreCliente, DistritoCliente, TelefonoCliente)
VALUES (@ClienteID, @NombreCliente, @DistritoCliente, @TelefonoCliente)

--CONSULTA LA TABLA (--> NO USAR * <--)
--BUENA PRACTICA: Incluir los nombres de columna de la consulta SELECT
SELECT ClienteID, NombreCliente, DistritoCliente, TelefonoCliente FROM Cliente
GO

SELECT * FROM Cliente

--EJECUTAR EL PROCEDIMIENTO CON LOS PARAMETROS
--BUENA PRACTICA:Usar los nombres de los parámetros en la llamada al procedimiento
EXEC AgregaCliente
@ClienteID = 7,
@NombreCliente = 'PEDRO PEREZ SCHULLER',
@DistritoCliente = 'Lince',
@TelefonoCLiente = '456-7890'
GO

--EJECUTAR EL PROCEDIMIENTO CON LOS PARAMETROS, menos el teléfono
EXEC AgregaCliente
@ClienteID = 8,
@NombreCliente = 'LIZ PACHAS KING',
@DistritoCliente = 'Miraflores'
GO

--PROCEDIMIENTO ALMACENADO CON PARAMETRO DE ENTRADA Y SALIDA
CREATE PROCEDURE BuscaCliente
@ClienteID INT, @NombreCliente VARCHAR(40) OUTPUT
AS
SELECT @NombreCliente = NombreCliente FROM Cliente
WHERE ClienteID = @ClienteID
GO

--EJECUCIÓN DEL PROCEDIMIENTO ALMACENADO CON PARAMETRO DE ENTRADA Y SALIDA
DECLARE @NombreCliente VARCHAR(40)
EXEC BuscaCliente 3, @NombreCliente OUTPUT
PRINT 'El nombre del cliente es '+@NombreCliente


USE Northwind
GO
CREATE PROCEDURE ObtenerDatosProducto
@ProductID INT, @ProductName NVARCHAR(40) OUTPUT, 
@CompanyName NVARCHAR(40) OUTPUT, @Country NVARCHAR(15) OUTPUT, 
@CategoryName NVARCHAR(15) OUTPUT, @UnitPrice MONEY OUTPUT
AS
SELECT @ProductName = P.ProductName, @CompanyName= S.CompanyName, 
@Country = S.Country, @CategoryName = C.CategoryName, @UnitPrice = P.UnitPrice
FROM Categories	C
INNER JOIN	Products P ON C.CategoryID = P.CategoryID
INNER JOIN	Suppliers S ON P.SupplierID = S.SupplierID
WHERE P.ProductID = @ProductID
GO

-- Probando el SP	
DECLARE @ProductName NVARCHAR(40), @CompanyName NVARCHAR(40), 
@Country NVARCHAR(15), @CategoryName NVARCHAR(15), @UnitPrice MONEY
EXEC ObtenerDatosProducto 33, @ProductName OUTPUT, @CompanyName OUTPUT, 
@Country OUTPUT, @CategoryName OUTPUT, @UnitPrice OUTPUT
SELECT @ProductName AS ProductName, @CompanyName AS CompanyName, 
       @Country AS Country, @CategoryName AS CategoryName, @UnitPrice AS UnitPrice
GO

--MANEJO DE LOS PROCEDIMENTOS ALMACENADOS
USE Sociedad
GO

--conocer cuales son los procedimientos almacenados en la base de datos
SELECT * FROM sys.procedures

--obtener codigo del procedimiento almacenado
EXEC sp_helptext AgregaCliente
GO


--MODIFICACIÓN del Procedimiento almadenado de inserción de nuevos registros, tabla Cliente  
--usar ALTER en vez de CREATE
ALTER PROCEDURE AgregaCliente  
(@ClienteID INT,  
 @NombreCliente VARCHAR(40),  
 @DistritoCliente VARCHAR(15),  
 @TelefonoCliente VARCHAR(13)='000-000000000')  
AS  
--INSERTAR NUEVO REGISTRO (incluir las columnas de la tabla)  
INSERT INTO Cliente (ClienteID, NombreCliente, DistritoCliente, TelefonoCliente)  
VALUES (@ClienteID, @NombreCliente, @DistritoCliente, @TelefonoCliente)  
  
--CONSULTA LA TABLA (--> NO USAR * <-- / indicar las columnas con su nombre)  
SELECT ClienteID, NombreCliente, DistritoCliente, TelefonoCliente FROM Cliente
GO

--ELIMINACIÓN DE UN PROCEDIMIENTO ALMACENADO
--usar DROP
DROP PROCEDURE BuscaCliente
GO

















