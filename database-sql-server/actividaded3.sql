/*1.FUNCIONES
Crear una función de tipo escalar que tenga dos parámetros de tipo numéricos 
y que sume ambos parámetros. Utilice la función en una consulta SELECT a la tabla Products, 
de modo que sume los campos UnitsInStock y UnitsOnOrder*/

CREATE FUNCTION fn_Sumar(@VALOR1 INT, @VALOR2 INT)
RETURNS INT
AS
BEGIN
	DECLARE @RESULTADO INT;
    SET @RESULTADO = @VALOR1 + @VALOR2;
 
    RETURN @RESULTADO;
END
GO

SELECT dbo.fn_Sumar(100,20);


SELECT ProductID,ProductName,UnitPrice, UnitPrice,UnitsInStock,UnitsOnOrder, 
dbo.fn_Sumar(UnitsInStock,UnitsOnOrder) AS TotalUnits
FROM dbo.Products;
GO

/*2. FUNCIONES
Crear una función de tipo tabla con parámetro en la tabla Productos, 
que permita obtener los productos para una categoría determinada */

CREATE FUNCTION dbo.fn_consultaproducts(@idcategoria  INT)
RETURNS TABLE
AS
RETURN(SELECT *FROM Products WHERE CategoryID = @idcategoria)
GO

SELECT *FROM dbo.fn_consultaproducts(2);
SELECT *FROM Products WHERE CategoryID = 1;


/*3. PROCEDIMIENTOS ALMACENADOS
Crear un procedimiento almacenado con parámetros que permita ingresar nuevos datos en la tabla Region*/
--creación del procedimiento


SELECT *FROM Region;

EXEC sp_help Region;
GO

-- PROCEDIMIENTO ALMACENADO
CREATE PROCEDURE AgregarRegion
(@RegionID	INT,
 @RegionDescription	CHAR(100))
 AS

 INSERT INTO Region(RegionID,RegionDescription)
 VALUES (@RegionID,@RegionDescription)
 GO

 SELECT RegionID,RegionDescription FROM Region
 GO

 EXEC AgregarRegion
 @RegionID	= 11,
 @RegionDescription = 'Amazonas'
 GO



/*4. TRIGGER
Crear un trigger en la tabla Categories que se dispare cuando se haga un cambio (UPDATE) en la categoría
y que luego muestre la categoría anterior y la categoría nueva*/


CREATE TABLE HistorialCategories(
fecha DATETIME NOT NULL,
CategoryID INT NOT NULL,
CategoryName VARCHAR(40) NOT NULL,
OldCategory VARCHAR(40) NOT NULL,
Descripcion VARCHAR(100) NOT NULL,
)
GO

CREATE TRIGGER TR_UpdateCategories
ON Categories AFTER UPDATE
AS
BEGIN
DECLARE @CategoryID INT
SET @CategoryID = (SELECT CategoryID FROM inserted)
DECLARE @CategoryName VARCHAR(40)
SET @CategoryName = (SELECT CategoryName FROM inserted)
DECLARE @OldCategory VARCHAR(40)
SET @OldCategory = (SELECT CategoryName FROM deleted)
INSERT INTO HistorialCategories VALUES(GETDATE(),@CategoryID,@CategoryName,@OldCategory,'Categoria actualizada')
END



SELECT *FROM Categories;
SELECT *FROM HistorialCategories;

update Categories
set CategoryName = 'Demo'
where CategoryID = 1
go