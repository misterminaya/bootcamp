SELECT * FROM Employees

--defino la consulta
SELECT EmployeeID, FirstName+' '+LastName AS EmployeeName,
       Title, HireDate, HomePhone, Extension, Notes
FROM Employees
WHERE ReportsTo IS NOT NULL
GO

--crear la vista
CREATE VIEW vEmpleado
AS
SELECT EmployeeID, FirstName+' '+LastName AS EmployeeName,
       Title, HireDate, HomePhone, Extension, Notes
FROM Employees
WHERE ReportsTo IS NOT NULL
GO

SELECT *  FROM vEmpleado
GO

--Vista de ventas por categoría
CREATE VIEW vVentasCategoriaProducto
AS
SELECT C.CategoryName, P.ProductName,
SUM(OD.Quantity*OD.UnitPrice*(1-OD.Discount)) AS Monto
FROM [Order Details] OD
  INNER JOIN Products P
    ON OD.ProductID=P.ProductID
  INNER JOIN Categories C
    ON C.CategoryID=P.CategoryID
GROUP BY C.CategoryName, P.ProductName
GO

--Consultar la vista
SELECT * FROM vVentasCategoriaProducto

--eliminar vistas:
DROP VIEW vEmpleado
GO

--Modificar la vista
ALTER VIEW vEmpleado
AS
SELECT EmployeeID, FirstName+' '+LastName AS EmployeeName,
       Title, HireDate, HomePhone, Extension
FROM Employees
WHERE ReportsTo IS NOT NULL
GO

SELECT * FROM vEmpleado
ORDER BY EmployeeName

--Consultar el código de la vista
EXEC sys.sp_helptext vEmpleado

EXEC sys.sp_helptext [Products Above Average Price]