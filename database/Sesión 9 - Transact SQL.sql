-------------------------------------------
---1 VARIABLES 
-------------------------------------------

--DECLARAR Y ASIGNAR VALOR EN COMANDOS SEPARADOS
DECLARE @Porcentaje DECIMAL(10,2)
SET @Porcentaje = 0.5
SELECT @Porcentaje AS Pct
GO

--DECLARAR Y ASIGNAR VALOR EN UN SOLO PASO
DECLARE @Porcentaje DECIMAL(10,2) = 0.5
SELECT @Porcentaje AS Pct
GO

--CAMBIAR EL VALOR DESPUES DE HABER SIDO DECLARADO
DECLARE @Porcentaje DECIMAL(10,2) = 0.5
SELECT @Porcentaje AS Pct
SET @Porcentaje = 0.7
SELECT @Porcentaje AS Pct

--DECLARAR VARIABLE Y USAR EN UNA CONSULTA
USE Northwind
GO

SELECT * FROM Customers

DECLARE @Cliente varchar(20) = '%com%'

SELECT * FROM Customers
WHERE CompanyName LIKE @Cliente
GO


--DECLARAR Y ASIGNAR VALOR A MAS DE UNA VARIABLE
DECLARE @Porcentaje DECIMAL(10,2) = 0.5
DECLARE @Articulo VARCHAR(40) = 'Jabón Líquido'
SELECT @Porcentaje AS Pct
SELECT @Articulo AS Art
GO

--DECLARAR Y ASIGNAR VALOR A MAS DE UNA VARIABLE (simple)
DECLARE @Porcentaje DECIMAL(10,2) = 0.5,
        @Articulo VARCHAR(40) = 'Jabón Líquido',
		@Cliente VARCHAR(20) = '%bon%'

SELECT @Porcentaje AS Pct, @Articulo AS Art, @Cliente AS Cli
GO

--ASIGNAR VALORES A LA VARIABLE USANDO UNA CONSULTA SELECT
SELECT * FROM Products

DECLARE @Articulo VARCHAR(40), @Stock SMALLINT

--CONSULTA DEBE RETORNAR SOLO UNA LINEA
SELECT ProductName, UnitsInStock
FROM Products
WHERE ProductID = 50

--USO LA CONSULTA PARA ASIGNAR VALOR A LA VARIABLE
SELECT @Articulo=ProductName, @Stock=UnitsInStock
FROM Products
WHERE ProductID = 50

--USAR LAS VARIABLES
SELECT @Articulo AS VarArticulo, @Stock AS VarStock

SELECT @@ROWCOUNT AS NumeroDeFilas
GO


-------------------------------------------
---2 IF ELSE
-------------------------------------------
SELECT * FROM Products WHERE UnitsInStock = 0
UPDATE Products SET UnitsInStock = 1 WHERE UnitsInStock = 0

IF EXISTS (SELECT * FROM Products WHERE UnitsInStock = 0)
   PRINT 'ATENCIÓN - Existen productos sin stock'
ELSE
   PRINT 'Todos los productos tienen stock'

--IF ANIDADO
IF EXISTS (SELECT * FROM Products WHERE UnitsInStock = 0)
   IF EXISTS (SELECT * FROM Products WHERE UnitsInStock = 0 AND ProductID = 50)
      PRINT 'ATENCIÓN - Producto 50 Sin Stock'
ELSE
   PRINT 'Todos los productos tienen stock'

-------------------------------------------
---3 BEGIN .. END
-------------------------------------------

--IF Y ELSE SOLO CONSIDERAN LA PRIMERA LÍNEA
IF EXISTS (SELECT * FROM Products WHERE UnitsInStock = 1)
   PRINT 'ATENCIÓN - Existen productos con poco stock'
ELSE
   PRINT 'Todos los productos tienen stock'
   PRINT 'Prueba ELSE'

--PARA CONSIDERAR MÁS DE UNA LÍNEA USAR BLOQUE BEGIN..END
IF EXISTS (SELECT * FROM Products WHERE UnitsInStock = 0)
   PRINT 'ATENCIÓN - Existen productos con poco stock'
ELSE
 BEGIN
   PRINT 'Todos los productos tienen stock'
   PRINT 'Prueba ELSE'
 END

 -------------------------------------------
---3 WHILE
-------------------------------------------
WHILE 1=1
BEGIN
  PRINT 'Hola'
END
GO
------------
DECLARE @Contador smallint = 1

WHILE @Contador <= 5
BEGIN
  PRINT @Contador
  SET @Contador += 1
END

SELECT @Contador As NumeroFinal
GO

---WHILE CON BREAK
DECLARE @Contador smallint = 1

WHILE @Contador <= 5
BEGIN
  PRINT @Contador
  SET @Contador += 1
  
  IF @Contador = 4
     BREAK

END

SELECT @Contador AS NumeroFinal