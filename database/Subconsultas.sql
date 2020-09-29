USE Northwind
GO

SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

--Consulta obtenemos el precio más alto
SELECT MAX(UnitPrice) FROM Products

--usamos la consulta de precio más alto
--como subcosulta para obtener el producto
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice=(SELECT MAX(UnitPrice) FROM Products)

--identificar productos de un proveedor
SELECT ProductID,ProductName,UnitPrice,SupplierID
FROM Products

--indetificamos al proveedor
SELECT SupplierID FROM Suppliers
WHERE CompanyName = 'Tokyo Traders'

--usamos la consulta de supplier (proveedor)
--como subcosulta para obtener el producto
SELECT ProductID,ProductName,UnitPrice,SupplierID
FROM Products
WHERE SupplierID = (SELECT SupplierID FROM Suppliers
                    WHERE CompanyName = 'Tokyo Traders')

--identificar productos de varios proveedores
SELECT SupplierID FROM Suppliers
WHERE Country = 'Germany'

--usamos la consulta de supplier (proveedor)
--como subcosulta para obtener el producto
SELECT ProductID,ProductName,UnitPrice,SupplierID
FROM Products
WHERE SupplierID IN (SELECT SupplierID FROM Suppliers
                     WHERE Country = 'Germany')

--Subconsulta correlacionada
SELECT Customers.CustomerID, Customers.CompanyName
FROM Customers
WHERE NOT EXISTS
(SELECT * FROM Orders
 WHERE Customers.CustomerID=Orders.CustomerID)

 --Subconsultas como parte de la lista de columas
 SELECT AVG(UnitPrice) FROM Products

 --incluimos el promedio como una columan en la consulta
 SELECT ProductName, UnitPrice,
 (SELECT AVG(UnitPrice) FROM Products) AS Promedio
 FROM Products
 ORDER BY UnitPrice

 --incluimos el promedio como una columan en la consulta
 --y como una condición
 SELECT ProductName, UnitPrice,
 (SELECT AVG(UnitPrice) FROM Products) AS Promedio
 FROM Products
 WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products)
 ORDER BY UnitPrice