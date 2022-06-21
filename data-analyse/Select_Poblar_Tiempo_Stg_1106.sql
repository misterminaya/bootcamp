USE Northwind;

SELECT DISTINCT OrderDate, DAY(OrderDate) AS dia, MONTH(OrderDate) AS mes,
	DATEPART(quarter, OrderDate) AS trimestre, YEAR(OrderDate) AS a�o,
	DATENAME(month, OrderDate) AS nomMes,
	DATENAME(quarter, OrderDate) + '� trimestre' AS nomTrimestre
FROM Orders;

/*
DATEPART(parteFecha, fecha) ===> n�mero entero
DATENAME(parteFecha, fecha) ===> cadena

DATEPART(quarter, OrderDate) ===> n�mero del trimestre 
DATENAME(quarter, OrderDate) ===> n�mero del trimestre, pero como cadena
*/

