USE GourmetStore_Stg;

SELECT * FROM Categoria_Stg;

INSERT INTO Categoria_Stg VALUES(1, 'GOLOSINAS');

-- Diseñar la consulta que lee los datos de Products de Northwind
-- para luego guardarlos en Producto_Stg de GourmetStore_Stg
--
-- idProducto, nomProducto, presentacion, precioUnitario, skCategoria
USE Northwind;

SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM GourmetStore_Stg.dbo.Categoria_Stg;

SELECT Products.ProductID, Products.ProductName,
	Products.QuantityPerUnit, Products.UnitPrice,
	Categories.CategoryID, Categories.CategoryName,
	GourmetStore_Stg.dbo.Categoria_Stg.skCategoria
FROM Products INNER JOIN Categories
	ON Products.CategoryID = Categories.CategoryID
INNER JOIN GourmetStore_Stg.dbo.Categoria_Stg
	ON Categories.CategoryID = GourmetStore_Stg.dbo.Categoria_Stg.idCategoria
		AND Categories.CategoryName = 
		GourmetStore_Stg.dbo.Categoria_Stg.nomCategoria;
