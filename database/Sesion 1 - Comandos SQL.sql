USE master
go

CREATE DATABASE RecursosHumanos;

SELECT * FROM sys.databases

--CAMBIAR LA CONEXION A LA BD RecursosHumanos
USE RecursosHumanos;
GO

--CREAR TABLA
--nombre-campo | tipo de datos | null/no null
CREATE TABLE Departamento 
(codDepartamento int NOT NULL PRIMARY KEY,
 nomDepartamento varchar(50) NOT NULL);
GO

--CREAR TABLA
CREATE TABLE Empleado 
(codEmpleado int NOT NULL PRIMARY KEY,
 nomEmpleado varchar(50) NOT NULL,
 apeEmpleado varchar(100) NOT NULL,
 fecNacimiento date NOT NULL,
 fecIngreso date NOT NULL,
 codDepartamento int NOT NULL);
GO

--CONSULTAR TABLAS
SELECT * FROM dbo.Departamento;
SELECT * FROM dbo.Empleado;

--insertar un registro
INSERT INTO Departamento (codDepartamento, nomDepartamento)
VALUES (1, 'Gerencia General');
GO

--insertar varios registros
INSERT INTO Departamento (codDepartamento, nomDepartamento)
VALUES (2, 'Finanzas'),
       (3, 'Logística'),
	   (4, 'Recursos Humanos');
GO

--actualizar registros (campo por campo)
UPDATE Departamento
SET nomDepartamento = 'RR HH'
WHERE codDepartamento = 4;
GO

--eliminar registros
DELETE Departamento
WHERE codDepartamento = 4;
GO

--MODIFICAR TABLA
ALTER TABLE Departamento
ADD codResponsable int NULL;

--ELIMINAR TABLA
DROP TABLE Empleado;
GO