USE Northwind;

SELECT DISTINCT OrderDate, DAY(OrderDate) AS dia, MONTH(OrderDate) AS mes,
	DATEPART(quarter, OrderDate) AS trimestre, YEAR(OrderDate) AS año,
	DATENAME(month, OrderDate) AS nomMes,
	DATENAME(quarter, OrderDate) + '° trimestre' AS nomTrimestre
FROM Orders;

/*
DATEPART(parteFecha, fecha) ===> número entero
DATENAME(parteFecha, fecha) ===> cadena

DATEPART(quarter, OrderDate) ===> número del trimestre 
DATENAME(quarter, OrderDate) ===> número del trimestre, pero como cadena
*/

