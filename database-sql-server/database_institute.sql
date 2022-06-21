--Establecer un espacio libre de un 20% para las paginas de datos de 2 tablas en Instituto (Crear índice cluster con fillfactor de 80)

USE Instituto

--------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Tarifa
ADD CONSTRAINT PK_TARIFA
PRIMARY KEY(IdTarifa)

CREATE UNIQUE CLUSTERED INDEX PK_TARIFA ON Tarifa(IdTarifa)
	WITH DROP_EXISTING, FILLFACTOR=80

SELECT NAME,ORIGFILLFACTOR 
FROM SYSINDEXES WHERE NAME = 'PK_TARIFA'
GO
---------------------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Curso
ADD CONSTRAINT PK_CURSO
PRIMARY KEY(IdCurso)

CREATE UNIQUE CLUSTERED INDEX PK_CURSO ON Curso(IdCurso)
	WITH DROP_EXISTING, FILLFACTOR=80

SELECT NAME,ORIGFILLFACTOR 
FROM SYSINDEXES WHERE NAME = 'PK_CURSO'
GO

----------------------------------------------------------------------------------------------------------------------------------------
--Crear 3 consultas cubiertas en Instituto (Índices noncluster usando las columnas en la consulta WHERE)

SELECT *FROM Empleado;

CREATE NONCLUSTERED INDEX ix_ApeNom
ON Empleado(ApeEmpleado,NomEmpleado)

SELECT *FROM Empleado ORDER BY ApeEmpleado;
SELECT *FROM Empleado WHERE ApeEmpleado like 'C%' ORDER BY ApeEmpleado
SELECT  NomEmpleado,ApeEmpleado FROM Empleado WHERE NomEmpleado like '%OS%' ORDER BY NomEmpleado

--------------------------------------------------------------------------------------------------------------------------------------------
/**Establecer 3 índices lógicos en Instituto, luego compare la perfomance verificando el plan de ejecución 
(indices noncluster) - Usar SET STATISTICS TIME ON para medir los milisegundos de respuesta.**/

SET STATISTICS TIME ON 

--SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 84 ms.
SELECT *FROM Empleado ORDER BY ApeEmpleado;

--SQL Server Execution Times: CPU time = 16 ms,  elapsed time = 80 ms.
SELECT *FROM Empleado WHERE ApeEmpleado like 'C%' ORDER BY ApeEmpleado

--  SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 0 ms.
SELECT  NomEmpleado,ApeEmpleado FROM Empleado WHERE NomEmpleado like '%OS%' ORDER BY NomEmpleado