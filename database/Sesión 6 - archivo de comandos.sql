--INTERRELACION DE ORDENES CON CLIENTES
SELECT * FROM Orders ORDER BY CustomerID
SELECT * FROM Customers

--CONSULTA CORRELACIONADA (INNER JOIN)
SELECT Orders.OrderID, Orders.OrderDate, Orders.CustomerID,
       Customers.ContactName, Customers.Phone, Orders.ShipCity
FROM Orders INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.ShipCity = 'México D.F.'

--CONSULTA CORRELACIONADA (INNER JOIN) USANDO ALIAS DE TABLA
SELECT O.OrderID, O.OrderDate, O.CustomerID,
       C.ContactName, C.Phone, O.ShipCity
FROM Orders O INNER JOIN Customers C
ON O.CustomerID = C.CustomerID
WHERE O.ShipCity = 'México D.F.'

--INTERRELACION DE ORDENES CON EMPLEADOS (INNER JOIN)
SELECT * FROM Orders ORDER BY EmployeeID
SELECT * FROM Employees

SELECT o.OrderID, o.OrderDate,
       CONCAT(e.LastName,', ',e.FirstName) AS EmployeeName, e.Title
FROM Orders o INNER JOIN Employees e
ON o.EmployeeID=e.EmployeeID
WHERE e.Title = 'Sales Manager'

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

--INTERRELACION DE ORDENES CON CLIENTES
SELECT * FROM Orders ORDER BY CustomerID
SELECT * FROM Customers

--CONSULTA CORRELACIONADA (LEFT JOIN)
--TODAS las ordenes y sus clientes correlacionados
SELECT Orders.OrderID, Orders.OrderDate, Orders.CustomerID,
       Customers.ContactName, Customers.Phone, Orders.ShipCity
FROM Orders LEFT OUTER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID

--CONSULTA CORRELACIONADA (RIGHT JOIN)
--TODOS los clientes y sus ordenes correlacionadas
SELECT Orders.OrderID, Orders.OrderDate, Orders.CustomerID,
       Customers.ContactName, Customers.Phone, Orders.ShipCity
FROM Orders RIGHT OUTER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID

--CONSULTA CORRELACIONADA (RIGHT JOIN)
SELECT o.OrderID, o.OrderDate,
       CONCAT(e.LastName,', ',e.FirstName) AS EmployeeName, e.Title
FROM Orders o RIGHT OUTER JOIN Employees e
ON o.EmployeeID=e.EmployeeID

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

--INTERRELACION DE VARIAS TABLAS
SELECT * FROM Orders ORDER BY ShipVia
SELECT * FROM Shippers
SELECT * FROM Customers
SELECT * FROM Employees

--CONSULTA CORRELACIONADA DE ORDENES, CLIENTES Y EMPLEADOS
SELECT O.OrderID, O.OrderDate, O.CustomerID, O.ShipCity,
       C.ContactName, C.Phone,
       CONCAT(E.LastName,', ',E.FirstName) AS EmployeeName, E.Title
FROM Orders O 
INNER JOIN Customers C
ON O.CustomerID = C.CustomerID
INNER JOIN Employees E
ON O.EmployeeID=E.EmployeeID

--CONSULTA CORRELACIONADA DE ORDENES, CLIENTES Y EMPLEADOS, TRANSPORTISTA
SELECT O.OrderID, O.OrderDate, O.CustomerID, O.ShipCity,
       C.ContactName, C.Phone,
       CONCAT(E.LastName,', ',E.FirstName) AS EmployeeName, E.Title,
	   S.CompanyName, S.Phone
FROM Orders O 
INNER JOIN Customers C
ON O.CustomerID = C.CustomerID
INNER JOIN Employees E
ON O.EmployeeID=E.EmployeeID
INNER JOIN Shippers S
ON O.ShipVia = S.ShipperID

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--CROSS JOIN ENTRE CLIENTES Y VENDEDORES (COMBINACION O PRODUCTO)
SELECT * FROM Customers --91 filas
SELECT * FROM Employees --9 filas

SELECT 91*9 --819 filas

SELECT C.CustomerID, C.CompanyName,E.EmployeeID, E.LastName
FROM Customers C CROSS JOIN Employees E

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

--UNION DE TABLAS
SELECT City FROM Customers --91 filas
SELECT City FROM Suppliers --29 filas

--UNION DE TABLAS, SIN REPETIDOS
SELECT City FROM Customers --91 filas
UNION
SELECT City FROM Suppliers --29 filas

--UNION DE TABLAS, CON REPETIDOS
SELECT City, ContactName FROM Customers --91 filas
UNION ALL
SELECT City, ContactName FROM Suppliers --29 filas

--UNION DE TABLAS, SIN REPETIDOS, VARIAS COLUMNAS
SELECT City, ContactName FROM Customers --91 filas
UNION
SELECT City, ContactName FROM Suppliers --29 filas

--UNION DE TABLAS, CON REPETIDOS, VARIAS COLUMNAS
SELECT City, ContactName FROM Customers --91 filas
UNION ALL
SELECT City, ContactName FROM Suppliers --29 filas

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*

--SELECT INTO - GRABAR EN UNA TABLA TEMPORAL EL RESULTADO DE UNA CONSULTA
SELECT S.SupplierID, S.CompanyName AS Proveedor,
       O.OrderDate AS FechaSalida,
	   P.ProductName AS Producto, O.OrderID
INTO #ProductosEnviados
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID=P.SupplierID
INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
INNER JOIN Orders O ON O.OrderID = OD.OrderID

--CONSULTAR LA TABLA TEMPORAL RESULTANTE
SELECT * FROM #ProductosEnviados

--SELECT INTO - GRABAR EN UNA TABLA PERMANENTE EL RESULTADO DE UNA CONSULTA
SELECT S.SupplierID, S.CompanyName AS Proveedor,
       O.OrderDate AS FechaSalida,
	   P.ProductName AS Producto, O.OrderID
INTO ProductoEnviados1996
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID=P.SupplierID
INNER JOIN [Order Details] OD ON OD.ProductID = P.ProductID
INNER JOIN Orders O ON O.OrderID = OD.OrderID
WHERE YEAR(O.OrderDate)=1996

--CONSULTAR LA TABLA PERMANENTE RESULTANTE
SELECT * FROM ProductoEnviados1996

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
--CONSULTAS DE AUTOJOIN - FK Y PK EN LA MISMA TABLA
SELECT EmployeeID, CONCAT(LastName, ', ', FirstName), Title, City, Region, ReportsTo
FROM Employees

SELECT E.EmployeeID, CONCAT(E.LastName, ', ', E.FirstName), E.Title, 
       E.ReportsTo, CONCAT(J.LastName, ', ', J.FirstName)
FROM Employees E LEFT OUTER JOIN Employees J 
ON E.ReportsTo = J.EmployeeID